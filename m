Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819710;
	b=bExXr1YhxTCZkraRkbchefxrO5xE1HN2WWxrCcJXabIHTrRSpP9OrlXAJCQXGuXNDMDS
	 QJCPNvUPQhpovDh6zqq6VKtCev37i5L0Dfqwa1WULmzc+7QIjZCr08q3XQaUA6FcgbPgV
	 LqCUIpCKWCd2mO8X59bJrb2sEpYxjWSNLO0XvcPlkt8gAzMrXSgneeBiOjYR3cyPn87vb
	 TYntGYWF7SKRewNuBA+XNQWML6WErzKMVz2yNuoqOaKV3eIBhowvKuXfsM7lMkMMp2r67
	 PSagCcRKnnrx5WOSg1ReyCSXwsodyYyDX2IPnd9xYOjJPm6c8B0NhXOP1aFndSNDwrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Content-Type;
	bh=fJF7oJyRnRKwnIF54ui40VQH4dCqd67YhvJqsB+AsGw=;
	b=KRyx85A6JPXfqd/L4bBqLKLZgnp32MI/KflzAYLesUqStt/ARbbbP33h+63cyEWgSexG
	 BtDLd5a1qkjtta3AZWjzfafT8G4AT60PjhheSvpUw3XH3LN9RrdUnCAOdgawdh8cSpNGp
	 jAAGQelCbul3RqK29vFTiZXx83rid9Xqafp7uVbD5FaVzxvwwPxkpp8fViohh8lA1GDkT
	 fWPZ0KBGOtMof3r8nq19Ys2UT/GwZArsiEM7UzHwPpLk88pckrJUXwF3nTfoPz1A0THWM
	 cJ5jp/1Na2m7AKalfzI/VoZWsRbsLZVIWeSuPLZuL45UHqKiLi6MC0hXVBtII5/raYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B9EBJFFK;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F7A606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29F7A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B9EBJFFK
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eced5a4cb9so9988085ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793819709; x=1794424509; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fJF7oJyRnRKwnIF54ui40VQH4dCqd67YhvJqsB+AsGw=;
        b=B9EBJFFKOPLa8N76mvIDQWxG8tktJJ1rFUa7UxoNWRzGeo2kjOkI3VVGPeNm6HIz+X
         TlXdC1p7yba6bgKUEEoTS8nYjXcRdtfswPfEIF/QgJZj6DVy/IJCMFjpy2rAzt8N5gMG
         b+yZqgldnlY4F/IwM2bUsmRYsy5dTu8OghEgLTHF28YHfCCSkC6tvAABJKPNofXNQCI+
         RlL1FvgkKGWrAkqB+EI28qiCaIPLHBBEawESnvXW1/ZqZRS71CT3ToxEuMr0YI15bj5P
         JXh5oK+JROscK2tKBdZp2oeAvmdPn7GEr8SBwnSjVjFn7+6OoBiVIZEe57PAJxfEuoXD
         Q68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819709; x=1794424509;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJF7oJyRnRKwnIF54ui40VQH4dCqd67YhvJqsB+AsGw=;
        b=ir3a2ieu0Iq3dRer2JqmiZncQN4hEbF/1AMsdQ5OHorLK2f3A15PyLsHN4MM9NAyLz
         CdDvDJ0Wq55QElwIgqmmfaxR+yw9a0wSPudhYfQLc2cixoPCiHN4qF/0hsGRGZXmxm4N
         1LDWLetTubzGyPDI1WOmW2DipSmb8OwwUXRvcz6eFQ35pjdfsfACX8hCBhaKmraVVDRv
         7NcKBSdAI9bn9cD4p5O/mLK2/UwykEn8g9PLD2Jqm/3Tvae4EfKULnm2U6fftWX69+4i
         K/BGPlKPbBcXh0VX6nbpctzU70e097TYs190bn75fbbAALtMbcbrp591dtYowiYBANdF
         U6vQ==
X-Forwarded-Encrypted: i=1; AKwUvBwt3NO11c6JRqHuTTCTPwj4wBrORoKENPCrtxZ2HRrsl5sh3PPn1cH6JdXAUFbAEQOdsVrzD6jVs46Vuw4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mtRiwWGWMSUNzc9BaZrnsMoMu5wg6SalbddS+aRfUO27zXrGT
	995UOuxobmXGDjEzMwgT2ACAxVL2PJDmwYKLPsFkIAYz3i7XcZyaWe9Z7lnR8gSL192ZUot/dpC
	ITZ0kLQ==
X-Received: from plbmm7.prod.google.com ([2002:a17:903:a07:b0:2e9:696a:93ef])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ec85:b0:2e9:6788:937e
 with SMTP id d9443c01a7336-2eb364d1716mr142995105ad.42.1793819709207; Wed, 04
 Nov 2026 11:15:09 -0800 (PST)
Date: Wed, 4 Nov 2026 11:15:08 -0800
In-Reply-To: <20260701002152.546245-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260701002152.546245-1-seanjc@google.com>
Message-ID: <auuEPPzOjkdnQBFb@google.com>
Subject: Re: [RFC PATCH] x86/irq: Drop redundant irq_{enter,exit}() calls from
 posted MSI handler
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 30, 2026, Sean Christopherson wrote:
> Drop the unnecessary irq_{enter,exit}() calls from the posted MSI handler,
> as the wrapper provided by DEFINE_IDTENTRY_SYSVEC() does all of the
> necessary bookkeeping (the x86 specific entry/exit code provides a
> superset of functionality).
> 
> Note, in the series[1] that added DEFINE_IDTENTRY_SYSVEC(), the follow-up
> patches that actually use DEFINE_IDTENTRY_SYSVEC() drop all
> {entering,exiting}_irq() pairs (including entering_ack_irq()), where
> {entering,exiting}_irq() were little more than wrappers to
> irq_{enter,exit}().
> 
> TODO: Explain what, if anything, can go wrong?
> 
> Link: https://lore.kernel.org/all/20200521200513.656533920@linutronix.de [1]
> Fixes: 1b03d82ba15e ("x86/irq: Install posted MSI notification handler")
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
> 
> RFC purely because I have no idea what can go wrong, and I'd like to document
> any potential issues in the changelog.  I'm confident in the change itself,
> or I've failed miserably at reading the code. :-)
> 
> Found by inspection when looking at a bizarre code fetch from RIP=0 #PF that
> traces back to the irq_enter() (no reproducer for the #PF at this time).  I
> don't know if the redundant bookkeeping contributed in any way, but the calls
> to irq_enter() and irq_exit() really stand out, because AFAICT, these are the
> *only* calls to those APIs in x86.
> 
>  arch/x86/kernel/irq.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/irq.c b/arch/x86/kernel/irq.c
> index 30122f0b3af9..0ac63628a585 100644
> --- a/arch/x86/kernel/irq.c
> +++ b/arch/x86/kernel/irq.c
> @@ -430,7 +430,6 @@ DEFINE_IDTENTRY_SYSVEC(sysvec_posted_msi_notification)
>  	/* Mark the handler active for intel_ack_posted_msi_irq() */
>  	__this_cpu_write(posted_msi_handler_active, true);
>  	inc_irq_stat(POSTED_MSI_NOTIFICATION);
> -	irq_enter();
>  
>  	/*
>  	 * Loop only MAX_POSTED_MSI_COALESCING_LOOP - 1 times here to take
> @@ -456,7 +455,6 @@ DEFINE_IDTENTRY_SYSVEC(sysvec_posted_msi_notification)
>  	handle_pending_pir(pid->pir, regs);
>  
>  	apic_eoi();
> -	irq_exit();
>  	__this_cpu_write(posted_msi_handler_active, false);
>  	set_irq_regs(old_regs);
>  }
> 
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog

Ping.  I don't care terribly about landing the fix, but I would love input on
what, if anything, could go wrong.
