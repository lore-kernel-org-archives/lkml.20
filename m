Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4506E34FF5D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999589; cv=none; b=Y7AYeps6U7Zd7hMDqqvdNMnQKq3iSivg5nhvbcrK42ZkZjFSvOTPmRt6TTXB55M9XeD1CKR2ys9O+sZeVV+xEC174G/LfLExcb8/ot8x/RTJACSiHvs8DhBP6R43jsrpdlR3Tqlcycr09WFno4ZGGhza8f1kmr46NXWp5hQ2ibc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999589; c=relaxed/simple;
	bh=6TAqMjHBoHUiFi3wkvnVQ728BuUL5Y5HLzESWYJT0lg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KC7hNkm5eIzMhsCfvLL5hIMlZP/lLnqBusD/eN5glOEBqdj6j6rO6Tp9mAt8h/OkHvJQmkZ6v7UQn2ybfI2Btb6dbx6xkxLGUXQxIKFhXABvfGZpQ5Cv2MZ/Eh7VHsa30Dg0A7PmBio0mCdG75cDjv/hYmsrd7HYQMpJyPUXaAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R1zHkoqO; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R1zHkoqO"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb687f82eso42850295ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999587; x=1790604387; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZ2htXcpEf0yscnHPHdzpPSyyISdV3JRkU5aSKroXnM=;
        b=R1zHkoqOcVx8rusEJx1Mg6tQby8QUV2fdQdkdN0OBvZRcIuycI6ZtgGe1p6spIpBgq
         Gr/0RsURJi5nyzwQs0oGyHvPTppwyQPcTJFr3BVsBs5smV3Bxww1dy402HMAk8nxNAlH
         dsEpMALiRCz99SPNOwelB2mzrecGK91h9otnLwcXk7lGZXy2JLdvBBfYIkyXrB3sICov
         uUc6UHzvnOMAylutSEE2h+16CIu/W/IVYClOsNsgN2OU8ccU96gFP7TcTrTg3AYyBhYM
         fYinEVOSyAI40wywtSxZirIN21BsrTnJkDpjAV00Zs8wb6LBbeEYyfpDzNu0zaaS6foC
         yolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999587; x=1790604387;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZ2htXcpEf0yscnHPHdzpPSyyISdV3JRkU5aSKroXnM=;
        b=lx1Nu7pPd3ISqiGGMCc5u2PWbY+P/ab/SUBdaWlqF1fkkhvfmtNIT8FHe7HtzqUWzn
         J2MA7xPHNgOLbw024WA2w3TDl2i4BYDYCTFYiJ9iI3Zx2dD4rnamrUYunzvbgfv7iKJM
         zrc9vpgHeBKYuWHNhS4SXIRQ5NIjhoYFvWHfIsVQClUkDmct5D67vjTo57RHw4vCluqv
         gaoffYfklv/RihQ/srPe3gx2BL2oQ9+BOfwV+Qqb/U6/ilYp9wmAc8d+v4mD0UeXCKd5
         /ZH5+LAgmR0UZci6+t1rvdtJP3FkC1NctIj0XxyRbQS/DQ3Kx0q9DPlPhRBCy997MRJG
         K3sg==
X-Forwarded-Encrypted: i=1; AKwUvBztjPCKi5X7HFDqDs8Y8SI19uEl7D69BsSk1/QPqvlsoDIPvCsIxt0aoJn1HG6zEdccc92jbuhzfRrkTV0=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ3u3vwrf8mzm8m66goIsLBq2QDzKKSaVL/a5TdeX3luSkNyD3
	+oXJYGYxY9AohUOpKa4enrIai05fdpJCDYN+tvQcOPjuwqvw14IArdnLJtu8E6UwIkTeQMJL9Qy
	G21y6AA==
X-Received: from pleo1.prod.google.com ([2002:a17:903:2101:b0:2df:4883:3fc3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3803:b0:2dd:c100:b2d2
 with SMTP id d9443c01a7336-2ddc100b3b1mr113461315ad.61.1789999587464; Mon, 21
 Sep 2026 07:06:27 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:14 -0700
In-Reply-To: <20260902230932.2760127-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902230932.2760127-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999888361.743033.9908769455046597723.b4-ty@google.com>
Subject: Re: [PATCH v3 0/3] KVM: VMX: Explicitly track TDX VMs' root level
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"

On Wed, 02 Sep 2026 16:09:29 -0700, Sean Christopherson wrote:
> Fix a bug where a misbehaving (or niave?) userspace can configure guest CPUID
> such that KVM will use the "wrong" root level for its mirror EPTs and trip the
> KVM_BUG_ON() in tdx_load_mmu_pgd().
> 
> v3:
>  - Use kvm_mmu_get_max_tdp_level() in __kvm_mmu_create() to avoid what is
>    effectively a false positive WARN. [Sashiko]
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/3] KVM: x86/mmu: Use KVM's max TDP level to determine need for 32-bit TDP root
      https://github.com/kvm-x86/linux/commit/7ed619909773
[2/3] KVM: VMX: Explicitly track TDX VMs' root level instead of guessing it from CPUID
      https://github.com/kvm-x86/linux/commit/cc8a8f2a90b4
[3/3] KVM: VMX: Drop TDX_SHARED_BIT_PWL_{4,5} and dedup related code
      https://github.com/kvm-x86/linux/commit/37e3197c50c8

--
https://github.com/kvm-x86/linux/tree/next
