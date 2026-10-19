Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E944908C9
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400017; cv=none; b=r2ydvHbKarZK1jZvmHmODcdjrJ9VqnyrP85hTkEQBoxd5Y0UQTa3elaj6eWQEfRvF3mUaCFGtv350rxGWBuW4j+AZy9fjCL85GOdPh8kmZJXN4VatN2SchpfWbc/5r2VvhF1QJzl70ppwtRBfbQPlUA2eGpXiWyKQMsmUg3O+SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400017; c=relaxed/simple;
	bh=PuECBq7rHCOnPJmiez2NwEpZpJw99GayZp2VbNnwfpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=alAtBkWTkza/RKx7QWFlI8nJfiyls3m/XTvftJIs6Hws/08ATUPVS9RS+B9eRKAqoktiDP+ZCGl2R7GlugfVnFR0dZEQ5IH0jE2zXjSTicm5CYhs9d/QZeAP+FQ97Hctd8Y0DA0DCUXivGgcOJ+voDgQ3VjA6nLPdwYQ4Mb29Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i51MbVfF; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i51MbVfF"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3535a54bed9so2537364eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792400013; x=1793004813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IUQKxK3gJveo0GbdIu8MHrrQ2HSW0SFpxRsXuUxNszA=;
        b=i51MbVfFNI/71gqMlggaWVcQXM31/I6EJ3bk32U0rNW6xvGgl8w7k+tVvvsE6ZyyRc
         KJ3uT8k4Q7utXfUiWm5jd90zD25Mks74HqfFjgMcimz3IYz5k4g8WN8PGownbJFN+CIA
         0Grdb+6olOOAEHqaB8/icDmUWxBJnW50KtJEwC4cJPGLZgsjKbr5wTLVbfLFaAuHTIts
         F9Q7AujbnYZ8tGq4JHlh7GVF24+6KZp7U5WCuyS/OST5/4mUA97DucLepQ/GVarj9Wtb
         aZo7IvlKzepPHgQ2N9D4Yf70XJwLUKOOm/iVJty6TUZdSfMN8Z0kYGrgUDmsCHkxVKVo
         VZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400013; x=1793004813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IUQKxK3gJveo0GbdIu8MHrrQ2HSW0SFpxRsXuUxNszA=;
        b=M+hv7cvisCL/PDyDcgk+cWuE95VNSnkgRGoLydC1XaIbmz2BnokdJWln4Z1269hYs8
         DuBViiscg1mSmoYMS6Jduub79I1KzIAPKqOid0vQ8cPNWq+oa8yA1uy6+IBvpyneQJne
         pAOBxhzSC8Sb8OVQoBPV0NcN87YbS8xgt2YpStlDm4EIcGN2d+w1e3H1w9qCgK5kUxDS
         BSSxwhsy5vMGGEARMl58Ma5l7IBZrygRSQY9y+aGWtrm9U62ngn/BQhjfTZo0NPPcrdG
         JFu2DlgdzKqc/1x7NwggV521V7XC4A+WnvmJPoSlY5WRW2wgMFoSx0lLlb/tINYdNrLX
         /Q5w==
X-Forwarded-Encrypted: i=1; AKwUvBzMaYoagC55JgVJ8rP4i/hpbKWwWMJ2rZCikqeMtW/GsiH+vinsaZ/Aa5f4+LsC0VWC9T0c7kV++FQKB1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJW4iDB5TgP4LyIeEvONIi+YZrxx03yisUil8VeM7ds2w3Fiv8Y
	+UDPGdQBgV6a9oZKcIYMtwCqZFlEmoV9czvGvwymSCCx+nzs9NSjiius
X-Gm-Gg: AYBFou3jbfHShJX53KKncFsCJhZuw/H8NFVU+3/ArVwoS7QLU0DO9iMB4lnF9ya3CWT
	4W/xwlVadId8vpN0SvR5U1DhwkHlTXdM9EMsbN4l7GGqI3lcMV47RJ/l+C45PZTHBN0WcIwvE4q
	N+tq6j4EzLsqH6NM8RRXFHcoL/EYgyjRHlYP8NSjK8dC/5qPWNgn2yuIR+peZl7t6hWg2/SgKZt
	0L53F6v7rLrkJTXtN5BsTGugHgMTBJ/myr06EYsyw2D3SjIEIKYO8Pdk2SNrkXHVOEFsEPCSSFN
	/CgsKqdYxV0vU/RWIj7v9f83QxYSIyryANOXWGPaeZUntw3gwuRkuTKCCUDm+3dLwOPsz2JvqPu
	HIgk7fo5JfslHN3w6v0yRSOKerixlDd/Egm7imdBeQKwgJ+n6YijKTHEolEY6tNw0p/MO9rLATY
	Svdf9g5knotLiBoVMSbhEM6RCtuERqTwLYcFiY2ZVMrOha5nh+/c/wiXisBQ5a/Ak2cyMrUpPe
X-Received: by 2002:a05:7301:717:b0:351:1bdb:e3b7 with SMTP id 5a478bee46e88-361a186348fmr9105771eec.15.1792400013280;
        Mon, 19 Oct 2026 01:53:33 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081bafa7asm30069333eec.14.2026.10.19.01.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:53:32 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mm/compaction: stop repeating failed async compaction on every THP fault
Date: Mon, 19 Oct 2026 16:53:24 +0800
Message-ID: <20261019085324.2562579-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001-bug-mm-thp-async-compact-defer-v1-0-0174c7923430@gmail.com>
References: <20261001-bug-mm-thp-async-compact-defer-v1-0-0174c7923430@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

A real workload has since run into the stall this series is about.

Mooncake, the KV cache store used with vLLM and SGLang, backs each
rank's host segment with MADV_HUGEPAGE memory and registers it with
the EFA NIC, which pins it long-term. Its commit message [1] says:

  "under the default local NUMA policy every THP fault on a full node
   runs direct compaction before falling back. With 8 ranks x 190GB
   this made registration take ~38 minutes."

They worked around it by binding the segment MPOL_INTERLEAVE across
all allowed nodes, so no node fills before the others. That gives up
node-local placement, and a task that sets its own policy still gets
the stall.

[1] https://github.com/kvcache-ai/Mooncake/commit/c3fa13ecaf1038df933dcb784ff8ffe026381100

Thanks,
Qiliang
