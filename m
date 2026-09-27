Received: from mta0.migadu.com (out-101.mta0.migadu.com [91.218.175.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CA43A9870
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790502905; cv=none; b=sL+1Oy22Ocj0+FYwBU7RGkaI9k/vV/EZmXygGFiRfVwKqMeNs30aJIJjcN5xjDWFMzWa4YlulSCRKadHwkuEAEWve4IegWZFXkikmdYYylQFfAEO6xzQbNqyqCnU/eYhhMSEWnh2sgRjF8e/EIdAp6QcSU8bD4nBCyd7Sc1HCKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790502905; c=relaxed/simple;
	bh=MnUziHyI7x/kpNN1Hc2LF0E+uP7SX1LMj6VKOBxKczs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cHNpmrrzEkNhvRJx/2jfFlae39MH92CNa9DS9iWXys/6YCwFyWvzr2rS9NeBZFMMQo806qLMbIDchzhofUUpZixR0X6mW6ez7nxSaBYFz9LdKGW+XD/jrj4/bm0j12KGotXqoWZo1wkXPS6igQCN8VdC28hAio/aAEiqTI3P0rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gABBMUzM; arc=none smtp.client-ip=91.218.175.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gABBMUzM"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MnUziHyI7x/kpNN1Hc2LF0E+uP7SX1LMj6VKOBxKczs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790502899; v=1; x=1791107699;
 b=gABBMUzMEROqx3xzvGdiOWTjsJ7YOFC6Ecl4Kij2r4ubdtxSmfoq77BEBGExUuBd2+S4i2Fc
 8oMYaZ6mdOHsantFFe3Tc0K4DcxQ83Jy+/faX8B6L1Plo0Uwh171x/HnGd5qbP+Xx0+x9OQkt1Y
 DlJ+SU0dYJRPOs6h8gFWlVKM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 66a51e8696da171c;
	Sun, 27 Sep 2026 09:54:59 +0000
X-Mizu-Trace-ID: 66a51e8696da171c
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Michal Grzedzicki <mge@meta.com>,
	Alexey Gladkov <legion@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Jan Kara <jack@suse.cz>,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH] fork: fix active reference underflow on unshare() failure
Date: Sun, 27 Sep 2026 17:54:50 +0800
Message-ID: <20260927095450.3017586-1-cui.tao@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

When set_cred_ucounts() fails in ksys_unshare() the new nsproxy is
released with put_nsproxy().  But the nsproxy has not been installed
at this point; it is only marked as active once
switch_task_namespaces() installs it, which happens after all failure
points.  Dropping the last reference therefore deactivates it and
puts the active reference of every namespace it points to: for
namespaces created by this unshare() call the active count underflows
to -1, and for namespaces carried over from the caller a live active
reference of the still-running task is dropped, which makes them
disappear from nsfs file handles and listns and causes a cascading
underflow at task exit.

Use nsproxy_free() on this error path, which drops the regular
references without touching the active ones, like the setns() failure
paths already do; see commit cefd55bd2159 ("nsproxy: fix
free_nsproxy() and simplify create_new_namespaces()").

Fixes: a98621a0f187a ("unshare: fix nsproxy leak in ksys_unshare() on set_cred_ucounts() failure")
Link: https://lore.kernel.org/r/20251118064552.936962-1-ptikhomirov@virtuozzo.com
Link: https://lore.kernel.org/r/20260213193959.2556730-1-mge@meta.com
Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 include/linux/nsproxy.h | 1 +
 kernel/fork.c           | 2 +-
 kernel/nsproxy.c        | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/nsproxy.h b/include/linux/nsproxy.h
index 5a67648721c7d..dc2447f5f0924 100644
--- a/include/linux/nsproxy.h
+++ b/include/linux/nsproxy.h
@@ -100,6 +100,7 @@ void exit_cred_namespaces(struct task_struct *tsk);
 void switch_task_namespaces(struct task_struct *tsk, struct nsproxy *new);
 int exec_task_namespaces(void);
 void deactivate_nsproxy(struct nsproxy *ns);
+void nsproxy_free(struct nsproxy *ns);
 int unshare_nsproxy_namespaces(unsigned long, struct nsproxy **,
 	struct cred *, struct fs_struct *);
 int __init nsproxy_cache_init(void);
diff --git a/kernel/fork.c b/kernel/fork.c
index d458d85d7a656..11e16554daa61 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -3324,7 +3324,7 @@ int ksys_unshare(unsigned long unshare_flags)
 
 bad_unshare_cleanup_nsproxy:
 	if (new_nsproxy)
-		put_nsproxy(new_nsproxy);
+		nsproxy_free(new_nsproxy);
 bad_unshare_cleanup_cred:
 	if (new_cred)
 		put_cred(new_cred);
diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
index 0f1b208d8eeff..454427b09ed97 100644
--- a/kernel/nsproxy.c
+++ b/kernel/nsproxy.c
@@ -61,7 +61,7 @@ static inline struct nsproxy *create_nsproxy(void)
 	return nsproxy;
 }
 
-static inline void nsproxy_free(struct nsproxy *ns)
+void nsproxy_free(struct nsproxy *ns)
 {
 	put_mnt_ns(ns->mnt_ns);
 	put_uts_ns(ns->uts_ns);
-- 
2.43.0

