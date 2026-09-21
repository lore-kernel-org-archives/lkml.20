Received: from mta1.migadu.com (out-57.mta1.migadu.com [95.215.58.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A897F492E40
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991202; cv=none; b=CZ0SPMbvSHpLdh5QavStrJqGuGAi1PEj25zw7WO+cO3nqQA66i0qclvZbN9HdP61oe67hhmjtKLboCU6/n9/asxIdOfyKwJ55ZHlOGQOCPEAMsfb6DLlopm5fAVWfABPuDgagEgSViuwQf2WW+GAI6K1rjKcl4ZcdXsuETWCW+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991202; c=relaxed/simple;
	bh=jRoLHiXUjqgSCQI9swstc7I6QdyBDVBnU5RnGjj+W6U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JXOQqhba9DVK1cLaC3gGrkjednYgDGitSeNlOLv4/5K201pH0msBKJRhDquqBIc//BXHjo2lYd8sQjDk246SR5WpCpfEMT6NJuwOf9mcx+Uds1av5TwmQQjEGgCCZ0wGENg4cv7QphmuFdwQBlqw7wNfIo6399m7ylZCyA5t3MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=J/UK/IiC; arc=none smtp.client-ip=95.215.58.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="J/UK/IiC"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jRoLHiXUjqgSCQI9swstc7I6QdyBDVBnU5RnGjj+W6U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789991198; v=1; x=1790595998;
 b=J/UK/IiC5s+C6wAqG+lSel0+4AUh58am8QpK433Zn2jnlGo9EMJIsEBa7lkOlsKTQF7+E+2O
 wvfGVyNI+OmpmKDga0DDG3RDhWLGicLftzIK4VB6T0HqnfGudcKdRAUofJ0PdlTlNZASCilhwoF
 EoKxpd+5jM1llzAfUjiW+9BY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2b03a41349172853;
	Mon, 21 Sep 2026 11:46:38 +0000
X-Mizu-Trace-ID: 2b03a41349172853
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Chinner <david@fromorbit.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Muchun Song <muchun.song@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	cgroups@vger.kernel.org (open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)),
	linux-mm@kvack.org (open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)),
	Ridong Chen <ridong.chen@linux.dev>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH RFC 1/4] mm/memcontrol: drop unused vmscan tracepoint include
Date: Mon, 21 Sep 2026 19:46:03 +0800
Message-Id: <20260921114606.3871820-2-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921114606.3871820-1-ridong.chen@linux.dev>
References: <20260921114606.3871820-1-ridong.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ridong Chen <chenridong@xiaomi.com>

memcontrol.c includes <trace/events/vmscan.h> but does not use any of
the tracepoints or macros it defines: all tracepoints invoked here come
from memcg.h and writeback.h.  Removing the include still compiles
cleanly.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 mm/memcontrol.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 4d00748c8a5b..2a98c5ca46a6 100644
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

