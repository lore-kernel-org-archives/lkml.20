Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409443;
	b=r5g2PzUGQVSjPXqa1wbi9hVyOfAt4zwPk0fu52Lmw8CjQsyK+4/aKYOGuWF20RLqIbFy
	 vgj4gKkXsKtWyASXwlMWiCrQChDd+8TOPLMtAZ11KZMEtBhX1JwkBiL2fH6Q0g2Nv2hg+
	 3lUZO8+8+AlxRdn9XbOGF4JuxhxsVys+7u49xVMWGwMghmOdOaeeBGQu/lhvqjVnsGyzj
	 NJVPJKjkXvkY0uLgXB4wVwY13PTv/OgjvrDnQItXc4DdFjH5qe956Iugzzivb5ECK/b4h
	 bzqOQs3i5cFTlf3emxcXH0yW2C9uOcyISZy7VVPU2Ll4OgbAEn/mATref304eQ+C14g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Xohx1IjDZdPJHBCO9sIOedwalhMTflOLnFId8LnvsXI=;
	b=UgJ/P+KL98d8gVodn+JefTbuXkL4Iknd29GLvsl5/S1p0vvKNns8H0AavJNN6gH41Qgh
	 ZHg3hwes/WLzPDQikvbiIhZalx+1XF8PeXBG/Dcx3A92m1By6S1tFzZh/t4jzFHmKgv74
	 yLcHic99D60k+6x/qlBzvnYPnOEbDb341HMOXguQElq54cYOdXEKM+yI3nH72wxMxDa7f
	 BMx3Tm6fetcI8sRtsuPEQmqIsCEQDG/Dsk2UWumrZB39JUCQZHQQPE2xMFYQ7ru3BRTqp
	 cu4XIQvGqAIp9lTTYlhvnIp1mZhG2oewuUx9CCYbIyqjAe5FZaKXE4tKuXDKqaGktGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="n/7yjK/k";
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60A6606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B60A6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n/7yjK/k
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed08904845so47768815ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794409442; x=1795014242; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xohx1IjDZdPJHBCO9sIOedwalhMTflOLnFId8LnvsXI=;
        b=n/7yjK/kTZvRrtlAjD9jXSl4O4X++3TVgI0zZran1lmgIqefGlQoYyAB3too7WEhWW
         EOhAilb/PE6ciMYe2naEPqjM3T/dDV3Mo1c1O+WOZlAfrt2uVOSqzTV3SlTLb6pWTdOp
         WKIkgJtuUjbxx/fusxCQoDo6wiTI3f1E7mbxNCy7SRomYbogWuBjKknekLThyZA6kgym
         if8FSqiTSgvLu0Bb7EyE8V/9stC9m9ex7w1gh3RviydfZOLwYQ+LAyFbmc+2CFIKX73K
         XnVHbGokuP8uJ1WaAE1pIl+pOGBeKf+/jbaUXu7QSIbPRPT9kwAApLrIkTBImcdSlPVh
         8QkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409442; x=1795014242;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xohx1IjDZdPJHBCO9sIOedwalhMTflOLnFId8LnvsXI=;
        b=bgonzDGMXvPE1G4jBr+6sIedI+PqRIIIfh5ZkfAKBksXMmu0SoFjZORrJvvAgYL//6
         q6Gdin1tWoO26AHPbaGmDmIEBGedPTQ6SnMzCneleGjBogVGe22BYMpOTfdfboe7Q0sl
         IPuVeo/JJuTST9QBNnRRocrwVlnLwsO557+IRxiIarXkIMukitzZpx5V9UkuPD/iTID2
         bSAzKunbWWB/cIz0JbedUYN5U6gr7eKG7iy6lze2sAfo4WTLYlsoI4JPYvdU5FI6n5Cl
         hW7X+YRiK+jv0wt05+BON1RX5zXzmUxcQk8ntYqT6FFDDRWdKnJ2h2BfSu5tSEEFuCtl
         I01w==
X-Forwarded-Encrypted: i=1; AL+hErEjQmh5aD5X9+5ILiD2urGEDuojbPs/3pQQyp9Xv2r1xXt1qdPnvEIdMZFEphszIc8UAvN0vBoDYZGaVt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4eRFLmRRa6dfhTp+Vr8jCh/r/kWAsLLmP69CLMV21RlJLyxZL
	HR9g1Qxq8usDB+JoEhq41UydzA/6gR1xRxYba3YwT3LND3ktvDRaQs5asuIgHAaVjK3wL1KIJnC
	xttsUvg==
X-Received: from plgd1.prod.google.com ([2002:a17:902:cec1:b0:2eb:260:cd54])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f645:b0:2df:aed3:2ac0
 with SMTP id d9443c01a7336-2edd76d544cmr31113705ad.10.1794409441694; Wed, 11
 Nov 2026 07:04:01 -0800 (PST)
Date: Wed, 11 Nov 2026 07:04:00 -0800
In-Reply-To: <20261111122128.12998-1-sarunkod@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111122128.12998-1-sarunkod@amd.com>
Message-ID: <avSD4O4AELPcmhqb@seanjc-mac.roam.internal>
Subject: Re: [PATCH v2] x86/kvm: Use RCU for svm_vm_data_hash
From: Sean Christopherson <seanjc@google.com>
To: Sairaj Kodilkar <sarunkod@amd.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, x86@kernel.org, vasant.hegde@amd.com, 
	suravee.suthikulpanit@amd.com
Content-Type: text/plain; charset="us-ascii"

KVM: SVM:

"x86/kvm:" is specifically for guest-side code, e.g. arch/x86/kernel/kvm.c

> Changes since v1:

In the future, please wait the "normal" amount of time before sending a new
version, e.g. a day or two for something relatively simple like this.  I.e.
treat feedback from Sashiko like feedback from a human reviewer, and don't spam
patches.

There are times when it's acceptable to break the "don't spam patches" rule, but
this isn't one of those times.

>  int avic_vcpu_precreate(struct kvm *kvm)
> @@ -373,9 +373,12 @@ void avic_vm_pre_destroy(struct kvm *kvm)
>  	if (WARN_ON_ONCE(!enable_apicv) || !kvm_svm->avic_vm_id)
>  		return;
>  
> -	guard(spinlock_irqsave)(&svm_vm_data_hash_lock);
> +	{
> +		guard(spinlock_irqsave)(&svm_vm_data_hash_lock);
> +		hash_del_rcu(&kvm_svm->hnode);

Eww.  Don't open code scoped_guard(), e.g. this should work:

	scoped_guard(spinlock_irqsave, &svm_vm_data_hash_lock)
		hash_del(&kvm_svm->hnode);

	synchronize_rcu();

I'm a little hesitant to put a full synchronize_rcu() in the destroy path, but
in practice it's should be ok.
