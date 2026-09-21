Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6844A2060
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999557; cv=none; b=mq5SFXlRwqpFY9UaDuyPI4crytd41VI3/F4aAiYHvv6BC8pNzXNROb+Ds4PlWevrlgdLMR1cHEOMnP4A9MSChaAaBfJyQoZGIYzXuDRWuKjpWNYkj4DhCHzG5ueyU2LObBZjSVqARskVP3IqH3AXrkMhl/HsYFNeKAFCSgypVMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999557; c=relaxed/simple;
	bh=HYGgnNmi3QVtldKOycpSOnTBz70WPgmKQmW8PXNpJz4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ch+Q4mkDpIv34OrtL49POeF4zahPKxqlGEttoE5pUbo8ZfrQ3p23tp5YYYKJ4NewdG51CAwR7cVDyTRSBNC+crUFnIyBM4JQcIuoQc/fgrfWQUXxpk0aqKnJ9pmjYIe6jyLIwMRmvu2ZDkZ9x5c2iIZJIVbAirIQLSHYo72nUb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GK+w1l0u; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GK+w1l0u"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc52c77089bso4469882a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999555; x=1790604355; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDaByuob3STQywTT3cAOlaBCTEAiWYMVBfjiNkGWQmQ=;
        b=GK+w1l0uJaNq+va4jdR5MAS9mbzn6Kwjt4hFQYHq4JSHngYoGKw+Z7nPd4QY3xbhir
         hQzTcyZviFv6qt+KHz+jYo4et0kAXU/b3CZmTWnji7anl6UvzlS3rW58bGch4uq1Gs75
         Kn2BajGgdEWlFeCXS+A6dHvdmpVwmEj0B3Of0YJ0J6PcnMK1fWeJzjihvEbyPdIkH5kD
         K9daCtqhlbzHIGJaWkahgTIB+cfR//zGVibVgUVGJqAzsAUgER+Ydl8zt/lcaa0Vm/K6
         PORUAHOK1cmr+E9OC6YR83f+joshUACvlBPemjsoyZPIQHtg6n59RjYw/+27vsIV0PSh
         aiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999555; x=1790604355;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kDaByuob3STQywTT3cAOlaBCTEAiWYMVBfjiNkGWQmQ=;
        b=jN/6N1RgbgH1+OvoCPCO/AsCJ2GxJ9QXm/IKTo8gN+ktFmDp/Y64EseoHHh8ZtnHFc
         DuSsKwALm5CM5QKAJObty4SZbZCVHcC8JtbPXyKqDin5RBB5th+eGRcpXLzzGvf4gpf0
         8y43/FAZgBCblY2pLXtO4XkUSE46SUMM14o0w6NZPVFxftDkk7Oz5rFuwsxOb8l4jOSC
         YDBShbQzrKjKwD2bOTfB8vJEpb1drwGMcqyhm1a19xzbKOBFvh3dqsRUYyQXI7O8KUN/
         HZE1BRkmrcVB2MBUWSgOh+cO6S1rPL0M9a8TwQ332himB+oOlAkSD90koEkflFxAjjvb
         AL0A==
X-Forwarded-Encrypted: i=1; AKwUvBxoNMxozMCzA0xmOXRWqAbzPQePNtiCQSfTvLGIuW+ltepjEq3tskmvkHCDVR2qzCnci++DSnjo5BUQ4v0=@vger.kernel.org
X-Gm-Message-State: AFuF++nnugUDe+MHF5K/REZmiz+64DqNH9b5l/0eksvlJdKw5erlunxe
	p7yjHTiBGmPnTQ7drEYq3dObSJGbI1Rhc5MSFuNmIKQZgEMcUDkaPwyqBawHfuiaXqAtqvfISxB
	JHkRQrw==
X-Received: from pgdt6.prod.google.com ([2002:a05:6a02:3006:b0:cc4:e953:2e4b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d07:b0:3d3:aec2:4dcd
 with SMTP id adf61e73a8af0-3dd8c48ee7amr18530514637.25.1789999555175; Mon, 21
 Sep 2026 07:05:55 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:02 -0700
In-Reply-To: <20260806214618.82180-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260806214618.82180-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999694044.717318.4471496122366852907.b4-ty@google.com>
Subject: Re: [PATCH] KVM: Never clear KVM_REQ_VM_DEAD from a vCPU's requests
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, 06 Aug 2026 14:46:18 -0700, Sean Christopherson wrote:
> Use kvm_test_request() instead of kvm_check_request() when querying
> KVM_REQ_VM_DEAD, i.e. don't clear KVM_REQ_VM_DEAD, as the entire purpose
> of KVM_REQ_VM_DEAD is to prevent the vCPU from enterring the guest ever
> again, even if userspace insists on redoing KVM_RUN.
> 
> Ensuring KVM_REQ_VM_DEAD is never cleared will allow relaxing KVM's rule
> that ioctls can't be invoked on dead VMs, to only disallow ioctls if the
> VM is bugged, i.e. if KVM hit a KVM_BUG_ON().
> 
> [...]

Applied to kvm-x86 fixes, thanks!

[1/1] KVM: Never clear KVM_REQ_VM_DEAD from a vCPU's requests
      https://github.com/kvm-x86/linux/commit/8cd280282d12

--
https://github.com/kvm-x86/linux/tree/next
