Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A4D277C96
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789605103; cv=none; b=fwuanIFgBrbM2ML4O76bbhpdS6kqXvrztQqojcUMGhnVOnsnJeJWpEROiYvy25wobG67pSqEZbHcTyuA5SL3CDT4tQTKxhVKnpPCuul3/Hu+t8tzo9zg7T+Pgd9I+EANNQhpZgTcrKJcaLoVjV0yU8zpcT/7SfiYom87v+TSj7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789605103; c=relaxed/simple;
	bh=hupbK1XnlApWTnVAz57YeuBiy7hkg7A7oJqBQeRC+c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Si0yWQ5THO9zo6WohC0RcI6VCs9cnDO7HBleXcj1LnOU+zl5oOG0+JVo7Pff3HgwnYe3xjE24KIPTxhcB2yPsH/v9/xx4rbFD/NzceimhjkI28utdfSeqbYKqP2ow5jmNpQqmsj9HKLtilXCAJDtN40TciAhw7nWuTYPY91u1ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emzLdQBI; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emzLdQBI"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc1cea34ef4so268069a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789605102; x=1790209902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bUC5CPMfH9AfA+p2OpihFGYYkfQ1b4maiW4dfa+t4fs=;
        b=emzLdQBI0EZErePGHKhJcT4BR/Rlqr4VwbR5JpHITz6vMtq8o5EHD4OLFR8FFC+VsQ
         xi03X5fC7A2z2lex5g4FkmCmklvozhwuW+v2562U1fJLVrC87gU+/+yWAUECEvdaALHH
         lKUUHyuvTiGoiKLSAo8G2Uhw9e8vz6sYlAXfd9UQVg8rSFEw2pdc+Y3wE0qqIK5aHTXb
         0rV12EgvUJRwmTjnbgpsHhE//iSM3s+GnMft1LbOw0DqtL6dLYcUK/4v6ulIfoeHsMKu
         3k9P88CPPlPG+8MZ488q46q6VlPU9+xinFxLVTMe8C9RGg4GD3A6njpbV8aWBBsjbAuv
         U0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789605102; x=1790209902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUC5CPMfH9AfA+p2OpihFGYYkfQ1b4maiW4dfa+t4fs=;
        b=aD5JV+e2uwg3MpKg7yZQsunc8PQCTIulO+eTQosTYUqZIOa6rvRf1bdfjjnHSypGQ0
         sa5Ps5cgt3mjKuq1uGQVHzKVdMFiPq4bsl5Jg03tWtGcG8nbHNLDpvhbTGLVt0gR4Fzq
         sWSsoqApxF4mqDLL5Q/ck/vTwY/u/XgxL9z2MS66QYAwEMhtvqmGPLvk/7pMIol6Aozx
         tn+zFzP0Fr4Abf78M2RYp41FdQcR/S8NTHZO0lWO2UFRyhU7cv7UIgySHiFOv6xFVI1a
         FuvTfXhDdL9PlRzk3AWJdesvyVIr2npoXBPcgdDtQF7mBMgaZSpZYgpD2J2d9v2/tBoW
         Tbyw==
X-Forwarded-Encrypted: i=1; AKwUvBzVOEYLQKTKvyOu92RckoekMCEuD3MXmOxcPU0kbSmjc5fJxoptbwTUpuqn5Ui1MVinogSOrRQyRitstHU=@vger.kernel.org
X-Gm-Message-State: AFuF++md9+VDe9MnrLARyRCo2MUuqkblBBZeFNHCx+rQHT/x+O0OCfku
	+NhH5YI4LmLR9skVK45s55/7lmTlBkHcKZ08ZpK5pHXnPjjFf158iyah
X-Gm-Gg: AYBFou1P5JEsio/XJ4gUjKirI9A0AXH8Xn8Vl/8T+SAukR13FLOos7/tlu4bkoTa/3Q
	oftO0a1cJzYD2ZaD8U12ufMknxAQhiFPEYM2kqEbgjLkV0brt/9MLileyG3aczhlTdio8q8NBud
	C1BrYNAe278/V5OZuVIIxxDER4j/hrJH7DEGOzuvjfwYVt6zFEnzXQys3s74ZEaLjAhla0tzzJq
	rEWCGsLvmO4aigCiaFmogd+I6nf4mPPoV40nZIYHFa12WO6uHVsiTRiM1ShW5BU8Eb0cnslnE1X
	HosCBzJj5CmG30jhEN1PwNwfaVD8jlneKaB6de3WPrf4ApTgy3vx0L2Oo4jdPP3/c+mQPhqSrQ4
	w9cfuYa7DHc84It06LoPhaDXvCkDyO/QM03rSxoN7pvSG526iCTEMq18gsk7cfXlrXnnhz4NDOP
	bL05hpkOwT/1b0GvAnfM4pPOOt8CE2+Q7vdjz2JIlPQuKQOXAr3HCuyi1tILSzrh2u9r6bXL/lI
	6v/+MMv6fUp
X-Received: by 2002:a17:90b:5847:b0:39d:ec1b:9651 with SMTP id 98e67ed59e1d1-39e1e484b90mr10720814a91.13.1789605101674;
        Wed, 16 Sep 2026 17:31:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89e92ebdsm17931615ad.13.2026.09.16.17.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 17:31:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 17:31:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: msc313e: Fix premature reset during timeout
 update
Message-ID: <8c1b8c05-fb43-407d-bbd2-1d152ba63e94@roeck-us.net>
References: <20260913065126.8350-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913065126.8350-1-tzungbi@kernel.org>

On Sun, Sep 13, 2026 at 02:51:26PM +0800, Tzung-Bi Shih wrote:
> Updating the 32-bit hardware timeout requires writing to two 16-bit
> registers sequentially.  If the watchdog is actively running, this
> non-atomic update might trigger a premature system reset.
> 
> Clear the watchdog counter before updating the registers to prevent the
> timer from timing out prematurely against an intermediate threshold.
> 
> Fixes: e9800b799464 ("watchdog: Add Mstar MSC313e WDT driver")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter
