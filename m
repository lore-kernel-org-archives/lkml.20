Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854866;
	b=BWiFnM5EgCvjjxwgx/8a1JdLJpmsMjMNFSc8Zt1BKsbPb6CEyEzWj8D1ExT6Z/4hDl9G
	 KD4LwndPmW2Aq/irihRQ5ADGceLQt7lNgHwN3wMq7Pgdk15fBiFp9v6umYQkTeiP38ae7
	 UqBVYJdmH1YOHN++RRTKkK5sLobVS+STNe4Jk39PT+otiwXv+UMBb0y0NxAGkrbR17M56
	 AccgegZ+tW6mZoF64B2JP4c7osG7SYEYgZcPAvtelNssvWvnDXwjBbhEkBrp2uCfdCGNL
	 +0CVrsU9L53I0F/2TOmRNgqZcXyjnPdLTqUw/7LKOLBY0DR6qCHFbsm7psTh/tlTf5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YUipaf1Xu3soLx3fON/5CvYu8l0nj5iVkY657TVC4e0=;
	b=cNrmFwXQtbVIVOV9d6H97f/u0v8dkTx2QYn4rPwy8wHqqTukBUdas2ne2m1JbDa2++45
	 2/ewkmsl5igDkUXbtXk362f03w4FceDBpdbIu2NLbHBKatH4Ti99RcqIbg42CdyjQ/CA1
	 EvNJUSFZPz5/Sh9HJxvJ+GKIWzSk8ZUD/93Hp38NhtYsH9SNr1/4wmiGofo+7sfZTsG+n
	 qOx9Cx1kGDcGXshXNaTA0FqB2P8BubR+n29mpUbG0KK/UylxOU8DDXTLk+bSGsBgEQIt6
	 2mvgk3iMyPaXso3zX+R/+j9MyW285pdykONBff2yCWgN/zMhNSjrvX/7EtMbjjc1RiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=h5+9VSr8;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5DA606D823
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A5DA606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=h5+9VSr8
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eafb65e163so998566e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793854864; x=1794459664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YUipaf1Xu3soLx3fON/5CvYu8l0nj5iVkY657TVC4e0=;
        b=h5+9VSr8pismS4RQC6BSEFInt0jEgqTOgiKoze1ppjo9qt+Q2MYoIAxhUMOs0Mhj2l
         YIXEaczY3j9F4bLYubdKk306J3nwiLIeXcMfrAw6QFhz4Fss5uSGtayxUzlDPoqJOo3G
         zxkpq47awlXUTuAZlLGKNgVgl76KLflRSa9vqBVbgl6+VTv4BUl0o3kSRPITTTwwtTN5
         5oTQQSjCXkGka/pZY/p2cMc7SnQtHfSqp9+j24f8ITPWS8xL3nEDbjS/Ghz3Zesv50ZI
         V/H/u1Fiatc6qkJuEAgTvVyAYlgTGwp0un+WEQQ+7DSb4bc8BYXJCsHyB+A+dRXxSA6q
         o0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854864; x=1794459664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YUipaf1Xu3soLx3fON/5CvYu8l0nj5iVkY657TVC4e0=;
        b=ohk2wZVhJODGYkyT/DlX/ijNPbNPf16FwBHk9S7MA/QfeQvnRYTk8RCFtCxKPziHAw
         1cVSyn8/KQQ+OZQPFOzLsmRQkhW4lONRP72EhkTyXDPDz2HAZQBUzMs7nsP6siN8remt
         4KD+1hiHbsNYAUJgniii/pTIFHUo2isKUgogTmsnRWfJHhUZ9GVQNfDkuaDGxPzBr+WH
         u3MXnxY5Ik/vey/BIOc4Fh713OabTHeBZlgYliIESdSHU+Grw3qIGP+BAH/DytRTAw84
         sgw0jFQExDl/7JwOpJLKC9KTB3ZOKeNOvcUGYJ6dnPeH54fQgxNl9Ppj1biGmSq+oFE0
         K3wg==
X-Forwarded-Encrypted: i=1; AKwUvBx2AYibPPEvn1HX0Mgi89HIPsQwCMeIyW3kGmzfv2fbU4b8czuUFFqXZTAxlmvA/mcYUChDoiWkNOeruCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GQdhaU7eyqPNGbRxKC+EHOTProKHlDxGMnzzmZFZI6LVEIMJh
	/m6PQ8ui8ofqqeTMuNtc5cT7+oaSYWVIxlnzfDptbXZrgdGV7CSA4asYXJdWgFBaYQ6ILBw+3U1
	GuC97
X-Gm-Gg: AYBFou3odmivhkBr1LKLsoPICmgNkfgdFkKz0PowfyU3+CPql3WkxOpBgHy9gHOamer
	JYf7av0B3bkn7F8uOPlPS+fcQQDb0buyin5cHhEJN6HmMIQ9XxXiGeThyGqCCm2mIXn0pZgWjp9
	7I+AkFmd5XDqOrUfP2YBvH8lz+PUzPjNrmLTya4a8YQ+/O+xgIab3StK7fzmIpOMl+bCvUWhUoE
	gfv867TyAe9i0QakS6UUScbMjtr73VNqU7q+hTTj8T8umi1bb6jlXHmz0JTFTL0NQ8HNCkBLTSp
	FByNIZnmPK1DiuTZQgwMj7KysuIoYxOpHR952n4ecdc1Hfn2VKi6aSrZRketH/sjEP7jPVqdkWP
	kNEDWTna2vAFmcKO2LFG96+recT0yt/tACnKLCAteYRlF14n6xC2YQuw5BZSbDvmviH+AwJaBwm
	PI/TcIJ2YlxI9CAbz/vf1HVZSdbh8qLqJemnZQAmsVciRPzGPmspJMkdTdVOWM3BRoUPYZtKw01
	78qVUgwTfCPGODVORPgGtI4E2IKGW/uviUdp+CuQdZ3FcrLI9grdmU9/Zexn5/XnDdQhrbiaF9c
	lX6d5/CP3YwzSwvAm3jTrTaEcsErLVdaLAfHDEUo/O5ofdFFyrSZ7rNt6Ei777Y4pn60nH3f4n5
	n8Q+MhzGUndE3MldlOexe6Up+W505lkLHG4/FUL8LYxfSqERp5g==
X-Received: by 2002:a05:6122:8f85:b0:5ec:20e8:45ff with SMTP id 71dfb90a1353d-5ec68a06324mr9559381e0c.21.1793854864052;
        Wed, 04 Nov 2026 21:01:04 -0800 (PST)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d9d62bsm3305282e0c.8.2026.11.04.21.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:01:03 -0800 (PST)
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
Subject: [PATCH v5 5/6] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl to freeze sessions early
Date: Thu,  5 Nov 2026 00:00:51 -0500
Message-ID: <20261105050053.3063001-6-pasha.tatashin@soleen.com>
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

Currently, LUO sessions are frozen automatically only inside the
reboot(LINUX_REBOOT_CMD_KEXEC) pathway, where luo_session_serialize()
iterates through all outgoing sessions under global write locks and
freezes them serially during shutdown. On hosts running multiple
workloads that quiesce one by one ahead of kexec, userspace needs an
explicit per-session freeze point so each session can capture final file
state under its per-session mutex as soon as its workload pauses.

Introduce LIVEUPDATE_SESSION_FREEZE on session FDs to freeze an outgoing
session early. The ioctl runs .freeze() across all preserved files in
the session and serializes their metadata. Once frozen, no additional
files can be added to the session, and subsequent freeze calls return
-EBUSY. Freeze is only valid on outgoing sessions and returns -EINVAL on
incoming ones.

By default (flags == 0), session lifetime remains bound to the session
FD: the session stays frozen while the FD remains open, and closing the
session FD before reboot (for example, to abort the session or on
process exit/crash) unfreezes it via .unfreeze(), unpreserves its files,
and reclaims all resources. During kexec, already-frozen sessions skip
the late auto-freeze and are published into the outgoing KHO subtree.

With LIVEUPDATE_SESSION_FREEZE_COMMIT set in
struct liveupdate_session_freeze.flags, the frozen session is committed:
it and its FLB dependencies are immediately inserted into the outgoing
KHO subtree via luo_session_publish_one(), and the session survives
close() with full ownership retained by LUO until reboot. Once
committed, closing the session FD (or another session failing to freeze
during reboot) never unfreezes or unpreserves the session, allowing
processes to hand off preserved state and exit prior to kexec.

Update the uAPI and core LUO documentation to describe session freeze
and commit semantics.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/userspace-api/liveupdate.rst | 30 +++++++++
 include/linux/liveupdate.h                 |  3 +-
 include/uapi/linux/liveupdate.h            | 46 +++++++++++++
 kernel/liveupdate/luo_file.c               | 54 +++++++--------
 kernel/liveupdate/luo_internal.h           |  7 ++
 kernel/liveupdate/luo_session.c            | 77 ++++++++++++++++++++--
 6 files changed, 184 insertions(+), 33 deletions(-)

diff --git a/Documentation/userspace-api/liveupdate.rst b/Documentation/userspace-api/liveupdate.rst
index cdd74627ab75..d36537c556cc 100644
--- a/Documentation/userspace-api/liveupdate.rst
+++ b/Documentation/userspace-api/liveupdate.rst
@@ -22,6 +22,36 @@ change, so compatibility is not guaranteed when kexec rebooting between
 different kernel versions. This is expected to change and stabilize in a future
 version.
 
+Session Freeze and Commit
+=========================
+
+By default, LUO freezes active sessions automatically inside the
+``reboot(LINUX_REBOOT_CMD_KEXEC)`` syscall path, and an outgoing session's
+lifetime is bound to its open session FD: closing the FD before reboot aborts
+preservation and returns all resources.
+
+Userspace may also freeze an outgoing session explicitly ahead of reboot via
+``ioctl(session_fd, LIVEUPDATE_SESSION_FREEZE, &arg)`` once it has finished
+preserving and modifying the session's files:
+
+- **Freeze** (``flags == 0``): Executes ``.freeze()`` on all preserved files in
+  the session under the per-session lock (allowing multiple sessions to freeze
+  concurrently), while keeping session lifetime tied to ``session_fd``. When
+  ``session_fd`` is closed before reboot (for example, to abort the session or
+  on process exit/crash), LUO runs ``.unfreeze()`` and ``.unpreserve()`` on all
+  files in the session and reclaims all resources. As long as ``session_fd``
+  remains open, the session stays frozen across any failed ``reboot()`` attempt;
+  at kexec time, already-frozen sessions skip the late auto-freeze step and are
+  published into the outgoing KHO subtree.
+- **Freeze and commit** (``LIVEUPDATE_SESSION_FREEZE_COMMIT``): Freezes the
+  session's files, immediately inserts the session and its FLB dependencies
+  into the outgoing KHO subtree, and commits the session so that it survives
+  closing ``session_fd`` with ownership retained by LUO until reboot. Once
+  committed, closing ``session_fd`` (or another session failing to freeze
+  during ``reboot()``) will neither unfreeze nor unpreserve the session,
+  allowing processes to hand off preserved state to LUO and exit prior to
+  kexec.
+
 Userspace Integration
 =====================
 
diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index 6051abc0612c..851692571e13 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -59,7 +59,8 @@ struct liveupdate_file_op_args {
  *                compatible with the given file.
  * @preserve:     Required. Performs state-saving for the file.
  * @unpreserve:   Required. Cleans up any resources allocated by @preserve.
- * @freeze:       Optional. Final actions just before kernel transition.
+ * @freeze:       Optional. Prepares final state before kexec (via
+ *                LIVEUPDATE_SESSION_FREEZE or during reboot).
  * @unfreeze:     Optional. Undo freeze operations.
  * @retrieve:     Required. Restores the file in the new kernel.
  * @can_finish:   Optional. Check if this FD can finish, i.e. all restoration
diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
index 4043d4038712..ba424dc51578 100644
--- a/include/uapi/linux/liveupdate.h
+++ b/include/uapi/linux/liveupdate.h
@@ -60,6 +60,7 @@ enum {
 	LIVEUPDATE_CMD_SESSION_RETRIEVE_FD = 0x41,
 	LIVEUPDATE_CMD_SESSION_FINISH = 0x42,
 	LIVEUPDATE_CMD_SESSION_GET_NAME = 0x43,
+	LIVEUPDATE_CMD_SESSION_FREEZE = 0x44,
 };
 
 /**
@@ -236,4 +237,49 @@ struct liveupdate_session_get_name {
 #define LIVEUPDATE_SESSION_GET_NAME					\
 	_IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_SESSION_GET_NAME)
 
+/**
+ * enum liveupdate_session_freeze_flags - Flags for LIVEUPDATE_SESSION_FREEZE
+ * @LIVEUPDATE_SESSION_FREEZE_COMMIT: Commit the frozen session. The session is
+ *                                    immediately inserted into the outgoing KHO
+ *                                    tree and survives closing the session FD
+ *                                    until reboot.
+ */
+enum liveupdate_session_freeze_flags {
+	LIVEUPDATE_SESSION_FREEZE_COMMIT = 1 << 0,
+};
+
+/**
+ * struct liveupdate_session_freeze - ioctl(LIVEUPDATE_SESSION_FREEZE)
+ * @size:  Input; sizeof(struct liveupdate_session_freeze)
+ * @flags: Input; Combination of enum liveupdate_session_freeze_flags.
+ *
+ * Freezes the session from userspace before the kexec reboot phase.
+ *
+ * When this ioctl is called, the kernel executes the .freeze() callback on all
+ * preserved files in the session and serializes their metadata. Once frozen,
+ * no further files can be preserved in the session, and subsequent freeze
+ * attempts return -EBUSY.
+ *
+ * By default (@flags is 0), session lifetime remains tied to the session FD:
+ * if the session FD is closed before reboot (for example, if the application
+ * exits or crashes), the session is unfrozen, its preserved files are
+ * unpreserved, and all resources are returned.
+ *
+ * If %LIVEUPDATE_SESSION_FREEZE_COMMIT is set in @flags, the frozen session is
+ * committed: it is immediately inserted into the outgoing KHO tree and survives
+ * closing the session FD, transferring full ownership of the session and its
+ * preserved resources to LUO until reboot. Once committed, the session is never
+ * unfrozen or unpreserved, even if the session FD is closed or if another
+ * session fails to freeze during reboot.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+struct liveupdate_session_freeze {
+	__u32		size;
+	__u32		flags;
+};
+
+#define LIVEUPDATE_SESSION_FREEZE					\
+	_IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_SESSION_FREEZE)
+
 #endif /* _UAPI_LIVEUPDATE_H */
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 611b9967a3a9..afed2b59f489 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -31,9 +31,9 @@
  *   - unpreserve(): Cleans up any resources allocated by .preserve(), called
  *     if the preservation process is aborted before the reboot (i.e. session is
  *     closed).
- *   - freeze(): A final pre-reboot opportunity to prepare the state for kexec.
- *     We are already in reboot syscall, and therefore userspace cannot mutate
- *     the file anymore.
+ *   - freeze(): Prepares the final state for kexec. Invoked either via
+ *     the LIVEUPDATE_SESSION_FREEZE ioctl once userspace is done modifying
+ *     the session's files, or during the reboot() syscall.
  *   - unfreeze(): Undoes the actions of .freeze(), called if the live update
  *     is aborted after the freeze phase.
  *   - retrieve(): Reconstructs the file in the new kernel from the preserved
@@ -48,7 +48,8 @@
  *    handler, calls its .preserve() operation, and creates an internal &struct
  *    luo_file to track the live state.
  *
- * 2. Freeze (Pre-Reboot): Just before the kexec, luo_file_freeze() is called.
+ * 2. Freeze (Pre-Reboot): Either explicitly via LIVEUPDATE_SESSION_FREEZE or
+ *    just before the kexec during reboot(), luo_file_freeze() is called.
  *    It iterates through all preserved files, calls their respective .freeze()
  *    operation, and serializes their final metadata (compatible string, token,
  *    and data handle) into a contiguous memory block for KHO.
@@ -72,17 +73,19 @@
  *
  * File Preservation Lifecycle unhappy paths:
  *
- * 1. Abort Before Reboot: If the userspace agent aborts the live update
- *    process before calling reboot (e.g., by closing the session file
- *    descriptor), the session's release handler calls
- *    luo_file_unpreserve_files(). This invokes the .unpreserve() callback on
- *    all preserved files, ensuring all allocated resources are cleaned up and
- *    returning the system to a clean state.
+ * 1. Abort Before Reboot: When an uncommitted session FD is closed before
+ *    reboot (e.g., to abort preservation or on process exit), the session's
+ *    release handler unfreezes the files if the session was frozen via
+ *    LIVEUPDATE_SESSION_FREEZE and calls luo_file_unpreserve_files(). This
+ *    invokes the .unpreserve() callback on all preserved files, ensuring all
+ *    allocated resources are cleaned up and returning the system to a clean
+ *    state. Committed sessions survive closing their FD and remain owned by
+ *    LUO until reboot.
  *
- * 2. Freeze Failure: During the reboot() syscall, if any handler's .freeze()
- *    op fails, the .unfreeze() op is invoked on all previously *successful*
- *    freezes to roll back their state. The reboot() syscall then returns an
- *    error to userspace, canceling the live update.
+ * 2. Freeze Failure: During LIVEUPDATE_SESSION_FREEZE or the reboot() syscall,
+ *    if any handler's .freeze() op fails, the .unfreeze() op is invoked on all
+ *    previously *successful* freezes to roll back their state, and an error is
+ *    returned to userspace, canceling the live update if called from reboot().
  *
  * 3. Finish Failure: In the new kernel, if a handler's .finish() op fails,
  *    the luo_file_finish() operation is aborted. LUO retains ownership of
@@ -458,9 +461,9 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
  * luo_file_freeze - Freezes all preserved files and serializes their metadata.
  * @file_set: The file_set whose files are to be frozen.
  *
- * This function is called from the reboot() syscall path, just before the
- * kernel transitions to the new image via kexec. Its purpose is to perform the
- * final preparation and serialization of all preserved files in the file_set.
+ * This function is called from LIVEUPDATE_SESSION_FREEZE or from the reboot()
+ * syscall path. Its purpose is to perform the final preparation and
+ * serialization of all preserved files in the file_set.
  *
  * It iterates through each preserved file in FIFO order (the order of
  * preservation) and performs two main actions:
@@ -477,13 +480,12 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
  *
  * Error Handling (Rollback):
  * This function is atomic. If any handler's .freeze() operation fails, the
- * entire live update is aborted. The __luo_file_unfreeze() helper is
- * immediately called to invoke the .unfreeze() op on all files that were
- * successfully frozen before the point of failure, rolling them back to a
- * running state. The function then returns an error, causing the reboot()
- * syscall to fail.
+ * __luo_file_unfreeze() helper is immediately called to invoke the .unfreeze()
+ * op on all files that were successfully frozen before the point of failure,
+ * rolling them back to an unfrozen state, and an error is returned to the
+ * caller, canceling the live update if called from the reboot() path.
  *
- * Context: Called only from the liveupdate_reboot() path.
+ * Context: Called from LIVEUPDATE_SESSION_FREEZE or the liveupdate_reboot() path.
  * Return: 0 on success, or a negative errno on failure.
  */
 int luo_file_freeze(struct luo_file_set *file_set)
@@ -533,15 +535,15 @@ int luo_file_freeze(struct luo_file_set *file_set)
  * @file_set: The file_set whose files are to be unfrozen.
  *
  * This function rolls back the state of all files in a file_set after the
- * freeze phase has begun but must be aborted. It is the counterpart to
- * luo_file_freeze().
+ * freeze phase has begun. It is the counterpart to luo_file_freeze().
  *
  * It invokes the __luo_file_unfreeze() helper with a NULL argument, which
  * signals the helper to iterate through all files in the file_set, call their
  * respective .unfreeze() handler callbacks, and clear the serialized blocks.
  *
  * Context: This is called when the live update is aborted during
- *          the reboot() syscall, after luo_file_freeze() has been called.
+ *          the reboot() syscall, after luo_file_freeze() has been called,
+ *          or when a frozen uncommitted session is released before kexec.
  */
 void luo_file_unfreeze(struct luo_file_set *file_set)
 {
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index a7253b48df80..f1ecc8586ea1 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -64,6 +64,11 @@ struct luo_file_set {
  *              previous kernel) sessions.
  * @retrieved:  A boolean flag indicating whether this session has been
  *              retrieved by a consumer in the new kernel.
+ * @user_frozen: A boolean flag indicating whether this session has been
+ *               frozen explicitly from userspace.
+ * @committed:   A boolean flag indicating whether this session has been
+ *               committed (frozen, published into the outgoing KHO tree,
+ *               and owned by LUO across session FD close until reboot).
  * @file_set:   A set of files that belong to this session.
  * @mutex:      protects fields in the luo_session.
  */
@@ -71,6 +76,8 @@ struct luo_session {
 	char name[LIVEUPDATE_SESSION_NAME_LENGTH];
 	struct list_head list;
 	bool retrieved;
+	bool user_frozen;
+	bool committed;
 	struct luo_file_set file_set;
 	struct mutex mutex;
 };
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 713b9b400f07..4358a5e77c38 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -34,10 +34,16 @@
  * 1.  Creation: A userspace agent calls `luo_session_create()` to create a
  *     new, empty session and receives a file descriptor for it.
  *
- * 2.  Serialization: When the `reboot(LINUX_REBOOT_CMD_KEXEC)` syscall is
- *     made, `luo_session_serialize()` is called. It iterates through all
- *     active sessions and writes their metadata into a memory area preserved
- *     by KHO.
+ * 2.  Freeze / Serialization: Sessions may be frozen explicitly from userspace
+ *     via `LIVEUPDATE_SESSION_FREEZE`. With `flags == 0`, the session's files
+ *     are frozen while keeping the session tied to its FD so closing it
+ *     unfreezes and unpreserves the session. With
+ *     `LIVEUPDATE_SESSION_FREEZE_COMMIT`, the frozen session is committed: it
+ *     is immediately published with its FLBs into the outgoing KHO tree and
+ *     survives closing the session FD until reboot. When the
+ *     `reboot(LINUX_REBOOT_CMD_KEXEC)` syscall is made,
+ *     `luo_session_serialize()` freezes any remaining unfrozen sessions and
+ *     publishes all remaining unpublished sessions into the KHO tree.
  *
  * 3.  Deserialization (in new kernel): After kexec, `luo_session_deserialize()`
  *     runs, reading the serialized data and creating a list of `struct
@@ -276,12 +282,21 @@ static int luo_session_finish_one(struct luo_session *session)
 static void luo_session_unfreeze_one(struct luo_session *session)
 {
 	guard(mutex)(&session->mutex);
-	luo_file_unfreeze(&session->file_set);
+	/*
+	 * Only unfreeze sessions that were auto-frozen by
+	 * luo_session_freeze_one(); sessions frozen explicitly by
+	 * userspace stay frozen until the session FD is closed.
+	 */
+	if (!session->user_frozen)
+		luo_file_unfreeze(&session->file_set);
 }
 
 static int luo_session_freeze_one(struct luo_session *session)
 {
 	guard(mutex)(&session->mutex);
+	if (session->user_frozen)
+		return 0;
+
 	return luo_file_freeze(&session->file_set);
 }
 
@@ -302,8 +317,13 @@ static int luo_session_release(struct inode *inodep, struct file *filep)
 		}
 		sh = &luo_session_global.incoming;
 	} else {
-		scoped_guard(mutex, &session->mutex)
+		scoped_guard(mutex, &session->mutex) {
+			if (session->committed)
+				return 0;
+			if (session->user_frozen)
+				luo_file_unfreeze(&session->file_set);
 			luo_file_unpreserve_files(&session->file_set);
+		}
 		sh = &luo_session_global.outgoing;
 	}
 
@@ -320,6 +340,9 @@ static int luo_session_preserve_fd(struct luo_session *session,
 	int err;
 
 	guard(mutex)(&session->mutex);
+	if (session->user_frozen)
+		return -EBUSY;
+
 	err = luo_preserve_file(&session->file_set, argp->token, argp->fd);
 	if (err)
 		return err;
@@ -393,11 +416,51 @@ static int luo_session_get_name(struct luo_session *session,
 	return luo_ucmd_respond(ucmd, sizeof(*argp));
 }
 
+static int luo_session_freeze(struct luo_session *session,
+			      struct luo_ucmd *ucmd)
+{
+	struct liveupdate_session_freeze *argp = ucmd->cmd;
+	int err;
+
+	if (argp->flags & ~LIVEUPDATE_SESSION_FREEZE_COMMIT)
+		return -EOPNOTSUPP;
+
+	scoped_guard(mutex, &session->mutex) {
+		if (session->user_frozen)
+			return -EBUSY;
+
+		err = luo_file_freeze(&session->file_set);
+		if (err)
+			return err;
+
+		err = luo_ucmd_respond(ucmd, sizeof(*argp));
+		if (err) {
+			luo_file_unfreeze(&session->file_set);
+			return err;
+		}
+
+		session->user_frozen = true;
+	}
+
+	if (argp->flags & LIVEUPDATE_SESSION_FREEZE_COMMIT) {
+		struct luo_session_header *sh = &luo_session_global.outgoing;
+
+		guard(rwsem_write)(&sh->rwsem);
+		guard(mutex)(&session->mutex);
+
+		luo_session_publish_one(session);
+		session->committed = true;
+	}
+
+	return 0;
+}
+
 union ucmd_buffer {
 	struct liveupdate_session_finish finish;
 	struct liveupdate_session_preserve_fd preserve;
 	struct liveupdate_session_retrieve_fd retrieve;
 	struct liveupdate_session_get_name get_name;
+	struct liveupdate_session_freeze freeze;
 };
 
 /* Type of sessions the ioctl applies to. */
@@ -435,6 +498,8 @@ static const struct luo_ioctl_op luo_session_ioctl_ops[] = {
 		 struct liveupdate_session_retrieve_fd, token, LUO_IOCTL_INCOMING),
 	IOCTL_OP(LIVEUPDATE_SESSION_GET_NAME, luo_session_get_name,
 		 struct liveupdate_session_get_name, name, LUO_IOCTL_ALL),
+	IOCTL_OP(LIVEUPDATE_SESSION_FREEZE, luo_session_freeze,
+		 struct liveupdate_session_freeze, flags, LUO_IOCTL_OUTGOING),
 };
 
 static bool luo_ioctl_type_valid(struct luo_session *session,
-- 
2.56.0.398.g882cbad275-goog

