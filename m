Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386BD46AA66
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116213; cv=none; b=M0py0PBhSdudIXnPqIdGaCjIp0gSc+zxzULf+mVwR4OMF1wodPNTkHNjYCraEugev9VtTfsqiL6nipORvDpgc6d0H+DupIRr4XtGEfJ3z2RyTP8YwjRFL7xRsJGYvyROMs4oaF6VYjd8v4l0X4nS8EJP+HKec9zat3ZJD0scSts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116213; c=relaxed/simple;
	bh=tWrLmSoHdiPwcU8P5dhf3tp+NQtQslZc1xK9gAQ75H4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HyWLdGxhbARFJEsEk7nqtklyUd2jCngPo9+w9+Lt4ZlOMJzqCs6rweZ/8l346LbxUJXV9zHQFQdyKCf/ZcNlGw4ZBfR0dnB4r0/ArPAbx3a6wicuyoNddm8Kf7/YH0r7NsqzYSL5MXLy8xdluxpltS0wxV6fqQqoTMknkzM4TUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6a7cWr4; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6a7cWr4"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4902427c1so583150a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789116211; x=1789721011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S7nbu7B+bglE3m9s/GZRfFOgm8cRTpe/a1+eyVcACJU=;
        b=V6a7cWr4d3LUN+CXyW4Saps4W3BGPQ5vfnDHxKRllqKOTZMR3rxVH5ZJ1+YgfrJPWJ
         hWfdWavC5vBA9NydiS88WCUuJgxrNvIy+KLG7eQeSxKBcxIw3BdtwVXTC7i9JM05nXuG
         HcZuftmTlO2KzJc8EpZCBsrXaMyrFHDcMFbmadZFUdi0FgGZpVJQw3QfwqLy8PxJ5PV+
         zKtxol87pqwHP8JxP9jWMJL/jvyDXWX1Y6QQZkwZv1dFdUbwWsM8GSkOl9jb6Bcckmuw
         rL/9mvG1j0B4vM4Wb0hzEor1NyyM0s0GcWa2uzYfPJNXdi+pbtvAUyUu7quuH0rWtIOj
         wjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789116211; x=1789721011;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7nbu7B+bglE3m9s/GZRfFOgm8cRTpe/a1+eyVcACJU=;
        b=aoaC5MqwOT411P+h896CDwN4J90Zcuqwm4LA8BYIfdndXjvgPLW93MUuUodrjJ5KTx
         zuQkyaVWHcaH/RtrnJyFVzLH/urjDBxR8N4v+dkgsxouyBPikhUI0IPV9azMfYGPcJie
         3LK6LBvjF4cdWseWCl5krikLpNV71p5whOb1q6wCHfFjX5eg6PQC8oZa2LFir8/ok+Ru
         0Ex6JgVLoLgmIUKlKbfcjRxFe9ppglB/FlQPKzqk0OlBJAh6UL7boe2OkNewazsAImgy
         VaBDDjHanYkrI3JIy3RwDBLG49pnCPDMXDwT3S7RWT4f3VUbR0mEqXZ85w/1KsItUOL4
         vGBQ==
X-Gm-Message-State: AFuF++lyOgAZzD0UmYAIq/ohfGgBtwrvBxZFkEDjIkkYKSUUGr7oGSOF
	KYAyD/phdaE3pqLshKcEKomY8F3sEvzpoWKY9xMhQmsj0Xl5woLeWYi/
X-Gm-Gg: AYBFou3gYDLEHqC3+0vP8rCUnj8soZRq30nx65aLnd+TMhQuNo4DVMjIj+X9xZDcMj1
	KnlBVLR+Vhu0j9zyoKQakzsDa4/byKh10vKgpmWte1uAwnFi1WHEj3nj0sKh0+GW7Q88rKRfEIN
	Rw6Qo/n12nilnCuILTI8aAeiCgLErqXL2gKK6JB/UQhVfxbr7Y0cnUKM+MHYaNqHhchivpR69QY
	LNeScpIixXvRrHk4SMTvKqxQNEuSIUIRWl8WpEte5rK9QjrVemt0/6zeSrlEtXGpc09pPlTWR6b
	PSEdtZKuXscmZOF3tn3F6zO1hbYZxgq+5MmuDex/UY1ZpT/gUfdFKft5ouiHznZVvvkVcrdCGcg
	X1gtIwr85SmtMMlC5eQUPENydCP/TBSjvVz+/7SSQDxV3x4ZfGwARRdyLdWgn5z6XnAtd9Smn9m
	Ez5uOKAxgHg6dgpE00+NHfvT64dz2mircWzXfCf5iWVkmUXyTZ0Z3y0CO3N/uuqtW1kc8h5Gddc
	g==
X-Received: by 2002:a05:6300:6cd2:10b0:3da:e57d:4a79 with SMTP id adf61e73a8af0-3dae57d4be8mr3715040637.13.1789116211210;
        Fri, 11 Sep 2026 01:43:31 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c657156bsm813945a12.21.2026.09.11.01.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 01:43:30 -0700 (PDT)
Message-ID: <0f82c603-0ddd-4d01-bf48-56d0ffcd29b0@gmail.com>
Date: Fri, 11 Sep 2026 01:43:15 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] spacemit: k3: Replace bad CLINT node with ACLINT
 nodes
To: Junhui Liu <junhui.liu@pigmoral.tech>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>,
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Junhui,

Thanks for your patch. This would give me more clarity while reviewing
the OpenSBI patchset from Troy, and I was wondering why Troy sent this
https://lore.kernel.org/opensbi/20260908-ipi-clear-all-v1-1-b1bd5d016eb6@linux.dev/T/#u

Now it's much clearer -- K3 has two ways to do IPI, ACLINT and IMSIC.

One thing that may help us further: Can you clarify on the exact meaning
of "M-mode only"? OpenSBI would use PMP to protect those MSWI/MTIMER
regions, so I wonder if you meant that it's enforced by the PMP settings,
or it's *actually* enforced by the device itself (or fabric)? AFAIK, to
achieve this, the device must have a way to distinguish the privilege-
level of the CPU at the time it initiated the MMIO request. Hence, the
core must be putting the privilege level as some kind of attribute in the
MMIO request. Is that the case in k3? Can you confirm with SpacemiT?

On 9/8/26 09:28, Junhui Liu wrote:
> When testing OpenSBI with the upstream Device Tree, the CLINT controller
> failed to function properly with the irqchip.riscv_imsic_noipi boot
> parameter:
> 
>    Platform IPI Device         : aclint-mswi
>    Platform Timer Device       : aclint-mtimer @ 24000000Hz
>    
>    Domain0 Region03            : 0x00000000e081c000-0x00000000e081ffff M: (I,R,W) S/U: ()
>    
>    [    0.091014] smp: Bringing up secondary CPUs ...
>    [   10.104917] CPU1 failed to report alive state
>    [   20.118689] CPU2 failed to report alive state
>    [   30.132288] CPU3 failed to report alive state
>    [   40.145953] CPU4 failed to report alive state
>    [   50.159604] CPU5 failed to report alive state
>    [   60.173212] CPU6 failed to report alive state
>    [   70.186981] CPU7 failed to report alive state
>    [   70.191411] smp: Brought up 1 node, 1 CPU
> 
> Through exploring and testing, I discovered that the K3 actually
> provides all three complete ACLINT components, and subsequent
> confirmation with the vendor yielded the following information:
> 
> The ACLINT controllers are mapped to two physical memory regions:
> secure (0xf1810000-0xf1820000) and non-secure (0xe0810000-0xe0820000),
> with varying accessibility per controller and execution mode:
> 
> +---------+--------+------------------------+-----------------------+
> | Offset  | Module | Secure Region          | Non-Secure Region     |
> +---------+--------+------------------------+-----------------------+
> | +0x0000 | MSWI   | 0xf1810000-0xf1813fff  | 0xe0810000-0xe0813fff |
> |         |        | (M-mode only)          | (Inaccessible)        |
> +---------+--------+------------------------+-----------------------+
> | +0x4000 | MTIMER | 0xf1814000-0xf181bfff  | 0xe0814000-0xe081bfff |
> |         |        | (M-mode only)          | (Inaccessible)        |
> +---------+--------+------------------------+-----------------------+
> | +0xc000 | SSWI   | 0xf181c000-0xf181ffff  | 0xe081c000-0xe081ffff |
> |         |        | (M-mode only if efused)| (M/S-mode Accessible) |
> +---------+--------+------------------------+-----------------------+
> 
> Taking these constraints into account, we choose the secure region
> (0xf1810000-0xf181bfff) for the M-mode ACLINT components (MSWI and
> MTIMER), and the non-secure region (0xe081c000-0xe081ffff) for the
> S-mode SSWI component.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
> Changes in v2:
> - Drop the generic riscv,aclint-* fallback compatibles and use only
>    SpacemiT K3-specific compatibles.
> - Match spacemit,k3-aclint-sswi directly in the SSWI driver.
> - Squash the ACLINT MSWI and MTIMER DT additions into the patch that
>    replaces the incorrect CLINT node.
> - Link to v1: https://patch.msgid.link/20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech
> 
> ---
> Junhui Liu (6):
>        dt-bindings: timer: thead,c900-aclint-mtimer: Add SpacemiT K3
>        dt-bindings: interrupt-controller: thead,c900-aclint-mswi: Add SpacemiT K3
>        dt-bindings: interrupt-controller: thead,c900-aclint-sswi: Add SpacemiT K3
>        dt-bindings: timer: sifive,clint: Deprecate spacemit,k3-clint
>        irqchip/aclint-sswi: Add support for SpacemiT K3
>        riscv: dts: spacemit: k3: Replace incorrect CLINT node with ACLINT nodes
> 
>   .../thead,c900-aclint-mswi.yaml                    |  1 +
>   .../thead,c900-aclint-sswi.yaml                    |  5 +--
>   .../devicetree/bindings/timer/sifive,clint.yaml    |  5 ++-
>   .../bindings/timer/thead,c900-aclint-mtimer.yaml   |  1 +
>   arch/riscv/boot/dts/spacemit/k3.dtsi               | 37 ++++++++++++++++------
>   drivers/irqchip/irq-aclint-sswi.c                  |  1 +
>   6 files changed, 37 insertions(+), 13 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260729-k3-aclint-94ca9d3f818f
> 
> Best regards,
> --
> Junhui Liu <junhui.liu@pigmoral.tech>
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Bo
