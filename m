Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792681823;
	b=QRCiq4GHmU5zc8r66ALIEuA28oc6NBfyHztpysAbygylj8eIZ8AHEiGdX2JXta5liN6i
	 SL0oDNWgiCkzz7Ad+cdZMQKHSyIRdynMPmq9FvvTjEXm76zyCOpCvZBKOv33OsXCpFE/5
	 eM+cUbnxXl3KPKK18+B87wCFIrn9T//A2gT0VG48J6WNaKBBIXgKyMO7pgV4pImXa0ObO
	 tZ61Xer3ocIh5QAbE5l5HV9py1+h/gPeUc+9G9NtSTjLYVe5qs7jTMF3X5dkevN4ZXt0I
	 6e91G1bRoRbzbFO6+eWTJQgdLnnApl6oEvb+bEeTishX7nMbbk0M8p/VufT/vy/FwPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681823;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jI2AC+CdF9MgCL1fJFQjIkDxJsvnyd/hxIIiFs3seag=;
	b=4N4X14e3hR8SXWo3Zj79v1nQSxzsKCGmd4g+Uhjvq3am+JMBqV0177PP+cH3uM2KxCpg
	 29MfbDnGNy2qISw8Ejn/EKcpcf36OwXHciL3xeg9bQkkZUbUGUThBoxhHZI2iWW+pVV7v
	 zw7pwVm752UVSb1HizZZhi2ots21AT7Y9sOUdg4u+kDR6u7X6dxzWidZzMAuKe1SIsN8r
	 HT9N+tOlmC3yLLZujte3SQIMuGqONu5kk6b6pTIdEGOJpDJ7Jqto93iQA4hH9ngJyXPP9
	 KWB8zaLBab69gMKCW42n6vSAaLYabsA3/IQky7nAfP+r3pCyi//6IyhYoLuP+wDzu5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aw11csvE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.46
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011046.outbound.protection.outlook.com [40.107.130.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110DD60A3819;
	Thu, 22 Oct 2026 15:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 110DD60A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aw11csvE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtOULvzNR0YfEcPG0YmnOIyk4sekIC7IHQWa+tunhrk6CvJP6Bn9ayuO2ZXuwvfa50oZKgHEdfXBcHcJFI6o240AGDQIGyAUWPDOPoKRgkM/NawgeL3fPz11Gf2AOecgKwpys1gP1uEg7eKWipLBzP1Nm/naIp8rTq8iM4qWuRavqs/9OruA9ODDEtng/gBwe4fvRmsxz1TiAO/cmGUnmzfcWVZMOT6fMhOa9DJw/PgSoz9JzfLruQgNsLIHATkQFS6gx15X1NOYghIymWHCXYx080VRuf7vN3no8LRavUAZgibzRjjnHzYAU8rrTjD+b6CYN0rWr7HRxIQZwmz9cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jI2AC+CdF9MgCL1fJFQjIkDxJsvnyd/hxIIiFs3seag=;
 b=IutWhB+0HjSqq1aWBihWg1epdwe89K9hf+D994WXud32KZOwXLzXz1eDnuy0UCtASoaZRNKFa0y2UoMQ9E8OTtBtV445tWc7hr5kFgaVL/m968ViU2ew/+kiAaF9BDgI2roRSqbG6ED3JCfUss1AbgtU0AQs6SrRkXJVHy4agGoDYu6XI56PV4OsmOtHGBz4U1QMC5QHgpP925gOw8PzA0Aa5Sc65qXMVVmVN1OwOA//gohDYfsbvaJM6K9IWc/bcTpEvuJaEFlpW8HTr+Li7JWwzhFt0ZvVCfTGDPFgEKNhJ7spLMYSqQ/LYvbDWAtaEMNbhVsxeq2aGPHm05AHJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jI2AC+CdF9MgCL1fJFQjIkDxJsvnyd/hxIIiFs3seag=;
 b=aw11csvE54GpQupkC4Z9Pk3aJCnnENMabwpJ/qbPUm6SpAEauZJGC7MKcQNKxasb55shA5Ou3QMgGon+8tPR7F6iGsOX7H+Uk5o+QeJbMX54P5WoJYWHGZvjPszJGG3DGA65+jhttMo+sjRkV6XQbtNjRHUtHN37nmgXBfMfvoY+1FvO7YpuNI3WQHArcXZ4vXuM1wtXGNvvB6Uj4FuUz3uN38FaTqhaC94pzADmqJrQmj5B4XKzZxZ3f6Kv1RQarOFWIPa0Voqmm8CXd3FGNEdezUtg0dXK0aV2T2Cv3MTkRExlQxrAzEsTcMvzzMR9pujdTdOdbgKB01eXTuU5YQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB8185.eurprd04.prod.outlook.com (2603:10a6:10:240::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 15:10:20 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 15:10:19 +0000
Date: Thu, 22 Oct 2026 10:10:10 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: freescale: imx8mm-verdin: Share the
 UART_4 MCU overlay
Message-ID: <atonUhtKvsH3CjKD@SMW015318>
References: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
 <20261022-v1-imx95-overlays-v2-1-c769d6eb54fd@toradex.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-v1-imx95-overlays-v2-1-c769d6eb54fd@toradex.com>
X-ClientProxiedBy: DS7P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:223::16) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: 706fd67d-540e-47e4-e1e0-08df304e9606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|7416014|376014|10067099003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	oBWGdJI7P+y2/5k3i+CzIew3L/07oSv09NZ7vE355so7THxbro761xQ86DQuzDLBkDk7jMl99sS2eZzY7JcRBGEygkYbmTHBusTd+jwmSHMBVI+khonIMjDVZvZz5v73oEITXKvfm/o9QWoowU3/LH6eRwAVfIR8U85lviCM3G1dl0XhHzDXW6MqYCqbW+XsJxTQyGLu8sx9wS4sJMR1hDj7dqz/waAlRe5affuJ8AZgI7KvD/eOL3CncJVboKFTe8UnTx5vnnmoRLKZLlx+O+d8XMjFGAsMXvsuQK6pAKEpy1Fx9cjbbEZhHsJBeOfwopXm+qfn9tOTcBQ/qT2Tdfs8WKBjQMKjKuT0h5NyD0QCnzo5BjykOWmzRsOjNOxIZ4HBPhzWwFbOuFHGVZCMLIf1zlRVIXMuZ+0U++t0Fq6DLbuPs7FdqtVymp156Z9R/s1JvTYJv8B3wLEuBzBp5TAY9LDoKsHrAumH8DjH9DpaZDPscjpAsiWFy5aSULOJ1EWY05BdZKN9deIyAUVYL/dG8ajkrlUkd1E7M0pkyLNPwrskif8vrtm1VSW2OILf8jIS1SzZbn3GnS304oWghl6up21Czza0SOImXk1RsS0IzJkCR+sY1ELRFXkIw774u83yszJQgOonsQDoqds4rQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yav7R676PljzdCj4k4mjBfgbyMRBWsBoqM0hrVxH7uPgQgUJnj9PETrShZPh?=
 =?us-ascii?Q?TUS2mdWA4dh4JIBwc8V+v9HPwWvd+/DktFOD9gOs4O+Do8ZkbwqbOGZFgERJ?=
 =?us-ascii?Q?gHqS4wg4ixCbI5Vn+eJD7Qi2+4XaTGNbGmhBmSV9lwOwYXwoZqUSktcVfVki?=
 =?us-ascii?Q?UCvD4kkLxKhUaal0NWcjKkTIZrVe1VZng2T4ssxG7Lb66O6MecuQsn0pjzfN?=
 =?us-ascii?Q?VloyZPGqnpAoQpRyhFlO0ASGgOjlPIcMeNyxk8QzEdCCZDAFcRZvc0nZHMKu?=
 =?us-ascii?Q?rqTqvHNBRmffxOEXgnogu7RW5EikWw2l3kQQYmtRR7qRpUdR7Qta06yKQYPv?=
 =?us-ascii?Q?wgRn2U/JLN0mw26qO7ITTu54ANSSXCy2bYUTf3YchXmaPXHzDsQ6UsTptUs1?=
 =?us-ascii?Q?Skh18gSGnEr77QlfK99R/tSa5a3Lt7gvl1mT4LLXRrJ1ZFSr/gde7t0uOo9K?=
 =?us-ascii?Q?n5PLAjcvqvK5IRJpFj3T4cFZun8uXdqRsX2QU7pj3z16bgoiwWXsfiyiglRq?=
 =?us-ascii?Q?92K8+1Y2l4huHA51EHOx1c0My9jali0Sg/3/tqZ+1NvO5WJ5EJQvLHq2EsV1?=
 =?us-ascii?Q?wL//+crxv+otgZaCZ6Axe+sgXIuURhJMZN1znqZ1YMUfv2jNfbmAsDLX1j8L?=
 =?us-ascii?Q?r6wI6e0K+X0sGPUSZfP4TZglY26/c5/H788G4XRCscQXE9gxngCgB/+gGFTV?=
 =?us-ascii?Q?pW4sI1NLfnrkwdG179wA1d2Cb0Vi5Ms/UUytrEJyklFjLpzfizkGCJuB6Gh0?=
 =?us-ascii?Q?qHcDzSjpB8+UuKBoMBSTdpebq5aaqvedy7O8F9KvClGmhT1cBUKQZodU493n?=
 =?us-ascii?Q?RhJqOQR+B4u7R4hK1/D2FeGbK5t9cO8HPjl8Jh0FdFaGJ43+n2jO5luDNwY+?=
 =?us-ascii?Q?WmurIDMJQ6KuOIUYyKoavvqDJZYWm5TZQRT0RdB0uO7+p7b3nWyoimA0JgLV?=
 =?us-ascii?Q?ZwNcOOGV7WmTT6K+TmTNMT2sVghL6DwmgXewtnmhAtc66n2gWNAp5wmn4BMV?=
 =?us-ascii?Q?dYIPnYog5orZofA+f5SuyqmtHheYVL5bZiAjcKQq0bpxM0G4RVHnLAJ9SFqh?=
 =?us-ascii?Q?tkm1DyEAKz0qYlM0R13VoTPo5z8MB3Dq0lj2SAs17sJL53v7LHwTzbydFyQr?=
 =?us-ascii?Q?woR0nGTm2DS4PTOKS/3zgaur2vlCe7RyyJwFS4d6wQq2i6D7Nlh2kHrnyaca?=
 =?us-ascii?Q?xA0btbTIC+TJsVPTO2+UkxtjhEsw5PGVrYvzM1Zvk602IoMRoxRl5vg33//C?=
 =?us-ascii?Q?Ws6IhR9HlnLRrx2VCi6xWcXa3el6KoC/ECGl1yUh+Y8HqjwprPpi283xMREH?=
 =?us-ascii?Q?LXEfIKSH/MOypAImnRVeUXf/Qt4ssSkrp8RnHWA2pHRdNaiIp4BaIsHV5gFt?=
 =?us-ascii?Q?6N0MNszvXBRVfP/eFzkovAfKm8CQFy3YPk5iKQBK+Bdnwhqz3lvHGLaYFtvd?=
 =?us-ascii?Q?sxYwcgtcKUPmv4nRXa+Fz96rCIFIhcCCRYCAzukINWPCIBtaSd/8NDIHT1DO?=
 =?us-ascii?Q?YWZFG+8026YtcPGZVw+NKk6nJePyppvS/rH7fY+4INEBqcxR1s0rkCMmTRka?=
 =?us-ascii?Q?SplwpIDChewzuxONFhaXHvecySddt57blHd3L/1GM/LB0nrAwe42Uv4dMrvC?=
 =?us-ascii?Q?QbPnilf1xpV99Yg4UGQpiFPLKIhVtQ2AO/rwWcOwY+Tw1ayscYqylw6RBgPe?=
 =?us-ascii?Q?ITWcf4bduPYpFnn3jzrQD0p8PjAq9tC0QGmwEj3LlX928XxnIZETNpUOM7tM?=
 =?us-ascii?Q?vww8ilHLmhs7N5Q2pITSsZlxouvnHEDuUCuFMfj44PGn0MrcTmSy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706fd67d-540e-47e4-e1e0-08df304e9606
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 15:10:19.4356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSeptOFAQlZbH2O25ybxT0Z4RwMVXXlcYVd6ugRorRygg4OPhDSdyUtEftovq6SXeKrRap0kEml9vAoLrNUv0Y3Foh/OwpbdtFCNzSRj4dZNHxEczbjKxzTWhOPazZfq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8185

On Thu, Oct 22, 2026 at 04:09:33PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> Verdin UART_4 is the UART the module assigns to the Cortex-M4F core.
> Other Toradex modules also assign one UART to their Cortex-M core, such
> as Verdin and Aquila UART_4 and SMARC SER0 on i.MX95, but on a different
> UART instance, so an overlay naming the instance cannot be shared.
>
> Label the UART uart_mcu in the module device tree and turn the Verdin
> iMX8M Mini overlay into imx-tdx-uart-mcu.dtso, which reserves the
> labelled UART. The combined Verdin iMX8M Mini DTB keeps its name.
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---

Thank you to make shared dtso happen.

Frank
