Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793285186;
	b=iveiMrKWyToUnDA4+n+V+Im3wQkMg88T3QVmmNtjSb4rJai+hMXQlbTARPN/s9nyb3pX
	 gaQ5UplDvTHk7uyUZQNfCXwFzQ5m+MabRMHzIrQLeuiKYLbAWmKmsY6cHW+OsgQxhLqde
	 oT9JRS3ahOaDZk7MzO5ldaSqjSENKZB7UqZ/+exjT/DlRN1WxFWZhQtmG2mTT9PYo9q/d
	 3QUx4zzYW3PRgacPpbMzGZY0CkERsFhxxAVMDPxOM/X+XnDuEDMpf9pHUYRXYQeYxVEol
	 wY3vTG63O64B76qXKnYbE9VnaQ6pe/veX+BmoT9j26g7OEFiqymlONv8OJRW6Zwx3Cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:In-Reply-To:User-Agent:From:References:X-Original-From:
	 Mime-Version:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=h2unH/KWXHOOKEcsRl7AiS4RPP1kGzJaZEEy3NWnszY=;
	b=2UpbRiISEn7v4SmLF2cmeLoPqNM/GbdmU4ct4pjnzxZYEQJBmAtuL+NO3tkY0nPksdoF
	 b+HpJVR0lFimxAsDEQXD1wriRQ31cIbW8HgSiI+FRJONArRn+PM/bhxdIxUSd++LQQsOQ
	 MmUvTYmactd3Avnvl/ec2OnT9GErWEKYzU9jGwx9ZfWbMAA4q8ebgu5QDU7ZUjRtaz7V+
	 +cXM/K7nWQ7ClvRuqU3FOxYtPl96KFJyAZK4HkPkzBIsNyZN/YJfUYJT37Nj1DVkXY25p
	 yqfYcl3x4fG/nPEXxE99sveDvrjxSwcozNvKV/cU4A+t96HKkbZlwOYLGJwFUALL3Kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=dQat6ono;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A994F606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A994F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=dQat6ono
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso1829938e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793285184; cv=none;
        d=google.com; s=arc-20260327;
        b=m/nZ5cTlmmDw165cCy5qSUQqv1khTiyCd35Qw6GSYpvzVv8B/C11Hkg0j2OO9AMR72
         sGCJMq8MflQzXOrsn7CReDau5kKdAxIFu5L0dPvKmCByHlBSNim407EYk+PKySpl8hEN
         Y6t9U064ZER5ho2t1HuYlQNDu0EQwk8K1OCO9fvvp4QPstmK3nbFTnWMulHgha84/LZD
         pAgdHFW/d+xsiqT9F1TDEvnjfyI+5o/Wj8jmnRGO4HGdb3nSF0inZew20aPCSlv4eNgr
         CffipfgY+YzZV2kCEGs6mym2JHwbgJ9KxCRalJRTIFgPizc7/OwIAoja5g819KXUo3eS
         Zgsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:from:user-agent:in-reply-to:dkim-signature;
        bh=h2unH/KWXHOOKEcsRl7AiS4RPP1kGzJaZEEy3NWnszY=;
        fh=sWemSWbg6kxNf6JhCfW4IRi88oMoy1miY5wfTqsQH6w=;
        b=Ymm2jSfHPhT9x1wxI2WghFkiagep5SMg0Kt0KATII2dEpP3rj3Rqhoa7v2Z/hheQzO
         7+YJs3bWSbQ7Bk8QqC+UaKdcA+jOI/TTU+s4x8XcjvO9BCmxnCJm9Ma0Okqehz8j4Ccb
         avjsd10L1pnm3fiAVXt5c/fF23g+SL5uhxnpr0pkSB4Uo6y8Ml4Xo298VNDQKz1/b8VL
         hc8y5Qkc/zH044MOc0An2dDnZKsaWfZjTlnCmERuXYuXDK7UlmWo4lYwIo+wzeFk9I73
         d6z2qEXToShr4AcMXoFd1AH2mt1gVxm8JztTKYvCyGYo93LiGPSxTQPPwKI6J4/5Ene+
         ItZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793285184; x=1793889984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:from:user-agent:in-reply-to:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h2unH/KWXHOOKEcsRl7AiS4RPP1kGzJaZEEy3NWnszY=;
        b=dQat6onoWTNZ8G11vfnas91jE7qHYesxdxZ8lEnhtKMnXWQDdK/6HGs4mQmEK+DUSn
         DSOrCfzH81SGqvNrDIS4vS4exXIlL5DnLh9dEN2pYIm/1SxAG9o9RFX7QaCA/xScLtM3
         3KyfzZZpTy+1isaZDiIezANylB5eraZfliKVFssR21Kdc1/uSgRrlTGT4geNJTCFKpuM
         8XrjPW/5BmtQxiPcrVEatHBpgakVCxvGzxGqpruhMBsohV5ZeHbwAaqziUoNuz3c7/ai
         1fpowm1oIQF9mobL2U7KwvXUzRn07HlG6b2P31xbnLkv+vciY6xrXDw/lnnF0lf0bVgw
         Wizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285184; x=1793889984;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:from:user-agent:in-reply-to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2unH/KWXHOOKEcsRl7AiS4RPP1kGzJaZEEy3NWnszY=;
        b=N4ynVmIRLGV9FuiBaGnYZVfaEurT6dY09O1rQ/wudA3kpqzklI4knZS6QoJzNL1pzz
         oJInHBv4GwGq9PoZ+s0NVXbHTuybZeVccUvveQohhvcYbbM7txEUiXARjS9cqW65qpOV
         gHJTRwG+3BWoSgjuEMr88wPU3GLC9mBkaofG/aYO7cEISYTz7FibNrhfKYmbI6ibCSh7
         LCXaHoRoggG0co5qtuSLRQQUKJy6sJPEO18MRGTmtPNi55HdMx7u4Ou7bMIzyJpXa23N
         DIcaQXw7nxCe9y9ytBtpi26TmUZLf2Lgej2o4HTYtD+qGwQ3QaSQwLJ0Q8PWldBUPz/h
         6zwA==
X-Forwarded-Encrypted: i=1; AKwUvBwMDkbYV02oGU3mfW5/HAaaS3zgfg6ns4ho69C/QTIK+EkkAw5xNARwX8rt2EbAMJUAl03woiyAbQ8CjfY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8fHlLOhMetlfuAiCx++yOyBK0aJSQfqHU+E1hu7eieQlhCUT8
	R7Wn/WAekRYRLDbT3/oHBsVg7oP06DDQ+EMYDy0Rs3bcKG9FZJutKZ900/7OVCQ39xYO05kdAqx
	4k4xyoGNgpTmSQ7NcAvOrhfXTBld0XF3hzvyhj4E9+g==
X-Gm-Gg: AYBFou1cWWUv2hXwZTR1V2PAsd/6UT2MaREw8w2u8Yhd+QsqqPaqAkCJkHYExVPI1Kc
	fvAo8cKLtYBcEd06dCThpvS+lE3DYIM71YuMHa3gC8QtsJDGAS7a/RTUflfJOFiDEkrYkjduIVg
	sgBRPOA0xZRYXhO7IeAt6KCBAn57nZItEqeGdxh42cpPiUWTrB/+3SmEBz1c1D800B6GNg+bleQ
	rLnn/RkpRq2va9bXTlb7t6j6T+rmcVszPhnyToJYHC9Xr6rFQAqJx8KCSc1wwPtRjzjIuuGO2sO
	uQhXbxiW0wT+UrYs/hJUC7a8KfEXdp87HRR+wR1qkKc3bHCLrngOu0CVrcZXmsXA2c9ytqqQgom
	oYy29yqgh7HTcvwy3ef2dwjA+83+XDAgKh3fo
X-Received: by 2002:a05:6512:39d1:b0:5be:5394:162d with SMTP id
 2adb3069b0e04-5bfcad0187bmr2218416e87.3.1793285183781; Thu, 29 Oct 2026
 07:46:23 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 07:46:22 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 07:46:22 -0700
In-Reply-To: <auNOqR9xm3XMJcFN@hu-himchau-blr.qualcomm.com>
User-Agent: Mozilla Thunderbird
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
 <20261029074853.35467-3-zhangzhanpeng.jasper@bytedance.com> <auNOqR9xm3XMJcFN@hu-himchau-blr.qualcomm.com>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Date: Thu, 29 Oct 2026 07:46:22 -0700
X-Gm-Features: AclHuK-zJlvKOh1yAp6a7dQAN71cSzK9kF4Z01Nrh3d3tl8aCmmywHrd8FEXpMA
Message-ID: <CACnXVnc6QgXfGjNWHGD_5_zNH9hjZ-Fartj8ZCwmtHDV4zt7cA@mail.gmail.com>
Subject: Re: [PATCH v12 02/11] riscv: add support for SBI Supervisor Software
 Events extension
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, 
	Anup Patel <anup.patel@oss.qualcomm.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Atish Patra <atish.patra@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, yuanzhu@bytedance.com, yang.yicong@picoheart.com, 
	yang.susheng@zte.com.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On 10/29/26 9:48 PM, Himanshu Chauhan wrote:
> Hi,
>
> On Thu, Oct 29, 2026 at 03:48:44PM +0800, Zhanpeng Zhang wrote:
>> From: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
>>
>> The SBI SSE extension allows firmware to notify supervisor software of
>> events that must be delivered independently of normal S-mode interrupts.
>> Firmware saves the minimal state required to enter the supervisor handle=
r,
>> and Linux builds the synthetic handler context around it.
>>
>> SSE can arrive while Linux is already in an exception entry path. At tha=
t
>> point sscratch and tp may be in the middle of the normal trap-entry
>> exchange, so they cannot always identify current. Store current in a
>> per-CPU slot and use the hart ID passed by firmware to recover it.
>>
>> Give each event, including each CPU instance of a local event, a dedicat=
ed
>> stack and shadow call stack. Synchronize vmapped stack ranges before
>> unmasking events so that the handler cannot take a vmalloc fault while
>> running in an NMI-like context.
>>
>> The handler is a synthetic supervisor episode, but completion must resum=
e
>> the context interrupted by the SSE. Preserve stvec and, when the hypervi=
sor
>> extension is present, hstatus across the handler. Read the interrupted a=
6
>> and a7 values from the SSE attributes, construct pt_regs for the
>> interrupted context, and write back any changes made by the handler.
>>
>> Nested exceptions on the SSE event stack temporarily replace both
>> TASK_TI_KERNEL_SP and TASK_TI_USER_SP. Preserve their original values
>> across the handler and restore them before completing the event, so a
>> nested exception cannot leave the interrupted task referring to the even=
t
>> stack.
>>
>> On RV64 with an MMU, early trap entry also uses thread_info.a0/a1/a2
>> as scratch slots before saving the full register frame. An SSE handler
>> can interrupt that window and take a nested fault which overwrites the
>> same slots. Preserve them in already-saved callee-saved registers and
>> restore them before resuming the interrupted entry path.
>>
>> Disable preemption while initializing the per-CPU entry-task slot.
>> CPU hotplug callbacks run in a preemptible thread, and this write
>> happens before the guards around the local SBI operations.
>>
>> Compile the stack TLB helper only for VMAP_STACK or SHADOW_CALL_STACK,
>> its only users, to avoid an unused-function warning in other builds.
>>
>> Keep an explicit EVENT_REGISTER not-supported result distinct from other
>> firmware failures. This lets clients select another delivery mechanism
>> only when firmware has positively rejected the requested event.
>>
>> Link: https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm=
.com/
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202610020009.P3ILnDi1-lkp@=
intel.com/
>> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
>> Co-developed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
>> Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
>> Co-developed-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> ---
>>   arch/riscv/include/asm/asm.h         |  14 +-
>>   arch/riscv/include/asm/scs.h         |   7 +
>>   arch/riscv/include/asm/sse.h         |  82 +++++++++
>>   arch/riscv/include/asm/thread_info.h |   1 +
>>   arch/riscv/kernel/Makefile           |   1 +
>>   arch/riscv/kernel/asm-offsets.c      |  14 ++
>>   arch/riscv/kernel/entry.S            |  14 ++
>>   arch/riscv/kernel/sbi_sse.c          | 251 +++++++++++++++++++++++++++
>>   arch/riscv/kernel/sbi_sse_entry.S    | 237 +++++++++++++++++++++++++
>>   9 files changed, 618 insertions(+), 3 deletions(-)
>>   create mode 100644 arch/riscv/include/asm/sse.h
>>   create mode 100644 arch/riscv/kernel/sbi_sse.c
>>   create mode 100644 arch/riscv/kernel/sbi_sse_entry.S
>>
>> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
>> index b8bf842d4c1..e1196caea02 100644
>> --- a/arch/riscv/include/asm/asm.h
>> +++ b/arch/riscv/include/asm/asm.h
>> @@ -91,16 +91,24 @@
>>   .endm
>>
>>   #ifdef CONFIG_SMP
>> -.macro asm_per_cpu dst sym tmp
>> -	lw    \tmp, TASK_TI_CPU_NUM(tp)
>> -	slli  \tmp, \tmp, RISCV_LGPTR
>> +.macro asm_per_cpu_with_cpu dst sym tmp cpu
>> +	slli  \tmp, \cpu, RISCV_LGPTR
>>   	la    \dst, __per_cpu_offset
>>   	add   \dst, \dst, \tmp
>>   	REG_L \tmp, 0(\dst)
>>   	la    \dst, \sym
>>   	add   \dst, \dst, \tmp
>>   .endm
>> +
>> +.macro asm_per_cpu dst sym tmp
>> +	lw \tmp, TASK_TI_CPU_NUM(tp)
>> +	asm_per_cpu_with_cpu \dst \sym \tmp \tmp
>> +.endm
>>   #else /* CONFIG_SMP */
>> +.macro asm_per_cpu_with_cpu dst sym tmp cpu
>> +	la    \dst, \sym
>> +.endm
>> +
>>   .macro asm_per_cpu dst sym tmp
>>   	la    \dst, \sym
>>   .endm
>> diff --git a/arch/riscv/include/asm/scs.h b/arch/riscv/include/asm/scs.h
>> index 023a412fe38..0d70a35bc01 100644
>> --- a/arch/riscv/include/asm/scs.h
>> +++ b/arch/riscv/include/asm/scs.h
>
> This patch doesn't apply on v7.3-rc7. Did you rebase on it?
> b4 shazam failed at this patch in scs.h file.
>
> Please check.
>
> Regards
> Himanshu
>

V12 uses a5ae1bf65cee, the same base as Anup's v11 and still the current
riscv/for-next tip, as Paul requested.

rc7 has an additional scs.h change that causes this conflict. Could you
please apply the series on a5ae1bf65cee instead?

>> [...]
Thanks,
Zhanpeng
