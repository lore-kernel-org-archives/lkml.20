Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011070.outbound.protection.outlook.com [52.101.125.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA30E2571B8;
	Thu, 15 Oct 2026 02:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031746; cv=fail; b=FtYag56u9CKIZ33JDIrprXrULG9gqgSttr+MGoAt5kAibTA3VUjyZz0YEOTLPoyw6jJerFpawlRvizp6JP9IA9EJt0MBLHysBfD5sO2eKgdPSNQXce/PhTOVG/0JcjPWJoG56tWEy5C6uQSuLtRv4/LMTtabwb33a1WpeDIXVis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031746; c=relaxed/simple;
	bh=jvuQwC+NJbPPMVOxFe1QKVtdPALZ5ef6Mrkcrdam4Eg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Xa787e10icIpy5T7jNZHLbVMKfNRKCLy6rdTNaBl4xmOVD55928AvI7yIA9i3UcmV8FXf3RZ6zkVretRPEf9zUKtDi0ALzZ6kXF1HNw93wko2JlITIPLhnyOAOjwddwCrUutOFjRPBXl3ltaObnuX67lXPR4HnbNtK+pl+ySex8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=l4ZQ1igC; arc=fail smtp.client-ip=52.101.125.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="l4ZQ1igC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtnihWP3OAyL5xg5nlrIrXjdYMNThmaUgatKZEcWn45K2DHAQWPIL1YgD6Bx/XxzhrCul16X2qV+QZyq5o72Nil+TlgVPv9FvhRHY/kV6aZbejibc3ik58NJalYhFeimGDyE9OaCUMiDdhMm8eWAt8rSm0jajRtCJuHKNMsW4jSJIW3WR7l0wC2fNa3LCdPqhowNTWGoV5vn/PNht//3I06P3lWYQKZTEBLbJjYJKjcixbznBo94/4jpTrT1v4ZKAg/ym+Y9Kxv3j+8j6QqVy3EZx3UBhBpFIzPWl7dqmAWow8zN0TOK1hgwhyIppbfKzE5LoFelFFpz1yln8vPdbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTogCn0JSYB6w/kPzwjYV9roTsldqHaPF05rTRPF7YY=;
 b=Uy5keP2sPVAQ3qWvAePnL+O9ynsI/SNyf0yG6OTrzSvUXWxB5UgPadKAKGHr1gGumJBkuSL+MjrqbQzlN+Td1C27/uA5v2JfHT8vxSLRGcQirRW7OzEmN4NxNDIA9xkF/IDs8/gCo1ECoU6BjT9fWpHNF6mdAHxHFwukkjSjO/QMB9o5Ne43ilh6z7b78gqMWE3h5+/lJ/ykU+vF0vswXdvz0XgfujyaWd7X2RpHFohKcMPUVzvwfdDccrPq2PmXAOnMnJa5Qn25nOepSg59PzqTPoCABphSHUouf6t/bzUPP3UyUpuPHwmiBCKWKi02yDTf9WgoB0cvublnufVrmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTogCn0JSYB6w/kPzwjYV9roTsldqHaPF05rTRPF7YY=;
 b=l4ZQ1igCNEcKXw+MDDFXWQP6UhozbmmbOqA7qLfqE0caNDrgUUcMRZzcdRt2cWZRozIqCxY5TW35KYMufDUtyowQieDsiiHlyE2F9qAcQJ2mvu/NnkpdB3H3uoNYMEv1V2HzPwDSriHuqttidU9TeXSWxt78+jk9j3rt5zq1aCY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by TYWPR01MB11147.jpnprd01.prod.outlook.com
 (2603:1096:400:3f4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Thu, 15 Oct
 2026 02:35:42 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 02:35:42 +0000
Message-ID: <878q3zd72a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	<linux-sound@vger.kernel.org>,
	<tiwai@suse.com>,
	<perex@perex.cz>,
	<amade@asmblr.net>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/7] ASoC: core: Create new components in sane state
In-Reply-To: <eb66c781-0c7f-4e37-bde7-658355f87428@intel.com>
References: <20261007133353.455185-1-cezary.rojewski@intel.com>
	<87pkxexyr6.wl-kuninori.morimoto.gx@renesas.com>
	<ed059f1e-2390-4e1d-bd1a-cff08a3441ad@sirena.org.uk>
	<40696247-e763-40d8-9d4e-338047cdd4fe@intel.com>
	<875wz5yo67.wl-kuninori.morimoto.gx@renesas.com>
	<eb66c781-0c7f-4e37-bde7-658355f87428@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 15 Oct 2026 02:35:42 +0000
X-ClientProxiedBy: TYCP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::9) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|TYWPR01MB11147:EE_
X-MS-Office365-Filtering-Correlation-Id: 885fc4c6-e0e7-4fb8-6fe2-08df2a650204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|6133799003|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	+fkQytaH1bNhXY7r0+XATqMJk9w1hsklSGe4p5V9vmZ1APXSPypBzS0H8zZL9cEAiPy1l3s0KnTuQ8mTX1pumGP0oOl+ZCncKLZsp5ka358ZSxn4oJq2jWfhi+xEsuhSwYADrQ7rzTxkiCbJHwe0+BAG8OxFioA5DrYhSqU2ebdMzHvoI4VgpOJJy8qfFIga4UFMZ0NpbBs/dI1aOHUDAVyVsM3wsWD2EtnOKA3FJa+bFgso7cEo2FFctaXvWNzi9QMhmNrQxvPTTRyTXJaU0zVRIMTncD7A8TG5YX00IX3pP8NH7iGES+8OFHl268nwF0OooxkpWJgewanhrUvI/7Aqjf00ET0tvBrEEbi9WkOAp9cLy8rhm8kLM5qAhrVJ4JW6RI1wXJfCJ6Jl47aeQfCd7pDyWBisQgvJCIcCDwe6u9LH8A+2DHgzNrrp++pz0v6BClKNCpSBnI19fjlxhReQyrAGDZM3KvHtux7kpSThaXKwfeigzZFDaqCQcwRj7PiKP7YAxbRIkgUWMZpCkggvLIhTXUYe+SUzQqV1syDRytZwlzdXKHrloF+mpCve/nHT6oI1Uy/teLS834pWpHqfYlus8E0QosObNWL9VQXrNg6a7dtlSTLLnejuzGoG5sFRgm6GNB8U+qI0Hgmp8e0Gxj2vxMpAFyiA+O/w2FbkigzWJ5536cm02wUBfvrlogR4fjpewThvKfoaL4iC8Ja4bzS3Vp4om1seFHcGrJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VNMTyR30cKzRI8hRLQEMfa3fulxf+A+wf07li9IPI+vAlI+vZu5J7FbQqZp9?=
 =?us-ascii?Q?NP+hxNi1Utn42Ek9iRCpI3kNtllmvJOe/T/8DyIkPTY95rB5DT4dP+HJXGTl?=
 =?us-ascii?Q?3vLxet4XL0yIpStbU2+YvVJ2kDYkz63vwuNgTbOzoUqM0gptxtFPV4xWEbFl?=
 =?us-ascii?Q?ZMwqHeNM48GZCVuSwjuQVf3ykdNKczFc5BoU5aSGrSinBqaS6AvFN8xnM23y?=
 =?us-ascii?Q?cJAN8Zkm+OWUERPdyE+eJMJ0gjFZoz4LQHvzxSk2uI38YjYc5RlBuvJDvjeN?=
 =?us-ascii?Q?l9sNuquLDIT4bKE+POFTZz31sa9hmaUKO7P/kjDxcCiuc+ZZFWj6HUE1RPL3?=
 =?us-ascii?Q?p5P0zf0bwR0K5mn6N6RkQ6Tuqatnag5Ukt6tnUNRcqnEcAdL1Du2H2bR66CQ?=
 =?us-ascii?Q?rLJ/lY67H9YqlyixKXPN8H8zgTfOt5XVua7OBZ75XStu2D/P0FL1BSGjIVwA?=
 =?us-ascii?Q?yGOTy0X6OvrzdihgFkf8qD48QYhxLUJ/0Gi69nY0hW2PYPob50pDayu5jwjt?=
 =?us-ascii?Q?YFs88Q+42KqKAtIo0S8gXiwOrPYfMlVGDOxl3UG4GeK91IGj0PfEn/7IK8nT?=
 =?us-ascii?Q?+gCcB9QtHNAvXfCa510WfexZDDB9fzK5PGUTgSTPRQx4PfSUtXReJkCLV7tX?=
 =?us-ascii?Q?YUN8M4LIMfQwnmLeOmqH9UJ+WH75JeZdeLv2KUxsjlhxuDUqmcZMnLJO6fm1?=
 =?us-ascii?Q?gwrfFvD8MH1pRhlxSrXBL4dRbpX6NXGxaEXyD8IYnRnZKPya0tlL5ZP79HZi?=
 =?us-ascii?Q?S7MQFqDzwW6zr0eVCzpewnLTKtHaUhU1/Aol3VPug+qV5jH4C34L9WKUSSfZ?=
 =?us-ascii?Q?fFtvJsCneJxfntUqTCjg/Y+hqRX7/x8KIGSumjk2qQUAKquLp4CYqi+cfqOh?=
 =?us-ascii?Q?JbrEFwhWh2Q/O+1x/zHcuRksGMuH8H4YmXtQYnPgw6gh9U9rcwLQ56b8dnjd?=
 =?us-ascii?Q?5cnCRZi48BY1ByMwdRmxASpa6h/7cBg3ND6BjGhRIWuDW2lKAcsVZihs/LKt?=
 =?us-ascii?Q?nYhW4QzGaFiu4jjsXP98uzWSvJ3Cufl4fSels4WrTh1O9aK/2stqN/B+SE0F?=
 =?us-ascii?Q?pTCjDPXm5UgwUbK2hpYDm+eEkaR6gZ1a84qDKwOFZWg/yVYdTvWxN3GfC17k?=
 =?us-ascii?Q?dg2Y3trqGoQtP5fTyQNKkN4e/JBQVl671NhtGZtA2zo5r1ZCC5xTt/LiTV/u?=
 =?us-ascii?Q?ORLJf2ASEX/75SNZCqNkrhlLqNLsBpvxsNbaBXag0FwM4rv8gOr+moglU6V6?=
 =?us-ascii?Q?FWDtxzsFIAYCXxBNUVBdIgX1lem0ui+zEWVJIsrZOq3mo5xGBoAYMwsKVzYy?=
 =?us-ascii?Q?HZjioeQbc3sPHDQUVMdqcUnEsSAaHND0/p511GgN+rFb5GO9NDF5nh/qFeM3?=
 =?us-ascii?Q?b8nuK3eeEslw/jaHUAyGG9FrOomwnwnukT7+PBUSVUajuhUZ+b7CXk4ul2Ux?=
 =?us-ascii?Q?gs1khrOuIyMG75G3G8AgrnEDGXC8076qM18Tis+zZQvI8IbF16w6VnpAwsy3?=
 =?us-ascii?Q?Dufs8Sc8eq+PCtVbcOdB6eKNX59AlKk2kxGbE6P9z3zqMeJO77IaU4KtYw6a?=
 =?us-ascii?Q?8m3gLmdmCL6gbZt3TUpBuHcDM50l+oEQbkcHPm017aF1hDbhJsE+rUR6MGMG?=
 =?us-ascii?Q?6prdEVKh3owM2OVrFEtJjXWbPMC8eANqTNCAJN7X/lis9clrU7jlf3pmjupu?=
 =?us-ascii?Q?VANVGUSvwqQxkmg473L+7SXHZspr3fam4AhMC2iaxV6AhJWQ6EEP49gnagHz?=
 =?us-ascii?Q?LQOGW+BqOoM1R7y/x1FH6v+E5dn5gjTAB2bf26WOcpFBdQAhpOSc?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 885fc4c6-e0e7-4fb8-6fe2-08df2a650204
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 02:35:42.4813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOVDUyg7Na95unNZ4pvy/9CwAMoMB6xU7hErd/DYC8IuNRM/oFhLaSkcSTVIAy0no/0t1aqCeH4JfTF+k1CF9e6QWiSrU1faKVMoIVFj5591vnY5D50dCo2eEn1fV2TJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11147


Hi Cezary

> > We would like to keep snd_soc_component_xxx() naming.
(snip)
> I disagree about the naming part.  IMHO there should be a clear division
> between object-level and general-level functions.

Yeah, I agree.

I will update my branch patches which will be posted to ML

Thank you for your help !!

Best regards
---
Kuninori Morimoto
