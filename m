Received: from mta0.migadu.com (out-225.mta0.migadu.com [91.218.175.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90BD3BFAE0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789366542; cv=none; b=dWQmxAUabz/BImrTjYsleXb1Agvn9YRpQHHRbxWf2F2+1e/2xzZjAyRjOaSUA/Cms/6y37XWBSd7InZMFLtSK7IBE1NCd7ZjbGAKtn1a0K3FTWmUl0iMNPJg0orie7rB4BqPHJpLEq7my0ePyhEDJ7AVNJy/z2mey4bcWdKI5DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789366542; c=relaxed/simple;
	bh=bco0eZaaCo0kOj6rwGEtGduTKDKE8JkIclgbB8/hdn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=npJX5/3ArDO4gFc8nrXfA3nBoXgp4y11MhxRTDMw4ZWPnTxU0StdSWVwNRyZzNMvJWi8uBEvW49/f0ejskzxofTscuaC151A8ElnmeTfaEkChHzHlrsdlnlieEwCETCCXKhhTmNlsoHa2jmtFRE9EKMjyH7oOmz4O4NfoJ4w1g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=f0yZo3TZ; arc=none smtp.client-ip=91.218.175.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="f0yZo3TZ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bco0eZaaCo0kOj6rwGEtGduTKDKE8JkIclgbB8/hdn4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789366537; v=1; x=1789971337;
 b=f0yZo3TZkx3q8X2Udjh97WWztZpEcl/NpmvYriLw3uVHfZaav+7ChIxzaUZfWL1e1MSmx9Aq
 xDGIFGa3e+Aatlhyoxitom6H3KDonENnxDzPoQIDQ32U+TzrsAmhw9vfZxP75q9G/41sSKDui2F
 CqC82DDzTj7kWj0PnU5CbQAc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 68aa69ce5e0c9d71;
	Mon, 14 Sep 2026 06:15:37 +0000
X-Mizu-Trace-ID: 68aa69ce5e0c9d71
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so4920e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:15:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwzzDNY0xGZpKmQ9zG8BQx9Ljg4zufxI4+b1m5+DFhDmnp5s+3p8/nJLYFqPg8G4bbvEq4NDETINBe/GT8=@vger.kernel.org
X-Gm-Message-State: AFuF++mWGsGaKFWoCiGFQgrL6cpa/VsVgnfKSAiV1yTCazRdbKqYAAOF
	+lqQJSpHDwzRK15gRFYvrdlssCH1lNkg4FskhLzTK8Si6ROiK+Auc8XB5WrJv0AvZkOfT7vrvra
	4kudEVYLZlhfU9aUgXqb7yaV0QrEfjWIwfltIMm0z
X-Received: by 2002:a05:6512:3503:b0:5b4:9dba:4ecf with SMTP id
 2adb3069b0e04-5b8af7af84amr10114e87.13.1789366532332; Sun, 13 Sep 2026
 23:15:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
 <20260907070002.3333525-11-fuad.tabba@linux.dev> <86ik4b7uvh.wl-maz@kernel.org>
In-Reply-To: <86ik4b7uvh.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 14 Sep 2026 07:15:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw0mERkhV+nf7KdbzOCbGGqJ6N31360dOFKshj5td38LQ@mail.gmail.com>
X-Gm-Features: AcwNN1Vrar7EeAIoZzg3TV6xpg1zXNdc3Yebl-ujX0EmE0S2Uy_2l65154ZS_Tw
Message-ID: <CA+EHjTw0mERkhV+nf7KdbzOCbGGqJ6N31360dOFKshj5td38LQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/17] KVM: arm64: Prevent host PC adjustments for
 protected vCPUs
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

...

> So this is the sole reason why we need to access the kvm structure,
> and the cause for all of this churn. Can't this be written as some
> form of:
>
>     kvm = vcpu_get_kvm(vcpu);
>
>     [do whatever is needed]
>
>     vcpu_put_kvm(vcpu, kvm);
>
> where get/put do the pinning/unpinning as required? These helpers
> would become NOPs on VHE, for example.

I've put the get/put pair one level up instead, in __kvm_adjust_pc()
itself: pkvm_adjust_pc_get() returns the vCPU to adjust and
pkvm_adjust_pc_put() copies PC_UPDATE_REQ back, both no-ops outside
the nVHE build and outside protected mode. The kvm read goes back to
the base's kern_hyp_va(vcpu->kvm), and exception.c keeps its
signatures.

> And this stuff could simply be a similar set of helpers in
> __kvm_adjust_pc(), the original one.

That's where it lives now, and this patch no longer touches
handle___kvm_adjust_pc().

> > +    /* The host copy is authoritative, used only while pinned. */
> > +    if (hyp_pin_shared_mem(host_vcpu, host_vcpu + 1))
> > +        return;
>
> Huh. Really?

After taking a closer look I realized that we have a live bug, and
this is actually a fix. The base dereferences the host vCPU unpinned
in this handler, and the vCPU and its VM are mapped at EL2 only once
pinned, at the first KVM_RUN. KVM_SET_VCPU_EVENTS with
ext_dabt_pending gets to __kvm_adjust_pc() before that, and the
hypervisor panics on the read. Any process with /dev/kvm on a pKVM
host can trigger it, since 6.17 (efa1368ba9f4b). I'll send it as a
separate fix before sending V3 (later today).

Cheers,
/fuad
