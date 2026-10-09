Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9B94F68AC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570978; cv=pass; b=pZBj7UG9a0YzmNBNL6V77sqiymOw1Eo5f0mP/HxI3ANrn1PVPN8r9OWCjC4wlo+Hb0kPRi7UIKZrDVdQUFcreCZt3/crrKiXPyMxeO4goOlfUqwPXP327XmU7CkmzbQ6sOuAMeDHqXxphciYH0+Hi2hf7BHCRNbO2s9ohf1Rw/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570978; c=relaxed/simple;
	bh=aAdMtSkSU+PJixhSHS4YKBFzW6UF4o8VzS6cRINAxt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mf/tqM7QiLs4JOjjJCfyOf+wGTJSQwDAnkNyGd46Syp0+D4qp9JclO26v+mP8ZBVfNkDekiIK4Ubk7/JLUPUvSSv5XGI4LI47Zir3PZSLw5Ebphj+4lnqZhOHfy4sJ57/hFAiqBB5Bkjq4HeXINr5P2ym/Yr28BXc4ZWwURsFgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=k9eYx0lv; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="k9eYx0lv"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso73532f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:36:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791570974; cv=none;
        d=google.com; s=arc-20260327;
        b=iEp1f5BtjYySjfEETgvfI4rHwzlMElm1HWAU8Q1AagBuzoXK7qTGNjCwzkUJ5biY0K
         Q69JlOPcPLU4DXz7dYYY+//rxa68CmTChwenYUdfJtqlwWjQw/GaCDK601EwO/QmQDgd
         A993FNeQxRQcTdtAqNYdMvBLTL4VMI35sYr7ZTl7oorZmOf+KuvySgDmA7TAFWiq+sC5
         ALKxMKQYN3QH4LtFaMoG6FcOGEowL2mniugowb1F8NKHxaxx4Ul/N3JMqjI5dBeX2aDq
         J9dpIf2RbkS1WtPX4kimgJ6vBRbAm+0K2FHYOBqQvgGniMq/rp+YGQ+Px9wqGO5B/Rj+
         bB2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aAdMtSkSU+PJixhSHS4YKBFzW6UF4o8VzS6cRINAxt8=;
        fh=NYgop5M70aDpFiWAEpWTWFyHOrsKjUXf/4NgDTXyLEM=;
        b=sjE4bbpmwLICNVpNWZ8CqHmZDAzVE1rpf0NEuqTWP6Sg9x2EfbobzubaSrd8bp3SVW
         pbN4Q/Cw/+ZGDgf41ynNf+hm+TVh00zqanlCDG24D4w6tn/EQFmmCmNf6LFaKhXptSZd
         LLn3pOiKNiEr+tSH79OMWr9k7aZMqyuAql/X71dR+Y9Id74xkDrqk6oqSOJrBdgGwyRo
         7mddkIXzUTtHU6g7Bajd0CCBzQdpJZN14dUUsjWPH8ED+w+9RaZfZS7edjfPl8xIFHI4
         iLC2/B03/1F145qb3qytzMxsqv5L8r1pOFMS/U2h9wsUgK1XQU/GlCC0syB+1Oj0gBN7
         3HdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791570974; x=1792175774; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAdMtSkSU+PJixhSHS4YKBFzW6UF4o8VzS6cRINAxt8=;
        b=k9eYx0lvd6ClbXWu1/rU9LCv9IhiHYv8T8KKL57dpQzmVoSUAdE9C8WfYFPb0kk8Vz
         d+drXQFJVg/4tEt9R/JMDAJkc9TxpgssBMxOu2FZ9TtbA9Pn/Bd9GbBBe13+aHVOyL6e
         PB9LBQ2VCWXc4lpkmZzQeDfDYPtK6amAwrHnv5XGu+EGDNuyumS8MS5WCajLg3VJ3EEA
         YdSapmFe9INRXGkF6yEw8YmbwoURlIqU2QV6mlwhwzxlg6qlIWWjGSSGHhUk23IYgWqd
         7ehds6Wtv6pmeNANxhLCbkWkzhZLsi79rH0RAPP5SDG2dQQIT8Uv1a39uy9bNS8kX6Zw
         BbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570974; x=1792175774;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAdMtSkSU+PJixhSHS4YKBFzW6UF4o8VzS6cRINAxt8=;
        b=Y58vUxxuXhFTJRp/cJddhXe8TnFgi13ccZBB7oWMEpN1Dd9xhAyQ7nx8lSLaZTUDsx
         Io3+HxzAT3u2zBLE/6RfRJMLW9VNyqBqgEc8scXIfXJ7+xpD3NYNyS5pbg5/qntJeZvI
         Kl/4KYAJMLu3jTOjlTbQ/3zZfQZvP2rPBApUw0ePFwXbQCG9LaIRg0SolO3iA/zLijzG
         RcPy7nIc2YcFCRKbCH4sqFzx2x3+EuxtPyPfRBHl/zGoTJM3gCKDVUQvhKPZOVib2qaK
         c+Z++P8koA7PtuoV41KFAkRtG+PedUPXJQs374ejugHC5Jh606PTTN6gABXQeemtP8VR
         5h/A==
X-Forwarded-Encrypted: i=1; AKwUvBwGxf4Ocy3dQHifgDwmvV9huSeFmyhra20rsKPl8YNki020xcdj0P6YGTcPE7EQDRX6C4FpRraW1Ta2/jA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYm6F3bNnnFBoE2Bqy4G/w5sFHel8Q8afZ5a9/oy/bHMkH8s9E
	Cq6cLYlagCQrfuYq36GZATks8Se3GY96omR0nm3PU2ay+FHmHvwkjKDcDrLoDGT2xZSJEblzJfT
	SJFext/nf3e/V8fpfjcfjqTXkekZu9rcdGo3WL3SenA==
X-Gm-Gg: AYBFou0s6ts6hUVjMlJ7D3gzXtuCsChZs4rQRxJJGbl3bemkpxHxe4tCvf5vNu/44CN
	NyxEY+Y2nbjGpmvf1L8XUNNfrHyIZDgOP5bwM2lTq9ddK19QMWlmudTjpaWKj2mtlHdHXd05haa
	GDkRdiBWWn8tGyilKaOIDi064ciBKH5izOFxRf0dqxYJ2qjiH6mJl9sifwrArrvPnl5U6Yq8bLx
	fIelw+4zfVXiGAihF1yhueubkFAlqnx18qLLf/aUp1ASNFlxsKi9T3C81i8pcL1BobBQ6q+iUo+
	xOPzWOo0R7Txz6LeGiBuPNx5uYhZYvGLuCANsU7XFGjX9dd5juXsiO773WLka58i2PEVNLpNIil
	88e311lCCQ92aiN4xIvF24WauU+gdEmceI5CmB7etDP0l3K/giNMbCiNqZE75Nf4QFhLlhtg4Sw
	==
X-Received: by 2002:adf:f147:0:b0:488:8ab9:f73e with SMTP id
 ffacd0b85a97d-48dbaae4878mr3989428f8f.24.1791570973627; Fri, 09 Oct 2026
 11:36:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911152314.1076817-1-wenlongli486@gmail.com>
In-Reply-To: <20260911152314.1076817-1-wenlongli486@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 20:36:02 +0200
X-Gm-Features: AclHuK-TLWsKgkGzLv0QJ_8v3oC-5fn5auBcEXlemKFFcSbIf24vnAAecN-RL7k
Message-ID: <CAAhSdy0zM+g=roVNZcQi5eV_=kpPM1TvsgenTd8WEeoX7-tyWA@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: KVM: Avoid synchronous IPIs on VMID rollover
To: Wenlong Li <wenlongli486@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Quan Zhou <zhouquan@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 5:24=E2=80=AFPM Wenlong Li <wenlongli486@gmail.com>=
 wrote:
>
> The current VMID rollover path synchronously invokes HFENCE.GVMA on
> all online CPUs using on_each_cpu_mask(). This sends IPIs to remote
> CPUs and causes a vCPU running in guest mode on a targeted CPU to exit.
> The rollover path then waits for all CPUs to complete their local TLB
> flushes before VMID allocation can continue.
>
> Make VMID rollover lazy to remove this cross-CPU synchronization.
>
> Track active and reserved software VMIDs for each possible CPU. On
> rollover, preserve hardware VMIDs that may still have stale
> translations, clear the active VMID, and mark a local TLB flush
> pending for each CPU.
>
> Do not send IPIs or otherwise force remote vCPUs to exit during
> rollover. Instead, when a CPU next activates a VMID before guest
> entry, perform the pending local HFENCE.GVMA, install the current
> hardware VMID in HGATP, and only then publish the new active VMID.
>
> Use the same software VMID snapshot for both HGATP programming and
> active publication. When switching identities on the fast path, program
> HGATP before cmpxchg. A concurrent rollover clears active, making the
> cmpxchg fail and forcing activation through the locked slow path.
>
> Perform VMID activation after preemption is disabled in the guest
> entry path. This keeps the per-CPU active VMID and pending flush state
> associated with the same CPU that subsequently enters guest mode.
>
> Keep reserved hardware VMIDs unavailable to the bitmap allocator
> while stale translations associated with them may still exist. This
> prevents a hardware VMID from being reused prematurely after a
> generation rollover.
>
> Represent a software VMID as a 64-bit value combining a generation
> with a hardware VMID, independent of XLEN. This keeps the generation
> space large on RV32 while hardware VMIDs and bitmap indices remain
> native unsigned long values. Extract only the hardware VMID when
> programming HGATP or issuing VMID-specific fences.
>
> Reserve software VMID 0 as the unallocated identifier. When the
> generation counter wraps to 0, compute the next nonzero generation
> locally and publish it atomically, so generation 0 is never visible to
> lockless readers.
>
> Reserve hardware VMID 0. Disable VMID allocation when the hardware
> VMID space is too small to retain one reserved VMID per possible CPU
> while still leaving a VMID available for a new allocation.
>
> Invalidate the per-CPU VMID bookkeeping when virtualization is
> disabled, so stale G-stage translations are flushed before the CPU
> next enters a guest.
>
> This removes IPIs and remote CPU synchronization from the VMID
> rollover path, avoiding VM exits caused solely by VMID exhaustion on
> another CPU.
>
> Tested on QEMU with two host CPUs and the VMID width temporarily
> forced to 2 bits. Repeated rollover, protection against premature VMID
> reuse, activation-versus-rollover stress, and vCPU migration were
> exercised with multiple concurrent guests without guest failures or
> host warnings.

NACK.

The synchronous IPI on VMID roll-over is required for correctness so
that all running Guests/VMs immediatly update their VMID.

Regards,
Anup
