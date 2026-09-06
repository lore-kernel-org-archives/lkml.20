Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926903D9545
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704418; cv=none; b=l2lI8ItAtErSZ5T1MalpcOIuS8LfaHVAVIrtv2HbvSVmgtgRpcxRfHwaAzkpq21sb9VGAg9q+CRzmEoRQN0nde8Dae+Z4x7++0LuYy9T6uZrDx0XtmgpDZqo7vjvnUwsnohqAw3GWPKG/D7R/41/pezxEo7Ew6iaCBFsjSvWia4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704418; c=relaxed/simple;
	bh=bKv7F9ahkxh8W5WyR3qEm4fuAIz65mC5K/OoAxne/CU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IHlHc4J7au68hZcGZobWMnK67y9hmFOQgcSdPsokRyzgg2vuSDQhk5ZeiF5+wKPZGgvbVIWQ/IYmSgWyuc+vZGT5BV/+9/Ur4hCkWeks4SChoRbhjk9TfCVmlkqC9PqGA0hXDjG5T110NZyQTmHln9Qzj9b+C6bYaEPstNsw3Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbwylu0K; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbwylu0K"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso23248115e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788704415; x=1789309215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PC/6bfIhSGPf12M7phejzb1AYIWg3N/E3Cnmwp3VYxU=;
        b=kbwylu0KIQ3Tj6iDOtGcQnuPpJ5XDqSVAQwfk8y04rnFhvvO6hKT5QU9ulAo+dJZB1
         4r+ZPDSc3Zs8dLZRgTE5wkf3qGaj7arb+rEYgD5J5XSBQCQw68rhaNeuBPGdNOwT8Bsj
         nbsDqp+26CokbzgGbbfHcYNQpwl/WVhLruB7PYU4RH/o0XR+qaMbwEZNTAqcSSWUAYNy
         4chFMVo/fkDEo6O99/grjddzIq/FwUFA4/EiGIJjMFTqEkCX50q8vlRJ9cOCVkGi14Bb
         PL4tRUMWOy5V3chDY9B9mbaauSA1E0Hi2YoWGw2ADbG1zBl3PYpC+I150ng2d2cagI1+
         L0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704415; x=1789309215;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PC/6bfIhSGPf12M7phejzb1AYIWg3N/E3Cnmwp3VYxU=;
        b=dKWOYe+3cyd+yeb+SpQ9hxfJ53nD+7Gz+zax07s/AIbiekdGlkESQIodVt7nNzGvs3
         9LTP46CYKaAy2SmdU1cJNlznlxC/AE64zfYqDrIUJwKVk7C6U9pmeGdnXIcRrdY8WVgv
         c0ahdIWX+ruvS2I+sQ9hHaiRDg4Mh49A0b4lXeDHrBArn7CaYli0m8O/7ajOPaBdLfNk
         kA7yfI6lyDt10Uw+H5uDJZojypggMnhUle2WPpZGP94OxgYUp3Ow2BOEG887Nbg2nARN
         YZZir/EzK3wrfZvr4U8fKno1ht7MW/G/cqbBoKRZJkXQQA4ARZ2mkgqm4wRSypJao6JX
         qAVA==
X-Forwarded-Encrypted: i=1; AKwUvBxiAEIXllkD0pU2eXTSlecsetDmMu4pYj5JjQKFA1ywCISkIbIQl02JifBSTs1L3VSVdqSxDgqvymPjKq0=@vger.kernel.org
X-Gm-Message-State: AFuF++nhz9Wb8XlvM9hQxpt8Ah0AzA2Cs2NRJllF5zNiomIzvoFvsUR4
	MkZM8D2TzQT8xOCsEzfJYZeEHIchkVIohljyaT0v9BwBJWoqdzUKkYi3
X-Gm-Gg: AYBFou1Qbw59LxSZlnBEkfrFD0mnVTZ7Raz5xiNMp97f0vR0wr9BDNqfuHYTVJjTUgS
	iWxKs4vViaQW7Uawwi9C7icN4Tn9ihSALGUDMaBsLz1y3FDsiWfHiTIdUGJxB9Kn2dUn83tq3NC
	TYsY/tNFOtTeimS6z4awBVz5HnFCbH/WdATa4MVKH4kU5sr4RVCrO/T1c4+3QPrGMLKJShSldhG
	+vO8J344h9Pka4fwKpe+FbC7rOqDZcxlx3qvt6ElI5hHE4/qQBjhR/4GOwpiAViUOPyK6jy9c9L
	cwxQpd3D5jEZg3uM5bij9GP2s/njLmhNsuvmOs16j8LCzFU5WNwFUOohIF5HhK+wqyT5eW6UKiA
	lwXK8fQyKNS2Q439WinmTiR+IjHR2hp0lKcTPrg8VlVfcJ1rMfbTAzT32LeRwRwu4z6NcE1OtL7
	ODwr4MIkHuE5CMbmOPedercAjx8qQnxCEtPfa+jUTaC2fwD8CM0yFWsQ/Zb/pwa3WBvKV3I8+wV
	2iSsUhriA3V5jZnjnnwFd6bWEHRQ7u4Z2k0AMmQLzA9A+7YU1IKFSPtCQrS2zLhVLHFfYQbN3zK
	ufIAJw9UKJNhuqimGkRZzTBDLxfL+p+IxD1/Pj33Fr6ZvS1rjnWIDP0Y+ZwppgqD3s0L0pHKcsl
	pQw/FesGHIQkPz2pJsNEFOjMx3aJx4HijVTxqrWe9J8EKXZVBuiTqmrGnhfQZ7i3q9Km7
X-Received: by 2002:a05:600c:8b32:b0:49b:d03:8d3a with SMTP id 5b1f17b1804b1-49cf8244878mr203713775e9.11.1788704414481;
        Sun, 06 Sep 2026 07:20:14 -0700 (PDT)
Received: from systembl0wer (78-80-112-223.customers.tmcz.cz. [78.80.112.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm315898635e9.15.2026.09.06.07.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:20:14 -0700 (PDT)
Date: Sun, 6 Sep 2026 16:20:10 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] staging: iio: adc: ad7816: Fix SPI read
 operations and VMAP_STACK issue
Message-ID: <20260906162010.07781ebe@systembl0wer>
In-Reply-To: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
References: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  6 Sep 2026 14:40:47 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

No overall description of what the patch series actually does?

> Changes in v4:
> - Separated changes into two logical patches.
> - Patch 1: Used guard(mutex) and devm_mutex_init() instead of manual lock/unlock and mutex_init().
> - Patch 2: Used __aligned(IIO_DMA_MINALIGN) instead of ____cacheline_aligned.
> - Patch 2: Fixed the sizeof() argument in spi_read().

I assume you forgot to send this patch? It's not listed below...

Either way, NACK to this series until all of the patches do exactly
what their commit messages say. Applying patch 1 causes compiler
errors. Ideally, you should compile each patch separately to prevent this.

> Abdelnasser Hussein (2):
>   staging: iio: adc: ad7816: Serialize SPI read operations
>   staging: iio: adc: ad7816: Use DMA-safe buffer for SPI read
> 
>  drivers/staging/iio/adc/ad7816.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 3d6d817622b0a9721e3cc404df3469171582be13



-- 
Kind regards,
Joshua Crofts
