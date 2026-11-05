Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793848034;
	b=twqO8cC0GAfVmGMIu0MYYzl6ECwdRdtIfE3ClATKRwp13k9ir32WAKXPlcGz2ISiihhT
	 ch8vEMlq/W1mqgzHQ17A2Q9qSqK1WSFWbvACH7eqKGjj64wsezTBGWEog0NsclYqjyoaL
	 NYY+srKtkAlMXEpQXnj0slJVPlW6M1ykh74Ek0VmD7KCEoSIyCsQ9i8OQV0HBIBzjaEGn
	 Zjwbihl2ZocTKExRSpqSd+nZv1d2nPYprZUSqLlVDEFevbzF+oEjZg5x4sGmisssUtHC2
	 2QE8s9SRNmNwKgcLzHk13EC5l9Z9/3bAlDNLu0mJYKJw/qK/MDCnlUh8a1Bvg0GvaeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793848034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8Mu+ctl0F6aoJsinZtlfKG6JUy3jrYZ2HArMXjUBfyI=;
	b=CbuXaKQopDrABuO+Z35Xkd7pc47OMq2QNGqQ0TFjCV/2yCA68KuxwV7kUnJmZ2Pic7Vg
	 oau2bAnGQapWzRBrNqhQWG0xeJ3CiOEs0OYmrGigWzYqd7sgFSO5nSoUvE9WLTg0eYqzw
	 S/JU+gvoAn7azdSdcV+wvhQ88RFeU1m6gZQKdMcsoUXyG1+pz7oyu90vUmL3HKz9nGYX0
	 PeJlsTkWRLfhCszjN1YOq3hxEFTl2fM1jWEQ2AuYioN9Cw1fvsiNpfqw2/my4yrPRCF4t
	 iaouh+njyQW9CiGHBQKn7zKEWxz4GETqSUNWc4qi9igEBvNiSc8oglxNSBRUh9bncqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=everpuredata.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=EnPqUY30;
	arc=none smtp.remote-ip=209.85.128.98
Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com [209.85.128.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56136606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56136606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=EnPqUY30
Received: by mail-wm1-f98.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so12131015e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1793848032; x=1794452832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Mu+ctl0F6aoJsinZtlfKG6JUy3jrYZ2HArMXjUBfyI=;
        b=EnPqUY30yLpDdsF9qJe12aCwrUsrc3yTq9Q7JV5zh5N1NhDxctt6MfrZdqBlX/aSsP
         A5G/AgJ9V7dCE01dl2ql+Wy6++RyB9XknBntm4JlBrF9R+gUzpZK9IlEnx5GQMdq27R9
         vWr7qVLZSbxB24I5fzRSoYTiRU0HXdqNqRjRdWDKr4KobUHccfPDIO/3fRGNTrzAMR3X
         1aDlAB477tv+qAE0BxJX+sftiL18b3Rf9Askpt7e0nBamsr1cJ1Fov7i9768qRt0AzKY
         Wmj87ntwgAd8X16Ah5utrEATbHlxbENQlSD5T09RJCCQsYmxAdQrzM/eQO8ubdzGXaQO
         3xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793848032; x=1794452832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Mu+ctl0F6aoJsinZtlfKG6JUy3jrYZ2HArMXjUBfyI=;
        b=Bv1AVc2M3s1AmvBJ0DvZk/MInLaXMcUim1hfCXiq4y+eymKJiM1GVoIcqG9vkGE/PX
         9zf3Ou6Rr/r9rlzJ8fXsbwFb1AOldxcyH01WAgJ4p+vEWTJBSK+qnNbbNMcSw9CTt+2H
         kVjjKl30YvDlfaoMjcs/dkv+iZ/VvT8yKvEIni9zafC3eui6aVY941q35ZiP0HwZXpF8
         eiE2i+h/rAI29ccMeznlpu3APM8p0owkVtuW8ni6UexXXzSKwmI9E1rrDZiI+Lf3SLR5
         9uzP1edft0AaJMkEom+oFQJYUCpE6nhhTS28aZSoSZNgx5U71l2CfH+uwGhQ1kktqmTW
         3giw==
X-Forwarded-Encrypted: i=1; AKwUvBzrz9P5funkomXmrOzcYE6V/SXeLSeXdYetOwGkenBdeF7dxVZcf23B29OVRYyr1XxPbwgLOsjgLitwF94=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZH8AXmpYhWsS/sq8y5Xul1H87tEp0rYBWc2xNH937R5f69Mh1
	bRqyVv9Nr6izW5GE0oLHDwX+K/FH4RYxVR8sJsLpB7/6QLqxZlSO4lerjuwfAtKf1T/p6HrZDUQ
	w0Jm+jVTPoY4pvNifHsYcCyJQo9++5P12qVKD
X-Gm-Gg: AYBFou0jaKaDC3C/i80qvDMvgm1VjF3eqT5UDQgofJS6JnPwv6dkU9oZfUkEnqRH8xM
	Nc7nNrt4+Cvymg87Now8Y1PJTqunQACJ8Oyhg7ZYUcRtpuTmv1goSot4lY8a81uPyHfXHtvnyhJ
	ohFi0Uvr4prfIsEiYoYIAvTx/bk/HXN7e/SL6BT/k8+HZE2kETMqUj3t+m6KgMu53+0tTeu30Hx
	KzjdkHN/74IZmgzQ0EeQKcrfnYo9R1B7Vh8i9h2QNz2koJJrEivuKaGbTwUZ1a1/UItropqYPtP
	UNuI8lsYGWH7Jx0QYFwdFJXdc3hQJx7PxttECkmymIjZ8oVKqXoED3rChuk69qZ5ljhcjGnCUGx
	AXwnPrCRWq/aI3n2stPuEM9BffhsDunoP4bBVNMg=
X-Received: by 2002:a05:600c:6306:b0:4aa:15b1:d4fa with SMTP id 5b1f17b1804b1-4ac17b2ce91mr426370325e9.5.1793848031575;
        Wed, 04 Nov 2026 19:07:11 -0800 (PST)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.128])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-4b57317c6a9sm2336755e9.8.2026.11.04.19.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 19:07:11 -0800 (PST)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id 11FF634058C;
	Wed,  4 Nov 2026 19:07:10 -0800 (PST)
From: Tim Menninger <tmenninger@everpuredata.com>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Badger <ebadger@everpuredata.com>,
	Jon Curley <jcurley@everpuredata.com>
Subject: [PATCH 1/2] SUNRPC: maintain an rpc_task signalled flag
Date: Thu,  5 Nov 2026 03:07:08 +0000
Message-ID: <20261105030710.2652306-2-tmenninger@everpuredata.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105030710.2652306-1-tmenninger@everpuredata.com>
References: <20261105030710.2652306-1-tmenninger@everpuredata.com>
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

Commit 5bbd6e863b15a ("SUNRPC: Prevent looping due to rpc_signal_task()
races") removed the RPC_TASK_SIGNALLED runstate flag because maintaining
it independently from the errno in tk_rpc_status introduced races
between an errno being recorded and the task being in a SIGNALLED state.
A signalled task is inferred by tk_rpc_status containing -ERESTARTSYS.

This reintroduces the concept by coupling a "task signalled" bit with
the errno. The tk_rpc_status int becomes a tk_rpc_error_state atomic64_t
whose low 32 bits are a signed errno representing the first observed RPC
error, as tk_rpc_status previously held, and bit 32 is 1 if the task is
signalled and 0 otherwise.

With this change, we can record an RPC status and later escalate the
status to "signalled" without overwriting (and losing) the first
recorded error.

Signed-off-by: Tim Menninger <tmenninger@everpuredata.com>
---
 fs/nfs/nfs4proc.c            | 12 ++++++++----
 fs/nfs/pnfs.c                | 11 +++++++----
 include/linux/sunrpc/sched.h | 21 +++++++++++++++++++--
 net/sunrpc/clnt.c            |  2 +-
 net/sunrpc/sched.c           | 34 +++++++++++++++++++++++++++-------
 5 files changed, 62 insertions(+), 18 deletions(-)

diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index e1018b03c1cbd..1face07f409b4 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -688,9 +688,10 @@ nfs4_async_handle_exception(struct rpc_task *task, struct nfs_server *server,
 {
 	struct nfs_client *clp = server->nfs_client;
 	int ret;
+	int task_rpc_status = rpc_task_rpc_status(task);
 
-	if ((task->tk_rpc_status == -ENETDOWN ||
-	     task->tk_rpc_status == -ENETUNREACH) &&
+	if ((task_rpc_status == -ENETDOWN ||
+	     task_rpc_status == -ENETUNREACH) &&
 	    task->tk_flags & RPC_TASK_NETUNREACH_FATAL) {
 		exception->delay = 0;
 		exception->recovering = 0;
@@ -9845,12 +9846,15 @@ static void nfs4_layoutreturn_done(struct rpc_task *task, void *calldata)
 {
 	struct nfs4_layoutreturn *lrp = calldata;
 	struct nfs_server *server;
+	int task_rpc_status;
 
 	if (!nfs41_sequence_process(task, &lrp->res.seq_res))
 		return;
 
-	if (task->tk_rpc_status < 0) {
-		switch (task->tk_rpc_status) {
+	task_rpc_status = rpc_task_rpc_status(task);
+
+	if (task_rpc_status < 0) {
+		switch (task_rpc_status) {
 		case -EACCES:
 		case -EIO:
 		case -EKEYEXPIRED:
diff --git a/fs/nfs/pnfs.c b/fs/nfs/pnfs.c
index a057a06318c76..c51654e9d32eb 100644
--- a/fs/nfs/pnfs.c
+++ b/fs/nfs/pnfs.c
@@ -1687,6 +1687,7 @@ int pnfs_roc_done(struct rpc_task *task, struct nfs4_layoutreturn_args **argpp,
 {
 	struct nfs4_layoutreturn_args *arg = *argpp;
 	int retval = -EAGAIN;
+	int task_rpc_status;
 
 	if (!arg)
 		return 0;
@@ -1696,15 +1697,17 @@ int pnfs_roc_done(struct rpc_task *task, struct nfs4_layoutreturn_args **argpp,
 		retval = 0;
 		break;
 	case -NFS4ERR_NOMATCHING_LAYOUT:
+		task_rpc_status = rpc_task_rpc_status(task);
+
 		/* Was there an RPC level error? If not, retry */
-		if (task->tk_rpc_status == 0)
+		if (task_rpc_status == 0)
 			break;
 		/*
 		 * Is there a fatal network level error?
 		 * If so release the layout, but flag the error.
 		 */
-		if ((task->tk_rpc_status == -ENETDOWN ||
-		     task->tk_rpc_status == -ENETUNREACH) &&
+		if ((task_rpc_status == -ENETDOWN ||
+		     task_rpc_status == -ENETUNREACH) &&
 		    task->tk_flags & RPC_TASK_NETUNREACH_FATAL) {
 			*ret = 0;
 			(*respp)->lrs_present = 0;
@@ -1714,7 +1717,7 @@ int pnfs_roc_done(struct rpc_task *task, struct nfs4_layoutreturn_args **argpp,
 		/* If the call was not sent, let caller handle it */
 		if (!RPC_WAS_SENT(task))
 			return 0;
-		switch (task->tk_rpc_status) {
+		switch (task_rpc_status) {
 		default:
 			/*
 			 * Defer the layoutreturn if it was due
diff --git a/include/linux/sunrpc/sched.h b/include/linux/sunrpc/sched.h
index dbaad8b5f181c..db322e26703a4 100644
--- a/include/linux/sunrpc/sched.h
+++ b/include/linux/sunrpc/sched.h
@@ -10,6 +10,7 @@
 #ifndef _LINUX_SUNRPC_SCHED_H_
 #define _LINUX_SUNRPC_SCHED_H_
 
+#include <linux/atomic.h>
 #include <linux/timer.h>
 #include <linux/ktime.h>
 #include <linux/sunrpc/types.h>
@@ -92,7 +93,10 @@ struct rpc_task {
 
 	pid_t			tk_owner;	/* Process id for batching tasks */
 
-	int			tk_rpc_status;	/* Result of last RPC operation */
+	atomic64_t		tk_rpc_error_state;
+						/* Low 32 bits: first recorded RPC error.
+						 * Bit 32: signal requested.
+						 */
 	unsigned short		tk_flags;	/* misc flags */
 	unsigned short		tk_timeouts;	/* maj timeouts */
 	unsigned short		tk_pid;		/* debugging aid */
@@ -158,6 +162,18 @@ enum {
 	RPC_TASK_MSG_PIN_WAIT,
 };
 
+#define RPC_TASK_ERR_STATE_SIGNALLED	(1LL << 32)
+
+static inline s64 rpc_task_read_error_state(const struct rpc_task *task)
+{
+	return atomic64_read(&task->tk_rpc_error_state);
+}
+
+static inline int rpc_task_rpc_status(const struct rpc_task *task)
+{
+	return (int)(s32)rpc_task_read_error_state(task);
+}
+
 #define rpc_test_and_set_running(t) \
 				test_and_set_bit(RPC_TASK_RUNNING, &(t)->tk_runstate)
 #define rpc_clear_running(t)	clear_bit(RPC_TASK_RUNNING, &(t)->tk_runstate)
@@ -168,7 +184,8 @@ enum {
 
 #define RPC_IS_ACTIVATED(t)	test_bit(RPC_TASK_ACTIVE, &(t)->tk_runstate)
 
-#define RPC_SIGNALLED(t)	(READ_ONCE(task->tk_rpc_status) == -ERESTARTSYS)
+#define RPC_SIGNALLED(t)	(!!(atomic64_read(&(t)->tk_rpc_error_state) & \
+				    RPC_TASK_ERR_STATE_SIGNALLED))
 
 /*
  * Task priorities.
diff --git a/net/sunrpc/clnt.c b/net/sunrpc/clnt.c
index 5c33bf3fb4c34..cf17dfff57e90 100644
--- a/net/sunrpc/clnt.c
+++ b/net/sunrpc/clnt.c
@@ -1758,7 +1758,7 @@ static int
 __rpc_restart_call(struct rpc_task *task, void (*action)(struct rpc_task *))
 {
 	task->tk_status = 0;
-	task->tk_rpc_status = 0;
+	atomic64_set(&task->tk_rpc_error_state, 0);
 	task->tk_action = action;
 	return 1;
 }
diff --git a/net/sunrpc/sched.c b/net/sunrpc/sched.c
index 016f16ca57799..81890327d81a9 100644
--- a/net/sunrpc/sched.c
+++ b/net/sunrpc/sched.c
@@ -67,9 +67,17 @@ EXPORT_SYMBOL_GPL(rpc_task_gfp_mask);
 
 bool rpc_task_set_rpc_status(struct rpc_task *task, int rpc_status)
 {
-	if (cmpxchg(&task->tk_rpc_status, 0, rpc_status) == 0)
-		return true;
-	return false;
+	s64 old = atomic64_read(&task->tk_rpc_error_state);
+	s64 new;
+
+	for (;;) {
+		if ((s32)old)
+			return false;
+		new = (old & RPC_TASK_ERR_STATE_SIGNALLED) |
+		      ((s64)(u32)rpc_status);
+		if (atomic64_try_cmpxchg(&task->tk_rpc_error_state, &old, new))
+			return true;
+	}
 }
 
 unsigned long
@@ -857,12 +865,24 @@ void rpc_exit_task(struct rpc_task *task)
 void rpc_signal_task(struct rpc_task *task)
 {
 	struct rpc_wait_queue *queue;
+	s64 old, new;
 
 	if (!RPC_IS_ACTIVATED(task))
 		return;
 
-	if (!rpc_task_set_rpc_status(task, -ERESTARTSYS))
-		return;
+	old = atomic64_read(&task->tk_rpc_error_state);
+	for (;;) {
+		if (old & RPC_TASK_ERR_STATE_SIGNALLED)
+			return;
+
+		new = old | RPC_TASK_ERR_STATE_SIGNALLED;
+		if (!((s32)old))
+			new |= (s64)(u32)-ERESTARTSYS;
+
+		if (atomic64_try_cmpxchg(&task->tk_rpc_error_state, &old, new))
+			break;
+	}
+
 	trace_rpc_task_signalled(task, task->tk_action);
 	queue = READ_ONCE(task->tk_waitqueue);
 	if (queue)
@@ -928,7 +948,7 @@ static void __rpc_execute(struct rpc_task *task)
 		do_action = task->tk_action;
 		/* Tasks with an RPC error status should exit */
 		if (do_action && do_action != rpc_exit_task &&
-		    (status = READ_ONCE(task->tk_rpc_status)) != 0) {
+		    (status = rpc_task_rpc_status(task)) != 0) {
 			task->tk_status = status;
 			do_action = rpc_exit_task;
 		}
@@ -970,7 +990,7 @@ static void __rpc_execute(struct rpc_task *task)
 			continue;
 		}
 		/* Wake up any task that has an exit status */
-		if (READ_ONCE(task->tk_rpc_status) != 0) {
+		if (rpc_task_rpc_status(task) != 0) {
 			rpc_wake_up_task_queue_locked(queue, task);
 			spin_unlock(&queue->lock);
 			continue;
-- 
2.53.0

