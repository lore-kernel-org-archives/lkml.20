Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793836871;
	b=Q0eeiSXoyC1iwVhsu6q6P3Jk1/kZR22O2pt3s6fCQJL23M9OluhLy3A+hB1n9EkaE7QY
	 /jU7YnHWs8rNtTQfFzjqdsVZUA6WcWWSEdqnXbsOSOFgnHS7fv/pW0XOKASM4E1VOrkyu
	 ZAkXniFhCDHmVMuUd6ksuYLOYPl2nDWYKpFUdPktEuX+Wmj5Do0tO+PV8/TpPmgsCYDFf
	 0gB81F7dN+7CPSPo1ctZFP0htKm6oUMAsOLZ77KeoNpOfCVRLKRmcntHTz+Ol8t5NY70g
	 F1hH+rfOWDg7Hmd50VcVE0w+P8zKRwwhjAT4vH5t6bQbLJ4ldV7J6T02iTH95HWI32g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836871;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KpRZu8OW+Om4bwh+lGy0Rfa1S2m1Xm1r8qtD+tdi+9s=;
	b=fVgRDXvg9hG6P+TlBZr96zqZ/PTCqLvoxelK7BtDdrmHujR3c3ncaY9hj3PL1lQlCGEc
	 DsXbvM8QgSpA9pm8bMIWdjC0qOT6ED7i2Ay0bQVFv2bco2D9O70CjdTVZ6SuAmc9kTGcv
	 nNWRsWSQqux6ji+jYubdJD+5p8NVhF5pTByLx61PMcpct3dcXlEYYvR7v/K91/co0dK8D
	 s1YDLZvfCXENGcchwq0pXctGAvOsBZYa24Sb1k7wpFc+mWxT1MyMy2/xMG52xxNBxePeq
	 rLDJtWQ2vLDcdBVjg3r1K39T9fLXN9LcVdu5DrPJVKmBGrDsJKlScfE1m1X2pd6sYag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=KG36lIqd;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="2MO/qA4R";
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E5F606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29E5F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=KG36lIqd;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=2MO/qA4R
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5ABCC14001C6
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:01:10 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 04 Nov 2026 19:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1793836870; x=1793923270; bh=KpRZu8OW+Om4bwh+lGy0R
	fa1S2m1Xm1r8qtD+tdi+9s=; b=KG36lIqdfCYKCaaVPDmiwVrmEI2CrjNXdVNs7
	2nyD4iQWqXigiSgIm7MnrCuzXRDViOezv/MJWQnvr+Da33Uo4h+sxRDj4nsUi4f1
	mc0nQPrqKKzn4t9owNxKP4u0QoGdEuP28g8dF5S/jghCHExVMDWCmvK/MY6JXWpL
	Bl2jgxwUk8WpPOW2vIupXJJ8GwxdOSkVbf6uIajJr0AjU33FG1s9TEpPaVhxTf1Q
	+8L6EoaQyMCWgeSncMQvPp+jfS28+8vKu41QI95Rm/xdiflIeoyIdH//74+tl2wA
	fogYCBi9aO/deVU+cbuc69yLZbUjeuCyLxy98KRuxM7FWPx8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1793836870; x=1793923270; bh=KpRZu8OW+Om4bwh+lGy0Rfa1S2m1Xm1r8qt
	D+tdi+9s=; b=2MO/qA4RqpvcjXS0DPz1puDXeFyoVLwNwWuDTpWLpM32UymIIYR
	3ITfzxWzTILVyA8ZIP0fkCzlw4fVjMpLjEH2h4IZxMkOZHRv1ZbyCmzvqiH3S5Dg
	a2g9eMtec8OQbAQY8q9HWAFG3/KVBrIWHvMirhow0y2WXDReEoYtGFPoKNqXzwOK
	EKCOHoyh77sT4ML6f/ksPRS2PyIA9mOkUM4GnNkJXGAeCCaHHFx4G3ZbmZM/A65U
	mRo6hSmzGS681pWpthNRlz2JbqB5tfno+JWasvHvS5aU5aJBcMr0JSvkO8tXkKLj
	zBCW9Hp3/AGznDf4sqylzTg/sXbLxAWTBYA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793836870; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:PG9v5RQMzZBAX6lmAIQpQMWkzmjB16QxQXCDU+sSV4paqpu
	W1ArUi3kaVLf5CBJZSX2k4ZxaIPnZwPdqU2oLySCCLfciJym8U9JpKfX5eK78MT1
	4EjkRwhZvtATtaJHkOEnv13FsgQ51H1SivKx86T/8RaEHSn1FR5BEH5le2Dd8ygH
	mNfgHUbP0bG06yMnPoL1VFhI94iK3gK8bkNfaCl1Xv1/WDUuD1Dm+Empjod2S2Q3
	6zTKPXCpddLyOaWCCaZInnJsM+KMVMw7mnCg5gT9EIsqJHdSGFIOmQxTo+zLTa6B
	JhuhInY3ckCCrXR47WnHe89vKDwZuXo3IM3deGg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:IfXpViXlts4BSGudMImtrFC5W2nWwI9uCRuWbqJQnCg=:vclFgmUSNSdG477UymHVK0Zr6iubd8poqn7hWo/JIFo=;
X-ME-Sender: <xms:RcfranRdMI-7GJ-yUj14YGCsrO6rKCnx6uS4SA04MBHNqM_Gmp6kOQ>
    <xme:RcfraqGzT8gotFVrSH49yOYT37wfuW5p8WVvKMhVNhCagznDhPlknqylEAedjoBdN
    1ve0ZoktOVXJWhn4cyTTqmfkQEtn8C4CrZE9yA8r4dwYYBxk7o4pOk>
X-ME-Received: <xmr:Rcfrahcm7bYIZHD6x4q1IlG51Qg0chq1TKRE9ENiqkIdgXvqbtSWhXuvmqNegRVWyE0iP2667dJ-Cbt9SMc>
X-ME-Proxy-Cause: dmFkZTEFQi/34h6RHhj4Hc/NcFs4kpV3WRpmCgXhrkHn0q4aYa2oJorLj/1OwPYMs2eJv8
    RYbTKBIgEjf29lYXIKf9CBFiLU2SpPDMI6cwKqxPUwJKzSn7iBvhIWbrsQPp+xVopJgZMe
    Sadw2d/LbjYl2b4DUOAU5vE9aA/ku0CpwZc95TqDvfMTmtl7jbG8Vcwya4Hdd9h+n5THsC
    2pEfWfBFaN3ezIW+x9WCPvtTkIjzAxWH5MdsKGsmgb4uzrlkh4dzKohBt4pwAkbosoi20M
    2A0sU4fiRE2vNpKo6g4TRhRpzjmv5zMauEmGjXt/l1I142q9GzTofrPkXOQNOOf+Bz0rak
    jYv0KmCtzIyf5ygb62eFCMlXU+i8WX4G3htcVQIdoGj82sfm4ilGG46O63j4l9f5IcI5AW
    7+fE4ag+kIQfB0oh4AYbDdk8Vnpb+tGyPA7YeRsdDarcf5uLBskFiSV/Jp5AA9ZrZU06i1
    3SCLKgrZJtK8LfeNVzT30hw2X/UIZ9CLPzun9L7KjCkvRZdcouLKp4tAQ0qhECh3E76+BX
    iPzu2LHnzsbInp2hK8gCAeGiXYljL6b03nrfBPU7ZGXoB3taTz/VfzjOxFJDd/L7vyNu/w
    NBNL5Ys45sOwvyl5lbbdE0WS4SmABXHp5coXijfw4euVLVsy3A/+4Ic7StFQ
X-ME-Proxy: <xmx:RcfrapuJIa3FXeVtB-gWWkMmbsgiIameBYbBT4dDHK7qY0rexFLIPw>
    <xmx:Rcfrand28mOCg8WZTMHs3gLnCFjGHHSns9ft3SoELZieq7YxOIemwA>
    <xmx:RcfratohzOdGK6xzhPBBoxTTj5hjaAx7AuJPgD-UZZkZ0Q-9xOH8tQ>
    <xmx:Rcfral-JCi7R8og3PtNkodWKRCq4M5blz37_7m64_UC0S56Yi5zXYg>
    <xmx:RsfravlPBk5IpJ3IeV8A9Io4ObKWaEC0XlA-hf6LGqxr5hS_u3Fe05V3>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 19:01:04 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: aliceryhl@google.com,
	arve@android.com,
	boqun@kernel.org,
	brauner@kernel.org,
	cmllamas@google.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	tkjos@android.com
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	lossin@kernel.org,
	lyude@redhat.com,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v10] rust: sync: condvar: use Delta<Jiffy> for timeout and result
Date: Thu,  5 Nov 2026 08:59:29 +0900
Message-ID: <20261104235929.1282640-1-tomo@flapping.org>
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

wait_interruptible_timeout() takes the timeout as a raw Jiffies, and
CondVarTimeoutResult reports the remaining time as a raw Jiffies. The
type does not show the unit.

Switch the parameter and the result fields to Delta<Jiffy>.

Delta<Jiffy> is signed, but schedule_timeout() prints an error and a
stack dump for a negative timeout. Clamp a negative timeout to zero, so
it means an immediate timeout.

Update the only user, binder. It now converts the freeze timeout with
Delta::to_jiffies_timeout() instead of msecs_to_jiffies(). Both round
up, so a short timeout does not become zero. They differ only for a
very long timeout. msecs_to_jiffies() returns MAX_JIFFY_OFFSET for
2^31 ms (about 24.9 days) or more, which means an infinite
timeout. to_jiffies_timeout() has no such special case. It converts
such a value to the matching number of jiffies, so the wait is long
but finite.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
v10:
- Rename variables and fields to describe their role, since the type now
  shows the unit (suggested by Boqun):
  - binder: the local variable `jiffies` to `timeout`
  - wait_interruptible_timeout(): the parameter `delta` to `timeout`
  - the `jiffies` match bindings and the `jiffies` field of
    CondVarTimeoutResult::{Woken, Signal} to `remainder`
- Add Alice's Reviewed-by
v9: https://lore.kernel.org/rust-for-linux/20261102035934.711973-1-tomo@flapping.org/
- Send as a single patch. Patches 1/4 and 2/4 of v8 are in v7.4-rc1,
  and the workqueue patch will be sent separately
- Rebase on v7.4-rc1
- Drop the comparison with enqueue_delayed() from the commit message
v8: https://lore.kernel.org/rust-for-linux/20261002050428.2746277-1-tomo@flapping.org/

Boqun, would you take this through the rust-sync tree?
---
 drivers/android/binder/process.rs | 13 +++++++------
 rust/kernel/sync/condvar.rs       | 31 ++++++++++++++++++++++---------
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 1f4cb43f1de6..0ed6a4b1c74b 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -35,6 +35,7 @@
         Arc, ArcBorrow, CondVar, CondVarTimeoutResult, SetOnce, SpinLock, UniqueArc,
     },
     task::{Pid, Task},
+    time::Delta,
     uaccess::{UserSlice, UserSliceReader},
     uapi,
     workqueue::{self, Work},
@@ -1552,25 +1553,25 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
         inner.is_frozen = IsFrozen::InProgress;
 
         if info.timeout_ms > 0 {
-            let mut jiffies = kernel::time::msecs_to_jiffies(info.timeout_ms);
-            while jiffies > 0 {
+            let mut timeout = Delta::from_millis(info.timeout_ms.into()).to_jiffies_timeout();
+            while timeout.as_jiffies() > 0 {
                 if inner.outstanding_txns == 0 {
                     break;
                 }
 
                 match self
                     .freeze_wait
-                    .wait_interruptible_timeout(&mut inner, jiffies)
+                    .wait_interruptible_timeout(&mut inner, timeout)
                 {
                     CondVarTimeoutResult::Signal { .. } => {
                         inner.is_frozen = IsFrozen::No;
                         return Err(ERESTARTSYS);
                     }
-                    CondVarTimeoutResult::Woken { jiffies: remaining } => {
-                        jiffies = remaining;
+                    CondVarTimeoutResult::Woken { remainder } => {
+                        timeout = remainder;
                     }
                     CondVarTimeoutResult::Timeout => {
-                        jiffies = 0;
+                        timeout = Delta::ZERO;
                     }
                 }
             }
diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index 69d58dfbad7b..4be2c3bf8802 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -12,7 +12,10 @@
     task::{
         MAX_SCHEDULE_TIMEOUT, TASK_FREEZABLE, TASK_INTERRUPTIBLE, TASK_NORMAL, TASK_UNINTERRUPTIBLE,
     },
-    time::Jiffies,
+    time::{
+        Delta,
+        Jiffy, //
+    },
     types::Opaque,
 };
 use core::{marker::PhantomPinned, pin::Pin, ptr};
@@ -182,19 +185,29 @@ pub fn wait_interruptible_freezable<T: ?Sized, B: Backend>(
     /// Atomically releases the given lock (whose ownership is proven by the guard) and puts the
     /// thread to sleep. It wakes up when notified by [`CondVar::notify_one`] or
     /// [`CondVar::notify_all`], or when a timeout occurs, or when the thread receives a signal.
+    ///
+    /// A negative timeout is treated as zero.
     #[must_use = "wait_interruptible_timeout returns if a signal is pending, so the caller must check the return value"]
     pub fn wait_interruptible_timeout<T: ?Sized, B: Backend>(
         &self,
         guard: &mut Guard<'_, T, B>,
-        jiffies: Jiffies,
+        timeout: Delta<Jiffy>,
     ) -> CondVarTimeoutResult {
-        let jiffies = jiffies.try_into().unwrap_or(MAX_SCHEDULE_TIMEOUT);
-        let res = self.wait_internal(TASK_INTERRUPTIBLE, guard, jiffies);
+        let jiffies = timeout.as_jiffies();
+        let res = self.wait_internal(
+            TASK_INTERRUPTIBLE,
+            guard,
+            jiffies.clamp(0, MAX_SCHEDULE_TIMEOUT),
+        );
 
-        match (res as Jiffies, crate::current!().signal_pending()) {
-            (jiffies, true) => CondVarTimeoutResult::Signal { jiffies },
+        match (res, crate::current!().signal_pending()) {
+            (remainder, true) => CondVarTimeoutResult::Signal {
+                remainder: Delta::from_jiffies(remainder),
+            },
             (0, false) => CondVarTimeoutResult::Timeout,
-            (jiffies, false) => CondVarTimeoutResult::Woken { jiffies },
+            (remainder, false) => CondVarTimeoutResult::Woken {
+                remainder: Delta::from_jiffies(remainder),
+            },
         }
     }
 
@@ -248,11 +261,11 @@ pub enum CondVarTimeoutResult {
     /// Somebody woke us up.
     Woken {
         /// Remaining sleep duration.
-        jiffies: Jiffies,
+        remainder: Delta<Jiffy>,
     },
     /// A signal occurred.
     Signal {
         /// Remaining sleep duration.
-        jiffies: Jiffies,
+        remainder: Delta<Jiffy>,
     },
 }

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

