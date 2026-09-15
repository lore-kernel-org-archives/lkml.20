Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC64339872;
	Tue, 15 Sep 2026 03:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789442182; cv=fail; b=aNTezaO+2I3Jv479/qpwmBNkoiU5FFeQ9MU9bfbu3UoxoOutJZXwy3/WKC4kYkWywWEvgoWt3Me9NR5XzkiTGAkidTrf9KwLV5a2PvNmkqMwJAuX+UsZX97zrM1IXVGCI1kiIANXbRPWJUvkuQ+FGteB+RqVMWDFUapkUCLgmps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789442182; c=relaxed/simple;
	bh=MMHVSDY/SYs8XG+pHxI5dypCzTTzSc08paoieMIlrS0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pHAsCf9JU2Am5LMvN0owa6OYj7nUnFi6/FQpCuYexpBRzYu2Yc8Meuo5L7Fz3VFNdFayBJ/WTYD4GYulDlXzghconPMXAhp3R+Z07FCAD3/AjQ1o11e2UP2JahppvE+fPiglB1zNdxSnv80arJJ9KdlCk6DGw5I9J3dxTgflXT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Xa3XYKl5; arc=fail smtp.client-ip=40.107.74.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Xa3XYKl5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVkpbPuI+LG1QeU2XrHiaRDiWJlWeqKPJG2bvK0NTtxK3n2gMvEY6H5H0CzRgDMHJPxCg+immIvp6v294n5LPpB0IGCBvvj+rI/fGLofBODswUwsqKeX8zyCVkRMOje0KLviIlJL4z1aoFlkXKB94eku+qGSc96rovi1PmKKo+fWtLWNr7ulfgWLHIj7z+7A/KJtNCLOkX3vISoNZFv4bLs/mnJGQoivSchTwimTcfi4gfBMDEALuSU6LMN5x8zkYYuvsNKV/BgX5fXy9xnvsXv055wjEAbiSEz14/RRkg3QJmD7ifIWiVURF1G//ZUajV8N3l3Lp8tKikmPCuX65A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LM1hk3/ZXlilo652Yg8dnDXds5O9BN/Y4NiUZH88ENw=;
 b=xTTV3dPALh7mhAXfECURFRY1Yca15ryrUceJN1d07Ak6xEzBCFmU5t45vfDHeuyQ+3t6GVJGPsGA1HWvjkJSQSlXmUIVWuevQXynGsjxCJTi8VEM8Q85rrz4ZuTyBEES6fR6YXl9vWeh192bzu6N+nowKJTVvFvB4SzvFS5GpfQgcDUEIog+I3FupzG55t/Iv1KzQ8AsS25x6hbirBHJ6BkuV2CHJ/jdAEp7q+L1TvRNYfjILuDR4wF50CvPT0g/fu+3nuyrxSap50uk9RpHGhw8QKxoSRl4ES8LYpGX0ymosIlt/lY7RixWWXYXtM0eFkk3apF7BO01PhFTbMXjPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM1hk3/ZXlilo652Yg8dnDXds5O9BN/Y4NiUZH88ENw=;
 b=Xa3XYKl5Galj/4/QQYRt38SAcAeSFW9GfRmGIBa+y5JryLTWRjcPNmoMu9LSUjauadc5Ffhz0ouSRxXXH/cAYMPkrZpBP42aW/8x/L7OZUTTsuygxasX/OGMNEMwpCbyJ/AEzRpCBBGbNnsbxyxxkwjnpzm+AgrIlziExiqWTpk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TY4PR01MB13855.jpnprd01.prod.outlook.com
 (2603:1096:405:1f8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 03:16:16 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 03:16:16 +0000
Message-ID: <877bknrypr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] ASoC: audio-graph-card: Free jack GPIOs on card remove
In-Reply-To: <e682aeb8-9d52-4854-81f1-3b1ba38b48fb@oss.nxp.com>
References: <20260913102502.2805912-1-chancel.liu@oss.nxp.com>
	<20260913102502.2805912-4-chancel.liu@oss.nxp.com>
	<87wlsollph.wl-kuninori.morimoto.gx@renesas.com>
	<e682aeb8-9d52-4854-81f1-3b1ba38b48fb@oss.nxp.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Sep 2026 03:16:16 +0000
X-ClientProxiedBy: TY6PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::8) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TY4PR01MB13855:EE_
X-MS-Office365-Filtering-Correlation-Id: b1acaa43-ab41-4378-2229-08df12d7b492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|10067099003|4143699003|18002099003|22082099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	B8BJ4u6RXyqN82BdBJLmap9A3K+NEEHRSMwEb2CWm3BIlpz58E3Z0u1MrBjq6DrKQbLkjdiwdiWCsjSFkn5qon+EIWV2w4fvukVXZ7uIdDgvv4HZLt1Q2RBsh/Skx+rFROeehPNQ/GdyUNGXFXHVFRI/baBwgtwUlaOfDj2t2cNRHqLLRiy5oRLGj/ltM2FdoKgya2BR0Y3tcX7kxdymEltIAh/Ev6ZtW9/6gbReCM8bqqmJVCPkE4KbTSsvWfNgQKVrpc3wapIxDjYGq0R5k4r6ORe69FZ2biqcEx8nQMHCapIXFxd+gd2xw2OXYoiYCTl4mn7mxv2kfjMhIMsNJu0+qBJWOpz2UroE0REEGpwopabjLOTRzXPWcXrZxb3ZLg6IpYgq3fd4GNS5bRCCRzIM5HW5I6dUdyIh91j0MxU1d0fGAHXrNQZ2ONkrLej525I4IxYA1onV4cDD41+1eBE8HzhNgSLjew6x2pYmX4rrfoPyMj1H1TMkmLGVrmBmLFul5uK3jTPDGJL6O0tJA5V5S3CHYRXRZfbQr+xRiXJE6gMtEsGUK6yZlnnGjPG1FYd9MIcS2IGzGaM3TMyom3YDWFeiICGujG6PhkU7Bnxl5C6L+UJ9VDmbYFWlZYXlfy/W+PWP64tmqw31pJFyxFFuxp6N09t6n8s79ydYMY6QScEMNPKgcS01235UHTkhpEzUPVVGk91gM7yohpgElDVCDGb2LcE1S0qNaEj5pmM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0Opvw2eIGz6x1ckNzkFfJSq2CK3I9JHCiLzgPQ5ZVpGQNnO4GBx3nHETU97j?=
 =?us-ascii?Q?ua3uAq87O83DdOPDylZiF1hyiqlxLxHH+OWyli25KBMfSqkbes7aW5Zq+5gn?=
 =?us-ascii?Q?aumghBtGznZjRPKao0t/yPlNvFZQJ6JFrRj5L6EM2SrgogIhOTz/+kPAeyp+?=
 =?us-ascii?Q?5VYOEpZBTBk7fVFPifvsz3VrpaVL/JRUVpM67H4HpVqXQZupewW3jZdzf3yZ?=
 =?us-ascii?Q?JsW73OGrTSzpBfxHes0iReHpKUVVBuw7T27QpUyXozLHern3ZxVDJfBiab+e?=
 =?us-ascii?Q?hn1+kxwKrM4/xLfrSiDkrfTYJclnf/1SJrvcYq2aGzJAT8LlIR/4Zgb/cf7d?=
 =?us-ascii?Q?TCq6qdzM5fSaImog7/TzFMNFjsdeBJpCCujMvX3AvGY52HKaQxtniB/lBOHH?=
 =?us-ascii?Q?wocVlFG7f6P+ITfh/dqvaa7Cuus9bC/5AbhTp5gL5aPyJ2jr0OpJCvcBq5zW?=
 =?us-ascii?Q?PyI24FGohphmHOLrGwA4oe29Ta3UqDTmIZNrIZT1eK6XXIDMt8lOqIlDxG/Z?=
 =?us-ascii?Q?HFDyJ58Mu3mOjV02vSR7V5RAiTKkor3ymnknVmTfktYOVOIOyOCiovVSJiz2?=
 =?us-ascii?Q?E70GX40WBn30TPMrhS5CAmN6e2HJ/+6MaoTIcVEVJ1WKNw7EyDTWmljVPtYx?=
 =?us-ascii?Q?guEvZTXKA4f5tZWtTU8ANq1dMDWyfB0pG/Spg1+wgiQz996iMDcnLbHqAdg1?=
 =?us-ascii?Q?3IFHHu4sQTtt+w4df3BEkolSQ3O26Ec4orougxbp0JjwzZDEhELKGorTQUel?=
 =?us-ascii?Q?cjULbCirSpfaqZfoFnk2Ha3QI70NzoDBJ7smvOvDm0tk8uIYCeRyZJxWDUP9?=
 =?us-ascii?Q?Su1rNruHqfzbjdmdU8F8CUAsu8pg+LCDtmq42tMKDVNj+yGzJ/wzEC1gDVCy?=
 =?us-ascii?Q?AKb2jgopOeElp5J69vEskfE2+IBjF34qLSzmZXo/0lsDCyW8V7wI+PKUlUAE?=
 =?us-ascii?Q?dm2K3avoX7Kc+i1NlLmfBlqnKEIrB+q+DkpPeRIzOhxSNTdx+v+GSqrldFz5?=
 =?us-ascii?Q?Peu/YnaDCvBmBIsImHaQKhrhDIY4GDMRemRkKLw9iFTq3S2m9db9PPKw8meD?=
 =?us-ascii?Q?t9Ro7BZ8mEktFfyeH+6fX4HKALlxpObyElZCgYgISSqfiLsVlJqi5NEQKTqR?=
 =?us-ascii?Q?a0wk4nGv+zHjkDEIiGlNjcCiM5litZsYABSVy+apg463aXLBc1D0Q7MPk0IU?=
 =?us-ascii?Q?lGIqe5G4TNWXPsfI2qvCEh43g8OpSO9pqi3baFDJNz28OxvOew4D2qBEqwll?=
 =?us-ascii?Q?egDrOPCyt1JnQBbtEyADSHZs1cm/UV31tT7C2vUK+HZjRb5HNfBDZC2w3tyA?=
 =?us-ascii?Q?PWMLA5xMgXnKrlZTmYdLu4xhjlTu5SQDXmGqrYsW/Tw81vPXFpfbkweIc3L5?=
 =?us-ascii?Q?Qum16TBNSMsTsY2LyWIjjaYFq93LoKSERjMpXWjOvvRe25lXI0YMYLDhzvr2?=
 =?us-ascii?Q?nzybtkWzK9WBwtfXPYefkREebW0k+MbHaM0EjTD3FY7NV+Mmg3rg19ZJctcg?=
 =?us-ascii?Q?HW+o2o88kM8DVqAqZGGZRoaRkmjD48ADQ0HKndsCokddXzHT0lHIk4ceHHL5?=
 =?us-ascii?Q?OA6YQL+H3QyxBvsdRSNIULlOzRc+zpSzFfWghv8qgnTgP5CtF1/nEKBjUp35?=
 =?us-ascii?Q?TE8cjtxs3SPTvUfaSRRRVDjFWIDyACv1tbYGAWfBHoNCrhaXeDG925Y+gbpL?=
 =?us-ascii?Q?VgtL0vKbojWDrMpStb+YTaXpL4mIa0JFh5CjUk8TmYKA6QdRG7D8yb1LCNwq?=
 =?us-ascii?Q?6BIrWVuDdH9/Fz+M88iwuqHE9BpZWQ1VjCF0ru32m8pFAb9GnXBL?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1acaa43-ab41-4378-2229-08df12d7b492
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 03:16:16.7504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usjznBHDvAbnZiJIWfF0RAQA5kCeX78aXXnmVqGiiXVLQAL+QZLb10Wjk/Zyf761SiTFMupjPNdAZ3qiGZtBr/AwMPnmX0RUEnYBen18dkf3+pekt4IOiIERuNaIF4u7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13855


Hi Chancel

> For this series I would like to keep the scope limited to the generic
> cards. If this approach can be accepted, we can extend this fix to other
> cards.
> 
> tegra_audio_graph_card has a slightly more complicated card->probe. It
> also handles some clocks besides calling graph_util_card_probe(). So I
> think this driver leaks both the clocks and the jack resources on card
> unbind/rebind. I prefer a separate patch to fix tegra_audio_graph_card.

OK. I have no big objection about it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
