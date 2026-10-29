Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793297774;
	b=oBWa1H01QCfkbzmcKflESorT6cdpIf7kA7MondTxBBV9sYTQYjDLJm7Dgap3BqAoHe7P
	 pTRp+L5wMOazYSlwMAHrf7HLHydpbBzTctnFNlQkwV60OC14Q7ZOcgdyfm3jPWQqwlZ5A
	 JLFIG4+cZTUE6hgMZPdq11NrQmI4dRfotM7mSn7QgsB8GySx4P4EClJzq1Hw/2IUGIAnE
	 RCPBrU+ZogLRuzHkbkh2qb9IFjELeAS/LaLzXrT5l1GniT0pOkC3XLF01xyCBzGfbp1Ci
	 BYpqePlnYAaOPOsdsW00fsmf68sUfQY89hMBN6HyWdMu0y1/iYgxjGbUVmhw22gANGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297774;
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
	bh=d4moYayTAdgXF9I/qSVTqKYpCmyCFBLGtaa4yuYZ3Pw=;
	b=a5VPh4eDvo6iJKYWRrG6SdfBvjHnbrQGwezdlSKr0pcHae4abfAeyi8OiJZlgL8IjNkm
	 AivCaPg7m7iVkj8UkJ1jbt5IA5no6e5l7RlhsxQOJJq13dgtTfYWjz0s1LeAXzTQK94zL
	 RKKO0A9BuZEXBSbrT1fBDPugxhS0TJvAWLXOwpS9qz8hQcfhUNaygFX7ykfPlbtHbqI/D
	 aBMCACW6foS2QP0UY5DybYXVEciyThFRXCitlIcW7NNDWjdopBSnVG1OIkdzW1E3BLn/L
	 75cMqtXwQkwSLjJxWwveGx6eBZzDdMuETzgI6WjXDswqbxKJ50yMc03BYhivuOp8ydg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="JY/HtZIa";
	arc=fail smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6161D606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6161D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JY/HtZIa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793297772; x=1824833772;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=2eaaQwHtUPF8IQzFY4nJl5x5i/uW/9pK3rgfwtleoRw=;
  b=JY/HtZIaajhduXhtH36TEbB5k6YC33YPH1pH0ooHPCwW23N61V9IIsKc
   WFNB+d14cX0Xq4qpSJC43kqq4ZMOsNo91XaVUWjnKzBz315sxwzBfsLUY
   0qMzbOtdd9+KmYv1lQHEmz1XVk3qrHwfohVzue2bNxo3sjJFCKz+2AgIk
   5e9VCFs4PliT8fkkyqFe+sDt2yJPpSVwzaMHKWET/sGLpCcnVjEkzAczy
   ZiDggSByuz5DtLm0ayBKl5K36Fu9mQx6cJCvF7035FCVT1o8i+n3R1bUF
   5q8/DYSKDrID7CDnbi+MstIN7R02G/Yc41aHhN9NMsmPjyjr0NqLOIsYH
   A==;
X-CSE-ConnectionGUID: tbgRuWdBSz2m2qykY+TuDA==
X-CSE-MsgGUID: dXeA3p2ITOyYa+oxRjl63A==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1964694"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1964694"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 11:16:11 -0700
X-CSE-ConnectionGUID: VgEYAInFR9qCDkDnKWSxYg==
X-CSE-MsgGUID: bxWLCgO4Qmy6RUWJedXyLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5142855"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 11:16:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 11:16:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 11:16:10 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 11:16:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcBNtQogC82YHko1WA2EH1++uLI6lF1rbpS/5Ff4Bs3X7JSEZKK67mrqU6nTVLR5t/ixRbe49IO6XvjacY2luDfRXv+z5hQXzJZEjWxGcqyunq/635Thi7BjCU6rcRv0MBY38cIyr+Nw3My9r4D399eQosM0wulXDotqdlBg4qruvhcArsVGYMU0yfmes72rXsVrfVPAJ1Y25rI6vvL+PEqbpjj0jCdSVgPGUjd2thFmaL8toXxZ7NuFhRPOFSZMAo2pJ5TO2a6i9a9z54GHlAubsMI/JweABHH3rgb6ty807lEy0insU8XWS++j2XcceFDr3jQPgwdMK5De/WZVjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4moYayTAdgXF9I/qSVTqKYpCmyCFBLGtaa4yuYZ3Pw=;
 b=jhs2PcGOmOI5hhM7nsXctW7K9SscQzT/dghzhHfivfdALcZpm5bYdeLMA6EbSuq5HBeeRJC61r7nislcJ8OjB+oceqhPwkP3YidT5MpkWtFThPQdFHre0GXd5rq/rvTYKnDAl7GQmBQiaiUtRZC9Mr+VnHTGinxil6j1f8BbXHLWBEwsb0vGyL6nJzn9tWKC/h0GpZuuFVX1A0R3pPAM/5s0+JpDSzsxF0nrFriGTABE+Q1mOelM0s8M5ZU4rrkCskVPmvZJKbOCasFUXGsYmgqERTJh3XDox+5aMbRnZGpvaKA+r71PqGIDuUJo5u0LMMDR6oYJR7TS3RPbZtWYdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by IA3PR11MB053507.namprd11.prod.outlook.com (2603:10b6:208:620::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 18:16:02 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Thu, 29 Oct 2026
 18:16:01 +0000
Message-ID: <e47f73ac-311c-4a6d-a283-aed675b95b6b@intel.com>
Date: Thu, 29 Oct 2026 11:15:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] fs/resctrl: Skip monitor context allocation when
 force-freeing RMIDs
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<bp@alien8.de>, <tan.shaopeng@fujitsu.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261029081513.924019-1-ruanjinjie@huawei.com>
 <20261029081513.924019-3-ruanjinjie@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261029081513.924019-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:303:b9::27) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|IA3PR11MB053507:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc5288d-564e-402e-ab68-08df35e8b033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261028144727099003|4143699003|5023799004|11063799006|56012099006|261009221727099003|261009221227099003|261009223027099003|261009220027099003|261026121527099003|261021121427099003|261026140227099003|261022105027099003|261022075727099003|261021123027099003|10067099003|261009223327099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: J3TEs/nmAf4UnsVodD9mmoBA6eWMIl0rqqS3HWeA01iYK0BI50+zuhD5w/WmWnezSeBP0fgfp7Rqn/lqMQ5FbEODmlzbQ4Fy7iak0SybJrzNCJQUKOf29n8b+m9r9W5flJhRoCxpPkd+47avSHCiaKsdYBQlQAxZmrz1HSJJ7pyLRFfazfvPbcVQClEMDZMdeHDbyFV5ou8T+OpMeTt+7MV0Ylmmc4hD9HI+UpcuI51XVRxgR6+UzxIRRVhv8PVZNuuXMXbDXORyfpeIs5hi05IXrTeVE1PpaIDpvtQ/0NHstjukzLJ61iX3QNcLUAnWqMJqk58zmYGPE7r2jjl8umVUIfdJxTIz39f3fChM+Jmxyb1T74FEIRy913w0ahk55tG5MMn2CazClWguAW5rxb/5Rm/Weo3jEPHPbgynf1M7V7jFc7KbVd9lMumQpbPBXAWzmARakJTBOwVX/e9GYOOShomDJHKmG3swUscmWT/ncbts0CkLTKqGOKKvTh3Wkjui/qd9aUB2dnlcz9BRl8ReQ89FixdQpjVbNe9yBFxlYXAddDeKPYK7cdwYec+MqaHH1NHyzorjSFG0cMbDBz9x5wHh/lhUSSbHYxxfbyBKoFFMtdv0RDsT7YWnjipAKncCPEAmJkkN0U/lQ9EHXtpt4JkwNH7R9d3ALCTU4KI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261028144727099003)(4143699003)(5023799004)(11063799006)(56012099006)(261009221727099003)(261009221227099003)(261009223027099003)(261009220027099003)(261026121527099003)(261021121427099003)(261026140227099003)(261022105027099003)(261022075727099003)(261021123027099003)(10067099003)(261009223327099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um9EMm9zbDF1VUE2UWFEOTB3OGVPZ1d4dGJ3Y2lNL1Y5RVNrTG9DYmlOZDNm?=
 =?utf-8?B?bzI3SEJpRzdOdEcycm9OcHpOR3VFNUhEZ0loa1F0YjRlNHdacWZXbnBDWGha?=
 =?utf-8?B?RWVWR1ExeTk4UUJuelNMVzU3RC83SHpMSzJwVU8xbWh3RHBXYm41SGY1d2tY?=
 =?utf-8?B?NXByWWxPWGN4aFVyRnFsYUVFcDBYTElLWWRoaWsvYkNwWHBtWHBFY1JCeWFz?=
 =?utf-8?B?OUhML0FkOHpZMS9pcTN0dGRGamcxY2UzVUUxL0lqbFgxTmpoV3hKUkI4alk1?=
 =?utf-8?B?eE00UnE1bjZheWFEY0tZMFhBVGgyd29OcGMvZCt5RnhrWVpnNWZndWd5STV2?=
 =?utf-8?B?SGNnK2xsMzRteDl5WnFFMWxNOHNleSt4b09qOGtYRVJGQmpHTzZrU1h3QTcv?=
 =?utf-8?B?QlUrd2xGM0pHM0VRVTBkSENCR0ZSU2dvU1RqVTBuZS9nWmtKV1RXeWxqWnR1?=
 =?utf-8?B?MytGWXZTRGhuMTN0OXEvUFA0VU9WUHRDTStxc3JxUWFxbEVuc3k0SnBTYUt3?=
 =?utf-8?B?c2x4a0t5bGVMQkFHcEVmUGlneXAyeXBYdzgzNU9Eamt1ZlRNUmpUb0RCd0du?=
 =?utf-8?B?MndNS3JVWTZ1VlhKNldSa1NKZE1xTDlDbDlxNVBVRlArOERySHdqME01WGl6?=
 =?utf-8?B?TUNsOGorR2cxNjBaVEhHejFjMGNIdEE1TFNCTVhFYlc2T0tpOWJGVEwzT0py?=
 =?utf-8?B?cWwyZ1NYWDlqclVVQldodHFpdWFwVWliUjVlN3VvdEpRZittRm9FTy9idkFS?=
 =?utf-8?B?NzlYclo4ZFlseFFZMGtPUHBwTlN6S0NQTkVoNksvUWhhbXpuOFBCR0Yrd3FX?=
 =?utf-8?B?NUNmNEkrTXJ4RjQzSHh5SEVCelN1V2VUeTAyTWdjMlhvbG1TK2M2YTZuR09H?=
 =?utf-8?B?bjJOQ3NsVmxZS2g5WFBwK0s5YUhIdzRJNW1kNlYvQ3JLWVFIY096SXdXODNy?=
 =?utf-8?B?QytJYzhWUnl6SVhsNmRkZndoTEpvR1VYSVdlMCtpa2gzeFVlTFhkQUlJb1BJ?=
 =?utf-8?B?b3prdStXRlJwKzBEM2hxVWlXakJxbGFwb0k1Tm1GUkJqdDlrNDYzcE5TNEZX?=
 =?utf-8?B?Zkl0Y01md1ZyQUd4OXlJYUYxdlZUVmdBMUZZUEVVdWZJVmIvaE53UEVVWGQv?=
 =?utf-8?B?UzZ0blJRM3dnSE5VelpJUTZDRnZBb1hnNHBkUjRWOWdCNkdvbzFWaWcxNUhU?=
 =?utf-8?B?aTJjYmhDNkdVKzZiNG1nYUFsSndKSElJVGlicVhPbDFtUG9HOGxsUlBCRVFE?=
 =?utf-8?B?aW41NkVHUy9kMVRRVDNuci9IZHBDSjJIQUVoTmpmTGJaeWZJRFo3Q0RiTzBh?=
 =?utf-8?B?YkNNamVOSEloOGs1d1IxS1VlWEZmVnBHV011Y1JZT0NVMVgzdUVLQ2VMNGY5?=
 =?utf-8?B?UVkybUF6eXJjdnZDa0QvVFV6QmYycWM5K0d0dG1aU1pkaXBJY1laeFBOZGhx?=
 =?utf-8?B?VkFMWUtGYlFaVndQNUZGWFM4d3dJNUNZMUtBRUx4S1hFdExEL0VXdjIvYUJV?=
 =?utf-8?B?UWVTbUVPcExSelNRVnNha08xN1djNEd6Vmt6SytJUEh3dGxVWmpQRTMrbk94?=
 =?utf-8?B?Wk1FMGF5Ym51YSt3Q2ZFUXNiUTZTK1hjbjBhL0t5L2RSNUxudmJEbzREbktj?=
 =?utf-8?B?STY4bEtPeUZEVXBRekpHVm5GTUV0M2R6dGtLOFU3N1cyOE1XOVk0ZDdzMEtV?=
 =?utf-8?B?YzhjWmVDYit0bGRqQmg1SHNacWZmN3hWTlI2RjdqVmpKT3dnT1IvSDdFMkQ4?=
 =?utf-8?B?SmV4K1NWVFYxOG9UTGJUMUgyblpFRXMrc1FRNVBQcldubDg5WG1RMk9FL29C?=
 =?utf-8?B?NFllU3MzVnBydnJMNVAyMnF4TjN3aFpWeWtUZGNnUEdxekEwaTM1bTJSSzBB?=
 =?utf-8?B?THhxc3JnMW1kOHdqSWFwWlVQVXZsVFlmWW1LdUFZMFZad0RsaFBzQTZRNDJw?=
 =?utf-8?B?VUxjSEg0MnRWT2ZCOU5QbU5hd0x0Ynp0dVBUbzhKNjZuaVhBOWQ3aDVoTkph?=
 =?utf-8?B?dUJXeUoyeWsxUzl0ZmVPVEdJYXpSeEFIMUZDcjRabTEzeWRwTkphVndoa3BE?=
 =?utf-8?B?d0xBNlNlcXZlMEM5OUVwbEJTWUc0MXRpdVdWbWErSHBvajNVM1R0Skpkdld3?=
 =?utf-8?B?T2RYalBSZUNvTUpVNXY2ckdJRjNtL05YbkkxRHg1b29PRm5za3VWTlZMMVRs?=
 =?utf-8?B?dVU0RWpqZFlGT2lDa3p2UmRMVm1tcGFyRFhjT0d6cGhPeFM1VkJLZVVkZjBw?=
 =?utf-8?B?M2dtbHhKdldzNHVmdEVHTThiVWZQMnhrVlN3NmprQTlZTnM5OGhUaWZEV3hz?=
 =?utf-8?B?R0RCS28vbG5uZksvM3kvS2x5YVhIaUVDZ0FZZkdTVS9Ucm4rWFZmZ280ZElS?=
 =?utf-8?Q?fDubVE0KSQQCHoog=3D?=
X-Exchange-RoutingPolicyChecked: VmgaumEgH7ZAZUUCFFjU6kXklZyHtdGp11G9J8eJEKoQ7DGmNxcBtQq99yukGXu3G1ov9FKXmruFt02eRPmugYwYNVQlrWgzy5opI2GHY6LVrCKPYs9adUb5rb05lU5qkDMf+DisWbX6qdvRGLVNI64rotxbmIItSav6gkH57CEVyNwC9Knkzf2Nx6kVNkg0W5VvXzHPO7zyLYWzULpgByM0tesUeCNx1EKzBZ/B6n5An35lesTJkmrpN548bIp8tJIi/9HRw208oJq9AnD0M0lU6Xncx0wTifKmzvrB0PIJ8UHkVe0z4XO5ovdf14jElq9FlQtGQhDp5T2ryuTQEg==
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc5288d-564e-402e-ab68-08df35e8b033
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:16:01.5913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/G5v+HN99v/SHjMgdRHBE2ptierLUBdUR/jxHdDfDeApKcWeEQnsvifED172/4VXSpVb5eSYQn53H7vNzrKVfbp4OynRfDAu/YOFIe4vNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB053507
X-OriginatorOrg: intel.com

Hi Jinjie,

There is no "force-freeing" of RMIDs. How about
	fs/resctrl: Do not allocate a monitor context when releasing limbo RMIDs

On 10/29/26 1:15 AM, Jinjie Ruan wrote:
> __check_limbo() allocates the architecture monitor context before the
> scan loop, even when the domain is going offline and the RMIDs will
> be freed without reading their occupancy. So if the allocation fails,
> the offline path returns early and leaves the busy RMIDs in limbo
> which will be leaked instead of being released.

(please separate the context, problem, and solution descriptions).

"will be leaked" is a bit vague to gain confidence that there is an issue here.
Compare with, for example, "The caller goes on to destroy the domain's
monitoring state, freeing the bitmap that records which RMIDs are busy,
so nothing can clear those bits afterwards and the busy counts never reach zero."

I think that there is an argument for this change even in the successful
allocation path. If I understand correctly MPAM's resctrl_arch_mon_ctx_alloc()
may need to block as it waits for a monitor? This would cause the CPU-offline
path to block on a counter that will never be read.

> 
> Split out release_limbo_rmids() for the offline path, which doesn't need
> the monitor context.

Considering the shape of this fix and the "Fixes:" tag I think it may be
worth a mention that this is not a revert of the indicated commit. This change
maintains the intent of the original fix that avoids reading a counter in the
offline path.

> 
> Cc: James Morse <james.morse@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Fixes: fc16126cc11d ("x86,fs/resctrl: Prevent out-of-bounds access while offlining CPU when SNC enabled")

The changelog is missing a clear description of the impact of this issue.
Nowhere does it mention that this only impacts MPAM and how likely this issue is. 

This is important because this "Fixes:" commit has a "Cc: <stable@kernel.org>" so
we need to help maintainers determine the impact of this issue to 
guide where, if at all, it needs to be backported.

> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  fs/resctrl/internal.h |  3 +-
>  fs/resctrl/monitor.c  | 69 ++++++++++++++++++++++++++++---------------
>  fs/resctrl/rdtgroup.c |  2 +-
>  3 files changed, 48 insertions(+), 26 deletions(-)
> 
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index e62a277dee85..a1837679b27a 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -405,7 +405,8 @@ void cqm_handle_limbo(struct work_struct *work);
>  
>  bool has_busy_rmid(struct rdt_l3_mon_domain *d);
>  
> -void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free);
> +void __check_limbo(struct rdt_l3_mon_domain *d);

Looks like __check_limbo() can be static now?

> +void release_limbo_rmids(struct rdt_l3_mon_domain *d);
>  
>  void resctrl_file_fflags_init(const char *config, unsigned long fflags);
>  
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index b8f4e1ff4083..020140b794a7 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -124,13 +124,36 @@ static void limbo_release_entry(struct rmid_entry *entry)
>  		closid_num_dirty_rmid[entry->closid]--;
>  }
>  
> +/*
> + * Release the busy RMIDs of a domain that is going offline. Their occupancy
> + * can't be read any more, so they are freed without being checked.

Please document the function self, not the caller. Considering the comments in
resctrl_offline_mon_domain() the caller already does a good job at this.

The "Their occupancy can't be read any more" also does not look right. I think
this claim is based on x86's cpumask_empty() guard in resctrl_arch_rmid_read(), for
x86 that does not actually mean that the occupancy cannot be read anymore, just that
the CPU may already been removed from the domain at that point. This is really
a platform specific detail that resctrl fs cannot assume.

How about something like:

	/*
	 * Release the RMIDs that are marked as busy for this domain without
	 * checking their LLC occupancy. Cache lines may still be tagged with
	 * these RMIDs and will be accounted to the next user of each RMID.
	 */

I think such comment pairs well with the comment in the caller - it documents
the consequence that the caller documents it is willing to take.

> + */
> +void release_limbo_rmids(struct rdt_l3_mon_domain *d)
> +{
> +	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
> +	struct rmid_entry *entry;
> +	u32 idx, cur_idx = 1;
> +
> +	for (;;) {
> +		idx = find_next_bit(d->rmid_busy_llc, idx_limit, cur_idx);
> +		if (idx >= idx_limit)
> +			break;
> +
> +		entry = __rmid_entry(idx);
> +		clear_bit(idx, d->rmid_busy_llc);
> +		if (!--entry->busy)
> +			limbo_release_entry(entry);
> +		cur_idx = idx + 1;
> +	}
> +}
> +
>  /*
>   * Check the RMIDs that are marked as busy for this domain. If the
>   * reported LLC occupancy is below the threshold clear the busy bit and
>   * decrement the count. If the busy count gets to zero on an RMID, we
>   * free the RMID
>   */
> -void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
> +void __check_limbo(struct rdt_l3_mon_domain *d)

Now __check_limbO() can be static?

>  {
>  	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>  	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
> @@ -161,30 +184,28 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
>  			break;

To be true to the fix I think the rmid_dirty initializer added by fc16126cc11d
can also be removed?
	"bool rmid_dirty = true;" -> "bool rmid_dirty;"

>  
>  		entry = __rmid_entry(idx);
> -		if (!force_free) {
> -			if (resctrl_arch_rmid_read(r, &d->hdr, entry->closid,
> -						   entry->rmid, QOS_L3_OCCUP_EVENT_ID,
> -						   arch_priv, &val, arch_mon_ctx)) {
> -				rmid_dirty = true;
> -			} else {
> -				rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
> -
> -				/*
> -				 * x86's CLOSID and RMID are independent numbers,
> -				 * so the entry's CLOSID is an empty CLOSID
> -				 * (X86_RESCTRL_EMPTY_CLOSID). On Arm the RMID
> -				 * (PMG) extends the CLOSID (PARTID) space with
> -				 * bits that aren't used to select the configuration.
> -				 * It is thus necessary to track both CLOSID and
> -				 * RMID because there may be dependencies between
> -				 * them on some architectures.
> -				 */
> -				trace_mon_llc_occupancy_limbo(entry->closid, entry->rmid,
> -							      d->hdr.id, val);
> -			}
> +		if (resctrl_arch_rmid_read(r, &d->hdr, entry->closid,
> +					   entry->rmid, QOS_L3_OCCUP_EVENT_ID,
> +					   arch_priv, &val, arch_mon_ctx)) {
> +			rmid_dirty = true;
> +		} else {
> +			rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
> +
> +			/*
> +			 * x86's CLOSID and RMID are independent numbers,
> +			 * so the entry's CLOSID is an empty CLOSID
> +			 * (X86_RESCTRL_EMPTY_CLOSID). On Arm the RMID
> +			 * (PMG) extends the CLOSID (PARTID) space with
> +			 * bits that aren't used to select the configuration.
> +			 * It is thus necessary to track both CLOSID and
> +			 * RMID because there may be dependencies between
> +			 * them on some architectures.
> +			 */
> +			trace_mon_llc_occupancy_limbo(entry->closid, entry->rmid,
> +						      d->hdr.id, val);
>  		}
>  
> -		if (force_free || !rmid_dirty) {
> +		if (!rmid_dirty) {
>  			clear_bit(idx, d->rmid_busy_llc);
>  			if (!--entry->busy)
>  				limbo_release_entry(entry);
> @@ -843,7 +864,7 @@ void cqm_handle_limbo(struct work_struct *work)
>  	if (cpumask_empty(&d->hdr.cpu_mask))
>  		goto out_unlock;
>  
> -	__check_limbo(d, false);
> +	__check_limbo(d);
>  
>  	if (has_busy_rmid(d)) {
>  		d->cqm_work_cpu = cpumask_any_housekeeping(&d->hdr.cpu_mask,
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 57ab090072c2..5d0351453c2f 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -4590,7 +4590,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
>  		 * the RMID as busy creates RMID leaks if the
>  		 * package never comes back.
>  		 */
> -		__check_limbo(d, true);
> +		release_limbo_rmids(d);
>  	}
>  
>  	domain_destroy_l3_mon_state(d);

Thank you very much.

Reinette
