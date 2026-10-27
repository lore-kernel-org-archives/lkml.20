Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078887;
	b=f2XlVG3TF7jjb76P8Zuxn49Bs0Jc9DCMkIfKZ6z1mP1UGLQvMrA+bU9/lzx2atwLd3q5
	 /HoeMFO5EHIefyNRVMqcLI6yLP/IyaLsS2+o2/Pn8uxkRJIJGV30Dr+jNGQhPpDb1XioZ
	 caaqM+zmKYNcUhcPl7AjFxzBxjh5EFqZSYucdaZWtgai68C28h8caJHGQRZQvDjiyd6k4
	 emQ26tw29SDtGdN4SvWjlqr+B4YTe8p1FGkQkjtrrFzX1uaDw7cnjjTKpedmTHTtYcyAK
	 //eKcYa0STy73nOfD1GLNat47kBycNMlg2a6USqLo0675yDwtNLVLc//0+kYmEAwpYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=CxrG9aWJ5Sg0J8a+Po4yS4C8JvicGpcPP85E8KyGvy4=;
	b=O7l0s9z//FoWZmQt62+Gyol6uw/huBU9xTtm7IDzoUZY9c+NtfZsoJVSGhrpf+vuBoJV
	 QMH5BPux0Sm3WrB8VepxY0lKxdrpwUcDl1UAH9Pr/1OcfQBqqhpaTj52fbrC/abjXmvI6
	 s6s4ySlGgUzKiyFOEvwuibIWZQz8oAw2apeCwOUXIMUFJSrVj1QsQdM2PMJxths5zcbPP
	 DibfeXk3XffBqOlovW53ZUYf3maKVbQWrxJXFu4kEmtGcBByXVCn3Hwkm4/p3Z7sJG7Ig
	 /W4xfetzroAbfljhR2bx9VekgS/OkNases6+DooFVFLE30SELoGRwACbfSicfAP9C4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eZ7kj3+B;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD07606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCD07606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eZ7kj3+B
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e977109392so21768855ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078886; x=1793683686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CxrG9aWJ5Sg0J8a+Po4yS4C8JvicGpcPP85E8KyGvy4=;
        b=eZ7kj3+BQoKSpfg23gU0JlKQYypVAfO8biw59MjnCeVfnkPd3xb1Jq0lUtlTgTtzcP
         2CvpwksroXdsfSvQsOyHWeitZXXjbHh6iPdxEaxeyJhHnjPuVPGeuBB413eDgIR8Ew9T
         hqzR3jq3dkoJ37Ygk1zCIj/EGzAo/ObIfcIe1qQ+QfjCtL1Mcd0hN0xbNGCXnp1onvtu
         pDdDNplGWUmkslUVajA/e/sBmy9sT4NKEVjDaAgq4NORE6mx5AIplKdJjwr+wfmy9qRI
         HxHBO+S612zcQ1BhleTMvQJGk/RDz4EhoZsmflMa8iKYieU+BkDmLaCzcIiVx1gtPe1B
         gnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078886; x=1793683686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CxrG9aWJ5Sg0J8a+Po4yS4C8JvicGpcPP85E8KyGvy4=;
        b=r3pfvWpOWyaTJs314N68vQeSsy/AxJxg4/nafJwuaTH41aQeffXD8Baphq6/HSiuUR
         cr8msAHzfHAr74IkZ9zDPTFs52aa36RALJAlwhO6SA6rpiv5oY8Sf9UCezWhC0VB6Xl2
         m6NfXbdd6oAVaneV5aGtCYyasIsdrzGpasHqfPYYD7989L64aFT3Pv2g9tgPJlHBS/DL
         hsMuIFNAO6pKeKRzygn1E45HY6mYVe1y7bvaKMbtECeE601rsHuSWBm6lCr3VBufjvoV
         HgFW1EyT8wd7BkbhCgTBoZDwtLQS8dDVVveEUS04tCaWt0FKRmPs1qqP9CUggD+mNI2I
         PlMQ==
X-Forwarded-Encrypted: i=1; AKwUvByIASBLj0uCl4AJiMO3iyGu9f7fLvBxsmIbAigyMaWKWMHTjjms+6zNdPCSJ29LKyYeZryICLVgHpBKD2E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiAbRPz4HLnBAornBijpyeOTD2M8ubYKX+h0jAHMEE4MsiRADm
	i0jouqUvYeRnFkmd0AF9DkvPEPfqgHYjCtoCB91HG+h3PMK7WOT3WeCC
X-Gm-Gg: AYBFou1X5bdENLGARIdkUCrhcosbYCXv1+yWlwT1Ci19CY1Ny6y1aqGBd0NB6ryEUbe
	EzDNyogCc+riDRAcUTyh0nFT6U/bPkiPckSsoafArq91JJHD9kuduMf/sGOc6DDWCP+ynkOnV8v
	dO2pVJu+uNR0EC/k6z8Cwq9KbWmVYNwUAI7qPsfNHdx6MxYYPFJSstM/o9Lg1agjU29TxwarozU
	+ifivNq5CQTSFRtcbPxZVAwugRXhp25IoDxcILcrNqBuCxHZGaXJgfzT/ehPgUMsxCw3tGVIjd3
	4bVVTewo4dD9m3DJaHObvKFomgEn3CAi9YYPLt4qa365pq7zkhenMBUd8dQ30sqPpOlqX5kSPg0
	yQ9qh1qy/KKv/bdJFVLQY2xSpH8cEuPO7EpEVhoJwzhZ3xDBeiNk5BpmSUBucZ1olhDSL5v2nHx
	G+WpMbWK6fI64mryWdbm+kfUfZ7nCjI6eCaLdYrU/om7cqkWwOpQqijA+RezFUhOOSlp5pSQwuj
	4YNpj8FodTndqydoKq2GJZuqNrZ1N+AxMNgEWljRGD0Ofw02FouBNiMCRhq9qpFMMB56TB3Ag==
X-Received: by 2002:a17:902:e74b:b0:2e4:b37a:d577 with SMTP id d9443c01a7336-2ea9c819496mr71523295ad.43.1793078886044;
        Mon, 26 Oct 2026 22:28:06 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:28:05 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: akpm@linux-foundation.org,
	bhelgaas@google.com,
	lukas@wunner.de,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	alistair@alistair23.me,
	rust-for-linux@vger.kernel.org,
	jic23@kernel.org
Cc: ojeda@kernel.org,
	aliceryhl@google.com,
	a.hindborg@kernel.org,
	alistair23@gmail.com,
	wilfred.mallawa@wdc.com,
	bjorn3_gh@protonmail.com,
	gregkh@linuxfoundation.org,
	boqun.feng@gmail.com,
	benno.lossin@proton.me,
	gary@garyguo.net,
	tmgross@umich.edu,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v5 18/23] lib: rspdm: Support SPDM get_digests
Date: Tue, 27 Oct 2026 15:25:31 +1000
Message-ID: <20261027052536.1722081-19-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027052536.1722081-1-alistair.francis@wdc.com>
References: <20261027052536.1722081-1-alistair.francis@wdc.com>
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

Support the GET_DIGESTS SPDM command.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 lib/rspdm/consts.rs    |   5 +-
 lib/rspdm/lib.rs       |   4 ++
 lib/rspdm/state.rs     |  61 +++++++++++++++++++++++-
 lib/rspdm/validator.rs | 102 ++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 169 insertions(+), 3 deletions(-)

diff --git a/lib/rspdm/consts.rs b/lib/rspdm/consts.rs
index 7a75bd1e4649c..68f347a046859 100644
--- a/lib/rspdm/consts.rs
+++ b/lib/rspdm/consts.rs
@@ -18,10 +18,11 @@
 pub(crate) const SPDM_VER_10: u8 = 0x10;
 pub(crate) const SPDM_VER_11: u8 = 0x11;
 pub(crate) const SPDM_VER_12: u8 = 0x12;
-#[expect(dead_code)]
 pub(crate) const SPDM_VER_13: u8 = 0x13;
 pub(crate) const SPDM_VER_14: u8 = 0x14;
 
+pub(crate) const SPDM_SLOTS: usize = 8;
+
 pub(crate) const SPDM_MIN_VER: u8 = SPDM_VER_10;
 pub(crate) const SPDM_MAX_VER: u8 = SPDM_VER_14;
 
@@ -72,6 +73,8 @@
 pub(crate) const SPDM_HASH_SHA_384: u32 = bit_u32(1);
 pub(crate) const SPDM_HASH_SHA_512: u32 = bit_u32(2);
 
+pub(crate) const SPDM_GET_DIGESTS: u8 = 0x81;
+
 // If the crypto support isn't enabled don't offer the algorithms
 // to the responder
 #[cfg(CONFIG_CRYPTO_RSA)]
diff --git a/lib/rspdm/lib.rs b/lib/rspdm/lib.rs
index 4c219b32098ab..ee7e9be5b41c1 100644
--- a/lib/rspdm/lib.rs
+++ b/lib/rspdm/lib.rs
@@ -270,6 +270,10 @@ pub extern "C" fn spdm_authenticate(state_ptr: *mut spdm_state) -> c_int {
         return e.to_errno() as c_int;
     }
 
+    if let Err(e) = state.get_digests() {
+        return e.to_errno() as c_int;
+    }
+
     -(EPROTONOSUPPORT as i32)
 }
 
diff --git a/lib/rspdm/state.rs b/lib/rspdm/state.rs
index 79819c492b07b..73c39847d7335 100644
--- a/lib/rspdm/state.rs
+++ b/lib/rspdm/state.rs
@@ -41,13 +41,17 @@
     SPDM_OPAQUE_DATA_FMT_GENERAL,
     SPDM_REQ,
     SPDM_RSP_MIN_CAPS,
+    SPDM_SLOTS,
     SPDM_VER_10,
     SPDM_VER_11,
-    SPDM_VER_12, //
+    SPDM_VER_12,
+    SPDM_VER_13, //
 };
 use crate::validator::{
     GetCapabilitiesReq,
     GetCapabilitiesRsp,
+    GetDigestsReq,
+    GetDigestsRsp,
     GetVersionReq,
     GetVersionRsp,
     NegotiateAlgsReq,
@@ -119,6 +123,12 @@ pub(crate) struct SpdmState<'a, T: Transport> {
     /// Hash algorithm for measurement blocks. Selected by responder during
     /// NEGOTIATE_ALGORITHMS exchange.
     pub(crate) meas_hash_alg: u32,
+    /// Bitmask of responder's supported certificate slots. Received during
+    /// GET_DIGESTS exchange (from SPDM 1.3).
+    pub(crate) supported_slots: u8,
+    /// Bitmask of responder's provisioned certificate slots. Received during
+    /// GET_DIGESTS exchange.
+    pub(crate) provisioned_slots: u8,
 
     /// Human-readable name of `base_asym_alg`'s signature encoding. Passed
     /// to the crypto subsystem when calling `verify_signature()`.
@@ -129,6 +139,10 @@ pub(crate) struct SpdmState<'a, T: Transport> {
 
     /// Hash transformation for `base_hash_alg` computation.
     crypto: Option<Shash>,
+
+    /// Certificate chain in each of the 8 slots. Empty `KVec` if a slot is
+    /// not populated. Prefixed by the 4 + H header per SPDM 1.0.0 table 15.
+    pub(crate) certs: [KVec<u8>; SPDM_SLOTS],
 }
 
 impl<'a, T: Transport> SpdmState<'a, T> {
@@ -148,12 +162,23 @@ pub(crate) fn new(
             base_asym_alg: 0,
             base_hash_alg: 0,
             meas_hash_alg: 0,
+            supported_slots: 0,
+            provisioned_slots: 0,
             base_asym_enc: c"",
             sig_len: 0,
             crypto: None,
+            certs: [const { KVec::new() }; SPDM_SLOTS],
         }
     }
 
+    /// Hash length of `base_hash_alg` (in bytes). H in SPDM specification.
+    pub(crate) fn hash_len(&self) -> usize {
+        self.crypto
+            .as_ref()
+            .map(|hash| hash.hash_len())
+            .unwrap_or(0)
+    }
+
     /// Start a SPDM exchange
     ///
     /// The data in `request_buf` is sent to the device and the response
@@ -394,4 +419,38 @@ pub(crate) fn negotiate_algs(&mut self) -> Result<(), Error> {
 
         Ok(())
     }
+
+    pub(crate) fn get_digests(&mut self) -> Result<(), Error> {
+        let mut request = GetDigestsReq::default();
+        request.header.version = self.version;
+
+        let rsp_sz = core::mem::size_of::<SpdmHeader>() + SPDM_SLOTS * self.hash_len();
+
+        let mut request_buf = request.to_bytes()?;
+
+        let response_vec: KVec<u8> = KVec::from_elem(0u8, rsp_sz, GFP_KERNEL)?;
+
+        let response: GetDigestsRsp = self
+            .spdm_exchange(request_buf.as_mut_slice(), response_vec)?
+            .validate(&*self)?;
+
+        let mut deprovisioned_slots = self.provisioned_slots & !response.header.param2;
+        while (deprovisioned_slots.trailing_zeros() as usize) < SPDM_SLOTS {
+            let slot = deprovisioned_slots.trailing_zeros() as usize;
+            self.certs[slot].clear();
+            deprovisioned_slots &= !(1 << slot);
+        }
+
+        self.provisioned_slots = response.header.param2;
+
+        let supported_slots = if self.version >= SPDM_VER_13 {
+            response.header.param1
+        } else {
+            0xFF
+        };
+
+        self.supported_slots = supported_slots;
+
+        Ok(())
+    }
 }
diff --git a/lib/rspdm/validator.rs b/lib/rspdm/validator.rs
index 9afcb3f8bcb6c..f7ad46aef1b88 100644
--- a/lib/rspdm/validator.rs
+++ b/lib/rspdm/validator.rs
@@ -12,6 +12,7 @@
     SPDM_CAP_SUPPORTED_ALGORITHMS,
     SPDM_CTEXPONENT,
     SPDM_GET_CAPABILITIES,
+    SPDM_GET_DIGESTS,
     SPDM_GET_VERSION,
     SPDM_HASH_ALGOS,
     SPDM_MEAS_SPEC_DMTF,
@@ -19,9 +20,11 @@
     SPDM_MIN_VER,
     SPDM_NEGOTIATE_ALGS,
     SPDM_REQ_CAPS,
+    SPDM_SLOTS,
     SPDM_VER_10,
     SPDM_VER_11,
-    SPDM_VER_12, //
+    SPDM_VER_12,
+    SPDM_VER_13, //
 };
 use crate::{
     SpdmErrorCode,
@@ -719,3 +722,100 @@ fn validate(unvalidated: KVec<u8>, context: &'c SpdmState<'c, T>) -> Result<Self
         })
     }
 }
+
+pub(crate) struct GetDigestsReq {
+    pub(crate) header: SpdmHeader,
+}
+
+impl GetDigestsReq {
+    pub(crate) fn to_bytes(&self) -> Result<KVec<u8>> {
+        self.header.to_bytes()
+    }
+}
+
+impl Default for GetDigestsReq {
+    fn default() -> Self {
+        GetDigestsReq {
+            header: SpdmHeader::new(SPDM_GET_DIGESTS),
+        }
+    }
+}
+
+#[expect(dead_code)]
+pub(crate) struct GetDigestsRsp {
+    pub(crate) header: SpdmHeader,
+
+    pub(crate) digests: [KVec<u8>; SPDM_SLOTS],
+
+    // KeyPairIDs, added in 1.3
+
+    // CertificateInfo, added in 1.3
+
+    // KeyUsageMask, added in 1.3
+    /// The actual length of the SPDM message. `raw_bytes` might be longer
+    /// as it includes transport specific padding.
+    length: usize,
+
+    /// Entire response, used for the transcript hash.
+    raw_bytes: KVec<u8>,
+}
+
+impl GetDigestsRsp {
+    #[expect(dead_code)]
+    pub(crate) fn as_bytes(&self) -> Result<&[u8], Error> {
+        self.raw_bytes.get(..self.length).ok_or(EPROTO)
+    }
+}
+
+impl<'c, T: Transport> Validate<'c, Untrusted<KVec<u8>>, &'c SpdmState<'c, T>> for GetDigestsRsp {
+    type Err = Error;
+
+    fn validate(unvalidated: KVec<u8>, context: &'c SpdmState<'c, T>) -> Result<Self, Self::Err> {
+        let header: SpdmHeader =
+            Untrusted::new(unvalidated.get(0..4).ok_or(EPROTO)?).validate(context)?;
+
+        if header.code != SPDM_GET_DIGESTS - 0x80 {
+            return Err(EPROTO);
+        }
+
+        if header.version != context.version {
+            pr_err!("Invalid version response\n");
+            return Err(EPROTO);
+        }
+
+        if header.param2 == 0 {
+            pr_err!("No certificates provisioned\n");
+            return Err(EPROTO);
+        }
+
+        let mut digests: [KVec<u8>; SPDM_SLOTS] = [const { KVec::new() }; SPDM_SLOTS];
+        let mut offset = mem::size_of::<SpdmHeader>();
+        let mut slot_mask = header.param2;
+
+        while (slot_mask.trailing_zeros() as usize) < SPDM_SLOTS {
+            let slot = slot_mask.trailing_zeros() as usize;
+
+            digests[slot].extend_from_slice(
+                unvalidated
+                    .get(offset..(offset + context.hash_len()))
+                    .ok_or(EPROTO)?,
+                GFP_KERNEL,
+            )?;
+            offset += context.hash_len();
+
+            slot_mask &= !(1 << slot);
+        }
+
+        if context.version >= SPDM_VER_13 && (header.param2 & !header.param1 != 0) {
+            pr_err!("Malformed digests response\n");
+            return Err(EPROTO);
+        }
+
+        Ok(GetDigestsRsp {
+            header,
+            digests,
+            length: offset,
+            raw_bytes: unvalidated,
+        })
+    }
+}
-- 
2.56.0

