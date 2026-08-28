Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCFB1FC0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787891451; cv=none; b=OU7bST17gJuiaMsKOafTSeI2C9tkwbfAxNXNAZYWMYkqFhCBwWdjgf1FhKPyYQOnX7AscK6MIP3QnjhMODcX2sfdCHAoRpFd8ae2/3y1kFv6oQyi5ft3AF5ywaKLr3xyXL0USDN+AN2YE9Sk4SdWG8GBdYKX9k5B/ySef1bpBOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787891451; c=relaxed/simple;
	bh=kG58sF3RZ5u9NnjOKQXNOz8FhkA7f7nNGMaw3qY76mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/fJ/zxkJVasBIRVaHQwjYQtsEtGoe7vnx6DusAkHre3cnrf5SYy6k8IDUfJcPfGv2kO5RW5E/Va4hjD2kcVrY5KV/seq9kUU+iTpoOaJpqSwvBQNgXPRO+AoyDb4q5GxAhZjhCui6m0gJdtjY+7x6LfzhTGEtWaXQue96SxNLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HnqsjjQJ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HnqsjjQJ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d712281f8bso6947265ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787891449; x=1788496249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wWELYUdy0evcbSQbyM99+0EsELbqzDDQlDxke8jG9OY=;
        b=HnqsjjQJ96I4GX86C+PjPYNe2AMblWrCe/cj1V7jUWrb6ADQRWIOvgvNhbsAHRaWfK
         cG57yTbTFqx0irqjXcVvfTUaLO0Hk8PVNvKWC71hOAQ1aNESYyHell4A9k78J3zBhh9c
         4gbMMBgUeMM1l/efZI7Y5seNzCiMaeHbX0Jjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787891449; x=1788496249;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWELYUdy0evcbSQbyM99+0EsELbqzDDQlDxke8jG9OY=;
        b=Z26WHM/UL2snUhl+AGvcJFLm9h2BcYax+jpWBYo4SBxSrkIz4HqcgSBfW51h1TEKRa
         C2X/S7z2gGpPfukkz8EVfV84+hainQ//guUm9cKIr39QNAxtT4qfIVRiNgkEucPM67Zt
         bssSaLhsyT8jR44XpG/JMPMAfPDuv6ZeCz0D6QtQ8Gt7incnVnh8w24bT6whBVqpAyH6
         9EE2XtVrQDDf1Kz7eBfgV5VY4yU9UXF1u2M3F3M487pAFYSPd7MIzyb2XYCQsuiFNxMF
         NK7LdBq7ZcE2lO8sUTHp/ZdrVBsRFUggnx2EO8mjI1mvIT14D0ayCcF3LiP50HXwRXb7
         qw6g==
X-Forwarded-Encrypted: i=1; AHgh+Rqwa6jNMxIly+qR616TRhG1MSdKiTiuLg+2rmjaZ7/1IrurfBDEnt3qXVW0tftydnaXVlpV4zaBY5rJlbU=@vger.kernel.org
X-Gm-Message-State: AFuF++nYz1qM8+Hc28bbVnv6FpCPJRP1ne6uhUoe9Xv9SN5vpFbw+miy
	B0IOxbbjCx1dTe+SYMBHvzLfJSDs8OnGMWYknsJ//lpqqo8nUjptSYujNEILIZibHA==
X-Gm-Gg: AR+sD11n4evf5FqP2nIkHS6Q22DPmW/us9hvM85kI0yWqkTFuMRXHSP7UQz3uZJUbD7
	iBpX+xKlOYee9kyY2eOLk52yek/76P1Z+OU6ciBJC+OVGkuar11sfHNKmSlHp4C1CXypW1OQvDD
	rrG/HdAM4i7QHpqVzH4M6yni3m84Yu2sWBqXFbfrVN2tiYQZEzz5YWfeHe5qsMQO1MZ9bHtPjqD
	iHNjTZb5NNVDcJZjXuLJ8ATn6B1w6pVWLhMKBaWxaLChQhCDyHdMXIsBZMKtZ2K3CyfGyzJ4nHV
	x6wNt/KVvuLEFL1MdWcUooHQdCKxgm2nqfa02PuBMuvxFFIDCNws9T+wh9oVaDYMMYcC6Oco0bH
	SE5vxUYvpKa/v5L7qMf8sdwbJWf7KM+9z4JNpAyVaQYJluhmGxX//w5sb9rN1TWVN+aawvfOSAV
	VZN2z0LDavA0j4Bw4Oyo+kNTIs5gDbw7l9PCBK3Y5tNiEMogeMgFGXMwAMoxkxCFuApgEkmtyst
	YJ8b2jm3Ec7PCbSoVsJk8uY+r9Ryul5FTucsw==
X-Received: by 2002:a17:903:350f:b0:2d6:d3f9:d394 with SMTP id d9443c01a7336-2d74ce2d81dmr81411195ad.0.1787891448977;
        Thu, 27 Aug 2026 21:30:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:ff0:ad84:24b0:9e52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7594fc0c9sm1794885ad.2.2026.08.27.21.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 21:30:48 -0700 (PDT)
Date: Fri, 28 Aug 2026 13:30:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, Brian Geffon <bgeffon@google.com>, 
	minchan@kernel.org, axboe@kernel.dk, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH] zram: fix idle age_sec underflow in idle_store()
Message-ID: <apEOgZEaDXntmbKn@google.com>
References: <20260825092316.69658-1-jiahao.kernel@gmail.com>
 <apEK-yRTQR8VdT3e@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apEK-yRTQR8VdT3e@google.com>

On (26/08/28 13:23), Sergey Senozhatsky wrote:
> Can we instead just reject such cases?   It should be an error to
> request writeback of pages that are 2y old on a system that has
> uptime of 2d.
> 
> Maybe something like this:
> 
> +             time64_t uptime;
> 
> -             if (IS_ENABLED(CONFIG_ZRAM_TRACK_ENTRY_ACTIME) &&
> -                 !kstrtouint(buf, 0, &age_sec))
> -                     cutoff = ktime_sub((u32)ktime_get_boottime_seconds(),
> -                                        age_sec);
> -             else
> +             if (!IS_ENABLED(CONFIG_ZRAM_TRACK_ENTRY_ACTIME) ||
> +                 kstrtouint(buf, 0, &age_sec))
>                       return -EINVAL;
> +
> +             /* No slot can be older than the system uptime */
> +             uptime = ktime_get_boottime_seconds();
> +             if (age_sec >= uptime)
> +                     return -ERANGE;
> +
> +             cutoff = uptime - age_sec;
>       }
> 
> We are probably fine doing just basic arithmetics operations on those two.
> One is u32 the other one is s64: we should be fine just doing >= and sub.
> I guess we also can use plain comparison
> 	cutoff > zram->table[index].attr.ac_time
> in mark_idle().  Or am I hallucinating?

That implies that cutoff becomes time64_t both in idle_store() and in
mark_idle().
