Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891676;
	b=2bSYfXzcMaYiEkMIQ/ZFHPv5BXpxCP0BlRq8HlNsiP4gKcqFPLcafOyOQcLGErqfUrmR
	 G6ttbxV0faKakpSbcJjPBhKxvIx1L1C2rEsruYKOOIV9q/VX+yP++GkNHwlj3AjqFO8vQ
	 /9yY67pNOYQ8dOR8LJnGmx7fAeG2heuPl/IgznCoVUS6lDyYx5Plr3cGV95DsEpYNfTke
	 4RSTLHP9j/tmfjbh47yTw2bmzshsgja1CfQLg1s9AYX/eiJYrx1BgDcQsAznvrbNqrPcI
	 G54UDaiGdBVzn7Cyh5jE0G2XUD51kZdCam8ZnSWcH6zcBaO2fWHjNyn8O0T5x37PVRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZpQLaT6f6yVDrFv6ga6R249hOvp8BlyRYGeJwo7PKlA=;
	b=acruzV7vBkAPDXuJwHyCFEEWTH+sC0XW0rp76p2dm1/FyQMCji9F6rxziwG6AEV0YXiS
	 dRyJIpxxlrwwoFDtmL/016FJi0tyFcx6nnnd212IGNzv6WyI5UfLDLBCz/iNkvAgmNja7
	 zV+Vd9NGCo9Jq+6as/tFLGg2P/mLvAxMxQ4fuFXfC6OsQGyHX++7IiF/S147rc8E9z/ge
	 22jf3I9J6cAM80A+07gSI9ZPnNEgm6CN6w4GSEsT4EiXOrrp7bqFjqZYpT25VfZoahrUT
	 SKMrDHxC4obxbrN9szHmopB9RKhPwBCUAfMzZV9P0f8xebGPDIJ5nl6gUf/6TapccKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=FLALI4kH;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA74B606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA74B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=FLALI4kH
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f269e335eso228969685a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793891675; x=1794496475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZpQLaT6f6yVDrFv6ga6R249hOvp8BlyRYGeJwo7PKlA=;
        b=FLALI4kH6zQVj5a2W5vMD1EKLjZ+UalZMytRlWauJdddMGJznxu30PA2eSV7g4OT7L
         NVdu+8VCHxsQBy2hLYsXnJfI/t77zHzBi/qxlzKTaaUiqrMHCux/+m+XTYTroPlciwxt
         krRG0fb694BSib3vQpIoW0HT4mpw/Xo6tuR4lpImshFnWenG5I5PS6wrLdkeWGPkDT+E
         0NFbZaSxWR+n4WFVP9f4LdPOAdo0KkIDWWnqa0elRLVlfJcU2yUl+krCKtNXFlWU9d+Y
         HCKfQDK9LlSQVZVfUIfnAx670MD+WYTDiguJ+OiU+O7saF1uH2yJmVYHTKpQiWNXuICC
         QrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891675; x=1794496475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpQLaT6f6yVDrFv6ga6R249hOvp8BlyRYGeJwo7PKlA=;
        b=GxRvoYuYXuNihcpnBuFzeHw4MRzRX+QgBcn8fkIbePGzaW9yw/elkzfF3OBTt17nIA
         0YvULgpdCWpXcY0nZSLABBbJSLNCCf8zYzPPXvkk0MIzChQvJqRSU/CNXoV0ySMa7O9h
         6MsHMGMe/hX9pRkc14ndC2BSFfBaljwscY8INs6tSeazSzR9QjQGydvMeXKsomLon5pQ
         c7A81kXkTLWawVPF3Hfyvc2KnB9Tkg7yuVzTbeT/Uda3xcQJxMVUweWKXP48jL5ibnXK
         O+x0YHi4+PgzOs1igleTFwCwDTpeScBmCKbmn7hJ3EQphZIwQvr4bGbdZPq+wKkNd6MD
         ChNA==
X-Forwarded-Encrypted: i=1; AKwUvBya2nDFovuhwkL39svXCKTIWB4dGiaH+9WHmXEYxwmzccwDA2wgViZoe9LrXXB3sLAc9rwDvyjNMLsQkUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oT8OfXDB24OsAtJyoVasCCcvcWyjrMnCHMTJSbdlpYpyT9ix3
	LPx2GpBkbiIMG4m+Uzj6GmouDBUIVr6Z7nkYWfHXzykTrCw0ibYLo+WcBA0ykHQZM32LsWDS9/s
	AxCoQFyc=
X-Gm-Gg: AYBFou3BRTQRsi6/V4MvMu2+77j2/z2TtE/5bzWBfdGS54/0dG1tz8PPb6UiNvcxVB1
	64yp8trcLPSd+hwvQf2AAgHsTz38LSAYkaFzn0tbqG0AD4BZzHhljxgR21Q9GmdvMCXKxjePFfb
	3xL3ZnXP50y2jd2bMU4XDwwBjSnbjEeEPJiWX+LWAb+8DsvHxxfrZAC1oOy+47flMkJlrKlsxVd
	x8gAGmOPf4ofeJPcwMOteOfkMamThzQ/3dqvpCZKCd72dzh7l/P/flHZyBdDL1sqEF9OUFSxc6B
	d2QSILSs7xf888zKWpnlr57HdHs4fS6h9BYwQYpq9XyoAK8EkCER9uoBY9Yb0/M8XKd960yoqez
	7hIQA/VL+dpMyUlcvCeaBtrPbbWQyi91AId1vRb7CzRQVp8z5lmhmRlhZAMrgnOCmXhb9uF1UFC
	KhizO6zvhqyU8vGrC+PuiYamj3JaIsGtDGInqpXPBFL3kKlkI5IrTgM1ReCziZIrNONT0b5ggFF
	3hfKaMrNX2Nw16jF7QG5k1jKMuymtrQALOsP+xqpQPwTcTyFt7KGVusa0A2CNAdK8xcvE6XgUNk
	OqI3GG6sxwUOXGBXsZF0Crq7Mii1hpkAwxh5SmaH8kyPoyWwAN1YqZEoh38T01NPWmE=
X-Received: by 2002:a05:620a:2805:b0:93e:767f:345c with SMTP id af79cd13be357-94421696a14mr3165332285a.39.1793891674856;
        Thu, 05 Nov 2026 07:14:34 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4854ea2sm481570885a.32.2026.11.05.07.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:14:33 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:31 +0000
Subject: [PATCH RFC v3 39/90] fork: add tasks that start out with nothing
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
Message-Id: <20261105-b4-cells-v3-39-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890933; l=11177;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=B6qtKXYsjLkf/4WERNO+sX9McnZYMfbfYRZSzsHo2ek=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNvchHTNyNjiFcq4thpGzEzUZsAGHl9JQOcKkCjpIfZDHt4XwG0BiSa/aCdfDj3J8SDWEFXdYiO
 Y62GJQimaDQ0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

To start a program in a container today, a process forks. The child then
gets rid of everything it inherited and should not keep, one call at a
time: file descriptors, the working directory, the controlling terminal,
credentials. Whatever it forgets leaks into the container. Until it is
done, it runs code of the parent while it is partly inside of the
container and partly outside.

Add kernel_clone_args.embryo, which makes copy_process() create a task
that has nothing to get rid of. The task works like a usermode helper: it
runs a kernel function and returns to user mode once kernel_execve() has
succeeded. From the start it has no mm, an empty file table, no blocked or
pending signals, and no controlling terminal. It never executes an
instruction of its creator.

The task is called an embryo until its exec has succeeded. struct embryo
describes what it will become, and task_struct.embryo is set for as long
as it is an embryo.

An embryo still inherits resource limits, scheduling attributes, seccomp
filters and LSM state. For the last two this is deliberate: what a
confined task spawns is confined in the same way.

Nothing sets kernel_clone_args.embryo yet. The following patches add the
interface.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/cell.h       |  24 +++++++++
 include/linux/sched.h      |   6 +++
 include/linux/sched/task.h |   3 ++
 kernel/embryo.c            | 127 +++++++++++++++++++++++++++++++++++++++++++++
 kernel/fork.c              |  39 +++++++++++---
 5 files changed, 192 insertions(+), 7 deletions(-)

diff --git a/include/linux/cell.h b/include/linux/cell.h
index 564c3e86f3bd..f9975b0fb65c 100644
--- a/include/linux/cell.h
+++ b/include/linux/cell.h
@@ -193,4 +193,28 @@ static inline void cell_root(struct cell *cell, struct path *root) { }
 static inline struct cgroup *cell_budget(struct cell *cell) { return NULL; }
 #endif
 
+/* Embryo tasks. */
+#ifdef CONFIG_CELLS
+
+/**
+ * task_is_embryo - is a task still on its way to its first exec?
+ * @task: a task
+ *
+ * Return: true from the time PIDFD_CMD_START made @task until its exec has
+ * succeeded or it is on its way out.
+ */
+static inline bool task_is_embryo(const struct task_struct *task)
+{
+	return READ_ONCE(task->embryo);
+}
+
+void embryo_fork_finish(struct kernel_clone_args *args, struct task_struct *p);
+
+#else
+
+static inline bool task_is_embryo(const struct task_struct *task) { return false; }
+static inline void embryo_fork_finish(struct kernel_clone_args *a, struct task_struct *p) { }
+
+#endif
+
 #endif /* _LINUX_CELL_H */
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 1c93da75226e..3dbe7c13da3b 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -85,6 +85,7 @@ struct sighand_struct;
 struct signal_struct;
 struct task_delay_info;
 struct task_exec_state;
+struct embryo;
 struct task_group;
 struct task_struct;
 struct timespec64;
@@ -983,6 +984,11 @@ struct task_struct {
 
 	struct task_exec_state __rcu	*exec_state;
 
+#ifdef CONFIG_CELLS
+	/* Set from PIDFD_CMD_START until the first exec has succeeded. */
+	struct embryo			*embryo;
+#endif
+
 	int				exit_state;
 	int				exit_code;
 	int				exit_signal;
diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index eaf939ac4bef..97e3675101bd 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -21,6 +21,8 @@ struct css_set;
 #define CLONE_LEGACY_FLAGS 0xffffffffULL
 
 struct cell;
+struct embryo;
+
 struct kernel_clone_args {
 	u64 flags;
 	int __user *pidfd;
@@ -48,6 +50,7 @@ struct kernel_clone_args {
 	unsigned int kill_seq;
 	struct pid *pid;
 	struct cell *cell;
+	struct embryo *embryo;
 };
 
 /*
diff --git a/kernel/embryo.c b/kernel/embryo.c
new file mode 100644
index 000000000000..163115c56ab4
--- /dev/null
+++ b/kernel/embryo.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Empty pidfds: fsopen() for processes.
+ *
+ * pidfd_open() with PIDFD_EMPTY returns a pidfd that no task is attached to yet.
+ * It is a pidfd like any other, on a struct pid that has no numbers, so whatever
+ * it is passed to finds no task. Whoever has it says with pidfd_configure() what
+ * the task is to be like and starts it. Only then is there a task, which never
+ * runs a single instruction of its creator's and execs. The creator does not
+ * fork.
+ *
+ * The task is an embryo until its exec has succeeded. It has no mm and an empty
+ * file table. What it is to reach, it is given. It does inherit attributes of
+ * whoever started it, as any new task does, see
+ * Documentation/userspace-api/cells.rst.
+ *
+ * It takes the shape of a usermode helper: a task with a kernel function to
+ * run, that returns to user mode once kernel_execve() has succeeded.
+ */
+#include <linux/binfmts.h>
+#include <linux/cell.h>
+#include <linux/completion.h>
+#include <linux/cred.h>
+#include <linux/fdtable.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/io_uring.h>
+#include <linux/personality.h>
+#include <linux/nsproxy.h>
+#include <linux/pid.h>
+#include <linux/pidfs.h>
+#include <linux/proc_fs.h>
+#include <linux/sched/signal.h>
+#include <linux/sched/task.h>
+#include <linux/sched/user.h>
+#include <linux/security.h>
+#include <linux/slab.h>
+#include <linux/syscalls.h>
+#include <linux/user_namespace.h>
+#include <net/af_unix.h>
+#include <uapi/linux/pidfd.h>
+
+struct embryo_strings {
+	char		*block;		/* NUL terminated strings, back to back */
+	const char	**vec;		/* NULL terminated, points into @block */
+};
+
+struct embryo {
+	struct rcu_head		rcu;
+	refcount_t		ref;
+	struct mutex		lock;		/* everything down to @result */
+	bool			started;
+	bool			settled;	/* there is a task, or never will be */
+
+	char			*exec;
+	struct embryo_strings	argv;
+	struct embryo_strings	envp;
+
+	struct pid		*pid;		/* the reference alloc_pid_struct() returned */
+	struct cell		*cell;		/* where the task is going to be */
+
+	int			result;
+	struct completion	done;		/* embryo -> starter */
+};
+
+static void embryo_strings_free(struct embryo_strings *s)
+{
+	kvfree(s->block);
+	kvfree(s->vec);
+	s->block = NULL;
+	s->vec = NULL;
+}
+
+/*
+ * What was configured has been used, or never will be. The pidfd may be around
+ * for long, and must not keep the other end of a pipe from seeing the last
+ * writer go.
+ */
+static void embryo_drop_config(struct embryo *e)
+{
+	kfree(e->exec);
+	e->exec = NULL;
+	embryo_strings_free(&e->argv);
+	embryo_strings_free(&e->envp);
+}
+
+static void embryo_put(struct embryo *e)
+{
+	if (!e || !refcount_dec_and_test(&e->ref))
+		return;
+
+	embryo_drop_config(e);
+	cell_put(e->cell);
+	kfree_rcu(e, rcu);
+}
+
+/**
+ * embryo_fork_finish - done creating an embryo, one way or the other
+ * @args: the arguments of the clone, with @args->embryo set
+ * @p:    what copy_process() returned, a task or an ERR_PTR()
+ *
+ * Unlocks the cell, which embryo_start() had locked.
+ *
+ * Context: kernel_clone(), before the new task is woken.
+ */
+void embryo_fork_finish(struct kernel_clone_args *args, struct task_struct *p)
+{
+	struct embryo *e = args->embryo;
+
+	if (!IS_ERR(p))
+		cell_task_spawned(args->cell);
+	cell_fork_finish(args->cell);
+
+	/* Nothing has happened yet, see embryo_start(). */
+	if (p == ERR_PTR(-ERESTARTNOINTR)) {
+		embryo_put(e);
+		return;
+	}
+
+	/* From here on the pidfd polls like any other. */
+	WRITE_ONCE(e->settled, true);
+	if (IS_ERR(p)) {
+		wake_up_all(&e->pid->wait_pidfd);
+		/* The reference that was to be the task's. */
+		embryo_put(e);
+	}
+}
diff --git a/kernel/fork.c b/kernel/fork.c
index 4db060281448..119b59f30f4d 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1565,7 +1565,7 @@ static struct mm_struct *dup_mm(struct task_struct *tsk,
 	return NULL;
 }
 
-static int copy_mm(u64 clone_flags, struct task_struct *tsk)
+static int copy_mm(u64 clone_flags, struct task_struct *tsk, bool embryo)
 {
 	struct mm_struct *mm, *oldmm;
 
@@ -1583,9 +1583,12 @@ static int copy_mm(u64 clone_flags, struct task_struct *tsk)
 	 * Are we cloning a kernel thread?
 	 *
 	 * We need to steal a active VM for that..
+	 *
+	 * An embryo is in the same position until it execs. It must never
+	 * get to see the mm of whoever created it.
 	 */
 	oldmm = current->mm;
-	if (!oldmm)
+	if (!oldmm || embryo)
 		return 0;
 
 	if (clone_flags & CLONE_VM) {
@@ -1693,10 +1696,19 @@ static int copy_fs(u64 clone_flags, struct task_struct *tsk,
 }
 
 static int copy_files(u64 clone_flags, struct task_struct *tsk,
-		      int no_files)
+		      int no_files, bool embryo)
 {
 	struct files_struct *oldf, *newf;
 
+	/* An empty table. What pidfd_configure() was given goes in there. */
+	if (embryo) {
+		newf = dup_fd(&init_files, NULL);
+		if (IS_ERR(newf))
+			return PTR_ERR(newf);
+		tsk->files = newf;
+		return 0;
+	}
+
 	/*
 	 * A background process may not have any files ...
 	 */
@@ -2187,6 +2199,14 @@ __latent_entropy struct task_struct *copy_process(
 	}
 	if (args->io_thread)
 		p->flags |= PF_IO_WORKER;
+#ifdef CONFIG_CELLS
+	p->embryo = args->embryo;
+	if (args->embryo) {
+		sigemptyset(&p->blocked);
+		sigemptyset(&p->saved_sigmask);
+		clear_tsk_restore_sigmask(p);
+	}
+#endif
 
 	if (args->name)
 		strscpy_pad(p->comm, args->name, sizeof(p->comm));
@@ -2330,7 +2350,7 @@ __latent_entropy struct task_struct *copy_process(
 	retval = copy_semundo(clone_flags, p);
 	if (retval)
 		goto bad_fork_cleanup_security;
-	retval = copy_files(clone_flags, p, args->no_files);
+	retval = copy_files(clone_flags, p, args->no_files, args->embryo);
 	if (retval)
 		goto bad_fork_cleanup_semundo;
 	retval = copy_fs(clone_flags, p,
@@ -2344,7 +2364,7 @@ __latent_entropy struct task_struct *copy_process(
 	retval = copy_signal(clone_flags, p);
 	if (retval)
 		goto bad_fork_cleanup_sighand;
-	retval = copy_mm(clone_flags, p);
+	retval = copy_mm(clone_flags, p, args->embryo);
 	if (retval)
 		goto bad_fork_cleanup_signal;
 	retval = copy_namespaces(clone_flags, p, args->cell);
@@ -2568,8 +2588,10 @@ __latent_entropy struct task_struct *copy_process(
 				WRITE_ONCE(ns->child_reaper, p);
 				p->signal->flags |= SIGNAL_UNKILLABLE;
 			}
-			p->signal->shared_pending.signal = delayed.signal;
-			p->signal->tty = tty_kref_get(current->signal->tty);
+			if (!args->embryo)
+				p->signal->shared_pending.signal = delayed.signal;
+			if (!args->embryo)
+				p->signal->tty = tty_kref_get(current->signal->tty);
 			/*
 			 * Inherit has_child_subreaper flag under the same
 			 * tasklist_lock with adding child to the process tree
@@ -2817,6 +2839,9 @@ pid_t kernel_clone(struct kernel_clone_args *args)
 	p = copy_process(NULL, trace, NUMA_NO_NODE, args);
 	add_latent_entropy();
 
+	if (args->embryo)
+		embryo_fork_finish(args, p);
+
 	if (IS_ERR(p))
 		return PTR_ERR(p);
 

-- 
2.55.0

