Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0602A4718C3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.104.111.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396629; cv=none; b=lW1Ho9/5GRT7nz832ZjBFgdOrmrVe/IjrzTjwqpWNgpLhYj9l4cTXIpfNVgbj5w7x1NHU9RKpsnxLUSGnEugh7WfvGVh7Kmo9WyrfWSEVEjDmPjFCD7c4iH3Cn2P7psGaF+KzpT4om0Lf5ML9Yun+8+e5RAf/o5dtqjQOdj/qo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396629; c=relaxed/simple;
	bh=4uRK5Lq+EPVvuB1cLyBjXD9wXcITAzHU5+d9DqL2uVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type:Content-Disposition; b=CTEOSwHIrRhVad6CYEe/KNkHkYoQuK159JP4uTLDI5GkUk1Wy8EPHMpKXYivIAsxROP2gPirkDkjGFNLaiW7mgis87eYKgqgO+15YoSRbeCUkLgXMVpT/zU2+mBLez+YPuryQIqwbyBhkgRlGyvS5sjtobAerdmV/F4lwVKV98I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com; spf=pass smtp.mailfrom=toradex.com; dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b=iFdqE0tT; arc=none smtp.client-ip=194.104.111.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toradex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b="iFdqE0tT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1789396619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nI3KU9H1AmB1FC4F289abHLDQgT7ZL1jt41gV/GmMtc=;
	b=iFdqE0tTqwb4Pb21+EAzL8LlOLPDKVCW5tJv31btnTbzZWj+NkYXIJEr5IMVLK/mzZq4We
	tFLcvvL7GfqOl614JEl2tZzUMdiChhwrYkO9JJFEFF7c73Wf0lgZEejhcPzQbhGm8DIfpA
	nirEWWWFGX+gbe8+IMUbNf0bOklcl9Y=
Received: from GVAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandwestazon11020099.outbound.protection.outlook.com
 [52.101.188.99]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-28-6BcyctkIOF6njXy72gEBAQ-1; Mon, 14 Sep 2026 16:36:56 +0200
X-MC-Unique: 6BcyctkIOF6njXy72gEBAQ-1
X-Mimecast-MFC-AGG-ID: 6BcyctkIOF6njXy72gEBAQ_1789396615
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR0P278MB1182.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:80::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.12; Mon, 14 Sep 2026 14:36:53 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 14:36:53 +0000
Date: Mon, 14 Sep 2026 16:36:51 +0200
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
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <aqgGgxzqiIbF66DX@francesco-nb>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <aqQQjCW1xaGfPdss@SMW015318>
 <20260914054214.GA19835@francesco-nb>
 <aqgEfRl9INLZ-DWM@SMW015318>
In-Reply-To: <aqgEfRl9INLZ-DWM@SMW015318>
X-ClientProxiedBy: ZR2P278CA0017.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::11) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZRAP278MB0495:EE_|ZR0P278MB1182:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f9a125-2b8c-4cba-a6f7-08df126d9e85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|10067099003|4143699003|22082099003|18002099003|56012099006
X-Microsoft-Antispam-Message-Info: UPgEt6b8RsRb8crgnD8i+GznZJCL7qR6s/sgpcU6VYQeaxS1sD4OZSFcm08CNlXxqKTxS5fJ0b+Q0NPvYIvXuV0Fyuoo8zwtiJ+672yt5FPWrM8m3dKKHgfCKJfXXTYoOz6s0MX6UANSr0rw1lcN5ZOb8zBaQWFnbH0vwKJS3v5iW7Slz3yptfH6wZzByBzDODOudgoBvViMor/54UcUmHAMJxAGK6sZlGd6RcpW/B0U54i5Sktaxid0Ph1OTpqC1hY6O65QP/G+NoxoKE7UdqAFj/z5vZ/amjrUZqwOHRFF4t7hIkuBA1a9mUEAaV6qKOGUNngNkQHF0gbNzhHsupgq+CftigbmCrgjPK9ikU9nHlSsUfOu6gK29UaX32VS6usLK3ejlfFZItlNg7AtrEFnauau1BP/761DUoitSeFSSrxrpWlo8Ho3AmA3yJ0WmnI1cIWzevWyruRQiVRilKXtHb9DGhqRZqOAIWhdamN/wkylmprV+Qgh8SBvAafWUknQFvE87ysh3M4/aowTf/u+IxH8x4CmDMISv4EKNSKN3RU92wZGqh3O7jr8nj6D5llAwuSE631VnXzJYYs4uxRNr12k1HhJYh0nFlcel5Xhvlwzm22TrImaOAPq/y/I
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?li9yyx45HFMxC1+YAn/H/PqvtWSlVeGV16ExVziWFUzZaaPiN8tJWfgQ5/G1?=
 =?us-ascii?Q?J4KASXGtnFjybHyFV7tdpFZMj621ldA6kLw9xJOhT84YsmunDA7vnqjXJ3h2?=
 =?us-ascii?Q?0juIVPq0Ga6jAAIaoSN55CYLHNm6aWso5dvhMtJQVn/x/L249dY/tEuc84jl?=
 =?us-ascii?Q?/X5CcXrNWbpvBDcSnalAeNEcV+/CbBlnPXv4vO3vpqRJDE8QoEtjFNpFy1Yo?=
 =?us-ascii?Q?z3r4+eDefakfnh9hl20++DzshpEYJz3qQ+tB3QZtSIc6S8VtNiJ17KBGXeZr?=
 =?us-ascii?Q?6ARoVD4mJyw7Xah4xCD1sqzA3R/z4mHk7JW6UgKqFDPeR3rgoDqalQN+BUjZ?=
 =?us-ascii?Q?f4shPQdhqa4Qah+WLLbeEUzESaFXQDmEF0wvemjH3J6o8268/gBHRXYwGY4T?=
 =?us-ascii?Q?kRQsjAu1r5K99nJdgMRqjYctcCbU++orPZyKSZ0YIL6orCUbEskv3UjuLi4I?=
 =?us-ascii?Q?7Tt/2s3GJQN4+whJDYwinHBqclRu0BzjBscR0GbmKaAa6Md92zHUkoQa6Mf/?=
 =?us-ascii?Q?S3TMnevJJFqQFyZ8S7WrCg2jXNSc2TB/fFRfrOJXA//4aZxpu2OdPAAYffoG?=
 =?us-ascii?Q?YVcwjzMEBNPgNzCoKb24ziYJTvlnqCDdaR2sJk1EqO4oQrQ3EYBV3G0wqFRo?=
 =?us-ascii?Q?hoASB72yW0JlfWOB/SDo69LW0XzSkTQD41vo0TwFCTgj2oNER6V3sppI2Hgl?=
 =?us-ascii?Q?SIGm4DY3sq5TNbMbEFVbDLuAvV+LTWEN4Py1pEeiZcBnU3aLPQoh9yD7vRDF?=
 =?us-ascii?Q?UAs2nCINm/Ip3TArRocKHX2B9yF8LQS1FXdEc2apf9oUJRbhR7j9CPW5ozoL?=
 =?us-ascii?Q?4eLt0s13DHUK4x5ZdmPUyYNdsur9+NKDBXZnZ4bH7rCGPEFnvcfKznJJy9qC?=
 =?us-ascii?Q?Okqdw3h1e5A4uVekCcPQPtoixPyB4YNdLdrErcAA+ykgjf4ixrQ8xd0mP5UZ?=
 =?us-ascii?Q?B1lc3AH9UbgUdLFAgUjkjys47VVPc4QR14MNd7TAb4a6+z3mDVhZCc9cCsTI?=
 =?us-ascii?Q?Y5Cqpdcj4g74Mb9ogTJTzZkJkF4z9kazlclnjtGNMVrtMmezskWvIkX9WPgf?=
 =?us-ascii?Q?6hxvajXoZvwZ/TDLi9uoq+DCTysXdEYQ3+VEaoptaRXpX1Gwfq+c2Gc6nWOi?=
 =?us-ascii?Q?7IYWSb20vYRxT69ofRVoBXYKVSHplDHziXCQ2F5ZdNAzgX8gWBGP1O6wIRkf?=
 =?us-ascii?Q?J5iYKPLSleC7CQx4Y2Y/fUFfZ8o2A4KuBJ5c9ULN4gFk3Fn8LNPNvMfupdSW?=
 =?us-ascii?Q?FzLUYQRASjC3kbTVT3ESL8yL070YE5eTiG01z81mFztTot7/2w2vYQknLm5t?=
 =?us-ascii?Q?m4MDWo5GdXg4MBBQXPZ4qm6WffcFIXKsp0qjgmbyJpsyVzW2mG++9fnT0BWf?=
 =?us-ascii?Q?UQjwWjyePbJkCidSQcv7yqewtk5s2lE0nCF+vFNbPPZX6uLfn5TOyWvTxS+O?=
 =?us-ascii?Q?2MxoGH8rLNypyQ5WjqimqTqNX8BCcmznvzmviN0VFGAwhiWY23Gzl0/DtNbr?=
 =?us-ascii?Q?ufV6wtJuxZwltQrbMk+Xix1NjGH4a8ZZtM3kn1I54IEQZr8XfpprC1ne7OUB?=
 =?us-ascii?Q?ugFvQcECDpp3VV31BJ0lJSJ4wYihW2PNrSCLnASOY9kifS9DQguSvjCpBQCY?=
 =?us-ascii?Q?fI6nSppzFqFEgcbbjuscfEl8oeP8TjcapOMa3QfiwEHi9Bl6aaWGcx3xcsUN?=
 =?us-ascii?Q?AyBHbk6RjvpFcNich7b3obWrKGziKp1IpLLFh6MrLS8GyM1DsxFzEuvLYn+p?=
 =?us-ascii?Q?PHtSL9tzzfsoR1W8clHzgIprNOfrmlo=3D?=
X-Exchange-RoutingPolicyChecked: zH0eWbj6kT4mp4GJ1m1xSK/TAz3wk2U1mUims/SfxNeZmqOtaHjyc6qWJ9PJ5VyDYrBzZtxY5uAna0VErAvI//kyPIPiWMb+qcLf1iNFWNYE9/gfuT9eSJPCRR1HP7qvR+VYoyj/POqjUQmTdwdkPY4vKqFskPmJ3ZhgRUmDUVCFMykkxvVBQwcCMKNtKDL4btc8XTCwC1GdXQme0+LnOmMK07kq7STCt6NnfrjpYH6Mumqpsb4Y4azjDp54YWGaSTzrqb6W3yYvuTJQT3Q6Rac+SswnnvrCDPEbenpr3uEjmZhIf7M9rNQdbKhf1WaIwbYgqz6G/kohi5MDNyxYVw==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f9a125-2b8c-4cba-a6f7-08df126d9e85
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:36:53.2230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBQShAbpHmHKkHxA/K1OaG5k1UqDjzqRMJqhSk1Ow6TqKxKK57TURT/h7Mos/ic7I3KyRYyaVSAM74Nir84/a130kuFGYcmdEscAIQLbMYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1182
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R4QiYZPksJ_iMoKhVWhczKjf-ox3AFnYT15N3Rh0p-M_1789396615
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 09:28:13AM -0500, Frank Li wrote:
> On Mon, Sep 14, 2026 at 07:42:14AM +0200, Francesco Dolcini wrote:
> > Hello Frank,
> >
> > On Fri, Sep 11, 2026 at 09:30:36AM -0500, Frank Li wrote:
> > > On Fri, Sep 11, 2026 at 11:19:46AM +0200, Francesco Dolcini wrote:
> > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > >
> > > > Add support for the Lino iMX93 SoM, its Verdin adapter and developm=
ent
> > > > carrier board.
> > > >
> > > > The SoM is available in two variants, with i.MX91 or i.MX93 SoC, us=
ing
> > > > the same PCB (the two chips are pin to pin compatible), to avoid
> > > > duplication create a common dtsi to share commonalities.
> > > >
> > > > Link: https://www.toradex.com/computer-on-modules/lino-arm-family/n=
xp-imx93
> > > > Link: https://www.toradex.com/accessories/lino-verdin-adapter
> > > > Link: https://www.toradex.com/products/carrier-board/verdin-develop=
ment-board-kit
> > > > Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > > > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > > > Co-developed-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > Co-developed-by: Franz Schnyder <franz.schnyder@toradex.com>
> > > > Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> > > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > ...
> >
> > > > +&gpio1 {
> > > > +=09gpio-line-names =3D
> > > > +=09=09"LINO_P18",
> > > > +=09=09"LINO_P16",
> > > > +=09=09"PMIC_I2C_SCL",
> > > > +=09=09"PMIC_I2C_SDA",
> > > > +=09=09"",
> > > > +=09=09"",
> > > > +=09=09"",
> > > > +=09=09"",
> > > > +=09=09"",
> > > > +=09=09"",
> > > > +=09=09"LINO_P65", /* 10 */
> > > > +=09=09"LINO_S18",
> > > > +=09=09"LINO_S24",
> > > > +=09=09"LINO_S20",
> > > > +=09=09"LINO_S22",
> > > > +=09=09"";
> > >
> > > Can you wrap to 4 names pre line
> > >
> > > =09gpio-line-names =3D "LINO_P18", "LINO_P16", "PMIC_I2C_SCL", "PMIC_=
I2C_SDA",
> > > =09=09=09  "", "", "", "",
> > >
> > > Reduce LOC, and easy to locate number, such gpio 13,  second of 3rd l=
ine
> >
> > I already replied on the v1 that I disagree on your request.
>=20
> Your v2 sent too quick before I read v1.
>=20
> > To me it is
> > just more readable the way it is now and I do not see minimizing the
> > lines of code something that is bringing any kind of benefit on its own=
.
>=20
> The major concern is that it makes code read harder and lost focus by lon=
g
> lines.

Understood, we do disagree on this.

> > Is this blocking this from being picked up?
> > Is there any other concern on this series?

Can you answer these two questions?

Thanks,
Francesco

