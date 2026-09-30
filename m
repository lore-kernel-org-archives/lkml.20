Received: from mail-dl2-f17.google.com (mail-dl2-f17.google.com [74.125.229.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A5D4ED1B1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.145
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779641; cv=pass; b=Niu3rW5mIigGowyuUBjLfS18awivI8pvE1A4wKsbO4BUTnDxQ/Uo0VphxsbPfhAtnOvLxx24X1kpU7bl89iLq6EENZCHw/tyOV3rQVhocSXB3b1JMGxEQ/+UWQr+mT8qzJF9AyAj9rGrPHv2R5mZHCLzUEERyVIXdJgTdZv393I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779641; c=relaxed/simple;
	bh=Af1gMjVGt/dxyHCD/nU2bpayi/xIJE+6EgfSAbMf97s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uff9NFX6/NSGc6P5up83+XuFAS8Wq4Bm8EB/za73wP6yGXY352EolhmFHINK61J2a7X7XKgkFTA4fw/ICKOHA73PA2TKL5aM5mGw5KYu0SZ9j4qmeH0KxTEDylaIyV8yPD+qcfkkJFB9VddfW4srKHWpk3qJ3aoBWkhRDtggw54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r9s6yniD; arc=pass smtp.client-ip=74.125.229.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r9s6yniD"
Received: by mail-dl2-f17.google.com with SMTP id a92af1059eb24-1460bcc512eso3251025c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:47:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790779626; cv=none;
        d=google.com; s=arc-20260327;
        b=peg046qCtD5hwErc4RV1T4NIaiPkVyVqTrvtSbzFt1u3uFwPJcTLT1GE/FTPYlpCoe
         psB2js80NJNw+UzwJScJqF2g1Y4aG6NTwerYpVdYMPZm5PEztbaWQFDHKkBV8UueB/qX
         wQQoYlzspBnzwIp6YWY54IJ/ntaZACexP8t4/czRh1TsBwgYuKkL8+g7lmDyo7+Tlhjz
         0sAd2HV846LWWNdpvcrCFPKOcRDJyXc2zhh11Wp1u3RM79O5+bHVWEA4jqZ8qwPXuIjD
         o8eWx+tjkUR2NH+RjKsD8l6bdUuEhsZOYleoEXCgb3fvgfy2NV6K+hG4osERK54T6I47
         krSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oFcCfJCZQlTKSnrIaPIorXjBPyF35HfV9C/IYTWbqSU=;
        fh=DafNgjFgJbyRjhbV1OWwJCqtdHJanLRYd1CYy9fvvVk=;
        b=dRIuy4rtnkD0Nxik13HypvGrW399uUhQfx/dggCKmhapFDAQdDroPbq8tHF8Apnl4m
         WlJrWaQCTcVPmjB1Fxkhhsr+fVxJCXiSXSJP18zjSQbkRRNK33np5EE3TnCwAQ30kipV
         HWW3RESZhd5k96nTLc7KfCbcwHbVReH9VqiNeLAowbqyAVtCaICN7yiFPMtLTprhu3lo
         lJOiOjjZnQv8AdEH6aELXHgG4n8dFqj1UgQxxGOKIExqA10y5MSY2Oxu7/xwKmb4F6uF
         7KWi+58R+5dsEtMkQUl/n5KvSFWLo2q8tsoxiKIypWzjmy6+PG7hEmyFwoInHu1y3McG
         2sNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790779626; x=1791384426; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oFcCfJCZQlTKSnrIaPIorXjBPyF35HfV9C/IYTWbqSU=;
        b=r9s6yniDBznHDt7GQ8fAQ2oZBHWssxz0gi2Fjqy1GGkrK8QJaEmN3cV6wfFFcLo863
         HO+dN2W0pQ0ZpBlGjrticATl26hMTgewXBcNApsYgwuqX/5eQGBwNK1xG2Q8Ky2Ua0ay
         VSHcQHeaPLbi9p8J1YVSN1HL453NDqgq5n/Wmtvvu/hoA4wApbNk/vUSnSP31JAdncnv
         fZ3uG/K2itoa1EbO52XADu+YDpoDH0JqTyUmQWMC0TjoCVTbBySeNTlUQaDku2/JiOI+
         U+4svDjkY9uO72E+Oz2spTW3nB6TGfnMHQY04wQyvNuL7XmF6XSFtC0jU3m5q6Deio2+
         hsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779626; x=1791384426;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oFcCfJCZQlTKSnrIaPIorXjBPyF35HfV9C/IYTWbqSU=;
        b=1IjvaivuiH/+R+rjEOF3yXL+QpGt2KmiGoAyw4JRW/yndgm6N3XnV+LHuzzh+euDxz
         aRvoLBnh70Ynv1+WUA30PbbSgejEOtd2pNWnfJmMS1fynoSMHdTIEzf2zN+mW4duUygh
         CPCMUiYtwp0bQQ5tzprGEvgWlvsvVPna6joocdMBbaZVaoasMU5+MLJYrqAUf0jtP4ab
         SUiEnqHO0P9eoCVHb3NpdlvCTyH5qptOzVkwZmGT0SBlMF0sdupMyJDyQYRTvA1uJgTB
         L0vhp/W6GNJ0dG1N7BoNYMGi/M782HRXcBT29oa5ffZQ1sBSpqLI93KgUzQsfnqTQYJR
         OBIA==
X-Forwarded-Encrypted: i=1; AKwUvBzgQVnNLerJ3/jodfP0nZTFE680rWUn2YVXU54Tr7sLS/QljugFuGts3Sw7ZfdFcs8ykJPl2yu9DsKDZp8=@vger.kernel.org
X-Gm-Message-State: AFuF++lWuOzfHBNIouVK10tBHlpgBf/nuLIsN0cWJOpWSaZXfXgDoAmu
	+qAz4lRDk3v0KZr+qP3nrsze0FuU8pyE7Fg1OK2o9cizKDAOuqX/AYTei6s5HzD530NLbFp8VXh
	AsDbMZT4LQlKZ8meL/Ftvo349u5c101mBubYcN76w
X-Gm-Gg: AYBFou2I1+iQQT9T1f6npB5NhniluPfGbEImRBiAtR2X7+t7QhDxteErrQy9XYb+FCu
	lFj3LmRxBt4BvKLb20/fsrwJY6b7w4jNnRYoXgRc96h9afNl5a/dCtmmdPn0JaUputRwiYDOI4F
	kO6Id0GSfpYZrkg3sPgeqPjmLp8sX17sHBYHb6Kput1X6DBfL+GDKO2hqVV3I9HcFNi7aUjbzB5
	gr0T5PW/vt9VQ77lWacM4i1Y5JGMdl8wnGN2dtW/AAlHdesXxIQp2tLff2ZOs/SSerLW+Btt+Rl
	/apikO8H4vr3dyRiH3bsJCf9cQu0FHlOnIPbLamVJQz2YNOc4qIT6O1/U35TxxKN+EWpN73jkpe
	IswBTuctPjkpoxpy8R9ZXIw==
X-Received: by 2002:a05:701b:2505:b0:146:606e:2117 with SMTP id
 a92af1059eb24-14d2f7e6e77mr2008666c88.5.1790779619334; Wed, 30 Sep 2026
 07:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930133831.1411-1-parri.andrea@gmail.com>
In-Reply-To: <20260930133831.1411-1-parri.andrea@gmail.com>
From: Marco Elver <elver@google.com>
Date: Wed, 30 Sep 2026 16:46:22 +0200
X-Gm-Features: AclHuK-ei6ZBXhhMZCie6v-LALx8ayLwHQO-HoMTB5k7bp20LKwXygcSHNE1KAA
Message-ID: <CANpmjNMon+ZW+kUvAykEKON2rDFzsJ5aG_gKYt2wr_GnmY5mQg@mail.gmail.com>
Subject: Re: [PATCH] kcsan: Avoid division by zero in kcsan_prandom_u32_max()
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, "Paul E. McKenney" <paulmck@kernel.org>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Sept 2026 at 15:38, Andrea Parri <parri.andrea@gmail.com> wrote:
>
> KCSAN's skip_watch, udelay_task and udelay_interrupt parameters can be
> changed at runtime through /sys/module/kcsan/parameters/, where 0 means
> watching every access or not delaying at all. With the default
> CONFIG_KCSAN_SKIP_WATCH_RANDOMIZE=y and CONFIG_KCSAN_DELAY_RANDOMIZE=y,
> writing 0 to any of them makes the next watchpoint setup divide by zero:
>
>   # echo 0 > /sys/module/kcsan/parameters/udelay_task
>   Oops: divide error: 0000 [#1] SMP NOPTI
>   CPU: 0 UID: 0 PID: 93 Comm: sh Not tainted 7.3.0-rc5 #3 PREEMPT(lazy)
>   RIP: 0010:kcsan_setup_watchpoint+0x1b5/0x410
>   Code: ... 65 89 05 ad 8d 98 02 d3 ee <f7> f6 29 d7 e8 22 0e 0f 01 ...
>   RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
>   ...
>    __show_trace_log_lvl+0x1bd/0x315
>    __die_body.cold+0x19/0x2b
>    die+0x34/0x50
>   ...
>   BUG: TASK stack guard page was hit at ffffd3ab001fbfe8 (...)
>
> reset_kcsan_skip() and delay_access() pass these values unchecked to
> kcsan_prandom_u32_max(), which returns "state % ep_ro". delay_access()
> halves the delay for compound and assert accesses, so
> udelay_interrupt=1 is enough there.
>
> The oops path runs instrumented code, which faults again until the stack
> overflows. With skip_watch=0 the guest hangs without printing anything.
>
> The division came in with commit 71a076f4a61a ("kcsan: Rewrite
> kcsan_prandom_u32_max() without prandom_u32_state()"). Before it, the
> helper scaled the random value with a multiply-shift, which yields 0 for
> ep_ro == 0. Go back to that via reciprocal_scale().
>
> Tested in an x86-64 KCSAN guest with virtme-ng: after this patch,
> writing 0 to each parameter, or 1 to udelay_interrupt, no longer
> oopses. skip_watch=0 now watches every access, which is very slow with
> the default delays but completes when they are set to 0.
>
> Fixes: 71a076f4a61a ("kcsan: Rewrite kcsan_prandom_u32_max() without prandom_u32_state()")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>

Reviewed-by: Marco Elver <elver@google.com>

Thanks.

> ---
>  kernel/kcsan/core.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
> index 2db82661cd60a..a3aa5e5b039dc 100644
> --- a/kernel/kcsan/core.c
> +++ b/kernel/kcsan/core.c
> @@ -290,8 +290,9 @@ should_watch(struct kcsan_ctx *ctx, const volatile void *ptr, size_t size, int t
>  }
>
>  /*
> - * Returns a pseudo-random number in interval [0, ep_ro). Simple linear
> - * congruential generator, using constants from "Numerical Recipes".
> + * Returns a pseudo-random number in interval [0, ep_ro), or 0 if ep_ro is 0,
> + * which the runtime-tunable callers may pass. Simple linear congruential
> + * generator, using constants from "Numerical Recipes".
>   */
>  static u32 kcsan_prandom_u32_max(u32 ep_ro)
>  {
> @@ -300,7 +301,7 @@ static u32 kcsan_prandom_u32_max(u32 ep_ro)
>         state = 1664525 * state + 1013904223;
>         this_cpu_write(kcsan_rand_state, state);
>
> -       return state % ep_ro;
> +       return reciprocal_scale(state, ep_ro);
>  }
>
>  static inline void reset_kcsan_skip(void)
> --
> 2.53.0
>
