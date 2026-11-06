Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793995183;
	b=O3wqJEYTuT2QJHFmj4LNe6LwiyDNne3Zasq0uphnoLTkRPuA1dwEmH1vbqhRANPFIrvX
	 q0QGyu2hWFQ+IVeFQnN3V4GgERHKBPsKSqVL13av711PpuNyQ1C9E7jSWyws1E8o/4aKa
	 T7xM10khs7sHAGcgxzaehZEFYMOHdLgZQe/Ow5J27Swlcka9WivgSvemF+lYyL5e1ZJZC
	 1QtYVldIqh/7+hQpMUJbwe6v9T81Gu7INp9RubVmYxd/+6gi4KBwIoiuy8p2JorKt4uG4
	 DY9wzchWYmo3JFX1M/CUsgBqSx45XYcqsYzhYu9qHQ1xchXMw+fKIE3bcGQQjlORWUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793995183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4IjryWNxdORCjNaHoK0nCSyu8CfUlBnhe9uOpGWyC/k=;
	b=FVht/gcu1GGDFKUUI5GUEpQJvderYhJeunu6mLrb8YdmMdKceSvKyaIfbmv1fODLsgjL
	 JOidfpEKFanLSsbPyA6CJ0swhO0gtr/B/2hNALTomm7DbIBMhi3yujmCZfpGW1znI9X9U
	 pyUUFRaE/c9x/d9nMMN4DX86hZjykMVTSkY8nJd6rUBQRy0RijXo5mthcESto24M3hMC3
	 CvV23HNfWsRsd45KRADdFRrUDLu0xihX0ojWu6A9Iy1gSJ7RsCwunDs1ADajCBfyFLtjl
	 r9wAEL5W72JFHt6IQWVksZbFr0b8QWIl4/rSx9rhkc+25uSJGxwL5fZAAjVAaWX+AzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t3Q+3In8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CE2606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51CE2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t3Q+3In8
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so10212205e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:59:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793995182; cv=none;
        d=google.com; s=arc-20260327;
        b=b5jMmmZOseSB2H1F6nNCjbNH+FYrUEo3g7+DBxjNsyJ+2ZXwFXVX6g2yjBBoXdtlUN
         97wDYlCY+k3hDyd3AZABdacyTN60E0dlOHOaVViAhrbItfbMjOa7oD1O+tzZRE5jy5fb
         ZRwFkf46R6i3cGxNdLLnY+VuuQ7S1gui6N4aKsnAiI//N9s375YKIxcjcYuFXyrWn4+x
         1gh6PRD01J9vPVu3ah8e9jqM04p6gcLMVkfbZb/fL6hKE6DJRJMfKnz9VrjQGx65fLe5
         rQw7mrtyZguV89M/+iGc5YYli9ttzUgz1KhjT3XAXvqW6DDO3dEdcnfddsb2w0kKdxE3
         s35A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4IjryWNxdORCjNaHoK0nCSyu8CfUlBnhe9uOpGWyC/k=;
        fh=Mf0oANhNrw/pfGjfMHod9naDmDjhDBrNbc0SdkbrQSg=;
        b=qGQHA1+xHktK8xdR9O8f4f7OPLWgJQIfSMiOlHcTWJWaJzxfIB437mB8YPwnblAcDb
         x/ttz9DWUsaI1xHNPcIH/LxiJR/iYGBc14Rbmclesq6IRjNVy50SWZT2gGuWPAHp6yhk
         8GMoO3e2t46wobJAqJgkmhp6Z/kPhPc1luCG0SH8qOuy2Sx31de1/T6mdPeGFhtfBijM
         YzIi6UEGh+4WULZSut3KbuEIXRxJTU0aobfBDf4MzIyQD+U7YT6qREJWM8uh9eJdP7sn
         ULa0tsgoUDqgCakRY00r8RX3IciPuo0DRfolmex/da53MosNfcka0UFaeR6e2scbP2tB
         ef2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793995182; x=1794599982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4IjryWNxdORCjNaHoK0nCSyu8CfUlBnhe9uOpGWyC/k=;
        b=t3Q+3In8uQM7jXczqcckVxmrD9TlsK4Wt9CHC6V4Ium4ZBrwEBAvd1gnQO1BxUTABB
         BuYFie7PmRD8o/IgMRtW+KEiHdutxS/qVLj4qc+c74wKlvIXAOy2kTBDjQjMb2uBQoia
         0CqS7gmDZAc2fVlsVrzvf0QMc+CxoTz2Vtn5lSihnzwjb0KsHa16vmauZIigR4+FCC57
         +3gaBozTHvKeZEK7JXP6vd23c05OPd/WBKmRbZlp/WOHw8zxnIClBZrlObjlspa1NFWU
         i4ippmbLxYcHau472r97/GhqdFN8d8zYruBm0ZDMgeRtuKtpnpAVrwrFwmM1slY21kmP
         Anog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793995182; x=1794599982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4IjryWNxdORCjNaHoK0nCSyu8CfUlBnhe9uOpGWyC/k=;
        b=0c5EbP/cRvLnf+kUYxupzOmx90j5kSDVT6t1D+XiX6ssyd+hCu/DRSYtIJxWFBFAdr
         eDx3o6YzcKxNyhODRVB92RvGiHSpY8ii9g3HjQS2zWQ453HayICNq8bjOtOOBQ0G3EwZ
         Fm1ORp3ibAVuYIJNOQ/BM74KGQbn03x/7+r4FIaxRTwNnoCfMYnzK29ZVTUyO+TP/Yu5
         aH8xPDQzWofj7nnrcsS/gHpAelhhxn5cjCfBpNfskjEO07VFNZUvSHyCS+OWJDNfAo5R
         8IWx+HdhIHvcpoHVehgIQY8aDqsmBTZtLdeinZjsAfGR1xYdf/7g964ox5Kd38vswozV
         ckmw==
X-Forwarded-Encrypted: i=1; AKwUvByMNjxwBW9XIkIhhTKWLuR94MXsiueYLfsCm/Xv55ga9ulH2jGE0pdV2+CnQ2EeUGF9b2poQHhQq3ekk1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6UjM/wOXb6Jgtde+kb9U+VdEeo24YqD87DBClbZUMNmPSny0o
	8f4RO0QYguynEtSB+tweTrXiT4p8y/Dd7Bjl8YGpKSnChD+54ghxK4INxqBOIGnjJaJxwziU5+i
	zBeoksT6xqOEw30zARHPCDb8ze+kdDIrAwDCOvT8hHw==
X-Gm-Gg: AYBFou3kEnA+27gS9J68jPis9T2a4EX09OQdJV272XEg/uQN4p4HGf+I9bzeONfFXyq
	iajg5dM1p+8me962QLfiBquzxs/jJp5y9haC6otGdMnhFlOw20bcfl9Lv3BacfomLO0DN9Na0cu
	Xo8h32R19NYjDfwMS9QUCbXx31fmINVYhd4u2EJihldDa/Mhecipw3mkVvJ3NUARqLe1jFtoQ91
	Qig2pObB3CB+NGbFKOJG+SELFNlB1dGLHMYfMs2BAeS8tsveH+hrTNavQCZ93aChFGCpDhIKd5Q
	LmagVZJfQ/zALycGzSHzTCZpelYM6FE/NTtMeBg7L0jM3EKT5o6WuZ0Tx3rnm5xEg4zaLcAGOKi
	hQaxhiaAnltsTa3S563d+bHEyA7l7gzntF0jlG+/hsiUzLsAodh+QGtHSrEB5vK4eJIB9mMSJNc
	cbKB4ZWAmtqUFcm/LpWR0yvSKxgrmZpjRwra5NGYKPqXbbVQLa1y42
X-Received: by 2002:a05:600c:818e:b0:4b3:9540:47a6 with SMTP id
 5b1f17b1804b1-4b6dff86e38mr59681805e9.28.1793995181368; Fri, 06 Nov 2026
 11:59:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106160432.2552507-1-nphamcs@gmail.com> <20261106160432.2552507-3-nphamcs@gmail.com>
In-Reply-To: <20261106160432.2552507-3-nphamcs@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 6 Nov 2026 12:59:29 -0700
X-Gm-Features: AclHuK-x2stv42uMBHd5li29XslCAB0_-6f7YisoUMr7LicPx45if_utjKD95Yc
Message-ID: <CAKEwX=PiM8vc27jOVdinOGO9AdCOpbKozu=Hj_b55y10-ynFyA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/swap: publish cluster tables after reacquiring
 allocator locks
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, axelrasmussen@google.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, brauner@kernel.org, 
	chrisl@kernel.org, david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com, 
	ljs@kernel.org, mhocko@kernel.org, nphamcs@gmail.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, shikemeng@huaweicloud.com, weixugc@google.com, 
	willy@infradead.org, youngjun.park@lge.com, yuanchu@google.com
Cc: stable@vger.kernel.org, ryncsn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 9:04=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote:
>
> Under memory pressure, swap_cluster_populate() can publish a table
> while its locks are dropped for a sleeping allocation. A cached
> allocator can consume and free that table before the populating
> allocator resumes, leaving the resumed scan with a NULL table.
>
>     CPU0                           CPU1
>     swap_cluster_populate()
>       drop local/global/ci locks
>       allocate and publish table
>                                    swap_alloc_fast()
>                                      consume the table
>                                    charge failure cleanup
>                                      free the table
>       reacquire local/global/ci
>       return ci
>     alloc_swap_scan_cluster()
>       read the missing table
>
> Keep the count table, cgroup table and zero bitmap private until
> swap_cluster_alloc_table() restores all allocator locks. Install them
> under the cluster lock and retain it through the scan. Initial bad-slot
> setup takes only the cluster lock because the device is unpublished.
>
> A stale reclaimer can return the isolated cluster to allocation while
> its locks are dropped. Abandon installation if the list state changes or
> a table appears, freeing only private allocations. Restore locks on
> allocation failure too, so the caller can return a still-isolated
> cluster to its free list.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/all/sashiko-outbox-181084@kernel.org/
> Link: https://lore.kernel.org/all/sashiko-outbox-181086@kernel.org/
> Co-developed-by: Kairui Song <ryncsn@gmail.com>

I think I need a

Signed-off-by: Kairui Song <ryncsn@gmail.com>

here as well...

(Kairui - up to you if you feel like Co-developed-by + Signed-off-by
or Suggested-by + Acked-by is more appropriate here. I just filled in
the sketch you gave me.)
