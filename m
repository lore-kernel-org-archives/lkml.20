Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC12E24DCF6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787948192; cv=fail; b=LFsJrR1wh2hjx9V4LIlDDe5S+U5lmmQVmbuOHRxEqQG6hg/M0s5pOqOAPntgzfMhMsxtSNQD/vrHrwG6e6/LyFJFjpBYgoh43DVcui7iMu7QIB1lIEQ1bnRjBG1Hr+gjlAn8AKNJmVl+GRQzJQzn0wGKgIdb5nSS5+oOlDQe5Wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787948192; c=relaxed/simple;
	bh=dopjmq5N7OgMyURvVDJ1IYGm5Ay/VM8Ul27F8CHD3Ck=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kioTTVW2/dU5YZy/A/74IayvEesEzhxPfzvIPbIJZobiqjG9oExgRl54bFDeadvHUM5TzZUxNnOCXyHf8+M6gqvuwNh0f01nU1J08AF2vw3r5QFqRu8KhunKV/GXZW4+Mc4/8DYZjgLf08Y4uku7ioTe/mypIWFxIYJNzxnZjq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsVJnplW; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsVJnplW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787948190; x=1819484190;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=dopjmq5N7OgMyURvVDJ1IYGm5Ay/VM8Ul27F8CHD3Ck=;
  b=lsVJnplWlx6GJaIF4rdqITXikw/cx1spn8He+GmJK1UE4WqEq4lZNfvS
   zZOQ6E/5seT6H7pdM9m9YhBmHewUn6tmixAQ+pujJlmRtznDt+ipgGSaK
   3/zYBLCvayJB0/hukizeL6uWhT75fhhI7gLuDvKXIcHN2CnE7ZqWRxUYv
   t4shgSz47GZmbFdxzNquP04xnQRhDVJOvAUXy3c6X/NV/zLji5kQV90QP
   jB7ihIjGYVfSWE4zusceNoB1K6DsfGPiEo4Q8h/Jpuxe24GQNSxj9LmVM
   XSxaSkWDxS90XwhjucMKrv3fZdoPfeGyxfReCmRFghDNlw13ezXbxz15U
   Q==;
X-CSE-ConnectionGUID: devx6+TzTwujf5TP7VDkTQ==
X-CSE-MsgGUID: m9XEtcbsTxSeRnqfPZccTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88384846"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="88384846"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 13:16:30 -0700
X-CSE-ConnectionGUID: Zyl+KUD1Q7ShmH/JX6nFFg==
X-CSE-MsgGUID: PGi1dqQcS7qbuVZHgT4x4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="263964454"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 13:16:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 13:16:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 13:16:28 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 13:16:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3qADuEwv1U6l+vw6LmkTYwLZodd9QHhsz/t6P7XkgXTOxT6WMXTFseIaXrLH6YFop0B7klncjR2EcavjPCnJzMmfQl5KQ6k9Qd8hfRE9oebh2SiIFfAaOkpGwjr3fqb6oWd+7ZJjJCyKaV0qOIqVgH7geM2/dabv6zp+9WAtiRilvdFbFxM62TO+XKrAsXUZtySu1xoLBFS34I/GAV8HXcq5/neT/R/8S4FdEm5DcPf0h128Eqlcfpr06720FeQ/h3swk02D87qBoJ5Jrbj2qwf9L5M6zS7R57qIE5SRDxgNcQTC1dsbYWgkLsZH3sHM1eCghDK15HBsh+E5kGLCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d33KCBYVYubxmcAAGui+H5df/VNFu4XF1vKBwnyZvjw=;
 b=v2mha+EoXnGIYsctouPXxlmQNfok81QAbePfuqHat85BH9bxFgihARgvSrDFji12bf9WpgfR3Kf60U4LYeTlI8J2ClZfTexdIVSdA7Nkd7Y8l8DAyY/55/hB4AEht5KAY5836sGw90t4auUKpvjdIc8b6eJz+caI6nWQOJdArbfaVzHIcceFz0P0uzE4mbbB59+sddonCf7yBJCidFW8RrwrzTkYpOUYDS90CS0636I455XFq9HN/imYctsbiMsyvnulWrAopV5I3w3t3rjIsO+DFeaFIItYX4C66h6sW9kFmpaUfZH0uJUsCM87aYlAgG+Qgim+o8pL1Mh7b+ukHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PPF63A6024A9.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f27) by DSVPR11MB9741.namprd11.prod.outlook.com
 (2603:10b6:8:351::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 20:16:27 +0000
Received: from DM3PPF63A6024A9.namprd11.prod.outlook.com
 ([fe80::ed8b:1455:8b29:144c]) by DM3PPF63A6024A9.namprd11.prod.outlook.com
 ([fe80::ed8b:1455:8b29:144c%7]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 20:16:27 +0000
Message-ID: <09570109-8cb8-4c43-b3fb-d1dacf68c41f@intel.com>
Date: Fri, 28 Aug 2026 22:16:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [BISECTED]: Non-working USB mouse
To: Harald Arnesen <linux@skogtun.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
References: <e31cb69a-e5ff-4870-a9ab-8a8c4e35e445@skogtun.org>
Content-Language: en-US
From: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>
In-Reply-To: <e31cb69a-e5ff-4870-a9ab-8a8c4e35e445@skogtun.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P190CA0002.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::12) To DM3PPF63A6024A9.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f27)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF63A6024A9:EE_|DSVPR11MB9741:EE_
X-MS-Office365-Filtering-Correlation-Id: ee0878c5-e5f3-4f54-d660-08df05413d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|3023799007|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: eaZOpUx1JmiQwpMewhtjfLIZV2uyqo2SGjlrR7Cysk35xr5j6rcZKyUReV36qWbHvJXZcEWXlWy1SwRiBd+O+ocQxokUEmbnrxzSSwSaWle4pIBR1uqcM+ry+gdxh8pqDRb4Xj3d0slUJapH3AVc1CtMAYBej7h9ZE3H51VvJvrF3GD3PhnBH5oAiDC9KA30BuQd1Rdqgl98x3vikr2BWoG4i4wutowoVxgwzqWpu8m6r3k1ufEOZFxnJwBAPlgAV2MYJnRSbe/ousfGmi5zJu47/xiNoZii9PT72MkGP2mL0+6wqJ1xqtj+MsREUC9d0RYzO7/KcClC351747EDNV0jlBazNx2IS7TcqixkDuZLR37GsP4uKOmIaYFVcPzVXy8rGYC3oPoaCz/BZYcw0E60rjXr22qQRXZLKpC4XzQxvMWsMf4rwifJwdsNjaH3obsuzXecC85FuRAk7J58YepCm/lHg1FK2Ki7X7XPixy0NeB9CSHJnczj95l1sQfIwW8XVOF/h8zCQLCZqJzeUlX+ya/9U0v4IlkK1b0n7Uo5mBfiRwRt6AE8aXqjw4fJUGIB9yyl3YyR4Qagw6VufRZz+bQ0sQ+8qjgty8gDWGosuIyL10e+8jogsaqLTz7g0SAA9RLd9MSMMvQk3GvEUZzjUriFAM4rnvzJzplTtKo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF63A6024A9.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXFDVzhxNnp1UDA3MXJDblV2ZG5rUkhpM2JrSkZKRnJIckpnOHBIODBWQTA5?=
 =?utf-8?B?UVJ3RFFXbVorbDd2UkZISWdZOHBvWHY2MXhvRWE5VDR4dGtQYTNvNkEvZko2?=
 =?utf-8?B?ZDVjT3FYRFVCZWFRenl2dXRqY21lRWxiZXYxMGpwZHFvZ3o0WE5EbngwZzlp?=
 =?utf-8?B?RlcxL2VUTEJiVmw2NTJ6TFZ4RGlmcTNTYnc2cVd0ZldwM1RZYXlQamhtRkh3?=
 =?utf-8?B?NldBRWR1U1IyM0IxeFhTQVdpRWJqamJYQUN6Z0FnbExSQmZZV0lLczR3c0xr?=
 =?utf-8?B?ZjZ4cnVmY3dmYXJJQVAwVXNHOTM5dlNzTW43NWhlenJYNVk0cGRYZlVMRGVR?=
 =?utf-8?B?TCt3MXBCQ3ZSTXd3RGlDNitUbHJRZmErQ2VqbklnU0xxZU9OTVM5emJYWEx2?=
 =?utf-8?B?S1cvU1F5cUNmbkZSUlNTekJyV1BnRVZOM0NnTHI5Y1ZuM01nSjVLd0phTWJR?=
 =?utf-8?B?bnRYQzByYUoxN3NaVFROTzVXbGl1UkthQTQ0S01LNXBDb2JLbllQZU90RmJ1?=
 =?utf-8?B?Q2w5L0pnUUw0V3JEMkZNVStPaWM5Mkg0N2RuU0pSMVZ6amVZWFlqdmxjLzFz?=
 =?utf-8?B?TTZRc2xBOXZiTnFBWGgyOVprcEl4cDBHYS9TbDdmYjR6YnR4eXNJcE0ybC9l?=
 =?utf-8?B?c1ZVSmRiNzQwQWM0REVHZWRYZGFDUWFxbzBMTGlkRTQ3RzdJQlJMVXVmN2R5?=
 =?utf-8?B?MFlab2J5ZHJWd2UvMUNLNGRKTVM5K1A2TkFMVHhUZjdxM2tRTXVSWEpmeVI1?=
 =?utf-8?B?YTRGaDlaVXJGVGtKdDltcVo0QmxrRHhlOGI0NTlNbkFIMXhVTUp6OGdXQ1VN?=
 =?utf-8?B?dWY2N1hGZWtsSVVzYmhUNmN5OUZlNjlJTXlJWHB6eEdCaFV0aTJGcS9peDVp?=
 =?utf-8?B?TytOVGI2UWxOaDJJTXFQTTZ6TzJTUVJGYW9SN2xCRFQrV001YUMvN0NrK04r?=
 =?utf-8?B?SmtZN1BWNTEwUVQrREJLTlQ5R0hmaUYvZHFjWFNrdEFVbWMrSkFNUjVyZm1h?=
 =?utf-8?B?UUc2VXFzMzJXSjRXRGFqZDk2N21lSXdZZ1lhNHV6S1hPUkdGZVBkNm9taUVR?=
 =?utf-8?B?Y0wyWXUrUmhyWjJSZDFkbkJpbk5SaGloZGFyblduVGNoemVkTVM3RVRuSFVL?=
 =?utf-8?B?eHhicTlCUHBWMG1mU1FFeXNYbDV2UW15eWRib3hqRmUwOG5Qc0NhcnJIS2V5?=
 =?utf-8?B?aUtvZzRuRWEvazBwMTFoRGhpeXlMbDRxSGdCV0Z6Q3hJeDVSZjFBS1FlVFZl?=
 =?utf-8?B?SUtzS1dETDZOZVF1NjJwOXlhVVpuelZTNEZ1YnNudW1qVVZXM1RKd084TFZV?=
 =?utf-8?B?NThwSjRPd2pBVE5EL0crQllkQ0Nmc2JCaDE1ZGpLd3pDZWp1MmY1d0JnU2sv?=
 =?utf-8?B?cDVoVytxMVNLZWtDSXd5bWo2bHVUUTJOemxNbEQwVy8rVW9FTmtrL0ppaHhr?=
 =?utf-8?B?MEx4NkxPR21hVStRci9BMVJEWEhGRDljL21QNnNncVZ5ZDE5QlgyYlBHbjI2?=
 =?utf-8?B?UjlGa3dDU3A1YkhRTnByUE9DemthMkdOa0VBK1h3OGRNYjhQc1lNNldEcE1o?=
 =?utf-8?B?UnMwTitZeGJpZEpWcHhEd3pOZnVBbkU1YSt1bFNSOTkrRFlkNzlzVytqVldq?=
 =?utf-8?B?NzVrZVYwQitpSkJZSVQwc0lwRXYwZTVHTEdGS3JqNEZqVXhrZGgrTWlyS29p?=
 =?utf-8?B?WW5USjZ2UmErajJxeUhCRnY3T2kza0lENjB4bzhxU2VjcENNTzJzT1E1dUpS?=
 =?utf-8?B?RmdQcENCTlg5eEp1dkIyYXc4Q2RZdGJpSE91aHBUSmd1TUY1WWQ3YnMxMFdL?=
 =?utf-8?B?UUxic0xKanhnck1aNEJBSTFtanNpdWoyR2xnSG8xRkVzYWgvZkFDbEY4a2Rs?=
 =?utf-8?B?M2RDZE8yYVVpYW5MWVVRd3FlQ0U3VHB2NENDZllUQXpaRXpZSTFZWnVaWWw5?=
 =?utf-8?B?dVZJNGI2M3hxWklaeWhudFhLODZqWmtHRENXMkk3cXQ1ZUVKZ0xpNFZZU0c0?=
 =?utf-8?B?aDl5QmNDRmcrWGx1Z3UyOGRTR0pwdlJYanJSRnhtVllHdWFzSlNEYjZnRTZG?=
 =?utf-8?B?d1RONVBtNjRDRWR0bmNpMi9uRGdML3BRelJ3K3NNeHdDdjZBa2ZNUUtMN3M5?=
 =?utf-8?B?K1NzMzY0L2dEWDlFOEhsaDZrRWxLbmwrbEZzSS9qdmtBcUs5eUtWeFZsQ3Bp?=
 =?utf-8?B?bVBsbkoreldkc3UvSEEwcGhPd29UYTdiaFZ6TzhiaGd4d0dpRXIrM2FIMytv?=
 =?utf-8?B?TURrM3d6T01iaW82elVQTkVGSVJUQTdTbjN6Wjk1QU1ka1JINlJxdkRuZWtL?=
 =?utf-8?B?enFJN1ZtMUNYTTMxTmNjU2xFMFhJNDFmUDR3SGRTbEE3ZmxqQi9yVFZXUmJl?=
 =?utf-8?Q?+8Zz2+TMSZyMtsBU=3D?=
X-Exchange-RoutingPolicyChecked: p/f4bTIqjzVQw+x4Yp87V9udYQsoKfWb4UcSTM41HkHrmlbA2mF0kSuBfjsbFTz/n3TBn64auH4RM0o7u9xUckKz//elf+EEq+YwFuyGFYQ5hRzaNOvm5ARGcKey4oX6wu0uJ/01v4HvYdw+xhNfxF/GYUZAJZbJq7c6q5KUerqFHQP/3XArKc81Khfp61IDBYOZyjrWewTe65U7jYv0eRarLtHrCLevuWKwla8wwJDE5xMDfiOtyPd/26Oua14KtFFCPOna79B6x6t5bYu+iaarku+1n/5RkfaILzHA5h4GkW6jcYgsAe6lVayDKcADal872QY2QZVSy7hB5mcVjQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0878c5-e5f3-4f54-d660-08df05413d47
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF63A6024A9.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 20:16:27.2200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1b3on6cx03IjnnO86FClA6t32pEx2/NkvCGZpVQnY/vB57KU5mPmeEEeWFZSx8uw1P6rlj+EH333DiYcj7P0CxxnGlDV5dgvL1FOpUC5QI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9741
X-OriginatorOrg: intel.com

On 8/28/2026 1:21 PM, Harald Arnesen wrote:
> My Logitech M350 USB mouse does not work with the latest kernel. 
> Pointer doesn't move, buttons do not work.
>
> Bisected to commit dc948f8b384a516ac5c471eb9382959f838e02f4
> (ACPI: scan: Defer device power initialization), which does not revert 
> cleanly.
>
> Attached is output from dmesg, lsusb and lsmod, both for good and bad 
> kernels.

That one has been reverted from the mainline already.

Thanks!


