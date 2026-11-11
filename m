Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403272;
	b=H90MrKg742WYAhYdUBQKM+mtIMidx24PK1JJ1dBeGAB3sUTGiRnEH4GZ4PgPIDYX3BI9
	 VovSsd7V2jCo+O0sYUEgbdYMdG+BMu5nHDHduQYV4PpnruD3oxZ0L4UJY7bZU6jlQbNRz
	 d8ZYt2AQFMQxBFH8g63YTiuVzpW9Ukal6A9QhdFieLkTx6yObE7r3z6rAmndyxKrzGUS6
	 vb3F3wlqK/+soeWhwu+08i1lWLoHxsmieFMjKp5PI5MpJYmQFgI6qWZioYrD9EyhWe/Vc
	 VMen7CfYSDT+9GIxHxZRwHcN471+ZGcTCZeNv/6bTmXqRRZzQg3Y6YF6tfP+SrYNU4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403272;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=PYuoCzh2yR7S4/PCmlQnO0kIR6L0HxYUQSPuZmL3Vl4=;
	b=TykGhv+Ly3/6bIxy8DFTeooVyHRq63h2O+jcjOycAbNPuEIYwzh19xoFUkGz4B/I6hBJ
	 5wIPw4yxjp4Q4n1+lo3l9VdLPASYK+sCsYmQuVYAsRJ+qkt3zAuQ1sL6Agw5EM86vHHrR
	 A36RLT3lXNWD9rVXPOcdDGyVMTRkqWjqL0QKkj4APIk5itLgTsLdk+zKpw9cYBN5aO/HO
	 H4rpTHg4PNA8hxjP9OFBC6ch3xE8aYVhHzivwXloUAEDIrjAntwDjJBjAgibeLpdJfbKv
	 3+DALFtWyQ1fYm4GNkHsZMFk+3nOB4Ha0om4h5zFHz7Y7UsFCjqdRWGZe1USmJZgSrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DeXdPd01;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E40606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43E40606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DeXdPd01
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PYuoCzh2yR7S4/PCmlQnO0kIR6L0HxYUQSPuZmL3Vl4=; b=DeXdPd01EPNeIA8UkUK400Ft/y
	7Xh+/qbI5mEkmurIwL9kovCfjH7xxWtktMrayqxXXi1u+zjUBqawOQUs5CEN/WeIgYvr6kzED5gl3
	4AK9QA/Jel26w0wUBYKcd/8LFHpoI6FMq1kOaZcOVATD9Bc+DPp3CRKu3qaFfoOzhaaJgqO60ksQN
	lvYq5MuZRecjTfN+HSzgbv9s9rAFQThs8kc/y71jPeI+3Q36Q1o8Je2EP9rNI5J42ItlevQ1WkwpF
	zNQJndoN8RhxVs1fZMdys6nrkrtztyabR2eI/+w7Bcs1zt1jWGZ1P0kF5hpyB+h8wzJTFECOQerKr
	FhgYoKjA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8GA-00000009AL8-2l1X;
	Wed, 11 Nov 2026 13:21:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 262933005AF; Wed, 11 Nov 2026 14:21:05 +0100 (CET)
Date: Wed, 11 Nov 2026 14:21:05 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Shivank Garg <shivankg@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Pedro Falcato <pfalcato@suse.de>, Borislav Petkov <bp@alien8.de>,
	Bharata B Rao <bharata@amd.com>,
	Hrushikesh Salunke <hsalunke@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm/memory: drop PROCESS_PAGES_NON_PREEMPT_BATCH
Message-ID: <20261111132105.GJ2668564@noisy.programming.kicks-ass.net>
References: <20261109-clear-pages-batch-v3-1-6693efe18dff@amd.com>
 <20261111124006.GI2668564@noisy.programming.kicks-ass.net>
 <avRnJiDLdGcbSW5d@gremlin>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avRnJiDLdGcbSW5d@gremlin>

On Wed, Nov 11, 2026 at 01:12:06PM +0000, Lorenzo Stoakes (ARM) wrote:
> On Wed, Nov 11, 2026 at 01:40:06PM +0100, Peter Zijlstra wrote:
> > FWIW one could do:
> >
> > 	for (int i = 0; i < nr_pages; i++) {
> >
> > and forgo the earlier variable declaration.
> 
> I guess we all got used to the existing patterns and I for one only
> recently found out (doh) that this was legal in kernel style (because I saw
> it used in KVM)...

Right; which is why I keep reminding people this is now 'legal' :-)
