Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF233382F4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130313; cv=none; b=Ty4CwGdStVEa1eBjan+BijrUg9f7Gd0vvSZZji637dIig0vSS6Zh8ozelmrNN1LvoONBIm1meF46YU6Ip7HhqOHW8r+JSRN/E/xe+4eoz+H+wKRVOck1Dlolu3QhTIR1Mu6htz+beNz9FDi6fqFpp/0/LTY09Ngvo6DNVd/21KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130313; c=relaxed/simple;
	bh=jy8mgvmzpGKOFzyvPOZqGWMmRJiQ3s6hVheMypI3Uaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kJ0IxK4iscV9A9kIc/iKKf4DjJsy0Jv1085306Dg1sE21lDZPCk9YOJb7RZISm+OD8fE0CHVDXX7XLDEeAtfJUZRHjshrPwBD8YNcUgLwjszwv7oYbyAj58//YiK7iaTtAXOHQ5GvW7PDi3L1prD1PPcNaHJaUPMbLucPoWzovU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0+ujz9p; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0+ujz9p"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76ec504so3723821cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790130310; x=1790735110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CLvQRDhNdQ+386SmPeBLxsAnS2o1lMXmcOlmjU9lVHU=;
        b=M0+ujz9peXktUF5fY7twDXI6jge3I/CmgUx+tJPkhUR8BBlWiWCJvXKa2cS2f3DSPP
         L+tW77/W8D774bvrcqXTpwevukctElp2h0dxA14wUOrLkfvVE0rlCfsZRg0muKjv5MCh
         /JmQf2Hmdq1XuBrte5fWSy09gj13r0CWVFYbvkJQw4JPeGKOzEwczmQK50vAK+NhPIyf
         DDFpS/2lHVQUD0nY3nJSPkOrxv+ZKU1Z4j25q8F6bP7vt9wK2WmdviJmRdNn6Nve56rf
         iMXyh8inM6aHqy1n5zfk8DNa+NMW3PfbpPFRWGZOJNboyWbh9F2jogPday2lXADGFSvp
         p7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130310; x=1790735110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLvQRDhNdQ+386SmPeBLxsAnS2o1lMXmcOlmjU9lVHU=;
        b=ScLfAbtXASVU8XTnTGcapwBVeb7KGYqTs/aXTdPbbOfNbj46LIuA+UJcQlsgeoVuq2
         Xkk58/cK3+zOX2g2gm9tpZpF7rB1IL4PlEwT3tur3wPheAcGMfZ4K9jpeYmjzdJjbUB/
         HoomISFvoSAbhOlDPE7mLL7yTa0uRZ6mSyYi8nA3muA8cSTEXeUgw5tQkogf9UCZOYXe
         LWFtUuxGbBXuZmXtUKZFRYVo2Gg1J4Rl7TGL/7EMacPyPokVFUGN5qbiFH4rwRNstCFe
         +Vsy4x7rjs1BRRVFp0ly/CokdP+yrbN4rjjdhfGqJPS8Rqmqa2cZjJAI0sWcsOR+o9vw
         eQhA==
X-Forwarded-Encrypted: i=1; AKwUvBwC3wEHF6HlaTzABoS/DlafXfIFCzWl3GM99kSFOO7fMPybAmvHO5vQrOBw/yapWA+ClWqhm5pT3pfZBDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n+XyIrKXr4GTeCgZCyjIIvQo/ruNxoefpwHIzblLf7gKpYtFSe
	BMk4SPGMyIE97ZEh6aqKF7MM+Vtf5NHj3csbvu8ogyyEeNTdWaLz/Gl/
X-Gm-Gg: AYBFou2bqVrToBR1mKZ/ywVxdtlpfqmIMe5Sk7U3HPwKnijPa8r6n4RdnJNp52HOJb2
	52A4UlPyE+1YdPMj7x/v1bCubqPZrCAf/XrazCdVjFAn4fnd3x1W21j8xvEl3lC9FaALirs9qXn
	Rgu1woBrGkz1Sx0bkdIyboVl5z95fNBb/eD3q3GwfRJ5oQ2Dj6WfnTru/xLcMZ52JYsyr1WH5te
	hkYTy6X8Vd9IR3rcqlgHKDx5LwHS3KxfpSDWQSdeo3Wf9UT58r4o3Y1jT6yPFv76pA/5Gs26qm1
	R7fqguscx0ouW8kZ49Hj0PKVZt2oOAPqUQDlf+7D7qp1mDIM6CIwkrhFL8Istw5cz0HrTqXSRr7
	31YdWpBTnMHy5IXZaJazZN9C5R5bUPS1GlY0nh+uFQFAmxWYOeeaXtLa1Pa9v1+iDD2f1qankWl
	2N289JZ7Bt3F/wsBPiDaDGpuo0PJOYtNW/OP9dJnAzBX0vs8zN33DmMJKW3gRqvzTjcLmrfg==
X-Received: by 2002:a05:620a:17a0:b0:93b:e9db:1bab with SMTP id af79cd13be357-93c251efb88mr212666485a.56.1790130310310;
        Tue, 22 Sep 2026 19:25:10 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c24823976sm124500985a.13.2026.09.22.19.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:25:09 -0700 (PDT)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	linux-fsdevel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [PATCH v2] rust: file: handle fd table teardown in file descriptor APIs
Date: Tue, 22 Sep 2026 22:23:39 -0400
Message-ID: <20260923022339.3340694-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several Rust file descriptor APIs rely on `current->files` being
available. However, `exit_files()` clears it while execution may still
continue on the same task.

This affects `LocalFile::fget()` and the
`FileDescriptorReservation` operations that call
`get_unused_fd_flags()`, `fd_install()`, and `put_unused_fd()`.
`FileDescriptorReservation` cannot cross task boundaries, but remaining
on the same task does not guarantee that `current->files` is still
available when these operations are performed.

Guard the affected operations against a missing `current->files`.
`LocalFile::fget()` returns `EBADF` and
`FileDescriptorReservation::get_unused_fd_flags()` returns `EMFILE`.
For `fd_install()`, warn and abandon the reservation when the fd table
is already gone. In the drop path, skip `put_unused_fd()` after the fd
table has been torn down.

This prevents NULL dereferences through these safe Rust APIs after
`exit_files()`.

Fixes: 851849824bb5 ("rust: file: add Rust abstraction for `struct file`")
Fixes: 5da9857b127e ("rust: file: add `FileDescriptorReservation`")
Closes: https://github.com/Rust-for-Linux/linux/issues/1256
Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
Changes in v2:
- Use `warn_on!()` for `FileDescriptorReservation::fd_install()` and
  remove the warning from the drop path, following feedback from Gary Guo.
- Link to v1: https://lore.kernel.org/rust-for-linux/20260920200154.1194983-1-georgeandrout13@gmail.com/
---
 rust/kernel/fs/file.rs | 64 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 9 deletions(-)

diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 23ee689bd240..8b5b5ec4cd04 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -260,7 +260,17 @@ impl LocalFile {
     /// [`assume_no_fdget_pos`]: LocalFile::assume_no_fdget_pos
     #[inline]
     pub fn fget(fd: u32) -> Result<ARef<LocalFile>, BadFdError> {
-        // SAFETY: FFI call, there are no requirements on `fd`.
+        let current = crate::current!();
+
+        // SAFETY: `current` points to the currently executing task, so it is
+        // valid to read its `files` pointer. The pointer may be null during
+        // task teardown.
+        if unsafe { (*current.as_ptr()).files.is_null() } {
+            return Err(BadFdError);
+        }
+
+        // SAFETY: There are no requirements on `fd`. We checked above that the
+        // current task still has a file descriptor table, which `fget` accesses.
         let ptr = ptr::NonNull::new(unsafe { bindings::fget(fd) }).ok_or(BadFdError)?;
 
         // SAFETY: `bindings::fget` created a refcount, and we pass ownership of it to the `ARef`.
@@ -403,7 +413,18 @@ impl FileDescriptorReservation {
     /// Creates a new file descriptor reservation.
     #[inline]
     pub fn get_unused_fd_flags(flags: u32) -> Result<Self> {
-        // SAFETY: FFI call, there are no safety requirements on `flags`.
+        let current = crate::current!();
+
+        // SAFETY: `current` points to the currently executing task, so it is
+        // valid to read its `files` pointer. The pointer may be null during
+        // task teardown.
+        if unsafe { (*current.as_ptr()).files.is_null() } {
+            return Err(EMFILE);
+        }
+
+        // SAFETY: There are no safety requirements on `flags`. We checked above
+        // that the current task still has a file descriptor table, which
+        // `get_unused_fd_flags` accesses.
         let fd: i32 = unsafe { bindings::get_unused_fd_flags(flags) };
         to_result(fd)?;
 
@@ -421,13 +442,26 @@ pub fn reserved_fd(&self) -> u32 {
 
     /// Commits the reservation.
     ///
-    /// The previously reserved file descriptor is bound to `file`. This method consumes the
-    /// [`FileDescriptorReservation`], so it will not be usable after this call.
+    /// The previously reserved file descriptor is bound to `file`. If the current task no longer
+    /// has a file descriptor table, the reservation is abandoned instead. This method consumes the
+    /// [`FileDescriptorReservation`] in either case.
     #[inline]
     pub fn fd_install(self, file: ARef<File>) {
-        // SAFETY: `self.fd` was previously returned by `get_unused_fd_flags`. We have not yet used
-        // the fd, so it is still valid, and `current` still refers to the same task, as this type
-        // cannot be moved across task boundaries.
+        let current = crate::current!();
+
+        // SAFETY: `current` points to the currently executing task, so it is
+        // valid to read its `files` pointer. The pointer may be null during
+        // task teardown.
+        if crate::warn_on!(unsafe { (*current.as_ptr()).files.is_null() }) {
+            // `put_unused_fd` also requires `current->files` to be valid, so do not run
+            // the reservation's destructor after the current task has lost its fd table.
+            core::mem::forget(self);
+            return;
+        }
+
+        // SAFETY: `self.fd` was previously returned by `get_unused_fd_flags` and has not yet been
+        // used. This type cannot be moved across task boundaries, so `current` still refers to the
+        // same task, and we checked above that it still has an fd table.
         //
         // Furthermore, the file pointer is guaranteed to own a refcount by its type invariants,
         // and we take ownership of that refcount by not running the destructor below.
@@ -446,9 +480,21 @@ pub fn fd_install(self, file: ARef<File>) {
 impl Drop for FileDescriptorReservation {
     #[inline]
     fn drop(&mut self) {
+        let current = crate::current!();
+
+        // SAFETY: `current` points to the currently executing task, so it is
+        // valid to read its `files` pointer. The pointer may be null during
+        // task teardown.
+        if unsafe { (*current.as_ptr()).files.is_null() } {
+            // `put_unused_fd` uses `current->files`, so it cannot be called
+            // after the current task has torn down its fd table.
+            return;
+        }
+
         // SAFETY: By the type invariants of this type, `self.fd` was previously returned by
-        // `get_unused_fd_flags`. We have not yet used the fd, so it is still valid, and `current`
-        // still refers to the same task, as this type cannot be moved across task boundaries.
+        // `get_unused_fd_flags` and has not yet been used. This type cannot be moved across task
+        // boundaries, so `current` still refers to the same task, and we checked above that it
+        // still has an fd table.
         unsafe { bindings::put_unused_fd(self.fd) };
     }
 }
-- 
2.47.3

