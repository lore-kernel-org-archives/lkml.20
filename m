Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AE53B0598
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.104.111.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789562640; cv=none; b=n+GH98K+tFQvIKmFQlBw6Y5t1zUg9NMaovQkfASeyXYonIOlAYBDUeC5NPviXrhWdKjGj3PDXNuOctat2OhNxiEE11Q2fElAVGF4IvTWXvAAZ3iCp5OcFb5fHxHXo5LsMsxy0K3Yk9rGvwczxDW+JqmMk/LMNePdnt8NEh6zY7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789562640; c=relaxed/simple;
	bh=RzkCwdyu85GmYOctTqLpCkb4kWBYIY/LCfinVvtH9JY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type:Content-Disposition; b=jFyEVSQzlTDezGsIpHgKt4V3bJ3wmZYqZOHNktpOLzdZL52Ct729/fhRY6uiNnt/Bq8IW/ZmjJHfcMoF1l3GpJrMLD03X7UhOrE2GBKfaxJ3X2Oi/jyxM1/ALm1rkCVMhxeiNQiD+ndDMOgQ8YPRnWULYtMbD7kkbp22YSntbtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com; spf=pass smtp.mailfrom=toradex.com; dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b=iqIoly3o; arc=none smtp.client-ip=194.104.111.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toradex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b="iqIoly3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1789562636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yxHysgDgMWNkQPfyKdrvJfcEbu8J5hVA05T4sPLwgGw=;
	b=iqIoly3ouuV82kkMptO+VK085GGZFrAQwFJoBAMeH1XfkVPXjFc07b2Htw1fmzsXWHuR3D
	gWBXBB0glVZwaaVkB952PmYHj2P5soSosEjGv3JbAgXXyBhc4L5xMpItsP0LHVhl77nmzY
	JRKGd/lJDMhjCi7A7T3UBbesZkBfSUo=
Received: from ZRAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandnorthazon11020112.outbound.protection.outlook.com
 [52.101.186.112]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-62-MVfI5sy8NsCg4vrNKy8Iqg-1; Wed, 16 Sep 2026 14:43:54 +0200
X-MC-Unique: MVfI5sy8NsCg4vrNKy8Iqg-1
X-Mimecast-MFC-AGG-ID: MVfI5sy8NsCg4vrNKy8Iqg_1789562633
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 GV0P278MB0035.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:1e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.9; Wed, 16 Sep 2026 12:43:51 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2%6]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 12:43:50 +0000
Date: Wed, 16 Sep 2026 14:43:49 +0200
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <aqqPBffOWirFXJSw@francesco-nb>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <42ed88a6-d208-482b-94aa-2e45b69c173e@lunn.ch>
 <20260915132806.GA226756@francesco-nb>
 <100eef7b-e1d6-411b-bac5-98790e8f9ea7@lunn.ch>
 <aqmG91HwmKe-enfy@francesco-nb>
 <95dcbf3e-193d-460b-b6b9-cd412394e4c6@lunn.ch>
 <20260916055706.GA20310@francesco-nb>
 <8bb9b763-4553-4263-b0ea-0129f5db0229@lunn.ch>
In-Reply-To: <8bb9b763-4553-4263-b0ea-0129f5db0229@lunn.ch>
X-ClientProxiedBy: ZR2P278CA0038.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::7) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZRAP278MB0495:EE_|GV0P278MB0035:EE_
X-MS-Office365-Filtering-Correlation-Id: e5bf6300-56a1-43e4-df5f-08df13f028c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|4143699003|56012099006|10067099003|22082099003|18002099003|3023799007
X-Microsoft-Antispam-Message-Info: Itosf+dNNRTy1k7V+lR6lisg2mE2inK3KICylYRfp7dZNmlVe1NTIx88/hTq5BZM8LIWbmtMDCx/qr+PVDGOyJvfkuLY4+PN6Ip+oDPhqPetbRos4jfsKOtB9GLsCrRHAR3pfE+mhDYr1JJVHDw+YsZqCd+vd6NFyec23wKPDi220lscn/sm6ZrVM5SxUOHrFU+koKCXmfOvIilQt110TDNjtMTged3lOdsLF89ZvNuwYl0ae8QP/Zey7+KqAlkf/L4zdMnmS+qZva0f3rkS475O+t6NcaOndLQ64iTmxHblppdskLE3iORcM/3noFUA2ndJ6UySPuibj0TSGdlY5dtNipQcG09UEd27Z0Ecd8AUyYusdzbvNyeb/WxBLHWzAmUcNaeLDRwPnKKY7hez3mAMRMuegSzDVwOPFQvgph/G1p34SKHYkWxVUWV80CAcbD/CIE/7sbadxUneH1sLkDMHaSTBJtDOjmOMDqXtxgYtfiWjv+knXTu0nYcEhPjKRAIGnN8M1Mau7nvt8vMuySNTAV9+uEWheGplXMwAdntrUeUoZorfjSYUR4ySeY9KjbizWVKo6JRyj7gJiCrsLSy3TWp2CjnVuX7WtN4+zw6nRvBFhSNfQUvGzfMAo2a0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jy6J21KrLaMwYK8jcxNO2VKKAESzO0zQDGMm09ZjsyG4j3fh344DQUQ/ULHY?=
 =?us-ascii?Q?3GPSkZ1+sSA3pVCLNF5pryG5aY/mr8U2bxusPB9G8yXXcNZkWA0+BbrWIXw7?=
 =?us-ascii?Q?LoUrjSgYIYGSskIJsQrazR9F3/1PQrvy1Rp26aX1S35mDOl/vmjW9ap1oWpO?=
 =?us-ascii?Q?/KeuJomY4r0p4Xf/FFYRrEqI0ftdawmuYMsUCum/OJH+Yztu7jKQ04yLKJA0?=
 =?us-ascii?Q?lQ4SGyrA37Bio5usDcEf0PTn7SeYXMH9LhEdyqcRIgf5X5dXfbobIzDwdM2I?=
 =?us-ascii?Q?x/ajfiMmi0exm6i0QYmxuHKVkj/sFBJ+GwUqi4CvwORWIADuEbtdHcqf9Jq4?=
 =?us-ascii?Q?A6AXRkFktCJbPrhF8yY8TTcUBGSkIv5XRZdhCcVyKN9cFUHsrYTBX174H0sn?=
 =?us-ascii?Q?PMn0uidlWw1TKyOnCJPXdsVouhssS3+h/Clf8sY2pd5q1TEgu5O01qeeRf5c?=
 =?us-ascii?Q?WqB5nqTPTrw/7BrYMtDjKCxRNHc/CAkcXPcbd/wGgcB53gnhGwmhnJKBHF4n?=
 =?us-ascii?Q?CGs4aBKoMS9NCaJuXx7gOnJqX2MbArVPzL4dBcnB5TYVxsRW9ZqhZM15/SV2?=
 =?us-ascii?Q?mZnXgy71LP09Mvk+xS3G1EbV4LAF48TH5Jaw+6XjHYeQz9eEDY7KJvgaRimf?=
 =?us-ascii?Q?FEfVh4zFZJs73Yq6ejw8IGBT0ZEt24ke+DVVcKHTK/GNqvyXte3rttkzsZ0M?=
 =?us-ascii?Q?sXm4+x89hUOCyMwrkSXcscjvPwGsJp4i7QdUFUyJoP+rw48R2Hvh0ylTjZxd?=
 =?us-ascii?Q?hYXhAAP5m36NjKAu/toEy6jFOuo5n/p4+hhoU00FXM+c0F6TFJvBWuPjctcU?=
 =?us-ascii?Q?gdHkIui0wG61OajvK+7svpegpz0v0xKZaOZF0CtdzeWvK4f2ANnt6A1xLig2?=
 =?us-ascii?Q?li4lxgjIvcyTaZiQ9KsPEVHTcgt1qtC8esvX1pAFK0EJ9vgJHo28VonqOL81?=
 =?us-ascii?Q?Dp5YQvAC72DZFWMifNkbzJmSScD84EAWGYEdbn7i86M738nkT8XobC9PCOsv?=
 =?us-ascii?Q?D1ql5oLlA9qbNLTuZ/3/lp+627pOXdh609572uMlXKPWmssY8Tjgoz9cShR+?=
 =?us-ascii?Q?xYNdVrlGGPLFZ0H2xcTf0Zuuvn0wmEmtrX7sY3kG7KQihT4px+NkTgwau3Z6?=
 =?us-ascii?Q?LuxIx+OX7PvLVQ7W2YokjojBrbSoCS2El9kG1RH5juCiOD061NkEBC5XpEsl?=
 =?us-ascii?Q?jAHNencdQP76acvOe8a+bnBJ98V0ZfM/lznkknI1gBdyyYtbQaB/9UAkfG8e?=
 =?us-ascii?Q?3sjbQthe1Y6u2e/pleOZJ2Ioivqe7MZkqbltsvKSBATCSEvB6SCw2C45PaoL?=
 =?us-ascii?Q?sjblIUd8GvS/F84yZhf7AOqxP50hUr4L6GlRNOYTV8O4DN/TAowEtodn99Oq?=
 =?us-ascii?Q?o8yo8ClqrOqL/Nt2V08BYoZ0Gl8GmJUp98IcTf6RpvBETXy0gFbspL/FtzzF?=
 =?us-ascii?Q?Zs+mH/1Vzt9kI9Ze+pY2FRN773kJAgCSVWN89wXWfTixqTN/1tSVdKCkd5Nm?=
 =?us-ascii?Q?yyIYjoHGCpVGLApAjlLQ/By4dXD8p1a0YDSdn13hT8wrxghesayb3YR7D9oB?=
 =?us-ascii?Q?YaPeJpOhkFwRx2aGARdwAa8WXXEuKUEoRI5MJAkreDT1KVp7ez84XVXofz/c?=
 =?us-ascii?Q?5cGa4kGNvrcKUYSKeEE+kV27zgvbmIURURn7N4mJ7MvXWalLWXkYK4Zurt87?=
 =?us-ascii?Q?TboAE18peERrCBh/M50xbhFt017vPySznHh+y3CZ7rOzCqkbe1RRPHKnH019?=
 =?us-ascii?Q?zmsrri7NaRuWPXHlEiziwIoWSazORM4=3D?=
X-Exchange-RoutingPolicyChecked: zgDkfI0jg+O1ULrW/vb8V0yN+gOEZYvkF9rWRSuj4adtQ+8pzFW2GlxoMIrpW1ZdspZKn6y8MUyv+J0tTQW65GD9/y2GSNNizK56Q+qiRId1cV8VhcaKxQwXYaakIMRpbil3JxxXxJUdjwKEwb0cqvkxaUY0kfLX+yVkL2RFoA/ST6cLv9ApZ30qybetRxL0Ld/XfKO8Vm0rdjQLXbdoWSOZMNB2BZhr/Dngre3JABMezVWCo+nrRB4pOaywhs3ojazx/xAkXmyZ9BRg+/ywcbjiqhMghJ2z1AeWhZ6GlBr+lBfK58QTJ2g5B7zKvyfDbe44uajcuN6W9NorqPywmg==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5bf6300-56a1-43e4-df5f-08df13f028c4
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 12:43:50.8677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YygNQm/mRds8M3bklneXbzPWIfp+vfTNTO+MSA5Pr+OC9ua8Gfk8iaPa5h7gLjlpkVKiYkUEmwlDXPWZBos41z2pj83vLVKi/A1zUlqNb54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0035
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6Au-r32dc6H3A3AaTqThPbuUDWzWDikx8hAuU2sf16w_1789562633
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andrew,

On Wed, Sep 16, 2026 at 02:27:54PM +0200, Andrew Lunn wrote:
> > I looked into the specific ethernet phy used here, TI DP83867, and
> > I would say that the falling edge interrupt should be safe on this
> > specific board/phy.
>=20
> https://www.ti.com/lit/ds/symlink/dp83867ir.pdf
>=20
> Page 7:
>=20
>   INTERRUPT: This pin can be programmed as an interrupt output instead
>   of a Power down input. In this mode, Interrupts is asserted low
>   using this pin.
>=20
> Also:
>=20
>   When operating this pin as an interrupt, the pin is an open-drain
>   architecture.
>=20
> This allows you to connect multiple PHYs to one SoC interrupt, shared
> interrupts, which again needs level interrupts.
>=20
> So the datasheet says it is active low.

Yes, indeed. I was aware of it, I was just assuming this as a shared
understanding - sorry. My comment was supposed to be read as, "even if
this is a level interrupt, using it as edge is safe because of this
reasons, ...". In addition, in this specific board, the interrupt is not
shared, otherwise it could not work at all.

> > What do you think? *IF* my reasoning is correct I would suggest to keep
> > the code as it is now.
>=20
> If you decide to stay with edge, i suggest you put a comment in DT,
> something like:
>=20
> # The PHY data sheet says the interrupt is active low, but the
> # interrupt controller does not support level interrupts. Use it as
> # falling edge and hope for the best.

"hope for the best" is not what I plan for. Given the specific of this
ethernet phy I do not see any race condition, as I tried to describe in
the previous email. If you believe that my explanation is flowed and
there is a possible race condition please let me know and I would rather
go for polling.

And again, thanks for the review, I appreciate it. The goal is to have
working ethernet with the interrupt, and, **IF** not possible, working
ethernet is more important than the interrupt :-)

Francesco

