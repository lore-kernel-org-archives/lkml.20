Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F50320A14
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790560264; cv=none; b=eXz15SZCmuyWpTnEbBxe/rvWe6j25KvoD5gD4ENjFCVnjz3PupJ4wj/eOSoGTO4dUYFzYBpbwBHpvgW/PMWxULa2CExA1NiaiKMSv/lcQmRplZrOnh3bUsbcoQSoXX2iLmPWVk0HKDU6tPPGSmDexd50vxJM5gFnde1gBiM8M20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790560264; c=relaxed/simple;
	bh=SPg8cL4kmSWA4iFpN4vF6FPr47BJmWraE4GW0BtQ1YI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EpiZuyd6KwYHhSt3ifCRRG9LCxu8AWQAgQ4kzYOXVSQuIsTBNQkxwpPvPHYfHFXjMZ3IhsDI24kKY5BhnL1RZZPJgTSyC/Q9tqTTDrU2GbM02CT/zkOFlq06UAMJ98eUcoPS4szGbEKsmYZ8BmnMmNp3OmU/3XLG55Ej+r6ZnX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=jXAkxBob; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="jXAkxBob"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MlSvak1ZymKa4HkDZecqOMouAzwaOxw4YrsSh//cFbo=;
	b=jXAkxBobyGxGl33CFWtPr+m5NrB0PXofrOayv7Y36nOMUwP82QgjZnHk7p82uMAqYOAKKpDKb
	9J5LOKOsR10NLIb15FaMrOgokskOYABGrxpJOAcieGk77xYRr7Gj9MECe4Ui0VSdUVkC2O7bO9A
	oTmpgJFlBvhiZgV2SCcwOI8=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4htP8v6cP3z1prN4;
	Mon, 28 Sep 2026 09:38:39 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D84DF4057F;
	Mon, 28 Sep 2026 09:50:49 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 28 Sep 2026 09:50:48 +0800
Message-ID: <7fe9a0d5-6b82-4ae5-bbdc-f74d797b2e0e@huawei.com>
Date: Mon, 28 Sep 2026 09:50:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 00/14] arm64: entry: Convert to Generic Entry
To: Kees Cook <kees@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <luto@amacapital.net>, <wad@chromium.org>,
	<peterz@infradead.org>, <ada.coupriediaz@arm.com>, <linusw@kernel.org>,
	<yeoreum.yun@arm.com>, <kevin.brodsky@arm.com>, <anshuman.khandual@arm.com>,
	<james.morse@arm.com>, <thuth@redhat.com>, <vladimir.murzin@arm.com>,
	<tglx@kernel.org>, <broonie@kernel.org>, <liqiang01@kylinos.cn>,
	<ryan.roberts@arm.com>, <pengcan@kylinos.cn>, <kmehltretter@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260922035510.1090299-1-ruanjinjie@huawei.com>
 <202609221129.B5E13A7@keescook>
 <927d57a4-64ab-4420-9485-5336f2ec3fd5@huawei.com>
 <202609241703.4AF69048@keescook>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <202609241703.4AF69048@keescook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/25 8:05, Kees Cook 写道:
> On Thu, Sep 24, 2026 at 05:32:14PM +0800, Jinjie Ruan wrote:
>> 在 2026/9/23 2:29, Kees Cook 写道:
>> I tested the rr test cases on a Kunpeng HIP09 (with minor adaptations,
>> since Kunpeng CPUs aren't supported by default), and the results showed
>> no regressions.
> 
> Great! Thank you for getting that set up.
> 
>>
>> |               |    7.3-rc4 baseline     |   Patched                 |
>>
>> |  ------------ |------------------------ | ------------------------- |
>> |   result      |  87% passed, 190 failed |   88% passed, 186 failed  |
>>
>>
>> | Failure Mode   | 7.3-rc4 baseline |   Patched  |
>> | ------------   | ---------------- | ---------- |
>> | TICK_MISMATCH  |         76       |   74       |
>> | TIMEOUT        |         68       |   65       |
>> | GDB_SCRIPT     |         34       |   37       |
>> | PERF_EVENT_OPEN|         3        |   2        |
>> |   OVERSHOOT    |         1        |   0        |
>> |    OTHER       |         8        |   8        |
>> | -------------- |  --------------- | ---------- |
>> |  Total         |      190         |   186      |
> 
> GDB_SCRIPT failures went up? Are the tests just flaky?

Yes, you are right!

Those three tests failed in the baseline too — they just surfaced as
tick mismatches then and as GDB script timeouts now, so the
bucket boundary shifts with the race. That's flakiness, not a regression.

|     changes         |               testcase              |
|  -----------------  |  ---------------------------------- |
| OVERSHOOT -> TICK   | clone_interruption                  |
| TICK -> GDB_SCRIPT  | checkpoint_prctl_name               |
| TICK -> GDB_SCRIPT  | checkpoint_prctl_name-no-syscallbuf |
| TICK -> GDB_SCRIPT  | clone_interruption-no-syscallbuf    |
| PERF_OPEN -> TIMEOUT| clone_newflags                      |
| PASS ->  TIMEOUT    | pid_ns_shutdown-no-syscallbuf       |
| TIMEOUT -> PASS     | fstatat-no-syscallbuf               |
| TIMEOUT -> PASS     | futex_exit_race                     |
| TIMEOUT -> PASS     | futex_exit_race-no-syscallbuf       |
| TIMEOUT -> PASS     | futex_exit_race_sigsegv             |
| TIMEOUT -> PASS     | futex_exit_race_sigsegv-no-syscallbuf|

> 
>>> - MTE: I didn't see MTE in the cover letter's test list, and it seems
>>>   relevant since patch 13 puts _TIF_MTE_ASYNC_FAULT into
>>>   ARCH_EXIT_TO_USER_MODE_WORK, so an async tag check fault lands
>>>   on the reworked exit path. The MTE selftests showed no differences,
>>>   but a third of them don't actually run for me under QEMU, so they'd
>>>   be worth running on your hardware. (Testing MTE under QEMU saw
>>
>> Turns out our arm64 machines don't support MTE; I was testing it on QEMU.
> 
> Ah, dang. I wonder if we can find anyone with MTE hardware to test this.
> Any volunteers? :)
> 
> -Kees
> 

-- 
Best regards,
Jinjie

