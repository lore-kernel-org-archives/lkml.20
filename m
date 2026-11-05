Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897568;
	b=SR3kx2ZutV3CBmCaX8GSKTo6SCmC3ufhxvc6lzAaJUP2uHNo6L2ZllQX/90CtNryHGoW
	 C2JpWcXJ/gqlcC7IeAK2wd0Kp3Pq+FNu5l047ItJOtTNuMHDwZiz8+/+yHduzRL6YwAQX
	 vNOt1J1FY/vdAC2koVIOu+X6OQGp8/ry+GkhRfbZO771K+k7jJc2WHMXm0wpEHpOvWVBn
	 4S0P6Xzpg42afFNNCexqSPEx3JX826ve3vaQH+lFBV/L0Oo3XFQ4/l3ynU/bebCqou34Z
	 XPJNKapvrMGKmCRKW9JObEsIC6h24stFNBkX8Qhs53+fcSXnyYq6cModdXeeep9xZXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=nSFW5RRh4hZ5rBzUgX5M1b3UWZQuXcjvrgbWqmthVnI=;
	b=0nN0RjXQXYTwyHZWjzD4++oQtBVS2pkZv4jzcjPzhbd+/JWNfZ2rjmqp8GPOZ0xJKup9
	 7QLQM4m0TKT6b7obti2XbrH3PcKQ8p2FnnpB7YS9IW2CC4gIgIa0pO1LC37U3iZYNRvcJ
	 nY/1/h3kXy3Ry9qs5mwxrFmRhKeJohkJSu6X4nBsbHnKoyIVUSUaAFqsfjdyVc0qvwNYp
	 JVnP4ZfVp19mUOmJyv4de55zk41iSsPSO9m9aUo/IdG5MjxnMQJl8o1csngze+Ay1oTgh
	 BGbqumdeiAYpGON4tchEcCMo6ngdMNyMKtDCl+zz+zqIDC6r5sZw+w+itszbv4Qci4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50587606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50587606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jL7f75RQHz1XMYJZ;
	Thu,  5 Nov 2026 16:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1793897564; x=1796489565; bh=nSFW5RRh4hZ5rBzUgX5M1b3U
	WZQuXcjvrgbWqmthVnI=; b=usussbVzd7ileuNiYRckiM/g7aePbEoxG6724QBN
	GRqrvMQ3FLrrpqYJKwtcsY7EBdrE4Pcl3H5bzzbpz/a9xnpFU5bsom7m/z2Tn8gA
	QvxTTfSEUB4tmyygwAeaIOzZc5kKO9k556wRzjIWZWhhGkcw/tR+x5j8f82beCQT
	5CxtrcE68E2g9DOIJsXMbcY/gPwE5H1scpsG+ed1Wy+qWM1WS+0J4UczogyUD5/W
	0q/QsQgfbY7otnHqeIrfWUjMdmz6GlxOdBRZo6ujMpKby/WXN0DpGHt/ZPbAMGhW
	PUYBzYcHHKcMQY+OlJo6Jfd8PMm36r5VssZcJembkdh0mA==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 4KGogMbi5wTU; Thu,  5 Nov 2026 16:52:44 +0000 (UTC)
Received: from [100.80.231.125] (unknown [104.135.182.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jL7f425m4z1XMYJP;
	Thu,  5 Nov 2026 16:52:44 +0000 (UTC)
Message-ID: <fae02e71-eca5-49f8-b453-ea9d1e545716@acm.org>
Date: Thu, 5 Nov 2026 08:52:43 -0800
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
Subject: Re: [PATCH 08/14] lockdep: Introduce lockdep_assume_ctx_held()
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
 linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>
References: <cover.1793654853.git.bvanassche@acm.org>
 <71bc2361d8676f1eea3c945cbf21a0c2542d5b92.1793654853.git.bvanassche@acm.org>
 <20261105083746.GP2668804@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20261105083746.GP2668804@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 12:37 AM, Peter Zijlstra wrote:
> So the only convincing rationale from 0/n for doing this was that the
> current annotation can hide the need, and thus cause a lacking of
> __must_hold() on the function.

Yes.

> I'm not sure I understand how this alternative form of the same avoids
> that same problem, and the above doesn't seem to mention the whole
> problem -- either that, or I just can't read this morning.

You are right that the patch description is not clear enough. I will fix
this when I post a second version of this patch series.

>> +/**
>> + * lockdep_assume_shared_ctx_held() - assume and verify shared lock ownership
>> + * @var: context lock instance pointer
>> + *
>> + * Instruct the compiler's context analysis to assume that @var is held with
>> + * shared access from this point on and verify at runtime with
>> + * lockdep_assert_held() that @var is held. Use this macro for reader-writer
>> + * locks, e.g. rwlock_t and struct rw_semaphore, in code paths where shared
>> + * lock ownership cannot be proven at compile time. @var is evaluated only
>> + * once.
>> + *
>> + * Since lockdep_assert_held() is used, no lockdep warning is reported if
>> + * @var is held for writing instead of for reading. Holding a lock
>> + * exclusively implies that shared access is allowed. Use
>> + * lockdep_assume_ctx_held() if exclusive access is required.
> 
> We do have lockdep_assert_held_read(), which then requires a shared
> access.
> 
>> + * @var must point at a lock object that is tracked by lockdep, i.e. that
>> + * has a dep_map member. For context locks that are not tracked by lockdep,
>> + * e.g. the RCU context tokens, use __assume_shared_ctx_lock() instead.
>> + */
>> +#define lockdep_assume_shared_ctx_held(var)				\
>> +	_lockdep_assume_shared_ctx_held(var, __UNIQUE_ID(ctx_lock))
Whether or not to use lockdep_assert_held_read() in the definition of
_lockdep_assume_shared_ctx_held() is the aspect in this patch series I
was not sure of. If nobody objects I will switch to
lockdep_assert_held_read() in this macro.

Thanks,

Bart.
