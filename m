Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB0F52BE58
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866297; cv=none; b=FtfkdtEP6PO6KcbgEfSBAnq1zhkL+1hUxo2zwLvlWY9Cdpt66rNTOGd8kxzWQ2RDe5Ydr0vBj41W3wLq85sAE2G1LEL59qRWFp1WyOk/LzvFk1pV6vgCNxd84OcfbAAqnv+EE2OmwnQu6MxlXcn+q7vac0n5M9rTg7HbxlO2Fcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866297; c=relaxed/simple;
	bh=lX4V4yjGtJ3+RS/BGcYcxwkRKomux7igTneZYQSAgkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrMIIKgbfRb3Yx+FV5yaEVIf74GPxvKW2bwDXASjAN9PhnPw3kY8Z6/87rPQDYVKPNs3dly4Pw2CzhsphycKtws0kZGJKoDR/tKxiHd0MnpQ9ZaKOG/N/nZU9PD8o1vR6BoFt+BkW8nERj//S9HJNljL559xMh3mnTTQjKc9K64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ev51L5fQ; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ev51L5fQ"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c7e8a17839so146074e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788866289; x=1789471089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GR+PLOaTo7otsU9ebeTCa7DS4PdH9ick+Ld4KYL7p5E=;
        b=Ev51L5fQhBYYIGN6xLOPTjQv2rczFfFrLSkgYA1zlP+NvHJeUiMcMlsXyzfdMjIuug
         qi/2p63yTzEHx/yuLXk0+liIKi/sJJ00tahgoMkTK3cYf2BQvxQMrBpF8O0hwWEyAQp3
         4zLhamEHuSf6eOKN91tEESfm4+TZ76A80jaQ++vikrXjvj3lCb2d/HUTirPHcySQi4nW
         CGs1OfWDebNOHdjoy3WrXLKpva/gSjP2Nffj59XMmwsG32r756xGxmVkpxZYEBPYFjjM
         BtlD4zDMCR58x/3zwCqUMdhxxA3XyyxG9TBFtrfOi5x9dg14r+0peT2POdlRdKDtTPqw
         Mz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788866289; x=1789471089;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GR+PLOaTo7otsU9ebeTCa7DS4PdH9ick+Ld4KYL7p5E=;
        b=FGJi1WArM+ffzqhW/RX2A1sVJWRLpXWw1rUX6kMUdrcxDyvTip+YxOja6ZiOLBSHCe
         jHTCmy9UuxgRAZwhMdcPHf2YsyvSPYvbwuJqCbBYdyTX+IvRliAcIrjcaq7i5mQRjwxr
         nb5eq3F9j9H7vIFiitLkgafDnHr/mNMcAYXfnVgsGcOjvI4rYO1O0HisYJLyieIk7uw8
         EyUouwg89qLgD0bO/yQGP+ITn1Bsj/iIxroaIC8tBcQpPaqnNP5mo7CRst8sZdXLmAQ9
         08M7aI9wiWIKz4oDG12yZ8lmHuyie3ICuEBv40kctCDAh/YvIXVIaHAYRonzey1pfF/6
         V72Q==
X-Forwarded-Encrypted: i=1; AKwUvBx7wTwu/sNyn2Z58ve/sT8F/3HXJOILCrN+tGQvBphFErhHUwJUuDTavofuS33ph1dSC4GAz/uxdYJZpSA=@vger.kernel.org
X-Gm-Message-State: AFuF++lmYTSV3hIhUY0NMqlRToI5RQPoaOCnAGj6zoVeYo0jjkHWM9Gh
	803XK73pcN0tPMo12pcHBSaTkKWlmiIIwrXSoNZkVH9fVeMmr3g4kUma
X-Gm-Gg: AYBFou3g3EivNDrJdeOLTuGZFOmtXVRYFa9XlV3C5gkSURX0f1wvLQVGjFtwUrxmP4n
	mDoUKstllE6D+7u9lrHTiTqrjkfMepJw0x24FuKMcKii43tMEkCNNB3Lgt7AnpGzuIsCml+JBeG
	mf7L/OKqFW4P78OTMbtYXmhgNELa6a2fCbyMbwsHTJdCJpAxfdzupm/kNo8s2BSF+vFIvlEqPfv
	NYzMLqq2B736rkaHSv7RtsKk/JWXL5USqQmSX480jLpOU2MJvHowjY8fujOW0zwjgr9Z99mJwUI
	KF14/BrPl4WLKtIIcKLkOz+b3mdAX1XZZeC2Ads4ZSGwV6APTiOJFPKq3YOVVxYigqOtlZiV4Ic
	2C94DdzvmmEIxtVap8gZ869xfdMXV5DjdGPWPAX5DW4bjOluiT0or/oSbOlu+j11qiXi5VyT9RB
	NltatQwecGC7mEslyCx8pQgzLuW3fALf2vhlKNYjh76IPGXryBWoHF9lFC337swJObyeSoc3gpL
	WDQSA==
X-Received: by 2002:a05:6102:c8d:b0:789:ec0f:3a03 with SMTP id ada2fe7eead31-78dd1a1cb33mr1540702137.4.1788866288632;
        Tue, 08 Sep 2026 04:18:08 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76487sm8467503137.5.2026.09.08.04.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:18:08 -0700 (PDT)
Date: Tue, 8 Sep 2026 08:17:57 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 1/1] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to
 LVDS adapter with the 10.1" V2 display
Message-ID: <kumbe27i7a632rthuruthpt6z65aszivylj2u7cdkeqecx3zgd@vi27clpphsq3>
References: <20260803173705.2268792-1-leoreis.costa@gmail.com>
 <20260803173705.2268792-2-leoreis.costa@gmail.com>
 <29aaa2ec-c1fe-4f60-a6d1-f8c797587986@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29aaa2ec-c1fe-4f60-a6d1-f8c797587986@ti.com>

Hi Udit,

On Sun, Sep 06, 2026 at 10:49:52AM +0530, Kumar, Udit wrote:
> Hi Leonardo
> 
> On 8/3/2026 11:04 PM, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> > 
> > Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
> > Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
> > Aquila DSI_1 interface. It is based on the Texas Instruments SN65DSI84
> > DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
> > LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
> > touch controller.
> > 
> > Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
> > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> >  arch/arm64/boot/dts/ti/Makefile               |   5 +
> >  ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 153 ++++++++++++++++++
> >  2 files changed, 158 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
> > 
> > diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> > index f4d109ef6798a..8a59fc597aede 100644
> > --- a/arch/arm64/boot/dts/ti/Makefile
> > +++ b/arch/arm64/boot/dts/ti/Makefile
> > @@ -218,6 +218,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
> > [..]
> > +
> > +	panel-lvds-bridge {
> > +		compatible = "optologic,scx1001511ggc49", "panel-lvds";
> 
> > +		backlight = <&backlight_pwm3>;
> > +		data-mapping = "vesa-24";
> > +		height-mm = <136>;
> > +		width-mm = <217>;
> > +
> > +		panel-timing {
> > +			clock-frequency = <70000000>;
> 
> Looking at
> https://lore.kernel.org/linux-arm-kernel/20260623195741.495734-1-leoreis.costa@gmail.com/T/#mc4ed25e5253da6dc635fd3eddc317dac8f447f3e
> 
> 
> you are using three different clock-freq 69500000, 64500000 and
> 70000000 here.
> Could add some comment here, why freq is adjusted.

It's for the same reason as the 69500000 clock frequency in the Verdin
AM62 patch. In general the DSI to LVDS bridge requires longer horizontal
porch and sync values than the typical values for the display, and we
intend to use the values on this patch in the general case when the
bridge is used. The reason why the frequency here (70000000) is
different from the Verdin AM62 one (69500000) is because we found that
that 70000000, along with the other timing values, work more
consistently with the bridge across our modules, the ones on the Verdin
AM62 ended up being a first iteration.

I'll add a comment explaining the difference from the native LVDS values
in the v2 patch.

Kind regards,
Leonardo
