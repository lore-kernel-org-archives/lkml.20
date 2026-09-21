Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F634A4409
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999580; cv=none; b=kWZJXx0kJTyUNEGi9GS5d8KKS0Q3SO68+tmUfB1+dVIpMZBJPueuVtVfdjTfqovaHXL82PicMiHLJBD30nmRiOHPIw9DSBar0zPNE4/cTKuvt/4i+d/qMI3MI5W+HxNYjkT3INAg0s6NVrF8vaK93GxrxxDgjyhNWZKiaJT9RiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999580; c=relaxed/simple;
	bh=wCnC8qI8CEh2m6FoC+8QGgv1VEGAixHn2X1dL8GvZu0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L7TZHLBXryFKuP7OEbIyoXpsjgLAvoum3CMTg9rrbYMQsRubSvux3Ds361ohPXpE1BXPviHOEEr5UzYQ5d0Md2ylNyfcRyNfZd+O9mJq9zJGtbKMgnGNdeAIQOvIICwOAqnj4pwMTxRyh8ZjG5P8qZOfYfPbFS5DZz4pMOgE04Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NvaiD4rN; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NvaiD4rN"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so2455248a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999578; x=1790604378; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNaqNFX1vJ/yB78IhkJf6QSv+su8YEM8AM0UoTN4xH4=;
        b=NvaiD4rNW8eKAvDm3DE3Du9th83iAgXXIq9TsPi6oTEH2stFOYwToXSkKjm/WPKdM4
         B47nCpt4vk27XusGa6UJQZe9UULwrga3bAKLMx8giXI7x5DJ2/KwbdgIXpr/W7gn98YI
         oZQ4jDPVADNpJ4YMZcnfI9VbUS85bC9Sjb6S5ldUN/wcI62t3AxUW0N1HVWeIQspKWkM
         79XXUdN+SrHf/BlJNl75ezDZWtwZhR1lWWPtaIb35F7+eLeEMbho+HYhGeFEf67JHau9
         RybEiMqEL25/tdrcJl5YbqBectpOIWdwivTefiCoHr1Mw98hgG62wtVr2O2cQUJC3wke
         p+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999578; x=1790604378;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNaqNFX1vJ/yB78IhkJf6QSv+su8YEM8AM0UoTN4xH4=;
        b=RmdY25PfXvCoAMm90IbS6BAKkW1yhR1zh6kjzFNtvz+edSt+/1x2S7JhgrOxZFVb1Q
         cn2UjxrgjBf9nNvCBXyDgeYW6uhld7k06cao/fKQbcl782Me4VFzkmU/CXW+wHSTnnT4
         OcrIThP+ko/Cjlcy/rtABUZ9khXwEdngnOYD2rWdzv1Uxwj+DRVHbPlZAEuDPZ9uyP2D
         wsjjNozSHAYrNgLRxkc9XHFT6soeUEln3GlTY8nYtNCDBOKJTcnlR5WhfDEULBtou2NI
         e/QvjKr3u/UgbTGMZuzwG+ryBC++5gtnLoSyn0xjKxF570Hev8g7nQGrEoqmgbFSr/T5
         ZY+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwLSedOPQwVs7jnFKJXm300N5MCkMzsqgZAQwgNIhj18gQeB2zXU4Q5yoLpnZDV1iV2Z5qoM31OvlbaNu4=@vger.kernel.org
X-Gm-Message-State: AFuF++mlfRJYs22JJe8jluPkOEnJ98nDxINlrURDTga7O7iwTkLTAvVr
	2/UpNWCCr6/Wqz1Fx/OPXPqmBcZMH4bYmGYFZ+rkqZ6FUgIHKZ0ZpwMh3NfQzD1Ca/H/oowx2HE
	Qu4GXtQ==
X-Received: from pgtk20.prod.google.com ([2002:a65:68d4:0:b0:cc5:1024:105e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:482:b0:3dd:a195:fa1f
 with SMTP id adf61e73a8af0-3dda195fc91mr11921087637.68.1789999577997; Mon, 21
 Sep 2026 07:06:17 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:12 -0700
In-Reply-To: <20260806171400.4119301-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260806171400.4119301-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999688412.714688.17254419509505486667.b4-ty@google.com>
Subject: Re: [PATCH v2] KVM: x86: Track kvm_vcpu_arch.pending_ioapic_eoi as a
 u8 to drop dead BUG_ON()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, 06 Aug 2026 10:14:00 -0700, Sean Christopherson wrote:
> Track the vector associated with KVM_EXIT_IOAPIC_EOI as a u8, as the vector
> is zero-initialized and is only ever set to a legal vector.  I.e. unlike
> many of the other vector variables in KVM, it can't be -1 (and can't be
> greater than 255, though that should hold true for all vectors in KVM).
> 
> Drop the now fully dead BUG_ON(), which aside from being completely
> unnecessary, was also useless, as it wouldn't guard against a negative
> value, i.e. wouldn't detect KVM's magic -1 value.
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/1] KVM: x86: Track kvm_vcpu_arch.pending_ioapic_eoi as a u8 to drop dead BUG_ON()
      https://github.com/kvm-x86/linux/commit/926a9ea9bdf0

--
https://github.com/kvm-x86/linux/tree/next
