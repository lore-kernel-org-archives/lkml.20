Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010040.outbound.protection.outlook.com [52.101.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635B61A238F;
	Wed, 14 Oct 2026 03:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947300; cv=fail; b=MUBTG6oiBmTYQta6oWc9sRGi/o0pJGLlcOQ5xkzNcDf2Jrv48oDGWeHuja26AAzVhodacjRZqWIj2DQjnnwr4+Du2eVb70VmziOtYWJVRO8baXNT7y/Mu9VTRC8CSNSlC5lXRYrBal6bnM+P1r55AJRr6ePTwbkq/l3Sh6BXy24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947300; c=relaxed/simple;
	bh=ZCl2zXdlaBpYOOj58SMDJxJpBOQomX8/urTAbyqDXHU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=O1ZRP/gw748nzKWWwqINO/a6GUZU02gFmoKpzOSrBs5S0U36lpSzHm4uhiHQZKMcx//ixbe9X084jkMlTaQ7h4bEDm3F3TrMR17R8vN7VSLIDpQJbX7Tvrher/Hk8cCdjLlKAZPlj643X+KpH9w4yqoa74qSNJ0SDiBQQt78/b0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=i75GGQbu; arc=fail smtp.client-ip=52.101.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="i75GGQbu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJGVjJzbFHM2vZhRYiD/cXBcetqPr2/cpzloc5ni++C+FoXOFpOzHwCsEASytzGRFVfTeGWQjaEa67Gu9OJZs753b1WJsAYmHT6op5UUEt7gzAvtNhXtv9KkE8II4ltoXpGgTxsyP/x203Wyirujml++vAMjw5T31HwAvP4Gm+fUTcXdt7I/OupOut2ITSa0qMCU3BojQuloQ9Mb6Bi536aoZt+Ooj4K80KZwDrzJILOdpYGzkN6MnM+rFHxy8cKHXVVv0JbeUWI9qtVlPRvAYgiMr+Mo+4Zh83jjuDqrcmTEFEGzxCtdPjP8v8YMXfZIdBgBN1okgE2p+4agUNE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlMSMVlWKuiqzKtuTo6ZDldSvF5hIwr6IrX/7aoF4SE=;
 b=pUSPr55P+aphcumxDCq/oFLYsv0p0VgnLf08YrGEw9lvgHYhFNo5q+qFHK/i1Dyrx5riFFtAFbGY2Nb9PCjHHN/ybkrXJPJlxmdwHMJWRaVhsPS2F4/6T9eA8dKqltgOBDh9ldyE/b0dEJyPljlDSRmMtSI0ON652PQciLbBoGvv8GVVtkJQRBTwMDH4IKxBtCgyQpkkKB18N+A0rFNXECh+WLkpEUj2SgY/2UI11MYgfj+vQ8htQgajyD5qsgqiOlL7n3r5pPQ2bo3HoCjv6wseFMx5SSp/qKCWM1sDx1nxIV7/eFwhiczgXRbHFjd7rK1moOPVEmNleFILLJh0EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlMSMVlWKuiqzKtuTo6ZDldSvF5hIwr6IrX/7aoF4SE=;
 b=i75GGQbu5CPjV6PCtAoer79POpMoEBrjDh+xklEk91vX1LTH2y6mq+jjWscdRdqzgjcIbMy27/4tQsX0VqLWUIdVTkbuV06rzDPdhqhT2VO1so4oj/JUwwjQDTjiTc/dEy0IBN03rdj8XFAGD0717t4IKSn9dnkxLIxiQYI8Oeg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by TYCPR01MB6996.jpnprd01.prod.outlook.com
 (2603:1096:400:bf::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 03:08:16 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 03:08:16 +0000
Message-ID: <875wz5yo67.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	<linux-sound@vger.kernel.org>,
	<tiwai@suse.com>,
	<perex@perex.cz>,
	<amade@asmblr.net>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/7] ASoC: core: Create new components in sane state
In-Reply-To: <40696247-e763-40d8-9d4e-338047cdd4fe@intel.com>
References: <20261007133353.455185-1-cezary.rojewski@intel.com>
	<87pkxexyr6.wl-kuninori.morimoto.gx@renesas.com>
	<ed059f1e-2390-4e1d-bd1a-cff08a3441ad@sirena.org.uk>
	<40696247-e763-40d8-9d4e-338047cdd4fe@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Oct 2026 03:08:16 +0000
X-ClientProxiedBy: TY6P301CA0025.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::7) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|TYCPR01MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: eb43eb40-071a-48d6-3a69-08df29a06480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|6133799003|18002099003|22082099003|10067099003|11063799006|261009223027099003|4143699003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	XXxZyrKDse9IV3ACrGW/8e0CqoXyFh3s4M9YMJTQiVs3GS/JQrxIpTc5arg9TRfbvgIUgp8zlAeeVIy09MuRljHIn8qeOS0ABAYh5btbzxehaE3nXDLvxmSyCxjeMjaGDJiLpTDq3LbpVuWn69CQibY1eYFD16g7xaMSUxrVzxx9Xd3BSVP+0Nv7OWm0zwJP9RLY0Byo97BN7Nq8ZSdA6TCyqiFIxbdxf9RIbDK+4Faz0vb2PqK7REsUsQZqM7LxgoFPNCZl7QfvE4FMY+bbWM8/Z6nV2zr4RxAHcDajN9Kx3fZdFXvTjS6LL9mhE6rFrm4oKc0Yxbn08a/BqFV1EqQG5TZx7Yzax20uuyptoEsUkwY2h4X7eUUKaNIj+Pi9z/7en2Q4B7q4dDb+zcSYS3kfEAYTiwcECHizKf5LuiKTC+1PpatIMvN2QlGobNGq65pDHv8w6KPSmuiyMSWT+0bgTG2RCY883zDuXhcERwWNAHeuq5GVgF1bJQlUwjfQ0RJ0UMPUP5fxg5Pnp5p0M6Cs+E2W1O3QqzuAqNxfmJNahVF5Lg/Wr/t9ydGkgM58u0Grx5bq4b8toFLCw9fRMawiz9FMUMei2NUVv0fXcJwQMFYF8U+wTdu1UhuTE55suiFtg5N5hPBh9bfPw7BRB7LuAhf4nnAaWf/rcJefZBmSa06x1T+U7t/A+GDBAuhbolXQql+7Fs3K3LjuTUGGSL2sIMHSRi6B7NXhzXpEvus=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(11063799006)(261009223027099003)(4143699003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dB65Q/KlqN3gFD0k2jjs+qZbXQXnDSdMWWL5jsKQ9PLzHSZ7SVedPeLy8/aY?=
 =?us-ascii?Q?BfK2COqdLUhdQxXEPUL5jG1Ij++LlBl4cmrkPan38ISNzq/+MytKFeuKOa2I?=
 =?us-ascii?Q?s65AmSfc2nW8R3bJ7wAsHiJh7sRpZUy11w3VYWB0kdcUtC0bNYjb8S2TiAUy?=
 =?us-ascii?Q?o+OmipPgf5edjLjuE+Rl9kb5DrVswcV4nY/NfMIFMBuYcjp+llB+9g9En3yS?=
 =?us-ascii?Q?WlBAi9js0UcMCyBxJDQlGuu42Ka9ny9fooLADGC7XBkpC2aHVTuHHqMjVjJa?=
 =?us-ascii?Q?FAkBt8f9OQtzIZSOPNa7eXvvgiy/8Y1owaeMi03jU2bdNYmlOVwyqPcr9esx?=
 =?us-ascii?Q?2S+i/eTI3CYwdQ9X/j6e9IznrJzr5NoaZ+vBK49X6PqOZYAAis/RXNoSHvqj?=
 =?us-ascii?Q?yLERL1d1x3Hnax01f/UFPnwvmtmMeX6UNT4Aqn9TvNEHNrdVAhfHXRBmHXFh?=
 =?us-ascii?Q?9k4417sSRxL4KXOIbRqJZ/0f4maudz7LGBgYKpH4rL6iMkiYxOqXRB9CwTR5?=
 =?us-ascii?Q?1YuENso7hY3muQnKkRbiUROc1OrpFQDMD6v7mgTH69hMJlKctdhcd/ZhlC/l?=
 =?us-ascii?Q?B5pg66rbMzI4JFoX5KsrtSYblHuDGJb4NGoaxpZ74EvB7dj3y7YY3bcm/Jfl?=
 =?us-ascii?Q?WoOyY3ufxzm0CD8y1Gtn6TGLbdztPK5r4vcfh0nfi7lLIJa4ZddX6HZu6s35?=
 =?us-ascii?Q?BzvGGbYIKrQmZoZrdPOe4WpxZeonbfS4MSxeii3NVBbgvz8C4Hum2bPycsBm?=
 =?us-ascii?Q?+5IS6uCjCJ7qJnVD5PE++Gl4xGVMrWlwZG/Dwkn96GaLooFge32R8uZzUhfZ?=
 =?us-ascii?Q?OegSRj7VV5pWSQVd5sKPf0IVb/Yra8HmWdPI1h9O6CLzNxbBX9lQSP2tQIpX?=
 =?us-ascii?Q?Moc19tudloPZ0K8pikGGaeWA9klBkF28J33dmxb9k+TaR5yJkyikgomeiGnl?=
 =?us-ascii?Q?GhsOlNXbxFGd6PRGE77OckN9b5Xyct0jutpeGux56uAWnBcCLpvh7JA1eavY?=
 =?us-ascii?Q?WbhBTp9/kosPY7dcxNCqaiJ3f2InJ10m8d5DriNFblYEcDuFKa0k24Rn1XuQ?=
 =?us-ascii?Q?gsJoUlQq6cXy9jzgzcuFJ/RzJH40iE05Y/mb7lwAfM4XYX66MHOwLbyTjA0+?=
 =?us-ascii?Q?BHF5h1GIy8LNVp+GLxgdB0CWp3yhLC/CfrsXMR4BEOLgWPS3k+7a3OJNZTXi?=
 =?us-ascii?Q?T2gwD5L0mN5q0lSUC9liJg4f492EdaL9m/tv7qzQJgbjGvLJ8Hf5p41D2yp0?=
 =?us-ascii?Q?M5nBo/ItauVy9uaASfeKXwATSdFheJTOhAQjm3qxPtKfr/PY3OUgzQQyY4sw?=
 =?us-ascii?Q?vSVAtdEnksRB2jsH6z+JdXBp8r4zZsN2dKFpDnmmbr4d1e6bVgVy+ati5VQw?=
 =?us-ascii?Q?ZEfSyVedou+SQDBq/JKb7qOIpxwaGQYRkaV1WuwLVkl547ZNMFbna9qp8hVB?=
 =?us-ascii?Q?I4OowtYdChduMEfaOHwJOqpxDXKSgmxolrA6jch7klVZQCNg+PWvA75dy/lH?=
 =?us-ascii?Q?29yosuwRSppAs65bmy4QhsZyf/xE4jUUN2hf8yNDkoULgtwTnMNKz7RO3DVu?=
 =?us-ascii?Q?yLhyIHxKEzGPpw2p2S9aID3wNhKzlHOueyal6V7IjyZiJkaz8ppyPQDm+Q1w?=
 =?us-ascii?Q?s8udPqV7NddQnYUHqkQ3yBpumFMQHqQO78kaOgNSu33lKAB3ccbPDoI5jJor?=
 =?us-ascii?Q?nAzjiKj8b33GEZQzmR/27n+BKRiUYz6DGHomlf2qgPrh26RgRdqrjxKrP+cH?=
 =?us-ascii?Q?T/PA+I4y9I72/ZS4H4fA0+8szx+Jsx7v0ofMh4j3mKIsd43sleyo?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb43eb40-071a-48d6-3a69-08df29a06480
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 03:08:16.8210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhEDIZmXnQLmUHMwlSw/f8a/JDa1zVCcLpEO/9k2PSZ1AHSYKX3dqMMC9M/rIjLx12GdLG10lF70MM5kO1ZOguJen0TuT05i/foBjKoyrMUh/1qiTYSxxjv7h3m4Tm3+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6996


Hi Mark, Cezary

> >> I will review your patch next week, but I guess some of them (= not all)
> >> are conflicts to mine...
> > 
> > Ah, unfortunately I already applied it since we're in the last week
> > before the merge window and it didn't get a reply - sorry about that.
> 
> I do not see it applied to the for-next.
> 
> Obviously I'd appreciate the merge as the gap mentioned in the
> cover-letter is there and the framework should sanitize the object
> before returning it.
> 
> At the same time, I'm here to help with any conflicts should any arise.

It seems there was no big issue/conflicts, Thank you for your help.
But 1 concern from my side is that the function naming

We would like to keep snd_soc_component_xxx() naming.
New ASoC has similar functions, it is very confusable.

	snd_soc_component_register()
	snd_soc_register_component()

Both are for register function, and the diff is used parameter.
So we would like to merge them by using _Generic()
This part had conflict with my (not yet posted) patches.

I will post merge patch (by _Generic()) later.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
