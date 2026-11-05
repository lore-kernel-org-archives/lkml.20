Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893276;
	b=5MTIpd4PMc1qaBZiEzD0Ho09PlDEk6zfxqtVnrzL7PEKhAhhvYoKmNn05L1h53DRGArb
	 /DQaajyPg8vBzG5blO4E/ooxRN+PtZOxauQT/99Kg387woR/4zwIuXQV4jSqro+rZZ1N8
	 mz88kELSorHubwXIBIn+R8OHowY4StdA51Cz+0oc8QdHqi1xSZaLxoNTbiIyv08GVSdpt
	 4fDy4Rpg0+P8lhakOYyi0ImIzK8UYFCwC9PT2df6RgifEuzLA46Cw/mv+/dSKt1tWAnsg
	 o1kEdO5oAVVaurrqXm/vt/cZfFWeK1RQ1EY9xTItTqzXxRdGDXeCjkc2CFe2q8gAK5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893276;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=r3AP3t6GqHgFMQ1XdVu4Hhyjy6C+AgYC+TMVyHZ5Uy4=;
	b=S3GWhhHxzfsq3WZY85ItiOEb8y1Og2Wc6mVd2I15cJQIL3nq5Mk67UECJ0pL6jIkEItK
	 yTy4r0r/vuWN30RF2X2FMJi3CFxXTfp1R0Gob/qXHfsbLOzY+GU130Ltt1aGjzjTXLOYe
	 Y0L151rq3JVIMiU7DX7xfsvluOQ9NBq6xtGsF80VX2BQlHzKQxkxZCalarxL/3pZWuWNM
	 VD+WE2w+OTY1Lk7ZsRNAoj56TpralR8fmjhZypZjDM/Z13UOAxZmh5P8BDPI+IOrg9YtV
	 OZcktVNEW13gh5oDtWQTi6vVS2PZPf02OFFiUgKZQF54p5qxw7VeacYCPV0pV4UkULQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=debian.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9CE606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC9CE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-679965fb848so2393187d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:41:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893275; x=1794498075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r3AP3t6GqHgFMQ1XdVu4Hhyjy6C+AgYC+TMVyHZ5Uy4=;
        b=GnczWukjA6ueSAeHi0cL5/hRYunc2FcclqvTK8MgtCvRqFs+srrUUjRMU5vapvsoeK
         6mixOMRqcMKd0ILLjjJ2vuKaKe/9G/YgBZT63KvDilMEH2ScmQIa6b+QnZACXRbSruvQ
         9OUhv0kotkaQtmUpWlWd3NEF+K2Fo5LIWGQDIffRjzFEDGb3L56giaoitfruYs0puwYy
         XbYMuwaG69cXIEAkIuMT2FMmnD2xozSroXRHJjglL5uYtwqyaRKFHG+FNxugnd01ywBv
         UEj9i1/4PSYTKnc9/KkFkbidPmtqj1vF7R5Ia1rc27wDE32UGEpe5pWA9tqHpSKBgMLC
         WbCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWU1wqpZvNZ6r3xJSgxxXMVssPwUoOQya2IJR7SGIAT/WxevQYbPwF17TUqTZZa3DYBKtGEiyqcxk47FY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TbV8IUCSRrVF0nd/WasjySGbMY4C3iRu/7aIyeUEkWNcnnYo9
	jg5al06WelmVeRwZJIFNE8WGWyIpkCZD3CrxPWx/HOcJEdsvsUrB4vQ5
X-Gm-Gg: AYBFou2tQlSo77O2P6pYctub5YNjEKKdPz90b0RkPVNvZ7NcTWUyQBuBEipUphfZf2G
	LGFFETb+hyUpReVz541vla1v02ccWqlNn6l0GIX7Ut5zhIZ8DThDytSggML6knADAZdqT+4IESh
	gwQi93rfG+gJ4veLnPMSrp/zZI2FqYPCO/yWsFD17fTcKKhouqWpHkLLPh2znJhXFQlCrKCDNxL
	FpPKY+lj5BL1a2ze4MbSaqp6X+QjpZx92s8SgRSy//XrYad6V8hUu/qUNQdRfPErP0Ntm0S+qw4
	18CBMHMzeVRAAfa2uXWT5UHyZcoive2UWXuIDgNCpgRo+AXa/UtLhuI7gr85HPpfaiPXNG/bbjR
	Vjz6hbyBQ8qdAKaoKY4H+odAUg31oaAC06Fx4kjAQRspfhoVQAkwqqnmfxwiksSo0tqFbJp8eL9
	yOOklS0+sHogodmq3UWSoVPTRHvtNFRwEWZxr0I8M0130S7uUNOQuAhvc3rKf/l1Ofslhhu9zIb
	8degTFYi+Za0GqQ9Us9bfNb0yl6anKKE8HSwazd32Bj336MdylSN+Nnd6eieviAgg8hp601K7Z4
	bhCcBJeF/kfuxgzDgp0=
X-Received: by 2002:a05:690e:1698:b0:67b:9051:e334 with SMTP id 956f58d0204a3-67bb304d942mr9266532d50.99.1793893274539;
        Thu, 05 Nov 2026 07:41:14 -0800 (PST)
Received: from gmail.com ([2a03:2880:24ff:54::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee27bfddsm3766424d50.15.2026.11.05.07.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:41:14 -0800 (PST)
Date: Thu, 5 Nov 2026 07:41:12 -0800
From: Breno Leitao <leitao@debian.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	James Morse <james.morse@arm.com>, Usama Arif <usama.arif@linux.dev>, 
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Doug Anderson <dianders@chromium.org>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, 
	Linus Walleij <linusw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Huth <thuth@redhat.com>, Dawei Li <dawei.li@linux.dev>, 
	mrigendrachaubey <mrigendra.chaubey@gmail.com>, kernel-team@meta.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: sdei: Preserve the interrupted context's
 exception registers
Message-ID: <auyjSmtuqkXCqMvl@gmail.com>
References: <20261105120835.3321912-1-kirill@shutemov.name>
 <20261105120835.3321912-3-kirill@shutemov.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105120835.3321912-3-kirill@shutemov.name>

On Thu, Nov 05, 2026 at 12:08:34PM +0000, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> An SDEI event is dispatched by firmware regardless of PSTATE.DAIF, so it
> can interrupt the kernel where the exception registers are live:
> 
>  - exception entry, before kernel_entry has saved ELR_EL1/SPSR_EL1 and
>    before the C handler has read ESR_EL1/FAR_EL1;
>  - exception return, after kernel_exit has loaded ELR_EL1/SPSR_EL1 and
>    before the ERET.
> 
> An IRQ or pseudo-NMI cannot arrive there with PSTATE.I set. Firmware
> saves only x0-x17, PC and PSTATE around an SDEI event, so a synchronous
> exception taken by the handler overwrites the interrupted context's
> ELR, SPSR, ESR and FAR. do_sdei_event() only notices that ELR changed,
> and warns.
> 
> The interrupted context then carries on with the handler's state. A
> task interrupted on its way into the kernel can be sent SIGILL for the
> handler's kernel data abort. A task interrupted on its way back to user
> space ERETs to EL1, at the handler's fixup address, with user registers
> loaded.
> 
> With SDEI delivering NMI backtraces, this happens in normal operation.
> The handler runs show_regs(), which reads through possibly-NULL pointers
> with the _nofault() accessors. print_worker_info() faults this way for a
> kworker that is not running a work item, and a single sysrq-l warned
> once per such kworker.
> 
> Save ELR, SPSR, ESR and FAR in __sdei_handler() before
> irqentry_nmi_enter(), which can take an exception too, and restore them
> after irqentry_nmi_exit().
> 
> Once they are restored, a nested exception is harmless if its handler is
> safe in NMI context. That holds for EL1 data aborts on translation,
> permission and access-flag faults, which never take the mmap lock in NMI
> context, and for BRK. Warn once, with the syndrome, about any other
> exception class.
> 
> Fixes: f5df26961853 ("arm64: kernel: Add arch-specific SDEI entry code and CPU masking")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Tested-by: Breno Leitao <leitao@debian.org>

Tested on NVIDIA Grace (firmware SDEI) with next-20261104, KASAN + lockdep,
ARM_SDEI_NMI=y: sysrq-l under stress-ng, with a kprobe on show_regs() and
eprobes on irq_disable/irq_enable that fault on purpose.

Without the series the box crashed (a task interrupted in el0t_64_sync
got the handler's BRK, then lockdep/KASAN fallout and a hard lockup)

With it, KPTI off and kpti=1, ~4000 kprobe hits and ~5500 faults in
irqentry_nmi_enter()/exit() produced no warnings or stalls.

