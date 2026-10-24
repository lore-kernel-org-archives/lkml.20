Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792853429;
	b=W1rdH5krFTTaA7+ruOiyakVkk+gk23K87ENQpA7EKRNJ9Pvfb87yqzxlWoScFG+lLrkz
	 UbqvOTaCm3Z/2eGQcgLw+HknOVPNWXgIqE6EMzEotoa3kVPncQM5m56tjGeG8dnzla5uy
	 m9cn1nfbQMhvTWud2eJ+RoeTIUGPOCAL8THOIsDHtOAVT0BU4tPGywRW7+NguY7G5G8FT
	 dORXuq4wT3LtXtn63dbebOTVihcNS8Fog9C2Bai5g50c0mSP7crkn077Xv/TIb5vNjdmQ
	 vMepnYF2lVWj7aTOuDo5FD4Tf96ABxW0rfqgT3hbRGQtiJx241pTzdYSEwkfpTQ6ZOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792853429;
	h=DMARC-Filter:DKIM-Signature:Message-Id:User-Agent:In-Reply-To:From:
	 Content-Type:Cc:Mime-Version:Content-Transfer-Encoding:References:
	 X-Lms-Return-Path:To:Subject:Date:X-Original-From;
	bh=L0VbpmrkDXp5SRFASfh5Wj4ga8p/F6MDKjY6zQhL8g8=;
	b=XhTGNRpiRuauQvv8pgRyhw1Yyzjvj3nBIhbIo07omdqWipy+NBrq+5iCknqBYwt7u7dP
	 ZZZS+mR7KL+FpkrcIWnCZvB7pPxnNntJnQdKWuN3gK5AOJZCxpaoyeTf68ytk7NNK8e0s
	 uwDf8jOhvGz1A/yKdPzBVYy0jf/et9fx5TFD9GDNbEBmojR2OMD6IYi+Mj9ACgo5aoiua
	 pfKz0BYGnMgeoGp20H1tICJo/X5xtNJUy5HtJBA47Mb1LbpZxWK7FuzLkDjssN6vVo86u
	 ENqpFhcx41ma8Neow7466dV62wnJydpexfw0v/xc5Lx8Swj6FUj4zs8uvKZCLb1Sk0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=nlhFEcMR;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3590D606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3590D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=nlhFEcMR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792853422; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=L0VbpmrkDXp5SRFASfh5Wj4ga8p/F6MDKjY6zQhL8g8=;
 b=nlhFEcMRiuEK6eDh9q6wPx028q61zJYF5UGz5FnQnK/VQDeZUEyrCz8JuhTiRsmq1nk5Sz
 U/k9OM4ggQ23zoBJYL5ODC0oyE11hN1uRmAHs4KQkiKv5MEsamFszfgWtiQeMmvVaNhCmI
 90Hx2aW1ZpH8eYebBNhNMcvXKNqBf/4gLuXusb9tesvbIlIKksVUnFI4nXJhSSTNhzRJHU
 S4UW9kGFlUqJOKptbnqbOcMbDNN8vSEBS8hiqBbpZhmwRHwn1NE0RGaQGgqKYp565D8dXr
 0xgn+tbBb+DKnPp2Ky9BlY0JHxF20z/evnRO38Jt1BiUD6XJ3As98vf3/2gKJQ==
Message-Id: <beb5fc93-4cca-4dc9-a4e3-f406e8c9cd58@bytedance.com>
User-Agent: Mozilla Thunderbird
In-Reply-To: <attf9KALBQyOGyco@redhat.com>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>, 
	<ruanjinjie@huawei.com>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <20261023110710.10145-1-zhaogongyi@bytedance.com> <attf9KALBQyOGyco@redhat.com>
X-Lms-Return-Path: <lba+26adcc5ac+c66acf+vger.kernel.org+zhaogongyi@bytedance.com>
To: "Oleg Nesterov" <oleg@redhat.com>
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a group-stop
Date: Sat, 24 Oct 2026 22:50:06 +0800
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>

On 10/23/26 9:24 PM, Oleg Nesterov wrote:
> On 10/23, Zhao Gongyi wrote:
>>
>> --- a/arch/arm64/kernel/ptrace.c
>> +++ b/arch/arm64/kernel/ptrace.c
>> @@ -573,10 +573,6 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
>>   	if (regs->syscallno == NO_SYSCALL)
>>   		return;
>>
>> -	/* We should only be called when target is in a ptrace stop */
>> -	if (WARN_ON_ONCE(!info))
>> -		return;
>> -
>>   	/*
>>   	 * For compat tasks, orig_r0 is provided directly through GPR index
>>   	 * 17.
>> @@ -588,7 +584,7 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
>>   	 * Don't update orig_x0 for a syscall-exit-stop, as x0 now contains the
>>   	 * return value of the system call.
>>   	 */
>> -	if ((info->si_code & ~0x80) == SIGTRAP &&
>> +	if (info && (info->si_code & ~0x80) == SIGTRAP &&
>>   	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT) {
>>   		return;
> 
> LGTM, but I don't understand this arm-specific code.
> 
> And... Do we need to check target->last_siginfo at all?
> 
> ptrace_signal() -> ptrace_stop() path sets ->ptrace_message = 0.
> 
> In all other cases: if info != NULL, then .si_code == target->exit_code.
> ptrace_event(event) users always use event != 0 and != 0x80.
> 
> So it seems that we can just do
> 
> 	if ((target->exit_code & ~0x80) == SIGTRAP &&
> 	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT)
> 
> ?
> 
> I'll recheck... If I am right, perhaps it makes sense to simplify
> ptrace_get_syscall_info_op().
> 

Hi Oleg,

Thanks for the review. I checked target->exit_code when the tracer calls 
PTRACE_SETREGSET after waitpid(). It
was 0 at syscall-exit-stops both with and without PTRACE_O_TRACESYSGOOD: 
wait_task_stopped() clears it when
reporting the stop. last_siginfo still held the corresponding si_code (5 
or 133).

I also used temporary kernel logging to check orig_x0 before and after 
writing a distinct value to x0 at each
stop. orig_x0 remained unchanged in both cases. Using exit_code in this 
condition would instead fall through
and copy the new x0 into orig_x0.

So I think we should keep the last_siginfo check in v2. The same 
exit_code lifetime also seems relevant to
ptrace_get_syscall_info_op() after waitpid().

Thanks,
Gongyi
