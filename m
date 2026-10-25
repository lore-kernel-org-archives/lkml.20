Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792928604;
	b=Mn/yTA6IUBc0GpfeoqCBpK2fJyP6ViWqftmZFKSZ1geraUxa0pD+4OH4R1QHO5i0vCHG
	 J3+wd1RBEWbeYJFDmYm0DKqV9eQDFS+5FPTBrCQ2Ajt0cbTz0LfFy9A+DuvEjA6c5lWq3
	 i9g0jNsc6NYz5AXn1+0BxIXMW3bjNo0RcM5SiSOCS/ATyJF4UVg2nYb9Coar7eQadHIEE
	 GjHTmOrsRPFnpgahlUkaAjRWXYM1xP4HE5ffbYEUFcDMazhAZMVFHDhzbyylSfCQtAPj8
	 gm2s1vYHZK1eOnZxY3DiUQlAT8G0EELtCO2KospI34dLcDX3VPDZIWuwFFt54Koxgng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792928604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pNkrUZthoHTKm2i03POzDpLmDVfB4ha/LrHYDPEV1so=;
	b=qa2N0huvPGVy2/jPTomTuMcp572mdQtY5aCNQQaZi7vaJZUOcPkeEzWsMk4mnPAwyb4e
	 S/toNQcXbjgUV942evKICf4dJnMn1syFPrdii78Y6whdz21VREUUnPGbPFR489sfB3Cjc
	 VzSEZkKz2Bbh1T1Qjvj8FFaiifS4iF3UqwdePalv2MoUZtuyxccBXJItCnTbjIPJ0qdG4
	 Den+duCVDW4NTHLyO7zRMcfeayae2ZnmRQkDrWGuCuDH2aDv5zCVk+LUU3V+FjiZwYOX6
	 vo/V0wXfY0sg6JNUT748dI4kDX3O3yKjf/SJpYBc/9AhKaMVM5ASNjMyPb8nb5w6AlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EHLZvwEe;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A76A606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A76A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EHLZvwEe
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so1937775e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792928603; x=1793533403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pNkrUZthoHTKm2i03POzDpLmDVfB4ha/LrHYDPEV1so=;
        b=EHLZvwEeO7vX0aMXE+MoAif2qB+Fvrg5EMeXd9VCq7881nIFb0YtlinenDe4Lp67Zy
         DJUqfpSmX5GnTF08iUgrVDbsP3aLbUC+7JrY+FI2zy6bATNmgixdS9OqFmCk6w5KOCMB
         xD8ODbJpWkB11K9sdNMer3yUNWsuaD2gZ090Oo4HrxOIC2XC6D1DOJCaFwetnXHdLaS3
         em/Wafk8xWjGH1SpeeFz2n/CHs6u/9q0LbUVfsP4Za0Rk29aiPLb9mrTk3yfOU4zNXGP
         vm7Lud85M0r8nMFnrM5GV1/bIZ0/lW5vzunjzYJ78PmNHsWyQSe/AcaEI8tdmzxtJJFL
         VHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792928603; x=1793533403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pNkrUZthoHTKm2i03POzDpLmDVfB4ha/LrHYDPEV1so=;
        b=VAi31IqGwtrrHUTRKIqjHwPn4eP92jLgjTyKQG8iHAh5HnI3AL0TeUDTUWLkk+OOxs
         VJjqmHgdMHvy77JYitVdUHPC8NDruKTF9oOKnR8/MHeXQqHcQgvMsXv35VQk4uY/0KGV
         hQCujfJwVcE0p63pL4OhOfrdIOMvzsC/SDtF4l5YGTWKQHmC5mkn852Gco7ICNE/4rMU
         RQOjoILyJ5bevsyWFB9a5PdTqPB0niM+NJASfTwSNs9jr/4sC0AKvHfIqNY1IG4WBcqh
         t9pSdpvKiBhTXFBv3H1+6KtwRpNgDG8IDB6ai5YZzRqs701K7W4+5EwlsNY0J/mu6KTp
         dLzw==
X-Forwarded-Encrypted: i=1; AKwUvByU29kz+WQddUmVVkrpQHNT7mNkt/QrSwF6QDsWRlHHx2E5X4JXT3NrxRwa4d4cm23rnXHUWmo1CpjvkC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3cfy1tN3vTdK1tQp4Ms4hrZaNUW/CFSfiGH0rUNAbEka6Gq76
	22FQ+H7QZITnIdpaLJy8x3NpruqyOa78xqDXw4dFGkFFZoV0BjycfgY0
X-Gm-Gg: AYBFou0GdEGPp8mOc/l+1KiF2VgtQ4DmxE2fHUCnmDhJEH+8BznzrXi8eIM2XGUqxdy
	HGgHXUhbcHPdEgXCfrPHSUmIUbVZdPsdJaB2fEKbZCNrG++H+qreT55w7LTcmMgb+kVKgmgSuCC
	eW4LygTUq5zDM2kk2V/Dwkaws+JSQY2dH11Bp/JZm3y8+GkcnXrgO9/2Eh9msHhOtrzsvJNwkID
	K/LGob8rl69tBF3AhhGGHmHU4fVISNV4UkKRfc5Kre7TjMfq+dQ+T/y8DvBMYPhV01KrOvYzQ5U
	O523AhIow0A9TgkFDSOP+RhjyDRlzY5z4y6TodU/oDAEflSR19bFX2bKnQynjeExbQ9+IPDVm7V
	8HJztKLT2zcA8Zlp1vWkpPuYboxKur4zapA5HeYFjTlbCCAUESEao75r/piQ7cPRAypv5I6gXf7
	JJq1K1bWr5slYxFHjOB52Em+VeWYFlexwmWAiHHXo8qA3dKji/jqKUEs8kBW1pAT6aa93O1CcyL
	kB+bNiBr6zKeFg/EyRMbcJi+QXQLeF2kNSBQOb7K4Q35EV8L+eR0h7JVdrwnEVln2ws294pEeRA
	at9SUORicKmUyl6m95BkYnLycmPKW952JRyZheCnd0NiNm4Mmln534iE4Cq4ZxlbuToUCsqML0h
	ZcT13ew==
X-Received: by 2002:a05:600c:1c1b:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4a35aae5c48mr75332735e9.0.1792928602528;
        Sun, 25 Oct 2026 04:43:22 -0700 (PDT)
Received: from ernest.hoecke-nb (static-2a02-1368-6200-2fbc-a24b-7223-aeca-a4a6.cust.swissbackbone.net. [2a02:1368:6200:2fbc:a24b:7223:aeca:a4a6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a4cb7bece3sm63901465e9.10.2026.10.25.04.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 04:43:21 -0700 (PDT)
Date: Sun, 25 Oct 2026 12:43:20 +0100
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
Message-ID: <ww6nhvo5agqub65eunynauzwkpi7lr2ntbnqhn7xm4nq4hirtf@yceeas6ulqy3>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-4-90a30b0b0d55@toradex.com>
 <atp-MEqHMT7F75qn@lizhi-Precision-Tower-5810>
 <zv4gir4qrx62cwyl47cypuk57q7ci4l2piml5cgchhiys2hyli@ubzeh3nw4itu>
 <atvCMGUsLXImGhxZ@SMW015318>
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
In-Reply-To: <atvCMGUsLXImGhxZ@SMW015318>

Hi Frank,

On Fri, Oct 23, 2026 at 03:23:12PM -0500, Frank Li wrote:
> On Fri, Oct 23, 2026 at 03:51:17PM +0200, Ernest Van Hoecke wrote:
> > On Thu, Oct 22, 2026 at 05:20:48PM -0400, Frank Li wrote:
> > > On Thu, Oct 22, 2026 at 04:31:28PM +0200, Ernest Van Hoecke wrote:
> > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > >
> > > > The Verdin iMX8M Plus exposes its second MIPI CSI-2 interface through the
> > > > Verdin iMX8M Plus Mezzanine. Add overlays for using a Toradex OV5640 camera
> > > > on this interface.
> > > >
> > > > The mezzanine can route the camera control signals through two jumper
> > > > configurations. Describe each configuration as a GPIO nexus mapping so the
> > > > camera description remains independent of the physical routing.
> > > >
> > > > The default positions share the native CSI_1 GPIOs and are intended for a
> > > > single camera. The alternate positions permit simultaneous native and
> > > > mezzanine cameras, but conflict with the Atmel MXT touchscreen GPIO.
> > > >
> > > > The current camera set uses a 27 MHz on-board oscillator. The legacy camera
> > > > module uses 24 MHz, so provide variants for both.
> > > >
> > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
> > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/Makefile             | 19 ++++++
> > > >  ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 ++++++
> > > >  ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
> > > >  ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 +++++++++++
> > > >  ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 ++++++++++++
> > > >  .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++++
> > >
> > > why not share with imx8m-verdin-ov5640.dtsi, which is almost the same.
> > >
> > > Frank
> >
> > Hi Frank,
> >
> > Both camera modules have their own oscillator, and the native and
> > Mezzanine connectors have their own supply, so each overlay describes its
> > own clock and regulator nodes. They also use a different I2C bus, CSI
> > receiver and connector. Both overlays are applied together for two
> > cameras (imx8mp-verdin-wifi-dev-dual-ov5640),
> 
> Okay, I see share one imx8m-verdin-ov5640.dtso
> 
> > so their node names and
> > labels must be unique, and a single .dtsi cannot be included twice.
> 
> mezzanine actually connect by another connectors ? so it need new one files
> because current nexus node's limitation.
>

Yes, the Mezzanine has its own camera connector, wired to the second
MIPI CSI-2 receiver of the i.MX8M Plus. Its GPIOs already go through a
connector nexus of their own, defined in the Mezzanine overlays.
 
> Can you make imx8mp-verdin-mezzanine-ov5640.dtsi also standardize, like
> use unified camera_i2c_2, camera_connector2, compre to imx8m-verdin-ov5640.dtso
>

This is possible, but the labels used by imx8m-verdin-ov5640.dtso exist
because that overlay is shared by Verdin iMX8M Mini and Verdin iMX8M Plus.
The Mezzanine is specific to the Verdin iMX8M Plus and connects to its
module-specific pins, which another module could wire differently. New
labels in the SoM dtsi would become ABI with these overlays as their only
user, so I would rather not add them. If a future Verdin module shares
this connector, I will add the labels then.
 
> And avoid dtso include dtso file.  Now perfer only include dtsi file.
> 
> Frank

Okay I will go back to only including dtsi in v4 of this series, and
also for the next SMARC series. Thanks.

Kind regards,
Ernest
