Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8839C3C109D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788984857; cv=none; b=h+qypNm1Dr7muXHokrkqWZ99IysprID3/bzu9l5OmKsArNUZzwT0Xc1VfBga1GrGX9IfnJ+w1wuMAQbFmXfzDtfowbKtI+uzIIlkRLHgj1arNl5BX/dWgJokQthYsHruIReSi1Yi8eEtR1qbINyx5ebfiQC6a8xwGhdlD4T+1I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788984857; c=relaxed/simple;
	bh=jsAfD0x6H4CpXABTrjk+C+iNJfFFVHIaPK+HNZm11pQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OXUYzu88pvKHjb61bWPEHpI27uP40GFDUt3SC7o8VGiKCxLqMs8aiIJ+bku6INdDC00b4CJwTzrOFrMz6C45kuZVe86TAP3xmumEIyITZ6V4RUtu2Ait0Ae65KgGEbsO5jzQnjaq4YcrHX35AkfWZOCJvJzLhukbWUvkNYHib8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I8UY9KYC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I8UY9KYC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788984854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lKTM+YFNwQBQdailf/krjJt9YY8aumvxrk1D4x3TQQU=;
	b=I8UY9KYCNi0SGnPGw5RSQ51pyJ4A6hAtQs1FqrRPZMndzO28vCHO3GpKvuX2YtIqo5HWNB
	x59dxoepCwpxyWhvMpB7HNSGxTmySlSso4f7UQoUitoCeIcFt4vjpPx0besjfaK6vIDxje
	yt19adcbsM1dc7x88WbhCwsAl65yybg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-363-z87LLbsnMXOszc9WnPRl3Q-1; Wed,
 09 Sep 2026 16:14:12 -0400
X-MC-Unique: z87LLbsnMXOszc9WnPRl3Q-1
X-Mimecast-MFC-AGG-ID: z87LLbsnMXOszc9WnPRl3Q_1788984851
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 77F931954B1B;
	Wed,  9 Sep 2026 20:14:10 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2C6EB1800576;
	Wed,  9 Sep 2026 20:14:08 +0000 (UTC)
Message-ID: <44bdfc4b-4729-4dc3-b7b0-53c671c5ee34@redhat.com>
Date: Wed, 9 Sep 2026 16:14:07 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 next 0/9] locking/osq_lock: Optimisations to osq_lock
 code
To: Haakon Bugge <haakon.bugge@oracle.com>,
 David Laight <david.laight.linux@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yafang Shao <laoar.shao@gmail.com>, Steven Rostedt <rostedt@goodmis.org>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <CAHk-=wget=mgjpkPJ+3-tueqo7AK1m4MR_Jqht6bj3-w+FhQHg@mail.gmail.com>
 <20260907182705.54585f73@pumpkin>
 <89F7CD08-2BDD-424D-AA2F-77D72647D93E@oracle.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <89F7CD08-2BDD-424D-AA2F-77D72647D93E@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 9/9/26 10:15 AM, Haakon Bugge wrote:
>
>> On 7 Sep 2026, at 19:27, David Laight <david.laight.linux@gmail.com> wrote:
>>
>> On Mon, 7 Sep 2026 09:08:28 -0700
>> Linus Torvalds <torvalds@linux-foundation.org> wrote:
>>
>>> On Mon, 7 Sept 2026 at 01:41, David Laight <david.laight.linux@gmail.com> wrote:
>>>> I've fixed some broken/missing memory barriers but left the initial xchg()
>>>> when acquiring the lock as a full barrier, I think it could be relaxed.
>>> Well, it should almost certainly be at least an
>>> atomic_cmpxchg_acquire(), since that's what osq_wait_next() uses for
>>> the contention case.
>> I'm not sure, but am no expert on acquire/release barriers.
>> The 'fast path' osq_lock() code only has one memory access so there
>> isn't anything to sequence it with.
>> The important one is the smp_wmb() a bit lower down that ensures the
>> list tail (or head) is written before the back link.
>> When that was missing things went badly wrong.
>> (I think the WRITE_ONCE() could be a store_release() instead.)
>>
>> The ACQUIRE semantics were added to ensure the 'node->next = NULL'
>> assignment happened before the xchg().
>> That assignment goes away in patch 5.
>> But I'd want someone who really understands arm64 to comment.
> These are preliminary results. I added osq_lock's to my
> mutual-exclusion selftest [1], which has not yet been reviewed. The
> test is based on v7.3-rc2.
>
> For lock acquisition, I used:
>
> 	preempt_disable();
> 	while (!osq_lock(&el->mx_osq_lock.lock)) {
> 		preempt_enable();
> 		cond_resched();
> 		preempt_disable();
> 	}
>
> with the corresponding release:
>
> 	osq_unlock(&el->mx_osq_lock.lock);
> 	preempt_enable();
>
> Assuming that this is a correct use of the OSQ API, the OSQ test fails
> on a 160-CPU bare-metal Arm system. The same test passes on a 512-CPU
> AMD x86_64 system as expected, showing at least that the test is
> capable of passing.

osq_unlock() must provide the release barrier. I think the two 
"WRITE_ONCE(next->locked, 1)" should have been 
"smp_store_release(&next->locked, 1)".  There is an xchg() call before 
the WRITE_ONCE's, but it is on a different cacheline so it may not apply.

Could you make that change to the existing code and rerun the test again 
on arm64 to see if it can pass?

Thanks,
Longman

