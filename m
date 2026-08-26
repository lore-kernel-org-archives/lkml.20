Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FE7471276
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762392; cv=none; b=C7B68PB96qqROT8o/NTxuGJbHijxT+L1kBSOb6DxaZh2SQU4pZ8rZmD0148bdz0xqZnZXfwwgTrt1eEnBN/ORxUI9dp0cxpfmKj+3kaNVDA8prkaXKW+VWI59zfQB6tW3DQPHpTeJmVI4dWB/dxepuGtYEKYcHFhcTm1YZr6toI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762392; c=relaxed/simple;
	bh=sND+EKAZGOIaCzdBl4e1bIg1dxvfQ1z1FpGg5pU7gCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MMGC7b3+jXgwP7DaH1Adh+taYVZrKGpFYKtSDCT6oejn0Z1+hPIkpShXStDh28SovIn7rrTZDSosLjtYlABAekxQOvPDLDbOnLLSO12y9fp03bnShIN4AWv5ncDMSpuIx2KVBHuh0y8NwOFP62ZJq/lHAdGqfW/IYDlZlXRROCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=TAdYIkVe; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="TAdYIkVe"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so10778675e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762364; x=1788367164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrrOZsL3vYXF2u2Kt3CVUDHix7QRzLNfidL/nKYVB/c=;
        b=TAdYIkVe9NApesEv0F7zV5Ingy+JnuzpTtE0ipu4ic6sS18Hr+E5/jppn0o/1ighmL
         QUrMys4FZjSnjewTf2fqCYb6ojMmNNMzSdPJ3hkjuSGMM1k8J1+G13SFLCDPQHQ58j0n
         cUk3+KeqHB213iuglGh0E9mqVYt5bqIWaiKYqjSXot67FaLOAiie5bXv+KydgvDkSskX
         c2jN/+b6ggoiQVI8E0EEeJJWAiYg/xyg7NqzfvB21HfqaraE5R0yXOHlwJzMTJhnPJLb
         /caagWzpk2kXjOMcTpWq4ZIdM9uxf4UQVxqi/8nqRV6Ews2h91shyYxHHLCCXoLPTnVX
         XxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762364; x=1788367164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hrrOZsL3vYXF2u2Kt3CVUDHix7QRzLNfidL/nKYVB/c=;
        b=UKzZC3qnMypgDu7Y8WjnuyQahOZEVeVfzh1HCnPSsWPwq/K8rMOs3V0kZq6IN6VEAE
         f8il5EjvzNs1ThKDe9rjstktvMMAMaxjip1eZ4gvLY34uWGQ3/0PbhIKjIsA0Agg2WDW
         U901j63Mdaawd5ibpH1AhUz/5h4/fAFJconExQJ5ljyIZz2rqrQu6Befs9WzXZBYDqaF
         a464n3yOeyYG6cNGlrBiJasS/3jt11LUN0QIW/mb74LF/8IfCfHTTdscBVewWJaJOZz+
         8keWDaUQCiqYm0yoRppTltizeurrjHiSkgLezOk0b6NUu4Op/5xsvTmZqzL5AX8001v8
         5nVg==
X-Forwarded-Encrypted: i=1; AHgh+RrDXpMgpjCRSvmcqJ7y2iA0qPO1ojzT5PxaHoT8LhqkgzK5IlB+u/liZjxo+Kphh8vfyQ6vbC6ZZzABEBc=@vger.kernel.org
X-Gm-Message-State: AFuF++lHXxtU0g+rrgHrPwdecmbmvO9JrcJick/F77Rz4hvtKlAp0HEl
	MRnBRNnlgOSRJ4gT9Bh3a1VoxvaR9LnnqlDWNZ/BwqC8CCFWFCS4zJMfhk7oADLROw==
X-Gm-Gg: AR+sD10gD1E6Lg/2dK7si1tD4lkJokTZMO6l8eYIT+iToS5Td59lYSj6lQdQuEpsK1a
	6QNFtkanSsJ87Whq++515DwEKQNmkz9UWWtRCFS1LqpedurYUUKicx0I2fdHhPwOj/aI7FuRxPY
	JVBfQYd+fsn2yp2/gOlGcRb5y3kJIKtNm6e4PfTWZ1ZJOUFLF5bPpoBdzZZgwymjtbh/0JsPfJ7
	tqn6qmsz0REJcZ5V70DuLgVGJn5NEqzpdhC0ubx1WdhQhQpdtKQqvypt+7APpGPIUv3PfGY0NGg
	sQ3NW06FQxQvKiier25EUgjrWv3ab1QTJr8usHT60tUqT7B9JJ3sMl1/1KvZ/+Mg/6fRfxjxgYJ
	s96etk/v4ulgTS9SeTc16X+nUDBFce1/eYVH4FGPKm4Erqb98t3Fp8Y9iZeQnIZQVJTm4O7/yUz
	ERSDPioORmreoEgj1uckh5HP1s9MXLWLR19s3YTIOsvY0gsLVACegm1/mXG7wqxjR8oR/SB/7qa
	EcKqXQGYsM+xq1BP/gnd1Zken7N4RlMie5R
X-Received: by 2002:a05:600c:3144:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-499dc72548dmr77127255e9.10.1787762364021;
        Wed, 26 Aug 2026 09:39:24 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5721a0sm21769715e9.4.2026.08.26.09.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:39:22 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/13] drm/vino: add the DL3 wire framing
Date: Wed, 26 Aug 2026 17:37:26 +0100
Message-ID: <20260826163913.7052-2-mike@fireburn.co.uk>
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

Every message a DisplayLink DL3 dock exchanges, plaintext or sealed, sits
inside the same envelope: a length, an identifier, an auxiliary word and a
payload. The identifier is not a free-standing opcode -- on several replies
it doubles as the payload's length -- so decoding it wrongly matches a
reply by luck rather than by meaning.

Add the framing on its own, with no I/O and no crypto, so the layers above
can be read against a capture without carrying the envelope's rules.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 drivers/gpu/drm/vino/proto.rs | 71 +++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 drivers/gpu/drm/vino/proto.rs

diff --git a/drivers/gpu/drm/vino/proto.rs b/drivers/gpu/drm/vino/proto.rs
new file mode 100644
index 000000000000..f9a70b605135
--- /dev/null
+++ b/drivers/gpu/drm/vino/proto.rs
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! The DL3 "universal" wire framing and the plaintext session-init messages (sec 3/sec 4).
+
+use super::*;
+
+/// Append a sec 3-framed message to `out` with an explicit `sub_len_dw`: a 16-byte
+/// little-endian header (`pad(2) | size(2)=total-4 | type(4) | sub_id(2) |
+/// sub_len_dw(2) | seq(4)`) followed by `body`.
+///
+/// HDCP OUT messages carry fixed `sub_len_dw` values that are *not*
+/// `body.len() / 4`, so the framer cannot derive it -- the caller passes it.
+pub(super) fn push_frame_with(
+    out: &mut KVec<u8>,
+    msg_type: u32,
+    sub_id: u16,
+    sub_len_dw: u16,
+    seq: u32,
+    body: &[u8],
+) -> Result {
+    let size = ((16 + body.len()) - 4) as u16;
+    out.extend_from_slice(&[0, 0], GFP_KERNEL)?;
+    out.extend_from_slice(&size.to_le_bytes(), GFP_KERNEL)?;
+    out.extend_from_slice(&msg_type.to_le_bytes(), GFP_KERNEL)?;
+    out.extend_from_slice(&sub_id.to_le_bytes(), GFP_KERNEL)?;
+    out.extend_from_slice(&sub_len_dw.to_le_bytes(), GFP_KERNEL)?;
+    out.extend_from_slice(&seq.to_le_bytes(), GFP_KERNEL)?;
+    out.extend_from_slice(body, GFP_KERNEL)?;
+    Ok(())
+}
+
+/// `init_25` body (sec 4).
+///
+/// The `sub_len_dw` field is the fixed value zero rather than `body.len() / 4`; the dock rejects
+/// the derived value.
+pub(super) const INIT_25: [u8; 16] = [0x05, 0, 0x08, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
+/// `init_4` (Part A) body (sec 4), also framed with `sub_len_dw=0`.
+pub(super) const INIT_4: [u8; 16] = [0x04, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
+/// The HDCP-channel probe body in the second part of [`init_4_probe`].
+/// The dock only ACKs once this framed probe arrives.
+pub(super) const PROBE_BODY: [u8; 32] = {
+    let mut p = [0u8; 32];
+    p[0] = 0x14;
+    p[2] = 0x90;
+    p
+};
+
+/// `init_0`: 16-byte framing header only, empty body (sec 4).
+pub(super) fn init_0() -> Result<KVec<u8>> {
+    let mut buf = KVec::with_capacity(16, GFP_KERNEL)?;
+    push_frame_with(&mut buf, 0x01, 0x00, 0, 0, &[])?;
+    Ok(buf)
+}
+
+/// `init_25`: type=2 sub=0x25, `sub_len_dw=0`, 32 bytes total (sec 4).
+pub(super) fn init_25() -> Result<KVec<u8>> {
+    let mut buf = KVec::with_capacity(32, GFP_KERNEL)?;
+    push_frame_with(&mut buf, 0x02, 0x25, 0, 0, &INIT_25)?;
+    Ok(buf)
+}
+
+/// `init_4` + HDCP probe as one 80-byte transfer (sec 4): Part A (type=2 sub=0x04,
+/// `sub_len_dw=0`, 32 B) concatenated with Part B -- the probe framed as type=4
+/// sub=0x04 with `sub_len_dw=0x0a` over the 32-byte [`PROBE_BODY`] (48 B). This
+/// is the message the dock ACKs.
+pub(super) fn init_4_probe() -> Result<KVec<u8>> {
+    let mut buf = KVec::with_capacity(80, GFP_KERNEL)?;
+    push_frame_with(&mut buf, 0x02, 0x04, 0, 0, &INIT_4)?; // Part A
+    push_frame_with(&mut buf, 0x04, 0x04, 0x0a, 0, &PROBE_BODY)?; // Part B (framed probe)
+    Ok(buf)
+}
