Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505322E06ED
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320334; cv=none; b=UVtqAI3+WT+nnlCIHn/wssub1clrm5ZfLm4hB0CGLyKlT05qYarQ7iW3Pv6VKp3B1oM5NscKKkA4UfvTdsZacaC4yb5jU+g1zyHeIb/nx+PKUBUzzvp5JFc1Ed3nA03acEkqcHmdlB+EORX4IrwZuJuEH5CJAsU32WODEAzHATs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320334; c=relaxed/simple;
	bh=rUVv7NTOXfNrMZsz3SZu0rAK+bIM7jv/2ZFJUYvuLJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hu25wYTldUQ9q9l3Ye+rqIncbImB7xXhR85CgAC24xJKQWvcAYCkCf3AZBP4N/eK3E12RLhYkjpfcEwVe7BVfSia3aJieU9mFdB4thIAI2+zJPBdBg7SLCAufpDT7i8j92GzCIqtMWXV1a3zAABPxsYXqyPmyZIjqBBCdGMO0tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=osJuwtYq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osJuwtYq"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso12881355e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792320331; x=1792925131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L/iMalGD3TEnhvJktxMOyufJx2rDQSoxS14IAcqEo0M=;
        b=osJuwtYqgvr0DVDG1ktZJUanWqEBSqgf5DWhf2H7U2eWgEOx1o3EM4SeAkNegGPeaQ
         1FyBj+OJS46+c/DxR0mL4dtdm/+0JdYlPL/5VnxSLXFwigHMN+470PjBqD7EgI8Ia/IJ
         Pt2w6YEGpyk886fQDjdBFbC17hAK3lAI3PVAxNzYeRKRjwJ1Uyon1nSYxXasBJgaUYir
         Ot4kSpT7xPLb3gVMvETG7wyfSpjn5nzRa1HKr7K6Gt2MSVA5x6yuaMNPAAn9Mmw1ggOT
         Exp8A5lEceYMLDu7Gs0xzJzoKUpx98lM9hRgvJG35ltTocPqNHGiJvS9tjXsbpc56sDA
         MmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792320331; x=1792925131;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/iMalGD3TEnhvJktxMOyufJx2rDQSoxS14IAcqEo0M=;
        b=VSNBnaKwEexG9WqDHKVK2Hm0JvumV+it/NvVrwdOiiPeG/nGPM3Z1NZia3abEFxVoU
         vXQclmULLpNqO9ltTfjur/J4sJ7BSQytFiSEGpnXTb3kL1TAS+9WKwb0M59fWTEmtAM4
         aV5KIWzYDLtXNuOyMVFbi9XvlV65vsZ++1ryRZTRT2Y4pO7JDGh2CI+U7PqSAoNjH0+h
         +YSPJVmEqthWOovfQ22JjBm6xPC1JWlVhJb3RPOiuThqHQnw66bUzHS1HKw8OdC5nqUZ
         WACoW2tgy1zVxtchrvHPmW+gVH8QPYqbFxlFNrN1RzKqXyW6/AzYI58gKogzUAxrOgJ+
         TXrA==
X-Forwarded-Encrypted: i=1; AKwUvBwXD6z7FvWAM8R9gWHWjhO5U5HSMFOpqv+DLO7PJ82Syg0pbcfptiz7UZx13UA85R/kIYLsnIsUuaq45oc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJz2X/vlmHp6Luy4lOVwOFuU4HhP4cYWJO/CgNM+RxQ8/WDkbqD
	Z26X9tHqgP6II/kx8l16vv5nznFu+F8wfsoqg8D5yLGSXCtgbG/M0yDg
X-Gm-Gg: AYBFou0lCoxyDIwVgYYYnnsjVxtao28a09bqNMqIFMSKZFlV4vCtzRzhbdgqXJ+2x8u
	/GBePCnWYi5q8SB2wyGlwwrs/93tm5mK4jwTkZDwt8ZqNSUvWD98t+9z6uIt0WhH7eDpLVTTTNi
	xCyw7hn0c2lidy0Q2gpQY1HsGNMtepQJpqueXdHS4zHrVNkUUsfqO01C5SkyQ+nGwfaC8zHyTIq
	pYjNhgPR2CX0S3xWhXaO+4JHGAiPuvYJBN6Ecalx8V5bolBy8WEB72wDLMVx3QRIEJHIeELZW/C
	njSkViI9B36AsWFXceIIcEbcEHT3Q5QASv2D0o8dSfGSU5gcB8d8Y1mhcndj+t4IG3Ki6EnMbKN
	Rztg790bUC6XlEW1shxErkhEdC48iMm3YE3evB0Vbs2vaKn2ZJcvz0wk5Wav3rvl9OApcS211I6
	jeHSSoeUNJfta84PjvD1OLoCzNa+xAyTQNkYSzEKnw/kUf+Ht7I1v4cKeXyMG8zp2WzJw=
X-Received: by 2002:a05:600c:a10b:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a1d7601226mr64363215e9.16.1792320331306;
        Sun, 18 Oct 2026 03:45:31 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d30d778bsm177718495e9.9.2026.10.18.03.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:45:30 -0700 (PDT)
Date: Sun, 18 Oct 2026 13:45:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Melih Emik <melihemik@noirlang.tr>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: remove redundant dev_err() calls
Message-ID: <atSjRzJ3_ORJ_uh9@stanley.mountain>
References: <20261018104223.164776-1-melihemik@noirlang.tr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018104223.164776-1-melihemik@noirlang.tr>

On Sun, Oct 18, 2026 at 01:42:23PM +0300, Melih Emik wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() and
> devm_request_irq() automatically log detailed failure diagnostics
> including device name, IRQ number, handlers, and the error code via
> dev_err_probe().
> 
> Consequently, driver-specific dev_err() calls immediately following
> these requests produce duplicate error messages on failure and are
> redundant. Remove the redundant dev_err() calls in dim2_probe().
> 
> Tested:
> - Compiled with W=1 on x86_64 with zero warnings.
> - Verified with lockdep and debug mutexes enabled
>   (CONFIG_PROVE_LOCKING=y, CONFIG_DEBUG_MUTEXES=y).
> - Boot-tested full bzImage in QEMU with initcall_debug, confirming
>   successful driver registration (dim2_driver_init returned 0) and
>   zero lockdep/kernel warnings.
> - Verified with scripts/checkpatch.pl (0 errors, 0 warnings).

Don't put this kind of meta commentary in the commit message.  It's
expected that people test their patches, so there is no need to say
it.  If there is something unexpected then put it below the ---
cut off line

> 
> Signed-off-by: Melih Emik <melihemik@noirlang.tr>
> ---
  ^^^
here.

regards,
dan carpenter

