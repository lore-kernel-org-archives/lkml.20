Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284446;
	b=TvwF1PHsCAhAoKVO0eMei5EGMxEVUJXyB5GtD7coPuoJ1AnOLEetQIKgLp51uObI3OkR
	 W1H8qMe2EdM+LFPAUzQs1QbRUpTa34WUDdKQu/yXGuZGFhqJEjUbaT9w4KzMiO0g54AnQ
	 ZH3nCAGFRNhwXLaE7w6OT6u7X99E/WPF6hwNSztWuB/Ie8kacLAu+noaT4np/iJD2JRX8
	 wzv+9VFmbCTxG5qA29KUA6bi0lR7lt0zp6yAjUrMAONE0aWRllXAmIq69jnsbZtXcMCXL
	 uXLg26BygybrFsr2NxQTxgc6TVlI39bo0Jq72N6HJf9OSoOjICpqwMHaygbHsxvIAGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=HrFSDojbDaesV6HtIZlkvVOjVzmaKFDGfU9+ooggeTo=;
	b=XLTsdH3zM1/hXmOBTVLhhblHC0Ys1339MeZAkD9gaWrC2OLIyGa2hYAgpzl40R7VJ3Nq
	 2yEJDTCs7PYUt3EOUBwbWYQWToGzh4IR9X/HNWcVRlpmRhIUCRb2n7nQ/60tdP+cPriQI
	 HsCmCyNylqPJRzZoMkLA++5bh46uecEEBmFGr67pC5THttq8bMDapmvEempjNLHUNEtXa
	 JTaE+Gw9+LwTO9n/9nqvNXjGsLzsl785wIjaLj9gyEa6Cmn8jQ16m7xmgqnzyJfteUq9h
	 2ZuIhUzzz0gETG86rSKeqChmz8W9muWT4s3Vchnh0RitgreiUdJJjGsVo/zxqNrp5Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wvHnrrV+;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A6560A2602
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9A6560A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wvHnrrV+
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2761c69fbso2159186c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284445; x=1794889245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HrFSDojbDaesV6HtIZlkvVOjVzmaKFDGfU9+ooggeTo=;
        b=wvHnrrV+iHBiBk55YGEa0ghkA4ON3iG0KnpRaeNYnUc3LWAEL1MhcCp6XyE/oM3Qbi
         rqDhXLl1963Z71WxHgoMgjEe4Si1drYcO0JCFwmF1Pl3pgDJZsfYxLbo2NT+v9v77i12
         AhLlZwFaazZgmmP6RaBkoTqvQ6s1O//IsNvp9VyXs5npUaxz9Vhl4qms+vGLJZujN7to
         2oXi8EVN8PPOfJ9h7Du7gMp+P6govTwuFCEMg0gFkc0NXeHGselD3S0/+cbDjl5UNIcQ
         HNMh+C4Y3x596IFpNTBeanyi4wO4/PezEeIdb+ly3m+EMvpFLJUfk1i+97YK8gkF+2ZE
         uGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284445; x=1794889245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HrFSDojbDaesV6HtIZlkvVOjVzmaKFDGfU9+ooggeTo=;
        b=rWEvHjHVOe4XlFkESi+ZXvdFs58CfNWMuCH22xFj9cLKoKTAFbee6NtXoT6dC3bYkC
         GM2w6IPZqdMNpQvY/TtBXHItnysHDSnyZtH3bu1WKUBYnj9D5DVILRLdIA5c0RQEZ4gh
         cMXFTQYKllI7obQ2+2IdAZN3h/lKzu2WhLqymeR0KNLPyQWsKMr+UQYCGW82mMRqi88u
         f4QwlUOrZta9NZySWJNYF7qaNEvpJ4jz4RT8aTuSa+cq+l+NGaU565PAB5jf6c1Pm1rr
         UMlJN710nsFzYxoad7FTEdiZe3qFDARjScWoVToj3NI0gF8lAXx5390nZNSmKMlEfN0C
         YStg==
X-Forwarded-Encrypted: i=1; AL+hErHvYeYY2lrhUO6PNvEOTqzN5/Nd7VrdvTdI+FvdMpXmOKwe2/oHI14UQv6xiVMBVKE7hcpaG6YXFKKpQxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GIw3k6vVsRO42LLigvT1NFg7Vreh2fnswRtNeWb+L93A4tdZi
	W6jQebPbCb/04Bi9qj6rYN4AadEIycauj8XWX/Sys67bRQOXw0epSGEH
X-Gm-Gg: AYBFou3hQ9OPgmsOgVRsAUjpM8Tnf/cK+ELCZaECoAzQ/Z3MBNp5XTliw9CYsWfyjO4
	NUzF6VRQr3Wb8HE4o8u86z2/T3yJruFLiEG00ZCmf54RKp851Nqj+96E/ssFsD2U4wpIZ6REsAk
	/u/mMcHaDvtGemdjApFlKs8vTNhiJongZ196NO3dsZQA/z9mIkDBRE01deDxqFS1K1lU5jL8O9b
	tDwoaWGEzLDWSMfwxLii/I7dPn/Uobxs4RkOW6P7fgRL65MCGuRFmXbn7IxfugyzyFENu6pHMQp
	n3H2rMH4KXMeGWIOF8SczC8gr76i6UAmvnr4xWolcp18cwjYLJ+rS3KvFlpATM5jxeXLeAQnWYD
	90dZnpgrbyL5wdS4AL0n60mbHrX2vB31qJ7tJEWioSpq6FcJIgwCva6DaeFxGhn8c4wtq13wB7A
	/rDDmzOSk0XClsTv8luWYjFRywywp9Z83lNt8mTb7grNbf4+HvpPQVSqXvJ6PSH1jhSEjq3SGPp
	p1BxTb1MBpalIq7dKDGLl7kEwKl/KFr7hNP7EmUW8iPQrJ7TLw60ZMw35Gc6JUC5TOQRcCn0h/a
	y2Os0OCPwPxm2vcLXVjbirGV/o+fyj5gOqMXh50OxL+2RJk=
X-Received: by 2002:a05:701b:42cc:10b0:1a4:3fa7:adef with SMTP id a92af1059eb24-1b3b619eeb8mr2108583c88.47.1794284444835;
        Mon, 09 Nov 2026 20:20:44 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:20:44 -0800 (PST)
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
	Alistair Francis <alistair.francis@wdc.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v6 14/25] lib: rspdm: Support SPDM get_version
Date: Tue, 10 Nov 2026 14:18:21 +1000
Message-ID: <20261110041832.1730924-15-alistair.francis@wdc.com>
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

Support the GET_VERSION SPDM command.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 lib/rspdm/consts.rs    | 17 +++++++-
 lib/rspdm/lib.rs       | 25 +++++++++++-
 lib/rspdm/state.rs     | 50 ++++++++++++++++++++++-
 lib/rspdm/validator.rs | 90 +++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 176 insertions(+), 6 deletions(-)

diff --git a/lib/rspdm/consts.rs b/lib/rspdm/consts.rs
index 6fe4dbdd67204..2470c7ac5e4d0 100644
--- a/lib/rspdm/consts.rs
+++ b/lib/rspdm/consts.rs
@@ -7,14 +7,27 @@
 //! Rust implementation of the DMTF Security Protocol and Data Model (SPDM)
 //! <https://www.dmtf.org/dsp/DSP0274>
 
+use crate::validator::SpdmHeader;
+use core::mem;
+
 // SPDM versions supported by this implementation
 pub(crate) const SPDM_VER_10: u8 = 0x10;
+#[expect(dead_code)]
+pub(crate) const SPDM_VER_11: u8 = 0x11;
+#[expect(dead_code)]
+pub(crate) const SPDM_VER_12: u8 = 0x12;
+#[expect(dead_code)]
+pub(crate) const SPDM_VER_13: u8 = 0x13;
+pub(crate) const SPDM_VER_14: u8 = 0x14;
 
 pub(crate) const SPDM_MIN_VER: u8 = SPDM_VER_10;
+pub(crate) const SPDM_MAX_VER: u8 = SPDM_VER_14;
 
-#[allow(dead_code)]
 pub(crate) const SPDM_REQ: u8 = 0x80;
-#[allow(dead_code)]
 pub(crate) const SPDM_ERROR: u8 = 0x7f;
 
+pub(crate) const SPDM_GET_VERSION: u8 = 0x84;
+pub(crate) const SPDM_GET_VERSION_LEN: usize =
+    mem::size_of::<SpdmHeader>() + 2 + (u8::MAX as usize) * mem::size_of::<u16>();
+
 pub(crate) const SPDM_MIN_DATA_TRANSFER_SIZE: u32 = 42; // SPDM 1.2.0 margin no 226
diff --git a/lib/rspdm/lib.rs b/lib/rspdm/lib.rs
index 7d87d19c9b782..61f0a1ff4a1ca 100644
--- a/lib/rspdm/lib.rs
+++ b/lib/rspdm/lib.rs
@@ -244,7 +244,30 @@ fn from(code: SpdmErrorCode) -> Self {
 /// `state_ptr` must be a valid pointer returned by a previous call to
 /// `spdm_create()` that has not yet been passed to `spdm_destroy()`.
 #[export]
-pub unsafe extern "C" fn spdm_authenticate(_state_ptr: *mut spdm_state) -> c_int {
+pub unsafe extern "C" fn spdm_authenticate(state_ptr: *mut spdm_state) -> c_int {
+    if state_ptr.is_null() {
+        return -(bindings::EINVAL as c_int);
+    }
+
+    // SAFETY: `state_ptr` was returned from `spdm_create()` which used `into_foreign()`
+    // to create the pointer, and it remains valid until `spdm_destroy()` is called.
+    // We only borrow here (rather than `from_foreign()`) so that ownership stays
+    // with the foreign (C) caller.
+    // The exclusive `&mut SpdmState` lives entirely inside the lock guard, so
+    // concurrent FFI callers serialize on the mutex and can never form
+    // aliased `&mut SpdmState` references.
+    let mutex = unsafe {
+        <Pin<KBox<Mutex<SpdmState<CTransport>>>> as ForeignOwnable>::borrow(
+            state_ptr.cast::<c_void>(),
+        )
+    };
+
+    let mut state = mutex.lock();
+
+    if let Err(e) = state.get_version() {
+        return e.to_errno() as c_int;
+    }
+
     -(EPROTONOSUPPORT as i32)
 }
 
diff --git a/lib/rspdm/state.rs b/lib/rspdm/state.rs
index 4f87441e84a67..e06578d204e74 100644
--- a/lib/rspdm/state.rs
+++ b/lib/rspdm/state.rs
@@ -18,10 +18,14 @@
 
 use crate::consts::{
     SPDM_ERROR,
+    SPDM_GET_VERSION_LEN,
+    SPDM_MAX_VER,
     SPDM_MIN_VER,
     SPDM_REQ, //
 };
 use crate::validator::{
+    GetVersionReq,
+    GetVersionRsp,
     SpdmErrorRsp,
     SpdmHeader, //
 };
@@ -99,7 +103,6 @@ pub(crate) fn new(
     ///
     /// The data in `request_buf` is sent to the device and the response
     /// is returned as untrusted data to be validated by the caller.
-    #[allow(dead_code)]
     pub(crate) fn spdm_exchange(
         &self,
         request_buf: &[u8],
@@ -145,4 +148,49 @@ pub(crate) fn spdm_exchange(
 
         Ok(Untrusted::new(response_buf))
     }
+
+    /// Negotiate a supported SPDM version and store the information
+    /// in the `SpdmState`.
+    pub(crate) fn get_version(&mut self) -> Result<(), Error> {
+        let mut request = GetVersionReq::default();
+        request.header.version = SPDM_MIN_VER;
+        self.version = SPDM_MIN_VER;
+
+        // Reset all negotiated session state as we are re-authenticating
+        self.data_transfer_sz = self.transport_sz;
+
+        let mut request_buf = request.to_bytes()?;
+
+        let response_vec: KVec<u8> = KVec::from_elem(0u8, SPDM_GET_VERSION_LEN, GFP_KERNEL)?;
+
+        let response: GetVersionRsp = self
+            .spdm_exchange(request_buf.as_mut_slice(), response_vec)?
+            .validate(&*self)?;
+
+        let mut foundver = false;
+        for &entry in response.version_number_entries.iter() {
+            let alpha_version = (entry & 0xF) as u8;
+            let version = (entry >> 8) as u8;
+
+            if alpha_version != 0 {
+                dev_warn!(
+                    &self.dev,
+                    "Ignoring alpha version {alpha_version} of {version:#x}\n"
+                );
+                continue;
+            }
+
+            if version >= self.version && version <= SPDM_MAX_VER {
+                self.version = version;
+                foundver = true;
+            }
+        }
+
+        if !foundver {
+            dev_err!(&self.dev, "No common supported version\n");
+            return Err(EPROTO);
+        }
+
+        Ok(())
+    }
 }
diff --git a/lib/rspdm/validator.rs b/lib/rspdm/validator.rs
index 2898b4c5ee412..234398734a536 100644
--- a/lib/rspdm/validator.rs
+++ b/lib/rspdm/validator.rs
@@ -7,11 +7,16 @@
 //! Rust implementation of the DMTF Security Protocol and Data Model (SPDM)
 //! <https://www.dmtf.org/dsp/DSP0274>
 
+use crate::consts::{
+    SPDM_GET_VERSION,
+    SPDM_MIN_VER, //
+};
 use crate::{
     SpdmErrorCode,
     SpdmState,
     Transport, //
 };
+use core::mem;
 use kernel::prelude::*;
 use kernel::{
     error::Error,
@@ -31,7 +36,6 @@ pub(crate) struct SpdmHeader {
 }
 
 impl SpdmHeader {
-    #[expect(dead_code)]
     pub(crate) fn new(code: u8) -> Self {
         SpdmHeader {
             version: 0,
@@ -41,7 +45,6 @@ pub(crate) fn new(code: u8) -> Self {
         }
     }
 
-    #[expect(dead_code)]
     pub(crate) fn to_bytes(&self) -> Result<KVec<u8>> {
         let mut out = KVec::new();
 
@@ -90,3 +93,86 @@ fn validate(unvalidated: &[u8], _context: &'c SpdmState<T>) -> Result<Self, Self
         })
     }
 }
+
+pub(crate) struct GetVersionReq {
+    pub(crate) header: SpdmHeader,
+}
+
+impl GetVersionReq {
+    pub(crate) fn to_bytes(&self) -> Result<KVec<u8>> {
+        self.header.to_bytes()
+    }
+}
+
+impl Default for GetVersionReq {
+    fn default() -> Self {
+        GetVersionReq {
+            header: SpdmHeader::new(SPDM_GET_VERSION),
+        }
+    }
+}
+
+#[expect(dead_code)]
+pub(crate) struct GetVersionRsp {
+    pub(crate) header: SpdmHeader,
+
+    pub(crate) version_number_entry_count: u8,
+    pub(crate) version_number_entries: KVec<u16>,
+
+    /// The actual length of the SPDM message. `raw_bytes` might be longer
+    /// as it includes transport specific padding.
+    length: usize,
+
+    /// Entire response, used for the transcript hash.
+    raw_bytes: KVec<u8>,
+}
+
+impl GetVersionRsp {
+    #[expect(dead_code)]
+    pub(crate) fn as_bytes(&self) -> Result<&[u8], Error> {
+        self.raw_bytes.get(..self.length).ok_or(EPROTO)
+    }
+}
+
+impl<'c, T: Transport> Validate<'c, Untrusted<KVec<u8>>, &'c SpdmState<T>> for GetVersionRsp {
+    type Err = Error;
+
+    fn validate(unvalidated: KVec<u8>, context: &'c SpdmState<T>) -> Result<Self, Self::Err> {
+        let header: SpdmHeader =
+            Untrusted::new(unvalidated.get(0..4).ok_or(EPROTO)?).validate(context)?;
+
+        if header.code != SPDM_GET_VERSION - 0x80 {
+            return Err(EPROTO);
+        }
+
+        if header.version != SPDM_MIN_VER {
+            return Err(EPROTO);
+        }
+
+        let version_number_entry_count = *unvalidated.get(5).ok_or(EPROTO)?;
+
+        // Entries follow header (4) + reserved (1) + count (1) = 6 bytes.
+        let mut offset = mem::size_of::<SpdmHeader>() + 2;
+
+        let mut version_number_entries = KVec::new();
+        for _ in 0..version_number_entry_count {
+            let entry = u16::from_le_bytes(
+                unvalidated
+                    .get(offset..offset + mem::size_of::<u16>())
+                    .ok_or(EPROTO)?
+                    .try_into()
+                    .map_err(|_| EPROTO)?,
+            );
+            version_number_entries.push(entry, GFP_KERNEL)?;
+            offset += mem::size_of::<u16>();
+        }
+
+        Ok(GetVersionRsp {
+            header,
+            version_number_entry_count,
+            version_number_entries,
+            length: offset,
+            raw_bytes: unvalidated,
+        })
+    }
+}
-- 
2.56.0

