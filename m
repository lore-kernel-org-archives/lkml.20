Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011030.outbound.protection.outlook.com [52.101.125.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEB743C7D0;
	Mon, 21 Sep 2026 10:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985237; cv=fail; b=Ud3f4cjZNPgrlDP415CEoj1FZD/3V1JxTelCBqCzAZEr+LW05t4+Iul32svY7kH8tug0TtsWqxaLZFRxzeKk1zsyol8M1otGPJTPg3SrWeqMxOUKuYliZ9oegjmTRRQEEeEgd8GIiOth4l/pAP+x+G4MbtJukZTSLWsknnEDeu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985237; c=relaxed/simple;
	bh=rSh50ahNaOZDNYk/5KM9YmVAoRctT1P4ra4bTrL2k+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nLtRLeniK1fOhmRtbNZjbIfwwh+c/06alBaWVaH8LmWwfA1P3BeqxTPGWCEjK861ngymTSHv8a1FX6vrPr8ejr664y4+DhNc5wXWDOCsKa3192Vc8MMh2rOwwLSENTTGkhANBlfZhmeBfZwR5e3tjEOuyP4DMgvMqkZ3ZW+Gv1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=beFdIZT7; arc=fail smtp.client-ip=52.101.125.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="beFdIZT7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xB4lSlm/LsOqHiy3xyQLg3su3QGSA+vtMI3BpEPE6HtrC6z4qkgGjK6qfYY30xEWXlnA91TIBLs/kCB0wTN2RV9dB5I3nq6rjXJYKctU96fFRmKqiCpHtWdQVUw5pQznv0AoQM8GP1DplB62D4bGYuhSRU9RcCRE954TBhRqi6bWcroO88cPziwEwO2pkGgrpw8FFM2wLosEBt5DY5XA9+BAJC+pZYETTiDsCWpGKYMj16enExHyzGWFq/CQhjgw/7V7eQCWA2DNTN4QhBt3EOcVO8ybFbMGd03Pf0vKKpyfd52CQ0HqIxQsomDOCCtKes3BXKkkDe6VcAcFRnqs4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpsUduWqs1PG2jV41hrM9d9lr+7bHRmXJqPc7LWPlC0=;
 b=AoN5mRDdZfU/lg43NHu7E6b4YCi6Ubn3EREWwdmR0cRJQGbV9S1GXlkjLHQ8R8ErMEv9SuhhNdmzc8KFH3tAJoqECogpafJyF/cNqVgyRHuRfFJWCLi/vtbN+BgDolPJiYXxUB3myD56kCwdIxn3FMeB8mCDeC64KJdcX3BiA/jUWTQSoJLGK3budQA6V6kSLMjUpEP/xvdGq101W5wSfnbhm3W7dVwxYIbWi3SUZoSVLFTE/O10/iMPI/BZD3vn7MJCBwDsH66rEOV7WRyDVGD2zBGabHWNxKLSbJGVDLfpU1btuYmHls24cPSdfQhhlM7sRAr+eeXDB9kX/tc4vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpsUduWqs1PG2jV41hrM9d9lr+7bHRmXJqPc7LWPlC0=;
 b=beFdIZT7rsn6nyOGEwYbEYtCgkX+k3vveJhoGERqq4BK4OLDTJDGyBvoyhiKhLjZKTtP/edLk2K0Nh10nvc/bKiPICsTqNY6DPU6OGERNzzwnpv6uvnlFfsDB94ntvd0DZs4zTpChWOtHaUqJf6ArUfZ3jnqz2i1iMNHVHxoAiA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS9PR01MB16122.jpnprd01.prod.outlook.com (2603:1096:604:3d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:07:12 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:07:11 +0000
Date: Mon, 21 Sep 2026 12:06:55 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 USB2.0 support
Message-ID: <arEBv5HpjCgx9u4e@tom-desktop>
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
 <34a6d23e309aab5fbf369132d75794222097396d.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdUYC2m3YgayTrCvZHoTVkj4v+7a5cvO1g=UFxR+6dJiJw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUYC2m3YgayTrCvZHoTVkj4v+7a5cvO1g=UFxR+6dJiJw@mail.gmail.com>
X-ClientProxiedBy: FR5P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::18) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OS9PR01MB16122:EE_
X-MS-Office365-Filtering-Correlation-Id: 08fbb447-5ba8-413d-144a-08df17c81a9c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|23010399003|1800799024|366016|38350700014|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	8sR+Jn6MdODNymn8YgepPpri/o8DoQ2nSqwt0hnyaH0TMj0kUs8IFnJ/YQYDlKINmNfPVQL0pTaRIBm255LatQLrhk9EJE1KcPCzB+ubjm+8PJO6t4nDRkkA66uB3UYVRlz93yJrcXe+BwCWezAAIlI/P+Xzdh+ggCk3S31xR1NyUQIVbmOUtMHbpM2W81k+Vqpin/fhvRKR3gP9KMQueqRMY+SKeeYMqaMy7tR40oUCb5yUXScJxkM3mlEm2FipIxXdhfIQEa3FLoNSMf0uCR9Cu6+fr+e6jT70TsW778knN56mmCdCbEXjFWyVFemvAI1yDE3AOIKFh3KZrlUxEXP90qjyKf49pJnRJM8KzrVKDAVlA4/RLEvhYP9brHhrJVcsi1urEmV/IX+dkSYu9zWqx9/4tGqmlmSSaYm82U/vZ5LQmHDftFvwDFE+G1wu/LA8l6mhm33zpc+J95UTWf0NRwwXnPUpjTeyj+u0sVAXYja1MWS2Rm3+T1QcMyUUsTEjM5Pw+/ny6IJNyzv7ncjfolQMEIljmavAwLErVlP18odawVjIHnqwbN5p4Tp92KNA/QvtPoXz83h8j9tc2iBbpTu9Oke+4UI2QpLI13vFrOjJxz/UAwID42hxmdhsg9S+m/2eKcLOACpOMVBRR4u7HNanNMo0BQS8kgAhIGkZVbkqxjT19sObHzcF8r5srVJdFM9Ltl84VbKzO9bFD+Gol7tgtCdGkjHXfsN/uhM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wC5jhyfnXf+vyJ8JW579VH5tzSQ97MLB4trM22ExiEgzud4Gr+oBdzZQfCNY?=
 =?us-ascii?Q?q++vOyKvJoBFPFUp6iICR8gt15EtEyG/qIjNVZnP8vEMVjkqfGGHl5HUEVVJ?=
 =?us-ascii?Q?hYm0rm81LmhRSMQt2co2bWhQYAaf99TQp1U2mOkq06UVi3AyiDDGSD0euZDl?=
 =?us-ascii?Q?RyqcNv6NJgW2UdW86Y08IHu48pmKFZynGw1BGz3g7As6sskLi88zfKch5h+r?=
 =?us-ascii?Q?WG3rlLKOB5VTi4xy3dlJa4RbS45T89ih8iiBT9b43XzFUKh4jb7vZZyEUVgi?=
 =?us-ascii?Q?sjs6w5s6WyBEbmBrFtTbOaQggwaW7kXEoGWoe+HWUyOngGOS2T6EyT+ggheL?=
 =?us-ascii?Q?nbwuEVKqlr/RE4SJga5nGNxSkgij4ooVrznKIg6bzv0nwB3OeMA8v7kTRcYf?=
 =?us-ascii?Q?C3RHkW6mQp5vQ4jqxSqoVGuOJTKBS6P9nlyazv/K24RHIW5iLziqC0+LtKne?=
 =?us-ascii?Q?dDO3rtjQG7KLIs+An3tSIf3LIZwhWhCsCIHktZ3bwnb9Yjtt6I9uUWtpQgW8?=
 =?us-ascii?Q?q1EW+ucKrV3K8flles100+OB8bSj4je8bIKT5aOGwQI3ESz81+WP3r8+x0ME?=
 =?us-ascii?Q?81fwFPaClBfTw5ISq9O0TRevUg8MJ7XlTAWjCUYuCso9czZCW+6t/3q3TBBn?=
 =?us-ascii?Q?cPwse05LUwc0BTkQLHUw8L8HnaGSQvkX1mN5qNYiPOO0y2fDSpUdTYm5Zpy9?=
 =?us-ascii?Q?p+qX67x2/MdC/r2sSigf9l4UoDzjtmXBI5hZZaTSA42EcI60wFu/cNlyKKqh?=
 =?us-ascii?Q?OaCEmATwh8r+BTJuYnJ7wWIyrzIWMJS75sdk4Xvd9GLtTRflUO1tVXnPWQlH?=
 =?us-ascii?Q?dugWqAvXQWrOC+xBhEERr8RtwyOiTwFBs9V+OKv1iPO3Epwyfo7KLIzN/wYE?=
 =?us-ascii?Q?6V6CU4lKE9Sjge/zMQhmb8zy7Px8azdHuFlL+V6Bs4fZFulLgYrpCtXgN08B?=
 =?us-ascii?Q?h9Ki/+yaOiZPs58+/0CF1unmphuwxViuOMMOHnJ2ku2PPidfkblvo49toai7?=
 =?us-ascii?Q?Ui08MBqC5ohSWCkcSRgNjo9jBBsPC09jpNO5qHwStLDdr5ntl6F+pkbysMHl?=
 =?us-ascii?Q?gh3mns9BIXBT5lu23qSNBqEy/b9KW2MTQpzsQddJCbM3Vp5bZbTXowncBUVn?=
 =?us-ascii?Q?uakxA6sm5ltam9qtyvWrCueDATV6GObSM5JFKQrM82LnLaPzpslQW2b1mTJK?=
 =?us-ascii?Q?U34ABjgdyiW62TXMjbzJvK63k/FOxgFZQonmpDe4whKV2iqFd+o7tWS24gfy?=
 =?us-ascii?Q?OjFGBq2hKxYgtlUXLg5wYQN/M14bnwa/Ny3BD2q6K2lg3zQ+bmJgLwGZkvCv?=
 =?us-ascii?Q?zvlrwYkPnYF5eCBduKKiak7NOYrV2FS2xjhw/NDp0zr/pFnDswKiO7vP5T6V?=
 =?us-ascii?Q?ZNKGZIUe4jbM/hF0EKUWNwQb5ofX5s3KiOsDGrHzcz+ChcnNB1aep0ddYabJ?=
 =?us-ascii?Q?bPFcfMJy1PT9h5DFxv5W8dJF/wsxadFOmqDFZ/dkIjwiLeMxE0IqamZ3JT2F?=
 =?us-ascii?Q?zjSZYXZQkaQBAmWLdh4FKJ0KSYprg+76VHkro77t+M052VWN3xEu1WdNEfRu?=
 =?us-ascii?Q?8TyXIg80Jxq9HiG8h0r39+iPhxbCgz0MxeD/dq4c9J4OOmb/ornyH1Xz1SM9?=
 =?us-ascii?Q?kthXW9D/34tD9O2uVaB2jkAOSxk7rafnI7PWXgGhaswh1Dx6MWiDXFulkFY5?=
 =?us-ascii?Q?6jrvgcyR4I9qRoKgoR3VMvmENMEeXTD8k9iI4Tu3tXGtJn+3emODKUkYeT+O?=
 =?us-ascii?Q?8L3nsLuaTldmcnT8fEZPisbWds7t/G3nlPPLFKe+ESRABY2leFfz?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fbb447-5ba8-413d-144a-08df17c81a9c
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:07:11.8784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQgIKd8hBicbIFNdC7wPo6qj54HAGmm9K+WewL5Hp4y959mHmbchhM80zJSHJSKo44QWyb7QghIdhtHKaHyqUwGvxE7Iy7pIGxn5DH1u1aXOEuVehOrW1mojEE+Ekwge
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16122

Hi Geert,
Thanks for your review.

On Mon, Sep 14, 2026 at 07:42:34PM +0200, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Wed, 9 Sept 2026 at 10:55, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > Enable USB2.0 support on the RZ/G3E EVK board. The USB1B_1A_HOST and
> > USB5_4_HOST connectors support host operation only, while USB0_OTG
> > supports both host and peripheral operation.
> >
> > renesas-smarc2.dtsi is shared by all boards based on the RZ SMARC
> > Carrier II Board. USB2.0 is not yet supported on the RZ/G3L SMARC
> > EVK, so disable the common USB2.0 nodes in its board DTS until proper
> > support is added.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> > @@ -298,6 +298,28 @@ sd1-data {
> >                 };
> >         };
> >
> > +       usb20_pins: usb20 {
> > +               ovc {
> > +                       pinmux = <RZG3E_PORT_PINMUX(0, 0, 12)>; /* USB20_OVRCURN */
> > +                       bias-pull-up;
> > +               };
> > +
> > +               vbus {
> > +                       pinmux = <RZG3E_PORT_PINMUX(0, 1, 12)>; /* USB20_VBUSEN */
> > +               };
> > +       };
> > +
> > +       usb21_pins: usb21 {
> > +               ovc {
> > +                       pinmux = <RZG3E_PORT_PINMUX(G, 6, 12)>; /* USB21_OVRCURN */
> > +                       bias-pull-up;
> > +               };
> > +
> > +               vbus {
> > +                       pinmux = <RZG3E_PORT_PINMUX(K, 3, 12)>; /* USB21_VBUSEN */
> > +               };
> 
> While these two signals are wired to the SLG46108, which generates
> USB1_EN_OC# from that, the latter does not seem to be wired on the
> carrier board (SMARC_MODULE_CN P67)?

You are correct, USB1_EN_OC# -> P67 is not wired on the carrier board.
I will drop usb21_pins in v4.

Kind regards,
Tommaso


> 
> > +       };
> > +
> >         usb3_pins: usb3 {
> >                 pinmux = <RZG3E_PORT_PINMUX(4, 1, 12)>, /* USB30_VBUSEN */
> >                          <RZG3E_PORT_PINMUX(4, 0, 12)>; /* USB30_OVRCURN */
> 
> The rest LGTM.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
