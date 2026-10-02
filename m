Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106D93B9DA7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935652; cv=pass; b=UsuyFKJixR5kHVqzxPzXDSZUpXhvelLOy3EHLAmQZihg5UFHZUT5MirmqbXzveE0hpDZQ1VYoxY9xa/pfpO4mWj6FpOr9V7u46HCTtg6MmxwiPdCpNnwrGWSfglwKzHuE3c17l8BW+aarLyv+0q0+cAd/MgZnGPWwdZ8pHchw+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935652; c=relaxed/simple;
	bh=FFnxElmYnPjkgCx517QhWsk+SbV5hjMWuaYPOQlgkRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLirhgU9ussc8zDrDGXpCSc4Pe7TcuZfnPsiRE5TVCo6ufgm2bP6TK6o4iRV5z8wz3GitLoaT6QbmQnMjYKf5uOFgPbHnMp31fyEotNK2XjcuoziwG5xO4hMnS9Cc5iXg8RF0RNiEcDM6XT/FHbuqjq1UH7JZlizMsA3gC+2r1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YN3lSRCw; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YN3lSRCw"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so4768e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790935649; cv=none;
        d=google.com; s=arc-20260327;
        b=sHEGCtaj4QgNSgcIA6Wi4tsaOHSuSNSNP+ky3cddS9VNQPxf8oWrkwPuuNzt8KsKVs
         2d/nPCctJz54tNuXPRWAUHzKHyT8yK50F9BEGx0MQQg5Lto41qnjm2fAIUiUjV+slvh6
         DPhuLCFi/gxDqCKSarEM6yOkwiYbsH67o82ipOoUkghuLltYX4/PDvECiNQrOpMj9vGF
         yEj4/eZBiNLzuNFGB9jxjlxYEiZQloto2NSN+pOD088sZkZMjr+I20Q3OPgvwF0RTwW6
         cJGjJLxYSem8s59wHlF3F9RIHJw05UmFsN7fV5qqwPueZu2sVNEbko7K8TvURc02DBat
         DhPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W2aHjvSPxe+vAP9qLitaZl/l2SuTqD1rpV9O3EUjP1g=;
        fh=WSmLAsv8bzgKEI+g739DUneezLb+sN6mQcw/w5C415c=;
        b=S39ZHbOZuzPebkTH3dctV5XoBGiickEhD9kJUyx79fNsKduMnG5V1V5U346f1A3Qoj
         TFhzcGpv6pYV2ySTK2zZ4Fofeb1vu4EN1AUtshoI2wYEgWBi+A5IwCHx7y1CvoV128xq
         rMejHQudzDxopBjoYdVom7QbQdE5gxlNFO60AbMhW+FM2HCDYtl+5+PyohdUIhzmqVAQ
         sv6IRrWkiIKE/hsGt7jixeQackgWysV+th/83772hznqnspJMb0Hvb2HkaI2ciU72Jb1
         4rufSGkFPnG2XxwVTUTodGYW6hKA/79MoizxDwsAPbq89632MFK0OHopDRus8WBXK/zO
         /wlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790935649; x=1791540449; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2aHjvSPxe+vAP9qLitaZl/l2SuTqD1rpV9O3EUjP1g=;
        b=YN3lSRCwpigWqCqYY8LhJA3rmEakf/EkcrfsQng2FdpeqGA9JB2AZqCv/mEt/ZxfEy
         SD/c7QGL1nCsst/MD6YXcXuMll1mDAWYgLPqG9xKCJgIhoQU/QMrSPJZ79lp3H5rX01t
         bs+R0k4O35QyqOcntjaNgZdJd4Y7m0mPmVrKsFLSoo3XXDLcsnid3pLVyBD1qWRkSWHS
         VMPU3LXVRgl3GCzVdt58u7lJLP3FAHiiShv/WJlC5XCugi/89bELqzCNtCuGHY9JxmOZ
         1s8mQShbOJJCQ6rX/yLZprVuJ8vjwv8nbgBOgURgN4Q9CuM79Hn32auHIFq26ez3Z82C
         EyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935649; x=1791540449;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W2aHjvSPxe+vAP9qLitaZl/l2SuTqD1rpV9O3EUjP1g=;
        b=ph03GFkBDN+hIkF3oyPChecetG7fQaJFnPsWDLFnre+22b2EKbt+WuMEBi6Ifu+/ax
         ZFVLMSB9CHlUrD7JCtNbeKlv3MQWHIEf8/YVGJPIVpy8EDmloEivBqG8aD4NilfAKRN7
         fnGQCkxOKtRrLjx98wVHGG0E2yiyX2KOtVQq/Foi/6mC7eqaeCeysURjbiUaur3U5Cj2
         xuMCC3FkjdDNTp7qkKWrWpayGYtAR4bu2Qf8gJMCf37DwQ4+wQ8L5GiWXqQb/FE3FHPG
         9bmPz+nv5GlJNOxGdySUr8zfD4bZ2RNnAhWKC/yQ7UpLP4J23cPdjGSAMjXnkZo/3yYn
         02Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxL2k7rITS/IP/0H4l5np4MgmE36YggQNH1MjGvHJHoaMIDhX5fR40sALeRUvP1rm37Rsn+GEgZpY8vlTY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZYHigDiUPe3tbvuohFrG4i4g1mvK4F7VYFJZsUE1jtv1GlvX4
	VfHq9lUR7S+LEK/Wq6dGZDnf3SFnDaCtAYNX7lJ2Lc/n5rxybhsWvUcTuUWqbWQL1FhKJXxsWMQ
	nl+JmpckHLePNl+kROZNZguPiEFGJpIj860ZCUBAH
X-Gm-Gg: AYBFou0zqWf0rK44QGpVvGcHt/klFcrt6pkIgisVw3+Pty0Dnjbd5ofZdoEnFWT0qmZ
	9TtEbNKnbbBdfYHImM7EFbZIudnXTvZjZzfSqwSvslDxESag1jFaffT1MNed+Gp86SltAQLZKqN
	k2kSQ04PVGIYTmKDy36aMs00lolyhPHBdQvWtRpBSeaAd9N0UhgwlODmnGTKkuD/nch0Y+Cta7g
	8A8ZlN589NkGtZfPZy6WlJ0HzIytcFqoxfGWDwxIhcd7CDbicXKeg2Sim4BiEp2MtHwaj7sKeS/
	Ap5CEKOQhTAaznt0opfECSFkLoE7vrB7o4lWNvDIZqfQswqjM8VnIcrN65oxk8kF0nr2ELrmn6+
	At9btpxKZT2s4KQ==
X-Received: by 2002:a05:6512:3b26:b0:5b8:d04b:a1be with SMTP id
 2adb3069b0e04-5bb7c91a8a0mr135912e87.2.1790935648531; Fri, 02 Oct 2026
 03:07:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com> <20261001210703.1597150-6-suzuki.poulose@arm.com>
In-Reply-To: <20261001210703.1597150-6-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 11:06:52 +0100
X-Gm-Features: AclHuK9UDCM_CxoGcsAnKo4MTwuWCAngd_IrvUFvtXNGuqDBjBBZg_tfUnO_TY0
Message-ID: <CA+EHjTxtatPyGcyvEyR129cqUiAYcO_cxRVtwZO0ckZsOnD7TA@mail.gmail.com>
Subject: Re: [PATCH v21 05/23] KVM: arm64: Track the type of VM in kvm_arch
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

On Thu, 01 Oct 2026 22:06:45 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
[...]
> +#define vcpu_is_protected(vcpu)                                                \
[...]
> +                        if (is_nvhe_hyp_code() &&                        \
> +                            !is_protected_kvm_enabled())                 \
> +                                __kvm = kern_hyp_va(__kvm);                 \

On a non-pKVM nVHE host, the hyp callers of this in switch.c and
timer-sr.c now translate vcpu->kvm and load vm_flavor on every guest
entry and exit, where the is_protected_kvm_enabled() check used to
short-circuit. Could they use vcpu_is_protected_pkvm(), and drop the
kern_hyp_va() here?

With that:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
