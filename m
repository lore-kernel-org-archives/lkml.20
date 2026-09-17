Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EE54DDB40
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661867; cv=fail; b=hff740mU7rdAbBULF4Uob+btSHnBexnEhFUbE+JkGK2r9PDxQ9KZ7vxnz4gVwF5u34sl2oUDd4lBBP/gHchTKyJEt1j54WDXmO6QHIGAlSBKhfEJTDjBj/Pttb1TauE2WyVfGlPrYiZvd4NU5/2N0USUOUuFeDFpyjgVoy8Q3NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661867; c=relaxed/simple;
	bh=LjqoH8QSg5gYJLJGuLBdNR/2JlI7itetrIP63c/+d0s=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f2ocA5Ez5mKjiXq1u3nwCp3BxkSm4tYDGWOVsjKBL4Jqr60nOFpEpFy4v2K2yY2R+5l3aJVj23J4DghrMpBbJxdSz4wi4Trkcj9KBUWUq7+I+gulusXy6A9YVFp/oQq7VJwRTEHzQYGfxH4DWwybMIpqhnkW4UyUkq+JghmOl+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3+VZV3A; arc=fail smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3+VZV3A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789661865; x=1821197865;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LjqoH8QSg5gYJLJGuLBdNR/2JlI7itetrIP63c/+d0s=;
  b=J3+VZV3AQIwnfXaJTDHjV7YJxTvKmsV5vSIssAmn8MZcHmKGQtnuy9i8
   HV7WQX4PJPw3c4s8OPjMpcgbwVOsHUkTFxHYdAPIoweMBYnHSH9fBvjfe
   Ok1Hlm7ldo3uAecAn2m3wWkr4ZpuAf4fCMXMsjBAMWPi+8f1+meaV10YR
   B8Vo2olvnfW7Do2Mgirbvw0hqYhfwPxcJHUhW0ptTQc+uUieKWg5rF19Y
   ETD7sfCDB1BIRECS20CVv0DrBu4/Y1oFRuMLS2Z5deIsnJrDNxkRsy20M
   8QcILXNsWd95OJk1pQVMF7V7HkEmNU8TZnjNMb5ub5LcxbYU+vYOoPgyH
   g==;
X-CSE-ConnectionGUID: Xno7lwgcQ+2s/rxlgAq9Xg==
X-CSE-MsgGUID: zsVtwp3RQNyBreZAEY30ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="611830"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="611830"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 09:17:31 -0700
X-CSE-ConnectionGUID: +PosooFtQcqlfn+Z7wCCyg==
X-CSE-MsgGUID: XMeT5es0TkKeHgtTLxIrNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2088580"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 09:17:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 09:17:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 09:17:30 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 09:17:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFZmeSCVQ15Mw0OPXwuSovf4TaGBaHuDRFpMLLI77tHPy+8tDnEeqa1p+YEA2GHvNH5WByUVkAKX6xwEoOZUouyMOi3MRSaRQ2IKQPlXuUEQ47SdVP3Dnq4jsfbei+QNS+etkaeTcdbuPenfhNuiYzT+C6PSO/Se6G2uDMo+H/pl9PM2hJgNvPAndniQAPdqC7k05VlBQw0P6s3tcey3OeM4MONQdZgzuodG0DFoOLJryYQFiQPvhTBp5Ebh8soP5qjxUEmBmbXTvI/ds9dFm/uhuf8JkPF5KCaen8WL+tJMpm3SgtEFyGLfp0p78fzupXWcwL+hctQExeMGZFws0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNgb0T2h92rYGHmZ/LWDtHum8FWkMWLSzJk4+pYdhd0=;
 b=fVEVTonsglKTo6+2qoaZvUQEiR7094Kjpf/HCC6a4m5iuDSR669T/9hmWJkQF2rkEb8lOvB4JrvI1WcbRm+fAZ8yPhd2tZo4p70f0HeZBJ/ufYKpmH7w0uC8VTmt9bxfgc1kWDH2KIY41gSZeAxwTceo+kqFWUmC1lmwG8ys+RmKYGukVXc8GulbLdaNND1Ow1kGZrQZqR3b5EnetDZy5xWgRgyVc701MAecKoopC0/WC+XeAfQsHNBraXXpFbccgCauYm8zT+xsVdz6v5dKBsQSdTkQreVxj+HG3VDSVj2IozJZi3g9K/QTlzIQiZmJU/+nhevsvGiDSMkx6a5zNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by LV0PR11MB195454.namprd11.prod.outlook.com (2603:10b6:408:3ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 16:17:25 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 16:17:25 +0000
Message-ID: <9b2f721b-4611-42e1-b903-aa0dd37edd48@intel.com>
Date: Thu, 17 Sep 2026 09:17:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] fs/resctrl: Avoid extra call to strlen() in
 schemata_list_add()
To: Borislav Petkov <bp@alien8.de>
CC: Dmitry Antipov <dmantipov@yandex.ru>, <x86@kernel.org>, Tony Luck
	<tony.luck@intel.com>, Dave Martin <Dave.Martin@arm.com>, James Morse
	<james.morse@arm.com>, Babu Moger <babu.moger@amd.com>,
	<linux-kernel@vger.kernel.org>
References: <20260821081128.19242-1-dmantipov@yandex.ru>
 <f7a73d18-25a4-4711-9d18-8b87eb9af7d3@intel.com>
 <20260917155443.GAaqwNQxslErNUtUNk@fat_crate.local>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260917155443.GAaqwNQxslErNUtUNk@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0234.namprd03.prod.outlook.com
 (2603:10b6:303:b9::29) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|LV0PR11MB195454:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd9c1a5-1b95-4ec3-351f-08df14d72927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kLKE/uxudUndDTpMisbS9Rts+QbpXAFbsrgJENg3hv2A1X4msEOWhbz1f20fLGrs0DoUwRghjo6YOme+f4eroQTBkVbtHcxhmK6b0fnQis3VVjme/gF3Nxns7J3WP3mV/iM5AbhQn+VeTE1n5RE4SzWwfxvbpQzLBeMscZPyACv2uMsv2/ubwBNAD8I4RLBi+ttrQbuFWuOUFSTjrjwZ8AD97aDg3fD8uU2jj2k91B4ci1E/aGOs8GueY1Jylz84g7tylMM8hmhnZTXhI8wP76yzWJRB2c0t5g0/x2NiW5YnyV5MBOiCwX5o9tG0Z6J5/YUulFz/0WvddADEaEeuVqjO9qS7kTBSq2U01CircMOaYPo01/E/wGh9VNtQkhyyMwg3YeuEXWah+uTdZeVQEOOPF3HIvwDUedbTb5tpjppWN6Y71aBjbrVqWH2EApXJgcCBmlgvJ6g8LZj611g3f6+pfIHePKJlO5HXxsB0mSnxOqniOY0ohunRofPROelUK5tpqtYaYlmp3IcPZrWIt0kSbjdvOoVHs4RfD1uveS3zsQTCONCZiLOt4rFQfBOyQzvGtRjASEmBK1ri9LYorJSX+1qZAeH/SuwE5/YB0kc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1VML3c0THlPSVQrNXQrSlNPUXRUNys4ai9uRURmZ1ZmQk1NS2dFaUJ4UFVG?=
 =?utf-8?B?U0l2a0hJSXZTRGZURk82T1RXRHpwVTF0Y0dZNGxDQmZXQ0ZnNGxGbXJNOVhj?=
 =?utf-8?B?WVdhbTJlKzQxL3N6dVBmdlltc21kL2Fad1ZqQmxVanduZEJOREZiNTI3SFVv?=
 =?utf-8?B?R1VDZDJKYXdYZVA3dDRqQ2xRTFlSSHhpWUI1RXo2TXIwQ3dKZjc0NU1VUUVT?=
 =?utf-8?B?dDl3RkZxZ2VicCtEKzFvN29yQlNkdmo2TW5TSWNKYkhEazJ0eGZWU0wzWEJ3?=
 =?utf-8?B?Z2YxL3haYkhjVEE1aW5vWXloRWl4Qkc1QUpzZjJvNDV3QVlUYVRZVEttbXdF?=
 =?utf-8?B?K2dzL0lSUHkzM0dCbWovRlNGdjdNc1FRenQ4a1VXc1FtMkRBRnNEbWVJRk5F?=
 =?utf-8?B?SGE3ejNLYUJNclFnVjFobWRwUTVtdFpzZHB2VXpmRm1KOTljSkNTUWhDU0lX?=
 =?utf-8?B?bVpDekkxQWpXeFY3NDdWYWVuZ24zMmZTemw4L2RQR3haZ05kdHpoS1JXb1Mx?=
 =?utf-8?B?VkZHTkVvYytsRkRqaUl5a2pYTlBRNEJUK2l6Z2ZXTHhVUk9IT2xmOGdZTVQy?=
 =?utf-8?B?cndrZ1d1WEhxTThhMzQrNDcwOUJGMnRLNUdBMHMwVk40VGV2QXAxclZVVThE?=
 =?utf-8?B?VDlEN3pKNm95QXZGelBUTzNtYjZxQ1JoYTVrSVlxREtiNXA0WGsyQUJQdUtr?=
 =?utf-8?B?am02aEVuYTdsVG9PK3lER2g2T0lUbGJHdndZY3NJOWZ3eEF0V2sxMTB2dDZa?=
 =?utf-8?B?UjMybnFkdS9PckduZkQ5ak95MkRRMWVMM1BaN0JEQ2xtQ0VyVWhEM3ZBQ2gr?=
 =?utf-8?B?VjJkcU5DZU51SzVZREUvS0pHT2dFTWRYcCt5NXVhZFM0RElNdlBJWFA3dHFr?=
 =?utf-8?B?VHUybEdpeUlKb0pieVZraWhBSUhCNkFtNldvL2VyNTkxK0xyS2k5TmN3d0ZW?=
 =?utf-8?B?b1NMc0hKOTRlbHFxbC93azdqOWQxejJ6R0hWVDF6dEQzdW9UTlZlNUFSSFBH?=
 =?utf-8?B?bktTK1N4ZnM0TnpIUnVJMm5sbHM2clJscE5MR21ndlFrT1dMd1hkNERKOVV1?=
 =?utf-8?B?SUxwZ2NzdmZNL3cxTFk3b2NLRHcwTDkyc1MvUzRicFNxajdGYjZ2eSsra0lo?=
 =?utf-8?B?R21DekpJRG5yQTNrdXlpMTJJZDJqaTZuMmkwc2t2anBxSmIxOUJtVUpYV3dh?=
 =?utf-8?B?YnZQNDEzZWYzTlp6WnN1bnloOENSalZRYldObEcxNXMzbkRudUdQbGEzRmIv?=
 =?utf-8?B?UUU0WTZjNzFkbmxlWnEwTys0RlZMc2ZOelI0amdRWi8rRkRKNzZqSGYwRDk3?=
 =?utf-8?B?dWVvRm40Y1NjMVZjbVQ1eC9ISDBGQ09TUXZYeUVld1FrcWZ1QXNRYlFCYzRW?=
 =?utf-8?B?YnVSOHlvbWozTUw5amxOUzAxbDM4SjRFM244cU5LeVFpdGU2S0VDa3BtU2JU?=
 =?utf-8?B?UytRdW9mRTdrL0F0MzJtTkRqcDdGbW1MUEZWR3ppVlBNc3FsSjVGUUxLY2t4?=
 =?utf-8?B?UDZTeDV0d1FKRWR6bm5BVGlwVWUxcUNVN29BbUlHakpHc0Z2TVdKN1hyVzZD?=
 =?utf-8?B?dWpQK0VURk1rNHdFR0JPMWVKVlU3S0ZJYVNhL3BGMXBOTWRaQ2J3Q0VlK0dy?=
 =?utf-8?B?WnZEdXNheSt6MXZVZ0NIMGFlalZ6dm5sQnhYRFE1c2gwMXhmY1NLUUJ1QUlN?=
 =?utf-8?B?bzJ3ZFFibk1Way9sTzlPaTVZNTY4aWZzNG9CdDdYT3ZLcHBSRmdMUXJheFk1?=
 =?utf-8?B?UFh2dUg2dlJMYU9rRnIzOGxoTWhRMktWZ1dtcVZ6Uk9Zdk42UDEzWGlJYytr?=
 =?utf-8?B?eHErSGw5R3A4QzdOTHJ5bFFzK21WSjRDSkZhMHd6SndLNmNIRjJ6b2R6QnRT?=
 =?utf-8?B?OGR0Q3hSRi9aZHM0MWo1dlNDYzREY1hZNWdpQ1JLeURYVHVmNldqaFp0ajls?=
 =?utf-8?B?N1NJQkpCUDliZ1owOUdLSWdkQ0w2VlhzRkpuN0FsazR6OGMwelU3MG9TQlRu?=
 =?utf-8?B?QUNzRkptbzhpY05HVVdEQVVZTkJWcEJjS2hPQVFwZkF2bC8yT1E0VVpPbVRv?=
 =?utf-8?B?Z2VmcnFoRmRMWnowbEYyUis3SGlZdWdBcUg0NVFWeExPTUJuZzUvU0x1b3pi?=
 =?utf-8?B?WVhLbVRadzBqSTFjbGpNK3NnOStDRXJzZTd5ZS9rcXplUllCc1M0czVDYm8x?=
 =?utf-8?B?TFdPaFY0V1Btc0hjb1hZNk1veDd1MXQ0dWZoMGwweGJKbzZUMVRUL1kxSitC?=
 =?utf-8?B?ZE1LTStwMTl4Y2VESDk1NUpSZlE4YkdNYXZ3QTdhUjBtb1RuUlI3Z2pSakxB?=
 =?utf-8?B?bGlIMjJ3empndUVKTXZ1akhzZndUU2ZVallaQzl6YjhwQitkQkZKdCtLMlhu?=
 =?utf-8?Q?2uc81rmumxxNkRCM=3D?=
X-Exchange-RoutingPolicyChecked: 5WVe32AkB+H50bzsf4xQ1owZZFYDLDTEWnphvN3czK22jvUl7kswF2wewA9az20pweaq/xwXTRc6BSZmEokJWLe5/R51OU+7h8I8G7sdD0zaDq94zh/fLLgfaALFImlht7vnK8SQoeg2zUy8tMBKlfnSBqdewspwqdDkEzDKIuEfgkg6OnhaoQ2F0K4QulnRJkqlfgvevAXF4opHhZeV3AEmVadfxyiOTouvwrOeUqmq+ePHDMtHRfZ5K2NcLNPD3RJygWAHQBBncLwodfLKeiFlWe0Bu7jkqqMHkZtf4vGFkbhbLJe75qqr736FssQKRsh3oNSHG2XbJjx0UEO2JA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd9c1a5-1b95-4ec3-351f-08df14d72927
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 16:17:25.2764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCcvgcxVrLzcZjkoUd9DEOHi+6wexKv1VWtw6MAtT+VHeSKYGaWn5JTfEb/NgDk8ONf3S49WJc3ck8s0WbjOE8rHy8RnP+U6I14XEoMDO8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB195454
X-OriginatorOrg: intel.com

Hi Boris,

On 9/17/26 8:54 AM, Borislav Petkov wrote:
> On Thu, Sep 03, 2026 at 08:42:47AM -0700, Reinette Chatre wrote:
>> Dear x86 maintainers,
>>
>> Could you please consider both cleanups in this series for inclusion?
> 
> I see Sashiko is complaining about two pre-existing issues:
> 
> https://sashiko.dev/#/patchset/20260821081128.19242-1-dmantipov%40yandex.ru
> 

These same pseudo-locking related issues were reported by Sashiko during a previous
resctrl submission:

	https://sashiko.dev/#/patchset/20260515193944.15114-1-tony.luck%40intel.com

There was an effort to address these issues, latest attempt can be seen at: 

	https://lore.kernel.org/lkml/cover.1779476724.git.reinette.chatre@intel.com/

These attempts at fixes just exposed more corner cases related to pseudo-locking, for example:

	https://lore.kernel.org/all/e40a924f-5398-43bd-821a-2ff9873c5a4c@intel.com/

All of these issues are related to intricate races that could be triggered by user space stress
of the pseudo-locking files that is only possible on very specific ten-year old hardware.
Since such usage is contrary to the pseudo-locking usage model which requires care by default
I decided to drop that work.

Reinette
