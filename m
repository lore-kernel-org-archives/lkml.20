Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455090;
	b=Y7aHaW2UOJUVSoHro8VKWXWkmgZ5VSBRQHWbyUXS2N0tG/F+Q0CQ5SQMNX+KVOrasx5O
	 7oSFqx/5e+FJ5iZC68gQl4GcsyQUGwlodtMEZGqn5RcojQgyFgjtmYCugI0aDe4e5CuKd
	 D+PfutRLGrm1e3wggdnBjVneKZF+HInTTm2sHWQc7zaJF6WD/cGeWdpBpLLzQSbi94K98
	 TttEHrcGgMEwp8JL26emzBJ5JxJWHho2LsXhV6r0wrJctsyAlfcOaaIbQXnk9USm5oWj0
	 +7lmVjnpROt5/AS+pj5dH/uG79GdPrHsSRNOt9QcCVQMGqbsYhY1XkmW70oMLypFNlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6hhh/r14Nj+z2Y1/ARUdnl6526fVUKOS25KijwzWhHw=;
	b=IgnmHdfP35ZP8CXX1XIM5GXCWmt86F7Pzrn+Yz7qhenLg8CTIj6T4gNJjkZKYhvuDHNO
	 WHM0io04NAVQ7bCnIr82AWVM7M8GBgnJ9xDKvnPF/O0adF3vFYH1k6HZ+8R9U/9Zqpyf6
	 yUcFWxhJMeOa3LPhFWiTIZb2+kRRxiOS+DcaLWcGBeh2nPjQPX6//fg0OGwEhwszTrsBN
	 DVNu67SeeUZ8ZJx8ZaBUjO8lqDO4ZFrzQ8+gqnkPw7n3Ph48h4ZKTyqcCCLgKi9q2xHKJ
	 ifO3ZHy6O7y8J22lCurvK0lSjnaH12sAArLt2snkkd18UKxygYKyuvWf3GOn5v5tkEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fwTRvODP;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD2F606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FD2F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fwTRvODP
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so3273998c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792455089; x=1793059889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hhh/r14Nj+z2Y1/ARUdnl6526fVUKOS25KijwzWhHw=;
        b=fwTRvODPcwhGi5EQydkHrb0GOyYvMF2qxDhscRTfgCx5TdNVjYHHWz7i/9UDVeTFFs
         +J6t7bvPO9HqB8oNnlaXI1P/OW59rqrpC4rJQJtSnuYW2uEzOuFQYdkRoxvkJ2jJtgwZ
         ReHDK/5rFkgBO2GC7U/K4f9GCkmYuvHk5IfnKnOUzWyjw/GwkjBEwiW4AZQFOzGxXPcb
         LR/spkJ3OD1IlGaFYr4m6HG6OMGAgWr34+sMl2ov8CS+Qwlie83ArwsRGwVi513K87Ko
         iaagZeIB4fP5wjSjgYwynxO1Yd+Brf2Skiv40T34Pzly4NeT5tNa00mmD6+u5Z+ncftF
         r0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455089; x=1793059889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hhh/r14Nj+z2Y1/ARUdnl6526fVUKOS25KijwzWhHw=;
        b=LG1+Xlljr56hHaO50LusFBz8c0l8ViRbjBGIi+pzwFnuTOrLHy/D7+rpojfIWj8Swb
         4rQprqG1MEACmRo/x7mHbxuLq8Pn69fwneGF6LO/yhamW4P6OXbgRjzr5lNi4xNAMdDH
         9wYP74wWm60yUuyreMEp+vLcw5/3Ij3xxWtGSKJSIX1jlnkxI8Yjv8bN8UoZ6wvbt0tA
         J8jGEFtAU+ICoyJkAChE41vLpgxw4Ije3V2Z/LyrEgVOJdwfXYn5p6O08S9gCzgYp0X0
         ZDKBgmJmgkkq0NnPadMoSRtzPUGfAyoKlnavqs4nuY1pqammcEZdTTk06N1xxiE5K9si
         t9pQ==
X-Gm-Message-State: AFq9FYLX9SpTdYlgdGTK+69kdBK+VVVpRkedCpb5KeOUYOkyrZsPNoxF
	a9yxmem6l6agWJLRGtaaPFfI44f1LnoZzcFW0o3LLzKeAVGm63k0/OBphJdWXg==
X-Gm-Gg: AYBFou1O4c+vgwsdB80SPdB2kagUkFiVwJSZ5pupkDdhORh8Cx6zKCDMwGLYxJ8mnbd
	Cnk4u2ErrzQ1OzrkQj8+kvJQyQLlhhtf4nDFzV2izKkojDjhhCNGIlrAlIbEZZROMU+8KqcWJrO
	vZ5ohemV7G3Dwz+Y4hHtEYDHRQ0J8JXwfv4ssQZMnb2xZCg/0dpd56kIV8sanmgsvw8nSAYfbJ0
	5WO/Q5x+ypigBnfDbZv+/xxSDQ/hu6nIAU0ky5caQ8ggesGHSAKjfXt1COH51xIUNbttsm+ksmM
	lW5suXPzUZETXGgIjK4iyv+RWt67ZkNa7exRdJE32frLoZfXMEx6y3JzRB1Zutl13mRrm8t1VyN
	g2FqFioroVCdf6welxAvQIP2rwzj3y99oSyjQ1HXAfsAhITUJJzJaO4LVJVTs604efY+XFO7xZR
	WfzKIqUwTM0MQFAlmaedSaF3b4ls3dOa9jfNMPn/XVzd3kuGJDhr8zsmrGyerg3XcD4s0pbrEaa
	rPLRxuGRdPgDSpNm3CsOi5ncKnRi29vH2h1RbgmoXEVfDIqE+ATs/g=
X-Received: by 2002:a05:701b:4346:b0:16b:1a1f:ed8a with SMTP id a92af1059eb24-1851453f912mr12366198c88.39.1792455088587;
        Mon, 19 Oct 2026 17:11:28 -0700 (PDT)
Received: from pop-os.tail4adac7.ts.net ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37258981c88.0.2026.10.19.17.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:11:27 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@amacapital.net>,
	Kees Cook <kees@kernel.org>,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>
Subject: [RFC PATCH 1/9] seccomp: add result records to the notification listener
Date: Mon, 19 Oct 2026 17:11:16 -0700
Message-ID: <20261020001124.974063-2-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020001124.974063-1-xiyou.wangcong@gmail.com>
References: <20261020001124.974063-1-xiyou.wangcong@gmail.com>
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

From: Cong Wang <cwang@multikernel.io>

A supervisor that continues a system call with
SECCOMP_USER_NOTIF_FLAG_CONTINUE never learns how the call turned out.
For the fork family that means it cannot learn about the new task at
all: a child that is killed before its first notified system call is
never seen, and a fork the kernel rejected after CONTINUE looks the same
as one that succeeded.

Prepare a second kind of entry on the listener: a one-way record of a
continued call's outcome. It is received with the existing
SECCOMP_IOCTL_NOTIF_RECV, carries SECCOMP_NOTIF_FLAG_RESULT in flags
(the field was never set before) and is never answered.

struct seccomp_notif cannot grow, because its size is encoded in the
RECV ioctl number and a program rebuilt against new headers would get
EINVAL from every old kernel. The payload therefore shares storage with
the seccomp_data in an anonymous union. struct seccomp_notif_result is
32 bytes, the seccomp_data 64, so the layout, the ioctl numbers and
SECCOMP_GET_NOTIF_SIZES stay the same and existing source keeps
compiling.

Records sit on their own list and RECV hands them out before any
pending notification. A record is meant to be queued before the task it
describes can run, so delivering records first guarantees that the
supervisor hears about a task before it hears from it. The notification
state machine is left alone.

A record names a new task by its pidfs inode number as well as by pid,
because the pid may be reused before the supervisor reads the record.
Opening a pidfd by inode number only works for a struct pid that is
registered with pidfs, so RECV registers the child. Registration may
fail with ENOMEM, in which case the record stays queued and RECV can be
retried.

Nothing queues records yet.

Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 include/uapi/linux/seccomp.h |  30 +++++++++-
 kernel/seccomp.c             | 111 +++++++++++++++++++++++++++++++++++
 2 files changed, 140 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/seccomp.h b/include/uapi/linux/seccomp.h
index dbfc9b37fcae..67f7b2f45ab6 100644
--- a/include/uapi/linux/seccomp.h
+++ b/include/uapi/linux/seccomp.h
@@ -72,11 +72,39 @@ struct seccomp_notif_sizes {
 	__u16 seccomp_data;
 };
 
+/**
+ * struct seccomp_notif_result - the outcome of a continued system call
+ * @nr: the system call number, as in struct seccomp_data
+ * @arch: the system call convention, as in struct seccomp_data
+ * @val: the return value the task saw
+ * @child_pid: for the fork family, the new task in the listener's pid
+ *             namespace, or 0 if the call failed
+ * @__reserved: always 0
+ * @child_ino: for the fork family, the pidfs inode number of the new task,
+ *             or 0 if the call failed. Unlike @child_pid it is never
+ *             reused, so it names the task race free.
+ */
+struct seccomp_notif_result {
+	__s32 nr;
+	__u32 arch;
+	__s64 val;
+	__u32 child_pid;
+	__u32 __reserved;
+	__u64 child_ino;
+};
+
+/* Valid flags for struct seccomp_notif */
+#define SECCOMP_NOTIF_FLAG_RESULT	(1UL << 0) /* @result is valid, not @data */
+#define SECCOMP_NOTIF_FLAG_THREAD	(1UL << 1) /* the new task is a thread */
+
 struct seccomp_notif {
 	__u64 id;
 	__u32 pid;
 	__u32 flags;
-	struct seccomp_data data;
+	union {
+		struct seccomp_data data;
+		struct seccomp_notif_result result;
+	};
 };
 
 /*
diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 86cf4460d69e..5641ac8b2f2e 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -38,6 +38,7 @@
 #include <linux/file.h>
 #include <linux/filter.h>
 #include <linux/pid.h>
+#include <linux/pidfs.h>
 #include <linux/ptrace.h>
 #include <linux/capability.h>
 #include <linux/uaccess.h>
@@ -132,6 +133,30 @@ struct seccomp_kaddfd {
 	struct list_head list;
 };
 
+/**
+ * struct seccomp_kresult - a one-way record of a continued system call's
+ *			    outcome
+ *
+ * @id: The id of the notification whose reply asked for this record.
+ * @task: The task that made the system call.
+ * @child: The new task, for a successful call in the fork family.
+ * @nr: The system call number.
+ * @arch: The system call convention.
+ * @val: The system call's return value.
+ * @flags: SECCOMP_NOTIF_FLAG_* flags to report.
+ * @list: list_head for chaining onto notification->results.
+ */
+struct seccomp_kresult {
+	u64 id;
+	struct pid *task;
+	struct pid *child;
+	int nr;
+	u32 arch;
+	long val;
+	u32 flags;
+	struct list_head list;
+};
+
 /**
  * struct notification - container for seccomp userspace notifications. Since
  * most seccomp filters will not have notification listeners attached and this
@@ -144,6 +169,8 @@ struct seccomp_kaddfd {
  * @flags: A set of SECCOMP_USER_NOTIF_FD_* flags.
  * @next_id: The id of the next request.
  * @notifications: A list of struct seccomp_knotif elements.
+ * @results: A list of struct seccomp_kresult elements, delivered before any
+ *	     notification.
  */
 
 struct notification {
@@ -151,6 +178,7 @@ struct notification {
 	u32 flags;
 	u64 next_id;
 	struct list_head notifications;
+	struct list_head results;
 };
 
 #ifdef SECCOMP_ARCH_NATIVE
@@ -1446,8 +1474,19 @@ static long seccomp_set_mode_strict(void)
 }
 
 #ifdef CONFIG_SECCOMP_FILTER
+static void seccomp_kresult_free(struct seccomp_kresult *kres)
+{
+	put_pid(kres->task);
+	put_pid(kres->child);
+	kfree(kres);
+}
+
 static void seccomp_notify_free(struct seccomp_filter *filter)
 {
+	struct seccomp_kresult *kres, *tmp;
+
+	list_for_each_entry_safe(kres, tmp, &filter->notif->results, list)
+		seccomp_kresult_free(kres);
 	kfree(filter->notif);
 	filter->notif = NULL;
 }
@@ -1547,10 +1586,62 @@ static int recv_wait_event(struct seccomp_filter *filter)
 	return 0;
 }
 
+static int seccomp_fill_result(struct seccomp_notif *unotif,
+			       struct seccomp_kresult *kres)
+{
+	int ret;
+
+	/*
+	 * A pidfd can only be opened by inode number once the struct pid is
+	 * registered with pidfs. A child that is already reaped cannot be
+	 * registered anymore; the supervisor finds out when opening fails.
+	 */
+	ret = pidfs_register_pid(kres->child);
+	if (ret && ret != -ESRCH)
+		return ret;
+
+	unotif->id = kres->id;
+	unotif->pid = pid_vnr(kres->task);
+	unotif->flags = SECCOMP_NOTIF_FLAG_RESULT | kres->flags;
+	unotif->result.nr = kres->nr;
+	unotif->result.arch = kres->arch;
+	unotif->result.val = kres->val;
+	if (kres->child) {
+		unotif->result.child_pid = pid_vnr(kres->child);
+		unotif->result.child_ino = kres->child->ino;
+	}
+	return 0;
+}
+
+static long seccomp_copy_result(struct seccomp_filter *filter,
+				struct seccomp_kresult *kres,
+				const struct seccomp_notif *unotif,
+				void __user *buf)
+{
+	if (!copy_to_user(buf, unotif, sizeof(*unotif))) {
+		seccomp_kresult_free(kres);
+		return 0;
+	}
+
+	/* Put the record back at the head so that no record is lost. */
+	mutex_lock(&filter->notify_lock);
+	if (filter->notif) {
+		list_add(&kres->list, &filter->notif->results);
+		atomic_inc(&filter->notif->requests);
+		wake_up_poll(&filter->wqh, EPOLLIN | EPOLLRDNORM);
+		kres = NULL;
+	}
+	mutex_unlock(&filter->notify_lock);
+	if (kres)
+		seccomp_kresult_free(kres);
+	return -EFAULT;
+}
+
 static long seccomp_notify_recv(struct seccomp_filter *filter,
 				void __user *buf)
 {
 	struct seccomp_knotif *knotif = NULL, *cur;
+	struct seccomp_kresult *kres;
 	struct seccomp_notif unotif;
 	ssize_t ret;
 
@@ -1568,6 +1659,19 @@ static long seccomp_notify_recv(struct seccomp_filter *filter,
 		return ret;
 
 	mutex_lock(&filter->notify_lock);
+	kres = list_first_entry_or_null(&filter->notif->results,
+					struct seccomp_kresult, list);
+	if (kres) {
+		ret = seccomp_fill_result(&unotif, kres);
+		if (ret < 0) {
+			atomic_inc(&filter->notif->requests);
+			kres = NULL;
+		} else {
+			list_del(&kres->list);
+		}
+		goto out;
+	}
+
 	list_for_each_entry(cur, &filter->notif->notifications, list) {
 		if (cur->state == SECCOMP_NOTIFY_INIT) {
 			knotif = cur;
@@ -1595,6 +1699,9 @@ static long seccomp_notify_recv(struct seccomp_filter *filter,
 out:
 	mutex_unlock(&filter->notify_lock);
 
+	if (kres)
+		return seccomp_copy_result(filter, kres, &unotif, buf);
+
 	if (ret == 0 && copy_to_user(buf, &unotif, sizeof(unotif))) {
 		ret = -EFAULT;
 
@@ -1862,6 +1969,9 @@ static __poll_t seccomp_notify_poll(struct file *file,
 	if (mutex_lock_interruptible(&filter->notify_lock) < 0)
 		return EPOLLERR;
 
+	if (!list_empty(&filter->notif->results))
+		ret |= EPOLLIN | EPOLLRDNORM;
+
 	list_for_each_entry(cur, &filter->notif->notifications, list) {
 		if (cur->state == SECCOMP_NOTIFY_INIT)
 			ret |= EPOLLIN | EPOLLRDNORM;
@@ -1897,6 +2007,7 @@ static struct file *init_listener(struct seccomp_filter *filter)
 
 	filter->notif->next_id = get_random_u64();
 	INIT_LIST_HEAD(&filter->notif->notifications);
+	INIT_LIST_HEAD(&filter->notif->results);
 
 	ret = anon_inode_getfile("seccomp notify", &seccomp_notify_ops,
 				 filter, O_RDWR);
-- 
2.43.0

