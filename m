Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E13318EC7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434591; cv=none; b=r/r1ElFDdxzLknxhu9FfGPkqNqiBGdFX6wlpQxCM5lEdtujVTOoPFoiVOLqEM1hEfjVXxKj3VGgRFAXIayKu1Tulspq3T2kCHIpHY3XXq5/pGkDYG/WQDvd1hKid1QPU7kEJ0OpotYd3Zei7NFtQDVDqbOHfLzVel29AzNtYNkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434591; c=relaxed/simple;
	bh=jHv1JBDVC02Dyew7SPRcCMNgLUIfMrIV6wV6B6Lb+lo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B1pWjWtEsTAur0FTlYgUrH6VYQzKyVzvt5GQgOyrgZEGkKs9oA3gVMpR7eIwIEevwlekHzE/W6wKnsHh4XokMNkvvYUkwFxUNW9Cf+VHmnc69Hkm/XFpWeQ2u2BbpaixgYx25/bN/jWG4fOAdj3vRLZBFRhGA3CRW3BgreY8B5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AxP33zKl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AxP33zKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789434589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jHv1JBDVC02Dyew7SPRcCMNgLUIfMrIV6wV6B6Lb+lo=;
	b=AxP33zKlzwD4UTc0dSE1Oo1IU3R6eA0uBsDwU8aFwIZSGSniSldCYmqY/9MhQoPgv8vif1
	LMT8T3FQEm/ccYEfZAzJlYImIEIhX3M03AlOczM9xCQNyXLvXXG/APGN7JQONwqy7tvZKy
	5y/GS0GKBd4Dxn49O8bEPYe2bIh+gW4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-173-sGg0vRr7Mp2C4S2rVlOJ_Q-1; Mon,
 14 Sep 2026 21:09:45 -0400
X-MC-Unique: sGg0vRr7Mp2C4S2rVlOJ_Q-1
X-Mimecast-MFC-AGG-ID: sGg0vRr7Mp2C4S2rVlOJ_Q_1789434584
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3AB8C18345B9;
	Tue, 15 Sep 2026 01:09:43 +0000 (UTC)
Received: from [100.91.18.181] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A92781956045;
	Tue, 15 Sep 2026 01:09:40 +0000 (UTC)
Message-ID: <8acd1e8f-a8f8-47f0-9ede-27f164c0687f@redhat.com>
Date: Mon, 14 Sep 2026 21:09:39 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] locking/osq_lock: Ensure proper locking semantics for
 osq_lock/osq_unlock()
To: Haakon Bugge <haakon.bugge@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 David Laight <david.laight.linux@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Yafang Shao <laoar.shao@gmail.com>, Steven Rostedt <rostedt@goodmis.org>
References: <20260910141908.592414-1-longman@redhat.com>
 <B7EAC6BE-D491-428E-8943-CE2F6DF390C6@oracle.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <B7EAC6BE-D491-428E-8943-CE2F6DF390C6@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 9/14/26 6:30 AM, Haakon Bugge wrote:
> [$Subject fixed]
>
>> On 10 Sep 2026, at 16:19, Waiman Long <longman@redhat.com> wrote:
>>
>> The osq_lock is special in the sense that lock transfer from one CPU to
>> the next can happen either over the common optimistic_spin_queue.tail
>> value with uncontended lock or over a lock waiter's own percpu
>> optimistic_spin_node.locked flag when the lock is contended.
>>
>> To ensure proper lock synchronization, we need to provide
>> the acquire/release semantics for the osq_lock/osq_unlock()
>> functions in both cases. This is currently the case for the
>> common optimistic_spin_queue.tail value, but not for the percpu
>> optimistic_spin_node.locked flag as the proper barriers are missing in
>> some places. Fix that by adding the needed barriers in those places.
>>
>> Note that the two percpu optimistic_spin_node.locked setting in
>> osq_unlock() are proceeded by a full barrier xchg() call, but the
>
> s/proceeded/preceded/
>
>> contended cachelines are different. This should probably work in most
>> cases except in some exotic architectures where the barrier semantics
>> may be cacheline specific.
>
> As of today, doesn't atomic_xchg() provide full memory barrier?
> From the doc: "RMW operations that have a return value are fully
> ordered". I assume this applies to both the intra- and inter-
> cacheline cases.

Yes, you are right. That is why I decide to keep the WRITE_ONCE() in v2/v3.

Cheers,
Longman

