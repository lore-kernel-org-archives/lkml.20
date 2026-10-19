Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452892;
	b=C8q5RWPGudz8DkCgbfQ9496NL3/Cboyxav1UccU9iqPXHplAK/UR1RnDVTbOfCdeDa0o
	 XbUD1IUFeAmDju0W7heT5M5Ho9ZjZI1cquZRYDkb5Yzv7TtcUmHY+7NGH39qqpOVTN1l5
	 nyzD22wqJDcZya6uJFM5qwbyrWZI18CGPVPM8jxsj7YNpMUKgjJfOgr5ShaQCk7+bT1qb
	 1PzZ3PN9xSg3cuDHFNP8Q14FafCbJiL53+ZaS1N080L5kj576MvM10cslvJjLfxCDQPlx
	 QQpor3kZ15bO8sSkVCzQEQdskOEofxrpdfEj4TT+2iijAISWBV/93su/7EVrYj1UpUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=yYgGBwtoModPOWWXIECz8dwnr/MeNeZyXwpagOjeJf4=;
	b=dbGPkXLpq79vZwFuSxCcXzHvCOr89Wgib5zVLH7vFS8u/OBXNkl8xS7FI1jNbJVTeE9w
	 AHAAt06PaG2MZZom+Byf3xka9zcUavvwAhp1E3rhDL3ybjfoNPG467UkTSLqHdeF0zipv
	 uNs9YkvtmP9YtRp397fpHso2vKHPOb9pSgEcJXVJRWBoctyhkPqsUmZF0+r7yyBAiXW4m
	 igBTKPG4yOrIrz7q4X2onKYwQX1nsiB30ghJpIutFX6lhbQr80PKP1zOKzkMw3K7SCqwV
	 7W1AWnFci2BtyT5Zse2VHwZWJwWZh3iMBu6zgcvDjONkBGimABIoihbDnUCuR6rgmuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QTPIdIow;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5C9606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C5C9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QTPIdIow
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5091736eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792452890; x=1793057690; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yYgGBwtoModPOWWXIECz8dwnr/MeNeZyXwpagOjeJf4=;
        b=QTPIdIowpXQnzvD8GbDaYnYvCPJIbbKCLQuaTHe0vY6Ba07DHG/K++i/RA+gdyeBX4
         N9XNPeJvtzqQBa/THtfMFQKuRf5IfUR5Z3mVC2MCmQrWPM2BQ/p4IouiDV7Um2C0tD+E
         tWBXf3RPhP9cg7SYKcS5o9O7EviqoLMObDIsnp7aLEtdrxYewBoi3bq1MgOgl6br3/60
         wwIy+LaHKMebn8eCStvKdDOV1hoUYh44NG+IB3Wwss96CoUgEBAuFJ4JX2ASwpmw6/ui
         pXwYXufqH+DdCpbZPzBPK4g4cta6JBU3Vkc/Mr0SmF85cb+YeDiNHdGf+LnnlJELvX8n
         xrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452890; x=1793057690;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYgGBwtoModPOWWXIECz8dwnr/MeNeZyXwpagOjeJf4=;
        b=W1HthV7U+CtvtM2vIjoJduDWQvnwI7WYkjNIu6bX8aTq/ZBWHAmHTc9DKoIywkNOyy
         FDrqjLUsX8yTKKhbnrpBZKykxu8RWHagW95aVXdI6F0NBRtl+wERPukGuYuAbjaQv105
         8fTG8hMLvX78+oT/onyq/gnBPJldfUfYtIHYW10NnLqX5z4Vgiw5BB+3SXFv+hLwfqaB
         qPvt6qyBZ0bXqmhiV4eAGc+BcRWPFAOLzBG0pJ0+wleMUjVFj9VX/nwTvr9DoDkSMBLV
         P2CI9MkriZSSPvZ96x44IQTUUtF7hPfoBQTS34nWnlLPEn+LpNzL0lEPc+byDqzs4o+y
         GytQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrPUiaSAcdjW9a5pkSIPkTKZk0L058H+OuM+5qoup7b30DMv8vHiUQerkJvBYvMCxZf+FmZ4Aii8uUueQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcrTNA7ucrg7mytvTGIiuDt/YJu5UQ7PZXQy1ZOP4h+NvGnqYc
	JYq07U0W3lhVHBWP+MsKecUmcwxK2ukFp+3r+j2i+Ev1wqZPRrtuKLJIJGpkcay/UH52aPf2C36
	/VU9ssV6LJWRAlia5ZrBJt37ZGYr++Q==
X-Received: from dyru33.prod.google.com ([2002:a05:7300:4fa1:b0:35b:4bd1:e0fb])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:7aa3:b0:35d:74f7:3b9 with SMTP id 5a478bee46e88-361a224ccf0mr11856161eec.33.1792452889848;
 Mon, 19 Oct 2026 16:34:49 -0700 (PDT)
Date: Mon, 19 Oct 2026 23:34:37 +0000
In-Reply-To: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4533; i=samitolvanen@google.com;
 h=from:subject:message-id; bh=uXHdbixwLcNi6iBpIxcP3Mxix2cxByC1MLC5WD58JuQ=;
 b=kA0DAAoWWgclqzmhp3oByyZiAGrWqRaiZJeszthblBaAnEB9HD3z7C0uIlr+EVlzkAOL4TKoB
 oh1BAAWCgAdFiEEhPWrtbv3QmXq83IYWgclqzmhp3oFAmrWqRYACgkQWgclqzmhp3ofpAEAvbBx
 TqUhXZQDkt25mUO+xCmdfAuf4hD++/eCuHyQR6gBAIH2CiYt/Ce4sMAG3QhYfARKs7grPvSLM9v IY6W2fhMK
X-Mailer: b4 0.14.3
Message-ID: <20261019-rust-cfi-fixes-v1-1-9503472ba738@google.com>
Subject: [PATCH 1/3] rust: irq: declare cfi_encoding for irqreturn
From: Sami Tolvanen <samitolvanen@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="utf-8"

The IRQ callbacks return c_uint. C calls them through irq_handler_t,
which returns enum irqreturn. kCFI encodes enum types by name even with
integer normalization, so the type ids never match and every call fails
the CFI check.

Generate irqreturn as a newtype with a cfi_encoding, as is done for
lru_status, and return bindings::irqreturn_t from the callbacks.

Fixes: 0851d34a8cc3 ("rust: irq: add support for non-threaded IRQs and handlers")
Fixes: 135d40523244 ("rust: irq: add support for threaded IRQs and handlers")
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 rust/bindgen_parameters    |  2 ++
 rust/kernel/irq/request.rs | 28 +++++++++++++++++-----------
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index 8402b0c93545..5059cc74cb3c 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -27,6 +27,8 @@
 --opaque-type spinlock
 
 # enums that appear in indirect function calls should specify a cfi type
+--newtype-enum irqreturn
+--with-attribute-custom-enum=irqreturn='#[cfi_encoding="9irqreturn"]'
 --newtype-enum lru_status
 --with-attribute-custom-enum=lru_status='#[cfi_encoding="10lru_status"]'
 
diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
index c1c6525a676a..1afa9fcaad1f 100644
--- a/rust/kernel/irq/request.rs
+++ b/rust/kernel/irq/request.rs
@@ -25,10 +25,10 @@
 #[repr(u32)]
 pub enum IrqReturn {
     /// The interrupt was not from this device or was not handled.
-    None = bindings::irqreturn_IRQ_NONE,
+    None = bindings::irqreturn::IRQ_NONE.0,
 
     /// The interrupt was handled by this device.
-    Handled = bindings::irqreturn_IRQ_HANDLED,
+    Handled = bindings::irqreturn::IRQ_HANDLED.0,
 }
 
 /// Callbacks for an IRQ handler.
@@ -240,25 +240,28 @@ fn drop(self: Pin<&mut Self>) {
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_irq`.
-unsafe extern "C" fn handle_irq_callback<T: Handler>(_irq: i32, ptr: *mut c_void) -> c_uint {
+unsafe extern "C" fn handle_irq_callback<T: Handler>(
+    _irq: i32,
+    ptr: *mut c_void,
+) -> bindings::irqreturn_t {
     let ptr = ptr.cast_const().cast::<Registration<'_, T>>();
     // SAFETY: `ptr` is a pointer to `Registration<'_, T>` set in `Registration::new()`.
     let registration = unsafe { &*ptr };
 
-    T::handle(&registration.handler) as c_uint
+    bindings::irqreturn_t(T::handle(&registration.handler) as c_uint)
 }
 
 /// The value that can be returned from [`ThreadedHandler::handle`].
 #[repr(u32)]
 pub enum ThreadedIrqReturn {
     /// The interrupt was not from this device or was not handled.
-    None = bindings::irqreturn_IRQ_NONE,
+    None = bindings::irqreturn::IRQ_NONE.0,
 
     /// The interrupt was handled by this device.
-    Handled = bindings::irqreturn_IRQ_HANDLED,
+    Handled = bindings::irqreturn::IRQ_HANDLED.0,
 
     /// The handler wants the handler thread to wake up.
-    WakeThread = bindings::irqreturn_IRQ_WAKE_THREAD,
+    WakeThread = bindings::irqreturn::IRQ_WAKE_THREAD.0,
 }
 
 /// Callbacks for a threaded IRQ handler.
@@ -461,23 +464,26 @@ fn drop(self: Pin<&mut Self>) {
 unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler>(
     _irq: i32,
     ptr: *mut c_void,
-) -> c_uint {
+) -> bindings::irqreturn_t {
     let ptr = ptr.cast_const().cast::<ThreadedRegistration<'_, T>>();
     // SAFETY: `ptr` is a pointer to `ThreadedRegistration<'_, T>` set in
     // `ThreadedRegistration::new()`.
     let registration = unsafe { &*ptr };
 
-    T::handle(&registration.handler) as c_uint
+    bindings::irqreturn_t(T::handle(&registration.handler) as c_uint)
 }
 
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_threaded_irq`.
-unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(_irq: i32, ptr: *mut c_void) -> c_uint {
+unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(
+    _irq: i32,
+    ptr: *mut c_void,
+) -> bindings::irqreturn_t {
     let ptr = ptr.cast_const().cast::<ThreadedRegistration<'_, T>>();
     // SAFETY: `ptr` is a pointer to `ThreadedRegistration<'_, T>` set in
     // `ThreadedRegistration::new()`.
     let registration = unsafe { &*ptr };
 
-    T::handle_threaded(&registration.handler) as c_uint
+    bindings::irqreturn_t(T::handle_threaded(&registration.handler) as c_uint)
 }

-- 
2.56.0.212.g129ede20d9-goog

