Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916946;
	b=P9DdS4kRPyDBSNRW7BChPvIYPbXO2N5CxH/PCAqmfY838LrvS8s7Rp2J50nR5WKRyHb7
	 z7/P01i2VukhMjxc8ZzxmlViYZyDdt3GHPOPnGdAdCvbNF/RHD+SZsli3VjXsATtgl+rH
	 i/AQD9lHaYncrgj5VtPUo8Wii2NW+ebgysP7/mU+viVjQNYUmO2gEtJUR/5Dr2gAfi5B+
	 jjzYZBD3qzjt7QPLfWOMmttxGgkQ1+6Rs8/rpSMosg1gktHyUH5mBI94bodSaTgHOaMpU
	 DQmBm699658iAJyooBifqDptEvM48DmZWX5mwp6CPGb4ivbZz/CKd36+qQEr8Axg6DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916946;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=TRDoGgRwa5KsWvB/IflpQ73VDTml/plhE/c6Vl1BGL4=;
	b=dNT7GZNsyRe8Y4nxx6XEJotY2jKWwMXMFtrMKV5ZErewzMu/hG2keIjScljAhuZEAzMb
	 Wirnu99sfPXD8sbEGM+EVNCLBPfSy66TUKlg89TPoUK+SglXaQbNASjKuY1SNoY/Nnl3F
	 YPR9PY3TZgN88Y/c4kZJ6Th6/JJEP1eFV53yJb2xlRTw5iDpB9MEMhUig0S/gob8O0/zA
	 Ey+7X5Q3qgbC9cAPqI/Nh4DpvLhqVpW0wPhbQtVHUP7lrSkmn37B4Hy9K1GBCRxtOyPJE
	 Tg3B0/4XCrmqCtKZ/PvBniCNKRU0giDvWOw90JX2Po0LQ29HcOKB4un38LCoLXG2R/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=q3ivFl7X;
	arc=none smtp.remote-ip=79.135.106.120
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0665F606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0665F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=q3ivFl7X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794916942; x=1795176142;
	bh=TRDoGgRwa5KsWvB/IflpQ73VDTml/plhE/c6Vl1BGL4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=q3ivFl7XnsQ4mk+NCr+/jvp24S4+bJ6ole8RRhDBj5kzXDzs2Zl29mveKSMA9lSt5
	 hTXrgC4nxQJwDA4XOSo+CcmC64Y+nLiQhp2el26uv4Gqv9wlckMppTUXACcZyxt5/p
	 ql2WZVOAoDauiGGY9bGFHEW/XAMKfYO2wgJiRFvf6TVBW4GHbDrEPmFAC1id/oXmiJ
	 n6zy/KLADPUKutgw8Ks/23t/rfeSRJlr0ap0VDd5nrP/QzJ9qZe/Yt/vM/QwafeO3w
	 fokzQWn0HK2N4bAEKDKjuu+NB1dI0nL3UGYMrQwKYGXaJCzz/EbPXmGi+riMTqW8pV
	 UQZeXEMYNaIlA==
Date: Tue, 17 Nov 2026 12:02:15 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lala Lin <lala.lin@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RESEND v5 3/4] nvmem: mtk-efuse: add CPU speedbin post-processing
Message-ID: <k8LLawty9o68P00hLr5LO1163o_m16f_vf8fBZvdD18nOatszy1i4Dp7DeC8Hv2--Q08YyZfhCRnQbVDps0lqB2zZrx-k_GxKUaqj6eT6r4=@protonmail.com>
In-Reply-To: <b0fa129a-e9ad-4a7b-a2aa-2202bfa23232@collabora.com>
References: <20261117-6572-nvmem-v5-0-9b561a8a83e1@protonmail.com> <20261117-6572-nvmem-v5-3-9b561a8a83e1@protonmail.com> <b0fa129a-e9ad-4a7b-a2aa-2202bfa23232@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 4dc8420aa797847c5bd3778dc677e8a39e520ad9
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Angelo,

On Tuesday, November 17th, 2026 at 1:56 PM, AngeloGioacchino Del Regno <ang=
elogioacchino.delregno@collabora.com> wrote:

> On 11/17/26 12:33, Roman Vivchar via B4 Relay wrote:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > MediaTek SoCs are often released under the same marketing name, but wit=
h
> > different suffix for the speedbin. For example, mt6572m has 1 GHz limit=
,
> > mt6572a - 1.2 GHz, mt6572w - 1.4 GHz.
> >
> > Since the speedbin is stored as a number in the efuse, add support for
> > converting it to the bitmask for opp-supported-hw usage in the DT.
> >
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> > ---
> >   drivers/nvmem/mtk-efuse.c | 19 +++++++++++++++++++
> >   1 file changed, 19 insertions(+)
> >
> > diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> > index 980c29d01337..d2e5c69c580e 100644
> > --- a/drivers/nvmem/mtk-efuse.c
> > +++ b/drivers/nvmem/mtk-efuse.c
> > @@ -70,6 +70,18 @@ static int mtk_efuse_gpu_speedbin_pp(void *context, =
const char *id, int index,
> >   =09return 0;
> >   }
> >
> > +static int mtk_efuse_cpu_speedbin_pp(void *context, const char *id, in=
t index,
> > +=09=09=09=09     unsigned int offset, void *data, size_t bytes)
>=20
> You can *literally* reuse mtk_efuse_gpu_speedbin_pp....

No, I can't. On later SoCs CPU speedbin has different encoding.
For example, on mt6768 it can be stored in either low or high 4 bits.
This is out of scope for this series, but I'd like if we kept this
callback for the future SoCs.

>=20
> > +{
> > +=09u8 *val =3D data;
> > +
> > +=09if (val[0] >=3D 8)
> > +=09=09return -EINVAL;
> > +
> > +=09val[0] =3D BIT(val[0]);
> > +=09return 0;
> > +}
> > +
> >   static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
> >   =09=09=09=09=09 struct nvmem_cell_info *cell)
> >   {
> > @@ -83,6 +95,13 @@ static void mtk_efuse_fixup_dt_cell_info(struct nvme=
m_device *nvmem,
> >   =09if (cell->nbits <=3D 3 &&
> >   =09    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedb=
in"))) =3D=3D 0)
> >   =09=09cell->read_post_process =3D mtk_efuse_gpu_speedbin_pp;
> > +
> > +=09/*
> > +=09 * On mobile SoCs, the CPU speedbin is a number. Convert it to
>=20
> Other SoCs have got the same efuse style as mobile SoCs: anyway, all Medi=
aTek
> SoCs (apart from networking ones) are (in a way or another) variants of t=
he
> mobile ones.

They're not really variants, some of them have no direct mt81xx/83xx siblin=
g.

Best regards,
Roman
