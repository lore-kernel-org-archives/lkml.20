Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371622;
	b=vKQVmVgt+KBiOEszkAcIAZfEMDk6yrNpsRrlTLl4gyvdfYYXKgNMnsnwavfA4sINg+8T
	 YhhEDNhIZl846J6lZ1EHUVeVEpfhxfxmXNaTi2+7jfj8Uo6dCLUXv6sQmU7Ti25ayO5UB
	 kTLxBmjew77sDqMnEZtCxqYHMVNEJdQ7TnSeSU9oqCtF3TxexemecOQK2ikGiDTaE5TT1
	 dv5HDATGDJX1u/zEZmKACFa2m2JFwMwBoYZ1esgnumJAoX61+X4ml3/O92G42ShUbK9OR
	 RUgKe0AGcr7tvcVKQw6jvqF54mWwd6mqpeifAWBrvu942ZTyDMX+iqMA6RQn8NUcpPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GtHR9MeyGTyZM0OihaH+eIUfUqxCL6ogGNdi0Oy2FKc=;
	b=HZmEPMVXY8i289U9zEndzNhF1YSwjg2m1Ry/moRirwliqzURqGDx9COud+gffCACXU92
	 9WB8XHSX2dyEDlUdG0ZvoQa1tdcA+rXdE5O0K9R/1jApINYNGZjQ81Gh8KYL8dkUg/NCp
	 IQg2r3nec9SqWIZPWNKey/0bAoLDc4SEp8RwXY5dk/FxuO34YD3wyWmZpeEXJmQy1rEh7
	 rJS+vItE5YhErkjwjlD5Jlt6hDxSJQ/pZQN/nuxb3V55eqydRnt4lkkb+gdYFgUx5XvFG
	 vpfTeVJtxpORAQedmJnkdqtrojIg4U0OfIRPmlr2ofm8FDkl4A0b7lf7MfCXm8lKi/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WgngSZuc;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9E5606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D9E5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WgngSZuc
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso1959813a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794371622; x=1794976422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GtHR9MeyGTyZM0OihaH+eIUfUqxCL6ogGNdi0Oy2FKc=;
        b=WgngSZucIXocFREuPq1lf84VHnQRPl1uIeOhir7aSr86xl289tcMTUhoJwU6dOWhZN
         L3ytdAnXfJGK9pxQVGdA24pcID8E5mn37RZOxcUJTrHhP77DjY6D1fFFWqFe9nV3USND
         SJYi7Dz1c3qvJL8CC0R1zX0Kgmgdrz57FYB5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371622; x=1794976422;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GtHR9MeyGTyZM0OihaH+eIUfUqxCL6ogGNdi0Oy2FKc=;
        b=d2hmPWLIwid4/acmgh2Qq2MTIUKFGNI44dDci0QZKFDgpD6pgV0Z8GEsR5PF8XFRnZ
         gV3HRUQAAtlLOC//5jmzKoPEoH8xIA3ko17FrMuoxu6OKjx1W/Q7xtU1RPEUnoFMKviH
         14syksRHrg35IzlWSzjDzRiYa+0twMX5rsQXUv9wvof03SQdxU4cr70f+NC+lVuaW0cv
         IuE34RFNk/gPq+igS8DMraWiv1O+nNwG2OVOTDHZveszsWyiKNctPCY5yEXaaYdUTHPI
         7BMxsdW8r49ngIe2G7W/tnJdqATU3O+ve4sHQUelD5gJDX9dYSPYISDLXs6K2YsydN29
         3hBg==
X-Forwarded-Encrypted: i=1; AL+hErEVP57GTJQFF5FJUVO1LnW11X9NvgQdI+9e/5FMt/xRPXOTVtGt0yKsiaPjULPWCYq6vPGySFOxSWGeB5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1QFxCGs41B8pbOKD45vWtRnk1TLeJjX+2IPSwMO+QzYUmUgpm
	z77nlv8jLAH5ujVAvrviE8JTVgNiUz11hmR3hrjHTKwvOEZT+SnylsQXJUNhms1ePKejMZq8GSp
	GaVA=
X-Gm-Gg: AYBFou0FL8FSmH00BuxPGxn8jhWdl2IOmZlf0y1lnoNa98bQPMibfGju4VoZ6/ahLcB
	cxoU+zEjf6ZMHhzSlocoRZe6c0tr2rfdmU2ziX32zoF8lCOm/yyh0BT4u2sVzekNIKaAMZw0hbC
	4Fgz8hsYVjuhbeva2uDKqv4G1mHF3foJFfT6mA9yOPrKJW2GjdFjea3rYwXoBQ/LDvMrEokTmbo
	7wcDepK6Fa3Kf901D8mu/GIvAyQQZLjGwE13ixDjtQzEOQkQrQahlMHJodSpNyt2J2yFxsuVKCM
	j6RS6MMy72FPmF7D9yJZF3kf2PcCTGPEMljL8wVY3TrJPaTbl4gY+zJktdV3WGYkVF+Z9qSGJ/i
	qnQaxCePN5bTXxXcUUuYYbIgyTeeQIfXVfQeDCJhwEa0afAVBbJ89EKSA1lpFgRV8sYAH3lmYhj
	dZnuKW+eVsrzmcpH61Yd09PZeo4+ntNGnb2/5U3VpW/K+LJEo2xZFExZCRAkjn57Wu2Wo7R8cb9
	19U4jSioGJfRLf/lJKkIZg7w28d5uGQrLmxjtYAkG1KIWa2qr/3x925uWznVXK2O80NsECMPUxP
	uQ2zclfVsi4yx0qu3eglrZqBuZaPXh9+1lUobpHb1GbcnAHSSir04f7GnF5D8D9s9aLCsHNzQUC
	yLlp/r/VcgjmFfzM=
X-Received: by 2002:a17:90b:35cf:b0:3ac:d79f:8229 with SMTP id 98e67ed59e1d1-3b182f6767fmr1165692a91.61.1794371621658;
        Tue, 10 Nov 2026 20:33:41 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2506547a91.11.2026.11.10.20.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:33:41 -0800 (PST)
Date: Wed, 11 Nov 2026 13:33:37 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Nhat Pham <nphamcs@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mm: remove CONFIG_ZSMALLOC_STAT
Message-ID: <avPvrCY3AywQRz5j@google.com>
References: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com>
 <20261109-zsmalloc_stat-v2-2-caee41684aba@gmail.com>
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
In-Reply-To: <20261109-zsmalloc_stat-v2-2-caee41684aba@gmail.com>

On (26/11/09 20:59), Xueyuan Chen wrote:
[..]
>  arch/s390/configs/debug_defconfig | 2 +-
>  arch/s390/configs/defconfig       | 2 +-
>  drivers/gpu/drm/ci/arm.config     | 2 +-
>  drivers/gpu/drm/ci/arm64.config   | 2 +-
>  drivers/gpu/drm/ci/x86_64.config  | 2 +-
>  mm/Kconfig                        | 9 ---------
>  6 files changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
> index d44674b63715..83193ef8efb9 100644
> --- a/arch/s390/configs/debug_defconfig
> +++ b/arch/s390/configs/debug_defconfig
> @@ -100,7 +100,7 @@ CONFIG_UNIXWARE_DISKLABEL=y
>  CONFIG_IOSCHED_BFQ=y
>  CONFIG_BINFMT_MISC=m
>  CONFIG_ZSWAP=y
> -CONFIG_ZSMALLOC_STAT=y
> +CONFIG_DEBUG_FS=y
>  CONFIG_SLAB_BUCKETS=y
>  CONFIG_SLUB_STATS=y
>  # CONFIG_COMPAT_BRK is not set
> diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
> index e00e252d4694..694a309377d5 100644
> --- a/arch/s390/configs/defconfig
> +++ b/arch/s390/configs/defconfig
> @@ -94,7 +94,7 @@ CONFIG_UNIXWARE_DISKLABEL=y
>  CONFIG_IOSCHED_BFQ=y
>  CONFIG_BINFMT_MISC=m
>  CONFIG_ZSWAP=y
> -CONFIG_ZSMALLOC_STAT=y
> +CONFIG_DEBUG_FS=y
>  CONFIG_SLAB_BUCKETS=y
>  # CONFIG_COMPAT_BRK is not set
>  CONFIG_MEMORY_HOTPLUG=y
> diff --git a/drivers/gpu/drm/ci/arm.config b/drivers/gpu/drm/ci/arm.config
> index d7c51670da2f..fc0a8a4bfb18 100644
> --- a/drivers/gpu/drm/ci/arm.config
> +++ b/drivers/gpu/drm/ci/arm.config
> @@ -5,7 +5,7 @@ CONFIG_CRYPTO_ZSTD=y
>  CONFIG_ZRAM_MEMORY_TRACKING=y
>  CONFIG_ZRAM_WRITEBACK=y
>  CONFIG_ZRAM=y
> -CONFIG_ZSMALLOC_STAT=y
> +CONFIG_DEBUG_FS=y
>  
>  # abootimg with a 'dummy' rootfs fails with root=/dev/nfs
>  CONFIG_BLK_DEV_INITRD=n
> diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
> index c46125c1f80f..10b01b55a66d 100644
> --- a/drivers/gpu/drm/ci/arm64.config
> +++ b/drivers/gpu/drm/ci/arm64.config
> @@ -5,7 +5,7 @@ CONFIG_CRYPTO_ZSTD=y
>  CONFIG_ZRAM_MEMORY_TRACKING=y
>  CONFIG_ZRAM_WRITEBACK=y
>  CONFIG_ZRAM=y
> -CONFIG_ZSMALLOC_STAT=y
> +CONFIG_DEBUG_FS=y
>  
>  # abootimg with a 'dummy' rootfs fails with root=/dev/nfs
>  CONFIG_BLK_DEV_INITRD=n
> diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
> index 7ac98a78691e..8225b806dad8 100644
> --- a/drivers/gpu/drm/ci/x86_64.config
> +++ b/drivers/gpu/drm/ci/x86_64.config
> @@ -5,7 +5,7 @@ CONFIG_CRYPTO_ZSTD=y
>  CONFIG_ZRAM_MEMORY_TRACKING=y
>  CONFIG_ZRAM_WRITEBACK=y
>  CONFIG_ZRAM=y
> -CONFIG_ZSMALLOC_STAT=y
> +CONFIG_DEBUG_FS=y

Really not sure what those are.  I'd rather prefer not to touch
any configs at all.
