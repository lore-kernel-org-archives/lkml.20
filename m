Received: from mta0.migadu.com (out-30.mta0.migadu.com [91.218.175.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15B322A7F6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367545; cv=none; b=aYFxAFZoXNOzcEeAa/GxzPy5dLMonXAhUzyIT9tGcXaKIiHfadqgtXFB52PYeg/3vf9EtKi+VODiGjL4/AqrxgkMXPopC598PtmSI2/28adBodDIABMMf28P1cRSwfo2w4NMyN0dpu5+0Ze7A5D0IUcBXkMXuGMasmeglCh+9PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367545; c=relaxed/simple;
	bh=u0xDEdzgIvp1jXjtMCIvp5g1TCOxOf/z9+CMM5yvNJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9dikFxNZvRGkTcG/3Jc/ttIurs333UA0sYm8/yhpUerPFkE8rkLUh1k/jxWLlDvVceN4eNq7xU9VJDlxQRbIvExa29owyDofpV3SmE2p4OJf5sXR+zJKxPRUdSgzb94IyhVILFSZ1/lexqsAjKBWhRrMOJZLgFm5aZ+dY1PKaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=naG/VH1I; arc=none smtp.client-ip=91.218.175.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="naG/VH1I"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=u0xDEdzgIvp1jXjtMCIvp5g1TCOxOf/z9+CMM5yvNJ0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789367541; v=1; x=1789972341;
 b=naG/VH1IheAzPheUGvqYVFPCMELPtRNGNhvuSfF8Bac/PzsBfsgBBsH/BV0PcXlOrlh8BWey
 v/3ykVE6glR8btsjm6swnGieDx1V/tzxaohENf+vKd2uW2wEffgPXHWIQ990W0iWL7G7nCbHFwN
 SNG8MHfkVsAXWM51mm2H/pe4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5cc6e3e4d0ef2ad9;
	Mon, 14 Sep 2026 06:32:21 +0000
X-Mizu-Trace-ID: 5cc6e3e4d0ef2ad9
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so4978e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:32:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxMN1IHhEviAAdZIBsa4JOAvzq++HJpdPWg5IgckJFFuhEullvtAuFj+HQAtAC2m99bMF3F1F7/wG77+n4=@vger.kernel.org
X-Gm-Message-State: AFuF++lkT7ZcXMrPzgG70mGoQIx/B2Kcj1Tzlcro3tmufRwQVWqfTtAY
	t+qF5X8/PvgS5i9xKXFmDQKhb/ck41Er9OOj311tw6ahELt5M4U9/8xbD6447jEP9L6Tn/PcB8X
	M4GqQ8OybgiPFR9iy/iBcatWT8TpKqc1qU4WnlmEH
X-Received: by 2002:a05:6512:3e0e:b0:5b8:9e63:dfb9 with SMTP id
 2adb3069b0e04-5b8ae42ae97mr21520e87.0.1789367538566; Sun, 13 Sep 2026
 23:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
 <20260907070002.3333525-15-fuad.tabba@linux.dev> <86jyos6j2o.wl-maz@kernel.org>
In-Reply-To: <86jyos6j2o.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 14 Sep 2026 07:32:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwL4dUC6_ok+OE=zhFK_Dhosc1Nji4Vp4hr+HYibF6cgQ@mail.gmail.com>
X-Gm-Features: AcwNN1V3-IRZLy4EhuEzKp1SiumXuAoMIBvvNz1M8aC8VCuBKY3hnZnOfpboMkk
Message-ID: <CA+EHjTwL4dUC6_ok+OE=zhFK_Dhosc1Nji4Vp4hr+HYibF6cgQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/17] KVM: arm64: Reject host access to protected VM
 private state
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Fri, 11 Sept 2026 at 13:58, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Why can't these be moved to the ioctl callback? Something like:
>
[...]
> +static long pkvm_filter_vcpu_ioctl(struct kvm_vcpu *vcpu, unsigned int ioctl)
[...]

Much nicer, I'll move the three has-run checks into that filter for
v3. I think we need the other two where they are, though: the
ext_dabt_pending check reads the payload, and KVM_SET_GUEST_DEBUG has
its own case in kvm_vcpu_ioctl(), so it never gets as far as
kvm_arch_vcpu_ioctl().

> Where is KVM_CAP_ARM_INJECT_EXT_DABT rejected?

In kvm_pkvm_ext_allowed(): on a protected VM it returns false for any
capability it doesn't list, and patch 16 doesn't add this one, so
KVM_CHECK_EXTENSION on the VM fd returns 0 for it (and for
KVM_CAP_SET_GUEST_DEBUG). I'd keep the ioctl check too, for the VMM
that doesn't ask, since userspace has been known to act silly. I'll
say so in the commit message and in pkvm.rst (maybe not the silly
part).

Thanks,
/fuad
