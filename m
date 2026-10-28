Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185324;
	b=0Sx4bE4IXSka5cvfpF1h2N958bNC1Q4W7WlGQKjIPiSAd2nFsBEExlM1fL4NJOwJvRGJ
	 EAQr+M4HrcRKmUkk3EvVopKLyChqoDHdDMoSMhytqHSbRh40EhF19FE7exudNVzB5xvuE
	 /YUxKNVrGOkWPBraxkmhph8mORgJRv1dqTx6TNTTSOLo2iPzeK4jq62WiHi2Sd/DbtJ8E
	 DrIOt8W4ak7rgGdy+nRN5p30krf9x+MH/l6IxTL9HcbFNjcyTVtZgafrS3fgTmICnmY57
	 qiv+Ou4zsZyb3U0fJJrep+QGU94wZ9uhR4rCkP4QSV7kgBMz1isOSrlM0lKjCWmoheQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185324;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=qcokdDgL4mvoHte5dbQtGJJPejEfezJaBPHvPpNg2A8=;
	b=z3BcPRJ1gubqN8wWnkZCIE1LuRlEZXXd6y5yq/J1pSvDdzNlBuYnVR9UyCyTxvEOjEL5
	 1P6mo/AM2wKvcfYZn2WY5TsJQF3SZwY5L/6BJxQgd7bQP5XlxCIN13MqPgrR9qwf/gTxZ
	 JM3+RysIsDlNhkETeDf7Y2hX7sUJpI/AWGte745m/AV35TynAqapMJ15YwmBR2GoANlCq
	 XUHlh53XLGXcJMYeve4sWosr706SJskypA7jqU2vhV1wnJK6zpziXc4S38AqtXAxvtSVh
	 K7SC2B7jBme6nu383w6QtC71+DW/1WAeJxXFNUXQ18/PIO5g20BZIKgvk5Biq9mlFrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Hn6DOZ3Z;
	arc=none smtp.remote-ip=91.218.175.12
Received: from mta0.migadu.com (out-12.mta0.migadu.com [91.218.175.12])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80D0606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D80D0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Hn6DOZ3Z
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rh4zM0t9OB8EXFXZvzLi8a+hQvyHbDJz8WyuNEI5q98=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793185319; v=1; x=1793790119;
 b=Hn6DOZ3ZMJ5PHyEyna4gwB3HF1mQcJrMU2moiZRpqMDIUOjTxpO/Fy//TkdFqzFutynHbarb
 yv2ptQQcUNDCxDLsC0SeSdGVao0zPYLQPWd1MbNqLd++xy8aFToGdBcEykM6ubUXgRmiOkBTElp
 w7wrfr+yNn6uAeXXo9wCrzck=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 42ad6fd798bf6f97;
	Wed, 28 Oct 2026 11:01:59 +0000
X-Mizu-Trace-ID: 42ad6fd798bf6f97
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bfca2a2af4so5864e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:01:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzWblPOTo8+O3gQKrExAmZr64oA2YmPkgApqFacSSRmDF2NX1d6eyJBzDft6YX0ZENiIgIrYXSD/Ji+75U=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+n4p7QG/z+8Jc6plW/B0HSaviBhEbF47qoWDsotIyhGpcE+xG
	3UxSZMXpHlz0izWmnE3hYS8IH2HLldvHaIoInTABW3Ai4hL4W75ZbX/cfrtpuQ07QE7IgFbRZh7
	8FOW1UKcE3antW+009EIyJ3PjEulDK0gIAQ6lkw0I
X-Received: by 2002:a05:6512:3a86:b0:5bb:27df:415f with SMTP id
 2adb3069b0e04-5bfcd0262a4mr142862e87.15.1793185311685; Wed, 28 Oct 2026
 04:01:51 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027081147.498183-1-fuad.tabba@linux.dev> <20261027081147.498183-3-fuad.tabba@linux.dev>
 <auCFa2VPEmxx2ZcC@google.com>
In-Reply-To: <auCFa2VPEmxx2ZcC@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 28 Oct 2026 11:01:15 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzS_rqHYR+bxvMkJt6KAagrDE9VJecAaS4qimqTQa3LjQ@mail.gmail.com>
X-Gm-Features: AclHuK-N-iC_NAvcm9TdrzyXjqM3xFcWr7x8zL-7NgW85hvGrrNZ88luGxX9CiU
Message-ID: <CA+EHjTzS_rqHYR+bxvMkJt6KAagrDE9VJecAaS4qimqTQa3LjQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: arm64: Pass the PMU events to the hyp vCPU of
 non-protected guests
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Oculytic <oculytic@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2026 at 11:05, Vincent Donnefort <vdonnefort@google.com> wrote:
[...]
> > +#ifdef CONFIG_HW_PERF_EVENTS
> > +static void flush_pmu_state(struct pkvm_hyp_vcpu *hyp_vcpu)
> > +{
> > +     if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> > +             hyp_vcpu->vcpu.arch.pmu.events = hyp_vcpu->host_vcpu->arch.pmu.events;
> > +}
> > +#else
> > +static void flush_pmu_state(struct pkvm_hyp_vcpu *hyp_vcpu) {}
> > +#endif
>
> nit: Could save a couple of lines by just doing?

The coding style says to "Prefer to compile out entire functions,
rather than portions of functions", as do similar functions here.

[...]
> Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
> Tested-by: Vincent Donnefort <vdonnefort@google.com>

Thanks!
/fuad
