Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797735;
	b=l+ZV9m6MyjurHiJrl+xWdeRr2+rJMsD8gjINRVaQ7zbeeip+Z8AKKSjLNHHE/Dhm0feK
	 6mFsI8sYSV3JJwCvMvl4aqG0SYvX/ZktBpAfUjPuQf/MlZ4Cv9B+yjod1HMQtnCFAGClq
	 KXFJohnNoZBogyfavdjZ+fGou7uBgbk0aotK28Jw5PZEAsfRMoHhdUaMNBFo5jGZoeaSe
	 AYiGN8cgRbx4jtPzfMjCnIfpRQ6VzIkiijx3TFR48ajAEGn3s4CN1Vj3at5Tbcpcz5mZP
	 1MlfYGsB7ju/fWpBi/81sMxfrKi2im4G9AkRe25Wmh8y8EQm1NPll/KOjvJv4CR1Reg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797735;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Km4Cv0O0nuE0+Y+BE7m08mP9J2XXD5bcoWZppFqnwaU=;
	b=sS1+7ysCjStI1w8fGnHuKfr39jL8VSsVLBFU4nZNJrs0CPukdkyB7iebjpeXck+P253E
	 6JmCpSuZUwWnR9JreqER70j888vywlzkzmcdjZehVf0ico6TJ86exrcKys8MksmEb9Huh
	 dceldZMPOf2KdYiyGjwgTnkvMdjFQDPjbTwZQ3mvOkWACrAbcjKehP160/Ph2TQGJROUR
	 4E0qbzKF7QNCZAz7hMUvu0MtUIa6o78HeECnUSKXmmTnZ9v7B37l73P99l/5UlFmOQzG9
	 tbMAylOfeXaVx1osjgHx6U6CSrwRbDJhMoiJ4T3StbT6UQxW2KWa7u6gHri0SS6g7BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=coHRrqJ5;
	arc=none smtp.remote-ip=95.215.58.246
Received: from mta1.migadu.com (out-246.mta1.migadu.com [95.215.58.246])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA43606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEA43606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=coHRrqJ5
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jyyu3ZdXnJNcUGMDlH0RvUqU3YiWZYptJtZdAQQmKqQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793797732; v=1; x=1794402532;
 b=coHRrqJ5FeVPLaMeCy3cHUAwJS5EOlqMiGUb5qf0LjOAVY9qtA/qtyfzDG+SPiSctla8760I
 sNVTorqDFIe6qhN9j3QkzoqDYOO+/gca9qdmqFCamDcDotddFY4lBRUINMwG4zPas5wzQf/T7IF
 OIGrhoeu9HFnjyGfsoNnCl10=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 25592fce0d3f543f;
	Wed, 04 Nov 2026 13:08:52 +0000
X-Mizu-Trace-ID: 25592fce0d3f543f
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Dave Chinner <david@fromorbit.com>
Cc: David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Muchun Song <muchun.song@linux.dev>,
	Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	cgroups@vger.kernel.org (open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)),
	bpf@vger.kernel.org (open list:BPF [MISC]:Keyword:(?:\b|_)bpf(?:\b|_)),
	Ridong Chen <ridong.chen@linux.dev>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH v7 1/7] mm/memcontrol: drop unused vmscan tracepoint include
Date: Wed,  4 Nov 2026 21:08:11 +0800
Message-Id: <20261104130817.849089-2-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104130817.849089-1-ridong.chen@linux.dev>
References: <20261104130817.849089-1-ridong.chen@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ridong Chen <chenridong@xiaomi.com>

memcontrol.c includes <trace/events/vmscan.h> but does not use any of
the tracepoints or macros it defines: all tracepoints invoked here come
from memcg.h and writeback.h.

Drop it ahead of moving the vmscan trace header under mm/, after which
<trace/events/vmscan.h> will no longer exist.

No functional change.

Acked-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Barry Song <baohua@kernel.org>
Reviewed-by: Baoquan He <baoquan.he@linux.dev>
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 mm/memcontrol.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index ffbcea28a608..1ebc9330aeae 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -77,8 +77,6 @@
 #include <trace/events/memcg.h>
 #undef CREATE_TRACE_POINTS
 
-#include <trace/events/vmscan.h>
-
 struct cgroup_subsys memory_cgrp_subsys __read_mostly;
 EXPORT_SYMBOL(memory_cgrp_subsys);
 
-- 
2.34.1

