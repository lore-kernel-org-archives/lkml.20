Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289160;
	b=PPddZal4E0S6O4DHjgOexTuAukVBHuO44Nfwep5Ws+P5Co7+3QOuNGRzBLkXZ103cvE1
	 G9HCAa9IlZanPPn8tyZutUk6y5fiCUntkakFQoKQxFFSjXhHyXxsWBynPl8XkWQfNIYCh
	 2h76IBYtrjCzRG24hEu6yE6wb/xhZWBt2K2oz78XF/Me0xbYE7Zry1H5GWcWjnB76ldRo
	 N7WrxBLJCifqItwZhp5li0TFjswHXDLMB0u1TUQkgqp1M95bkBOE+6pbPda3MwtMh09tJ
	 8ah+YpedWIWaaMiQm73/R4vWg9gDfBN4FSNMhCs85kXJAMVDdCJ8HBY5VhXoSF0Chyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ErqmRoNtosEyKipfBKvwtNRAfh9+mgslrcK6rd69LR8=;
	b=Sh1ntUs0RkstgxrWC3q4tkADG6X++muY8CIFwQ4fXIIEkbgIrJCczgzYMw0bxSc+ppfS
	 VHItnGVpb2rACl63/gXBWI+GApP6qnwa24wosQ3KtFtJsBXV2hoDyF5mDRi8Sy9WTax5P
	 FcLih5yh9motVypYHgD9qYyX18EXUe5Mlz47G9HJuB+yTvdadsgYQZ2Q4nhKHTp2sYd4D
	 +uwPR95jYTVv/o0q+EeHWskVtzkXyx8B3jdfAQZ9acfah443j+XbMgKgAlbKp5TcjdPX+
	 3xNs2EUggZ8bs6qGzXm7/VCcTG9KTLE3v7/Glf7vl4KzaX8W3WKS7UnWzAS8CxPLZRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GvL9YtF9;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AABB606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AABB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GvL9YtF9
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so21908185e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289158; x=1793893958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ErqmRoNtosEyKipfBKvwtNRAfh9+mgslrcK6rd69LR8=;
        b=GvL9YtF95NGIqGt0Vp5xf+OuCyFDv28HytnjcnNErhTJmsWHsFkH9YKLlbnBhpV/+J
         7YJZt/Ly+DJPQQCJNzzB7AuQgNzzwmUAMyGf4vOIRq9wZwBo3UWdGaMN+Bf7BOp/7pEc
         ivlFNHqHtv9EWhTXFGQstsgomkLWfOTlfZh/bkp5E0Glbt72i4BzCbWJ06d6rSJB2aKl
         +utLsTbTdzIdG+D6zGR3vefP+xmyMZrdW4ixc0OVvbag2SZ2QStdLBN4FEJY7O+EFEDu
         0XpHfx+ZAAccitu3HIoV4WEmnvbnPh/wRxLvu8tX/hsgwKjtqRvMpjOOSIQLWBCmpxDt
         ArgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289158; x=1793893958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ErqmRoNtosEyKipfBKvwtNRAfh9+mgslrcK6rd69LR8=;
        b=nZHvddwI27IBDuCk4fXKi/1+xVrOnOovANjvQdlSrXQNP6TbPkaezXCG5um+XX57XK
         HcT4c3OyumI3q58K4m88gqCgN8lYi56KpmNmbrNl92JFz2ulPRvIKp70bmUqhrCN9MMs
         MAj5FZsbUOpBnbn6RmCDRe1+y0WFwc2NH4EnrbAJVljzb3XmkpDDgOobs78ato0up4JP
         Chmkp+DZk5HYQU25GhAA9XKiOMD7UfECX6iBGMTnVakd6l+hyxeQsu8jN0j2oNZnVQKo
         OM/gif3o66gU8r+xPVeZ4LQELdVhMdcqcfSEF4C3bF2YHP2+gLnxqrqv/ZnEQz8E073c
         73Ig==
X-Forwarded-Encrypted: i=1; AKwUvBzgFrnVYhiVvO6otyGMBEChnxmRvvUfU/a5zVsKaANIXBq+rya/7o8J3Ht43XLBaCdTMCsBusR7YH+xlaI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeWUuhwMkoRupiH3F+gLNGrKLFPW2oByi7r58SuF4t/hUyWg60
	9f2IhNnNjTy1THS+dMYBOA2dT52jKnwsDT6Zqsi+Gnad7AYrTysuwxm3
X-Gm-Gg: AYBFou2A8u9qlTTLF9cmdoUSJrEZ/j+ohC5GOSpXrU2fEh5b5RSNmEefLrTx4Tdk9Ct
	e6V23JUojCso5mpscE+pWIUcTyspY042NzsLeOHRMnVeeZ5U0DJ8dJmojwncFGYCTFHypcp7ruS
	rCW8RrrJ5ggrN+XnamZAhRzdo7itpeAe5wy3oqMQZomjtHhJoiZ12M/cSkAae+U0BMPq3YVXdL5
	rshUNNY+kFTYS4XW0lM8R5zEewg9jkQg93Zmv5uplJ72DdZCvcTvUu4w2lB+Ls0rf4RQE/xECr+
	T+WLEJaMOxpdu1DVeoKQFjMgQ/RJiEpo8cQb4YM8QsiI9SR32HM1wnSAu6xdZ7pRisZLBeuKKrl
	YXX1UOov2irx5wN3HQ8U8c/g12e13jxflEvaR0YKFtr/c/5Dj6k3sQTRUYh3nkQ0QNNxoll5hBw
	Gf1hf2pp88I/RxW1ECE70x1KyRR96DlvbnD5RbIVoLF/+0tWTun2I/kP4USYnxcuc70AfIlXIBP
	8WFm21+h5PqdacF0Jjw2/4qGSxu7CD8RVJFRaqeOllaCLGzgK/8ugrAYRfToeDTW/qkPM99VASn
	Odeone6zXrbpRNCm78nlaRvk4oagFrE4+1qZoBXwdSDyS+bacqJx+x6ibxgPghot1LVt7yLgFXg
	bGzvRrhu5Cm6/MTckJx9PUajZXduBBmQVOfgdFopqNI2cTTWMfh2E5Qk=
X-Received: by 2002:a05:600c:154d:b0:4a3:5a42:b2a4 with SMTP id 5b1f17b1804b1-4a96720266bmr144690445e9.12.1793289158295;
        Thu, 29 Oct 2026 08:52:38 -0700 (PDT)
Received: from ernest.hoecke-nb (static-2a02-1368-6200-2fbc-d3e8-e0a5-7e8a-a15c.cust.swissbackbone.net. [2a02:1368:6200:2fbc:d3e8:e0a5:7e8a:a15c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4d8dsm36538183f8f.36.2026.10.29.08.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:52:37 -0700 (PDT)
Date: Thu, 29 Oct 2026 16:52:36 +0100
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: freescale: imx8mp-verdin: Add
 mezzanine OV5640 overlays
Message-ID: <dmtpajvbw7cfrda4msnjvorjt67tycvu7qbsio4irvdydsbxny@mxxqqwht7mzu>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-4-90a30b0b0d55@toradex.com>
 <atp-MEqHMT7F75qn@lizhi-Precision-Tower-5810>
 <zv4gir4qrx62cwyl47cypuk57q7ci4l2piml5cgchhiys2hyli@ubzeh3nw4itu>
 <atvCMGUsLXImGhxZ@SMW015318>
 <ww6nhvo5agqub65eunynauzwkpi7lr2ntbnqhn7xm4nq4hirtf@yceeas6ulqy3>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ww6nhvo5agqub65eunynauzwkpi7lr2ntbnqhn7xm4nq4hirtf@yceeas6ulqy3>

On Sun, Oct 25, 2026 at 12:43:20PM +0100, Ernest Van Hoecke wrote:
> Hi Frank,
> 
> On Fri, Oct 23, 2026 at 03:23:12PM -0500, Frank Li wrote:
> > On Fri, Oct 23, 2026 at 03:51:17PM +0200, Ernest Van Hoecke wrote:
> > > On Thu, Oct 22, 2026 at 05:20:48PM -0400, Frank Li wrote:
> > > > On Thu, Oct 22, 2026 at 04:31:28PM +0200, Ernest Van Hoecke wrote:
> > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > >
> > > > > The Verdin iMX8M Plus exposes its second MIPI CSI-2 interface through the
> > > > > Verdin iMX8M Plus Mezzanine. Add overlays for using a Toradex OV5640 camera
> > > > > on this interface.
> > > > >
> > > > > The mezzanine can route the camera control signals through two jumper
> > > > > configurations. Describe each configuration as a GPIO nexus mapping so the
> > > > > camera description remains independent of the physical routing.
> > > > >
> > > > > The default positions share the native CSI_1 GPIOs and are intended for a
> > > > > single camera. The alternate positions permit simultaneous native and
> > > > > mezzanine cameras, but conflict with the Atmel MXT touchscreen GPIO.
> > > > >
> > > > > The current camera set uses a 27 MHz on-board oscillator. The legacy camera
> > > > > module uses 24 MHz, so provide variants for both.
> > > > >
> > > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
> > > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/Makefile             | 19 ++++++
> > > > >  ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 ++++++
> > > > >  ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
> > > > >  ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 +++++++++++
> > > > >  ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 ++++++++++++
> > > > >  .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++++
> > > >
> > > > why not share with imx8m-verdin-ov5640.dtsi, which is almost the same.
> > > >
> > > > Frank
> > >
> > > Hi Frank,
> > >
> > > Both camera modules have their own oscillator, and the native and
> > > Mezzanine connectors have their own supply, so each overlay describes its
> > > own clock and regulator nodes. They also use a different I2C bus, CSI
> > > receiver and connector. Both overlays are applied together for two
> > > cameras (imx8mp-verdin-wifi-dev-dual-ov5640),
> > 
> > Okay, I see share one imx8m-verdin-ov5640.dtso
> > 
> > > so their node names and
> > > labels must be unique, and a single .dtsi cannot be included twice.
> > 
> > mezzanine actually connect by another connectors ? so it need new one files
> > because current nexus node's limitation.
> >
> 
> Yes, the Mezzanine has its own camera connector, wired to the second
> MIPI CSI-2 receiver of the i.MX8M Plus. Its GPIOs already go through a
> connector nexus of their own, defined in the Mezzanine overlays.
>  
> > Can you make imx8mp-verdin-mezzanine-ov5640.dtsi also standardize, like
> > use unified camera_i2c_2, camera_connector2, compre to imx8m-verdin-ov5640.dtso
> >
> 
> This is possible, but the labels used by imx8m-verdin-ov5640.dtso exist
> because that overlay is shared by Verdin iMX8M Mini and Verdin iMX8M Plus.
> The Mezzanine is specific to the Verdin iMX8M Plus and connects to its
> module-specific pins, which another module could wire differently. New
> labels in the SoM dtsi would become ABI with these overlays as their only
> user, so I would rather not add them. If a future Verdin module shares
> this connector, I will add the labels then.
>  
> > And avoid dtso include dtso file.  Now perfer only include dtsi file.
> > 
> > Frank
> 
> Okay I will go back to only including dtsi in v4 of this series, and
> also for the next SMARC series. Thanks.
> 
> Kind regards,
> Ernest

Hi Frank,

Just a heads-up that I'll be off in November so you can expect these
changes in December, together with v3 of SMARC iMX8MP camera series.

Thanks,
Ernest

