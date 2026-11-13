Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590109;
	b=5QQnWTYUGNz+MIt9zLA19WaqYjThkTR4o32L9IB7oCKaLx3mgxM4lltngGI+xbPOOYYn
	 zCDRAjYSOI+syr48JifY6yJN21L1me8yMZOmKtaMaGoODe2+yDOEPBHkmyiwjkfCGNczk
	 EfCW80nPnoFT0i6ZsSDU0fESusImySz1jIUyfQwKEAVA9VD3ZTrTA+vV4EwLnLpeZBQCt
	 LdR1woyLIclKv+Sn/zLzV616q1tSvI12mMz9Xd6OoG761dT/JBH+sou2MV6qVi6gmZcLB
	 gIVP3n6s1caR01/y6oy91bjRJn4foXyNxhgFPF33AXWn9099PKVfD5pqfHH+CUuqgeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=TJaikHgxJ0Cfj902txSyNLryimhDtp9xIHKHj6RuZzg=;
	b=LlnJya8h6i4xPkPjn9wYDz/p6nRCBoIexA1b/9+h6dhD6TTcc/aun8R7ZH4w+ZuTnEdL
	 K0Na5hj8ja4KtR6UYRQwtv9onSTchaEh2GvbPrx1oujSQ8s/u8K+r5uhJc94OQ1C5LoHs
	 z5dgL/Zcfe1prHllnBpWvWpoJFeN1xwEgkFN/RlA4IWo3nar4o/p/92sfvmyejeTPyNCv
	 28aP3vIsZMAOEDBSkn6SPQAs7DMJXgLd5oe0D2WJQS88JFQf6ZyZEuU/+AHLzDbUgV4ge
	 sDrciMNN3A82/PA1eei+vMCBA1mlsaRQ8P+r+LemxP7iPxKOsSbLRsJ5bLMSsWtgs1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XlJa3P+V;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809F3606B200
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 809F3606B200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XlJa3P+V
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3b4944abeso157509c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794590109; x=1795194909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJaikHgxJ0Cfj902txSyNLryimhDtp9xIHKHj6RuZzg=;
        b=XlJa3P+V1CGQ/cuiUm4lc7wiEge72cZrg28BycoQJVcJvnvxPuHOXs0s89ppNSq7cq
         KbGid7lOM8ooFynmwNbHbCk9/Y1beu/P89WtAjjGT/WRRpa3DtZKvM6Sbj8jQKK1lEXd
         kh1xG2bZYvyX1QcVjONz4lpxvMU3ue+JnfLJgiQ2Q2plcsqisiv3lUx57xaanJMnWRq7
         Lwp9FMbZfpv2I0hgBXDGZQD8oNGHOjUqkOz5U/0NkM+iy1M+K7517/r9J9EjuX5PezEr
         vG0MnadiHZI0wo+AxWtJ8GOxwBcr2FSBTz2rB+9kIIN/JoUtpjLClHYn7rchIR2h1Rko
         zT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590109; x=1795194909;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJaikHgxJ0Cfj902txSyNLryimhDtp9xIHKHj6RuZzg=;
        b=opjzyOxqW4PRNP4qexZYtxfAAQs2bXcebQWbtt/tomcmNIMJiXYwRaOkYeuiRVnXSK
         44rKJd+7zhHgyf9jIkTp4n3DTaMRSkf8u27RqKZ9BDY4gVpqQ9pMu/Nr4jpGIMUJko0G
         8qelZu51KsvM1NISz5n8XGSS25yEiG7eZ0R8T4w5iVjk3TlZH6s+0dkXbLmzyZdwXm9x
         2a/jZ28VShB5jRRNcfQxlNqyWVtHt3zX1bKr8o5Ya+HMVOld+M3pqxmIW+7TicsDdAHU
         HLYg8WPnfbvr3xBo21nIkcrEvNbTYCBF7YuZyvpR9pGwO3HODgTNaYeoLm0g5fEUQYEk
         3PPg==
X-Forwarded-Encrypted: i=1; AL+hErHfSDxsClzOA7fr4jU2fnpcYIwF/XvZYdXb0fT/kdE6KYsDShod9wn+ktxQ36D5FK6VpD33K4zTQ4KMKOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+vnEU0YLFwbst6caukfPSt9YIRygFIOEU5VHb2yzuNZKSsab0
	Uzv5M5ZSpvC3gi0bP3BJg7HKb5kSqlPHdZrM4Ea3ACl02bGgJRvtWI39
X-Gm-Gg: AYBFou18kv+5u83dkmDZK+XsanACosxGpwcgcO1iRlNVl5knJWQgqHZXxn/qt60d5Pm
	st4qdn8SK09CndOtLDqEz/2sGcDZ5SmmIby4N4wuolFPrqkbOnrMzY75mJHMTBmsfd7dfuxmPVi
	oqMUAEte7kBaxUBp/Ei6KIlf6mM6rJDVXV2UjJ/pe2825kVqndXow3vKAfOW7S9rOioI5ERtdyp
	0S7HOG0meST1szm1EieImz8D8SHWsi9Z3lg521/iYdLBRz2mOmM8bhfcEuFBn0ApHHZM6rBjYZl
	zJjueX+1Is9KqI+50xdssd0zZ1gARFt99whWGLiN+VhGn2u0sTD9APzbayzbO36KRdKNcpgHvv6
	HtP4MhHVB5dzAcDxcpF7wHFLMoQB5gGE6N3JO1+mBF+Tfcfag3PjNwLAgD7rxu0wFDFiO7/b45q
	71Xgi+I9Kaz+kIMD/Sy0TzptYxcwJlL8bETpZtcE5eyKry+pdnL5nnP5xTnn5OmAnNeF9d1vEWJ
	H6h0Pzd514YOyEx27gx+ieSh+htffjcHum6+TGI/XimkAbag06g+pw8l0o0hgU9CM/Yfhk=
X-Received: by 2002:a05:7022:b886:b0:1b3:b67e:9fcf with SMTP id a92af1059eb24-1b5030f29damr2891641c88.17.1794590108316;
        Fri, 13 Nov 2026 09:15:08 -0800 (PST)
Received: from [192.168.0.216] ([182.48.212.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm8468380c88.12.2026.11.13.09.15.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 09:15:08 -0800 (PST)
Message-ID: <dbfe2a41-c99d-4f00-ac0d-2b2b31a72986@gmail.com>
Date: Fri, 13 Nov 2026 22:45:03 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sahil <sahilcdq0@gmail.com>
Subject: Re: [PATCH v3 3/4] openrisc: Add unit tests for KProbes on branch
 instructions
To: Stafford Horne <shorne@gmail.com>
Cc: jonas@southpole.se, stefan.kristiansson@saunalahti.fi, naveen@kernel.org,
 davem@davemloft.net, mhiramat@kernel.org, pjw@kernel.org,
 wangruikang@iscas.ac.cn, namcao@linutronix.de, kees@kernel.org,
 linux-openrisc@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260930202744.50489-1-sahilcdq0@gmail.com>
 <20261026201240.107462-4-sahilcdq0@gmail.com> <avAsy43KVO-7Nm9z@antec>
Content-Language: en-US
In-Reply-To: <avAsy43KVO-7Nm9z@antec>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/26 1:33 PM, Stafford Horne wrote:
> On Tue, Oct 27, 2026 at 01:42:39AM +0530, Sahil Siddiq wrote:
>> Tests already exist lib/tests to verify the generic functionality of
>> KProbes. Add unit tests to verify that KProbes work on instructions
>> that require simulation in the OpenRISC ISA, and that the corresponding
>> delay slots are handled correctly.
>>
>> Signed-off-by: Sahil Siddiq <sahilcdq0@gmail.com>
>> ---
>> Changes v2 -> v3:
>> - arch/openrisc/kernel/tests/test_kprobes_asm.S:
>>    - (test_kprobes_*): Set value in r11 register to 0 prior to running tests
>>    - (test_kprobes_adrp):
>>      Place function at page-aligned address
>>      Use PAGE_SIZE macro instead of magic number
>>      Move value in r13 to r11 before exiting
>>
>> Changes v1 -> v2: New commit
>>
>>   arch/openrisc/Kconfig.debug                   |  30 +++-
>>   arch/openrisc/kernel/Makefile                 |   1 +
>>   arch/openrisc/kernel/tests/Makefile           |   3 +
>>   arch/openrisc/kernel/tests/test_kprobes.c     |  59 +++++++
>>   arch/openrisc/kernel/tests/test_kprobes.h     |  24 +++
>>   arch/openrisc/kernel/tests/test_kprobes_asm.S | 157 ++++++++++++++++++
>>   6 files changed, 273 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/openrisc/kernel/tests/Makefile
>>   create mode 100644 arch/openrisc/kernel/tests/test_kprobes.c
>>   create mode 100644 arch/openrisc/kernel/tests/test_kprobes.h
>>   create mode 100644 arch/openrisc/kernel/tests/test_kprobes_asm.S
>>
>> [...]
>> diff --git a/arch/openrisc/kernel/tests/test_kprobes_asm.S b/arch/openrisc/kernel/tests/test_kprobes_asm.S
>> new file mode 100644
>> index 000000000000..bc87a5fb00d5
>> --- /dev/null
>> +++ b/arch/openrisc/kernel/tests/test_kprobes_asm.S
>> @@ -0,0 +1,157 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * KProbes unit tests for OpenRISC
>> + *
>> + * Unit tests borrowed liberally from similar work of RISC-V. All
>> + * original copyrights apply as per the original source declaration.
>> + */
>> +
>> +#include <linux/linkage.h>
>> +#include <asm/asm.h>
>> +#include <asm/page.h>
>> +
>> +#include "test_kprobes.h"
>> +
>> +SYM_FUNC_START(test_kprobes_j)
>> +test_kprobes_j_addr1:
>> +	l.addi	r11,r0,0
>> +	l.j	2f
>> +	l.nop
> 
> Just a tiny comment here about indenting the delay slots.

Got it, I'll indent this.

> You could also use the delayslots here, for example:
> 
> 	l.j	2f
> 	 l.addi	r11,r0,0

I initially thought of that too. But then I thought by keeping l.addi
before l.j, I would also be able to test this for the case when
there are no delay slots. I can reshuffle the instructions if that
test isn't required. Please let me know what your thoughts are.

>> +1:	l.ori	r13,r13,KPROBE_TEST_MAGIC_LOWER
>> +	l.addi	r11,r13,0
>> +	l.jr	r9
>> +	l.nop
>> +2:	l.movhi	r13,KPROBE_TEST_MAGIC_UPPER
>> +test_kprobes_j_addr2:
>> +	l.j	1b
>> +	l.nop
>> +SYM_FUNC_END(test_kprobes_j)
>> [...]
>> -- 
>> 2.55.0
>>

Regards,
Sahil
