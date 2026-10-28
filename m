Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793224323;
	b=h/N7YrYGuoDRn/AtAcLibLCrjXPdArDToyz753Agz9s9S1f4hclwBNhJw75yYK1A9j3B
	 Re7Ty5vIFlz5GlInCUFwA/k2SHGk9xESlUKvcdm7JXyDM1UH6of6ILi0b+pZ0mLretqZf
	 F8/8ZutcBQwvJ7JRwgdqMKyJ3j43+v7xqLiuz3iDr6pcryBibywsYMriJoO3kDzdlGQnS
	 t5hmxMv0ux+yHWB6KKfzsspUb3l/Od8kJEATkTZmXA0IoYVFuyASiz0E4oHKxiMnaOt2J
	 huGx3hVfZffrFHL7hsQbk3ptUHWU+ytVOgdCW5UhCq5WnVfbYXoaBmPbDiMh+RTFWHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mPtExrnKGOMQtspuIP7yF8Ip7fswDzEEpF0H728OVnI=;
	b=lKswTjdLqUBUQm3PLZnvjmEp/VBnz7VGyOYbnFXtjwC55LGObQHospfckkA0+B+7l9xR
	 z43mCHI/A5pT4RJSS3kyIsQttJ5nkFBXNif+IF/8W6zgLld2gllR3inCDb3/+3bVUaN4k
	 pyL1EKRNfbxxgkk240XCXegkJy17G4brJ71RHTwmZ2Z/3QEhTCKFUBbzq5Jj4ZYd57iFg
	 aHfCfohuLao68Dp6uW7+IEYJXUnITvIOzZJl9hBtrQ8JPaFS18shZ9Is+WRyo9By40vzE
	 8uXCe1jC5sKNc6qaJGpRR6p319kSFpfJxikm7OrhQN0VaaqkRUAHd3aklGNu8kjG9vQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MVKsgzc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784FD606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 784FD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MVKsgzc
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9e53d011eso10512625ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793224323; cv=none;
        d=google.com; s=arc-20260327;
        b=W63TmVULv6cMtoTquo1jeTrXYQSIw6O4NCHneLlcA9nmglPFybr3lCLqbn0AoqcxKW
         h1/DTmIg8mWV6Beh6/rrmIV1xVOHudm8lpzfuvm2ywytlAirjs6aWl6UFzapVTbtsTRh
         noGADwJLiLdQ5OZDmf/Apq5v2n5vqHPRAUkLBmP7fmYmOVSpzSX0H/xairaybHGL+LT4
         0f+cruQ6FDJk5vm3L+h1Ec2aaPZ2aAYULZtIuBESo0xsmllhDd0lbV7YISGrtf6dKk1y
         xVmhr6H9PZFyz2EEijFxi/6S+JdFaSsAYtw9sBgxWMHeA5uEWQRLPEhfETap0qDye5hJ
         As5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mPtExrnKGOMQtspuIP7yF8Ip7fswDzEEpF0H728OVnI=;
        fh=89NBXn0QjktoIyTymEysBNAs4AVnrISUMZPCa+g3pTo=;
        b=g2BuKbWpqbHwIvCTJu0YiaFxw/09NDNrRQ63m9BQPROCwaLxa7M8SDFCscfx8bvK9T
         agfJfco/0Q2euVxGG/2g4mjDtDZbpPyVRYqgbgiJ1fJbwXkNObFNQ6NZVPXPpwy0MMJt
         gUPfv6SvWYs84CQXzwyVVCABhq6Ib0S+KZ1j8nJnBULqNZ2z9m9XColrfTWLua/IHQjM
         v5dj/yXOuuUSsa9aEJqftKv6L0wvmQmAK04+OYbzWbslXxbYL2tRUFUSmscwg2I0xs9t
         HtgbauW789XstC7RGieNNSXwOof+KjeuI/4XZc3hYh8nlnkbzxprHmtMCK6PkCdqYVlP
         aS9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793224323; x=1793829123; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mPtExrnKGOMQtspuIP7yF8Ip7fswDzEEpF0H728OVnI=;
        b=0MVKsgzcw3XsZH5xCrtY10JGwrODxblZvE9fjvtxdDOfDlIewMlbTr/AUZBdZAdIRv
         0XG1+CGZb8xXRLmCTL6fiRGDyomJDYNr4QM/uqJT3iK5SsdywoNabbCFBqs20TpdPKHo
         in5si+Hxd/5IJI1ttPwmNlRbnyEf7ik3UqRrWwEDueLvq+WLrU5IvQztNMXNwEjvW6dZ
         lda1In9bhFdsinJ5V6NZsO3emcR9VATiODrcC+AuKtafi5TVHEkqYzpz991Ua0p3pwg0
         COypZaI+4OuJhTuNOwGZP6bn2ajsgpsRfQfS895cWAKcgB9eqUvxR0b+lK4tm8EuZVwp
         0RlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224323; x=1793829123;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mPtExrnKGOMQtspuIP7yF8Ip7fswDzEEpF0H728OVnI=;
        b=fTpuQLbTd22DipVQLIJZOE4ROyrtSEzpknv6nBlkbwhaHgsHGK8yXWI/4WIyKnepbk
         u0hFH1uKdHYQgnOxF7ooHwBjRjR9OxFtXST40p9cSNk+tSMSV+OpTqtVng00Zi5iYNoG
         OfzXmm5OywZTvhM2niJ9KviMUS/wcvJ39pb1UqX6AaTrQnOqxjis8ch5nNy37NTsn8LE
         7XGLySMXLiEzzBRzOUGIkzoRSnTLmm5HaFmC5dvNMLXKA+122SAmY4N3Mh4AD7xhjWDF
         cxVN3VEQJfOoyON2OZ8h8Kj0nhgKm649GtJlDIzrsAYcnjXCeB09O/KaI/mCMNO3G0z+
         sQow==
X-Forwarded-Encrypted: i=1; AKwUvBz1GBt1aAw3IgwoFIwKmvZfB2V1Mtx//1e8hYKet7VGTlm2TQs3j2ckKFzMMAO9WaPuAMcfU7QlsiqPmBs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtBDbabp/6MeVJgAc/A8DuSs7p5+/4bCb8g6hLjuHTYQHH/uy2
	E7Olyjh/xURb7YyGr0k1HY65cc6hDJE49ZbGaABq4jCQ+NvEBPXZM63/ufP9JIxHdjzEjmGiVtP
	KRyqbpPvD+APpLeowoo6o/7EoHxo4nhc=
X-Gm-Gg: AYBFou3Cjat4Vg7+QJ8gqLXJK567iaYvwFrkiu5KlsfcEavQR5QbKONjlzpvfW3PaHj
	WuoR5adlIxJoi7JX7OAX/BLoYwe2APD1kWBWtVI55kR++N85egdAni5HR38SAqCrFW07750EIIr
	655U+nxKY0TJx0ybaRRrORtLZ6vlIdflS+rdYzv/egSFSd4UVEBVjnqlMDu8gTpwwAD+w08vYgb
	IbxQSxsxsbBDYS8QJK31mNiXutn/8JJtWuf5TYmlhS4i7jOGSwtkct8QiqDMac4HDqc01WJnVaN
	FD5iyGoM+FZ2Gb2zFwlmgrf82uV6Lm0KJFdFB41DT/ZKG7J41HU2xd2169JCJEJ/97LhdXKLAxG
	eJZWFICLbwBVoQnlQXbAA2quzQ6TRjx3MBmNzT/U=
X-Received: by 2002:a17:903:94d:b0:2e8:1d5c:f6f2 with SMTP id
 d9443c01a7336-2eb003bd5f2mr34821655ad.24.1793224322720; Wed, 28 Oct 2026
 14:52:02 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793216372.git.ashish.kalra@amd.com> <56da047d63b22f03a7e709fc172a5543da894d67.1793216372.git.ashish.kalra@amd.com>
In-Reply-To: <56da047d63b22f03a7e709fc172a5543da894d67.1793216372.git.ashish.kalra@amd.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 28 Oct 2026 22:51:51 +0100
X-Gm-Features: AclHuK-lLMUGo00CsLuRjBYLJYO8QfoO65WYw2V8BbtyozSJ3LTmNXJa2V5HQzw
Message-ID: <CAM9Jb+gBzgwvtOkV32bNudAqb4sU5+40zuj54py+JoLVvV+naA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] x86/sev: Clear RMPOPT when segmented RMP is
 disabled by firmware
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, seanjc@google.com, 
	peterz@infradead.org, thomas.lendacky@amd.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, ardb@kernel.org, pbonzini@redhat.com, aik@amd.com, 
	Michael.Roth@amd.com, KPrateek.Nayak@amd.com, Tycho.Andersen@amd.com, 
	Nathan.Fontenot@amd.com, ackerleytng@google.com, jackyli@google.com, 
	pgonda@google.com, rientjes@google.com, jacobhxu@google.com, xin@zytor.com, 
	pawan.kumar.gupta@linux.intel.com, babu.moger@amd.com, dyoung@redhat.com, 
	nikunj@amd.com, darwi@linutronix.de, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> From: Ashish Kalra <ashish.kalra@amd.com>
>
> Segmented RMP has two independent states: the CPU *advertises* support via
> the X86_FEATURE_SEGMENTED_RMP CPUID bit, and the firmware *enables* it via
> MSR_AMD64_RMP_CFG[SEG_RMP_ENABLED].  A platform can advertise segmented RMP
> (CPUID bit set) while the firmware leaves it disabled (SEG_RMP_ENABLED
> clear) -- e.g. through a BIOS option to disable Segmented RMP -- in which
> case the system runs with a contiguous RMP.
>
> snp_probe_rmptable_info() clears X86_FEATURE_RMPOPT only when the CPU does
> not advertise segmented RMP, or when the segmented RMP table probe fails.
> It misses the advertised-but-firmware-disabled case: that path falls
> through to the contiguous probe with X86_FEATURE_RMPOPT still set.
>
> X86_FEATURE_RMPOPT is a CPUID bit advertised independently of whether
> segmented RMP is enabled, but RMPOPT requires an enabled segmented RMP.
> With the capability left set, RMPOPT_BASE is programmed and the RMPOPT
> instruction issued, both of which #GP on a contiguous RMP:
>
>   unchecked MSR access error: WRMSR to 0xc0010139 ...
>   general protection fault ... snp_enable_rmpopt
>
> Clear X86_FEATURE_RMPOPT on the common contiguous fall-through so it covers
> both "segmented RMP not supported" and "segmented RMP supported but
> disabled by firmware".
>
> Fixes: 15d974be0a3b ("x86/sev: Initialize RMPOPT configuration MSRs")
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>

Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>
Tested-by: Pankaj Gupta <pankaj.gupta@amd.com>

> ---
>  arch/x86/virt/svm/sev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
> index bd70c4d0b774..cd0412b9d251 100644
> --- a/arch/x86/virt/svm/sev.c
> +++ b/arch/x86/virt/svm/sev.c
> @@ -827,10 +827,10 @@ bool snp_probe_rmptable_info(void)
>                         setup_clear_cpu_cap(X86_FEATURE_RMPOPT);
>                         return false;
>                 }
> -       } else {
> -               setup_clear_cpu_cap(X86_FEATURE_RMPOPT);
>         }
>
> +       setup_clear_cpu_cap(X86_FEATURE_RMPOPT);
> +
>         return probe_contiguous_rmptable_info();
>  }
>
> --
> 2.43.0
>
>
