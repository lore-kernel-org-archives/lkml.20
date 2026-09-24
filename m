Received: from mta1.migadu.com (out-166.mta1.migadu.com [95.215.58.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED7232C94A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249227; cv=none; b=PF0tnEygzS4n3ZKkv561Lp/UfHzta9jVTH8M7rrkcUBxI/6Ch30lZJ5MUxoLyL3rEs5RZsi1VzvZe4T3Zz9ClGSnlMC5tXPmU+u+HyC5Buh2yLncxaz6r32WLo2f8ufSAoKdXOOCr+CxtQwDrpDN/FODBAgGTq3szGv5f7Tb7Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249227; c=relaxed/simple;
	bh=vM7qYu7LAwhbZJOe7T9pvZD37cQZuLfJB1bE3sYOHBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2xjXMaU+pZkEPSpVWBsW7yr5fPkobjKMTHu7xAR3Wk7Y+3e96UfO5724gFGJvqt5BuCOV+vRImLs92g52k+Z0TCzrzqexlnFuLugabZjwPvnGO3kSpFYIgitAAselMACafpr1x+/awpQhgd+8ScelPgCWzH7Mpi/Voa9GvmDAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UIIMGT4o; arc=none smtp.client-ip=95.215.58.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UIIMGT4o"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vM7qYu7LAwhbZJOe7T9pvZD37cQZuLfJB1bE3sYOHBs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790249222; v=1; x=1790854022;
 b=UIIMGT4ooHYnjHmDnhXPhMvY0uHRjnaoBnUL+D23VGjezrXVveK9iVa5JA788TlG/IitjRfN
 /SPtJlJNbblNwVNTBUSgZGZHVn69UipYtfGCRjhxoU8T3UiKY8hXpoLzMeKaAPxx+Bhoa1nMCdJ
 ERqeaWuRdOsongmicvSc0Exs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e5b70613906a484a;
	Thu, 24 Sep 2026 11:27:02 +0000
X-Mizu-Trace-ID: e5b70613906a484a
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b8c42da963so8335e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:27:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwLylfivdIsPse3V1+xfczZWDzlkK7yrwfOYCLR0w4rgc92kHX8OvjWSX6WNlQivD1Bcx2CdATtG7oJP0U=@vger.kernel.org
X-Gm-Message-State: AFuF++njh1zWyG8ZLptxZKWTSCfwAKX+y/Ros3FrDd0F8/CqSvE8xRA5
	0cmP0rUnzaRYgl877Rf8gdwtZv8zXqWlxQp5Lx7SP647gLI8HKnXdI9hrIAc9sC55kKuiqXz9Ic
	72JeaP52l/cQupip0RmIBv2oBGffEQEyvbRgUeTDY
X-Received: by 2002:a05:6512:3052:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b8dd9eff6fmr157966e87.4.1790249221398; Thu, 24 Sep 2026
 04:27:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-11-fuad.tabba@linux.dev>
 <arK1tHUEJsCQEKzn@google.com> <CA+EHjTx+foVF4CRU5D8bQv8bAqDphMN12UrV+_doUryn2ow6bg@mail.gmail.com>
 <arTfjgvZIhmXLrw1@willie-the-truck>
In-Reply-To: <arTfjgvZIhmXLrw1@willie-the-truck>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 24 Sep 2026 12:26:25 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxe0JE-tCX4YcEEafdnxjuZLj3EBucZfZF0HCP2PQAekg@mail.gmail.com>
X-Gm-Features: AclHuK-lEBftn5qqqH_UN8dVLgif6IiC-dIf778GSBKFjS0hWK4r3fOERPhGRzc
Message-ID: <CA+EHjTxe0JE-tCX4YcEEafdnxjuZLj3EBucZfZF0HCP2PQAekg@mail.gmail.com>
Subject: Re: [PATCH v3 10/18] KVM: arm64: Handle PSCI calls for protected VMs
 at EL2
To: Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, maz@kernel.org, oupton@kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Will,

On Thu, 24 Sep 2026 09:30:06 +0100, Will Deacon <will@kernel.org> wrote:
[...]
> Sorry, but I'm really confused by this and it appears to be different to
> what we've got in Android as well. Why do we need release semantics for
> the store to 'hyp_vcpu->power_state' in pvm_psci_vcpu_off()? What is it
> that we are publishing here? The comment talks about pkvm_reset_vcpu(),
> but how is that relevant to the vCPU _off_ path? You say the comment is
> wrong, but what _should_ it say?
>
> I'm a bit baffled!

It's not publishing data, it's handing reset_state back. The CPU_ON
winner writes reset_state.{pc, r0, be}, then reset_state.reset with a
release. The target reads them and clears reset in pkvm_reset_vcpu()
on its next run, and its CPU_OFF hands reset_state on to the next
CPU_ON. The release on OFF orders those reads and that clear before
OFF, and an acquire on the winner's cmpxchg orders its writes after
it: release on the way out, acquire on the way in, like a lock.
Without the release, the target's clear of reset can become visible
after the next winner's reset = true, and the target's next
pkvm_reset_vcpu() then reads a clear flag and returns -ECANCELED,
leaving the vCPU stuck at ON_PENDING.

The comment described the flag ordering, which holds through the
winner's release on reset even with a relaxed cmpxchg, and named the
cmpxchg as its pair when the cmpxchg wasn't an acquire. The acquire is
for the winner's plain writes of pc/r0/be: nothing else orders them
after the target's reads. v4 has cmpxchg_acquire() and the two
comments name what's ordered and each other:

        /*
         * Orders pkvm_reset_vcpu()'s accesses to reset_state before OFF. Pairs
         * with the acquire cmpxchg in pvm_psci_vcpu_on().
         */
        smp_store_release(&hyp_vcpu->power_state, PSCI_0_2_AFFINITY_LEVEL_OFF);

and in pvm_psci_vcpu_on():

        /*
         * vCPUs race to power on the same target. The acquire pairs with the
         * release of OFF in pvm_psci_vcpu_off(): the target's accesses to
         * reset_state in pkvm_reset_vcpu() precede the writes below.
         */
        power_state = cmpxchg_acquire(&target->power_state,
                                      PSCI_0_2_AFFINITY_LEVEL_OFF,
                                      PSCI_0_2_AFFINITY_LEVEL_ON_PENDING);

Android has neither end (a WRITE_ONCE() of OFF and a relaxed cmpxchg),
so it has the lost flag above and the data race on pc/r0/be. Both stay
within the guest's own target vCPU, so I haven't treated it as urgent.
I'm working on a fix for Android separately.

Cheers,
/fuad
