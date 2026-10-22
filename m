Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641204;
	b=QYXtjJN1OaTzdhYNi18D43+Jkpw6LBN4KBuk3xSiG/0qeByixLJj2mUqcHfqy4m7GCho
	 zV6i3VEud8zmKJ7MkebLbvTGR58yI9wwJ0qXyRb+lGw7WRFhZY5BjLbx6Wx6aGchuD9v0
	 pPt+0ecn6H8lRB0fq4euCWDORbcnnhM3QAyUK99HnQ6z18Q/rUIEOXzWI9AatalKuaNax
	 bllwcx95/OkjF85i+DwL23K30wP9GXiIrPAbS8n3SCXOfd7oc5NU3AarZbpwdqPe6jV8r
	 /ypgmXOnnnwlzPIyDZEBk2jBamTZRVa/npEWbRqrOWsxTuWXqtotzVpvSS8LqAhioWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YTwXX/e+2q2uxgf0ajbM0Q4u9v6L0C35gNVhAj4Ee6k=;
	b=nBG4SMTreDKA8/l3kFYbxfa5nrYsxpEqFB1TB8tIMZ70n8JSmmiW0N1KZmhXm+skfj8K
	 eGuQQALkqLIKCm9D/FbutD/OJ/ytScTIP9UdqjPJ8T7MrE/1BmVHfZnT6PVcLSsB2jWiB
	 ox4EXyajSPl+IOF72lLHP7Ly99QTw7VwjWwcOaoJrVgnanv22wlghe9cjFhgSh5dThwNi
	 4EGxTCMmZ3NrNSkXdoIToQXXE+Sw795/touT6rT8gvUCdMkmVyJtLbStovQnojC01X2fU
	 tnxf0kVMHU1xqBd0HxHnVPV4hiJxwP3jtwmftpsinYgmbe4a3LOv0AAD3w1LX8iW19A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kvW1+URm;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AD7606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79AD7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kvW1+URm
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso194555e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792641203; x=1793246003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTwXX/e+2q2uxgf0ajbM0Q4u9v6L0C35gNVhAj4Ee6k=;
        b=kvW1+URmU0ECHNTcv+pAMwpCdKdf1Ev/KIEfNw0Svw7ZNxJkwaQttbnsNLEF8cufJE
         7uOv2ivfFhtzOxA4dncYRkG0mF8zw23nUyVhYh5QzZZwoa13L6X5o/LMdnjjmYyyELRD
         RxwzrtF3BEWvUMjCeDyicRIj1d0ITNxhC1qWwqWLJsUbfZiAJfc/o0shHWZY7P3hPk61
         G+4xid8lr/mX/rPe/8re6vBh6FdFz74g1n6wQMubjBswqnChcWqc6TC67Ne89ezpmmea
         wYD71w8CoIRhTIOX3W0sAihcRhQ3gW1pS6j/JAO+rNAgNRqYJsRLP8CQE45fazRb/QmO
         RotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792641203; x=1793246003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTwXX/e+2q2uxgf0ajbM0Q4u9v6L0C35gNVhAj4Ee6k=;
        b=Q+rske1tEzwlT3HjP5jZajGA4ncrgpAkDYakAZhUU7NoQJmCh/OXqYJ3kapcSavG5L
         ffbdw2y+pJMANayXYGeqcmM+SRXZ441IPL4JPE6SC/soekYhNFfIeL63Od4IfOfHSpo+
         TcKrGwuJKyFoPEaArGEsCFw0QO92yZvbaaA4VR+X3Y62YMaIKoDVupYiKmzfYKcMJ5e3
         Ec3EyqvW91tiMOhScnLHyz1emDNcsG6RK45FTk6OSmlpSVn+kDG53DTZZVZkeR0OXplk
         HvSBe8iaB0hKN9HYBKWIaWkfIihlwYequ1XA1Bq20f273lpbCoNFqG6E1KCce7DkytFk
         zBsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPMFKm+fT8biPp8IQ22c+8ffDSCPGa8Q6hz49T9T6674+njmH36pBX7pO0AbOVVoL9hV+pkXHIDJh6glY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYIz9vsh+wM+xlP1SP/VjIxCk+F4vVEZEKgi3JsnqtXuK4cqVk
	FVnTwTulZgiwZv9dxP+mbQPCd905Xe1uDT1PNnk4PK9HTosVsvh4eLCT
X-Gm-Gg: AYBFou3d3E8AwqUEvbjFT2qg0YY/D/NYps+E1pCMWhYCyNVVICmjlg5PJOVPQxMuACY
	v71hPnt6PtkTAw1cS4ldSyiF4nt2aZ0gD1PTFEylW2XpGVWbRkzzF5yAnhHGVZSl5oRdV6K9ttg
	Vq6vhTt4ytkYJop3Qvm8acexztodsuipJQNLnpcrtD9muwqdKrs7miolE8+elQ8nKHWiIINMTcb
	FM0WHtk233FbDONu0fNIqvo7PHFYbyIaA0xTDiXrhfMWX5Jg3r3uCElFMCRmvY6eWGZF6KAs/SE
	uiPTO3zUpGIXpOPCgNlZY2u82zLFqBl485A6S1xz2BqWFC/A2qyfVVs30CskfOfCgaYfaI7MLqS
	97kMIASo0t4IMB4OAznSM4cqWee/T9ShqeKrPV2hNJto/ffftnd9/RERBhneebdXzq1z9WkKeN/
	Su11P//IL8NJ6926c8+biTgRh1G4BNKsoxdl/AXcVZL1Z9vGIOX5cBt+D1kG22qhetuz0dl7M7f
	uDR2SEg8SKgUMM9r7tBHe4N+7aqgao1D7DW2E5mU9Hw19xgrYtThSPhV8tbw4hk8iECtw8sPBS3
	aLc8I/BnxjH+DK8OPEQNImQWsOX8BZduWJ99JiHXrbuoPaT+IkA+QA==
X-Received: by 2002:a05:600c:4f53:b0:4a1:ce33:1536 with SMTP id 5b1f17b1804b1-4a1fdd20d2amr83625905e9.9.1792641202626;
        Wed, 21 Oct 2026 20:53:22 -0700 (PDT)
Received: from SurHub.localdomain ([102.213.69.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258426f4sm9507239f8f.54.2026.10.21.20.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:53:22 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: linux-cifs@vger.kernel.org
Cc: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] smb: client: reject short SESSION_SETUP responses
Date: Thu, 22 Oct 2026 06:53:14 +0300
Message-ID: <20261022035314.17801-1-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
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

smb2_check_message() accepts frames shorter than struct smb2_pdu when
the SMB2 status is non-zero, before the minimum-PDU check added by
b4694f269e66d. A 64-byte STATUS_MORE_PROCESSING_REQUIRED SESSION_SETUP
response is therefore accepted even though it cannot contain the
SecurityBufferOffset and SecurityBufferLength fields.

The parser then reads those fields from stale bytes left in the reused
receive buffer by an earlier frame. With a long stale
SecurityBufferLength, decode_ntlmssp_challenge() copies up to about
64 KB from beyond the receive object and sends the data back to the
server in the NTLMv2 AUTHENTICATE target info.

Reject short MPR SESSION_SETUP responses before the short-error path,
and validate SecurityBufferOffset + SecurityBufferLength against the
received response length before decoding the challenge.

The ordering bypass is not new: the short-error early return predates
b4694f269e66d, and the unvalidated SecurityBufferLength read predates
the 2016 raw NTLMSSP split in 166cea4dc3a4, so all supported stable
trees are affected. Reproduced on 6.6.87.2; the path is unchanged on
mainline.

Cc: stable@vger.kernel.org
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/smb/client/smb2misc.c | 16 ++++++++++++++++
 fs/smb/client/smb2pdu.c  |  9 +++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/fs/smb/client/smb2misc.c b/fs/smb/client/smb2misc.c
index 5e5cf92d1..e107d4e79 100644
--- a/fs/smb/client/smb2misc.c
+++ b/fs/smb/client/smb2misc.c
@@ -225,6 +225,22 @@ smb2_check_message(char *buf, unsigned int pdu_len, unsigned int len,
 		return 1;
 	}
 
+	/*
+	 * A SESSION_SETUP response that asks for more processing carries a
+	 * security blob and is parsed as a normal reply. Do not let the
+	 * short-error path below accept a frame that cannot hold the fixed
+	 * response fields; the minimum-PDU check later is unreachable once
+	 * the early return has accepted the frame.
+	 */
+	if (command == SMB2_SESSION_SETUP_HE &&
+	    shdr->Status == STATUS_MORE_PROCESSING_REQUIRED &&
+	    len < smb2_min_pdu_len[command]) {
+		cifs_server_dbg(VFS,
+				"SMB2 SESSION_SETUP response too short: %u < %zu\n",
+				len, smb2_min_pdu_len[command]);
+		return 1;
+	}
+
 	if (len < pdu_size) {
 		if ((len >= hdr_size)
 		    && (shdr->Status != 0)) {
diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index 5d892300d..f276acf7b 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -1857,14 +1857,19 @@ SMB2_sess_auth_rawntlmssp_negotiate(struct SMB2_sess_data *sess_data)
 		goto out;
 
 	u16 boff = le16_to_cpu(rsp->SecurityBufferOffset);
+	u16 blen = le16_to_cpu(rsp->SecurityBufferLength);
 
 	if (offsetof(struct smb2_sess_setup_rsp, Buffer) != boff) {
 		cifs_dbg(VFS, "Invalid security buffer offset %d\n", boff);
 		rc = smb_EIO1(smb_eio_trace_sess_buf_off, boff);
 		goto out;
 	}
-	rc = decode_ntlmssp_challenge(rsp->Buffer,
-			le16_to_cpu(rsp->SecurityBufferLength), ses);
+	if ((u32)boff + blen > sess_data->iov[0].iov_len) {
+		cifs_dbg(VFS, "Invalid security buffer length %u\n", blen);
+		rc = -EINVAL;
+		goto out;
+	}
+	rc = decode_ntlmssp_challenge(rsp->Buffer, blen, ses);
 	if (rc)
 		goto out;
 
-- 
2.53.0

