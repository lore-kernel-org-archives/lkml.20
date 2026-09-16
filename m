Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37D3269D18;
	Wed, 16 Sep 2026 02:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789527046; cv=fail; b=HGOHJuRT1FiJBdvEnVXTOYtNntgVRl9DtSi/ULdhh85nz7r+v8mHKaWuOhUvDZcmLestOrG16MCikTmQk8+nLwPCibb4E4Q8U3RnSObZf3EB/Ayn0mRZCyZjAyQbdUdAvqFpq7p3TaSJck6/aKWmYPrEZ64ojL+L857ZOmu2sH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789527046; c=relaxed/simple;
	bh=YQ4zy8FeqdhfFR1KaAKrxy8ZlQ6fNqsVHUIJqENn7bE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WbJtph+qZ6ItrPA37gZJGZDTCpGqbdfQsoofbq3OgS0hlWl1sO8AGEiuGODsaHCpmdKqnFmmdGajAJSWQbRX8gIJbilIokAxxldgXBHPwhF1gZAnaIzo05h53H0vw+h+INZt8dN54tBPUhLw+6EY2M+FRk4bogoxlxY4RWwm6FE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbjFoGU4; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbjFoGU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789527044; x=1821063044;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YQ4zy8FeqdhfFR1KaAKrxy8ZlQ6fNqsVHUIJqENn7bE=;
  b=EbjFoGU4lHbBPAsiEx0RCyg2FBL+9xxHoE6CEcFJdnHTusDk84wsI+Gr
   E9KoBD80OWwLHhk8x6pFnmHLfOChuSog/b4GxsV+arMwqf+APZh6y0p0T
   8tfeUB1tP1vNfsP7/Bocsofy2AfSXqhQHY5VWSKky1i+sCxkrw5OMScwd
   Kvg60T4t5GEwMszoyNywMZ0Je7XMAM/QvLdtTwBFs7EyBGZhSmz8VKmD3
   JcBxlHe6QPCP4jHYPTyU4g89iL8x2S1iDPrCBZoECH2WRUTirFbcWAMfk
   R0qBiIZQKlrma+l08/rpZtExbYibG+eEMj1mEchk26rb07OC4DZtvWnZH
   Q==;
X-CSE-ConnectionGUID: FlQNNEdNSYuXFKbW8IqYuQ==
X-CSE-MsgGUID: 5q9/hUGqRzirFGPy8iuySA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100561397"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100561397"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 19:50:43 -0700
X-CSE-ConnectionGUID: XM3LlfDESMGQXaLgsNz08A==
X-CSE-MsgGUID: nzMde9UGSs+QT4uWpHqGmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276721318"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 19:50:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 19:50:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 19:50:36 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 19:50:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N71yK1iYwqQ2n+Yk9mDhds/XWDREv1fhDjn1hjJYTZSd/M1S/we6g73zc9E/1lKTkVVpGEDSZ2i8UtCZ4BuDahUFN8zbeXsQCtYAcscwSatqj0fDumqttxMV+MGB0b7nw7FD+fPsHrZ5lzY24mFdC0mjmUvzVPvux5B7oLJjux2YKcHsk9ec33VBiAUvHzydTYOkceGPlV4gDu4o9j8odu76LYlYNDCAv+/9XU6BScKSzJi1b1YNnLydI5H9+3CeAQ5AFp9A6y6cI93yQn8oOjRtvSn9a5jPNhk7SZX6sDiA2qxDuVNcQ4jzUg7SWy6Qynl1WTDrZntknSUtpLXi8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQ4zy8FeqdhfFR1KaAKrxy8ZlQ6fNqsVHUIJqENn7bE=;
 b=ffnzAQJOmuScDdSYXDpv8zx+FNLVuzfMGCOni9+XMGVRrckZgfWE7VYXMFvNaWLBhyuszTEydBa7gxOE0FRHIedClL9Zgk7bmfmqXySQIRS1D9L0HrIM8CQSwRE/6YggXyaBZLc2mrISSI+RQJchXaenZqNOE68uhBOLhImNhgCMp3EfkGA6c11cpFHdnQl35vZK+ggIXo5pHeVKoyWqBESfHBPDAoQe5ui1/e+MNsOf58RiLkFY7K7X/5Ts6PIyeSoznx1P/erMLG4fyLtAQgKOswcNllKEe4J3XOsk3zHxnILLtAWWmsu6pcX2WgZPcqXM06L0pG9C7lBkwhOH5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by BL3PR11MB6364.namprd11.prod.outlook.com (2603:10b6:208:3b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 02:50:27 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 02:50:27 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, "Rojewski, Cezary"
	<cezary.rojewski@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>
CC: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "broonie@kernel.org"
	<broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>
Subject: RE: [PATCH 1/3] soundwire: allow drivers to check whether the
 peripheral is present
Thread-Topic: [PATCH 1/3] soundwire: allow drivers to check whether the
 peripheral is present
Thread-Index: AQHdRRQOAOukHSzGCUGbv6o8GJ2sR7bP5joAgAAQkgCAAITdkA==
Date: Wed, 16 Sep 2026 02:50:27 +0000
Message-ID: <SJ2PR11MB8424E9ED48457F44F763B0D3FFB92@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260915131327.1783551-1-yung-chuan.liao@linux.intel.com>
 <20260915131327.1783551-2-yung-chuan.liao@linux.intel.com>
 <f1f14def-8b2f-4b55-89fd-65f1e35d48a8@intel.com>
 <6e00e449-6525-4200-bcac-ffb696204208@linux.dev>
In-Reply-To: <6e00e449-6525-4200-bcac-ffb696204208@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|BL3PR11MB6364:EE_
x-ms-office365-filtering-correlation-id: 08e8f9c7-e6bb-4e3a-26fa-08df139d43a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|22082099003|18002099003|38070700021|4143699003|11063799006|10067099003|56012099006;
x-microsoft-antispam-message-info: KhQ/3FycMx0shXI39KMiuhnGRNJjtq4LaQ/lV3sDasX2Z7y6dYKpfjSyoyI3bJ1svOMsd0iOvsqg2bT5zZbN4ntCBRoMsFZb54PWi+1gXE3eKa2dOirXgFN+u/QybjdH2zf6qxgspc+jK/9oYOrGWyRP/2L3YFExPfPS949Bc0Dbh0p1wq4CvlQ1Km9OC/8FjTSQfw22jycoEy6qf+JXRtkbR83l49rHfepZyuuFNT8Y59Q3MASRQsuE4sQVbF6HztNZKhMoyv3X8ssccKb96fiFac4QGD54VYUXy4Q6z7GtBRIREtJOp/ndeJ89fTuAHsHHz2wb3L2n6aPjdhd2X1lMYSazLO6TP9qlhaE+vfMruNz4zISXGBHjq6DKpiKgDYyhHiU+PAILFCVtANZxullW7GG+VD1x5KmS0g4VE3OVOuzXYep68jFl3TpXI/5l8T9wVi7fQ6LZS8XZO01qb8jAB5HDhBRZabIzOW7DBpD1OSPiWQSp7kOUwMVNOH8o8QKjFXneJXW2FUua0FGPlHGa4ON35VD10HsQFFwoKDia02QTlJRrPclSxoR93mCHu0wPi3iv/mF6GvFYoxkFUUB1pHLcATnLnAKFKF+jLDaZnPD03VDQNDHChc84wqKTRZdufVM1HfdEmQhfamEZ2WMPQxZstdevZy/9R5XfLKos2Ixs+I4SlMgeYirhepcQ2Yz7MBivIHFyLPifLLvD51IxqpQqsQPMcS4/DMTxXwc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(38070700021)(4143699003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eW93c2JWM29OYXFObm91RTRiUzJ3WUNhM3p6SWJvK0hGb2Y1RllqYjloRUJH?=
 =?utf-8?B?djNaeHFjMUFzNlJ1QWdSTHJzN3pFU2ZqOXIxVHYzZTZ2WE5kSXkwQUVKNmg1?=
 =?utf-8?B?OUlBM3pwNlFMVk5yQ3FvdVIvNVhNcjExUlZ1WXVNUjBrQlJUSnFrS1BGd2JX?=
 =?utf-8?B?UUR5L3prdGVyR2Q4QWh6V3BQbE1FMC9pdTF3UXZ6ZXI0bjBoTU8ydFdWbGgz?=
 =?utf-8?B?bjdMSUM2YUdSeE1EQ1BOcldieUVkcHhyK0Z2YnEzVmJENW5XUmp3bVQvRXl2?=
 =?utf-8?B?NjIwR3lyZUQvU0VINWR6MzRCaEgwWmhXSlN0VUpRRFV1N1ZCVjgyMG5JR2dk?=
 =?utf-8?B?NFg4WlB3bHFrSGlWaEVvUkhmRVFuRjZ5L2ROc1pwK2g5cnk5RGFwTUpTaGJQ?=
 =?utf-8?B?VmNERWNmWDFCZGhneENtUGNQZ1VYY2ZJSndFWFZMYy9EcnA1bTVZY2w5MWow?=
 =?utf-8?B?amMveWFNR3FyR05sYU5EcDJmQllEMlZST1g1NDVoalV1Z05qVlAvOUFsc2RJ?=
 =?utf-8?B?Yk1LK2hzRXh6WU91SjR6cmZqck1ISGJhNlVSOEZhOHR3bWhobmpTMTlGZVRM?=
 =?utf-8?B?S2hSLzZMNlBuUlV4NDVSQTNJM1NzTjN0c3gxMWFRSytYa1c5dDlSUTFUN0h5?=
 =?utf-8?B?QTNlNnd0d09OOW56bzZrR1Jaa1c0dG80R3BZVW1TaS9vRkJCR2VqUC91Q3J5?=
 =?utf-8?B?SGlyTEMzVktnS1ArWCsvc0dnQ1lKZ2YwN0lueCs4TFhXMTRSYjFxd2lITlFI?=
 =?utf-8?B?L3RXbUhxdWNyeFVRSHR4Ty9lUUlnNmRhZ3NNbGo5UVFtSVZhVEFXNTV1SjhH?=
 =?utf-8?B?U1dvOThDeXY0N1lNbndMdk1IYzk4dXIyclFhck1JUHNTRmR0U3JZZUMrK1R6?=
 =?utf-8?B?Z0svQW4vTnpRMjNJM1Q0TEVQSmhyMk1XNkhPL0tHcEtRYlJ3czhXdUdQa3k1?=
 =?utf-8?B?TUIySFZDakh4UVFVV0svYUI3SHlCL2lXU1ZiVll4Z2Q4cUxFajdySlJ4K2cr?=
 =?utf-8?B?NFQyRFRVWWJpUXNNMkorQXJPVUZUZHpEL1UxM2gvNElNUThxcEtCMDNsTzg5?=
 =?utf-8?B?RTRUci83SDN0bVVFKzhPZHJMM2JYS1FQUE9ZS3U4NTVZU2tuTnFqRjd1bkZh?=
 =?utf-8?B?Y3F5azJsQ2pBeDVNSTRUdlVxM21BN2k5NTJpYkM5WU0vUnpsOG9tN3RJRVVa?=
 =?utf-8?B?YTY2Z1VOMEdzT1RQNjBGZmsyKzdaS3NVcWYzYnkrTERZMWpFTjQ5S3kwcFEy?=
 =?utf-8?B?OWJnV1BrQnlZRUpabkFaek9LVkFmc0EySnBHaW9XYjZraS9IT1RJSHZnbVNh?=
 =?utf-8?B?R1daVm9xbEg2VmM3bXMrVWtCd2VMTUdRSFMxRnR6MmVMTHRXWTBoUTdTbGI2?=
 =?utf-8?B?RWFNNW9NQWtnQUc1OVJPQ1ZsbDNwYllmcXZ5YnFVYkNDSGJVaG9UTTVxVWo3?=
 =?utf-8?B?TjFMV2Yrci9xV1VIVENYU1lrWC9kdGltSTh1K3d3cTZIS0I3TmtnUEVYaE5C?=
 =?utf-8?B?VFpQT0tvY1BremxTdTN0dGcyWUgrZ1ZsOUQvV1R5Slg5dWxtRXNSdkZvVy9W?=
 =?utf-8?B?dG85cytyUE04NllQTmlCdlpPajJhT3lkYjFOYzBGckdHaHhzWG9razJVTmNj?=
 =?utf-8?B?cWFKSEYxZHNJcSsvVWxqM0xzTnc5aVVDN3VrWWJ6OVBVS2JpcGpUZnNSRDhZ?=
 =?utf-8?B?MlBEc1lKTWwwRE81NHd1clRsOUR3VjlIbUdqeVE0dHBMMWtPOWl1TkgwV2xW?=
 =?utf-8?B?Ym8vYWZGRzRSc3c0U0JESE80STVTTHA5UVp3UGRDVHNkaUt2SkNaM05tSDdn?=
 =?utf-8?B?cGpQQnlHT0lWUm5Nb3JIak5TRC9scFVRSkRESFVQb0QranFuanZzRjJGaFNV?=
 =?utf-8?B?KzBNTWQ4VzM3K0Q0VGtualBPVXRNMWNZdzBGUFhOUkZGQ2xOZy9YbUpQWmt4?=
 =?utf-8?B?YVo5TUNWcFAzdDdoS3cxOGtnU3VqZDkvOFpYY24rZW9rSG5EZ0hMSlpubnpV?=
 =?utf-8?B?VmpZZGFYRWhTMENDZ1NNOU5vUzJOb09RdWkvMGtmbVgrVHhRSzNiMVFNNTEz?=
 =?utf-8?B?T0NSOGtjWmwrU1hPckUwVTlqd3BwQmE5b0ZzdFZpTG1NY2VnWHZtUVJNVXBm?=
 =?utf-8?B?bDYyek1iMldoL1dUTFRJcXZYNXNQbElQOCsrQ0VBU1RHYkdOakk0UWxtVFho?=
 =?utf-8?B?UnR2ZDl2QlFvOVg3TVNJeWJQczh1enA2YkFLWC91OXJSVnF2Y3UyUU1tQzNn?=
 =?utf-8?B?YllHZjNXek50MmtPM0xDV2dLK0FpcUM4NUMrbG82bWRMNW5xK3R1UTR1c2hD?=
 =?utf-8?B?Z1Y2YnJodlloSkdraS90V0IvUHNPc043WGsvWGY4aUdCSVRxWVRkdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 0hGwgSwr/2BxKO4xJxnCBf6b2OJKS9dUsyHOveo1SOnqv+dI94nIz2J1SFYPhtie8z/C6hUe9FPmHVRTaPR4g7h7vS9EzmpqUZTgL+p8Jl2KGhao2uvG3J1at837vxCtsEwC5B50qkps2SM5Kj6pHXwY6XoaKgwqAr5OqbF8QcRyai8TbzsfpKGFl5wNVenHhLYpPY4xeu/0D9/fFzYjIKOo9iRfpNJt9y6yctclY8AOicJzIXMhMZ5NRSL/PLzH3YIx+lcoNll2eT7LhwFGngg+cQG7vjUgfnEepTAVbjkKlYRVlQMgJVTItN8NekswG4FvH1bViVsvtgfllZUfeQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e8f9c7-e6bb-4e3a-26fa-08df139d43a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 02:50:27.4779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Umulfc7YA5plIlDO6wbdvZkXABYCyqCXSQmLED7dGSTb+LsySkj6cAZym0DYPzUx9Hjrt+4FRAb+dn/owdIpxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6364
X-OriginatorOrg: intel.com

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBpZXJyZS1Mb3VpcyBCb3Nz
YXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5kZXY+DQo+IFNlbnQ6IFdlZG5lc2RheSwg
U2VwdGVtYmVyIDE2LCAyMDI2IDI6MzIgQU0NCj4gVG86IFJvamV3c2tpLCBDZXphcnkgPGNlemFy
eS5yb2pld3NraUBpbnRlbC5jb20+OyBCYXJkIExpYW8gPHl1bmctDQo+IGNodWFuLmxpYW9AbGlu
dXguaW50ZWwuY29tPg0KPiBDYzogdmlub2Qua291bEBsaW5hcm8ub3JnOyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnOw0KPiBwZXRlci51amZhbHVzaUBsaW51eC5pbnRlbC5jb207IExpYW8s
IEJhcmQgPGJhcmQubGlhb0BpbnRlbC5jb20+OyBsaW51eC0NCj4gc291bmRAdmdlci5rZXJuZWwu
b3JnOyB2a291bEBrZXJuZWwub3JnOyBicm9vbmllQGtlcm5lbC5vcmc7DQo+IHRpd2FpQHN1c2Uu
ZGUNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzNdIHNvdW5kd2lyZTogYWxsb3cgZHJpdmVycyB0
byBjaGVjayB3aGV0aGVyIHRoZQ0KPiBwZXJpcGhlcmFsIGlzIHByZXNlbnQNCj4gDQo+IE9uIDkv
MTUvMjYgMTk6MzIsIENlemFyeSBSb2pld3NraSB3cm90ZToNCj4gPiBPbiA5LzE1LzIwMjYgMzox
MyBQTSwgQmFyZCBMaWFvIHdyb3RlOg0KPiA+PiBBIGdob3N0IHBlcmlwaGVyYWwgbWF5IGJlIGxp
c3RlZCBpbiB0aGUgQUNQSSB0YWJsZSBhbmQgd2Ugd2FudCB0byBza2lwDQo+ID4+IGl0LiBBZGQg
ZW51bWVyYXRpb25fY29tcGxldGUgYW5kIGlzX3ByZXNlbnQgaW4gc3RydWN0IHNkd19idXN7fSBh
bGxvdw0KPiA+PiB0aGUgZHJpdmVyIHRvIHdhaXQgYW5kIGNoZWNrIHdoZXRoZXIgYSBwZXJpcGhl
cmFsIGlzIHByZXNlbnQuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEJhcmQgTGlhbyA8eXVu
Zy1jaHVhbi5saWFvQGxpbnV4LmludGVsLmNvbT4NCj4gPj4gUmV2aWV3ZWQtYnk6IENoYXJsZXMg
S2VlcGF4IDxja2VlcGF4QG9wZW5zb3VyY2UuY2lycnVzLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICBk
cml2ZXJzL3NvdW5kd2lyZS9idXMuYyAgICAgICB8IDcgKysrKysrKw0KPiA+PiAgaW5jbHVkZS9s
aW51eC9zb3VuZHdpcmUvc2R3LmggfCA1ICsrKysrDQo+ID4+ICAyIGZpbGVzIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc291bmR3aXJl
L2J1cy5jIGIvZHJpdmVycy9zb3VuZHdpcmUvYnVzLmMNCj4gPj4gaW5kZXggYWVhYWU1YTU3Yzg5
Li5iNDk4NjRjYTY4M2EgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvc291bmR3aXJlL2J1cy5j
DQo+ID4+ICsrKyBiL2RyaXZlcnMvc291bmR3aXJlL2J1cy5jDQo+ID4+IEBAIC0xNjEsNyArMTYx
LDEzIEBAIGludCBzZHdfYnVzX21hc3Rlcl9hZGQoc3RydWN0IHNkd19idXMgKmJ1cywNCj4gc3Ry
dWN0IGRldmljZSAqcGFyZW50LA0KPiA+PiAgCWJ1cy0+cGFyYW1zLmN1cnJfZHJfZnJlcSA9IGJ1
cy0+cGFyYW1zLm1heF9kcl9mcmVxOw0KPiA+PiAgCWJ1cy0+cGFyYW1zLmN1cnJfYmFuayA9IFNE
V19CQU5LMDsNCj4gPj4gIAlidXMtPnBhcmFtcy5uZXh0X2JhbmsgPSBTRFdfQkFOSzE7DQo+ID4+
ICsJLyoNCj4gPj4gKwkgKiBTZXQgaXNfcHJlc2VudCA9IHRydWUgYnkgZGVmYXVsdC4gSXQgd2ls
bCBiZSBzZXQgdG8gZmFsc2Ugd2hlbiBubw0KPiBwZXJpcGhlcmFscw0KPiA+PiArCSAqIGFyZSBh
dHRhY2hlZCBvbiB0aGUgYnVzLg0KPiA+PiArCSAqLw0KPiA+PiArCWJ1cy0+aXNfcHJlc2VudCA9
IHRydWU7DQo+ID4NCj4gPiBEb2VzIHRoZSBhcHByb2FjaCBwZXJtaXQgZXhpc3RlbmNlIG9mIG5v
bi1naG9zdCwgU0RXIG1hc3RlciBpbnN0YW5jZQ0KPiA+IHdpdGggbm8gY29kZWNzIGF0dGFjaGVk
Pw0KDQpTb3JyeSwgSSBkaWRuJ3QgZ2V0IHlvdXIgcXVlc3Rpb24uIFdoYXQgZG8geW91IG1lYW4g
Ynkgbm9uLWdob3N0IGJ1dA0Kd2l0aCBubyBjb2RlY3MgYXR0YWNoZWQ/DQpUaGUgYnVzLT5pc19w
cmVzZW50IGZsYWcgd2lsbCByZW1haW4gdHJ1ZSB1bmxlc3Mgc29tZW9uZSB0byBjaGVjayB0aGUN
CmV4aXN0ZW5jZSBvZiBjb2RlY3MgYXR0YWNoZWQgb24gdGhlIGJ1cy4gQ3VycmVudGx5LCBJbnRl
bCBTT0YgZHJpdmVyDQp3aWxsIGNoZWNrIHRoZSBleGlzdGVuY2Ugd2hlbiBpdCBkb2Vzbid0IGZp
bmQgdGhlIG1hdGNoZWQgY29uZmlndXJhdGlvbnMNCmluIHRoZSBtYWNoIHRhYmxlIGxpa2Ugc25k
X3NvY19hY3BpX2ludGVsX3B0bF9zZHdfbWFjaGluZXNbXS4gU28gZmFyIG5vDQpvbmUgZWxzZSB3
aWxsIGNoZWNrIHRoZSBleGlzdGVuY2UgYW5kIGJ1cy0+aXNfcHJlc2VudCB3aWxsIHJlbWFpbiB0
cnVlLg0KDQo+IA0KPiBBbHNvIHdvbmRlcmluZyBob3cgdGhlICdtb2NrdXAnIGNvZGVjcyB3b3Vs
ZCBiZSBoYW5kbGVkPyBUaGF0J3MgdmVyeQ0KPiB1c2VmdWwgdG8gdGVzdCBhIG1hbmFnZXIgd2l0
aCBubyBhY3R1YWwgY29kZWNzIGF0dGFjaGVkLg0KDQpJZiB0aGUgJ21vY2t1cCcgY29kZWMgY29u
ZmlndXJhdGlvbnMgYXJlIGFkZCBpbiB0aGUgbWFjaCB0YWJsZSwgYW5kIHRoZXkNCmFyZSBhZGRl
ZCBpbiB0aGUgQUNQSSB0YWJsZSwgdGhlbiB0aGUgY29ycmVzcG9uZGluZyBtYWNoaW5lIGRyaXZl
ciBhbmQNCm1vbm9saXRoaWMgdG9wb2xvZ3kgd2lsbCBiZSBzZWxlY3RlZC4gQW5kIHdlIHdpbGwg
bm90IGNoZWNrIHRoZSBleGlzdGVuY2UNCm9mIGNvZGVjcyBpbiB0aGlzIGNhc2UuIEluIG90aGVy
IHdvcmRzLCB0aGUgbW9ja3VwIHN1cHBvcnQgd2lsbCBub3QNCmNoYW5nZSB3aXRoIHRoZSBwYXRj
aCBzZXQuDQoNCj4gPg0KPiA+PiArCWluaXRfY29tcGxldGlvbigmYnVzLT5lbnVtZXJhdGlvbl9j
b21wbGV0ZSk7DQo+ID4+ICAJcmV0dXJuIDA7DQo+ID4+ICB9DQoNCg==
