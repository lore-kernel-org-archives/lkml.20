Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B304F55C7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788469109; cv=none; b=CDiMA+zW4F530yKO9428BKvFusfp3N7T8q7QPY74BpXozOiVvRLbkUisrowYNDt1E6NhHBUnUN0cY72ezwCDMuDKJx3in2ogdODmm4mAjTYJzZSyAHutxYcvphTm6a3MiNPlR+QmqtUe4S+AGMNsfkEc4vO6bUEUMuIFRzBFvT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788469109; c=relaxed/simple;
	bh=L632ql4Sd/RozUuu0s8fdwZF7MOouQPT9rB6yRaOm7Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EkPRM7iqBpSHQUtOkPVhRvoc3QOIHHhXLkcvanCK4pSJOq44o+SWYCxT4QmB6sFL7nZ9aFM1uWpL+Od6j29wuRR+2YGj4cOWzqSn70Etc/mPe3GjCNWHxcjE7qvIcBYu1ifOmTxkIDQvQw+1W80ULkk66c9ReJsS3dNU6OcyG4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=he+U4lTE; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="he+U4lTE"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso3539245ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788469098; x=1789073898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L632ql4Sd/RozUuu0s8fdwZF7MOouQPT9rB6yRaOm7Q=;
        b=he+U4lTEFW1nfhPoTjVFtT5mzyjVaVDpSH1VJvB+UwX/8JSFkxwuRAjgiw6uew91Dj
         pYFrL580qkDPzEgnexsG++7rXXPa2VD+0fqcicIsX6x5HERKVyiSlS++LwxNypErQyqc
         uTn2aaas583NiVIAKiLSAjvSFaFe/5/NR5bMGQrawz+L7jbTI3BQPbpYC+Gtx570CMus
         xt12f6ugC5mFhgj7ebZz5gGtHdmqbNgjPg42jHsqvFOwECgv+rNDAOBlFWLg/k/tI4km
         OEwjmtXgbK/yr3kfv6vWWpo+RLzDSoAb/15S/w0R7vMfvi1mCXLccSqjlXAr74erlYLE
         w5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788469098; x=1789073898;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L632ql4Sd/RozUuu0s8fdwZF7MOouQPT9rB6yRaOm7Q=;
        b=AyTIAS3udlHLJZHztcGNIaJ7ALBaDVjMvD/bNpP7KQT/rEp4MPOsxreAL7MGrWwH3m
         G5nbtuhSfI26bkEb7f/qTDW0F+9HXPl/pSFnajOaWhf2IEgedO4Y7DcOl9A6osqPX/8E
         Eaz+e9JDX9uNpwHXWx2OwDMKP37V++UgbPApbG5uUUrQ4oBQx4+8HVts+xXdK0ExRA8w
         FUqbD7IrFaggIfs2hLsDITNFVsktT0r/aAEk0dvKoI4yms/VwMLb+7ovthQXtO29Oi0d
         M2fHfqaqZXvLwqsY4MdESndVIzMi6KsfdL1xNhuXfXLvbHEq/RhCdzHJt65BRUA9DoSH
         2/BA==
X-Forwarded-Encrypted: i=1; AKwUvBycZWtTzje/yvRGlQgjApjGYRgeaxIPoLZjMzUqGPFpo7mDDDNq7e5GP/QpS5eDkw1TpUnptx7FtPOjkHM=@vger.kernel.org
X-Gm-Message-State: AFuF++m8pImTP11VX6nRMIec3eKchih3oUgtM9PUi7cS85NCKuAOmUo7
	SPGnSQVBbgWj1X3UHV6dpnFcQc+yn/kxaLGaKVzeGjW5HY8IhXp+Z2l7DqA6DJEufYuyW4ZmMLu
	awgB9ng==
X-Received: from plxj7.prod.google.com ([2002:a17:902:da87:b0:2d9:1c43:7134])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:120d:b0:2d8:d4cc:be65
 with SMTP id d9443c01a7336-2db12873c1fmr17910145ad.18.1788469097697; Thu, 03
 Sep 2026 13:58:17 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:58:17 -0700
In-Reply-To: <CABgObfZL-qNSaNkNZDj0Kk41zw6UZ30vkSxc6T8wb-pOKab9Wg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <apdweRfqt4dTxcU9@google.com> <20260902075028.231001-D-seiden@linux.ibm.com>
 <aphLXQL1H2zYZgTi@google.com> <20260903114241.33034-C-seiden@linux.ibm.com>
 <apmEi1NmOUvmUBFP@google.com> <apmFClPZ2WcDINmT@google.com>
 <apmIGgMEN8w-kQAm@google.com> <19d4feb1-d703-4c62-8622-a6d5e9d6394c@redhat.com>
 <apmYPMMPCNzK9ZEA@google.com> <CABgObfZL-qNSaNkNZDj0Kk41zw6UZ30vkSxc6T8wb-pOKab9Wg@mail.gmail.com>
Message-ID: <apnfaeWZoZTIsoZS@google.com>
Subject: Re: [PATCH v7 02/23] KVM: Make device name configurable
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>, 
	Gautam Gala <ggala@linux.ibm.com>, Hariharan Mari <hari55@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Hendrik Brueckner <brueckner@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>, 
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>, Oliver Upton <oupton@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2026, Paolo Bonzini wrote:
> On Thu, Sep 3, 2026 at 5:54=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> > > I don't want KVM to be the. one that does things differently *once mo=
re*.
> >
> > Too late :-D
> >
> > arch/arm64/kvm/hyp/nvhe/Makefile:ccflags-y :=3D -D__KVM_NVHE_HYPERVISOR=
__ -D__DISABLE_EXPORTS -D__DISABLE_TRACE_MMIO__
> > arch/arm64/kvm/hyp/vhe/Makefile:ccflags-y :=3D -D__KVM_VHE_HYPERVISOR__
>=20
> Sure, VHE/nVHE is fair game because the nVHE case is in the same boat
> as vDSO, arch/*/boot, and so on.
>=20
> Looking at a grep for (cflags|CFLAGS).*\-D most are -DDEBUG,
> -DDISABLE_BRANCH_PROFILING, -DDEFAULT_SYMBOL_NAMESPACE, etc. and in
> most cases they seem like a bad idea. Don't do it for KVM please;
> requiring -D for all architectures and for random pieces of config,
> when you can put it in asm/kvm_host.h, is just as bad if not worse.

Boo, it's never fun when a parent shows up and takes away your toys :-D
