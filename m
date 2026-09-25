Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833114A386D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344429; cv=none; b=oomnn1NOhKNxAN3K/VW392IgRkCjdg4n5UOsdpbpB512UFeb7qnFd179I+MBqh4Z4RZYM0FlpxlrbdhDFwIxwQOJSvJAbchA/ji11/sw5c3ObCmXh/GfVkpIFvYbNh2gISvTIzp8LyD8F/dwGEQP9QGpFlUsr11iU5m9hb38S4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344429; c=relaxed/simple;
	bh=hNw6vrHbhx2PblfWwARxPslf5MioPjYbwh4EEsJ1w7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDg6U7pSpBd7CvAnR9REsNst2oExw5niZQCErFs+xlmRgEDwVzb6f44xpv7tfKlAryJj9iDQyLxc/9lED4Ky9lmzeK3e4ObVQ6cTBhUIwM0SID2q3hcmeCk03E9gK+0Og2pnJXkKfiCNMSPXwLl7jdTx0EqiMC1ukXqGLeDLtOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQ9muwFj; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQ9muwFj"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso510906b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790344427; x=1790949227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XdrXdgsFzarfUhjEFq1mXLUok84uZ5SW2Q9gL7YwPb4=;
        b=nQ9muwFjCB8DFVOejEprVOhZXlOcf8jxTyJvfDaW0q/CWONpY0zSkeRLrXeqQu0zlH
         thU5H7Ob1lVu0qByqV9kmsH+BoD4+tAVLDeD0QTzljgZkDCZZ7cMstjscaJiuFELrXgk
         kV6dnDl+sdvY/VC0LBqKhjx7GyjFcjPpOE8/xADZfF+LXzVf2VyXX1mJMtBVQ0F36Jit
         4bNhbxHWMJCexnpR3t0+hpXkPxv/mRs20Iq25AOU1OgNwNXps+ira3n7XftkJcexy401
         jo+jhhS6rxNnctnMQRYsdkVSatzlVVkj1I9atvG28borFv9NXTbi/w20UTKLj1l5nK+O
         UKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790344427; x=1790949227;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XdrXdgsFzarfUhjEFq1mXLUok84uZ5SW2Q9gL7YwPb4=;
        b=xySpZ499IkUqgx80NvQr0upL8//ChN4dCE2mPDXDlZcBl45inNeCBM/KPDro9MLj7H
         VNlloeSGUkLlRLHKkkhMOCXqiCVtwKEfrS+wVbmeJ6qc8BSdyVSmiu5Qp95X34PomuCI
         hkyU8FSGV0ZOwBp7Fo6a69A9QaAAyy2zjEN5shc72Wy9awuw0mlPC4w5u1tNqvgCfWaa
         QqxECxFpaTkY2FoiTKToCIIAymU9noBGaVcHsqqqJoaRLKXnhB+s9qDlffKBrw3LGrdS
         +/48ny/CoY5IWf33F20Qwq3hcP4CHNHQuK6Z85Q61FiIEevwC7Kkes3blPdSSFoxpVH3
         1rtA==
X-Forwarded-Encrypted: i=1; AKwUvBz+Rp1ssH171dC+5vHeImJXr//xW36zmeUlrlwKTNzqCwLQ9YtBBdXxl3hygXe/sx79LCII8UzN7ZMV734=@vger.kernel.org
X-Gm-Message-State: AFuF++ltaCt1ilNAq868J7nK+6TEw0+Anyi043+KDQcFCI8s3xX30Vdt
	jAkL/4GG3P1s471i848OLiUmQwTik/9T/TBBdigZEGKjBJ1ER0vCU+Yy
X-Gm-Gg: AYBFou3EEpm0MLSnfMnooOpJNKeb8BLulmjztzUfvvQLA8vsMSLj2URzfgDUBNMwRFr
	k3uASFLsULSArhSi9p8sw0rEJVloLk+42yhVg+bUtnkF/3WvP+31fVIUjSBjOfvf1fCUT86J9OA
	paIbI3VLPD0+XVrllFmiuyHKlvgb/YyBmqcTtVRUdGWwQ7cSpvO7zwmH0fhGVQ4weGfse10wenM
	1SxPwK5Yv46/F/W04dRQuf5eMBhTH16rxzJjNRCwNaMUBOu6535XCdwSaefcFh5OzDK9qCkNvQv
	APb1mSL3tT6pFCvZjCGISig8rPLHkhjiVGlVXT0HZHAVXi9CTlwN/4D/LD3GKtjxMi3iELGLtyw
	VpIYLYGwGPAZEpDFA6XZ4A7R0n9rfn6h/vc0LmzUIGWele8Eegz2ZXcx3kQ1n/VGxT4oPedl4r/
	Mbh83ivfl6zzomQQtMUgmY1/GEbZhBXGbpMWvT1Seee13Wv6E2tnYLOV1B+DMbR6IQ0J4TGGzT0
	nwPHeXKzv4J
X-Received: by 2002:a05:6a00:6c88:b0:868:f29f:67c9 with SMTP id d2e1a72fcca58-87e9899515bmr4754627b3a.9.1790344426713;
        Fri, 25 Sep 2026 06:53:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea888b10sm1160362b3a.29.2026.09.25.06.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:53:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 06:53:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Colin Huang <u8813345@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/isl68137): Add Renesas RAA229639
 and RAA229640
Message-ID: <6c0a8e93-9fe3-4389-8d59-08df49cc54e4@roeck-us.net>
References: <20260921-add-raa229639-and-raa229640-v3-0-b104ee8a70b2@gmail.com>
 <20260921-add-raa229639-and-raa229640-v3-2-b104ee8a70b2@gmail.com>
 <20260925-hysterical-otter-of-courage-bc6ab0@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-hysterical-otter-of-courage-bc6ab0@quoll>

On Fri, Sep 25, 2026 at 03:06:51PM +0200, Krzysztof Kozlowski wrote:
> On Mon, Sep 21, 2026 at 03:16:36PM +0800, Colin Huang wrote:
> > Add support for the Renesas RAA229639 and RAA229640 PMBus
> > voltage regulator devices.
> > 
> > Both devices are supported by the existing raa_dmpvr2_2rail_nontc
> > driver variant, so no functional changes are required beyond
> > adding the corresponding device IDs and OF match entries.
> > 
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  drivers/hwmon/pmbus/isl68137.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> > index 2f7f825bfb69..15b4e3f15f11 100644
> > --- a/drivers/hwmon/pmbus/isl68137.c
> > +++ b/drivers/hwmon/pmbus/isl68137.c
> > @@ -456,6 +456,8 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
> >  	{ .name = "raa229004", .driver_data = raa_dmpvr2_2rail },
> >  	{ .name = "raa229141", .driver_data = raa_dmpvr2_2rail_pmbus },
> >  	{ .name = "raa229621", .driver_data = raa_dmpvr2_2rail },
> > +	{ .name = "raa229639", .driver_data = raa_dmpvr2_2rail_nontc },
> > +	{ .name = "raa229640", .driver_data = raa_dmpvr2_2rail_nontc },
> 
> The entire point of fallback is to avoid this change. Why do you need
> this?
> 

I personally like to have it for this driver because it makes it easy to
track which device require which configuration without having to track down
devicetree fallbacks.

Guenter
