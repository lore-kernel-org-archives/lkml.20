Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891786;
	b=LUUNVWTQD0IPUHOZjboX+J2Qm8p/siEUfeADdH4gnI0+rMRhXa2o6BMv7ToCbzc0JsMN
	 mo30K7O3wtc3bRl8BkwjW8yztMgE0NGDfLEg9eZdE8Ntmuqqbz3xoVCs8HLw6NZg4XkZM
	 ZsbdUWUS8vS3f0PSDVu7ePUfS6FwopupihpMjJRHwn9mE07mPGqN3u7tpuN1eFIDWxh0R
	 pSqcsnvJIxGbQzxjk3/y1xmSuIr/4LWM/shyskxJHmMIgZHDtnLOKlnmVcqRgpNUHcNnp
	 5A3PASNmOXh6/pG31QnRYU2JmEq4YRtdGZEqw1q1ck3adX/FckrS7X83WTa8tlDe25w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7g1z1fdgH8pC7wU8IArmzkDI6Bi5iuUSZYwLMGECsDo=;
	b=y1EugLB+io2x8EtnY+1zqV3mMzA5hkQfBJoMJ1G8C7fvMHB2f1srmWFEbaGH52MdhgFp
	 6XTr6AiDBlcxvvZPSTSg+VuvnEF6urVXnSOcEbVxmQY6JzNnYZREYW5ubEzoCOUD+Mkph
	 Z2RvF6Viwyvb4leEUNvFOgncjS0IX+Kf5jznBfYkboXgjqBXLL9kD5Zjm88G3PtGzXbyt
	 SrmO/OeXEA9+KccUrc7/DpHOyfX/vbodJDVVOm9XW/iyVqtpJG9XQ3VlsWGoxDOET6Oak
	 wqUsNtK7Afs/Pw0mhEDbzY71VNOLFYvg6SeotI2MVbZLi6ad35i9qnfbx5tvtID+QcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=emmxrjZg;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173AA606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 173AA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=emmxrjZg
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c19fc50abso21003586d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793891785; x=1794496585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7g1z1fdgH8pC7wU8IArmzkDI6Bi5iuUSZYwLMGECsDo=;
        b=emmxrjZgnzgS8cICYm5ecvPwQRHRq0svHOm82G8MFAJ7W9ZOSKAdxQ40r7qxoBxgr5
         f5FhG1bPxBvjY6qf2yIN/l+1GrAoVB+P4CnRpckQ2nC8sK9uJZqOE3bfLOXsfCothntb
         T4mu2BX54Yk8gCfbqcLLBw/1Hw0ExsCWJIjNxdC+xy2/nLW1RIAIbaGai3E+GW0JJOhC
         WEWo1dcCy5Af7E9cH533yMuwsWTZrqjwOawIXPRUqf9g2mEm/I7jSXMJ+66bQId2M2Y6
         pgYuIM/VzwoAF8h563QKXpt2pfiFlT4qMAZTLIminPE3njOlPL7S06m2/sSjCt0ggO9n
         F7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891785; x=1794496585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7g1z1fdgH8pC7wU8IArmzkDI6Bi5iuUSZYwLMGECsDo=;
        b=HYZS6Bc1XLod0w46gMNLLjnU6foyu5LMsWonJBDvD/M081Ieuib4MsHzUDzD37lPIw
         gwuxwKVVg9J32tp//mQk9/vJ5NNk+BoF7IhgUcK3VFqXG2VApLLMmvcv2D0apOr+ADBa
         BwRPoA+5bcoRmTGUUPnyTsAR0bXNE2c9Zazp5qzJT+EL5sPUcZ96rs/Gh3nhvYb7gSQ+
         pA586bwvQv4oCskOyZnjl374jyewJzy/SCvrSOWp0OicbrGEqTAddMZ3ElvX2Ox4XPsW
         25Vsbz9yc2fztK89xl7Z9utGaz3bENvm7uZtkJSDUT27QkrkCZcLmScMPVZIeMjp03jg
         QxZQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3VViL+3SW3PPkSKDU4Cfxh22MxgG2Mowcu1T9cuamB0J//jG7ZuVe/ZhGT61yp721UzcL2hF+C+/BUqw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1f8cVWXVoLXODHxIOp+CcEYm2Z+mT0dQAvlLsuS6IGZKAyeGQ
	ARTvV+Hzqb0rEmf70N7rgMdb/qUa9ZAoJBmWJiXbKXWuqhGCxhFsEuT4uN/L50/U+k8=
X-Gm-Gg: AYBFou3GL+80uDSlWwN+ZUtN4vu/oaRzS5CQBrGyRi5nrUMn8ZJQBCrHimvLIZHZ2Sw
	rLdMBsfksf2SLdXKDJP25Y1Nd86JbytDx6e2haazRpFhCmXz/FJcj9plGhLYx016x4yj+YQ2s2Y
	wBTNbbz7QkJOWMv5bJ1GDNlsnpTgksxFjhOuDw/NbdK3SdYSVG1yj3jm/n/mL1eGOa3q6E6RSl3
	01F5qED8ELWMPoJbToyvKaOM3L7LhAeuOZlYEO27WIk9NqxqZBuDcx1+gciybp3PRh+NjOAnuH3
	w3YSqkGmmRcpW/6ah5K3k6ZrELvz2nmHGjQ8aEIy7mSI/gd0H+WaWe0JW0i2xwaw9Fg3hDhlfo/
	TOryfIgFf/vBetQQfl9G30HufO7IpCl9iq7QDZoPIyCiZOz7krVK0n1wA/tAe33rv8WkgwVOKfC
	ZA9OR5koXabm0zLclfcWvascrej9qFOu7d3eLZDnxC9IzTB+03C/qRd5Xh3BTyYg1yPIb7BiX3p
	AsO45annL7q7L53Ragov33Vn8KT6Jb2Ei8sBFwtOETxTzcPBWylrwVkxOg4cxg/KQS6bxL4ewRd
	bOjirLIath9YbP36JafraAratFCFWvRjQ6hqqJyU2tGos6o=
X-Received: by 2002:a05:6214:dcf:b0:91c:6027:5542 with SMTP id 6a1803df08f44-91ca4b90bfemr314210956d6.57.1793891784906;
        Thu, 05 Nov 2026 07:16:24 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.255])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e9a5d0656sm16256346d6.16.2026.11.05.07.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:16:23 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:36 +0000
Subject: [PATCH RFC v3 44/90] pidfd: let pidfd_configure() name a cgroup to
 start in
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
Message-Id: <20261105-b4-cells-v3-44-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890934; l=5440;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=Q7qmfYiZWh2k967NZLGElGMNdLq2eA92Jmb5C4uWviE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QB9Ri4RbbwO6mSV3bifvChAs1PoT0JyD/+e2dfYBYzKqbLIKY8+DRMUCX2txSXakT9/QyB6tgrB
 LonYgPXAx5wc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A new task of a cell starts in the budget of the cell. That stops working
once the init of the cell manages cgroups. It moves itself out of the
budget and enables controllers there, which systemd does right at the
start. A cgroup that distributes a controller to its children cannot
contain tasks, so from then on every start fails with EBUSY. Spawning is
the replacement for entering a container, so this means that nothing can
be added to a running cell.

Container runtimes have the same problem today and solve it themselves.
runc exec accepts a cgroup for the new process. If it is given none and
gets EBUSY, it looks up the cgroup of the init of the container and uses
that.

So let the spawner choose. PIDFD_SET_FD with the key "cgroup" names the
cgroup that the task starts in. Which cgroup to use is a policy decision,
and it stays with the runtime. For containers that share a cell, like
those of a pod, this is also how each of them gets its own cgroup.

The cgroup must be the budget or lie below it, because a kill finds the
tasks of the cell through the budget. The fork checks this with
cgroup_mutex held, along with whether the cgroup still exists and can
contain tasks. It has to be checked that late because the cell can change
what is below its budget at any time. The task is created in the cgroup
rather than moved there, so it is never anywhere else.

No permission on the cgroup is required. Whoever holds the cellfd can
already do anything to the cell, including killing it, and the permission
to put tasks into the budget was checked when the slot was filled.
Requiring write access to cgroup.procs would not work in practice: the
cgroups that the init of a cell creates are owned by ids that nobody
outside of the cell has, so only a builder with CAP_DAC_OVERRIDE would
pass.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/sched/task.h |  1 +
 kernel/cgroup/cgroup.c     |  8 ++++++++
 kernel/embryo.c            | 31 +++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index 97e3675101bd..83bc58598ea0 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -50,6 +50,7 @@ struct kernel_clone_args {
 	unsigned int kill_seq;
 	struct pid *pid;
 	struct cell *cell;
+	struct cgroup *cell_cgrp;
 	struct embryo *embryo;
 };
 
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 3869cfa6af50..d3a36b586cd3 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -6917,6 +6917,14 @@ static int cgroup_css_set_fork_cell(struct kernel_clone_args *kargs,
 	struct cgroup *dst_cgrp = cell_budget(kargs->cell);
 	int ret;
 
+	/* Somewhere below, if whoever spawns says so. Nowhere else: a kill goes by the budget. */
+	if (kargs->cell_cgrp) {
+		ret = -EPERM;
+		if (!cgroup_is_descendant(kargs->cell_cgrp, dst_cgrp))
+			goto err;
+		dst_cgrp = kargs->cell_cgrp;
+	}
+
 	ret = -ENODEV;
 	if (cgroup_is_dead(dst_cgrp))
 		goto err;
diff --git a/kernel/embryo.c b/kernel/embryo.c
index 0ad85cd2b865..0a04f39fa37a 100644
--- a/kernel/embryo.c
+++ b/kernel/embryo.c
@@ -19,6 +19,7 @@
  */
 #include <linux/binfmts.h>
 #include <linux/cell.h>
+#include <linux/cgroup.h>
 #include <linux/completion.h>
 #include <linux/cred.h>
 #include <linux/fdtable.h>
@@ -73,6 +74,7 @@ struct embryo {
 	kuid_t			uid;
 	kgid_t			gid;
 	struct group_info	*groups;
+	struct cgroup		*cgrp;		/* where in the budget, or NULL for the budget */
 
 	struct pid		*pid;		/* the reference alloc_pid_struct() returned */
 	struct cell		*cell;		/* where the task is going to be */
@@ -133,6 +135,9 @@ static void embryo_drop_config(struct embryo *e)
 	if (e->groups)
 		put_group_info(e->groups);
 	e->groups = NULL;
+	if (e->cgrp)
+		cgroup_put(e->cgrp);
+	e->cgrp = NULL;
 }
 
 static void embryo_put(struct embryo *e)
@@ -540,6 +545,26 @@ static int embryo_set_fd(struct embryo *e, const char *key, struct file *file)
 	return 0;
 }
 
+/*
+ * Where in the budget of the cell the task starts. Whether it is in there, still
+ * there and able to hold a task is for the fork to say, with cgroup_mutex held:
+ * what is below the budget is the cell's to change at any time.
+ *
+ * It takes no permission. Whoever holds the cellfd can do anything to the cell, and
+ * what the cell made in there belongs to ids that nobody outside of it has.
+ */
+static int embryo_set_cgroup(struct embryo *e, int fd)
+{
+	struct cgroup *cgrp = cgroup_get_from_fd(fd);
+
+	if (IS_ERR(cgrp))
+		return PTR_ERR(cgrp);
+	if (e->cgrp)
+		cgroup_put(e->cgrp);
+	e->cgrp = cgrp;
+	return 0;
+}
+
 static int embryo_start(struct embryo *e)
 {
 	struct kernel_clone_args args = {
@@ -569,6 +594,8 @@ static int embryo_start(struct embryo *e)
 		ret = e->started ? -EBUSY : e->exec ? 0 : -EINVAL;
 		if (!ret)
 			e->started = true;
+		/* Nobody changes it from here on. */
+		args.cell_cgrp = e->cgrp;
 	}
 	if (ret) {
 		cell_fork_finish(e->cell);
@@ -698,6 +725,10 @@ SYSCALL_DEFINE5(pidfd_configure, int, pidfd, unsigned int, cmd,
 	case PIDFD_SET_FD: {
 		CLASS(fd, slot)(aux);
 
+		if (!strcmp(key, "cgroup")) {
+			ret = embryo_set_cgroup(e, aux);
+			break;
+		}
 		ret = -EBADF;
 		if (!fd_empty(slot))
 			ret = embryo_set_fd(e, key, fd_file(slot));

-- 
2.55.0

