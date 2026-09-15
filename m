Received: from mail-wr2-f43.google.com (mail-wr2-f43.google.com [74.125.225.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C40401A25
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789511837; cv=none; b=pEtg8glS/MeNy7qHczZTUEGzZ2BXYiBjlZI/k+E3L+uEQE/ofm9WaTIyi8brAeuFAwl7SgtPRg/spUJBblazdghXT9GL1gjAf48m/qC+9jDKvs4jOxP/YPzWcjTjifO74Yezt1ctLOA1mKoC6m9QLZu/d+FqxDRxtiUesEuxG8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789511837; c=relaxed/simple;
	bh=gaEjP8lANHottkp7mN9BpF/gUEZLrlF01hyG/+im0Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyXsD8nzmBoMg0/maHsM36iFoK4HBHsjvRO9xTJkKUvD5s2Ux1NZknSzcutFYjljf0mjCr9zn4DBnBRMyd3x8In5OgYeJAD0NKPdwopUv6IWC24c8SUTFuWZuYie2+3gpgoXcfuP78eClW1Pn8EKSDANx53WH8fN4NNsW2uuAqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoFal3w2; arc=none smtp.client-ip=74.125.225.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoFal3w2"
Received: by mail-wr2-f43.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so62781f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789511833; x=1790116633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FgAcOtlwO45Px2JUhKgFwvhZKw6f6DN8V5/9E1c2LNk=;
        b=GoFal3w2cd3zElUGwxsoi0cpRUIFaXCy5VWobIx49wc11ub0EgJKCkvbdrcYx9plzS
         iJ/cj/6EGIR05jH6JxAEUK8agEJCj9lESa6JUp88Ozert+h472RHwx8o+TemUewVOOg/
         dwYYC/pxABFjMK85V/vl7Y1LbJ5K27Jfc3Zj9Cv/uxzOIZ/Cm5p4XVo9GbCxU3Ai64hE
         MpkoPvJ8hdUbRDpgIY+YuC41qoC/olk+NVYPk8BzEkv0UqA9XBu5bMC5cwBTWeZNDNCe
         ONt+XededF+3yVhoT+mgo+CH/y8+0v0XA6nrBRG89TYTDizpmvwftj015T/BjGucit1Z
         /uIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789511833; x=1790116633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FgAcOtlwO45Px2JUhKgFwvhZKw6f6DN8V5/9E1c2LNk=;
        b=eUhTo2jg+SHlr+I8suQaQoQIQkH2EeiasvFUCHkzqBmkR4vyBTCE/6i3/eD2KPHw0n
         +3qyZMp9JSvcfXHVgynqFqvK9ely/ne/rBYcDalEKUK6yYy75kFaI9ygDVLo9oEwt4rW
         NoayACX7S4UvVNSTYlAg4nd2QsPrk97iQ/oftrY6CFOl3zplVAi2hHDwyXtPdn0E07Q+
         SmFzmPB1AM9mAa2cT3b0jk/TsMAnaunK5vsnt7vBjAKsTDGJiBx8VZmpMQYUbMbByeJ0
         O5pDq41hK/b5ZzWJJ8e8P4CQIM9u61FXohrVayKPNadhlK9n5+XhpJPadFx8DzWCIx9Y
         ITww==
X-Forwarded-Encrypted: i=1; AKwUvBySQ8ElcxhnasXycTWT6IKgpMPweAQW2jXXfrMHM+1gFJqlPYu9WlphsSDQEoCkA+SWV6V72YtCh1h6bvY=@vger.kernel.org
X-Gm-Message-State: AFuF++lrucFsG17YOeeJ7FEGYiSiKCg+s3loualq+StxG0uXRIhhM8dc
	3L8iuvoBynAdef4zt7wP281APg+gtvT6HyIN5T/9O3qLJX+FL+Z0X12kwRUZgA==
X-Gm-Gg: AYBFou0GCjCDNWIGj9HGG1FHfslDC3sZMfxBKTDd03A6iLNmM/2RoMSXfTYeDQJlkNG
	AonXmrljnC7eOqHAsiLbRHLbdZF6RsWkIE2TcOFWR5ltdPEpIzf9NyXGnndw63FXkY/gw5ZCx3U
	IGaEj4Bi4bf6iVLFPz+l9+dW8VKWv3d2DjsQNWPuqQAzO6+0x4QRBAlMsaIHqCCv6D+akzJtEWG
	W4SzMjcCLqQ/CT1W9SbmaPLH2+E+8cSQLCO0WTUdYUZ/FZvNuNGrNzQAlnOHkGlbmp88qdDJuf1
	90YTQ3t6Vtx7IO2I5INEv3o5tlBkggnSPci7NwM8Vi7MJEb2lzFFXXbyDOUWMjJk28p5k3x6lEC
	RsIjtPTt4TEE14srTGwn4nUtoLUzX2pRUv0Ln7QX8eNPxzUKoevWBCMOAn7QW/ChdArwUUnKQIf
	pj8xhRghoWMlWJ+7H+p7ejw4Oq/SckcHR42xTgCYycUETQhjgYF2OAJsGxuo1MmAg+i/CYP1jX6
	U3ki2CVAqQ3NvlQUy62vlGUy6pp7eqwNFPzfLOKbQdiq1D2jhmbZburUnPzlOsKi3s0yaod+bj0
	6j00rGSkbfIOD/GkCcD6k+9Rj//KxKezDffteGAO1SgAjwsxVKR6hAKJ6ae+KZoIuw==
X-Received: by 2002:adf:e194:0:b0:484:3311:257a with SMTP id ffacd0b85a97d-4870d6f9d9emr198485f8f.14.1789511833278;
        Tue, 15 Sep 2026 15:37:13 -0700 (PDT)
Received: from MBP-von-Karl (dynamic-2a02-3100-afd5-c801-ec9e-1a2a-2fc8-3f88.310.pool.telefonica.de. [2a02:3100:afd5:c801:ec9e:1a2a:2fc8:3f88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf33e01sm2389338f8f.23.2026.09.15.15.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 15:37:12 -0700 (PDT)
Date: Wed, 16 Sep 2026 00:37:11 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: class: Make the time32 hctosys limit configurable
Message-ID: <aqnHDxRIBncNH6qr@gmail.com>
References: <20260914212537.1452-1-kmehltretter@gmail.com>
 <7c020979-cf03-4ece-a7d4-b1475d1400c3@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c020979-cf03-4ece-a7d4-b1475d1400c3@app.fastmail.com>

On Tue, Sep 15, 2026 at 07:48:12AM +0100, Arnd Bergmann wrote:
> On Mon, Sep 14, 2026, at 23:25, Karl Mehltretter wrote:
> > On 32-bit systems with RTC_HCTOSYS enabled, rtc_hctosys() rejects
> > RTC dates whose seconds value exceeds INT_MAX, even when userspace
> > uses a 64-bit time_t. This leaves system time uninitialized by the RTC.
> >
> > Commit b3a5ac42ab18 ("rtc: hctosys: Ensure system time doesn't overflow
> > time_t") introduced this limit to protect time32 userspace from future
> > RTC dates that can break boot. The same limit prevents systems with
> > time64 userspace from initializing the clock from valid post-2038 dates.
> 
> Hi Karl,
> 
> What about the reverse: if COMPAT_32BIT_TIME is disabled, I don't
> see why we'd want to allow turning this on, so maybe
> 

I tried this and found a case where the limit may still be useful
with COMPAT_32BIT_TIME=n. Glibc can use time64 kernel interfaces
for applications with a 32-bit time_t. Conversion to time32 fails
with EOVERFLOW when the date is out of range.

I tested a small clock_gettime() program using Debian glibc 2.41
on 32-bit ARM in QEMU, with identical kernel configurations and
initramfs. With RTC_HCTOSYS=y, COMPAT_32BIT_TIME=n and RTC in 2040:

  Kernel                 System year  time32 clock_gettime()
  ---------------------  -----------  ---------------------
  Baseline               1970         success
  Patch with dependency  2040         -1, errno=EOVERFLOW

The legacy clock_gettime syscall returned ENOSYS in both cases.
The same program built with a 64-bit time_t succeeded on both
kernels. Both builds also succeeded with the RTC in 2026. Both
kernels booted with time64 init.

Disabling legacy syscalls therefore does not establish that all
applications use a 64-bit time_t. The dependency would remove the
existing safeguard automatically and prevent restoring it without
re-enabling the legacy ABI.

I would prefer to preserve existing RTC date acceptance by default
and let integrators opt into later dates once their userspace is
ready. Keeping the posted settings would do that:

    depends on RTC_HCTOSYS && !64BIT
    default y

With RTC_HCTOSYS=y, for RTC dates beyond the cutoff:

D = don't care (y or n gives the same result).
Kernel denotes kernel bitness, regardless of userspace bitness.

With the patch as posted:

  Kernel  COMPAT_32BIT_TIME  RTC_HCTOSYS_TIME32_LIMIT  Allow past cutoff
  ------  -----------------  ------------------------  -----------------
  32-bit  D                  y (default)               n
  32-bit  D                  n                         y
  64-bit  D                  n (unavailable)           y

For reference, the baseline behaves as follows:

  Kernel  COMPAT_32BIT_TIME  Allow past cutoff
  ------  -----------------  -----------------
  32-bit  D                  n
  64-bit  D                  y

Karl
