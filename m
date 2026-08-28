Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010034.outbound.protection.outlook.com [52.101.228.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5F63D47BF;
	Fri, 28 Aug 2026 07:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787903327; cv=fail; b=i0kLMd6f5SFspB/2tWJQCVDxMSojtB+HJsZjIV1JFcpvcMSLf4eqBfCza0JV8i1Lgl42FPOd6u1NRsIn2HiUxDFmp95uKJKIvD8u6NMWRrxvpWxrhZ21QwQ+amJNPnXq2IAnNgaPZ6ulsGDtXKhfZDDpTNosOvy/kQfkrgq/KJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787903327; c=relaxed/simple;
	bh=doz8HEk5fuXECtmHYzGy5A+eYarwg/+BcGBQ3EPtGhI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lM+Fm6BrJW/Brr9M1Z5/CIOcXHbBINOe+kGHDSY2YTIuzjfBusFQui6kTpakM189BqUgvjidqBrSjW21OPHBI0toPRaBLR0p83x2p75IO6nRRJ7+XMoDWsrHExNgEkJD7Mv9aSYzNsiOfx5r963hQvhKrbosbrkZLwROoM1UXsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EaRmP3Co; arc=fail smtp.client-ip=52.101.228.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EaRmP3Co"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvzuJ/zG5KE+WkvFU1e+U5o9KV2g34R4Dqi0Uc5nafM3LzQ6UjcxpBfupQmtPt8+MCazXAUnnX+U3cTqngX13Nkinw+in9cBacDITkXsJ/pYur7STPaxqBfJno7lhDUcHbqqZsEaYb+/UzAPSaehjA+Q9uNDPDPTuk1HzdT1B4SzhtnchwmEE547v0q76CGqaZkaRiFDEwaOfxqsTrYzB3cKd+p0VysZst2RIfm38BP8qh1EMzKqz97+zU4Zud2Kuk70DpoDH8g0JLYwOCPnkSlLPJ3p2MbfxeEaGOtBa8AemBWl8SsgHRHnHvHwSHGYeKk3XDckoDp4TRrfp3crQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ec7ilsN44eAnxuCQczpT8dx1TUe7klyJE2oOiG6JDM0=;
 b=NQfeAH0KNA5qce4R3Odr1NMdV1qX/LZDMlYxRgCx5qG8oZ89QQ2PJ4JciKc03zTQMVZt937/4OFlAdBTGQLGzUkpdT0QfDEcnyjH/Y2VMGt6NKFhoQroCiAWbL3NycT/1yDIV/IBDgqTQJ/L/HIbNLHrbuzUx4Nse5Gv7ZuPOm4Fz3RBtj1x9UOGjLFtvqiIx746eBZdUlot19nQFoLPMMkxmxLsHCj26Isuh5G0SAH1crcUt4wXG19C+xwPymxPWlLuN8+ZN16wXEI8Q2p7SNegfBXnkb/+IlZlutnaUSOlc2ZXC6RU0wMBjC1Z19fJ3u/uxK+xa9O2icJ/nyaB8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ec7ilsN44eAnxuCQczpT8dx1TUe7klyJE2oOiG6JDM0=;
 b=EaRmP3CovtBFCAtAuDBvXwzz+BtZV3E0RycYLU8Q0qortTXmvPuL/8WRBoIAqdDQTtQ8edYAzupkraJ4mq/Pw0fJ5ce1BjSiu/yIyotFUwr1LvlYaKK6QumwYoig4c7qIOc4P7ib1GR5h1oJUZSK/6YHMwMJMKqVtK/PA1ZRNx8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB14709.jpnprd01.prod.outlook.com (2603:1096:604:3ac::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 07:48:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 07:48:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, "biju.das.au"
	<biju.das.au@gmail.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Geert Uytterhoeven
	<geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 04/13] drm: renesas: rzg2l_mipi_dsi: Add support for
 DSI PWRRDY
Thread-Topic: [PATCH v3 04/13] drm: renesas: rzg2l_mipi_dsi: Add support for
 DSI PWRRDY
Thread-Index: AQHdNYMxU++Z1/Efwk+6RwU4cuEFzbaxsqaAgAFbtaA=
Date: Fri, 28 Aug 2026 07:48:34 +0000
Message-ID:
 <TY3PR01MB1134608D802CE4D2DAFA1C37986AC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-5-biju.das.jz@bp.renesas.com>
 <apARXewkGWRwEpf2@tom-desktop>
In-Reply-To: <apARXewkGWRwEpf2@tom-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB14709:EE_
x-ms-office365-filtering-correlation-id: c682a659-586c-4905-2a43-08df04d8c33d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|10067099003|18002099003|22082099003|4143699003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 AE8/IwiqIXVuQu+sXI3iVMIxiBfZtVoFB88IfY2G950FqirX66yeJCDPUEac/Jq8HBaRZNAVRGRdw9JgtDdze2z6rZxrb176ZdwfYVSx2ukSw8tgtKdSlDfmFKzSa9YqsL5brsYDqGnw2oPHUZ1Ux4cZW3cjDikTbRn0v+lb6kVYoag83pcpF9Zk+9ePwsF5C2T0EiAwFhdzxgiESFt/u13LxB4zdpFOKc5hYpA1I1bwgSgXlJ8CyaJ07wiGDn2P+NkRo6ij4rHLFg6DMMvHuPiVpVva0BPvH9x/nLbLBHQj6S8U591kGkf0eatqU6nvZ6tbl6b+PRxHEo6W+gdvYGf2oWCGEQpx2aXbfH8SxrZ9r6Uv6iNZo8B3HpedhG7OgtD5WnwYJ7wJKkWVohZhw23Sl/1N+tBPs0I4VjEFrarvvepYdOQVj+hazfrliF8+sxP1lAH3lPkF1ILQkt/yRQ6Q9rRMO3N7JSA6QyDjGXcPYcXl8TDnFjvm5jLpHh/DJ6D0JqrfeyF2Mt5h8Kt3Vh2YNfMM/qAyNgvFIjtMmY5ZZ9t0GG2qZ8WbEzac3UCJD7FHO6NH1BXmcW5HQuGh5yImVzWsID5sQJ1fLLXk7XaIV9z1/SJWXx9VzlHvbq/Ik5XrhBbMPh01ZmXABQyz3IHTpZBzO+R/TdVDDT3bB17UXSBUv5AL1Xd6x7VVkftC0H5g37jW0el/0MxBCRqI6w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BqHndiy7zGj70GGjrd/PybYTGYwlaHCk24CEldqRjEhPVGMKVQVN0vJ+zEzb?=
 =?us-ascii?Q?uN4nEgtwlQiTmYVSfYNorNkvGcZKIn4KEBMFcetaP7mFcc32EZIvZSZPwPup?=
 =?us-ascii?Q?r080DiUYkf30OkVV3npT6I63nRCccUZM/+t1ntUUDvG8Ad0Q38xkzJT9N4J6?=
 =?us-ascii?Q?9Cmi4RCWIq4SpvPLbAJYrHcDpIAQBhy9IS7FerGeWJl8fVyLIYLv36yHf0aQ?=
 =?us-ascii?Q?mVGXViUl1QLyqspHiNrZsl1WDFQGUXws5ns/UwyxQmtaGjNMjYpfIKEt0zQF?=
 =?us-ascii?Q?uCjqxiBtk3It8djbM2rqx4orNaivSxipyresVBi0N2hIn8fXUt4Mngt90RYY?=
 =?us-ascii?Q?CiCqLTzn3cGXJoxb0JU7aobr9307rO29p7bAl7iZ/U0pU2rWKPByW45fazhT?=
 =?us-ascii?Q?KHp8maRMy4wP4jBqy7I8JEwwPQKMJwj8TexV7N8k29pPGDVMd9TL4lkhraBP?=
 =?us-ascii?Q?s/gCy6ssUB+yHJn5qWlZDtyN109gs4F2OQGrkXwAI6P5sKiwFYKojmqXKFeF?=
 =?us-ascii?Q?llr98DrDvjSgxAnst6TUyzRTVJKeY8UakHh8BwNbtm48Hr0PCpiY85mJr4fw?=
 =?us-ascii?Q?0og/ZEGbN6/mwvCFnoJWB99TbDplfjZUPALFsB8LwHX9YRgKcGHGH3XVKiLh?=
 =?us-ascii?Q?qM6PpAuAW6C4GDMqMMREGceyS1k5/mQc1GRMSrVS2zei6fyPlPzSD0/6p/el?=
 =?us-ascii?Q?2K3PXpR+Qm8yelVytkCoAZs54h79VHqQX/D842tEN4P1JINdJMrM0cHsDH0/?=
 =?us-ascii?Q?QblZ1oCybhbjD+tt8Lx+TSsXUfJl8ZNJPtVZFIUDN6gx6fTBhZ4pzcLHESEe?=
 =?us-ascii?Q?wqVeht5sw8x3oabxyTvJEN+t6yUVnYjRtvUzEsikbZzC02JyWR5m8mABVjyu?=
 =?us-ascii?Q?Kpa9KV5/9jobpxktHGkryYm0ALK1hVC8FlS5Gg8CpEUfV4yS36t1FuLhb2Ml?=
 =?us-ascii?Q?K9SxFTO+rqD+l7KgEGI+FZ5pwtkpWjuTkiFkav6Q/Gl/KBlX3CHyhf4+9Wqy?=
 =?us-ascii?Q?fvdUwRJYRp25Gcj+ZUrZGCWSviMw7TaUhOMSaDG2+4z0oIi65PcPGe8qfDtx?=
 =?us-ascii?Q?4gmLmJSeImDqKKVaDUyDRUjz9LokueDIgbJ60BxbXspfqT/X9Y4P+7GA9Wr2?=
 =?us-ascii?Q?Sn7NTh99Qj/iR4m8PX4wANibqZXmGgS9DcS7Se6RLeyGzi63SodTZSALlY4M?=
 =?us-ascii?Q?DLTkcQpmhxXQdFKzqiGUbbq+Higkr4IEjTH3Y8bEhkW/Ol1NCRW+6odJcEDV?=
 =?us-ascii?Q?yevjpp8M2LW9cVujW9wOQTWZ+OCIBn9HvnN2VpbQnwWm5+R4h/XpXaEMBf6g?=
 =?us-ascii?Q?K1vaRMaqMh7BF8f70pPW+ydUaPTOq3F44kfOtBjHyyTYsfyh6/7DEjQV2EkT?=
 =?us-ascii?Q?T7PKi5+/ADY9tk3yayf+vtyRqIPmssujIequTbGiofs0y14XF9sN0H4+reye?=
 =?us-ascii?Q?YT+cVrTdJsG9rJQvwcKUOTR7+HvqIFSDaWQevi5+V3v/w5nUemGpMfOXrJU7?=
 =?us-ascii?Q?fNIVDjp03Cxxe/22BuB6gw5b/691TLo1jx5VQw4kqNfHBaoDgtAMphqITbQ9?=
 =?us-ascii?Q?yfOBeFRXYR+S0qNtZbhhWSB+2HGPHYBuTe4Czq7lAx4zEykfh/L/CSsXwwda?=
 =?us-ascii?Q?U52rni7d3x829xV/XKHkAV3BVbr/BFWvr4J7Z1DbpAnuCNhg3JWkdu2B+zt6?=
 =?us-ascii?Q?/KWh7IYDFbPwhrS0aelJCyd5XO0dXliBe3Akf9orf9Nn1txGdDDjTTJQUa+7?=
 =?us-ascii?Q?awCSKl3jnw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c682a659-586c-4905-2a43-08df04d8c33d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 07:48:34.1767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7SG7BSHLf2ov95OzOQyMLaBwZiGqdw/zDXmN18kRgF5Zx1J3I21ryRtbzt8ndtNNujFFZ/LTwKZw4n8BZjryJFAFtGxEh8lMQyF9hwPeM7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14709

Hi Tommaso,

Thanks for the feedback.

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 27 August 2026 11:29
> Subject: Re: [PATCH v3 04/13] drm: renesas: rzg2l_mipi_dsi: Add support f=
or DSI PWRRDY
>=20
> Hi Biju,
> Thanks for your patch.
>=20
> On Wed, Aug 26, 2026 at 06:48:38PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > The register for controlling power to the DSI region is in the SYSC
> > (System Controller) block. Add support for controlling the DSI PWRRDY
> > signal so the driver can efficiently manage power to the DSI region.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2->v3:
> >  * Updated powerseq API names.
> > v1->v2:
> >  * Switched to power sequence for handling pwrrdy signal.
> >  * Dropped header file regmap.h and mfd/syscon.h
> >  * Added header file pwrseq/consumer.h
> > ---
> >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 38 +++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > index d67e1230b70c..7df5f4a4161b 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/of_graph.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/pwrseq/consumer.h>
> >  #include <linux/reset.h>
> >  #include <linux/slab.h>
> >  #include <linux/units.h>
> > @@ -63,6 +64,7 @@ struct rzg2l_mipi_dsi_hw_info {
> >  	unsigned long max_dclk;
> >  	u16 activation_dly;
> >  	u8 features;
> > +	bool pwrrdy;
> >  };
> >
> >  struct rzv2h_dsi_mode_calc {
> > @@ -87,6 +89,8 @@ struct rzg2l_mipi_dsi {
> >  	struct clk *vclk;
> >  	struct clk *lpclk;
> >
> > +	struct pwrseq_desc *pwrseq;
> > +
> >  	enum mipi_dsi_pixel_format format;
> >  	unsigned int num_data_lanes;
> >  	unsigned int lanes;
> > @@ -1396,6 +1400,36 @@ static const struct dev_pm_ops rzg2l_mipi_pm_ops=
 =3D {
> >   * Probe & Remove
> >   */
> >
> > +static void rzg2l_mipi_dsi_pwrrdy_off(void *data) {
> > +	pwrseq_disable(data);
> > +}
> > +
> > +static int rzg2l_mipi_dsi_pwrrdy_init(struct rzg2l_mipi_dsi *dsi) {
> > +	int ret;
> > +
> > +	if (!dsi->info->pwrrdy)
>=20
> Maybe better to introduce a new feature flag like:
>=20
> 	RZ_MIPI_DSI_FEATURE_PWRRDY

Ok.

>=20
> And drop bool pwrrdy from rzg2l_mipi_dsi_hw_info?
>=20
> > +		return 0;
> > +
> > +	dsi->pwrseq =3D devm_pwrseq_get(dsi->dev, "dsi-pwrrdy");
> > +	if (IS_ERR(dsi->pwrseq)) {
> > +		/*
> > +		 * This platform requires a sequencer. If we can't get it, we
> > +		 * must return the error (including -EPROBE_DEFER to wait for
> > +		 * the provider to appear)
> > +		 */
> > +		return dev_err_probe(dsi->dev, PTR_ERR(dsi->pwrseq),
> > +				     "Failed to get required power sequencer\n");
> > +	}
> > +
> > +	ret =3D pwrseq_enable(dsi->pwrseq);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return devm_add_action_or_reset(dsi->dev, rzg2l_mipi_dsi_pwrrdy_off,
> > +dsi->pwrseq);
>=20
> I think we can drop devm_add_action_or_reset() as devm_pwrseq_get() alrea=
dy register devm_pwrseq_put() ->
> pwrseq_put() which already call pwrseq_disable() if desc->powered_on.
>=20
> Then we can drop rzg2l_mipi_dsi_pwrrdy_off().

OK will fix this in next version.

Cheers,
Biju
