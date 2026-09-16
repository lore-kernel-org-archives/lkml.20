Received: from mta0.migadu.com (out-89.mta0.migadu.com [91.218.175.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF1E3BB11D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789585756; cv=none; b=o9IatbLHiba8m+MkPdq9xvBruSC5beMwK0eIHoSH50w13ZIcdJ2pFWVJLjN0USLacuLuj4SOO4Sdn5hEp9xJ0MpUtsRG8L4GzOM2JWWJogXzVEFo/IVqYdgq5MK5FjWy7RJvdXSsW9rMTGqL6mUxpsn0eV40HPxPQYpPpAH5e1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789585756; c=relaxed/simple;
	bh=eFc2+iQ2uor4nljrCfWRFp6wcNqGR5KKJNmBsadf8CM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSLiIXQOkFjCJAZtPVv1w4vLAIzmhDv9aFw9XwjRd2mAnu3HwR+SE1LGfh2F73Mv5edZlp8Cra6JBz7RVpiyLHYwFj5syV0qt4/Sigmqu7BBZaHhWQY4+wdLzITuZpkD6PMWn2dbryxHokRAPIjxisL/7C9opZoZg6GQetDDQsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JuAk2DF0; arc=none smtp.client-ip=91.218.175.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JuAk2DF0"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eFc2+iQ2uor4nljrCfWRFp6wcNqGR5KKJNmBsadf8CM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789585732; v=1; x=1790190532;
 b=JuAk2DF0h7716A7x1rt7YUeYh1aHm0nx8UjYzJ1flByP2hFRrVLpWqNKYQO9lMEkrOij3dT4
 /Uaa8rehj8lROv7xtRPZTqV8AoX8amLPLWZfqgjheItY8avZXBuds0//iOBsxnqHoLR/76AtyUv
 qqwVIbPwZ/z5xHhC78A6gJ6Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6ed42f582d2d30d6;
	Wed, 16 Sep 2026 19:08:52 +0000
X-Mizu-Trace-ID: 6ed42f582d2d30d6
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so880e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:08:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3/mRtPKEcCE2/txiTGGubmg2odo8qHP/gb7aV+fRIEoa8DOf60KFxdJ5YpLH3/nUkkKYpcbKeD2GCqXQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nrrSCDMN+YYxDYwdlqpqxGZF9lGbqOHyMsVsL215aub8U3k4zj
	GR+UNwTdUX+51e0TLU77jHzYWwuBl/j9cqpTCMlU3Mkf9Sq5wty4o34HXtYulQZWkDKLMxV1Dp8
	b+1fqrlmHHiY8cCN1FbTOkV/UzjmhaxnhEzjy1DDs
X-Received: by 2002:a05:6512:2355:b0:5b6:4ae:3ff0 with SMTP id
 2adb3069b0e04-5b8bab3fbc9mr21749e87.15.1789585729580; Wed, 16 Sep 2026
 12:08:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-17-fuad.tabba@linux.dev>
 <868q515eqf.wl-maz@kernel.org>
In-Reply-To: <868q515eqf.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 16 Sep 2026 20:08:12 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw1HKxntc_XsBGK6ugVYyL8HVLMzUtiRin7OgCVic8bVQ@mail.gmail.com>
X-Gm-Features: AcwNN1XhAbmtcjnzFyAA7N0SNImoWsnKazUmdDqXvnrAn69zT4QFsz2-FY_zZUU
Message-ID: <CA+EHjTw1HKxntc_XsBGK6ugVYyL8HVLMzUtiRin7OgCVic8bVQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/18] KVM: arm64: Reject host power-on of a vCPU that
 EL2 holds powered off
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, vdonnefort@google.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Wed, 16 Sept 2026 at 17:43, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 37d0721d39a45..2e2c051dd8e62 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -922,6 +922,8 @@ struct kvm_vcpu_arch {
> >          /* vcpu power state */
> >          struct kvm_mp_state mp_state;
> >          spinlock_t mp_state_lock;
> > +        /* EL2 holds the protected vCPU powered off. Under mp_state_lock. */
> > +        bool pkvm_powered_off;
>
> I'm definitely not keen on yet another random boolean to describe some
> new state. We already have mp_state. Why can't we use one of the
> unused encodings and check that, since it very much looks like a case
> of "let userspace change the MP_STATE unless EL2 says otherwise".
>
> Can that be made to work?

Yes. The bool kept the VMM's STOPPED and EL2's off apart without a new
userspace-visible value, but a distinct mp_state value does that and
lets the VMM see why RUNNABLE is rejected.

It's set where the bool is set today, on the guest's CPU_OFF and at
hyp vCPU creation for a vCPU that starts STOPPED, and only the guest's
CPU_ON sets it back to RUNNABLE. KVM_SET_MP_STATE returns -EPERM for
RUNNABLE and SUSPENDED on it and -EINVAL for the value itself, STOPPED
and kvm_prepare_system_event() leave it in place, and
kvm_arm_vcpu_stopped() returns true for it.

KVM_MP_STATE_UNINITIALIZED looks like the closest fit, a vCPU the
guest has yet to bring up. I'll use that in v4 unless you'd rather
another.

Cheers,
/fuad
