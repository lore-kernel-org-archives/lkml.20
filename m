Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806654;
	b=Kz3OFbdcUYiBBWlsPNdyoe9gCHmBXLjExOpGL0G9yZixF/ra1NVNC5Hx6rgANH4osqWt
	 4rACkxanLcO4MjM5UUD2WO73BxahPrFEwXcOxGhTqUhD+VWuvHyHmHclIPoljBdlGZJic
	 LgAwOZeel+OHRHWeW+1UCEFJ90MrLjR8rtPV3nGjFGqAKOHCOPFVg+0zGpJ17sqBvubgi
	 EGVdOg1USvlsgm9PwJOyoReqHgCsM9HW2YL1W2h2kqzNX2MvaVCFCnwr4P/bV59Gr52AD
	 nMARAVv8ehpXL4kX8IgMiTFf9KSwQU1UAJobU7ngLC1+0F5QCPYEKW0Jvf2A5LoSLNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nETJmKCVqPlTrkNAEmg4/bOwp28yMSUgmfSsOnU7Qbw=;
	b=ZelUZLiD45Kax6/lqjH6c9kSCaw3rr7lSrHY7amCfY5f4xxWl0wrewcbQmX8zaOfD9qv
	 wuYDxWIcvySPHaS9rc8b9aBHXHufzT8sPCyKiicqWGfG6rW7XPuGme3Pne2rz7JlfKaY4
	 1bNZ/GnwWdDBZJ0wih/wgFSpfz1qflKdKVHXDwC9E8M6ts5inHztlPxrUrEvL+mG2vr9f
	 xdWbYGN4+M9BkjrTItcYbtSiuy4Lo1ZZs8Z036xKwlxSujFhxNu2/aNPg/OfO/E3Z1VVJ
	 IUe/NX8iwHlEwniJJWLCDXcSkci/kEUEyaV+WNgl55H/FAJT2dsvfdztmIueXcp077w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B7XoiCVB;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FED606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22FED606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B7XoiCVB
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1411853f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794806652; x=1795411452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nETJmKCVqPlTrkNAEmg4/bOwp28yMSUgmfSsOnU7Qbw=;
        b=B7XoiCVBWcLLauFc4QQM/czqNFSGW1NPGEfC+PyLmIqjrGv1oyrbV/aVLl6zGTvISY
         mXsfDCE4NkfbirtgGxoAe3r5ZJ2pFCadwgOvvA73ODxZMbLJ3t0AGec7DKCvU5vvQPIS
         hQsfJOOHDDQ26/tEpqe4AYDkTinH3kqYEldVRAl2ShxhnOKGWBm0SZlUx+tvh318kmI+
         +kpKyUGjpB2S8IAoK/fVAH24W01WgTtGLEQThqfETm5D3u8eGhSVwS7cq0ZAjo/6u7UC
         4eYSgPjmbTzW35oP8Yb4JsqZBZCUfeBam8p/y8NtkVw9SIFOO4ghTbXX2FynX7L+0d7x
         qkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806652; x=1795411452;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nETJmKCVqPlTrkNAEmg4/bOwp28yMSUgmfSsOnU7Qbw=;
        b=I4BWWWPlyStFrfqopUN0auo0mMlc3SsNMhVM5yogleeu/itA7+JBWo1BHZxGPJIcPm
         FJNvj3U2vKFMcM2wiIPm/9scArxLIDMIKRppEz+age9DMR/XXM9rSQEf+nOhPAkWaRF/
         BDQhz0UHhhXTnfiHPXjKLYf6NaiT/CfxUFHvhzUoiuMS7DzGO784z11byQALXHaAFIBJ
         JSZGbaTlVy1uJ9XQdoUANUqWkZmr4Mr584p3hgz31d5cpi2Q8lZM6iGX79utnpWAQaah
         762KiWIcBwXBbwKPey79TJ5UtGcvz1IXTkFKgXHurfZ1Px5wNq83bRl8gca7nGrZD1d/
         cXhw==
X-Forwarded-Encrypted: i=1; AL+hErHeJhE7KkL+SwtiIl7VO8wgmvTm+zfWBYAj+aBsQYQM2LZ7iY7RfBuVQG6ymgqohTnhYsw+HlqwsFtTdM4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cRk3eU9mnNNP0SXrFRxA6Yn87sivciCC+Yk7uR0oe32sMzITG
	qc1BLykpcULUWE0GsrS6E4K+nPiRnTyhTKSHE3yaFz2/Ao6DtuNz0g4y
X-Gm-Gg: AYBFou23FaKAq29bSegti+/MH0oABcF1NAwZ+q9j9Eazmepr/6Va5oPaan9APFfJug8
	bCgYKyP1cvziakVQw5G3mQmI/O1ZNN2VrYP3ca4KcfiVAVizjE1Yg2ZtdMoG7iPTYs/2tP/MM0W
	4/K4UTib7aAMIKZK5Aozd3ctHblv6q6r00zzCxRgvRJWaC3OLMmQtduoQLMVrjfTypeL0I1nTRY
	Lta7Or2vWswn1/UoFeVGi2dALu5cCxSImre5DwXNouliw0UQHQHKQHQZ6lAwZZFDDmTjFJ1tU7c
	hvtCpoVXD9WyvFAm5nSKreNCqaspi7IiGFNnrRiKHhe6IijT4HRapQ/eoxpxmXy4YViGM7Lvay4
	OBKXTLmk2OPW2Can13udTqBDBCrVYi0Xnb557pbWlRDq8KfYAcOwOAdVU4F0aP2ySWO0PqBDMSH
	o3eZGahSDFfDhSEKiPtfLxjMuXIg6/wiKHrAa9m692tieqDN/RzzLvgxk9EOQgkO1eYzmpAAdYw
	LsHW1vl7WxNOPAhVR5XZHdvYy5YGvgCUj/EykjaOjgRZayow/RRVlHsmsOx9hW+g6O2EbAmJXH9
	hJJ057r3i4xyODpRThYJBNGy13R+psMrLgVkdYS/soI6h57ydOFRYG2m17i4piyRwtNUeyucNtN
	KnOovqv51s4PiCtNm1g60EpSrpfllZ8Z2WbR1J/4RTr9lHJjFpnoClmSRf5CwwS4OlOw=
X-Received: by 2002:a05:600c:4ecd:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb5599a73fmr224061135e9.0.1794806652295;
        Sun, 15 Nov 2026 21:24:12 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb64ec7b58sm194039565e9.5.2026.11.15.21.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:24:10 -0800 (PST)
Date: Mon, 16 Nov 2026 08:24:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Leon Pelzmann <brunonick1801@gmail.com>, sudipm.mukherjee@gmail.com
Cc: gregkh@linuxfoundation.org, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: remove ineffective sw_i2c_wait() busy
 loop
Message-ID: <avqTdwA-2E_-lKL9@stanley.mountain>
References: <20261115215427.112315-1-brunonick1801@gmail.com>
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
In-Reply-To: <20261115215427.112315-1-brunonick1801@gmail.com>

Sudip, Is anyone still using this driver?

On Sun, Nov 15, 2026 at 10:54:27PM +0100, Leon Pelzmann wrote:
> sw_i2c_wait() is meant to insert a delay between the bit-banged I2C
> operations, but it only consists of a loop that computes a value into
> a local variable which is never read. The loop has no side effects, so
> the compiler removes it entirely and the function compiles to nothing.
> With W=1 this also triggers:
> 
>   ddk750_swi2c.c:95:16: error: variable 'tmp' set but not used
>   [-Werror=unused-but-set-variable=]
> 
> Remove the function and all of its call sites. The I2C timing is not
> changed by this: the object code of ddk750_swi2c.o (x86_64, gcc,
> allmodconfig) is identical before and after this change.
> 
> The W=1 warning was found by building the driver, and the change was
> prepared with the help of an AI coding assistant (Claude); it was
> verified by comparing the objdump output before and after the change.
> 
> Signed-off-by: Leon Pelzmann <brunonick1801@gmail.com>
> ---

This driver is old and when it was written the loop did add a delay.
It does the silly stuff to hide that the loop is a no-op from the
compiler but then compilers got clever and saw that it still a no-op.

The busy loop was added based on testing and is presumably required.

Your patch doesn't break the driver but it disguises the bug to make it
look as if the driver works.  We don't want that.  We want the bugs to
be obvious.

We have some guesses as to how to fix the driver, but actually we can't
do it without testing so we are in a bind.  We can't move forward
without testing.  To be honest, the most likely way forward is to remove
the driver if no one is using it.

regards,
dan carpenter

