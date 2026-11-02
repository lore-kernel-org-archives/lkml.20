Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793577716;
	b=WGl1mUc+95HG/7Cp7W3M5qImZW0oP6UI+D2I00k4nHv+SBJjY5iA8hcrdv4kTj8ew++E
	 Hi1TIl575mrCF/XHxmVm2FVZ+zxKzNV9hxNhmE4xv54nGNtd1zWoQJ97ip/y6y65keY4b
	 FiUckkhpiAaAO076OY8JQJS9ATqr3dSyxNkWm0ZCwavZ3ZyPpWLKvhw6k3MEo/4niSjmp
	 a4p/+/I8aQTfQABXj0zXQTYEPZ/5qdjaRj9tzJfOE7EmymH6oRBCbo7/E7nRlOmpERzTe
	 6gCKqQi3QoA4RWOSJ1uO25S2dg84aIZiBVZWXw7IfbBIsVA8IIRFuUpgV4isEbUEX2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793577716;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+0Das8q4ad6s+soPa+9RI7UhGqvzAMX8uja9bYtGd1A=;
	b=uHscHM7ZhW3RGbMF4dsPKlnj43eo24QqY8+1hWp2GPLQahFsNs2Bx9Ju+x3qHBNVq01L
	 QkGzvMVM9/Kbv9G33EIpD8z2bp9Uudk82wlvgCA2HTcF64Eyeo0zGWbp+EABu2BJz6C2n
	 h2TDEDS9oxqVsCq6c18wx3lASxZ1IwurTc+VZSeDJvq6t1QLUwew5bvk8INAuhnQLJCGo
	 japv87j34UUEt99g64G/RfHwC6H7xCybJba3G4Nd4US7iOyEwe5kpEdMaViUJoe0BX0N0
	 iGpzTvYAJY0tO6kACD/U4HnalHGaaOxU099zmhjOJGGfdiW8lD4aAfhe5/bkQfXG0og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b="WjPbt/14";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=dwbmuqUL;
	arc=none smtp.remote-ip=103.168.172.158
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F42606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 00:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17F42606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=WjPbt/14;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=dwbmuqUL
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 44DAA14000B8
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:01:54 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 01 Nov 2026 19:01:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1793577714; x=1793664114; bh=+0Das8q4ad6s+soPa+9RI
	7UhGqvzAMX8uja9bYtGd1A=; b=WjPbt/14qg/ZuuM4THxQAXthWREF1JtQb4qDy
	R3f5C8vk/7LOPZPm5NviNqCQ9pF+Gzy/njgJzxwn02lCgYvESxbgj8d1rAZ2GXuk
	hF7HmduyLrQYAcB8p+ba7JyhMgPzavTodHcUcBLhGadkflU4rtHWiT620gX7Ar0U
	yPmKOFIbfyys0ZxGsOLHyNNEGIVXoyYu1G/Jfb/Yi4ktCwvG1V/jsQk/3yCP+9dC
	aY95Lr1BCNaF5Gyim38+YGc9/fcoo9zx3K2C/NSCweGgPMOmDivHu0iRHftt7qxj
	nFp26HiuRvzKHgIYEzMug8Femxmix/3zdkCWtWL4IGgubdgiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793577714; x=1793664114; bh=+0Das8q4ad6s+soPa+9RI7UhGqvzAMX8uja
	9bYtGd1A=; b=dwbmuqULFFZarTUFKPfY5VSOHrczNAljD0WnNoUx/+9Yb45Xv4c
	KsJhcOixjB5kxtbzoSZ4xYnnxP1sdzb4MbqyIRTlx963hVMI654l+rXVI+cg+LgG
	7L8pMsRdvbo63HQU8+u7SDUW+NZ7VlRmYXQC/MRxH3x4OunAqtGcRvzECvDgOxT6
	Urz5LmsaaGhPozj+2tQWYNMB4ADJT0tgB2Ru1ekzjmf2Bz5pB6vuLrCI1mPy1644
	Dkw9orNIrv1BfjAQcbWDEmO+6nfNymffB8f9KmeaAjVO+iAn91BtoIx/uCiKAZl3
	OXGxKC6PSicKKpxIuzFpek/wIuLrdTsbWvQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793577714; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:JEtH+tB30u0IBFMbpIP83FHUSCXgEu7qlhUnpsIE+3Cfk9O
	+evvy9l/voh7TQBQPgh7StWz1bqOBFevCMfLB0aZLtWV4/GHsTLHzWhK/SZHbnok
	7ufifUJAypc02UH+C8YHgKJxhrRTREsRliwUFeSLqYL5WlXrmt/eLEGOMSwcEiCd
	ykI0BMTDipHukuGATkPou+SB40I26Kkl+WgeJVBagne1/IoraAxzsWOgsaS/ocCa
	/fQAaNrAFOlkDiJqGwfsiQ3UjeK6UPJb7gEcnD7BsqaSL8p8AkHKJ4eDK/vfVnZ1
	5vwwMKbU7UZoIkhKmUk1J5XhbQ+gfOfDSW+nZMg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:56756SZ6Z9OmdL0KHTiRW5i2TcyEL4i67Lq5wZiSe2g=:w9j1/0kKEGBy4ow6HnYZgzkiv8ambMz/uKLmI0+n32E=;
X-ME-Sender: <xms:8dLnasZ26w5na070Vl8Hwk6l6LQdDaXcoiPzLKV2QRjlZ5mljRcIEQ>
    <xme:8dLnaosnUbdf-ajkwueTIGWNRHVmuHnPHKMwichGLBVxWh_eQf16IbElFVqSym3dF
    fDTIRZH4MSFbj9WhLwyob0v3OIbwPj8pDHYno5GSPGmjqIB1u30PAZp>
X-ME-Received: <xmr:8dLnarm8Z5BkB9UyrCJcVMvt17xcvotajCRooLb2Y1KbTEwB8Q9rBH6fCy63tLWtJwJ4uuWtd42pOpEjlAI>
X-ME-Proxy-Cause: dmFkZTGYnXz+Y/2IDUrgdjJhEm8B31b0FKCjWlYA3K5ozAumjpAhuXOcYwXH3jdnHFSPWk
    LMFXf+dRX9z2Z9pozdrQ1nxHY2OCie1/PLaV0ezZDXmaSq53hvd+QhdKgHeR2iHFFl2oD0
    PPJaKfuFiw4lGI61F7+Y2Tpsc/DhjAnNxrcf16i29EEjZjjHxGCTSyLtDs33sv6FZJOql6
    qkmWsQMLPXMnDBUbEYYqKd750yhUZk9IValuhkGTCabjIUj+YA3QYNKLHCeyXWoo0UjdWs
    mnqLa1OXAjYSPuGXiLmNXNwOAJVdJgTwzMt1AzfpfpNm/Qlck7ewC5Ylo3AicxZjafRYR/
    6uk9p0BOMcYx5X15UkXI+8K1zraeaEMgnp4L9dq7tC4IEk/JPLJBaDfYrW5X2r/HXeqMil
    5iUvQ2XMvudlhMDd+jaFkAp2X+UQ8m89+SVCQpoZN2AQZtJShULSAbSgzK80iuW41yNob9
    D68IpUfEV4xMhxm5Wi2W21F/oCcFcukhmzvw7d7E6kBvBZxsfc5WmYef9BKNimY3DJxqzA
    aJujB3xezkzv3Q5zf7NDVDPI1zA+SZNiC84OxCcWKcOrLT9MMSgJDj9ORxIW79k1VrNdel
    a3vZsC9KAhPDAtMD0CYK6S2e9uGefhmeBajrhk9y80bZoN2C6SHWraIPY9+g
X-ME-Proxy: <xmx:8dLnapU4AcOXkyuACYG9SF7t7xk86RQY1L9ARqALSVjaHDYnGjGa9Q>
    <xmx:8dLnaumS3MVQf-mOv7FMaYWOvbfDIAxlf11upwYEc2yyV_mYpYtrGg>
    <xmx:8dLnamSqIAOyWBI73ixumyNgHtUsAulZ_xsnb6bK0CmDQmCRTfqypQ>
    <xmx:8dLnaiGo7E4afDKP5UDKjnJkvrDDTw80CCVdntgrZFROTXv6634tTw>
    <xmx:8tLnagmNd0OfAMUU6G28E0lpYXlS-mz1LT0_c_tJbMRG54JwhcbfZMbT>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 19:01:48 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1] rust: hrtimer: Remove HrTimer::expires()
Date: Mon,  2 Nov 2026 09:01:02 +0900
Message-ID: <20261102000102.603124-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
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

HrTimer::expires() reads node.expires without the base lock. The
hrtimer core writes node.expires in hrtimer_start() and
hrtimer_forward(). A timer started through Arc<T> or Pin<&T> can be
started or forwarded while expires() runs. The read then races with
the write. That is a data race, which is undefined behavior in Rust.
The volatile read does not help.

Even if the read were done under the base lock, the value would be a
snapshot. Another CPU can start the timer right after the read and
change the expiry.

A driver that needs to know the expiry should start the timer in
absolute mode. Then the driver already knows the expiry. A callback
that forwards the timer gets the overrun count from forward(). If a
driver still needs the remaining time, a binding for
hrtimer_get_remaining(), which takes the base lock, should be used
instead.

HrTimer::expires() has no users. It is safe to remove it.

Remove Instant::from_ktime() too. HrTimer::expires() was its only user.

Fixes: 4b0147494275 ("rust: hrtimer: Add HrTimer::expires()")
Reported-by: Boqun Feng <boqun@kernel.org>
Closes: https://lore.kernel.org/rust-for-linux/aV5IwaxcIF4XJvg3@tardis-2.local/
Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
This patch does not depend on the hrtimer_forward_safe_from_callback()
series [1].

[1] https://lore.kernel.org/rust-for-linux/20261101232829.593680-1-tomo@flapping.org/
---
 rust/kernel/time.rs         | 22 ----------------------
 rust/kernel/time/hrtimer.rs | 23 -----------------------
 2 files changed, 45 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index b6a2aab12a50..7837c26fbca9 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -219,28 +219,6 @@ pub fn elapsed(&self) -> Delta {
     pub(crate) fn as_nanos(&self) -> i64 {
         self.inner
     }
-
-    /// Create an [`Instant`] from a `ktime_t` without checking if it is non-negative.
-    ///
-    /// # Panics
-    ///
-    /// On debug builds, this function will panic if `ktime` is not in the range from 0 to
-    /// `KTIME_MAX`.
-    ///
-    /// # Safety
-    ///
-    /// The caller promises that `ktime` is in the range from 0 to `KTIME_MAX`.
-    #[inline]
-    pub(crate) unsafe fn from_ktime(ktime: bindings::ktime_t) -> Self {
-        debug_assert!(ktime >= 0);
-
-        // INVARIANT: Our safety contract ensures that `ktime` is in the range from 0 to
-        // `KTIME_MAX`.
-        Self {
-            inner: ktime,
-            _c: PhantomData,
-        }
-    }
 }
 
 impl<C: ClockId> ops::Sub for Instant<C> {
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index a53f7f1341be..395810c46910 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -570,29 +570,6 @@ pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64
     {
         self.forward(HrTimerInstant::<T>::now(), interval)
     }
-
-    /// Return the time expiry for this [`HrTimer`].
-    ///
-    /// This value should only be used as a snapshot, as the actual expiry time could change after
-    /// this function is called.
-    pub fn expires(&self) -> HrTimerInstant<T>
-    where
-        T: HasHrTimer<T>,
-    {
-        // SAFETY: `self` is an immutable reference and thus always points to a valid `HrTimer`.
-        let c_timer_ptr = unsafe { HrTimer::raw_get(self) };
-
-        // SAFETY:
-        // - Timers cannot have negative ktime_t values as their expiration time.
-        // - There's no actual locking here, a racy read is fine and expected
-        unsafe {
-            Instant::from_ktime(
-                // This `read_volatile` is intended to correspond to a READ_ONCE call.
-                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
-                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
-            )
-        }
-    }
 }
 
 /// Implemented by pointer types that point to structs that contain a [`HrTimer`].

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

