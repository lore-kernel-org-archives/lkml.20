Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792701314;
	b=h6xOYi3ZriPY53OXBxlEwdBoQ/ZWpoh3BRjKQ7BlIGx9pTB0DomKTe+zzDWfSle6Zu77
	 J6BpD93RH6nrSL61NFeOjZuFoNYM79gAjsJ2/LyN9PXaglpw5RpG/vzbVcqCGs6t2E3cz
	 ikHc0Lx3pUfNlt/QBhZfkawYaS8dPwBGqD422bRnX4+c4f4TPRKDfkgESvxH1qePvngPZ
	 qwC+029mURNeFmrwjRmyfmAUeR0TIOjxawENQOXow4WujuAwi3oqOzy3OA+sWPtATlKTS
	 SCFI8B1bFn6vsYCd4FO/hS+ZovzrdWYKLgMnwz3DH9kJoPzl9s1GRj6V7Q5WEq1YOjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701314;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=h4PjobQvmkY4J4ygeVuGgqglKW1raJdEcSC1JCjP4tQ=;
	b=NSu21fso9XAwPpwX+qqWuvnwZ69LwgqqY2ghQozfGcpuUFmZ/edmkezF287sBxrgt3m8
	 5wPE3YLm0NBnFNNXSxS3wGEWqYANJX9Te+TWmYa878c+QykCi5NQ4YB+JCA/K6iJKEPUO
	 oJ73ooj0zHXYELL6gDH4zx2UcqpnL2xxk8V8O4XFls8jzjLyDoVgD7FQMAyP2r46M8tyZ
	 6s5TTNN3oeH890fw9EYws4H4/BJHb+h+wsrJsRTBJ5LQ0hCkUvMWJC2coGz15ZsJ7k5Sa
	 kNtTxFDdHlk0IGq8PyXS8VsuEhZWm58BgKi+96xWnK5BWFMw1bT5Ay1puAw4ArkA5mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dkSqi0J+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88664606A319;
	Thu, 22 Oct 2026 20:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dkSqi0J+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D10F1F01825;
	Thu, 22 Oct 2026 20:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792701313;
	bh=h4PjobQvmkY4J4ygeVuGgqglKW1raJdEcSC1JCjP4tQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dkSqi0J+v9761Z1x98H6aD1wO4wReARvVya1UFKVAjSyJBruC+h0R4/tGNGvyLVXM
	 o1WyhLIaTmWnUcq5AlUjQUDSF+8KzTviVifPLHymFvKkmcZYKqlCkuKh0J460s7Jhl
	 0Zx3+uHRoPwofljFAdVC0m+ok0OXnTq3Qgg2BrqHvQpGZw0Xbv09ciI9TE3GJSrcxI
	 rZAPU+waWKe8H1Yrjeb+P2LElPUw4WTkTtLgd630sL94QZRWGg/PN7d126OHVBF5MU
	 0ZUojVfkTw9kaTcf20XrY0qmE8BflkmylvZalqjlNrpMW9Y0mjL98t5Z8y7d7W0Z2W
	 MH1R39Eo1fw/Q==
Date: Thu, 22 Oct 2026 10:35:12 -1000
From: Tejun Heo <tj@kernel.org>
To: Wilson Felipe Pereira <wfelipe@google.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Shuhao Tan <tanshuhao@google.com>
Subject: Re: [PATCH 2/3] workqueue: expose per-workqueue stats in debugfs
Message-ID: <atpzgIOeEecUN9Qu@slm.duckdns.org>
References: <20261022155352.1293020-1-wfelipe@google.com>
 <20261022155352.1293020-3-wfelipe@google.com>
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
In-Reply-To: <20261022155352.1293020-3-wfelipe@google.com>

On Thu, Oct 22, 2026 at 03:53:35PM +0000, Wilson Felipe Pereira wrote:
> struct pool_workqueue tracks runtime counters in pwq->stats[],
> pwq->total_in_flight, and pwq->nr_active, but reading them currently
> requires tools/workqueue/wq_monitor.py with drgn and kernel DWARF
> debuginfo. This makes it impractical to inspect workqueue stats on
> systems without drgn or debug symbols.
> 
> Add /sys/kernel/debug/workqueue/stats to expose per-workqueue stats
> directly from the kernel. Iterate over the workqueues list under RCU and
> sum wq->retired_stats[] with each pwq's stats[], total_in_flight, and
> nr_active to report queued, active, and running work items alongside the
> cumulative pwq->stats[] counters.

This isn't really a justification. What do you use these numbers for? If
this is for live monitoring, why debugfs? If for debugging, what's wrong
with drgn?

Thanks.

-- 
tejun
