Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699225;
	b=hSWB/TdPxbyFyKMoTSy+HTkSanU8jRHt57nA4vPNdZxeQ1BfWbAhebjMs8wfEDJxKYA0
	 D1qfvo4/oiQDkgnjc3fYyMmERA4owqcWVo9JjYeiohPdsJ9Px6rni2R+Av/DdAZX8dx/m
	 vu0kaVI+nqFM5Ais8st57dRvjfvpjqJqpA8ArLiH8ZpoBmiIweQzZgi0C2Dbp5h0z1fYw
	 gf+RFaM6mIcZhQ7y+7NQMDAZvwfOn0JremTs8M8+mtPZQUB2Jji25pWDiE+NtWyUr3xku
	 QmVqYeD+EXmLAmX3fU1B7O3G0aidqsZhQbF2iIN9qyeXbjxg8imkf3+zVHED19U8jLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type:Content-Transfer-Encoding;
	bh=0JBGFPPLquwWwHmBGhL2h+y4hpkquMXF6f4Dd0IfIRA=;
	b=uCKGFNuox9/pSf6X0q0yDVKZdaU/VDV7vtIBJryW8BsP0hvnJeDAuf158juCX9cl2L5y
	 rC1HZ+l5asR4NP3AN9gaB+2Zk6sBJAkZLN8fyua6H2CZO4GO4/LiN10mSXxphcvHu/rzB
	 j0RYXm1wdRXk35SfUWnLi4pV5L+B4b6isNeRdF6+lLI1dfht3xZ/5wgLlcvz7GR8MOzB8
	 ag06hKMrA0tAJW/mjjFt7HqAwnbkdr9ol9qpnPVr6mpVDsMMoqvep0rFw0MfqeNI75f7G
	 SUj9hrIct1JfntQaivGYlac/4ijrCFtZyy4gDrP4jeK7WT0L0ZOoTB2VfwtPZNsx/UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b6L2Aj81;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE144606D827
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE144606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b6L2Aj81
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a17a332ecso6030676eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699224; x=1794304024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0JBGFPPLquwWwHmBGhL2h+y4hpkquMXF6f4Dd0IfIRA=;
        b=b6L2Aj81JYNG0j3AYXRQzcnSaKwkxDIPpZxq6zx2Lea4S+scn7qFA+MO7PX1lJjgBl
         iLcwKu5NaQ1YRFeeeCDeZCO4XYNqR1YpyHTaOFsB/LHL4/8O06i8SlUdCm7gDiT6K97c
         5PibD1eiTY0cWmYG+8tl1tWXPqzVpAKvE1J6JchBcLJaubQJaOyZecNijGvACPoHtP3R
         kL7j5n5p7VR+EcuNGoD3eF7DjhF3TANIdoEjARIv6V8DcmRVJ9s6rzZAW4uUVWXEgrpj
         Ay0yt0HPo0YmxKMSZDT44J5GdlDsdPJowlZJd98SzWPH/mPx9f1VKDLUnBt/XPp/gP8U
         Grrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699224; x=1794304024;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0JBGFPPLquwWwHmBGhL2h+y4hpkquMXF6f4Dd0IfIRA=;
        b=qQLP1me9qf4hD9qUIEKqlZkbRI9DogMbEVm1qvT35JK13Cz+zNLms8p0RRGBHg4RUC
         zBkSvuOSf8/G96mMYmlqC8/VtaokKrIJOlGO7/rFWuJ4uXb6ZExkMb3zaT0sA6yphzn4
         MUoDPUTxiEO/i5VEYgX85nqn4inzJrWmVuDEgc+7PQHhL9tk18dkyFceptmXAcCufZvL
         Cob5W6T9XGoc73ZnpSMH3UuaXYTHmgTz4PqM0sYiO8IpFcyIpvIA8k6cd7SBQMAQOrUR
         fsLPTyOgljBzvWeeaaoye4T8K5Xt+hTBrg2LAvsJC9Ha32NxBBIgXbThmbEl9AYf1IZe
         G52A==
X-Forwarded-Encrypted: i=1; AKwUvBymW1eYIAyoy6aH+y4w1XtgikoSbDwL4hJ/eTQ+qJZJ1sLiS2Fd4EYQ9JDCyOaE9NbP2nHVWjU/R1O2sOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CSpkS1BoshiKpt/F8xY8aeZXSNGnnTEK732cX3lJ709TWIa5S
	gHlJSdm4Zn2Kg9avMePKb8zJSjM77h4I1WoaTqbi8TYX1GiLJm4UM73o
X-Gm-Gg: AYBFou1LNisVqzcHr95gUFbrxIk5LJOS6XG8co+vVL6cd+jJ55GfMOyN/gY6TPYdDnP
	mWh8vIDPYGfRxCTO95n17hCNbsiFdiTEv/BtilS0DKViSLgKWCudIGxn6ab9b7A1B9SYyvc1DD5
	P98lZEYNhkpFBZuEPZVh84yaY04YNpZuqG3fzgKiLwGMgVHDf8fZ7Bkba8aYStHl5GOvEvjRD1R
	inEixQucrQCxkdgZnh4mvwRT+l3l2ejvL267wNud+6M2Q0U/TaK3kndu1tl458GkewX9JmztU/P
	WG8Na+i/B7+/LHs5/AytTXNfdQu/KBifS92BepWyGvSw6cDQ53GEbLxKTXPQoVcBAfP56xy6kHl
	Ki0LvoKobiDrCbIMyXKvl8aieONvu5N/S8pf35dzDX8CMP+qon8Dizw6SmjJJw0sXbQqu9LOz8d
	JiyFYKt0+QG9UHourKXA06rJKYW0uyrd5iBtNG7VG9Hl4UozY2utXy87IDEDl3fgkYbQM3uZfgC
	yQNRR+eYABxpJa6LhLv5bT4bSgNT7487IIw9U3EAaoMNy49KOr0CTN1L++MVcqocd1Ayv9yRKLH
	I4Y1wgRhRYTaCnKCJ2ArkF3Fwsc=
X-Received: by 2002:a05:7301:6405:b0:366:83dd:4704 with SMTP id 5a478bee46e88-36a423dc7f8mr19544762eec.17.1793699223769;
        Tue, 03 Nov 2026 01:47:03 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm38668145eec.4.2026.11.03.01.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:47:02 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>, stable@vger.kernel.org, Josef Schlehofer <pepe.schlehofer@gmail.com>
Subject: Re: [PATCH] powerpc/code-patching: Flush the patch area TLB entry locally
In-Reply-To: <44406eef-0035-4d6f-a2b0-3647d7c1ea2e@kernel.org>
Date: Tue, 03 Nov 2026 14:42:04 +0530
Message-ID: <wlqu5lej.ritesh.list@gmail.com>
References: <b7916dadd8ef56d417d0cbf69fa9ef2a447a5a3e.1793674111.git.ritesh.list@gmail.com> <44406eef-0035-4d6f-a2b0-3647d7c1ea2e@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

"Christophe Leroy (CS GROUP)" <chleroy@kernel.org> writes:

> Le 03/11/2026 à 03:54, Ritesh Harjani (IBM) a écrit :
>> patching functions like patch_mem() and patch_instructions(), maps the
>> target page at the per-cpu text_poke_area, write it, clear the PTE and
>> then flushes the tlb using flush_tlb_kernel_range(), with interrupts
>> disabled. flush_tlb_kernel_range() on SMP nohash (e500) does an IPI
>> based TLB invalidation i.e -
>> 
>> 	smp_call_function(do_flush_tlb_mm_ipi, NULL, 1);
>> 
>> ...which will wait for other CPUs but with interrupts off. This can be
>> caught by lockdep with the following warning:
>> 
>>    WARNING: kernel/smp.c:917 at smp_call_function_many_cond+0x430/0x818, CPU#1: swapper/0/1
>>    CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.3.0-rc1-leds-v4 #1 PREEMPT
>>    Hardware name: Turris 1.1 e500v2 0x80211051 Freescale P2020
>>    Call Trace:
>>    [c1915bc0] [c001be04] flush_tlb_kernel_range+0x2c/0x74
>>    [c1915bd0] [c001ce2c] patch_instructions+0x1b0/0x318
>>    [c1915c20] [c003113c] bpf_arch_text_copy+0x5c/0xb4
>>    [c1915c40] [c01c3398] bpf_jit_binary_pack_finalize+0x28/0x8c
>>    [c1915c60] [c0031770] bpf_int_jit_compile+0x5dc/0x758
>>    ...
>>    [c1915dd0] [c102e114] ptp_classifier_init+0x30/0x4c
>>    [c1915df0] [c102d3a8] sock_init+0xc8/0xe4
>>    ...
>>    hardirqs last disabled at (3076): [<c001ceb4>] patch_instructions+0x238/0x318
>> 
>> Josef confirmed that this was causing a hang (deadlock):
>>      I think this is why the CZ.NIC Turris 1.1 hangs early in boot with
>>      CONFIG_JUMP_LABEL=y. On 6.18.44 it hung in 19 of 19 boots and booted
>>      fine 9 of 9 times with jump labels off. The hang comes while static
>>      keys are patched and modules are loaded, nothing is printed and the
>>      watchdog resets the board. OpenWrt keeps jump labels off on these
>>      boards for now.
>> 
>> ...which is possible if both cpus are doing similar operations with interrupts
>> off and doing TLB invalidation using IPI.
>> 
>> Broadcast TLB invalidation is not needed here since text_poke_area is
>> a per-cpu area. It is mapped and unmapped with interrupts disabled by
>> it's own cpu. The only reason I think, if we would need a broadcast tlb
>> invalidate is, when we want to prevent a stray or malicious write to
>> this cpu text_poke_area by another CPU. This generally gets solved with
>> temporary-mm path like how Radix and even x86 implements. However, booke
>> doesn't implement that, so for now let's ensure we use local tlb
>> flushing for correctness.
>
> This problem was already discussed one year ago, see 
> https://lore.kernel.org/all/PA3P192MB2865C07D634E3B775D003C7F8CD7A@PA3P192MB2865.EURP192.PROD.OUTLOOK.COM/
>
> See response from Arnd, a stop_machine() should be done for completeness.
>

I will have to take sometime to go over what ARM does here with
stop_machine(). However, either ways I think, we still need this fix,
since otherwise P2020 boards gets hung during boot. Thoughts?


>> 
>> Fixes: 49e3d8ea6248 ("powerpc/fsl_booke: Enable STRICT_KERNEL_RWX")
>> Cc: stable@vger.kernel.org
>> Reported-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
>> Closes: https://lore.kernel.org/all/20261026195644.16384-1-pepe.schlehofer@gmail.com/
>> Tested-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>   arch/powerpc/lib/code-patching.c | 21 +++++++++++++++++++--
>>   1 file changed, 19 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
>> index 44ff9f684bef..6351342fa5c3 100644
>> --- a/arch/powerpc/lib/code-patching.c
>> +++ b/arch/powerpc/lib/code-patching.c
>> @@ -276,6 +276,23 @@ static int __do_patch_mem_mm(void *addr, unsigned long val, bool is_dword)
>>   	return err;
>>   }
>> 
>> +/*
>> + * The patch area is per-CPU and only used by its own CPU, with IRQs
>> + * disabled, so only the local TLB can hold an entry for it.
>> + *
>> + * On nohash SMP, flush_tlb_kernel_range() IPIs the other CPUs and waits, which
>> + * must not be done with IRQs disabled (see smp_call_function_many_cond()), so
>> + * flush just the local kernel (PID 0) entry.
>> + * Book3S keeps flush_tlb_kernel_range() which doesn't IPI here.
>> + */
>> +static void flush_patch_area(unsigned long addr)
>> +{
>> +	if (IS_ENABLED(CONFIG_PPC_BOOK3S))
>
> CONFIG_PPC_BOOK3S not consistant with commit message. Are you adressing 
> a problem on e500 only ? on all not book3s ? What about book3s/32 ? What 
> about 8xx ? Even for book3s/64, is it correct at all when 
> mm_patch_enabled() returns false ?
>

No we are addressing the problem on all NOHASH platforms. IIUC, all
!BOOK3S are "nohash". Although some of them maybe UP, so it doesn't
matter whether a flush_tlb_kernel_range() is called or
local_flush_tlb_page() - it wouldn't matter. And on others which are SMP
but do not have STRICT_KERNEL_RWX enabled, they will anyway not go
through this path - but if they ever do - then we should ensure they too
do a local_flush_tlb_range() to avoid the same deadlock.

However, I think, maybe we could use CONFIG_PPC_MMU_NOHASH instead of using
CONFIG_PPC_BOOK3S, thoughts?


-ritesh

>> +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>> +	else
>> +		local_flush_tlb_page(NULL, addr);
>> +}
>> +
>>   static int __do_patch_mem(void *addr, unsigned long val, bool is_dword)
>>   {
>>   	int err;
>> @@ -296,7 +313,7 @@ static int __do_patch_mem(void *addr, unsigned long val, bool is_dword)
>>   	err = __patch_mem(addr, val, patch_addr, is_dword);
>> 
>>   	pte_clear(&init_mm, text_poke_addr, pte);
>> -	flush_tlb_kernel_range(text_poke_addr, text_poke_addr + PAGE_SIZE);
>> +	flush_patch_area(text_poke_addr);
>> 
>>   	return err;
>>   }
>> @@ -488,7 +505,7 @@ static int __do_patch_instructions(u32 *addr, u32 *code, size_t len, bool repeat
>>   	err = __patch_instructions(patch_addr, code, len, repeat_instr);
>> 
>>   	pte_clear(&init_mm, text_poke_addr, pte);
>> -	flush_tlb_kernel_range(text_poke_addr, text_poke_addr + PAGE_SIZE);
>> +	flush_patch_area(text_poke_addr);
>> 
>>   	return err;
>>   }
>> --
>> 2.39.5
>> 
