Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA623A1A55;
	Fri,  4 Sep 2026 08:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509907; cv=pass; b=t3O6bsYXtqzMgfyScTnvk2Stl4rbtPCHJIefBH55DbJ4WT7H2j805LOOd51OOFYXDZVzNgVl3MYkKoccIVYORquba7awim9CaeEB4A31cRp9jI9eEjAA8ydfSekgMW6rtQ7ZRBRxUQ4lKuvu3Ku5GOa1I6crBqi21V4JAUCw76w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509907; c=relaxed/simple;
	bh=Q2lKXmCTbe1Fz0DrCOCH3mugDRzyXRk4F6M5NHTm9MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKUhWlOQ9s/wT+GlnGjDD9BmiUuwTrAQAb/CFtlnxtrtwdi0T/zXHzi0O6KLQWoX1/GUILJ1mlNoL5m7NrKzqN2Smeq2NuL7j9LOlttffnqQ46AkSNbt1P01OXfPzMXYewy8o3AMrJeR3iUDq0qVvVJcV6GAQ311H5t6JsuK3js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=YvXU9++w; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="YvXU9++w"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hbq961BhszyYR;
	Fri, 04 Sep 2026 11:18:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1788509898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kqEFpalpmG+kyV6JyFplYt2g7pNcxElzmsOOdBJo430=;
	b=YvXU9++wQmpi9RGyg/yK+zy4uFATFFBz5ePUEgSJlGV2bpv+ke4bKim4A3pDj1yQ2iQmyA
	+xJ17WwQnweVSonrXe/VhJSs1jId22J+txrjiKX+SkuTsSkpNbGh5QqLs3JYCKGUOI+OLm
	e++LNtfvaJu+alh6gFfMVEyixRFrhks=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1788509898;
	b=rrUJV69z6l8Vn1+LP/HJ3dabbxFo5ISnTfnoQbCQMx+tWPLh0Iy1n3BA/ts5++sTauMJq+
	lRpPREJNEXfS5hcbiUhtKAd7K2ipKf9ahd2BKzq9wD9A7NVY97ooXhfr52ZuDig1DvIG9q
	SEWUj67Rn/xPhIH2Xizu0fSjYBPn2+k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1788509898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kqEFpalpmG+kyV6JyFplYt2g7pNcxElzmsOOdBJo430=;
	b=i1cI5dvC54128hN8BDcv7b1P24WCiBnhntQJrrETQquOOy6JSOCPh0FHEnmf0jcv1Du2lb
	3zbPSht7KEr/n9rVGEr2Sec4rOX542fPDdOGWjG4oSvfJx5PJYLgJ6NYfhkxZXOgFv5omE
	/lU2bK9a4NT3ktBejf0qYxEBJNvV0cQ=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 98F05634C5B;
	Fri, 04 Sep 2026 11:18:16 +0300 (EEST)
Date: Fri, 4 Sep 2026 11:18:16 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Kate Hsuan <hpa@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: i2c: imx471: Add line length PCK setting
Message-ID: <app-yOyzA32vQE7e@valkosipuli.retiisi.eu>
References: <20260904075113.125751-1-hpa@redhat.com>
 <20260904075113.125751-2-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904075113.125751-2-hpa@redhat.com>

Hi Kate,

On Fri, Sep 04, 2026 at 03:51:11PM +0800, Kate Hsuan wrote:
> Add the line length PCK setting to the IMX471 driver. This parameter
> determines the horizontal line scan duration and is used to calculate
> and control the sensor frame rate.
> Set the line length PCK value to 0x0a00 (matching the original value
> in ipu6-drivers), which maintains a frame rate close to the datasheet
> spec (~150 FPS in 2328x1304 binning mode).

This fits on fewer lines, please rewrap.

> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  drivers/media/i2c/imx471.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> index 4053aed84340..3c939f2a9056 100644
> --- a/drivers/media/i2c/imx471.c
> +++ b/drivers/media/i2c/imx471.c
> @@ -91,6 +91,7 @@
>  #define IMX471_CSI_2_LANE_MODE			1
>  #define IMX471_CSI_4_LANE_MODE			3
>  
> +#define IMX471_REG_LINE_LENGTH_PCK		CCI_REG16(0x0342)
>  #define IMX471_REG_X_ADD_STA			CCI_REG16(0x0344)
>  #define IMX471_REG_Y_ADD_STA			CCI_REG16(0x0346)
>  #define IMX471_REG_X_ADD_END			CCI_REG16(0x0348)
> @@ -240,6 +241,7 @@ static const struct cci_reg_sequence mode_1928x1088_regs[] = {
>  	{ CCI_REG8(0x030d), 0x02 },
>  	{ CCI_REG8(0x030e), 0x00 },
>  	{ CCI_REG8(0x030f), 0x53 },
> +	{ IMX471_REG_LINE_LENGTH_PCK, 2560 },

The register definition is nice but there's already a control for this.
Could you do this via s_ctrl()?

There's also another set addressing related issues here
<URL:https://lore.kernel.org/linux-media/20260904075113.125751-1-hpa@redhat.com/T/#t>.

>  	{ IMX471_REG_PLL_MULT_DRIV, IMX471_PLL_DUAL },
>  	{ CCI_REG8(0x3f4c), 0x81 },
>  	{ CCI_REG8(0x3f4d), 0x81 },

-- 
Regards,

Sakari Ailus
