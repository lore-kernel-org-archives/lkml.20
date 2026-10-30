Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793333304;
	b=TdZWONhJi4l6O3tjYX6PPAz2ncqISjVcYpdO6RE2CSQmJuESqa42DO6fvexmNAW/65hM
	 rtOAjNwiei+KaYlEyolQ1kt0wi0vh0PJLXfKpxr790AvZ25eChxz04fFJT2CmY71i73lj
	 nu2aQRg03C9f6UAKxv/CG8VB4PGiZxwpfCs36CBUMNnnrMyW4fpStJxd06WsElzNmhHIs
	 g3baKunjzTUYrYZKdXnLTgZ38jcAuJrrYslhOLM4yxIzlLQxaqJlvNRvsJDuuvjpIkf6q
	 UHU1jNDYAdDEIXL9s7hW7rPhb1aCLCLIcYvHuBDUYA2SqMh4TmkBKR3JZGT7sPJFEBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vHMUyTfbM/pleWgtTWChHKF1U6veJ+wlhPLF+0Axq+g=;
	b=Q92ZwCwrTUVg87rHJG+m/r5NXf66Xxr8DZQOQ4BSW9M4nDtJvUN5kf6IVZq8qKMClmue
	 QiG1y9Z6NmiDZB/P4tKJwcB24NO62NcTw2lD0b0zAgqhSIGZfFs+IlNLe1AdwU48Z7cW0
	 pl/+dZbSyPV290KaNjGYnBcv1R4Bw+Y3bK//6QlQ4yC2mBTwlz4rvX2BHsosFhyuejCCp
	 ILCl2zfK1pDKZJWZD9t8kCkU+E/RA+lZkDEIxsv8nQ97tWtIZdqShtSvqr4rr0mFNoMzH
	 A+n1a+wBceAL6PELApWBMx9wgRzog7KsKZR/hRf5vwY5tnVL/Bb/KCsEG4HhfTpguAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=g4Tvxtcy;
	arc=fail smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D123606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D123606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=g4Tvxtcy
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-679a2b540f3so232943d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793333303; cv=none;
        d=google.com; s=arc-20260327;
        b=oxOqQs8x/W/nKqSzkRAwaO+dBa8ZKTnXzW8BZjfQkeUugA4vmyH0kzmLh3E8Hz2utF
         AXRbKdkeF5cgMuNX/t6i9VL0k1HQLWPm70Pd+Fzievevn28L++tjgCuwurBMkYhjR0IY
         5OfpIZ8eq+P0RXo8OgWzEK4OrD9rheadVnaN008sy+WLZD9/bRYVJjJ1Mnt/HJqe+0rd
         0J8Z3qX+u3nQp17HCZiFhIqd+kH9BcvBR3Gap7vm3lVNpOZFy78E6WHRcCDQeYAPJ19i
         jgb96yZ7NR0uEaYh8SMjkKlZbwPT0cFf1/2QFRRMLK3Pkiyo8Vga3w1Xpt3MpCQDCM8P
         ZQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vHMUyTfbM/pleWgtTWChHKF1U6veJ+wlhPLF+0Axq+g=;
        fh=eb6k6KvJm8rXMVGtehKcX4gYuZyAH83GaXZ/NMUw1JA=;
        b=HtY8jBobfjMtVN255hVNbOqLsJ39EoLawmC6G3aI1NPREXQqVORqjFhO6I1dSrtZty
         5bcZs0h+ovS7sOYcyj5GTkvfxvTFgr1t+1rm6g3mm5MnTaF72PvSCG3I5/0C87zZ+MXZ
         qOqBXcUgSQ9hXaTVgeUW6KdNmUZlJYOq+9v+zjDbvJp16Dv5IPi0vm5m7aKUZkCixyXf
         hPBrgk+QhDUaEv1tBCzzYpZU2ATWJ/szpJlbX2fLwQt6+CZw+D4+jFz9nZMNkTznuuhF
         flCLFGd8G1sbbgrzW3G65ethWm6zeOue7bgJKtxDwJvxBCCMWhOQt3zdUhQ8Ufz6Lcz7
         3VqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1793333303; x=1793938103; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHMUyTfbM/pleWgtTWChHKF1U6veJ+wlhPLF+0Axq+g=;
        b=g4TvxtcyoKJVhMKVJToPT6eCXbfrGyZ+zJMiGDorDHvROnzFHIb/EQBjjGAvDGhSh5
         HEdxJlNceOWMaIpUOejZKnyoTkPkB40vBEh4JfeIuz0rttUuvWK1/R7f5t2DHSBqqNyt
         QkssSHpha8T4bR5vpwOQ7fCvVIEAKEdYPmwI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333303; x=1793938103;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vHMUyTfbM/pleWgtTWChHKF1U6veJ+wlhPLF+0Axq+g=;
        b=f//FjtfQGeC9+n6Q3y2WenMMwxsp5nXol5F34baHLAX1YrBwvr8YJulhIn0pcBDSYT
         t22RsaB8HGJt0g2T6+ltey5CnFjn88pgZ1mZKeWWj6emw+3bxANbfhaANSKnRW3GEXtg
         JXz+Be0WcRIKC8blivBakVHmV8onc6teIUeNJNqxsfCXGmTFZeT02zMKHbVAWR/Nhry2
         vTjIcUUxuowGFQdqbtDK3qZ5oWnDiQnaOAmeSUWx84VUHvMYkpaLe6lmya8umoJRIOyk
         c+tSy6WEqNLGr3JVkLqVkyaPyMhzHrh8QoE0QRSoCZI8p5ctZ6n5MaOuN0JYTO3iCgVg
         m5JA==
X-Forwarded-Encrypted: i=1; AKwUvBz8QW5L3b8690dN5FsA445koYR0wAuJiegI/D9LXS+P/knl2XbBzWDgFK4PtdEtLU84AYM2f3MFoAQ618M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJd9Nw0B0TKUnsSJjGqU6gwLm8/be0dTAaTwLUSF8Oe8li1tPTj
	Y156mlEDN2B10eohlmHYqaLsAYfvrmNzofZSKSgvg+rnyDVQ3d6Et/F8JuTAs+AZQylBZAVDmeY
	HrxuQHzh7T7eYnEgSkTkQwXg26H5nsfYRa0IUy1n0qA==
X-Gm-Gg: AYBFou37/f+6ZnqXqEeo+3hq/D5Nd7NGH7m7mlhBkm3198bpJWkVv6fAx+fY8j54hAP
	SOdFuJCNtWo7RAPsqOp0pp7DZJc1l+zvvYPE0VCrFRZw8qQmCTF8S2W663ErW0UyGx3J/7+KxDf
	bdcc7h97pcQq4v5ePr1E+rmAGr2AGyjg90vtGa6i+o2KALPvupwm1uHSB6DhmYt9JJvXWiRB+vo
	H3qJE/jTSy+aIroCxsytSlWGh+nWudG8QDxfXr3jhPlddwXzFdtJyotVXAb5BD77QqgPynGkR0n
	Z6XRRrK+2zEq6S8Hm/e5SQQHo8jX6Sk0yViyD3+XwDyzNw7mniDtD9qYfX4oilEBLvvJ8eNQlYr
	knPmZ7B23zum9HCUGkdgRJRdU6IJEl9p+L+sGApVk/jLqB7KHGA2FAh0rDPQ0oIOs3MOq1w==
X-Received: by 2002:a05:690e:801:20b0:679:9f7f:5674 with SMTP id
 956f58d0204a3-67ba4f6afddmr459057d50.55.1793333303121; Thu, 29 Oct 2026
 21:08:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928075237.3055101-1-irogers@google.com> <20261027231513.816148-1-irogers@google.com>
 <20261027231513.816148-4-irogers@google.com>
In-Reply-To: <20261027231513.816148-4-irogers@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Thu, 29 Oct 2026 21:08:07 -0700
X-Gm-Features: AclHuK_7rFAIqZE8MrjY4fMuzF8Cp5z6NDguzVop6O35qi4GKhK3Pu76Vhk8b8M
Message-ID: <CA+w=M=Ry_Ww4UsraLD_tgDo399GzFAQywR6xy_NHqdy_No5ORw@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] perf symbol: Add accessor functions for struct
 symbol fields
To: Ian Rogers <irogers@google.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 27, 2026 at 4:14 PM Ian Rogers <irogers@google.com> wrote:
> static void init_rem_hits(void)
> {
> - rem_sq_bracket = malloc(sizeof(*rem_sq_bracket) + 6);
> + rem_sq_bracket = symbol__new(0, 0, 0, 0, "[...]");

Doesn't this make hists__fprintf() pass an interior pointer to free()?

At this commit symbol__new() still returns calloc() +
symbol_conf.priv_size, but hists__fprintf() still frees rem_sq_bracket
with zfree(). Once symbol__annotation_init() has run, priv_size is not
zero and free() gets a pointer into the middle of the block.

Should we use symbol__delete(), which subtracts priv_size before freeing?
