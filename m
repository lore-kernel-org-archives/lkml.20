Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6834E020E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955320; cv=none; b=jqP4+Ueml0sLYlk1CBzMPjnA0QdXwmckLMJ7d3Am+WUlmsljuwT5d3vwQWiekMiOAxiqr7ATXbmIbrspdvsPz6quvt0fBqniS7ztZxZ1A+ZTb2qGpM/Qf+5HqH1k2voScibuzU5Vy5/zexAxHfunWYMAyAXsimcrKe2hMJuFL8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955320; c=relaxed/simple;
	bh=bgMeIh1vpMW5r0Z2UUaueYfyJsodKGJ3R8+jL/Snwco=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RXS5zxuKYVD59kFYJyK8qCd3CHDWWSZOfXZY8kCU6AHRlts+u9F6PMwAEgro94CKN9h1i6500n+iHU/tMsniW5/2rC0tNMQQyw2RzZrpnQ4rNyQDaa/yESmDTxaofkcv89fMctdM9s4PUDE/9XtJMVfBEAWX9TvizPSQg1d4i6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FBmidAss; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FBmidAss"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so74429885ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790955318; x=1791560118; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ulPJ+yIIyvNEzuRqB5Fotp1huOAGEZ6P6NiuujPsDU=;
        b=FBmidAssnLL52ChGak5KzhMgpNrjYc5MoABoyvaf9mJCWhCUKxk3kmZXlWk8Fumdpl
         Wqate9JI2pgbrC9yCmenfGC9xdamy3mW6zR6lkJFDn9VM3Ic901yUsDWBNc5CEoK4qYR
         7rHo0WlTWB/I0ZFX7HVF3hl2KaQb10W5U9+3axktChYzHylnDXsf76GnbqnsmrEmULIx
         +jPFp6774TjcQNOx/zDg5CNulqggsW9mO94m9dUeTkEG0gs5PiR14rRQiifeVkOs7ask
         zNd+TUaMhGDGt4Zrm80e3pvdfM5WRhizp9bgfE/3yleLWCWBEWifol+2LgEu9/313cyV
         eBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955318; x=1791560118;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ulPJ+yIIyvNEzuRqB5Fotp1huOAGEZ6P6NiuujPsDU=;
        b=H3CRvmWMaN9W4J4+sutbcMsemRc0K/DQ0/GHHWorFd8iSCLdfleW8AqEzo/jPUS2vD
         VucNAQfthFHUSuX6QiACjAVFYt004I0PTsshLjWRGpghvf3YizOP82+kzWM3NDOHVPIN
         zI7UnkvFK95pLjbg1z81ZbhoIAN+9DAXqdAwOfmnub49AOHkHdGbWw7nOadeTcslpCyl
         cmQhOZ76a6rJhnnhYEENasCv+bYa5IRe+f0tV0e8JlrTismcQDujHUfj9hmQgUw7Vp5L
         kRyJcQb1vDtryHCkV8KpezM4NAqh0vIuTABUgcC2YpClXlRjHgiyq96ugMgSh0iivucJ
         npFw==
X-Forwarded-Encrypted: i=1; AKwUvBzQUsEJL+/2Xmkes6+9DHKqCoK2ivqlSdN/lNJyHQF6LriLd/sMGVqQejCcOm5hx/3OIXyxiUoxNRiFXYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzgvFclnM+HPVsobmywx1V9lRAHMINQuX6bymKIE+NpAnKpA23
	BqUUA4gXFcKfkQS8V7oVjBAkRHo1BLWtbavv2P1nqdWy60E1NVxmFNRsjJb1bjzG3EnYwe3ylZb
	k5pCsQA==
X-Received: from plq5.prod.google.com ([2002:a17:903:2f85:b0:2e2:f17b:1655])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:8c3:b0:2df:9305:8909
 with SMTP id d9443c01a7336-2e49b6ab32dmr26853235ad.17.1790955317254; Fri, 02
 Oct 2026 08:35:17 -0700 (PDT)
Date: Fri, 2 Oct 2026 08:35:16 -0700
In-Reply-To: <20261002151942.491680-1-bruno.produit@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261002151942.491680-1-bruno.produit@trailofbits.com>
Message-ID: <ar_PNEIvsQMQPMLg@google.com>
Subject: Re: [PATCH] KVM: x86: Cancel PIT timer on failed creation
From: Sean Christopherson <seanjc@google.com>
To: Bruno Produit <bruno.produit@trailofbits.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, 
	Kyle Zeng <kylebot@openai.com>, linux-kernel@vger.kernel.org, 
	Dominik Czarnota <dominik.czarnota@trailofbits.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 02, 2026, Bruno Produit wrote:
> From: Kyle Zeng <kylebot@openai.com>
> 
> Cancel the PIT hrtimer if PIT creation fails after registering the PIO
> device. This matches normal teardown and ensures the timer no longer
> uses the PIT before its memory is freed.
> 
> KVM registers the PIT's PIO device before registering the optional dummy
> speaker device.  If speaker registration fails, a vCPU can have already
> programmed channel 0 and armed pit_state.timer through the published PIT
> device. When I/O bus registration became fallible, its cleanup did not
> cancel the timer before freeing the PIT.
> 
> Fixes: 090b7aff2712 ("KVM: make io_bus interface more robust")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Kyle Zeng <kylebot@openai.com>
> Signed-off-by: Bruno Produit <bruno.produit@trailofbits.com>
> ---
>  arch/x86/kvm/i8254.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
> index 1982b0077..b7875345f 100644
> --- a/arch/x86/kvm/i8254.c
> +++ b/arch/x86/kvm/i8254.c
> @@ -793,6 +793,7 @@ struct kvm_pit *kvm_create_pit(struct kvm *kvm, u32 flags)
>  fail_register_pit:
>  	mutex_unlock(&kvm->slots_lock);
>  	kvm_pit_set_reinject(pit, false);
> +	hrtimer_cancel(&pit->pit_state.timer);

Given that the timer can be armed if and only if the PIT was successfully registered,
wouldn't this suffice?

diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
index 1982b0077ddd..33d772c7160b 100644
--- a/arch/x86/kvm/i8254.c
+++ b/arch/x86/kvm/i8254.c
@@ -790,6 +790,7 @@ struct kvm_pit *kvm_create_pit(struct kvm *kvm, u32 flags)
 
 fail_register_speaker:
 	kvm_io_bus_unregister_dev(kvm, KVM_PIO_BUS, &pit->dev);
+	hrtimer_cancel(&pit->pit_state.timer);
 fail_register_pit:
 	mutex_unlock(&kvm->slots_lock);
 	kvm_pit_set_reinject(pit, false);


>  	kthread_destroy_worker(pit->worker);
>  fail_kthread:
>  	kfree(pit);
> -- 
> 2.53.0
> 
