Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794345760;
	b=fF/Ld9dv8GvIsMg1YrCsWl1CTOWHnLR5JNsvIKFkGx+h755VgTHIhxILl1BH2DJhLQZp
	 bmiNdmKoRbmeV4BjkhOPBxQz0z7xu/uamjDsrvc5pe0dP6vUWAmPVx1S/CeFeU3I0aILT
	 reZGhx27ouvicdlq644ytjeJMvHRwNFaqhiNqgMx1DdMZh/YUk0sJoAFnXkUpOnM5rIBR
	 jHyF54/5PSGBxr0FXsPIN6AFZgBNHii5q6MBAHbxMbO3fZTP6VaLX/Ae3f6KL2KLOfwtI
	 c+Pc9BHo269oIS1A2t04fU5YMqkWPIeUusamzFkQ60U3Y+fklVqeFF+P8ui5kBZvb1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794345760;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=biwkDAkhrSVkft1MaQo1t5KVNSxdEdz7Z7B6JVIMvak=;
	b=O9i2FvR0Urkg2+HiI1thWYabRT4vlWzWTOlTrfkWIm6bxFgiv7gD3TgdfAipYmRMzL0D
	 CeM4j+O+nI7voE06cvjhMmjBz/TgfdGc1WmRru2fRKYPt5DQrOonzhNxaGIV5o39x1ZOb
	 5ll87YfqqGB1D/I9Pr9y8+nkBiQ5SQYPmz/24217lh7scz9UUg2gSq7WB4l4L2Ria6ElU
	 9Xye6wcpj2/XvqXwSNrqbA5vRruqH6spl4BPBvnZ9loy2UQF6uDXhnxrvs4q1xWpbFtp+
	 dSUTttEO9J84LRp0q4r1ay9FBKWi39IKPWeR/pjt7D7t0PWbt5U3rmGyANqBjROb2zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="xZcLWH/1";
	arc=none smtp.remote-ip=95.215.58.170
Received: from mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0AA606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B0AA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xZcLWH/1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JqxqGip0H/iVwtmJNlw71uL3W6XGftaGigDng0GTLUc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794345756; v=1; x=1794950556;
 b=xZcLWH/1+7uL6f37x8+KFn0mGXNJLVyHdNuZLCsdotfPw8t9xKpaszyyYlYiyeqxPwtVXAHz
 kF+UC8oAG+N9EoURvsHYfJCfYPCWLE+Era9By8Cwgx+wl4v+9Xj85RoDvZk/0dQqaGxhskqS+LF
 P3ZcrmQB30MQTCLcSSPl4gi8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 756820372af72f57;
	Tue, 10 Nov 2026 21:22:36 +0000
X-Mizu-Trace-ID: 756820372af72f57
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 21:22:32 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: chleroy@kernel.org
CC: brads@mainlining.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, ritesh.list@gmail.com, sshegde@linux.ibm.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_powerpc32/modules=3A_Reser?=
 =?US-ASCII?Q?ve_a_PLT_entry_for_ftrace=5Fregs=5Fcaller?=
In-Reply-To: <e89ab6eb-2fd3-4638-a3a9-fef406478435@kernel.org>
Message-ID: <70954FB8-713D-4ACA-B176-03E335F00C33@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 10 November 2026 08:57:28 GMT, "Christophe Leroy (CS GROUP)"
<chleroy@kernel.org> wrote:
>
>
>Le 23/09/2026 à 19:56, Bradley Morgan a écrit :
>> Commit 7dfbfb87c243 ("powerpc/ftrace: Activate
>> HAVE_DYNAMIC_FTRACE_WITH_REGS on PPC32") made count_relocs()
>> undercount the PLT entries the loader
>> consumes: module_finalize_ftrace() now creates two trampolines
>> (mod->arch.tramp for ftrace_caller() and mod->arch.tramp_regs for
>> ftrace_regs_caller()), while count_relocs() reserves only one entry
>> for ftrace.
>> 
>> So the core .plt ends up one ppc_plt_entry (16 bytes) short. The
>> walk in do_plt_call() scans for a free slot with
>> "while (entry->jump[0])" and has no bound check, so once the last
>> reserved slot is used up, the walk steps past the end of the section
>> and patch_instruction() writes the 4-instruction trampoline into
>> whatever module memory follows the .plt.
>> 
>> Count the second entry, mirroring what module_64.c does for the same
>> pair of stubs.
>> 
>> Signed-off-by: Bradley Morgan <brads@mainlining.org>
>
>I would have had a preference for something similar to commit c12cfe9dee07
>("powerpc/module_64: Convert #ifdef to IS_ENABLED()")
>
>Nevertheless,
>
>Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Thx, now the good question will be, who merges?

>
>
>
>> ---
>>   arch/powerpc/kernel/module_32.c | 3 +++
>>   1 file changed, 3 insertions(+)
>> 
>> diff --git a/arch/powerpc/kernel/module_32.c
>b/arch/powerpc/kernel/module_32.c
>> index f930e3395a7f..61152deffc55 100644
>> --- a/arch/powerpc/kernel/module_32.c
>> +++ b/arch/powerpc/kernel/module_32.c
>> @@ -41,6 +41,9 @@ static unsigned int count_relocs(const Elf32_Rela
>*rela, unsigned int num)
>>     #ifdef CONFIG_DYNAMIC_FTRACE
>>   	_count_relocs++;	/* add one for ftrace_caller */
>> +#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>> +	_count_relocs++;	/* add one for ftrace_regs_caller */
>> +#endif
>>   #endif
>>   	return _count_relocs;
>>   }
>

--- Thanks!
