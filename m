Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793275249;
	b=hKft10MEbo9uZOsSDL3pcIxb81aUTJX3MrcKQw1bpaMHtxz8tGks3ug2lhvYH2wXMIc+
	 eCxTYkN5kMnzdzrbyn5wgTxlYg8yl/9gc7rToFIgVEvg4nmUaiX6AdM4qkZDlmVT7ljG5
	 FD+r0O1FVkXYyHxvldfLbKbp2EkfTCkcLTJjJhbjz3AkkI+7P6LthUOeuCELh9TrsnVE0
	 iMR10L1WdU0A0OHevWhep0KAU0dp4DcdrGwemBHzc8tjmhCEA2OWIuixUEnjF4pB2c11R
	 /uVYXyXRJd0DFNPP24IeTTqR8fpW1QwcQwM71FrNSthPZEDZJoUFmppbpy5ARw078ZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Mime-Version:X-Original-From:User-Agent:From:In-Reply-To:
	 References:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Kfh6T58QwTFlNX2tJxJJ8wG1iXiSG5Qq4FI151fPHEk=;
	b=mn7GzYMokIdsYZvsMPj0Frdc4Ej2RvZMXqhnuUQLk0clVG0xvPGL6dwhj2BA59NrOtNG
	 xnAx6dvkWbN4mLWrJR4HytaG04e504LFKyccENtetErZGJiMSKmqySAsR91vJaA5fQ9JV
	 W+6tKYKffvjtCFbemPOwz0aX4QghZl0fUVKKUre+cQ3fUokOpf55Qh+TOxaenXZvg8cNx
	 z4A0Dm9J5clSCW+PFlfAha2dtCpyAei7yRFBXt0p89K7XeF2eoSjhV9dPnnbOGamF3XAr
	 XDmF2BIFUuVloMpl/0sQP6CdXM9fbc+Y1cxmqlJ67hjVynf3ZqrsWeXjY6h5jCFxQeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DPz8UE+T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DE7606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77DE7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DPz8UE+T
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bfc346401aso1425864e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:00:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793275246; cv=none;
        d=google.com; s=arc-20260327;
        b=jH7ceIjtXlT/5iboLusHW0V+koFAfGbkaUaJM51J/gkuDH4stPvYy776wimQGH2Q5g
         CdiEpz/2AKkVb9sEuqqPGnkIPoKBYDFZoSmmxqbAgSF1N/kLoiYpDgJvD8KcCGkmfsgL
         QbPcdpQnlh0Ilqw950C4A1rkF8xQyGYE0cur6SiURP2Sw4LhVHfHgO+tGGRVeQlkFENY
         0VuEMzI1gFxH+sT07Kw63UoiCwuMlyFqNsjaxOyHBCNnuYWdLcxTDFdk8dJcMu5UhzOH
         qupUp8CkBR+CxjV5hWbUhBGeUjAhmInsWllyJILV1cZT82Be2cEFz0QYqgcoqKs+PLmR
         fJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:user-agent:mime-version:dkim-signature;
        bh=Kfh6T58QwTFlNX2tJxJJ8wG1iXiSG5Qq4FI151fPHEk=;
        fh=mVy8a/mWeDicsGNHrngiTcSlS6ieWELXDFBcYdx8W/4=;
        b=UMgyy+kdQxwN+diSW7cSkt1MkOoE97zinTLxQGlMdnGBXt19L2nKvzcGI+Y2KuWR6F
         N9j0MrzR3W5t4kuPPW20La9DeCy0Oa673ow2RIkdCuLY2uD4BhBf7ieV4bEb3uDZs7x2
         NPPL5VzT7BBUZob8gTbjUNRECOiaCt/oY01mJbQAjxAKjHoF/RUStlTPUJI44DgJxUyV
         EZ7eea+asusvsKuukW2Ko8lprUJYATSZGvhaIbIAKqowKtAd1wywKX0vmLyu7IMrhQUF
         iTD+Cs8kq+arZT35zwhpXhDgJAI/Zd9YFbPmfFhUyJ3y/gmWV2NOHXgah8B94wAfR2ZJ
         K4Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793275246; x=1793880046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:user-agent:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kfh6T58QwTFlNX2tJxJJ8wG1iXiSG5Qq4FI151fPHEk=;
        b=DPz8UE+Tyq/cYPEl4w9kY6RF8oUPSIePH2cHsTWTsyIww8cgzD+L4D6RUw7K7cWW8o
         5bT6/92MEzA94ZSo9BosrD4q/8jYMsNjrBbEJbcait+RXDxiIjBHhTsmvsq8563TjuoW
         v1ABBvVvDyu9Gu32MGKQvkCCIy5rvYW/syrlIQuko6y/kiNEMf+iNoL28ME+J/WphOGq
         yZbm9hNqjWElPQXS2RMtV9pPlxKbl14jwd/SAR7ig0ALG3rhefYwqE+XXPLp9xRw6ZJO
         S20d4XV4bJLSlIKAqfLFe9CMRHcOH7RmLI/OjGvEGB8AqZUUPG9kp+rQGEEtoQPZGtlR
         IMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793275246; x=1793880046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:user-agent:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kfh6T58QwTFlNX2tJxJJ8wG1iXiSG5Qq4FI151fPHEk=;
        b=1MK8YY/0Uvn4/3mqv6aAChBd51l7ulVXKb1FwgjFhTWrpYLzOraEUVWj/5dktddILA
         R1hPdt0HhzZAYUVzBixK03Umdwi82AUBHt9oVgpZfbEvvaZ4pIYpmNzVczdEdVTgfEeO
         qlWGAoFbNH7zflocfno09gNUu8XSJfCeCHukpjNf0ep1kIIpwFKFG1xgWO0sc2f0eh4S
         emlnlDCLCSuPg21f4kq/vwTJ2rNrVS7zPEnbwBEGNoWqe2ecM6oFZS1HzO1aRhkeiIS+
         OTXaMtV1KuG9TK4Sm5BJ0BPHV3t9wHyv0iM6MMocXvQj+nutgkO+KWSJkR2LJjIIjoiG
         LB4w==
X-Forwarded-Encrypted: i=1; AKwUvBxaECoy0HG6yxQdWbcHhzvVqxmuZBP4UnvXP3HTvEW2l8RMH7MRBrFewkj7NRtlO497KV8f5PfLFFFJwoo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6sA4B54kbJjnCrAkje51vvdbKWVnRsqJ/jKroIssDsURhSChv
	zfm1OqoZzTE+9Nzy5THRf9IVcI3DCKS8UFLNO/jB5frI6D+x5R/kLlsMY8en69gXq5DZyLW+/fh
	U2GxanwDZa+q5Hcy/d/wQCRh1HwTzYGTgvagZ4pQZcg==
X-Gm-Gg: AYBFou0hW6a2V/EmKGPx2WyoDp1Q2IbOBvfDSch7UCF8zjjNWUUMfWurdLQvfJoaYW5
	1+cA9htDyvWXWleB+XbgbVbLfMndKba0BWGzgoedH7i8qJ+oHe9pCyeZsSjLtz9ZVoVMXPGCB4h
	6YBfU4VGgQFmd3rQpoTtcnAzbtGYV5fBPK2t2+kcd98qY5y6W15GoHh3IpTnVfWTVwYdmogFlmK
	8JyUTRIjk4ANbMfjtGR9ZyKHjAs0A89sPrOZia0RrRmQ8/qsWL3GXNSF/1EULyN2M40ZPM7G208
	VK5mPJnKkWfhU/0YX9SmrW4SMfyWZKEaIK7qyL7q79fI/Ie6sjJlzx5ehg3luY90+8PmPgnQWFW
	Ojb1HmfUq9SIJQ2PYmBFXNRqhcMZPDv8AjQf64w==
X-Received: by 2002:a05:6512:340d:b0:5bf:d653:ff01 with SMTP id
 2adb3069b0e04-5bfd6540187mr229252e87.34.1793275246438; Thu, 29 Oct 2026
 05:00:46 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 07:00:45 -0500
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 07:00:45 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <auMyx7dAPbl_1I5_@hu-himchau-blr.qualcomm.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
 <20261029074853.35467-4-zhangzhanpeng.jasper@bytedance.com> <auMyx7dAPbl_1I5_@hu-himchau-blr.qualcomm.com>
Date: Thu, 29 Oct 2026 07:00:45 -0500
X-Gm-Features: AclHuK_sbU548xic3ZPbWuif9uJX5ACTcms_1cHQ__pmhhaKq4RoduWrhke4WpA
Message-ID: <CACnXVnc0jFcNn0bmU5MSm81QTm6Ht+deSRED=91dViZnq1dNmQ@mail.gmail.com>
Subject: Re: [PATCH v12 03/11] riscv: sse: mask events during shutdown and kexec
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
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Himanshu,

On 10/29/26 7:49 PM, Himanshu Chauhan wrote:
> On Thu, Oct 29, 2026 at 03:48:45PM +0800, Zhanpeng Zhang wrote:
>> SSE delivery is independent of normal S-mode interrupts. Firmware may al=
so
>> retain an event registration until Linux explicitly unregisters it. A ha=
rt
>> must therefore stop accepting SSE events before Linux stops servicing th=
e
>> registered handler.
>>
>> Mask SSE on the local hart before panic stop, CPU stop, restart, powerof=
f,
>> and crash shutdown paths. This prevents firmware from entering Linux-own=
ed
>> handler state after the corresponding CPU or kernel context is no longer
>> valid.
>>
>> A crash kernel cannot identify or take ownership of registrations
>> inherited from the crashed kernel. Reject a later normal kexec while suc=
h
>> SSE state may still exist, rather than transferring unknown firmware sta=
te
>> to another kernel.
>>
>> The restriction is deliberately based on firmware SSE availability, not
>> CONFIG_RISCV_SBI_SSE or registrations made by the crash kernel. Disablin=
g
>> SSE in the crash kernel does not establish that registrations left by th=
e
>> crashed kernel are absent. Consequently, normal kexec from a crash kerne=
l
>> is also rejected when firmware advertises SSE but no registrations were
>> actually left behind. This conservative restriction remains until a safe
>> way to establish or clear inherited firmware state is available.
>>
>> Link: https://lore.kernel.org/r/as7-3PbWDxygadnJ@hu-himchau-blr.qualcomm=
.com/
>> Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
>> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> ---
>>   arch/riscv/kernel/machine_kexec.c | 11 +++++++++++
>>   arch/riscv/kernel/reset.c         | 18 ++++++++++++++++++
>>   arch/riscv/kernel/smp.c           | 17 +++++++++++++++++
>>   3 files changed, 46 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machi=
ne_kexec.c
>> index 738df176ff6..24e7affae70 100644
>> --- a/arch/riscv/kernel/machine_kexec.c
>> +++ b/arch/riscv/kernel/machine_kexec.c
>> @@ -14,10 +14,13 @@
>>   #include <asm/set_memory.h>	/* For set_memory_x() */
>>   #include <linux/compiler.h>	/* For unreachable() */
>>   #include <linux/cpu.h>		/* For cpu_down() */
>> +#include <linux/crash_dump.h>
>>   #include <linux/reboot.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/irq.h>
>>
>> +#include <asm/sse.h>
>> +
>>   /*
>>    * machine_kexec_prepare - Initialize kexec
>>    *
>> @@ -36,6 +39,13 @@ machine_kexec_prepare(struct kimage *image)
>>   	unsigned int control_code_buffer_sz =3D 0;
>>   	int i =3D 0;
>>
>> +	/* A crash kernel cannot tear down registrations inherited from firmwa=
re. */
>> +	if (is_kdump_kernel() && image->type !=3D KEXEC_TYPE_CRASH &&
>> +	    riscv_sse_available()) {
>> +		pr_err("Normal kexec from a crash kernel is unsupported with SSE\n");
>> +		return -EOPNOTSUPP;
>
> I think I had pointed this out in v10 also. This rejects a normal kexec f=
rom any kdump kernel whenever firmware merely advertises SSE, regardless of=
 CONFIG_RISCV_SBI_SSE or whether anything is registered. Can you check if i=
ts breaking kexec() with SSE just being advertised?
>
> Regards
> Himanshu

Thanks for following up. Yes, the current check rejects that case based
on firmware advertising SSE alone. I noted this restriction in the
commit message, but it still needs to be narrowed.

With the merge window closing, I kept that change out of v12 and will
address it in a separate follow-up patch like we discussed.

Thanks,
Zhanpeng
