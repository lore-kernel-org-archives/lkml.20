Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793423413;
	b=Tvi0gwYMfyM3/Tn6kNJ3i2EwgeHNQuT3mRt0Yqg0/t98TQqHvRYOKvoymyNh2G9qVVmS
	 4tq/Ik92+KH77ogW5tb2xsPCAoaJhs86Ekgx6RET3wVGdVBG0wI3t+WdNekS29dzcSGab
	 jdl/6W7eyLu7ct2ownuuYeXoSxnsWW9hneSosZzAopSbpxsbquiAYIcIfNvFW+kir59/4
	 O3rfHgU4oM9lcENSVvXR+CH27I9SppoYBUG9U9jzpA4z2xF389PAK/EI7GnmkEbYo5+st
	 +FM5bxIq3zDPr/MtnfYEmVnWlpmNMwoNs4c8qR9hQVIJ3hHcRZAwilzgHbAUTGTmuIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793423413;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:
	 Content-Language:To:CC:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=Z7ouKJFqsi/AmWjorMfyHiSOyn6udNtyanHXFKTfwFs=;
	b=HtoubKfSytlOM6QQw3aRdjQrGXxYExyPyWIRGYfT5pSe6rrlGBik2Gq635IYLPZEhNzo
	 6kyAzRnHfuNbHH1aw/lyJNKNKK3VKIGmEO2g9gU9BEno/HKsf3u/VXKhP0xwPtnFJNFJF
	 tReaMAd0mCuNZGYVslVXSexlIMeLYfbQTaEnCzpI+joJVHHdVX4Z56Mv7AB94O3AvwuRE
	 kJlgr9nFi02K+EGPyuusuHYKMdX3Q4d+VykoBnoPs1QVUvzo9q735oW/Z/DZMUB+T2nJT
	 RBj6N01QuRTQ/tdgSrz43eHn2vOBjsVKy7okpnZC0Tx1a25aMz7+X4Vs/jFjOHaIYmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ILw5RxpW;
	arc=fail smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949DA606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 949DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ILw5RxpW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793423411; x=1824959411;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aZG979xgsgDBnw+k2WnlNzewuJojk1sv7Ggw8jEStfM=;
  b=ILw5RxpWrTz6i+4dZ+suT452oD1O/7pwCxMySc3/pLoRoykbU03pAqMS
   g8nJVu/zxUvySyl1dCYCl82K2PsCJKvppUINxn4xYHUgsaGBfgCsS2H9h
   TuN5gKW/RlX3Ulx2mBIHJ9D+2XICvieJ94Jby0xbEOZzl7lJ3iyoWcc3N
   PbquE+3F6oXhfMJtQgTywMyA+XTh39Vk48WZ6veRwMsLr8lkwsMCKMHX1
   /qZUxi7NM1h8tAyfqXhMI19vHbYqBy/bT+eaSuU+LLYJ7eXLr+feU192I
   Q/AiBH6Ge2Z3vSD9rYiqFAa1aCG6KK7jIooNDS9EDeaM0uMxiRBoI3JMJ
   Q==;
X-CSE-ConnectionGUID: cRCLcIRuST+d+23MHfK+KQ==
X-CSE-MsgGUID: xd+KOR6aQoiRUWbbWod/ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2216208"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2216208"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 22:10:10 -0700
X-CSE-ConnectionGUID: jXHA74CFTwuh10Frf4ncEw==
X-CSE-MsgGUID: Y+kce9qiTA69u3cLdsR/PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5688656"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 22:10:10 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 22:10:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 22:10:09 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 22:10:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQDMTtxG7/t8B6/7G2QY66Kv0KuyaK+eoyrO3yrUJ2Hks7IaXvWidFc+DEqsyV7AYylMCAcC7O9nmiL2EKT2enBoUt7/X2v9YJwWj+xFgnX0vgL2T2Cuw7DOtE61/u7B88JmUL4qpu5gvBwheOuD8bkHzazyWkfLsfxCkECWm6m3JmS0A/LCjr7uFvdy6fV+NmoFlBhNzoZeHXBO6rL8zci/H+y84qKm4MVuYfQb3tCOHNRdHKRkgltmLgsF6ODMyDB6VXQvEAFaGPYASHd/OHX39GIp53U6jv3O/iggHrc8aP6myT3QAGXoBV4cgNobJYXbWxhsgpA7lzemg5Rd3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7ouKJFqsi/AmWjorMfyHiSOyn6udNtyanHXFKTfwFs=;
 b=TfZpoi0iwWSsvSm2N+hU+uBNpnoi0iQ94AMmdxKwuMU3ui1hdN9IvXIGVeq2RpOge/ozIjVqpe79sM3golcoLP0DC0pRp9OAD73jaQwNCBfB3lAj+wDlXvVjO8v377Xhl1rIWK0G3XFUK2HkEqRFxtxCEyO+rpmYx2/Aww1rAnmV/GbOD+m52E8mIgij96UAhEc6Orju3gg5L2cNx39OvnpoEsjPMAplh6Wp0IaHbV5UmkZJpq67kzbdZ8Rjzp/e9n90+FBGvEiNVGR87hyzc3QMxYn8FIIpQAlvV1/mDeGNL5FuNQdKzgzEb5sXjktVk6GRGNEmW8Cw1qwjdyPsMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7846.namprd11.prod.outlook.com (2603:10b6:930:79::14)
 by DM4PR11MB6334.namprd11.prod.outlook.com (2603:10b6:8:b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Sat, 31 Oct
 2026 05:08:36 +0000
Received: from CY8PR11MB7846.namprd11.prod.outlook.com
 ([fe80::cae0:d05c:b2fc:c395]) by CY8PR11MB7846.namprd11.prod.outlook.com
 ([fe80::cae0:d05c:b2fc:c395%5]) with mapi id 15.21.0569.009; Sat, 31 Oct 2026
 05:08:36 +0000
Message-ID: <c9984c6e-9829-4e47-a1d1-50886ad9a83d@intel.com>
Date: Fri, 30 Oct 2026 22:08:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/cpu: Change AMD uarch detection
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>
CC: Sean Christopherson <seanjc@google.com>, x86-ML <x86@kernel.org>, LKML
	<linux-kernel@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
	"Luck, Tony" <tony.luck@intel.com>
References: <20261022040047.GDatmKb9L_fwqBGQ0_@fat_crate.local>
 <auDBUQQ9Ympsobkh@google.com>
 <20261028044653.GBauF-PdTS6gsOOozC@fat_crate.local>
 <auIBRhu4Zs3UgsQ7@google.com>
 <20261028153458.GBauIWIhGKCYhaxl2_@fat_crate.local>
 <20261029175611.GEauOIu-Xi9_DGVXKe@fat_crate.local>
 <2a6f9c90-a6a3-4b4b-a77b-9a3b99d66d4a@intel.com>
 <20261031015500.GGauVKdGNWuqeo0MG_@fat_crate.local>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20261031015500.GGauVKdGNWuqeo0MG_@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P221CA0063.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::15) To CY8PR11MB7846.namprd11.prod.outlook.com
 (2603:10b6:930:79::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7846:EE_|DM4PR11MB6334:EE_
X-MS-Office365-Filtering-Correlation-Id: badcc07f-2fbc-4923-c308-08df370d0481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|261026121527099003|261026140227099003|261021123027099003|261022105027099003|261028144727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: XfShQEDAmZ5j/yBtIVqmnsJDCHIiEXxUNNSRkdH6EfeS1nQOZXOKEh65iemlcKyjKPEJGwtLDap3LzQxPuFOwf7iREAYIKecLPwcv70wqiaXZ2frwPdsixk03RNtKdzIQNYV/rk1AdVL1qtgJ2sh2ysIdCilBTeX/wHVJhW21yMR2N7Y5mmopvF+N0UYQ1uS1RW1LPyefAiGRhk/DPTqs4j1F0ZQFI+8DVJXtdJ7yH17p0rTmWjZGRp41h6MzoJArHB4Ki6JcUtfdMSKkAdVXgM2pZNiDC1Wih5BcYFG8OYBDr1pwYPldlGSJZ4WzBvyJJTNb6+LP+2xObx6Lp0/+Iqp0GFwKs8N4jeH5Nf4b/BOLCSmMDWDhP/NXEAInrqg3WNWOtgMKHNKk7KrX++Fvywf2mna4Wquu3HUolxjBA17Bgp27Rq6fQsAUsYdgcpHzEkPFgIgUBTLddj0F2+HQtulDJ90soFWRj0Mi7m/XSed4kXI/of7tCHFwInZILa88O0yWO4xFW7o1i3GiNSVPs7sn6wMIz+SyIlyzVHvBS79J4ld3PSNdG07uogLNFE2iLqr66vCTJZdra5VaMoLpZiOksfIlLR4psYiBfg2+0FNTlF/sPsyblgu03zA0E02AsbZ0cRMnGDUCBudb9ChKrLvbMMS+dTOuxJDOm80PH0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7846.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(261028144727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmxqNGYwNnFncTBqRDA3WnZpd0ZXU3BhYnVzN0RsTjJoWFpkOHRmN0NodmVR?=
 =?utf-8?B?RW1lTkR6MmNiQTVpSWNsb0RpZDl1c0VPRUpsMzI1QzM2Rkk0b2dpN0hHUHZo?=
 =?utf-8?B?aTFoUkNhdWtCQkIyanBYSUoxYStkcit0TFJ3eWNYVUpGV2MxMktwbkdQeWRX?=
 =?utf-8?B?eXFGMmJvM0NqWUFITThnLzRHZVJ6a1hWNmpnUkpvM2oxekNJYzFSQlBRSnZE?=
 =?utf-8?B?MTMxZGtXUC9OV1dtSDZkYnhxWXdvK2VqUUh4aDZYL1daQUh5MGpyM3JPSFN6?=
 =?utf-8?B?L3VOeEt5T0hOYnZoRis4SkI0dkZ2Vll5VXYrMm9TbTFPbjJJUURNVE0xbEZG?=
 =?utf-8?B?TjlFaGFhcG96M1pNNXZ4OUZvcFgwSktzZDVuemtxU2NBVC8zTWFXNGxuVUNj?=
 =?utf-8?B?V0NhTUJ5cGN4dFI5Q1NMeThWazNYc3lydmh4bmdxdzFabXBkMmUzQnJzdVJU?=
 =?utf-8?B?NU1CNnZ5ZzVVVDQ3WjBLYWlBSDBQV3JwbUlacVJqZVhRNnFML0Y0TGt1cTRZ?=
 =?utf-8?B?L1RTL1hLOTdweEVMNHlOWU5iVkVsTHpZUXlONWFoVE93L3VMcmRsMHF4QVJB?=
 =?utf-8?B?d1Awb0s0cXJTQnJxTE9OWVpzeVdmQVFHam05YURBTnRwaVErbnlSVnlPeWxT?=
 =?utf-8?B?Q0poZEk2UjBOeXoxM2p2UnlUcEhMYTljeEM1SXcvZlJHWjloZnNvdDNQSDlm?=
 =?utf-8?B?cXpvTmk5bk9DRlh2QjBoSzh5Ni9Eb3VXSTl2L0JkaU1rdFl4RnFkaGRqOVVH?=
 =?utf-8?B?RW1UN0U1WStwbWZHNnFUcS9mTVkxZFZzVUFKeTA4TTNVT2FBVm5naFJMR3V2?=
 =?utf-8?B?SEVqYkVnTFQxYWEwTFZQZk5tMTlPeG8xaC8zNThXazlWemVnUi9tSXlEZEZ0?=
 =?utf-8?B?S1h6cFBsa0FkRjFEZVBFSkRCN2lqdXdkSGlPMXNIVVBqdHBvN1ZDZmN2WFJE?=
 =?utf-8?B?b01QcVBQd293Y2hGVUpmd0llRk1hRm0rZVprNWN3T0ptM1lwWGFRSU5kUERS?=
 =?utf-8?B?ZW9qalFHSE5vd0k0RzM0Z1hmNUxLbk1NR1ZseGNwSGo2aGozeFJMcE16YkRz?=
 =?utf-8?B?MDZaUjNaZmhOQml5eGhpNGFLcGdMWVhQVDJQakZ3WG5JeWR1NTFodVpYMUNn?=
 =?utf-8?B?L09scGovb3dqMzN2Vzcxa3lVQS8yMUNDa3duN2lYcnV4aVluUkg5N2lXQzlL?=
 =?utf-8?B?TVkzR2F0dWk0TXJxMWhMZ1pCWVNPMForMUNqRWFxWkEvaTYwcHhnMG5Bbmph?=
 =?utf-8?B?NnJKS0gyN0RHZmozVEQ4L1RTSEk5djZpanM0emJWZXlmSEp5Q1kvNnpzR2E0?=
 =?utf-8?B?dHp2NithNkJhQTNmaXpVRFZhbHU0ODBGUGcxUlVYZUxRamdBdDJwQll1dXFX?=
 =?utf-8?B?bkJmVUduR0VRSDB3NnRFTk1jVU16TFJRcVNKUGhyclJ1TWRreTZYUXg4emRq?=
 =?utf-8?B?NlE4NkFMNWprcTJpVUZSWW5SaGJEb2N2Y3YvNXBUa3UyUFNHaVhoRlUwK3Yw?=
 =?utf-8?B?RG92dlBnbkFZUDgweTVXVGJXUHdaVDZNcllYOFV5c3JCWURpM243VkZFUFBF?=
 =?utf-8?B?QUlmcTlSek5aLyt5eHJRb2xvTE5FRUt2UWY5RE5tQ2hEZ2FLcUErNGJ4dGpQ?=
 =?utf-8?B?RSt3UWFma2FLWWNhOEduZ2RoQmpObEVubGEycGtGenNZdTcvSzhydXA1OVVl?=
 =?utf-8?B?Q2hYMnNTY3lUQ2MxTEtQZXFLV2ROcDFPNGhMMldUL3FNRXV6UlBOUUhCd3BN?=
 =?utf-8?B?c1hIMzhsbHdWcnZFQnM5TlVzV2RWQ0dzWEpBNWVaTm9lZU5TbjdBL0QrNis0?=
 =?utf-8?B?Zm5yampiY3RQZytOc3FOWm4raDNFTzZscFplZEI4b2ZDMGkzcjl5SVRoUUtz?=
 =?utf-8?B?eFQ2WFNrdVU4enJvZFd6UktRSUlaTVpTWnV4M3M0TlZKTHhxSk53RTBSWjlL?=
 =?utf-8?B?Vlp5NnAwTzEzNTY5cXpCVUtpMCttUmNxc3hMajZEbTROclpFRzFqMEZ4SzNu?=
 =?utf-8?B?NThKSmRqRk12R0NUbkxBQ2tYcVhnTjNUSTNxRnFzSXpETXhBcU9Mem5VUWtD?=
 =?utf-8?B?UmhZcjJ1cjZZRUQxZ3FWRk91QlZjYk1TZ1RQOXc4cjY2NE9Pa3JiYWFpbUNK?=
 =?utf-8?B?NzBoMHRMSzJVdzM3aU1jZWdZc3dDcDdsbmlrTFRrSmRWNGhZSVZvUHNHaDBO?=
 =?utf-8?B?Zys2c3doZEQ0RGd0MzJ4allxM09GNG90bXFVcVRlaG1qTFlnaHlDUHdNZCtn?=
 =?utf-8?B?UEl4YWcwSDhsYWY4TmNHdTNDQWhINHg2SHp6Um1md3dpMTNoTTU0N2dBYmJJ?=
 =?utf-8?B?dStwYXQwbWd4ZlVWVXQ4dXVWcUF3U1JVWG14N09weU90ajNLVmJvQT09?=
X-Exchange-RoutingPolicyChecked: Tve3DrfQ5oO7s2RtLxmzuGxQMeX0Pv41m67NMuluEhEUk2P4aEKPSTIzINq28KezQ5dubCQEa0otJwFIbphXd9vxyjEsPkYkCMdH8X6eZQej7TTWdKLC/N9Xy4+OnzfWnVgxbspdjM2Lf+RT6nnhAgKgzED7CfRsDOJz2xV5t2SyOcvBf8rdMKRLJ1JxS+iaZybAathf6KbzYSdjSdkMPVKiHzhKZgNU5vm9mK1+cYJCytKFblzi0Rm43GuSmRHhk0tYrPtgsfRXBjfmO0qpFxEHB6V/nT1Dc5W/9ZtRz8SmOwOUxnnuL0b+Zq/fVHYUFn83r3BRug2CadhHTgB5uw==
X-MS-Exchange-CrossTenant-Network-Message-Id: badcc07f-2fbc-4923-c308-08df370d0481
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7846.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2026 05:08:36.1902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hgI1QNqJZjsz5gSqPke+KRYkVC4ebMyWV/gGj5doSlAWnLxLeFhJ5/rmeYSzLuWkOG+K7y76JKYLAsY+rkt2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6334
X-OriginatorOrg: intel.com

On 10/30/2026 6:55 PM, Borislav Petkov wrote:

> So, we're going back to the initial method because that's what this is
> - x86_uarch is the microarchitecture number I am giving it and not x86_vfm
> - a family/model/stepping tuple.
> 

Yes, that makes sense. Though, I am wondering if it would be better to
define x86_uarch outside the x86_vfm union?

With your initial patch,

	union {
		struct {
			__u8	x86_model;
			__u8	x86;
			__u8	x86_vendor;
			__u8	x86_uarch;
		};
		__u32		x86_vfm;
	};

x86_vfm is calculated as:

    uarch << 24 | vendor << 16 | family << 8 | model

However, VFM_MAKE() is defined as

#define	VFM_MAKE(_vendor, _family, _model) (	\
	((_model) << VFM_MODEL_BIT) |		\
	((_family) << VFM_FAMILY_BIT) |		\
	((_vendor) << VFM_VENDOR_BIT)		\
)

Is the thinking that we could make x86_uarch work with all the VFM
macros? Because, if they can't be used together, then placing x86_uarch
in the union x86_vfm is confusing and likely to cause mistakes.

For example, I initially thought that amd_tsa_microcode comparison might
fail, because it uses VFM_MAKE(). But, it doesn't do a direct x86_vfm
comparison so it is safe.


