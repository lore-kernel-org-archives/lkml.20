Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A130F390200
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665235; cv=none; b=ZOS2hJJaaAiIhT+y3yc6HHMbmJfWRP3gT/5S7gaPqgtEe5nS0LfYUHGRc4dTqOrQL5wNQ4Vtr5sEScurTfMqZMK+/8rvnHsjqbB7HrNxUFePNGv3YUuLYNPFljjrEZIg79yRtqnI1ogMagnmVmzvpFR4cI21ZKh9q1zkSYanfUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665235; c=relaxed/simple;
	bh=NAnqs6N7n/nAen4EwvyGaHI+I/6sBbz3UyF+MK31NRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMq0hXu6Q1j1ETZZ+uhMRvz8RoK/9nciS9ihBucN7cuBU6Bzig46720jvvTDKrILHEWGUe08snT0oDOGHDAEQqgjmD90Odlb0g+RsJD5rTvpMo6Yg9kFMb0hUNL44Y2rQ14lD7FBnHUDCmXqGqzI24d1eSfiI7kS8uqk717TfEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=JOkq7WUG; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="JOkq7WUG"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaf8415866so4816637a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790665226; x=1791270026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ws2h3bosbvJzvMsBsOio9tc0WwhcuTWN1Wq8pMYYGpY=;
        b=JOkq7WUGbXOvN1cHOm65L1dbgSs8oKijm+yngdaGHQtDfOxATW0WN1OmzCvAqOhMka
         92sO8qNbJIjtz/O59zychUFUzdXVBPLOQxv+6MDavGZQMV54yvrHcscG32vR5/W5nduH
         PUX9CkImo1jfvITwzyL8KD5i4Jo7Jk14yNDwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665226; x=1791270026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ws2h3bosbvJzvMsBsOio9tc0WwhcuTWN1Wq8pMYYGpY=;
        b=l3ceG7bML1QV1lfycwTxlqR08tAUVtudt7GVFXihgA9i7CPW+a8ApxY7gkSQSD8acD
         577UZbOWp5Bv+JSSPMTsSBgcSxCzIeNljLnCfK+2vSVqSFwFpAejrSaLzUDS3u5a0aYf
         ZFPt8CtYfoSGlZ9peDpIgLDDQ/0ZSrlP5YZHBpzqgr2G9wHb4ytXa+nY6PDM8iuN6Jfu
         yrBl1xX2ZGECr8s3VZ/UkxoQMbYQjjTCjQZYAAyZR4rDIljMrIns9A/QZ8sywofCqyUq
         aXo12lqm9pN0AVSNBWr9gA6nU6tM86I5/CUH3m37kWUpZ5kga6560jsWvAEEVOWgQwEk
         /6Tw==
X-Gm-Message-State: AFq9FYJOrzCs/E95Lpt6P6oaDtUzzGDqw1VFuiDDn4JshlBAqTpWdly4
	gnDVPr/wCUyb2UzdXhZPNju5xdg2DmjdXKN8URFd4f2SoG0Dp9N8W+rqnI3P03pSzT0=
X-Gm-Gg: AYBFou0tVKP7NohMXlZxTYqanC4pd5bwQKOc34abIEUyEsxSlZ/UW9XzBqhwvqcw3XM
	2rahjYlfgjnCqeH6hnhzzRENi2xrwXeM9AA8KhrfnGYdZWGJ1MpS0gXxic9t6JwwWbehDEY8HQ+
	m8w5W1kGM9C9+tRSjlTGUMuvXucR1KE7LchvfBgxGtH2yWlFaiGNkbUP+1BW5bdl4BwRGNfISHr
	tUUPWsu2HbSdnYEl4McAwoBbZDwCgJIDPLJ/PwODRzMP7Qb/xg/FOuF2JOQA23XS0hqzwGXToxU
	eShdUGY2UYwhrSRIf1nHZTkqwSPesoW7ogZH/KKszczUxAvga3Qz7VL06TZD4zS41vBsX2IZz5E
	wETHArGtokjvDCifHwtJQQRsye2PMQn3phwlRpVjiiDqhoCE+k0E2GSb/D99AQNyg7VKy47ml8q
	1WVv5XnThQm1iJDejceb4G5fQESMy51exOAT9ck0fK+8Kj5/Kp8YgeRyRVhBgbL1Nc/daCp0hku
	oAO
X-Received: by 2002:a05:6402:a28f:20b0:6aa:e589:87dd with SMTP id 4fb4d7f45d1cf-6aae589896cmr6466271a12.14.1790665225756;
        Tue, 29 Sep 2026 00:00:25 -0700 (PDT)
Received: from carbon.k.g ([85.187.61.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6acb90281besm271310a12.23.2026.09.29.00.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:00:24 -0700 (PDT)
Date: Tue, 29 Sep 2026 10:00:23 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	arnemaximilian.richter@draeger.com, martynas.grybauskas@draeger.com
Subject: Re: [PATCH v2 2/2] arm: dts: nxp: imx: Add devicetree files for M48
Message-ID: <20260929070023.GC10296@carbon.k.g>
References: <20260924183855.1393302-1-petko.manolov@konsulko.com>
 <20260924183855.1393302-3-petko.manolov@konsulko.com>
 <ba275cd1-2d86-4ab1-a6e7-6758ddbc31c9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba275cd1-2d86-4ab1-a6e7-6758ddbc31c9@kernel.org>

On 26-09-28 09:31:56, Dinh Nguyen wrote:
> Hi Petko,
> 
> On 9/24/26 13:38, Petko Manolov wrote:
> > M48 is a heterogeneous board made by Draeger that is based on two
> > independent cpus, that are monitoring each other.  One of them is
> > imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
> > independently off qspi.
> > 
> > This one adds the DT for the two variants of M48 that are based on
> > imx6q and imx6dl.
> > 
> > Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> > ---
> >   arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
> >   .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  23 ++
> >   .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  23 ++
> >   .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 369 ++++++++++++++++++
> >   .../boot/dts/nxp/imx/imx6qp-draeger-m48.dts   |  78 ++++
> >   5 files changed, 495 insertions(+)
> >   create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
> >   create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
> >   create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
> >   create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts
> > 
> > diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> > index 1a2539fa19b4..44b393256235 100644
> > --- a/arch/arm/boot/dts/nxp/imx/Makefile
> > +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> > @@ -220,6 +220,8 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
> >   	imx6q-dmo-edmqmx6.dtb \
> >   	imx6q-dms-ba16.dtb \
> >   	imx6q-ds.dtb \
> > +	imx6q-draeger-m48.dtb \
> > +	imx6dl-draeger-m48.dtb \
> >   	imx6q-emcon-avari.dtb \
> Please remember to run get_maintainer on the file that you're submitting.
> For this case, for the arch/arm/boot/dts/nxp, you need to also Cc'd :

Oops, my bad.  Apologies.

> Frank Li <Frank.Li@nxp.com> (maintainer:ARM/FREESCALE IMX / MXC / LAYERSCAPE
> ARM ARCHIT...)
> Sascha Hauer <s.hauer@pengutronix.de> (maintainer:ARM/FREESCALE IMX / MXC /
> LAYERSCAPE ARM ARCHIT...)
> Pengutronix Kernel Team <kernel@pengutronix.de> (reviewer:ARM/FREESCALE IMX
> / MXC / LAYERSCAPE ARM ARCHIT...)
> Fabio Estevam <festevam@gmail.com> (reviewer:ARM/FREESCALE IMX / MXC /
> LAYERSCAPE ARM ARCHIT...)

Will do.


thanks,
Petko
