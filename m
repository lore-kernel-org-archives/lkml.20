Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793940945;
	b=W7R70hlJMWo3pGxz7r0DiegcYyaz+kZpvhmEDU8SHgKwOrNOIv4gpJEg0iqMp2ktSU4J
	 5WhR4RwDhJEMT9BEQd1oS/AY5hR+1wlOK3zuPIf+Sw9vwyNUHCdXq0uUoaRevVtG2rjkN
	 V9n07U9ZhmZkI4o8Mv5A4P/SOCDEjyUUwbQ1XD1i3HkxL5TGpFfhO8r2o8hcr/0gnC9JP
	 ShwDHso1G7ZXYGXhiicrPDaWm0umo0WrOh7Yd8M5oWCiIznZR1Zaa/WLJoF+nfzRfirfJ
	 OjdtEH9oWJH8iwqkqH8yJadlIDYQJwZPN1GheBeUAJciabQFf8XPYK7JBHFLhp8Yrkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793940945;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=qLR80LYENxOJjQ+5aplov6yK5kPkun01wAwUopgoAys=;
	b=1sHGOUAAjOhvMDOkwQjf7CF3vNA2y1gORa/A/KfrP/xVqHayrYFGcVONqIFFR1Uh5FTZ
	 BKH4M1bWqNjnuJFvm0zrgSCQmtQqeTsLKuK7GHt4kBJK5EyRwzE05PiIau1tj7jflwnZB
	 y6GAhnLEEMMV63SUd08E6wGN2MAxy6/dG+0KgN6YsZQyNDCEiRJ98rGuLPmcwjQhB/82y
	 pv6vx7sbl8mjUfWPp4PiJRIBi+z6E48HOZp/vnT8vDaC25jqt8VP7zFl6+sdaqQQDo0IC
	 ThrH8zR6A5WVwcnWFBcU+jufujNWPmG8WsdI7CwZV7aP9KZ0Faff13aazq5jrVbfGAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NfhXkF4i;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D753C606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D753C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NfhXkF4i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793940943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLR80LYENxOJjQ+5aplov6yK5kPkun01wAwUopgoAys=;
	b=NfhXkF4i7kw0um5XJlkJZbIWUE7uq/gTNnlJvrYtCVkg2ysSCnvf3SgpO9DcnPA/Jtdrtb
	TX/qs5JjxXXFOLf9nkchsxAZqGPDTlQf9VIEL8leI5BmW0STUqTQxtJdTNMwDUBmc6AbjE
	7FlbPwgJPXYBfp0AqDqiqNQYMb0SROQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-696-AD-gd7j4O_-npBhV6jY7gg-1; Thu,
 05 Nov 2026 23:55:40 -0500
X-MC-Unique: AD-gd7j4O_-npBhV6jY7gg-1
X-Mimecast-MFC-AGG-ID: AD-gd7j4O_-npBhV6jY7gg_1793940939
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3BABB1944D17;
	Fri,  6 Nov 2026 04:55:39 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 025903001DA7;
	Fri,  6 Nov 2026 04:55:37 +0000 (UTC)
Message-ID: <98a82cda-e363-449e-9b2b-8432f8fdcc3a@redhat.com>
Date: Thu, 5 Nov 2026 23:55:37 -0500
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
Subject: Re: [PATCH] locking/rwsem: don't let a read lock steal from a queued
 writer
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-kernel@vger.kernel.org, "David Hildenbrand (Arm)" <david@kernel.org>
References: <20261105-rwsem-dont-steal-from-queued-writer-v1-1-275e070f426f@kernel.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20261105-rwsem-dont-steal-from-queued-writer-v1-1-275e070f426f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4


On 11/5/26 3:24 PM, Lorenzo Stoakes (ARM) wrote:
> Since commit 1a728dff855a ("locking/rwsem: Enable reader optimistic lock
> stealing"), a racing read lock can steal an rwsem from under a queued
> writer whose handoff timeout hasn't expired yet.
>
> This is most problematic when an rwsem read lock is released then
> reacquired in order to relieve lock contention, as instead it will simply
> have the lock handed right back to it ahead of the intended beneficiary.
>
> Naturally, this behaviour rather defeats the object of doing this kind of
> thing, so this is less than ideal.

If there is only one reader doing this release and then acquire 
operation, it will leave its task_struct value in the owner field. So we 
can check if the owner field  to determine if we should skip the lock 
stealing operation.

Something like

diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
index b9c180ac1eee..1f0fffd75c18 100644
--- a/kernel/locking/rwsem.c
+++ b/kernel/locking/rwsem.c
@@ -1019,15 +1019,17 @@ rwsem_down_read_slowpath(struct rw_semaphore 
*sem, long count, unsigned int stat
         long adjustment = -RWSEM_READER_BIAS;
         long rcnt = (count >> RWSEM_READER_SHIFT);
         struct rwsem_waiter waiter, *first;
+       long owner = atomic_long_read(&sem->owner);
         DEFINE_WAKE_Q(wake_q);

         /*
          * To prevent a constant stream of readers from starving a sleeping
          * writer, don't attempt optimistic lock stealing if the lock is
-        * very likely owned by readers.
+        * very likely owned by readers or when the current task is the
+        * previous owning reader.
          */
-       if ((atomic_long_read(&sem->owner) & RWSEM_READER_OWNED) &&
-           (rcnt > 1) && !(count & RWSEM_WRITER_LOCKED))
+       if ((owner & RWSEM_READER_OWNED) && ((rcnt > 1) ||
+           (current == (struct task_struct *)(owner & 
~RWSEM_OWNER_FLAGS_MASK))))
                 goto queue;

         /*

------------------------------------------------------------------------------------------------------------------------

Will this help?

Cheers,
Longman

