Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767EF44683D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936438; cv=pass; b=gHpZjOs9Xy710GeBgBKN9HNQvIG4wVnePWkmDBB0W+kKgNv6nNegVx6LtAIIKZkIIdP7Hrl8MLwCTDr/dEQpbXnW8we7dkkIRziq3ozADFaDmzMaWxUqUhvfmYkTrjmnnMpMSalu+n1+K7N6PylcXC7bmR8lkUOHs30Za/+TvaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936438; c=relaxed/simple;
	bh=UOMj64A4DoXhOCxEjUECHTEJP1J0iaV3eziuUdVe8QI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nHhc2hswuRyR+kukBv75v4hp0eKFRhEwdXn8qL8bgVhIecJVDTHhTVDdhNVKDy9Qx4F/6IInv5YpY1rTs11Rh8HVkxOgxrc8aI+qWXlSlzmpyZU7YznI64XEWqdbi0nqQEkmImghWbftglaZKFO4AI+IsCtBquszbG3AeT3wvkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AJvm2myZ; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AJvm2myZ"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ba40832934so4564e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:20:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790936434; cv=none;
        d=google.com; s=arc-20260327;
        b=eDy+GiBe3KJBVdaFmMy5dFJAyyivwVho7SM0H4gi6Q4IaS66Sca1nmme07j2JHoGK1
         7Jag8ok5iWSoAiDEwB4DUEQV9WvMfjvXdZ9KTeUnFB58JfDc4ul8EYbMWoY9hlAGV1tK
         MezRU4ht1kwJOG7JN/QFvuNMoS4cGYodf1wmyiFMjBwcRxOaHOrbvTGzU+g7cdmzmxBD
         xDgvPjf8oZYNdH6To7QJCfFPJOyDGoKeR7u8ZjogC4XCsODtjN87BYAcCaMivJylM6q+
         Kltusci9HSy12nTwQshbfrWlsF8+bA4fQYr2QVDuR8c8eThH032RBIQlujlFTHh3+Gnp
         cLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AWVQCSwR0aUoymLEu54Qp5SBrR33qbmFDxb/OCitD2E=;
        fh=Vt/C03QHQAn1KqeS3jiKBkxoJVjPxaA+hBzk4j1295g=;
        b=XWu9mJ+Y8t3PwEv3xDCnJwCvfow0qVBPFQSkw+qNxNBRT7TtjzDn6W0ntKK9mCTkm1
         VqXf9JvinFArozWvs7HII8nglIjGL93AJX//ZSIH8ho3j0mlHhjBkhxlQsHnmd0yBIzI
         GfviH9OdMtdNEUr3Go9GsBvXajqpucHXdX/K10R/tEgWGlnT39NT+DUXRyGsd+VdEVIQ
         qHte8iyKSUy4wOYKqE/Z0YKRe2XZwvTUbTN6uutEECESZjvOxAqkC7usWTCH2hhMO2iN
         CjUamZyoMCkD+S93tCMAN67CR4a/TswvxI2ywpAR1RhI4DtWn7ExJQqJiobAvvHzMzSb
         JE2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790936434; x=1791541234; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWVQCSwR0aUoymLEu54Qp5SBrR33qbmFDxb/OCitD2E=;
        b=AJvm2myZEjPfyzb4eUBYN1rm5POa/Q9E3JDWiYE1fl/N+bNfe+iBPI3pr2JkHeZEea
         hUA3+9P0by1zW+SNGGwlr5eE7hCB7OLJsFs6PzFHAAbQKPIgU7M1P188JOZgs+SrpavP
         FVjnWGoa5SO2vHfyOpsF9K86NPe/pwlk4cIXHaoh+m0ELJ7Ejewl7wBXLtRMWu98YSN2
         eZ3u/CxQ4k4zCV4uppzNk+JIWzMAb+E5k+iiQr7kuXJkjavsthKgPY/v2sNacrBnbgJx
         ouK0cWSNLHSQT797skr/JXaDEC2W/PEJ7Rsr7uafHSvbFTyby6Yf375s3Shn8O1tzSmg
         AP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936434; x=1791541234;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AWVQCSwR0aUoymLEu54Qp5SBrR33qbmFDxb/OCitD2E=;
        b=OMm8zZSphWVVgRak2FUJ6kiJVFjjWgim+uzljO4nxNWJptvzvPvk6fbIUwjobLv1SR
         86zUrBGpunmt8aBkV0oX8o+DaFBES9/boWZQuqHOjOwHBJRIT8E9O4WdZBuNGKJbI6Bx
         eQQt2PZmZhmd9P152jHdxf31i6+GD2T+YRez+iYjFSrVZ3vofNOHgzHUZcnvZaO2sVG6
         anHjQtPkb0jVd6pLqCP1XZEbCRDgaXkVL6EZL7Z63uhktD0qGhGOu1DGHOnfOovZ40IA
         YxwHg72VFoINFJY/y2tRbnxlVYEY5NMaFoMT7uKe7Rbxy+P4To9RFfnQnkWh89Vtk6eJ
         rGeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxe1NDwy30PWPLBvLezvYeVh4R652pPthT1N+NqnlrAgAWLHOASySxR+9j2LPbRMmE9y7JIjCwwXX9sRUs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVTmFyxZy/T6DLe+9CivNqYYAVX+b4/hmq5Cass/AY1ePxp71T
	cr1A5bGcq+Xj8tMV98HAJ4VM1IFH4BmELyRN/pAoyDaL7tafN8ii6wOTCaz3stAuH/U/ROM5lFS
	JCZD3Md5NHqOMZlRitSEnuKP8bIvER1h2GPnn7d1CpTlVI5v9HruSwdXnntU=
X-Gm-Gg: AYBFou0SkPEPfiRxUvqTurEVEI6q/g+qI706CYhOeEm3NqX9x3KhPDOYAetOFv8bHOy
	a+Or1KCJ3ViDcqzTX063TRKYGarzP6zo1DcLwzoGFDqIsOBa78KaUIBN3P7w33W/b5g2mVeVVER
	TAPdk5gM+X5MxELResvtOCicpVI43cW+DPn89cpGcKfriJUObbGwrfB91GYpGEgKBmFOYBXp+Lg
	rQBkB9iInehSkkktgqriUU5eOGe0kN+R8N6N63frM+tNcvVu9yAetlBaWhKCMoAbG2wE/hmf+vI
	SDEYkQkQzW4g3WFDszvLHnJRX3K+aQjTcNjJPBGpfwu9rLnf/u/jAGPtLzQqcUYo2CtqFO9v2xV
	KxY/8t2ywq8Ff0NiRMmea3SlG
X-Received: by 2002:a05:6512:1c9:b0:5b7:6707:e44c with SMTP id
 2adb3069b0e04-5bbe0806600mr67600e87.12.1790936433781; Fri, 02 Oct 2026
 03:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com> <20261001210703.1597150-11-suzuki.poulose@arm.com>
In-Reply-To: <20261001210703.1597150-11-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 11:19:57 +0100
X-Gm-Features: AclHuK9rOT56mg_GDAS-UKmKKcU8gCHcSak7k76HWhpeBX7f_dB7iE1PChHGrcQ
Message-ID: <CA+EHjTxCfmOqiJzYDZHunSuEyoZCbgHuzeSYC8y71Re+9PA6Kw@mail.gmail.com>
Subject: Re: [PATCH v21 10/23] KVM: arm64: Add VM specific callback for S2 MMU operations
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Thu, 01 Oct 2026 22:06:50 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
> Add VM type specific S2 MMU operation backends which can be initialized per
> VM flavor, to keep the handling cleaner.

The rows only differ where the base already branches (the pKVM TLB
flushes, the protected VM age and unmap, and from patch 12 its abort),
so the case for the table rests on the Realm row, which isn't
functional until the RMI backend lands. Beyond the flushes in patch
16, which operations do you expect it to override?

[...]
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
>  int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
[...]
> +       if (!kvm->arch.vm_s2_ops->vm_flush_remote_tlbs)
> +               return 1;

Every row sets it today, but returning 1 falls back to
KVM_REQ_TLB_FLUSH, which arm64 doesn't handle, so nothing would be
flushed. Could vm_flush_remote_tlbs be mandatory, checked in
kvm_vm_init_vm_s2_ops()?

Cheers,
/fuad
