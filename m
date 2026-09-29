Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5E4261B8A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790660813; cv=none; b=hGZbna0Er5xk+HBYHOQM8jhM5y7xPZhi6P8cUpWVWLxzRFkOIVN9KdZnvv7FztSkS5xz5Ko+wRSlEyUd1rdrd4hjZzC/NoGT83p/bOmp95qyBQU/jhC6SwqupIz0WUb51dDLQmopf821SMQumWOzyDJQV2sPdp9f/DPYfr9U8jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790660813; c=relaxed/simple;
	bh=19RKWm2TvHXQjaVd9wrtTt2aCydxEIrRty/M6oCetH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zld3C+k4PcXrBur8zFEbzCYBiGwS90bfKXH364hOKwG9XkKOWk8/fLfVOCoU1QR3iArzaQjv65ws4ZNw5pS6XYnwyc17RmWQ2WeRfccsHQXjG4GbYj+am9sq/IPZtPNe6E0MbRkQ7dBYsCBPlGpUq69CASXcoA5FYvtCG9yxrnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaB0vfBl; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaB0vfBl"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so1359937f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790660810; x=1791265610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cHaIQHQAzypExf5bg6wFndJXSrqRhD8ZT8crEHQrTnE=;
        b=BaB0vfBlo/7PaJW4l4T41udt6iHK1H552o96nEoTgIh8SzAxDXdoJpqphPJOUCffn3
         mP9ijqzRJM2NTF2FDuCXVRSBiA97h3buDmV010MYrZ74sAw70DFqVnntdZ5clLDWXf5b
         3D/45FzZn6SLivYPCwiHkEVJx1eC3261s1VSenK92IB5yXMd+VyvG1VAXFB/wMD54HiQ
         G3t1ucEPlNlo7uGuhE1+CJfwD5u9coG9D/UK2HUJ63Rny1uSEtkML19t+1/3muQd6Xi7
         AtyAGQt0eObS8A/6op4DZxSEQv4vTQOMrNX8qpF0aAEOTjk9dgShPqA8CgqBGy/cEhV7
         M73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660810; x=1791265610;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHaIQHQAzypExf5bg6wFndJXSrqRhD8ZT8crEHQrTnE=;
        b=l9mIlraBp4BlcSf+/AgkeTY/SKhvRqx6OCgnXpkknUsE60C+XyzDwm/TaRPnpRcKct
         cf7+tJbGH0ziw5or22mav8TZ4rwxJW+bVleHsAuEwk2P5TJWey6xeKnLAbMvcpJngmQl
         i3Y03unOxqZ0A4v+UJsZT/yErXxq7YYcaeOQwbvITX/gTRoQb8t2ujHN7QiYSXm8DPot
         X/a/Bnb83m1wd3LAS7jPHfYnoWFfUwZ6Y8QK58TRezAupga41xfwV2f5Ng2MuU+yBVEd
         Dfz6jnhCLl2uKH5xBFeaRlguPSCmL2/XW2SGweIt4ptLLxRYpyv5wX1py5pwpHA9J6+E
         f5AA==
X-Forwarded-Encrypted: i=1; AKwUvBz9HqFHBm8PU3giu3+K1YE27QSa7btCGWFJVjWNUSNFLRigztdVXC6VtonLK2N9Mioi8H60qpxiWFZ6wt8=@vger.kernel.org
X-Gm-Message-State: AFuF++meQQILFlB5zpJbtga37Ix1K1AQYl/0PA+nJKP1okNQ3qA/26I+
	ZhWDsUMz2HnW+RTFtPXcIuJCvHL+KtEhP16D0DwEJlo2KQ8afQRjVNkK
X-Gm-Gg: AYBFou1B4TLh1BKjW08hg71OUtsKpuJYER0TmJPUSARFxb4pAxbGfKLAajJ7dCuj5l0
	CieOmoREu7+s+IS4NhGG37gClJiu3zbrhYvjweYvHM9x9FRt/V7FotlvxxEleWnpRKcohwAzm2y
	YKiIf8aenknxkPmGX5xYMQ1Lgn5t8JIdngwNRBgHrNLYESBG3bn3Yn1aKfL6uWbf3Fpdf4EfAxi
	GDek/SKem/USQljVAEZivNvA1U/MgjMeQ/kJtIOCuyJelGn2QAdYga78gJZNefE+x6mEd6//Ode
	o1o4MtuCjeYxVPrrfJCdVm06w2auI3McvA48xOZeBeKpzl8S7okHY3CMEfZLGupJm5eFKtoJ+Mk
	fiAbe3aNpE+GyHpclWnTF46AJpb7Tsj7EWg77LpK+NJkXh2l+wEeLuSiLH4xFUagOZO6k0dkh0W
	G7BX1YTbVnOIx9c4Pfgy8yzr5+J5sJxnIAYy0MgApGumZfVaXsfyp8xYj8aCUtzy6lkyE=
X-Received: by 2002:a05:600c:1550:b0:49f:fefc:7d01 with SMTP id 5b1f17b1804b1-4a00d778f09mr19426275e9.15.1790660810212;
        Mon, 28 Sep 2026 22:46:50 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d45ce1csm32021415e9.3.2026.09.28.22.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 22:46:49 -0700 (PDT)
Date: Tue, 29 Sep 2026 08:46:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: Michael Freidkin <freidkin@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: meson: vdec: size capture planes from the aligned
 canvas
Message-ID: <artQxRR3kJUv-mBF@stanley.mountain>
References: <20260928165045.642354-1-freidkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928165045.642354-1-freidkin@gmail.com>

On Mon, Sep 28, 2026 at 07:50:45PM +0300, Michael Freidkin wrote:
> The decoder writes a whole canvas of ALIGN(width, 32) x ALIGN(height, 32)
> (amvdec_set_canvases()) and reports bytesperline = ALIGN(width, 32), but
> get_output_size() derives sizeimage from the raw width x height.
> 
> When the width is not a multiple of 32 the planes are too small for the
> advertised stride: for 720x360 NV12M the luma plane is 262144 bytes while
> 736 * 360 = 264960 are needed (282624 for the canvas the firmware fills).
> The decoder writes past the buffer, and importing the capture dma-buf
> into DRM fails: drmModeAddFB2() returns -EINVAL, so e.g. Kodi plays the
> sound over a black screen. 1280x720 and 1920x1080 are not affected.
> 
> Size the planes from the aligned canvas the hardware actually uses.
> 
> Tested on an S905X (GXL p212) board with LibreELEC 12 (6.16.0-rc3):
> 720x360 and 1920x1080 H.264 play through V4L2 m2m + DRM PRIME with no
> AddFB2 errors.
> 
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: Michael Freidkin <freidkin@gmail.com>

Reviewed-by: Dan Carpenter <error27@gmail.com>

It would probably be more reliable to just ALIGN() the width and
height at the start so we don't have to do it over and over again.

regards,
dan carpenter

