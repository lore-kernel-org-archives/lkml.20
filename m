Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3763AB29B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909750; cv=pass; b=OVMrgTw14ZhwEnB70iKCs7uVNofCRkuHLjysBaz0BkITgaqP13+gS/bp/M2TQagYHCpdEZNaVd8cg8Vnox9sJUzaK9ctSWYvOemSWlTgEPgrs/tGld+KenkNoUyjXK7ciw/b79oz6thQTkQKU3Tnk3H4dQpEoeU2+bfSmKj1dvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909750; c=relaxed/simple;
	bh=j7j2ZSbXQ524pa7t9YjG5WIv3zZE05ie/WonynAPrx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aR2XvP687rocskTrdahc+pDKRPnELInhfT2IpXFebE97aTX2+cZBwd0/UGVUG96vJhElYWaEvOHTgfaAAL8J7Q+G6m9wCCcK15inQffY7JTDZzu07MU4snF/O+30XyOq1MZNpwUBsIRSuvVRJ7WAfo5XdHfqCQLZav3t9WH7oMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhSEXyqU; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhSEXyqU"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69fdfd98eb8so99929a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787909732; cv=none;
        d=google.com; s=arc-20260327;
        b=sr83g9EpazQf1nbxZGuT1Ib/6scsCeP+/cxYttdm8wqzjD1Tp2dppwtJQDfTepZolK
         Sb7X9B2c4fKCtK/HqBfdddIGlsURznTohhAA1nuXVoVQnePC03UXqYQuJ2svpprt2GZa
         m3Je4EPOdbBEatCB3jH2fMM8bmtjo9yKp/O0Gk+R8+PTiPJCq4CUcsCCywcsZGS8loe3
         6dbswKd1Dpu9P3uCd4YA5rtmbxYLeuW+1OKT9citGV3Hoz5wOvMkeJ8nIp1RQVuKQbBE
         W71ndUPuIge1oXT+l3lslSiSIvp8eEqYaqQRzWA1s31CUAvTTVorfQqVtjqjflc0d9VN
         pv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bSJFj2Mb1tcu0hhCa3Pj1XQFswEEME5NPfKvSiT9UvA=;
        fh=5JtWvmU6pbReMqozdSBIzUaZoL3kN6+hL66NlaiahhQ=;
        b=N6ES/cxiuOno2hthun9SYh6FfCPN2JjpON8hVb/8IRuqvtL+DlMu7DCcBNLRpLy9O7
         qTe/gmONbrEpHRLqMQpEJgGuvHysVI+HSwuz3e6rCE61VdXfLNC9jBrZsX2tIog8isWG
         84JwTy5CQDV7JpkwfrjkfJdvJl90gPEj3lqmune1LsO/sr1pmUuAD3pnuiUiPStF7L/w
         4x7ZABI0rBNjzax5rNTJbKne/lxlok4OcNcBQ1qUTpAlpk1wy4y2hWYJ3p47sreXcukp
         xzik2GqSInmfwYOthimASHLbrA+gT/ctVC4Dv/iJWJB9GEjC6gEqJ/CMy9RybHO3qZe4
         Ge2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787909732; x=1788514532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bSJFj2Mb1tcu0hhCa3Pj1XQFswEEME5NPfKvSiT9UvA=;
        b=dhSEXyqUMV7I2YuFjPV2piNHlS+GIPOp6+wcDKwLl3K5Cxs3gkS1A4XIe0Ghe/aX4Q
         1g4c5S4FXAelPc/ci1crCYJ6c3ajLTcp6cg45Ct84EAfoSt7dvTNVi0KRBdnlIWBEdoq
         iApVVxqb4765QxyGTW3l0OcMV33SQtW6RqBqVnagki5el4B9ZDbpMC13jtaXx3ej/Qwc
         nhohvdDtjQSZuP3h7odffv/0yAq5lA4FHewmcXc4s9nt19Qly75P9Vjn7mdEEGCRTiYr
         wRsMjrNc5egN5c+QsG8aDEsT0yhqG5WuZVTGiRPEUOWpXubhFI6WYp5+OFmmNvK9D886
         0cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787909732; x=1788514532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bSJFj2Mb1tcu0hhCa3Pj1XQFswEEME5NPfKvSiT9UvA=;
        b=hEV0nkyIjN4MfnCD9tCG3aK9AxvssqGKCT61rxITakgBq9H7GDOBDXmL+IKD/33a5J
         Kzo3XpJLp3Mr83sZ6RGsL2wkLKNDHgGSnU60rp9aS9PPiu249YusaZHTKcuSvzlZmM3t
         s6JfyuRtaR0B2kaAH9NqQi+9XwowUTy32ovGaaxrvDm+3HvS1I4V25I+duK+cUoFnTuM
         nWHfe0sa8N59JVBuQeVQRpPcE8aE1TVYTNI3DzNiq2KVTU08BvvtnnauiyBH0l4x4K3D
         5WEXVdd3/3tMss6qcjnMaHF3/N4oDL6a23jESP/KkryfBO555k2RWPJcm1fGkXjueqWs
         DkSA==
X-Forwarded-Encrypted: i=1; AHgh+RpGL6OktlAgMxftzxev0scQhEc2Q/LooDkY777DYRtka+y+oEtbkiPYSH1feCuJuJUfMwNkUH9GlfYIto0=@vger.kernel.org
X-Gm-Message-State: AFuF++nF3UICr5ZjMlb5o8puGiJqldNPy2/VNfnor27V4GgU4g3a1mVr
	Bga7vfUWh0ZtqNNd6BuJkEGHRuGsgOFBcqJB6bOzxMw8Lc/sUTU/JlURMgzEacweoo3ThaYRZ31
	AEBrNXeZW+5Us5F0GnqOAeZl2PrJEZ4c=
X-Gm-Gg: AR+sD11Ce9taE+CIg9SP7SkIXL1QhgE6hzcuQmf4WX7MDJiYWdU5bcbU2rZ7Ud2rvv8
	jDS31iP8ddYlzfz6wQCgGPhfvzQ6FBrsBXozMh9f8DzhOwHLAu1IyrOutkdaroiHGXS/xweu2uf
	QlAGcD3dA650+QUpxdTvn/g2M2UIba5JLw7o2S82px1huAjLtcDuTIPQpP8+9jnraCf6Gwo+kaw
	eSHT2AuMUz6hJ+IzCbP5LSshMGt45D/YhVKyzvz4dX1fxVW9zSmWPea8NqxyEQcTGdF441GnXw2
	KPNiNmbOlotZXbLT5l7GAgR17EhIqjIChaA/ymUbYc4OYSrWQJDt1A==
X-Received: by 2002:a05:6402:541a:b0:6a1:de1:f739 with SMTP id
 4fb4d7f45d1cf-6a60d36a266mr1562286a12.2.1787909731660; Fri, 28 Aug 2026
 02:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
 <20260821-dcphy-rx-v1-v4-1-f1797634233d@gmail.com> <20260827-thundering-cream-saluki-dd05df@quoll>
In-Reply-To: <20260827-thundering-cream-saluki-dd05df@quoll>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Fri, 28 Aug 2026 17:35:19 +0800
X-Gm-Features: AcwNN1VURP6ewJ0HD0VNfWu9xGoJtKmMhy7y_I8d0yGNeVN7oyHoitKsjPfK980
Message-ID: <CAPwA33K+XSRPDzv9xAcoPneUsp6A9OTwakJ1VJY=zXnHiH+5Wg@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks for the review.

(from the review of 2/7)

> Please link/show the upstream DTS using simultaneously transmitter and
> receiver, where the consumer does not know with whom is it talking to.

I grepped the tree and found a device tree that has simultaneously
transmitter and receiver. In the arch/arm/boot/dts/samsung/*,
exynos4412-midas.dtsi enables csis_0, and exynos4412-galaxy-s3.dtsi, which
includes it, enables dsi_0. Both consumers are declared in exynos4.dtsi,
on the same phy node:

    dsi_0:  phys =3D <&mipi_phy 1>;
    csis_0: phys =3D <&mipi_phy 0>;

Tracing that back, the provider is
Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml and
drivers/phy/samsung/phy-exynos-mipi-video.c.
It registers several struct phy in one node, and the binding says:

      For samsung,s5pv210-mipi-video-phy compatible PHYs the second cell in=
 the
      PHY specifier identifies the PHY and its meaning is as follows::
        0 - MIPI CSIS 0,
        1 - MIPI DSIM 0,
        2 - MIPI CSIS 1,
        3 - MIPI DSIM 1.

Resuming from the cover letter in v4, I treat this phy as one tx phy and on=
e
rx phy. Maybe I can follow this pattern and introduce phy 0 and phy 1 in
rockchip,rk3588-mipi-dcphy.yaml, and add an enum for
SAMSUNG_MIPI_DCPHY_TX/RX in the driver. The binding would then say:

      Two cells select the mode and then one of the two PHYs that the
      block contains:
        0 - the transmitter, for a MIPI DSI host
        1 - the receiver, for a MIPI CSI-2 host

      A single cell is equivalent to a second cell of 0.

In this way, I don't need to add PHY_TYPE_CSI/DSI to
include/dt-bindings/phy/phy.h.
And I think this will not go against the discussion in v2, where Michael po=
inted
out that DSI and CSI are standard protocols and should not be named in
a Rockchip
specific header, and suggested introducing PHY_TYPE_CSI/DSI:

> How is that Rockchip specific? As you state above this is either MIPI
> CSI or MIPI DSI, two perfectly standard protocols.
>
> @all Would it be reasonable to introduce PHY_TYPE_CSI and PHY_TYPE_DSI?

https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.co=
m

> Where is any DTS using it? I did a search and no results of upstream
> posting.

The user will be rk3588-base.dtsi. It adds csi0/1, which connect back
to the existing vicap_mipi0/1 ports. It also sets #phy-cells
and the dsi consumers to the shape that comes out of this review; with v4
that would have been #phy-cells =3D <2> and PHY_TYPE_CSI/DSI.

I thought the dts should wait until the binding and driver were settled,
so I did not post it. I will add it in v5.

Thanks,
Jason

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=8827=
=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:46=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Fri, Aug 21, 2026 at 08:02:29PM +0800, Jason Yang wrote:
> > A MIPI D-PHY or C-PHY can be a transmitter (DSI) or a receiver (CSI),
> > and in some PHY blocks both work at the same time. The existing
> > PHY_TYPE_DPHY and PHY_TYPE_CPHY cannot tell whether a consumer wants
> > the transmitter or the receiver.
>
> The consumer knows this already, no? Imagine consumer of the phy is some
> ISP receiving data over CSI for given port, thus consumer cannot
> transmit over that link.
>
> All this seems redundant.
>
> >
> > Add PHY_TYPE_DSI and PHY_TYPE_CSI, so that a binding can select both
> > D-PHY or C-PHY and transmitter or receiver. They do not replace
> > PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice where a cell
> > selects the mode. The first user is the Rockchip RK3588 MIPI DC-PHY
> > binding.
> >
> > Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> > Link: https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@co=
llabora.com
> > Signed-off-by: Jason Yang <jason98166@gmail.com>
>
> Where is any DTS using it? I did a search and no results of upstream
> posting.
>
> > ---
> >  include/dt-bindings/phy/phy.h | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/ph=
y.h
> > index 979b5dfd8353..8ee3f88e6d80 100644
> > --- a/include/dt-bindings/phy/phy.h
> > +++ b/include/dt-bindings/phy/phy.h
> > @@ -24,6 +24,8 @@
> >  #define PHY_TYPE_CPHY                11
> >  #define PHY_TYPE_USXGMII     12
> >  #define PHY_TYPE_XAUI                13
> > +#define PHY_TYPE_DSI         14
> > +#define PHY_TYPE_CSI         15
>
> DSI and CSI does not look like types of PHY...
>
> Best regards,
> Krzysztof
>
