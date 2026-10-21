Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597405;
	b=ggd/qsCKObL7ZH7WJfi1hqdaAKk8RvtdA2fOJQCNECJoZ8K/MEk4RxZxUTbPXF/XhCpt
	 UMe1yOKnKQnWshDEg3Q43Qe58GPAcwhAgZQwBt4DV96Xk9Gd4VpvT6NelrLXEbpcgdiFa
	 mTngvjg8hTOiYVrFwtgNbphzHCKuYzgA2pPpkxzfQjCjvS3SuJCWQ88bHuzKk8cxsyoeQ
	 /Eazy4jRUEXAyrNif+mbohZaq4AsTxTDffJjJjn93R/NOxYEx64yUTkkKpcjga0OVZl9Q
	 wNSh8J2zWlq6oQwwvphm/bMVhvVgIRIRzgXv0NdQbkk5VyCgGz6kh25prhrZtaSnOtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597405;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key:
	 X-Scanned-By;
	bh=ZHTYv0VO9aY7PwOBwtSPq4scBz+tl0Yn7UyaQhfeCzE=;
	b=fybtTVhaw/DCZ/TxG7hLtWmjmp+3HV+G73hcSIKJPsIbbKBsWhEXKcQG1fCbmtTzpc4x
	 c74HEfDkjaLmPL7YDGlN8cobddOZMaZJvvZYY1yLw+5ArSVP4x81SSlLQa9KCbb+5eiyM
	 tFMAjtJcMZTKZTBQQokcgVQjZ2k/yBh5y/C2O9qfFTCpYD6CIPD9lbQrQmzFwhFXpKmV2
	 PvtBPWI9ecbnxfxqAhhuUCV4c45xgsKrZQILOeD9MXTMwDyqDaqHcgumhW+nrkdS0vgC4
	 9Z6X/q3YGOH6tlccUIvqY9bph6c2kruDdW6FJNx2K7BGbkhT78e2TxQGvJk3ZEdcEjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ex7bV67x;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD58760A262A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD58760A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ex7bV67x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792597404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHTYv0VO9aY7PwOBwtSPq4scBz+tl0Yn7UyaQhfeCzE=;
	b=Ex7bV67xb9bb7bnEoTd1N0Vf8ydUrDrKnFZv3lmwidTJkIXmo0UkhFkgsu15md+DjqmVns
	8QxTxAFREkW9+WGN4O09BzzoktHUMXlxacySFb3+adprGOWQ5onTvN83zmz8B1bJtazJFF
	1QhEfMV6aptL8x4d0qdvDpmItWFwgtw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-tzdlTOhdMTGjxqvp716Waw-1; Wed,
 21 Oct 2026 15:43:20 +0000
X-MC-Unique: tzdlTOhdMTGjxqvp716Waw-1
X-Mimecast-MFC-AGG-ID: tzdlTOhdMTGjxqvp716Waw_1792597396
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 280DB1956045;
	Wed, 21 Oct 2026 15:43:15 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BCFFC18005AD;
	Wed, 21 Oct 2026 15:43:06 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 21 Oct 2026 17:42:24 +0200
Subject: [PATCH RFC v2 3/8] security: dma-buf: Add dma_buf_charge_task LSM
 hook
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
Message-Id: <20261021-v2_20230123_tjmercier_google_com-v2-3-ef6ee2dd8c5c@redhat.com>
References: <20261021-v2_20230123_tjmercier_google_com-v2-0-ef6ee2dd8c5c@redhat.com>
In-Reply-To: <20261021-v2_20230123_tjmercier_google_com-v2-0-ef6ee2dd8c5c@redhat.com>
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 Christian Brauner <brauner@kernel.org>, Paul Moore <paul@paul-moore.com>, 
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 =?utf-8?q?Ondrej_Mosn=C3=A1=C4=8Dek?= <omosnacek@gmail.com>, 
 =?utf-8?q?Ondrej_Mosn=C3=A1=C4=8Dek?= <omosnacek@gmail.com>
Cc: cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, mripard@kernel.org, echanude@redhat.com
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792597359; l=5166;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=GGVHkdnZK1acWxQXJIiqldFncGDO62BeQH/m67q6EgU=;
 b=bF4QxBP15zmcBwa57Cg3dyNAHs4Ve6OZAB+SemxZmHpgMSelS/8VJoDkSf8hc7XvoK1EgA9tS
 FYnWsHW4jfQAp8bq7qcK2dmn6oyUbq7h050bh1rAcckEdcD1Vz294qC
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

DMA_HEAP_IOCTL_ALLOC accepts a charge_fd field that,
when set, causes the allocation to be charged to an arbitrary
process's cgroup rather than the caller's.

Without an access-control point, any process that holds a handle
to a dma-heap device node can charge unlimited memory to any other
process's cgroup, potentially exhausting that cgroup's limit and
triggering OOM kills independent of the victim's own activity or
privileges.

Add security_dma_buf_charge_task(), called in dma_heap_ioctl_allocate()
when charge_fd refers to another process. The hook receives
the credentials of the allocating process (from) and the credentials
of the process whose cgroup will be charged (to), giving security
modules a controlled enforcement point for cross-cgroup dma-buf
attribution policy.

When CONFIG_SECURITY is not set the hook compiles to an inline
returning 0, adding no overhead to the fast path.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/dma-buf/dma-heap.c    | 12 +++++++++++-
 include/linux/lsm_hook_defs.h |  1 +
 include/linux/security.h      |  7 +++++++
 security/security.c           | 16 ++++++++++++++++
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index be77a4c168ab..c31573917886 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -19,6 +19,7 @@
 #include <linux/minmax.h>
 #include <linux/nospec.h>
 #include <linux/pidfd.h>
+#include <linux/security.h>
 #include <linux/syscalls.h>
 #include <linux/uaccess.h>
 #include <linux/xarray.h>
@@ -81,13 +82,14 @@ static struct dma_buf *dma_heap_ioctl_allocate(struct file *file, void *data)
 {
 	struct cgroup *cgrp;
 	struct cgroup_subsys_state *css;
+	const struct cred *tcred;
 	struct dma_heap_allocation_data *heap_allocation = data;
 	struct dma_heap *heap = file->private_data;
 	struct dma_buf *dmabuf;
 	struct mem_cgroup *memcg = NULL;
 	struct task_struct *task;
 	unsigned int pidfd_flags;
-	int fd;
+	int fd, ret;
 	size_t len;
 
 	if (heap_allocation->fd)
@@ -120,6 +122,14 @@ static struct dma_buf *dma_heap_ioctl_allocate(struct file *file, void *data)
 			if (IS_ERR(task))
 				return ERR_CAST(task);
 
+			tcred = get_task_cred(task);
+			ret = security_dma_buf_charge_task(current_cred(), tcred);
+			put_cred(tcred);
+			if (ret) {
+				put_task_struct(task);
+				return ERR_PTR(ret);
+			}
+
 			memcg = get_mem_cgroup_from_mm(task->mm);
 			put_task_struct(task);
 		}
diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 65c9609ec207..0f1138e16dbe 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -43,6 +43,7 @@ LSM_HOOK(int, 0, capset, struct cred *new, const struct cred *old,
 	 const kernel_cap_t *permitted)
 LSM_HOOK(int, 0, capable, const struct cred *cred, struct user_namespace *ns,
 	 int cap, unsigned int opts)
+LSM_HOOK(int, 0, dma_buf_charge_task, const struct cred *from, const struct cred *to)
 LSM_HOOK(int, 0, quotactl, int cmds, int type, int id, const struct super_block *sb)
 LSM_HOOK(int, 0, quota_on, struct dentry *dentry)
 LSM_HOOK(int, 0, syslog, int type)
diff --git a/include/linux/security.h b/include/linux/security.h
index 153e9043058f..89a35eb07b8c 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -350,6 +350,7 @@ int security_capable(const struct cred *cred,
 		       struct user_namespace *ns,
 		       int cap,
 		       unsigned int opts);
+int security_dma_buf_charge_task(const struct cred *from, const struct cred *to);
 int security_quotactl(int cmds, int type, int id, const struct super_block *sb);
 int security_quota_on(struct dentry *dentry);
 int security_syslog(int type);
@@ -701,6 +702,12 @@ static inline int security_capable(const struct cred *cred,
 	return cap_capable(cred, ns, cap, opts);
 }
 
+static inline int security_dma_buf_charge_task(const struct cred *from,
+					       const struct cred *to)
+{
+	return 0;
+}
+
 static inline int security_quotactl(int cmds, int type, int id,
 				     const struct super_block *sb)
 {
diff --git a/security/security.c b/security/security.c
index 2ee276ab15c5..4a16e4076aab 100644
--- a/security/security.c
+++ b/security/security.c
@@ -660,6 +660,22 @@ int security_capable(const struct cred *cred,
 	return call_int_hook(capable, cred, ns, cap, opts);
 }
 
+/**
+ * security_dma_buf_charge_task() - Check if cross-cgroup dma-heap charging is allowed
+ * @from: credentials of the allocating process
+ * @to: credentials of the process to charge
+ *
+ * Check whether the process with credentials @from is allowed to allocate
+ * dma-heap memory and charge it to the cgroup of the process with credentials
+ * @to.
+ *
+ * Return: Returns 0 if permission is granted.
+ */
+int security_dma_buf_charge_task(const struct cred *from, const struct cred *to)
+{
+	return call_int_hook(dma_buf_charge_task, from, to);
+}
+
 /**
  * security_quotactl() - Check if a quotactl() syscall is allowed for this fs
  * @cmds: commands

-- 
2.55.0

