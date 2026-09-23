Received: from mta1.migadu.com (out-221.mta1.migadu.com [95.215.58.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D787418359
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157142; cv=none; b=so4C0Y1Ie7WimziytShTKy3KMp8cLobQXbnfcSFTlVpfHbAkEd+hWACM2ep5MAgKtteL00Ah6XFMhHeqoCmwQTFaxqW3ewwRB7scGIaZstZTu3RJSqk/w2UJsnKKicncv9oP2HTVNSQbw8smeQf0e+XhTedL7tnsFMAlDsnBtnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157142; c=relaxed/simple;
	bh=y0Zfn+vuryRfSe4jRJZRjxTw9KOrecVJz7A4RSM8JcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VMvz1cvsxykh5FQrcO0MKizTZ1/NiB89FRgUfZfU9sipAiPBl0m+480B2zPefa/k8+frnBtwKPaP7tseIoyAmGxrtAdYwJFaDH1lNF1wqUNuGk3fhN6Pc+eyxHndXaA2mR4ruLvsyXBYjuHBSup5ztZV3hmFFcHhZHTrxkYPTfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ELEPVMCo; arc=none smtp.client-ip=95.215.58.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ELEPVMCo"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=y0Zfn+vuryRfSe4jRJZRjxTw9KOrecVJz7A4RSM8JcE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790157136; v=1; x=1790761936;
 b=ELEPVMCoKHw2ekfzGBhyqswdsjHBtZDkb40gEerwGbC1KB52eQ1bjrR7ktbuxXgJc9Zmq/mu
 buPQsU6U8qXuPPM0C5lYRXQ3/r4AFyDr8ieF4DLfdpqwwuGRPWODJTC1qGfpInhEfhxznK6s/Mu
 hBX0Y4F46e468xU0KqAklFnM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cf09ed54d8291e62;
	Wed, 23 Sep 2026 09:52:16 +0000
X-Mizu-Trace-ID: cf09ed54d8291e62
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b8c42da963so4827e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:52:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxN6mggeIcIXqaJ56GchZs9gGiPqlxqpJr0+8n36CHoI0jK51ap+TrPmgNiQgu08EvQtpYUYzzMbPo4DzU=@vger.kernel.org
X-Gm-Message-State: AFuF++m23SW2UeHHhtfc3NYFbITq0ALzc6GjwJ4OINPDOBiN9gMCNqBh
	N98oSqf5ph2oh/BoIrSFQAkzfTpmoNJOAjqIpUD1knKbauiHqKEe4jGWoMLs9IC3+X66ksfX9tH
	bYiei/3Yt6m7AbiZjUKuJe5ThT7TqenE5bhGZ5er3
X-Received: by 2002:a05:6512:648a:b0:5b6:4ad:d6ba with SMTP id
 2adb3069b0e04-5b8d91673a2mr92022e87.15.1790157131043; Wed, 23 Sep 2026
 02:52:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-11-fuad.tabba@linux.dev>
 <arK1tHUEJsCQEKzn@google.com>
In-Reply-To: <arK1tHUEJsCQEKzn@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 10:51:34 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx+foVF4CRU5D8bQv8bAqDphMN12UrV+_doUryn2ow6bg@mail.gmail.com>
X-Gm-Features: AclHuK-NnDCO6wvOJ2rcUaq9EYT0pUNanoAkAkxTjQCgkBqgiKvCWE_D10-iu1k
Message-ID: <CA+EHjTx+foVF4CRU5D8bQv8bAqDphMN12UrV+_doUryn2ow6bg@mail.gmail.com>
Subject: Re: [PATCH v3 10/18] KVM: arm64: Handle PSCI calls for protected VMs
 at EL2
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Vincent,

> > +/*
> > + * Returns true when handled at EL2, false when the host must stop scheduling
> > + * the vCPU.
> > + */
> > +static bool pvm_psci_vcpu_off(struct pkvm_hyp_vcpu *hyp_vcpu)
> > +{
> > +        /* No other writer runs while this vCPU is ON and executing. */
> > +        WARN_ON(READ_ONCE(hyp_vcpu->power_state) != PSCI_0_2_AFFINITY_LEVEL_ON);
> > +
> > +        /*
> > +         * Orders pkvm_reset_vcpu()'s clear of reset_state.reset before OFF, so
> > +         * a CPU_ON that wins on OFF republishes after it. Pairs with the
> > +         * cmpxchg in pvm_psci_vcpu_on().
> > +         */
> > +        smp_store_release(&hyp_vcpu->power_state, PSCI_0_2_AFFINITY_LEVEL_OFF);
>
> Is there an issue either with the comment or with pvm_psci_vcpu_on()? the
> cmpxchg is relaxed. I would have expected cmpxchg_acquire().

It's the comment. The ordering it describes holds with the relaxed
cmpxchg. The release of OFF orders the clear before OFF. The winner's
smp_store_release(&reset_state->reset, true) orders its cmpxchg before
that store. So the clear can't land after the republish. The comment
should name that store-release as the pair, not the cmpxchg.

You're right about the acquire though, for the plain stores to
reset_state.{pc, r0, be} after the cmpxchg. I'll make it
cmpxchg_acquire() in v4 and reword both comments.

Cheers,
/fuad
