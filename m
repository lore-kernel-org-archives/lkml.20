Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793708408;
	b=aNrqp4nx5MEIXHRpod/POh4xaA7syJL29J9NWvkdGK+neGG1/LbZnuRnRVZHmQHEdqfX
	 iDDhYHgTJ1d2bbbEW0WkwlWps5OoxNA1RDI2dQ/p3K2HJFO9YmhKvTIzM4N5e++WGRF1N
	 2krSKDmy9OjKbQAhoYEwlPwqFmcSKzRkuB05PriOy/OkiLXQN+4cwXoZoo9b5o0U58h1Z
	 yo7wyOG4jYMfL7pnM1G0XoocSW0z0aZRcsOt/nv9nGf0cMCRi5CzZgetQHXKd1sJjSxXv
	 F98A2pWQF+Nlrn3DbNeYQN8KCeR2U6aPWRh88a4r6E5rxy6RijqxUFEwfZVvfsFOsxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3CD88GfA2FxXgHDjjooA1xyO//Rj+QTFMj4P2VOKKgE=;
	b=cDRz2cn/T/FvuWk3fQZpemcp8YdLZTG/lyOSEppi9ur2zdcRURs2KVax/aAIfBYhugzT
	 Jr4Pn1FCXH+NFpnYQepjnfA2dldrso9pD1HYdnVYIwir8I1sVD/1SHIlOO2gmRKkJiDSI
	 tn12Ch88jO1In4qpPtGdx4caBoxAYjiF8FHMA8YrXW7Ubkgx869zYnOYXmBqvszaqcvCr
	 AvtCIlhofFORN1eD9wZE1dqueT512UVRk4ZUGcjB58euame0JVbleDUN06AcqkHBOXsuO
	 7ezXp6xgJf3PVrK8nWyAgQ7nCxd0FHd2vp0/UZvG4YkFBrnS1dbwlZ6NC36xuVvP4og==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pSRjP4PL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DA0606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0DA0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pSRjP4PL
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15dd124bbe7so5794096c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:20:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793708407; cv=none;
        d=google.com; s=arc-20260327;
        b=ZdTjY4Z2rRxnFZD0RnRajLPm4tArShf082p27ezhCw1x/AplzJoSNzzN74Z87BNS5d
         6hPJVHziTsq/E/Kdo90PO9IankbEfotmQVgp/n6thqlXRu7crx9z2n/cQm0gxDl0RwYB
         kj0QuxvhsI6dF+F/cFyhnbB6RNVNrcvCxbaq5/JvqaI/UpaPsGAwWQUAstzD0hiFQLNr
         GdnrScwXdig0KVBM0gk+SHBoXbJe9KWLF9fGqoB1DLFHEdX84Wtut6SbH6FSm/Zlsxsw
         IZHLGDQ+IBmLuit8KGUUyFKKgHry/ku2wsZoHkwFap8evGnyUhrq1RfhVyy0JJdUlXOE
         cbEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3CD88GfA2FxXgHDjjooA1xyO//Rj+QTFMj4P2VOKKgE=;
        fh=PTKc6CFPE3jNtB+simRtjM32MHO5d6WBZ+2UZgbon7s=;
        b=eD8PBye0oGNEqgsRezZ1O/+EgSLDaMre2kUhRCNX1HAw9h6MoTzCWchJfOi7Htlo+/
         ZjwthXPIBg+p67Ss6iVU/JNMwFgBOeoDEXbLo1vVbGb+SwzsI55IeBsrj/5ApiK4j7Up
         XirXvxO0ON7tkhtfQXag+7N8QOHKnPlgwXLSWwzdmyKzj3TnTQfPeaKummgVrFIcqAMk
         nR1DYPQuFOgAvFd0m7xFpj07flAbGa/b2p6BSKbzzTlypGgevWHhUpUduTTkZVQqrBMG
         4Z1xpJL/u724gHUNRIY0NgnuJwertOhk1UAusEL9qFD1XZoSjKChRPsZ7YXIJLcZq4sq
         TZYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793708407; x=1794313207; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3CD88GfA2FxXgHDjjooA1xyO//Rj+QTFMj4P2VOKKgE=;
        b=pSRjP4PLoRS0PmDKYAVuAV829EIsKJYBepMU76dm/CZVN/r06GnuUDuwnL6qZe513k
         frWZRVo4f9wEwKy1ojJ0gfU61QMhqo+xsw0Ybd8aTPry4MYlv0nBbQF7NKJ+zhMxTO4T
         MXk8cntUGT0C5JmGX7nnlmb2LpJ0T68a9xs9tJkoasn1YjbcORHzxTHC4MJNoN4kDbIH
         Dd+nnkC/Qwh9dPb010By8tJs85jx9dDRnkrQrOTuLUy/TmCe6/2bQ6Qyjfpj7fBHSX8K
         Da4dnfX3h/XMaX8JQ+TmF8iM7MvC7n8dGPGq1OHHReqDGaqzhCE2Zj1V+nT9bVbdyW3H
         IJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708407; x=1794313207;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3CD88GfA2FxXgHDjjooA1xyO//Rj+QTFMj4P2VOKKgE=;
        b=UZeXjxMm0gVjY3W8Ap4hrHm60eZriCARUZN8ZDczEAy5CS0WGsiCT3OTqveL05ijEL
         CuiHllUjW3G34mm8MlE725QACAVM7Zgnm9UPk5nJJ2m78Q4R/cl3gO5YfYsZl7vh3VUT
         Dpcdy6rszHz6fNz2h7L63qurqMME11f58fXgmZ/ZqupCrpVN6R1ty98gxI5E0OlaiFjc
         ZSlBwSNxEm1M8z7fW2SkVwPahjquabdJibrBDiYcrxa0VQQOmryxL+8ZfMn2I0qZeU/c
         XMmgd7FWftzEPsUkwTaN77GZ5E96N7uyuS5oSziRp2/0+QTTXW9hNtxVaa+OVC0dMzAO
         0+Pw==
X-Forwarded-Encrypted: i=1; AKwUvBzWaBY1qeqRHF6g6mfk4W73IXtEPaoMVwb70Tkoh+CggEu+kke7NMEae8sPce1Gtl4TN6BUg7eUuU1z8dY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xq2cpLM6s20R/IXDXdaSdatlFBfYg99Frm9+dlHF3UsKV8oyF
	wnFSxhfLL3jhI3NxZCTxwX6cNsQJb9BzFKN7lGPUMyKFviK7YYYO4X+cxf9ydLZF+m614mBPr85
	V23rsVd0ynXKAFg5umbvRJ9otcxN3d6kBD3oAMZ7C
X-Gm-Gg: AYBFou3Z1mC53ML+uO+KYpfBsLoYye1qoDJ2USC5sNMhJgZUeVHSfsBsu0Xczacx9/2
	Hu7mDg5vMkG93zd6yPVV3pu7cLhogkGXQa/ge1QUo3kiX2dwxuDxVqAd9ALMCvJXmVcBbI8dXox
	cXecPJSY3IQQuhyz4WZY58gdkEXqeOBH4whT33XXJqQKUFKYd7M44p/h/UeqfZrN7Q577jR8VOj
	myoIMFR/WoRoFEoFvQEyzbCYonHXnpFdJLKFMQzzSPWghGK7Gbjih3OSt22/4CDXbFL5o7IofYM
	yxowgxAlP/KpEa3mADLNT+wygC6vHwKSTUKkbX9z3d5xIQkSZF6U9dqC7qxwhwK4Q60AHvMoBya
	Q1l6BCHtXfqVO8DiAxp8PcS6JfyionaLOeuurO1bxBuLP9/ImSfxR44suN28TWq0PNw==
X-Received: by 2002:a05:7022:eb55:10b0:168:3243:c90c with SMTP id
 a92af1059eb24-1ac59dd356cmr20818361c88.15.1793708405984; Tue, 03 Nov 2026
 04:20:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-stackdepot-full-warn-v1-1-41f1fc651b64@debian.org>
In-Reply-To: <20261103-stackdepot-full-warn-v1-1-41f1fc651b64@debian.org>
From: Marco Elver <elver@google.com>
Date: Tue, 3 Nov 2026 13:19:29 +0100
X-Gm-Features: AclHuK9s-1nuK7edLIAKwVSP9sH1OemeE-hzzY1kqIDXOO8vAkwzu4SL6CH2ltk
Message-ID: <CANpmjNMfNm4HwDFV=WdfR4AS0affDzEn3Lx0=A38xx9igJb0hQ@mail.gmail.com>
Subject: Re: [PATCH] stackdepot: don't WARN when the depot runs out of pools
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Potapenko <glider@google.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	John Ogness <john.ogness@linutronix.de>, Petr Mladek <pmladek@suse.com>, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 12:01, Breno Leitao <leitao@debian.org> wrote:
>
> depot_init_pool() emits WARN_ONCE() when the depot runs out of pools.
> It runs with the raw pool_lock held and IRQs disabled, and
> stack_depot_save_flags() wraps that section in printk_deferred_enter()
> so that it does not print to the consoles with the lock held.
>
> That deferral only applies to legacy consoles. ON nbcon WARN() puts the
> CPU in emergency mode, and in emergency mode printk() flushes all
> pending records to the nbcon consoles from the calling context. With
> a slow serial console (pl011 is an nbcon console) and a backlog of
> messages, that flush can outlast the hard lockup threshold, all of it
> with pool_lock held and IRQs disabled, while every other CPU that needs
> to save a new stack trace spins on pool_lock.
>
> This was hit on an arm64 host running a KASAN and kmemleak enabled
> linux-next kernel under stress-ng:
>
>    Stack depot reached limit capacity
>    WARNING: lib/stackdepot.c:302 at stack_depot_save_flags+0x6b0/0x6b8, CPU#56: stress-ng-dev/3466160
>    smp: csd: Detected non-responsive CSD lock (#1) on CPU#66, waiting 5000000030 ns for CPU#19 do_nothing+0x0/0x18(0x0).
>    smp: csd: Detected non-responsive CSD lock (#2) on CPU#4, waiting 5000000030 ns for CPU#61 ipi_mb+0x0/0x18(0x0).
>    watchdog: CPU53: Watchdog detected hard LOCKUP on cpu 54
>    Kernel panic - not syncing: Hard LOCKUP
>
> The rest of the WARN splat never made it to the log: CPU 56 was still
> flushing the console backlog from the "WARNING:" line when the hard
> lockup detector fired.
>
> Running out of depot space is an expected condition under heavy debug
> load, not a kernel bug, so report it with pr_warn_once() instead.
>
> At normal priority the nbcon consoles are printed by the printer
> threads, and the legacy consoles honour printk_deferred.
>
> This also keeps a full depot from crashing machines running with
> panic_on_warn.
>
> Fixes: cd11016e5f52 ("mm, kasan: stackdepot implementation. Enable stackdepot for SLAB")
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Marco Elver <elver@google.com>

> ---
>  lib/stackdepot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/stackdepot.c b/lib/stackdepot.c
> index 90c52f2e0d3f42..dea6338f73c1cd 100644
> --- a/lib/stackdepot.c
> +++ b/lib/stackdepot.c
> @@ -299,7 +299,7 @@ static bool depot_init_pool(void **prealloc)
>                 /* Bail out if we reached the pool limit. */
>                 WARN_ON_ONCE(pools_num > stack_max_pools); /* should never happen */
>                 WARN_ON_ONCE(!new_pool); /* to avoid unnecessary pre-allocation */
> -               WARN_ONCE(1, "Stack depot reached limit capacity");
> +               pr_warn_once("Stack depot reached limit capacity\n");
>                 return false;
>         }
>
>
> ---
> base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
> change-id: 20261103-stackdepot-full-warn-b29a9d89f1a5
>
> Best regards,
> --
> Breno Leitao <leitao@debian.org>
>
