Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96F44F0542;
	Thu,  3 Sep 2026 19:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788463379; cv=fail; b=VhpA8Dq+qBxiNHyxcWCLdOP+qYuPIMjCJyUI+I1KSXg0FjX9IMh4ar5tPCOnLEaSWttUTic4r4kllL70Wp4Y2KI43Mjosa4Fcd2moOErEtVE/h5BbbNgUjZaLO9r8qgy4mzkaTokh46vaOJXL1YbpYrCk7RT7qFUzZmYJ6mMDQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788463379; c=relaxed/simple;
	bh=YlVH+k9HzPBFUDbLqnw0BpK6BzrClU7Sx6uYpLalZvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZZWYiefidnnEEBWnBci2kr0E9XqAUN9R6yjVd18dZjlImD0EYoRbB0pbHbr187MrJRu5qyAxvuFgQejX8gjHQYg19ztu5wQ+xSnW4VVhJtMnM+/Jya5u0XJ+VjX4jwLX6afySqN4VRtQzkWxG54ZGzqe+ve4p7239rhWj4F3oxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=L6awsgWy; arc=fail smtp.client-ip=40.107.159.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="L6awsgWy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jV6rwhOEB1QwbZlSKNrPdWFaRbCm26FNwtngAoc+tUOouE/A5I5P/pnBRUr6u2kUBl0aWRZn9B+D5zYiBnK/FsLt4eM3dZ4GtO0Z1EWxJ3TGrPrcFGfN6261HurvF+ZhY0aRahhmysAFrtitLjXHw/nXvVpYP9RGl0NhX2OKXgmFxmVZYq5uZ6jIJWjoz+EmM+5Qu2BW5ChfP5nUHr5xx2neLpi3fXHz86CW48dkhhx932jCPWr5RO+VJ4SiI6IzkSESMHdzL1/KFRWyUyHzYOpMxvymCiWGwZfbgPQ44z6NsNuu+Tpy3YnPMdzvbIeeqRSLEkqSEzrBdhHZg5LIsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcVJSmRgiseI93jo70lwLSmn78KKBeExyHPZIx7nwn4=;
 b=N/MVmu2E3ROAyxjtCdaqctXPqQhMuj4v8mOnyeiyfgZGTczGh9oec8hDtY2bBEo7P/WFgwYcbV1L+Cevy6uNgiT+k8aKI4PN7cOZbfPj0ABynyk85TVxoCFvecPWbwKsMlbsshpNvuCTMQuWLSQUmhi4MGSbeNiIry4aFYJ0dJrTXYJp99dTByisTlVX1VI0AJsxJ4iyjJz9tikIw2fKu5XA7n4//pnqXeGxvZgo+7zLI8BIRZ7ZL5Umzc5o1X4BUxm3OUbHKpk9G+CubhJQavpA5xwcF0eUZke2NbUMe2P06jIi7hUvAa9cgeitLUkXCZQjISlgN3Np+uNmFWOjKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcVJSmRgiseI93jo70lwLSmn78KKBeExyHPZIx7nwn4=;
 b=L6awsgWyl3o6e64BgYj41ehjZOjHE24j6W95XwPAWEIQuUdOFsIFqgD1u44SmV7X34sx3PycRZ3am9Jllwbor/t+8wdY1LRXz/LFU56WcZUAPxZPlp9VXgwXd/XTRU1sIdj9BgD1U2O1oAXEjPG8OcwwWHbKeyuEBmmTZz0ZNSg0NC+x1n0+HBftR+VYZ1c1FfjeHu3AgCEd5cPE9vMwSGbk9gEKHVpv2WnHwTfd3VS+t47BYMlziR2JMgQh7SfwbivUBfdwwa5ND7nyOHy1ANOEvTQifDsXHaVgwQd936YrtVARNBUq6R/s2Hp9VcdNVEYBl0zpLJJlcamxCK4oZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB11364.eurprd04.prod.outlook.com (2603:10a6:10:5d7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 19:22:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 19:22:44 +0000
Date: Thu, 3 Sep 2026 14:22:35 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	"open list:MULTIFUNCTION DEVICES (MFD)" <mfd@lists.linux.dev>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mfd: da9052: allow dlg,da9053-aa
 fallback to dlg,da9052
Message-ID: <apnI-7b2xXLslwd4@SMW015318>
References: <20260831201522.51294-1-Frank.Li@oss.nxp.com>
 <20260903-hypnotic-pearl-ladybug-8ed62d@quoll>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-hypnotic-pearl-ladybug-8ed62d@quoll>
X-ClientProxiedBy: CY5P221CA0132.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:1f::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB11364:EE_
X-MS-Office365-Filtering-Correlation-Id: b16a4194-d990-44ae-c0e8-08df09f0baca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|23010399003|376014|7416014|366016|4143699003|10067099003|11063799006|18002099003|22082099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	Bop35JZOIzWDod0FHDkIQZw5J5zAlcZKhWG3NT6pqwRPqlBUUmv1/Ah+/X7xHvnhEbP5jxuWeAg/yyp0P86WS3+mTqnBL3Vp1ip1i6HkJqR6OxPcKwXN4QuU5j961eUoYIaRgujYPRs5UIhmdx78/wADXBMlmgkrMeMGq7djmyye9IdpCl8XcKNZGe1FlZyX/N5da96H9FjjP/9rhpd84dScyICT4EzDsmEVwc7PqbUjUFbrLQ+OtuTS1erOZ1ReWYnDREVnudX8gpmCka4RMaFoarEPegnMSfT//Lu7ZoNZ+nHbHIY4G8NLUhgp3hkNOlhjs3uvuR+RGETP0TbqeGIdg9hyTcaF2Sf7kCaJtsUmd0TwtKBn/lwnhioQRBwrsi3c1d2D9GEPxeiTHUcPpo0ml2DB1tqyxeVRKgWdqQs/16mHNgK7jXlRuHe3Ji7rQOhlk3VJYriS1PCk2bqjrbirjosMQvocbsQgbXhsvm70xgY2RLJQCD7tfQvQkAijszBx7EnYM1vfLmJuVASqtZilmkypFIotWHjeE7e+6ZSQUADpL5GOZBvN6BqgygBaXT9bxY28X50a6xqGAlX/Mmmi76BMX+z2rxONCZ52IGw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(376014)(7416014)(366016)(4143699003)(10067099003)(11063799006)(18002099003)(22082099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v/2hK69/rqf8DsD9+laTI0HfkvmK1a613gaD1EUYWfGmTMtZcLjd+ew1jmRL?=
 =?us-ascii?Q?35EK62FNVx62cfPWFUXblD0G13Zi6u7V4mrZlvjo6HUaLa7mL0XZplMliltr?=
 =?us-ascii?Q?GSW1dnRFWSBDJqNvNUSxx6J9egxtfQ2b1VbDNs8Xau5CR3LloTYwA9gNPz6L?=
 =?us-ascii?Q?faS87yqrIlOX/Fn8h5wwCuSvzJjw/bQpG6YwA+Ys8YPAIv0mPJqprfL07pes?=
 =?us-ascii?Q?ATrzb4oyn7oX1YGjWwdl6i0eRkG4yRnddeU0GLSxd3Fm3Ny9HZHBgmtNxveb?=
 =?us-ascii?Q?EM/jBS5RmQ1b8rdG0DVv46Sbzp4zyBoyHba3up+lUMcgtSID3cqEGSKSmr9h?=
 =?us-ascii?Q?4JEcUq+uSzpPxninRgxFY7ExFMOAIwitdZ+LE1TRQxIrR/yXCDajsIM/JHDt?=
 =?us-ascii?Q?PKjtqZs3ZcdJkiFpNd1OpFKj2wO11m3lkyCB/sLhEsQz8sgDCbQEnt4RHbw5?=
 =?us-ascii?Q?3HRcTyWViCexzavngLPD1hkkJkgHqwt3cK0c3wAObT4Y/zdzfONM6bDhorNX?=
 =?us-ascii?Q?bnroSacJ6ttCNK/m76KPKb0mXg82GAn31rnOpkJMD8Qe++pgCRxPeNog8v6k?=
 =?us-ascii?Q?3RwQWnLbAezGQofl0C82upYgXk2OGpMTYrsG7ZBiaEUhxAIEP4ydKv30wMvV?=
 =?us-ascii?Q?Fozpyx1kf3TGjyBXzI/c9VEAC/z/Ji4+5dat2TWT5VgEIP2umTuPSVOSbyYi?=
 =?us-ascii?Q?st1yjJK4IuKw+Hpmcfrs0uQ6dVUnyMLUyNSRpp/6bGCxyfM4HmkV2NWLWrOt?=
 =?us-ascii?Q?xMROG8hGYqSX+2CW1C2wskqbkg/aEyTtpV4APHJflfrMWiGV0jCE9py1abh+?=
 =?us-ascii?Q?SauMN+kkYcRsyfODhM1yi86qI2cHsNKxuZxww/on6WbyzB3t1AACwdivIucD?=
 =?us-ascii?Q?omgTl2cfzR3Zm69jBzS0sQMIwi+rmq4kwiREF0DWgH7E0Edv2VgOwKj0NZUr?=
 =?us-ascii?Q?DZjptZdd0OfqKvMko8FKijr/1dWXZsWfzZyyOOSC//h/pzgy21wFEzInDl/s?=
 =?us-ascii?Q?Q7JUOlkjVjVypBumZD/dfn0yYhWaiOs4XnuR2Uj8GmpGshp8tOA+CInjJfVV?=
 =?us-ascii?Q?D+sYajYKJSRrcZ3+qP4BCd3a0pyxHW0CVqhmTDm7W2dlouQzm5TE/qTfrTIG?=
 =?us-ascii?Q?/1aqLVrsjXXhnUU5bSOCcwaBiOUT9VAYnQRaH+/3T3bULHZxO3AzjP4tKyY7?=
 =?us-ascii?Q?OjVkCsuxaWjfZz5mjk2zLLSg1zfidC5w6CqO+Rc77pJI19PT9UHF+X5Y+KM9?=
 =?us-ascii?Q?47jgJCyS2RGubFhiiJ9wPCedSvlJrAUyx45up5lXaoKBfTtR60EflV0r58uk?=
 =?us-ascii?Q?Y9Zf9MNSbZeLAmzqqSRRdHjdoLfQWGU2Z8lmhTcXdxpKm0U/NL3ex1vMpmz1?=
 =?us-ascii?Q?ltvnwc/BbjOEK+Hb/+voitsOFaolrrlJ+TD2YJwQOJ8ogdoiWWBMRIDRvZPz?=
 =?us-ascii?Q?YQwOyf23PsCV677A0YRBqac48ugLvmEYlKr8YuNIzDDf38VrNNMXrttDuMcA?=
 =?us-ascii?Q?TN7gSFE7C+BrdNNNKnrXEKoRMiF67POCC54SPAo+ILxzJ7Q6DJr2X3dRH0CK?=
 =?us-ascii?Q?v6zuO9VoUpFAmrNnZUzctmJOfeu+jhciwGdEulfE+uMj14ZN1n1Yi42tLpeJ?=
 =?us-ascii?Q?9dymnG6C94Qni6BuC91EafvhApN/+VvP5cypi8/EMXIDWET/U5P6JN79Ir4b?=
 =?us-ascii?Q?JpTpfYdQy9Iyhdd+TGgx0eimOAezp6LgDO/HCTX1aALI6FPOFdfzWl4nC/dz?=
 =?us-ascii?Q?xKwBFJSoxmuPrsEsmuq1tNCDUc5DuTEodzPZuU7Pjq9EW0YoLw8e?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b16a4194-d990-44ae-c0e8-08df09f0baca
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:22:44.3301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjSGSSdLznSDeywUXCwpGhtgSgMFJRR1ip9a5IjfwyLsRKuQSeuZEG8rrYKz+erKi3rhFXINORKgsw7K9dtM6RX8hPdXbt07yxhLFaNFWUGV0opOt1ZrUFAclUj/oD6r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11364

On Thu, Sep 03, 2026 at 11:58:35AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Aug 31, 2026 at 04:15:21PM -0400, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> >
> > Allow dlg,da9053-aa fallback to dlg,da9052 to fix legacy platform (> 10
> > years) check_dtbs warnings:
> >   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
> >         from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Previous try drop dlg,da9052 at
> > https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da@quoll/
> >
> > but Krzy have concern about compablity.
> >
> > https://lore.kernel.org/imx/20251107-matrimony-showdown-ba6ce6996b2f@spud/
> >
> > Conor prefer update old dts.
> > ---
> >  Documentation/devicetree/bindings/mfd/dlg,da9052.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml b/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml
> > index 1103a8cc5cea4..d1d23c7c4d0c2 100644
> > --- a/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml
> > @@ -18,6 +18,10 @@ properties:
> >            - dlg,da9053-bb
> >            - dlg,da9053-bc
> >            - dlg,da9052
> > +      - items:
> > +          - enum:
> > +              - dlg,da9053-aa
> > +          - const: dlg,da9052
>
> ... and the dlg,da9053-aa alone from earlier enum should be removed and
> existing DTS corrected.

there are dlg,da9053-aa alone at arch/arm/boot/dts/nxp/imx/imx53-ppd.dts.

Mix use both because it is too old.

Frank

>
> Best regards,
> Krzysztof
>
