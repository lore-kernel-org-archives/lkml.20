Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011006.outbound.protection.outlook.com [40.107.74.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8D017A314;
	Mon, 14 Sep 2026 00:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789345760; cv=fail; b=RP4lu5XAjtvstC2Y2XHfLQ/0zybURjBkYFiU++w4QyjkKPPgDO3vLHXVLIMqVhPt1wzQubqDU1W9+VqBDfbP6iXL6fPUe2l8kZET/H69y5F1rXdl8NmWqWML6KvejYIglCsNw+cVyIVlp5u8Ux2o65sQat2YXgExQLlhEGTSgdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789345760; c=relaxed/simple;
	bh=ezGQC7XRJPP/TyuQ40Lj5cErhKpomgsH+SRUY7jmldo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=H3gAtwIQP3Omy6CnEvLjeg5cMWuz86TbnrNAZRub5e9jbdz03cYGA35L7GZxrnH+lTKyQTyOrYZt1VpdTRfLf72hy8ZiEl75sq7qbLMLo1NsQlppN/ynKRXn0Dr054OjmrTUXcBGSD0N/OT7kKBkVoGS7aZBsQNsOOQLZYIYHx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GJ9mhuXR; arc=fail smtp.client-ip=40.107.74.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GJ9mhuXR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEoh+3Xn+bf1FPQZGaFumL1Y+ac0na289UynXghmNMckyYPvlELa5ZYbgKJ5cDNrX3lLDtbzdy7ODawZ/GdZzG9fv9hyWrDh1z+otNkQS/954VWfbAsPW2kBiUSNe46NzV0U0H2ridMthheRbY7eFxZM0/yUIpfUDx+2bkFj9pgEUr+sWrWWgeB0miwuS5eDjrzg5OrsK4XaAHX2ZuAD85qexjFtlxaxzauwVVeCEDu+xArzXWA+b5NhsV02tOv+duYCNTANam3irV1MB+clG4ss7aRPLMfFf2qPXOS9O490zhereLs9xmOsxGCihnv2NTLcY9VggHQHZ1gl/33+UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcV5OMaUktQy5OX4J8G61ToIG6Geb+EWieR0vAcNKT4=;
 b=Do6f0CsQaYEBd4fBJJPTPjA6248yecYkl8ECFlk51jqjJZg83eY3dsZZAIKwN99+NEaizSunK94p+GaDfFqJ8dZPd6DBsgufIoSJHPl8EAxSr33F23jS0fmDBzXIsKMOhqv6F/qOKdGL4ISQsTT8kHbAQtNSydleYZtVBXvFDDTc/eIripWHebgH06XBp+CY/s1XM8yVC3GccVZXenS3V9vsUv7QHp8gBuRbhRReLlZIL/tO8RISt+zsVL85ZSVl5GKrfY7QVBfIZ26PvDyjuLwCYZ6EFIooX68x/6l0Qy6WL1ay3DjByPRuY1r/K22kJhHgL++414B8roPIuwp4vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcV5OMaUktQy5OX4J8G61ToIG6Geb+EWieR0vAcNKT4=;
 b=GJ9mhuXRgzVhkEeJJLntL3fHCmUHtpiXS5y6FTq8yL3bRtkD3vRsmP9TC6dXb6955A/55pCIihI5u23DVvZ5kNomT4tHgiJHoE7gdt5IS3BpkseKvgYlnD8rwhqp+dRtGIrY0u6zK+yCIbDBQFGWo/oKWv7gH6YNwuSG3NtY+LY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYYPR01MB8046.jpnprd01.prod.outlook.com
 (2603:1096:400:f8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 00:29:16 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 00:29:16 +0000
Message-ID: <87wlsollph.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] ASoC: audio-graph-card: Free jack GPIOs on card remove
In-Reply-To: <20260913102502.2805912-4-chancel.liu@oss.nxp.com>
References: <20260913102502.2805912-1-chancel.liu@oss.nxp.com>
	<20260913102502.2805912-4-chancel.liu@oss.nxp.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Sep 2026 00:29:14 +0000
X-ClientProxiedBy: TY4P286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::12) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYYPR01MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 39877e20-b28d-41da-345f-08df11f734c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|1800799024|366016|38350700014|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	csDFXPU15tWHS7MVKnGE2Cd8uA6b7GvRzwJ+r++It87/O5SUfcfguJLeoIAiUffgOUxae9eqgWkWhAh/OS/bAX80mfSPyyQEo4zS98e8ViYK9wRHpKxMt1eJb+oQNXV4ZYvgPgf1mBkDN0tLyJjtyE5RIyS3IpkVaAkeMNPdXdE5z1L68FoGGVQC6X/gx5fz6NelRcznCmNU3XnqeXP5bM/ZTNOiUDYBvubRzSa+508mf+Jv5CE9CNME4SaZ9fbzUa4ZfNM/JoQKpgbP/0tQdwUmbKGnBcTeFsaoGkhgqthhaXfkMdGWY3v6Cl6+r+mbScl8cixfHHqCkDfFu3uaFsgw+hzMjJRFSzzhGRhbLnOtD/9mmXcOPAYbW+373Ct8N0XWLT2tz8g3gyVGinLgNxtFA0s0HyBQX0UK5e5aCoLHLwewRqmMjkrmof6cQKd4KSNQPHGfdshXBHBo6DJLjedjKV/HWK2hBMgP20kzsVhrDRCl2/AlmX/2IyP41Ge6wos4qK06QtKyWl9eFqIfW64wPE4blZMzYjt8Wm2GdT/mDoZcjfiV8TLYl6wC/+BlZOFQcW8uwSl22ZalD4AJCWJGwoa//pC734/c18dcgOslz6uUl1JL9BKtZ89hTbXIsjnvG5YQlr0YgJ9khzsGXaNqCXHxFhIl42ufEq7bjAUBqXNfVw3etyA/rXI0jaQ00HgmXgdrrUcUkv6k6RSB4pP1Z5ZGY/Tzqh44hor8OFQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(1800799024)(366016)(38350700014)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fh4xA+6nqTY8NqcuClGgx8TglcVpw0D4m/3P3Y8f4RarjxzLhJ9iKbJtLOzd?=
 =?us-ascii?Q?8jMjeFy9zRtq3J3Q2SM5qphXOS1hal8tbCRcw0NIkI/eJQd2z0SAu0O47yrR?=
 =?us-ascii?Q?5DSfvBGvUOR5dQfX3bECQ647Yrkaue24l25N4mHPVHFUa/dY/o6s9EVE0p0f?=
 =?us-ascii?Q?28CgjlDJt9icWASBEMXrErVBFdbLjp3/T34nz1xNcrrwpjHG8WOjg+HXrihz?=
 =?us-ascii?Q?m4crVUUO3FSRhE6ucaj256rlAexRUvILvNKKbibvlgtazhzj151dlL1oOErU?=
 =?us-ascii?Q?qYUMw1X7XKrbe4qv6fKUYCnqSaadKpWZcBQzElWXlmhA9QLZOtPMOGSLDVvR?=
 =?us-ascii?Q?BQRlCHCPYF1SAPIVUjhaLXKoSq25HNkachNqn9nMEXspPY5NUuQpaMe1ppdr?=
 =?us-ascii?Q?xLuDewcOCFsLec72VlyVO0UpfTUAbdaQRQ/UPD+GL/nYK8rF2H4wbI0vFAvt?=
 =?us-ascii?Q?erYC/OBTgSf0CJzLKABmXQp26dyh4wrkN4tYEQWURkEYzBeYM15tgZBwIpOA?=
 =?us-ascii?Q?pnOtMaJYwwa5ZFDq9ANi7CPJi9vOQFZOCxB6rZI+PNvWvfoSWMjoGXpn+r+f?=
 =?us-ascii?Q?vvAOomzokZkmlnYW6DJ1toW00qJL+LMY990pXt8KjV/3whQCg1vOOgW6rtS2?=
 =?us-ascii?Q?GO4wDg/YozpKFWTkk328Br0XSzY2w7nxzj5wkBkv8bNjeRjhmWN1Qv7MyRaf?=
 =?us-ascii?Q?9IOdpSvGiw2iFu0lfe41PjkqjNJwgdjwzfZ40ijupa9lU76x0Nfi4KfQ8L42?=
 =?us-ascii?Q?p1XQvASoVm8Ly0CrFtBZ+7R4caDWWb9MPS7cPxiWRFtFBB21fTnqGjbFYFB0?=
 =?us-ascii?Q?OQxZaX+28zanPgSOZFDomRb0gW1QrmTS6Sb+ItUqAZQQRXN7kiNAS9bjFIk9?=
 =?us-ascii?Q?sfjBeKzE3k36CTYJOEj7qmmb0FvJbg5QU1iaXD/pVQcoJq7DTB1oVF9yyalJ?=
 =?us-ascii?Q?pV801zXA32AvDEduwm4gDGYUrN8OiSSJ14WVzO6nQ+rfWAirUD3XAW3LQ2K4?=
 =?us-ascii?Q?Xi0rWasnMIq1aCSm3y7KIRaCuSmKaBiiuisFTJ3OCFr4OoZRUsgvNV8/9oa6?=
 =?us-ascii?Q?WNQut/5wndU1wnyySi3EZkaLqacHehSmiQjnkiyINvBHUIBwxzPxUgS2vPSW?=
 =?us-ascii?Q?Ndpz8gfq3WCwYDTDYHae4fa3FN2Z3MToMbXu0UeOid8JmE5AXwu1clt2VJEw?=
 =?us-ascii?Q?DTuLyHMjB0Por5Pz9eiT+9Cw0Ksooc3rTc/ES/zUCh+WNxOvp29uYllYX2Bt?=
 =?us-ascii?Q?wqkcq6LqtdKcwaaQTQQVF8hSyReFnPWClMGIIql3Imza9U/6AAeNesHdP9XT?=
 =?us-ascii?Q?QhT9SufYNx5i9xFdnLwjlCRjYlBBYh7lpCPKMIRVmIKMumGf5bxGFTe1pQe5?=
 =?us-ascii?Q?d7WpWSLtJy5RofF2QbhjCWChjTVidxbg9jo7NAyxBzwY0w3gZCVtDcBHKuxG?=
 =?us-ascii?Q?8misF/Kv8LQN7o5nvWaothE2TmrcyW0rs3wX5DNZYzKzMA7IB7BEW+zn8l3s?=
 =?us-ascii?Q?ajBWYtvid+jU0D+TV+KK1mP/1E3nSiVZ5KFzJL/W1FygXO+Zy4MHlAV3ng6a?=
 =?us-ascii?Q?PAscUG/MOV1BaEIAmxQG1vJteZM45cgH8IckeTJ7UgBPZxMRW4EJ+me89aMa?=
 =?us-ascii?Q?wU9nvRPb25Bcs+GW69W3urKN+78bPQIQJ8SeIaEku2pCiH3NLc0urXx9n14I?=
 =?us-ascii?Q?RfMn6KQH7ktN4xEHWkxAqmTU60UHzDsBzCkvO3OfVaA5Ig+1ZkI12YL4ua85?=
 =?us-ascii?Q?uVr023BwbgK4dX7f/9XY/7G9v8+RyVs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39877e20-b28d-41da-345f-08df11f734c1
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 00:29:15.1779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HnDnisFaKvJVVLFJh1+pDWXmRU9uy/RLby7sBGYGaOEb7fLcLvkxz6dZKVMFttIJsX7dGhYxgLxUQoI98OAO/BeCaGotOFkR8zEL4OADm+YGhxEDaHOzDSQd4hZvQql+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8046


Hi Chancel

Thank you for the patch

> --- a/sound/soc/generic/audio-graph-card.c
> +++ b/sound/soc/generic/audio-graph-card.c
> @@ -629,6 +629,7 @@ static int graph_probe(struct platform_device *pdev)
>         card->dapm_widgets      = graph_dapm_widgets;
>         card->num_dapm_widgets  = ARRAY_SIZE(graph_dapm_widgets);
>         card->probe             = graph_util_card_probe;
> +       card->remove            = graph_util_card_remove;

Basically it looks good to me, but tegra_audio_graph_card is
using graph_util_card_probe(), too. Please care about this driver.

	${LINUX}/sound/soc/tegra/tegra_audio_graph_card.c

Except above,

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
