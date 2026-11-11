Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380235;
	b=tZf61ttPUcNd0HSO+8TlFVdrBsnUWi2b838kvZSHaF9NuYR7Ht09W2fXtce1xW9wfDnM
	 Xbr1rX4uaGesQgweK+I+uxm7GXrvf+FzLgAaeF8nilKWeLL934AYIS5w8IA66FfgDXbIU
	 phQ3Up96YrF0D+bnyRBTp8HibskzHzxPzQTrM6DqvQYwNe0Q0G7pdl1lHclm8q9wHhmrR
	 FO3pYTyVxmQf1kigO6GfclOnRbZx9r7M85AW5IRfcDTs83blb7dgLJtdIC4HujWI2dnAK
	 B4NdHlU6/IzvdlCK7vi9aMQ5pNPQ/M6PU4RsGU0sJC8Nd0f7ornhoe+CLkg6mEXmqVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380235;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=R0WtzFK0QV9dTe74u2VAXpk+0dxVm5YnUHawi9+Z7JE=;
	b=mKJpj8tGv1Uoft+M2pmOMp6C35q7Ig70cxtUwQ3s786xoeKTUKq6LjBpkCfHKrvHUS82
	 OtY+5JiDpkkHi+AwZHXe2OfvEQ8vhhMSXpNBEhkIAgBiTn9zygUS6hpV819Mnhpox8+yg
	 Odnf/RW2gMPintIOnvXeMswyju+2/IAdRvZGBoWkG/hufiNhlhVdnN1ihnOWHE/DrN0mC
	 zkKix+daMc46NglG5pG9oKfMiolxD3AjZhm74cIi6udHjjmN+CL6sXZqBdqLAawl2YSso
	 XScNHz17SpfzZZ+VaRHlM3oYp5kLv117ccYdym5nXfNasMD40vHPMyYtPwJpxFxAWtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qCInZunJ;
	arc=none smtp.remote-ip=95.215.58.181
Received: from mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAED606E22F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BAED606E22F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qCInZunJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OvQTYxYMkTqry3acjf+Vcm67A7weKjsIyvcUqj9sVD0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794380232; v=1; x=1794985032;
 b=qCInZunJ91dT4NW8VshVhxlnxfpaB6Hkf+dDLxOpjaRZt/31gYcz6sSBwNcSUmQ5y/ff8x6Q
 nT/J9um+GC4isFsbDp81LXxNnxkAdLk2YHI+oWBdUp57up3HqHbi7coSwd3YVdWPT9piW06xUWD
 iJYi5yGxGyzBvVI56FkdbVzQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4febb5d57c92655e;
	Wed, 11 Nov 2026 06:57:12 +0000
X-Mizu-Trace-ID: 4febb5d57c92655e
X-Migadu-Flow: FLOW_OUT
From: Hongfu Li <hongfu.li@linux.dev>
Date: Wed, 11 Nov 2026 14:56:57 +0800
Subject: [PATCH] mm/bpf: Add bpf_mem_cgroup_memory_events_local() kfunc
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-for-bpf_memctl-1111-v1-1-8b56784d9e5a@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMSwqAIBRFtxJvnGAWDtpKRKQ+60U/1CKI9p7ln
 Z0L59zg0RF6qLMbHJ7kaVsjFHkGeuzXARmZyCC4kEUcs5tjarfdgosOM0tfqaTRgle8NxDN3aG
 l6682bWJ/qAl1+FLwPC+EilzPdwAAAA==
X-Change-ID: 20261111-for-bpf_memctl-1111-f3b6dc2040ad
To: Roman Gushchin <roman.gushchin@linux.dev>, 
 JP Kobryn <jp.kobryn@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: hongfu.li@linux.dev, bpf@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Hongfu Li <lihongfu@kylinos.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794380225; l=2008;
 i=lihongfu@kylinos.cn; s=20260915; h=from:subject:message-id;
 bh=44vpfizS0VlosmJiTV7G7pfGCN7/3RT3A4dbxD9R4JY=;
 b=6gHInHLqYiXWrXrNKs1ifLi/E8r+1T4xwxFAc+85WJ6yuMI6cmgl7yLnbs+kBxc10cJVZZjFA
 R4BosQQkj/ZDPQyCe7D5Lff1qre8GMIERQTTAFcD3xRCzqBI3Xvd474
X-Developer-Key: i=lihongfu@kylinos.cn; a=ed25519;
 pk=rUpDSpB3neoNZRlGG6dHlFb3RepiJakcev+ucyqaZzw=

From: Hongfu Li <lihongfu@kylinos.cn>

memory.events counts events for the memory cgroup and all its
ancestors, so it cannot tell which cgroup in a subtree triggered an
event. memory.events.local counts only the events of the cgroup
itself.

Expose the local counters to BPF programs with a kfunc, so that a
policy can attribute events to a specific cgroup instead of only
seeing the aggregate of the subtree.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 mm/bpf_memcontrol.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/mm/bpf_memcontrol.c b/mm/bpf_memcontrol.c
index d8f579c28560..826f711718db 100644
--- a/mm/bpf_memcontrol.c
+++ b/mm/bpf_memcontrol.c
@@ -133,6 +133,23 @@ __bpf_kfunc unsigned long bpf_mem_cgroup_memory_events(struct mem_cgroup *memcg,
 	return atomic_long_read(&memcg->memory_events[event]);
 }
 
+/**
+ * bpf_mem_cgroup_memory_events_local - Read memory cgroup's local memory event
+ * @memcg: memory cgroup
+ * @event: memory event id
+ *
+ * Return: The current value of the local memory event counter.
+ */
+__bpf_kfunc unsigned long
+bpf_mem_cgroup_memory_events_local(struct mem_cgroup *memcg,
+				   enum memcg_memory_event event)
+{
+	if (unlikely(event >= MEMCG_NR_MEMORY_EVENTS))
+		return (unsigned long)-1;
+
+	return atomic_long_read(&memcg->memory_events_local[event]);
+}
+
 /**
  * bpf_mem_cgroup_page_state - Read memory cgroup's page state counter
  * @memcg: memory cgroup
@@ -215,6 +232,7 @@ BTF_ID_FLAGS(func, bpf_put_mem_cgroup, KF_RELEASE)
 
 BTF_ID_FLAGS(func, bpf_mem_cgroup_vm_events)
 BTF_ID_FLAGS(func, bpf_mem_cgroup_memory_events)
+BTF_ID_FLAGS(func, bpf_mem_cgroup_memory_events_local)
 BTF_ID_FLAGS(func, bpf_mem_cgroup_usage)
 BTF_ID_FLAGS(func, bpf_mem_cgroup_page_state)
 BTF_ID_FLAGS(func, bpf_mem_cgroup_flush_stats, KF_SLEEPABLE)

---
base-commit: 2c5dafa7f289d760f4492260b0988029aab478b0
change-id: 20261111-for-bpf_memctl-1111-f3b6dc2040ad

Best regards,
--  
Hongfu Li <lihongfu@kylinos.cn>

