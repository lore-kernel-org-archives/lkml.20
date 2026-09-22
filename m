Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834AB562610
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093180; cv=none; b=BDuohERavAxXsEo1lL/BqriNV8+B85FOcdw3jiZA+8BPHm0QqqQKfhpKpUhuvRLbEXTLRUU/95S/Szh/lFDwVRMw3B1O1d/VSyD/bAR7/CwCt2OVh4Nyy/Fs+ZeNqhyZq9bWgoY7kVMIUAwdgSb5dPQNggCpLSitHG7QQsv2w2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093180; c=relaxed/simple;
	bh=AmGEvpoEhurmj8yaGnkYLsgknvbqePnIdxyWbvNO7Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWREBaKMFzEtyMJ8+xbERB5s32CMXImXRWSRbZd2unKpb/XRKmXfpUuavim/dREBSCnrzMvC6em7+BHPFuu4Ag5A1z/yhw/gJcjxyIngl6JWNl7FmCleXGI8RXnpCARN9DZI88wcrfQeX1bSPHrlu7najgZerAUliZY9dtSIN9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWs+ME5h; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWs+ME5h"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f88so75745f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790093177; x=1790697977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SkKczT0xLYYsxaNg2GK8Ovzvtfa19Alb51sjGmOPMSI=;
        b=dWs+ME5hJJU7v/lbt19smnzGKYRI0CR5N0PJVFYHBoPelJC2TXcFWrG6EIADgn6fzm
         27F5rXlLIvRf2gN/YOCLyILBjpvgAq7+vX/BWX0G21rDycbKxma7INEJBIcCRzPf3xkN
         4VfbmiXSi8moLgoE1diwxGTXMdpy7g29J+gxTB2eOXO9nSXDPe3DL6DxXZBmb9oT3WlP
         Nc7JhMIPtLB4MRkjjoSiqXbpk8NkNWx2j/CHVLwc3oO1fav6TUOM09M5yhsGMcXquj8D
         iqKsXG5svKErrl2UJqeiW2IL4RG3zPMDQ16PNZSexBa+pN0jLqLUjLbAozSsHUB9HlLX
         GRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093177; x=1790697977;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkKczT0xLYYsxaNg2GK8Ovzvtfa19Alb51sjGmOPMSI=;
        b=LaGlCOxuqIW+11wDzPNS4f5hWx2zXABuB1nMGRQueTLU00EAJ5QsH1D0vHTXty/Ztq
         WwFqoTSMXlPf0lZveudMcRJCJGBXGuPC86z6mCXB0UDACir9+7uh2kYXxvIE0j77Zk9L
         NSmSpOgGp8XrAPfaspn+hH5Epky8FMZBXyARHqKpsMfVu0nZtJ/5yvNftjYdJ4+WdeDp
         CcZJg+n7LQ54n2PBj6dgtw4HczXyVEaiOd4YEgfndRUssE8JNHoFri16MLyCtXycVUZg
         VvXl4pMG+mp1hiUP+Os8+aCtW5Wr0sPBCbCvwdlgJdt9ZBB7ATBzzifbDdmwkeM+WiG7
         1TIA==
X-Forwarded-Encrypted: i=1; AKwUvBzKhM9hfrmk+L4fNbuyw7jfpWnOHzPgwa7+oZ27FUs/tmf+EbhKruEURhL44uENvN+LZqcYwPe7R/+vTBg=@vger.kernel.org
X-Gm-Message-State: AFuF++m1xUuzKv/iGU4snP3G1YbrHr2KluTCPx26ESKwE3B4HfOoSIjZ
	FpeuqoH+ONA1IrYhExmw9QitXbijuSrXFiQAhgRDwVS6jiQ6pivdc4z4
X-Gm-Gg: AYBFou1UiKbldIayF/E3mACpaenLCzaxFcyBtKJQdwM0GDGPlJ//FE7IbJjRZlJS6zT
	qMZ6Dz2zCV2rNvMJJ9AhT3x44BaWhAIMY4r63NsUuBwpF0etyk6uN99xU9ldQcVhbCbyGUPTNgL
	yGQI9kUbv0U137MSnSSQu3mHAHYM+JVvILkMrsg+I1Xh/149GiakJocZcJlAO9MgY5Y0MYDpRbU
	+Cy/dEMPFIxAaMwi4ATBvLSJJd1BOqT+Ru/QvOb8kwK7mIZFii2bTd2n0N4QPEwdRvxcXK5DJSu
	xO1G3GQF4u/jPuzki4zdtgOrQMTq7b2sl0a6fDssZrpcq2hJXmL4PvAKuokZ1OKzQKXIYIAc+/L
	m9wrNSM/R8AxK9KezP7kZcLktNrxQf+PKQ2bxduZzDejG4RsubG/T9x2J78UA1D66szKOQX62jE
	gYeRbkCWriwMpSZ0pBXCLlvwfJytbvVPJVZCg5dR7IJe4lM/+2uKrlRAx/vJQfWj7XzKM=
X-Received: by 2002:a05:600c:1989:b0:49c:e42b:a4ac with SMTP id 5b1f17b1804b1-49fc5714d14mr214229925e9.11.1790093176406;
        Tue, 22 Sep 2026 09:06:16 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaa9dbd6sm66967855e9.2.2026.09.22.09.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:06:14 -0700 (PDT)
Date: Tue, 22 Sep 2026 19:06:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Lucas Costa <2000.costalucas@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: free cmap on framebuffer release
Message-ID: <arKnc5rrOxe4l3Hf@stanley.mountain>
References: <20260922035302.167378-1-2000.costalucas@gmail.com>
 <20260922142851.46724-1-2000.costalucas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922142851.46724-1-2000.costalucas@gmail.com>

On Tue, Sep 22, 2026 at 11:28:51AM -0300, Lucas Costa wrote:
> The cmap is allocated by lynxfb_set_fbinfo() but never freed, so it is
> leaked when the framebuffer is torn down.  This happens on every unbind,
> and on the register_framebuffer() error path in
> sm750fb_framebuffer_alloc().
> 
> Add a lynxfb_unset_fbinfo() cleanup counterpart to lynxfb_set_fbinfo()
> which deallocates the cmap, and call it on teardown.  In the alloc error
> path it is only called once lynxfb_set_fbinfo() has succeeded, so the
> cmap is only freed when it was actually allocated.
> 
> Fixes: 81dee67e215b ("staging: sm750fb: add sm750 to staging")
> Suggested-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Lucas Costa <2000.costalucas@gmail.com>
> ---
> v2:
>  - Move the cmap deallocation into a lynxfb_unset_fbinfo() cleanup
>    counterpart to lynxfb_set_fbinfo(), instead of open-coding
>    fb_dealloc_cmap() at each call site.
>  - In the alloc error path, only unwind the cmap once
>    lynxfb_set_fbinfo() has succeeded (Dan Carpenter).

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

