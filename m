Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284539;
	b=pYgeDCLM7OBrLFdtfGofxZ2Hk70dkwt2ltZrvZq5oNxx7F1f+WGmW6S3HokexKhKoPmt
	 OTjrJ3CI+R1rM9EGLqAjr2pazawhl9o5/iDwP1cez5mCUqkxFmWx9OMyRhif3KM8fxHZZ
	 gKIzywubahADk1dSI+D0+kQkIE8TLwy0WXo/gG01RAPNcNgiGzZacIMw5bi2giOB3V+KI
	 LEEbEzTz+mopIJDpyaWE7XT0zqD5mv1vmfolsVj7TzIgnoahHl+/IINw+DHyLHkLWLNZr
	 fAusBOrSxZq7W9TR3/1T9AiurwE7Pk+TeBwM/exXBASEfC+viRkjuV8uzovgoOC/J7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uPNBoQQW3WB02TBAF3BzFuV2QfVhO4wd2JVa30h/5s0=;
	b=bwY8l8RwZxlSGe5huupSM3FygYbNnUjpwjU0Pr+OuodmTPTGUrKZg2GJ0IrgCGvxcfU3
	 m19WQ+7mUBkZZcKNUm8GuaDW9KV53ozh6fqQ6vNYb1DyNDb9+Oo1L3nOCuEpOG39t14b3
	 CzcYs6fYReIhi65Oz8X2DHrCZKBMR3opb2YeIfsJd9bT9wNVwqKJjLnv/cSdDHaw8UOy3
	 2njpqNl3Xh/KlQHKY7M6IRxKrcrqASd+2+LDyFbuAt7vpyRGfqvvc/Sxpep2iH/W7PokM
	 IVeToXvTJa8Rf8x0vMeyaZBHiLmdsZ+u55jfPb+pE7mxUzAkb0hdubqGfFpzoO9tWRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y6GcAIoM;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45070606A730
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45070606A730
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y6GcAIoM
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a3c08d6928so2883154c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284537; x=1794889337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uPNBoQQW3WB02TBAF3BzFuV2QfVhO4wd2JVa30h/5s0=;
        b=Y6GcAIoMky3oeSIHUgB2Mjm010BlPmVQ7t0ba1wxD4W/1igjfnN3/JlTXkToWSFml0
         ptSyuFK2E1l5miKEorIz2pgNYUJoq0fEtnt26LVxvTM8Qe+BfKtQjzV7Z0iNTw6E8yG2
         CVqoAmzAf2FUiL5HMEQhKo0lFFTtr560hbQblk0AOZVH25CD7COwhtYObutS+4k1azhG
         lAMOIRxuiXoo6udBIn9pguQULxNKBlZV0nMNhCCELShYjJlth6FX6nBJh+XmjMs5nLU3
         pmZNpyheJdNuFvjLptOu+HQde5wVjpqTRn6suCUh0DV6+yLUK8R12xAtehl45jFtw/jK
         4UHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284537; x=1794889337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uPNBoQQW3WB02TBAF3BzFuV2QfVhO4wd2JVa30h/5s0=;
        b=n9lFU5sfzNL9HC5MlfU4SfQwcYe3+MKUU/LC0e+tD330fQEE+5zWyerKvUQZYCxJI6
         TQoNeYDT/GLGD6vluyOa3KDoYwOZkbOEcJ1aLy5lCmwrUmAtd/pnZKb/4bhZ7drydFIN
         7tFStOFVvgjjpPeX5CbVqnFLzuKalhvs9YhkEVDsFSAeGOeYyvcbqLoEnzCEnLsg7Ygl
         djwlkgVtEbhRl66JY9KJous6GDrQpLTx+3DBpbqmWYb1DdCsPKKiUw9vWqsJuPiJTe+m
         Lw7tiQMxO6n6U3Td9GHvD2mGj4w+XSBCuCt4xCblL3mh+8ymU9WBG0y2Ef+o0OQfsnaY
         EZvg==
X-Forwarded-Encrypted: i=1; AL+hErEVQBT9syjtTY5ms63AQau84wRtXozcyY4/0+SdU3Wku8q9yQVMyTL2v4pTe8jFoLKx95TOnr/T06Y5Q1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sMhbx3wuzoZFjpS1lmK9XRifZi060QOAZYOozTQ8JhzimSzJS
	F0FlhTfCfFUkFrtrZITcolmVOf45l9QC2BIrYc3vEmRAL3MI/nuRhKAt
X-Gm-Gg: AYBFou1aC8ah9kUiJgLGb/xhHwfgj4UqXV8TfoAQn3If8fNqJdEtB4qsyEczNuamhMc
	msmIrMwjMO6GDzol62eAB/3yf8dksyYQt4AbqZkA9Qm0k1qS2qNfTCU5ZCaibS9kGmAJ29p+Tt8
	BIpmcrGnl21zIpNiTxNEalfnCLYzIoLnDFJeL2wx5Wg4CmR16+Umw6C19FRIErtC+XSZJKTcIc1
	/t+TMfKPebiKbZ5GIVXxx29mfSHvDSeSRK2jbuoXebigZNl4LEE0tbxvDZHokD4FYOjKqZoz4jK
	hyeNqVk1aatpyTYxAUDtYA2YFQachh1K+t7reXLsB6U3bzsKWMtHE528NPdmurrsG/TxbDkiVxo
	R3c5jUTW9UVgK75u2+RfMKlwgJGvLoAs/Rr+LI2Ri/nRGynvVLmkqNg5/fTTgUYyF6idCuZnxcO
	zc5TdQ3AV95KCHI93SpiDycULlR42DQ1gKP0InbwuwQitnmExodguXx3618LLykjoETr1x6+EdC
	9cvSJZPOg50AzBv3mCZCt89Dx0Wl97VgZUqCv7MWSvtDzF4hPF1c25UUey+d2F+PDuwY4zWWYCi
	yahWLZA7pcZY7Atl/twOHe3y3Mn41CgGCj2xjpttNGWHUpU=
X-Received: by 2002:a05:701b:270c:b0:14a:5284:1bf5 with SMTP id a92af1059eb24-1b3b5fda3bfmr2024081c88.13.1794284537372;
        Mon, 09 Nov 2026 20:22:17 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:22:16 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	bvanassche@acm.org,
	linux-pci@vger.kernel.org,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	rust-for-linux@vger.kernel.org,
	jgg@nvidia.com,
	akpm@linux-foundation.org
Cc: gary@garyguo.net,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	alistair23@gmail.com,
	gregkh@linuxfoundation.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 25/25] lib: rspdm: Expose public Rust API
Date: Tue, 10 Nov 2026 14:18:32 +1000
Message-ID: <20261110041832.1730924-26-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110041832.1730924-1-alistair.francis@wdc.com>
References: <20261110041832.1730924-1-alistair.francis@wdc.com>
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

From: Alistair Francis <alistair.francis@wdc.com>

Expose a public Rust API and an example that can be used to authenticate
an SPDM responder.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 lib/rspdm/lib.rs   | 69 ++++++++++++++++------------------------------
 lib/rspdm/state.rs | 43 +++++++++++++++++++++++++++--
 2 files changed, 63 insertions(+), 49 deletions(-)

diff --git a/lib/rspdm/lib.rs b/lib/rspdm/lib.rs
index 6bfe1eedc4121..6b1f864fe7266 100644
--- a/lib/rspdm/lib.rs
+++ b/lib/rspdm/lib.rs
@@ -9,6 +9,26 @@
 //!
 //! Top level library, including C compatible public functions to be called
 //! from other subsytems.
+//!
+//! ```rust,ignore
+//! struct MyTransport { }
+//!
+//! impl Transport for MyTransport {
+//!     fn exchange(
+//!         &self,
+//!         dev: &Device,
+//!         request: &[u8],
+//!         response: &mut [u8],
+//!     ) -> Result<usize, Error> {
+//!         todo!()
+//!     }
+//! }
+//!
+//! fn authenticate_device(dev: &Device, transport: &MyTransport) -> Result {
+//!     let mut state = SpdmState::new(ARef::from(dev), transport, 512, None);
+//!     state.authenticate()
+//! }
+//! ```
 
 use crate::bindings::{
     spdm_state, //
@@ -30,7 +50,7 @@
 };
 
 use crate::consts::SPDM_MIN_DATA_TRANSFER_SIZE;
-use crate::state::{
+pub use crate::state::{
     SpdmState,
     Transport, //
 };
@@ -263,51 +283,8 @@ fn from(code: SpdmErrorCode) -> Self {
 
     let mut state = mutex.lock();
 
-    if let Err(e) = state.get_version() {
-        return e.to_errno() as c_int;
-    }
-
-    if let Err(e) = state.get_capabilities() {
-        return e.to_errno() as c_int;
-    }
-
-    if let Err(e) = state.negotiate_algs() {
-        return e.to_errno() as c_int;
-    }
-
-    if let Err(e) = state.get_digests() {
-        return e.to_errno() as c_int;
-    }
-
-    if state.provisioned_slots == 0 {
-        return -(bindings::EIO as c_int);
-    }
-
-    let mut provisioned_slots = state.provisioned_slots;
-    while (provisioned_slots as usize) > 0 {
-        let slot = provisioned_slots.trailing_zeros() as u8;
-
-        if let Err(e) = state.get_certificate(slot) {
-            return e.to_errno() as c_int;
-        }
-
-        provisioned_slots &= !(1 << slot);
-    }
-
-    let mut provisioned_slots = state.provisioned_slots;
-    while (provisioned_slots as usize) > 0 {
-        let slot = provisioned_slots.trailing_zeros() as u8;
-
-        if let Err(e) = state.validate_cert_chain(slot) {
-            pr_err!("Certificate in slot {slot} failed to verify: {e:?}\n");
-            return e.to_errno() as c_int;
-        }
-
-        provisioned_slots &= !(1 << slot);
-    }
-
-    let provisioned_slots = state.provisioned_slots.trailing_zeros();
-    if let Err(e) = state.challenge(provisioned_slots as u8) {
+    if let Err(e) = state.authenticate() {
+        dev_err!(&state.dev, "Authentication failed: {e:?}\n");
         return e.to_errno() as c_int;
     }
 
diff --git a/lib/rspdm/state.rs b/lib/rspdm/state.rs
index 059398e95b92d..0fe99caf27958 100644
--- a/lib/rspdm/state.rs
+++ b/lib/rspdm/state.rs
@@ -96,7 +96,7 @@
 ///
 /// This trait abstracts the bus-specific message transport (for example
 /// a DOE mailbox for PCIe CMA) from the SPDM session logic.
-pub(crate) trait Transport {
+pub trait Transport {
     /// Perform a single SPDM message exchange.
     ///
     /// Send `request` to the responder and write the response into
@@ -115,7 +115,7 @@ pub(crate) trait Transport {
 /// it does not need to stay bound to its driver. `T` is data and an
 /// exchange function owned by the caller, so the borrow checker enforces
 /// that the transport data outlives `SpdmState`.
-pub(crate) struct SpdmState<T: Transport> {
+pub struct SpdmState<T: Transport> {
     /// Responder device (reference counted). Used for error reporting and
     /// passed to `transport`.
     pub(crate) dev: ARef<Device>,
@@ -194,7 +194,7 @@ impl<T: Transport> SpdmState<T> {
     ///
     /// `transport_sz` is the maximum message size the transport can carry,
     /// and must be at least the SPDM minimum data transfer size (42 bytes).
-    pub(crate) fn new(
+    pub fn new(
         dev: ARef<Device>,
         transport: T,
         transport_sz: u32,
@@ -232,6 +232,43 @@ pub(crate) fn hash_len(&self) -> usize {
             .unwrap_or(0)
     }
 
+    /// Authenticates the responder through a sequence of GET_VERSION,
+    /// GET_CAPABILITIES, NEGOTIATE_ALGORITHMS, GET_DIGESTS, GET_CERTIFICATE
+    /// and CHALLENGE exchanges.
+    pub fn authenticate(&mut self) -> Result {
+        self.get_version()?;
+        self.get_capabilities()?;
+        self.negotiate_algs()?;
+        self.get_digests()?;
+
+        if self.provisioned_slots == 0 {
+            return Err(EIO);
+        }
+
+        let mut provisioned_slots = self.provisioned_slots;
+        while (provisioned_slots as usize) > 0 {
+            let slot = provisioned_slots.trailing_zeros() as u8;
+
+            self.get_certificate(slot)?;
+
+            provisioned_slots &= !(1 << slot);
+        }
+
+        let mut provisioned_slots = self.provisioned_slots;
+        while (provisioned_slots as usize) > 0 {
+            let slot = provisioned_slots.trailing_zeros() as u8;
+
+            self.validate_cert_chain(slot)?;
+
+            provisioned_slots &= !(1 << slot);
+        }
+
+        let provisioned_slots = self.provisioned_slots.trailing_zeros();
+        self.challenge(provisioned_slots as u8)?;
+
+        Ok(())
+    }
+
     /// Start a SPDM exchange
     ///
     /// The data in `request_buf` is sent to the device and the response
-- 
2.56.0

