Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C8344CAE4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155563; cv=none; b=ZNg8PlxONa6D+ZfJtQeje3YJJavs/xZxfxj1crEnDBIdvmEJXdHAmeOKO4qia18FCfxov/fK7YafiaeyoZVWciLvy1UAhq7EevuPjeEKXCFQMRHNKucWEL0B9+Q1jTxMmkNjtB23WzQuFB7kVb9s8FPMtX12y0PzYJ8B695PDyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155563; c=relaxed/simple;
	bh=K+hOcBe3GBC7Ri2DCJdFUjLfjCO7Q+0KofV8WLPDMWA=;
	h=Message-Id:References:To:From:Content-Type:Cc:Subject:Date:
	 In-Reply-To:Mime-Version; b=UOC7hMX1YJf/mZwEd6UrMHIeHNMuVWTJGCJeFNYheaauk1U2oiQ0nfwgC2uobegS3o4yEapEalp9vIyuFcYgBMl7XKZiMZ5vaKaCh0bJxfH9hCxdecBJyY0WjVJtTLyLumUxYFiIODCjwH3Vo+pJx96zd+XNcbr1FuXm+2mpU+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=XTjHG2so; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="XTjHG2so"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790155549; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=mjxnrnliC0XiY+HO8diKbu5GSZu9IPZBAsItlfDa7TQ=;
 b=XTjHG2sobT+5D0zCWageba6HExPXCuYlyypBgosKXs6MmywjhNpKy/ltWK6VR29cUfeAYx
 SSbB3U0cH5gVu+NIfLYc+nX7iTHhIgumDgIvkRlbiYQPdExPah6Zmj4S8EtyqcvGlXieAp
 pvc2QK48KBgxWHWkm6mB5UCkNISWE3mUx2vTfP5TRknEefVOmn8IVaLJl3MXUWEYOPm61f
 ZQsCPtOdY+uw2r5uVw0OwOHJiiabfOwoY9m6wI5rN9fsqPWnTGNE8jEBCGv7sYTZhcpVjh
 QLNONb/C7IESGiTPhJcRV48nGcRey7lzIv47klzJE2OmSWT9ergMt9MNy7T7mQ==
Message-Id: <24636241-5f2e-42c0-8013-e1edb39bbfe5@bytedance.com>
References: <20260921095359.3784458-1-zhouchuyi@bytedance.com> <20260921095359.3784458-3-zhouchuyi@bytedance.com> <20260923091729.SmwUqRt8@linutronix.de>
X-Lms-Return-Path: <lba+26ab39b1b+93e6b2+vger.kernel.org+zhouchuyi@bytedance.com>
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla Thunderbird
Cc: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<clrkwllms@kernel.org>, <rostedt@goodmis.org>, <nadav.amit@gmail.com>, 
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] x86/mm: Share the full TLB flush dispatch
Date: Wed, 23 Sep 2026 17:25:29 +0800
In-Reply-To: <20260923091729.SmwUqRt8@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0

Hi

On 2026-09-23 5:17 p.m., Sebastian Andrzej Siewior wrote:
> On 2026-09-21 17:53:56 [+0800], Chuyi Zhou wrote:
>> --- a/arch/x86/mm/tlb.c
>> +++ b/arch/x86/mm/tlb.c
>> @@ -1445,7 +1445,7 @@ static void do_flush_tlb_all(void *info)
>>   	__flush_tlb_all();
>>   }
>>   
>> -void flush_tlb_all(void)
>> +static void kernel_tlb_flush_all(void)
>>   {
>>   	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
>>   
>> @@ -1457,6 +1457,11 @@ void flush_tlb_all(void)
>>   		on_each_cpu(do_flush_tlb_all, NULL, 1);
>>   }
>>   
>> +void flush_tlb_all(void)
>> +{
>> +	kernel_tlb_flush_all();
>> +}
>> +
> 
> Would it make sense to drop kernel_tlb_flush_all() which is used only
> here and instead keep flush_tlb_all() which has also external users?

Yes, that makes sense. flush_tlb_all() already provides the same
accounting and backend dispatch. I'll drop kernel_tlb_flush_all() and
call flush_tlb_all() directly from flush_tlb_kernel_range().

> 
> Sebastian
