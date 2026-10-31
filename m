Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407669;
	b=JyBefLsRsRVEWI3DlzpXQ41ybGyXTtQTFHh/GTFGRpSU8y9mMdpYM2zg4yMgKD9nicvP
	 /dWPdAIO+Dts3iKjY/uTva2cImIhSkC4u8clnj+RNWPCXObHUiWfOqqv0W/v1S5Tlc5rr
	 EMfF4wpFB2HCBx/salZwALck4fLdWC8v3V52uq6yleeydJLabOTYiNgnGKll3z2+OELsA
	 ZCGwKUvnD4RdXGa9tXB9RBuOsQUNXi3A2rCKpPvtpjzeMtVXARYeFvR/snq8LHhBxIwW4
	 NNxApMS4PEJirMqPrL4EeQJdu+LW5DXqBn5+Hki/wUFPdq8yOEsU9DGCLQzWJZ+dZlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407669;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=6fhD2qwAKEE8buFW7sdA+FNaQmZ6JEgXK/EobNzcOWg=;
	b=mvvi/5YjAjyOiJB10PcAufRdv3UFCc6/I/aB255dbKazRgCG6Pmrji8xn5Q5axtWtN/e
	 8oqSCOWszbJuIWVnqbKC/zBTwR2/WBW7+PJ9WnPUVFgPe1b2+iUiE/dJMWqZmE/qwdOFB
	 p7piBOhG2um/cS1o3ZFMKX8un91o8iJ9nJdMb3LwYNJFcH7DSMjUFP8ieqFEOvyu817AI
	 KahrcZT4CA45oitqlrdiwMeU8poupy7DuggUaSyUWLveliHXzzloo/qmhyf7Q5s2boSMC
	 hxUmlAS7RJgRY9GnChWwMBhnyOFY4WoRULMvYzdvE+TQg47d0TMHzifwEdWvNvPT3lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="KJ2P6A/7";
	arc=none smtp.remote-ip=91.218.175.157
Received: from mta0.migadu.com (out-157.mta0.migadu.com [91.218.175.157])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DA5606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63DA5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KJ2P6A/7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kevExdvvHDN/m+BeEtkCzD1iYaSMM0hTbZZ7U+mTrjc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793407666; v=1; x=1794012466;
 b=KJ2P6A/7SyWAEKeg/sUN955X1AFHrN4ldIplQ8ZR+pkcpvFMmfOse4BQcy8rsBauzU9l0oVy
 HHEXfu4WxwfQ1p9dfG5Yc2k4aRN+Iri9cGb26AnVZDdupSdtyzKzXjdG4vC9E1c0E2DY7jnRrx3
 SCex0gAHMSObJvuw2P+V8zZ4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 5b6af64fea02a9fd;
	Sat, 31 Oct 2026 00:47:46 +0000
X-Mizu-Trace-ID: 5b6af64fea02a9fd
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 3/5] memcg: use high_work for kernel threads
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261030205418.341214-4-shakeel.butt@linux.dev>
Date: Sat, 31 Oct 2026 08:47:30 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Tejun Heo <tj@kernel.org>,
 Harry Yoo <harry@kernel.org>,
 Meta kernel team <kernel-team@meta.com>,
 cgroups@vger.kernel.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>
Content-Transfer-Encoding: 7bit
Message-Id: <D333E657-EFA5-49CE-B7EE-3B89F758BB1E@linux.dev>
References: <20261030205418.341214-1-shakeel.butt@linux.dev>
 <20261030205418.341214-4-shakeel.butt@linux.dev>
To: Shakeel Butt <shakeel.butt@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 31, 2026, at 04:54, Shakeel Butt <shakeel.butt@linux.dev> wrote:
> 
> Kernel threads never return to userspace, so deferred memory.high
> reclaim does not run. Reclaim and throttling during a charge can also
> delay work they do for other tasks.
> 
> Treat kernel threads like interrupts. Queue high_work for the first
> cgroup over memory.high and skip reclaim and throttling in the charging
> thread.
> 
> User workers created by create_io_thread() and vhost_task_create() keep
> their current behavior. Vhost kernel threads use the new path, even when
> they borrow the owner's mm.
> 
> The worker requests a fixed batch of pages each time. A fast allocator
> can keep usage well above memory.high. Kernel threads also skip
> memory.swap.high throttling and its high-event reporting. The memory.max
> and memory.swap.max checks stay the same.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> Acked-by: Michal Hocko <mhocko@suse.com>

Acked-by: Muchun Song <muchun.song@linux.dev>

THanks.

