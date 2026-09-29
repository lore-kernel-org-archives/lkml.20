Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A415137BE89;
	Tue, 29 Sep 2026 14:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691655; cv=fail; b=HftdXwh1Gv/abT0H6rYp3wscn2SiyH1wQxTVV0IMZN7URToS5MdzQm581rnwBHdfSBmV69Qx/KG0Igoq/eiEZbNwN4cBnmB1SI1z5FN1Bmx7ZpzP+DqN4a//kjqTFnGpDPPAEQ+FrDQUgujXT1mW/3k09hPNpu6l/lSeq8uGJxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691655; c=relaxed/simple;
	bh=4jFIn/RrTAWHtadoFoJmUNXLK+jB+I56jNZa/zME1sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HRmY7Vy5hDL1MTA4qA2IJIf+/XX2Ap3XoOibazpItwKH1tekIHV3f/+MNQqSCC6Q4ct9lyYHQZxnHNNTgtug8XLmgTi9np7lPvl9r8GH9Q3M+B6uA9mG/JIrphYgS85zuij9cDkKHFlYgFfUSFXPxa2mM0cthNPU1Yqwc3dDLpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=yJQfCgB4; arc=fail smtp.client-ip=52.101.65.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="yJQfCgB4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVJ5OGSw6CL7VICoYlT1GIR5xjSTEv5ozMUHlN4+LOvEQQWwPz6QvtmEP/wYgCAZ+5CVzpE8KxxCf+to3NS8qsxcOc4ojRSnwDTfXxjATtC8k748xcrloiobdL2qyEEUCY6eMWx2SSO20E5UAYTPh9cbqB3pFwR4xMCz/e9U2k+Km/SGLhtdbCyaO8q3ihAJmSLcClwcFmD9/Ntes9xLP8aepe2bSCFWNkWoY1kseDEy1zMEq2TdgwfZ9Chph1F1WlvveMF92yjhyk4aKryggm4a8MiPGNujf7h44s21yqZ74q7eg4v4mo5cyl3FS7HZS5sTpae6rHa0nK8RJlTWxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcgFfFZq1pmxo/aHrsp/V/vDSlaTuAuMFF0PoEWgEE8=;
 b=tjbqwHw7umbLS5OVuKNxT5TKALenD/5GG00PGJw/iFuADUuz598jYddtFmyaoqLewPlwR9ujVU3EoFSFkw7XnXXgIZKJmUCkuztTyKR/peHdA8U3r28pzZZ7Kg6jH0Xxw4Wfl+GhTIwbV7/6U0iSHhOWwCICC1O5JO5lZD9QbRRrJdzv31+oaE7pdXRkJnA0/94eACEilxyBbwVMn8Gf5+bBFJlFiWwGIi1ywb/FNTxJGUSYZIFRu6It+Ks58ANGWdfhqsCUdqKYKlp6/CA13Vf/KzXfOdKowC7x+Sx5VYvnLxnWrBZ9DGYKvjjuEjWluojghSxnPT9x3o7GWkYwvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcgFfFZq1pmxo/aHrsp/V/vDSlaTuAuMFF0PoEWgEE8=;
 b=yJQfCgB4OdfVBevpmPLg81YxXRjvdz7pt4f3yzp2YNQpyqiOoblm5PybMWPeWGwiD3kiM8N9QZrOoI5nbwCtD7d5z1g03TfyFNeMDCHQPnQumNL233yiBPS1wzgJT8/DXd2s4bRjuoRq16iRz1rWJSr+S2Z5uAhTOjmPUmd6VyAeOwdhbRrUUKRQHfZ+92H9kUt66F1pqo2W08YV3/L8gnWfkgU4fWf2GY/dwBV2QxOHYQ57TzWri80+uPnoYAUYBUf0JiCZyzLM/ErOGqEQSSES8L7byt8CG0pHgm5OE5/BXttORgrxasozpXo2o/Mcj5GU6UTgUeRYALLw4cyqgg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 14:20:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 14:20:45 +0000
Date: Tue, 29 Sep 2026 09:20:34 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 02/11] media: imx8-isi: Extend output format mask to 7
 bits
Message-ID: <arvJMq0T5YvorOVz@SMW015318>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
 <20260929-isi_imx952-v4-2-e69f89c7c651@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-isi_imx952-v4-2-e69f89c7c651@oss.nxp.com>
X-ClientProxiedBy: PH0PR07CA0058.namprd07.prod.outlook.com
 (2603:10b6:510:e::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f5d98e-ccfc-486a-f5fa-08df1e34d9d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|376014|366016|1800799024|7416014|10067099003|11063799006|56012099006|3023799007|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	YX1/NxVKZZSxwlw+pvw/P//TrKffn+MZW+bg/w1cxuYO9ya19s0RN15dmwnQ/SAERa0BchP1AZjx0z48jsYJ2mMEJuirX0CUaTm3b0zRY7Vxjmd5wZku6sEQLJji+zBbxZBz7swVfkuvUqj35Y47dSOvrs6L4cAxThrSPHQLKyrCiWYp/1dpU4o4RJWd9LM9Fa7kpVbUu04xjFzsto4BoA8O3xjf7VbWJQ1SfAY2BXSIUYSSYCGlU0RbV2EwOwUcpwisZ5QCBUqRn1Rv7jqvE5gXVMKAwiNDH2jPqsz0GhuxKRzrY+OuKMpNpl8QdIHh05H6Y3Dsy7vYHOhRzVw5kBfpuCE/78Cu356LavyWp/9fIxz1K/Fr11YbEAhp0xQoH/5vLnjkDlrjVt1eF5Jd2rRtGfWC6W9FsuxjkUu2DGBFqlVu7CXuykoESqA6FAJUpdP1vmr/ShQKg1AKilJPLGByphy2FEW0Hp7LEm+oWhoUheMgwfefmrzbVAMfXxowVu4NypLGAbsgcNyARBpp/jp4nlVMMUtfJ4Ab5k7dXuPs/fHPzpSSkrGUBTxKWbvmN/BwRGoRt+U7/PrAkirc+lEp02KDulgnkP4VgtkdLwv/Zqmyttl04g+UgGoDugBlmAWOxruB4OfNwZ9T8YmQ1QqxrJX5BzuEJclLgOsXXDM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(366016)(1800799024)(7416014)(10067099003)(11063799006)(56012099006)(3023799007)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fFUgS1ZP9fRXe9z1TmLx2ceY3vNZUfUd3lOMLO1bZXJt8pJyLjUQ53+C1/xO?=
 =?us-ascii?Q?iwh59vkbWSyj6rmstuqSbVrBIhyvWEl7nLFJPNhhhGM/1Gf65TRsupusLJD9?=
 =?us-ascii?Q?Bk8Czo4fNLzA/Gn5SJkK/rXZu5+UUKtBHKgu1gpMzPTuR1MznLs+b5pYL+F1?=
 =?us-ascii?Q?A+5HmQKa0lFy7AQYaOZ3k8w3m83XTsQ9ZFkLfhk+JggOgakl5xAUprOIgpmk?=
 =?us-ascii?Q?o5+VK4L0tuBJu1gg8QF35UwrXFuP4OCocHtZ6TEBfBCW5K3zmU1x/UUH9HsF?=
 =?us-ascii?Q?hZSTs3SUiKWDz0XVV5cJvJp1SbSox5C02s23Q3yOfcsSqAiGwRJaa2ch1tP4?=
 =?us-ascii?Q?yZ/O4Nn9sBThsaS5Be3IJ3CdBx4GhGrF3fx3hzjsSZLL0GE/M+XwZXWpPRQt?=
 =?us-ascii?Q?ANKrp3XkZWwbNnFHx7Lmy9D5niMFR+A2mdlHsYMH2isCrNKUVNgy3xXae1o7?=
 =?us-ascii?Q?irZ/AWanAtiO93rVJ2KZGf70vIMFW37FxW0feSF3sj4trJyQw83ohA5ECjqx?=
 =?us-ascii?Q?X8bVGcZWE564N9Aq3r/E6MQEgFKcFoDfLml2buXPWNbJY/2iql4T+E4uzqYy?=
 =?us-ascii?Q?abhPGomAGMnti4pJUyJGA8K9oF1vxWmAh4NbeCGSX3zt8XwcfCVZhH4DQGl1?=
 =?us-ascii?Q?njtmMMDknYDb9/roY84PdV+JJAHsgUhr1YAYswvPUbo3KleZDXGvNEtewXix?=
 =?us-ascii?Q?6D8wfMGIA2OE+UpbJHKkMYHpSxr/PRNv6IhcvGBMHlLVlSZ7rtM10k8Zy29V?=
 =?us-ascii?Q?b7C6DYQgSljQ9/6ZntFc9tSlWC08pjoA/UiQsMMEklCHck6EYyIHo9JprrjU?=
 =?us-ascii?Q?397y4YyIRDp8wF1Y+YuhOUcFTal0xxQGG7jrSWO8meeJNLYj0Ar9v+abpM0e?=
 =?us-ascii?Q?qw+YbMoMBD2dCB3x4QMz2aK/eCmLago5MXHpHuRT0FeZN7lgc/3sCPLWYlFi?=
 =?us-ascii?Q?fKouZcvSsq101bG1ptGfA9c2+8MEOnRs0dWVpM8at+fRuzw+IAUQ7Vs00EZy?=
 =?us-ascii?Q?2TYgCv1a4xhQRp3N38Dra1VCGvhP5rleIO/Tw5y9E4d4ouAEuMVmmonM2V8c?=
 =?us-ascii?Q?vcEaC6F/TPQgasz79pFKXeTJiVL5rW4N7KD4hkmN8g7cQagkyhroeDrx8eLf?=
 =?us-ascii?Q?N+TZobQGGR7Q0OzWtgpY5h7E35l6S+LemWtKGeL3O0BYxV9RjxQGwpE0KU1I?=
 =?us-ascii?Q?88kc/XxcREKOyIYS1Mwi4pQY55I6kCJwR9U9rV8eA8ZO+/9p1X5g1xPat8tD?=
 =?us-ascii?Q?pue7oJz9treptYjoImvDQw3FZoj8B8/4HMRAK+IpfBOzBrTL1TMlgCnqKzHI?=
 =?us-ascii?Q?j08i/OZfx8VU1pUD1Ixy19h7PPIfDMJzceUovv5456oV1h7nA93edbiTHJZT?=
 =?us-ascii?Q?fTKj8MFg3+IILcBAfFyntq7IVikSqaNz3PPFmu0Sd3yM6mz06tGfvgwsaFmP?=
 =?us-ascii?Q?fX6iCE0tSG7JjoT5F5QtyL7pZ1xjQhm+Syhyii4wcaF7XbZ/xKuToh8GlN7h?=
 =?us-ascii?Q?ue/SmkQyCAJmMvicbSvwPgj+5nP5OVPgYHPfSOVhNSujxbe0nTeg+n77nu86?=
 =?us-ascii?Q?OWRRYPnPsIc4uDHfu6qkcT9ndsyAxjzf8Fr9kymcYGasrWMzP8F7az1d2HgD?=
 =?us-ascii?Q?BCm/JSZUQvrcjDunEtfjQ67dmFOljF91PmME4uuh6mvXWFB3ZwMeJ3K+dh/U?=
 =?us-ascii?Q?zAKbHCTfrmkSDXNtGKf73Humaru9I0SYn6U/v6nguENd4TY7+kf8I5fHZ+Ck?=
 =?us-ascii?Q?5SiO410n95rUVHWC/Bl8mURO4njrk86sxG6BIPSz140ni1fbfXEc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f5d98e-ccfc-486a-f5fa-08df1e34d9d7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 14:20:45.5743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KATX3DQCq5F7cbKu0xcxwxEDYHwdo0es5Z14aYhnFq6hxqwFkWtz2X+1Hgy3i7j+0hzjouW6hVrxVPLGTpXv+pajBdwWAdjpiJdlPp8+V1HSZsEGuF6EnZSYpz5q1JW1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8774

On Tue, Sep 29, 2026 at 04:52:23PM +0800, Guoniu Zhou wrote:
> The ISI output format field width differs across SoC generations:
> i.MX8 series (MN/MP/QM/QXP) use a 6-bit field (bits 29:24), while
> from i.MX8ULP onwards (including i.MX91/93/95/952) the field is
> extended to 7 bits (bits 30:24) to support RAW32 and RAW14 formats.
>
> Extend CHNL_IMG_CTRL_FORMAT_MASK to 7 bits unconditionally since
> bit 30 is unused on older platforms.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Changes in v3:
> - Use unconditional 7-bit mask instead of per-platform approach (Laurent)
> - Drop Reviewed-by from Frank Li due to significant change
>
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index e795f4daf3ff..c704be882705 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -39,7 +39,7 @@
>  /* Channel Image Control Register */
>  #define CHNL_IMG_CTRL						0x0004
>  #define CHNL_IMG_CTRL_FORMAT(n)					((n) << 24)
> -#define CHNL_IMG_CTRL_FORMAT_MASK				GENMASK(29, 24)
> +#define CHNL_IMG_CTRL_FORMAT_MASK				GENMASK(30, 24)
>  #define CHNL_IMG_CTRL_FORMAT_RGBA8888				0x00
>  #define CHNL_IMG_CTRL_FORMAT_ABGR8888				0x01
>  #define CHNL_IMG_CTRL_FORMAT_ARGB8888				0x02
>
> --
> 2.34.1
>
>
