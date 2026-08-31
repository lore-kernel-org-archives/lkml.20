Received: from mta1.migadu.com (out-191.mta1.migadu.com [95.215.58.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D948937106D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788204500; cv=none; b=MPPiO3DB3aIbvstdO/blYoYFdvjjVdgfThegKueVYwbOnK7YheETElUCNR3LMqIAVQ4GM1tTaIMBF3a7qg5vpJvn+CmF+xCrWxoy5OTXmUryp+zHL+wuVfD0QSkclVwfGdlbwNO0HeTnE9WnObSuzvS9/m1tLRjGDPsM56aCUII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788204500; c=relaxed/simple;
	bh=QL9iDzTYCKrAUBeXvATSPUv4Y1G32BzzX2eraj3q3jQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=buiTboEd4kahZRtpSAKjhYvHRgqLp84nB8NZba4ePFg7xhoehtdhATA/Rwq5sOE5Gl0ThgKQH0VsGD6wkSYmEIyIwKM/eSWIZghqi1yu+Kd/27kOmKaz+tL0Gq7LwW0P3JPXmm1RoJXfqljq2ZQhaPRtiF9cbiKZ70qUascOGcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FMW/9ZYw; arc=none smtp.client-ip=95.215.58.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FMW/9ZYw"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QL9iDzTYCKrAUBeXvATSPUv4Y1G32BzzX2eraj3q3jQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788204496; v=1; x=1788809296;
 b=FMW/9ZYwFhJa9/QqGaE2Q+/Z8cW2d+V1SYjVc1NXau0WslsMa5oqe/idgNrkHPW1474CwLP3
 VDlwCE550wV4bPIC1lWLTIPEwW6mP+CqX7EdHY++9PkWx+7Ei/+1T2Cekbt0XSk/2ZMQHeWOvlL
 RkI5dSVoUtJ+Tx1eN5lP/r9U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 90b0997e56b25950;
	Mon, 31 Aug 2026 19:28:16 +0000
X-Mizu-Trace-ID: 90b0997e56b25950
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b5e5aaf7deso1631e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:28:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByymcQCH/fIx0wJJJPn6MDNWbVYpmNe4jMJOWQ6r8udkvOj24KD8EUuUpC2z2ThxdRI9rCDgA0aY2byk4A=@vger.kernel.org
X-Gm-Message-State: AFuF++lwVxtmZfYOyRaRMIv0KYUP2QF+oCDnsLbEwN4Wg/jcl12IGfv1
	eTxyBbffrK+OcmEZLhYR/tbfMXf9HdkFvXPFtCNCXEep8zWppXRLAw5Qo+PMCGuYfq9CNHa6EUD
	M5aNidOOvwN0p4iSKoWU0FEgENr43BNrF9RVjQG3F
X-Received: by 2002:a05:6512:3b0d:b0:5b4:9dba:4ece with SMTP id
 2adb3069b0e04-5b5ff2ae0dcmr23112e87.12.1788204494566; Mon, 31 Aug 2026
 12:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
In-Reply-To: <20260831163421.272420-1-fuad.tabba@linux.dev>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 31 Aug 2026 20:27:38 +0100
X-Gmail-Original-Message-ID: <CA+EHjTycOnoVv6jCE2M5bVLG5m1MhnaWSNTpS8vJaWVDk1+S3g@mail.gmail.com>
X-Gm-Features: AcwNN1VeQcT49sFWxBpO5p7UEcrKsOyar9oNS5xestQbF8q3MfimLDxR9Ts3ohk
Message-ID: <CA+EHjTycOnoVv6jCE2M5bVLG5m1MhnaWSNTpS8vJaWVDk1+S3g@mail.gmail.com>
Subject: Re: [PATCH 00/17] KVM: arm64: Confine protected VM vCPU state to EL2
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 17:34, Fuad Tabba <fuad.tabba@linux.dev> wrote:
...
>
> The kvmtool changes that go with this will be posted separately, and I
> will reply here with a link.

... and here they are:
https://lore.kernel.org/all/20260831192406.1341841-1-fuad.tabba@linux.dev/

Cheers,
/fuad

>
> Patch 1 is the HCR_EL2.VSE fix posted separately [2]. It is not part
> of this series; it is carried so the series applies as is and Sashiko
> can run on it.
>
> The KVM_ARM_PREFERRED_TARGET documentation fix [3] went out just ahead
> of this series. Nothing here needs it to apply, but patch 17 documents
> vCPU feature availability as something the capabilities report, while
> api.rst 4.83 still points userspace at a bitmap that has always been
> empty.
>
> The series is structured as follows:
>
>   01:     The HCR_EL2.VSE fix, posted separately.
>   02-03:  Capability allowlist and the PVTIME rejection.
>   04-05:  Per-exception-class entry handlers; EL2 owns a protected
>           vCPU's trap configuration.
>   06-08:  Timer state, system register reset and HVC handling at EL2.
>   09-10:  PSCI at EL2, and the KVM_ARM_VCPU_INIT and PSCI version
>           restrictions.
>   11-14:  Host PC adjustments blocked; an UNDEF at EL2 for exit
>           classes the host does not emulate; per-class state
>           marshalling; a protected guest's SError pended with
>           HCR_EL2.VSE.
>   15-16:  Host access to private state, and host power-on of a vCPU
>           EL2 holds powered off, rejected.
>   17:     Documentation.
>
> Still to come: selftests, self-hosted debug, SVE for protected guests,
> and much more, as separate series.
>
> Based on v7.3-rc1 (cee9395acd804).
>
> Cheers,
> /fuad
>
> P.S. Sashiko, bring it on!
>
> [1] https://lore.kernel.org/all/20260729131823.2021516-1-fuad.tabba@linux.dev/
> [2] https://lore.kernel.org/all/20260829071120.2522788-1-fuad.tabba@linux.dev/
> [3] https://lore.kernel.org/all/20260831162815.269851-1-fuad.tabba@linux.dev/
>
> Fuad Tabba (15):
>   KVM: arm64: Sync HCR_EL2.VSE back to the host vCPU under pKVM
>   KVM: arm64: Advertise the capabilities that protected VMs support
>   KVM: arm64: Reject the PVTIME vCPU attribute for protected VMs
>   KVM: arm64: Skip fixed-feature state flush for protected vCPUs
>   KVM: arm64: Add system register reset framework for protected VMs
>   KVM: arm64: Implement HVC handling for protected guests at EL2
>   KVM: arm64: Handle PSCI calls for protected VMs at EL2
>   KVM: arm64: Restrict KVM_ARM_VCPU_INIT and PSCI version for protected
>     VMs
>   KVM: arm64: Prevent host PC adjustments for protected vCPUs
>   KVM: arm64: Inject an UNDEF at EL2 for unhandled protected guest exits
>   KVM: arm64: Add per-EC entry/exit state marshalling for protected
>     guests
>   KVM: arm64: Pend a protected guest's SError with HCR_EL2.VSE only
>   KVM: arm64: Reject host access to protected VM private state
>   KVM: arm64: Reject host power-on of a vCPU that EL2 holds powered off
>   KVM: arm64: Document the protected VM userspace API
>
> Marc Zyngier (2):
>   KVM: arm64: Introduce per-EC entry handlers for pKVM
>   KVM: arm64: Add {flush,sync}_hyp_timer_state() primitives
>
>  Documentation/virt/kvm/api.rst                |  22 +-
>  .../virt/kvm/arm/fw-pseudo-registers.rst      |   2 +
>  Documentation/virt/kvm/arm/pkvm.rst           | 141 ++++-
>  Documentation/virt/kvm/devices/vcpu.rst       |   4 +-
>  arch/arm64/include/asm/kvm_asm.h              |   1 +
>  arch/arm64/include/asm/kvm_host.h             |  21 +
>  arch/arm64/include/asm/kvm_pkvm.h             |  34 +-
>  arch/arm64/kvm/arm.c                          |  40 ++
>  arch/arm64/kvm/guest.c                        |  29 +
>  arch/arm64/kvm/hyp/exception.c                |  27 +-
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  18 +
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 564 +++++++++++++++++-
>  arch/arm64/kvm/hyp/nvhe/pkvm.c                | 401 ++++++++++++-
>  arch/arm64/kvm/hyp/nvhe/switch.c              |  29 +-
>  arch/arm64/kvm/hyp/nvhe/sys_regs.c            |  91 ++-
>  arch/arm64/kvm/hypercalls.c                   |   7 +
>  arch/arm64/kvm/inject_fault.c                 |   5 +-
>  arch/arm64/kvm/pkvm.c                         |  21 +-
>  arch/arm64/kvm/psci.c                         |   3 +
>  19 files changed, 1378 insertions(+), 82 deletions(-)
>
>
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> --
> 2.39.5
>
