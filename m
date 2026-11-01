Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575995;
	b=u0DOovNpkl8KUJaTIZewdwdgPnhNb+G5RCIGA93WMGKR2MpBl5S5FN3XHhAkgRe9bQbT
	 hNK90qq/NIgp5pGC+VML4kSfiRVV0fbNROkvg+L0p2NGjAm+wI4v4BAaef9URNM2nlqNx
	 2/NXWorO4KHXWQd89FaLm4eUvx7id10ZXgqLh7hK3RnhmgEtDNNgYrvqstVm/GxIhdz1a
	 OxLoMzSr9c8WE6+u3YPNwY3IMEKgi4AZ2yxUGWHKYMBxiG1IrhPot5USLdOBI3LmdjDfD
	 Mp0X5wnc2d0GgDMl3iwx3bNyQ9xAfQnxzczt4uNvb2VUQNjVcPXozH16bYqcRvh6VRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575995;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=CC1JOEukHCO5LCOAnfZjPn4H4SSPeDrJarJVavYn5Ic=;
	b=s7KiuVAeE4NZLom+2O/MUu0wjeBqKtDANWqs67HvblAESJOuQVZ/gtvkc68Hn9eE+pzw
	 BV8EOGo10G/gN81LDmO8z/LMZ+NOKfIySfcsx+SvguWbmAjdFZ82uBkTbMK/rvol6901F
	 1tCluZcqXu8+0cWNLYBb9YMcWWWzR+7lVT6jio7xDN3Oqplo8xfrwI6pYoPYlhVGNmgN+
	 7i4M7ZeoY17KNmrgShTxFV6cziHa5ufmIHt08AEpPZEo912fSuESRnCRzzRu72JgLITv6
	 mF+Bwa6COQix1uWM1fAU1x6m0rKhWiw9BAzZ7GYXc/w9aGVFqLYPKEuz+Qqtcbv9O2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=J9LzXnpN;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=rtK+pw+Y;
	arc=none smtp.remote-ip=103.168.172.158
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAAE60A260C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDAAE60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=J9LzXnpN;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=rtK+pw+Y
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 28D3F14001BA
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:33:14 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 01 Nov 2026 18:33:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793575994; x=
	1793662394; bh=CC1JOEukHCO5LCOAnfZjPn4H4SSPeDrJarJVavYn5Ic=; b=J
	9LzXnpNToiROXx3g0bcUioXVYuLzKw16INYMZoIH4g68U6P2Dx+MPIPWHYt/46qm
	L4O/8MB4p3ykQ1Xua6AmlA+QteE0DsrRJ0Q+PYCYfKLgrRha24ztT5W+kd4RKDZq
	zHt2EfZvyRJg8tEm7UgniqkMb99neu0CjA2ol9uVXiHbg4Dk8Ppg/oIeKPUij2Kz
	Mf5iMZ+o++hatuuZQPLp/gEvwgzfAXDF5tENLHo51clevbOutMf7ehltFAdYKI28
	4cpfsrmBhY9bzUZsuar/sk9qterq8fC1A0/y0wb4jLSMG8gObfGLc85k+JMXBtCE
	s51F1MwR+phYMYTBcglzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793575994; x=1793662394; bh=C
	C1JOEukHCO5LCOAnfZjPn4H4SSPeDrJarJVavYn5Ic=; b=rtK+pw+Y3cHtZPHrt
	T4fGR98rKw0wahfl8mZ3yNpQAN01jZ7mI1r9ISA3LwCJ8pqp8LadtMLQji67mJNp
	X8ptGPf9aYBhDUXTx4oazzLoMhYrbo8utU9eLx5dzalL/NpGaA6lH6iEAUbCNQji
	IPtkW8rThjFT+kq9fTDtSP3fuMWYf+O9TSgBnpApsIqNV9c2gSoWQ/8vuRN0tqK0
	S1ufq1Hoboxl4A/YRtzFY/OtcsJ6h0YJXjWIb8LNoz4DjXU4uWbrVWTMw2W9HgAJ
	auUN1SQxdrTEzPqXxmxSTfuc9M221mKT2dMzQyYusWUMo371J+BNpEL9LG+Wk/8X
	Q3jMw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793575994; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:G6605NQ1RjxQ9wval8KMI73DjpdjbIWENouYymI0nW4EviG
	O4BjTU+o9iD+P6i6s81BQOZoYbIEz6kFCXzOwcHF+X4PDD1u2ir/l05MR+gzHi17
	n0BXjuRxgpch8iZGGj7y17kAzKBjevaebDeDSGvLcmF9m793p1MIqlx3FZBeUOSo
	kzjQrT69M7SAnEPBph73tBfNilqqCSxwQJdZyo42zckkG1Ukag3sBwSMHTc1Jd06
	f0ZniPQNAHakc1Bi/ochUTyROyoFM0Lf6eQIBMQLIcVGNKkDa1cLkcYZ3IliaY9Z
	exneEM4LNxipfrBT32mgyqy2lQrePsWkZrpOW1Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Pjn5g7vFlvR4jBmsmh7qVqtotGIcnUzF5M/BGi2zYc0=:Iy9U6ELxh5I4Yth3qeCiIVpaiiU/VXNcFGpxp3Omnnc=;
X-ME-Sender: <xms:Ocznatvh69qvcslQQBwgw8m7OKoIR1gL7XffTi9tpnAh_PBmQbccvA>
    <xme:OcznanydD-E4fn0eEyib6sjz-lWfhpUoLoq6a0LLKvg-x14CrwstTlna7IRQiyFXZ
    gkLfSMAByzCKDBw9f-z7L7Wdp7sP8aaNr5dQhMseILAreqMP87BDs_n>
X-ME-Received: <xmr:OcznalZ6oiyyRfvm3q6lds-NtwcR2AMPqmkwh46Wqn1eWxcaYkS-1UwGL4B7WrjPVzggsmw6ARriX5pO1uA>
X-ME-Proxy-Cause: dmFkZTFP5NDjHxXZGW5JVdTjG2UP+3MuyNmLBsARmg3jMSy8m/ocyGAbiVbzgkcQLw3/uv
    TuEqrdWtfSd0tFv8LBZUc+calfYR2dPvI3XNaH4LoJxvznDogDy0EnzoSkackRRNOdavGD
    hKfqGTSjvvK6+00VLolfrNjVEGwGP5319XOu14jdbZBs9z+J+2/lEeANIcuzWGDljqPk6I
    c+yHZwwo+r9cRyQwpiIqfVCOSMhNoKRQd2MKhrNbS/MrA8Xy3rC0HEVEDFuEBts876llwq
    L1GhqiXIFajyw6fdUrLEdI3X1REKpyWFsNp1PIXw5IqlA03tG9/KlVM4hDQFZzPRsbeVM5
    XWecgF8fYLpPHQz9SwY7wmiKaMcIteenprOLkVga6XkyOLkNHogEK05yS0Ypgx/T4cXTYP
    oEXYIrZ8mhjFlne9IZkoSkmqanOvXfuT/SCrJ2E3YpwKrmwDnhoU6/OKZsPzgl+kg/Ix53
    ecJ/+VotuCWGWEqjXL/66J0kvM5leAGdy8l7EUbh/6+2KVSP9uvfL9/0Uzp1AB0vNqYufr
    uDua7eHzlV9XKWo6DwSbyUdKsMEhEJCvKFkOcWqGU43t0/sztO5/WelqUX6V8k0KCntQFq
    LOnGlD9KaR6MaQuZS4OA6X7kYEocJi+8GhIPnaEis1gJPAoPrUK2Ghp3oiEw
X-ME-Proxy: <xmx:Ocznam4CGwEXG09k9uEZXjjIkCWDu-ynJVQSKi9lzEqjCN4lasHPtQ>
    <xmx:Ocznak56PKTGrS6la52rai9JqFbgaXeUf7QIQEnhJ6JV4Q73YCo6Aw>
    <xmx:OcznamXu9sIWnhwtTD1poXj3oUZz1aijRiGVIrA00ATaFtpPQvkFgg>
    <xmx:Ocznao6CLA0v9Con-JZOGFAIttvOAyS7ZhITf0NGL4kAYpQHSICtmA>
    <xmx:Osznar4cCOsSI2Plg5Nlqpw9Jv6EC4aAspC5OK1T7jp7qD1BJNjgtgQz>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 18:33:08 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	gary@garyguo.net,
	ojeda@kernel.org,
	tglx@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1 2/2] rust: hrtimer: Use hrtimer_forward_safe_from_callback()
Date: Mon,  2 Nov 2026 08:28:29 +0900
Message-ID: <20261101232829.593680-3-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101232829.593680-1-tomo@flapping.org>
References: <20261101232829.593680-1-tomo@flapping.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Safe Rust code can start a timer while its callback runs. A timer
started through Arc<T> or Pin<&T> can be started again from another
clone or copy of the pointer. HrTimerCallbackContext::forward() calls
hrtimer_forward(), which writes the expiry without the base lock, so
the write can race with the concurrent hrtimer_start().

Call hrtimer_forward_safe_from_callback() instead. It does the update
with the base lock held. If the timer is already queued by a concurrent
start, the expiry is left alone and 0 is returned.

HrTimer::forward() keeps calling hrtimer_forward(). It takes
Pin<&mut Self>, so no other reference to the timer exists and no
concurrent start is possible. Narrow the safety requirement of
raw_forward() to exclusive access, since the callback context no longer
uses it.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time/hrtimer.rs | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index a53f7f1341be..bf4094d84822 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -521,8 +521,7 @@ pub(crate) unsafe fn raw_cancel(this: *const Self) -> bool {
     /// # Safety
     ///
     /// - `self_ptr` must point to a valid `Self`.
-    /// - The caller must either have exclusive access to the data pointed at by `self_ptr`, or be
-    ///   within the context of the timer callback.
+    /// - The caller must have exclusive access to the data pointed at by `self_ptr`.
     #[inline]
     unsafe fn raw_forward(self_ptr: *mut Self, now: HrTimerInstant<T>, interval: Delta) -> u64
     where
@@ -1060,13 +1059,25 @@ pub(crate) unsafe fn from_raw(timer: *mut HrTimer<T>) -> Self {
 
     /// Conditionally forward the timer.
     ///
-    /// This function is identical to [`HrTimer::forward()`] except that it may only be used from
-    /// within the context of a [`HrTimer`] callback.
+    /// This function does the same as [`HrTimer::forward()`], but it may only be used from within
+    /// the context of a [`HrTimer`] callback, and it is safe against a concurrent start operation.
+    /// If the timer was started by a concurrent start operation, the expiry is not changed, this
+    /// function returns 0, and the expiry set by the start operation is used.
     pub fn forward(&mut self, now: HrTimerInstant<T>, interval: Delta) -> u64 {
+        // SAFETY: By our type invariants, `self.0` always points to a valid `HrTimer<T>`.
+        let c_timer_ptr = unsafe { HrTimer::<T>::raw_get(self.0.as_ptr()) };
+
         // SAFETY:
-        // - We are guaranteed to be within the context of a timer callback by our type invariants
-        // - By our type invariants, `self.0` always points to a valid `HrTimer<T>`
-        unsafe { HrTimer::<T>::raw_forward(self.0.as_ptr(), now, interval) }
+        // - `c_timer_ptr` is initialized and valid.
+        // - By our type invariants, we are within the context of the timer callback, as
+        //   `hrtimer_forward_safe_from_callback()` requires.
+        unsafe {
+            bindings::hrtimer_forward_safe_from_callback(
+                c_timer_ptr,
+                now.as_nanos(),
+                interval.as_nanos(),
+            )
+        }
     }
 
     /// Conditionally forward the timer.
-- 
2.43.0

