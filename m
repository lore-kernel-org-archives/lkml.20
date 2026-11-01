Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.133
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793563931;
	b=OvIxI9DsWYOdcat4ZtsF0CKYrDBHYX8QJQPjTDsryMo0ZzkLb/qcfyxAGzSLqxV/uCUG
	 qkmQu76+f/9XdzyLoO5KviCI/PW3A9O7o8Aw3TjobBuHg9RYDn7E29hMPPu6+68L2f27S
	 m+dz+kuJEcU8HVx0PMLkOhvodiJ3wHSeFkHb6vkeX22bEjNFdFBAJjN0yxJKxzAcPx49b
	 8kCFito5lzPXwYBN1e+WHXwo1JXXd1dRsdoDrKcl05zsRQU9FTMIl4WMRpYNskZj7rQFJ
	 jgtv+GRJw/Wolg5sTXrA+xm6D9dxo0ruDahLCtlMlAip3DXFj/1klMfCfGhNWU0B2ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SAEhnewbdseHCyOO8rtnZ+ccqV7eT1Rq136MpuhqgwQ=;
	b=MofOsOF/PY/0ZK/xBkNnZtV9URkd2DSmD4Bif+f1SfFUsW9WjC0njdhmd0NNqZxKD/+R
	 FqzuDNDmHeJyjHrNQ1QVY6Bx7nhA3Zh7jaifXGLRJz/z7mSe5SOfpmC/GAGK47+TwQI3S
	 05qT3VOb6tJugrrP0p8Wyd4Yb/m/Vi2xa3nIpsZhe6jyZHz7ncLKzEvaKSlWP3C6TOOvD
	 Sp63dUg3DAXvBEuHn8N3mfX4qRj9OllcONJtNtqZq7FvsMO9/5eXeBkVEA14YZV4mDaNh
	 MIDPXrubp2jZ6U/Gc7F05CVpO98MKBeHQEMX4ow21eJrMNJLWoCYnpvXchtdaeKD07Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YOLTTBOH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.133
Received: from mail-ej2-f5.google.com (mail-ej2-f5.google.com [74.125.228.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14484606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14484606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YOLTTBOH
Received: by mail-ej2-f5.google.com with SMTP id a640c23a62f3a-c46c4bbb06fso137604266b.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:12:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793563929; cv=none;
        d=google.com; s=arc-20260327;
        b=DQQPHm78hN4NvgXm8NeGPIsdL8Y5BkYbP2zIDMqEh4PDFZtVWV3xkcO9K46znNPNL0
         j+7sRyc4OdMTYfkVJndkc+vIjKRHZFYXQNFO38lLR7KSOEP+jD16OLghcNcBe+5igv3n
         L3v863SUHEOjd5+eg8jTw5yvRvhzuuD/TI/krAZbZyBelH67AJnuJVWeMyzikxUp3W1D
         Io7H+sZTGId0Va+2i6ncYXkW4yHvhkQeSytq288MwvN+qesvDyfOUsboEpJCQURtE36R
         b9ITfwIlj7cpNOp7QQWlGGKA/byA3epEALep81LMHN4NkbpMfkn6luS9Xi+HmCWr9MTN
         0yFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SAEhnewbdseHCyOO8rtnZ+ccqV7eT1Rq136MpuhqgwQ=;
        fh=sgACsXSogXSw9jmUrqIIlkVfMPRwSNiJ4sgeVtHx7kw=;
        b=FekZX3p4E01Jmrzk2d3e5Oi3evCY2ai0rOx51EB5mIQe0/ukm9JVbUz9IXru/2Kskm
         sR4hs7pSYSBG9qZaX5H39emPyTQPMSTL6BG4FvIFp/RFJXXrGQv1Ev5BHZm5AIj5Z1EU
         b2c88gdSbx7xxookU5DQUOGoGENuuy8h1ZuQZkeWUP8TARAKNm6AUIKE6k9f942hVgmy
         8UqMa+j4DX7wYB+FQuzJo9hrmKfQ1bsKBvqP/EyV6wp9xqBDvuT/W0VClCfez9sn281K
         NF/qZb866wwC//moeMX5HWTDIyBanM7qdWn83R12UljXZETKViHP8fmxprHKb7bwcR4l
         PYLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793563929; x=1794168729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SAEhnewbdseHCyOO8rtnZ+ccqV7eT1Rq136MpuhqgwQ=;
        b=YOLTTBOHApAKN/AqSUNDP85asCDKPWvrY62AbY5QUnR4bOgBmNQYnlK24wl9UrXM84
         DCZ9o4EcnVZMBJSQZ3WC0XKc21bQysHY4cilSf8JEMA/CzbxRC6PDuerz3owJ5qc5Tpq
         PD+IFIsyfGlLrl+N46djT2S+DseP4Sw51Xn1xDBENzSq+U53meooMqiBI6PL5gykWNEP
         F21g1LQKZx2wT6mqHY2bdCCI4Uisse1Xvq0fmJnCpB432rAMAtwC0pR7YFSqh/9QSsdz
         1upUOrw5CehyT8MmSx5PRrxejFcG4VgoSJ6+Kl2hjhzxBhebpJbtFmqVDUWC+4H3oJlB
         TwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563929; x=1794168729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAEhnewbdseHCyOO8rtnZ+ccqV7eT1Rq136MpuhqgwQ=;
        b=MG52GI4qQvfo8+D077ObvuErbG7wBbXdI7rb8lQx9+Aa0lk1foTI4FHebRDEM/wtuy
         gzmTEgEyoxlNgdLracouF621PO6WaZ8VbCp6BKH9TOB87MJHsneubJP/D658Y4jx6zdW
         vzMjcxxy3TSOhsU4/GtATanM7U8mAIziKLtHBS9AjO3V10RqewDeK/rfxJnAwMoSaoEl
         9K9DwlLMVhOwUcuHM1r1wheovX7XFLmsp3BSy9qzJUdCzmqIJFKmoKLPlLnMdkgm+znl
         EID+lPD3yWXpF2Ly8fxujQPsZzoMA/aFuK/vO9RYxIGSIYVCZDriQJYMGAoVytRrWl4c
         MqnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxV7HaDh+cNTfF4VvBFeFynfP4HAOZsC9ybXfIaufHAtrDDdsD8r05Sj78bh8mJMK45k2/8AnSWo3N9LB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6jmHzy9PzH5JocrRUm1cjz0sUbooT1GFfHotfvQIBl0mb98wk
	FBSWP6qPL7oqkFxPvNTGiPs5G+dP+AvvYfuJXwinVllP/uh0HjVB+26RFkAKui88/d5+zCgo7Zs
	l+BsZ7Ul2AzgscmCKNotYKEBq9Jd00Dc=
X-Gm-Gg: AYBFou1notv8PJnlyi2bC1QJ3ffHQh8VzHycAmDb10mUY/mLSakjd6NcICyQdFFIds1
	cxfdk08wQZB1HiEQHTzxBIOY2XLMI9NqL1w/+OJqMGY5uyFLMEb0wW4KLOlLT8LoXt8bxUQXw1L
	AJbxVN39uQvshGwO5ONkqI7QWO4HWVDOOWkpNMYmF/lbnaJ9aYBp6JWZRFKrHRxpLbSU3owjHHF
	0oOxw1zlb1X8SGsq1nDZ++HPam/9QPUaL9pHpsewl8juKL1cRk7SduRKISZitKUUoELMluM/MNQ
	G4hvU/VuAcjCDYzBvTQmVA/5gxFbK4b0bwGSIDo4rF2HnqlzKTkSErmHoaBvXLwQBFueMHa/Kfp
	Gzxjm2ndZgJE5KvAsOTHZDOXXGejZIdx2C+b6hN6q
X-Received: by 2002:a17:906:c14d:b0:c40:4f39:22e8 with SMTP id
 a640c23a62f3a-c4ca7acfb41mr639189266b.44.1793563928992; Sun, 01 Nov 2026
 12:12:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023053548.1595033-1-coiaprant@gmail.com> <20261023053548.1595033-2-coiaprant@gmail.com>
 <2977688.AiC22s8V5E@phil>
In-Reply-To: <2977688.AiC22s8V5E@phil>
From: Coia Prant <coiaprant@gmail.com>
Date: Mon, 2 Nov 2026 04:11:56 +0800
X-Gm-Features: AclHuK9JsP_sappSiOI-OzoOwsqicY7ddXohMyF8cGA-5NNfJ9GwpFb4-3V7qU0
Message-ID: <CALj3r0g5twZNEiO5b1hHpxy3kAVBxLZNt55E2dxSSeZ5GgXisA@mail.gmail.com>
Subject: Re: [PATCH v12 1/3] arm64: dts: rockchip: rk3568: add XPCS and
 fixed-clock nodes
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Heiko Stuebner <heiko@sntech.de> =E4=BA=8E2026=E5=B9=B411=E6=9C=881=E6=97=
=A5=E5=91=A8=E6=97=A5 22:06=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> Am Freitag, 23. Oktober 2026, 07:35:46 Mitteleurop=C3=A4ische Normalzeit =
schrieb Coia Prant:
> > The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
> > the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
> > interfaces via its four MII ports.  Add the XPCS device node to the
> > SoC device tree.
> >
> > The XPCS device is accessed via the APB3 bus at 0xfda00000 and
> > requires the CSR clock (PCLK_XPCS) for register access and the EEE
> > clock (CLK_XPCS_EEE) for Energy Efficient Ethernet operation.  The
> > PD_PIPE power domain must be enabled before any register access.
> >
> > Also add two fixed-clock nodes (clock-xpcs-gmac0 and clock-xpcs-gmac1,
> > labelled clk_gmac0_xpcs_mii and clk_gmac1_xpcs_mii) providing the
> > 125 MHz reference clock for the GMACs when operating with XPCS.  Their
> > clock-output-names match the CRU mux parent names in clk-rk3568.c, so
> > boards can reparent SCLK_GMAC0_RX_TX / SCLK_GMAC1_RX_TX through
> > assigned-clock-parents.
> >
> > The XPCS node is disabled by default and must be enabled at the board
> > level when 1000BASE-X/SGMII/QSGMII is in use.  The fixed-clock nodes
> > are always present and do not have a status property, as they are
> > static clock sources.
> >
> > The XPCS node requires a reference to the appropriate Naneng Combo PHY
> > via the phys property.  dtbs_check only validates required properties
> > for enabled nodes, so the SoC dtsi does not provide phys: boards that
> > enable the XPCS must supply it, since the SerDes link is a board-level
> > design choice (combphy1 on some boards, combphy2 on others).
> >
> > Signed-off-by: Coia Prant <coiaprant@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3568.dtsi | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3568.dtsi
> > index 3bc653f027f1f..20a72785adbc2 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > @@ -8,6 +8,20 @@
> >  / {
> >       compatible =3D "rockchip,rk3568";
> >
> > +     clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac0_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
> > +
> > +     clk_gmac1_xpcs_mii: clock-xpcs-gmac1 {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac1_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
> > +
>
> these clocks don't belong here.
>
> When you place these nodes in the main, they seem to come out of
> thin air, while that might be true for some boards, that they
> have dedicated oscillators for that, this will likely not be true
> for all.
>
> So these should be defined in the board dts, to match the actual
> hardware.
>
>
> Heiko
>

Hi Heiko,

Okay, these are board-level clock sources, not something the SoC
provides. Moving both fixed-clock nodes to the Photonicat DTS and
leaving only the xpcs node in rk3568.dtsi.

I'll respin.

Coia
