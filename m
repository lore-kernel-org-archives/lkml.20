Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B303C9EE6
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 22:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790979543; cv=none; b=tl7OoG0FRBWvyxVsr7xkLbnAQRM7TluTgHY/Y86aOOug4afgG7qFUx1d3/ZX6CzuVS476/SwffL+PSwrMnwhdiqfHk67zvW0JrZL4LlJhfmkEhNSzXBvpekH2i4kN+Xpm78VO2oqsYIdQDFoU0a1spej4hirWs3UkDv5JpF+ZnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790979543; c=relaxed/simple;
	bh=40qd9siKCBRYB3f3NGKHhJbH3BpIYlDe6X8yX7Hpuwo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZDI6nfCGFjUG+8i72TIiP1EUeQjsD5N+IeAXLJvDZI8bOcC9CzYp71s6KZruxun4LG0AJ+U4IX1VAIvlYzWaW/wk5CXE2IryP2XcKGcB15oirWdkzTA3X04qsWMlgelXW2FuRO9zbkfZSIiQN+gR5LQ8auB4AotKuXJhVTIiuis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SMLZH8s+; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SMLZH8s+"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so34830a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790979542; x=1791584342; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=40qd9siKCBRYB3f3NGKHhJbH3BpIYlDe6X8yX7Hpuwo=;
        b=SMLZH8s+LCQgFO7oNe4vcV8iJuWUxaQfX4dgY3ghhp+dTzLGGmVw5v/eeIs85vHGip
         Sa15lgiibSVx5HU/lqpieb+98WbsTIpWBlJC2PyKWxPuN9TJ3mqqdizSuARl1ZwY6Lo3
         AF0gZcVT9kkBPpvh7N3F7+YJrgrQMp6ClYQaQ6A6GBmTsNxUWD+vr8NpQR47XPLe7/gz
         P0CwwqXnBzgFni0Zc9dbZ0x4Jt/xviv4JkAe+s4smszurz4casTwUCHFziMd3dpsyFJU
         uV1gGOL+ob+D4KQXRhnJsyvxrkMbvX2qrFB2WLcjqNOiaw5i9daf6f8Sd9DZ552QG3ba
         sLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790979542; x=1791584342;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=40qd9siKCBRYB3f3NGKHhJbH3BpIYlDe6X8yX7Hpuwo=;
        b=K3HisyDl0Qi9VaJwPr4aqkG+gdt3b5h7wRsTGi6OedlO78TG5X/8lhIPUyWPIUEHG5
         13pnWGyoWLF//wR/ilGNm2+egeAh0rFvYHc0sNDOEHohNrPN9n0S8hELsBUoEbMn4rd8
         snAMgbK8noBnWnmvMVHOpB1Wy5OUVUeKtgsaRuPbkcl/Cxbsfsv6vITA6buQfXOIP9JA
         MZOhU9+1btDupz0J8djhaJ6a/xUsx2Vf/ChLXIridFeuuob//jMG4lBD1eB4kya3/GJe
         cS3barsW8Bh3F9/6vrkM0m8nzGsHsnUHZRmmnutvkDvNyzLHysk0PtpKKhR9foYo6ct4
         h6gA==
X-Forwarded-Encrypted: i=1; AKwUvByAtsm5dXfkSvbg0TbPbLV0ip6kL1rBqv+c91X1TpgYyvwShko1EuERKEXOL1CMvHQOYDTVFhHzj30cq30=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMUBFt2qiX925dVMyUHl3ScI+fKSOL6eM37FRD9h5vr25Xpe8T
	hLISA9QahVwVDB5TLG03tHCy1aFD7DUFparVXAKb2v9166duyXvYc/aK9S/pR2q8Aekiwsx/6xZ
	lOdPrug==
X-Received: from pjtn8.prod.google.com ([2002:a17:90a:c688:b0:3a0:dee2:7813])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2b48:b0:3a4:71b7:eb63
 with SMTP id 98e67ed59e1d1-3a6ceab25dbmr1825054a91.10.1790979541549; Fri, 02
 Oct 2026 15:19:01 -0700 (PDT)
Date: Fri, 2 Oct 2026 15:19:00 -0700
In-Reply-To: <db32438dee67a69609e75d8c43cb070f021137b1.1790101179.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790101179.git.ritesh.list@gmail.com> <db32438dee67a69609e75d8c43cb070f021137b1.1790101179.git.ritesh.list@gmail.com>
Message-ID: <asAt1NhGFs5HNbvl@google.com>
Subject: Re: [PATCH v5 6/9] KVM: selftests: Limit the number of VM creates in hardware_disable_test
From: Sean Christopherson <seanjc@google.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <chleroy@kernel.org>, 
	Anushree Mathur <anushree.mathur@linux.ibm.com>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Sep 22, 2026, Ritesh Harjani (IBM) wrote:
> hardware_disable_test forks several VMs (NR_IERATIONS=512). This patch
> limits that number to 4 when we know that we are running in constraint
> host environment. The number 4 is just a safe minimum when
> kvm_arch_vm_create_may_enomem() can be true.

Please actually explain *why* this is necessary, and where the magic '4' comes.
I assume there's some system-wide resource at play?
