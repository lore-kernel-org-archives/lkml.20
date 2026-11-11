Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397267;
	b=yYbe2cvMpPyhTv4S2JtDROT46p2tNmkeJZfLsWMEMlNfXolH3Ya/DpuIM+rk1FS8Gd5t
	 xn2Jy9nuMvDJ3W+phAyb4aY63g/7TUoxC+MRNrfETgnTECDzP4P3mgHTd/wex29olTvfc
	 yx52QmlTxQjZ8KNysde31ma2Lt3jhr/FQMR4/F1YQvWLDdlFIwz3fkB7Usyq0Hmnx/nRF
	 9BJ/KFdxSamsjTpG0wJXj+D513kP1EvuJNwQw/QyzEkEYMj383enj1g0AAb2OgDw4bTO/
	 EcjHMi0AAA9Vxbjdc6niik/OzB8sOR771tMjM6uoN8Ilc9KgAS9ApENaGjwqZPLsq6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397267;
	h=DMARC-Filter:DKIM-Signature:Date:Content-Type:Cc:Subject:Message-Id:
	 Content-Language:X-Original-From:To:From:References:Mime-Version:
	 User-Agent:In-Reply-To:Received:X-Lms-Return-Path:
	 Content-Transfer-Encoding;
	bh=zVvZBV6suQrnzsiHL0fsmvRL+1EnY1VOLR3pQOW7cuk=;
	b=eCDYs75O795UYLWoNeojBiYirt5D/V4ecUANvyhFuqgjzzbvJasbzcV919QY2OA1TP6a
	 1opSstfp/q7v1V/nQqPjwIGZ/v79fE2rzPmVJSSO3BvFfpPcBjeBe5ZaUNFP8zfGya6zd
	 HLKx8rUTBZtA1Uw+wgMxem1PwOvICnhU5+ldHgup877rfZIJLsrANm+L9VWWxoQOA5Hel
	 SovAQ8qnxyJ3F83+v7ySDlS+F1hk2XtzjOY/d8k1d0fvJ+QGU1N5HaCRGvoJPghHIP8HO
	 pqprETVVKmqah1Gb3ljiWcu/bP98uur+UNT0G54QJulDcnbqHsxZVBp1xEsQfLwFuZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=picoheart.com;
	spf=pass smtp.mailfrom=picoheart.com;
	dkim=pass header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=QGBSj5SW;
	arc=none smtp.remote-ip=209.127.231.27
Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B66B606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B66B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=picoheart.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=QGBSj5SW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1794397260; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=zVvZBV6suQrnzsiHL0fsmvRL+1EnY1VOLR3pQOW7cuk=;
 b=QGBSj5SWW/tNmQGgEVryANpsNR7fxnlSkJ0jMqrnww6f8/65uQub60tFUdOqVqUU7Rx4ai
 1u59gmjC+EZq7ctngGnHTsST3aCVaEuFhy0jQw+CvoU7MAZSJ+LG7HZ+GjVk+exJhoteaH
 yXnI5MCNR4Yf+w3z3+9I+XQ+VkMu60Wyc2VucAVELwKGCpwRgaoRDxosIksEhGlLbo6Rmm
 k+lcgKQ3vDbWI2i3jD1CtKKEfi62TkZts1a2Wn2j7a+mocWKtGPbCf6Fc8E8vmAbCM23s9
 34VKoZAsGmzDcb6TPvWeq+5O8D1PX5rYAox/8mObW13TXKlLB0uPXbmxKHYaqA==
Date: Wed, 11 Nov 2026 19:40:55 +0800
Content-Type: text/plain; charset=UTF-8
Cc: <yang.yicong@picoheart.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, "Len Brown" <lenb@kernel.org>, 
	"Atish Patra" <atish.patra@linux.dev>, 
	"Anup Patel" <anup@brainfault.org>, "Will Deacon" <will@kernel.org>, 
	"Mark Rutland" <mark.rutland@arm.com>, <linux-acpi@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	"Anup Patel" <apatel@ventanamicro.com>, 
	"Sunil V L" <sunilvl@ventanamicro.com>, 
	"Andrew Jones" <ajones@ventanamicro.com>, 
	"Atish Patra" <atishp@rivosinc.com>, "Nutty Liu" <nutty.liu@hotmail.com>, 
	"Yunhui Cui" <cuiyunhui@bytedance.com>, 
	"Yuanzhu" <yuanzhu@bytedance.com>
Subject: Re: [PATCH v7 1/1] RISC-V: Add common csr_read_num() and csr_write_num() functions
Message-Id: <a767f8c1-a568-42bf-8dd2-0b05d32686ec@picoheart.com>
Content-Language: en-US
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
To: "Zhanpeng Zhang" <zhangzhanpeng.jasper@bytedance.com>, 
	"Anup Patel" <anup.patel@oss.qualcomm.com>, 
	"Sunil V L" <sunilvl@oss.qualcomm.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
From: "Yicong Yang" <yang.yicong@picoheart.com>
References: <20261104161512.883885-1-anup.patel@oss.qualcomm.com> <20261104161512.883885-2-anup.patel@oss.qualcomm.com> <CACnXVnfFWF8h+o0=nSb9JESOxYsdVMO+BJKMT7t=K=XVgVwx2g@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
In-Reply-To: <CACnXVnfFWF8h+o0=nSb9JESOxYsdVMO+BJKMT7t=K=XVgVwx2g@mail.gmail.com>
Received: from [100.86.214.79] ([58.250.106.117]) by smtp.feishu.cn with ESMTPS; Wed, 11 Nov 2026 19:40:57 +0800
X-Lms-Return-Path: <lba+26af4544a+338c87+vger.kernel.org+yang.yicong@picoheart.com>
Content-Transfer-Encoding: 7bit

On 11/11/26 5:15 PM, Zhanpeng Zhang wrote:
> Hi Anup,
> 
> On 11/5/26 12:15 AM, Anup Patel wrote:
>> From: Anup Patel <apatel@ventanamicro.com>
>>
>> In RISC-V, there is no CSR read/write instruction which takes CSR
>> number via register so add common csr_read_num() and csr_write_num()
>> functions which allow accessing certain CSRs by passing CSR number
>> as parameter. These common functions will be first used by the
>> ACPI CPPC driver and RISC-V PMU driver.
>>
>> Also, the RISC-V ACPI FFH specification allows arbitrary CSR number
>> as CPPC register and the RISC-V SBI specification allows arbitrary
>> CSR number as PMU hardware counter. This means ACPI CPPC driver and
>> RISC-V PMU driver no longer need to do sanity checks on CSR number
>> which are now done by the common csr_read_num() and csr_write_num()
>> functions.
>>
>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> Reviewed-by: Atish Patra <atishp@rivosinc.com>
>> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
>> ---
>>   arch/riscv/include/asm/csr.h |   3 +
>>   arch/riscv/kernel/Makefile   |   1 +
>>   arch/riscv/kernel/csr.c      | 165 +++++++++++++++++++++++++++++++++++
>>   drivers/acpi/riscv/cppc.c    |  17 ++--
>>   drivers/perf/riscv_pmu.c     |  54 ++----------
>>   5 files changed, 184 insertions(+), 56 deletions(-)
>>   create mode 100644 arch/riscv/kernel/csr.c
>>
>> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
>> index 621f84d1898f..ebd82043430b 100644
>> --- a/arch/riscv/include/asm/csr.h
>> +++ b/arch/riscv/include/asm/csr.h
>>
>> [...]
>>   /*
>>    * Read the CSR of a corresponding counter.
>>    */
>>   unsigned long riscv_pmu_ctr_read_csr(unsigned long csr)
>>   {
>> -	if (csr < CSR_CYCLE || csr > CSR_HPMCOUNTER31H ||
>> -	   (csr > CSR_HPMCOUNTER31 && csr < CSR_CYCLEH)) {
> 
> 
> Could we keep the existing CSR range check in riscv_pmu_ctr_read_csr()
> when switching it to csr_read_num()?
> 
> The SBI PMU driver still assumes the architectural counter layout. For
> example, if SBI assigns an event to a custom counter at CSR 0x800,
> pmu_sbi_csr_index() truncates 0x800 - CSR_CYCLE to zero. The perf mmap
> page then advertises index 1, so userspace reads cycle while the kernel
> reads 0x800. The same index is used to set and clear scounteren.

I think it's an existing problem that current SBI PMU doesn't support
custom counters, but only rejects the custom counters in riscv_pmu_ctr_read_csr().
the index truncation and scounteren issue should still exist even if we
add back the check in riscv_pmu_ctr_read_csr().

but you're right that remove the check here changes the existing
behaviour and should be retained.

thanks.

> 
> Non-snapshot overflow handling and RV32 high-half reads also assume the
> architectural layout. Could we keep the PMU conversion
> behavior-preserving and handle custom counters separately?
> 
>> [...]
> Thanks,
> Zhanpeng
