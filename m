Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E97542E40C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948169; cv=none; b=jFe+Jp3UpiFZIrr7lEV7K+Dncs20EMZ+wta6QPehLYQCdUI4BJIgOBa4f0FnhJZNJzcxQ78dfaqv6MYd5/PXxQIlJROIfDZIMj649vVUkJAC64VooRq0eUJ4dz6BEq7o3EUDGQhiSQildLs3bVrT6FX3vP/9dpG5X/xYFbfENIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948169; c=relaxed/simple;
	bh=OchIdEjn+9zyXsSLPqUkq2D9FS6GCeBw/7jZURJV5nk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WmLA6n3TV87ECxFX7wn2dpAylOg/Em0rr/XF62Vhcxof12PFxxAIhKZhSPUOkN5iTbGP9g+eacnVqSC39CvEJpjGqRX/6Tp5FNxxabFJ+3A5x1If1WcJCtg7XJcIFjLWSideX1gVN4BLD0Jy+fD2LaI58gJVD7FQcRh2KDNkHzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbJK+yVZ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbJK+yVZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so57521565e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790948164; x=1791552964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hPonh+5e5iUqQrGjcJ4XkpAlG+uU/Emvxd2vkVAt8dQ=;
        b=GbJK+yVZxpOQ4P0CpiIaS/SYNidih/LTvRCtLNFO/kysXB5hkGBJqyAqNzwXh6tx+e
         my0Ywsl67OsnRnyTqVac/lq/TWRMwd90m+uF3QIOqvwCHX5I6JH3/audKgRqFLl5VE8v
         4DJSnCqTa8qI3y+orjOCoGoH/exoZAC+EjdVCj1JOoOIKWr8tMfKwJ9sEZVRhrYJimSz
         HMfgv/e0eQBzzE7y/J73AGP+/54C/hV6HzF20XvRcOTCRO9Lcf4wfvrYIGUVCVHmmSeC
         0xKYT7BvgRGrFMcDulNQhqS1GyFfxUihcAtKBPF3EM8vBoTo7jvHb/zxdQv+9ZqOjkrv
         p2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790948164; x=1791552964;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPonh+5e5iUqQrGjcJ4XkpAlG+uU/Emvxd2vkVAt8dQ=;
        b=CUe+AqlfRyjgbuC62abxOEtd9RqBJg2X2K2k4rdw8uk2S7GkD/jhTtPvNVym0C+SrN
         Oh1xlrlgvOw/03amtd2vivE/OdPoVh7GIgE/7CoF+4iFARrAuUP5vUFuGFzkxu+VYks9
         HrJHqtTWtTkCcDUoXrdevTC78unZK8Iz99shPMBKdIdjUv2v6xbhK7jceZUyIlCnhFYK
         SfVtjQykMDR7qdvLQhQan6iLX7o6Hr5QgJlFaavC4CY3JGhyUnMzxs6dy2NR7HsxgW9r
         g/OPP/u7oTfBStp4a2iaEYVT8eZRP2Ahi3ILx4lt66UxIv4IFD79ha3CqynUWdOBU6fn
         FxlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNBV39mRMy6vEGA7yiNDlGyifFSJW13kZ3P8SPxR0ClQjFLAOhM3pb5YR69A7y+6WUW/jTkrjWY4Mzu9w=@vger.kernel.org
X-Gm-Message-State: AFuF++kLpxSaOtRhtVrrxduCAsSW6qI4ME7Niw4CyHdWH/2Kx1xhV/Sa
	CrIEoI9pM5kS0m+/2sm3hXIo88CyLHFBqk3yXFsKpnnplIsp2s5PISID
X-Gm-Gg: AYBFou3zGphcH9N2JgJxWNWfTvwAs9rhUol4IWrLAZL5AC1r4k0IkxQGcVmm2QOEgN7
	4oQrTmqcuvb83tBrRCHKlAK/jAMcJ3zynZUNl/rBeTVQRizxpxffzMBSsneicprxcuiKu9WkNfg
	MG+Ss8jl7a0w24uhZs2AtGPDx2tf15odpflLj7eG2Yr1VT2B5QZxETqsq8840wxGE265sO1Qak9
	c/Zf/I7BhFMZ0aqo2KNb9ecbIyHpT2o6dqH8YrzhQdWsO4fHW0XagLB+4/P8tfBtwf8fFNUZ/QR
	E4tyvXKVJybGSrUxMfOUrc76qAgwpbwANxgQIFcmKAnE11isl8xIxgV8SKCztCxVRXTbmWJ1Bri
	jXf8Cek1kPfOcAwDaBRM8DtlDT0jAB7UYcc50V0BwWKk4r0/VC4sM5eWRpM5XTb3RwyrmHuBu1n
	tKH+sWRojbvsBGPXBcYY1zPDHsIlBsWn+i6tRCFuuVWVUbUNOpGhS8iAs5JTwuX5plXEoD+VfJq
	TrcijTANXMXW0K6J8Igo6X4eDwryl3SkBzfSNCc5Ej6Qd1hJ0EVolYPM42jaezl3w3K+rxx9iGK
	EA5/cKn6l+/Kxc4ZPWlk68tqsr05GoAVRYcMnIENAXwbOB8ZLgKIpwQDHTxd2+RJJtfS9W8eBRP
	DzLipseeWbxa45CJCLtuShPof6M3eMjiboXlss9OzyJblOH96seU7A5SwPu0EvGPA0aHT4eaFuL
	k5Q+m5
X-Received: by 2002:a05:600c:3b01:b0:49f:ce72:e930 with SMTP id 5b1f17b1804b1-4a02758eed8mr51757895e9.34.1790948163749;
        Fri, 02 Oct 2026 06:36:03 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm98428015e9.13.2026.10.02.06.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:36:03 -0700 (PDT)
Date: Fri, 2 Oct 2026 15:36:02 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Jonathan Cameron <jic23@kernel.org>, Liviu Stan
 <liviu.stan@analog.com>, Arnd Bergmann <arnd@arndb.de>, David Lechner
 <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, "Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= (The Capable Hub)"
 <u.kleine-koenig@baylibre.com>, Pan Chuang <panchuang@vivo.com>, Shi Hao
 <i.shihao.999@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: temperature: ltc2983: avoid -Wstring-compare
 warning
Message-ID: <20261002153602.000032fe@gmail.com>
In-Reply-To: <ar-xsv05s-D6a7Ri@ashevche-desk.local>
References: <20261002124902.3703019-1-arnd@kernel.org>
	<20261002150425.0000286a@gmail.com>
	<ar-xsv05s-D6a7Ri@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 2 Oct 2026 16:29:22 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Fri, Oct 02, 2026 at 03:04:25PM +0200, Joshua Crofts wrote:
> > On Fri,  2 Oct 2026 14:48:51 +0200
> > Arnd Bergmann <arnd@kernel.org> wrote:  
> 
> ...
> 
> > Makes sense.
> > 
> > Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>  
> 
> There is an ongoing discussion about this
> https://lore.kernel.org/linux-iio/20260929-iio-ltc2983-fix-string-compare-v1-1-d67d612d6ddd@gmail.com/
> 

Ah, good point!

-- 
Kind regards,
Joshua Crofts
