Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854863;
	b=MseYo1mVKCBFYKtPmrLgmImzLpN+3IRFEvUSso5jtkN++EzwIqncrdgpWxdeX7J62lvh
	 7vqGdh/rYxuQvD8r4bYnIl5Ttw7WkWa41g5QcDy4z2Dy3ViU5bBh/zcERq8DV8vxqMTd4
	 w3LQwsn0nFIi7Kcj0iJCTi79FKwu3Q0XOgRK1J1e5FmNa2W6YPyb9GCQd8P/LP7jg4Hv2
	 cTvAKRtKaQ66yUJAewqOcINpz731AxnV0JKT0RW6DQ0VOVfSLahdAJLMxcUZlMK3iZv4c
	 sI5Qlz15P8WP6UJGGAVcXCvimuemApLcQjiAWc10PkMaq4akqdFBMvwWMQbVAAk7tnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v098YBuIdrKaWG/f26OqsK+m7fEKJ39NQmIhL+jm86Q=;
	b=z8hwfYurO2MCOPlx0Rya2mBR6y98l6mUInxHhStWHoTJOIkHcs2mu6OcRu7Zu1SwwSKF
	 CPyjGTjuYhoMqbwfCQ/mH9RDYPRyWp3h+6/Noa9vPPjkidesivl6NSBAROcuD0BZSxise
	 J5yS0qhmk2SoYPibfIkb3dC82ZtAg7rN5l3fkA8EXG+O9evhbg8GtxSwXQUXw5Yls/dRe
	 JGxL+Jli1+fzw0wSovgHLAa97ZT+3sQhk9JQffZP7dSVFl3O2AZereBd7MTSBBoD5By1L
	 piQ7Lr/Uf6C2wFClci8AeT7vZNE4aHcsx8YJ5DgVAueQyKKZcul248gM8Kyk6MTZ7Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=bVWrYH5l;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD256606D814
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD256606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=bVWrYH5l
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eae1276409so485415e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793854862; x=1794459662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v098YBuIdrKaWG/f26OqsK+m7fEKJ39NQmIhL+jm86Q=;
        b=bVWrYH5l5854+NhczsUhYu3xmfCoWRgcjOfjUMuXKuNr7w549b6w7jSfDM4cZ+BLxc
         619ViqeDZP/4H+pKutBapgf9vnTHOJgr4iLyKC29hsoHEmPxzODxf6p6qVq+FnD/aO5C
         dSr3NrVNXAc5hPLr7y9ZK3YpmVIlQc8OuHIv2Xk5kxRIpoWuAtZZRkkv7z0w2Qf7COky
         trKVLTK5NyhF26inZjCCM6NZ+D/A1s/AGe8pqg6vUgo52a8UMgy5dNRFS6hme2vIVbG/
         NRbWBZWYj5b7v0eHB45bozBI2N0IJ6mK0jwx0iswaci8djlHuk/n//wL4FoPtwQMjcHY
         ONeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854862; x=1794459662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=v098YBuIdrKaWG/f26OqsK+m7fEKJ39NQmIhL+jm86Q=;
        b=bhvSOQBDPHR0TJdsbYFU7dFC+M/FtTLa2xNnAxbWKnXp2vc8h6kdQc1ic1VJiWu48q
         vprimiYcr098GBtFZce3pttFFRJQ/WMAtfGNQvmDTgxpwhLID9njV0HsbFaom31HkqWR
         8y0H8s5OA9sODE/+pCu2njDcuyoIw38LVRqlJqiFREEh+cyxD0zwbhJ6ilHl6eceZ7n1
         n75SYWGslzUgdCmmubY9mCkJERJldpRkEE0MPH1Rzhq8wYlX0M+NM1o3R85Y+wp6sBkn
         MET8yGEYVZmofhsJFGEMuJwmVqoVdPNnZk2xNnsskSdS5VNjD9k7kUiPBZ60ZqtnA2/E
         OjGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoPOd0XMdOTV7BXgyEdU5JCVdMcz4ItfkgYtk0z62c80juTE5bW8t/6Opuw3Taqj0fcAMjMSGYTDrn+JE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nDg9dtGjC8sWFkgf7H5A9xKHFfsGlkTlX+C7so00Ex2+T6t9N
	mdYyCK6W9MK/9is1KKkE+duZRTGwLONCq/xHu/2oS69oCzVh4q3n9qMkRsBhODHw9s2YDrqHri+
	cSWvq
X-Gm-Gg: AYBFou3sNtgVv4bsA3VWQY3znzlOfC3ZZNVOpd+jf5KpHEXTC4i4DUcla5jWxOszj7d
	b2Pb0my8mijfIgN5xVxCbJmycmQV0JZOhU+ESSyP57ouPOctcGVSvxgYZMcmvDlLCGAcpU5FZtq
	pZDQcn0pLvvz8VdZ4HIzpfCkRzdYdpJm9MFaMVtNaCbTfzzaXv/22+YKL6Epn3gLjzfLJQ02Awj
	OjcDtidfRky1mokA0iDMaiEpoMRc7XHH/VRABJdrmk8ACvSdQfCi+SUFalUD1MIyN1g4QPDf26e
	KV4BBN9UEI6mNkaKZCEngmttZ9Sq0pkG8kZGKC58f89D6fgyXfeUb7z64+HQbvIRfDRSsIaJ1ZF
	sIspwalpTUfgr6NzZ+umLUNvyEYaZoDSGDxJ8QA+7kvWdpKBXXDwD1gGWnYWOU9XpGS+WXwqM1C
	DWox3H3BvuG6cmOmQBQQGNnn0C44XjCL9vRIH7ZcZ/wHXEWBSnOT2PdfD+GYndDUHytRgV5MP82
	q+/Ddw2lQKCznKCJs+/o5HE/L6mnSOcXqwyXLY6MHcqWXCB+Nr+sxN1yr6PhoSIjeKdHDxU0LvS
	OQznWmhPDtBiA3dMOTOOWk3t2VOXj+Dr09pwx17DqiLmeXxqRZ5PoMoGwtyomBVabqEwwKGYrY/
	aGjG9oVbfC/PdNR352rq574vuZyEqzu8uzGBEExl8n8fzyEW/hw==
X-Received: by 2002:a05:6122:468d:b0:5ec:4a13:8aae with SMTP id 71dfb90a1353d-5ec689801b4mr8447981e0c.17.1793854861885;
        Wed, 04 Nov 2026 21:01:01 -0800 (PST)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d9d62bsm3305282e0c.8.2026.11.04.21.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:01:01 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	graf@amazon.com
Subject: [PATCH v5 3/6] liveupdate: luo: serialize sessions via per-session publish helper
Date: Thu,  5 Nov 2026 00:00:49 -0500
Message-ID: <20261105050053.3063001-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
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

With incremental kho_block publication in place, LUO sessions can be
published into sh->block_set individually as they are committed, rather
than rebuilding the entire session serialization chain during reboot.

Currently, luo_session_serialize() resets *sh->sessions_pa and
serializes all outgoing sessions from scratch in a single pass at reboot
time.

Introduce luo_session_publish_one() to append a session's
luo_session_ser entry via kho_block_set_it_append() and move the session
onto sh->published_list. Update luo_session_serialize() to freeze all
remaining unpublished sessions first (rolling back via
luo_session_unfreeze_one() on failure) and then publish them in a second
pass.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_session.c | 92 ++++++++++++++++++++++-----------
 1 file changed, 63 insertions(+), 29 deletions(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 6dea35911181..caf0e85081e8 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -103,20 +103,30 @@
 static DECLARE_RWSEM(luo_session_serialize_rwsem);
 /**
  * struct luo_session_header - Header struct for managing LUO sessions.
- * @count:       The number of sessions currently tracked in the @list.
+ * @count:       The number of sessions currently tracked in the header.
+ * @published_count: The number of outgoing sessions currently published in
+ *                   @block_set.
  * @list:        The head of the linked list of `struct luo_session` instances.
+ * @published_list:  The head of the linked list of published outgoing
+ *                   sessions, ordered identically to their entries in
+ *                   @block_set.
  * @rwsem:       A read-write semaphore providing synchronized access to the
  *               session list and other fields in this structure.
  * @block_set:   The set of serialization blocks.
+ * @it:          Iterator tracking the next slot in @block_set for outgoing
+ *               session serialization.
  * @sessions_pa: Points to the location of sessions_pa within struct luo_ser.
  * @active:      Set to true when first initialized. If previous kernel did not
  *               send session data, active stays false for incoming.
  */
 struct luo_session_header {
 	long count;
+	long published_count;
 	struct list_head list;
+	struct list_head published_list;
 	struct rw_semaphore rwsem;
 	struct kho_block_set block_set;
+	struct kho_block_set_it it;
 	u64 *sessions_pa;
 	bool active;
 };
@@ -134,12 +144,14 @@ struct luo_session_global {
 static struct luo_session_global luo_session_global = {
 	.incoming = {
 		.list = LIST_HEAD_INIT(luo_session_global.incoming.list),
+		.published_list = LIST_HEAD_INIT(luo_session_global.incoming.published_list),
 		.rwsem = __RWSEM_INITIALIZER(luo_session_global.incoming.rwsem),
 		.block_set = KHO_BLOCK_SET_INIT(luo_session_global.incoming.block_set,
 						sizeof(struct luo_session_ser)),
 	},
 	.outgoing = {
 		.list = LIST_HEAD_INIT(luo_session_global.outgoing.list),
+		.published_list = LIST_HEAD_INIT(luo_session_global.outgoing.published_list),
 		.rwsem = __RWSEM_INITIALIZER(luo_session_global.outgoing.rwsem),
 		.block_set = KHO_BLOCK_SET_INIT(luo_session_global.outgoing.block_set,
 						sizeof(struct luo_session_ser)),
@@ -186,6 +198,10 @@ static int luo_session_insert(struct luo_session_header *sh,
 		if (!strncmp(it->name, session->name, sizeof(it->name)))
 			return -EEXIST;
 	}
+	list_for_each_entry(it, &sh->published_list, list) {
+		if (!strncmp(it->name, session->name, sizeof(it->name)))
+			return -EEXIST;
+	}
 
 	/*
 	 * For outgoing we should make sure there is room in serialization array
@@ -203,6 +219,42 @@ static int luo_session_insert(struct luo_session_header *sh,
 	return 0;
 }
 
+static void luo_session_publish_one(struct luo_session *session)
+{
+	struct luo_session_header *sh = &luo_session_global.outgoing;
+	struct luo_session_ser entry = {};
+
+	lockdep_assert_held_write(&sh->rwsem);
+	lockdep_assert_held(&session->mutex);
+
+	if (!sh->active || !sh->sessions_pa)
+		return;
+
+	if (!sh->published_count)
+		kho_block_set_it_init(&sh->it, &sh->block_set);
+
+	strscpy(entry.name, session->name, sizeof(entry.name));
+	entry.file_set_ser.count = session->file_set.count;
+	entry.file_set_ser.files =
+		kho_block_set_head_pa(&session->file_set.block_set);
+
+	/* This should not fail normally as blocks were pre-allocated */
+	if (WARN_ON_ONCE(!kho_block_set_it_append(&sh->it, &entry)))
+		return;
+
+	if (!sh->published_count) {
+		/*
+		 * Ensure the first block header and entry are visible before
+		 * publishing sessions_pa to concurrent KHO readers.
+		 */
+		smp_store_release(sh->sessions_pa,
+				  kho_block_set_head_pa(&sh->block_set));
+	}
+
+	list_move_tail(&session->list, &sh->published_list);
+	sh->published_count++;
+}
+
 static void luo_session_remove(struct luo_session_header *sh,
 			       struct luo_session *session)
 {
@@ -636,50 +688,32 @@ int luo_session_deserialize(void)
 int luo_session_serialize(void)
 {
 	struct luo_session_header *sh = &luo_session_global.outgoing;
-	struct luo_session *session;
-	struct kho_block_set_it it;
+	struct luo_session *session, *tmp;
 	int err;
 
 	down_write(&luo_session_serialize_rwsem);
 	down_write(&sh->rwsem);
-	*sh->sessions_pa = 0;
-
-	kho_block_set_it_init(&it, &sh->block_set);
 
 	list_for_each_entry(session, &sh->list, list) {
-		struct luo_session_ser *ser = kho_block_set_it_reserve_entry(&it);
-
-		/* This should not fail normally as blocks were pre-allocated */
-		if (WARN_ON_ONCE(!ser)) {
-			err = -ENOSPC;
-			goto err_undo;
-		}
-
 		err = luo_session_freeze_one(session);
 		if (err) {
-			kho_block_set_it_prev(&it);
-			goto err_undo;
+			list_for_each_entry_continue_reverse(session, &sh->list, list)
+				luo_session_unfreeze_one(session);
+			goto err_unlock;
 		}
+	}
 
-		strscpy(ser->name, session->name, sizeof(ser->name));
-		ser->file_set_ser.count = session->file_set.count;
-		ser->file_set_ser.files =
-			kho_block_set_head_pa(&session->file_set.block_set);
+	list_for_each_entry_safe(session, tmp, &sh->list, list) {
+		mutex_lock(&session->mutex);
+		luo_session_publish_one(session);
+		mutex_unlock(&session->mutex);
 	}
 
-	if (sh->count > 0)
-		*sh->sessions_pa = kho_block_set_head_pa(&sh->block_set);
 	up_write(&sh->rwsem);
 
 	return 0;
 
-err_undo:
-	list_for_each_entry_continue_reverse(session, &sh->list, list) {
-		struct luo_session_ser *ser = kho_block_set_it_prev(&it);
-
-		luo_session_unfreeze_one(session);
-		memset(ser, 0, sizeof(*ser));
-	}
+err_unlock:
 	up_write(&sh->rwsem);
 	up_write(&luo_session_serialize_rwsem);
 
-- 
2.56.0.398.g882cbad275-goog

