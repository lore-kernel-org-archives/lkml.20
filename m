Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A033B27E9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478242; cv=none; b=fWOZ+ThIuH5lZ0GR+VwzCaBlCh+iA8HrfTPWBK6BZiRfkRZqukFGmwwStZFwfjIa6YGIc2u6v3gp3hvNaYO8LywJLK9/ZHH3QkZObWxSpPmN2y0hekzE+YLj80yW0YVt0UxTDzR1ynAzQuPcLyI1rYKosJoTt93uXmeb1Zy4xy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478242; c=relaxed/simple;
	bh=PeFihLQ+e3Ey/2XTvIqLp/rsmvNZcxzZ0Nn2aECEjJk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=stRFIejBkfRyzLU6SMj8v0soLyJf1jt/XjDpZAs8ujf47clEccBXYzIuGDjpilPgkAf5KTQGBvinowyFfukykG60kbXnNs37nu1gm+mQ6f5nzmyjXJdp/f268YL96ze7JrVtX8PCpcuB1cxh3KCyJfKyInhCJVN+nxVn4rvbaME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOSTA7Fj; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOSTA7Fj"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbeso47310466b.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789478238; x=1790083038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ky+km9SB+CxkGYQT+Ihg9VmqJMBueSg4hZ23dJAFm7g=;
        b=GOSTA7FjuA6IIgbpZrKJy5FAYoZkHLTUMt31qVok9HDldk4keb8p6b7ZfY8bZbTszZ
         Tq1Op0auntagCHCX6yux+Z1BWZG1agy+A12HfSkGbNRD1cPaNOmRu29vx2AFxlS5cpzL
         9EiI/A0F0ftIw2KKt2AZ6JBRIpffFZDboTBdiBAaRUiJNqKdmA03Es+TktA6nT7mogkc
         QIezmgtBX6tS4bigBGLWIWFa9cuovnjnDTL/XMqVu4Iu9vnR4S5S58W9bXmTq1pOAUAu
         PntYQszC8BBba1XD1N/Vjsk2nSKadOFlut7BwETSIYARQEDxS+ja3URx6ERVIHERlfpE
         223g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478238; x=1790083038;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ky+km9SB+CxkGYQT+Ihg9VmqJMBueSg4hZ23dJAFm7g=;
        b=CM1Ww2q2aOKrcTEbdj3CIZG8ErvmI6oPtzCTp3lxpVg4LHJNav3NT4Q8T31xbGCsZX
         hCp3B0LdO3GpaWT95VIyTpuZ/u89OXC5vbw43IrzumSeacynjt4IGWHpaA1KZenWSFyJ
         jZQV/CJadeL7iCjVaB7w5ZD4Q440/8CPaui4FX9pIXNY/BsHBUB4pGijTlRSoMwgZt5O
         zEOWYKaNX9QkWYUbXq8ArZhe0l0zuuHZjd9WilH4mx5GaOYE260B+5yRpm2ba3gWqnz0
         bs7NSBP2kPJp+xc1bnKAtHFwepDxTu/5cq875il2vYRorS2zWE0j9hniYWX4wkMNChDf
         5mtw==
X-Forwarded-Encrypted: i=1; AKwUvByekc8rXzlkd1o6pBsI+7Izj20x86X7R25iE8vltaPke9TW6AHmWETTFkwBiHSoBQ7Hk4y7x5hOUloeuVc=@vger.kernel.org
X-Gm-Message-State: AFuF++k8xTbHDM54D2MbF/KiWMk9d2DbpGvA/IFE5vSU846yyR6tWkAt
	Q8Xo98NrvL1BeNvEA+6QM7B5vGyg8VAqgf0Kx78A/ApoX/0VLDFuMMwN
X-Gm-Gg: AYBFou2w3DobtxwQevn5fk+sxieTzzB884ybkCECCdH3FjLQVxsVjW7Wb6RQMP94kIJ
	HhP51YqyPwsBZaXaeLrDIbTF4kWCdx+DiXQRcIRrRj/gus2CM9xtv3/qUgdqr/hHaPv5xd/eVsP
	Z9qdS9fk/JVwvIgeLwCGMHL9NUKkInWA01Y91Y+PBwLFZOengH+hs+zCewJiAIgttvlT0xvqvmY
	0wmtT5SdTeqtcdU87CRrymhJ+Yq9zE+WtdghYXi8hVEHydOrVzHwItQa33h+ZmR0OEm5DRPWCaj
	xDcFvw2eW07w0npLwpJgGfbtYQJFJOSpkDrpVYtNtJc9gPu6AvkDkomImpZXsnFtTZqDALuHxhj
	3ufrXBEKqBOaLHAGwjVZtgdOkReRGMhEBtbc7Vsr+Z8VeMlSJngp25yZafovpgzc7eoJlLV2SBw
	JZCTiX7oz/J4lP+k5EhDF7sU7Ru5HXn0XXYtnZSEHAxLiYhjXV/t4a09VDx1bTWJeLzdlO4NWba
	HJaiEhqxyQvNJoQy45ytNoe+wrajmYchjLgSEsFwjI6gCtlIFLUnFHGy81kk3FuXeYNPOadXwxz
	7dH8taGOzNKqQaB9OO9A3yDAlAu6lB4xMk46vy5hIM3Rfyjs4yceWgfUQdDYXkdhO59rmGMqxbG
	f+jmZnM1r+VUOreNUkORQkw8O+RCEu3kkiMKMtbGJS7OgVL0WorJQxVEGf2Y1zXCB8JgpXwCGFH
	Xjt2Vf
X-Received: by 2002:a17:907:9702:b0:c29:41e1:c918 with SMTP id a640c23a62f3a-c29d7717ca5mr96666966b.1.1789478237989;
        Tue, 15 Sep 2026 06:17:17 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608dc91sm589042266b.39.2026.09.15.06.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:17:17 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:17:16 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] staging: iio: adc: ad7816: Fix SPI operations
 race condition and DMA safety
Message-ID: <20260915151716.000011c9@gmail.com>
In-Reply-To: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
References: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 10:59:36 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> This series addresses separate issues in the ad7816 driver regarding
> race conditions and DMA safety across all SPI operations.
> 
> Changes in v7:
> 
>     Patch 2: Moved the mutex to the top of the ad7816_chip_info struct
>     (right after the pointers) to prevent struct padding/holes, as
>     pointed out by Andy Shevchenko. Also expanded the mutex to serialize
>     ad7816_spi_write() to prevent race conditions.
> 
>     Patch 3: Dropped the dedicated rx_buf. Switched all spi_write() and
>     spi_read() calls to use spi_write_then_read(..., NULL, 0) to safely
>     handle DMA using an internal bounce buffer, avoiding cacheline sharing,
>     as guided by Jonathan Cameron.
> 
> Changes in v6:
> 
>     Separated the alphabetical sorting of include headers into a dedicated
>     precursor patch (Patch 1).
> 
>     Kept the mutex addition strictly focused on serializing the read
>     operations without modifying the sizeof() argument (Patch 2).
> 
>     Moved the sizeof() argument fix to the DMA-safe buffer patch where
>     it logically belongs (Patch 3).
> 
> Changes in v5:
> 
>     Split the changes into separate patches for bisectability.
> 
>     Replaced stack buffer with a dedicated rx_buf aligned with
>     IIO_DMA_MINALIGN.
> 
> Abdelnasser Hussein (3):
>   staging: iio: adc: ad7816: Sort headers alphabetically
>   staging: iio: adc: ad7816: Serialize SPI operations
>   staging: iio: adc: ad7816: Fix DMA safety issues in SPI transfers
> 
>  drivers/staging/iio/adc/ad7816.c | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 

For the whole series:

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
