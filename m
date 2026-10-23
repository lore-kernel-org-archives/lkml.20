Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792799432;
	b=SvE3dkbGJl34ffOZviIK9j5m4OyuECTJ6vtHu2ElSOijuuUjU6X+eAZSYLlOLVjNsGUo
	 fgKXOOV2fn00f6+sTVE58trmdyzNH4svAYLIr/tUUpF71Dk8jqL1CLF8LwSiHiTWyOIsZ
	 D9Kk0cuVZwnBUaKR/o37LRsAndxX/yWnKN/nWKXlTKYI31pGUtbHikL0kymq8bLti4iCq
	 zAdnCKAkgb47WSqOmcQHphnLTS4gD2Ygchh2J/TppVkLNrEo4gXLCKvLgrIh9ZnKcSDn1
	 Pf++e533xK0v5RVSCGg7TQttLgzdkCwev2kKsLgSyVCAaqEhhxDDewZ19VY08Eboipw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792799432;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
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
	bh=3e4I2iuirPGmwnqfTMeLrjEKWMHI4O6Oc8fyhsnNUH0=;
	b=xBq65XPbmdXwbAaO6xzIWjXnaBy2yGunk9dyiTwd6YOlCXveVK+KHI2P2iK0SP0RA2Zz
	 EgJVnGLdtOmTE52AgmrsYxlgVpCihczUrl5leNzXFKU29NkZ607aWRDBCfNyKRvrU2VWV
	 dC1jIOEse9wb7AJGKNSsg83g+WP6cbryPkYRbRNrJQ406mFfZEYn4BB0UMvPxG6xBh38k
	 pu3WwQxar23O3oIs2Orjg+rpwcgiKmnvis8nLKv7AOxtnltf7sNBIJrFkjDbEphJXEKtt
	 WdPhkCN37UpAS1qQ+pvQCu4VZbyah0PqWZOeq8XOqImFkz2jdagpKzNetcJ95gVDfqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e1ZpetF6;
	arc=fail smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61092606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61092606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e1ZpetF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792799430; x=1824335430;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mCXnFx2doRDscoTtXzaTxpzXGc8NsdmYZdpLIqJCw5Q=;
  b=e1ZpetF6J/ZLLl43lXAkc8/9YOym7Kk8dh5gLyZnOJub8Z0BrHmp3ygV
   zwJQBCbyyLSNW6T2uL33AC8OtthgVYb7bRUI0S7hpX7ZyfKSDbN98/sfS
   nECRd2BPLtVAmELUiUuJUBcR509X4ZVVzVEzanBevM8xj6SsXJct1m/58
   4UNW1yseyH5XiBGv+/zi3LnoB30hFnVVxaq+MYQbYsjKN4HBlsT6sSIep
   XhQpn6WxGeRbi62Do8d3dkKiI9w6LyBCkFqa5/Kq+JNqLn7Jrgj9EO8Rq
   G9mwvgrXBc1KjddvimDRNjOQc7duNn64alHgXDgLz9aq0JGB6bSwRYA7j
   g==;
X-CSE-ConnectionGUID: RF4xhNfGRSCxj9QY4U9qLw==
X-CSE-MsgGUID: 6vY9UdClR0CLQHoWvB5k4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1575583"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1575583"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 16:50:30 -0700
X-CSE-ConnectionGUID: +G7qDrDeR1axgCAuYVi1Nw==
X-CSE-MsgGUID: fH8sjQx1RV+GvmLCRN9KiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3783462"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 16:50:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 16:50:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 16:50:28 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 16:50:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LmvELdTZiUOmRHaKRH7doRZxnx3Jf0GrLNhmhnhvF5oT/aSQp2To9FAoPZn+s44zqwmQGup3I1AMNSVRsn4NntukedwVhrc06Dzp3qH5WZvatQYGEZ3WzcJHYM9Dmp2tOqeGCvIDqB24pAJZ1LFKUqMUJKHmtdJ+y+iuIbvC4GIKaMHEXa+CwO7y1EGZBB0ETHARfbvy3bZDq9yqrT1Nh6ZNmDGukDoROMlrf2QqmU1ZV/TAFVVsRbBY7gSqJVi9Q92yCVLpahiZB8d1EaKrK5sxTVRnr3WzcanflgXCktrMoFiA8ONgXR6GI+mNkOSB89G/QYL/Yo2rM8bUd5VleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3e4I2iuirPGmwnqfTMeLrjEKWMHI4O6Oc8fyhsnNUH0=;
 b=jt3lRD1H+VUE08mVJ2+D9y8jx6XgztluxPyewnBZj/ZOI5+T77AC4cLbFcCAXpGWqu0tDSACoZufQmGOt0fdbyClb0Yi7GD+fp51lj/tud2OPfLT/wqaNgRhLh22ujBNmcJKlNc3T+4mhwCgTeo6R0X7/4rfq8fdgCULl1I8IYSCVtw6TZYWCUcRr6ljTb3GXsfpZIEs2dukav/0iNvd5U3vv19qFu6zoePDgbnew1TXmcYq/lmR3QBKe11BwWD7rtwRvxqhGIaAHwmkCrDcrdTa4r0zpigLqc5yat2blMEHQuYfUDhIzdUDTrZQRDcpcwu4EpI1NvtMtwkqQw+K7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH7PR11MB5959.namprd11.prod.outlook.com (2603:10b6:510:1e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 23:50:26 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 23:50:26 +0000
Message-ID: <92ca4378-0bce-4638-826b-9ce23a1b5cb2@intel.com>
Date: Fri, 23 Oct 2026 16:50:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/12] x86/resctrl: Parse ACPI ERDT table and save CACD
 cpumask per RMD
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, Anil S Keshavamurthy
	<anil.s.keshavamurthy@intel.com>, Hongyu Ning <hongyu.ning@linux.intel.com>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <90f0d5e1139e6767ebce4ca78eca871ce48c7315.1791933001.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <90f0d5e1139e6767ebce4ca78eca871ce48c7315.1791933001.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:303:b6::27) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH7PR11MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba451d3-360f-45f7-267e-08df31606929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|10067099003|4143699003|11063799006|56012099006|5023799004|261021123027099003|261021121427099003|261022113327099003|261022075727099003|261022105027099003|261009223027099003|261021135927099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: FsMUJjfSb+GdDUduHy9h0fJOTl3AWvQNzLQYRf5BlAdlgZUHAoanwZw8KMF/sos11n1C8ZPc8SruRcv14l6nlyr6W6gZqaivlQB58ODswxFYMOFQOko6BpRXgmZ/hs2OHRQvIATNz7dAea822XvIrreLeTYwLLufmX/2eUlfEBVuJuXN+pRdopnZ5VA+zZIRrRwh3vy5xVpW/RVWGcWDYDBhf2evkxVv4CIthuyX1EtqvBSPKuH6EI3ls1vJxBw5b9Dm5yITayrCSLHo8sA1ekUVU+3w/fYgIPI66tG7+FUliTJtP1SxySF1eVdnYIIzI4KW58JiucXwuA7GWDHVXs6YWfhih/N4CqwQsQ3Md2s+BQ9y3J6H75X0bGKjGU1xBT8EZ+dkdm+Ul6bO7dNG3H3caAlmSv28clm3+sUIHO4Q3QgEjTbaGYkA79/h+9NRwdvsPOMMRYLhetbV3sx1hiysnEbFX+fw1c7IlZamRnDN+Dgt3QgiHq8LEPg2zGsOteK+70m97nvGnWvviBz6ikpPmCqED38tHp5SK4JEymXoP9AYf2UswRPQmGcT+xXayeCar5fksnM7ScKWzgAX9MD8bqGf1Y91H3XDbz3Vmi5UIZckdSJ3Xq3CaxjKrhrWipgOor5igm1LlpDiTjORKOL52uoR2S6Qb/bCa5vjJUo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(5023799004)(261021123027099003)(261021121427099003)(261022113327099003)(261022075727099003)(261022105027099003)(261009223027099003)(261021135927099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVRmZUpBNE5sZWxtc0NTRUgwZlprK3puVzdUSVRjU09wRTZDR1hQeWFsR0Vv?=
 =?utf-8?B?ejhtRmVDaWsyb1N1SjBKeGZIRkc4cEdFRnRlQjBrZ3ByNzcxeUFvNHUrSVN6?=
 =?utf-8?B?cEVRZnhzMit5R3BuTnN5OGF6bEJ4alk1ZFpnRHJyTzJ1SWZ3engrN1Z2a3gy?=
 =?utf-8?B?eXRBUTV6ZWRyK0hRYmFndE9JVUF2YjBpYzVha0p3THM2SCtjM2xaZVdaeXRC?=
 =?utf-8?B?a051bGJpYTZrZ1JsbTFuSXU5NGpac2pJeTVvYmIyK1VZMEdBS3lVWDBaSHlu?=
 =?utf-8?B?U1BaLzZ2c3NoRVg2d2ZqSlFnRlpzb2oyRG5RUEJCcTJMdzBxeFFYalJuVDUx?=
 =?utf-8?B?UkZqa3ZkTm1lWHc3d0NlZjAySjRNV3VlT0J5eTVRMTNtWFRqSm50WlZPTEQ1?=
 =?utf-8?B?Q3BGdDdrU1p2Tzh4NWpNRXF4dThLaUFWVm9wMFNDaDRZcjI3MGh1cU5UR1pY?=
 =?utf-8?B?R0srYVRIV1I3dER0M3NsK3NxUHRtTFVnRFF5QXZQN0Z1cTU0UnBaK0FYTkdK?=
 =?utf-8?B?cGF2WGpDTDIyWjkyWE5XbEh2TitIaWNnZUlkWWtEd2xxdjVKMUNaV203M3hn?=
 =?utf-8?B?V1NtNVI3dmpPTGhEVFFqTVpIQVk3WGZjZGJrQm5PLy80V1B3SFZnV3dLemJF?=
 =?utf-8?B?WjdneFNOSCtKZlNMd0FxMUZFWXlTM3pyTlFGbkgvbXFNK3BDSEhRWlpWeURQ?=
 =?utf-8?B?WVZYMHdMUkN2VlR0QWhYWTdEV016NGRrYjBWRU5FNk50ZUNHVVF3QW5ibVpH?=
 =?utf-8?B?V0dCSS9IdDUrN05NVUd3QXB0anFsWEVIcnJzUjZ0TmxWd0Iwa0lZck5CTXQ1?=
 =?utf-8?B?dmpRbjVxOHdRM0FyRDV5c0s4UVpDUVdrRmdIWnM4TmF4OUpQbys1ekxlRTcy?=
 =?utf-8?B?b2hySUxVZHF3aW05SUdqK3dFRkJ6a2dqMWx0NnlIKytaVE1TcU1rN0lycFV4?=
 =?utf-8?B?d1ZIeXhBYmgwdlpyQmJDVUNTWTF0eHZXSTdwN3hEZ3RxZE4rU0tBYmZyN2c5?=
 =?utf-8?B?VmtXcEdsQzdNZVA1N2VCcFpsd3ByRGxNazQwbHRNaVZza2pNN2o3cmNYU2d6?=
 =?utf-8?B?eGp3cTZPcitpc1ZPTzhRUXhqR0VBWlhrczV5cjNnOEFCSnNpYTQ3dkZLMHlI?=
 =?utf-8?B?cGJ6djR0RERZNTE2dFN4Wm9CSW0yK0NLNkQrSUFjVFV1SXRmK1F3eEMycXlm?=
 =?utf-8?B?NzFpY1UxaGRWbUc4czZZdWdZVUZiZzJzU0hkN1ZNV0l5YlNMNThsWGw1TFFo?=
 =?utf-8?B?Sm5Qc05EUWxONlgxalRnbUNuZW02SHd6YVNsbXhNa09lWkdiMnpYS3l5MTZI?=
 =?utf-8?B?SUMyTU8vTDJrS0ZzSlIyeXhVN2RtMXhGekFTL29uY1VybXRFR2hCdmt3UUc3?=
 =?utf-8?B?SElYVW5JNzFNUkJNQ1ZLcGNMTXJxdjA0RmpscytLQ09WelphdkNFbEV1MzNt?=
 =?utf-8?B?eDBDTDBWaUx0bXZ6RVAxMjVyajhBd0l0eE53Rk42a2FKS2h5K1VZR3hJaDZx?=
 =?utf-8?B?RG1sRzNTTGN4Ti9mdEpyejJaT1lXZitLWEoxdGJqZTVlSzROeXVVaVl2ejc0?=
 =?utf-8?B?REhUa2M3aXRpTTQ4ajRpcFlOZzhFMUp1QllNYi84UU56dFZkdFk0R05RN1g2?=
 =?utf-8?B?Y25yN3dhRkdhblpJQm5LTkx3eDg1UkNvM2dFU3VuR3M3S1dQdm54MlI4aWxV?=
 =?utf-8?B?ak5oVHVYZVllUUxxbjgxTWhtRlAzYkxxSk1RaE1oQnBsM2JqL0ZqNDNSekZH?=
 =?utf-8?B?di9NTW5YSkJUYk5IWTRkNnN6TDRuRTJzMnl5akpWdzhUelJzbHFwQmdpYksv?=
 =?utf-8?B?K0RRKzR5ZjdXenhBd0xkYk9jZzFsNkxnc29kek01Y3lBSkJiOTZ2cTRpV1dl?=
 =?utf-8?B?UU5YdEhIQyt3cCtDSWE3a2o4Nk9vak9iSjc4dVZoczlhSUFBTmt4czBYaXJk?=
 =?utf-8?B?YlU3ZEFVa0o3SjQ2UnZ5dFNsQWV3Y1pra1hRSERXS2dSR3hrbWxZU08zOHBp?=
 =?utf-8?B?Uy94eEIzMXhWcGg1NHJiVVJpWUkxTTdMMWtsVUxiMFRobkVtRVM3OUM0ZTFG?=
 =?utf-8?B?bXFUc0pnQ050SXN6SEpSNG4vRktLZ2oxbktyalQwcHZOM1BZbTJpc09kblZl?=
 =?utf-8?B?VjVpM2VycERGODdnTGY4a2RwbW9pankwYmNsanN3RUJkQWJSWG83Vi9rQW9v?=
 =?utf-8?B?c3NwekFGQ0FuQjFrRW5CSXlyNXJDV1cvQ3JRY1ZpT2M5eTRlQ1VBaEdHb0tZ?=
 =?utf-8?B?SFpSSWtLQnM2c29BSUtCZmlOQ2w0aEZXSFpQS3AxenY2dW1XekdjTnNhMCtr?=
 =?utf-8?B?NEt2N2lyTlVrS0ZNRjBydFJLVTdlYUIzSzNzV05ncExRWkx3TmQvWkZIaHBE?=
 =?utf-8?Q?5OJoBk70FOWkz5R8=3D?=
X-Exchange-RoutingPolicyChecked: EQKb3wp3coVfQ2dZuqHkV0Ak7k8oIjW84eEaWTTkXzY1W14kL3jn/9p/k1YyjKwk70+qWqZCvpOLTC0/a1flbR+xXoL1R3wTXvqZvUK6T7dwEI4N4M3He+DS0sf6SLKLcbpl7vJcOeGrRATAWmGHrhCugV4QBjcHyu+/+d8JhmT44dp2Y/0Io8q7aq64Dv0SlMfpPZLax1NHCka3QnjkYrL+mP3WNiH6fGxbRwA5yNuQ7knv7mIpXhGwIqEJmSkexFgbqtOC5lpE16lU9Tpwbof7afiAubX5hGk57JyX7IKoocEmS0Wui9wrgDWZb6/JK3WrxtSMzqFu8msVbVagIw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba451d3-360f-45f7-267e-08df31606929
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 23:50:26.1944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuVbxdEiIQ5kIr6Moux6OErstE4L/tT/1Gi+p+WvB+cERpRTxWA4bF48AXDl0eON0zQP7msCIHBcD2vAIU3qT9xm5ZWbrnE5A2mH/DuvFfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5959
X-OriginatorOrg: intel.com

Hi Chenyu,

On 10/13/26 7:58 PM, Chen Yu wrote:
> Enhanced RDT (ERDT) exposes per-domain MMIO registers that resctrl needs
> in order to read hardware monitoring counters on the upcoming MMIO-based
> path. The kernel discovers this hardware through a single per-platform
> ERDT ACPI table.
> 
> Each Resource Management Domain Description (RMDD) sub-table within the
> ERDT table represents one resource management domain (RMD). When
> RMDD_FLAG_CPU_L3_DOMAIN is set, it identifies the domain as a CPU-scoped
> L3 domain. The MMIO base of the domain's CMT counters is carried by the
> RMDD's Cache Monitoring Registers for CPU Agents Description (CMRC)

Please drop this sentency about CMRC table and CMT counters, it is unrelated
to this patch and distracting from what it aims to achieve.

> sub-table. The set of CPUs in the domain is listed by x2APIC ID in the
> CPU Agent Collection Description (CACD) sub-table.
> 
> The hierarchy of these ACPI tables is illustrated below:
> 
>   +---------------------------------------------------------------+
>   | ERDT  (one instance per platform)                             |
>   |                                                               |
>   |   +-------------------------------------------------------+   |
>   |   | RMDD #0                                               |   |
>   |   |   domain_id, max_rmid                                 |   |
>   |   |                                                       |   |
>   |   |   +-----------------------------------------------+   |   |
>   |   |   | CACD                                          |   |   |
>   |   |   |   domain_id, x2APIC ID[0], x2APIC ID[1], ...  |   |   |
>   |   |   +-----------------------------------------------+   |   |
>   |   +-------------------------------------------------------+   |
>   |   +-------------------------------------------------------+   |
>   |   | RMDD #1                                               |   |
>   |   |   ...                                                 |   |
>   |   +-------------------------------------------------------+   |
>   |   ...                                                         |
>   |   +-------------------------------------------------------+   |
>   |   | RMDD #N-1                                             |   |
>   |   +-------------------------------------------------------+   |
>   +---------------------------------------------------------------+
> 
> Walk the ERDT table's RMDD sub-tables in preparation for attaching each
> ERDT domain to a resctrl L3 domain. For each CPU-based L3 RMDD,
> ioremap its control-register region, walk its CACD entries,
> translate each x2APIC ID to a logical CPU, and record the result on the
> ERDT domain's erdt_domain_info. Record the largest RMID that is valid
> on every RMD so a later reader cannot access an RMID that is
> unsupported on some domain, and require every RMDD to advertise the
> same set of sub-table types so downstream code can rely on a uniform
> shape.
> 
> Originally-by: Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>
> Suggested-by: Tony Luck <tony.luck@intel.com>
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> ---
> Changes since v8:
> - Rename the subject from "... save CACD cpumask for RMDD domains" to
>   "... save CACD cpumask per RMD". (Reinette Chatre)
> - Rewrite the changelog to lead with the motivation, drop the duplicated
>   first paragraph, and add a diagram of the ERDT/RMDD/CACD hierarchy.
>   (Reinette Chatre)

Did I really ask for a diagram? It is nice but I think it highlights
how the various domain IDs can be confusing. The diagram shows domain_id at
two different scope which raises this importance of these values but these
domain IDs are not actually (apart from some debugging) used in this patch.

...

> diff --git a/arch/x86/kernel/cpu/resctrl/Makefile b/arch/x86/kernel/cpu/resctrl/Makefile
> index 273ddfa30836..a975c73e273e 100644
> --- a/arch/x86/kernel/cpu/resctrl/Makefile
> +++ b/arch/x86/kernel/cpu/resctrl/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_X86_CPU_RESCTRL)		+= core.o rdtgroup.o monitor.o
>  obj-$(CONFIG_X86_CPU_RESCTRL)		+= ctrlmondata.o
> +obj-$(CONFIG_X86_CPU_RESCTRL)		+= erdt.o

nit: erdt.o could just be added to the line with ctrlmondata.o?

>  obj-$(CONFIG_X86_CPU_RESCTRL_INTEL_AET)	+= intel_aet.o
>  obj-$(CONFIG_RESCTRL_FS_PSEUDO_LOCK)	+= pseudo_lock.o
>  

...

> diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> new file mode 100644
> index 000000000000..eb5e262e243a
> --- /dev/null
> +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> @@ -0,0 +1,255 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Enhanced Resource Director Technology (ERDT)
> + *
> + * Copyright (C) 2026 Intel Corporation
> + *
> + */
> +
> +#define pr_fmt(fmt)     "resctrl: ERDT: " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/overflow.h>
> +#include <linux/resctrl.h>
> +#include <linux/sizes.h>
> +
> +#include <asm/apic.h>
> +
> +#include "internal.h"
> +
> +static LIST_HEAD(domain_info_list);
> +
> +/* True when the ERDT ACPI table describes at least one domain with at least one CPU. */
> +static bool erdt_enabled;
> +
> +#define ERDT_VALID_REVISION		1
> +#define RMDD_FLAG_CPU_L3_DOMAIN		BIT(0)
> +#define ERDT_DOMAIN_ID_UNSET		-1
> +
> +/* Bitmask of valid sub-tables found in the first RMDD, used to ensure all RMDDs match. */
> +static u32 valid_subtbl_mask;
> +
> +/* Domain ID of the first RMDD that established @valid_subtbl_mask, for diagnostics. */
> +static u16 first_rmdd_domain_id;
> +
> +/*
> + * The minimal max_rmid of different domains. Using minimal is to avoid the domain with
> + * small RMID accessing an invalid RMID.

Going back and forth between minimum and maximum is confusing.
Could this comment just be simplified to "Largest RMID that is valid in every ERDT domain."?

> + */
> +static unsigned int erdt_max_rmid;
> +
> +static void __iomem *erdt_ioremap(resource_size_t base, u32 num_pages, const char *desc)
> +{
> +	void __iomem *addr;
> +	unsigned long size;
> +
> +	if (check_mul_overflow(num_pages, SZ_4K, &size))
> +		return NULL;
> +
> +	addr = ioremap(base, size);
> +	if (!addr)
> +		pr_warn(FW_BUG "Failed to map %s at phys addr %pa (size: %u pages)\n",
> +			desc, &base, num_pages);
> +
> +	return addr;
> +}
> +
> +static void erdt_iounmap_domain(struct erdt_domain_info *domain)
> +{
> +	for (int i = 0; i < ERDT_MMIO_NUM_TYPES; i++) {
> +		if (domain->base[i]) {
> +			iounmap(domain->base[i]);
> +			domain->base[i] = NULL;
> +		}
> +	}
> +}
> +
> +static void cleanup_one_domain(struct erdt_domain_info *d)
> +{
> +	erdt_iounmap_domain(d);
> +	kfree(d);
> +}
> +
> +/*
> + * Save CACD information for this RMDD:
> + * convert the x2APIC IDs to CPUs and save them in a mask.
> + */
> +static __init bool cacd_init(struct acpi_subtbl_hdr_16 *subtbl,
> +			     struct erdt_domain_info *domain_info)
> +{
> +	struct acpi_erdt_cacd *cacd = (struct acpi_erdt_cacd *)subtbl;
> +	unsigned int num_ids;
> +	int cpu;
> +
> +	if (cacd->header.length < struct_size(cacd, X2APICIDS, 1)) {
> +		pr_warn(FW_BUG "Invalid x2APIC ID CACD table\n");
> +		return false;
> +	}
> +
> +	num_ids = (cacd->header.length - sizeof(*cacd)) / sizeof(cacd->X2APICIDS[0]);
> +
> +	for (unsigned int i = 0; i < num_ids; i++) {
> +		cpu = topo_lookup_cpuid(cacd->X2APICIDS[i]);
> +		/* Skip CPUs not in the possible mask, e.g. excluded by nr_cpus= */
> +		if (cpu < 0)
> +			continue;

With this new change it is possible for cacd_init() to return "true" without
finding any matching CPUs. A "true" return would result in an ERDT domain without
any CPUs added to the domain_info_list. Should such a domain rather be skipped?

> +
> +		cpumask_set_cpu(cpu, &domain_info->cpu_mask);
> +	}
> +
> +	return true;
> +}
> +
> +static inline struct acpi_subtbl_hdr_16 *next_subtbl(struct acpi_subtbl_hdr_16 *subtbl)
> +{
> +	return (void *)subtbl + subtbl->length;
> +}
> +
> +static inline bool subtbl_valid(void *end, struct acpi_subtbl_hdr_16 *subtbl)
> +{
> +	/* Ensure the header is within bounds before dereferencing it. */
> +	if ((void *)subtbl + sizeof(*subtbl) > end)
> +		return false;
> +
> +	/* A sub-table must be at least as large as its header. */
> +	if (subtbl->length < sizeof(*subtbl))
> +		return false;
> +
> +	/* The entire sub-table (including body) must fit within the parent. */
> +	if ((void *)subtbl + subtbl->length > end)
> +		return false;
> +
> +	return true;
> +}
> +
> +static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
> +{
> +	struct acpi_erdt_rmdd *rmdd = (struct acpi_erdt_rmdd *)rmdd_hdr;
> +	struct erdt_domain_info *domain_info;
> +	struct acpi_subtbl_hdr_16 *subtbl;
> +	u32 subtbl_mask = 0;
> +
> +	if (rmdd->header.length < sizeof(*rmdd)) {
> +		pr_warn(FW_BUG "Invalid RMDD length %u bytes\n", rmdd->header.length);
> +		return false;
> +	}
> +
> +	/* Quietly ignore non-CPU-based L3 domains */
> +	if (!(rmdd->flags & RMDD_FLAG_CPU_L3_DOMAIN))
> +		return true;
> +
> +	domain_info = kzalloc_obj(*domain_info, GFP_KERNEL);
> +	if (!domain_info)
> +		return false;
> +
> +	domain_info->dom_id = ERDT_DOMAIN_ID_UNSET;
> +
> +	domain_info->base[ERDT_MMIO_RMDD_CREG] =
> +		erdt_ioremap(rmdd->creg_base, rmdd->creg_size, "RMDD ctrl base");
> +	if (!domain_info->base[ERDT_MMIO_RMDD_CREG])
> +		goto cleanup;
> +
> +	for (subtbl = (void *)rmdd + sizeof(*rmdd);
> +	     subtbl_valid((void *)rmdd + rmdd->header.length, subtbl);
> +	     subtbl = next_subtbl(subtbl)) {
> +		switch (subtbl->type) {
> +		/* An RMDD table has one or more CACD sub-table(s) */
> +		case ACPI_ERDT_TYPE_CACD:
> +			if (!cacd_init(subtbl, domain_info))
> +				goto cleanup;
> +
> +			subtbl_mask |= BIT(ACPI_ERDT_TYPE_CACD);

Should this bit be set if no valid CPUs found (in which case cacd_init()
returns true)?

> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	if (!subtbl_mask)
> +		goto cleanup;

How about a check here to ensure that the domain actually has CPUs before adding it
to the list? If so, it may be easier to map ERDT_MMIO_RMDD_CREG *after* the RMDD
has been determined to have some valid CPUs?

> +
> +	/*
> +	 * Require all RMDDs to support same set of sub-tables
> +	 */
> +	if (!valid_subtbl_mask) {
> +		valid_subtbl_mask = subtbl_mask;
> +		first_rmdd_domain_id = rmdd->domain_id;
> +	} else if (subtbl_mask != valid_subtbl_mask) {
> +		pr_warn(FW_BUG "RMDD %u sub-table set does not match the first RMDD %u\n",
> +			rmdd->domain_id, first_rmdd_domain_id);
> +		goto cleanup;
> +	}
> +
> +	if (!rmdd->max_rmid) {
> +		pr_warn(FW_BUG "Unreasonable RMDD max_rmid 0\n");
> +		goto cleanup;
> +	}
> +
> +	if (!erdt_max_rmid)
> +		erdt_max_rmid = rmdd->max_rmid;
> +	else
> +		erdt_max_rmid = min(erdt_max_rmid, rmdd->max_rmid);
> +
> +	list_add(&domain_info->entry, &domain_info_list);
> +
> +	return true;
> +
> +cleanup:
> +	cleanup_one_domain(domain_info);
> +	return false;
> +}
> +
> +void erdt_exit(void)
> +{
> +	struct erdt_domain_info *d, *tmp;
> +
> +	list_for_each_entry_safe(d, tmp, &domain_info_list, entry) {
> +		list_del(&d->entry);
> +		cleanup_one_domain(d);
> +	}
> +	erdt_enabled = false;
> +	valid_subtbl_mask = 0;
> +	first_rmdd_domain_id = 0;
> +	erdt_max_rmid = 0;

The ERDT API seems to expose these globals via helpers that resctrl can call
at any time irrespective of whether erdt_enabled is true or not. For example, 
patch #7 adds a new global erdt_scale, and makes it available via erdt_get_scale()
without any additional checks. If this is the plan then it is very important to
ensure all globals are reset here and it looks like erdt_scale is not added
to this list when it is introduced. Also please consider checking if erdt is
enabled to ensure a sane value is return from these helpers. Doing so may be
an easier pattern for contributions to follow than to subtly require a reset
here that is already missed in this series.

> +}
> +
Reinette

