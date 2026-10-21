Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792570755;
	b=26/89Su+S8+/m1nYoIBiujS5kJG3WGDmV57UfQ4ewxEheXzIL8Hkw8MSXASATaY0depB
	 kUj37AmqbU89q2G8yex0nho6ScTHHPMz6rL7YDaOaNwFSZqEeVnDTo58GaEL+v65gUg6A
	 OsGepO3ZNCDH17RDFo3hFg0ROjt67qOEIv6pxFBzPyjG47Qv0yKt1wOjXGw6xrxbF1pmr
	 xSgJaktkS/5ei9+InQlfPbIPtd7HIsf6whe2AE8kq4j6EmoU2jQ2q/hvQPr4cR2QeTSyH
	 R31r8hkC8y6goJCMinHD0XQrWFbcmICeg364dCUkOArVZ9VJxj4CnpcBzEkMDaCK9cA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570755;
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
	bh=dsYd9ISpr/TzDpW09pw+1RvvlQONYKq4I5ugleRQgVM=;
	b=mKeHVsevHz6ap64Zv1VMei0v/NFEepeCjgTe9dkVgrOKEtK44Z5tetO7TtJS76zKy2CX
	 6FLVKLR20bkF1NN36DWA/IIR5EhkpU8WcXgWZUVdYVKRWKuA5QW4QORwcBbdOmzETnYmj
	 aZZQilHNFWKx+bvT/8Sm4rHPOEwoy6CPm4DLU21W5nMWCLf/leFXc/Od6iEoGSk5UHXXN
	 +Uo+02XEM8IM8P2GqYFZ7/w/KsQQ6zuN22zPYpYovTHbICADAFW09Vc1LMFOlpAK0mIw7
	 0tXaw3I4q/flVuVB/TVLVpwNPscW3d0IddipMhzK5jZsmf50sSHj9V0Bjkyk4gimzyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=SGnQN8Um;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.47
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010047.outbound.protection.outlook.com [52.101.69.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DFC606A319;
	Wed, 21 Oct 2026 08:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3DFC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=SGnQN8Um
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyANmhApyielnzTFr5jY513xsuE5uV2lP+vKfz31g0523raIXoC8O9KrzTTZenG9mVfnS/ootd8QCqEFOuP6v+BGMpP9l2HD7Tl0NbIFxy//Rt84zl6RsVi5CEhTuF0xNRknUrZL9u43rXoPJm4u/ooBLaRQtesi1WEBA9Waq2eF2oTaTZpvwi1erjO7npCssyPz9i1ttmRdVhDXcJqnjXw/u3fZaGt9X2qHqjjiBkblY4t9Kwxpr1NjBpfutV0uJlPgOlPbQXyRW2MjpknMWJMj7FWcCmDJ0T8urfm6Dy2JvTHBo4Kc7JtYn9UZS40Fb3FJWYdqpRhTTR5GrVeIFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsYd9ISpr/TzDpW09pw+1RvvlQONYKq4I5ugleRQgVM=;
 b=ydqqoKq9eDmpgfcEqCyX1j9Pctwz9aoUygVJvZn52c+3Rks3TGW06AjrkPrgXujv1VJlTr4dRhv5Pf1HJxHXay+nj8Jwkg7bMW1jgMlveix5VBuGLpQoeSziP7ihn0oXXUIzqkYOtiKlXMnejle4eyE8/V+RfUV0eMJ7LtR/6+kBiaXtPGV1t20XpMmVPQTGvUGm2YRXz+ms8C4mUoTsaA8jRbioMSSmBJPjrDnjG/hoAe2hWEsUc4VlbDRzW8d1Hsu83jc8khxgLV674ALUDAePKC2AH6zeFjaKpImXW8D6HTvIrUfoBeIcCJoAoMuiZHPy4A2nkumZM1RqqSQTAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsYd9ISpr/TzDpW09pw+1RvvlQONYKq4I5ugleRQgVM=;
 b=SGnQN8UmezZcCOQlwYaIKzm2ztkjx8aT+l/Jt91xsIGo8mwQ8F0j7nnxl8QR++mmbBhTdcbwTBIvgzuVv9UKZtdQFyEEE4L85qcTPiwYVvLMvnaNa60kdwnnwoeNUcPD5s5/CbMqUH3Akh3TLEQt3zDNdtcOHhWfV4zaalW014zvYoqq42LobcjMcmzxyJxxlWzsJy8/8pRn4YQjJbsjUTE9oE+ZI4mPlZbimrwzqmCVejxMxJQrU45Brk+/2f1Eaa559auS9LDwgWf3l5/CzOdT6922BRBxFMtbg7Ka7t95/jFJ+egHbk7UzbiCHa/bgPSy3w+vLt982gHVxruwFA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com (2603:10a6:290:c0::7)
 by AS4PR04MB9411.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 08:19:11 +0000
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151]) by MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 08:19:11 +0000
Date: Wed, 21 Oct 2026 16:20:44 +0800
From: Liu Ying <victor.liu@nxp.com>
To: Frank.Li@oss.nxp.com
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: lcdif: add compatible string for
 i.MX8QXP and i.MX8DXL
Message-ID: <ath13BND12se3AWv@raspi>
References: <20261020-dxl_lcdif-v3-0-adc944659e14@nxp.com>
 <20261020-dxl_lcdif-v3-1-adc944659e14@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-dxl_lcdif-v3-1-adc944659e14@nxp.com>
X-ClientProxiedBy: SI2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:4:186::15) To MI9PR04MB350878.eurprd04.prod.outlook.com
 (2603:10a6:290:c0::7)
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
X-MS-TrafficTypeDiagnostic: MI9PR04MB350878:EE_|AS4PR04MB9411:EE_
X-MS-Office365-Filtering-Correlation-Id: f21b9c6f-752d-4d19-454d-08df2f4bfc59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|19092799006|1800799024|56012099006|261009223027099003|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	N9cX3OOneNERu9daLkfs78XUCbNRI688Q2yZUoJH8Es2/pmWE8z8YcSBH+wjVt7grTZ3rsbW+KQJ655Y9qAGb8AppoRARnnSLooU3VbKJZMhApMTat2fc6rMC12FVRoPL4X/LhvURoc40RtdnUpjWzL2RoeWIip7APpWqK37DlBwFvOrDa8TEDd3atwoUHquwF1iB3LiWnZJ1ez3KFi/3Vhu4LHpS7mgQtt4AITH01lbwOFLSCRj8E3AOSoUfxuv3gU6gUKIK815XvJ8N3b93H4yfolUsrW/wlMPiAXSCOO7MexTg6LKzUQ22Smhyx3bodxCyhzZLTcAdKvt/NocMw+Tx2bLGvsKu6Y252eVvAkYQI3nvHmAj8YhlRIf9hWsXYcXTJS+efbNSaZMw6pcCr8vaBo2ZFyxYy/RNZOK4dR6dz+c61TRGMqGQ8QKSrxuFSVwZW7CiIMAdlpTcR7cH5A1mIArIIsqgHLVbAZJuPIHOf26LiBtMpCFowUwloY4cwphksg8YY4+/+17STdczhlUV3ExxVi3AFrgBz8Ty/+vi2W9bvjL95oM233IW8Gr0OlViaFK8QT7QxmKgQ0UHZpAFPp3YkTzEwcwuz9IwrjaM4vwRNdux7uLzim+XUlzPJL6lYMOW+dqT57n2NhVFjzXCyuYWiGdL7bhvB0d7rk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB350878.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(19092799006)(1800799024)(56012099006)(261009223027099003)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?txYkrn/9IZ4wird/ijifXvnkWohzUf0R0FAAL/cKRNiNyZMPna+P7gmBai6s?=
 =?us-ascii?Q?GNh7+PZfegXqBnjBSak/U47VXbdFa4cURZqmcTqA2HLz6IVnoLv5LNmQhzGo?=
 =?us-ascii?Q?D6bC0/f7M9cgTUG83Tcodelt2TIOPzQv8Ew/ZqFtPgaMlVaatPObtDT9NLtp?=
 =?us-ascii?Q?udHQSol4siMBpPQUH3r7pQE4dQKf3ETtOr42zoL4g4ZHplkdQuvg5Rz15xtX?=
 =?us-ascii?Q?gR7levN+boOKbr8nx7eH06vTtse+uF1Dh20wW4xBX+doqXop+Em3eAcwOarc?=
 =?us-ascii?Q?6WBvG0gdgQGcnBtUk2+e3reQ0oZSm39t4YrVPEirG+tz6M6fGkbeml9OsPNn?=
 =?us-ascii?Q?EW7XuRYr8We3JRfvhD7eSwjyFARK2Ph7NKXLQXC60SEILOVMGig+hmuoPuXF?=
 =?us-ascii?Q?ZHU8k9EIs4g+7yokQafQP1fJs3ZigY0LKNT+ilO9XpVxkLdiStJ2QQlSXRsY?=
 =?us-ascii?Q?xslvCij7bELUcQvLb6l1rjI9JbGNaVdt+FqAD7AD2HdZDFgNOZn0Z/PZYZRI?=
 =?us-ascii?Q?kP3ubq8Z7Wvaag44d4Aeg9kKaggcrT9PdMzYgsZogVnbN7C3SwMFTnAOaAIQ?=
 =?us-ascii?Q?7AHuMR5ZoTKvn/dBWBz4iVGIE+cX7rXhvc11mDLbkEUZ3ep1kGlnGflVRZmq?=
 =?us-ascii?Q?7CH9lIH3lZq4TZi59Nkdwry0GvAANsX8/XPsCcf54FDBTuGoJZMa5BkjSB7w?=
 =?us-ascii?Q?KbGawoavo9j2ykAJJRwHBm+e5YMVwHqcNgPRe+lFziJQ60hHzpjKPbiJitr5?=
 =?us-ascii?Q?fJhCLDWhR7xDJB+zoPW94Q8fAJpX3VFNNr31z8hZSknvot8WazZAEZSdzC3E?=
 =?us-ascii?Q?utd9vVEdY3aF6xDa6osyqaV9gWyqnF7q4mhFtCw6535afy3/WsniVnpdsp5J?=
 =?us-ascii?Q?jhjg4yH+glcXXkIZuD8h/1r3t8l8LNgpyKunpmkQHjRu0naPjj1eQa9zr4kT?=
 =?us-ascii?Q?iu18BVAPMZfsdipZ4wJenhJT8OzhyI/cCpnZ3trb2mrjG0BsZTi7kDbFAjpC?=
 =?us-ascii?Q?dvMkcrEml+6tlHZUujk0b52lOAdByHpCjm8OQ2laLIoom+Z3ZaU1kSaBRC34?=
 =?us-ascii?Q?UuLSGFqFhSI9dcoHET1b1M9ygbLQ2fHt6geJQ6nBRGCVmdq9/wz4ELUSrGNP?=
 =?us-ascii?Q?ThEhXjCs9mo1YO6FhsdyOltTA/1GDW/ZvH6n06Q624XnXGv+6aMqZ6a0A6tf?=
 =?us-ascii?Q?WNKhZa6603CcZZ43A0ymrfEihy8gGekzjJtmmXiMVu3NkJen4hMSfEunPdtx?=
 =?us-ascii?Q?CfwBTgYfYNiFFIyMwDIQAYwe9Bi6q45oJYUlH1Rjc6MwZZ2I6vpfxFizTult?=
 =?us-ascii?Q?LWABiL6ECrs6SmTxnss9lDz8uUogH/G5WLWMp91xpF3JFXkxZj7M27BcqEkZ?=
 =?us-ascii?Q?X/m7TsuzPEx1Iz6Nfrh4HFesGUcReeJGsbGrXeV71+lzKw8iK5bCMY/AHfjj?=
 =?us-ascii?Q?BEQgkKF0kBcwT60Tlm+Umup4BeVh6T3E8e1abe5J3ZxRvEjh9pLyWHiD8Fyr?=
 =?us-ascii?Q?lzUz9exdwYpgHgecbtfkNjxAJmVrJfYQZDzPokqrTGLaSx94Sn62FrsvBRBN?=
 =?us-ascii?Q?hB1JLZVaM3jbiRqQTYzkyV70Mzc0OSCPj3WLT/gyMcWrOFfpDGwj24o21Cs0?=
 =?us-ascii?Q?nNGRntsROqIP87r0zv+pEsY6rG0H615Cc9pqgQxGkcO08oUV10kHJswL58Nb?=
 =?us-ascii?Q?mX/vpoZ9hdEkcO3kCfKZCOMBWuP6Vo2Am/OQsu2Ao3PKrXDTOVIVjnsxi+Gi?=
 =?us-ascii?Q?w/8/5pmPIQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f21b9c6f-752d-4d19-454d-08df2f4bfc59
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB350878.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 08:19:11.3916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MemQ6h9W5U+xwI6nh5m+sYXo9Bw+rRKPVfnIHG4blC3G70xXsxzW5DAjADhjp9RldXN7GTCOulwFmpmaODA3gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9411

On Tue, Oct 20, 2026 at 04:12:51PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> i.MX8QXP and i.MX8DXL have lcdif, which back compatible with i.MX6SX. Add
> front compatible string "fsl,imx8dxl-lcdif" and "fsl,imx8qxp-lcdif", which
> fallback to "fsl,imx6sx-lcdif".
> 
> Required power-domains for both. Required 3 clocks and clock-names.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
> - require 3 clocks ans clock-names
> change in v2
> - require power-domains (sashiko)
> ---
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Liu Ying <victor.liu@nxp.com>
