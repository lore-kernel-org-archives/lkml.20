Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C14283142
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258158; cv=none; b=jFnIowLlndj2VK81+2AnDqqr8Hi01raoyLF3IPDKmOWxhVUpNfwcPIn1J7rjDKeU+xDeH2mLUFV7l34WEJZhmCYqdI17Y8OPlIYcKXiKFHPwNR53ySk+83uxIhQsMwnZngS1AEDVJcB+GAm81q/ye1kEClDsbllvRPMVkEDNW74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258158; c=relaxed/simple;
	bh=7CDtzh4z0CdqypNI8DxFycAekERpE8E986pd4O2J03c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VSwPxwXwgEAweU3ddD6ROWsUSPg1GHU2ixi2ALW8rEOWakendGbWqxgpr+0S0/+l/oBWz1SVqrLgviLxNU81PgeM5NvlNwpTmVq59ArVKvqyehNeAVmNrMy5dCGFoKZsamdL6iW2Sz+A8+Kv0HIU5d5rFcvn265pkpseKabU8fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dtsew/BA; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dtsew/BA"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d959904658so21029145ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790258157; x=1790862957; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkxGGQAcZQfF96GEV0BfePCSivvqi5OVjJFPctkp1vk=;
        b=Dtsew/BAybhEnBj1Xfr6KxnBoUkxE3RqZnR+j+XUDFeedIEhQjuO0jRqMq1mQfP6eL
         VAqQomKNPRt3a2zFVvxRHkHLYh2aYDn/rzLRSIHSIFcr3j6dxtYDtFBnqOd6w19AJ9Qy
         m27kn3ZvG7L8P0TnbL/2GzXFNl7fwEm/u0mEwaLStWDzzGe72paUgVcU2qWmqiCzULZA
         5/0UDyUQ2AvMQKyStb6CyBnJlLidDpv5o+C/MC7NTZRceVvIEXB3onCBY8fFouLPfWPF
         CZXk0pliSpIw/sC7CZnfY4rSFvxVHTm8kz3vbq3DHH8cgZOEtzdwNCpRaZHx+IybnCvk
         agsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258157; x=1790862957;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkxGGQAcZQfF96GEV0BfePCSivvqi5OVjJFPctkp1vk=;
        b=Bj59LlnMUuPWsvYKLGu99DMrdlDC05WZJy9bK3aMA1UqURQH++bnIp9/m5Hrjc4FA0
         uPm2Hti5h8Q8CDsc2T9hq3IWCZHEAoUCiuZ88QuRCQJPJ06X96grd8ijogzCCs0+5t75
         B5216zlinDL7YiJTqtI7wZm/FfU/a/DxBPDba6H8DQlUB2U37Q4VCANw0su2fb7ZPL6R
         r+iNIht8yDSFpOOnMHi2kKmh7d8tiro8x5Rls9M2xsAR8OBM0qll/sVn4mkPvIYy5Wh9
         QI/ma9vTKavYF2YFXOV2nMxXPjj5pdPz5aAG3tGWIS/1bYenuTzkaWy0ze+yaZGLVleY
         fQJw==
X-Forwarded-Encrypted: i=1; AKwUvBy3TCgkIAVndXJncPrhISKM3/HCXqwJ9udBfts43t5S2qPMaPgrYNRkAXJ1+tU7e7NMC6vwX9YV6EhBUHo=@vger.kernel.org
X-Gm-Message-State: AFuF++m7ZIYn7hDdwrlAwPMQgJZa6NlU1+CUaZ5almqhm4w7/i8OsmPv
	HK1XDWFnRzlt6Kk3XlvNAkEia1vUf5MQaDEamzf1WoxKuvev9sEOFMfAund8nvBEexB2nOticLV
	c/oqkZw==
X-Received: from plbm10.prod.google.com ([2002:a17:902:d18a:b0:2df:69be:94b6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2310:b0:2dd:ad73:5b74
 with SMTP id d9443c01a7336-2df7dc36d85mr22967295ad.36.1790258156375; Thu, 24
 Sep 2026 06:55:56 -0700 (PDT)
Date: Thu, 24 Sep 2026 06:55:55 -0700
In-Reply-To: <arUGoepfp97GY8aK@blrnaveerao1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923155108.1550622-1-seanjc@google.com> <20260923155108.1550622-4-seanjc@google.com>
 <arUGoepfp97GY8aK@blrnaveerao1>
Message-ID: <arUr6xuC2d7A_ZI7@google.com>
Subject: Re: [PATCH v2 3/3] KVM: SVM: Clear AVIC Physical ID table entry if
 vCPU creation fails
From: Sean Christopherson <seanjc@google.com>
To: Naveen N Rao <naveen@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@meta.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 24, 2026, Naveen N Rao wrote:
> On Wed, Sep 23, 2026 at 08:51:08AM -0700, Sean Christopherson wrote:
> > From: Naveen N Rao <naveen@kernel.org>
> 
> Nit: I noticed this because I thought I had fixed it, but the From: tag 
> above does not seem to carry (AMD) attribution even though the patch I 
> posted seems to have the correct form. I checked 'b4 am' and that seems 
> to be doing the right thing too. Anything I'm missing?

Nope, the problem was on my end.  I was running an older version of b4, and it
was dropping the "(AMD)" part.  I'll manually fixup this one when applying.
