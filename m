Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794388532;
	b=iC58qNSP18CcRdpSXsstiw1M3fPdCalFFh4cZxpeIQVjjd0ethp3xhcaRF9boTJmMN+1
	 GHHK5XbmIrpaKM+bCV34DWiTlg+uxw9EMQGzJEXpSL9B7pZaT+e2noySum0RLQkR/6GGc
	 ajUQFsHrLMYNHp36dvbeQbLGYyLBp32yyW6wneRnrQeY3LNW7FFz2GwkZOVUuLlX+X5Mi
	 VdY04fwwqp2DmbfYhNlf5aXrXX/n12/NzHflJBv4qYtYOC3Zjj7YpZ1LWJzOziIBF199Z
	 nIaS2IzDQCkqMY64Z7BYWxOZwT+BnfNk0MFESjxwEtMNjiinglGpTSX4m58UcXMhNBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Original-From:In-Reply-To:User-Agent:References:Mime-Version:
	 Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=5QBZ8GiNGrJnUI6N35dRz2cDj8jF0y9M+l9Eb/FSxrI=;
	b=YaK9YcPVUHIsUs2IETzqyYyeKCVxu7YvmxgJONjC0gTpjNWVjJ0XDZmpiAzNXZuO61AW
	 A8l1IbJy9SC8MQNepUT0sXtg92Fb3Z2Ppg0BsdLsvulaTg2lc/0KtK0vaBV4cvFFVg2uV
	 f2G/HlZX/Gu6bJTLBDQnwX2pSwC0qpEgCa1Aewi6i4maJmJ8Q/1Z1p9sUDkVdXTBp72Vf
	 5x019Kia/zE86+MZM9jRQkv0lthggmxgaVG0sfhjzdhIr/Zc4x92TEn71hH3cFZHkWuDN
	 L5T2iZ6MyLtfyIr9PE9FF6DMofpVkT6JsFlwcHuewsARX/uQw405yjUbWFwWDDdf8yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HzNtIOeW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9488606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9488606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HzNtIOeW
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b31ca7e0bcso32910637b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:15:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794388530; cv=none;
        d=google.com; s=arc-20260327;
        b=fI4Nr0i8dZLNVD+PFSrDzgC1nKdO4XfuWh/dacXmimudbHowXX0qmKtvloLdWMw4sM
         nsjDVrQUDQhkRms0bzChsd6MRKuCOJxOQzuJQMlgmIi13NwkWROF672WdauIjtXNq7WK
         7UtIpQGWxyQILq7+MVQPgDHcDhs6d2EXX+Ylp9MUHLjVeWvMq71y/y6lGDD2dV9Y987g
         ia5wMI8k5mss6GSlMYRvePuORCh8zHELe6e2EhZ/gTtWwRJHOBdTwUUYmV+25JgS6Epp
         LqZM7LlD4qhK0d9N+6WGVcZD3JBm9Y2pA9Pp0hYh3ShVEzwRk/KVW5Swh0iVeTpxDEzN
         Lu8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:user-agent
         :in-reply-to:from:dkim-signature;
        bh=5QBZ8GiNGrJnUI6N35dRz2cDj8jF0y9M+l9Eb/FSxrI=;
        fh=RDE1JgLkEr7JIPT356CrxluzT8bR40Gitc09FNqQy5I=;
        b=Wm2YkG3Nms7rcbxd1OvCl32VWx+NPt5Zg1Z505+b3tfhokxprxyMXX2d4NYPAvjiIk
         pbvzHkzOxH+6LvUgcC0//SOK9eAKV4+j2S/qR9WmSrYOGg7pE5b71u6s8RcSOAEBWW3f
         iozDGDBlP+C8aO4YwmgFfmzEY7Bi4iwMXNbPHTPy4DZzuzBLeQA/w1c4EOOk/MVt4oSZ
         M+8IdkmD4q/ayDkozXjl56V8ytBSDvgi2BhChzRjVCdzJ2MVjXuDdDBCOV6FI5thTwod
         0gycQoCfueY9MQqX2l5ZiIn77AouSyNKmS3svXdKouAXcNNDuH6Eds1dao8LnmgOOm1v
         TXkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794388530; x=1794993330; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :user-agent:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5QBZ8GiNGrJnUI6N35dRz2cDj8jF0y9M+l9Eb/FSxrI=;
        b=HzNtIOeWviucvigYcA46hEnjuXrW/gc3E10595qDDFPFeCLhBappFbDB9jS6CtsKKt
         MkenEp+0fCDizDhWi3ULEjpMx5fEkM9evaaYQ1+b72DHc64YOnTcdZAS0zLdy08kLVAf
         tX0XYpx3jbeju02S7Tlez1urW4fP5FXcKqkZZJsMdSBPkOb3fVUmHLo/P1UXs4ts1OQ1
         jwTZ6WaaWll3BlCgs4iQGaEvcn5eX/8xI7GObzD0LLpQjLBFelv+09SRI+mrIzyWTZ71
         /Z6/cffgmQ1/8eGqUWiO53+b05sd2lOG1WINxJBprjj9Wc51N2/HWWtN7MaS4gYKnw9d
         f4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794388530; x=1794993330;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :user-agent:in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5QBZ8GiNGrJnUI6N35dRz2cDj8jF0y9M+l9Eb/FSxrI=;
        b=QVbMg9lRRRuCec25qqS4r39YHp/wSHVHkMO65/I4j1++fLHigU7+kj7QHmm8C4cT2j
         DIUg6qtnamrQs+8cUGgY5H1d2br0RbHqyXw2zt5xDgSqmbjd0mWvblIvvbRcx3CaXEcP
         x+bFzcIrrVeb6sC8aYDT54FkAKQNKugcepVpp33ZNUCGgJPcWZWDgd5Y7eqDIQXoASuB
         chpaA16d8VzK21jJQpKspxFylmhbucS15taY8yvMxNIJ72Tni0nLWoZyby/rglHtKXpi
         xKVEpRpG6EDYosh5KzHWM2t2liyQj66KNVd/4ObH371hLnf7jU1KLJa3uFzGX6LmpLo5
         iqgg==
X-Forwarded-Encrypted: i=1; AL+hErHjFsYS57TbxgipA+S9OyZpOA4ZQtuf86XIV/04dxbm5mW1eBkuEPGZbZWODgXLjoOYVIzzcm7EtliIKU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qpGg+BSndy4idMCBI0jEM4w978oZ1MfpRJn7fKOF+foQsmF7t
	GzM6g/I/oZCqbIDWfO0bjf48rjsVOTYVc+Kly0IcLqh7wKn1s5NyzyCwhUyFUqzXztvewU1xUEK
	r+iluald2tnT9/YrgHb9wHpkgsYCqGvi4wxz2p/YzJQ==
X-Gm-Gg: AYBFou33iTy+ebgPXcFdmeaAskWsL2Y4oqrBGuvQstJKHPPbaA5jjtbk/WFNtf/+8J8
	Wl0Io3jWAVt18twN35NTSnTNkLVLEcmmXOupHuDGXYSPWKDX3tCtukMZcs2vCSczkE+AvlENsK4
	rKEWT3+X8uqgwo1sAbT4IdYC1wBgNFpSVMJTKr3mBulDIq41mcfjn6HnW1x96/VBUOrYbTyZlVP
	e3TA3rU74Ub/u0oMI2FtmlMHYTvj4WLwNDpdb3xn5R6l29GhgIKUAU4cVq4Scp4x9shDKxhE/RI
	Q3sQ75cGj3TcH6pj6kBAHFB8BDa/X5jgVdXrsyZrdXjszl9IzYqSjrmThgQBEcVCFNcacUUpa3k
	UhmaNOe7zyopOPruByC1Ts+jhjxUOzSinxpsmYw==
X-Received: by 2002:a05:690c:e3cc:b0:8b3:47fd:a020 with SMTP id
 00721157ae682-8b3a81b0dd7mr18772977b3.35.1794388530362; Wed, 11 Nov 2026
 01:15:30 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 11 Nov 2026 03:15:29 -0600
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <20261104161512.883885-2-anup.patel@oss.qualcomm.com>
User-Agent: Mozilla Thunderbird
References: <20261104161512.883885-1-anup.patel@oss.qualcomm.com> <20261104161512.883885-2-anup.patel@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Date: Wed, 11 Nov 2026 03:15:29 -0600
X-Gm-Features: AclHuK9OnoLWMiiTkLADqyRKwVWpH6udmKoKB5NUgD5BSW6Guh7fRvex4qoZ3-g
Message-ID: <CACnXVnfFWF8h+o0=nSb9JESOxYsdVMO+BJKMT7t=K=XVgVwx2g@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] RISC-V: Add common csr_read_num() and
 csr_write_num() functions
To: Anup Patel <anup.patel@oss.qualcomm.com>, Sunil V L <sunilvl@oss.qualcomm.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-acpi@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anup Patel <apatel@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Nutty Liu <nutty.liu@hotmail.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Yuanzhu <yuanzhu@bytedance.com>, Yicong Yang <yang.yicong@picoheart.com>
Content-Type: text/plain; charset="UTF-8"

Hi Anup,

On 11/5/26 12:15 AM, Anup Patel wrote:
> From: Anup Patel <apatel@ventanamicro.com>
>
> In RISC-V, there is no CSR read/write instruction which takes CSR
> number via register so add common csr_read_num() and csr_write_num()
> functions which allow accessing certain CSRs by passing CSR number
> as parameter. These common functions will be first used by the
> ACPI CPPC driver and RISC-V PMU driver.
>
> Also, the RISC-V ACPI FFH specification allows arbitrary CSR number
> as CPPC register and the RISC-V SBI specification allows arbitrary
> CSR number as PMU hardware counter. This means ACPI CPPC driver and
> RISC-V PMU driver no longer need to do sanity checks on CSR number
> which are now done by the common csr_read_num() and csr_write_num()
> functions.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> ---
>   arch/riscv/include/asm/csr.h |   3 +
>   arch/riscv/kernel/Makefile   |   1 +
>   arch/riscv/kernel/csr.c      | 165 +++++++++++++++++++++++++++++++++++
>   drivers/acpi/riscv/cppc.c    |  17 ++--
>   drivers/perf/riscv_pmu.c     |  54 ++----------
>   5 files changed, 184 insertions(+), 56 deletions(-)
>   create mode 100644 arch/riscv/kernel/csr.c
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 621f84d1898f..ebd82043430b 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
>
> [...]
>   /*
>    * Read the CSR of a corresponding counter.
>    */
>   unsigned long riscv_pmu_ctr_read_csr(unsigned long csr)
>   {
> -	if (csr < CSR_CYCLE || csr > CSR_HPMCOUNTER31H ||
> -	   (csr > CSR_HPMCOUNTER31 && csr < CSR_CYCLEH)) {


Could we keep the existing CSR range check in riscv_pmu_ctr_read_csr()
when switching it to csr_read_num()?

The SBI PMU driver still assumes the architectural counter layout. For
example, if SBI assigns an event to a custom counter at CSR 0x800,
pmu_sbi_csr_index() truncates 0x800 - CSR_CYCLE to zero. The perf mmap
page then advertises index 1, so userspace reads cycle while the kernel
reads 0x800. The same index is used to set and clear scounteren.

Non-snapshot overflow handling and RV32 high-half reads also assume the
architectural layout. Could we keep the PMU conversion
behavior-preserving and handle custom counters separately?

> [...]
Thanks,
Zhanpeng
