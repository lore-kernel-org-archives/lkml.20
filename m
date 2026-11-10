Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319122;
	b=khCVYeUX2kX8Zo+GSFO5CT+jLGKv3iseyYbXa/vuMRUZOe1u3VPc1P0OuMLXmT2fwjgd
	 NqSO6xwl3GUwDNB+oV+7v2t07ZMOvEDSvE5IpUSAUofNc8b22XGnjxYacFKCVE6X1Xf9t
	 E4vcMELmroaavjcWJ1cWABjYd/9ednspglUQxn1cy4noYM1eK16dwUTkcEyUXZUK8VT9C
	 vRmd0f7C120KFLjMEhZ/Z5tvlS6m5b+w6Z8G1rJWIP0bHEL4LR9a+gUjbUmC14VUSRhWP
	 V3gG9DVnwemmuYMOTfcxXdRksrh9fE1V2fL0jaNgps1SifGDB7ZDxg7USDi1jlIYTiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319122;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4AuBCb/I7k73HlQgjzDYi07i0QVcp76kIK/7/UWRP9M=;
	b=K80yilUJ/cJOcc9GVvfx5lDjBJo4cYvgrgOJxBBe7CDK9YHkgfMzk35dW1xtNHEoEg+9
	 CNFVCvcUvFeuukeFl1WYVz+IkXILLHNlSv2sGtN3fjY0I6NzuukW84RjGUbE5WbDttVLo
	 51Rx9z+zs2HM7bKMkBX0iF7lfziBs0bJRG5Djaafer+zy6faJa/q5ryuw5tcJ+TVx4exH
	 bUJphRtuXWqYHOSvqEo8vPSC2E2cbNw4BLsZuzOt+m9atWtSlstXQ1zbT3W4urX0cvF77
	 r+A+ZP8t2fylvLKP4OyqN9Rphz7OeDcPQgqp/BD3k/iAPz20iF3WufyXedo+ABOfQ8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=S62sLQx+;
	arc=none smtp.remote-ip=91.218.175.139
Received: from mta0.migadu.com (out-139.mta0.migadu.com [91.218.175.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA92606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCA92606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=S62sLQx+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4AuBCb/I7k73HlQgjzDYi07i0QVcp76kIK/7/UWRP9M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794319118; v=1; x=1794923918;
 b=S62sLQx+LhnmDLUJhCz6HfRLqoEgB53G28YeYUfqm/sJ8OaI6ayyqNncZ/XA4lBMPS1JaX9W
 SRK/9GVmYZED6mtbEeyY8mOE4Z9B+Lc4ORbd1NaT90zIha3O+toW1jtzLJ/WCi7EBPx/7Bhgoxz
 xExlXvlJym6+jtHWz/2+W8Jo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 68181a37af8247a7;
	Tue, 10 Nov 2026 13:58:38 +0000
X-Mizu-Trace-ID: 68181a37af8247a7
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
To: Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>
Cc: Qiliang Yuan <qiliang.yuan@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <kasong@tencent.com>,
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
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] mm/compaction: stop repeating failed async compaction on every THP fault
Date: Tue, 10 Nov 2026 08:58:24 -0500
Message-ID: <20261110135824.3264904-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102-bug-mm-thp-async-compact-defer-v2-0-b407e974db54@gmail.com>
References: <20261102-bug-mm-thp-async-compact-defer-v2-0-b407e974db54@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Vlastimil, Johannes,

Could you share your view on this series when you have time?

One known issue in v2: the cc->mode != MIGRATE_ASYNC check added to
2/2 blocks clearing stale skip hints once sync compaction is fully
deferred, so local THP may not recover after the pins are released.
I'd drop it in v3, but won't send one before hearing from you.

Thanks,
Qiliang
