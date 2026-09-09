Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C62652B1C6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950372; cv=none; b=dr0epIfHufQyrkuY3h4wJz5JNqL6KLTAHeGDCXYsCO0vlCW3NtBZcP8v61w+4+8zKpo5ji5Cd2+av2SqM/KfbJZ8T+1NCiFLrOkSA6tmFSXoPJx1EKDtHNQQFX9AMR3ggkDQN/fx/1qau8XeNDxNkoK8IuM71nuqckfOxQTsMZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950372; c=relaxed/simple;
	bh=vNI2Ak4htqKNBE48KOxpfdiqt1p3zXAgNTQmXitTXb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l/OSFyA/cwciSJczU9eJPOyq9neRhodwBGYMiK/0GU3DByx1G6Y5tCVrN8FfOHN7Nful1JXsfXzkszRbgZ+Z18VdzK8JqInOoFxc5tW2jrOKRjHo5gOZIHp8rPiXBmTtlDTFLwywY/IOXzwrCMqxz4KG+vFU0vP+PUUS9Sg17Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Hyq5DsKW; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Hyq5DsKW"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D7A71691;
	Wed,  9 Sep 2026 03:39:26 -0700 (PDT)
Received: from [10.0.152.207] (unknown [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B84BF3F528;
	Wed,  9 Sep 2026 03:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788950369; bh=vNI2Ak4htqKNBE48KOxpfdiqt1p3zXAgNTQmXitTXb8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hyq5DsKW2ovGYbyYSuSgXxM7/0DFNyHt0tkHaZUn1P42F6DTssmR2zu+UmXGnjyxl
	 g0u8bMryXOQC/RB15nqHOjxbaOjIgeeqwSc27qk4hNHsOcQ1rj/S8W/WWhzz4IXTIk
	 YHg3VQKIcZ7mR+ckUQebn0vhHMZvYBc/vD45QHVw=
Message-ID: <40954731-a235-4877-b615-7a3f66f1b039@arm.com>
Date: Wed, 9 Sep 2026 11:39:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/21] arm64: Move overflow sp into SP_EL1 and kernel sp
 into SP_EL0
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Ard Biesheuvel <ardb@kernel.org>, Ada Couprie Diaz
 <ada.coupriediaz@arm.com>, David Hildenbrand <david@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>,
 Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Will,

On 9/7/26 17:42, Will Deacon wrote:
> Hi everyone,
> 
> This series is a bit of a complicated juggling act that, on its own,
> doesn't achieve an awful lot. However, it lays the ground work for
> sizing the kernel stack at runtime, e.g. via a cmdline option or even
> potentially on a per-task basis and so I would like to work towards
> getting it merged independently.
> 
> The series is based on v7.3-rc1 and structured as follows:
> 
>   * The first 9 patches move the 'current' task pointer from SP_EL0
>     to TPIDRRO_EL0.
> 
>   * The following 8 patches point the newly-freed SP_EL0 at the overflow
>     stack and switch to it explicitly when we detect a kernel stack
>     overflow.
> 
>   * The final 4 patches turn everything on its head, so that the
>     overflow stack and kernel stack are swapped, with the former now
>     residing in SP_EL1 and the latter in SP_EL0.
> 
> At the end of all that, when we take an exception from EL1, we are
> immediately transitioned to the overflow stack (now renamed "exception
> stack") and can push registers right away. This also means that using
> SPINTMASK to control NMI masking becomes a possibility, although
> speaking to Mark, Vladimir and Ada, they all seem to prefer ALLINT.
> 
> Mostafa will soon post a follow-up series that allows the kernel stack
> size to be specified on the kernel cmdline, which we are hoping to use
> to configure an 8k stack size in Android. I will be talking more about
> all of this at LPC in the Memory Management MC:
> 
>   https://lpc.events/event/20/contributions/2419/
> 
> Cheers,
> 
> Will
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Mostafa Saleh <smostafa@google.com>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> 
I gave it a try and I observe splat:

Unable to handle kernel execute from non-executable memory at virtual address ffff000970e81148
Mem abort info:
  ESR = 0x000000008600000f
  EC = 0x21: IABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x0f: level 3 permission fault
swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000008129f000
[ffff000970e81148] pgd=0000000000000000, p4d=18000009f1dff403, pud=18000009f1079403, pmd=18000009f0ef1403, pte=00e80009f0e81707
Internal error: Oops: 000000008600000f [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.3.0-rc2-7fb054f87+ #3627 PREEMPT(lazy) 
Hardware name: Generated (DT)
pstate: 1634023c9 (nZCv DAIF +ALLINT +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : 0xffff000970e81148
lr : 0xffff000970e81148
sp : ffff000970e81150
x29: ffff800080f85fc0 x28: 0000000000000001 x27: 0000000000002000
x26: 0000000000000000 x25: 00000000000000c0 x24: 0000000040000023
x23: ffff800080c0e1d8 x22: 00000000000003c0 x21: ffff800080b58300
x20: cfa2800080b58300 x19: 00000000200003c0 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000028
x14: 0000000000000000 x13: ffff8000814f3ac0 x12: ffff8008efcac000
x11: b2000c3eb474d99d x10: 0000000000000008 x9 : 0000000000001000
x8 : ffff800080010800 x7 : 055001f2b5503510 x6 : 0000000001310000
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff800081502d80
x2 : 0000000000000802 x1 : ffff000800106a70 x0 : 0000000000000001
Call trace:
 0xffff000970e81148 (P)
Code: 00000000 00000000 00000000 00000000 (00000002) 
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Oops: Fatal exception
SMP: stopping secondary CPUs
Kernel Offset: disabled
CPU features: 0x0,00000000,034bfc7d,ff728b42,7ffce667
Memory Limit: none
---[ end Kernel panic - not syncing: Oops: Fatal exception ]---

I suspect it is related to power management, since it can be triggered
with the sleep command, though I haven't debugged it. I noticed that
Sashiko has reported issues related to suspend/resume, so if you
provide fixups for the relevant commits, I can give them another
try. Otherwise, I'll wait for v2 :)

Cheers
Vladimir
