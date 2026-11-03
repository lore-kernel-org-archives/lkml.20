Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720555;
	b=KTCdVzrmgB5MPnQq2kauznEBhYIoNzkvEmS8V/lEFxSWZo2Y9sOXcWCiuIUkZkkVnunv
	 6QGTjyyrW6FUwS07MwIRvs9HSeQfNgJk7UuFWsepeHYZwdILLM7PRqzxZCieKAzjjAsmM
	 /Anhc9VF/Bi67tEyLnezNrNnw8ylmAdPWlBUTmcGNGwsZk+HDya/a84gPF6Q3W5fPCwBx
	 eqr3wcKrzHwkdgMFfKeXYjAbQINkPprFbzFrxFMmDHwy3NQQSeuO1QbGB3HZQ9aZFUaa/
	 Tc5b5PZQ1n1dnu/RYiB711mkquGr4zoZ05ZEzS8C+Y2TE4Iyuoh++uKu3FAD1YJDNbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720555;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/qJc4D2r9mHG1yINVHpnoNYUBDOoHiIpQ7kzE4cHeCE=;
	b=cAxP+A90OPjS8987ZmqfVS14L8R+0o4MTPlEuyPS1GlYIT5NcKxVFkFiyFCY51Gy7fUm
	 4LXS3CqoI8m8SpGhR3jryaJmTUIYXo8TgIniH/QcgJRmw2W8yxdF3uTJ2GOHapmU6XXYB
	 KMbSk1morAItY1IZZRdb8ryfNgcmXXY667G0HgLX3HpN0jmzffFN0DYEWpCvS08+BHbvj
	 6iag0La67A0Qu1X7AcjagNxwnkwKTDC2KzbWCtlxvxqpwUhF5JyjhMNb0aqfiQmlH4nnZ
	 bKIDBqoB2tMuSfuWThwJ6wvAA3gYuJD8bfBTcY08Jk4SCGm0D/TY4X3YJ+uJlxew0Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GgykhI4a;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F005B60A2617
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F005B60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GgykhI4a
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29AAD1595;
	Tue,  3 Nov 2026 07:42:31 -0800 (PST)
Received: from [10.2.213.24] (e137867.arm.com [10.2.213.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13F3F3F673;
	Tue,  3 Nov 2026 07:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793720554; bh=eJzEU4TcaEPz0i1knVVUKrwsAR00D1MGRZ22+QF6KWs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GgykhI4aYp77Sd4NcS9QqCj3HJmgwnh2bR29hqqjP+lIOLsQASh5p8VeLuMFWv36A
	 D7C8tlT1dtzakascTgu2PtA1KB9abfemILJnoXiNAbAeqqMZqwopa4/scNxF9tbY8D
	 7YB4N/xw2mYsB62u1bHGbdc7JPaRz9YcVZuEohbI=
Message-ID: <6423899d-5cc9-4225-a1a8-44c1c5b14103@arm.com>
Date: Tue, 3 Nov 2026 15:42:27 +0000
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
Subject: Re: [RFC PATCH v2 0/4] Mark Kprobe debug exception paths noinstr
To: Will Deacon <will@kernel.org>, Hongyan Xia <hongyan.xia@transsion.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jiazi Li <jiazi.li@transsion.com>,
 Pu Hu <hupu@transsion.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ada Couprie Diaz <ada.coupriediaz@arm.com>
References: <cover.1786603168.git.hongyan.xia@transsion.com>
 <auSobyKxtfnn0geU@willie-the-truck>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <auSobyKxtfnn0geU@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2026 14:23, Will Deacon wrote:

> [+Ada]
Thanks for bringing this to my attention !
> On Thu, Aug 13, 2026 at 06:47:31AM +0000, Hongyan Xia wrote:
>> From: Hongyan Xia <hongyan.xia@transsion.com>
>>
>> Commit 879a6754d3d1 ("arm64: kprobes: Only handle faults originating
>> from XOL slot") and 23f851ac0078 ("arm64: kprobes: Allow reentering
>> kprobes while single-stepping") band-aided two corner cases in the arm64
>> kprobe path: Nested page faults inside Kprobe and nested Kprobe SS
>> handling. Although the two patches were taken, Will asked whether we
>> should keep patching things like this each time we find a corner case,
>> and whether making Kprobe noinstr is the correct answer [1].
>>
>> This series attempts to do exactly that: Making the Kprobe path noinstr.
>> The kprobe handlers become noinstr end to end. Apart from marking
>> functions noinstr, we also force-inline some static inline helper
>> functions because certain compilers still outline them, breaking
>> noinstr.
>>
>> Note that arm64 has no objtool so at the moment noinstr is more of a
>> contract that must be followed, instead of actually enforcing control
>> flow. Instrumentation can still happen if someone with root privileges
>> does something stupid, but now it is regarded as a bug rather than a
>> legitimate use case that the kernel needs to cover.

Just to make sure I am not missing something : as far as I can tell,
Kprobe checks the section the instruction to be instrumented is in
and will refuse to instrument anything within `.noinstr.text`.[0]
Given that this series converts the whole call trees of the Kprobe
functions to `noinstr`, should that not make it safe ?
(My understanding is that Kprobe is the only one checking the noinstr
section, all the other instrumentations and sanitizers do not.)

>> [1] https://lore.kernel.org/all/alpuL10h7-OK2hFb@willie-the-truck/
>>
>> Changed in v2:
>> - Remove instrumentation_{begin/end}() markers as they do nothing
>> - Fold __always_inline into the patches that actually need them
>> - Remove the debug exception path changes unrelated to Kprobe. This
>>    series is only about Kprobe for now
>> - Drop the kprobe_page_fault() patch for now. It's a question whether we
>>    even need it at all. Will send a patch for it separately.
>>
>> Hongyan Xia (4):
>>    arm64/entry: Make debug_exception_enter/exit() noinstr
>>    arm64/debug: Make the Kprobe functions noinstr
>>    arm64/kprobes: Make the entire Kprobe noinstr
>>    Revert "arm64: kprobes: Allow reentering kprobes while
>>      single-stepping"
>>
>>   arch/arm64/include/asm/esr.h       |  2 +-
>>   arch/arm64/include/asm/kprobes.h   | 15 ++------
>>   arch/arm64/include/asm/percpu.h    |  2 +-
>>   arch/arm64/include/asm/preempt.h   |  4 +-
>>   arch/arm64/include/asm/ptrace.h    |  4 +-
>>   arch/arm64/kernel/debug-monitors.c |  6 +--
>>   arch/arm64/kernel/entry-common.c   | 13 ++-----
>>   arch/arm64/kernel/probes/kprobes.c | 59 ++++++++++--------------------
>>   include/linux/kprobes.h            |  8 ++--
> Given the lack of objtool enforcement (as you note above), I wonder
> whether it would be more robust to do this on a per-compilation unit
> basis? i.e. disable instrumentation for debug-monitors.c, entry-common.c
> and kprobes.c?

I think that marking whole compilations units as `noinstr` would be great too,
though I am not sure how it would affect some other sanitizers/instrumentation.

> Unfortunately, I couldn't find a way to do that in the Makefile :/ In
> which case, perhaps this series is the best we can do, but I thought I'd
> ask the question in case somebody has any bright ideas.
>
> Will

I found out the same thing when I initially started working on making sure
alternative-callbacks where `noinstr`/patch safe, so this pushed me to dig
a bit further.


There are two parts to this, the first one I believe to be relatively simple :
GCOV, KCOV, KASAN, KCSAN, KMSAN, UBSAN and ftrace all have a way to be
turned off for specific compilation units in the Makefiles. We already
use them in some places : `KCOV_INSTRUMENT_entry-common.o := n`.

We could introduce a similar variable to disable all instrumentations,
re-using what is already in place : something like
`NO_INSTRUMENT_entry-common.o := 1`, which would be checked before all
the other control variables in `scripts/Makefile.lib` and override them.


The second part is Kprobe itself, which would be much more painful to
disable as it does not rely on compiler instrumentation or other build
options we could use.
However, Kprobe /does/ check at runtime if it is allowed to probe
a location, refusing to do so if it is in `.noinstr.text` or if the function
name is part of its explicit deny list.

So, looking at the shenanigans KVM does for the nVHE hypervisor
symbols[1], I think it could be possible to either :
  1. move the `.text` section into `.noinstr.text`, or
  2. add all symbols to the `_kprobe_blacklist` section, as if adding
     `NOKPROBE_SYMBOL()` to all functions within the compilation unit.

I played around by hand with the first idea using `objcopy` and was able
to combine the `.text` section into an existing `.noinstr.text` section,
preserving both, but that did not update the relocations, so the kernel
immediately crashed.
This leads me to think that adding the symbols to the `_kprobe_blacklist`
section with a LD script might be the more straightforward solution.

I have no experience with LD scripts but I would be happy to have a go,
if that sounds like something that could work *and* worth the effort.
Otherwise I think this series might be the best we can do !

Kind regards,
Ada

[0] : https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/kprobes.c?id=6628e7d4c6b25c8d18f1345e3a20d21829aae7e4#n2840
[1] : https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kvm/hyp/nvhe/Makefile?id=6628e7d4c6b25c8d18f1345e3a20d21829aae7e4#n38

