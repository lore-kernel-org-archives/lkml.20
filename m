Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013000.outbound.protection.outlook.com [40.107.162.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A60D4BD7BF;
	Thu, 15 Oct 2026 10:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061898; cv=fail; b=KhwFh1pZu5meKfFCxrsBH1KgIRcj+WUt5yRI0Ce4NCwGXf6HklZQqaxLlhvem4rtt1xjNtVRBFHCWgul9GKBLZoYRoLSHgnLNhEMtWCRe9BeyMGeHdTAgzDQ06bM/e5hgR8cl9TYIQLsEVTHE6geKsW20dLncw9pg8imur//144=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061898; c=relaxed/simple;
	bh=srdlP5AS0VxfiBbJn1HZd+OCUzku0cr5c1tufaxRKa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aqyqel/1pzVW04ZXLzv4uzVJENA9eheTI416j85rPF3WXhQziYii3Ca1UV2wavi5Gwttnoc/dY4WS0O16hcQuZjmv2MKEUuN7fODyc6zkXdhMZKofYvj7sB6MhIKg9M24JNveRCmy25foSgFmXIKly++Xs0MuYKjyNOHDZSpCI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qvGqT1P3; arc=fail smtp.client-ip=40.107.162.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qvGqT1P3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSKnXCs0bP80Crd0c6S5IaPDqRu4rj3r2eB47nSVUf8lFTBPP8XNz4mTD4PsLGQOypygZNANL5r0Bdv3yVGzJuZpUe9BuLbOUiMdsQCBlnTDT7iCM5gPyrekBFNFqPKrdRsm8YreRetuRFxrmJjj1+4NyD8O1uDdr505SnQpf30JVsFqL+JuPhiTySqpdOdkaT3w0P2eWGkrPD1dAiNdK4AdekEwo9JvHn7MVhAEUdZRZ60xYQB5ckdxw2yPw1euMj3hBEpjum42f3pX2j+BibY8cDO4uspmkRFXoV/qKeX2MGeJ4ew3B5LSN0n1GAFXLXpZT3zba6i0Ekv65eIn/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmrvapIyNOMc21KmtuXbHJaLrEICIWq9hrvqnzYMR3o=;
 b=klt/MTSptZKSrr/9TkTCfInD+GkRd4HoR9bJT1CELfY2cp64n1tKSZIn7gYIcXHaf6CYjaI4Zq69zQEBc5/7ui6JvTzbR5o7FhmtiGfGnEXfrale7hKwL+UZZzHeoSgUz7TlAa+tvt/FgDbbjJPken/9DBhfI1oXeP50kyHjiyy7yimt+N5RrzL8y31uwGROYKJOFvC5JykcTYD9jXPJV6ZyxNTZ4Q9RWn8XeiSoU7t5u7AWxBoX0A1wWh9aaDOHBicgDxqCI3RXMKN6egMIwdQ61utfwBbAo+4QcJs9R5IRpwWSVqFDocEkOqaaskKr53IsNI05K+VudeIGvMNjJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmrvapIyNOMc21KmtuXbHJaLrEICIWq9hrvqnzYMR3o=;
 b=qvGqT1P3kDwQFE9QCaEsma3w1V4qgvunpZjPdekIuHTz0Q6qEPaI+B70gCB3TOrCEolNtrKDF+FXCu2jx3lN2oY40GKNSDt3fij26Xz0CvQG8EhxegHtzTkzA9zCSmeQH43Z7hs+njYO6u0QyZtkhDQ4xJ+6WGyGxB0JSlwNuw0GGC8BLxdEnZeSFH11NvYbonmzbkbTuTUOt13uKnDcW0+qeH6eNHlo5wLlIdqWoWEudmSd9v5pIbWs1o3Va7ib+2D1as+zCnUoJ0l8r0i7vJVygNOgCvTI73WgwRGRScCljrcM+IbQVyNNHaGbB3ImJQn9xFTup51blUqEVVriSw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6923.eurprd04.prod.outlook.com (2603:10a6:10:114::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 10:58:13 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 10:58:13 +0000
Date: Thu, 15 Oct 2026 19:02:48 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mn-evk: Pass GPIO_OPEN_DRAIN flag
 on i2c3 GPIOs
Message-ID: <atCy2Li2wrPHhW8K@shlinux89>
References: <20261015081149.5919-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015081149.5919-1-stefano.r@variscite.com>
X-ClientProxiedBy: MA5PR01CA0304.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB8PR04MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: 907d2b36-3e25-40d5-a8de-08df2aab34ec
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|23010399003|56012099006|261009223027099003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 mcd0Yybp7h19jwE+PWshiEU3NLltrX6VXQsRo81aFu6pxL6lNOuWJyzWL9JeBwVaP2YedXdjCWepcruMiQ1H9j6Q7dnUWf7bCOkhwv16ORqTT/wpvYRQMUsy2YeAOCYm6ELxQ5i5RePAn5mdwL0WSEYTpmPMsu/fCHaFD27V+LykuTBRJtFQPZgpPCegpryqeuQgIf5/0K2qm9h1Tl8BahkoCDrEdA89oIh6M52LHMofD//CNBjSCXG+9f6GnzepYpd/pGaMpunfjIn3/pDqYPqbGHUR5MXIf3xRrFgsEgCVASGu9prB7gzgkLIrqmf12Hxx1uL7WRTRNdfEMY6b89WitEQAOPE67AB6hsrLbuEDbKlNlbVAjrvMrK5OodCwBasYreG9luWOR4iBUyV7aWaoYQAVZfV+pBf2rfnjGuNBHMlYA6IDG/N7PbUtioQzcChbNQcdv/O9n/yRYobUl7MDGZFS725KXVEiTJWdh3IJnDXD/KZLVqoLokt+I644AuJqbmJlTiocDrFMVANilFsUxewz7Axb76fmomhghRZ856GXbYFSNCBvCyhLFgRUT7BuxgJCmxWa+DPg4VP0GaoDrp661LPQ90RtLzJGs2wxFRbmlGn37PWA7bDlCEm8qVN10wZoxuZ6DYS9GxtcOoswOkX4Jbfcbwiea5EKBts=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(23010399003)(56012099006)(261009223027099003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?1JfCCSHWyB/xPFO13l841FawzME2MsH1Wa10gM1tjJZ/FpS0+OIommht2t/9?=
 =?us-ascii?Q?sWkWIFd8UhtAMPmwaFOdDzxoRx4gUflYpoqK5a8BoM45iJPUBxYdd3NqR36t?=
 =?us-ascii?Q?L/h/HqBSLsWkvgX5I5KCRvchDq1uRfBQ5Cmyz1hr4HK1Es+aO6qcXMOi9pMp?=
 =?us-ascii?Q?5/fxcZbX2izs/wj/3YApZvSwjUY0Pgrvm1ZGnPHYPtty5IE9pqXAE2bDtS2D?=
 =?us-ascii?Q?HAxZ1pWEbdgcujWuaiqZNWb1LWm/LtCrhYFU5P2xd7xbAPX2SWmst6OcndvY?=
 =?us-ascii?Q?PZqEOGARu6OOlTgeW65WZn7E4KYVYAHpu4UQMN9DbAJ8qRQ2yImS8D+BJ6kD?=
 =?us-ascii?Q?vkd+41BUSZVQfaFf+sT4+HbdPq54ohxr9/lRZ1o+vgFivgHG1zIiwwzDNbpN?=
 =?us-ascii?Q?3XJW+6VSt5Ref0eUGJZl7qdfDi6YmsAAgxYofDJcKVV9SWIpnEhv+aph+jt1?=
 =?us-ascii?Q?a5LB2nSYdMhO4/1T8u4zbeNizeIcNl2YoqNK8UKpshSsE1Kl3CYK70a2+lR2?=
 =?us-ascii?Q?tqKgHBWHCxkLM1zrcv4aFqVsUaDY+jv1JjVN6hUNLIdQosrCrKoPD29ZjS4I?=
 =?us-ascii?Q?MII6p/SUPIRj4OBqNyujtK26vU6LN2uaDx+oFe/oxozxU4XIswzG1GYuKTU8?=
 =?us-ascii?Q?Y3jrw3Cw+97JcBmvymOMZ4Riki3MTzkBNcHqwB7hztm6PEfFoZuPaM1Shlrc?=
 =?us-ascii?Q?7byOqZFTgnPXjGfyrZSMuIkPcsA3+MtAlmLXWH87lQ7jRRcRY6tMRRaWujof?=
 =?us-ascii?Q?AOUaOuIsxTA3IhPrbJ5itBD1NBjd1bFwvSzw27TTQqFWvH3bvAkbi/jOcQpp?=
 =?us-ascii?Q?CDgaeP3ZCiXJQFKenapZpyvWWFGnVXXPeYq2e5wsw24ir+gFoMzojsmk8EhT?=
 =?us-ascii?Q?WTbART6W+50VMxMJdcZYf0rbhHi8QAoy7VBVnzuSLn+er/gWh1dswe8ocKgq?=
 =?us-ascii?Q?ZUhuaChyuowzJblAdBcDl1pCrI8s8rVgZhTDsESgah4W0xQBOgFadniOJQ4W?=
 =?us-ascii?Q?OSNvPzNzWtwssWnCLnCtBPW/hGyFVrSSS3/iTvS/9Nr3bSEZ6fc5pdz7Ew/d?=
 =?us-ascii?Q?5h3DPwLOcOkh+SXUCSFi9ZEWU/xJZDz6zh56L30ezIq8q2hjUo7Mj+8iQZ/B?=
 =?us-ascii?Q?Q7cA3cOuNf4JaG9X9FZF6Je/blSFOY8Ru2JsD61WfP8pXVk3P8qG1BFdKVOD?=
 =?us-ascii?Q?8ZJnYqrmeKwdTjao9FtIMA7+iIFO9UUHRVHu1l+giB7nPnGUrUa6O4M3jjfH?=
 =?us-ascii?Q?1HLNO3VXuzQBRHo4kaVUCDk8XQg2MdkFVhNjThcx7+LLlNJs/dlJ2bQ9sdAQ?=
 =?us-ascii?Q?bAFfy6yVoKTT38KUT0264+GtUS7lOmXLioi2DZq2zlv1zBwAs0RpfcM+mptq?=
 =?us-ascii?Q?/vVZyA05e4jo5ZTZsQGVv2miMC7lVSDStdC3u6nFw7wTDVgJNPogJq+05YZL?=
 =?us-ascii?Q?MMLje9C94JyZq7CWmoQRr4MedDHwJ6/7Rh/D5EENNTYJIJ43z8Z6gS5vYKan?=
 =?us-ascii?Q?JB4usBC/JMJYcDls6HPn17aN3W5qfBmIzqgmg/GoXMpqJ4wYOqmAOfrhZ1yg?=
 =?us-ascii?Q?IsT3uLIXJ3wDmXFCrTa2ATSjpw1TjcKlfcb3vsEm2TtVQJiC2Odtv3NyQjC5?=
 =?us-ascii?Q?CtnPW/IxnnS4Zh4w2aq94ginDMsOxa/UV6q9ftrR2xMBXyoVvSW4CikS4mMq?=
 =?us-ascii?Q?VgwuIR01PBhguUEaQL65ZsA9Sf3xShVOWoy3Rm22oAF7lJq21vJ4jQgj754O?=
 =?us-ascii?Q?3HcaLSrLc1TsS21ikG0gZhakVSuf0h/y/4p+t2rrw54rKHx9feQb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 907d2b36-3e25-40d5-a8de-08df2aab34ec
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 10:58:12.8789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaN7sniQUJl4F3YKlew6ADRFQWFaYiX38LuQUadzstqIV20YBhG4xOvUehZgS6xBfJI53PByZMGUfa/GiMzFiUL0onUegEwkT4woWtNnUZrjUG1v+Bv91bLZxWZ51k9h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6923

On Thu, Oct 15, 2026 at 10:11:49AM +0200, Stefano Radaelli wrote:
>From: Stefano Radaelli <stefano.r@variscite.com>
>
>scl-gpios and sda-gpios need GPIO_OPEN_DRAIN flag, otherwise the
>following run-time warning is seen:
>
>gpio-146 (scl): enforced open drain please flag it properly in DT/ACPI DSDT/board file
>
>Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
>---
> arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
>index 3e590afa4fab..036afa0f6990 100644
>--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
>+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
>@@ -287,8 +287,8 @@ &i2c3 {
> 	pinctrl-names = "default", "gpio";
> 	pinctrl-0 = <&pinctrl_i2c3>;
> 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
>-	scl-gpios = <&gpio5 18 GPIO_ACTIVE_HIGH>;
>-	sda-gpios = <&gpio5 19 GPIO_ACTIVE_HIGH>;
>+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

I think ODE should be configured for pinctrl_i2c3_gpio.

Regards
Peng


> 	status = "okay";
> 
> 	pca6416: gpio@20 {
>-- 
>2.47.3
>
