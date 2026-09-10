Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836034BB283
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.104.109.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057036; cv=none; b=FCpyj18K1vSWf6xmBXk7PxEPrcK9F6WIePAByqMbDU1ni+G3xgWUo4QFJ29U15VmA74DZI6+UASZ+Ij5R0DneEdlOroGMxpcox63FGtMXKhVUUa3iL21jCSXXX3k/GmygqGWlmLzuLsh1zbgrfcBikw4orobdVAFJZ/1XNoCOwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057036; c=relaxed/simple;
	bh=jPlEUae6RClcOkLzWvm0H9LhLHGMiDMLHQuqgn6Re2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type:Content-Disposition; b=Aq9YozEQAScjlL6EY+2jqlDjxZ/Td+n8B0a/C6zc4RGG0rF6TYcbznTMb46KgfURKa2jdM51/Cf+GkR1NrkivNv++tYwqnqq9UEEgKbYD10h9YVF+WMizckdgWgv3Xp7ukRxhlvM+W63yOuxEzSsrCwD17R9g3RqNM6saYsPuWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com; spf=pass smtp.mailfrom=toradex.com; dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b=KmZJEJlp; arc=none smtp.client-ip=194.104.109.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toradex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b="KmZJEJlp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1789057032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jPlEUae6RClcOkLzWvm0H9LhLHGMiDMLHQuqgn6Re2U=;
	b=KmZJEJlpGU6CoBx4kNfwJx9c+calVQlHSSWMa3bG4KVBE9JyXF3EMqImVgBvDVEsEVTs9l
	2GuzxyZpIWCHABk8lepCyNOh6EqRX/C4oYHZaqwQWuyGqE18eBvZINgYaLwzJ9wneTyxJT
	W9BI+ljE5ZEfl/pVhH2gZD60S8vcLFg=
Received: from GVAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandwestazon11020079.outbound.protection.outlook.com
 [52.101.188.79]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-84-M4qVeMoGMMiTxbRoinEAyQ-1; Thu, 10 Sep 2026 18:10:37 +0200
X-MC-Unique: M4qVeMoGMMiTxbRoinEAyQ-1
X-Mimecast-MFC-AGG-ID: M4qVeMoGMMiTxbRoinEAyQ_1789056636
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR0P278MB1219.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:7f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Thu, 10 Sep 2026 16:10:34 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 16:10:34 +0000
Date: Thu, 10 Sep 2026 18:10:29 +0200
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Frank Li <Frank.li@oss.nxp.com>
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
Subject: Re: [PATCH v1 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <aqLWdap-AizR4uX5@francesco-nb>
References: <20260910101616.139270-1-francesco@dolcini.it>
 <20260910101616.139270-4-francesco@dolcini.it>
 <aqLVCq9NMk67fqPY@SMW015318>
In-Reply-To: <aqLVCq9NMk67fqPY@SMW015318>
X-ClientProxiedBy: ZR0P278CA0157.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::22) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZRAP278MB0495:EE_|ZR0P278MB1219:EE_
X-MS-Office365-Filtering-Correlation-Id: b9769873-a57a-489b-c83d-08df0f560967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|18002099003|22082099003|56012099006|4143699003|10067099003
X-Microsoft-Antispam-Message-Info: c22VYVyrgp8YAOYPgTFskEeUdfqhiTiNkjMkOdFOThtjxmjtzaOxUqdKYui1UUu6+LUtAj8mJxSv3YZNtCq0xKZfH8S2uCynkaerBV1IV+vgQ5gGp7Ej6fqxQSyxIFHwqVjhhr22pYvlNIByUryX3Gsk9RtNUCd3Pd4zBsJzCIl/oURAQCn7/qVOvhGSn+Sbi+TdQs7BB4axhN4z9C/rIzGngSZKl/T1mNxlJgB2qNp5Fc6U3/J/OG1M9TZTf7VYrpzMVbuFTm9kF1kjC/OqOJpBb37BLcpSpaSMM1oYUv5Sp3PCCUhQHH3SaVx7GQS5VfOFf++yMhQodlkW0OLgi2zE1v4BonWguWpajFtQCnBpyK/KcLTyo8I6PFf5QyAHsBtOl5fyVp0ZLLZetcmMBNrKpI1yl862tozlQAgBbMPKmbXsk3vsqQ+g1PoTHUI4m705hFb1nl4f+D9Djqf6MXyqRedaUjpJQnR9Tt5EkKVwlkAAMmIUhul6b5rsgnXs35U64Fzq52Z2zWfRYQWIoFJwfNrp++FHujfjSa1IZMj4f6UnTnIZYMfAVpTBN0JZs4g9/fgRvzHgUZcvkb6/vedGCbm7lXYsKJyhjtekoaXUc0esJrJ1wT2iT7yw7Tubuzx8+WlXb16hS0yKra1mLk/d85y5BMGGPdXX07Cp7So=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zHriv+c8v+SV8zZTAiiIWIWhB5Z3p3U5iNYikrjsqbn6vgOuHidMSWO+S/zC?=
 =?us-ascii?Q?wlUtseZW+f9G1HkIWbNiiMgJhWu+Op1OLY2nvvTcFku1PF6Uo0j/CIMDfk79?=
 =?us-ascii?Q?riiqF3a1/yOzClkuAoA3fItzgJg9JpX2HePLgPzZ2+WnW6tSSQKDZhXaHSP6?=
 =?us-ascii?Q?C5Z8mvS9RX1uJN/6yU9MXONkgDtO7GjXxz67yLu4wq40NKii7WI7DjmQqw/V?=
 =?us-ascii?Q?sy+Vl7zqskPpCRcbUcBNr1fiOj7P7WpkFwlm7wRPGhdKHwONJMQrn3JZNvK2?=
 =?us-ascii?Q?WZ8CFipkPY7O6Me/1sRd1TmWBH8+QK3E5cKuHpFkHPH+z+1M0ZoK78MrjnHT?=
 =?us-ascii?Q?cgIpMxpc1LKWZge/PqPtg0l3Y/7cvZCbYKPmUlvOoBTiGOAaFJ3V87sKYSJK?=
 =?us-ascii?Q?SzXduEFOOibpo2/WWvLgJw5hVHZk/Y3/8uv6nQBbULSAWESpGQoybv2q0Nrd?=
 =?us-ascii?Q?ls6Fms/cVOdvmU57k/h2ksoRWy5yj2B/0yC/8Ov6/P0DwL6pcL2Ck4yGRCEF?=
 =?us-ascii?Q?Bl82HI1hymCEvOMJzMhUuJmP940jFFhmgB8eFdedm3oTpMDFgI4oJPuhyope?=
 =?us-ascii?Q?Gt3OqKQ+Jo9btnTho8jFABSmdezd0WLXPFA1TtkVu1KOAo1NflfOL/B11wuD?=
 =?us-ascii?Q?HZiRMAwrTdSp4/ZwKNfcDxKVnzVtUfELTe3f5ZSYB4VUZSi/WnFuhY6BwGi/?=
 =?us-ascii?Q?NcpvcCTPZaP1ybfc+vqMHg7IT7Q4PZlx2YYyMTuPVUivQ3KsOpc4WctfimW1?=
 =?us-ascii?Q?gZjig3uWq1KhxWvHRTP/8VE/5soGVjy25+R4NielDSbawJ8rMGmwkYhWrxfm?=
 =?us-ascii?Q?aYQFLvMlme/ggRIE7S22H1I1j10ay3lgKlwbfZ5+4e1kJ6zK+p/R/lgunXsA?=
 =?us-ascii?Q?sfJNyG0VGmbJ66yl7A1EOxrGFzMt8G2009CrQyy0Nwub4hGp/+v4p0kveRfD?=
 =?us-ascii?Q?aVS+f1J526XQSo6y8SYnXpNx1/oyTtOVl78wPvAGdaCrZ53oMG4VEncDrv2c?=
 =?us-ascii?Q?aboiw5IIdcbbz9ucuhFem4/xlbZWUEYotQGVderalyEMdaToM0FZqR4rWGlP?=
 =?us-ascii?Q?Vr5DRG5t94m6h8xjDXyN7o7+b2daQzt+GUTUrixnw6Ds4rtdD3H0aIhsi9pu?=
 =?us-ascii?Q?WLhW/G+ZK1XMDtLZerBX8ljfESRAiBz9M8XOx/L6EftXVExdKQt3c2rKohPr?=
 =?us-ascii?Q?+H77jq17YLlRwP8o12kKrc9aIZEHFH8RcIW6YXkA2fZ6Kg+XYywu13p3MviG?=
 =?us-ascii?Q?SsKIIQexVRv1H3MUX2CE1hBIbm0DoN4Ds6Dyrorl7go2vxj0V3dGWuGu7Fz5?=
 =?us-ascii?Q?wphjqZCIDSMc94hP5B8Yv+rxajFEvrT9po1C7zC8FQyRnDKDZJ0qkfAtAhj8?=
 =?us-ascii?Q?BuB7XwvYptwqdJXJmxETzWP79XXe6YRc05N6xMcKn4DKjxc2z1jiNSVxpaa0?=
 =?us-ascii?Q?QpUgccT6iit3VfLRBdeWWTbIBSCsQItsG2Q2ul1hH3ASiEQnpD+m5TQMDRn5?=
 =?us-ascii?Q?46RSWRtPU/qV5K6IKHz0X7qJibP08/LqjRxX6xKEKvLgp2gz02N+BmfxxMO9?=
 =?us-ascii?Q?7mZZ9f/SwVUMQSPJpT6feTIBppQdaD6xSdAWxJqxg1vqKuCW2kyhQk8Nf9rq?=
 =?us-ascii?Q?ffdMQdsQZQetd+xTIWRv52L/O/9iSU6ywQ4o14Ai9zrrqveNsledybhthDPK?=
 =?us-ascii?Q?OZeX8wtwMQL8/Y562Qfcdyt9SlNdIqYPZpqJICJGJ58HPe3rw/rYPHsxhwyQ?=
 =?us-ascii?Q?re/sme8Y6KoJOvDG7AO7TDu0Wjq4mE0=3D?=
X-Exchange-RoutingPolicyChecked: qtYSI+pENjnhYNHrnfz/SKBPwo2YjwXB0klg7GZEDKBpnHkltomgR3gX5Lp3XHoOKk9A0kfeVxvW2FsfWFdZCvR6uYUVAfraO9PPrtwv5YL+ojOpnYJvoqJx+XXiJWQF8EyoMxOXe0/BYkn7151z5nVSbbprnwA8AxFgkq4jfuaiqlko+fIVajDlP/BLfU8wdAah6JdnUhwb5Z9rAuaVZtdy8UmAPW7nskLH1xOPRYZPkZPYT2aNWl6hOvS89ESvOvcHDpemHW2aH9e4yTWitDCjvJtqIeqGKImVv8qolGOX1Lz6Ewwku5eEg8zq2cZ7hzEeJ9XqWw8TvMbdO8BYSw==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9769873-a57a-489b-c83d-08df0f560967
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:10:34.0774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pw0gy4nxjPdSotgnTI6qnIpSbvpencAcJoa2RtSCGCWtOG1bu9fWX538uVb/MKXcBf56Dkg4uqGHSILZhrqxPpdfpaU3WSSq9ecckwZUgig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1219
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FzjL76KRnn_xW4u9tIbQB33_fBrOOEfreyDw4BzY7Xw_1789056636
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Frank,
thanks for the review.

On Thu, Sep 10, 2026 at 11:04:26AM -0500, Frank Li wrote:
> On Thu, Sep 10, 2026 at 12:16:09PM +0200, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > Add support for the Lino iMX93 SoM, its Verdin adapter and development
> > carrier board.
> >
> > The SoM is available in two variants, with i.MX91 or i.MX93 SoC, using
> > the same PCB (the two chips are pin to pin compatible), to avoid
> > duplication create a common dtsi to share commonalities.
> >
> ...
> > +};
> > +
> > +&gpio1 {
> > +=09gpio-line-names =3D
> > +=09=09"LINO_P18",
> > +=09=09"LINO_P16",
> > +=09=09"PMIC_I2C_SCL",
> > +=09=09"PMIC_I2C_SDA",
> > +=09=09"",
> > +=09=09"",
> > +=09=09"",
> > +=09=09"",
> > +=09=09"",
> > +=09=09"",
> > +=09=09"LINO_P65", /* 10 */
> > +=09=09"LINO_S18",
> > +=09=09"LINO_S24",
> > +=09=09"LINO_S20",
> > +=09=09"LINO_S22",
> > +=09=09"";
>=20
> Can you wrap, 4 pin pre one line to reduce LOC.

I would prefer no.

This way is very easy to jump to the right line and see what's there
(e.g. I can jump 14 lines down with 14j in vim and I see immediately
which gpio is that).

To my personal taste is also more read-able and consistent with the
other Toradex DT files.

Is there any other reason to ask for this change? Any style guideline on
this topic?

Francesco

