Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793726644;
	b=vXujDZ7DxPt/hxYSM+ms6fqPyvskL5+m0T7whVkqzUNxT7yADpQd2Ao5sQ7KcrVJzEjz
	 KsPHoITQ00wF6vA7uxGjpbeWlvgf+mih61GnRq9/ECU4M+sG85fSvhADlEIKBKDXMK+Tl
	 O0GDEi2NzQ5liHCy9BNJ2g2RIKRkCx+7cc2ZjcCZEtJpzxTroTo3s3T0hESr/HuOYdyGz
	 mfoAigwcIxEZFWbJfUxwMk/bjtRxhVzLZ4eWUjd4iPTa4CTdkSPgsAWji+HXnMHhZRTG/
	 3GMAuZCaNk1d2sB3Ei/c7MzGqUIUqe6ye/9O9u47I3UJNPDpQMNJ2wsossITe/bI2ZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KH5rnR50iDzpBeli+MkfX7fiAl3GikgWrgJ0zxm2Avw=;
	b=2S90GXVi9zMSvASC8lu9r7TQZIIRY5lBnkg5zx2bF6Dp8GuMv7aHZQCK42qj+aSYEaG1
	 wqQsdKKKtFnrCuvOxGQYWcNLEBNnOGWgutZLXo3fSy4ymQciKaGAP5m+/bzz3B5+iY3qJ
	 yqfGalfTXyWGfnpi6SZcVJKJEEMhNTFg1eHuXXOZL9rH7i9srPMqg3Wf5OAIDY5lpaIQy
	 FYaRYWHer+MCmSP7m4F6578k8VDh4KMJuAIH+GPFftcQ1jTOkLKYSAZAO8XerjW6zXUwh
	 1TP0PxJcZ9ILwGd9hkzfnoBCkCGsUzXB5kHDP7teRhsOG9QSSd0APg+F9eNRcJl3PMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="J/vwFoBQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F3A606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32F3A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J/vwFoBQ
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso2348436f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:24:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793726643; cv=none;
        d=google.com; s=arc-20260327;
        b=mh5qdr77RSg0VpPw8GFNZ6z8K11oX9FoPeGTggJ4sGJ/otk49Ul6zFBu7nz7fXNct6
         zheH9vDWJ3uVaZAH+XY2s+FohIvFa4GvZGr+e0CpG+FWgWwGhP+UQaFFTjTsHx5LlgUA
         sbp4NBeRbZPpdYnnA5b2QE5RdywAw5uy/OdEwKsRDYxV7uUZsWQX9Kq5n7eWz7tIfgkU
         TaDhIJ4zot69B+sUXf7hsUoo1zC53IMnIe/K48tc+9ISS3B04G7wsFV/TIzAhqoh4vfD
         tWn2fuHJzZY3X02m4fDBWNC737Cvj6XpjJn9BWQdJ69y6pLdfGclIiLXq+9GId2Ol2sb
         5PeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KH5rnR50iDzpBeli+MkfX7fiAl3GikgWrgJ0zxm2Avw=;
        fh=2E1iDjscYjNnM1m7AaqneoN2VEZTwOd/y7o6BzMWA5A=;
        b=WoUUs7Y7bVzgpBlwNaqH6VMuFBfjsW1Bl3x0zwP4INW07c8SsZImcI8upkLMwAyi3E
         chshhfUT3qVRJvuV96haWrXSszdRtfMKM8vbZP1XLtv/T5e+rO7bmESY9GXg6jpDeau7
         0VQm1W8dXYrbqjjr92rv3rzkTXaBM8v6SPlHLXHt+SGseKJsVjg5V6/WDkIVcjTi2hhD
         xdkwhkVXpKPrSBITA4E2O8HdFDazIloQ8Y4rVVqjkU0o5h7wI6wTSKrc0ICArgsabzx9
         TDT8Oa0K8mA7R0H6xabp+DcOxHOGAnVj4TMtwutvl8uZfAOs8oIqMFAtr4fkg9PXUIPE
         MG0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793726643; x=1794331443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KH5rnR50iDzpBeli+MkfX7fiAl3GikgWrgJ0zxm2Avw=;
        b=J/vwFoBQIsRQFdb7MsXQ2iN/VVZmb3t9HpWsuzx+iUKHhUbqTTrv7+4PzxJgUBPHBl
         /jqambZk3B6odYmB6DpbuZAje2aPAKzZJ0Sbn4lnDof8oQI3LXrkAzzbD9v96d8lrayA
         i5R34HyXayKLjSyPuuUU5/VVlS72Ofsz/IUGrTlcH78DKMZmxxLC+szb4LtsYDJ4P/0z
         1WyCecP9bhJsJ5yrUH3m+uVQrt4xhp01AztwBT6DyTW4hfCBehdC52W3dN3Q5+dW+x5m
         h4hX1gtIcN2ird+Nt7yaPdvQVvEG7GtvzcZWjP9+LtVQyvHZc82WQkIiU61qrsIVswDb
         /jFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726643; x=1794331443;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KH5rnR50iDzpBeli+MkfX7fiAl3GikgWrgJ0zxm2Avw=;
        b=Tvh6VXIvW50CLAwokrNoipquwTCimnpsy2ErJ1bzXESd3C3MV0WyGiJV6nC7uKeMcM
         DAwUcL3lOzmvXFZbaWgsl5NQqaXjxJR/aFE/lop/1mdoMOSCGty9Fr3DMLK64TRCX2Ek
         mtxzeOwlAF95Bc8wywKbaqmrD/rpmWqh46cJ5fC+HAH8zHPZoJjMELvypOX6ie6/nZ8A
         1g6+o5FCOqCWa2NPdezWAl+YrhPxAO/AirP8YAafVHQTH9fePviPhtaG0d9AmXHSNA9D
         dMug92XdIiK5t6ZxLAv2rklzSMa+YvMwClA4Z4EfFdTpjvTf9PAkv6G0RVvx4B7v6sKE
         jmgw==
X-Forwarded-Encrypted: i=1; AKwUvBype3W3L1O0Eh+Nx+6Y01XvmkZ07mk7EwJbVXaayYIY7dr3PfJyF7FV7GDlQg1doq44q1wj78y/6v+QACM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PgxnR1G/tC8ps2H/KL8MgkNdo00/D/i5pQTGAGsMoXT3CnaEf
	tdB0oW69Hw3L/V653fuLolGcwcg+2SC0Y/tYLaMMrt5RFMmMaCHzNnSMgjaqmyoZLgMhXf8hKBu
	oS6Ib0R4RrEUhglR7+KufGkGto43U7jT1FZV9hQl/
X-Gm-Gg: AYBFou1XqJO3+dEvXnn4fmTtdvDtfqPm8r2yOlK5HpeSKj+nEgsnBc+8j/GHwyL/b6h
	WkpRqZr1FGbu90N4gS+AnWLWIbLXXaA5mEJuWImu56ZPofPoK2QoALyyjcYATTIYc4/YPHK60HC
	/UT5e74G1T8PDCja1JxS9Cmi+zKT1VhXpeHaLddSHmB0BhQ+nPIzie6b4qIk2ZgNF/sfOLQs+Xv
	aleQICV9MlvBgdYsblKU2ysKbqalMZTNuHI+iVlKGv2tYRFVPNfC+d1+m9VWCQbrTz8bAm+dg5W
	540tD0yeHQ+JV9dP3vWBwQIf8xiVYbORGoLPmF3xToZ1HkCrU8ob60DDxxjzzUi0r62sMLIrTP3
	HvFxIaOb67Emw9fv7uO1FPWuRX3tueIbiWuRUILsuTk2r08p6+/kinYb0KKP43mu6KFObwkmPVb
	qIUQb2anEWTCx7kFzvKgiZdqQYknJa/vdloP5C6at9+Kw07QSWaHsaVtJlaPX+Ff5eky172rW1i
	RpShKgvvBBnWEHlYq5TXLBrF643YPlcY1KnwYqE
X-Received: by 2002:a5d:64c4:0:b0:48c:6fa4:fc89 with SMTP id
 ffacd0b85a97d-48e6e3072d7mr33054677f8f.12.1793726641939; Tue, 03 Nov 2026
 09:24:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103060658.696994-1-martin.ankerl@gmail.com>
In-Reply-To: <20261103060658.696994-1-martin.ankerl@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 3 Nov 2026 09:23:49 -0800
X-Gm-Features: AclHuK-McbrGplTAZCIwqXxNNWb4QkQhAciv2_yCizkKvvgWNxpSELNrt8SaikY
Message-ID: <CAKwvOdmXSH2W0evc6XF+2yjr1qg3oUExiy-pF+LAx4_iHycu7g@mail.gmail.com>
Subject: Re: [PATCH] x86/cpu: Use prefetcht0 for prefetch() on 64-bit
To: Martin Leitner-Ankerl <martin.ankerl@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Andi Kleen <ak@linux.intel.com>, 
	Youling Tang <youling.tang@linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>, 
	Nikolay Borisov <nik.borisov@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 10:08=E2=80=AFPM Martin Leitner-Ankerl
<martin.ankerl@gmail.com> wrote:
>
> x86-64 does not define ARCH_HAS_PREFETCH, so prefetch() from
> <linux/prefetch.h> is just __builtin_prefetch(). The kernel builds with
> -mno-sse, and clang then drops __builtin_prefetch() without a warning,
> while gcc emits prefetcht0. An x86-64 defconfig vmlinux has 8
> prefetcht0 with clang 22.1.8, all from inline assembly, and 62 with gcc
> 16.2.1. Also prefetch_range() is empty on x86-64 with any compiler, it
> needs ARCH_HAS_PREFETCH.
>
> Give x86-64 its own prefetch(), a prefetcht0 in inline assembly, which
> every x86-64 CPU has, and define ARCH_HAS_PREFETCH for 64-bit too. Not
> the 32-bit alternative: it becomes prefetchnta on CPUs with SSE, a
> non-temporal prefetch, which would change what gcc builds emit today.
>
> Afterwards clang's vmlinux has 57 prefetcht0, the new ones in 34
> functions, e.g. __blk_mq_alloc_requests(), prepend_path(),
> __alloc_skb(), tcp_ack() and the receive paths of e1000, tg3, sky2,
> r8169 and forcedeth. gcc's stay at 62. With gcc 16.2.1, prefetch_range()
> adds 16 to hfi1's receive functions and 8 to scsi_debug, which a
> defconfig does not build. Youling Tang proposed to define
> ARCH_HAS_PREFETCH in <linux/prefetch.h> instead [1].
>
> KVM guest with one CPU on a Ryzen 9 7950X at a fixed 4.5 GHz, clang
> 22.1.8, 6 boots per kernel in turns, ns per call, median (range):
>
>                     before                 after
>   io_uring IOPOLL   680.1 (679.6..684.6)   664.9 (663.1..668.4)   -2.3%
>   getcwd()          912.9 (912.0..1019.4)  901.4 (900.1..907.3)   -1.3%
>
> IOPOLL reads 4 KiB from null_blk, 32 per submit; getcwd() is 40
> directories deep. Built with gcc, where both kernels have the same
> prefetches, the two differ by +0.4% and 0.0%. pread() with O_DIRECT, UDP
> and TCP over loopback, times() and clock_gettime() change no more than
> that. Unfortunately the NIC receive paths need real hardware, so they
> are not measured.
>
> Fixes: ab483570a13b ("x86 & generic: change to __builtin_prefetch()")
> Link: https://lore.kernel.org/20240529032059.899347-2-youling.tang@linux.=
dev/ # [1]
> Cc: Youling Tang <tangyouling@kylinos.cn>
> Cc: Nikolay Borisov <nik.borisov@suse.com>
> Signed-off-by: Martin Leitner-Ankerl <martin.ankerl@gmail.com>
> ---
>
> Notes:
>     Code generation, testing, compiling, analysis, measurements, etc. wer=
e
>     all driven by an AI agent (Claude Code). I have reviewed the results =
and
>     supervised the process.
>
>     A few minutes ago this went to the x86 maintainers only, without the
>     lists, by mistake. Sorry for the duplicate.
>
>  arch/x86/include/asm/processor.h | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/proc=
essor.h
> index 77488ff5eb8c..64748b8705e3 100644
> --- a/arch/x86/include/asm/processor.h
> +++ b/arch/x86/include/asm/processor.h
> @@ -624,15 +624,25 @@ extern int                        bootloader_versio=
n;
>  extern char                    ignore_fpu_irq;
>
>  #define HAVE_ARCH_PICK_MMAP_LAYOUT 1
> +#define ARCH_HAS_PREFETCH
>  #define ARCH_HAS_PREFETCHW
>
>  #ifdef CONFIG_X86_32
>  # define BASE_PREFETCH         ""
> -# define ARCH_HAS_PREFETCH
>  #else
>  # define BASE_PREFETCH         "prefetcht0 %1"
>  #endif
>
> +#ifdef CONFIG_X86_64
> +/*
> + * Every x86-64 CPU has prefetcht0. Not __builtin_prefetch(): the kernel
> + * builds with -mno-sse, and clang then drops the builtin without a warn=
ing.
> + */
> +static inline void prefetch(const void *x)
> +{
> +       asm("prefetcht0 %0" : : "m" (*(const char *)x));

Thanks for the patch!
Is there a reason to have the cast vs simply use "r" constraint and
deref in the inline asm?
asm("prefetcht0 (%0)" : : "r" (x));
https://godbolt.org/z/xezh15oMe

Either way:
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> +}
> +#else
>  /*
>   * Prefetch instructions for Pentium III (+) and AMD Athlon (+)
>   *
> @@ -645,6 +655,7 @@ static inline void prefetch(const void *x)
>                           X86_FEATURE_XMM,
>                           "m" (*(const char *)x));
>  }
> +#endif /* CONFIG_X86_64 */
>
>  /*
>   * 3dnow prefetch to get an exclusive cache line.
>
> base-commit: 2305edc99ef7bbc11a8dcebf78853bc1b6a761bc
> --
> 2.56.0
>


--=20
Thanks,
~Nick Desaulniers
