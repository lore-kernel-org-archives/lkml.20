Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606055;
	b=1ClbNM/pQ6npHtHDLS/uV2S434uuVcetQtZ9GgnFYiV1PtWU3mQryTMu3TauwNyQoyqO
	 g0CFY57lrP6mK8Ggh3aKSgLi4vFCNMloUPPSUeGYzJIFr0MYQgGlSxtG/nh9Yb0Kl2p2r
	 OLZuLNfe2lskGT4JzDktIDKcGjnDM9PQCOLGk0yqP4SAewdDB7JSxNsSuAS3p9xdHSPq9
	 csZQDiuFmdVvIe+iwZDI/lkjFClhjm8cvF5aRK4K/Zk94iRVXCiPSULPdzsmmIIZsY6a9
	 VW8Rr8VWxoQVGnFsZdYh9i8xgtkM5+8MFXRFHA0Oyf2tV2wLlWm3656J61Nv/sMxabw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606055;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=uG7fhzN12tKnMsVMVFuJ5vI38xwZjGLr+R0JNhRW+dM=;
	b=jRdE4YEv+rDhhgbovrC+UWzsnm2NG/DiV6HzKZqFJUlsr4m28+Jrg8msWzKR2vVDsFs1
	 6ei6zlyN6vk88wKHzTbXijYDBc/yTB4LHw9RGJLBc+g1QkKcWhtEQW9pxjeK3cMf8aY2m
	 SJP9G5ibkA9U2LojvTmn5JhKy8WMmWAmYOP6Is5AVJb0nIuwAkS3VxvWyW8IjcA+whO+8
	 0hnkeijOot9MH1acQAseeRuQJMOpsyD21j3P3xHy0RAdPCoSDZl1g2lC0qL51ZqaCzNxK
	 VU/2o0ie/UDkf42tpJ0dG9L2PepJb9gW/jg9FaXGV/CcalDvw2mDA8Sswd6jNXWarjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=3a8F3w6N;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD2C606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CD2C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=3a8F3w6N
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uG7fhzN12tKnMsVMVFuJ5vI38xwZjGLr+R0JNhRW+dM=;
	b=3a8F3w6NpIH15K4K3mbUbYPitJbvxRFftH7WHbNUu4Z0X5Cc70S+nSiTTnC552Gt7OoVsWRKw
	73TCW6ghLhCTvrs/IRQw+pNPSGVGrk5JlkRtUgPVOaDfKlBhOxcq45O3XojCa093YwCoBLhyvn4
	xrE+MbEYm4p7CuHwx5MplWc=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jJ3qY4GrQzcb0L;
	Mon,  2 Nov 2026 15:53:45 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 889014058F;
	Mon,  2 Nov 2026 15:54:08 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 2 Nov
 2026 15:54:07 +0800
Message-ID: <d8aced38-fb7a-4359-b3ab-c625faae5023@huawei.com>
Date: Mon, 2 Nov 2026 15:54:07 +0800
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

I think maybe we can refer to ptrace_get_syscall_info_op()?

> 
> I'll wait for a couple of days to see if Will has any comments and queue
> it.
> 
> Thanks.
> 

-- 
Best regards,
Jinjie

