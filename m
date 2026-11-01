Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793552695;
	b=cqDU6REpWlLuTSf5KIQo928xCsFZDVd/rdT9IEE/Y7bO5yy+qtohiWshagz8OK+wxyzg
	 QaowfoajuFEedvIspMkshZt1oZ/N+uYa/HQlKA0PyuN3cRmFtKW6+vLihwY6mQ90ELKiQ
	 TngmHX2Pdhu8QLzarzMB/kRxRCxfR/tpDDN2OjhizenczsG2H31ldPGCoasrCXq5oOvCT
	 k3tR+aTcELZP74rutY6o9NuosJI9z6f8uvwRorlZeiUjSPBeD15offF/0bPPu/1UqHNVm
	 c9RZDYbgpV07gDtPZfJ2NBM3cwoenQPX5AtR3bQGMesAnriiLsg/s8YZAjX4oGI09wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793552695;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/x/wiZazHW4/ffi1+IFEOVxN+Fc8NZQPK12ktyLeSjw=;
	b=efIXqbg8FCc6qC4AZU7AWUhZ/lDaU19fRTL1fyYPaanJ8G8RlQS1syD6ZiGEC7slnpiS
	 cWdl4thTTBJzW8BrkspS7tGIrVsp1qtsmQkDsVI+tp7hUwkvzflu1iYfN1vyWJJ36VwHm
	 a41Kt4HGAxXGHB26Qeko3OzvPPQgWIoFIpGkeg8+BYCL711QjU1BmbDPu2kIPiuEOQ9vn
	 yxg+9uMYEAXENUv7Y4hWQojhl1tpWmn3/OjYKjZMJGwugdK7uymZ2K9BoLKqd+EDZxXCN
	 k/KQ4QLVrE5KriiJ4qc1f1zE221XePxew4+7H2J7uy+EZaEnKrUjFCZcjouvRqMb+8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mL+W0iwj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFD5606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mL+W0iwj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793552694;
	b=jblMK7gODO78ltyl6FMSpxc8gVFT+AESY7FQCrA8+/bKj78QK+wI2GcXGKCgkrAI4GuF
	 +TNh6uvg93ULqUu7OalPoWzUD63BNofd30bhasCUVXx/xpxeIVOxzGZW56JTep2ajnZCI
	 lwWoEz+M2YICvucDmxWJHmnSEXb5gtBPfhoFuLbYQqHOOZYhRy3uZJeedwAoGDVaJ+WO8
	 GXXmgX9QWlUHycu5y9W0kP3VzY2Xq6uZsPzk8Cq95WtbsqhbiySL40oHNiSucE6RFQWwH
	 Wf0y9gy1vrJKvDvgs8UQYcj/69Zy4++kB7lMLYPL5OEzoTQ+jFFnncOFj9CMVKtAGeQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552694;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/x/wiZazHW4/ffi1+IFEOVxN+Fc8NZQPK12ktyLeSjw=;
	b=eMQNcjvPAfaW1xbzVnYERHCbHSWOMmRJvRRDCe8j5eXE9LF9Kam12Gd/AZ6+6dxFumik
	 UhSQC1ji+fVdRXLCWERNfkViQ9clAWkBCvxC5LAx6qkZ61p55/8nZeNhi4v+2rhdSbLYL
	 EIYjPuhxxBKPVk6RGX5dg3nQoEangLyMnYznCR3S2NDuAIdf5wuG1ZHCsRIBLz5fnAp6n
	 32spjuJavigP0X2cwyv9VTwSZvp6yNwsaJZwW0RJXwljDCKgj1oRv828DxNcy1wg0OFUk
	 tJ/BSwhivTC8t0cLC/nBCohEeVmbxSt3+gxo0njIHyoTiI2AU9Deb/Rs7NVEhT+Baew==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AE16F1F00A02;
	Sun,  1 Nov 2026 17:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793552694;
	bh=/x/wiZazHW4/ffi1+IFEOVxN+Fc8NZQPK12ktyLeSjw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mL+W0iwj7lkIQNQPBWZJQsIWGywKDFKyQjpS8bh6tvatlMSRkeMTXW4IyQ83n2JMA
	 Il/zHMg0gEnBv7M4DNP9XoljuBYxNMqJyloI2kCiwfxl6C8b5dLzMTiKKYSD3F+aMB
	 B3JPVlcIPkNm6QLC310Izf1WMA2jKZtr0hMF5cMlec6Pbtuymn27zsbz0ia6tXfnVl
	 aiCLC36+YfkgIPKvAWRr9gcjFFQ1gty10nqZwtdq+8qTtK6tVPc6D2+o4dOxz6Bj6s
	 yXtf94zlb0WxbPD+oNpp/qJUuIPiMm1JpPALHeeLRRHuIHzboFCJsZmx+sJRRsKS8N
	 Wac39gbjinHQg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 30AEE4620B;
	Sun,  1 Nov 2026 17:04:53 +0000 (UTC)
From: Viorel Cernateanu via B4 Relay <devnull+vrilutza.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 19:04:38 +0200
Subject: [PATCH v2 3/4] mm: Factor __pfn_valid() out of pfn_valid()
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
Message-Id: <20261101-kmsan-serie-v2-3-f97f66dc57ef@gmail.com>
References: <20261101-kmsan-serie-v2-0-f97f66dc57ef@gmail.com>
In-Reply-To: <20261101-kmsan-serie-v2-0-f97f66dc57ef@gmail.com>
To: Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Alexander Potapenko <glider@google.com>, 
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
 Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>
Cc: Borislav Petkov <bp@suse.de>, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 Viorel Cernateanu <vrilutza@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793552692; l=3241;
 i=vrilutza@gmail.com; s=lenovo-20261005; h=from:subject:message-id;
 bh=dsg65O1UX/YgTMqtnmluSfWLq95yf8DD327IK6k7U4k=;
 b=TEbLB8WV9dS41IpUSxXS+cmQiZqUbRgRqNwMEIswcGyuuFjl7gBgh/jU/GoafzgI93HvfF4qB
 ZRiBLb6tGcFCgF7stfJjEwxtZdf3wGeWLfE2On3O5wDgjsAMVjkGMp4
X-Developer-Key: i=vrilutza@gmail.com; a=ed25519;
 pk=HttZd2ffphVYTK/pvlflateaij8E4SdPd6Y+xDQMqDU=
X-Endpoint-Received: by B4 Relay for vrilutza@gmail.com/lenovo-20261005
 with auth_id=1115
X-Original-From: Viorel Cernateanu <vrilutza@gmail.com>
Reply-To: vrilutza@gmail.com
Content-Transfer-Encoding: 7bit

From: Viorel Cernateanu <vrilutza@gmail.com>

KMSAN needs to validate a PFN during metadata lookup without entering
instrumented code. Calling pfn_valid() also calls
rcu_read_lock_sched(), which can enter instrumented code and recurse
into the metadata lookup.

Extract the PFN checks into __pfn_valid(), whose caller must already
be in an RCU-sched read-side critical section. Keep pfn_valid() as
the wrapper that acquires and releases that protection.

This lets KMSAN reuse the existing PFN validation while providing
the required protection without instrumented helpers.

The wrapper now also holds the RCU-sched read lock during the
initial range checks, which previously ran before acquiring it.

Suggested-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Viorel Cernateanu <vrilutza@gmail.com>
---
 include/linux/mmzone.h | 42 +++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index ecd1ebd49756..819042264088 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2266,21 +2266,13 @@ static inline bool pfn_section_first_valid(struct mem_section *ms, unsigned long
 #endif
 
 #ifndef CONFIG_HAVE_ARCH_PFN_VALID
-/**
- * pfn_valid - check if there is a valid memory map entry for a PFN
- * @pfn: the page frame number to check
- *
- * Check if there is a valid memory map entry aka struct page for the @pfn.
- * Note, that availability of the memory map entry does not imply that
- * there is actual usable memory at that @pfn. The struct page may
- * represent a hole or an unusable page frame.
- *
- * Return: 1 for PFNs that have memory map entries and 0 otherwise
+/*
+ * Like pfn_valid(), but the caller must be in an RCU-sched read-side critical
+ * section, for example by disabling preemption.
  */
-static inline int pfn_valid(unsigned long pfn)
+static inline int __pfn_valid(unsigned long pfn)
 {
 	struct mem_section *ms;
-	int ret;
 
 	/*
 	 * Ensure the upper PAGE_SHIFT bits are clear in the
@@ -2294,16 +2286,32 @@ static inline int pfn_valid(unsigned long pfn)
 	if (pfn_to_section_nr(pfn) >= NR_MEM_SECTIONS)
 		return 0;
 	ms = __pfn_to_section(pfn);
-	rcu_read_lock_sched();
-	if (!valid_section(ms)) {
-		rcu_read_unlock_sched();
+	if (!valid_section(ms))
 		return 0;
-	}
 	/*
 	 * Traditionally early sections always returned pfn_valid() for
 	 * the entire section-sized span.
 	 */
-	ret = early_section(ms) || pfn_section_valid(ms, pfn);
+	return early_section(ms) || pfn_section_valid(ms, pfn);
+}
+
+/**
+ * pfn_valid - check if there is a valid memory map entry for a PFN
+ * @pfn: the page frame number to check
+ *
+ * Check if there is a valid memory map entry aka struct page for the @pfn.
+ * Note, that availability of the memory map entry does not imply that
+ * there is actual usable memory at that @pfn. The struct page may
+ * represent a hole or an unusable page frame.
+ *
+ * Return: 1 for PFNs that have memory map entries and 0 otherwise
+ */
+static inline int pfn_valid(unsigned long pfn)
+{
+	int ret;
+
+	rcu_read_lock_sched();
+	ret = __pfn_valid(pfn);
 	rcu_read_unlock_sched();
 
 	return ret;

-- 
2.53.0


