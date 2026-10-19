Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F63286A0
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405377; cv=none; b=TT8wAiTEa86lDUyhqGduJh3+dMvOYgyOUDHP7Nqs/D5qUdD6Nf7Shv+58wtclHdwGX+/Xfwl1FNq5uFCZzKwqhhXNDrJDLdJZySXlv7xpIsfkqKmKd5i/elP7r5MtAPHgrEyl6mC2E9ggBLsjAMJ2w86blo7VEGCIAbBRsyG40w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405377; c=relaxed/simple;
	bh=kUUpPsTxPIwjQ86JF12+BW4PvPq7GSCiTMS+HGO3pjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyH96rCyo6q5poCodlgRG9QS1qcT3O7C0Iv6LDgb/o7ZiEkV7sLM/1EPpi9TIAn1YJBb5XsBpkIoCmYWHn8MDXv1oLLGog3INU6nUpqyUN/E0sRq4NUPvsitDliyaT2bZV0csmGoU6m5wB9+EhQW3WCTYNrEvh/BUiCu8ePgrww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rx/2N+Kh; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rx/2N+Kh"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e011d370dso1610126f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405374; x=1793010174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DcQm1UppAernfyJDNeazwp3tPSiXo5FxZGSLgNLJYCQ=;
        b=Rx/2N+Khk5VuaCJn5nr35VcNWoeVIYme0SiITGhegjp/vCFvyIeIMZ9UL7EZM9puem
         JChFwxkq9V6zjZ/lZZS7aCkkC+bco0MwbCknAS5uwb7geLd9jKe9Xc6TG3B2+D6RCMb7
         /sMu5vqpEX0lWssTRXf31x2O/2SEPLyYgcgQtn44cLomOk5Tr6SfNDLL5wq1qXVEyp1f
         ro2aQhg+kyX5fs7T5SItQOVmF5mT4lqetpLgy9Y0S/82qouOhlCfVW9KpvHWcU7YeKBE
         vJNQTIQhaDnAaCyJUfKkYcjn4dIqQcpKwv/mrcr5TLKqfuOw8lZNh/8PK0zbXlWnsWh/
         ToTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405374; x=1793010174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcQm1UppAernfyJDNeazwp3tPSiXo5FxZGSLgNLJYCQ=;
        b=VLRdBJiY0/ByH9TvKRCCuMrnccX32hKAlVUedQpHDiI9EMWwxmLEmMeTQCHotiL5aT
         8vCXRGFHYU8DrY7+tvLmhIA8otssYShQXxNaF/OmpvYIi3Z3AcC3Xo1/PIhQfexZNUd3
         /wXsIj94FOpZjprea49EGi4A2jMhfT6BmBgLDEtbcsRQPXksSyvyCQIgCngktzZ4AUiY
         fyXonXOBc5WtXV+vB0dZUOORteatzUtLztSKtAC15j0hPAdeV0cRMpkv1jkjvKhRdhpV
         FH/C4/BJgwnJtc4Hou5o0ZOXXblKsKlmr7+w2j8QgcSc8odo4lUeUZcT5T28yQhIbue6
         5vGg==
X-Forwarded-Encrypted: i=1; AKwUvBzeNtOJ26Z7n+cEWtNiypalXi1mWkx6eGbxF3IbNbCDUE+AC11Xu3LgkcFJPO5dt45XhCVpQHflT/2OFH8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvg+Xg8wlfCvkXlf/UlwdNF6edE2CZ0kygkwknnFhcPqJ5p1QW
	C92YWVNEOkk4ZKScIJl1dlpZ8ZOJPkt2dek4zCFX1HWAXxKEyMBARY1e
X-Gm-Gg: AYBFou2sogeWSCqNjByU6qytc8os1GXKUddUh8GQ+d1+ZvEmAoo/cFMs7nIC+UEXhzc
	OQPK1UJGm1MYvAYrIEmoLM1jqaxXVy1ozRHwn0SjYrEPZso3y8xQis3My5GViMJTW1FLCubSW5f
	j7LR4BJszz1NffHoHlQ3sUtb/wNBMmDGyAq+578PI1xeGDs2c7tKNTPzx2lozyW4+Whgu2DZgZJ
	2XZ5JKaGbGLMLL02TxtvanlA/LwFHyEFAWblhIudEhrX82+o6c1WpOGDssP+MJckVr1zUZz+ZCK
	5cFQDgjBc8gbZ45GSkOFkBILq89xOrEfCzl+xJlXN5lmtKDrLW4C7MxkuvWdlO9hPeXgLdjgt1F
	PIyN279pUOh+Owgg43n48hO44P3NvQbEL/KD5teLSLpX77T32D0nRbKJyp1Ur39Ckqofn/jiiHc
	0ODeXru21MjtrevhGlXKkLNiBhC0bwfCkvhN6bOIZfJTn9WYp24h1BBW0e3RqERCidlQTXm9kNv
	V8q7FXta5cZ+eg9bdMW/s4Qtxhd/9uFQTY3fIrZy+RAiNPkvxIzkVBBbRUhdVFVqia0ZyYlpZ+c
	ftz1LJ6xhGiZqagTmU1FiYgjQjHzj+asRkGzpXg=
X-Received: by 2002:a05:6000:2889:b0:48d:f14a:9179 with SMTP id ffacd0b85a97d-48e07fadef3mr14864487f8f.48.1792405373733;
        Mon, 19 Oct 2026 03:22:53 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a64sm23771242f8f.6.2026.10.19.03.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:22:52 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:22:50 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mm-var-dart-sonata: Add OV5640
 camera support
Message-ID: <atXver4B2Acc3z0w@Lord-Beerus.station>
References: <20261015162301.63838-1-stefano.r@variscite.com>
 <atEci_KwxUdvAekv@SMW015318>
 <atJY6DzjmAeq7U8q@Lord-Beerus.station>
 <atKHI1B0hL6q-CmY@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atKHI1B0hL6q-CmY@SMW015318>

On Fri, Oct 16, 2026 at 03:20:51PM -0500, Frank Li wrote:
> On Fri, Oct 16, 2026 at 07:03:36PM +0200, Stefano Radaelli wrote:
> > On Thu, Oct 15, 2026 at 01:33:47PM -0500, Frank Li wrote:
> > > On Thu, Oct 15, 2026 at 06:23:01PM +0200, Stefano Radaelli wrote:
> > > > From: Stefano Radaelli <stefano.r@variscite.com>
> > > >
> > > > Add support for the OV5640 camera connected to the Sonata carrier
> > > > board's first MIPI CSI port.
> > >
> > > Does this board only support ov5640 camera? Suppose ov5640 module also use
> > > for other boards.
> > >
> > > Can you refer https://lore.kernel.org/imx/20261011-expulsion-frivolous-690de090cf9d@spud/
> > > to define connectors?
> > >
> > > Frank
> > >
> >
> > Hi Frank,
> >
> > Thanks for your feedback! I looked at the Toradex approach you linked.
> >
> > In our case, the same connector can also accommodate Basler cameras and
> > potentially other camera modules in the future, while some of our other
> > carrier boards use different connectors.
> >
> > Given these differences, I would prefer to keep the classic approach proposed
> > in this patch, describing the camera directly in the carrier board DTS.
> > Do you think we should still use connector bindings in our case?
> > If so, how would you suggest handling these differences?
> 
> Need understand whole board familar, basic Two problem:
> 
>  	Does carrier board support difference kinds camera?
> 
> 	Does carrier board or camera module reused for other boards?
> 
> Frank
> 

Hi Frank,

Yes to both:

- The carrier board supports different cameras: we currently support
  OV5640 and Basler modules, and support for another camera is planned.
- The OV5640 module can be used on multiple carrier boards that share
  the same camera connector.
  Other carrier boards in our family use a different connector.

Given these combinations, would you consider reasonable keeping the
camera described directly in the carrier board DTS as proposed in this patch?
This would avoid adding complexity across the different configurations.

If you still recommend connector bindings, how would you suggest
structuring them to handle these differences?

Thank you so much for your help,
Best Regards,
Stefano
