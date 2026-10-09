Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DD026FD9B;
	Fri,  9 Oct 2026 09:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539302; cv=none; b=M8uM+8kd6D8asfzBOsCbTeOBzJ6quWxC4eR5S6S46jvk2oI+JwRmrJeJMyt2FrL8+gWmWjdrthOc1yNQU2kcYMkJ2osVP74ebnrF1LMt5CgCvBKfMyJmmD2OH7gxEcXn5cyTM0Scyx4eXFrl0KwGGbezkjlopL41FanvCbDMDWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539302; c=relaxed/simple;
	bh=ErWMFSDbQ2GGEsU1rI3PS0J1qXXlm/3UyaZhII7AmRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQll2tvFOa/tEG6QQfAfbn0X4hWt6N9eBw18m3zrpAB2PdOircc2HJKwzpFvVn2PaOC6W/KdzxbaPTsqSQIoFrKo47QcLXL8yIgmIHmAKdh8+QLx+ZqvdT5QaX/TXAnPdrFVbdjADU9j4t4zbwWHjwHQVQGY4Yv8u4Cw/MaAcZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h2VBY31D; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h2VBY31D"
Received: from killaraus.ideasonboard.com (dynamic-2a00-1028-8389-0276-8139-a635-2d39-b80f.ipv6.o2.cz [IPv6:2a00:1028:8389:276:8139:a635:2d39:b80f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACE9F24A;
	Fri,  9 Oct 2026 11:46:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791539180;
	bh=ErWMFSDbQ2GGEsU1rI3PS0J1qXXlm/3UyaZhII7AmRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2VBY31DwvytG3YSmMZmtzz04KJbwPiXIAdKleSs6RyPikYoR+zfNmHOahdPtbZ4m
	 4wTYQuoNyO2mBEz8T3XLgtH967xzqSVyCERY32CNfLmumImwqn021+x46zgsbVlm3h
	 7UmeyKkdebqrJUoMWWY6YEWsDm6j73Mjsa1amh8A=
Date: Fri, 9 Oct 2026 11:48:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicola Fiorillo <nicfio@gmail.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: i2c: Add GC5035 image sensor driver
Message-ID: <20261009094818.GB693830@killaraus.ideasonboard.com>
References: <20261009072733.39877-1-nicfio@gmail.com>
 <20261009072733.39877-2-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009072733.39877-2-nicfio@gmail.com>

On Fri, Oct 09, 2026 at 09:27:31AM +0200, Nicola Fiorillo wrote:
> Add a driver for the GalaxyCore GC5035, a 5 Mpixel raw Bayer sensor with
> a two lane MIPI CSI-2 interface. The driver supports a single 2592x1944
> mode, and the exposure, analogue gain, vertical blanking and test pattern
> controls.

Please make the driver freely configurable, with support for analog crop
(and binning if supported by the device).

> The register tables come from the Alder Lake-M driver in
> intel/ipu6-drivers, which derives from the ChromeOS driver posted in 2020.
> 
> Assisted-by: claude-opus-5-5 coccinelle sparse smatch
> Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
> ---
>  MAINTAINERS                |   6 +
>  drivers/media/i2c/Kconfig  |  10 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/gc5035.c | 953 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 970 insertions(+)
>  create mode 100644 drivers/media/i2c/gc5035.c

-- 
Regards,

Laurent Pinchart
