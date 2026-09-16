Received: from mta0.migadu.com (out-219.mta0.migadu.com [91.218.175.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077E34E3EED
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558308; cv=none; b=udSpRxsV9jflLPQQZ6tef7V2fNXyEyqw2omwf2dGdAUuTcfArATFhGwFbFTnDsee7h+w1qMtExdhSzHGcluPvbSLJ53u1hZTxJ4/IubXhGK15MWa8k7XZQIGS3pV1VyTcj4+67lmAQNXjbgMpgioQsguzi63fSV7g1Is51BXLn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558308; c=relaxed/simple;
	bh=H9/X4Q083/Be4Ty8+X1bHX6F/upo2FhttV8SucE1Kc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NHlvz+YTp0AqQvFWwirqp4N4kOeC5BUwIpMV04YZ8c5C9K924VJsPcy+vfBh5NVpNyV6cCxk2pgj8w9fNcUvjkUM/q0SL4EFKjSQNczdZ6nlzt6xIaz3p5iXsOjipTR3uBkTDOfYmyB0h6aK3u9vN2xBEFJezRGmrt2M2KzEdVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=leMPVp9z; arc=none smtp.client-ip=91.218.175.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="leMPVp9z"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=H9/X4Q083/Be4Ty8+X1bHX6F/upo2FhttV8SucE1Kc4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789558288; v=1; x=1790163088;
 b=leMPVp9zIuUAyB0Woq6ExJ2dlcwjfpLCn1HXPeyBfDDBQ8Z9AGxqvysSD7pu7BROyl6YwkZH
 D4fdC5mpBkhgFgVnrvrgfjs7nyhebLHnQ/axJN/I9QJtWLbbHic4H/vJ81PTJqycMuw3BlHfawG
 wIhzbrEJKRVSjNnUGVHX0nA0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d2258a236f1df70f;
	Wed, 16 Sep 2026 11:31:28 +0000
X-Mizu-Trace-ID: d2258a236f1df70f
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so5980e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:31:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzJNpkeIGS828tZDWK0GHCyTF6E4Tf87y/276mHjzhF/yYKN8/sBmvGGnA40cz3bFBRN08YujGkl9rln1E=@vger.kernel.org
X-Gm-Message-State: AFuF++l/dl9PSOu+7rqsghHiCYNftyfK/Yut2W811U+xuoruMLsdsIgI
	4Tko3T2OLcKBn+8qQUJ/krcDas9WNBQEhDsy+0O3O+FNbeLb7rqNWxP2QFEIh3FUqjxka068XOL
	lhxbnDeOq+eg1dwHEkexcxd8Ybyc7smoBhhgHVz/r
X-Received: by 2002:a05:6512:1348:b0:5b8:b19a:6d1d with SMTP id
 2adb3069b0e04-5b8b63618f4mr78123e87.10.1789558287151; Wed, 16 Sep 2026
 04:31:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915123846.2317931-1-fuad.tabba@linux.dev>
 <20260915123846.2317931-4-fuad.tabba@linux.dev> <aqp25JLeqyCKtCQH@e143914.arm.com>
In-Reply-To: <aqp25JLeqyCKtCQH@e143914.arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 16 Sep 2026 12:30:50 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzrLF3Hg5ydxyH42_5MuVy8UgX_2i+9j=b9iGv4HXQO8w@mail.gmail.com>
X-Gm-Features: AcwNN1Vz9eSWek0wyBJeKGdLSTjp1eCz6MDTP6a0k4XXrJwyuhhk-6TSflZWtaw
Message-ID: <CA+EHjTzrLF3Hg5ydxyH42_5MuVy8UgX_2i+9j=b9iGv4HXQO8w@mail.gmail.com>
Subject: Re: [PATCH 3/7] KVM: arm64: Validate the host-provided vgic model in pKVM
To: Joey Gouly <joey.gouly@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	vdonnefort@google.com, qperret@google.com, Sascha.Bischoff@arm.com, 
	steven.price@arm.com
Content-Type: text/plain; charset="UTF-8"

Hi Joey,

On Wed, 16 Sept 2026 at 12:00, Joey Gouly <joey.gouly@arm.com> wrote:
[...]
> > +       if (vgic_model != KVM_DEV_TYPE_ARM_VGIC_V3)
> > +               vgic_model = 0;
> > +       hyp_vm->kvm.arch.vgic.vgic_model = vgic_model;
>
> A bit confused by what is expected by writing 0 here? I would have maybe
> expected to refuse running this VM? What happens if the host writes some
> garbage here, so vgic_model=0, but then tries to access gic-v3
> registers?

0 is vgic_model for a VM with no in-kernel irqchip, which pKVM runs.
An unsupported model is treated the same, as a protected VM's features
are masked rather than rejected.

At EL2 the model only selects the GICv5 world-switch path (GICv3 is
saved and restored under the gicv3_cpuif static key) and gates
__vgic_v3_perform_cpuif_access(), which returns 0 for anything but V3
and leaves a trapped ICC_* access to the host. A host that writes a
model it doesn't have gets a guest without a working GIC, which it can
do anyway, but can't make EL2 run the GICv5 path on a GICv3 machine.

I'll say so in the comment if I respin.

Cheers,
/fuad
