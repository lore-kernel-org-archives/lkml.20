Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EA0347FFE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047207; cv=fail; b=YQisIrabXx1ByquEvDJv/gyjUQ80xySWDUjldYEOiFRORaQhvIoUe/s4DTFsT1UVVyY9DE2pYLlm5BAs3qMdqRwrsNpCT6by8tnenj419T0XqrOBIov9okVk6m63mbdRTKtTDXthO0xk6mVrU74g6+lVxtFFV+PQb04zVpP9+8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047207; c=relaxed/simple;
	bh=Eme1h3iecH5iLmqp/FVE/BYDpgZnDvLLQv6vQ3oXL9U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uMpCU1wFpsMylLPhgRk54HrxhQGMW0SKNg0UMAJ2kNCtmQEwLWWmZ0eLVCG1Gkhai+ZT1M/m+0VHunWbyTry4fksLiYwprSIKjr59qYPqxIWUuNgWU4DIWb0PmW72MNZkPEc1rn8Tv4PYCRrnfRNYcYo2lIVRdhizE8RH5o0BLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SzgKu5RJ; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzgKu5RJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790047205; x=1821583205;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Eme1h3iecH5iLmqp/FVE/BYDpgZnDvLLQv6vQ3oXL9U=;
  b=SzgKu5RJPfuXKFTEx+OgEBMYduOYXImMITmN5ZOHNejtnvd/h8z4VtZE
   csU0tzXUXV9Mil2vU0PP1a5wvDSQIGpRWEfxHXi/R9O3dyWQhQ9D0q77Q
   X8XZ6ITaGTjS6lFyfff7yN3UBY0WuGhb8Iv7UXouma9k7e7Z0UD+wntGA
   WeBujdal2Q6AdsdVwYhlxRhfbvi3lnJC77fuC6361rW+aFZVhifDuYKgt
   fs9aU0LUROfRv52lf6JX56YOUATg9XtEnmCufYDDRUIDCXzKImt3rrQX6
   Baiuuv9U01tU6/yG48V/25Be3ej+vhsiFqNL7CFTzcfHikDBjDMuTcStF
   g==;
X-CSE-ConnectionGUID: YHpyvZgZRIefjhq0SeND9w==
X-CSE-MsgGUID: ck0RE7U5QRmwnUN08g/C6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101207209"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="101207209"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 20:20:04 -0700
X-CSE-ConnectionGUID: EDx43K3ORbq04Ma61MSdNg==
X-CSE-MsgGUID: Wa6Jclt/S02lSxEjjepmRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="4252011"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 20:20:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 20:20:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 20:20:03 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 20:20:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTjIXfUtnxjXsXMEIIKs5217Eq1x0lGxV3bx3e2SKO9OiNrJCvkRs8qvN3LryKrPETN2/MMoW0r+FQxnT+883U3lqnA2f0wrtHb9k9PBSpRhXhgDeafaIhNRmvzD4S8XztLjnRSwfGi0xRe9w+ZAlsBC73lviZnkEjKHvUn8Srdv1jVUKsw1G81BXhLPyg17/35Nbt7KrAlCj3U4DzHcnIZ5ZQhDh3up6mOvu6wZJoC6JAIumZ/TopxBzTln3Cx2Bb26zrrUNSpSXgopH8sQGf1lcyOfDxCvLdqwlvGfF0r2CG7HsgsClnmxed5iYDGSx6CT0lHpbuD4HxTzdW97Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HxsE4NCv+KKkh1rY4FDI9R9a5Wot9/AVg9MZLQfXXU=;
 b=ppz0Ke9ARjS+NkttPOslXjW+d1rhQFH13lJPDiraXMk2TcnlR3/gI7m0acfKnZ4G9kLPZZP13zYSgooNOyfSQrjTOCxxK2jfDr1d9oK+pnsQo0tS+yYkLHS/O5QS7SkPWGaQ4TRje17PsMH0oQc9OxZ22YKeX6NwSBSoWsktUYii6la+BeX7gjqOaxmdgp2z4L289MtX15uuLLhwTLzs2Kr20tq5ZTtZnqqe4pcJQzbqXRXfj0g957VXGUxZkdPNYgUji4bb5CyuRjIN45d8DBQWcQKv/4ARGrdA9/A3kB6JF4lYXyent4FFLrIiNydziEFsiQInZ+PiGBRMBRzBZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 DM6PR11MB4562.namprd11.prod.outlook.com (2603:10b6:5:2a8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.13; Tue, 22 Sep 2026 03:20:01 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 03:20:01 +0000
Message-ID: <15339c1f-cc59-4879-ba9b-9de8eac3c748@intel.com>
Date: Tue, 22 Sep 2026 11:19:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2] arm,x86,fs/resctrl: Generic schema description Proof of
 Concept
To: Reinette Chatre <reinette.chatre@intel.com>, Tony Luck
	<tony.luck@intel.com>
CC: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
	"Dave Hansen" <dave.hansen@linux.intel.com>, Peter Newman
	<peternewman@google.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dave Martin
	<Dave.Martin@arm.com>, Ben Horgan <ben.horgan@arm.com>, James Morse
	<james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, Drew Fustini
	<fustini@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>, "chen.yu@linux.dev"
	<chen.yu@linux.dev>
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
 <9e38f138-7872-445d-9a11-105f9d0fa4d0@intel.com>
 <07a79f5f-ad39-447d-b43d-01e44c7870a2@intel.com>
 <e859ba7a-d488-4c35-b0e2-fc88cdb34f29@intel.com>
 <ef14b978-1b58-446f-b07a-691422220cb8@intel.com>
 <aqdguFLXpds-FrEW@chenyu-dev>
 <da618b0e-aced-42b1-8497-61ba4b0bb973@intel.com>
 <1511a82d-4c1a-42ad-9b2e-7def751d2824@intel.com>
 <0a38668f-ce14-46c0-993d-6c2286636cb0@intel.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <0a38668f-ce14-46c0-993d-6c2286636cb0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0203.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::16) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|DM6PR11MB4562:EE_
X-MS-Office365-Filtering-Correlation-Id: ea7900de-4148-4039-fae7-08df18586322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: PzwG1Jiff4voGcgshIqI/QRs3i6vwbO6HlQ26nc20JIfnmU5O2lEDo5RblB1GpbxRRhAUsFIdcp37CEkOt9y5mE6lRaU8giTBH9PW74bkmgm/RW0HAxerWZdonn57fDI9Wa94Lokqmo2w5btWD4p6uQUHUrvVdgvNVa8lS8Wi8CbS4fQS13obkerS3P5rVymo5rIJng94hR/PpftaTlRKczx0XHwKPlfq4GsfUBWlZvSIZfu/twYHMzIVVocDt6R/YVU7Kp4Ge8mQi97VU4FtvKWUWpAX97c1Jc/D9GXNesGjnzLohk3jnqNvkATnpiAM4iBmTxSQLhOr34DEREsrK+Vodt/niVmfATRRBicT9JBGN2CIdvloX/3XgV2lTqicOPriVdxleRgfDrH9YnWpiaAITV61wcK0Fw3EhsHNEXyeUwhqZC1ZwO6Ls+efM0rxjogjd5LM1RCMqkJBHGYh9nJSJ6O6Eqy7/tF0mdG+5W5Ee+i9CpaYKffoBfddjxjjwYD7t0A9C156utH4p/269bR3CpJh3Jn2Fge3In9+oipWLxUfMQ9DLhz+TpHr6nByL1xxrMe15d6xWKzOrSYzNNfVxsnTg3Wf0sJX46wuzKYng0dDnfahHL1A7uRlukt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXRMUm1xTmlZSjRBcE11eERZUUlVV3Y0b0NwUEN2ZWN4YjYxWEJtb0wrd1Jy?=
 =?utf-8?B?c3VIZ3N5UkpOMFZCRUttMHJqTTI1dFBKTkhmeUhaNnV6NTF5Y25tMTlHTDc5?=
 =?utf-8?B?QVF3UkMvdldmc1N0b1N5WHlBaGdUajFMaWVkdThvOVp1VVlidklGZzRzbXhW?=
 =?utf-8?B?d3BjR1dmeFhiM0J0Z2JKaU44eGhVSms2aGlnclAza0NJY2EvRWhCRDNyanJ1?=
 =?utf-8?B?YlJ0ckFZWkxiSE5ncXlLV2Y1MHBCM3FTM2ZRT0JIQUF3Ym5qRlFuUXJPN2Fp?=
 =?utf-8?B?TnFqd0FIYkp0UWNBWVY2dWtMaktVaTkwM1RlRGdaaStvTnZSRFVIZnYyZkZm?=
 =?utf-8?B?N09YbEZPNjJmb3BPWGd2dHJjL2ZBbk1peTRRcmx5N1JxbXJqb3hiMkZTaFdC?=
 =?utf-8?B?QlpkQWk0NFVXTjA0Nk5vb3dVV2xocWpsWXJZMVpvd25HWXovRXRTejRjRFQy?=
 =?utf-8?B?RXhUY1diTGNQMmlyMUw2ZGVXTXVHcm9zWWdKN2xjVVdXVXZDcUdDTlhpM090?=
 =?utf-8?B?MjVvenZqeUphTFpPdjJMeG11ZzBxZjZHdERQUXk0WXhzV0pZNDU0dWNkTjVp?=
 =?utf-8?B?QTJsQ0RYLy8vRVVrNUVIYUFhcGlTVnFZZGVrMlR4VzJueUZBdGFMMTNRZmt0?=
 =?utf-8?B?Zm5UYWI0NlF4SnFwVW9naVN0cHlsUThPL0xDRDgycDRtYXhJbEk3eldOWSt5?=
 =?utf-8?B?ZUJCcmlRUWZHdFBPNGxweEdtcEdDZCt5ODVtTEhJclM4THViQVZHNGRtdzVh?=
 =?utf-8?B?SUFCc0FjY0VsOVVYbE9RTngrbTZDTVNtWjJBbm4xTHZlcGRaRHk1TkR5MXRF?=
 =?utf-8?B?LzNySTBLV3FxbGRURURLVlhTaC9mQ3Q0ZHJZVVF1NXdsYUlqQXcrVmZ3T2Ni?=
 =?utf-8?B?eE5qSVJaMjNNd3UvakJBZzhpNTRBSDNrZENFMWdTUmZDL2l0TnRtYjBNTS92?=
 =?utf-8?B?NEhpZ25tdm94ajNCTDRHLzlkVkc4aEdPNXh0em0zNkUyOUkzOVdQQTZvb2dR?=
 =?utf-8?B?UGtrT1VWT3UwbktJMmVONVpaWXRMV1N4SmxBWnZjK3kwOVkzdDdkUXpjMTh2?=
 =?utf-8?B?czZ5UGVkUUFHellEWFdTNk1yU2ZpcEFHVmhQM0g3d0pkT2V2RDFQc2pycXhl?=
 =?utf-8?B?NjVSMm1VTERCMW9zQ1REVkpHcVUvZi9KTUh6SGJ3WFM3NW1UR1JxVWIzVzg0?=
 =?utf-8?B?ZXZ5NEpKYVRBbW9KakJvemE4Myt6Tk9uWkVLYTJxYnpYTUxOQTBaUlVpVWhT?=
 =?utf-8?B?cEREWVpYMm9BaGRVUVkreVN2Q2dZaEpSaTBwU2VMenJzcll5cTBhMU1EWUh6?=
 =?utf-8?B?eHBEMElVMUhHRGhFQ0ZsK3Fxb2toSXhJSjVab3E5dmpzbUNrMmhWdEJkdm56?=
 =?utf-8?B?OXBOaVBiSkZDUG9oT0hxV1RzZ3Q0TkFYWmIvUktRbkhPUE1kVVJLYTlDZjkx?=
 =?utf-8?B?OXl2Y1ZCbGJWVE43Smg3cjBaT2lKakFMN1lCTTVJbUpPZVlPUWcwTnhUczJz?=
 =?utf-8?B?Mk1YOHJsS05ZSG4wT2FQaXdkSXZEWS9rSUtTakN5enVQRXM5OGZJTkhoQkNU?=
 =?utf-8?B?R3RkaUl1QnBuTllNMHYrN3orK2ZSZHRseC9zU0xOSlpoYW9ZbTFSV0h3dEpo?=
 =?utf-8?B?Q09iZVlNNkdkbWFYbkN1QitGMXZhcGNxRzdsUlo0NmJ1cGs2aStHRERTckY5?=
 =?utf-8?B?elRhdnEva1lQRDJJZG11LzdrbzZ6SHptRm1ubDhMZ3V1a2g1dTZ3cjZoRzdT?=
 =?utf-8?B?NFlIeExiQlZHTHNHVXpRSmZoRkNXUWFOVlpMcU95SkJPb1BhTFlZUnJxYVBU?=
 =?utf-8?B?SzBIb0VQR3RISnlKUzR2YkdqeXcyUlUrMWtXMTJVOHY4QW9vUGNXd1RPc1lw?=
 =?utf-8?B?UmUyWHFtSzN2OGN6ZnYrTWtsZytrYVJzL0l0elhkY3FaOUgwM0t5N0NScWgv?=
 =?utf-8?B?Q2FuTjRvUHRobm1jdDFkbjc3ZDJVVkFsZXNqQnRSNHEySC9JQkRRK0dLcVY0?=
 =?utf-8?B?aU1OZXBIRFZwY3FmSlpJZHE1blNycWtXSkVaM2ZpSjUzNUNjc3lxVW16elNG?=
 =?utf-8?B?aWhUN2VPbDV2anE0SUYycHpNTkFhUmlnU0ZnNGQrT3F6Z0l4RUFuWjBJTVow?=
 =?utf-8?B?dU1uNUtacGZDQmx2R0MwbHk0WDVBdFlrUGVkeEpoK3oySC9Eck0rd2tVbWdJ?=
 =?utf-8?B?WGhvc3VBSER1enVGMUJFdW1mRTJsNE9LQU9zSmw3OGw3NTNib05ydGRqNXhM?=
 =?utf-8?B?WU5YRjZNMjNHbkhqK3laVDNMazQ0ZkxHRWlEeDEzS2F1Z2l6R2hDUWpGL0JE?=
 =?utf-8?B?NmVVdnFvdXE5NE00N0pwOTZ5MGFhd0FpTHA3ZUtWT0tTWHhPUmNiZz09?=
X-Exchange-RoutingPolicyChecked: NHEtVabSriN2A3RBAVLKlWC8C0Mkf4WHeurdXGTtQpRM2tFyCong1Q67E4dZaIBPc5VqAwky0UtSaJQFXiS2mrBOq1Hjfleodn6gMdH74ah+NKT9VfNypc3SblrwJI34nrd3KMzI07bHQ4Xrv+xc6HpBNcAFqbNO8+3WtLE8CpSgxB8xtxRAuHGgeS6IQKeLcBwsLFyMDLSnaRsxo8uwQnu5XpjUPa4z1tSE1vg1vpooHzj9R1yUrSTE9s0cDe0NlPJWHC9/CmyCOMvb1VEfhGyZ+CsbiaFN4t2QHYblid5nhFxDCj3/Tx+Bn2RSJRjz1hdka7DldxUb9oT3rZbUcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ea7900de-4148-4039-fae7-08df18586322
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 03:20:01.1185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0iJkJ10YGkjH36OUIVAmX+BhN1wH+oKvgm0RxZIeCjKWK4kdfA8EMdNsZCDfSxV32ratRDYc9OHEDQtS8+pKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4562
X-OriginatorOrg: intel.com

Hi Reinette,Tony,

On 9/21/2026 11:01 PM, Reinette Chatre wrote:
> Hi Chenyu,
> 
>>>> On Mon, Aug 10, 2026 at 11:09:31AM -0700, Reinette Chatre wrote:
>>>>>
>>>>>   From user space view "legacy" is the existing percentage based MB control
>>>>> that user space has been using until now. The only way to support this "legacy"
>>>>> user interface with region-aware hardware is to use the MSR interface, no?
>>>>> User space does not care whether the hardware uses MSR or MMIO, it just uses
>>>>> the MB interface.
>>>>> That is, as you also say, until it is possible to map legacy control value to
>>>>> region-aware control value at which point the MMIO interface can be used and
>>>>> user space can continue to use the MB control without interruption.
>>>>>
>>>>
>>>> While looking at the context of control_mode under the info directory, it is
>>>> currently used only for the controller to switch between "legacy" and "native".
>>>> However, there is also an explicit requirement for the MBM to switch between
>>>> "legacy" and "native" TOGETHER with the MBA.
>>>>
>>>> According to the RDT spec 6.1.3.1 RDT Control Register for CPU Agents,
>>>> it discourages mixing legacy MSR for MBM with region aware MBA:
>>>> "It is recommended that software use Region Aware MBM when Region Aware
>>>> MBA is enabled and vice versa. Mixed mode use (e.g, legacy MSR
>>>> interfaces for MBM with Region Aware MBA or vice versa) is not
>>>> supported and may lead to inconsistent behavior"
>>>>
>>>> That is to say, I'm trying to add logic in the code so that, if control_mode
>>>> has switched, the corresponding "mode" for MBM will also be adjusted to the
>>>> same mode. The code can enable/create both legacy MBM events/sysfs and region-aware
>>>> MBM events/sysfs during bootup, and make one of them visible according to control_mode,
>>>> similar to what Babu does in PLZA when hiding a file in
>>>> https://lore.kernel.org/lkml/f7bcf19ac8113a1e3d9575739c1a6400c455ce6d.1787772750.git.babu.moger@amd.com/
>>>>
>>>> May I know whether this approach is doable?
>>> This sounds reasonable to me. Since so many changes are between current resctrl and those
>>> changes it is difficult to envision how clean such change would be. We should aim to
>>> avoid sprinkling "if ("region aware") then" checks all over the place.
>>>
>>> A switch like this will force "region aware" to support the same number of CLOS/RMID
>>> as the MSR interface. Is this a concern?
>>>
>>
>> It seems that taking the weakest link (minimum) across all sources is a pervasive
>> convention in resctrl, which can be used to avoid out-of-bounds CLOS/RMID access.
> 
> Right. My question is what is expected if a resource supports different number of
> CLOSID/RMID depending on the interface used to manage the resource? More specifically,
> resctrl can now interact with the MB resource using two interfaces: MSR and ACPI. Each
> interface separately enumerates how many CLOSID/RMID it supports. Thus, it seems possible,
> that the MB resource may support X CLOSID over MSR interface and Y CLOSID over ACPI
> interface.
> 
> resctrl exposes the per-resource CLOSID/RMID to user space and today thus needs to
> pick whether it exposes the CLOSID/RMID from MSR interface or from ACPI interface and
> that will guide how many resctrl will support during the mount. As you state resctrl
> uses the minimum.
> 
> If the user has no intention of using the interface that enforces the minimum then there
> is no way today for the user to indicate this and thus obtain benefit of all supported
> IDs.
> 
> Can it be assumed that a system that supports both MSR and ACPI interfaces will enumerate
> the same number of CLOSID and RMID on both interfaces?
> 

Yes, per inquiry with the architect team,
"Regarding Region aware/ERDT MAX RMID value: It should match to CPUID 
Global Max.
Our intent moving forward is to support a consistent RMID space across 
all features
within a given domain type."

Besides, as mentioned by Tony, the max RMID/CLOSID exposed by CPUID is 
the global
gating factor regardless of whether the MSR or MMIO interface is used:
[Section 19.18.6 Monitoring Resource RMID Association]
"software must use CPUID to query the maximum RMID supported by the 
processor. If a
value larger than the maximum RMID is written to IA32_PQR_ASSOC.RMID, a 
#GP(0) fault
will be generated."
So this min() can be used as a safeguard to protect against bogus max 
RMID/CLOSID
from the ACPI table.

thanks,
Chenyu

>> If a future platform does not support the CPUID/MSR interfaces, we can only rely on
>> the ACPI table to get the max RMID/CLOSID.
> ack.
> 
> Reinette
