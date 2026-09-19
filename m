Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1F62AE78
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789776657; cv=none; b=fwhjJE+r2kAVtkuvqdSDw/NAC2JV/vErGmg1yt3s+0SUMNIPYkv49LvkEtT8bEkVoFlWhij/dfIKA4Cyh68EmhwuogrgRogpBMSLVPIEcxCdnLNbf5UmkVbj9P3axJ0UWb5G5avyI/iHaA9oQg1HdAnSbuWbU7moTLTdfk4JpDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789776657; c=relaxed/simple;
	bh=3u6LxnO8S1L+FvP8ydBlMoQhfmEUwHNhq1NQs26uljQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6H1Hf0zvUMgHT1AGFpUog3vihbXh25AMLLHdp5Avs62HqMAb8K9BylyKNI8ZR6Kg6008YkH9js9SYqtuJftuXloWiuAZ0JhqNrZJUxLsDnde7oz4NTzZW6AVsYyoP7JW8yGOyliwku1+rSjnp+JYWdbbPGiaiBTurkMG18Yfi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhUJvGl3; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhUJvGl3"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so12397685e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789776654; x=1790381454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F16K27rFvLVNRx6pCd8p7G2zjKaT/cQ+4xi5Y5Qi7FA=;
        b=hhUJvGl3ySjIreu1dRRysMpHDGN2n3QJLRYjWQr5AKLuF6dwZrCKOwCkQaXYMizSo4
         otV93zsuL04yqkVAmi49//F4KapECyL4WPSKc7cyd6fYHWoQCwNIe6y8oW+ysTycr0Wg
         JATxVeKQnnEqbK6hRTT6ga6QvmGfStmcFF4ZuyIP5THbixgBcrO/kO2sq6R+nKS3GCpF
         kmUiP6O3LQ5ZM4tT9x0FlorDehx9n/67rg2uB1zKaNGj+SGQ3STTRWPO6NaOlK+mMFmu
         9I5m/poIgsqP2x3z7PjocmX213LeHuZAWXO1fOYI7auB1jS4kL5SpFoU53Rf3Dz5ROtj
         GkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789776654; x=1790381454;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F16K27rFvLVNRx6pCd8p7G2zjKaT/cQ+4xi5Y5Qi7FA=;
        b=feSXH2+W+nm6calSZNZaQeRMABoNH86XM6ttM0wKoKlVTHvoN1DcTU4OA6YfAiGAL9
         Z+Ll6cGXVuKiQiTz5MWvqqujcs4+AxsAIgmvfWskInW92s7StQwW4Yu/VmwUOc2vhJ2w
         EQUBqTVEA22QKen/Fga9XzTf3ugG7pfvPyHVZyqrZ0HzGjDeDreEM9SyvHt+OmuJ4r0r
         sF8ub9smHwbR1KN2zGv5ciCFbNQ5FoRjHwlmo1sMnH36XZKxzFrcqvmDrKzVjHfe4tah
         FM9jaVQbm6fShJIOA1ftl76QSDl5LBCbZ2NMcW4DswQFegn/CqEQqg79JPxYzsIYENIW
         hQkA==
X-Forwarded-Encrypted: i=1; AKwUvBw37hItiNuOxbgN9VUGuuQv2afsbXhUmcZxw8n3FOxzIVVNsDotnC/R8mhX9wF2oLZ4qPRy66PuesuM2d8=@vger.kernel.org
X-Gm-Message-State: AFuF++lyJOx0IIZOHtAaBh6jVzqNv1F3akr8bfAo+SBxS9hrQfOzEgqt
	hu5jAgegiQuT7V64NMED38dBglh4T3Jgv/LnhmBT1SI1GLZDL6qgySum
X-Gm-Gg: AYBFou0xZIiA6ydxy/17XUqY2dXSLhfbPvSeNsgvnVnadkHUXlZbYUN6aAeOZAtEZmB
	XhP3HbgE/mGpUTvmtaTD3/pgqfQIbcvkYUC6hXw/hbhHg8zLuFlHxolRGRo7iWcQTIAuWy/fkM/
	4Uk4rGtx3fwLq9Cb5XGgvEbyQsWfoMAqjdaogYZX3GJvctOSL4wHjA7yWIdO6ZQ8Z+FwHYZiCux
	uG98ptOF+no076bRt1zI6NuoYax7GC7N/ZNSd0YQPES2+VECULmiQ4TmCjmvX/zsxpScW66kq1e
	WCuJBwCZ1fyYpQ9uhCHGairTXPJBnhPeI/j6WA2c5iqysLcEm4EXpVkFl1zKkE0Mxga4u2RoFHm
	khryVlsg3hNma3tW47gQV3QId19hCeUApUVIRCP9VmMwr+2QW9RElIb0P2wOynIL60JNkjKw5CW
	NYE9iuGSqv6joGUkak/DAD8BM4hXEP+mDNlCGqVwxZoSVtmyi5ZQ/voymn8nu62geJdu9TN/JZv
	DUPW2yOadGy2UmBo1G462aNSQJ88r2wgz7iwoXaXEl+jQMrDtDMUDx+5ST/3tlr+cMse1h3iPal
	P0Z21S0zNssx5tSQ94m/aMPZeTPTcvb2BHGY1Nl10Urpq/T593ti9D9tj1ezL38VyC+yoIgj9ak
	2
X-Received: by 2002:a05:600c:3ba4:b0:49c:fc6c:be15 with SMTP id 5b1f17b1804b1-49fc57414c4mr69034665e9.27.1789776654097;
        Fri, 18 Sep 2026 17:10:54 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-9caf-5101-81a6-ee25-6e95-e1b0.310.pool.telefonica.de. [2a02:3100:9caf:5101:81a6:ee25:6e95:e1b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0f7b9bsm28519515e9.5.2026.09.18.17.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 17:10:53 -0700 (PDT)
Date: Sat, 19 Sep 2026 02:10:51 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: class: Make the time32 hctosys limit configurable
Message-ID: <aq3R5QnCpu_fOq8g@gmail.com>
References: <20260914212537.1452-1-kmehltretter@gmail.com>
 <7c020979-cf03-4ece-a7d4-b1475d1400c3@app.fastmail.com>
 <aqnHDxRIBncNH6qr@gmail.com>
 <59ba6707-c5d5-4fd8-9200-f910e61d9232@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59ba6707-c5d5-4fd8-9200-f910e61d9232@app.fastmail.com>

On Wed, Sep 16, 2026 at 08:56:02AM +0100, Arnd Bergmann wrote:
> > existing safeguard automatically and prevent restoring it without
> > re-enabling the legacy ABI.
> 
> I'm not following your logic here, what is the safeguard?

I meant the existing RTC cutoff. In my glibc test, accepting the
2040 RTC date changes time32 clock_gettime() from success to
EOVERFLOW.

> With a fixed C library, COMPAT_32BIT_TIME=n should act as a safeguard
> to ensure that no interfaces can be used that limit time to y2038
> and break unexpectedly in the future. The RTC_HCTOSYS interface

Should we try adding an option to build glibc and other libcs without
time32 interfaces? Looking at musl's source, its time32 clock_gettime()
wrapper also calls the time64 implementation and checks whether the
result fits [1].

> actually make it work. Since we have COMPAT_32BIT_TIME as a global
> option already, it makes a lot of sense to actually use it here
> as well.

Could we use COMPAT_32BIT_TIME for the default, but still allow the
limit to be enabled? I could split the update into two patches:

1. Add RTC_HCTOSYS_TIME32_LIMIT with default y, as posted. This keeps
   the existing RTC date acceptance by default.

2. Change the default, keeping the dependency unchanged:

       depends on RTC_HCTOSYS && !64BIT
       default COMPAT_32BIT_TIME

With RTC_HCTOSYS=y on a 32-bit kernel, the default would allow
post-2038 RTC dates when COMPAT_32BIT_TIME=n. Integrators could still
enable the limit without re-enabling legacy syscalls.

I suggest nominating the first patch for stable. Would default
COMPAT_32BIT_TIME also be suitable for stable?

[1] https://git.musl-libc.org/cgit/musl/tree/compat/time32/clock_gettime32.c

Thanks,
Karl
