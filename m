Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792979395;
	b=p3+jJEN18dFexWANyvZK+Mx1FRpf+gT9tKDn5ooc19qH9qBt+oHnLY56qpaAj2ki0Fn1
	 gciUVFv90Ih9EtjnQC02VimJGVL2O7/GuzZ7rj1s70digM8KE4c92w9zcYu9Pjb1z2h49
	 iXPgnJoFvPYkKw3NcYqX/AvDQD8VvLVpy2B8qF5WEwfM8TW1d0Ada1mw0oWuZS8ytDCpl
	 8ql8QSx6UPW3pDDIMFDFeJoCrRxVma+rTmNGr6OO/ptGWflG5CgYAs9Fd2ISAWAgkbqYF
	 bVzVKBBqQNpFqu73BxyCLtGNbD7XpecuPIhtmkHqxF/Kl/K0L3HcCU/GC6nb/DA+R9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cqNF367lxFmIYhXXq+OLb+e5D4QxVBAxvfWwC9lKoew=;
	b=ipErGate39o+fmE2HxtuxbKMgTUi/tdKs3Vxzyf6k/rlSNF+m4immKOWdiMNGH/QHh04
	 11GDUzE83mD05fOXDgSvzsO9D+vqqbvPxTslcxs5JkmmWBkUfhHI8D2PIVPlmfV6+/Lj0
	 ejECBnAopPj/d4Ba7ivYAR9s8GteldsceC8RgTME3TKAvd5SDPrperD6/ChNRwnKdlS0V
	 njzO86WjLp1koZECqGg53m2UKyFzILTtDlvZNOgmkYybxt9/5ldTbMpKsfxD5XcSqXC8r
	 fp0R9ao/hfja5VwFd7RvKKxsK30rmEGbQGr5UrqqO8YmTDrUl6is+4PqN5UAkcfL+oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=WWDZxB44;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCA5606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FCA5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=WWDZxB44
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc3eb09dd2so296259137.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792979393; x=1793584193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cqNF367lxFmIYhXXq+OLb+e5D4QxVBAxvfWwC9lKoew=;
        b=WWDZxB44Fd/Q8tmP03lWulTrIxcwDY9VnZva4MccIza7oO2bd46wIwVGqu1fDaa7MX
         D99DYYzAjeexgQVztwS7tKXwGTni8P19x89b+uFagYufgllhjgWpHI1a/LxWAP/+c14s
         9NQ1pNgQlOtzgQfnWb5y37+p/YQsbBwJKHxft9ZR8mY0NLdTLy49W6df7DdKksGVELDX
         CxrojV9t+/OCAvdJ5lRY3DEpRNRjKcfeO5bDiKWPnbPm3hj1+Lddsd5EK9RbtZqkoClm
         fazlJ2MC94F01HTeUffvxkgaaqk7lBebsuuepebZckiOaSzPlXsfxKFkCU7xISWkVsC7
         +koQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979393; x=1793584193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cqNF367lxFmIYhXXq+OLb+e5D4QxVBAxvfWwC9lKoew=;
        b=LV91/VA7Z2O3E2artg0FG7Z4HI/7ukmKox9ODJISDQS2hJmtsNH0ZwCk1XAfVi5W8W
         +fAV27RuFmpxt1XNIUUAkQPwbjg4E38d+hKNPEVWQb3k++3h4ajW2w8upg2Z9QCQZVly
         LZGE5iAK9xj0PvIBLeTISIhhaeJYeeI5QdE/0Jy+mHdm9Gz9vEGEkBwy8BBl8wJ4ExUt
         6cOzFFp9gCOPA7wzLzGCBxCRddUAz/KwXFfBzn6TwHgC5P3tcsHQaZSGCC4XUjMYg3qW
         eGcYZyk8BPjYg8QxxxoOUbdAHdRFO+NnDxXL1ShILPlSv4/dMVMzrYhgSNWEQHNJ2oPS
         CzkQ==
X-Forwarded-Encrypted: i=1; AKwUvByE1yVckIOP8J1AlbOWydVD5/UknQc7tsmNnFGpNpJnwDvjYoQODvy0JIB9JIXmHi96BVexQ0PfDkxVrTY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKO9cJSkAnFBQXgnnp9g/+5ahuthJQXLM9KF6pyUjO2nSPaC4Y
	rfEaA1VRv+PfReDFd1o78bt74eTz9VOXn8OrfQtv7NJBkWbq/0b4QlQdx8No7MQJiHg=
X-Gm-Gg: AYBFou1CkOyU3uwZadKGRfCQXZ6sU4tMje8B+fpHKvrdVZieqFEL7eTcqi7d7JIxjCz
	+phlbkTFYhA1OUa0MbitgSyoR7YsKk7NCnhRpJjKLeeYfJsIO1H+q4bRa/4MqZvVmitoj+4mAqt
	yGFUPMku28XtbeyktzgX+/kj2iKk0fowk7sfFYQNCh5qOJFJrrvjwQFjNIQStrI9W0flDWAcKqN
	6Ti3iPI6gvyJOVVAosDW3g6kPIWg4EfXWJbyGagdDqiDAmnwyY/MOliScXY9h2vYvwCyTfAPV2I
	A2PtwLa7isXnkFbgCsJ6kehvu2IBUZPytLBqvkzoy5QWvOL2WJ4lYvSUQ3YGYY9rmEswnMbzOZ2
	Ianaasnr1a5lC5wSBbW5Sy5x9DErQO8XHlG8TBnWkUqGThPkjFc9/nmzVuDcn5oWQFg9942UwrW
	XTLXiDl9O0qZzGDGzPwO+F4Z88DeLbHOvUYMn01qSAAcX9KlDGPpXMde/WWian9xAWC/YoFd9zb
	w5OlJFg/o5Oy7xkeji/6jr/0jn5U8CWAcMn8QSZBFEsj8hi3vfLkvNXc5ckd45xWjtKi1VJPOCm
	Ppp2vX1aID5cN02SKzVnpJ5gZBkhYZ1KlVIETPFOPiL6V/DWjzmaZg3ZYYh3YCjM5iqtEDY6Ol6
	q
X-Received: by 2002:a05:6102:570d:b0:7cc:1ace:fd06 with SMTP id ada2fe7eead31-7ce5cdabfa5mr1356873137.20.1792979393254;
        Sun, 25 Oct 2026 18:49:53 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5df73970sm6099917137.1.2026.10.25.18.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:49:52 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [PATCH v4 2/3] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl to freeze sessions early
Date: Sun, 25 Oct 2026 21:49:45 -0400
Message-ID: <20261026014948.162559-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261026014948.162559-1-pasha.tatashin@soleen.com>
References: <20261026014948.162559-1-pasha.tatashin@soleen.com>
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
freezes them serially during shutdown. Allowing userspace to decide when
to freeze a session once it is done with it (and to freeze multiple
sessions in parallel, since luo_session_freeze() only acquires the
per-session mutex) avoids postponing this work to kexec shutdown and
reduces blackout time.

Introduce LIVEUPDATE_SESSION_FREEZE on session file descriptors to freeze
a session early. The ioctl runs .freeze() across all preserved files in the
session and serializes their metadata. Once frozen, no additional files can
be added to the session, and subsequent freeze calls return -EBUSY. Freeze
is only valid on outgoing sessions and returns -EINVAL on incoming ones.

During kexec, sessions that were already frozen early are skipped, while
sessions that did not invoke this ioctl auto-freeze as before. If an
early-frozen session is released before kexec, its files are rolled back
via .unfreeze() before being unpreserved.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/liveupdate.h       |  3 +-
 include/uapi/linux/liveupdate.h  | 25 +++++++++++++
 kernel/liveupdate/luo_file.c     | 49 ++++++++++++------------
 kernel/liveupdate/luo_internal.h |  3 ++
 kernel/liveupdate/luo_session.c  | 64 +++++++++++++++++++++++++++-----
 mm/memfd_luo.c                   |  5 ++-
 6 files changed, 113 insertions(+), 36 deletions(-)

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
index 4043d4038712..3fb0cae0f711 100644
--- a/include/uapi/linux/liveupdate.h
+++ b/include/uapi/linux/liveupdate.h
@@ -60,6 +60,7 @@ enum {
 	LIVEUPDATE_CMD_SESSION_RETRIEVE_FD = 0x41,
 	LIVEUPDATE_CMD_SESSION_FINISH = 0x42,
 	LIVEUPDATE_CMD_SESSION_GET_NAME = 0x43,
+	LIVEUPDATE_CMD_SESSION_FREEZE = 0x44,
 };
 
 /**
@@ -236,4 +237,28 @@ struct liveupdate_session_get_name {
 #define LIVEUPDATE_SESSION_GET_NAME					\
 	_IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_SESSION_GET_NAME)
 
+/**
+ * struct liveupdate_session_freeze - ioctl(LIVEUPDATE_SESSION_FREEZE)
+ * @size:     Input; sizeof(struct liveupdate_session_freeze)
+ * @reserved: Input; Must be zero. Reserved for future use.
+ *
+ * Freezes the session from userspace before the kexec reboot phase.
+ *
+ * When this ioctl is called, the kernel executes the .freeze() callback on all
+ * preserved files in the session and serializes their metadata. Once frozen,
+ * no further files can be preserved in the session.
+ *
+ * During the subsequent kexec reboot, this session is recognized as already
+ * frozen and is skipped from the late auto freeze.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+struct liveupdate_session_freeze {
+	__u32		size;
+	__u32		reserved;
+};
+
+#define LIVEUPDATE_SESSION_FREEZE					\
+	_IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_SESSION_FREEZE)
+
 #endif /* _UAPI_LIVEUPDATE_H */
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 988eb313a135..fac2e5a6bdc0 100644
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
@@ -74,15 +75,16 @@
  *
  * 1. Abort Before Reboot: If the userspace agent aborts the live update
  *    process before calling reboot (e.g., by closing the session file
- *    descriptor), the session's release handler calls
- *    luo_file_unpreserve_files(). This invokes the .unpreserve() callback on
- *    all preserved files, ensuring all allocated resources are cleaned up and
- *    returning the system to a clean state.
+ *    descriptor), the session's release handler unfreezes the files if the
+ *    session was already frozen and calls luo_file_unpreserve_files(). This
+ *    invokes the .unpreserve() callback on all preserved files, ensuring all
+ *    allocated resources are cleaned up and returning the system to a clean
+ *    state.
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
@@ -442,9 +444,9 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
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
@@ -461,13 +463,12 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
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
@@ -517,15 +518,15 @@ int luo_file_freeze(struct luo_file_set *file_set)
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
+ *          or when an explicitly frozen session is released before kexec.
  */
 void luo_file_unfreeze(struct luo_file_set *file_set)
 {
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 01a172cd9d7a..381499e73d2a 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -64,6 +64,8 @@ struct luo_file_set {
  *              previous kernel) sessions.
  * @retrieved:  A boolean flag indicating whether this session has been
  *              retrieved by a consumer in the new kernel.
+ * @user_frozen: A boolean flag indicating whether this session has been
+ *               frozen explicitly from userspace.
  * @file_set:   A set of files that belong to this session.
  * @mutex:      protects fields in the luo_session.
  */
@@ -71,6 +73,7 @@ struct luo_session {
 	char name[LIVEUPDATE_SESSION_NAME_LENGTH];
 	struct list_head list;
 	bool retrieved;
+	bool user_frozen;
 	struct luo_file_set file_set;
 	struct mutex mutex;
 };
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 827f9ad1938f..cce6d09280b3 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -34,10 +34,11 @@
  * 1.  Creation: A userspace agent calls `luo_session_create()` to create a
  *     new, empty session and receives a file descriptor for it.
  *
- * 2.  Serialization: When the `reboot(LINUX_REBOOT_CMD_KEXEC)` syscall is
- *     made, `luo_session_serialize()` is called. It iterates through all
- *     active sessions and writes their metadata into a memory area preserved
- *     by KHO.
+ * 2.  Freeze / Serialization: Sessions may be frozen explicitly from userspace
+ *     via `LIVEUPDATE_SESSION_FREEZE`. When the `reboot(LINUX_REBOOT_CMD_KEXEC)`
+ *     syscall is made, `luo_session_serialize()` is called to freeze any
+ *     remaining active sessions and write all session metadata into a memory
+ *     area preserved by KHO.
  *
  * 3.  Deserialization (in new kernel): After kexec, `luo_session_deserialize()`
  *     runs, reading the serialized data and creating a list of `struct
@@ -222,7 +223,13 @@ static void luo_session_unserialize_one(struct luo_session *session,
 					struct luo_session_ser *ser)
 {
 	guard(mutex)(&session->mutex);
-	luo_file_unfreeze(&session->file_set);
+	/*
+	 * Only unfreeze sessions that were auto-frozen by
+	 * luo_session_serialize_one(); sessions frozen explicitly by
+	 * userspace stay frozen until the session FD is closed.
+	 */
+	if (!session->user_frozen)
+		luo_file_unfreeze(&session->file_set);
 	memset(ser, 0, sizeof(*ser));
 }
 
@@ -232,9 +239,11 @@ static int luo_session_serialize_one(struct luo_session *session,
 	int err;
 
 	guard(mutex)(&session->mutex);
-	err = luo_file_freeze(&session->file_set);
-	if (err)
-		return err;
+	if (!session->user_frozen) {
+		err = luo_file_freeze(&session->file_set);
+		if (err)
+			return err;
+	}
 
 	strscpy(ser->name, session->name, sizeof(ser->name));
 	ser->file_set_ser.count = session->file_set.count;
@@ -261,8 +270,11 @@ static int luo_session_release(struct inode *inodep, struct file *filep)
 		}
 		sh = &luo_session_global.incoming;
 	} else {
-		scoped_guard(mutex, &session->mutex)
+		scoped_guard(mutex, &session->mutex) {
+			if (session->user_frozen)
+				luo_file_unfreeze(&session->file_set);
 			luo_file_unpreserve_files(&session->file_set);
+		}
 		sh = &luo_session_global.outgoing;
 	}
 
@@ -279,6 +291,9 @@ static int luo_session_preserve_fd(struct luo_session *session,
 	int err;
 
 	guard(mutex)(&session->mutex);
+	if (session->user_frozen)
+		return -EBUSY;
+
 	err = luo_preserve_file(&session->file_set, argp->token, argp->fd);
 	if (err)
 		return err;
@@ -352,11 +367,40 @@ static int luo_session_get_name(struct luo_session *session,
 	return luo_ucmd_respond(ucmd, sizeof(*argp));
 }
 
+static int luo_session_freeze(struct luo_session *session,
+			      struct luo_ucmd *ucmd)
+{
+	struct liveupdate_session_freeze *argp = ucmd->cmd;
+	int err;
+
+	if (argp->reserved)
+		return -EINVAL;
+
+	guard(mutex)(&session->mutex);
+	if (session->user_frozen)
+		return -EBUSY;
+
+	err = luo_file_freeze(&session->file_set);
+	if (err)
+		return err;
+
+	err = luo_ucmd_respond(ucmd, sizeof(*argp));
+	if (err) {
+		luo_file_unfreeze(&session->file_set);
+		return err;
+	}
+
+	session->user_frozen = true;
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
@@ -394,6 +438,8 @@ static const struct luo_ioctl_op luo_session_ioctl_ops[] = {
 		 struct liveupdate_session_retrieve_fd, token, LUO_IOCTL_INCOMING),
 	IOCTL_OP(LIVEUPDATE_SESSION_GET_NAME, luo_session_get_name,
 		 struct liveupdate_session_get_name, name, LUO_IOCTL_ALL),
+	IOCTL_OP(LIVEUPDATE_SESSION_FREEZE, luo_session_freeze,
+		 struct liveupdate_session_freeze, reserved, LUO_IOCTL_OUTGOING),
 };
 
 static bool luo_ioctl_type_valid(struct luo_session *session,
diff --git a/mm/memfd_luo.c b/mm/memfd_luo.c
index 6b68220275eb..a3bf872b3a03 100644
--- a/mm/memfd_luo.c
+++ b/mm/memfd_luo.c
@@ -43,8 +43,9 @@
  *   allocating pages for them during preservation.
  *
  * File Position
- *   The current file position is preserved, allowing applications to continue
- *   reading/writing from their last position.
+ *   The file position at the time the session is frozen is preserved,
+ *   allowing applications to continue reading/writing from their last
+ *   position.
  *
  * File Status Flags
  *   memfds are always opened with ``O_RDWR`` and ``O_LARGEFILE``. This property
-- 
2.56.0.307.g5fe7bd680c-goog

