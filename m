Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DF04CB8B7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645927; cv=pass; b=uAftOmm1ZsRfCW1ly6TFwgo6wzVh2ShnNSvi05UtjWIdqGbLrSOZ0yh5KDPz1XC/CNAgut0LIw+AF8WpPuD5o9r3o5YKU9/L6aU1Pd+NQq39MGHtCDOE/VC9BHx9rkPIpjmZyVoS2Z4t5zrb0F68b/zPF4XoK5OfRAh89iBWq5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645927; c=relaxed/simple;
	bh=nOYhv3codkqkgw3J82tO/HjCMv9eP9bGCd7SuCfawsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KE0w4bS7hCRjwdWS2jkYQKCWmmIVRoV5xCf9WWaE1NmYsR4TFg/70n9w/8ojF+S0+flu3PmXF9gZ1obyHts34Fn/ovAPBcZW5rAnlL/diJplzirDeTFR4niNDA0WT+StDjA4Ibsu5O0jQxVilVXmfrcUv2xwTyPnfEAKUORf44w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DYjblt1m; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DYjblt1m"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so1050e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789645909; cv=none;
        d=google.com; s=arc-20260327;
        b=D9W9npQWdQqF4ouZE4xvk77kQK3saHtLRaF2IS5K4g2EC97NxkUrb9IdiV9nxibTla
         mn5ZDnjQh48X7o2drM5byBRFjAaneLd41boL1rUflPQ51RNjMcQIOGvMdh5+lixngiDm
         O170EvEUfGD38nhG7/2HJYyQmxQUmbeYd0NS9R6FW1OdGXEthtp69+XdrKowMz4WtiHZ
         ruYScR3a63omneeKZYZ3K7FGIRLlyq/BS5lUr4cg2VwwFQbVK5Oae/vl+rCKAUde4KNf
         9u12ntVatLxbWepOnZOw6KFnzK0MT4OWTfUOGz5Pf7XBAlGENEW2jZ/oWlyzXepJA2jP
         xl5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AdIwW+5qYXXR92NXdwAH/Idy+Qhx8FbslhR3tYZnWQg=;
        fh=qlIy4DrAqFa2NLztE0AqK4SvW/q63tjuFijv64Y/+ic=;
        b=IilhnjklplFL/eHPvU7xVO9WoaBrksSJ4GRycWCD0vaoh2PQ0XNiCgkC/aLJ8UUWhX
         XrMlalnD4Z2FyEtXbzDrMq5847jScCKFziZOudAAGMDsAjgnuNOqzGEjcz5Fq0hmg54b
         M5bPWDXo2aAhr55oZgOoFKylxMpv0mj/+zydwlamp5SRZXy/B9qzZ2eT8hh2dyEsaKKw
         wg8uBXs3zIr9VfHJ9F43E0INsoxkfNvnNS+PYjkIXPNkP8hZB9Om+aRD+tXmEuU0LvPB
         du0Ue34vrUq4Zi3XhulEpw6M0ePxVcQ3JJmLgvHjT7heHwcKnpTczfHvuqajhHbUcesA
         ZpZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789645909; x=1790250709; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdIwW+5qYXXR92NXdwAH/Idy+Qhx8FbslhR3tYZnWQg=;
        b=DYjblt1mxHITRZPgDTK5tAknbFLiBRfrlKgn7iyL6XYzITysGm4r60lkJVSrmdDb2N
         G5XZ8+SgcOo8Nk/2uWZhRccqn6bWlW7cCL+HxOzOIRHVs2ZqndaPTZYyx6uitaDnQ7I8
         5mAypXm3agSscKAq5xUdX6/qci4nIk23xPpTWdTLtduSq385+ENfMboJsrQnSzPRaJnd
         VpkSVsgQGAt/WQQGKBL4WNnczq8vUXIAuLQMORX/ai6fjh2Y+Dkf4NgcNfs9mvCLFZAV
         MHuRz5CkVMnHBftLkFLmuNWGNvUQUbZwcg8vpTR5g/cqimQY9b6O3KZBmCgNN0vtJyxU
         y3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645909; x=1790250709;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AdIwW+5qYXXR92NXdwAH/Idy+Qhx8FbslhR3tYZnWQg=;
        b=Q8ijxlxAvryPhoUWOniQ2BKCCtFMC4QVflJ6rxlgRgSRL+hEXf0/EhT1JwB5D1v/rH
         5AU1VzooB8TB/Iy0kol2VJicHCsx2or0t3uUONFNAdVufRPNbf04dIqb3uo2AkaWVFpn
         TGwzlw8MsPSsdKD7h6j4l/uX4IPtF4h4KgFYgjh4QUTuwd1BmDCHn4kPVD3hqQ2RrrUD
         tDYMpKb2QMdNi5eArxwvpjlqWYI/72IOp1aXy+hvBwlMUMidI9YHrWIxT9ulBxA0/RHF
         aaaeOnmJoycMyK4ojmeuLqEjodFhVs9Du02a8mYzHU3RPRPzEC5DJPnBMZM82fmPjOU7
         EnLw==
X-Forwarded-Encrypted: i=1; AKwUvBwUcfBeVewu/jeLqdJH43fxbWaZ/y1wNd6WNudjIPuXnmeAMIdk/q0yPmzoq4fjakGHbCLHSg2cYX6DE4M=@vger.kernel.org
X-Gm-Message-State: AFuF++mlT5R0G2/kd5lw0UGP6H7KUYsRA0atfzpuqcsluaTVu6Q4Y3U4
	FmMFeNZej5e+Gi+/kuuEq9dVMbjpqGsSYU8mwYZUvKsIm1zbt1+5RyGQo0xJKSb1EYWd+BCFu63
	26ZlzwqhD0jMvXPDS6cUqQuYTXWSkwDzMHg4EIrBurIuXzaWwQX7RDgXwieI=
X-Gm-Gg: AYBFou3ByJJUCZUyYnfpohJw5qBu/Hb8oLz8tD3g22Js4yIh5thfbthEvHRe9jlk/1G
	1CgHnakmAQzK2D5e/rbhg8sZ3q3437+TJevr6tS3SVtDgoiyHM60eoVewwjRiKCoqMxRaR+0pEx
	1zDmmydedpppFblR8IqFzGgb+Qlyk6EoTipqRQOTj0NQ5+2rYhYkjNkwYPm3foCfOZH7NmUYrQE
	/5llvFm1MkAreIlGdsxPYoNxYwobWT06WAEVmRf2BA/h5NehNAG/6sXAa6rZzA6tlb2tXH3Zxjy
	kYxfEhwpTD0k70cijpyL+HxWNLxsB3ca2sqYY+8gSoicJb/YPy6bIc9CbXk5Ymb42LGAxWQ2g+M
	aZ61BIWUUTKxR5A==
X-Received: by 2002:a05:6512:33d5:b0:5b1:5e30:ab4d with SMTP id
 2adb3069b0e04-5b8bff20394mr25749e87.5.1789645908458; Thu, 17 Sep 2026
 04:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com> <20260915160141.3543048-13-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-13-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Sep 2026 12:51:12 +0100
X-Gm-Features: AcwNN1X5WP4Na_O-dNFd8fWbgG-HeOkWBxaHeAYarJjcpr1hEP0fkdn3TrX09z4
Message-ID: <CA+EHjTxfbG6-LPjJVoErQ3iJk4vAvhVO=Qv6hjcxDXL0yByiQA@mail.gmail.com>
Subject: Re: [PATCH v18 12/23] KVM: arm64: Widen the scope of "protected" VMs
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Tue, 15 Sep 2026 17:01:30 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
[...]
> -#define kvm_vm_is_protected(kvm)        ((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM)
> +#define kvm_vm_is_protected(kvm)        ((kvm)->arch.vm_flavor >= __VM_PROTECTED)
> +#define kvm_vm_is_protected_pkvm(kvm)        ((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM)
>  #define kvm_vm_is_unprotected_pkvm(kvm)        ((kvm)->arch.vm_flavor == VM_PKVM)

Agree with Marc that this belongs in patch 5. When it moves, could you
add vcpu_is_protected_pkvm() next to vcpu_is_protected()? The pKVM
host-side series [1] has vcpu_is_protected() checks that are pKVM
mechanism (the vCPU feature allowlist, CPU_ON against the pKVM
power-off state, the ONE_REG rejection after the first run), and with
the wider predicate those have to carry a pKVM-specific name.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260914113338.159227-1-fuad.tabba@linux.dev/
