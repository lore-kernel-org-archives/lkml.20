Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE3C30D40E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371266; cv=fail; b=HZwzUGYwyyGgm/DuELR347P3/dpFNf3JNIdQ6WCO7VB6MBZKCaP2p2qfeDBXtTNrTN2/l4qg+llbIfSyAI5SpCa+6D6PAB/KC8psjYzUB9+fDSpUyqU7LF/fpQU68HE/N03/jKdV80v9Q6CGkOzO7i/gKhDlGZsMFZHdl7ynAhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371266; c=relaxed/simple;
	bh=xt2aDL80RrWsYxPcmnT459zYc8i8ui6IXcqhqHmwRwc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rtFQMotxcAxN3vpa0QhtH4JakXALvds1xGsgpx9pQdOBXza8QGrM7ECA2HjBRYiMSbQcTIIKJ+3CBUMPjG91QaeKIVre4d/R6pxkmK/NHMipLvJ/nai+7EV4IU3dp1i97sbM1GwoEr0/gCPvXMONSKQOKLrJetf5LfNvOEnskcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MD9hVACw; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MD9hVACw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790371264; x=1821907264;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=xt2aDL80RrWsYxPcmnT459zYc8i8ui6IXcqhqHmwRwc=;
  b=MD9hVACw6cBS4AuzJNomRStxhY89zCAL5PbAa5d0/eT9xBSMypzytu3h
   KP9g37Xt/pU8rERJmITmpKcapHJqMdE9BnJaOjk5Uynrbg/hiReWPOmuA
   Vi+z3q4SdW91d2fk9xgN+7vV6N1kJrnZtrkOYXLhCcVVcExsloMiHdHHD
   j3m3/adQU6aV3FfvLUbX+yqDAIcp9X8ZJNjBYCnxPKIoGZCQDMjHa0zbA
   5QFRXBYg59I67xHhwle3MUGQxTe94nWjP3JVI4X6CB8Ip/QE0lld3unq0
   I4cf6KOxEzVSBzR2wzkYfmf0DchIy3Bzuq4IiP9fNGstBcwsYdHKKXPO4
   g==;
X-CSE-ConnectionGUID: rSMvBTYrSAWXrZfHlaYl4w==
X-CSE-MsgGUID: 9WgBkAQFR7+yDmSc4pfvng==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90223908"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90223908"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 14:21:03 -0700
X-CSE-ConnectionGUID: g4mPo6X7SWue4Vf+9Emz+Q==
X-CSE-MsgGUID: qJ5im9BAQxy7qluH1+95+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="277626752"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 14:21:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 14:21:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 14:21:02 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 14:21:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btPglf7XhEPg6cXYxXdj8eEd8J5T7t1T96Y0DmMMpO1XvxbITd7YRQmMksgyak7ftikofEBrQSACTlZ0D0+UklFwaBuufUt6dnA1q2uydUqUSuYT/LlFqIojYICFqVfR1hPsYVQ9Mtoei/6my02s0hA9dlxMkfbjR+097f+s7QxGbgD/slFGlCgUWTkQfyx9Pm4EvVRkxkcfjcf1paB7FB7e8EkmYLyvhx2mVsQ6gjnfxTg6+s4qAm2Xka041aDdFjx1mWNzqwCgA4T9PO6ctFfGSUGsLRLMTFdQmB81GHf9zS9jjcRITiYfXeIP4ajaO9m4/mkNOL2o27d8JYlsIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xt2aDL80RrWsYxPcmnT459zYc8i8ui6IXcqhqHmwRwc=;
 b=jCkJvXd16CnesW9bGBQGQD8SBj3Fn9pnqFQI+9NX/5LGvEsQwbLvCIWEPBjnPVK4O3mE7Rty48ACzHCIq+Zqkzfd6XwZWw46uWOc33BaW2sd1YUNUySmM9fxcaxW0sgAMC7WBFQAhzzyYAGa2KbPHEKgGeVBL5wFlJHzxtyUHqLEra6D6oZ/bwIikBR2SUPZErdYESmmUHcE3JBRkC0K5PlEzvxGF0/qYKplUJvAFOce3ULG9+5THQqE+vQSN3LJOWr5mw5knoLqWmrAyW5BiHDdPTYHVjLIECSgISfy3FXuEqcj0oToaqbyLJltXbMWkwCT7C8qwEHtZHHGE1TyxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by LV2PR11MB597013.namprd11.prod.outlook.com (2603:10b6:408:410::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 25 Sep
 2026 21:21:00 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2%3]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 21:20:59 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] PECI changes for v7.4-rc1
Thread-Topic: [GIT PULL] PECI changes for v7.4-rc1
Thread-Index: AQHdTTPCHxN2J88Se0OxMLCAfH7Nsw==
Date: Fri, 25 Sep 2026 21:20:59 +0000
Message-ID: <14b83bcafac21987132c08a23043254c6c43e3ec.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-1.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|LV2PR11MB597013:EE_
x-ms-office365-filtering-correlation-id: 0643afed-bb56-4cf8-b331-08df1b4ae53c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|6133799003|10067099003|11063799006|56012099006|18002099003;
x-microsoft-antispam-message-info: +4amXC/qkPcMdxcfHpC2X0yq1KulhuhXypUoAAe5WraTnaBZRlC6wmXMorIqQl9c0yKeJ+OZboL4aDslKmpmd6l5JSmboisHxacG6OcQiOjTGSa/eBfKFOpnY7LLrDt8goIZGV4UzTCdv+Y9RRz/PFwLX5KvR1JNpUYalPeIRjOp5DJ23SCQxYnZrj6chTb7eYDjZSYogSFPLl7INgBVWLvgQ+BckGPZEWZDrnMo9PI+5CNKzAHaHYivjnL+Zv0qshWZPbjpk1T09MBDstmtL7n0ro17sx8yORGl9ncFlgUsKbJhtJIbMTGU2wbHG8ha4ow8inye22yPwMsYvEYmebrzOwU+/XgU9N+mhyFn5+lSqNf8HWTSMgXL7EXzGeg9oDrAKjJgYl0Lxud8kdmj6D1bOls+ZcAJUmEg0JBxSwrzqllyIhoL2sqIG8xYkolEpnyN7gWzmO8jt83fS6c2Hdggvx+qRcWAhPmVnpglaNYyY1STHow030+kCpwA0xoPDKeoc/nx6otuMG2m9tuc5PvcaX2tfmGejeBuvxhSH1+vBDOvEv4xuiQFQapM3SJi29qDXcTuNCkCRGKWIWgejSrrnrpcco3/0C74fMVi+3ABr65PFEJnu98VEowg8zwGN3h23qNMq/uVvNgaqeUqzytR8qyUWvzBnBILjEQZSdLf72HnnCR21gt+CDTKnPwlkhgqwCjLBeREhJr7GuQJpYKFfIGmIv++S2mSgcmYawE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a20zWDBlN2lTQ21mS1JIczdzRnBFYitIbnpLazRRcDM3eHRzSm55Ujk5S3cv?=
 =?utf-8?B?Y085YVNUZUVxaFhyQnl6Y05UTzVpZWlLamxHZnczNm1QSGtHNkpBTXNlU0hr?=
 =?utf-8?B?MkhzZFdCL2lSOTM0YWVzRjkxaTlIcWhNTWJPZzJFdGcwVDMwZWs2MUtGTU1m?=
 =?utf-8?B?dTVEaUxFbUV1bStac2dRdHhqYjhneU5uU2NIL3g1ZW1KTFVCTHhYRDk3bGVm?=
 =?utf-8?B?WFAvVStxSHFOL2hJWHNvOGRYa2RZNXd3bE92clRsRUJDZzhtNFZFaTd3ZG16?=
 =?utf-8?B?SW1DTGdmTWJhZkNnUzFxK21kNWpXMTh1UmVBNmtCMWNLNGVNbWVyMkNyNDdk?=
 =?utf-8?B?c2d4cVNQYU9BVEF6R0ZzNmc0Smc4cGFSMm1SbldhTEhpeng0WnBRWm8xODlP?=
 =?utf-8?B?Q3UwNHdLMUw2VHloVWx1L3laU2VLUi8rS2d3ZjVSSUlXTzJsQ0dqeVdvNlBi?=
 =?utf-8?B?eDVPTTZqNS9UTmkxUUxUdytBVEhMQjYwajN4SnhjZ0JSKzIxR1ZPQzg2NStF?=
 =?utf-8?B?VWlhd1hWQ2FrU0VvK0RkOUtiWDZxaHFJYmFmU3p6d2xyZnkwc0tNdDJWTzVl?=
 =?utf-8?B?MytIOWxrTnV3SnFTUFVUMVp4dVN4Y0FNU1lwOWNvYzM4eW53QlQ1R1VDUUh3?=
 =?utf-8?B?RXhLMTdpSE04d0o2RXpkVlliVTJHM0cxaHQzTG1FMER6N2dmZTFDVTdSWU5r?=
 =?utf-8?B?Y1VkbkpaSHJSaHVBMDZVWVZMd2VLYzlDUzg3MXBwWkxidVJzSkhXNkxOSG5N?=
 =?utf-8?B?K3Y4RUZOU3ovelkyRThjbjlJWEVva0xIcnFYYmhFVitiYklldVVBMnF6M0l4?=
 =?utf-8?B?S0dSb0l2WEhvbXdFVlUwUjNyT0FLUVlReUNMTkptL1NJc3hMYjBDcGpJWFdq?=
 =?utf-8?B?VnRYVHR1QmFkaEhuZWpuWUVINWt4eHdZaDg5SFlTdlhxRjZyWGM2ZzNldzA0?=
 =?utf-8?B?bDRaWXVrWTVKcGNLMmh3b1BMajV5WGNSMktkVFd1QXdpNEtFTmJGOGhMMnow?=
 =?utf-8?B?bEpXUGU1Y0c0b3ZseHRPdExQZC9VLzFRdmwzTHF4aTN5STY0ZUdYbXRZTk1h?=
 =?utf-8?B?a3hQdTg1alRuWUNWVVlXajZQM0NCeFBUQkVhclhIbFd2ZlJtYVVUMk5KaWxK?=
 =?utf-8?B?aStTcSsrNDVYbDJQeGVDS09ybi9qeit0KzVwVTFpR1RndEZhcnlUOE42N1F5?=
 =?utf-8?B?Mk56YTBXYlE0aENUcXNrdEc4TUo0b1RTbmZUUVBaM3VNZUorUlE3YU9KL3hL?=
 =?utf-8?B?cmpxT3o4dkhGckVhMkw5UlU0YnAvYlJQNlJVMVp2aGZwaTI0Z1NiWVNZTVdw?=
 =?utf-8?B?R3FlK2tBc2JPR0l3VkU2UmtYRHZUWEJoanhxSmdhQmNLQ0QxTGZ6eG9qc2Z0?=
 =?utf-8?B?TEhrbHoxZU1Ld0hjaGpwZHRucG54OEtBWXJ6alI5akFtU2I0bC9vTThmVVJv?=
 =?utf-8?B?bEFzSlZMMFVlQUd2RFBmcWdwNEVvMVVmcEFSdUpqcTZ0c21ZZW0rbEJ1czRJ?=
 =?utf-8?B?Sm1yTENFQ1JPUEUrZUdvdkhVa1BzTDI4T1NvQzRnbjBhbHpVMWtNZ3RIWUJ4?=
 =?utf-8?B?QnltNVFFeGE0YlpBUmcvWTVaVzZKSm5FSkZtZ3g2clNlOHRNRkl3NEtnMm5y?=
 =?utf-8?B?cUZnZzdvQXdZbzRMN2JPTSsxQzBKd2NDK0xqM3Y1aDd2SGx1MmRrOEV5aVpX?=
 =?utf-8?B?UDNad3JpL2RRaVk2TkMzUzd6M2VHa09pcGVlU2E5TkVCVWRVTHM0Q1RXVHBj?=
 =?utf-8?B?cjNRSVdpSnZlWDBuOEdnaU5oV2FCSmpLUVBZR2J2WUFpTFBHTmwramc3anFY?=
 =?utf-8?B?OHdkVWhqbDBKMlpkVnl3T0RZNm0yekt2bmxtWXZJaXR2OVNTSzByQ3NoVnRi?=
 =?utf-8?B?aXNNWmtkeHZ6aGVzN0J5SjdVbVU3RGZQTVRTdXhUNmFSUys4cVNBNmRqVnY2?=
 =?utf-8?B?NFJ5bDdsdWF3ZmcreFFFK2VtTUVHNjN1NlpabjNwOXhzQy9PbDhSeWVEc2J3?=
 =?utf-8?B?ekRUQ0NtdUs2TFpwOFJmTzkvZThpYWFoRi9kVE9Ed1EyV1Z2aWYrQmRha2Ny?=
 =?utf-8?B?NjRiMUdLcnM1VVN5YW9UZ0U3ckE5aVBQcStRdlBtSURoUW82dUNhcmJQTzFq?=
 =?utf-8?B?d1VzNHJmby9aOGZFcFdpb3EwWTZPZGwwdmJFbW9hTlJEb1hKcDdkRG5KNSsv?=
 =?utf-8?B?ZHV2L2NFb05GQUZ2VXJLM3FLck9HL2xCQ0FzTTBvMExJVW9PSEo5UWRYN0J5?=
 =?utf-8?B?M2I2ZUduL0w1ZWFOMjFyd2daZkNBUk9Ya2l3NnFETEZ2MVBlOHJPUFJDMEFw?=
 =?utf-8?B?alpnUmYzWmpZVEdmSWhScjFPckRnNk9SQkhYQTNWMDhETXhUbTB0UlJLZWZr?=
 =?utf-8?Q?ZzeN6gOMcPuXbpu4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <714A17670828764CBA2A6909E09793DE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ge6dnq7agNO3VoIKXH0BD8jdmfQ5rY79HppwLp/YmvTEaoUxgNqfNw+o/LCh4nAVg0rbC4mTew96dLgvWd7+96gxO2keynVlVVdqqekokWpkeiJKt2ZuOpzLwuMXvK2dNu7f/tt9QNDBhHSopdiFZkk4ocXWAlYac/2+2YSI20m6PGbhCttRHsuxGHq7Cj/u0HEDPRZgV2TcrC9WlmTMgqtUmJx74H2fmTASPwCYohH3bBcBP1uTophmOv5wG4VCNXv5qUmNg7O3d5fwfI8pWMqB54CDAx9/K4AxHwoZypzhpKf1B1TyULzbzIYaScGDIEZvfReCGCkA21+mrgmTGQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0643afed-bb56-4cf8-b331-08df1b4ae53c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 21:20:59.7023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m1hwinQqBeZHkzjn5oNw9NMKcnNzduVDiNXxdlrCeM6Whhen13iHcmwtnh9TVzxEJDuoJbkUB/505KqodiudBEB9NpKjWOx1K2SuKIPY5oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB597013
X-OriginatorOrg: intel.com

SGkgR3JlZyENCg0KUGxlYXNlIHB1bGwgUEVDSSB1cGRhdGUgZm9yIExpbnV4IHY3LjQuDQoNClRo
YW5rcw0KLUl3b25hDQoNClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgOTNmNTE1
NzllN2RmMjQ4NzgwMjE0MDk0NDE4ZjIwNTI1MzM4M2NjNToNCg0KICBMaW51eCA3LjMtcmM0ICgy
MDI2LTA5LTIwIDEzOjQ4OjE1IC0wNzAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoNCg0KICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvaXdpL2xpbnV4LmdpdCB0YWdzL3BlY2ktbmV4dC03LjQtcmMxDQoNCmZvciB5b3UgdG8g
ZmV0Y2ggY2hhbmdlcyB1cCB0byA0MjUxMjVlNmQ0MDhiNTk2OWFmYjk5YzNlOTVhMzkxZjFmMWFk
ODFkOg0KDQogIHBlY2k6IG5wY206IEluaXRpYWxpemUgc3RhdGUgYmVmb3JlIHJlcXVlc3Rpbmcg
SVJRICgyMDI2LTA5LTI1IDIyOjIwOjM4ICswMjAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpVcGRhdGUgcGVjaS1u
ZXh0IGZvciB2Ny40LXJjMQ0KDQpTbWFsbCBmaXhlcyBpbiBjb250cm9sbGVyIGRyaXZlcnMgaW5j
bHVkaW5nOg0KLSBmaXggZm9yIHVuaW5pdGlhbGl6ZWQgY2xrX2luaXRfZGF0YSBzdHJ1Y3R1cmUg
KHBlY2ktYXNwZWVkKSwNCi0gbW92aW5nIGxvY2sgYW5kIGNvbXBsZXRpb24gaW5pdGlhbGl6YXRp
b25zIGJlZm9yZSByZWdpc3RlcmluZw0KICBpbnRlcnJ1cHQgaGFuZGxlciB0byBhdm9pZCB1c2lu
ZyB0aGVtIHVuaW5pdGlhbGl6ZWQgKHBlY2ktYXNwZWVkLA0KICBwZWNpLW5wY20pLg0KDQotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQpHZWVydCBVeXR0ZXJob2V2ZW4gKDEpOg0KICAgICAgcGVjaTogY29udHJvbGxlcjogYXNw
ZWVkOiBNYWtlIHN1cmUgY2xrX2luaXRfZGF0YSBpcyBmdWxseSBpbml0aWFsaXplZA0KDQpSdW55
dSBYaWFvICgyKToNCiAgICAgIHBlY2k6IGFzcGVlZDogSW5pdGlhbGl6ZSBzdGF0ZSBiZWZvcmUg
cmVxdWVzdGluZyBJUlENCiAgICAgIHBlY2k6IG5wY206IEluaXRpYWxpemUgc3RhdGUgYmVmb3Jl
IHJlcXVlc3RpbmcgSVJRDQoNCiBkcml2ZXJzL3BlY2kvY29udHJvbGxlci9wZWNpLWFzcGVlZC5j
IHwgOCArKysrLS0tLQ0KIGRyaXZlcnMvcGVjaS9jb250cm9sbGVyL3BlY2ktbnBjbS5jICAgfCA2
ICsrKy0tLQ0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQ0K
