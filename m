Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932504;
	b=tlJI0hDU/IL6sIGlKy6S68DqGtRgfM333Su7cd83l+BidA2BU17nFnkUf9YmVgrqB01y
	 pgzcSvLz4qxm2DCCeKBgtAXepAn9DlOOXnNXwFZmR7Es2XgMhe0lD+b79QdjJNnXR/FNQ
	 qafdcPHlJTWckOiXy86R8zuR8cGYyp+QFNh1d0PjUsuoHkW9TD2g+SFTrfWljxW1S8Mtq
	 k7JibmjwWFY2wJEEMU2VijfXod6v7p9Zj0BvocsdyNBMRzJB9ayXosrCG7m2BrGhTnXRN
	 4CDk2EXeTNBtiJX58kb6yW75ceZRoYYFu8JGyNVHRwiiJhUW4d+h/brgJpZWqetY/5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4A3WKTqsVWE8KBkmTAQMvbvz94FbXUBofC05vB1uGNA=;
	b=TOvvDXto2EYPHIlcY52yLaTXNoRY2NoUNatKaA+RMoJiVL3SvhWoQnG1j2bCOiDAZRPy
	 8fN0etEFig5gqmASKyabtY+wbD1eTvohy5e+qvW6KQ2SSN5BnIaapS1mFTH9OJMVY7gTg
	 Ns5x4JVTicVFPK4HiJG70l6J/fD7lF8f9L8U4TBXM4LjY37AvKyi2QGsJHwoOYqB8/ngO
	 G8zWpMNstJj58NRkG2msM4z4C77xZI+O1VDa/ndGVYCl+Wwkvy9xRH5Uwka1SVJxlsqKp
	 CxsnlV17/zP3Df7vowsITh12k/LPCRtzr81qvLM7hyTNL97tBdS4dchi5d7bmDGkHMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fw8mROcN;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F974606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F974606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fw8mROcN
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so7453102a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794932502; x=1795537302; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4A3WKTqsVWE8KBkmTAQMvbvz94FbXUBofC05vB1uGNA=;
        b=fw8mROcNJLENA2b7j5V768JdGDPzay7fZ6eGyvABxgNtL74NchZZtE6ln7r15qJ6wi
         7XRSHiDBb5o5uPoy7uU9NLo2LkhA9NR2CvlsR9Xsuk6tEVOkJqrDAGlRDV7zUrLmfAAM
         qzcpstPcno2dTssCz+1iTivlUN2mqL+zX/kr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932502; x=1795537302;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4A3WKTqsVWE8KBkmTAQMvbvz94FbXUBofC05vB1uGNA=;
        b=gYelP9cfjcsSmShHyR8CcM+xMDPcq5InSfXGnUq1uup1KNiwezGIpGmIZBauMdGDdE
         9ogTVmZfue20PmA8FcItoqg31yssYAwCYEpAgCZw5j85IoT9Hc/nbjKLgn42VJZAdVo0
         fbL/y9coIbyO0/YI1XOhI6ERb8wZK1+yP5OgSElocaPvqZQZ6p9wjMirYqXQPhtXfo9g
         w/m20xD/+I7dsQ7UyJIhTjyJIZ9b8XST2ywxwW4HQY0gbSDGWeCKOsa5mVzN6vntDRaR
         6nGhjD0zpa3cw+7DXd6v7a5YvvZncoh8QvK0qzdQdHO7mINIJGiSl+DSOlzNLoQepgEs
         G4pg==
X-Forwarded-Encrypted: i=1; AL+hErEp2fW1FDmbFNYYC/BPA+H1YHn9/SxXLOENfkZYgBJU1YcLNK7O3f//XIYdbdmdwxa/zLyyzjTJuOh6kSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Kj8tHpfnmElkYp30LoM7WrVV0MiSl4hNnz6g7Mr+WHn7upOEc
	cxcTUuEZsPI9ON5MEVAwzlKywo7jCyrEeVpu9VLJaR3lenAk3/O58mqLTZLkAXAgRJpruefe2lW
	dnYTKfA==
X-Gm-Gg: AYBFou34cUDkV5BPEFYZ1MrhS9eDzOLolR0xhDuAn4lbuWM/PPm40oXpS3ikf3mZFm3
	Ru0XPnTj3Tw4wSQhKVlVjeYqZhd65wocGDkNzYCd0IDB4CchK1gz7UiOXXeQd0X65CCrxKIa2ST
	v2lttceRkrGw4/YsjzUgm71Tw3uadB96AQRDIq6tZa7XFvFWmmiiLyiTtnU3cRyTw/9Lra+rCrd
	qXyoEIQIRXwMvx3jq5+Vxn8eNd8tkYtn3ze5dPpO6ADVlE6/3sUndO4jd2nesVppOCzF9SijE/M
	aqvJZqlew1h+9//wsgpYbVuGj3p157Q/M6HHtySv1AfBy0iB+FPGjAhOKyqCxBZXnL1358wDJlu
	pDDcQTR1nm6lcySBliNb68IQ73ZrUb6jDm+oUhr4DFj1MCPtTw3u/g7y+GMfUEt4y43IHC3PCbp
	ZM3ItZQ2Tez4cd8rhTYU/9LNUZzmXht0bB5t1s+q6zvLUHKRiUtlfUNmF2hesyLU5THQsb99Jy4
	+Z38Jgc2gAJU110Ev+nI0WRHp8jmGrrIwLvzTuluSRHChLgzEz94MrovQVIAB3juWPt/PFQCHB5
	7s+NpdArgCdBRNd1Br/XfLM9u/FKv407nDmSZAiycWGbKaBI2WoDlyhZFTOyosmlwAyw
X-Received: by 2002:a05:6402:c4d3:20b0:6b5:74dd:37ec with SMTP id 4fb4d7f45d1cf-6b7c08b09c5mr7920069a12.1.1794932502382;
        Tue, 17 Nov 2026 08:21:42 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b886b9359csm5364a12.19.2026.11.17.08.21.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:21:41 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2852346f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:21:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGJkkKdIugq++lN+d36CF46BKSx16Knu5ssEF3F275alEY6HQagFRJ8cJRRU4QcSpkbNhZw9rAI7q7Obuw=@vger.kernel.org
X-Received: by 2002:a05:6000:2584:b0:49d:a36c:2d66 with SMTP id
 ffacd0b85a97d-49da38ab522mr26157470f8f.27.1794932498429; Tue, 17 Nov 2026
 08:21:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-9-dianders@chromium.org> <avvRY-nTstFbvTpF@gractus.seuss>
 <avvTEIZQZwra3Zra@gractus.seuss>
In-Reply-To: <avvTEIZQZwra3Zra@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Nov 2026 08:21:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V+2wMhc6OALzbHgn8x9AnWUFCay6sGB7sqKqffGLb7ZQ@mail.gmail.com>
X-Gm-Features: Aa3M54pz7DW5yM-a4JW5wjVNliWZLdPpMra5U8vPsgIIoqjo8RSA7Zhl1aOgCMU
Message-ID: <CAD=FV=V+2wMhc6OALzbHgn8x9AnWUFCay6sGB7sqKqffGLb7ZQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with memchr()
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Mon, Nov 16, 2026 at 8:07 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> > > On one stress test (running the fdtfactor tool across 438 arm64 Qualcomm
> > > DTBs) this reduced `fdt_property()` time by ~5.6x.
> >
> > What we really want is memmem(), which would presumably have a similar
> > optimization (and likely more) built in.  However, we avoid that to
> > make this easier to environments which lack it.
> >
> > Complexity isn't too great, so this looks reasonable to me
>
> Hmm... actually, thinking about this again, I'm kind of baffled that
> the speedup is so large.  In the old version, if p is at a character
> that doesn't match the start of the string we're looking for, memcmp()
> should return almost immediately (after a single byte comparison), so
> I'd expect both versions to be - roughly speaking - a single scan
> through each byte of the strings block.  At least with gcc builtin and
> inlined mem*() implementations, I'd expect the performance difference
> to be pretty modest between that and the new version.
>
> What was the environment (host CPU, libc, compiler options) you used
> for the benchmark?

Environment details:
* CPU: AMD Ryzen Threadripper PRO 5995WX (x86_64, AVX2)
* libc: Debian glibc 2.43
* Compiler: gcc (Debian 15.2.0-14) 15.2.0
* Flags: default `meson setup build` (`buildtype=debug`, so `-O0 -g
  -fPIC`), though testing at `-Os`, `-O2`, and `-O3` gives the same
  ~16-17x speedup on the string-table scan itself.

There are two things going on even at `-O2` / `-O3`:

1. **GCC can't inline `memcmp(p, s, slen)` when `slen` isn't a
   compile-time constant**: Because `slen` is a runtime variable (and
   GCC also can't synthesize a `*p == *s` pre-check on its own since
   `slen` could be `0`), GCC at `-O2` / `-O3` emits a full PLT call to
   `memcmp()` on every single byte `p` of `strtab`:

       .L10:
           movq    %rbx, %rdx
           movq    %rbp, %rsi
           movq    %r15, %rdi
           call    memcmp@PLT
           ...
           addq    $1, %r15
           cmpq    %r15, %r12
           jnb     .L10

   Even though glibc's `__memcmp_avx2_movbe` returns quickly on a
   first-byte mismatch, paying a PLT call/return and function prologue
   on every byte of a ~14 KB `/__symbols__` string table (~5.8M
   `memcmp()` calls per 800-symbol DTB) dominates runtime. Just adding a
   scalar `*p == *s` guard ahead of `memcmp()` already speeds up the
   test below by ~8x at `-O2`.

2. **SIMD scanning inside `memchr()` (~2x faster than a scalar byte loop
   at `-O2`)**: Instead of stepping one byte per scalar loop iteration,
   glibc's `memchr()` (`__memchr_avx2` on x86_64) broadcasts `s[0]`
   across a 32-byte YMM register (`vpbroadcastb` + `vpcmpeqb`) and scans
   32 bytes per iteration inside a single call, only returning on the
   ~4-6% of offsets where `p[0] == s[0]`.

(In the commit message, overall `fdt_property()` time dropped by ~5.6x
rather than ~16x because ordinary repeated property names like
`compatible`, `reg`, and `phandle` hit near the beginning of `strtab`
right away, and `fdt_property()` also includes copying the property
value and header bookkeeping.)

Here is a small standalone C program (`bench_find_string.c`) that models
building an 800-symbol string table 200 times (~4.2s -> ~0.25s at `-O2`
on my machine):

---8<---
// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
/*
 * Build & run:
 *   cc -O2 bench_find_string.c -o bench_find_string
 *   ./bench_find_string
 */
#include <stdio.h>
#include <string.h>
#include <time.h>

typedef const char *(*find_fn)(const char *, int, const char *, int);

__attribute__((noinline))
static const char *old_find_string_len(const char *strtab, int tabsize,
                                       const char *s, int slen)
{
        const char *last = strtab + tabsize - (slen + 1);
        const char *p;

        for (p = strtab; p <= last; p++)
                if (memcmp(p, s, slen) == 0 && p[slen] == '\0')
                        return p;
        return NULL;
}

__attribute__((noinline))
static const char *new_find_string_len(const char *strtab, int tabsize,
                                       const char *s, int slen)
{
        const char *last;
        const char *p = strtab;

        if (tabsize < slen + 1)
                return NULL;
        if (slen == 0)
                return memchr(strtab, '\0', tabsize);

        last = strtab + tabsize - (slen + 1);
        while (p <= last && (p = memchr(p, s[0], last - p + 1)) != NULL) {
                if (memcmp(p, s, slen) == 0 && p[slen] == '\0')
                        return p;
                p++;
        }
        return NULL;
}

static double bench(find_fn fn, char names[][32], int nsyms, int iters,
                    int *out_tabsize)
{
        struct timespec t0, t1;
        char strtab[32768];

        clock_gettime(CLOCK_MONOTONIC, &t0);
        for (int it = 0; it < iters; it++) {
                int tabsize = 0;

                for (int i = 0; i < nsyms; i++) {
                        int slen = strlen(names[i]);

                        if (fn(strtab, tabsize, names[i], slen))
                                continue;
                        memcpy(strtab + tabsize, names[i], slen + 1);
                        tabsize += slen + 1;
                }
                *out_tabsize = tabsize;
        }
        clock_gettime(CLOCK_MONOTONIC, &t1);
        return (t1.tv_sec - t0.tv_sec) + (t1.tv_nsec - t0.tv_nsec) * 1e-9;
}

int main(void)
{
        static const char * const prefixes[] = {
                "clk_gcc", "reg_vdd", "pinctrl", "i2c_bus",
                "usb_phy", "pcie_ep", "mmc_sdhc", "gpu_opp",
        };
        enum { NUM_SYMS = 800, ITERS = 200 };
        char names[NUM_SYMS][32];
        int tabsize = 0;
        double dt_old, dt_new;

        for (int i = 0; i < NUM_SYMS; i++)
                snprintf(names[i], sizeof(names[i]), "%s_node_%04d",
                         prefixes[i % 8], i);

        dt_old = bench(old_find_string_len, names, NUM_SYMS, ITERS,
                       &tabsize);
        dt_new = bench(new_find_string_len, names, NUM_SYMS, ITERS,
                       &tabsize);

        printf("%d trees x %d symbols (final strtab = %d B):\n",
               ITERS, NUM_SYMS, tabsize);
        printf("  old (per-byte memcmp): %.4f s\n", dt_old);
        printf("  new (memchr + memcmp): %.4f s  (%.1fx faster)\n",
               dt_new, dt_old / dt_new);
        return 0;
}
--->8---

-Doug
