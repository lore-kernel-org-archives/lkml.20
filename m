Received: from mta1.migadu.com (out-138.mta1.migadu.com [95.215.58.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABE84349B3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954345; cv=none; b=kDkDBPNf8FjLaZ9fEICU7ugHcGTOD7Ph+KFmw3+3fu1YV3BCwSdpe0FogRuRXImxKmVL+5ccf4BWPApHj6dEGZr9MBAf0BZDnR3msZ03tth7YlKWygxS0Z7D5SboqRFNiFXc+WO5GVSvc2b0wlUid2B4M+7L1hha9tiqWHHOHfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954345; c=relaxed/simple;
	bh=sQ18SBZz/15tq9LdAqx8ijDFA5shEKNGRQQl0W2IYqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=swhTaA6w64b5GafGokIyaDZxZ9ECJrpPNbif+kSBlsbyYTUbWGAfQrTzmg2FAh2+u/gv+1My4CLGbQk4qnKVnqe1N+Fm/8BAPEo0u9skqIdpXA1S6nlQ8x9pVizZdbBOPQoSwF16svAEq6UZcYF/772U9FWBDppcHVCcBLo/5yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DIqACd6V; arc=none smtp.client-ip=95.215.58.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DIqACd6V"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sQ18SBZz/15tq9LdAqx8ijDFA5shEKNGRQQl0W2IYqs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788954338; v=1; x=1789559138;
 b=DIqACd6V9XmAt9aIloO1/sPvZikoX37JHO1NMwkSqY972PUHaCzmCw0ngQqUtIz1X4UhYtaF
 rYOhzvcHCB4nNhOudzVjBPQP21VyGAXkRUC7Yy1yDdqesvGUMUVGPM2g+gZ0mpSJ6Xz5ssiAl6u
 KHE2Hn00InZAKilBj2JwWFM4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a075848fd9d6a40b;
	Wed, 09 Sep 2026 11:45:38 +0000
X-Mizu-Trace-ID: a075848fd9d6a40b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so6267e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:45:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzoocav40VwyfAiJtOvPO9VpZ9EzW/vyJ1E/Eg3ud7bnNOZLJN3k0h/AyhzB9GQivtFewKuvnZH/x+YI2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++n3U8anKbkZfdHRZCujr5nHl4v2V11lllWNXZ+KWgVN1Yq8x4OE
	e55YHVb3sgeroBz7W5KdTQDohjAJ1VMqjiYWFYJ+xZTjYu41dSwjxsLddB2ip+Hw9cyYtNqGZNr
	PwoPd+JsUK1T/beeqSrn0Vd7eRO0kFb3AzChRfL6k
X-Received: by 2002:a05:6512:33d6:b0:5ae:b726:5f1f with SMTP id
 2adb3069b0e04-5b764bba50emr123963e87.8.1788954336783; Wed, 09 Sep 2026
 04:45:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908162223.1683432-1-suzuki.poulose@arm.com> <20260908162223.1683432-11-suzuki.poulose@arm.com>
In-Reply-To: <20260908162223.1683432-11-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 9 Sep 2026 12:45:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw9ReyvsNT=y+-P6ng7VQ6Pvz9PFK9bO71qvTR1pOxx5Q@mail.gmail.com>
X-Gm-Features: AcwNN1VYRy45FZko0UuMaXxNySje8Pm0dy1h12UkU18r19Bom2n2H4FesuVJEUM
Message-ID: <CA+EHjTw9ReyvsNT=y+-P6ng7VQ6Pvz9PFK9bO71qvTR1pOxx5Q@mail.gmail.com>
Subject: Re: [PATCH v17 10/20] KVM: arm64: coco: Disable Steal time accounting
 for coco guests
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

On Tue, 8 Sept 2026 at 17:23, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> PVTIME support is advertised by KVM_CAP_STEAL_TIME, which doesn't take into
> account the kvm instance. Even with that, a VMM could skip the CAP check and
> proceed to configure the PVTIME as we don't do further check on the DEVICE_CTRL.
> Tighten this up by passing the KVM instance around wherever possible and
> catch things early
>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

...

> -bool kvm_arm_pvtime_supported(void)
> +bool kvm_arm_pvtime_supported(struct kvm *kvm)
>  {
> -       return !!sched_info_on();
> +       return !!sched_info_on() && (!kvm || !kvm_vm_is_confidential(kvm));
>  }

I think it would be better to leave KVM_CAP_STEAL_TIME reported and
instead reject the configuration for these VMs, returning -EPERM from
the KVM_ARM_VCPU_PVTIME_CTRL attr. A capability query should report
what the kernel supports, not whether a given VM may use it; gating it
per-VM here is also inconsistent, since the !kvm clause leaves the
system-fd cap at 1 while the VM-fd cap reads 0. And -EPERM says that
steal-time exists but isn't permitted for a confidential VM, whereas
-ENXIO reads as "no such feature".

Cheers,
/fuad

>
>  int kvm_arm_pvtime_set_attr(struct kvm_vcpu *vcpu,
> @@ -81,7 +81,7 @@ int kvm_arm_pvtime_set_attr(struct kvm_vcpu *vcpu,
>         int ret = 0;
>         int idx;
>
> -       if (!kvm_arm_pvtime_supported() ||
> +       if (!kvm_arm_pvtime_supported(kvm) ||
>             attr->attr != KVM_ARM_VCPU_PVTIME_IPA)
>                 return -ENXIO;
>
> @@ -110,7 +110,7 @@ int kvm_arm_pvtime_get_attr(struct kvm_vcpu *vcpu,
>         u64 __user *user = (u64 __user *)attr->addr;
>         u64 ipa;
>
> -       if (!kvm_arm_pvtime_supported() ||
> +       if (!kvm_arm_pvtime_supported(vcpu->kvm) ||
>             attr->attr != KVM_ARM_VCPU_PVTIME_IPA)
>                 return -ENXIO;
>
> @@ -126,7 +126,7 @@ int kvm_arm_pvtime_has_attr(struct kvm_vcpu *vcpu,
>  {
>         switch (attr->attr) {
>         case KVM_ARM_VCPU_PVTIME_IPA:
> -               if (kvm_arm_pvtime_supported())
> +               if (kvm_arm_pvtime_supported(vcpu->kvm))
>                         return 0;
>         }
>         return -ENXIO;
> --
> 2.43.0
>
