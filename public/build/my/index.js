window.app = angular.module('SisApp', ['ui.bootstrap', 'ngResource', 'chart.js']);

	app.controller('MainCtrl', ['$scope', function($scope) {
		var self = this;
		$scope.servidoresDefault = [
			{nome:'r50', ip: '192.168.5.1'},
			{nome:'h10', ip: '192.2.5.1'},
			{nome:'r50', ip: '192.168.5.1'},
			{nome:'h10', ip: '192.2.5.1'},
			{nome:'r50', ip: '192.168.5.1'},
			{nome:'h10', ip: '192.2.5.1'},
			{nome:'r50', ip: '192.168.5.1'},
			{nome:'h10', ip: '192.2.5.1'},
			{nome:'r50', ip: '192.168.5.1'},
			{nome:'h10', ip: '192.2.5.1'},
			{nome:'r50', ip: '192.168.5.1'},
			{nome:'h10', ip: '192.2.5.1'},
			{nome:'r50', ip: '192.168.5.1'},
			{nome:'h10', ip: '192.2.5.1'},
			{nome:'r50', ip: '192.168.5.1'},
			{nome:'h10', ip: '192.2.5.1'},
			{nome:'r50', ip: '192.168.5.1'},
			{nome:'h10', ip: '192.2.5.1'},
			{nome:'r50', ip: '192.168.5.1'},
			{nome:'h10', ip: '192.2.5.1'},
			{nome:'r50', ip: '192.168.5.1'},
			{nome:'h10', ip: '192.2.5.1'},
			{nome:'r50', ip: '192.168.5.1'},
			{nome:'r80', ip: '192.168.5.1'},
			{nome:'h10', ip: '192.2.5.1'}
		];
		$scope.servidores = $scope.servidoresDefault;

		self.totalServidores = 19;
		self.totalRevendedores = 250;
		self.totalHospedagem = 500;
		self.totalEmails = 2000;

		$scope.totalItems = $scope.servidores.length;
  		$scope.currentPage = 1;
  		$scope.numPerPage = 5;
  
  		$scope.paginate = function(value) {
    		var begin, end, index;
    		begin = ($scope.currentPage - 1) * $scope.numPerPage;
    		end = begin + $scope.numPerPage;
    		index = $scope.servidores.indexOf(value);
    		return (begin <= index && index < end);
  		};

  		$scope.alterar = function() {
  			var self = this;
  			self.temp = [];
  			for(i = 0; i < $scope.servidoresDefault.length; i++){
  				var re = new RegExp($scope.searchKeyword);
  				if($scope.servidoresDefault[i].nome.match(re) || $scope.servidoresDefault[i].ip.match(re))
  					self.temp.push($scope.servidoresDefault[i]);
  			}

			$scope.servidores = self.temp;
			$scope.totalItems = $scope.servidores.length;
			$scope.numPerPage = $scope.limite;
  		};
/*
  self.totalItems = self.servidores.length;
  self.currentPage = 1;
  self.numPerPage = 5;
  
  self.paginate = function(value) {
    var begin, end, index;
    begin = (self.currentPage - 1) * self.numPerPage;
    end = begin + self.numPerPage;
    index = self.servidores.indexOf(value);
    return (begin <= index && index < end);
  };
*/
}]);

  app.controller('HospCtrl', ['$scope', function ($scope) {
    $scope.options = { legend: { display: true } };
    $scope.labels = ['h01', 'r20', 'r58', 'h10', 'h68', 'r79', 'r58', 'r68', 'r56', 'r24', 'r90', 'r98'];
    $scope.data = [[65, 59, 80, 81, 56, 55, 40, 62, 78, 89, 68, 35 ]];
  }]);

    app.controller('EmailCtrl', ['$scope', function ($scope) {
    $scope.options = { legend: { display: true } };
    $scope.labels = ['h01', 'r20', 'r58', 'h10', 'h68', 'r79', 'r58', 'r68', 'r56', 'r24', 'r90', 'r98', 'r100'];
    $scope.data = [[650, 597, 803, 841, 516, 554, 410, 662, 738, 869, 638, 315, 346 ]];
  }]);