Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011313;
	b=VJlWEIZ9xsf7xpMIhBerw6h7B108bMoh+Ome+jaCV8Lz8LbG9vjI3MOxGlATUAFv68Uo
	 b/WdzqpdhKHAoTctNqtpVNkqoHFzdmSiyyiuV71lUqGz6ZSsG8aihl+wUW9xdTbxy+qS3
	 XZY86UGRxCv6AfEvm1Gf2OdUx6DvlBjhie8y5gL3SP+fsJRLTnMXmZlfz0w4g2fj5eWTF
	 QDkssHCY0iRxgJrMaI1lpMeUYIZimJpkgkErU05dLABZywURnMeHFCui5gg3NsuNsLyRg
	 E3qCskbh1oAV8kpz1VwQDtSWPWAzV8xoNG4D2h1I4wHgfqVVwWKNAXSzrqMN36yp3Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011313;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Organization:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Virus-Scanned;
	bh=KvDGt/SRGq4OwemsueeHKMWOsPxmzxj7gt+ZtB5TDoQ=;
	b=A641kwNyWy+EbCKd11/8HxDaLk1UIRktW6it9tAXBrtFcS8gjVQjUIEZoJD5ZlrrCtbJ
	 kB/luhBJ/7RIuDMKqmUiF+ds7Ejwvp9UvqXAeF4kpajc7EM48hGD2kP5jjVVgF6TjTXbL
	 JICiqHD9pWlw8kqdl+8Fb8hqMXbysJtjkDUxe92F4H/eEzif1nXOKKDRaCzhYn2Z569Di
	 3VzVQ+CfWATCJYySDdpIclYxcHQiRculSzf+9hPdw8k08HQOzUthHmktIyPVD6l4cNYx7
	 N0vyqQ84W9BbwSZbSDYMH9suLlpoPT20npeya7AP77QPqrberKfjJyzO73x61JXkbIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=MFad3Qp5;
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE484606A31A;
	Mon, 26 Oct 2026 10:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE484606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=MFad3Qp5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=KvDGt/SRGq4OwemsueeHKMWOsPxmzxj7gt+ZtB5TDoQ=; b=MFad3Qp5Vnc/Y/7ivVaTeBE+8W
	eSSk8wtCZjsQ3SkjA+9L9KvlNjXIn6WVIuuMW+y+lp5DUXWKIQHfKXeBCjz60Y5jlH9S6zexKEVgp
	N94EDEGiiu+GdpC4Ljwod3udKQaT+9a0AmYE5dNtuGmmFzqRtgawVfmVEjQs8aU2bA+scoQC/jVm8
	/8SzWY7qcDG0KAWNjT7ubW7LKnueD/czINcbYiuqkWnErjt2+q+S2G+55Xp22GyduannGH+QGSdn1
	fyvk3bRp4y6uHUa2i5QZytWla2lpU/WsLMA88VufRhZt2cHyPR4O/jXZMeURIPLrfojjqcWUw7lFO
	77gqjGaw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xLI94-000Jam-3A;
	Mon, 26 Oct 2026 11:41:39 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xLI94-00053P-0p;
	Mon, 26 Oct 2026 11:41:38 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>,
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v7 10/15] drm/imx: dc-ed: Support getting source selection
Date: Mon, 26 Oct 2026 11:41:36 +0100
Message-ID: <2873454.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20261026-imx8-dc-prefetch-v7-10-a0b50cc4fc65@nxp.com>
References:
 <20261026-imx8-dc-prefetch-v7-0-a0b50cc4fc65@nxp.com>
 <20261026-imx8-dc-prefetch-v7-10-a0b50cc4fc65@nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.6/28165/Mon Oct 26 07:27:07 2026)

Hi,

thanks for the patch and adding me.

Am Montag, 26. Oktober 2026, 11:05:15 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Liu Ying:
> Add a helper to get ExtDst source selection.  This is needed by
> disabling CRTC at boot in an upcoming commit which tries to get
> the source selection.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> --
> v7:
> - Collect Maxime's A-b tag.
> - Check regmap_read()'s return valure.  (Sashiko AI bot)
>=20
> v2:
> - Collect Frank's R-b tag.
> ---
>  drivers/gpu/drm/imx/dc/dc-ed.c | 29 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-pe.h |  1 +
>  2 files changed, 30 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-e=
d.c
> index de1b71315eab..67163dca1363 100644
> --- a/drivers/gpu/drm/imx/dc/dc-ed.c
> +++ b/drivers/gpu/drm/imx/dc/dc-ed.c
> @@ -149,6 +149,35 @@ void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_lin=
k_id src)
>  	}
>  }
> =20
> +int dc_ed_pec_src_sel_get(struct dc_ed *ed, enum dc_link_id *src)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret =3D regmap_read(ed->reg_pec, PIXENGCFG_DYNAMIC, &val);
> +	if (ret)
> +		return -EINVAL;

Shouldn't you return ret here instead? With that fixed:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Best regards
Alexander

> +
> +	switch (val) {
> +	case LINK_ID_NONE:
> +	case LINK_ID_CONSTFRAME0:
> +	case LINK_ID_CONSTFRAME4:
> +	case LINK_ID_CONSTFRAME1:
> +	case LINK_ID_CONSTFRAME5:
> +	case LINK_ID_FETCHWARP2:
> +	case LINK_ID_FETCHLAYER0:
> +	case LINK_ID_LAYERBLEND0:
> +	case LINK_ID_LAYERBLEND1:
> +	case LINK_ID_LAYERBLEND2:
> +	case LINK_ID_LAYERBLEND3:
> +		*src =3D val;
> +		dev_dbg(ed->dev, "get source selection: 0x%02x\n", val);
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  void dc_ed_pec_sync_trigger(struct dc_ed *ed)
>  {
>  	regmap_write(ed->reg_pec, PIXENGCFG_TRIGGER, SYNC_TRIGGER);
> diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-p=
e.h
> index f5e01a6eb9e9..0b81dc6b251c 100644
> --- a/drivers/gpu/drm/imx/dc/dc-pe.h
> +++ b/drivers/gpu/drm/imx/dc/dc-pe.h
> @@ -85,6 +85,7 @@ void dc_cf_init(struct dc_cf *cf);
> =20
>  /* External Destination Unit */
>  void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src);
> +int dc_ed_pec_src_sel_get(struct dc_ed *ed, enum dc_link_id *src);
>  void dc_ed_pec_sync_trigger(struct dc_ed *ed);
>  void dc_ed_init(struct dc_ed *ed);
> =20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


