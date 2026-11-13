Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794607557;
	b=RJqaXPGBEzTvcpkEfQ5KL6CvmcWInq2Kto++8XJ/iFr6fDHYBOADSoAcav23UdBoJWNe
	 x5ZZt4TXVPwq0E/TcIr2tiTzVhLYrmYpHBk3FlnI84iDsgxqCMpoHOqWmHmWhlPYcJFlX
	 IL9KKgTzS1prUPWqy0AW+uRipMO+IsGghLbtV/5nlpj0ngX2zo3aXxVZ9ItXgKYJF9Ax/
	 WdhtkDayGzRdKDvjwoxA/0U0KBkxPcjYrVegH9wV3YtkzhAW4cx63B5guwZutdRTYqD9V
	 maMztIgVigyDunJnTI/UDxmpOodq6QvXb7hK0tZT0tTUIh+iMQFlXFDKSU71dNqkebA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794607557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PR3D8+JRACUUYgmS+awgi4uwjRnOXa+PYlfs9seiINw=;
	b=1gxvCU8eXZw2Ozl792fbV6SlDVaeUUGegeW8x3soc78Pb4s5sdmdusPSLrZjeLMj0+9a
	 8StgbxnuKX3oKZyYv3Gf7gYbs7bI3QihQjV5Bingu1ABvPVs9HvhX8OxsBov+4hbVg05n
	 8vB+7aaY8raBF3C2bPBNZasM0tNxt84FuxrBZhprUZnQHur/hEi6sZtOzIHj0vh9PCs9e
	 7HxBkDzB8YcDzzgArQXJJMSLks10sMB8OcQCVmiM9o+u+Y2RMvjO1rXio4Z2m6si5e+Z/
	 Zvb0Fm313ipRbTxHRxBQxYey+JgXye/LPLfQ4LnGHQWvZyvRD5vUWdXRqg55XfYfM9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iBk2R+5T;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9629060A3808
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9629060A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iBk2R+5T
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67921b515a7so1637427d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794607556; x=1795212356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PR3D8+JRACUUYgmS+awgi4uwjRnOXa+PYlfs9seiINw=;
        b=iBk2R+5TfhasSI3ur3NSObydzSjR2PbxcV8uF7JcQPpmIzwylXBpSXdpJ6yxLcemtD
         CI/67Wc5F7e1XPYg/9ySzN+s2DVxlbL4klYIBRQTY/kfPgW26WeG3IO+cTKtP5B6GT/5
         RGOhRDn+7FxEi2wYDFjgShfyDndeHgE0+uRmXfoz7qCzb2Szl9Gh+ZSXwIIqD0VID3qt
         3ntkbgclttLrBvv6UGyPgxQiZy41ziIfZhgn0ym7UYwACgcFXc6pxMXMuiph2paJ4981
         a+R032r1A1GaQvNDVupE8mZ4BZAQNORJkFultxwIGqBALHAP8lplmAvRRc/CuYxhukkX
         OSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794607556; x=1795212356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PR3D8+JRACUUYgmS+awgi4uwjRnOXa+PYlfs9seiINw=;
        b=Z0iK5weRrhWPigzl2Ygwa1PP6kQucz4/Cqg253guO2Xp7BJK9RGQQ2w4jvNaOTPksu
         EmEpXpK09DkwRDq/f6ZTVtpgj1OeooaIHBoAgTB6XJIc3Jype3zLF0mSTyhrunxLnEVp
         iUnCynTa1WgjJJVGCkH8o1qGK73b42JiBQhaHSVvWXDFpUUCQAFrPm2HIEDS5UKlpg47
         6KpO55N3A8ifCcK0GRjPzTdj/rfhv7NGVuy+pCf3TOAG3w4oBlTWg2ib00IbZ3rvgcJm
         lU+r17t5YAGF4lIaG0xxc+g+sYO8jrwcnE+GbU9dJ07yuFCn2ruHPxuMV8A8BtHF/1GQ
         slhQ==
X-Forwarded-Encrypted: i=1; AL+hErF/zoK/xm/+zk4/dUaz/l7f8k1odU/09W+Bx9eQZuLTDHTpYGv7m6jq7HuTdW3Dm7FM0YpLCKDf/s0brQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cHIiwxIN6dDrbxVBcg0qH0wRN0FjZ0ts0Xj59CBKwQuR5p+dm
	hVqfzdpw/kfS+lFojBzCc+SkjeHJMFVG/sKUME36p0ucpI2BVMfKtBlC
X-Gm-Gg: AYBFou02r1i8YtVqlOFz5OZ5yy5uKxP0fa/m4bg8V8nVzzAXV7/dGUJsDw9+bhVcxS+
	oaXLHJ2WdApAnxQ1GVHLR+cHmuqOCumQ9cQ9C3eH7F0M9GzrJ/TM9x+Bkl9DylOVLQzS7GUBwDy
	KWvos46vJUJ1pN6U96SZp5blrz5EjQhdp06EiAY2nI2Or5PGKE7v9GRlsV7DYAZ3zEBGqNq4kgr
	Q+lLQ+9atkQ5SGuvayTSJMuzKom2B19xbj+Vp7xycJ4mk4JzYctaXEMJQabvMSuANpqPwWfKtTp
	Y0yNzLXKj09n8IePTCZfZcnIvzqn/PxQApF/AQ3j2sUeNSSgUPjpEG482Y7pVpt21Bk+UXzYdPP
	ATGwNq7zrtPMqwPCC3mO3jxoRBhQu3tFuoAW6IESqv64woTJNOFwZabGWQ85dwbl5TjKg3ICZH5
	x+bZ9tHteknudeAGDcr7ojbNSLP3PcpkrHfw+5DoEd51gc+QmY8uchS1TvApNehW3VwAR12g71V
	QyKDoHK28s65qT6B6ks6L+Vl7vLA5i8T6QZhYH1CcY2GJZLqVh2TEE5vPqS58XUN6J+GWGFVgiC
	MwFPwkCTVwPBmNABAFH44MB2UCBqqU4ZotcUXeAQd41K5D3tLiLgc1nmld3aordLxykjsngA8Xf
	C+VCAHhE=
X-Received: by 2002:a53:c808:0:b0:67c:2491:3754 with SMTP id 956f58d0204a3-67d8973e601mr1944017d50.81.1794607555621;
        Fri, 13 Nov 2026 14:05:55 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:48::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a4359absm3179886d50.1.2026.11.13.14.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:05:54 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	Michal Koutny <mkoutny@suse.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Harry Yoo <harry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Maxime Ripard <mripard@kernel.org>,
	Natalie Vock <nat@pixelcluster.dev>,
	Tejun Heo <tj@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Balbir Singh <balbirs@nvidia.com>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v9 7/7] mm/memcontrol: restrict memory stock to leaf cgroups on v2
Date: Fri, 13 Nov 2026 14:05:34 -0800
Message-ID: <20261113220539.2275715-8-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261113220539.2275715-1-joshua.hahnjy@gmail.com>
References: <20261113220539.2275715-1-joshua.hahnjy@gmail.com>
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

In the old memcg_stock world, non-leaf cgroups in cgroup v2 usually did
not get directly charged, since new processes can only live in leaf
cgroups. This meant that stocking was usuaully only for leaf cgroups.

In the new page_counter_stock world, stock belongs to each page_counter.
To prevent unused stock from accumulating in non-leaf cgroups, prevent
stock refills on cgroups once they have children, and schedule drains on
non-isolated CPUs that stock the parent.

CPUs that are not drained because they are isolated or because there was
a race with a refill may keep a stale slot for the parent. This is OK,
since the slot is never consumed or refilled, and will eventually get
drained like any other stale stock through stock eviction or draining.

One behavioral change is that processes that do charge directly to
interior cgroups now do not stock. Reparented objcgs or swap-in
charges used to refill and leave stock in non-leaf cgroups, but we drop
this in favor of not stranding unusable charges in parent cgroups.

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/memcontrol.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index cb1f46b457ae8..15b5e0692c436 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2189,6 +2189,22 @@ static void schedule_stock_drain(struct page_counter_stock_pcp __percpu *stock,
 		clear_bit(FLUSHING_CACHED_CHARGE, &pcp_stock->flags);
 }
 
+static void mem_cgroup_disable_stock(struct mem_cgroup *memcg)
+{
+	struct page_counter_stock_pcp __percpu *stock;
+	int cpu, curcpu;
+
+	stock = xchg(&memcg->memory.stock, NULL);
+	if (!stock)
+		return;
+
+	migrate_disable();
+	curcpu = smp_processor_id();
+	for_each_online_cpu(cpu)
+		schedule_stock_drain(stock, &memcg->css, cpu, curcpu);
+	migrate_enable();
+}
+
 /*
  * Drains all per-CPU charge caches for given root_memcg resp. subtree
  * of the hierarchy under it.
@@ -4314,6 +4330,9 @@ static int mem_cgroup_css_online(struct cgroup_subsys_state *css)
 	 */
 	xa_store(&mem_cgroup_private_ids, memcg->private_id, memcg->private_id_objcg, GFP_KERNEL);
 
+	if (cgroup_subsys_on_dfl(memory_cgrp_subsys) && css->parent)
+		mem_cgroup_disable_stock(parent_mem_cgroup(memcg));
+
 	return 0;
 free_objcg:
 	for_each_node(nid) {
@@ -4366,6 +4385,20 @@ static void mem_cgroup_css_offline(struct cgroup_subsys_state *css)
 	drain_all_stock(memcg);
 
 	mem_cgroup_private_id_kill(memcg);
+
+	if (cgroup_subsys_on_dfl(memory_cgrp_subsys)) {
+		struct mem_cgroup *parent = parent_mem_cgroup(memcg);
+
+		/*
+		 * The parent's online_cnt counts itself and its children.
+		 * Once the current css is offlined, a parent with an online_cnt
+		 * of 2 will become a leaf again.
+		 */
+		if (parent && !css_is_dying(&parent->css) &&
+		    atomic_read(&parent->css.online_cnt) == 2 &&
+		    !mem_cgroup_is_root(parent))
+			WRITE_ONCE(parent->memory.stock, &memory_stock);
+	}
 }
 
 static void mem_cgroup_css_released(struct cgroup_subsys_state *css)
-- 
2.53.1-Meta

