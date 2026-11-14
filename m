Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674837;
	b=ZGtWQND9mv4yUeRVyCo/6gez4ILrOJhYTTJIGIOvIV6GSJ2ldCUfPbUDg59cCaP/Ttud
	 3SmJey7Hnz7YAH2YjRINsfIbNRoJRSNe9RMNYrw15Q2qQl5vOZIi5pVJW8dCzvRv3EhwN
	 3Hec7nflIfP9bTAN71U+bP9VwR1WbFrM/UiKSzNUOlsgpRCMxh8Fcqh9khgFsy3axf4Gh
	 ea+JZi/D6/86eV3wQDMGg7cZHT5CP0+hLEH90qWSecIeIdN2IKBX1SBUto7rMfGRVIy2g
	 BS5u47m0UcBuV4IsD1Yd21WbxrKVCAmN+skpjn6BbISbhx9ahWqVwO7lKzpTOUc4ggg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=lKD0U2CuZDhQxNZbru0tthW0rYWxO15r0jmxh9WCA6Y=;
	b=uc4mskQBNoQJNO97t35C6/KRC2iGYUIEWpOTpraBYTilE4K5h36iXU+NvCkmh5dXqQPl
	 88M+D/YtMJ8RbTCqG5CQJvKmNfNOP8Pp5OEuqlpvvwiUx1Dx+44G50dzUqFc1KaI0rh7F
	 3rq/7GWFjeYbLNms0qzG/wth7CMhILTcMuQIfu0BoLvyXcG2GiBQJG/p8VJTAQZP3C4Qb
	 C1nZzTyYl5DOgO1JJHIG5DGM7rHTL5iqPm5pBX0OWdXkkqfsBIWxY1WRe/I+vJmkkxZX4
	 527PUli3FOzaR1ItBZIlZtVVj5R02cyCNnTTS0iGYcI0NdCiDveglyZeZSOT1eVzgiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=cmG9Ke6G;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E3E606A338
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E3E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=cmG9Ke6G
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jRg5b6L8sz8Xrr9;
	Sun, 15 Nov 2026 00:47:15 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794674835;
	bh=vXZ7ifNNDA+zvjg8BaDg3JPnpiyXNI5kp36x0qW2fkU=;
	h=Date:From:To:Cc:Subject;
	b=cmG9Ke6G4eshwup+LWfSSpP2VCA8eeh+VLwv3IPq34kr/4QBfv3JR0bp1u8C8R2+L
	 WNGKsYnZpJNvPavNo+2h3pdJY2MYPB7+bAQMVQLhFsmsgjLl1+n3c5dKvaaMx5ZwiF
	 aH6cHzKoYHQJnw5x6OXO2oKh/lq/YM1usQqB/iF0tfB8XTSWpridW9OsN3LrCfnP3L
	 Wc5DM4MrD1Sxl46I9REuA2xs9lw9H8BahQOKpYfYCdBxWqTq+XTlTOt71lWkNjcgSB
	 Y2bDVMcWyohsVYSiki6HgIDswq43dcmKNntpI+268dTFYuGyK4JM6XnWNykVAjaMrl
	 2r6uF68tFB1qw==
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 6AEGl76a094707;
	Sun, 15 Nov 2026 00:47:07 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 15 Nov 2026 00:47:11 +0800 (CST)
X-Zmail-TransId: 2af96af8908faa3-34a6f
X-Mailer: Zmail v1.0
Message-ID: <20261115004711126EXlXUnHk7NZz7rkWhDkyP@zte.com.cn>
Date: Sun, 15 Nov 2026 00:47:11 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <surenb@google.com>, <akpm@linux-foundation.org>
Cc: <linux-mm@kvack.org>, <hao.ge@linux.dev>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBtbTogc25hcHNob3QgYWxsb2MgdGFncyBpbiBhbGxvY190YWdfdG9wX3VzZXJzKCkgdG8gYXZvaWQgVUFG?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6AEGl76a094707
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sun, 15 Nov 2026 00:47:15 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF89093.000/4jRg5b6L8sz8Xrr9

From: Shao Mingyin <shao.mingyin@zte.com.cn>

mm: snapshot alloc tags in alloc_tag_top_users() to avoid UAF

alloc_tag_top_users() selects tags under the codetag module-list lock,
then returns raw codetag pointers. __show_mem() dereferences the tags,
their strings and per-CPU counters after that lock has been released.
Concurrent module unloading can invalidate those objects before they
are printed in the OOM or SysRq-m report.

Copy the selected tags and counters while holding the module-list lock,
and print only the copies. Reuse allocinfo_to_params(), which copies
names into fixed-size buffers and retains at most their last 63
characters. Preserve the signed comparison used to select the top tags.

Keep the larger output array static under the existing show_mem lock
to avoid increasing the stack frame. The counters remain approximate
lockless per-CPU observations; the copy protects object lifetime.

Fixes: 1438d349d16b ("lib: add memory allocations report in show_mem()")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
Build-tested mm/alloc_tag.o and mm/show_mem.o with W=1 and
CONFIG_MEM_ALLOC_PROFILING=y on x86_64. The lock lifetime was reviewed
statically. No module-unload race was reproduced under KASAN.


 include/linux/alloc_tag.h |  9 +++------
 mm/alloc_tag.c            | 17 ++++++++++-------
 mm/show_mem.c             | 29 +++++++++++++++++------------
 3 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
index 9e42f23577b9638a8cad3ce42db7c7a2fb1a3d5a..018dbfc9db12e178c50ed0a67063db4e024bfccc 100644
--- a/include/linux/alloc_tag.h
+++ b/include/linux/alloc_tag.h
@@ -7,6 +7,7 @@
 
 #include <linux/bug.h>
 #include <linux/codetag.h>
+#include <uapi/linux/alloc_tag.h>
 #include <linux/container_of.h>
 #include <linux/preempt.h>
 #include <asm/percpu.h>
@@ -76,12 +77,8 @@ static inline void set_codetag_empty(union codetag_ref *ref)
 
 #define ALLOC_TAG_SECTION_NAME	"alloc_tags"
 
-struct codetag_bytes {
-	struct codetag *ct;
-	s64 bytes;
-};
-
-size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, bool can_sleep);
+size_t alloc_tag_top_users(struct allocinfo_tag_data *tags, size_t count,
+			   bool can_sleep);
 
 static inline struct alloc_tag *ct_to_alloc_tag(struct codetag *ct)
 {
diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
index e9b70268eacb046f429107dc493cb5ade3620690..fe8269694c7dbc68a0c7188dcf87b3bbefbfb751 100644
--- a/mm/alloc_tag.c
+++ b/mm/alloc_tag.c
@@ -610,11 +610,11 @@ void alloc_tag_trace_mem_free(const void *ptr, struct alloc_tag *tag,
 }
 EXPORT_SYMBOL(alloc_tag_trace_mem_free);
 
-size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, bool can_sleep)
+size_t alloc_tag_top_users(struct allocinfo_tag_data *tags, size_t count,
+			   bool can_sleep)
 {
 	struct codetag_iterator iter;
 	struct codetag *ct;
-	struct codetag_bytes n;
 	unsigned int i, nr = 0;
 
 	if (IS_ERR_OR_NULL(alloc_tag_cttype))
@@ -629,11 +629,8 @@ size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, bool can_sl
 	while ((ct = codetag_next_ct(&iter))) {
 		struct alloc_tag_counters counter = alloc_tag_read(ct_to_alloc_tag(ct));
 
-		n.ct	= ct;
-		n.bytes = counter.bytes;
-
 		for (i = 0; i < nr; i++)
-			if (n.bytes > tags[i].bytes)
+			if ((s64)counter.bytes > (s64)tags[i].counter.bytes)
 				break;
 
 		if (i < count) {
@@ -642,7 +639,13 @@ size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, bool can_sl
 				&tags[i],
 				sizeof(tags[0]) * (nr - i));
 			nr++;
-			tags[i] = n;
+			/*
+			 * Snapshot the strings and counters while still
+			 * holding the module list lock, so the caller does
+			 * not dereference a module codetag that may have
+			 * been unloaded by then.
+			 */
+			allocinfo_to_params(ct, &tags[i], &counter);
 		}
 	}
 
diff --git a/mm/show_mem.c b/mm/show_mem.c
index b938cbcd774a1e2ec732f8c3703cae0dbe57d488..8d99a809f27fa9ca40a5184770ad0ec5b43f2aa1 100644
--- a/mm/show_mem.c
+++ b/mm/show_mem.c
@@ -436,7 +436,11 @@ void __show_mem(unsigned int filter, const nodemask_t *nodemask,
 	static DEFINE_SPINLOCK(mem_alloc_profiling_spinlock);
 
 	if (spin_trylock(&mem_alloc_profiling_spinlock)) {
-		struct codetag_bytes tags[10];
+		/*
+		 * Protected by mem_alloc_profiling_spinlock; kept static to
+		 * avoid a large stack frame in this potentially atomic path.
+		 */
+		static struct allocinfo_tag_data tags[10];
 		size_t i, nr;
 
 		nr = alloc_tag_top_users(tags, ARRAY_SIZE(tags), false);
@@ -444,22 +448,23 @@ void __show_mem(unsigned int filter, const nodemask_t *nodemask,
 			pr_notice("Memory allocations (profiling is currently turned %s):\n",
 				mem_alloc_profiling_enabled() ? "on" : "off");
 			for (i = 0; i < nr; i++) {
-				struct codetag *ct = tags[i].ct;
-				struct alloc_tag *tag = ct_to_alloc_tag(ct);
-				struct alloc_tag_counters counter = alloc_tag_read(tag);
+				struct allocinfo_tag *tag = &tags[i].tag;
+				struct allocinfo_counter *counter = &tags[i].counter;
 				char bytes[10];
 
-				string_get_size(counter.bytes, 1, STRING_UNITS_2, bytes, sizeof(bytes));
+				string_get_size(counter->bytes, 1,
+						STRING_UNITS_2, bytes,
+						sizeof(bytes));
 
 				/* Same as alloc_tag_to_text() but w/o intermediate buffer */
-				if (ct->modname)
-					pr_notice("%12s %8llu %s:%u [%s] func:%s\n",
-						  bytes, counter.calls, ct->filename,
-						  ct->lineno, ct->modname, ct->function);
+				if (tag->modname[0])
+					pr_notice("%12s %8llu %s:%llu [%s] func:%s\n",
+						  bytes, counter->calls, tag->filename,
+						  tag->lineno, tag->modname, tag->function);
 				else
-					pr_notice("%12s %8llu %s:%u func:%s\n",
-						  bytes, counter.calls, ct->filename,
-						  ct->lineno, ct->function);
+					pr_notice("%12s %8llu %s:%llu func:%s\n",
+						  bytes, counter->calls, tag->filename,
+						  tag->lineno, tag->function);
 			}
 		}
 		spin_unlock(&mem_alloc_profiling_spinlock);

base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
-- 
2.43.0
