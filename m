Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7983D34BB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074886; cv=pass; b=ubhhyyFKMnqgwI02Dp+vxFXYimoTIFunFBzt/dtuLLnPqXUE+2P0Qh6tmrLEa3RD2eBCjGOt8q7T+5FuXXpdRu123fOE2E3JHSY6E5Jg2nLFXrbcGUYQLMwmdkhytE5rnAbfNCIwhneWfV10NvHQfu0gdmghFSwWBnow4UlZSW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074886; c=relaxed/simple;
	bh=0qgS0UO1kcmwhXpK5KzPjRFjdmmHM4Qfpm9Hq9l0y94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2AouNCpmS/bv8bCs/JqkYOQdcYNP5B+PAkDdSPuefpUXOlquFBVzwVCT0+fn3DCvfx8RnpkFY8DUXf8jqbyKTZA5TwnA5h4hCK+a0Zr2/bViZn1xCNCtCyhoIyF2rUxAZ6OEZAjeoVd8oxUIYWSv4DrJZzsqat1hC4xOXpHBOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XxG5spFF; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XxG5spFF"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1419d3416ceso3906781c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792074883; cv=none;
        d=google.com; s=arc-20260327;
        b=ATE3qXcAJm13DUHjykmls021cQJtw7eV/siYd9i5flLAjSvTbXNIZL0pUylEN1PvSS
         jFPIidlQ5lMOjs/F2Ef/B3yN/5wfIM5+F7THe+yUt+ULJO3o0tkN2WC8w6JNCdukPbV3
         O7bfdp6SrXw4NkEzPCbqpcGqXUmd1BxdjZBDpjdqR9jXiOkqHtxgoajQMlTvSnvU0TkZ
         VF/TeJFo8stVuX86XpQT7YbVlhjMzmsANR7wkcfwVg84hYVoXtd/+b4YQHibzXjI2ZmU
         o+Nu1sJRYl89hMuOLVdNFD58mN/SPPDvolfRn2FAYGTHdYtmIEpJ6Xk46fSsG8oL7uAB
         1FRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F6fmcBNM8ahIowcwsWLF3jcUhFNGW6deuYFquaOGjh4=;
        fh=eJs/Ha011mgeuN8dL8ZslzhGWusOZWr9JrAsgzg/MNI=;
        b=h5wgCexI/FCxn9OkVy/ke7Gq9NVbTmQRy5pQAxBJAW7qhNlf6EZNmIVJZCh9x8H7CS
         BQKxXXnxcCf/YYh0pmVrHrGeC73Z0SE16I3TOauR/qyfAcHKrkeySQpF2IJ97tBy75vp
         Q40BQN5gYIUHmCDyf643bSg4cMhvCffEukSUmEWns4foaUU/lUrhLIYMMY+yhGYYXTEg
         /VZZg4/qX2CkvF72wyp1EWovXuTyGM1hWJYbN8+ql8GocI0I0w4N9LoroL91YZBRYbIu
         cCs/Ff8pobsKKqyuNRR3skXvDQTQBF3hIpwalkZSAz3VO7BivZWa4pSa0DbBdjXbe55v
         vQTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792074883; x=1792679683; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6fmcBNM8ahIowcwsWLF3jcUhFNGW6deuYFquaOGjh4=;
        b=XxG5spFFCyrPODC6UX7Zq3Blkeh3nQrj0bGUwu/crtNNK6S4t8fHZoaDSML8jrPK49
         DCqBbcnMHbdkGGAZrevtv93rReCFcJTXzV9tf52wzaRNUlUX/BssJOjmO8FdSj4Atz4e
         5Bfm7jOafLO/gpy9/LbNgXzUAJ9uHUG3q7Ws8g3K1Wab4wUjd0a46IF1JAyM194ApdP4
         D4lI+JpKdI0fTEeibyfvSEIPkErVCnDde0oC8gec9px7AHUTYt7gAgeOxilJIr8Q66f2
         0ZIK2jyptnvWUWTXpk648Aa5yGc3Ja/pBpHZd1q3xElCLqwOGlsFTaX8d6q3gP4Bb/8b
         4b3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074883; x=1792679683;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F6fmcBNM8ahIowcwsWLF3jcUhFNGW6deuYFquaOGjh4=;
        b=uyeMsF+LaCSQUp/lrjqiLdP7XSK6Jgil0o6F71xc6ha7EHV4q92zlNQXbMKSzp8W22
         qdyfE0W0/OK6V/SjgFEY/z5gwgW88dCWnquBa2UC8UsW4ath6Riqm1DYl+bRiamgsSCh
         tB/JKer3VWJwAGbrV6368GxMPAvjD4YWwsOCuknzdKiIYegtC5l/kK4OmEmcTD/JJvyS
         suKVFL8z1FOcwPEVAlBhm91P5tL018zvEQEII3n95AOFsNzF3HwDlL+G29wNEF1yo+X8
         1ysV7uuQ1kKfHSfSnZjgD+ffiz6H9TdlcKymZNe+nzQggNgH11+N6INnn4U8F1bYJu4O
         L7xw==
X-Forwarded-Encrypted: i=1; AKwUvBznmJemWhO87lW/Fs6vKTdZoUhjpTj1ItpcWMcnTCeblB/pTLgx9V1cAgGhF4eHb53UJYLobsqsWvMT0cE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/xRxWBAOhflhtFCWFgsGMmHSkEDfcm9XXsXRdiCXsuDF0IAyU
	sQwQ8fSdhMq5Yo2smDNkJEjdeM/l1fLoo72mzZu5zxQlDjgviznFWeGS82ShcsWJzwLnZQkEHPe
	nJa7YkHZmguFstZOuvqMTkO3Fp6YRtYtJZqKjGIGz
X-Gm-Gg: AYBFou3VFLyCilhF0aRBpD0HNRZ5c5vN7FktxylrE5Gewc6GFGC3CPJntG4dQ0osb2d
	w6RG3lpuLcSJXSgEARbUloAhW4pGcTbasc8hp8eWw7iNIF9FMcQIab+Nc9dnZ5przRbTWWjk/17
	HFIxlx2hTGo4Q3Y8wBlecbY32PQ3Is0MNw55fuzWJmfOmDDPfqLNR60VYK5/Hf5ScYqeOnWy7oB
	UjtpHWQPvBGEFnXMEYMFst5lJXE0S+snH9qVjgtcOyksJuXirHJ60v2QGU949PjJ2VIUnpiUWg4
	4kxW/AhVl2QoBY/w7VCysHMz+GzWCfzw9HhoMvs4dDgHCBucK1z6UEOjc71UlyJuzEjohjDjFIu
	X6EoTPRncYg==
X-Received: by 2002:a05:7023:908:b0:14d:f83b:f678 with SMTP id
 a92af1059eb24-16a63093432mr28786311c88.43.1792074876931; Thu, 15 Oct 2026
 07:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014095238.2132580-2-sh_def@163.com>
In-Reply-To: <20261014095238.2132580-2-sh_def@163.com>
From: Marco Elver <elver@google.com>
Date: Thu, 15 Oct 2026 16:33:59 +0200
X-Gm-Features: AclHuK_nqb0XohDsRgRoJxANfSfWrIowniz6RXwKCNJicgsayXH681Q_GDC1JBM
Message-ID: <CANpmjNN0_EX8Tug6UFp=sap_Zv3QH1PnEn4GPGSKSHEU72W6zg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] kcsan: add targeted watchpoint matching
To: Hui Su <sh_def@163.com>
Cc: dvyukov@google.com, kasan-dev@googlegroups.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 11:52, Hui Su <sh_def@163.com> wrote:
>
> Add target state and a static key to KCSAN. When a target is set, only
> non-atomic instrumented accesses containing that address are eligible for
> watchpoint setup. Other accesses do not consume the skip interval. Keep
> report filtering independent from target matching.
>
> Signed-off-by: Hui Su <sh_def@163.com>
> ---
>  kernel/kcsan/core.c  | 37 +++++++++++++++++++++++++++++++++++++
>  kernel/kcsan/kcsan.h | 10 ++++++++++
>  2 files changed, 47 insertions(+)
>
> diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
> index 2db82661cd60..2a58a3a53adb 100644
> --- a/kernel/kcsan/core.c
> +++ b/kernel/kcsan/core.c
> @@ -12,10 +12,12 @@
>  #include <linux/delay.h>
>  #include <linux/export.h>
>  #include <linux/init.h>
> +#include <linux/jump_label.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/minmax.h>
>  #include <linux/moduleparam.h>
> +#include <linux/mutex.h>
>  #include <linux/percpu.h>
>  #include <linux/preempt.h>
>  #include <linux/sched.h>
> @@ -108,9 +110,40 @@ static atomic_long_t watchpoints[CONFIG_KCSAN_NUM_WATCHPOINTS + NUM_SLOTS-1];
>   */
>  static DEFINE_PER_CPU(long, kcsan_skip);
>
> +static DEFINE_STATIC_KEY_FALSE(kcsan_target_key);
> +static DEFINE_MUTEX(kcsan_target_lock);
> +static unsigned long kcsan_target_addr;
> +
>  /* For kcsan_prandom_u32_max(). */
>  static DEFINE_PER_CPU(u32, kcsan_rand_state);
>
> +void kcsan_target_set(unsigned long addr)
> +{
> +       unsigned long old;
> +
> +       mutex_lock(&kcsan_target_lock);
> +       old = READ_ONCE(kcsan_target_addr);
> +
> +       if (!old && addr) {
> +               /* Publish the address before enabling the fast-path branch. */
> +               WRITE_ONCE(kcsan_target_addr, addr);
> +               static_branch_enable(&kcsan_target_key);
> +       } else if (old && !addr) {
> +               /* Disable the fast-path branch before invalidating the target. */
> +               static_branch_disable(&kcsan_target_key);
> +               WRITE_ONCE(kcsan_target_addr, 0);
> +       } else if (old && addr) {
> +               WRITE_ONCE(kcsan_target_addr, addr);
> +       }
> +
> +       mutex_unlock(&kcsan_target_lock);
> +}
> +
> +unsigned long kcsan_target_get(void)
> +{
> +       return READ_ONCE(kcsan_target_addr);
> +}
> +
>  static __always_inline atomic_long_t *find_watchpoint(unsigned long addr,
>                                                       size_t size,
>                                                       bool expect_write,
> @@ -277,6 +310,10 @@ should_watch(struct kcsan_ctx *ctx, const volatile void *ptr, size_t size, int t
>         if (is_atomic(ctx, ptr, size, type))
>                 return false;
>
> +       if (static_branch_unlikely(&kcsan_target_key))
> +               return kcsan_target_matches(READ_ONCE(kcsan_target_addr),
> +                                           (unsigned long)ptr, size);
> +

How does this change the generate asm (say on x86-64) of the fast
path? (E.g. take a look at __tsan_read8 disasm.)

We tried hard to e.g. avoid stack spills in the fast path, and if that
affects fast path codegen negatively, that'd be not so nice.

>         if (this_cpu_dec_return(kcsan_skip) >= 0)
>                 return false;
>
> diff --git a/kernel/kcsan/kcsan.h b/kernel/kcsan/kcsan.h
> index ae33c2a7f07e..2a36813c3a76 100644
> --- a/kernel/kcsan/kcsan.h
> +++ b/kernel/kcsan/kcsan.h
> @@ -25,6 +25,16 @@ extern unsigned int kcsan_udelay_interrupt;
>   */
>  extern bool kcsan_enabled;
>
> +void kcsan_target_set(unsigned long addr);
> +unsigned long kcsan_target_get(void);
> +
> +static __always_inline bool
> +kcsan_target_matches(unsigned long target, unsigned long addr,
> +                    size_t size)
> +{
> +       return size && target >= addr && target - addr < size;
> +}
> +
>  /*
>   * Save/restore IRQ flags state trace dirtied by KCSAN.
>   */
> --
> 2.55.0
>
