Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558062D9EE4
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791736631; cv=none; b=ajGeYBGuuKrM86LLnZDIWaTqc2inSjlmW67wTBQcemL3WVtWJcayaFl6T0jFygkpfgp9G/wq8rkV0xLaJN3BHC4JIrfSB2mcE4b+jMXAtSOd/0D3v4bJtryRHhu1CjEr0d0KAlvA0z6mgO0FswnRS11/KD+ymajcmjx4tP2x0w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791736631; c=relaxed/simple;
	bh=jJ3z73ZCrJLjhnsh9iNOZbvrztVa1QjZsjEjooMk7Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FC5B+f4mIJym0QwGwvfyyG57pQ6PqfrjsYuQF6p0oWQtzaTjYyakjg3SED+9e+yxKtrySEfhpN5p1jFL1OgrZY8tR6eCX8NAG0UfDz1rgiINuwHeBQ8D4lBzg+bfnsIwRvzDHqoRa6fcxxThCbjvLEtp4LZxdFwyuOdz/PLetGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwUyWw5w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwUyWw5w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1831F0089B;
	Sun, 11 Oct 2026 16:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791736630;
	bh=Z52Sm+1W4cj7a1dZpDkyAG4zLFmtvtn7T8vr4O5evd4=;
	h=From:To:Cc:Subject:Date;
	b=mwUyWw5w/kPVgiw9drUdcDg60Ym6g9xa7o/d6x4IGRd2kRd1h90LgTcZZn1pLHarw
	 W1JwNYy2dYZ37mggP5WARh4hbPSHZ++MTQuF0XAUlRHN2j2uQIdCIPxlCO0mPedw91
	 lnFeiRyhfooRlxArmARMKgI0eObXocdkitMiM09xmrlshgBTyaG0som8j9VVtR+AcA
	 UwMd/LNNnEMHNc8C4NTnYae/x+eQzxLHBEw/Z56spbQQ9M4IzxNqJSUrXh/kEQ9B1D
	 MhDZYvsv/eibCm2EU9ceWzCvtZHMRSqMjFurS+NVgkFRXP70/9EfQd45nVN/96Rwsi
	 Wd5IsywRNhbMw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org,
	stable <stable@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 6.18.y] rust_binder: reschedule node refcount update on thread exit
Date: Sun, 11 Oct 2026 18:37:02 +0200
Message-ID: <20261011163702.48982-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Ryhl <aliceryhl@google.com>

commit 2a74ccd1bcc170e66525f34e9de8652b57e2cf3d upstream.

When a thread exits via BINDER_THREAD_EXIT, its pending work items are
cancelled. If a thread exits while holding a pending node refcount
increment (e.g. pushed as deferred work to that thread), the refcount
increment was previously dropped because Node::cancel() and
NodeWrapper::cancel() were no-ops.

Dropping the refcount update leaves the node's delivery state and count
state desynchronized, and userspace will not receive the notification,
which can cause the node to never be freed from the process's nodes tree
when all external references are dropped.

Fix this by implementing DeliverToRead::cancel() for Node and NodeWrapper
to move the pending refcount update to the process's work queue on thread
exit so another thread can deliver it to userspace.

Cc: stable <stable@kernel.org>
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Link: https://patch.msgid.link/20260903-binder-thread-exit-node-v1-1-be09ff14f6a4@google.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[ Dropped first argument in calls to `push_work()` to adjust to the
  existing form without mainline commit dbb17c9ea756 ("rust_binder: move
  (e)poll wait queue to Process"). - Miguel ]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 drivers/android/binder/node.rs         | 20 ++++++++++++---
 drivers/android/binder/node/wrapper.rs | 34 +++++++++++++++++++++++++-
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index b76ecff80f91..ee798e9d6c69 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -49,9 +49,9 @@
 ///   about to drop the weak reference, then the strong increment could be processed after the
 ///   other thread has already exited, which would be too late.
 ///
-/// Note that trying to create a `ListArc` to the node can succeed even if `has_normal_push` is
+/// Note that trying to create a `ListArc` to the node can succeed even if `has_pushed_node` is
 /// set. This is because another thread might just have popped the node from a todo list, but not
-/// yet called `do_work`. However, if `has_normal_push` is false, then creating a `ListArc` should
+/// yet called `do_work`. However, if `has_pushed_node` is false, then creating a `ListArc` should
 /// always succeed.
 ///
 /// Like the other fields in `NodeInner`, the delivery state is protected by the process lock.
@@ -725,7 +725,21 @@ fn do_work(
         self.do_work_locked(writer, owner_inner)
     }

-    fn cancel(self: DArc<Self>) {}
+    fn cancel(self: DArc<Self>) {
+        let _drop_outside_lock;
+        let mut owner_inner = self.owner.inner.lock();
+
+        // We only do something on BINDER_THREAD_EXIT, not process exit.
+        if owner_inner.is_dead {
+            return;
+        }
+
+        // If BINDER_THREAD_EXIT is invoked on a thread with a pending node refcount update, we
+        // should move ourselves to ensure the refcount update is still delivered.
+        if let Some(node) = ListArc::try_from_arc_borrow(self.as_arc_borrow()) {
+            _drop_outside_lock = owner_inner.push_work(node);
+        }
+    }

     fn should_sync_wakeup(&self) -> bool {
         false
diff --git a/drivers/android/binder/node/wrapper.rs b/drivers/android/binder/node/wrapper.rs
index 43294c050502..aeda07ff7218 100644
--- a/drivers/android/binder/node/wrapper.rs
+++ b/drivers/android/binder/node/wrapper.rs
@@ -57,7 +57,39 @@ fn do_work(
         node.do_work_locked(writer, owner_inner)
     }

-    fn cancel(self: DArc<Self>) {}
+    fn cancel(self: DArc<Self>) {
+        let _drop_outside_lock;
+        let node = &self.node;
+        let mut owner_inner = node.owner.inner.lock();
+
+        // We only do something on BINDER_THREAD_EXIT, not process exit.
+        if owner_inner.is_dead {
+            return;
+        }
+
+        // We transfer the responsibility of the node refcount update to the scheduled Node because
+        // NodeWrapper has no way to re-create the ListArc.
+        let inner = node.inner.access_mut(&mut owner_inner);
+
+        let ds = &mut inner.delivery_state;
+        assert!(ds.has_pushed_wrapper);
+        assert!(ds.has_strong_zero2one);
+        ds.has_pushed_wrapper = false;
+
+        // We are changing the state to one where the Node is the strong zero2one update instead of
+        // the wrapper.
+        ds.has_weak_zero2one = false;
+
+        if !ds.has_pushed_node {
+            if let Some(node2) = ListArc::try_from_arc_borrow(node.as_arc_borrow()) {
+                ds.has_pushed_node = true;
+                _drop_outside_lock = owner_inner.push_work(node2);
+            } else {
+                // This can't actually happen.
+                ds.has_strong_zero2one = false;
+            }
+        }
+    }

     fn should_sync_wakeup(&self) -> bool {
         false

base-commit: 17ad2612c11a748b50d32eefc681344b26fea946
--
2.56.0
