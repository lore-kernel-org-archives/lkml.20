Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455104;
	b=qrprxY2mERG/cwlHgdhJe1HvFNg1KuP8t1VGsc2Tre24U2uHrc4dVDn4sDDEh+kvgoPe
	 CoRs+RTS1bw8vuXvYXp8YDM8sVBuUhsXwFvOSg/+FR3BpIt6HEQJzxTXArxBzqBXvQR1b
	 wjjO6EcPuR9bQMVM9FCBo3+kzbU9PrOGoc5l+PQe0+v8hElpgsJelhtSL3IImEshTTLOy
	 f/qmgKDjGY7If7m77oZ6cSUeiqYkjnCS+Ym+3jVMFBEGZG2yHGQlmLWZ6W4gaPZnl2ziK
	 ereIvKLh+LPTp5V2yuPDfZICReCLDgNB67AjrZvqLKN5/bjxq/K0oiMUwQeLPW6g4RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r6yDLDl+iK8qPv1E0IKZvzwtLqZz4a1evqYWEyMtSvQ=;
	b=Xof/aybn+mhfaKrudKquL7aKBTc7kZLuhCKx6a7fRNX2DjZTtYksza/IvEWwHRmg8+Pe
	 dmEPRXMRaYUjKhKMe1BDcuRoOSS1XlHcJX2hE1wEuPMt3+U0Fj5uZ7dxOCljip3lEmZy6
	 NdiO9tCBk1slKsciqmj1/UYC32L4YIYEUMyLORpLr5S5q+RzuDA16Xkgyv1JGr858SsJy
	 4U1WnTMFuqxU5l5dZwvYPZYnGIWz9OrIcDyPj+2qBcoBzy/IRPKxavWrh1nS3WKdWVrZs
	 MtlylR3Y97URa5pgYWYNc/OwfPhuSPihTvHtGxT5XIfAqEBvalxi9t4m9TVQsBZCLaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q8BojHp7;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A87F60A262A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A87F60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q8BojHp7
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14394530ec6so1709728c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792455103; x=1793059903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6yDLDl+iK8qPv1E0IKZvzwtLqZz4a1evqYWEyMtSvQ=;
        b=q8BojHp7z5B8NFoRxhhr62XsJS5PJkFsakYYx+lZJNLbFvtIZr2pHKAmZA6k4QaazI
         gKfPllateKxOnT1HJjXxfJURMrn+YUE2A3nfO+NOxN6ekFHbm+qnTBmrCT6UtjSdAyIT
         zIixxvzFl065A2XA2FuYrdqCd5tl2ZtgJXyIG7Q5PtSmftiHRjYF8OyruU5fqOOVSp16
         h1NRP3EXisD39cUDyqLRpZp1inTcICrRDlIlKNaRjbodaS9PxzEiAzVHXEHsPjhJPFvS
         d2z6HREdcIwBIZ3qHe6PnCNsC85LbH2IAYflCSoWyE7P4l7nfARqcOJ0RhTosNiBI8pE
         Bq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455103; x=1793059903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r6yDLDl+iK8qPv1E0IKZvzwtLqZz4a1evqYWEyMtSvQ=;
        b=A3a4MvqykYQ39Pb06TYnlxxiKjImKL7Wq3JDxksI7xjoU+bFs1jYZ5FizlyYEqoo05
         O6mUbv8iCKa1h1dquOIh4bW4n7sSKYSJtIEz7YkWMl57HFitCZOGIKnWBfC4zb8KzWh8
         +dxoEvGwpvG/U/P0e6VWOzlQSjG+OrEGnpjbN7aqDCVQp7S+U4VOFNOlePrA6VoaR3fE
         8vTuLUIe5m01nH9FZiqOJ6Q4cPpdbC+70lA9rlFRtKydWkJHY78mn+iFc2/ldyoSm/wo
         2VVUkVEhC1X/8sg8hJ/qG0Zo/KzqPZxGwmt+QMadltJKoe6s106jYo0/cCyNLrZVsrgL
         mU4Q==
X-Gm-Message-State: AFq9FYLvuDtoRiaYACLFqxGh47UW1hNiYXxrfgFIYIjaECltY8rBNwHA
	72GEhNwbNvZ94cTlipRWVc6VqIPNCgHJz5+wCJN2xTrtQgOP0hFFx+12oEP0Jg==
X-Gm-Gg: AYBFou12MTZJfh4O5Zy+WHOglrXAiE2pHCbZCzGIivjPbzoLb9LCwTJz8t2vWW2AaaF
	AX7atssEJT95mkot83paoGLVtRujR6hCoDtBnzFnQu/0zchDsavCTy0z+Lehsmey5eQqLjFj/NL
	9gS0HakrKKSckh55ml/WEyiNmUBXKVZSNJyR9eF9Miw7QgIHos7lmlbU9rqw5TSNmmn02n5/Scx
	zAiIfoP9gMD6v0202Cv7wp8m4aHm8Gxfa3UlwXpTXBjJAzuGyqquVzeDFG+b4MDqdL7IIic5HSc
	4nY/zyrDefrtN8lLd1XVc97T5t7N9UBMf4xhoDDPuROOSZQ4ydiIJ7nIQGrZIihDUM1HR6F7ujK
	xa4w3/QwElwP3alkaH4Bor+flNmRsyRxE/5UlaAhCe6ejuvPx/Oj9vBrElPvF1C5FuidPp43nl0
	cVwQfdFUyxtccN4yu52i5UN04h/LlglwrzTPqe1D5DWTFovlqw/P8oAKDKDusQb5YVmXYJ5SCno
	1CgeHB02Z82pHh+f/S7yGv3CB/6aF6y+g1rPVphpUvKoiCQeQuVIevmj4qABbe7eg==
X-Received: by 2002:a05:701b:2807:b0:143:5c63:23bb with SMTP id a92af1059eb24-185119e3940mr12464863c88.11.1792455103365;
        Mon, 19 Oct 2026 17:11:43 -0700 (PDT)
Received: from pop-os.tail4adac7.ts.net ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37258981c88.0.2026.10.19.17.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:11:42 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@amacapital.net>,
	Kees Cook <kees@kernel.org>,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>
Subject: [RFC PATCH 9/9] Documentation: seccomp: describe system call result records
Date: Mon, 19 Oct 2026 17:11:24 -0700
Message-ID: <20261020001124.974063-10-xiyou.wangcong@gmail.com>
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

Document SECCOMP_USER_NOTIF_FLAG_RESULT and SECCOMP_USER_NOTIF_FLAG_HOLD:
the record they produce, what its return value means after a signal,
what the fork family adds to it, how to open a pidfd for a new task from
it, and how a held result is reported and answered.

Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 .../userspace-api/seccomp_filter.rst          | 117 +++++++++++++++++-
 1 file changed, 116 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/seccomp_filter.rst b/Documentation/userspace-api/seccomp_filter.rst
index cff0fa7f3175..a4c9fcb4d204 100644
--- a/Documentation/userspace-api/seccomp_filter.rst
+++ b/Documentation/userspace-api/seccomp_filter.rst
@@ -224,7 +224,10 @@ The interface for a seccomp notification fd consists of two structures:
         __u64 id;
         __u32 pid;
         __u32 flags;
-        struct seccomp_data data;
+        union {
+            struct seccomp_data data;
+            struct seccomp_notif_result result;
+        };
     };
 
     struct seccomp_notif_resp {
@@ -281,6 +284,118 @@ process will ignore non-fatal signals until the response is sent. Signals that
 are sent prior to the notification being received by userspace are handled
 normally.
 
+System call results
+-------------------
+
+A supervisor that continues a system call can ask how the call turned out by
+adding ``SECCOMP_USER_NOTIF_FLAG_RESULT`` to
+``SECCOMP_USER_NOTIF_FLAG_CONTINUE`` in its response. The set of supported
+system calls may grow; so far it is ``fork()``, ``vfork()``, ``clone()`` and
+``clone3()``. The flag is refused with ``EINVAL`` for any other system call,
+for system call conventions the kernel cannot classify, and by kernels that
+do not support it, so trying it is a reliable probe.
+
+The outcome is reported once, as a notification with
+``SECCOMP_NOTIF_FLAG_RESULT`` set in ``flags`` and the same ``id`` as the
+continued notification. It is a record, not a request: it is not answered,
+and the task does not wait for it to be read. It is queued by the time the
+task returns to user space, so it arrives before the task's next
+notification. Its ``pid`` is the task that made the call, and ``result``
+replaces ``data``:
+
+.. code-block:: c
+
+    struct seccomp_notif_result {
+        __s32 nr;
+        __u32 arch;
+        __s64 val;
+        __u32 child_pid;
+        __u32 __reserved;
+        __u64 child_ino;
+    };
+
+``nr`` and ``arch`` identify the system call. ``val`` is its return value as
+the task saw it, including any change made at a ptrace syscall exit stop. A
+negative value is an error number:
+
+- One of the kernel internal ``-ERESTART*`` values (-512 to -516) means the
+  call did not complete because of a signal. It is then either restarted,
+  and passes through the filter again as a new notification, or fails with
+  ``EINTR``.
+- If a signal interrupted the notification after the response was sent, the
+  call never ran, and the record reports the error it fails with.
+- If the task exits before the call returns, ``val`` is ``-ESRCH``.
+
+Fork results
+~~~~~~~~~~~~
+
+A successful fork also fills in ``child_pid``, the new task in the listener's
+pid namespace, and ``child_ino``, its pidfs inode number.
+``SECCOMP_NOTIF_FLAG_THREAD`` is set if the new task is a thread. Both fields
+are zero if the fork failed.
+
+The record of a successful fork is queued before the new task first runs, and
+records are received before any pending notification, so the supervisor
+always hears of a task before it hears from it. The new task inherits the
+filter, so its own forks are reported the same way, and so on down the tree.
+
+The task may have run, exited and been reaped by the time the record is read,
+so its pid may already name another task. ``child_ino`` is never reused:
+opening a pidfd by it either yields exactly the new task or fails, in which
+case the task has already exited:
+
+.. code-block:: c
+
+    struct {
+        unsigned int handle_bytes;
+        int handle_type;
+        __u64 ino;
+    } fh = { sizeof(__u64), FILEID_KERNFS /* 0xfe */, rec.result.child_ino };
+
+    pidfd = open_by_handle_at(FD_PIDFS_ROOT, (struct file_handle *)&fh, 0);
+
+This needs no privileges. Together with the pidfd's exit notification it lets
+a supervisor track every task below it, including one that is killed before
+it makes a single notified system call.
+
+Holding a result
+~~~~~~~~~~~~~~~~
+
+A record is one-way: the task does not wait for it to be read. Where the
+supervisor must act on a result before the task goes on, the response can
+carry ``SECCOMP_USER_NOTIF_FLAG_HOLD`` together with
+``SECCOMP_USER_NOTIF_FLAG_RESULT`` and ``SECCOMP_USER_NOTIF_FLAG_CONTINUE``.
+It is supported for the same system calls as ``SECCOMP_USER_NOTIF_FLAG_RESULT``
+and refused with ``EINVAL`` for the others.
+
+The result is then reported as a held notification instead of a record:
+``flags`` has both ``SECCOMP_NOTIF_FLAG_RESULT`` and
+``SECCOMP_NOTIF_FLAG_HELD`` set, ``id`` is that of the continued
+notification, and ``result`` is filled in as above. The task does not return
+to user space until the held notification is answered, whether the call
+succeeded or failed.
+
+For the fork family, a successful fork is held before the new task is woken,
+so neither the parent nor the new task runs until the answer. This is for a
+supervisor that must know a new task before it executes anything at all, for
+example when tasks share memory and one could change another's arguments
+without a system call.
+
+A held notification is answered like any other, except:
+
+- The only accepted response is ``SECCOMP_USER_NOTIF_FLAG_CONTINUE`` with
+  ``val`` and ``error`` zero. Anything else fails with ``EINVAL``; the call
+  has completed and its result cannot be changed.
+- ``SECCOMP_IOCTL_NOTIF_ADDFD`` fails with ``EINVAL``.
+- ``SECCOMP_IOCTL_NOTIF_ID_VALID`` works as usual.
+
+The task waits killable, so non-fatal signals do not end the wait. If the task
+is killed before the supervisor received the held notification, it is turned
+into an ordinary record, so the supervisor still learns the result. A result
+reported because the task exits (``-ESRCH``) is never held. If the listener is
+closed, the task continues. For a fork, the new task is woken once the wait
+ends in every case.
+
 It is worth noting that ``struct seccomp_data`` contains the values of register
 arguments to the syscall, but does not contain pointers to memory. The task's
 memory is accessible to suitably privileged traces via ``ptrace()`` or
-- 
2.43.0

