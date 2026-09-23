Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB644559CB5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177475; cv=fail; b=XmNsYK3EkygK4W5fxvneFSnF6R3pUXSDH9r+NoIZ+9EUOTPQNEe/gK3E4ou3fV8vok0xWnRilPP77YNYXfbQRDaQZgPjO7hPnw7HQVnxh1rf0McDfvsO8Iby1oPA6RuTkHhXHfvFzYA00V1bXZf9ccCrOyftf+W78Ct+ZKGkfGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177475; c=relaxed/simple;
	bh=y4ssPVMnIyGqgcx9W8KaIrsZnWhsbNlLAQrvoIlGWqg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NxJPdJ0r+0/NWzj62BCjNummRvgRsS/negVxET8lEIsXb4ZDkQFNeDnreliOIPOnEuVgMtrtIyOT3NXdrxXYKa1/LKPFmhqTUXkXf3MLRiLZUAySuV2FAN+wf1VGRGKC/GH2K25cwn+7yCJ5ZuWU5/4ScKBPzGimQtNX6jKfA0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C8wqcyzz; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C8wqcyzz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790177467; x=1821713467;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=y4ssPVMnIyGqgcx9W8KaIrsZnWhsbNlLAQrvoIlGWqg=;
  b=C8wqcyzzWCDOtc92VuGoVsiXAxwTfkceb5KPDZMkcoZmUIT0T8UofnYb
   FJbSQqddbz/SA4IhGfpJPSt+XLtupda4EeF8qHYHLAO+NI9fsob5u0kAX
   KFVCDrTOQmd+4ZpSROo0DOzYoLCSHW6Rsc4K/aeviGe0cznzg09DEfwan
   +XBiGTQwYrTVgl/1bNtAkh+iRckmnrzCZ0GJx8TnC13dLksIzKM8FSbGs
   1WaWxpftp8uASFHwiCJc5r6JhSLSI3qdKa5zwRrMssaRvPOaAfNBzCHXZ
   oT8wB3t1Fx12yT2DR5E+yXONoG6IWGg8GOO9qV9ux9suUL/ZRVEqEP5Xj
   Q==;
X-CSE-ConnectionGUID: 3PxGZ2CBSj6sxHOnu1W4GA==
X-CSE-MsgGUID: lYDNQsyZR+i2lgU9g/PYMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91001453"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="91001453"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 08:28:48 -0700
X-CSE-ConnectionGUID: +yEl3xIGRZGlJXJLFE8A5A==
X-CSE-MsgGUID: wgn42j14TaCms9P9g9lFrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272833239"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 08:28:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 08:28:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 08:28:45 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 08:28:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJRS9Z7W9vS4haib+Qk+x1HRHNOC64BuDAJnGJs/BvEBrC5Nc7wOEyOpJjBgcL+CJ6Ep3NmmMyzAh8dCo1X4gvLOf+acIp2inGMe9zqA/hPQcOT75L5g/UaCDDdhdEkRfGgE5I2nv9+/SF7sNpErgk0ES4lnPZzUh1BlQmSF+qGueRp+4rqNN7AfBORAB2VAafTgBOAWAj20yVxwNkypfXEMXamChOGe8k3+54Wq8nWDtQ4NePttDfQw2yxUJ+d+iJGX+leM/b6PAt4fHxzpAJg0t+Xk1GdntVYqdi7bXW2hS8heA29d4Zh/q/7eNhdoj733Dz+wLfe8w5oMLU1Kbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OTsDQR565aR7EU9Suckr7rQNZcLmn3DQTOysry068A=;
 b=bdu553VNznj47wefxN+74tRv/7n+0gtgHUQVyrgPn/hSz6ZNj42YWFnwuzgWKiA2qsHitwtPWOtplzkaW9mc7LwjjYP8LYEO3a6lqCjxgUQBIQWIQQVqyPmBMH1Y0QANSyUgR5sHIb7WlzEhazV0phf6264Ko/b9MX/gxSvvkPMrDt6jlN9dKpS8ZiQ31A8ztFlkEzcrFpHbcLNQq+V1vAU+VgdCghvVmDToRc4+3LZGVdDOxvtRWiQtBlUpXDeZxAqButDT91S879s+JvvqK7sZwVBnjscEbQdZ/kSKqNeL/zNd5Ut6fNMxbv0bHc7Z4Yof+XF19Kl4Wdy7JM65uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CY8PR11MB7011.namprd11.prod.outlook.com (2603:10b6:930:55::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Wed, 23 Sep
 2026 15:28:42 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 15:28:41 +0000
Message-ID: <49d4132a-843f-4034-9bc0-0dbd351f8215@intel.com>
Date: Wed, 23 Sep 2026 08:28:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2] arm,x86,fs/resctrl: Generic schema description Proof of
 Concept
To: Ben Horgan <ben.horgan@arm.com>, Fenghua Yu <fenghuay@nvidia.com>, "Tony
 Luck" <tony.luck@intel.com>, James Morse <james.morse@arm.com>, Dave Martin
	<Dave.Martin@arm.com>, Babu Moger <babu.moger@amd.com>, Drew Fustini
	<fustini@kernel.org>, Chen Yu <yu.c.chen@intel.com>
CC: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
	"Dave Hansen" <dave.hansen@linux.intel.com>, Peter Newman
	<peternewman@google.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
 <eed6d913-c01e-46d4-b249-68d2e7f5b616@nvidia.com>
 <6cf3efa5-697f-476d-9f8b-0c97bebd706b@intel.com>
 <3f39918f-91c0-4411-88d2-1ab1db3f12d8@arm.com>
 <94cb1f7b-0b78-4aec-8d57-7ae7e547cf36@intel.com>
 <7ff818b9-77b9-4ac8-9132-98fec40ab0ac@arm.com>
 <46e62f37-37f0-4d8e-b869-b83a61cb611b@intel.com>
 <f9d97f42-bfa0-4862-8494-7769b929ea52@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <f9d97f42-bfa0-4862-8494-7769b929ea52@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0262.namprd04.prod.outlook.com
 (2603:10b6:303:88::27) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CY8PR11MB7011:EE_
X-MS-Office365-Filtering-Correlation-Id: dad44119-d72e-4651-e625-08df1987591f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|22082099003|18002099003|6133799003|4143699003|11063799006|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: QW6n/KkokUGxCRNiw+tDL2bRxSii+mXMH7SBKX0atTXs953ehGPxbl/bdGaIGzr0X9H5HOnB7pJ15xhqrNSWGHeARFKZVeejLzNz7LM6iUmZ+QmewSSSwEFj8gS01Lc/v/dA8b6v7L9k9/z2XiA1nOTiCQqdRhwxyzDyuVhtwc2OffLb1J3TDD4OP094+ESv/Uv0naF247JIp++NKJopkBAXPb5PZ8meOP2R0/h6kOJNdwSTBXUBN+y/mSPU4lSe2+b76aMd0XXJMAfRJMGYYVeHkNbjF7Qedf8h6Qa5VCP2tdEprye6d/0JRiUiwoGbrlrus6DoyGsxKjTshxIhKWF+YfBCq5zKtGyxBhWocx9Cu33tXKMTyLycVeMUddokVp5+dkPIqphHXcXQMZ20mkTwhQQ/6I2sV9DMHEC9Hbdw9YeMjtdmtNATbG+Jz1w5toaMy10EAd/zfqRnSx7xerl8aGTOfCcSnpQxBvxQLaajBGyLS3cDr/8yP31a7AaSf7o9pknjbr6P7yu2OShmxoawkbYOiFvqrv9m7n8t6g/mnPFbceM1HyV6R2LqMcdXt9/BTzXgcVWM1Gfjs3WJf2tIN1GxvT61TfikA7Mi6JzLVbyCsmNsqY5mTdIg88dvWsNEQHMXQzoCxXSrTCSS2r0kKUkCSYDY4ZXyHE3vQRA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(4143699003)(11063799006)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXRXUHhFaXFBSWJQSzIyckxlZU5RcW9mOTVjZmVza3pkbzN6RTlyTUZJc0Rj?=
 =?utf-8?B?aFlDWUU0WDYweEtrbGdvMVNKcGRXK2d6NUI4Q0NZY0lmZjdLRVBIMkM2Njhu?=
 =?utf-8?B?OEtyb0k5Nk9ZSWQ3ZFlrNkNrQ1c1SWUwZkNleTg0WTgxQnNZaXEyaUU1dzV3?=
 =?utf-8?B?U0Y2SXBMN1ZmaHh4cjAwWHFCTUhFbTVVdi9wTWRxdWVBcjdtTktnNlpIOHhO?=
 =?utf-8?B?MVlzVitQNSs2VW4vU1N0TGJ5N2tWeVgrelp1TWN1cWI4bG0wVE9pVGp0NzBB?=
 =?utf-8?B?WGg5ZCtBcXcxTzFXZzJSTzd2OWpXR1hxVmFPM3dHc0cweGRSNS93cXRnaTU4?=
 =?utf-8?B?UDF3ZkhLSGVHVjVwVEIySmZXV28zUGl3VFFXRTJvbnZ0TDVldHBOcEhtQi9U?=
 =?utf-8?B?VUFJdk1lN3VZRk51d3BHb2ZDd0F2ZXJXNEN1NCtidzVGbWpmdXBYRGRyUnNi?=
 =?utf-8?B?M0pUdExnMi8wdUp6dS93bXVHeDlhS2c4WnpCeWV2NVg2Z3NJZG5vdlpwMW5M?=
 =?utf-8?B?dUtDYzQvM3packx3amREZkdNSGZ4aFBzcGFHR2NjRzl6OGtqQ2FHMUI0MDNQ?=
 =?utf-8?B?TG1JM3VPUlR3MzE5VlV6YzZreEE4aDJmVVR1dW5yRTBiaFBTZGZ1enBDQjZX?=
 =?utf-8?B?UXk0WlNmVWMvS1pVVkM0OTk1WWRQVEtpSUF4Yllab3p3ZUdyZkkzVzYwNXF2?=
 =?utf-8?B?eTk0QXJJYmRsckZuMC9lRitnYnBBL1N0NndoNjF5WmZhcFNWM2Iyb1NUSGky?=
 =?utf-8?B?N0t1Ris5TnpHamdHR0FZRS9lRHRnenBIbWU5cndHVFI1Z2o2LzVnUjY1ZTcv?=
 =?utf-8?B?WDVGOUM3OHRPOGlxcjc3Q3QxZGhsVVBYWDFSaFR3M3BvV05ZaUJDMW1ERG56?=
 =?utf-8?B?cy9qdUtxZ0xuQU9CNUZxMWNhN24wbGZqWms2VTNQZGVlWVFzK2tZVGh5Wlhx?=
 =?utf-8?B?T20rZ2t5SEMzTm12SzkwaFRHYmRCdHhsVmgyOUU1WGl2Szl4ODd2SVVYOXBa?=
 =?utf-8?B?bmFwWnhqbVpWMTJoMzlvNDB5KytKVXN6RkZvTzRxRC9YdzdBWDY3d0o2WTFq?=
 =?utf-8?B?Um1taTUrVWVFS2liY0M1SnJiYUtja3EzUGRMVUtLTDZyRjdkMnJhd0QyRldF?=
 =?utf-8?B?WVFLa1FuVW5NKy9BcVNMMTFuMWEzZ0doV1ZBbTUrZzJQem9EN1laVGt5d01q?=
 =?utf-8?B?TExaT1ZpZkZ1eWNGMTNOYW1TT3k3b0M4Z29XeVlEZ05xS3ZHQzdFbG8zZnM5?=
 =?utf-8?B?WHV4dGFyRFJqRnVaVXBLTXhDSlEwL3B3eDdzQUZxWGlnbTJmbnNFQzB4SVV3?=
 =?utf-8?B?MCtVRmtxUUlpUVJIYVBEaFdhK2lZcmxPV1hyRnQyZFJ4R21ZUWJwS3NydGVO?=
 =?utf-8?B?ZEJEUkg4OTVmQ3dYVDJreGVEVDJ2VnovQklPTUd6ajJmZVdzYnEraFR5dFhr?=
 =?utf-8?B?TnFVcmdOdHZKWkk1ajZsU2dIRytBRTVYNVhlTmhrbjkzWGExbGVSZE5PbWs5?=
 =?utf-8?B?dEZ4YnZ0b2ZVUnNDa1dOMFJxYTBNM1Z5eFp4YjkyVi9CRWVSOHNjUkc0MzRw?=
 =?utf-8?B?T0ROVDVpa2VPS2NYS25NYUlxUTRJVDlxQ1J0aURicWVVenBNSG0ycEwrc1V6?=
 =?utf-8?B?blU3R1lOYjdxKysyYUJUMWtqc3ZEcUVzWEtCVTlhWFZKdFFRMG5oNnNGQ0dD?=
 =?utf-8?B?SkJEZVRMcEVCRlJpWUZTajV2UG5IKzNlRHV5R1JPMFNQc211NXp4ZEhWNU0w?=
 =?utf-8?B?UlAvMGlNYXJlSzR5RkM4TDh6SzJXcUZWWGZMQTJtVGVLbjFwTVUvNTNZemZv?=
 =?utf-8?B?MEsxMHhtY1B3RldMaU8rdWNZcExCY2pEWHZqa1YwdXl0T2lxUkZObE9sc0JV?=
 =?utf-8?B?WEo5Zlo1cnJIbUJBZElBYUZYb3BITU0ydmp0MGZGQjRNMHNnZno5UDY1d2Np?=
 =?utf-8?B?dXNaQVRKNnlRWm02cktkMzJWWENwbS91SE5RdGZKcTJpKzB3MWJ3bk9RdXdy?=
 =?utf-8?B?YlpGTHE4c0txeHh3VTRjb0pXOTRxTXkxR3pxSVBSVEdqZ3FkbDQ4SG9kcXhJ?=
 =?utf-8?B?SWN1RDYrZk1KbFJmSEMyMFdHUVBGYTJQTm4xVVNkSDBORDI0bXhhQWFMbFln?=
 =?utf-8?B?Tlo5bXlzRTZoMDJxL0NNQVRNUkFPNVNCa2N5aE53dW9VQzJOazJUWFBUWUpW?=
 =?utf-8?B?VVAzUzlSSWM3dE5ValFDWEViUi9jeFgvM3Z0RDVOUFBlRmRsa2p0T20xY1lx?=
 =?utf-8?B?cmRMU2FtdklHMGhsL3U0ZzVqVzhsbkQrZ0U0T0FhWFYwczR2Vk52NStMQTV3?=
 =?utf-8?B?K1V3Tmo0ZjNoaVp1QmRjTzV5Q3RSTEgxdjhXNGdxZlZZdmNUTk1FRURCRHp5?=
 =?utf-8?Q?jjoE+1c+T2NlIzeI=3D?=
X-Exchange-RoutingPolicyChecked: HDHRANaRd7MNeYAKnpgqQ/9AMyn897auSUoXYjwoPHto2pMscZicwRlj5pIMH57tECIIZCJHOhzAn0pzlU5WIxpOlfxa2Su9lKJ9wdRoDpFu3dzao7+M0CrUG62FjgRok8yG/Dk1hgUZ/Ue9UYVIG85EVlt4GpbOfdoDsNgLKiSzyCuewSRD6c/5QmqrXf0TZtwKU8qf6Yl0KW3mjFbl9D888EE2BGnmrYvfhxW+oBQRQPq20Qw/B7K39acnDDATQIqMnNjtZTfYhuaG8QCm8SvGTkXef4+DjCyQwstME2IOJkErgVe79luvb7N7dF/EB23/zvBMPHCHa1tH5HOBYA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dad44119-d72e-4651-e625-08df1987591f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:28:41.7946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGP52cY6IdiHb3GMD+xTSJ4ysGDa2oPIBVVmabioE9GqIwt5CXZPPU+chu5Uq7ZG16ouYHA+ze1/NW4ryRMfQkiQh9+C/TZz7DkbKrI7QB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7011
X-OriginatorOrg: intel.com

Hi Ben,

On 9/21/26 9:53 AM, Ben Horgan wrote:
> On 21/09/2026 17:06, Reinette Chatre wrote:
>> On 9/21/26 3:22 AM, Ben Horgan wrote:
>>> On 18/09/2026 23:47, Reinette Chatre wrote:

...>>>>
>>>> Are you instead saying that resctrl should expose a node scoped control as that of a L3 scope control?
>>>
>>> The problem is that this already happens, for MPAM, in the degenerate case. This is the consequence
>>> of allowing memory MSC to pretend to be L3 scoped MSC and so represented by the MB resource. This
>>> only happens when there is a single L3 and a single NUMA node with no caches in between so that the
>>> traffic at either end of the path is effectively equivalent and the scope for both is global as you
>>> can't turn off the last CPU or the only NUMA node. In want of a better term, let's call this "L3 is
>>> NUMA". These shenanigans are what lead to the complexity of having more that one MPAM class backing
>>> a resource which we discuss at [1]. The need for the association is that, where possible, the memory
>>> allocation and memory bandwidth counters are exposed to the user using the existing resctrl
>>> interface and, as such, existing software will continue to work.
>>>
>>> What I was suggesting, is that in "native" mode we do away with any pretending. That is, memory MSC
>>> always back resources with NODE scope even in the degenerate "L3 is NUMA" case. One benefit of this
>>> is that the resctrl hierarchy can be more correct. I was about to write that a second benefit was
>>> that if there is a L3 cache MPAM class and a memory MPAM class which both provide memory allocation
>>> they could both be displayed in resctrl, MB and MB_NODE. The same consideration applies for memory
>>> bandwidth counters. However, as the MPAM driver in the "L3 is NUMA" case, always chooses the L3 MPAM
>>> class to back MB over other classes, the MPAM driver can just be extended to back MB_NODE with the
>>> memory class that was not chosen. In this way it will works the same way as in the non-degenerate
>>> cases and the same mechanism is in place for memory bandwidth counters.
>>>
>>> Hence, the only benefit would be a slightly closer description of the hardware in resctrl in the "L3
>>> is NUMA" case. In performing this exercise of laying out my reasons for allowing the native/legacy
>>> control to move things across resources  I see it is unnecessary and so the native/legacy switch
>>> should, as per your proposal, *not* move controls between resources. Thank you for your patience.
>>>
>>> [1] https://lore.kernel.org/linux-arm-kernel/0b0eef2d-ce3b-48c8-af08-5889e7396e4f@arm.com/
>>
>> If I understand correctly an "L3 is NUMA" would be presented to user space as:
>>
>> info/
>> ├── MB/
>> │   └── schemata/
>> │       ├── MB/
>> │       │   └── MB_L3_MAX/
>> │       └── MB_L3_MIN/
>> └── MB_NODE/
>>     └── schemata/
>>         ├── MB_NODE_MAX/
>>         └── MB_NODE_MIN/
>>
>> with the "MB" resource backed by the "L3 cache MPAM class" and the "MB_NODE" resource backed
>> by the "memory MPAM class". Is this getting close?
> 
> In the case when there is an L3 cache MPAM class and a memory MPAM class both support memory
> bandwidth allocation then yes. However, I don't know of systems like this today and this isn't
> dependent on the "L3 is NUMA". If there are multiple L3 and multiple NUMA nodes you would still get
> this structure. It just relies on both the L3 cache MPAM class and the memory MPAM class supporting
> bandwidth allocation (mbw_max/mbw_min). The "L3 is NUMA" is all about pretending a memory MPAM class
> is a L3 cache MPAM class so that it fits into the existing expectations of the resctrl interface.

I am missing something

From earlier description ("... the complexity of having more that one MPAM class backing a resource
which we discuss at [1]... ") I understood that "L3 is NUMA" scenario has two classes available and
currently just uses one to back the MB resource. Further, that the new interface makes it possible
for "the MPAM driver can just be extended to back MB_NODE with the memory class that was not chosen".

Above seems to state that such systems that have two classes do not exist?

My concern is the impact on the user interface. When MPAM "stops pretending", could a system that
exposes an MB resource before the new interface boot into new kernel with the new interface and no
longer have an MB resource but instead just have an MB_NODE resource?

>> It sounds to me as though both resources would be able to concurrently support monitoring so
>> resctrl can be expected to expose NODE scoped memory bandwidth monitoring events retrieved from
>> the "memory MPAM class" and L3 scoped memory bandwidth monitoring events retrieved from the
>> "L3 cache MPAM class"?
> 
> Yes. Unless we are in a "L3 is NUMA" setup to expose memory bandwidth counters from a memory MPAM
> class they would need to have node scope and they could co-exist with other memory bandwidth
> counters at L3 scope.

It is starting to sound more and more that the new interfaces may result in user interface changes
on MPAM systems?

Apologies but I do not think the MPAM plan is clear to me.
>> So far I've viewed support for monitoring events at different scope as "after multiple controls"
>> work that the "CPU-less NUMA nodes" depends on but looks like it is needed sooner.
> 
> Why do you think it needs to be sooner rather than just a next step? Is there some contradiction or
> incompatibility I'm missing. I thought that the monitors would just remain unexposed to resctrl
> until there is an interface.

No, you are not missing anything. My comment was based on my realization that the monitoring scope
changes are needed by more systems than I originally thought.

Reinette
