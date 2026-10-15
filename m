Received: from mail-oi2-f9.google.com (mail-oi2-f9.google.com [74.125.231.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A164D2EC4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792063451; cv=pass; b=oajb0jPYEJKHBUQu+/fL9orxiWf9LPwSKdLM+QdTfkUum5gqdsZoxRASxv0N/x4+7oeVOqpLnSWDvTb6xXdgEUXPnhCLtIDZXJYasGCrbZ4Hb8u8tp04HnxKuLyiaUx6JXViYe2l9RfljAKuNe/rSMDgl/v7BMq0yBj+/jS7gUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792063451; c=relaxed/simple;
	bh=wwroiIRXs/CRA75/gQ0CHxDlWEw1REJkT9ChcJnJ6aE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BYMPqeiakC/+Y/sSDTtbb/4K2uLkQSYDhgNzT5ITYBtZt5Dq/j/mjnFY21Z5oHQmwcyloCs9I7+fEszJ2prZEqpoOUv5YF8DJcY2hzydJuSmAlCAve/HOFHKD5yRacfLlULN2OOBjU3Zk25pCQwHUh309Q3kMG9B/AM5NW4qlT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2yprzl1; arc=pass smtp.client-ip=74.125.231.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2yprzl1"
Received: by mail-oi2-f9.google.com with SMTP id 5614622812f47-4f61e12e8e0so786018b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792063449; cv=none;
        d=google.com; s=arc-20260327;
        b=Hbzj04YQObVG1L+VxohxRN5/e/0DKFP2SBy0zkLArrULhiHsVB7GXofBfc+58RoXVm
         quZhcCOfU+HaNmsSosQp1lAE59NqxX79X4PMIHLQ9zN16YAlSqNitz4fhSQRRxwQyC5s
         B8FNOgQi78nEZqgb8hsVAVNhwaTNpTBNIUThVoF6VQvqY2qs7NMzdkMPQHIPqVakYm/8
         51UxC3BfINFGdOEhJjJ2tAyYOPj6+Jcs6PgMyjHD0Nw3bwszLW2/14i4z0KwHZxZg7Bg
         atWu1hEiALidtn6JmOIQNcQORlrPGm3mrItiRrKIKOoPGqmF3Qdh/gT8KyiVlZ9W/H3O
         3W7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=WcPHvbOIREflq3CVha0FzUPYhrPrea+3ze3za5U7XAU=;
        fh=3ubTbkzpWcQB92XPNrXpkdwoFrq1tQpH5W32+y07Fuk=;
        b=TyXOTpdbcXIuU+QPLipc7eWUcehCJvuinY55tnUcELqv6KcYwHe2HUmsMXgtfuFcP3
         hoRjFho72qSZv90yTxRI7G+Huyecm+oNYBk/94rYmpJV3I/FglU5WMnt5Fil5mCnvEOJ
         fbkdyrNEQ3vbuJpu9jdfJWx1pNhVjTsPVcMijtV6R+mbH7jbPGv/DWntuktsi/kfVxl5
         LhJDyy3GgCxWdhXetSFaFXz4Ffyu96+/2wR3C7WBT/P7AmS3KuWRF6NgOCHbkh4i4Hi7
         TMI8Vfh7crDlkinqlrbcjza8QXt5oqLiVD+CAF2Xb+lVJ/WcwRJQPfjx+8sJXWd/ZnCn
         Dfrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792063449; x=1792668249; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WcPHvbOIREflq3CVha0FzUPYhrPrea+3ze3za5U7XAU=;
        b=k2yprzl1FgiFKsR7TODHPUvCLN/YPuKKzfswDN2KzbNujFoLGikO1ckwsYTEYKt//9
         /9IAe7a9TvmzJDJvsuinLpKrvq2hyaGa+4InucZbLy7CZeXZfEFkS/Dyue+FH8pzDmXs
         ZixlbnPSNR4s421f+PdKrNePuAilRH80e7fCr0koJdSIUSz3aNGieQbIeQwq3ASXSCrV
         UUM8Df8F+fgExuHJPpVQumGgjwWppNbKQQp69nqA318EUL3jiqUZy4FBAmT53EGsluDv
         p+dHIrd4prPXm962aqOXVb1x6rgHaCp0zR1BDJ63VtPerAE1av1LplSiuSfPOfJSQCkc
         SfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792063449; x=1792668249;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WcPHvbOIREflq3CVha0FzUPYhrPrea+3ze3za5U7XAU=;
        b=Kq5BIaLltI4/ZlgOTis1JjH2ucF7Wj7OCFFWxFdgVGntm16H1dZedQ1Efz9gq4jlTQ
         IQhPz0UwzOPuRjD9GM6uDNsML3ogbHhv5fWK9lPMQ8XX1rJddklJdg0Yx9miaDZILfaL
         CohWcDthBymjaNzZCZPC9tTpTy0W0AnNz1B/shW9to8LGVJe1dC+//vTxlOEXO7KGT2V
         U+q9iE3yqaRnIgqKpsCJHrrJ+NMyqWR3R7jLKti/slUZ+A5yd/wSW4e0edME5rEjBOm2
         hXS2g8TsiVjT6rtjDq7dA6LqlNVcP8RHwctfaUv6yWzOCwzDpFikzNztHuCGZ4Jt3JLV
         xmyw==
X-Forwarded-Encrypted: i=1; AKwUvBwc57LVRldGFO2hOrPRTpxgPobM1l1mm97aS9h164f8yoSFk/jwC68xWNnCq3UbZ9KpPd/qOqivSH4a24k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIn0LQbviYG37lzzYG0p/9hC1Bl8Pzb/eV0gHeIL8LiYbYD35J+
	BOH44+QuMEheAlWG2RyXo7G/f2VywYUaUJ4RvIrf1CA6mXPZMXCx5ycGLtbLOjTPVxivauIMnM2
	oO8DDDgivNs9TBxW0Yka6Op+qCprwu+Q=
X-Gm-Gg: AYBFou1ihMBsxFgHca3ZWIOHrk+AYWQ1vKw7QDzpmstox6bVdTZeMN81/bGtWgw8E/v
	TQfsZTsrY3f3lEBhehML7WpSV+Xja/7ocWy2kIKRFVO4Rva3Uv5U89y/3kiTQuP1PtMACjHDJyT
	u8NDhz/MIT9qJQcN3MWNgllhDYvmTDVyv0Q4/FHo9+R3HvhKB1pKDNks0xppttLlDDSLgnUWeK5
	QwfsrEJX9HEpAUJWGy78LSpLl8QqGxdXXoNg6rXbhShJIysMGVkuQfNzAzyyWi96MMHkfH39Ryd
	qr9h/iWzcy9Gi+1MoXLzmXBqMUAoPlqEs56ax28ocqbyElMQXqkdi6b2UnrlP9gmyIa/ERGS8Qw
	4vLmKUdUccA==
X-Received: by 2002:a05:6808:15a7:b0:4e9:73ce:e2a1 with SMTP id
 5614622812f47-50c5417a0demr16310600b6e.44.1792063449448; Thu, 15 Oct 2026
 04:24:09 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 15 Oct 2026 07:24:08 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 15 Oct 2026 04:06:47 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aveline Noir <jm5905938@gmail.com>
Date: Thu, 15 Oct 2026 07:24:08 -0400
X-Gm-Features: AclHuK_yRe_VjBLBEog6BC-f_xFyKGJAr2pWJTMKXgRYUILAdC4oSPS6DMOyP2A
Message-ID: <CANOyQmFkTQMEpR10sxjoB+8XMsk=m9DAJVnyxguwV2LLYCg09A@mail.gmail.com>
Subject: [BUG] DAMON: 32-bit overflow selects wrong sampling interval
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

In an unmodified i386 QEMU kernel built from mm-new commit
ad9f2d463666, an intervals goal selected a 2500 us sampling interval
after the first aggregation.  The same trace inputs give 2812 us with
full-width arithmetic.

The kernel has CONFIG_DAMON_VADDR, CONFIG_DAMON_SYSFS, and tracing
enabled.  The guest monitored a 1 MiB VADDR range as four contiguous
256 KiB regions, with sample_us=5000, aggr_us=100000, access_bp=400,
aggrs=1, and min_sample_us=2500.  The default minimum of 5000 us would
hide the difference.

At the first aggregation boundary, the four damos_before_apply records
for kdamond.0 showed nr_accesses=1,1,1,3.  The next
damon_monitor_intervals_tune record showed sample_us=2500; sysfs then
reported sample_us=2500 and aggr_us=50000.  The records cover the same
four 262144-byte regions before the first tune.

For that aggregation, the inputs to damon_get_intervals_score() are:

  max_access_events = 4 * 262144 * 20 = 20971520
  access_events     = (1 + 1 + 1 + 3) * 262144 = 1572864

On 32-bit unsigned long, max_access_events * access_bp wraps before
division by 10000.  This gives a target of 409364, a score of 38422 bp,
and the observed interval of 2500 us.  With full-width arithmetic, the
target is 838860, the score is 18750 bp, and the interval is 2812 us.
The later mult_frac() remainder multiplication does not overflow in the
observed 32-bit path, so the difference here comes from the target
multiplication.

The affected expression is in mm/damon/core.c.  Widening only the
target product would make the later 32-bit mult_frac() remainder
multiplication overflow for these same inputs.  The 2812 us result
requires sufficient width throughout the score calculation.

The 2500 us interval was measured on the unmodified kernel.  I
calculated 2812 us from the trace; I have not tested a patched kernel.
The i386 config, guest init, serial/trace log, and build/run steps:

  https://github.com/jm5905938/kernel-mail/tree/195d7017352a3d0f4a0475b98f3b03650f5c14ea/cases/2026/damon/2026-10-15-bug-reports/02-intervals-goal-32bit-overflow

Thanks,
Aveline Noir
