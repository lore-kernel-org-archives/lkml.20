Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794369073;
	b=r2txVHFddKn3QKC7vUzUdrbPb2lNQpnkAwDkZhdiDskuWQNsa3xpP0wluA2Be/kcuC0y
	 S2XRa4ibDITjyZyqpVowi25GGaIghcC1Z+HU9FfPNkBA28LvqtADnz0+q/p8umXMJdb+A
	 L0rTKR+4KJ3VbG1Z33nDzuPBCvc/T9mL5R3redLjsANmzS0n2kGnuWfrW7kughzXgP2zz
	 sAx7YKdkDbaabL9mziysPLw098N3OrYAwXQK31ZkTdO4J62327ITQg7A3kDMGrzg4FFu2
	 OlPTpjdF8lE/KPtQCFikoquEyU5m63YVgHZOPuXx/wgz+RZWKyFp6m5IiYfQdFQb+Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=HvaacBMlWwgNBh4QAndXTXTObG2KN5tcLo6cqns2s2w=;
	b=mj2uiIOaYpgi3Dw4DehOWrxeAhZMRnVmj9EH7T824WU49FU+4YglSwWoMy0BQE2x65Nx
	 QPNInJ7/1uNZxouf/iOJ9vRg7bmlPh2ZZ1aiZsK5w5cIMrwJxZP2EqARJCMmk9RUCZryx
	 qh1Lin7B8AmfZXmj1bju1iR+MkcOFvRVQA2MI8RChBbjTJdwEbpGOVpbrkyCSlIuElK9n
	 lToAhHcbqf0NecVmvF9Za4iSXXMMMDptTFLn0IG2fpDGRh1XVDasbS011gLpM3ftB1CiI
	 uA02xZKKqWNjdTJibDacVsyKPl8uyMpuza2MUXmMQuxt3qRySq2TrJCYyMOdl7/ptpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OrKRhump;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47529606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47529606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OrKRhump
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3720addb068so5008527eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794369072; x=1794973872; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HvaacBMlWwgNBh4QAndXTXTObG2KN5tcLo6cqns2s2w=;
        b=OrKRhump4qg1MOsNSfIBqAMihddOwcxSCwhtcCyuUuzOs9/klzMsbS/3H6VkEQc3Ds
         tqASKz75bcd9YCG6lGgGYY8IwbMzJjl9DkuMNCThBsgB1Au8ANjO/LahSyHORAhpE6+4
         p9Iil65wqMZl8jHUe1MCbJdBqdh5O5vbHS9HZLM8QB1W1y/flIMzN86FPTaF329XGBSs
         Sv81VdTnvBxsy+PsE3xiU0PNYcanvb8L3GAVPZSYyuP9XBHtPdW2gFUKfNx/MeRmcBwW
         XRLgbnpVtPinktR9a8UlBUR4JfP7W5iNUd5s2VM8yYH2iMZhN177r8mt6Tj0YXUIoCtq
         3RfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794369072; x=1794973872;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvaacBMlWwgNBh4QAndXTXTObG2KN5tcLo6cqns2s2w=;
        b=axJe0Rxj8YUoN3GryNThVecSSaezc0SPY4RCCTV0JGXcmB80ukd9bEIl7nlvKIUPLm
         CPfFrG5JScWkar8GLz02YgLtpEmno6H2movQDd4UDTYwG0toantDW9Kfz8gSGG+h+KM4
         7cHv5JgaRkU+xg1FfpWuJWRV88kGitfLLRPIvuS5ay5YccyeOmCCc1mKDv19KrpyWhzS
         JFWLsmWugHjI8zNUBrwIHaMrqBqcDLd398xRqtonkiZ989MbC9XQuR9GnxhEVDzMmj2W
         5qDSOWeUowKJLXXBjReZOOUZv6VaDiLbCvmmp5LqrLnLvmEcnsBxa2FBxL1llwfLbdWh
         v3ZA==
X-Forwarded-Encrypted: i=1; AL+hErH/FNvlVji52NuajJ+jn+xKrn8z1zKzZGnGyv3ThXfhDGOn87iSLZnCrE30uAQmFqdulUqs/NE2mZ90fz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UdZ1OvMo2y/bdSSS9g6OGc4j+POVkeTFVCHad4o9kyHXefqSb
	GdXeEVLxJ/ITeSyryyEws2uPdzgKqGAm3uAYvMy7GSow3l5tc00SWG/T
X-Gm-Gg: AYBFou0rdr3xnBXrNcTPQ0ZTUcHni5AEF3MxWT61aEbE9luItYP0Yap7NTyWLQ51cJF
	fX9zY0dxtu3B6xxVuTUcX+7ueTcFjyaSQ2JCx7Zfz3I6hGVwjvQccRETYFCi5FiOTAwu0yoV8Nz
	3spT6UFo4QElKtNb4541IwuhCniwm2+lPSC9E514MC0SEVsHEUIycedOn34u1kw6T6Ix9op7J+z
	LuYvKRpmFhlHAJdtefFpYpiiYaNiMqmuSe+FVMaq7wAfq8uM4qW+uBDIe3esLTULAEcx+hkqCyr
	vMSfRS02EEU46Z6ToDJ3eN4Z6x3thbtLJytPAwkYD7U41pBCIIxB077sLb5sLioujG5m7i/Igxn
	FHbDX0OMyQc8zOFHIbDS2aZXC72jqE2R3kHhJ4ubHfXG0MSOJlOMg2w1bG2Mts00SJECeLcGNHO
	pwnpsITlx00mbo4xtzqcVOCYDRo6ZPI84E8Kr7bjnS8a/VHm4GemAmwEmEwNcTGP3md2V/TC4iM
	0zlm4L7XAx6vHEQmLDo/vIAEGvvAFIl1e/7ARsZemJ7Ay2XeaaSwDCmP8N8zQA1t+0H2yCe0kdy
	Rht6wgZkcAq5v2ooah1WSF/19HY=
X-Received: by 2002:a05:7300:8a19:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-376854b7fbamr1628661eec.8.1794369072223;
        Tue, 10 Nov 2026 19:51:12 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe3261csm10158221eec.4.2026.11.10.19.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:51:11 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Bradley Morgan <brads@mainlining.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Christophe Leroy <chleroy@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, brads@mainlining.org
Subject: Re: [PATCH] powerpc32/modules: Reserve a PLT entry for ftrace_regs_caller
In-Reply-To: <20260923175631.235276-1-brads@mainlining.org>
Date: Wed, 11 Nov 2026 09:18:41 +0530
Message-ID: <jymk81uu.ritesh.list@gmail.com>
References: <20260923175631.235276-1-brads@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Bradley Morgan <brads@mainlining.org> writes:

> Commit 7dfbfb87c243 ("powerpc/ftrace: Activate
> HAVE_DYNAMIC_FTRACE_WITH_REGS on PPC32") made count_relocs()
> undercount the PLT entries the loader
> consumes: module_finalize_ftrace() now creates two trampolines
> (mod->arch.tramp for ftrace_caller() and mod->arch.tramp_regs for
> ftrace_regs_caller()), while count_relocs() reserves only one entry
> for ftrace.
>
> So the core .plt ends up one ppc_plt_entry (16 bytes) short. The
> walk in do_plt_call() scans for a free slot with
> "while (entry->jump[0])" and has no bound check, so once the last
> reserved slot is used up, the walk steps past the end of the section
> and patch_instruction() writes the 4-instruction trampoline into
> whatever module memory follows the .plt.
>
> Count the second entry, mirroring what module_64.c does for the same
> pair of stubs.
>
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  arch/powerpc/kernel/module_32.c | 3 +++
>  1 file changed, 3 insertions(+)
>

Do we also need fixes and stable tag here?

Fixes: 7dfbfb87c243 ("powerpc/ftrace: Activate HAVE_DYNAMIC_FTRACE_WITH_REGS on PPC32")
Cc: stable@vger.kernel.org


-ritesh
