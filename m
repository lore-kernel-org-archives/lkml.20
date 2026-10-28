Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175018;
	b=DQf0k659fEot9dLaeepudMaSkh6mf1/NN6+OD/k+vLXXpO6DMYaenQ+3U8JMT3jRHAyI
	 OATozDoXsIcpxkhtrZ3Q2iHSm8UyU2lso5Nl0TaUDozWKZfyoGDNvNCirYHI9G3x0FL3z
	 ErKKANudzeIbgLe+EE8CW8suD1jjxfWbZjLArBUcV/n+UyVXeqSUYLhLse3zy/5KeS6fP
	 W++X6WfGTdb/OHIZ9Bt6VY6hq8r6NLF3+njG73DtPk8Hh/B4RwjEf2o6W6pJNo1OsVvPy
	 mK4M5brkegeBhMFaPBMhSGlduUK7bJF7xVriNIOdjxcsr8zQUzf4RYPJfRkX6GbN/cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175018;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:Sender;
	bh=G8E1MJWzV3M4DJYjKtp16uZzM5Zd7LJCU2Q5AuhHszs=;
	b=znic2X/PuJP7TXs7DUVi/pwBK7pE6pHnsf8DlEO3bXZRSkp87aYmktkRzes/azqGEBVa
	 c8cxoYcU7W6zGWALbLjnIKqUeHWJzGoH/gAWIet9Ky/vV6rNnWACj4WruO6fnmJ0XIh/G
	 Oznvfy67SKPUH9kTVmzTHn1kB+VUn7OVxwv4rda8X0HK7skOXDI4MJSmdcUVQ7LG3JYFy
	 l0f4IDB4Iqs1w58K8yViKECgzhIH1jpjjqlEAsy0OzbYvbo7oo/c6gxTgYQlFZA7Ombx3
	 wqrNCa58v+80EFAUTMg90HIkmvjhlTMGnWS5wIY22bfpdxBYcQQHqKdvd1C+LwECgAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WEUhYuHY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79CD606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WEUhYuHY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5846C1F01825;
	Wed, 28 Oct 2026 08:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793175017;
	bh=G8E1MJWzV3M4DJYjKtp16uZzM5Zd7LJCU2Q5AuhHszs=;
	h=From:To:Cc:Subject:Date;
	b=WEUhYuHYvzgNxhMcu+LW59a6z0bIUFlxI/4MB+VuPikwaZjJfz7gteMZ8GzeKP3nr
	 imioDUKwKv8DQLkaZy95QnIDB2gr87JipucfqSR1u6huvnmIJS0AOKUtdkM/9HNYPe
	 N+OtU1Kamcdww9t1EdJxVTHpppbNxNdia/1y2XtVFGC8YclRjYfG2LRYqoXj9mVyam
	 d+zKh+Ehph5wDeBNqkctaX9677G66BMlYsV0tFMao3u4PMoWNhscCy3r6THm4lq0aq
	 r6C47zleLXT2O+zFkjyiQ93R0zvHQn2XP6F2K53g4z+k9DH+xEWbZ4dJqaGXK8Dwf9
	 SC2o2PcvbWprg==
Received: from mchehab by mail.kernel.org with local (Exim 4.100.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xLyjf-0000000ASmT-1TDu;
	Wed, 28 Oct 2026 09:10:15 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: Mauro Carvalho Chehab <m.chehab@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	zhenwei pi <pizhenwei@bytedance.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH] mm: memory-failure: update statistics before emitting the trace event
Date: Wed, 28 Oct 2026 09:09:57 +0100
Message-ID: <d472a9a3ccfa8c0359d7d7acabed92c8927d8e47.1793174996.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.56.0
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
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

From: Mauro Carvalho Chehab <m.chehab@huawei.com>

Today's rasdaemon-ci run showed a race condition at the page poison
logic affecting userspace (rasdaemon): action_result() emits a
memory_failure_event before incrementing num_poisoned_pages and
updating the per-node memory failure statistics.

That causes userspace to read /proc/meminfo to detect HardwareCorrupted
trace events to warn if the value exceeds POISON_STAT_THRESHOLD.
This works most of the cases, but there is a chance that the value
not being updated in time before libtraceevent notification is handled.

Root cause is commit e240ac52f7da ("mm/memory-failure.c: simplify num_poisoned_pages_inc/dec")
which changed the order of updates.

Rasdaemod-ci run up to Oct 27 worked properly, but on today's run, it
failed to get the HardwareCorrupted data from /proc/meminfo because
it was updated only after trigging the hardware error event:
	https://mchehab.github.io/rasdaemon-ci/failures/20261028T035110Z-40629018388/daily/aarch64/consumer-poison-page-stat.html

E.g. it failed to log this:
	rasdaemon: Poison page statistics exceeded threshold: 4 kB (threshold: 0 kB)

This is important for rasdaemon, as the consumer's action monitors a failed
threshold before poisoning pages. So, if the counter doesn't update properly,
it will end not poisoning pages at the expected threshold.

Fixes: e240ac52f7da ("mm/memory-failure.c: simplify num_poisoned_pages_inc/dec")
Closes: https://github.com/mchehab/rasdaemon-ci/actions/runs/40629018388
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 mm/memory-failure.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index a8b03e2920ba..eba6fe1dfdea 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1281,13 +1281,13 @@ static bool panic_on_unrecoverable_mf(enum mf_action_page_type type,
 static int action_result(unsigned long pfn, enum mf_action_page_type type,
 			 enum mf_result result)
 {
-	trace_memory_failure_event(pfn, type, result);
-
 	if (type != MF_MSG_ALREADY_POISONED && type != MF_MSG_PFN_MAP) {
 		num_poisoned_pages_inc(pfn);
 		update_per_node_mf_stats(pfn, result);
 	}
 
+	trace_memory_failure_event(pfn, type, result);
+
 	pr_err("%#lx: recovery action for %s: %s\n",
 		pfn, action_page_types[type], action_name[result]);
 
-- 
2.56.0

