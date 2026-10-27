Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793067670;
	b=uo9FIcVD0zWV7QSzHjyNh/ONO2d+lE3KAlNqEnH0hFddDnr/PAQ9K/8hYn4mZ9OsQsJ9
	 KxCqwbnLZYeIxB4nLpXOEFoXZ0QeA8hwD/un+5k8pxNbYnK8MKkCNdRmqQOioBblt8taJ
	 gmTBDSvnSw03JqkVhiYsPLgJ7UPqEJ7HWSd1VAxPLI4Pd2D6RmQIh/1MDQ0ytAJWeLhG+
	 eAjDnLztNqlrCpc9t5yjRHBxkQKzaRkPaauCSrgwsxpSo31pZAouJXntxTAhLETAnRhto
	 oOs+BN4LyuXss2tacBMmesODktW59C30oy65pUCqVmKVQh/WlY7rCK2t5MdvcbTRcKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067670;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1S3SP2ZqMnMjtsDJBtDJ6IKHd+fOm8rQneXFfbk3qTI=;
	b=xFeVmwY+fuflRPfz9PR2H/iwBUcFwCBHL1IALsk9Vofe2pMLG5+do36x2G2KggOF051d
	 6EgaarTNwqC2ReDzCOXH93TersYsS5zkFrW7uXUZrNUsHPAejhuV+S3zV2TRyRx/1QAkp
	 fJAIUBZlalTwMgLdcxyRXq5z/8dVRF65t2fEx1V1d5DEruDqq9hrF1Ds0QcaRuEYC8ikM
	 +K+srYc9sfrRX8uwtnpS7Wj3ozJ0D9lHcaKPWKEkK2Ih7/JLQSxEK7JX0mgUenmC/RdNz
	 Y8AIF8opIj9nWQzYlMtln3uBa6wezkcli2CIl8g7OY2o4vJZ41983PnH3EyPx/+6sqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kgpP2nsf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76721606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kgpP2nsf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793067670;
	b=Yn75JoEdsfDJutaq4Q/j66G0BwtCZv33x1dfRLSHzL4DgqYPUAT2rLVUjyyO5/QM451H
	 sFc0aAXzHMkfnoZlckvk+un+xvPlPX00thDmlfn6BUcBTakve2TVbPadxLMOjoCK8I1D9
	 3JxDDy3qqYYvs44g//jCU7Tm20vcDhkfAkGkzpoL0bVy6N+k/Oh7gogJuiZ+0NZ8s/0xZ
	 HVWjVUITfTNu4YpAIPh6euiHrVMY+tAUE88cxRW34bdKjuiCdcpWW4/FjYLTUrW/AVoe0
	 /whXtuC3MSD54P4tniMwTDbOLylK0wUGCwAJxCp/Crm6PaV8Y3falHhOXTdC7h68xUA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793067670;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1S3SP2ZqMnMjtsDJBtDJ6IKHd+fOm8rQneXFfbk3qTI=;
	b=W6Ju2wtT+ggz56Dwj7ZmLyFhh/VVyDeu98xyjdcRp/NdFDRrKOdNyo3r/pYnfX+BmPhI
	 nj0N2hUnrL1ixfwfA82Xy/3LnAgCl3XWLB8o7y5tkPZVrjqyjg3thGE7ZJwMgA7aNQs74
	 kg6Nj7cMUfuYJOsrNpnHjUeWFeq8j3cwHshkY0DmDL0JjnEbEHR/7iOqDeArB1vjhbxiU
	 H+18QQZ1PgJ/uKb02lHeTdhaxQmDWqOrfSVcooZJXA8VedUV+4uAXbhoZ5yUKyyeumxEe
	 gojtWaj4spMt+s3begw+qUhE40JSSO63UAYUcx7k1Z1eEZuuikh1wdpxns1UHVAulqQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 959951F01825;
	Tue, 27 Oct 2026 02:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793067670;
	bh=1S3SP2ZqMnMjtsDJBtDJ6IKHd+fOm8rQneXFfbk3qTI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=kgpP2nsfxHbEllUBVOWGvcPG19nmit9KbS7dfO9G2iQ14UvaimbCZVHeZnOyPw4QS
	 nu13L0szVWrP3WBCRnrws185HmcAQ1S40U0wr204RPnT6ktasOkAhHA2iKF4Ga/d1L
	 sdiNpY475cuFZzCqn/r/83yR+x4xgw8YOyNZ1R1wm66uWx4mnCp7x0/qXzAFkut0MN
	 /xzLSIbw7m2OhxpZYiEbH8+BXhcqEa5F2/PqywbOxKVFBPK5DxvoYN7+frEvwc6q8z
	 VwULMpGygl3JUMCtKIEYZzoE58tHslxYj54uNZ6YR6fKJiJ8KWY0h2/te+qfhom/F0
	 tEe2DeL38JQZA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0DE4B44F45;
	Tue, 27 Oct 2026 02:21:09 +0000 (UTC)
From: Bingfang Guo via B4 Relay <devnull+bingfangguo.tencent.com@kernel.org>
Date: Tue, 27 Oct 2026 10:21:08 +0800
Subject: [PATCH] mm/mglru: skip oom killing for high order allocs in kswapd
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
Message-Id: <20261027-fix-mglru-kswapd-age-v1-1-b1ffdec4ae52@tencent.com>
X-B4-Tracking: v=1; b=H4sIAJMK4GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINZNy6zQzU3PKSrVzS4uTyxI0U0EqrG0MLY0MDM0STY3MVMCai0oSgW
 qAxsbHQvhF5cmZaUml4DMUqqtBQCBaHKzeAAAAA==
X-Change-ID: 20261026-fix-mglru-kswapd-age-98390614c746
To: Andrew Morton <akpm@linux-foundation.org>, 
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, 
 Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Yu Zhao <yuzhao@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Bingfang Guo <bingfangguo@tencent.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793067668; l=2033;
 i=bingfangguo@tencent.com; s=20260812; h=from:subject:message-id;
 bh=+NHgwZPSL4lsn3SUUTmSyqpRl3Ciw1JrL46ewddx38Q=;
 b=jnw8LXfvvz+KGsE6wZisVj9vHnHVOxP2bE4RM+sv7KPH4LTBMws81Qrt3RYHmK//t2koHb3eQ
 jSlAa4Q+v6VAc8lBCHD+G0R009PadeosKyjVND3NfHj0BEYipQa1Otw
X-Developer-Key: i=bingfangguo@tencent.com; a=ed25519;
 pk=q7u9S7d5e7VijWrYF9O+vv9/XvqWduVGtwGtuCObAHE=
X-Endpoint-Received: by B4 Relay for bingfangguo@tencent.com/20260812 with
 auth_id=942
X-Original-From: Bingfang Guo <bingfangguo@tencent.com>
Reply-To: bingfangguo@tencent.com
Content-Transfer-Encoding: 7bit

From: Bingfang Guo <bingfangguo@tencent.com>

We observed that when MGLRU min_ttl is set and the system is highly
fragmented, high order allocations (e.g. order == 9) will fail and wake
up kswapd. It can not make any progress, while pushing generations of
memcgs so that they all end up younger than min_ttl_ms, repeatedly
triggering the OOM killer in lru_gen_age_node(). Then the whole process
repeats until all processes are killed and the kernel panics.

Fix this by skipping OOM killer invocations in lru_gen_age_node() for
sc->order > PAGE_ALLOC_COSTLY_ORDER, which is also what the normal
allocation path will do, to fail high order allocations without OOM
killing.

==== Testing ====

Tested on a VM with 6 cores and 6GiB of memory, HZ=1000, MGLRU enabled,
min_ttl_ms set to 1000, and a workload that fragments the memory then
allocates 2M pages.

Without the patch, kswapd kills all processes and panics the system even
with plenty of memory available. With the patch, allocations fail but
the system remains stable.

Fixes: 30d77b7eef019 ("mm/mglru: fix ineffective protection calculation")
Signed-off-by: Bingfang Guo <bingfangguo@tencent.com>
---
 mm/vmscan.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 9959ca158ce83..b32777468ead8 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4407,6 +4407,12 @@ static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_control *sc)
 			reclaimable = lruvec_is_reclaimable(lruvec, sc, min_ttl);
 	} while ((memcg = mem_cgroup_iter(NULL, memcg, NULL)));
 
+	/*
+	 * OOM killing won't help high order allocations. Skip and let them fail.
+	 */
+	if (sc->order > PAGE_ALLOC_COSTLY_ORDER)
+		return;
+
 	/*
 	 * The main goal is to OOM kill if every generation from all memcgs is
 	 * younger than min_ttl. However, another possibility is all memcgs are

---
base-commit: 39274b454e9993cea319f4ac342a8082a9ee1730
change-id: 20261026-fix-mglru-kswapd-age-98390614c746

Best regards,
--  
Bingfang Guo <bingfangguo@tencent.com>


