Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787C3562609
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789064531; cv=none; b=V3CtT4w4d9WmZBwx+Cel4AkgbRndzzmyirWQOKkU9TSTNVgaW4AWnpm8ufxNDAI7XMjrUIlMNTw66nG2L0B9gXX1iAOkPDQ+DVd52NV14f2dbz/uj0D+M0Z7XYumKPk0slfi7QJQZtlFS+HpxN4RFO7QUTccG5HIn/0R+UVktIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789064531; c=relaxed/simple;
	bh=xeBaVq34Fvm+F/zQVDvqjxr/qQQkcNW+NLJKAnQ0Gzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jIY40F2hXq1w8kErKao1WhDbnwF/c+/03iJdArcBzYN8kiQ63IyZYNCR0HJvBF1Hv9RWRSaLawAmx81lSv1iEKc3zcMZdgkpuEfopa/nDZ3A22G5lXNY49ILDTrtBBAei2/Q3ViIl3cEjL//kicmYp99G/+gUy2sodd2eVfKWYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=hiq9LTIH; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="hiq9LTIH"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so813965e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1789064526; x=1789669326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqDHIUprFGhLpfjoTtzfh0mDO50nuGrZXReIflYDQ28=;
        b=hiq9LTIHwK9bGox2e61Q5JkEOIfi+7XrnWER7D9SJLinSRQdrsBjxlA5spo7zgyAVa
         7NYb7ST88F24ybJlmGl6mksaluXawXRSUr/HaVSdc6QDYpqeo4VKgTGz/th2wYgKZFvo
         QQzwAJa+3qc7MyKVYBaHba7QLHkuhZca0UWtBE9gkN/O08doU6OxkReN/DoVYsVWtu7W
         weEJ3ksB3WQC+JIhHBg0FbK+PrYk/W9kxYDp2Mmg/8xdU14P+HMFFpLcyOIcWk6NXy3E
         ayBUpZt5yP3Si/1PnXBfAGXs+ikXz45dEYYaQ4j1Pqxx1ByjqfLiakl+NUIVCZ5pN8J8
         U+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789064526; x=1789669326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqDHIUprFGhLpfjoTtzfh0mDO50nuGrZXReIflYDQ28=;
        b=ovcwo6GHqEJfsEH3i45frrvV/sIXBFRY2OG0F9PKGmqGc1sEgZyVJJ0tVJM5sGsiUS
         MJLnTJ1riySQaw/Q3m8aBfbb9Cbtlddm4B67L9aP9veQbdDK/fY8Hadg7+1jBovF3hGb
         1PNMQ4ITT+SGqGwGCLw/2tPPnqXVXpu+n6zU7dIYYcyIKYapRWvYCNhR9jmeyncUXiAZ
         ciDOPD/ceDo5G13lfRPI+KNrLZ8mrHBKCPR4YrOeqa/zdoKWziaHT3ZXoGWJgpQDHZVn
         rUBpEiDh5/r/oxHlmi5LneSCJkuPc50BYg2RBld49V2dHS86MVqrzELUgkt2LGdgMN7t
         IZ6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxHnkS+5Avzl400XUgovyPG7daaja1daef2a4WrKl+MGWqFpUMD3tkImaDgfo3CnyUymTgXYfuYEH1JNI8=@vger.kernel.org
X-Gm-Message-State: AFuF++kitLdkVMtfXapv0AcHGyLrd8ULG9xrWPOyLHOC2CQYG8oAFJ5X
	mPS2fhsg5E4E96Ds5lseysA/c0AdDS6gj1OjL6IOR+bDKvq/REFPU0p4wHbDLMTUPw4=
X-Gm-Gg: AYBFou1H1ydCbzx74u0FowB80l2Ba+2teltjCdRrffPDS6OKdafdC5W2WfIS0iS+AAk
	8FIZz1kZ4LJD+IQAxyJ01TIaEAvQ6HgfNGrHiQSO7WzFNEvxP/NOLvoQeCJwUm2QeNa2xReoiqH
	Vvl1ovt3U1iZ7yXO5UUI+yTAOyZtFXjA8zhxk5yJFBKsYfgw389FpSKoFNB5gYkOXW8rT8xkSQs
	XkEp3tNYX8s/0ELT8HQcv4G6ydyeACPPdUXR7M7V+PeBDBaNB5t7NSo+tREaHQbFueuTCClLtoT
	XWPdBmc0rnRuwNYUeeJC8IwYP/sQEMMszF3EpqTVvdHNiWy/MxYenWSXKWnkzGgX5h70taoMzT0
	xWemZ9e4UILf0jJNp+E0wgFfUg/ZhgwpxFkF0t7XqX9lrYBR1xM9RHN5QvFZOpFvcWxHiXdspUT
	rrPh3TzVwSPjf228fD3LLghcb/QdHiO53R3vlRYzc84QfnJ2UcWHyHXK7DTwZTCRkQuXOHusgW0
	FhgnaqXCyg8JIDgVEbK68L5F+g5bARYGuwSBzgVBBM6/zKSt8b4L0a1WxPx0ELoE0UnsiVrVr0=
X-Received: by 2002:a05:600d:6501:10b0:49c:fa21:e73b with SMTP id 5b1f17b1804b1-49e619c0bc0mr2423325e9.17.1789064526542;
        Thu, 10 Sep 2026 11:22:06 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f04b700023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f04:b700:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e5765152asm40025455e9.11.2026.09.10.11.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:22:06 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: dhowells@redhat.com,
	steved@redhat.com,
	viro@zeniv.linux.org.uk,
	netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>,
	stable@vger.kernel.org
Subject: [PATCH] cachefiles: pass a poll key when waking the daemon
Date: Thu, 10 Sep 2026 20:22:00 +0200
Message-ID: <20260910182200.1272489-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keyless wakeups bypass epoll's event-mask filtering.  With only
`EPOLLOUT` registered, any cachefiles_state_changed() call will wake
up the epoll_wait() system call, but will not return any events,
causing a busy loop.

Pass the relevant poll events with each wakeup so `epoll` can filter
out unwanted notifications.

Fixes: a5b3a80b899b ("CacheFiles: Provide read-and-reset release counters for cachefilesd")
Cc: stable@vger.kernel.org
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
Note: backports to older branches need to adjust ondemand.c as well
like this:
-       wake_up_all(&cache->daemon_pollwq);
+       cachefiles_wake_poll(cache, EPOLLIN);
---
 fs/cachefiles/cache.c    |  4 ++--
 fs/cachefiles/internal.h | 15 +++++++++++++--
 fs/cachefiles/namei.c    |  2 +-
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/fs/cachefiles/cache.c b/fs/cachefiles/cache.c
index 9fb06dc16520..08ca598618ac 100644
--- a/fs/cachefiles/cache.c
+++ b/fs/cachefiles/cache.c
@@ -255,7 +255,7 @@ int cachefiles_has_space(struct cachefiles_cache *cache,
 	    test_and_clear_bit(CACHEFILES_CULLING, &cache->flags)
 	    ) {
 		_debug("cease culling");
-		cachefiles_state_changed(cache);
+		cachefiles_state_changed(cache, EPOLLIN);
 	}
 
 	//_leave(" = 0");
@@ -275,7 +275,7 @@ int cachefiles_has_space(struct cachefiles_cache *cache,
 begin_cull:
 	if (!test_and_set_bit(CACHEFILES_CULLING, &cache->flags)) {
 		_debug("### CULL CACHE ###");
-		cachefiles_state_changed(cache);
+		cachefiles_state_changed(cache, EPOLLIN | EPOLLOUT);
 	}
 
 	_leave(" = %d", ret);
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index c93324e0f98c..b8a5ea4a5ced 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -15,6 +15,7 @@
 #include <linux/fscache-cache.h>
 #include <linux/cred.h>
 #include <linux/security.h>
+#include <linux/poll.h>
 
 #define CACHEFILES_DIO_BLOCK_SIZE 4096
 
@@ -117,13 +118,23 @@ struct cachefiles_object *cachefiles_cres_object(struct netfs_cache_resources *c
 	return fscache_cres_cookie(cres)->cache_priv;
 }
 
+/*
+ * Wake up the daemon polling on /dev/cachefiles.
+ */
+static inline void cachefiles_wake_poll(struct cachefiles_cache *cache,
+					__poll_t mask)
+{
+	__wake_up(&cache->daemon_pollwq, TASK_NORMAL, 0, poll_to_key(mask));
+}
+
 /*
  * note change of state for daemon
  */
-static inline void cachefiles_state_changed(struct cachefiles_cache *cache)
+static inline void cachefiles_state_changed(struct cachefiles_cache *cache,
+					    __poll_t mask)
 {
 	set_bit(CACHEFILES_STATE_CHANGED, &cache->flags);
-	wake_up_all(&cache->daemon_pollwq);
+	cachefiles_wake_poll(cache, mask);
 }
 
 /*
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index 88955249a1a6..52eb227f07e8 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -74,7 +74,7 @@ void cachefiles_unmark_inode_in_use(struct cachefiles_object *object,
 	if (!test_bit(CACHEFILES_OBJECT_USING_TMPFILE, &object->flags)) {
 		atomic_long_add(inode->i_blocks, &cache->b_released);
 		if (atomic_inc_return(&cache->f_released))
-			cachefiles_state_changed(cache);
+			cachefiles_state_changed(cache, EPOLLIN);
 	}
 }
 
-- 
2.47.3

