Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605374;
	b=HFeawXalhLd/RFykSaAmT2fpP1/h7xjCvP/sh3Tes4FYJxPKJ9iMqeme+mstrVc22Rag
	 CooeAvKjAywFtZaJC6uFoCX3lER5wkPvA8+wLKVp6UQltZ23enufJj69JofQTkCf/fEp6
	 wCC3jEdHKUCnf5ZRFd+8v4gqQr/ciUdJIzLL9Wc/uEp8NknF7KH83JPU9cUSCYiQ0zcHe
	 V4JtdZyugUuP7Wck7QQhytAT4Y6FVs6B8dR3ZkUzq8mA3InkQLVYVpT/dm0gqMkgk9XQx
	 ueGJ6VzLo4nBSiG6toZ7dAMwLfX4Y9N1CfDeg1wrGJEL0zYVWyKv3wTcxXdGTiytZDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605374;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=AYm9Q9rTGdSI8SAFJ5HmZUi3JZl+WGAogmiit+aiQf8=;
	b=A+nr+laUCtxR3rUerNRaYFUH2Qkr2ojiWi38JxIp6RQI7JtAx1zWpHyeUdFz/Za6Dj2k
	 F0+scfi172dolO2UCymTTUPx3VPPfN9KHcT2D7XF+TWCsGB1FtuRk+5Xvk7Wm7v67e51s
	 /B8c2DgYwpSjQu5CIBrFqt03B/1jUQYqWZJmTHaMVFcyHlT6ldU9/EG+zeIENcCtI2BAf
	 15wMKbPhPofkjtUPkf3j6GUQHjFewRnBXuotY3DYgWaYv7gnAepvlkOvKrN7TPK2K/7Jw
	 yJ+z2QiaxgEe2NhkF1DkMAznqbrw8ksvgWN/C94A1pDH5wvWQnbKyQlzR2atxM1eSWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=0eXB7wZO;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B878606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B878606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=0eXB7wZO
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AYm9Q9rTGdSI8SAFJ5HmZUi3JZl+WGAogmiit+aiQf8=;
	b=0eXB7wZOLoo05itWdaoxZegg/PmVPUaIxoXlY8h2+4ZwsqG2y/DUQE8Tn06efihwyXtilk5PE
	bdu7uOP4OqsXhLGLzB7JUHrN1GEDfN4sR47fOpBChYZxOmA3XQmjSpidTkAiDMzVFqaZYyOtaDa
	3vjqYYTIJiari3dO2XBS9fQ=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jJ3Zm4Ngnz1prLD;
	Mon,  2 Nov 2026 15:42:40 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id F2EBC4056E;
	Mon,  2 Nov 2026 15:42:43 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 2 Nov
 2026 15:42:43 +0800
Message-ID: <5dc79bcc-c61b-4caf-82e3-602aae8a88c4@huawei.com>
Date: Mon, 2 Nov 2026 15:42:42 +0800
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
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
To: Catalin Marinas <catalin.marinas@arm.com>, Zhao Gongyi
	<zhaogongyi@bytedance.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>, <oleg@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
 <at-czRUYRPRxi9dy@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <at-czRUYRPRxi9dy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/27 2:32, Catalin Marinas 写道:
> On Fri, Oct 23, 2026 at 07:07:10PM +0800, Zhao Gongyi wrote:
>> PTRACE_ATTACH to a group-stopped child can enter do_jobctl_trap(),
>> which calls ptrace_stop() without siginfo. If the tracer writes
>> NT_ARM_SYSTEM_CALL, system_call_set() can change syscallno from
>> NO_SYSCALL before calling update_syscall_orig_x0_after_ptrace(). The
>> WARN_ON_ONCE(!info) then fires, although this is a valid ptrace stop.
>>
>> Remove the warning and guard the syscall-exit-stop check against a
>> missing siginfo. Keep recognizing both SIGTRAP and SIGTRAP | 0x80:
>> syscall-exit-stops use either value depending on whether the tracer
>> enabled PTRACE_O_TRACESYSGOOD. With no siginfo, allow the final
>> assignment to synchronize orig_x0 from x0.
>>
>> Fixes: 88b839ce497c ("arm64: ptrace: Keep 'orig_x0' in-sync with x0 on syscall entry")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
>> ---
>> Changes since v1:
>> - Remove the warning and early return, as suggested by Oleg.
>> - Keep recognizing syscall-exit-stops with or without PTRACE_O_TRACESYSGOOD.
>>
>> v1: https://lore.kernel.org/r/20261016024536.18938-1-zhaogongyi@bytedance.com
>>
>> Tested on arm64 KVM at af32da41b032 with this v2 applied.
>> At a group-stop, PTRACE_GETSIGINFO returned -EINVAL and an
>> NT_ARM_SYSTEM_CALL write succeeded. Syscall-entry and seccomp
>> x0 rewrites worked. At syscall-exit-stops, NT_PRSTATUS writes succeeded
>> with and without PTRACE_O_TRACESYSGOOD (si_code 133 and 5,
>> respectively). No kernel warnings occurred.
>>
>>  arch/arm64/kernel/ptrace.c | 6 +-----
>>  1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>> index f743cbec1..22fb9eeed 100644
>> --- a/arch/arm64/kernel/ptrace.c
>> +++ b/arch/arm64/kernel/ptrace.c
>> @@ -573,10 +573,6 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
>>  	if (regs->syscallno == NO_SYSCALL)
>>  		return;
>>  
>> -	/* We should only be called when target is in a ptrace stop */
>> -	if (WARN_ON_ONCE(!info))
>> -		return;
> 
> That's a slight semantic change since this function may now update
> orig_x0 even when !info. However, I think it makes more sense as the aim
> of commit 88b839ce497c ("arm64: ptrace: Keep 'orig_x0' in-sync with x0
> on syscall entry") was to update orig_x0 in all cases other than
> syscall-exit-stop. We can't have the latter with !info.

I agree, our original intent was to avoid the return value contaminating
orig_x0 at syscall exit; apart from that case, it should be kept in sync.

> 
> I'll wait for a couple of days to see if Will has any comments and queue
> it.
> 
> Thanks.
> 

-- 
Best regards,
Jinjie

