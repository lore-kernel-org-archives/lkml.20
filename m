Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29262DECC2;
	Wed, 14 Oct 2026 08:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965206; cv=fail; b=UepHKLxcVFGHGt7Ss4VDALed1GiJUcRR01RGI7+pF0CMXEzwbomKGE02mRwWeZ7tXZ9jTYYKxVNmP1Y6+bStGvwikdUFaTkzXP/JLLLsmlwZUjJglCRu9pRwyLW4PfC6R2Tqda6xHHxv/JfQmv5j6EaJl4Ue1m9ySjcb9MQ7oUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965206; c=relaxed/simple;
	bh=6aenGj6TeB9uphh9BWMIQJPBzokvWgVm0kbCnZsotzE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oGRm8TgP4shYUzYaZyEpSDPTxOicS7Re1+VaeAVGIQLK/RGr+L7uB7QSVJXgZ55YOO5cJKqb64/ECoYelXi0n3oracKsMf+IBsv4Q9g9Q3p303sq8QHEKb3WjYxM44nQS2kR0msmwn42ZVTTEzOoeBGHrlaAdex4jjw9HLXGaiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OmeqMk2R; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OmeqMk2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791965205; x=1823501205;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6aenGj6TeB9uphh9BWMIQJPBzokvWgVm0kbCnZsotzE=;
  b=OmeqMk2RvL6wCymmuv1JmoJrAGqgUj/Og1dOOTHfp6h0Tkh0CZfh/7G9
   MVSHXd8DUJt8BZGlOOoINj5vh5ULWa1uvLjlZHxkKx76NJrye4LMYOz9M
   U2S5IxV5gKMBjJCdN2xS7EH9kevuwrzunkkAEAI988XYvpm67XTo7gmov
   2thGLsti6Sfqqf/f5s27UHPlTfrHvTM1ldPdfZy2bto2XhLGzXD+8yM7c
   0JvmRJnKbkL0gOwhUgYZvXcfg5/GCiVsA/XnhwISRowOwXiJbrp4INvZE
   yTa4npCY/PypACxZJvPWnQHG6nasiWYg1IbF7gTPHlsK6tmbRfH/28mLy
   g==;
X-CSE-ConnectionGUID: gnaE5azuSmSJEWP1lkA+oA==
X-CSE-MsgGUID: f1JQ93OkQi2aQNPycBs5Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="588810"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="588810"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 01:06:44 -0700
X-CSE-ConnectionGUID: +KX1MlL3Rei97wLLhDfQyQ==
X-CSE-MsgGUID: viE01bpQQsiEvR2lJkhx0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1469107"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 01:06:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 01:06:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 01:06:43 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 01:06:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4Rx51hqoMfT8CwuhxV3+DdZSWAr1WUkrl+4KvnPs3BzSk8NL/WZkBgk4UnqSuZh/bfVI4MfBuaUcWfWudhfhnYGZ3fmIpzYgn8KKsgZbnKmOZBBFiWm0njYJFuIBIZdhHg7IAuSeHH2MIwh+HALdEcMQJcqLcs3hK+KMnsKARUOCLUSzweu06j6CrXNphUUYpdNzy9dY32SqEpSl1ggixJs3mqKNE3MhmiIRRVNNhk3hTINNVVN4nt7Z424aMn29sVLtW/h2P6lArhYbXL5CZYyQqnAeZTqUjOyc04UFILXZnbsfUXiYVf0H2Kflt1YN5piA1OmzaKhTp+BwogZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVoPaSGnVmasDWjE8aF3VjIRPl2WdjbMmJrUMOVPZ3c=;
 b=MlDsIKNdrsF/txTxn+EcNulZLO1XJ9nvY+mYtJ5+x/QnkCXddiND0UdWDi8utxz9cT5AF6ZfmviV8taK/wjaOUJsh/DthCFEZe5nyVM6UVOV7UOZz4WiwWQCWS2Dd+MBhL+pdS4aD+thKcZGcVIagCaedIhhtpl1RH8+WOvtEobz4ROaQywxe9SKKHKYYqUQtde9At+tzrtJ+hEVtA34yMAyYCazn8KcpbxXx8FDCBDUQCAmL7YvXzBURKs3/AtxigilYhd7XOo1gHEiPazr5s5Fs4wusZplTGAKXv9q9JB5W2VS5YmSdA13CA1v21Rg3E1mo0jM7RxVunXTpHuRZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by MW4PR11MB6811.namprd11.prod.outlook.com (2603:10b6:303:208::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 08:06:39 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 08:06:39 +0000
Message-ID: <eb66c781-0c7f-4e37-bde7-658355f87428@intel.com>
Date: Wed, 14 Oct 2026 10:06:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] ASoC: core: Create new components in sane state
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Mark Brown <broonie@kernel.org>, <linux-sound@vger.kernel.org>,
	<tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<linux-kernel@vger.kernel.org>
References: <20261007133353.455185-1-cezary.rojewski@intel.com>
 <87pkxexyr6.wl-kuninori.morimoto.gx@renesas.com>
 <ed059f1e-2390-4e1d-bd1a-cff08a3441ad@sirena.org.uk>
 <40696247-e763-40d8-9d4e-338047cdd4fe@intel.com>
 <875wz5yo67.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <875wz5yo67.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0010.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34f::11) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|MW4PR11MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: 968130ca-021c-4daf-db1f-08df29ca1348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|261009223027099003|4143699003|22082099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: VOQvl5l/9WfUNPG6q6+bV8Llov1dH9Mi6YklF1dDD5x4FzNt5PGUuHliiH5TG0ckU7XxElXdPObNq7wTAXan5/a+3Qc769T2U9jMKL97k8l8KlCp2e90mFu/khB+cJ/pLNh/N8QL0pdvFyBEmy2jED3DMgBoYwNJhH6KdQPlyVpwIRNVqt1xHT/hCJraHrIGENG+6NSyjEv39D5yXxZqTzgA8O7pYHyucdvojiCVpn4Jb9qqnEmGkrEci+StzEqTYZDncUh8nGYPPKsIsyagfLEDR/iDH75Oovxk3uXUAtdUCoD6khNWZbQHgF8U8ks+q07nEL6P7RT1hetUwq2r094aoMdRzGTTKup7pJYYon2Ys4CI0xiQPTO/Ytsm4o/g7Z3JDEXdQEYi9sbFH8FAH2f/rhhHvnNsxi+aqUSH+BKMQP7rvI75jSfhNfp4EacWl+mN5OVcae5R2Xvf7dNaOeD4LTOL2cIgMS36V8FD+l/C57DzRF11P6sVh3/nQILYnkn+oEiNZItdfrYWMzxku3vxcbg6EmuTS6CegZAanaguOTNnvQUlq20bySOQh1tSUkVZuotiSRAP+BhscbZHDQiFNZAulYyENKY7yt239p2bhyrRRAyKbiz7RgsWQ+aDTS2bQGaDtAfunal/34+TBWES1pb7ZtpOFvl+PR6GxGk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(261009223027099003)(4143699003)(22082099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG9JaDgxUjlNSGszd1BYd1B2QS9UNUh3ak82dTZLT0N0dXhUdHgvSzBxK1pS?=
 =?utf-8?B?bm1TTm9veHc5WkpJSW95djI0MXNEQ1hHODZLMlI5YlZ3YVpiNHRMNWRnekYx?=
 =?utf-8?B?dnlzK0pFOC9TQ1RQME1oTjh5dzRuVUx6OUtvS1VvbXg5Y0RtNTNyajBEMHV4?=
 =?utf-8?B?am5IVWVwV2xDSTErWUlPY2hOQVZUd0t6bEVDVy9BaElkSlBLTjBycmZzVEox?=
 =?utf-8?B?VFUzeXgrQ2dIaW5wVWhiODZXZDdqYlAzdjhsTTFvS2Eyajc4RWNoZXE3emhm?=
 =?utf-8?B?emF0eFFET3pVbGpzcGVQcnRvYnlPNWJwb0dONXA0azdNazd4K256Wm5SUDRm?=
 =?utf-8?B?VVRGeCszOHgxZy9keGZuUCtVNHVNZU1YUjRlV0NvbXY3N2xPaTJ3Q2Q1emhm?=
 =?utf-8?B?UEt1WVYyQmYxMmE5cU40aGt1WENvL1RIdlVHakY2cEJBUXVqckJVTXIyRXBo?=
 =?utf-8?B?bHFGN1RGNEgzVjVjbmZJditnR3gxWHZnOXVNQ2hrcFp3dmpHTDJabWFncVBH?=
 =?utf-8?B?NGRvaEZ2MWJXbG54RTBFWmIrVWcrdTJkK3dldklnc2xmT2sxc1NqRU5RNjBo?=
 =?utf-8?B?U2E5VExZWkthSmtIWmNhZlU3VDNhZWN0aTAyQVVwRzNYYzRZUFdxZ3JzVzRM?=
 =?utf-8?B?ejZCNXI2Y0pRRkQ4bnRWckFnSi9ZMHlvODdiTndGLzBVM1BpOWhOQ1lTSW05?=
 =?utf-8?B?Qko4ODJrQnZEellJQjY5RmpqWGpZRlBSRE1ZT2JVM0dCaVU1Q1MvTCtuMk9Q?=
 =?utf-8?B?SjI2ODN6cTlTM0lpd24yclpxOWk0R0ovMUZIQ2xNMHZabVo2UHJsbm1MSy9s?=
 =?utf-8?B?U2tVRERIR3B1UDhvOUpvSlFudEpMSUd6STNxZWxEaHdlT3JEK01BQi9OS1pQ?=
 =?utf-8?B?cXVrdkhXZXJYcnk1Z3ZmbnYxVTN1OEExR0laQW05OXEzYmF2cGRDZk44dkds?=
 =?utf-8?B?S2tUdXJaK2I0aHQ1LzIxNHVLL0JZQWU3cVRVcEszNjNLQkovQjdyWkYwUVFk?=
 =?utf-8?B?b2NYTS9zckVYbzRTS2V2SXM4TTZIVG52RXFGRzFxOFJsbUp0RWVwRytOc0Zx?=
 =?utf-8?B?d3g4TTNWTGp2NE9MZnd5MllLQjVzcG1GcDNsSEs5aDl1SjdQREt2TkE5aXg1?=
 =?utf-8?B?U1pIN0pwUEdCdE1JWXpsNFNMQ1haY21pS0h0NXpXay9VMHM3bmQrbHA5emVr?=
 =?utf-8?B?Z0hRTmFZb3RQcWJ0OUd0NkJybmVSMzJ0TmNxMndJMElhd21qSU5YYTZFaEo2?=
 =?utf-8?B?OGFTWmFKVVdKNWJUbkIvS3RWK0VPRDE5NE5LRURlWHdDUnU5MU1qY240dFdp?=
 =?utf-8?B?RnNVQzV3K0tHMDNYRllRV2E4UzlMQ0hjRmVGQ0JrbFcxLzRrK0VpZEhyaitC?=
 =?utf-8?B?NEphdnhoanBYT3BhL0RDcVpYNlpPZTVsNm1kcHdGWTFhdHB4UlNpS3JOZ1lj?=
 =?utf-8?B?Z3VOUEJPdXZRUGRObmluSVIxemNsQjFBMk1FTTNNeERleWQ4cFZXUU5FS1ha?=
 =?utf-8?B?a1kxS2swbUNNQ0Nlcm9peVRrR09ldjFic3dMSTlNVkp0Z0ZXb2VnYmVJTWJu?=
 =?utf-8?B?TUxTM1V2eXllRjVkcnRDaWU4SHJaVTBBTHdJNkhNM2VwZUs2bWM3cXhjcHJH?=
 =?utf-8?B?dEdQRFBjVi9NSGVBZ3k3TkxFemJmMXhsTXdxeTBQTnRDS1d5Qnh3N21nQWc3?=
 =?utf-8?B?NkJLbzQ4ZGJIakhnNG8vRUMxbTRhQnZPaDk4dTltWFNmSEIzdEhXTjIxL0Z4?=
 =?utf-8?B?L2dwOGJEQTdKY0FHUGgrL1U1Q1U0Vk9EdzVFWDJ2YVMwTFl6dlh5ekg2TzlW?=
 =?utf-8?B?TW5VUldUTDFSZXo1K2JhRG92N3hNbU5Bc3kwUDlnN0QwbTFGbXZwZmwwT05G?=
 =?utf-8?B?QjY0WThjd2NsVFdGRHB5Tm83UmFvaHlBV0llTng3eVlLMzhoRXV6Y3c3NWIy?=
 =?utf-8?B?ckI3bHQwbjNmSmRGUE9mMVVPdHZoRHo5dnI5emdqQjZMLzlNRWEydExjb1Vl?=
 =?utf-8?B?V2FmU08wNFhoT1ZjUjFUdFMxVU50Vmc5UmVmMDFhcUhYOW05R1haNHpTSVlu?=
 =?utf-8?B?MmNLM3Q0M0hlMkVaRUo3ak1tNThpaVBmekFiVUNQcFhJaVdBV3M5bnpMa0xY?=
 =?utf-8?B?ZVlKT01VazBEKzRiRHZhK2JaZUNOODNvSi9lOG9GV1Mvc1pCU0Y1aVVqRnVl?=
 =?utf-8?B?d1FyOEJ3akNsS3RxQlhTMmZpVDUzK0lQb0ZRMW51WE01Rk1hNWtuVk9sckFu?=
 =?utf-8?B?QjV0UmowVzZkTksrdkVKQ1doUnZoRjEvVzZQUExiRVIvUTBxQjVXbkR1ZnVW?=
 =?utf-8?B?bUN3NjlWZWZUVU50WEJmeVEyWUdXdytubVJ5RVhsZjdlVWpqQ1NXQ1I2VDZi?=
 =?utf-8?Q?1bs0RLgcwVEHUHTw=3D?=
X-Exchange-RoutingPolicyChecked: 370NxAqnR9wIfhpwwo6f4HeIZPWoDB7+M5ZTlwUkw0xwNtu3D2rpHhNPZhgMH165zsr4ahYyOWN82Y/bWUzlk+/0hG2kLJy7xIwAO6UqZSSF6V7pNBNlr3XXxw/hW5RALAiGk64hPVG0FdvOecbOWca/6oDl/42C3koBoFrq13CaF140Q510YodbS9OZ+LFsO8w4zF4Udi86ri2Em11WJ2QrIxzkuoN5fSzuiA2weS8RKNPj1J9I3QPbqiTAFCr3QzjgS+xGS3hFlg3+RH2ngX32ID/10NYgg+1EN0mHZYL2aSsRv/fCvM+9Rcrhj733meNAsgzXAyQkTJ3HP/3Lmw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 968130ca-021c-4daf-db1f-08df29ca1348
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 08:06:39.5940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEMRMnlua0nxY9W+K3IrwbFGlg7vI38Le5xJLNfGo4U9MfDzf8jw7C9rpMD/qWZ5B1gFq9kHmJDDic9mqpEIwTkuSq+5ekSvbKsxWxwZ2XI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6811
X-OriginatorOrg: intel.com

On 10/14/2026 5:08 AM, Kuninori Morimoto wrote:

>> At the same time, I'm here to help with any conflicts should any arise.
> 
> It seems there was no big issue/conflicts, Thank you for your help.
> But 1 concern from my side is that the function naming
> 
> We would like to keep snd_soc_component_xxx() naming.
> New ASoC has similar functions, it is very confusable.
> 
> 	snd_soc_component_register()
> 	snd_soc_register_component()
> 
> Both are for register function, and the diff is used parameter.
> So we would like to merge them by using _Generic()
> This part had conflict with my (not yet posted) patches.
> 
> I will post merge patch (by _Generic()) later.
I disagree about the naming part.  IMHO there should be a clear division
between object-level and general-level functions.

In essence if something is found within object-level scope, it should be
prefixed with the object' class name and have the object-ptr as a first
argument e.g.:

1) snd_soc_component_register(struct snd_soc_component *component)

whereas for general-level functions where the framework does everything
for the caller the arguments differ and so should the name:

2) snd_soc_register_component(<component does not start the list>)

If 2) is named in the same fashion as 1) then a user, especially ASoC
newcomer assumes component-ptr always starts the list and gets surprised
later.  Again, in my opinion we should not mangle all the names together
like if their arguments do not matter.  Happy to hear more people voice
their opinion about the subject.


Kind regards,
Czarek
