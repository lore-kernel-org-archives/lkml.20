Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2060A56260A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577563; cv=fail; b=IY9DhJ9wNuftrq+4BEA8RxIZ7dGOeXZiVasTYymdpA4P0BGObF3ACgM0lG/pGxqcHpqMRnT09FeN9VlDwsfIsR9o0in/HtSOjksTipVIxfl17rTjeh97K8+IqCiiP4YZtNo/jkmVPteMEMQeHW7ZEPWSayTJOf47FWEdAPKp060=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577563; c=relaxed/simple;
	bh=T3H7yrDo/qY4pD2oyGF0VTHZTCL275oL23d0w2/na7g=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uyWERXp0AXOwFmK4A0vERSCIRPT4zLaAhhjlyQc/xpuL2QLXxUCXa4Lq7pYB2MbQg8168T5X6GUNMW66HlpUhWwKKN41mna1RQ3nEER7p26LnjMFenuMNbeHyhpsID5wwTpbcQ4TWBbWRnd2OP7b+U2uOKRvs8QVWuZSsO28REs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZ9TtmHe; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZ9TtmHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789577556; x=1821113556;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=T3H7yrDo/qY4pD2oyGF0VTHZTCL275oL23d0w2/na7g=;
  b=kZ9TtmHeM2X0hujFFu3+5PocIfgNKAv8eWM/EGhOa3Sdq0XQNKS+VhBM
   oSuNmsoCcKyeTcLmes0WZUrujvTjjKTkZbGbtoGrhCn+V/dTCiLpihBG2
   KZTKQt9knU4PhAB+XrYayI1axhMsKvLSlWDgJG7yHY25ZiHHQ8jsYHoIm
   nW7TSV89UdwU+etfkIgE9O6DcklprAdRFQevjm4fsTN2r+uJ6VyCn8RgU
   MJ2sYhVOLWDehJrsS1GbXvtndZ7hS6PvjD1sUFA90DXxioqPeNdla0YZN
   iTHSLMjatJ42IzRd9jZ6HqHz3YM24dl742kfSZ0zJOre6VulwQLNr8GC0
   Q==;
X-CSE-ConnectionGUID: YCOVM91lRFmpHqoGBy9Y3Q==
X-CSE-MsgGUID: xHXJCAa6Te2MHzmz6l5Y3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101113047"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101113047"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 09:52:32 -0700
X-CSE-ConnectionGUID: rXsKvhOKQ6KCwPD/faV8Fw==
X-CSE-MsgGUID: DUTxhHL3Si6lY8BxWGHgDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296873215"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 09:52:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 09:52:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 09:52:31 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 09:52:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyNJ4hRkwaLhrQdFfxqQ0k6ifSumukh8XJhVRKyNNw8Tmf9r8rio11mOhI4+awo5v1qRiYEMn/y+l8CoKWscGS3FoLSjNd0+FqQeD6EoC2HRyxGPc3Wq6GmoJYrgLBjOs5dq1u3cMqrh3uDcmuOp6Gi7lC9WxzR6ND0Iw4ucArPGZDjvtE06LCClsycsKcnpzcjGYynLluLjllh30l4FuwUg7PlHC2+o6RgTpCvart1n0cKRZaMH2QWK8ZEVev7TkD/+sNd9SACSR0U8kiu8ZrRP4EIWuJuRO0hSevAwu0k6+zbsJzxWQbredmqtiZbAjZ3Gu6QG5o9CHwnHuaKwHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=looert/DGEhy8XOT8ItL+JbIZdPNFvvjJAhCo1uUzws=;
 b=AF7m/xI7ksUxWbF9YbDuv4dUowh6n2ZpoyfevhRF2Qm5o2meU6Ty6YAIzkIv+E2L0XnUYa05fxSVox5ShG2eLtv21bjKr669SZfGpvb/g3yqyQ+EvPKdoSvn8xq4yHURWqhu8qssXDsqgiGfu12up2xaTKel5iL9mXqBgtZ1cMCkOBv+M7ROMAhFRRjXHo0Y/LfWmeHPgiAtZoe5PlIPiwpcO8X31E9/rkeSaZX0VbfWEOFu/C3gLsi9nEnIZon+vSuQ1Ms9GF9nKzIK/v9y0ymgcbTmSt3Nm5RFX0203Cg6wew904iq4t9xOcje0dN/Y3WPLzofoDE2IZVv6E2WRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DS0PR11MB7957.namprd11.prod.outlook.com (2603:10b6:8:f8::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.9; Wed, 16 Sep 2026 16:52:28 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 16:52:28 +0000
Message-ID: <980ca6b6-fc5b-441b-8025-755e2f6d51a9@intel.com>
Date: Wed, 16 Sep 2026 09:52:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/resctrl: Allocate rmid_ptrs[] using kvzalloc_objs()
To: Ben Horgan <ben.horgan@arm.com>
CC: <tony.luck@intel.com>, <x86@kernel.org>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <fenghuay@nvidia.com>,
	<bp@alien8.de>, <linux-kernel@vger.kernel.org>
References: <20260911160608.1091121-1-ben.horgan@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260911160608.1091121-1-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0390.namprd04.prod.outlook.com
 (2603:10b6:303:81::35) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DS0PR11MB7957:EE_
X-MS-Office365-Filtering-Correlation-Id: 01fad848-7e22-4f88-1fb2-08df1412e43f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: z8/N4jEgvKd+h+0j079NaUg6W9S80Mtw4vKGOjg2Uw4sS47sBZub6ly6LWcnzGX7gTmkWeaNhn3zDIN6hG6ITZd9NrxbfRYWX3Pc1ZzLCSDKX9LIMfAGdmu11vtCFhruVBgIl9bMcg1oKsuOu4d6BkpWPB49BIrsTt78fPFaijkF1wlFG6RqD7Sz645LF4W0uA7+mnEkuR1EgnQ6cdYZzax8tW1R3dKQK1/cHQUc5EYskZOwNKbwdANJU/9yBFCQc8L6463YdjkFFdiEh7h2fAF7yn+x3m4vdimVlCX2PiiMv+ZgAXz3c70iTKr2kvgpDAMz7iJUIdz+Jn+4xqGakZj0rOZDsByaXckyQ2iCkHGmBXCOyecQDGUozWF9/ZAuo19iqW/J33yNInscS15oU6DwJu6T0dGNrH9cBUwZreNVPbyqIgb34Y+36071bvtkBBdmyqwpiCVp+cQwaMAs70XqdIuaPCHui8ZM3IAyriYJQagPLoOwMBoPgsrewHHq+TXxcvpgiY/JtNoNKhjfI57u4cAWc4u7DJud3E9Fo1OnXjIVcU5inQG2y8idJGeA1Hfwc/NPsY3Fk5GQNYgmA8l5NWd6gr61KIQn1aXwAbTTWClb+XyWAPY0b5GHoJ2J7QZPvWpQ4L+91DdJzre8PfYDVTQjhBVizvBHt06/BZs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGpZS3FZWlBYUHQ5bk5DK2VZNzRSMkl5cjFzTGJJd3VnNUtqaXdURWZUUERC?=
 =?utf-8?B?OGpoRkE4STgrZktUcjUva0ZXTEExdlM0Unlkamh4NG9GWDBYZTZYVVhSQ0R1?=
 =?utf-8?B?VG1lWGZPMVhhNlBzYVFtdXloME81QW5tNUY0dS9hVkJhSnlqNDVpRDBUd0hC?=
 =?utf-8?B?bkZmMzJrUU5sMzBBMVVYaXhrUEtXc2hzZTl1YnNyWEJWa2R6TXQrOVUxT0tS?=
 =?utf-8?B?Y2NoT0h6dnZIVUp5VUJYNzBnYVR3ZDVhSVJLQnM2b3hEY3JSMTBPa2tySDVo?=
 =?utf-8?B?SkZXZ2p2SVFLRnlYcVRBYXQzMmp6VkE1NjBtRlpBc0phT21oZndLbkRLQjlV?=
 =?utf-8?B?c3ZocnhFVFlCS1JwTzQ1YjVsS0ZqZ1hyU2IvYUo3RS9nZ2J0ekhYYW51VStH?=
 =?utf-8?B?TklROE5EV0FZQnZDRzNJSzljSXNtUGVaVTYyVDNORmRYU0xxUEptV3pCb2JX?=
 =?utf-8?B?NlNldDU1NUZEOUtMcUhvRGljMGJ6bnFRR1hFVVJMUVBtK1VBUktRbjRRTmg4?=
 =?utf-8?B?cE41WDBaOS9kczRhRkk1K3BrRmx6LzhsMXZMaHRreERaYkdDdGpPL2x4TXRw?=
 =?utf-8?B?eWg0M2lRb20xWFg5eW9JMUtxeC82Tlk3MkVzdy9raEo0WGEzK1JRYnBVNGl1?=
 =?utf-8?B?K1h2eTBCN1BTOWZvV1hVNjlxWFplM1Bsa01QV2ZCUStlanF0RlpraDgwSmxH?=
 =?utf-8?B?M3c5L2diaWVteE1kdEpsUEU5VzU5eGlKOHJkRmtKQlppMXErOTU3aWVKNHlv?=
 =?utf-8?B?TS9QeWhja2trNWFOS0dTMVlIdjNHbEs5dHZDQ1crTjhXbENsWm9uMitnNVVn?=
 =?utf-8?B?YnlXYzRpUWcyaHZNelJYdFY3cnhpSE9SM0hyeEFqeTkrc2c1VW5KeGs0di9L?=
 =?utf-8?B?bnlwSXptTlFnMUxkeXZ0RmZPOGlzalo1RU1yc0kvcTJ4Wnc2cVJmUERlZGtx?=
 =?utf-8?B?SXRJclJsSUxWODdqWVovVmMvSXNRZG14Um1mNWI4WFNwKytWU3U1Nm1EbUJ5?=
 =?utf-8?B?SjBORXdLYVJKTzMwbVVDVHU0TVllUnNMb1BSR2krQWZ2NkQvZWUwWWFwMHQ4?=
 =?utf-8?B?UjVyU0cyREEyckVpL1dTVHpzRUZIRC9DNjhHWGJVLzJxZzZ2WVlpWUtSQ3Zz?=
 =?utf-8?B?L0NkblpIUUhtdU40ZGhud21WRDdubkNPSFRxalR5NUFhY1lranNNeUFYSGQr?=
 =?utf-8?B?aHcyM3dlOGFIZ3h0ME1ZVkx0bm1WZStMMXAwb2h4NHI0ekg1cnBoS2pQeUlm?=
 =?utf-8?B?OHFST1RiN1NScWRPcXZ2OEUvMnlRckFBZ3drNEJrY1dtcVdQRnY2QS9CYmVC?=
 =?utf-8?B?K20wNTJqR1BOeWZvUVdXU2dWR3BhQ3BuYm82WEpORUNRbmJuMEpyK1dveTBI?=
 =?utf-8?B?alRBb3ExMjFXOEw0Q3RUMjhHTmU0dXpVR1BLc0FLZHFnTmxBU2ZwSUFZa2Rl?=
 =?utf-8?B?MTBHYUhNa1dtcW42UnJNN0VROGZhaGYyTVVhbDd2cXhiZVl5TVJidDNYM3dP?=
 =?utf-8?B?NkJlWVVSV1NkaE1YcDhyYUxYR1FLa2ZLNnUrSHBvU3hESkNQMDJiT2dvRlAy?=
 =?utf-8?B?UTlxM3JMYk9mMHFpNTJ0blhJTzRrMGlGdlRTckxveUtYbFl5d29mR3lIR0Rm?=
 =?utf-8?B?aERCTWxCelNDTDNXajQ3OEM1K0xGSmVRMmhRVWliMFdkQjRFU2lCYzQyY2di?=
 =?utf-8?B?N3lSVkFPdU9OSjd0N1BZY2RLSkR3SzQxTzVkbWFHNWtnVUJsSk8vcGtBUVNN?=
 =?utf-8?B?ZVRmdGlPTUlEY0pNZ3NiNFpUL1Vsd0VidERSdEpRS3kvNjJKZWV1MEJjSVFz?=
 =?utf-8?B?SjlXbmMycUJuZW9rOTRwUWlGTFZqQ0gwRjlORjFEWkdMS241WDZlelpaeit6?=
 =?utf-8?B?NVJGdWJvTExROEpSNHNLeGlQdnF2K2x0VlFVN2g2NlFyTldYbU9QdHlGQVZX?=
 =?utf-8?B?UXdicVNab0wvSnBIbDZMb0FMQ3lOYllQbjkwQVY3UmpIckNPblZUOFY2dGl6?=
 =?utf-8?B?STFIamRObW8yc1JFUWNteXgweG9MU2dvaFBvUzJwK3NpaVJJQTVPNlFBZ0VS?=
 =?utf-8?B?cEsvL0JuUVNmWFViVDl0QWxqUExIajBxWFI1cEZrQXFPc3F3ZnY2UXV5Tm1t?=
 =?utf-8?B?Y0FGbEw1WDN1dFZCdjFrQXdjVWpndHdHT0V6QWMwVmdvVmlqRWpUYXl0Uk1D?=
 =?utf-8?B?UU5nYVRKbGtUYUZLZHFtTHRJVGJFL2FHN2FlOGl5NkEzRCt1M3Y1WExUZklR?=
 =?utf-8?B?MCtDQm5TOXFsR29yL0JyUENoTmF4anc3eVlvYUNjQklHeVhEak5MRGQ4VDZB?=
 =?utf-8?B?Vjl1aE53VWZYQ0g0RWphMEYrSmxvNnFrMnBuRW9OS2lpNDZQazVXN2wwcTYz?=
 =?utf-8?Q?9fE8KMnbS8QCA+wA=3D?=
X-Exchange-RoutingPolicyChecked: tJ7MuPwzx69vgyZc/zDM7/gPNR5nOiPMX83OdBR1zmTS5odw6t1OM5SutmXvyZozQNb0ZyPvbEsJ1RZTtNarb4+rm4770ZaOPenkPd+eUB4E29ZMtu/ce/x8+c8NpWDVb7u3LpqCHFBLoMBDJZ6nKk6Vfbi2Mnlrce2dWW4avC0l3oDhwBkqn3bPImWTksQAcTcCZXxe48IXCMuWc/H7RHHnIBWLI3Ea0IBxaET8qoGPCd167PjRL/9NLapWSaNw2Ox2hOUBFbllA+jGYKVUA5eO5nSBJvYbGxkWsRasxU2yKNxf+KUY668C0ebt6ZD2FjiKCZ4Us/P9FHu6mY3IDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 01fad848-7e22-4f88-1fb2-08df1412e43f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 16:52:28.2239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4nKjNiduJt8jux2MkdFcg4AlAZFmL0QFtSRb6GU6Mg+6T+lXlaWBkc6G1Bc+Fy2HliSiLYO1KdeBY3O4op1l9PhJox+yr4D01XpJjoSQBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7957
X-OriginatorOrg: intel.com

Hi Ben,

On 9/11/26 9:06 AM, Ben Horgan wrote:
> On an MPAM system the number of entries in rmid_ptrs[] is the number of PARTIDs
> multiplied by the number of PMGs. The maximum possible number of PARTIDs is
> 0x10000 and the maximum number of PMGs is 0x100. On a system pushing the limits
> of the MPAM specification this can be large enough to consistently fail the
> kzalloc_objs() allocation and hence fail to mount the resctrl filesystem.
> 
> Switch to allocating rmid_ptrs[] using kvzalloc_objs() so that large allocations
> fall back to vmalloc().
> 
> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> ---
> I found this by testing the extremes of a software model and don't expect this
> to effect real systems.
> ---
>  fs/resctrl/monitor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 73413cb128ea..2d7df60973d1 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -979,7 +979,7 @@ int setup_rmid_lru_list(void)
>  		return 0;
>  
>  	idx_limit = resctrl_arch_system_num_rmid_idx();
> -	rmid_ptrs = kzalloc_objs(struct rmid_entry, idx_limit);
> +	rmid_ptrs = kvzalloc_objs(struct rmid_entry, idx_limit);
>  	if (!rmid_ptrs)
>  		return -ENOMEM;
>  

resctrl_arch_system_num_rmid_idx() that guides the rmid_ptrs[] allocation is
also used to size the L3 monitoring state rdt_l3_mon_domain::rmid_busy_llc[]
and rdt_l3_mon_domain::mbm_states[]. Each RMID is expected to have associated
states in these structures so to fully support this their allocation needs
to change also? I did a quick check and there does not seem to be a
vmalloc variant for bitmap allocation though so that may need to be
customized or created.

Reinette



