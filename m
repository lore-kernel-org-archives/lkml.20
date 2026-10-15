Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E3B4EF15E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055782; cv=none; b=n9cYSqN/5VNlZEQdCBdq+HPHBiWPVYcS0RKoDtdkhyqDBLuwaF+FlBPg6m9p3mLkYSggd7ErYAAu6EinOe+EU6Sd+4FZMgsi1C5Sg8mU8pw6PLgVKWi3wncidKoGR8wAYlhrc7akHDlQVST918SJ6oogWf9L8W4vhAbCptYpazg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055782; c=relaxed/simple;
	bh=d+LoCfQzYtpW/IWUXLFg48AdckuwZjQPlTysxuLcw7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNGG6y23yaGxTeBf3n2dQ3fntIcM0oy6w9X1Zewwu8bVJ81J9hFSfIUsBtGXiSdm9wk7P9gimGoQsd3sQ+T3MTBYO+8jQny4TohlKC9NNmXX3nzzzLeJcIEHX1s8c+WYuBDxBjIyFJyoV388h1wUxM9ueH/r5gjOAM7iMix6tXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdWXAz7u; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdWXAz7u"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c5358fc28so135545f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792055777; x=1792660577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zPswPkxM51QxAc4ujE8Pa9vdpPcFbihk+u5+fO+7z9g=;
        b=CdWXAz7uDO1WEWvpcGiEerixJ5Gf5jLf8XzJY+FGEKh8CPCgKmt1vPYfPr/NVAjffE
         LXK5IsAzascbukSHdmmfHmJum+nu8Tkf4g/pyUyE7HlIAb9BQHExIfATppVJWSXmkThH
         j57sB/oNqc2Yddpa75h6EYtf6I99Mx+dGUrQuoS/2ZTH5w35IzuqhgnzWIHuc7kdZlwn
         7KWT4wuvSNiYeJeus0Y53mTBmoCtxTOUOJaf/Zt5lxL0LZ9B7l3vsR8rknqJyHUa3xrh
         JQBcsKTFIsT6tdJuPwwbwQpaJtJd/jWaIKBE3w93WNEhoedqdveoQpMDVHRcRkdvi9Kb
         0O/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055777; x=1792660577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPswPkxM51QxAc4ujE8Pa9vdpPcFbihk+u5+fO+7z9g=;
        b=WbL6E4sJe3ltcP28o+RyQvhhtsokn6Sy1hbzK1hQ8lxNQSkTY++VeRtmD1Kym4cJm0
         3LfutePRw12hGErO9vetRolZBMT7dkn0QcEQO1DxZy00NSH6GNrJn13E1eX60gU9yg1h
         Hqxq49RJCKTwyHArzpv43Q/4tBtvQ6hY6IYJ1IBO4VR2K1Nm27gmyI1cefh3n75uINpH
         3awB3mYr0cdzkimXB63A/ajIU2MkbZ5h8RxjVVR4ne+YTnWRaqSr5ayZfZvLHCEI7KPw
         33GEeZs/nyk8lDMxdujOh7Qken8xzkR8uCxa9KJkrIfDp5zYX5aFxY6y4TYgjcMoV2wS
         QQ9g==
X-Forwarded-Encrypted: i=1; AKwUvBz5oyUMcxGwHMTv3g2u+QTt40+AM+LWpgv3Lixqr0MIMsZ2edBcuBcuCnM9sjzqlebBlkOrYai/ctOOXAk=@vger.kernel.org
X-Gm-Message-State: AFq9FYILh9uvHTkp/xxFUD7OLNnt66c8gy0m3MhaQeC9fpLLZN+RvRz9
	6Y/mFgs8ncBNIRGkDOWFYDupQ6Z1Dw7cP6hSuud1UOxr123V4xiGIhE8
X-Gm-Gg: AYBFou1uyTWmiTzpSH9FwwqAAz/PtR4AliUtf/hOrhBHqgMDIQgCFZkNyB3bLD9WMdd
	LRcVU3EZYMAgwHZFEZ+33TeDTEtgHDtFKb8eJLBQBoUcJnZfnBvA0rUZ90kQdkhPkkc5X551TvX
	nljviPTBlXVaIclYB5s8TcEDCtOto/553v8Oue5AIyNwrbfLDX1eDd1W9HHY7vjcHZcwMbtdRDN
	5uYvU9jJCyCJu+JnDHkqgav8Qa1EWS7mZnW+8FmT1IHL8O4qHWNJV63tGHBJWVTjM1x6RvPIaLA
	UP3QkUyvH86lKBNLyR/hx5ABC83NgvrUtnLyphs2DZWTsqf351fkgMMlNa3UlKLnbPs/twMVeKz
	GxIUxJMMseJ2CMryZt6Ur/u1Jt95Z7VOF6aiGOgE2sIjVbcqDeXRGKGOsPxiraMflahIIOkTBPa
	w5LDgI8Us4wZb91cq8a0bZQ59VYM0wzD0wiScNX7BEUaXEpGxXSQNjYzaZLnDrJ56UnC4=
X-Received: by 2002:a05:6000:46da:b0:48b:68:594a with SMTP id ffacd0b85a97d-48dbaadc11amr25711396f8f.12.1792055776837;
        Thu, 15 Oct 2026 02:16:16 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa34sm17339207f8f.20.2026.10.15.02.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:16:16 -0700 (PDT)
Date: Thu, 15 Oct 2026 12:16:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix list iterator tracking and prune
 dead validations
Message-ID: <atCZ3PvVh6kzaGql@stanley.mountain>
References: <20261005042911.64922-1-marinela.selseth@firmwaredesign.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005042911.64922-1-marinela.selseth@firmwaredesign.org>

On Sun, Oct 04, 2026 at 11:29:11PM -0500, Marinela Tatiana Selseth wrote:
> Automated static analysis runs using 'make coccicheck' uncovered
> multiple critical logic and validation flaws inside the VME subsystem.
> The file drivers/staging/vme_user/vme.c contained repetitive
> unreachable checks testing list iterator pointers for NULL (such as if
> (!dma_ctrlr) and if (!lm)) immediately following 'list_for_each_entry'
> loop boundaries.
> Because of internal pointer arithmetic designs, these loop variables
> are mathematically guaranteed to never evaluate to NULL during loop
> processing.
> 
> Worse, if memory allocations failed for the corresponding structure
> images, the error cleanup paths ('err_alloc:') attempted to acquire
> spinlocks or mutex blocks using those same loop iterators. Since the
> traversal was already complete, these pointers held out-of-bounds,
> scrambled memory offsets, exposing the kernel to critical Null Pointer
> Dereference panics.

AI write too long wordy commit messages.  This second paragraph is
also wrong factually.
1.  The check:
        /* Check to see if we found a resource */
        if (!allocated_image) {
ensures that we hit a break and the pointer is valid.
2.  It wouldn't be a NULL pointer dereference, it would be an
invalid pointer.

> 
> Clean up this driver architecture by removing the unreachable loop
> checks entirely, dropping stale, misleading warning statements, and
> routing the post-loop lock cleanups cleanly through verified
> allocation tracking pointer references.
> 
> Assisted-by: Gemini
> Signed-off-by: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
> ---

If the bug were real as stated in the commit message then we would
need a Fixes tag.

regards,
dan carpenter


