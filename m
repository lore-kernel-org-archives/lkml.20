Received: from mta1.migadu.com (out-99.mta1.migadu.com [95.215.58.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2F8343883
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970608; cv=none; b=TyCfoqT9g6Q0p5pzltmApSTnrfpxqM2Sz8KMhBKVy6WPygh1d/qQfBR0NP/bRQXP1qwcvlgraWvouSsFoBgLWK0WEDben0gtxi/28r+O8iEJNApKOw0bk6AIaPh0IpCRUfENoNN0X/bo4PpjY3ttOYciZsqi5Df+ZwhfjjD3VFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970608; c=relaxed/simple;
	bh=KfFHfZ4iwgvTWzD+d7ThKP2Za/ZsPILmpf4NKUXBYSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qajhMOBpa0qfEIxjAAxsvKHmdadcTzzOcjkkGfhxTV/33x/xLpwRVu6Rg2ltxlcGcwSclk8WIJN2+8/niSz4NI7KOrpxuQCkf7sym+eHuMupExa9jXMY+f9c3EbkHBDJL9y/Ogb97iqpTMHRiIIdSYKWe1ZO89qWBZGpZ8LziOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VFKRI3lc; arc=none smtp.client-ip=95.215.58.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VFKRI3lc"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KfFHfZ4iwgvTWzD+d7ThKP2Za/ZsPILmpf4NKUXBYSA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789970604; v=1; x=1790575404;
 b=VFKRI3lcS9gcwiYKsLmUi/HSNJlJf4OOIrlHk/A/XhzNM0uUwiYUnCpawSorQy54P9SVHc9l
 RsPBAbSVcWZ892+dUTvXPEage7CLVNgCMGht67OS+ZodNu17RL8dSIZpbqz+n2Cgt0Gd0qCYavB
 BHAZbfkdMcRjvofNj9v84u5g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3b6cab37f6e0918d;
	Mon, 21 Sep 2026 06:03:24 +0000
X-Mizu-Trace-ID: 3b6cab37f6e0918d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso5768e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:03:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwSzMxIi+cVOgt5U6w2n0ArPi1pHDD3eResfYutBm+xEEDBPUmZXHZe8Y/ExfDJ4/4f1nQs1Q2vML9SNQ4=@vger.kernel.org
X-Gm-Message-State: AFuF++nDLiCt7oINC5OoUP68y/5xhO3Nyi6ksugYSr2lMo+ssmTilUqL
	cBoY9yQnBnh5s8uUV2Nq52fEUub5pBPnTNTTHWrhiKDnjAgG8j9858K5A5/Si7AnvPNFz4vyxU0
	Yy7A1QKAgegvD/gvU+zARTTxduLbeHL/e2sqQAZky
X-Received: by 2002:a05:6512:a95:b0:5b8:cc2e:2fe6 with SMTP id
 2adb3069b0e04-5b8cc2e30d0mr42846e87.5.1789970603608; Sun, 20 Sep 2026
 23:03:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918120553.163139-1-fuad.tabba@linux.dev> <aq1VjEOI3yhoFtpq@gremlin>
In-Reply-To: <aq1VjEOI3yhoFtpq@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 21 Sep 2026 07:03:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyL0WXBQZcudB3AL9MFem1L7wmpC6N0_54C0-qrw7M-FA@mail.gmail.com>
X-Gm-Features: AcwNN1VBGKS9331BRoH03j2FDN--JXQmLxd-TtWpGKfTh8lyxNGKe0BT2dp2tv4
Message-ID: <CA+EHjTyL0WXBQZcudB3AL9MFem1L7wmpC6N0_54C0-qrw7M-FA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Restore the VM's feature bitmap when
 kvm_setup_vcpu() fails
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Jack Thomson <jackabt@amazon.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Fri, 18 Sep 2026 17:10:43 +0100, Lorenzo Stoakes (ARM)
<ljs@kernel.org> wrote:
[...]
> > Nothing in the tree loads a vCPU whose init failed, so this is latent.
> > The pending KVM_PRE_FAULT_MEMORY series for arm64 does, and the second
>
> I think this needs clarification :)
>
> The KVM_PRE_FAULT_MEMORY series doesn't do this, or rather it only exposes the
> ability for the pre-existing generic kvm_vcpu_pre_fault_memory() function to be
> invoked by setting flags such as to expose pre-faulting as available for arm64.
>
> So something like:
>
>     The upcoming series that enables KVM_PRE_FAULT_MEMORY exposes an
>     existing bug in how vCPU initialisation is performed as it allows
>     the generic kvm_vcpu_pre_fault_memory() function to be called which
>     calls vcpu_load() before the vCPU might be initialised.
>
> For that bit.

That's what "does" was standing in for. I'll say that the series
enables the generic kvm_vcpu_pre_fault_memory(), which calls
vcpu_load() whether or not the vCPU has been initialised.

>
> > such load NULL-dereferences in get_s2_mmu_nested() under mmu_lock.
>
> Also I think this is a bit unclear, esp. the prior reference to 'second',
> not clear what that refers to. I think you should bring in some of the
> context you provide under the fold for the patch.
[...]

I'll bring the two-ioctl walk up from below the fold: the first
KVM_PRE_FAULT_MEMORY's vcpu_put() clearing hw_mmu, then the second's
vcpu_load() reaching get_s2_mmu_nested() with no nested MMUs to find.

> > Fixes: 1de10b7d13a97 ("KVM: arm64: Get rid of vCPU-scoped feature bitmap")
> > Fixes: 427733579744e ("KVM: arm64: Select default PMU in KVM_ARM_VCPU_INIT handler")
>
> Hmm are 2 fixes really needed? It seems to me that commit 427733579744e
> ("KVM: arm64: Select default PMU in KVM_ARM_VCPU_INIT handler") is the
> right one because that added a step _after_ setting the bitmap that can go
> wrong.

I'd added the first one because it's where the copy into the VM-wide
bitmap moved ahead of the reset, but nothing after the copy could fail
there. I'll drop it and keep 427733579744e.

[...]
> With the comments re: commit message/fixes tag addressed this seems correct
> and a very good spot thanks! We very much need this for the pre fault
> functionality.
>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Thanks!

[...]
> I also think you should put the stack trace in the commit message, ideally
> decoded via scripts/decode_stacktrace.sh!

Sure, will do.

Thanks,
/fuad
