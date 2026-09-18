Received: from mta0.migadu.com (out-93.mta0.migadu.com [91.218.175.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20C01C6FF5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722911; cv=none; b=E0dInNs7t/w0gm0QpMlabiiqkCtgfr04P51TCjgkQ+7wuc8KG+DfaATT5EKwPoHiCgksF2qPK4cO8jKUZFYsSJ6pYDODi6TOvlkzpieHfMA1kQkf7rNMi3kDvcY8vTJbm/yKAZqNyakfKr0p6Wtzu4HBnWqMeHic65dB2U6NDNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722911; c=relaxed/simple;
	bh=D0PKzZhQRsxn3gOcYMwqRGpkhs/bU2h6lOLFmUyfZXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H7RRRriRnxmhNQNz0xBXS+BKBoIzWGgfxPVCrRPJHLdIjc3Dj3haGdOEs49okSjKk9DH2QYrD9EVmcW2wQKKQHS4vcfF2hjyDqNbwkmmigvDTyQj7/TIy+cqfxtFZAVc3526oOa0yzjMnBlCcwP5Sa9Fc3W7091ggPjcMQvgdVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=A6ZhF/rJ; arc=none smtp.client-ip=91.218.175.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="A6ZhF/rJ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=D0PKzZhQRsxn3gOcYMwqRGpkhs/bU2h6lOLFmUyfZXg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789722907; v=1; x=1790327707;
 b=A6ZhF/rJaYM4ORHNU59H/2h8Mv3hKUBGpEf1J6ZzanKTRziy8GZgRif8gj2WQvHq8taGhDDE
 xNei1cVT9jGgp3x0nI/Ob9MAqwuecbcmNWkBjkz2nVVc3ZcxGt20m43V73Vo0syK7nTjh+Za+4H
 FtmZ1iRIksE+jsukUgVIFYQ4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d87fe0fde4319875;
	Fri, 18 Sep 2026 09:15:06 +0000
X-Mizu-Trace-ID: d87fe0fde4319875
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso5328e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:15:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByx/Q3YQvLdg/m9M7mv0D37rprJZiQTXryXrJh01OVY9cFPzIhaf5ybFKTjQW5NH7Pst6Bjs2amB3sBLDk=@vger.kernel.org
X-Gm-Message-State: AFuF++l1CemvILhXwi9ebm1+qAJYQCg9d7NT3b00vReViBC/7JWozEmE
	AXhjsRU+1Uw1po5r9mMBMvFO9baHNDSnWgOT5z1NZuqGnE8coEERwQs7WuHSTqQFbM4YOsng6U6
	Zg4IkeCxiewJ3lWhBnWvWQH1/qk2iX4OT6hvWyl+L
X-Received: by 2002:a05:6512:a96:b0:5b4:9dba:7401 with SMTP id
 2adb3069b0e04-5b8c17f53eemr77720e87.11.1789722900983; Fri, 18 Sep 2026
 02:15:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
 <20260915160141.3543048-6-suzuki.poulose@arm.com> <CA+EHjTz65G0MM=tOrzmk=jMweBX1us6FqfrmSkQs4KSyAEoxhg@mail.gmail.com>
 <e26cbb4e-84e2-4fcc-9eb0-93bfd4aff4a7@arm.com>
In-Reply-To: <e26cbb4e-84e2-4fcc-9eb0-93bfd4aff4a7@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 18 Sep 2026 10:14:24 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw6TOSEs1GtUcUy9WACpGRJBA9yTn9Ro_+tiD=XkeHr4g@mail.gmail.com>
X-Gm-Features: AcwNN1WAyYZFMS1tYTqzPWruuztc5hWFyoH3hZA9fEYOfU0jxVOmsQMTpwP1D70
Message-ID: <CA+EHjTw6TOSEs1GtUcUy9WACpGRJBA9yTn9Ro_+tiD=XkeHr4g@mail.gmail.com>
Subject: Re: [PATCH v18 05/23] KVM: arm64: Track the type of VM in kvm_arch
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

On <date>, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
[...]
> +       if (WARN_ON_ONCE(!kvm))
> +               return false;
> +
> +       /* Cover both pKVM host and Realm VMs */
> +       if (!kvm_vm_hyp_is_distrusting(kvm))
> +               return true;

I'd drop the WARN_ON_ONCE. And this early return needs the `>=` from
patch 13, or non-protected pKVM VMs skip the filter.

> I resorted to is_protected_kvm_enabled() to make it faster than using
> the vm_flavor checks. I could rever those anyways.

Agreed it's the faster test. I'd just call it by name at the three
sites rather than through a macro.

> Do you mean something like :
>
>         if (kvm_vm_is_protected_pkvm(host_kvm))
>                 hyp_vm->kvm.arch.vm_flavor = VM_PROTECTED_PKVM;
>         else
>                 hyp_vm->kvm.arch.vm_flavor = VM_PKVM;

Yes, exactly that.

> Do we additionally need to WARN_ON() if we encounter a VM_REALM ?

No, the host shouldn't be able to trigger a WARN at EL2.

> Apologies, I thought this one didn't change, but later patches changes
> them, which is why I kept this.

No worries. With those two in, please keep the tag.

Cheers,
/fuad
