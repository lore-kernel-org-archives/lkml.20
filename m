Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150665;
	b=EiSH/M5R4y14kFaM6Vg/OsCfNreOJHLNc22HpZurLXIWvn9MWoyMFnauKRIixq8Z0mUd
	 7JoyruqG+u9r3mDLVj50sVbYtQo2q+01BZMb6eoFlE3l9dohUBivIIFcl1YCey6gsT2HQ
	 qOivyNGh7qeTRO85jtaq+pZH1wKGD34JOUgFz8nHYs539ozTp5zzO9q37/oUufQvJ+dJd
	 eXhRK+sfkFS0SuQr/4FCi4cWyzBvPPEZKSyemjM6WsAb3C2JEh8XVJv1eAPFe3Na4F9Ha
	 uQqDpVkC/mMWu8IFs8oaZeTTyPZbS0zxdPMHx+UHxnvbw99+VkpGZTtcDk/GvZhPpWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:MIME-Version:X-Received:Date:
	 Message-ID:Subject:From:To:Cc:Content-Type;
	bh=buB+SNDrFBHZ1hWkragxqZalboFLs7Xvh8M5Rtl1Ros=;
	b=fJ/r4ld6lBnWF27AhFRUIOUPSJw3kBQpC6YhY3re1g9tqsf3ZRibFzxS0VNO8JLptIlC
	 1/B8wjQXl3c/oLfZK2/IBZW0yqlA2GA7TqgnuekkgkAoHkfYa/T9hkN8rgIyZrRnMX3ZF
	 aIWr0cJPZ8jErJ+etFtiSWn6QzHqe/xSPVKYERF8wgHFCy/jyMyPkSUNlLRotx/JnXByr
	 3FWI49alZspNsTtNIFB3VFCf6CyMlyVxhWckRbWEAgLtENf5lEguiNU5RQf2SgRfoEDT3
	 zssL8yrJzEZ0JWMy7wVSrJJs38s9XgFrVO7mpewlqvCjo6MCKEbp3N10wGT9R1fdY5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ivEusNDn;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6BF606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A6BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ivEusNDn
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so268843eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794150663; x=1794755463; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:date:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=buB+SNDrFBHZ1hWkragxqZalboFLs7Xvh8M5Rtl1Ros=;
        b=ivEusNDnrfqIuIdRaP8LtJxm21MMlK9JerEehVrvr2l+LMByoIthz3CTqnPVSKmHst
         P3I7EqnddEk+6FptXbBY6n9wempFctfTmhts5vhpLJyMO4qsa0OuKKvJgn3jX/f2bBsg
         uKoFB/hM+1U+qgdz2YOGHUGk0ztkMnoNCwzZNb5dDQTZoy8+MHiGHuCJ3xkdV1PueFHE
         NtWltJihFbVu4Fpu+c1UN+uAdmpwkB3iNet2K8IYk0N93Jo1WDwIXXQRlWzh9eBDDJ2U
         S91e1jFVV3PXSb2v8tpsbgH5Gha0DCByTapHQxre5goBohybPpKMAWHRVL7Fx3ktLZNq
         7YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150663; x=1794755463;
        h=content-type:cc:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=buB+SNDrFBHZ1hWkragxqZalboFLs7Xvh8M5Rtl1Ros=;
        b=qr0DXmUR7+BbLiAVMQzNgqfVEcrXj6XXk2/Nd0LnQir31z/fh92FXw22QrsX9+JUGd
         9sg294SoMNDU+c8YFDLgkNvqpzsA0ge4dl0inhEbJofhmF7O2hvqo28qcXqoAe7qhmYU
         7AT6vxMLLf9BMxcdxuVC6QToHAKP4MkmYoeRY8jKPTMkKJqzgOBG2LjcG9+vHs7pXwr0
         FMsNdWXVlyU8fk1KL43IN9qfBSwzuPZyGVVu93uv4yleJlbIVv+qRBKZynr96gL9ozWt
         MBcvUMhgdM2Pl8bx0VDjT9WG8R1ToqVFZ93ZlJxusc4AS6VzGwWlzfprp6fOFc/AEATF
         nkpQ==
X-Forwarded-Encrypted: i=1; AL+hErGjo0HkpKh/hlNJw6RMkuwKnn7Ohc2kxCdT4FarpGA6BmlMO1KkFz4gfRMv2lxP5kG8Q/q/czMlgfAMhuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+R7YgCSIrv42PIBWDeecql/U+diAQfzwdMPU8v+h7fEOGg0f7g
	gqQPCn9WIUGiU+3iIRHtQNgpeJzf6iuWVsdm6Ks2JYAX9wrtNZ8wkz2QhbiWEeN4Pb0mGoZqGMp
	MPTKIvMlO2aUe2y1JgddJ4WFfUCYTFQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: from dybpg4.prod.google.com ([2002:a05:7301:4144:b0:36c:a067:eca4])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:730a:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-37258c2886bmr2826202eec.38.1794150663059;
 Sun, 08 Nov 2026 07:11:03 -0800 (PST)
Date: Sun, 08 Nov 2026 15:11:01 GMT
Message-ID: <18e61a85b0d13e9c.3137322e32332e3235332e313736.9c152.0000sendgmr@google.com>
Subject: [PATCH 1/2] rust_binder: reject sync transaction with pending sync work
From: Chris Wiseman <chriswiseman@google.com>
To: Alice Ryhl <aliceryhl@google.com>, Carlos Llamas <cmllamas@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

When a thread replies to a transaction with TF_DEFER_COMPLETE, its
BR_TRANSACTION_COMPLETE work item stays in inner.work_list while the
next blocking read waits in Process.ready_threads. A new incoming
synchronous transaction can then be queued behind that deferred
completion in inner.work_list. If the thread's read buffer only has
room for the deferred completion, the ioctl returns to userspace with
inner.current_transaction cleared while the incoming synchronous
transaction remains queued in inner.work_list.

If that thread sends an outgoing synchronous BC_TRANSACTION before
draining its work queue, Thread::transaction_inner sets
inner.current_transaction to Some(t_out), and the read phase of the
same BINDER_WRITE_READ ioctl pops the pending incoming transaction and
overwrites inner.current_transaction with Some(t_in). This orphans
t_out from the sender's transaction stack so
Thread::unwind_transaction_stack aborts on exit, leaving a permanent
Arc<Thread> <-> DArc<Transaction> reference cycle that pins both
Arc<Process> instances and their mapped ShrinkablePageRange pages
after the processes exit.

Resolve the TODO in Thread::transaction_inner by rejecting outgoing
synchronous transactions with EINVAL when inner.work_list contains any
item where DeliverToRead::should_sync_wakeup() is true. Checking
should_sync_wakeup() matches C Binder's BINDER_WORK_TRANSACTION check
and ignores Node or NodeWrapper BR_INCREFS/BR_ACQUIRE items pushed
onto inner.work_list when Transaction::new translates flat binder
objects.

Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Fixes: 8eb05e8e47f1 ("rust_binder: add TF_DEFER_COMPLETE flag for avoiding userspace roundtrip")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Wiseman <chriswiseman@google.com>
---
 drivers/android/binder/thread.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index f5965e838a96..3ca5c95695e4 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1393,8 +1393,6 @@ fn transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResu
         info.to_pid = node_ref.node.owner.task.pid();
         info.to_node_debug_id = node_ref.node.debug_id;
         security::binder_transaction(&self.process.cred, &node_ref.node.owner.cred)?;
-        // TODO: We need to ensure that there isn't a pending transaction in the work queue. How
-        // could this happen?
         let top = self.top_of_transaction_stack()?;
         let list_completion = DTRWrap::arc_try_new(DeliverCode::new(
             BR_TRANSACTION_COMPLETE,
@@ -1407,7 +1405,9 @@ fn transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResu
         // it with the new transaction.
         {
             let mut inner = self.inner.lock();
-            if !transaction.is_stacked_on(&inner.current_transaction) {
+            if inner.work_list.iter().any(|w| w.should_sync_wakeup())
+                || !transaction.is_stacked_on(&inner.current_transaction)
+            {
                 binder_debug!(UserError, "got new transaction with bad transaction stack");
                 return Err(EINVAL.into());
             }
-- 
2.56.0.317.g454f8302e1-goog

