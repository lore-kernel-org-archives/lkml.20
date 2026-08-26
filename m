Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF313FD970
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762384; cv=none; b=qirq/1Zv3d41X9adi0xwDjvU8v3Id9UYW2Oi/pHtAqiAekVrnJqltazBhUmqEnJV3itCyJ06w6SZu57Ift1UzN0lQ6xrWpLoCRC+W0eYcy7FEabSIBOGQ6fEsnrlMW2fdVaVaFcyXmol9CmKRrTMYwpPrf3LgG1eJX1CiQAFPoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762384; c=relaxed/simple;
	bh=jtnFtijhuXehv2JsY3ahhh8tAjz2qcqPyXVFbFxneQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJPgyLZ2810qYChMgufM4hN+boutIo0k5pRg9AvZEx4i+nxQmt8ojY6qoLIzeCT4Bl6TOnfrOXl6jtlDL3cNJGxNNU6LsbSaoTYro+f+x7Vap938nGqMCf9X8haJgC5TQxoTqNu1hejuzJqbQKq++tdAR6NhKWP6OU+yPRg/Qjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=VTn9q+oe; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="VTn9q+oe"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso9982215e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762372; x=1788367172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVQl0TQaqGZPy1cFk7T2Duq6yICjnn5v/QGRI0kgw3c=;
        b=VTn9q+oeOuJ8Ouz3rhkPq2hAywanT62oNnJ6eVngO1InkL3WgaTzk0kT0lyxCL8ft7
         QiJxUA+IrqfT5nTRysJOLgPqAmOp2qGX+1mXKtjFpTqea/55S5f87rzLE40oShw+/uli
         Ul0loXZ1TzhoGHbi6r/9rEr5Yy3ynm1TCTsnlOmWKLiRYE6dWgBXFiOBCAs4qZXTPuYW
         D5tKxKETuBrF29dT2nQHoGAop2lUTqjC+7pAzAwhL1leYlL5GW+22JQrJ4UhHR76mO9w
         aNOLBSkm2kR9zkVVi5dI7mxPIhDqUKaTl+lUBHzL2TrcsDlHR0VJGizRbB05/Fgc+VH3
         cVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762372; x=1788367172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tVQl0TQaqGZPy1cFk7T2Duq6yICjnn5v/QGRI0kgw3c=;
        b=G/FLezjjagcnEwW41G0J6evNLBoMiAdhIZQS+z5xUaRiH8Mq5mgtGEzJNk3ExgEjsP
         O+JXWStFXAoKe/qBb7nX3h+xmLFgbCtpDmjOfJgNDt0ukEUksIpnlXAANJKSsBFxAb7F
         5Q3TuSt59BUjPzeF2lRukTUSzjTiGhi8kfNa9jpqMBmc0KvkwNm3zh5rgDLXnDgpJMOZ
         20bg1j8yn2/B2uajXjE9eBGL5Rqv8uKjiCGkEAMZ+zLOjVPkZ23evl9bToJykaAsXZog
         62Z2nuYueG+LDYlpK+gvkyRmtNaFR9PXISlikGy+yNnJu6/5PS4ClkyDimSU6TOzfJxp
         Ic/w==
X-Forwarded-Encrypted: i=1; AHgh+RrZyeWY9jCXP4Y8Ldn03ju6v6Ap1CkONOpeGd1ubvgyeNq4Eldv7aveEO+hiE244PFeS2PVE6kPijX04j8=@vger.kernel.org
X-Gm-Message-State: AFuF++n+Cowzmk8BdlZxGKwpXcwa7HPkleHfj1cSK26SMH5tRXgLdXdU
	ekywZeHkYT9d2y5Cqp96eWMTfIDaeF/FkQo+5XJqO3Lski+ifgSXn/opzAke1pmt5w==
X-Gm-Gg: AR+sD10YFhUH5wvUK5EalRXn96GaMFaWX0J1Ay5Sipd9MHHDrIdQuxO2YoJzUUZsNdP
	hhGSeYmHlxiuVGGfFwhvRCHCL9AQN+aZrgNsW/Fim3CmTpwUssnl9aWwgx0DnuS4UM9V/qzv0RT
	2eyXWYYqkR8ZwkDfE2g7Fe9ttXqQocfscMLnoimkf8tqayN4ZmC6wExHQlWnI1wPUCURenJXnkJ
	DW+KLCUKozd3W2ztUDRerP8Q171fDl7x5L7rkR7tyeyryB0k5qu4JgkJFIJuvFR89bQkGgKIQ9z
	A0OPV13x4ITKaUGMl9rUnl74kYWA5UxHEiCXitRVKvzIJUiBhB5fnn4nO23A/6FKzghLdAnwriQ
	uYXhdCoiVOL21JiJF4duBvMLOl10XnMpaG+CPZXcmLfs423hilHKwB28KhuI1AlN7XUJ9MzGb9P
	RChBVdkWvCkqYkZ1Cn8sOIY7VVDSYNIdsbvXHE1FfqtbvMtbbcTYwmVg6CMjdfQLZsOOfbPuBYf
	MLzBvBnNTDt30uIHD0PyxpJgy7VsIYuF5KQ5A==
X-Received: by 2002:a05:600c:698c:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-499dc6f5dcdmr86286165e9.5.1787762372220;
        Wed, 26 Aug 2026 09:39:32 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5721a0sm21769715e9.4.2026.08.26.09.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:39:28 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/13] drm/vino: add the crypto primitives and the HDCP 2.2 AKE
Date: Wed, 26 Aug 2026 17:37:28 +0100
Message-ID: <20260826163913.7052-4-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163913.7052-1-mike@fireburn.co.uk>
References: <20260826163913.7052-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A DL3 dock authenticates as an HDCP 2.2 receiver before it will accept any
configuration, and every later control message is sealed with keys the
authentication establishes. The KDFs are the published HDCP 2.2 ones; what
is not published is that the dock whitens the session key with a fixed
device constant, and that the two nonces derived from the delivered random
IV differ by one bit each and are not interchangeable.

Add the AES, CMAC and RNG wrappers, the HDCP key hierarchy documented once
in one place, and the AKE itself, with the KUnit known-answer vectors that
pin them.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 drivers/gpu/drm/vino/ake.rs    | 175 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vino/crypto.rs |  90 +++++++++++++++++
 drivers/gpu/drm/vino/hdcp.rs   | 146 +++++++++++++++++++++++++++
 drivers/gpu/drm/vino/rng.rs    |   9 ++
 4 files changed, 420 insertions(+)
 create mode 100644 drivers/gpu/drm/vino/ake.rs
 create mode 100644 drivers/gpu/drm/vino/crypto.rs
 create mode 100644 drivers/gpu/drm/vino/hdcp.rs
 create mode 100644 drivers/gpu/drm/vino/rng.rs

diff --git a/drivers/gpu/drm/vino/ake.rs b/drivers/gpu/drm/vino/ake.rs
new file mode 100644
index 000000000000..54d24ca2d096
--- /dev/null
+++ b/drivers/gpu/drm/vino/ake.rs
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! HDCP 2.2 AKE wire layer: byte-exact message builders for the state machine.
+//! The dock validates fixed per-message `sub_size` and `sub_len_dw` values, so
+//! the vendor framing records those values explicitly rather than deriving them.
+//!
+//! OUT body layout (sec 5.1), after the 16-byte sec 3 transport header:
+//! ```text
+//!   body[0..2]   u16 sub_size      (fixed per message)
+//!   body[2..4]   u16 = 0x0010
+//!   body[4..8]   u32 hdcp_seq      increments 1..7 across the AKE OUT messages
+//!   body[8..22]  14 zero bytes
+//!   body[22..26] u32 = 0x00000030  marker
+//!   body[26]     u8  = 0x00        flag
+//!   body[27]     u8  = msg_id
+//!   body[28..]   HDCP payload (zero-padded to the fixed body length)
+//! ```
+
+use super::*;
+
+/// HDCP 2.2 message IDs (sec 5.3). `pub(crate)` so the AKE state machine
+/// ([`super::VinoDriver::run_ake`]) can match on the response IDs too.
+pub(crate) mod id {
+    use kernel::drm::display::hdcp::MessageId;
+
+    // Standard HDCP 2.2 message IDs: reuse the canonical values from
+    // `<drm/display/drm_hdcp.h>` rather than redefining them, so vino stays in
+    // lockstep with the kernel's HDCP definitions. Only the transport framing
+    // around these (the DisplayLink type/sub/ctr header) is vino-specific.
+    pub(crate) const AKE_INIT: u8 = MessageId::AKE_INIT.as_u8();
+    pub(crate) const AKE_SEND_CERT: u8 = MessageId::AKE_SEND_CERT.as_u8();
+    pub(crate) const AKE_NO_STORED_KM: u8 = MessageId::AKE_NO_STORED_KM.as_u8();
+    pub(crate) const AKE_SEND_H_PRIME: u8 = MessageId::AKE_SEND_H_PRIME.as_u8();
+    pub(crate) const LC_INIT: u8 = MessageId::LC_INIT.as_u8();
+    pub(crate) const LC_SEND_L_PRIME: u8 = MessageId::LC_SEND_L_PRIME.as_u8();
+    pub(crate) const SKE_SEND_EKS: u8 = MessageId::SKE_SEND_EKS.as_u8();
+    pub(crate) const REPEATERAUTH_SEND_RECEIVERID_LIST: u8 =
+        MessageId::REPEATERAUTH_SEND_RECEIVERID_LIST.as_u8();
+    pub(crate) const REPEATERAUTH_SEND_ACK: u8 = MessageId::REPEATERAUTH_SEND_ACK.as_u8();
+    pub(crate) const REPEATERAUTH_STREAM_MANAGE: u8 = MessageId::REPEATERAUTH_STREAM_MANAGE.as_u8();
+    pub(crate) const REPEATERAUTH_STREAM_READY: u8 = MessageId::REPEATERAUTH_STREAM_READY.as_u8();
+
+    // DisplayLink-specific message IDs with no `<drm/display/drm_hdcp.h>` equivalent
+    // (the AKE_Send_rrx split and the transmitter/receiver-info + auth-status messages
+    // the DL3 dock uses), kept as literals.
+    pub(crate) const AKE_SEND_RRX: u8 = 0x06;
+    pub(crate) const RECEIVER_AUTH_STATUS: u8 = 0x12;
+    pub(crate) const AKE_TRANSMITTER_INFO: u8 = 0x13;
+}
+
+/// transport `sub_id` for HDCP OUT messages (type=4 sub=0x04, sec 5.1).
+const SUB_HDCP: u16 = 0x04;
+
+/// Allocate a `body_len`-byte zeroed body with the sec 5.1 header filled in
+/// (`sub_size`, the `0x0010` marker, `hdcp_seq`, the `0x30` marker and `msg_id`).
+/// The caller writes the payload into `body[28..]`.
+fn body(body_len: usize, sub_size: u16, hdcp_seq: u32, msg_id: u8) -> Result<KVec<u8>> {
+    let mut b = KVec::from_elem(0u8, body_len, GFP_KERNEL)?;
+    b[0..2].copy_from_slice(&sub_size.to_le_bytes());
+    b[2..4].copy_from_slice(&0x0010u16.to_le_bytes());
+    b[4..8].copy_from_slice(&hdcp_seq.to_le_bytes());
+    b[22..26].copy_from_slice(&0x0000_0030u32.to_le_bytes());
+    b[27] = msg_id;
+    Ok(b)
+}
+
+/// Wrap a finished HDCP body in the vendor transport header (type=4 sub=0x04)
+/// with the message's fixed `sub_len_dw` and transport `seq`.
+fn wrap(sub_len_dw: u16, seq: u32, body: &[u8]) -> Result<KVec<u8>> {
+    let mut frame = KVec::with_capacity(16 + body.len(), GFP_KERNEL)?;
+    proto::push_frame_with(&mut frame, 0x04, SUB_HDCP, sub_len_dw, seq, body)?;
+    Ok(frame)
+}
+
+/// `session-init ACK` (the `id=0x14 sub=0x76` frame).
+///
+/// This precedes `AKE_Init`, so AKE uses `hdcp_seq` 2..8. It is a minimal
+/// `0x14 / 0x76 / hdcp_seq` header: a 32-byte body without a message payload or the
+/// `0x0010 / 0x30 / msg_id` trailer written by [`body`], wrapped with `sub_len_dw=0x0a`. The dock
+/// echoes it as a `msg_id=0` status frame that `recv_hdcp` skips.
+pub(super) fn session_init_ack(hdcp_seq: u32, seq: u32) -> Result<KVec<u8>> {
+    let mut b = KVec::from_elem(0u8, 32, GFP_KERNEL)?;
+    b[0..2].copy_from_slice(&0x0014u16.to_le_bytes());
+    b[2..4].copy_from_slice(&0x0076u16.to_le_bytes());
+    b[4..8].copy_from_slice(&hdcp_seq.to_le_bytes());
+    wrap(0x000a, seq, &b)
+}
+
+/// `AKE_Init` (msg_id 0x02): `rtx[8] || TxCaps[3]`, padded to a 48-byte body
+/// (`sub_size=0x22`, `sub_len_dw=0x0c`).
+pub(super) fn ake_init(
+    hdcp_seq: u32,
+    seq: u32,
+    rtx: &[u8; drm_hdcp::RTX_LEN],
+    tx_caps: &[u8; 3],
+) -> Result<KVec<u8>> {
+    let mut b = body(48, 0x0022, hdcp_seq, id::AKE_INIT)?;
+    b[28..36].copy_from_slice(rtx);
+    b[36..39].copy_from_slice(tx_caps);
+    wrap(0x000c, seq, &b)
+}
+
+/// `AKE_Transmitter_Info` (msg_id 0x13): byte-exact vendor framing
+/// (`sub_size=0x1f`, `sub_len_dw=0x0f`), payload `00 06 02 00 02`.
+pub(super) fn ake_transmitter_info(hdcp_seq: u32, seq: u32) -> Result<KVec<u8>> {
+    let mut b = body(48, 0x001f, hdcp_seq, id::AKE_TRANSMITTER_INFO)?;
+    b[28..33].copy_from_slice(&[0x00, 0x06, 0x02, 0x00, 0x02]);
+    wrap(0x000f, seq, &b)
+}
+
+/// `AKE_No_Stored_km` (msg_id 0x04): the 128-byte RSA-OAEP-SHA256 `Ekpub(km)`
+/// in a 160-byte body (`sub_size=0x9a`, `sub_len_dw=0x04`).
+pub(super) fn ake_no_stored_km(
+    hdcp_seq: u32,
+    seq: u32,
+    ekpub_km: &[u8; drm_hdcp::ENCRYPTED_MASTER_KEY_LEN],
+) -> Result<KVec<u8>> {
+    let mut b = body(160, 0x009a, hdcp_seq, id::AKE_NO_STORED_KM)?;
+    b[28..156].copy_from_slice(ekpub_km);
+    wrap(0x0004, seq, &b)
+}
+
+/// `LC_Init` (msg_id 0x09): `rn[8]` in a 48-byte body
+/// (`sub_size=0x22`, `sub_len_dw=0x0c`).
+pub(super) fn lc_init(hdcp_seq: u32, seq: u32, rn: &[u8; drm_hdcp::RN_LEN]) -> Result<KVec<u8>> {
+    let mut b = body(48, 0x0022, hdcp_seq, id::LC_INIT)?;
+    b[28..36].copy_from_slice(rn);
+    wrap(0x000c, seq, &b)
+}
+
+/// `SKE_Send_Eks` (msg_id 0x0b): `Edkey(ks)[16] || riv[8]` in a 64-byte body
+/// (`sub_size=0x32`, `sub_len_dw=0x0c`).
+pub(super) fn ske_send_eks(
+    hdcp_seq: u32,
+    seq: u32,
+    edkey_ks: &[u8; drm_hdcp::ENCRYPTED_SESSION_KEY_LEN],
+    riv: &[u8; drm_hdcp::RIV_LEN],
+) -> Result<KVec<u8>> {
+    let mut b = body(64, 0x0032, hdcp_seq, id::SKE_SEND_EKS)?;
+    b[28..44].copy_from_slice(edkey_ks);
+    b[44..52].copy_from_slice(riv);
+    wrap(0x000c, seq, &b)
+}
+
+/// `RepeaterAuth_Send_ACK` (msg_id 0x0f): the full `V[16]` in a 48-byte body
+/// (`sub_size=0x2a`, `sub_len_dw=0x04`).
+pub(super) fn repeater_auth_send_ack(
+    hdcp_seq: u32,
+    seq: u32,
+    v: &[u8; drm_hdcp::V_PRIME_HALF_LEN],
+) -> Result<KVec<u8>> {
+    let mut b = body(48, 0x002a, hdcp_seq, id::REPEATERAUTH_SEND_ACK)?;
+    b[28..44].copy_from_slice(v);
+    wrap(0x0004, seq, &b)
+}
+
+/// `RepeaterAuth_Stream_Manage` SM2 (msg_id 0x10): `k=2`,
+/// `StreamID_Type[0]=4` and `StreamID_Type[1]=5`.
+pub(super) fn repeater_auth_stream_manage(hdcp_seq: u32, seq: u32) -> Result<KVec<u8>> {
+    let mut b = body(48, 0x002d, hdcp_seq, id::REPEATERAUTH_STREAM_MANAGE)?;
+    b[32..36].copy_from_slice(&[0x02, 0, 0, 0]); // k = 2 (LE)
+    b[36..40].copy_from_slice(&[0x04, 0, 0, 0]); // StreamID_Type[0]
+    b[43] = 0x05; // StreamID_Type[1]
+    wrap(0x0001, seq, &b)
+}
+
+/// Parse an IN HDCP message body (sec 5.2): `body[8]` marker, `body[9]` msg_id,
+/// `body[10..]` payload (for `AKE_Send_Cert`, `body[10]` is a version flag).
+/// Returns `(msg_id, payload)`.
+pub(super) fn parse_in(body: &[u8]) -> Option<(u8, &[u8])> {
+    if body.len() < 10 {
+        return None;
+    }
+    Some((body[9], &body[10..]))
+}
diff --git a/drivers/gpu/drm/vino/crypto.rs b/drivers/gpu/drm/vino/crypto.rs
new file mode 100644
index 000000000000..4fc14b8bd70c
--- /dev/null
+++ b/drivers/gpu/drm/vino/crypto.rs
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Thin adapters onto the shared [`kernel::crypto`] library-crypto bindings, so the
+//! protocol code keeps its `crypto::aes128_ecb` / `crypto::hmac_sha256` call sites.
+
+use super::*;
+
+/// An AES-128 key prepared once for single-block encryption; re-exported so the
+/// AES-CTR keystream loops in [`cp`](super::cp) can expand the key once and reuse
+/// it across every block (rather than re-expanding per block).
+pub(super) use kernel::crypto::Aes128;
+
+/// `AES_ECB(key, block)` -- one 16-byte AES-128 block. Convenience one-shot for
+/// callers that encrypt a single block (e.g. HDCP dKey derivation); the AES-CTR
+/// paths build an [`Aes128`] once and call [`Aes128::encrypt_block`] in a loop.
+pub(super) fn aes128_ecb(key: &[u8; 16], block: &[u8; 16]) -> Result<[u8; 16]> {
+    Ok(Aes128::new(key)?.encrypt_block(block))
+}
+
+/// `HMAC-SHA256(key, data)`.
+pub(super) fn hmac_sha256(key: &[u8], data: &[u8]) -> [u8; 32] {
+    kernel::crypto::hmac_sha256(key, data)
+}
+
+/// `AES-CMAC-128(key, data)` (RFC 4493) via the in-tree AES-CMAC library.
+/// This is DisplayLink's "Dl3Cmac" core -- the CP per-message integrity tag is
+/// `AES_CMAC(ks, nonce8 || BE64(counter) || content)` (see `cp::dl3cmac_tag`).
+pub(super) fn aes_cmac(key: &[u8; 16], data: &[u8]) -> [u8; 16] {
+    kernel::crypto::aes_cmac(key, data)
+}
+
+/// `SHA256(data)`.
+pub(super) fn sha256(data: &[u8]) -> [u8; 32] {
+    kernel::crypto::sha256(data)
+}
+
+#[cfg(CONFIG_DRM_VINO_KUNIT_TEST)]
+#[kunit_tests(vino_crypto)]
+mod tests {
+    use super::*;
+
+    #[test]
+    fn aes128_ecb_fips197_kat() -> Result {
+        // FIPS-197 / NIST SP800-38A F.1.1 AES-128 ECB known-answer vector.
+        let key = [
+            0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf,
+            0x4f, 0x3c,
+        ];
+        let plaintext = [
+            0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93,
+            0x17, 0x2a,
+        ];
+        assert_eq!(
+            aes128_ecb(&key, &plaintext)?,
+            [
+                0x3a, 0xd7, 0x7b, 0xb4, 0x0d, 0x7a, 0x36, 0x60, 0xa8, 0x9e, 0xca, 0xf3, 0x24, 0x66,
+                0xef, 0x97,
+            ]
+        );
+        Ok(())
+    }
+
+    #[test]
+    fn aes_cmac_rfc4493_kat() -> Result {
+        // RFC 4493 sec 4 AES-CMAC test vectors (same key as above).
+        let key = [
+            0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf,
+            0x4f, 0x3c,
+        ];
+        assert_eq!(
+            aes_cmac(&key, &[]),
+            [
+                0xbb, 0x1d, 0x69, 0x29, 0xe9, 0x59, 0x37, 0x28, 0x7f, 0xa3, 0x7d, 0x12, 0x9b, 0x75,
+                0x67, 0x46,
+            ]
+        );
+        let msg = [
+            0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93,
+            0x17, 0x2a,
+        ];
+        assert_eq!(
+            aes_cmac(&key, &msg),
+            [
+                0x07, 0x0a, 0x16, 0xb4, 0x6b, 0x4d, 0x41, 0x44, 0xf7, 0x9b, 0xdd, 0x9d, 0xd0, 0x4a,
+                0x28, 0x7c,
+            ]
+        );
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/drm/vino/hdcp.rs b/drivers/gpu/drm/vino/hdcp.rs
new file mode 100644
index 000000000000..5118c9388cc3
--- /dev/null
+++ b/drivers/gpu/drm/vino/hdcp.rs
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! HDCP 2.2 key derivation and verifier computation, built on [`crypto`].
+//!
+//! # The key hierarchy
+//!
+//! Every key below is per-session: they are established once by the AKE and SKE exchanges at
+//! bring-up and then used for the life of the link. Nothing here is per-frame. The names are the
+//! ones the HDCP 2.2 specification uses, so that a reader can follow the spec alongside the code,
+//! and this is the one place that says how they relate.
+//!
+//! ```text
+//!   km   (16 bytes, host random)        AKE master key. Sent to the dock RSA-OAEP encrypted
+//!    |                                  under its public key, so only the dock recovers it.
+//!    |
+//!    +-- dkey_0, dkey_1  (rn = 0)  -->  kd = dkey_0 || dkey_1   (32 bytes)
+//!    |                                  The derived key. Not a content key: it exists to prove
+//!    |                                  both ends hold km, via H', L' and V.
+//!    |
+//!    +-- dkey_2          (rn = SKE nonce)
+//!                                  -->  masks ks in transit:
+//!                                       edkey = ks XOR (dkey_2 with its low 8 bytes XOR rrx)
+//!
+//!   ks   (16 bytes, host random)        SKE content session key. Delivered under the mask above,
+//!    |                                  never in clear.
+//!    |
+//!    +-- XOR CP_KEY_WHITEN         -->  the control-plane seal key (see [`cp`](super::cp))
+//!
+//!   riv  (8 bytes)                      Content random IV, delivered beside ks. Nonces for the
+//!                                       control plane are derived from it by fixed byte flips.
+//! ```
+//!
+//! `kd` and `ks` are easy to confuse and are not interchangeable: `kd` is 32 bytes and
+//! authenticates, `ks` is 16 bytes and encrypts. Both come from `km`, by different derivations.
+
+use super::*;
+
+/// `dkey_n = AES_ECB(km with low-8-bytes XOR rn, rtx || (rrx with byte15 XOR n))`
+/// (HDCP 2.2 IIA sec 2.7, sec 5.6). The counter `n` XORs into byte 15 (LSB of the rrx
+/// half) of the IV; `rn` XORs into the low 8 bytes (km[8..16]) of the key -- zero
+/// for the `kd` derivation, the SKE nonce for `dkey_2`.
+fn derive_dkey(
+    km: &[u8; drm_hdcp::ENCRYPTED_SESSION_KEY_LEN],
+    rn: &[u8; drm_hdcp::RN_LEN],
+    rtx: &[u8; drm_hdcp::RTX_LEN],
+    rrx: &[u8; drm_hdcp::RRX_LEN],
+    n: u8,
+) -> Result<kernel::crypto::Secret<{ drm_hdcp::ENCRYPTED_SESSION_KEY_LEN }>> {
+    let mut iv = [0u8; kernel::crypto::AES128_BLOCK_SIZE];
+    iv[..drm_hdcp::RTX_LEN].copy_from_slice(rtx);
+    iv[drm_hdcp::RTX_LEN..].copy_from_slice(rrx);
+    iv[kernel::crypto::AES128_BLOCK_SIZE - 1] ^= n;
+    let mut key = kernel::crypto::Secret::new(*km);
+    for i in 0..drm_hdcp::RN_LEN {
+        key[kernel::crypto::AES128_BLOCK_SIZE - drm_hdcp::RN_LEN + i] ^= rn[i];
+    }
+    Ok(kernel::crypto::Secret::new(crypto::aes128_ecb(&key, &iv)?))
+}
+
+/// `kd = dkey_0 || dkey_1` with `rn = 0` (sec 5.6) -- the 256-bit derived key.
+pub(super) fn derive_kd(
+    km: &[u8; drm_hdcp::ENCRYPTED_SESSION_KEY_LEN],
+    rtx: &[u8; drm_hdcp::RTX_LEN],
+    rrx: &[u8; drm_hdcp::RRX_LEN],
+) -> Result<kernel::crypto::Secret<32>> {
+    let rn = [0u8; drm_hdcp::RN_LEN];
+    let dkey0 = derive_dkey(km, &rn, rtx, rrx, 0)?;
+    let dkey1 = derive_dkey(km, &rn, rtx, rrx, 1)?;
+    let mut kd = kernel::crypto::Secret::zeroed();
+    kd[..kernel::crypto::AES128_BLOCK_SIZE].copy_from_slice(&dkey0[..]);
+    kd[kernel::crypto::AES128_BLOCK_SIZE..].copy_from_slice(&dkey1[..]);
+    Ok(kd)
+}
+
+/// `H' = HMAC-SHA256(kd, rtx with byte7 ^= repeater)` (sec 5.6).
+pub(super) fn compute_h(
+    kd: &[u8; 32],
+    rtx: &[u8; drm_hdcp::RTX_LEN],
+    repeater: bool,
+) -> [u8; drm_hdcp::H_PRIME_LEN] {
+    let mut msg = *rtx;
+    msg[drm_hdcp::RTX_LEN - 1] ^= repeater as u8;
+    crypto::hmac_sha256(kd, &msg)
+}
+
+/// `L' = HMAC-SHA256(kd with low-8-bytes XOR rrx, rn)` (sec 5.6).
+///
+/// "low-8-bytes" is the *least-significant* 64 bits of the 256-bit `kd`, i.e.
+/// `kd[24..32]`.
+pub(super) fn compute_l(
+    kd: &[u8; 32],
+    rrx: &[u8; drm_hdcp::RRX_LEN],
+    rn: &[u8; drm_hdcp::RN_LEN],
+) -> [u8; drm_hdcp::L_PRIME_LEN] {
+    let mut key = kernel::crypto::Secret::new(*kd);
+    for i in 0..drm_hdcp::RRX_LEN {
+        key[32 - drm_hdcp::RRX_LEN + i] ^= rrx[i];
+    }
+    crypto::hmac_sha256(&key[..], rn)
+}
+
+/// Full `V = HMAC-SHA256(kd, list_header)` (256 bits) for RepeaterAuth (sec 2.3).
+///
+/// The MSB 128 bits (`[..16]`) are `V'` from the receiver ID list. The LSB 128 bits (`[16..]`)
+/// are sent in `RepeaterAuth_Send_Ack`; echoing `V'` there prevents the dock from completing
+/// repeater authentication.
+pub(super) fn compute_v_full(kd: &[u8; 32], list_header: &[u8]) -> [u8; 32] {
+    crypto::hmac_sha256(kd, list_header)
+}
+
+/// RSA-OAEP-SHA256 encrypt the 16-byte master key `km` under the dock's
+/// RSA-1024 public key (`modulus[128]`, `exponent`), giving the 128-byte
+/// `Ekpub(km)` for `AKE_No_Stored_km` (sec 5.4). Generates a fresh OAEP seed.
+pub(super) fn oaep_encrypt_km(
+    key: &mut kernel::crypto::akcipher::RsaPublicKey,
+    km: &[u8; drm_hdcp::ENCRYPTED_SESSION_KEY_LEN],
+) -> Result<[u8; drm_hdcp::ENCRYPTED_MASTER_KEY_LEN]> {
+    let mut seed = kernel::crypto::Secret::zeroed();
+    super::rng::fill(&mut seed[..]);
+    let mut out = [0u8; drm_hdcp::ENCRYPTED_MASTER_KEY_LEN];
+    key.oaep_sha256_encrypt(km, &seed, &mut out, GFP_KERNEL)?;
+    Ok(out)
+}
+
+/// SKE: `Edkey(ks) = ks XOR (dkey_2 with low-8-bytes XOR rrx)` (sec 5.6).
+///
+/// `dkey_2` is derived with the SKE nonce `rn` mixed into the key; `rrx` then
+/// XORs into the low 8 bytes (`dkey_2[8..16]`) of the mask. The result is the
+/// 16-byte `Edkey_ks` carried by `SKE_Send_Eks` (msg_id 0x0b).
+pub(super) fn compute_eks(
+    km: &[u8; drm_hdcp::ENCRYPTED_SESSION_KEY_LEN],
+    rtx: &[u8; drm_hdcp::RTX_LEN],
+    rrx: &[u8; drm_hdcp::RRX_LEN],
+    rn: &[u8; drm_hdcp::RN_LEN],
+    ks: &[u8; drm_hdcp::ENCRYPTED_SESSION_KEY_LEN],
+) -> Result<[u8; drm_hdcp::ENCRYPTED_SESSION_KEY_LEN]> {
+    let mut mask = derive_dkey(km, rn, rtx, rrx, 2)?;
+    for i in 0..drm_hdcp::RRX_LEN {
+        mask[kernel::crypto::AES128_BLOCK_SIZE - drm_hdcp::RRX_LEN + i] ^= rrx[i];
+    }
+    let mut edkey_ks = [0u8; drm_hdcp::ENCRYPTED_SESSION_KEY_LEN];
+    for i in 0..drm_hdcp::ENCRYPTED_SESSION_KEY_LEN {
+        edkey_ks[i] = ks[i] ^ mask[i];
+    }
+    Ok(edkey_ks)
+}
diff --git a/drivers/gpu/drm/vino/rng.rs b/drivers/gpu/drm/vino/rng.rs
new file mode 100644
index 000000000000..c34766322edd
--- /dev/null
+++ b/drivers/gpu/drm/vino/rng.rs
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Cryptographically-secure randomness for the per-session HDCP nonces/keys
+//! (`rtx`, `km`, `rn`, `ks`, `riv`, the OAEP seed).
+
+/// Fills `buf` with random bytes from the kernel CSPRNG.
+pub(super) fn fill(buf: &mut [u8]) {
+    kernel::random::fill_bytes(buf);
+}
