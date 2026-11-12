Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450435;
	b=Oe8vzJ4bWnTsfSCPytJTojCzFnUUlz9b600/e3Y0Qagor2vsdGCI7SeZlVWr3ATkVoNQ
	 eZMczFXQ/gThTNhKNnPnmZsCrotLUe5CwoAhVUW9QGWCgLY5GO332JTN8zDzXdmS/1Tj8
	 rDmF/HClkWjWKuSrPU+uu5zIuQ5i9K59x9V7eYiutHltimUg2k8mBSTujcLE0Q8oz6o8G
	 h0eBTXurA4RfQdKrYuyeb1Fx255a8FXSfWkN46h7xdDbFdqLEUsZ4nbYGxQ8hdGSy7YzP
	 6R94Ny7uSZ8tE4HK+5yJWSzESgSn0vC4Hkw/VxkHii9Ji4SlYsgwYW1VbdYAPPPHdyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450435;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=2kXQUvq0pMfnz4HzoTzQFMbsuHXEC2i6vljk1NL33ts=;
	b=OaXZptt0WmOGsPYHS45j8Pvo1MJEPk2+45788hRwyrGT6byC5933uw5ZeEZlpqrusrCs
	 L+uUYXwEBA9yHKpQlR6L1qgoK/jSvrOHXDC1O4K1tcSuHP2wkFu8TTq75txujDMj4i1UG
	 xpJ9jJTAgDFrcFZrj6i1+HY6FMKzLHJs/z6QpmWD6jqfEHMvFPc175GDqteuRl1CLktT4
	 H3ay5cTXikFGYQjWzPLz01cwNx4u9fFWZuc07IMDGQH65Fm6klwEEqcYUxvvbN/w8rGry
	 59NUFCs9DA5kFyM8zSOpKDIF64qDo1B5PTW37VxRZ/+vKdx1HL6dh8UCSN6GSaNqthw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="i/H2hxN1";
	arc=none smtp.remote-ip=91.218.175.139
Received: from mta0.migadu.com (out-139.mta0.migadu.com [91.218.175.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E715D606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E715D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=i/H2hxN1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lsq8XQTPFu5wkpyrYlGgMAgRBeoL0TX9wwuTx30+lDo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794450432; v=1; x=1795055232;
 b=i/H2hxN1wgzBhaueWtScsLuQzMUD+RLCn6qIqP9BunWdm36qayynlHwqyVDYy8yZvY7w0f/c
 +bWmVJ7Dernv/v9KUsPDxMlTBmRvTpyjDfZrCaH+VanmPJxO1LUoOsNUnAUwq+Gh9Z665nDkmWk
 5wCk7Qkst9lPERceSJBfZZkM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 6e62475f303e8754;
	Thu, 12 Nov 2026 02:27:11 +0000
X-Mizu-Trace-ID: 6e62475f303e8754
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH] memcg: flush nr_charged_bytes when the obj stock trylock
 fails
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261112013220.4064478-1-shakeel.butt@linux.dev>
Date: Thu, 12 Nov 2026 10:26:56 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>,
 Meta kernel team <kernel-team@meta.com>,
 cgroups@vger.kernel.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Chris Mason <mason@kernel.org>,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <16F05AF0-BF45-4206-8B42-0D2AD6CA2B20@linux.dev>
References: <20261112013220.4064478-1-shakeel.butt@linux.dev>
To: Shakeel Butt <shakeel.butt@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 12, 2026, at 09:32, Shakeel Butt <shakeel.butt@linux.dev> wrote:
> 
> When interrupt code, such as an RCU callback in softirq, runs on top of
> a task that holds the obj stock lock, its trylock fails and the bytes go
> to objcg->nr_charged_bytes. Nothing empties that counter while every CPU
> using the objcg keeps it in its stock, so it can grow without limit.
> 
> Users see memory.current and the "kernel" field of memory.stat keep
> growing while the cgroup's real usage does not. With memory.high or
> memory.max set, the cgroup is reclaimed, throttled or even OOM-killed
> for memory it does not use. The counter is 32-bit, so after 4 GiB it
> wraps, and those 4 GiB stay charged to the cgroup and its ancestors
> until reboot, even after the cgroup is removed.
> 
> Fix it by uncharging the whole pages in nr_charged_bytes whenever the
> trylock fails.
> 
> Fixes: 200577f69f29 ("memcg: objcg stock trylock without irq disabling")
> Reported-by: Chris Mason <mason@kernel.org>
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> Cc: stable@vger.kernel.org

Acked-by: Muchun Song (ByteDance) <muchun.song@linux.dev>

Thanks.

