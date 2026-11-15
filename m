Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794749900;
	b=iwidXWqxNQbbciKC1+ebowGbGESMv695NHIVwXu5d1fOyukVTWJhqpMZr7XNftF5L8vi
	 GoJ55VIKkiCPBH3i5s//bTRqoUx4/IdIDzMHuPTq8Qu4RxlVIiSyGyJ/Atnu6nDzyT7/F
	 LpFBkxB1HpDg2MWXTAfT6lpC+h5z5YGgJ2WuYjWdQKzF4Eq+/aSVItSgRDqY07xPNExbu
	 KNhGG7CM2NViMWxoXDeOVvwSFfCVUau7OVE4+PKORvJd5CbUAh2axTv9pym66EfV8dMlx
	 yFqmL6b74wrHzI8UAhR1kGBYgiUkylQnN6rpyXTvdy498+WA2M9ozhsbcrYiLfrg7Lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wc0p1pQYXQO+NKwG/7057xQ5jQrT9EGibnAMu4kS01M=;
	b=qGiLdiDgBjU4Ti2gcxQpDeq/dKSSQk5f7/HEuMOgR+h+gX3zd2y9qSGtAaWJ12WJq6Gs
	 lXhyJ1WZH9Wet28dhAvEdWYecnyHZUMrmKQ/fETMRRrqENSjK9VUC2oamCJZk8wFcLB4C
	 /xev0We8Z2NkYbqRQiv9WWR+fTslIDInewh+bs6n0CYMa514Sy1PoOVtS+RICvVUSEMaf
	 /r4uCSxtLyCR9XFywiqNF0Agztm6uv+tLbDl2y5xQY4oc5J+X5RusrrTWed3JY2HV7zFa
	 BVuITKQDCFRdlrfwzRcZrnvqGD8/4n9T2+RO9mFLjnihZ8vXHhW4uRs4pXoMvaqhCOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YYlr9kBY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C102E606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C102E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YYlr9kBY
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c14f3dab09so1775858e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:38:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794749898; cv=none;
        d=google.com; s=arc-20260327;
        b=iPhmdWTQ1kTdejf9oCgrSipbkorsS2UXu/FD75ZKr12iHrXpK+JbuGvN26YqXYNYLO
         Tt3aBYYikklE1Ku9VsLAWGLVl2cuOB3nqETz/cFFQ0/mvPEObuNDpI5/k71ZL3Vq0zLd
         Ee6qp+vwbIIkD5l5O/+TFIvBj4GH8f5JsoiunOHmK/TRop9PnWPzLOYlEYg2uJNrQBcN
         50vWlyx40hMb8T7dvktnM67WyGywkhUBPPs9QTbHxOdMlP/9wSweK3qQuFsRjswzxGl4
         Kc9yvSfA1YD+W6M+g7T5V5ZO52nlojC64NvInI/Z24HpZ2YhEYsZvjE6ZZ2RvlJ1Mir6
         iXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wc0p1pQYXQO+NKwG/7057xQ5jQrT9EGibnAMu4kS01M=;
        fh=zYUlDVzztGf/jbutWj0W0qTH92PRrVIP6HrWeYXin5w=;
        b=jtUKpKoQA4RtDQj3bYXX2ypE08rbyFwyQpYB0kBr9jeIvVlhuOIMv48Z7D9hr4Adpg
         Pyb+ni6nmzLI5W5UgPsuMzQSXG2tUmqSUJHu8DYlR83m70HHMaAuc2tb1uRGh9o3wlav
         gH0qbpUPmGVhVN/x73ruVcyF5rrT9Ad40pLkbZRgeVTcGAJ4GNX+hn2g0wTRw6VftMxT
         GpKfAt64mCxrKvfzRbqzIjHFZsuHmEbl7oDo3VZ8T5b9wpx0cS5i2WZD6EcwthhcThxL
         +AZX5hJAF/7TWfjN4+poWgsTQkeEp7SmAEySiRWRfWNIp9WQk1KTaqyRm0v7mghepl/t
         vOpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794749898; x=1795354698; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wc0p1pQYXQO+NKwG/7057xQ5jQrT9EGibnAMu4kS01M=;
        b=YYlr9kBYDtfwjplR1uCSL9Ig8aDVsSjFdt2UvTSvpSug+pkAjf4F4iOlt96GZVeUiW
         pNwMkqyXbNazITwly6K5Rf1BiSqSSl+yMGkISG10CDxHof9PXfZTCJNBIKzA8qM3GzJ5
         dde0lmUnWUahlEbkZvSTNRXZxSForITQqScaEsSKh2wJPlUFJh1BXB8w0aVbX45SUv92
         jPP7H70UEZtGAwGi20B7t+upQUn1T+qfsSF6nhgytEcyD+lfd9rgf9jhVQanzHe2iN0e
         8+C2kZem5UnAn72Z1yqMHAdV4YEIuK2CrwQKSJBPP3Q/pjuBoDA89sm0efRnb2p/IebJ
         tctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794749898; x=1795354698;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wc0p1pQYXQO+NKwG/7057xQ5jQrT9EGibnAMu4kS01M=;
        b=ISHqCV6JG5agQsTwsW1qFl/o6kpze5UAb29utjuT3ZIR1ovvTdULSD0MzYnBNcJYGA
         5c8Nr3X/cpeIp9Joj2pWf8ErvKX7dARbX+HcSWoESz9KfDV9sM4PEjX8gN2nCI6LUSC8
         fd6yejiGlIs48HG1lWbdR+0iL4GvhgRRWDKuH4eaksvHTQM68XtSnpWBtG7vmABbapie
         dwL8XvOHcpYsSgBixvu6SigVsQEr7ad10PACVW5utPwUs/pEi6+vjvgXTX+18Xpfiebb
         swYM5ezW3MbkIqVIMOy9osM6xQXjLB8lGGMEaOtWhSE78NZQWyqhLN0tER2DXrGz8PCh
         4huw==
X-Forwarded-Encrypted: i=1; AL+hErHuy++56rw+alzoKmYes3AoKpiZhEFiS1EoExdF9MjQfSAvtB+cW5/anqVkOq/DwdlM9vwhAw5Wkpyxa58=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W/78/u50nThSe4fh+DfYvTq6qwaPDObt2pXPVHE2sH2Ew+uYm
	x/hWZR5IucUZYE8HEPH/YXynyGuZxuHgOa3w6gfdeC/98xFw3lEZMNIV7qVr0B0Y2ovocp1RMN5
	S/78m+TKztdU5R3eGxI+MzlDQFuf34D0=
X-Gm-Gg: AYBFou3hHo10WmOQJvwGkx+lzGnU/orXAlVG8VyyCSFm2YlFcCqAJBS1nAgDUQ3yNrR
	FCQFEdj1FKywAw53XbXV+p4ASbijnB/oycobmOZRm9Y1J2S8tY9aaiL/ESPNm7ZRgNT3SbNOLkO
	zrhDoW8pPVl8cx1AQrAPCWmIZpQo/7OBkSzcWwgk04JubkTV+Pxc+svH8nofsHI6mKw9wFhNw2G
	PkzgOQ3ERjpyniAXISOzfT/4KZasPRI5VOlBacjUT61hs15KurMt6MCcTt6EXCCoHzHrRehqa20
	Lqf9Qlk/h8zxRHO4q90jt+sbpkv5c5Pi0U1OCmyefBzvyjmhFH5r7y76mTaX0q1dPJCDZAi2EDB
	h/XqWX4dAyOoROpbSwRc7NEqe5tylxgVQN5go9Sy1Q22GHtiq7pSc9p2nSl1SRs7+bdKo58nMHP
	7a5HYo+0TEQ5pNkSyu+HSlDbgK8173
X-Received: by 2002:a05:6512:3f27:b0:5c0:d9e2:f66 with SMTP id
 2adb3069b0e04-5c1709d6adfmr2815178e87.20.1794749897634; Sun, 15 Nov 2026
 05:38:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260817131843.45121-1-husong@kylinos.cn> <CAO9r8zPqJncFKQbF3tGe1d4sg-4dLQ3dQRGze_vab26wWrXTqA@mail.gmail.com>
 <179438454803.6.16655549133383619919.zswap-rstat-counters@gmail.com> <CAJnrk1YzYswBKv5F3=FF_o_4Pywgw0ifLq0tXYSWO7TARnFRJQ@mail.gmail.com>
In-Reply-To: <CAJnrk1YzYswBKv5F3=FF_o_4Pywgw0ifLq0tXYSWO7TARnFRJQ@mail.gmail.com>
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Sun, 15 Nov 2026 21:38:06 +0800
X-Gm-Features: AclHuK-5ywgI9_mymL8VnEcpC74I2pRU7d5bhSxPyILgrbhzzhuo7cVYo0AazQ4
Message-ID: <CANGjgdnTjbou-XFqip7B_cGjrfZzZpan3dFuAk1-rU3bJOu8NA@mail.gmail.com>
Subject: Re: [PATCH] mm: memcg: use ratelimited stats flush in obj_cgroup_may_zswap()
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Song Hu <husong@kylinos.cn>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, yunzhao@cloudflare.com
Content-Type: text/plain; charset="UTF-8"

Hi Joanne,

I tested the non-forced flush in our setup. It delivered PAGEOUT CPU
savings similar to those of the hierarchical per-CPU counter variant.

The only change in the non-forced variant was:

    __mem_cgroup_flush_stats(memcg, true);
    -> mem_cgroup_flush_stats(memcg);

Both variants used the same MM base, 2967f3ccdb5f, and the unchanged
reproducers attached to my previous mail: 32 MiB with one worker, and
256 MiB with eight workers. The finite memory.zswap.max remained 64 MiB;
compressed occupancy was about 18.75 MiB in the larger test, below the cap.
The hardware was the same i7-12700KF with microcode 0x3e.

I ran five separate boots: baseline, non-forced, baseline, counters,
baseline. Each boot had two warmups and nine measured program runs per
condition, including an unlimited control. Reductions below are relative
to the mean of each variant's two adjacent baselines:

Finite-limit PAGEOUT CPU   Non-forced             Counter variant
1 worker / 32 MiB          12.640 ms (-45.72%)     13.276 ms (-43.04%)
8 workers / 256 MiB       202.784 ms (-84.03%)    207.455 ms (-83.55%)

These are summed worker CPU times, not elapsed times. Whole-program CPU
reductions (non-forced / counters) were 22.57% / 20.97% with one worker
and 61.82% / 59.97% with eight.
The counter variant is the same hierarchical per-CPU adaptation tested in
my previous mail; it retains the existing rstat updates.

PAGEOUT CVs (non-forced / counters) were 4.65% / 4.33% with one worker
and 2.91% / 9.26% with eight. The maximum absolute PAGEOUT baseline drift
in these finite-limit comparisons was 1.69%. The small mean differences
do not establish that one variant is faster.

Separate instrumented admission runs also confirmed that non-forced does
not mean no flush: the limit check performed 53 / 818 actual rstat flushes
for one / eight workers, versus 8192 / 65536 with forced flushing and zero
with counters, while successful stores remained 8192 / 65536.

So the simpler change appears sufficient for the main benefit in this
below-cap workload.

Thanks,
Chengfeng
