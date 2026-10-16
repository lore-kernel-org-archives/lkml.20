Received: from mta1.migadu.com (out-252.mta1.migadu.com [95.215.58.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9546C3B95F8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792133225; cv=none; b=V1rG7wd19tLlT1I4y+aqkQsFLXTilEzLSq5aejYOK4DjX1WWQqHP3JT9yPXOcYhlHZQxk0RFK6pe2m0ay31hr0Yl/SgPtln++QcbZEhvClzOMUwz/q71Fi6Jjpm09sKa2RLBxovBa8t+QNTzlq78b7L6wXJTqQlDB0bUZOYWGEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792133225; c=relaxed/simple;
	bh=Fq2kJAt2D35K+AljUwJE/9dkfpEho8mR0jX5LFexqKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HnS0iQJ5YFis6yl8HezNO7ygbQ7ii+PLYmC7meNfPXW+J8SHCxNgqygbEeNwjxNxg4EbdNdngclkNBmcXdZjQevzdKelr+RSs3eu8UCrnzZGO6ERWo7JS3q/1KPbSr2cKwThF97NF6z3K6zb6bCma/S7rxzN4DOPI4vw7Dqmcss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wikj2tQE; arc=none smtp.client-ip=95.215.58.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wikj2tQE"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Fq2kJAt2D35K+AljUwJE/9dkfpEho8mR0jX5LFexqKI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792133206; v=1; x=1792738006;
 b=wikj2tQE6QNa7GbUEnBAgm5aZYrEylAwrGbFbYpnVFKIo7T9CNT7Zbcn8XMqXtarhfwi1OhJ
 mr5AU+rCPz7dFMwpzH3QSJoJr4bcHfeI2yP+wkf8Ux4q1qo919QrtKoqjATcvfVA5Z5skVFPvdX
 aEeAoynq3+dKQYLsyzJtPaPw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6cc5102f79aecafd;
	Fri, 16 Oct 2026 06:46:46 +0000
X-Mizu-Trace-ID: 6cc5102f79aecafd
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so5664e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:46:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBdmqZ0HYc7Xr/vph4rPG51s+9P0qBoqD5W4mvfNihYzKtxdZ77eju9NQsQYFzKRs9deDg8lCrHUDjfIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLj96ESh2wzvAzVGM5kDP9kl0ijNggFA5KfP5yuRay38bP3TVr
	FFtEeVesu5uXY9PIDpmQ9UeeTcjCPD3QIKjmNAhybcbfEpEBcVM3obsXCKhPoGKyaW1/C2Seuib
	LTjeBtodi4h5teb5kvTf9M4iMApTNCHVHrliTH2ok
X-Received: by 2002:a05:6512:6816:b0:5bc:ed54:d5b1 with SMTP id
 2adb3069b0e04-5be403b66a5mr223821e87.14.1792133202280; Thu, 15 Oct 2026
 23:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015153041.3770032-1-fuad.tabba@linux.dev> <86h5im29xv.wl-maz@kernel.org>
In-Reply-To: <86h5im29xv.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 16 Oct 2026 07:46:05 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwZCkfj8V4x-VJhB09x4V=R84Zky8fU=ffyWAJNrJYyCw@mail.gmail.com>
X-Gm-Features: AclHuK-Mh0opfYvOg-0ZXaKxljR9jjbWCLN44NxLHz-5KGKDM7ZO10cIFATr3tM
Message-ID: <CA+EHjTwZCkfj8V4x-VJhB09x4V=R84Zky8fU=ffyWAJNrJYyCw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Only enable S1PIE and S1POE for a guest with
 TCR2 and ATS1A
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Thu, 15 Oct 2026 17:41:16 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
[...]
> > +static bool feat_s1poe(struct kvm *kvm)
> > +{
> > +        return (kvm_has_feat(kvm, FEAT_S1POE) &&
> > +                kvm_has_feat(kvm, FEAT_TCR2) &&
> > +                kvm_has_feat(kvm, FEAT_ATS1A));
>
> Where's what the relevant bits of the JSON say:
>
> (FEAT_S1POE ==> FEAT_TCR2)
> (FEAT_S1POE ==> FEAT_ATS1A)
> (FEAT_S1POE ==> FEAT_HPDS)
>
> So this is missing an additional check on FEAT_HPDS, which is advertised
> as:
>
> (FEAT_AA64EL1 ==> (FEAT_HPDS <=> (UInt(ID_AA64MMFR1_EL1.HPDS) >= 1)))

Thanks, I'll add the FEAT_HPDS check to feat_s1poe() and respin.

Cheers,
/fuad
