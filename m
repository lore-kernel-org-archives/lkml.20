Received: from mta0.migadu.com (out-153.mta0.migadu.com [91.218.175.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBDB40488C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789442511; cv=none; b=H6FU2tV1I2WI5lNKv1POHK/HWfXoc9KrvENpTrXlOTHEMRt09pvbGxBIJdtDCCrdKa0Epu1YEBahY1Z36kVX6Oi2bbRj1ygtybifXA3kDGrHlNdTAuNmgoj4HRn69ZPIhLUpyUx5H23V0AdMV0yQ+/teHOC4jpB+93IW7fByJ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789442511; c=relaxed/simple;
	bh=y/OtVCA6wyffOTm7nVE84OZqq0f/muSgEVkAYUjs39A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Awco6dHLAgcs7gc6cFaWqfssS09SvjLJ3IBnYtVfANf6urgwCa14AfnRof60HfKGqSLY8PaPWKbJSY4xqnXaK0hf5hP3RgpoQlOTI+xL68b04pllFa1kzKA99Mi/OauGNMv9El4th3PFgIs9PkRC3ahm2GA1vwGfghPq8TJSJ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xh/0BQWH; arc=none smtp.client-ip=91.218.175.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xh/0BQWH"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=y/OtVCA6wyffOTm7nVE84OZqq0f/muSgEVkAYUjs39A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789442506; v=1; x=1790047306;
 b=xh/0BQWHnnUyEsn/rqCgiUVNnleVAxCgx5ZKbGBft7eZJl1lhACLlQmo/KVRuESSRjgbsJwP
 JoVkZAHnuJ/Zy8zIm5qKkG7KMqsvNA5Zg+oLIj1mnkB7/2j3IjRH8eB8HSuP7djkDGgrgzV+DTU
 A1aQb+LV+moNFaNnYYsCN5FE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f2615d5adab7b479;
	Tue, 15 Sep 2026 03:21:46 +0000
X-Mizu-Trace-ID: f2615d5adab7b479
X-Migadu-Flow: FLOW_OUT
Message-ID: <2cd4868b-05b1-4f3c-992a-3bed5afd0abf@linux.dev>
Date: Tue, 15 Sep 2026 11:21:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] riscv: Introduce support for hardware
 break/watchpoints
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
 linux-riscv@lists.infradead.org
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, palmer@dabbelt.com, pjw@kernel.org,
 shuah@kernel.org, linux-kernel@vger.kernel.org, thecharlesjenkins@gmail.com,
 jtaubepe@redhat.com
References: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com>
 <20260803134913.2013674-2-himanshu.chauhan@oss.qualcomm.com>
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <20260803134913.2013674-2-himanshu.chauhan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 2026/8/3 21:49, Himanshu Chauhan wrote:
> +#define MEM_HI(_m)	((unsigned long)upper_32_bits(_m))
> +#define MEM_LO(_m)	((unsigned long)lower_32_bits(_m))
> +
> +static int arch_smp_setup_sbi_shmem(unsigned int cpu)
> +{
> +	union sbi_dbtr_shmem_entry *dbtr_shmem;
> +	phys_addr_t shmem_pa;
> +	struct sbiret ret;
> +
> +	dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
> +	if (!dbtr_shmem) {

per_cpu_ptr() never returns NULL, so this check can be removed.

> +		pr_err("Invalid per-cpu shared memory for debug triggers\n");
> +		return -ENODEV;
> +	}
> +
> +	shmem_pa = per_cpu_ptr_to_phys(dbtr_shmem);
> +
> +	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
> +			MEM_LO(shmem_pa), MEM_HI(shmem_pa), 0, 0, 0, 0);

The ABI takes lower and upper XLEN bits instead of fixed 32 bits, so 
this will break on an XLEN == 64 system and a physical address >= 4GiB.

#if __riscv_xlen == 64
#define MEM_HI(_m)    0UL
#define MEM_LO(_m)    (unsigned long)(_m)
#elif __riscv_xlen == 32
#define MEM_HI(_m)    (unsigned long)upper_32_bits(_m)
#define MEM_LO(_m)    (unsigned long)lower_32_bits(_m)
#else
#error "Unknown __riscv_xlen"
#endif

> +
> +	if (ret.error) {
> +		pr_warn("%s: failed to setup shared memory. error: %ld\n",
> +			__func__, ret.error);
> +		return sbi_err_map_linux_errno(ret.error);
> +	}
> +
> +	pr_info("CPU %d: HW Breakpoint shared memory registered.\n", cpu);
> +
> +	return 0;
> +}
Kind regards,
Qingfang
