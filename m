Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8955D30568B
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791736592; cv=none; b=OwCUDgxgXcMgj3uQsa4VfkqG6/jJ4SkwJTX2Ru0q+1MWlBhYt4CnPNhzepLU8kSsT4mET/n7wBNzP+anAleckCda+Yij3MLKUoX2aiCjXEVM5jVGKNKGLCfBz766GyceCqD5CxyvRyVDZiqKYTw1jtecK0RAC0QsjHs8YjRXTkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791736592; c=relaxed/simple;
	bh=Z2zE7+uceOxC/OkP8965pQ7vrzvTPagSf4kgzblrB8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M0Jgo0voZlsg+RDwrZxUerVeHH6qSU7Mph+BYsTOGEeSuxHRHbGT79h0UHVzCXruGUGFs1fGQu0PVnoCx76LWtb2BpkqZ82bzRs61uxvMJo4soPxLjlc+i+CNdStVcLuJH2LvOsIXDfQlRcRnsHG7Q0Zb1QYWoMXfLqY/U2L3NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPqPuY/f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPqPuY/f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26EFD1F0089B;
	Sun, 11 Oct 2026 16:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791736591;
	bh=Eyv8MebIC9vZ/w17VnpjkwvWmqHiKDjoZWEy8PpXprQ=;
	h=From:To:Cc:Subject:Date;
	b=PPqPuY/fANilTWSu24VJE6BgM7ytxdXjj+iH8UT8DToTNy93VnusA1zSQL2y5oHDM
	 TrAaWKX9WADd872z31ywD/9TWQ1EZK51N4rNjhc4iD2F2TjDY9p7jZNL9HGySPAwJs
	 ncw8Y9BLO8dL/GKdDQ5/X90WBMPR9SuTEyGE2rVUjD3oxoJxpj9SiHdX+y6/K/TXSm
	 dy5VFN+7FArbdJWbLOI0vUiiAtKxNP4jJI2F4u5breqNyHPLdjcpLn/nOmMgRNgCNE
	 kjg2EaEjbBdDqMv/X2u3kCzJKPt85h8pb1D4wS1M4NgrQz08vhkJjrc8xT9zdZtpJj
	 MRc6UfJ0HmyQQ==
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
Subject: [PATCH 7.2.y] rust_binder: reschedule node refcount update on thread exit
Date: Sun, 11 Oct 2026 18:36:08 +0200
Message-ID: <20261011163608.48622-1-ojeda@kernel.org>
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
index c10148e9069f..8f7aa867ce68 100644
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
@@ -733,7 +733,21 @@ fn do_work(
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

base-commit: 7b20d05fd38de8e0be168956f6fd241d750c7d69
--
2.56.0
