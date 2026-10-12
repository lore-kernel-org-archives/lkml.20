Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2163D6CC5;
	Mon, 12 Oct 2026 23:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791849172; cv=fail; b=iwhIp/RVtnQLhXhnMArBt3BV52hQKYUH3vEDF/DnByKI2mxXf1uR0v5/Pt5nvx+0UQCv/YL7pvM4R6AKr8U1YkmkxqlWbXAWAAGB8sCigPlQO9b32Vc0NOu0YGla/hvJFrXjFsEGK5/S/6kvEhmehjOfyTTEiyUGzgvsMNnB98U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791849172; c=relaxed/simple;
	bh=K41+GPuVBa0vBzD3kyelztu0tMj2NbaC+6T33EEs3SA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PCXQazLanm5KrKENnMnE81wPB28rtitOdNdyoGBJMEvnhaX10aOWvoO9urWSyEI4Ins0zQ1OflVyZdxm8N4ENFSJs50O3MNBXD6gxTrULJ/UjI7ivq3uc68Rjq7Xxwh8iIqhqccg23lZ+15L5f+qFKUXASARaNQmtlygg7Iuu8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YFO0nD36; arc=fail smtp.client-ip=40.107.74.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YFO0nD36"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBlpih96cG0NjYT4a8XPSgLZVwLZ6vawyxjdx/8uIt6wM663hhmB49QhWzSSS32rEGX/XtMHCzBjLjwOikVhOBlCk6w0C1bBh4iApLZtAc7GUhga9/64HaM/g0QyZZSmezMBMxOzWqO2FOqMkKpJjEW11wR/yn1c+vxUDMvNYi1r1hrM3+fib5Qq46uQZNeAu+mx26MmiVJR++stCp8ru3ELmXc5asJd15xWpVm6HDLFDA+Ck/byPXNeVAh/QgVAzU/vs7wCxkgMkumh/5XLOTyMtGhleIY4ohB5hWdBvMap4J3jiEWFYHdUDFCjHLbWCZaK+At1L2NtqI0sstQV1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgxEjSPVmxtdotsa137Gf2dfV61A6GHW26wpQajzL+A=;
 b=ltEl2jFzKzi4R/cNBGFXP9RkIZFbMizQp6wpnuBOl40Z4H7rfd6hH7cjr7l8+BZ5aNvYRYBDOYW+XcHVU1Ke+24OMOnaN/BdvtjwhyCn9DREgGdXSKQFgkbpiXwqPeef7goyk39hfUfjnV4eR7n5AwvdirknrZkMriMgtcDJtrPV2FkBkE1/n4wCzf/3OJY6Vq8+Fr0h1AHQlGiOrFLUAMZrLVUiy5DJZrXgHOV5E5dEIJ89U4pdYKC1xv8347UknpH8MP55Ew5eFnMoRVA/Faxb32Z0ArBvFLa+PAC8I519i+IrpuEM+/zlWoXXceunD9MhU2rWZDpLvtyTR7uVqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgxEjSPVmxtdotsa137Gf2dfV61A6GHW26wpQajzL+A=;
 b=YFO0nD36PKCf6GTVgGnkwTvZCfRO1aTCvkV0Z3HfQeClyJUWf8UhbSTz7ANf1E0tKmwTYpTfjlViMOiNvZ0I7uOy2Hjj27Qljshk8yD00v5iJujaEV8b2jwZaGy39f6r/jVE8TE9D5NSBS+v5LqwrEtORfd8d7sOcIPJ7ZneIrM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by TY4PR01MB12734.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 23:52:46 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 23:52:45 +0000
Message-ID: <87pkxexyr6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] ASoC: core: Create new components in sane state
In-Reply-To: <20261007133353.455185-1-cezary.rojewski@intel.com>
References: <20261007133353.455185-1-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 12 Oct 2026 23:52:45 +0000
X-ClientProxiedBy: TYCP286CA0365.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::12) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|TY4PR01MB12734:EE_
X-MS-Office365-Filtering-Correlation-Id: 2676e0db-5955-4df8-1bc8-08df28bbe9e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|18002099003|22082099003|10067099003|261009223027099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	d5dfYYRf9z1PWyuRjc79WdlQynW9zy0on5qxjSsDav9ts7sqUpLknecsFtGx0b7I7I/9kqoyr37lPD6lpPXcv8iW7APd2mkIQZMmSJ/Fe/iNJgH04idkH3TsuG1Lpw8Wqn+nljs/wt8ncjOrtkxSfOuPnvO3Duph4Jb7TyQrJuydVKhQUWHLgzYMp2FavL5lD0LNcBYlDmSWZRpHi0a8RH1lntRdNOgsvsHxgvfTf53UV4G0169epIR3KFeuZB5DL7S61+e6d9P4UyMH+qZTZDRZI69V91XZsdZ6DACI9GPDEfqAQLZlHS1sv5FyNCcKu5ltS1Bj5q5e9jOFFLPOomKFZx8iaBAnd0suLr4+9yvAwuBqHCzh7Q0ZITbKloJ4RG1YxJdJ2yAKaKnPfsDSyndFO6gU8GuJyScTJ5lM8SyxZDes5h1HsrUjMW5ZmjXWY1LyIyJImQ+8NRimRCa6sEudwC4BGJQgs/8gXsA8o/LnEwUcjHuTVbRT3qNzC2sqQmqK8eqeTqOb3JWUHeuEnfagsRjKB2tuYpiE8dDGZtidWhYB5mh1yanqvECT5WKkeCAaEzh44+mdoZ2Bn4JbWVPHvuN6d14iZVTfiqSzQd0NnWQNUsfxxs92ncDiSdOv2K3tyTDwdWmj0sbThyTEIUPlddAwSViMKq/pU0Pe5n0z8rFKmMGk9q0MQlv32aq7M8Dvl2Mxl6pOgw7wFtmCsjpM0hqVDg0JdQXQE4aIwjI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(18002099003)(22082099003)(10067099003)(261009223027099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9yplrUiOuT/J3xUwN10fdBrk4fCMuUOhgARSnX6EVlBb8bdvZ5St0n5pFW39?=
 =?us-ascii?Q?Azup9CXvthDijdVljxMZaJXwuF1kf2Q8Yxq9VwDMCmC3aIX5sVOOwhp+xXxm?=
 =?us-ascii?Q?2aKd933mvg4C4AcQAWA/VWO7CWwc7yaB0f+enWXL0mS1WerxIbH1CFOCK03i?=
 =?us-ascii?Q?OZXh/OBUqhRPymoEVtmrY2cyZLkzRFkIoHLORiCbPOHcALTg+HqbVzycyR5K?=
 =?us-ascii?Q?NNPMSdZvlRxKezYIQF8+k1nBxCXHozpdClRM/bncNoXXkSja1QZnQG4X7w/S?=
 =?us-ascii?Q?M9FlJWaDHEBMnZA6/iaszf3aIcBT7D9Sf2xWRE6VfThtwzopaAQ6adF3Ao9A?=
 =?us-ascii?Q?gmc3lHlfQMFmltXhETmDb8IdnjtJRqFiYOwTqVSYUKysArW9mjfjTyDXBu2f?=
 =?us-ascii?Q?pkUgJkxJxv4p3sQgIGqsr975xLpkDeuN1PgAcdgAe87ygZIOQ1XFzMYpRFTX?=
 =?us-ascii?Q?tgRFtWrZF+HX/Q20yFAoIGk5+FEEuiTiC08bJmcEuX5yAfzxYEw3ywuB6SSb?=
 =?us-ascii?Q?BCfSF2Aufs2ol3c+3jbJfN8FIEF/sPGhrbGZJS+oIu8drMniHZjcUyRyZJsf?=
 =?us-ascii?Q?A+tXhqGmp7ut1t5i4LugZn3OceCAvZ8y1zIDUUnbZSUYrGqLdOug2PRosBCB?=
 =?us-ascii?Q?wptHdE6l0VC/LabzEkYEu37p2kblQHMQPRIvpkoH0uGC0ZDjPW7e2k7C8WNP?=
 =?us-ascii?Q?75lTxF0oua2OUiZfJTGI1a1q06KCug5OkLPTQ+qAmOQ2dL2aZ75N17wA1+tg?=
 =?us-ascii?Q?ZJUxSdFbRhKZDHHh1CpqXLbaSlMW+4ncsc+sf5Ndybm8yBOJOZ+dY/JI6slg?=
 =?us-ascii?Q?o0EkvyQDdV756mcku6cE2SfpHSp8Pwe5iaVWABATYxu74CzeYOswcu+PlLXp?=
 =?us-ascii?Q?SoOipXClNNNnu+C3XBhN9t1KcYN3M1r+Cq2Fc25D7OKExLeQNuLQolHbux3J?=
 =?us-ascii?Q?7wMzRf1m3wSPHOLFRnyym9cf9m0xRHhhTX4VTS8pGp4E9dEjO+gzrtjmW7it?=
 =?us-ascii?Q?v+4fcRNHb5Dcjy2pMtKAiCyus/JnUIpRZOxyc6bt7Xina6/77RJDNatAwNAa?=
 =?us-ascii?Q?eeL6XuNaQg+T183TxHPPyzIR26Ys7ar5U/l6zGrLzTnbirfH0jqoDv3HMLws?=
 =?us-ascii?Q?u/n/RdrUCrc6RHs8HqOTH/5cQKnlALBUL3+nkpDCMJageEglyjP0r4MIcNDN?=
 =?us-ascii?Q?56BxciypWXi+BOrzywmxPyrzU71F7aH5b0cm9nqjeOusJb7zOQCZatF8Yp8I?=
 =?us-ascii?Q?NzsX+UI9GlSibDe5kdvBRJTHM5PWm08zfDk0qkJnzwb70fs7RS8EX5aHWfJa?=
 =?us-ascii?Q?303WiJn3G1q838YxM7RFO4g0f+moE5N5hIalXfe32q2DQIH27j88m1obpf7I?=
 =?us-ascii?Q?okSfhJDuHCVjqvE9LbwDcAeQwYLVJCaj9nLn7WSpjPyEgI07ZOSEIrmTLZYd?=
 =?us-ascii?Q?ZFSq1JFl97TANndmWlbaQDbvOvG6NOuxDIUTTMmrjlVhXl+NMh/PzhPvl+jq?=
 =?us-ascii?Q?FMyv6Hd5iwxvZt/n53n1P8529Brtg/xnZrwXJZi7NCVu7SI9BsaNZvAWJ1qG?=
 =?us-ascii?Q?Z5qAlXOkP5TMKes3aMP8DzznW0erthTam+EjCwepzzvG/5H9z8EF3O9mZ1TE?=
 =?us-ascii?Q?wibSl8ZECFsC8qeiZYfRvO5zoVZHLQmekab112i9I5dK40Kh/5xNo1RbZeDJ?=
 =?us-ascii?Q?sGL/L8C60x/0JrFawEE7hsvb8Ao+UZQS7FD0jNkvOzLyiPBtzl2gsP1LGf4B?=
 =?us-ascii?Q?6UsvppKFDhEo5aBJWdNMRbaR+5YnwkY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2676e0db-5955-4df8-1bc8-08df28bbe9e3
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 23:52:45.9173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8gtjUe8Yvq+76niEtydcs2t2Km123XgKd9WT1yrnYMOQLSHLkeYpLNxmOs6Dyu4HHLE486mmQwH72kG3JgubpjTDVlPiblpQX1MMKu94dBhlicD1y0siZrcET+NKndD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12734


Hi Cezary

Thank you for the patch

> There is a gap between snd_soc_component_alloc() and
> snd_soc_register_component().  A driver that obtains a component object
> through snd_soc_component_alloc() receives an object in uninitialized
> state.  soc_component_initialize() is the function responsible for
> bringing it into a sane one but it is not accessible by the framework
> users.  Example of the uninitialized members are the lists e.g.:
> comp->dai_list.
> 
> The framework shall prevent manipulation of uninitialized components.
> Introduce snd_soc_component_new() which acts as a constructor: allocates
> and initializes the component object before returning it to the caller.
> 
> Given the quite recent discussion related to all things
> component-register [1], decided to stick to the "register" wording and
> renamed soc_component_add() to snd_soc_component_register().  With that,
> register/unregister pattern is kept.  At the same time, the update
> brings a clear division between:
> 
> 	1) snd_soc_component_register(component..)
> 	2) snd_soc_register_component(dev..)
> 
> A driver uses 1) when operating on pre-constructed component object
> explicitly and 2) when they want the ASoC framework to do everything for
> them.
> 
> Parameter "name" is added to the ctor parameter list as it is one of the
> fields that is always initialized, see the 'if (!component->name)'
> within soc_component_initialize().  Private data on the other hand is
> not so opted out of including it.  And thus snd_soc_component_set_priv()
> remains intact.

I would like to review this patch, but unfortunately I'm busy this week.
Actually, I'm now posting cleanup snd_soc_component_xxx(),
which has many steps, and is now under progress.

I will review your patch next week, but I guess some of them (= not all)
are conflicts to mine...

Thank you for your help !!

Best regards
---
Kuninori Morimoto
