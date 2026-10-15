Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23AE1A0BF3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057110; cv=none; b=IHi+OMt1kRJf0cZRzsWFV4C9EP0N2dP98SzyqilDLYImC5Sv3TJqcb++LDaNvVN11i7UsUg8KjTU59pQktUNA5ybwRxq5DUZc/smthANTeIQQiZBjJITsoVXWazhvqnkIVsun0SmdDZ/xwLlVGULRgIuWIQkZgEGsgeYgMjnREk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057110; c=relaxed/simple;
	bh=9a0G36GEo4C4CDZFVWUS0XV7PQMYMmwFYWyoF0gL7Qc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PWdqEdDye1XxGQS6t3mJ1dfvbH+gBc/Jz010qttET+lqaVKRM55R3pZj/gkbXlly7fnMhWMaCHOca9vf8LxtyxnUXjq9BezxJwzVAgNeYf2g4zMVa/hPcJZzjTvHSF48Ix/le9y5Z/nXtSqw7KDFAINWQE8+gs2BKv+S8V91h6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=ZuJ6k7/0; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="ZuJ6k7/0"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5e941201909so442051e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792057104; x=1792661904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pY48lcCbUxxQDObex6aFAnsnCQJNXYhublaxAxnxY3c=;
        b=ZuJ6k7/0bkcyVfU1v/QxOevirENPqeK3PzJY0aRQ8pZfgB9T3NyUXAariB0gyNbHKA
         7H9RYwdzaGWbIPYtPAbyrjjFkUa11hVhe0cyx0cBU/JKeQQaJu6FENp9EwIAy4WkNtfj
         OOEJy5zGPWPWE1NBlwSULxWBlElBOCjsBAcK1boNuD46TQRZIuUIY52TKLoW6FHwEpQc
         82bw+IwPbhWyh93LnZWBcAm590sSafu/ok0rPC0WAEdUdHVNZoUFHPX2IS3drFAf6/ol
         9eDl3U0czTJUsGE8zz2Jg3tw/5CBVCZsKILRdC4GPoLI4Sg8wMr6p/D9/NmL8BxqR4J4
         spKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057104; x=1792661904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pY48lcCbUxxQDObex6aFAnsnCQJNXYhublaxAxnxY3c=;
        b=wg3DGn10z9N8nmjKHC+gj39H4kOWxOXRMo85GasPCejKFaG8SgdJcHpU6iHlOK7sG4
         LAlgoKVUYXR3g3+ZuOx5+4bUHrRd50mPmvIRbF9EZkd1Ifv5vakSPAGxNirPbuHvFkNv
         AUjyhe2mpXH5/y09J7Eel/P+Rve8dajZZ5f50BzxBqGWAOpQASwYsrEuPX2OA/9npjsT
         iBlg+nGQhUmtHLKnoPTkQSfL47xF7tOpAJGF4GXA/nrChTkH5hXWZgTrmQ6JRLcxQfU9
         yrcfoOtVbsjL2/dYyyD3TsUrbKsRLdREa1IjbaLHkoWpyHMOXnjY63K43Gn7D8RZH/6E
         mq8g==
X-Forwarded-Encrypted: i=1; AKwUvBwYE9Q/YKeo95qyInzq31Hi3YFyKXP9kGKZh8WpRxdgCJqLwOR2vWoDErexjpocqvEGqgzhSANIO9lgYrM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh60F114K7xow6pPaD5OLkb44aQGOq76+tzzZcrMo/6vasprFF
	sp9ipFAxtA52SN0NtlF9sR1K2bEcnQHKm5A1n+1Wkcc0nuGMRaRgALBdi/XJSkvDOUY=
X-Gm-Gg: AYBFou2TWEUHcfMJ4X2nR6HFwV/mLtpZoCQ7VQ7Q/2mtikmImyQtBJ7dO2RsbJS8FJ5
	ocnANhZcSuxfecVn4epf4z29czYH/HQNLCYVk6qFhJjVB1DFp6XByilOP6Li+xDTzY/h4WzIpiN
	g/yvx5Dfj1M/0XKcHtKwllVjfCb7G3i5zSnvH58s3VX5CwmXK3TYEkIZjHTZ7eNT1TjoBLLojuz
	+W2+3MD//K94Vt5ihs/frQOZf4CgogX0DuBuG6nWNRMVDjujZTf8gSdEvzITeVNFjJpC7g95jW5
	Y9ZCWdyDttrClIEYU8iUEXJRKc55Wtwf/luRH2Fu5LUhkFHdWBrb5KbRZ56qnkadZ6zp4n+aAwv
	t09dYxIpuOxM7f/5z9aXwSTiFtCkDn2chd71pSRSVHsJD4ofwHirGLm0Q7rCcaNg9ivtnGIGTK8
	7cFUOuhXUW1T6HQPV1ZHRJmTm59ywTxbtR/wThqGmImzzOaPMU+k46jMng77CrnAClMpza+KS4w
	Ab2EjbLDmoVhrdzr077+aQymdNdZqGZG6VqoJIuaDlAAgtJpX+35brMIGxRYkRh3gUOe2Tc5sYZ
	hAfrjrWHJAkU0nPY1u4=
X-Received: by 2002:a05:6102:292a:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7cb377f7d31mr4406638137.32.1792057104242;
        Thu, 15 Oct 2026 02:38:24 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003d37009sm12275672241.2.2026.10.15.02.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:38:23 -0700 (PDT)
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
Subject: [PATCH v1 1/7] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl to freeze sessions early
Date: Thu, 15 Oct 2026 05:38:10 -0400
Message-ID: <20261015093816.2438942-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
References: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/liveupdate.h       |  3 +-
 include/uapi/linux/liveupdate.h  | 25 +++++++++++++++
 kernel/liveupdate/luo_file.c     | 33 +++++++++++---------
 kernel/liveupdate/luo_internal.h |  3 ++
 kernel/liveupdate/luo_session.c  | 52 +++++++++++++++++++++++++++++---
 mm/memfd_luo.c                   |  5 +--
 6 files changed, 99 insertions(+), 22 deletions(-)

diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index 63ea5417de849..885ec0bbc4b8c 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -57,7 +57,8 @@ struct liveupdate_file_op_args {
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
index 4043d40387125..1644c502521e0 100644
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
+ * Freezes the session early from userspace before the reboot kexec phase.
+ *
+ * When this ioctl is called, the kernel executes the .freeze() callback on all
+ * preserved files in the session and serializes their metadata. Once frozen,
+ * no further files can be preserved in the session.
+ *
+ * During the subsequent reboot kexec, this session is recognized as already
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
index c39f96961a85b..3c1c86ff14d69 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -31,9 +31,9 @@
  *   - unpreserve(): Cleans up any resources allocated by .preserve(), called
  *     if the preservation process is aborted before the reboot (i.e. session is
  *     closed).
- *   - freeze(): A final pre-reboot opportunity to prepare the state for kexec.
- *     We are already in reboot syscall, and therefore userspace cannot mutate
- *     the file anymore.
+ *   - freeze(): Prepares the final state for kexec. Invoked either early via
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
@@ -422,11 +423,11 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
 /**
  * luo_file_freeze - Freezes all preserved files and serializes their metadata.
  * @file_set:     The file_set whose files are to be frozen.
- * @file_set_ser: Where to put the serialized file_set.
+ * @file_set_ser: Where to put the serialized file_set, or %NULL if freezing early.
  *
- * This function is called from the reboot() syscall path, just before the
- * kernel transitions to the new image via kexec. Its purpose is to perform the
- * final preparation and serialization of all preserved files in the file_set.
+ * This function is called from the reboot() syscall path or from
+ * LIVEUPDATE_SESSION_FREEZE. Its purpose is to perform the preparation and
+ * serialization of all preserved files in the file_set.
  *
  * It iterates through each preserved file in FIFO order (the order of
  * preservation) and performs two main actions:
@@ -449,7 +450,7 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
  * running state. The function then returns an error, causing the reboot()
  * syscall to fail.
  *
- * Context: Called only from the liveupdate_reboot() path.
+ * Context: Called from the liveupdate_reboot() path or LIVEUPDATE_SESSION_FREEZE.
  * Return: 0 on success, or a negative errno on failure.
  */
 int luo_file_freeze(struct luo_file_set *file_set,
@@ -487,8 +488,10 @@ int luo_file_freeze(struct luo_file_set *file_set,
 		file_ser->token = luo_file->token;
 	}
 
-	file_set_ser->count = file_set->count;
-	file_set_ser->files = kho_block_set_head_pa(&file_set->block_set);
+	if (file_set_ser) {
+		file_set_ser->count = file_set->count;
+		file_set_ser->files = kho_block_set_head_pa(&file_set->block_set);
+	}
 
 	return 0;
 
@@ -501,7 +504,7 @@ int luo_file_freeze(struct luo_file_set *file_set,
 /**
  * luo_file_unfreeze - Unfreezes all files in a file_set and clear serialization
  * @file_set:     The file_set whose files are to be unfrozen.
- * @file_set_ser: Serialized file_set.
+ * @file_set_ser: Serialized file_set, or %NULL if not serialized yet.
  *
  * This function rolls back the state of all files in a file_set after the
  * freeze phase has begun but must be aborted. It is the counterpart to
@@ -512,7 +515,8 @@ int luo_file_freeze(struct luo_file_set *file_set,
  * their respective .unfreeze() handler callbacks.
  *
  * Context: This is called when the live update is aborted during
- *          the reboot() syscall, after luo_file_freeze() has been called.
+ *          the reboot() syscall, after luo_file_freeze() has been called,
+ *          or when an early-frozen session is released before kexec.
  */
 void luo_file_unfreeze(struct luo_file_set *file_set,
 		       struct luo_file_set_ser *file_set_ser)
@@ -521,7 +525,8 @@ void luo_file_unfreeze(struct luo_file_set *file_set,
 		return;
 
 	__luo_file_unfreeze(file_set, NULL);
-	memset(file_set_ser, 0, sizeof(*file_set_ser));
+	if (file_set_ser)
+		memset(file_set_ser, 0, sizeof(*file_set_ser));
 }
 
 /**
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 64879ffe73781..b42369c3b1f30 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -64,6 +64,8 @@ struct luo_file_set {
  *              previous kernel) sessions.
  * @retrieved:  A boolean flag indicating whether this session has been
  *              retrieved by a consumer in the new kernel.
+ * @frozen:     A boolean flag indicating whether this session has been
+ *              frozen early from userspace.
  * @file_set:   A set of files that belong to this session.
  * @mutex:      protects fields in the luo_session.
  */
@@ -71,6 +73,7 @@ struct luo_session {
 	char name[LIVEUPDATE_SESSION_NAME_LENGTH];
 	struct list_head list;
 	bool retrieved;
+	bool frozen;
 	struct luo_file_set file_set;
 	struct mutex mutex;
 };
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index f48e9a4185f97..403906937bc0f 100644
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
+ * 2.  Freeze / Serialization: Sessions may be frozen early from userspace
+ *     via `LIVEUPDATE_SESSION_FREEZE`. When the `reboot(LINUX_REBOOT_CMD_KEXEC)`
+ *     syscall is made, `luo_session_serialize()` is called to freeze any
+ *     remaining active sessions and write all session metadata into a memory
+ *     area preserved by KHO.
  *
  * 3.  Deserialization (in new kernel): After kexec, `luo_session_deserialize()`
  *     runs, reading the serialized data and creating a list of `struct
@@ -222,6 +223,10 @@ static void luo_session_unfreeze_one(struct luo_session *session,
 				     struct luo_session_ser *ser)
 {
 	guard(mutex)(&session->mutex);
+	if (session->frozen) {
+		memset(&ser->file_set_ser, 0, sizeof(ser->file_set_ser));
+		return;
+	}
 	luo_file_unfreeze(&session->file_set, &ser->file_set_ser);
 }
 
@@ -229,6 +234,12 @@ static int luo_session_freeze_one(struct luo_session *session,
 				  struct luo_session_ser *ser)
 {
 	guard(mutex)(&session->mutex);
+	if (session->frozen) {
+		ser->file_set_ser.count = session->file_set.count;
+		ser->file_set_ser.files =
+			kho_block_set_head_pa(&session->file_set.block_set);
+		return 0;
+	}
 	return luo_file_freeze(&session->file_set, &ser->file_set_ser);
 }
 
@@ -249,8 +260,11 @@ static int luo_session_release(struct inode *inodep, struct file *filep)
 		}
 		sh = &luo_session_global.incoming;
 	} else {
-		scoped_guard(mutex, &session->mutex)
+		scoped_guard(mutex, &session->mutex) {
+			if (session->frozen)
+				luo_file_unfreeze(&session->file_set, NULL);
 			luo_file_unpreserve_files(&session->file_set);
+		}
 		sh = &luo_session_global.outgoing;
 	}
 
@@ -267,6 +281,9 @@ static int luo_session_preserve_fd(struct luo_session *session,
 	int err;
 
 	guard(mutex)(&session->mutex);
+	if (session->frozen)
+		return -EBUSY;
+
 	err = luo_preserve_file(&session->file_set, argp->token, argp->fd);
 	if (err)
 		return err;
@@ -340,11 +357,34 @@ static int luo_session_get_name(struct luo_session *session,
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
+	if (session->frozen)
+		return -EBUSY;
+
+	err = luo_file_freeze(&session->file_set, NULL);
+	if (err)
+		return err;
+
+	session->frozen = true;
+
+	return luo_ucmd_respond(ucmd, sizeof(*argp));
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
@@ -382,6 +422,8 @@ static const struct luo_ioctl_op luo_session_ioctl_ops[] = {
 		 struct liveupdate_session_retrieve_fd, token, LUO_IOCTL_INCOMING),
 	IOCTL_OP(LIVEUPDATE_SESSION_GET_NAME, luo_session_get_name,
 		 struct liveupdate_session_get_name, name, LUO_IOCTL_ALL),
+	IOCTL_OP(LIVEUPDATE_SESSION_FREEZE, luo_session_freeze,
+		 struct liveupdate_session_freeze, reserved, LUO_IOCTL_OUTGOING),
 };
 
 static bool luo_ioctl_type_valid(struct luo_session *session,
diff --git a/mm/memfd_luo.c b/mm/memfd_luo.c
index 59de210bee5f9..26929495786e0 100644
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
2.56.0.385.gd3acb90ef8-goog

