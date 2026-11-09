Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794252132;
	b=WvhX14lul8HZeXwd2v5FROmb/wKfY650GmM6BY9a42fOQ26jetPehDHpK/4ggwAFthdU
	 jhIDW0w/BFsn63nmLX1lug1gpAGmZf5zNl2tZmpRxlLLmWL6C9d6kv9LNyt9bzTvl4Erg
	 doDDvOMLvkoaTTCzK+5RaNU+MRFKunGVrVbrS4rVNIqVHC2MDZBaSXF3InwZqsqVn7xjR
	 MHZ3w1mgrBuSEseZZluZ5vLaUIYq3pc3GWoEDtkWelsvW33ruQHdwN9TLoDn0Mm38aARY
	 WxtAWPrU+/VE0PoYuSvBXg+wHYZOe/XFpZGsiVYTvAFvtpu3zyXe0jpR2jL++Bx8XNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252132;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
	 References:Content-Language:From:In-Reply-To:Content-Type:
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
	bh=iJ7eUAGA5DwjF5bg91UmIpne+ip/kZiZtbCOAVU1xkg=;
	b=msK/TYF6uPiri9siSsJS8XixKxI5JDLj5jhYGrLtXCen49NcJ8RX4k3YKH3LVQbwH70B
	 K+D+DqJySLkcaX6CCJe8uQi8m39pRppmjE9Wvt87c+RxTqf9i9VW4DApezu4ChkK5iLGY
	 mhHQCy9VfZ6Nd4rHRkCC1Rth4K+oC6N5knJNopN4nIB4BMvB2qi6VvSaQrI+lbncxTblN
	 /HXN6lzaoIpxOirxQbuV2cDRtJf/t49X0QfICs1e2py2D9pgnLeal1r8FwOQjhwbjcJ30
	 EzIfosXjhhIaMZTKs/Km70AOHbO7et1FNXKAFWGbF9dbef+YuWzW+tw11uEqYmKIXmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cqsEDRUk;
	arc=fail smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4897606A321;
	Mon,  9 Nov 2026 19:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4897606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cqsEDRUk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794252132; x=1825788132;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=t4wXTn2ugKx3hUujkINoDAz/xOcfs2w446SzMahICK8=;
  b=cqsEDRUkdb5RnazXRqhUS7ThtyJr4JJUC5WbWqT2htPEGLhTPnXYQFut
   EFntttNWIYiZGEDwGoPStjMNSxRJoHRobwv/HpFiH2Hvjxej088wzotv9
   V/AwgCIWjCr/38QiBWJ7Z7uTCS9xmdNraR/XilhacdL0XS+RNbJqRn9e8
   p4x7+7+S+rTzSCMsoV1im8lbiaKiAMxTxlRShCqHTwKqC5d9GXdYyv7Sj
   xkzDAHx7FB9eiC2shHrs/2X1X/yn2v9Z+bfLGR3BA0GadDcvP4oXvVGvU
   SPWmWdidVZhrLgjjef5120U14cpTE246T1aK5JI9hfL/riG6OMbTmXNGc
   g==;
X-CSE-ConnectionGUID: A9ZNHzU+QC2srvhN3W97dg==
X-CSE-MsgGUID: KWAnETvoTseK89DZJ8pc+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2981512"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2981512"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 11:22:11 -0800
X-CSE-ConnectionGUID: z04GQZkhTCa99VqumGJpAw==
X-CSE-MsgGUID: PxFS+e5/TLaV2JNSUgsMHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7768833"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 11:22:11 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 11:22:10 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 11:22:10 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 11:22:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBH7xk1+DPvq3aLC3LSCd4jfHGo1bQxRZOj5a3xJ5KhC/1rdTDN5ycXwcfaCXiX+tsA10V1JfsXCw2N2HXz5PHS6btk8r8E+LcShRZ4oC9rcv/SVYPwVVY9Jqrhzo/NQYq3bvh/o4F/L18gdQ0ZTY/FT8Abe0wJuUDCqveqQj/YBFVid88eYLz9gsLEDa5fAD37mVR8+aEAB7BCLf41QNnDO9SYF6VhkYRrkEIFYQlAvJJ3aXqRjwb8pCofivsLP0WDiUikefDn92Wo9vqpIusJFBKjUUngJhSyYoxhfl8oLdUTI8VCLfL95/QRYvfAQfpxN7/QqA19dt+UJtPjcfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJ7eUAGA5DwjF5bg91UmIpne+ip/kZiZtbCOAVU1xkg=;
 b=O9onBhES+h9N9KmNdThrNpP2PCQqYu6hBiLty6EJfN7rld+dhkGhjKnH3RQuJVeG7AZhoZKcxQJq1M4RXR5kA+d7UU/uNUGbA46+2uAz7zWeluo8lzeBGdpBQBM45UHyQLMnK8PAHbL4gT6ZJJv9Ot5ewc+CTUFE7qbbjkHYDRfnrNVPyrXFcgE/0Qmhgie1nahQrNpo5YJXEMnKwTQn9/KPmG4f4xmb+4Oyky2++yLdvP7bix9dOkjx24F6dFAQhJBToi9q8WIQUPnnsznI3uDqe05gg7rTQtATC5ktQxC5qrsfYCxlkgezTs5eDTdJv5lKAo8d9jZBQaeOezO++g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by LV2PR11MB185511.namprd11.prod.outlook.com (2603:10b6:408:414::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 19:22:07 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 19:22:07 +0000
Message-ID: <f7eb6666-049f-4739-966f-b4ba275c72df@intel.com>
Date: Mon, 9 Nov 2026 11:22:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/resctrl: Disallow monitor group rename when the
 RMID changes
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<zengheng4@huawei.com>, <ben.horgan@arm.com>, <gshan@redhat.com>,
	<jic23@kernel.org>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
References: <20261105123524.2282090-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261105123524.2282090-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0186.namprd04.prod.outlook.com
 (2603:10b6:303:86::11) To IA0PR11MB8379.namprd11.prod.outlook.com
 (2603:10b6:208:488::20)
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|LV2PR11MB185511:EE_
X-MS-Office365-Filtering-Correlation-Id: d8460f96-980e-4f33-1b06-08df3e96beba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|921020|5023799004|56012099006|11063799006|261022105027099003|261021121427099003|261021123027099003|261026121527099003|261022075727099003|261028144727099003|261009223027099003|261026140227099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4foKBM19vKjksSN2mwd2RUlzbcr2qSuH3o5gDEmjqG0i/qo03W71QKCp9gtzMaIA36ei/J9bi6DLRZX/OCzdINh3fbvcvxgHsVl/st2nXcPWOT8t5qmBTlNelIiIWo/FOevHQbTCHs9ab32S82EEfhqVEjCdvA+YRH+NrBtlx2pJUEAw29lLKH+PARSB2knO6/qiBWj+uJRJ58n7D/PuI98bI7DaN+Jh1CyYiNtwsp8FZC3f8DmDQ9mDI2ZzI+8sFnlQkrnMbe6AbtPeQvE9VqNJymSJuCupHo0fXaOg9q4VTlbpNdXoEVWzaZ0EKfvJ4mknTZhSASifdhoSxHyKpQjgGl0TIbdpm47xoHwSRh/YLJyzT/gOK3MJ5kD9OeUN25RnCw7o6bFlluUVEItz5Ya9JO3o2wD2TY/mJdzpW2vG2xS+ALogiSiNoRLBipV6I8goEDyc9v/V8WWXIBIMrsdeC8a/Pm933uk9l9Q9aVYa/cZYuadmMNX30KrT41s7jbDC/yHvcYdA/yk/6qssmjFGNXbiSq+Kf9vw5w+zCnRVuxhnUicV5WVnB/ZJM1QzHKUITD1DaphViOT0jCDRHdVrowa6wdfUWKbs6afVw9eg3RIJypOsn2xxMAU4OAxUE2dZ234ipSTrVp1cJWlUa/7M20rGL7RNN27zaJRq3Yw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(921020)(5023799004)(56012099006)(11063799006)(261022105027099003)(261021121427099003)(261021123027099003)(261026121527099003)(261022075727099003)(261028144727099003)(261009223027099003)(261026140227099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1NmcUdMUUhFNGlZTExPdDZoTlFaSEhwbzVPeVRZK3F0ZDEvd2kreWZZd2VQ?=
 =?utf-8?B?ajJab3BmcVZ1dVN3WXFCVkdOc3ZzR0lMbW8zQkpFVnNJWENwMGsrUFh4ZHhr?=
 =?utf-8?B?dWppQkN4NGNYR2F5ejF4UTJESkZ3TWZjejgxYzJDRHBBRVR1cWloWXp0Y0lQ?=
 =?utf-8?B?MHArbWErbmh3b0Z6TVhsSnB4cSswRGRCY2xNOHduenJlbjBnT1pKcnFLUllu?=
 =?utf-8?B?RExRc0NVRlRJNk1TcndCZGR4OW1GREN4djlwRmdZTUxlK3FXQmFSWll5ZmN2?=
 =?utf-8?B?U0lnd3dMaWZIcmdDVkNMd2FRZ0JxYUdhekVNbzZpMy8zNmtiMmxMdndubmNH?=
 =?utf-8?B?UWRvUTJybThKM1gyWHNtYmFDdWtnVTRhU1NlSnBLRyt6RzJEZUZzY1VPMFVa?=
 =?utf-8?B?SzFUQ0h6Si9Dekw3aThHZnZpayt4bVVZYWZ5NFd0cmVtbForOVBBM2J3Zldx?=
 =?utf-8?B?SGRDRXJpYWR6SW1ZZjhtbzc0RFVKdFV0UUNjU0ZEME9Kc25MKzN6RUs2REJW?=
 =?utf-8?B?S2pNaWxaTGNmZy9DK2hSRDlKc0ljQkxpVnJndVlvVUNBZk9ZTjh6ajJPNWFP?=
 =?utf-8?B?N3drZzl4dFU4TU4zU2xHMWgyUWc2YlhtUzZpWG9xZUR4aXUvRThjM3BEVnVW?=
 =?utf-8?B?cnB6NW1uK2Z0dEtGYjRaZHcrVUZFQjAwQkpzZDEzVm43RnpKVW5Va2w1SWZv?=
 =?utf-8?B?RU83dFNwMmJHcFF3a1pkT0V2cHB0RDlUY2dwWTVqcVN2RVZvU3gvVmFjMklE?=
 =?utf-8?B?QjBCZERnaWlySTFCckMvZHpydzVBVjRtbXpVc1ZsL2RIcmg2cVpKSFJ5TElH?=
 =?utf-8?B?cFU3N0Z2Ykt1elVzcmtyNThua1UzSGEzS282VWdLc2Nyb2lIaFRjQ2ExeHAy?=
 =?utf-8?B?YVgvdlNVR1V2TnVxRGdXaDVRcU5QV1ZlVGVvcXRMeVU5WkpaSmlmUXZocU1a?=
 =?utf-8?B?QjlKc05UZUxtT01MVm85dnNqK0dPOWtsa083NXlqVTQzVnhlU0U4RkZ5RE9N?=
 =?utf-8?B?bDEzTnhJSlF6RnpRUjRPYjlmQm95R0t3a3I2cC80SkFHUDdybzJCbDdhbzBj?=
 =?utf-8?B?NFNZMXdJUmt5REt2VCs5KzVpdDN2d1BQdFArSm1NWEpJUnE5WTFZZ2RUekpR?=
 =?utf-8?B?ZnNzSFJHMmdpd0pyMHQ0MlFtbDE3a1llbE9jQlZhOHhLK2dnNENyaUdHT0JP?=
 =?utf-8?B?TkxUc1ViQWhRSnhsdjUwQUd1UDFsdmhGVjVSV29XT1ZOeWNWY09HTS9jK2Ft?=
 =?utf-8?B?d1pKSFJPay9BdkFIMWpjYjN2cEhYT25uT0gvTTk0ZGEwamFuZE1pUVpxL0M1?=
 =?utf-8?B?UlQ5Y2dtWjVGanVmd2RKQWtaQ2J4ckVhMHhKTjNiQUorRE9NSVNUR1k1Nldo?=
 =?utf-8?B?SkpXRlo1dnQ3N2ZjRTZGdUhEeU50U0pPcUxMM1ZtYUxMcGpkcjFyREZHYzRq?=
 =?utf-8?B?VHJFM1JycmNoNHdQeVEyNWQ3Q1p4Q1RTL0tpTGV3bldqejBJWG1TRTJRZmh2?=
 =?utf-8?B?UXcxazJvUkpScDh0UkhMOWlIYWNzMnZDWmVObkhtM1lDcTN2VmIvTTJVb2N5?=
 =?utf-8?B?MXVuR0Q2Mm5ybWZGLzE4bTBjL1NzR0lYK0xvNTFXcXF3SnFhcTFkK0wzaHNn?=
 =?utf-8?B?L3dtb1VwT1o5UHQ5aGoyVWpqSFJmZFZkWTBxUC9BUFpUQmVsK0JwTnJSeWdx?=
 =?utf-8?B?TTFhQitaM3pocVBwUXNVL2M2aStUU3FJYW00S3RHZEV1N1VwU0kvK29iQ25w?=
 =?utf-8?B?cWc1amhWbUNKOTR0cmRqK1dUZWhhYWFmc3E0eitGUnNnQlAxMGhkTTIwbGpm?=
 =?utf-8?B?UzRHUFBOb0kwQllVZzZDcEgrWmpFcGlEdXB1WkRmeWxrMk0wdjR0RW9LWUFj?=
 =?utf-8?B?Rmo0WXFDeENzM1JjZkVGZXBQZzVHTmhWMTdCRHU1eXJwcFVuV25vcEFUZkRU?=
 =?utf-8?B?eDFHbHdQVnMvdTcwVTRuaXJqQ1lJbjN4WHI1Y3dLcE02NTN0b0VQeE1OSTNu?=
 =?utf-8?B?Ly9zVVVMWkpITnY5aVR0cFdxMGJtWWdhWGdHa1M0RU9PQkRZVkxkSWs2NitW?=
 =?utf-8?B?dXNIa1BCUWJaMVdsNHYvRVh3eEg3M2l3WXMzNzJWRGFpK3JNUzNwWUttakpB?=
 =?utf-8?B?UXp3OEFBQThSOG1xUEdQWTNSaGdpcXRQVDZsODNnbVJGMW0wZVJzenRDTjBu?=
 =?utf-8?B?a0dVd2VzakVRSVRuNTN0VDl4OHNhVXMweitCRCtXam5rSTM5YzcrUXVlUUdn?=
 =?utf-8?B?MUM3RXdKR3B6WDNGdVpoT2xWdER2MEJWNUxhOXpvbnlBaGVCYm5HS0dwbVVw?=
 =?utf-8?B?ZTB0ckRCTU02b3pOblhOYlJQRFhCSHZSbmhXK3U5ejRKcGFDYUhmM3NBRWMr?=
 =?utf-8?Q?y+DpFk78hsy/q/gU=3D?=
X-Exchange-RoutingPolicyChecked: Qe0NP8VtOOvpPP7ZNLocMYlyXflCgmmayRuBZTZlIoCipJ9YwInJENo1lT/9MApFoXlEsdL9WyY4ZQrsm7V8SwhQXynfrdNBFz/GkLTdnMau6wQIXJJQioO4WPgEgiscZ5LXoz7eO/tdn/sNyKxtneZHqhasKmyU3lzg/TpiHyxkP5OKJZLXKTSGYH4L+exVeh58VcA5Fum5LvYpVupXnF8YKQT3ML8Ft20/qglDET1jWGGM0qXUJJ4JtTG/mnLRkWRDqDpVujPZqXfUnrkA1NpU4BKt0UhFC6h1Yso5OPxvudbixGfrna+Erm0UZH782yXwt+syXSBcP3W+WdyH3w==
X-MS-Exchange-CrossTenant-Network-Message-Id: d8460f96-980e-4f33-1b06-08df3e96beba
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 19:22:07.7270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /HSw1sJMQUWcvOi9ioJOb37R19/aYv62zBYXPMFKmw3epyNahiIAM7IfvdR5IlB6QN7cCkcMLgSC5AX8ff01J0v5l5Dbt0iEeacmdsqTlPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB185511
X-OriginatorOrg: intel.com

Hi Jinjie,

Thank you very much for picking this fix up.

For the subject, since the RMID actually never changes, could it instead be:
	fs/resctrl: Disallow monitor group rename when the RMID index changes

On 11/5/26 4:35 AM, Jinjie Ruan wrote:
> From: Peter Newman <peternewman@google.com>
> 
> A monitor group can be renamed into the mon_groups directory of another

"renamed" -> "moved"?

(Since this patch would still support rename of MPAM monitor groups.)

> control group to move its tasks to that control group's allocation
> while keeping their monitoring data. Where the RMID is only meaningful
> together with the CLOSID, as on arm64 MPAM where the RMID is a PMG that
> extends the PARTID, this move does not work. The rename succeeds, but:
> 
> - The group's monitoring data is reset. Its counters are identified by
>   the CLOSID and RMID together, so after the move the group reads the
>   counters of the new CLOSID instead of the ones its tasks used.

Does this not also mean that the the monitor group is assigned an RMID
index that is never allocated to it? Sounds like this would cause issues
when the monitor group is removed and resctrl tries to free that RMID.

> 
> - The tasks are not moved. mongrp_reparent() sets the new parent and
>   CLOSID of the group before rdt_move_group_tasks() looks for the tasks
>   to update, and the search then matches on the new CLOSID, which none
>   of the tasks carries yet. The tasks keep the old CLOSID and the old
>   control group's allocation, and the group does not count them.
> 
> The move has never worked on these systems, so rejecting it does not
> take away behavior that an existing user can rely on.

Could this snippet please instead motivate why the issues with monitor
group move are not/cannot be fixed to help explain why this reject
is needed instead?

> 
> Reject the move with -EOPNOTSUPP when it changes the RMID index of the
> group, and document the restriction in resctrl.rst. Where the RMID does
> not depend on the CLOSID, such as on x86, the move keeps the same index
> and is still allowed.


> 
> Fixes: 3e9b35823aab ("arm_mpam: resctrl: Add rmid index helpers")
> Signed-off-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.1.x

Looks like 3e9b35823aab was added in 7.1 so the range is not needed?

> Link: https://lore.kernel.org/lkml/20241205153845.394714-1-peternewman@google.com/
> Link: https://lore.kernel.org/lkml/20261031101052.1692230-1-ruanjinjie@huawei.com/

The changelog contains no references to these Link: entries? What are they for?
Looks like first is an earlier version of the patch so does not look to be needed
as part of permanent changelog related to this patch?

Please see: "Ordering of commit tags" in Documentation/process/maintainer-tip.rst
on how changelog can refer to Link: tags.

The second Link: seems to be pointing to the decision that this user space request
needs to be rejected instead of fixed. Looks like the relevant message is

	https://lore.kernel.org/lkml/3a637631-c8ec-4e26-a03c-5ac80d16fab3@arm.com/

you could use similar language as recent commit 
	7782a6a8dfc0 ("x86,fs/resctrl: Keep mbm_assign_mode in default mode at boot")

That points to the decision in a "Link:" tag and then uses text in changelog like:
	"... as decided in the thread at the Link tag." 

Above is not actually what Documentation/process/maintainer-tip.rst documents but it
is what x86 maintainer changed it to after the original commit followed
Documentation/process/maintainer-tip.rst, so I guess either may be ok.


> ---


> ---
>  Documentation/filesystems/resctrl.rst |  7 ++++---
>  fs/resctrl/rdtgroup.c                 | 13 +++++++++++++
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index b52795e03303..9ae34aace0ff 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -552,9 +552,10 @@ will automatically remove all MON groups below it.
>  Moving MON group directories to a new parent CTRL_MON group is supported
>  for the purpose of changing the resource allocations of a MON group
>  without impacting its monitoring data or assigned tasks. This operation
> -is not allowed for MON groups which monitor CPUs. No other move
> -operation is currently allowed other than simply renaming a CTRL_MON or
> -MON group.
> +is not allowed for MON groups which monitor CPUs, and fails with
> +-EOPNOTSUPP on systems where the RMID depends on the CLOSID. No other
> +move operation is currently allowed other than simply renaming a
> +CTRL_MON or MON group.

merging the discussion in 
 https://lore.kernel.org/lkml/113c13ba-e1de-44b1-9a6f-4bd94ecbd71e@arm.com/

To avoid user needing to understand the RMID dependency, how about:

---8<---
@@ -566,10 +566,10 @@ will automatically remove all MON groups below it.
 
 Moving MON group directories to a new parent CTRL_MON group is supported
 for the purpose of changing the resource allocations of a MON group
-without impacting its monitoring data or assigned tasks. This operation
-is not allowed for MON groups which monitor CPUs. No other move
-operation is currently allowed other than simply renaming a CTRL_MON or
-MON group.
+without impacting its monitoring data or assigned tasks. This operation is
+not allowed for MON groups which monitor CPUs, or when the monitoring data
+or assigned tasks would be impacted. No other move operation is currently
+allowed other than simply renaming a CTRL_MON or MON group.
 
 All groups contain the following files:
---8<---

>  
>  All groups contain the following files:
>  
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index e6b64a5c9302..3c002b711024 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -4398,6 +4398,19 @@ static int rdtgroup_rename(struct kernfs_node *kn,
>  		goto out;
>  	}
>  
> +	/*
> +	 * Moving the group changes the CLOSID. Where the RMID is only
> +	 * meaningful together with the CLOSID, the RMID index changes and the
> +	 * monitor state cannot follow the move.
> +	 */
> +	if (rdtgrp->mon.parent != new_prdtgrp && resctrl_arch_mon_capable() &&

The above two checks look unnecessary:
	"rdtgrp->mon.parent != new_prdtgrp" - this check is used to ensure that
	these systems can still just rename existing monitor groups. In this scenario
	the CLOSID will be compared against itself and the two encode() calls will
	return the same index, no?

	"resctrl_arch_mon_capable()" - earlier in function the source is required
	to be a MON group, which can only be possible if the system supports
	monitoring.

> +	    resctrl_arch_rmid_idx_encode(rdtgrp->closid, rdtgrp->mon.rmid) !=
> +	    resctrl_arch_rmid_idx_encode(new_prdtgrp->closid, rdtgrp->mon.rmid)) {
> +		rdt_last_cmd_puts("Changing parent control group not supported\n");

Could this use same terminology as resctrl.rst to help user match documented
behavior with the error message? For example,

		"Moving a MON group to a new CTRL_MON group is not supported\n"
		

> +		ret = -EOPNOTSUPP;
> +		goto out;
> +	}
> +
>  	/*
>  	 * If the MON group is monitoring CPUs, the CPUs must be assigned to the
>  	 * current parent CTRL_MON group and therefore cannot be assigned to

Reinette
