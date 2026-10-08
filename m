Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8ED3D6498;
	Thu,  8 Oct 2026 08:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447956; cv=fail; b=srVKxnZ2FliidZCojdSZZM1hyUIXPFQZ592P2O9RW1SV86VbQjIQWqvpFGC9CBwZpn5lgLOshLXdVtCO5cKo+jWej8XXl/XQlZyvXFI0biRkRrjC5VYw9qLslhcCLjB+BYytYqk7PFgzJtpFvK64XUX9XV3lRwioMzww3VHfbHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447956; c=relaxed/simple;
	bh=+ll3S2rEsBHIPoEgyytGUuQ5DWO4+rFyjDIl918Zj7o=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=am7Ym3Xzzkmv/yw0+oCZdcZrutNABShlVcW0F+QIXmXiTXDb7Bu3zdJGRW5ztZqdYftIjm0A8W0aEnMcaEuVhjg8KzS4lnYi/CDywsh44i62h8lqMLn5y35fDX+GBr0rDDlQU1FMnkehA2U1xqI35sve69aX5aN8iWAKb9Fn4gU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H98BhnpO; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H98BhnpO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791447956; x=1822983956;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+ll3S2rEsBHIPoEgyytGUuQ5DWO4+rFyjDIl918Zj7o=;
  b=H98BhnpOSAt2q8V/GqZswPXuG9P7cyi0OgOB+twEYnbM5J6K1JGZKk9w
   QzZPiL6jshV0aDMfG3HpnTvCWMQQONQ+Z8bTtu91L22Fhe0kibdxCCoI4
   YfTtLDJAQAS4nEgk6Q2/Pn78yxA5Rf89kWI2xWtgZ57Wt78RKW1hoQhNn
   tzA92FcvCYV8Vj2h4IWoS6CbgX13Nd2DwKUCkK9E7tGcScDbicvShByYG
   tFlscumRFehmuUTTFtV/yjCIQxixplOsdyqhrgYizWT/9KrN+ZHSXKUiw
   WWC8pw7vYXdBZBAGq4bVHIpyGvjnWDczGDD5/DxhpMhFf8L6K5/E7IjP8
   Q==;
X-CSE-ConnectionGUID: ogBjQY+8SqakBjo1cqOaKQ==
X-CSE-MsgGUID: CF8dowV0QVeet67n5+IPHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="216706"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="216706"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 01:25:55 -0700
X-CSE-ConnectionGUID: 7A4jc5skTwu60nQ1f+pC1Q==
X-CSE-MsgGUID: oisvYU7cS0KyORBae5Tq+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="434004"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 01:25:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 01:25:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 01:25:39 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 01:25:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7kr56JFafr6K032QF7WChJi8xfywT7ug4pNb5ZmGKRjmmBXonmdcy9sxX5m9f3LhwCfwDZv4BymPPgJT6hvSB1cWGLVahtf/dKQ25r5pV2Jj/Ou59aVUGouZxzRJQFmGqzKTAZSO33Y+C0XlnEm2ad4jqk6T8BPKZB2UShbq5+vO34qnGTqkPT08ntQ8LrON0Qy6HsA3e9OI0AY0cbLiRxpi8yMolXgxru8wxvA1+h+DTr5QdXuCqlynQPKIdVhEliL+OBzLJvF37CCi9zqDduhlD4rCkHUQRPiHeSH4tiGjoOols8J4DdTU9SN/MM9xA1OcUssFr1ex1RFxCNO/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWJYMCXJUE1dyVuSOV1DKRf+pPux73i8gOxW//fSTPI=;
 b=eXg3n1tJdZ2DmmpIxKEGP0YqksJmjNb0P74tHUlGyU+dyCI1E49HQ8pGu8BOJDkyMkyTPQjA08OQhtoCbdQnG1ivUk4WjSKUzV6unvvjaazwguso3jps2sNh58KXPD5mMqO+V/2cz3L8esqP1CaP8zf8P/yKoAk0uIFK4aeVdlU0GVfhNVjmp0hjUnH+iN/Fa9St21jZlj1WoSa6ycstQEE/ZeYcz/YAGcpoO8w15KKieyMsK7qbWGcyguTOj03vkY8gSECN3q6x0cQVechw/Kh5YGAOgW3tbTR7sHD4mDF9PifTwjJNf3/MNBTrpdClzqEWFQWuLruhfTk812Xidg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by PH3PPF4EB9556A6.namprd11.prod.outlook.com (2603:10b6:518:1::d1f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 08:25:36 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 08:25:36 +0000
Message-ID: <f6980bc7-28e6-4794-a88d-9ec8d0c6c8a5@intel.com>
Date: Thu, 8 Oct 2026 10:25:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] ASoC: Intel: Add Yoga Book RT5677 support
To: Mark Brown <broonie@kernel.org>, Maurizio Casciano
	<mauriziocasciano7@gmail.com>
CC: Liam Girdwood <liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Yung-Chuan Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Yauhen Kharuzhy <jekhor@gmail.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260925135915.338670-1-mauriziocasciano7@gmail.com>
 <179138829586.2423942.18161759839325954291.b4-ty@b4>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <179138829586.2423942.18161759839325954291.b4-ty@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0257.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::24) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|PH3PPF4EB9556A6:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be856db-834c-499d-76b1-08df2515ba64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|23010399003|18002099003|10067099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: YoHk52BlJlyqWzbwBb4GppJ2kK0WdjdTUK+/0hOwJC2Eq/m9tJYrXLaUE4OIp925qxiDMmeL44Q97cMeRN19Hj3zmD73jEYkCvXjRFjs68LFmPnGrISiKdtd3jdVBLmwATX37dyAM8BolqWTUUaidj3jc73eejn0Ygn2SNHdiHA17rO2+oBWfTVcsGqK4F0ie+He+a9gbMCjfsR2gWGFHFHAJBDGk/BCphcaQbxvnGURxPJ7f1NFUHoAWzejuDtLBJOvtYO5WUGWnR1nWSmKdYplXPdd8CCtO5rthW9Zt83AIyT2AeTjjvoTouKuOL7SXT745jv+AZhrFPvcnJCuZib26mHq2QJ8OXX/17q0kyTfN/b8vrV8Ia4B6OPlY4v/u7fgVQ/x3TcTqeHUeZADzYM7EA5LzfDRuFTFUJ0EP1oYKoeWKA7Amnm1leXHLTCW+phMxpTr3FAPI1O5tPJYZ/wqE1xONnJH6Fu2G3U65qSTjSkdEXwLcc9FOHX9eC6h6Y8o869TqmYQErSPH+EoJA+arIc+ZzWDuEeZgoBllVCn79gErYY1lY8XMNwZbBvSSCDuIimuC+bE5cmquPBr0cD8A125wPTkjEFgSlqQuZMn5xdN29oOw+Ga13d9yWM/t81SOAMlekiVofdNt4FSZuifejCv/kMFef/BIleVzrc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(23010399003)(18002099003)(10067099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tjd6YXZKRDE1ZGlXWVJiZFVwcUlNclFZMjI1eDhZSEhHRkdaVjlpUEkwTzcy?=
 =?utf-8?B?RkFucktuVXRPTHhjdm8yWEhHM0s4REp3UDhMMW9VallqYVlTWDBsL3IzV2dr?=
 =?utf-8?B?a01NRnhLU25xaHB0UTdCM0FydzhYS284cjg5eTBJbC9qMEpPNnVxTUNJdWZw?=
 =?utf-8?B?cXVrK1N1NjRtM2pxMzYwWEVtcllmV295bkdrd0J5eWVBeTQrcjJXREUzTlc3?=
 =?utf-8?B?OHNzL3hleDBvVWxiczBubTNRTVdmMkhmS2FtZGVBeittdk1ZYTlHbnB1bjgy?=
 =?utf-8?B?UERIYVFURGs5VVNFR2YwZytySGZRZlY2ak5yRlNrVCtXdGZ4L0wza1RpQTNW?=
 =?utf-8?B?cHBUTzdSU1F6V3RFcCtGWGt1V1dzYjZDNm9SWkRRZmFuU0hmcnRKaWNQaDgx?=
 =?utf-8?B?Skd1WG5VVzlHcC9JT2hPdDByN3FnTjM2Q0hrZC95Y1p3ZDFmaHkyMXZEelh0?=
 =?utf-8?B?eFRpNUFrQ2NaQVI4d01yZEFpUU5oZ3hTMTJ0NlFtZWNOaGJCM0V0ZDFYd1dU?=
 =?utf-8?B?RjZTWUZBRzJRRW9FUE9yclJGQTdqWEtrRmduMG9FemxVam55TDNlMElWbktZ?=
 =?utf-8?B?WW9TZUg3azF0c0RzU0tvQ0o2Ukk5Wm5WaTE4bUUvU3dCZHVQQ2k0Uzczczh3?=
 =?utf-8?B?QWtJS1czRDFYcnVCK2Z1L0YwUFpnSms1OVg5QjdEZlUvckdYcFF5UXFMTlFl?=
 =?utf-8?B?aDJibFh0b0d2enJyeXZma2ZkY01ITWFsdFdRc3FUd0VXOVBZaHFqOXdjbTJ4?=
 =?utf-8?B?WHVFeW1GQUJ0UXpWdWZ5dWQ0cFBncVhmaEE3RWU3Yll1Qk9kY2NMOHFTZXN0?=
 =?utf-8?B?N29LWU02cTc0emVvWHBqdHQ0allkeDVmbGNRMmlsUFg5U1lCRzJMNi9Uc0ox?=
 =?utf-8?B?dHV6NEhDNTNBaXNGYUhlczlzQUJnMG0vakU1YVQ1ckFSN1RMY0VoZk9aa0R3?=
 =?utf-8?B?TFY5aTl1eXpJdGQ4R2I4bEhjWjZUWFBxMTBFREQwTUNHRExVMjYzSXdGYVp3?=
 =?utf-8?B?Z0JWcTRHWFdCcm93TU5OS0NSL25tSU1FQ3N2bnpqK01oKzl6bjJJVW5zclQw?=
 =?utf-8?B?L2pKTTZWRnJPM25TK0NFZllEZjJRbWl5Ni8zMEorbWRLWmlnVUhheW43ZDZX?=
 =?utf-8?B?S3N0VUs4VDhxdVlYeVI3a1Y1cXlwMUh6RGNEeTB0UVhpalJwWkJUbmVXbElZ?=
 =?utf-8?B?WDdwRW01RzRHMzdpWmpvSUtuTmRoQkRWM09tdXlFQmY0QlBKYUlPVnNGTXVS?=
 =?utf-8?B?Z3hIT25yMzJPUC9TY1hxZ01ZbytHMXlFdDJJaUpaU2pkdy9MTlRVWUQyMnBR?=
 =?utf-8?B?a3UyTUsvYkZaZmhWVWRVWFZubk16bTlRME1ONVhVdFdaUW1IeSsreFFpK0lj?=
 =?utf-8?B?UVZVZjgvK0ViRjhDRHdWZEEzNzBZRWY3UFoxZjZrZXlxMTFFa3l6WXk5R0pl?=
 =?utf-8?B?T0Y4MTExZnhheU1wRHZSV0FBV3hsT3NhQ2lWM29xcjFKd0pOM0tPdUlzUVVM?=
 =?utf-8?B?YkZ3NmE3MzZpYzZUV1drV1dOQ244aHZiTmpzaWpucXZ0RDlNeVhhUlhSbmlQ?=
 =?utf-8?B?b0NmNkd1NG81NkFKL3p5U3ZpaldwN213cHBOMzN5djV0VURkZFZDT2tsYVQ3?=
 =?utf-8?B?V3ZMSUZVYmNWRjRuZGJsbmprQXNlM0xpc0txaVBtb2pKcmhsbXJLcTRrOHM3?=
 =?utf-8?B?amJNeU9SOTBmRWIvaExtcDNjUmxyaW0yM1B5NC9ueGVicHQrM251L2VjUnRw?=
 =?utf-8?B?eUxTOXZTZXI3b3FPcDJSc0gxbkZTWGlFT2I4MkhQQURZbWkxMHdwVXZURUNo?=
 =?utf-8?B?NjVXRmJzd3B5YVdWeWNDUVB6U01laHI4MjhabW0yeUk4am83VEM3TjlieUYw?=
 =?utf-8?B?MDE3VC9JQk1PRVVhVG14V1Z6ZFlOeFYwbDlRSHQ0R2ptQlp1eFg0NHhwdmlm?=
 =?utf-8?B?QUQ2RVBBb0lXMTRxS0hVRm1tcWhBZTdyanlqRHV5NDMrb3dqR0UyNXJnWWtp?=
 =?utf-8?B?YmxHZ1k1RGdLd3VpQjJxMXhCQ1lJa0tVVzBqNkdMM1I3TEdNdm91N2NNcVVF?=
 =?utf-8?B?UFpydjNZaitvWDVFbDl1SEpaL0Q2UkVQdzFmd2xsdS84OW9SUHcxeERuMFNV?=
 =?utf-8?B?cmNuaEQrWXNHdlJjQ04vbllzWWpkRy9wRm1jZmxEUU4zcEZHeWdlRkkvdXgv?=
 =?utf-8?B?c0o4NkU3OENPdDZxandxdW5BTTR3bFovTHd6TFljbXJUYlBjSTFQOUxaLzhy?=
 =?utf-8?B?amc0TlI4b1dtaGkwK00zOHJBMWJYYmgzdWxNd1hkczh1SXBpb015QUgvamhH?=
 =?utf-8?B?dkZRTGVCWUIwVTBCNWVwTDdGVHpFNjlPazl1a3l0eGVrTkxNTis3UT09?=
X-Exchange-RoutingPolicyChecked: 4j5BKF9zieZv3/sfyWwDJVnQfLOFU3vW7DNkbVroUssBE/xBkZNK4uQOWKT/i8nR4Orzl8DUUsRc5ktMZMCP2UtHNpD6bNGNJE+5iFuuLaptEFNIn/RT9kiShrrp3kbZcQ+CLNEZ+A4r9wh2Q8VUIEZkXuYAZ2jC5v7JTO2C5113zI2Ph9RsEju+DXPO1w17Aosv84MC+FqgxHwsMXFRTt7koo4lG/nQmYkxvCPWZJZNudeDOVIwvhGWfE3JGu7NmeQdwLJIDK9kMj7FlfylnfvPIPpLI9CRW8+sJeBlQsvsTtYKG791Bk2PciUwj3cMeoABSzna3NmC+r+iApuftg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be856db-834c-499d-76b1-08df2515ba64
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 08:25:36.2616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZs3KJMTWwA35k1Q24VG7H9FiQg7v9cVqopPBTr2oKrlus0AKb8krT6goJfC2rkmJbcmxaYEAF7eKK698KqDxRQFfs2P+17kPbHXBzq/wfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4EB9556A6
X-OriginatorOrg: intel.com

On 10/7/2026 5:51 PM, Mark Brown wrote:
> On Fri, 25 Sep 2026 15:59:13 +0200, Maurizio Casciano wrote:
>> ASoC: Intel: Add Yoga Book RT5677 support
>>
>> Hi,
>>
>> This series adds the Cherry Trail machine driver and machine-table entry
>> needed by the Lenovo Yoga Book YB1-X91F/L with its RT5677 codec and
>> TS3A227E headset detector.
>>
>> [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4
> 
> Thanks!
> 
> [1/2] ASoC: Intel: Add Cherry Trail RT5677 machine driver
>       https://git.kernel.org/broonie/sound/c/5a0c90cb911c
> [2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
>       https://git.kernel.org/broonie/sound/c/a0448ff85187
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
I'm sorry Mark, didn't find time to properly review v9. However, given
the number of comments of mine addressed throughout the entire review of
this board, and its existing state it LGTM:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
