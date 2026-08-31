Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CB53DA5B0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180679; cv=none; b=EM/QlHtQ/CfnTRskTozh7//2ZJ6/iQDOc8IAnnlohwD9ESLXm4z9mg8W5fpQ9uqNOmfnRTZIZmJT11TPNe2brz2I3VJiSZkeSDjacOqpaskYeNXVEC644+XwUYI53XMnniDqYteoVFkfQjpCy54Ql9kv5qSp7WUi7jDjFLs5k0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180679; c=relaxed/simple;
	bh=MsgD6xMrJ817lE4I/y63u6Ufiz4oIuiclFfZLj4rF+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gP8bYfFVdaBj4a1ZYDeIsZHuMyF8ZxbJ1uEbF+ObDXR8oIQfCo8z7q19rm3ZRB/Em/ucxzHBuBdif2uXriNX9TXXR1rpo94hhfAYPLc1BZ1hg25L10X0eZZPkrZJyxMBl+dLu1bsCDrKXV8wAi9iC2kFP3iLLgHwYUjNG5vHxco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=ncTawx13; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="ncTawx13"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so23446785e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1788180675; x=1788785475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5A26gOuAVOyjv1TvWMYcqopm/IcXjJSkKIFefy8rQWY=;
        b=ncTawx13/dDkgf/CUItoXetCbuNzsZLgQ6QEoQEQqVkugqaz9ZIDut1O+t1Zsnt3Zp
         LybQMbgR4HFKG3mXdOjOEET7OR9hdrnUK9Nk3tsAxfgUuRHuoPmo+mgCC/VYYAiTVeyf
         DNNwGm9AAwRubePJQxHd6wN1cfATQBxhUL7fXTi28BGsaAXZkqC/EIjernZZeodJRiMs
         5EiLHVYTT2h4HVt93Gcy6pXaLrwgikQewM9dL/INOj6NfeXiK81SwS72E9oKo15d9gdY
         LyHRNPlF+eLqgztP1iBWavHJyJLWJfCwILfW/plQRk7d8NlzN86L2hj4pLn2Va+Keb7f
         F/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180675; x=1788785475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5A26gOuAVOyjv1TvWMYcqopm/IcXjJSkKIFefy8rQWY=;
        b=PyZZr24wQI3AAt12GwXeE0A533GV/p3qrVW7G11X3bcU6p1LDChPa3FutE9KDfLJJ/
         IXWt40/2POISZS/s51L8Zu2DHCdESkvdr/ZmpBwXAikP0quuB0kUOCLZdcGCBWWaY5bj
         nwOYQPnSVxkEGwdBMcd2MGxay/0OS7TmdhN2GkPoT8mSrkwyhHtpDcUs1hHKMF/73tHg
         PCVMJkm8i0IjRdeUYV9qAT33DJEwoPqtyIKB+xda0V0VtrrorVzxTG1UIEnf7wqODJsW
         uYyUp8DPIYDD9Gi94+wN4hxoUvkjMQjJOlYR31vahvNCmtRvByuWdayHT6JRF+MQMrSM
         4B0w==
X-Forwarded-Encrypted: i=1; AHgh+RrfnkAP5SwKOW88B1bN0OsW7I3mMcbTlUVooGrtEA2Ut9OzubCioamWi1AakjOHkDtgStXQNs6G0Q7gvMc=@vger.kernel.org
X-Gm-Message-State: AFuF++np7rH+yk0/AbnSs7KjnPwnAPsWb6ACvhT9LXJq6LHoXSuS2Mby
	PtIAwFItOtTuJigmmomL0Rhi1aspzhDZKqh51cxWMfyHUPDSbR19nloTXZYofpBhoVKN
X-Gm-Gg: AR+sD13H/2N1Uoe2TTto5gY4r/TZeR5A7uPWoX7nKTQhTFvfT61929ITrwRuqL3aSJs
	h+jV8pUrI8sG4y105fSgHgAI6b1l+zUsRzpD/UzW2fR7kb0BCljlnOrM3BPf8uy0Ks6SuzdcwUg
	vZwM2ZoT0XirujmzdVwO2y8pIa2W0C1IKcNtNRm0A+ShcWCTQJBMmtzx82zmm7XSZ9isE7rwtvh
	Pic4QeV+sxeCBvKCpUamylMgodY4xUaliUyG0P7nf/rzMS/8+YcDnasx+T4ojyK6HQbb0j0x3vO
	+ZALn++p1e0lt6oIPRfUP6EvJ6FLRQqOzOedNz8ZfEnK8XZgYYWTrNKOeuuoNO2gPJUBxFyTVA4
	GGrHGI3ah8KQqbNhV1/xcmPvtRvtMheED3fEBOqlBjPiUckzap6keHZBVSXoxTO44Hw7aV0diSH
	3PDyFq+o7D/2MYGD8WgMv3ek987tFsQzYiuZUPDYPrEeDKkhSj+PQgD8rRyw2k/QNk
X-Received: by 2002:a05:600c:8b86:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-49b91c2777emr454968265e9.7.1788180674354;
        Mon, 31 Aug 2026 05:51:14 -0700 (PDT)
Received: from localhost.localdomain ([151.18.18.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48432022ab8sm15739457f8f.28.2026.08.31.05.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:51:13 -0700 (PDT)
From: Diego Oliva <diego@bynar.io>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] smb: client: reject out-of-bounds DataOffset in CIFSSMBRead()
Date: Mon, 31 Aug 2026 13:50:45 +0100
Message-Id: <20260831125045.479576-1-diego@bynar.io>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260828150203.1419003-1-diego@bynar.io>
References: <20260828150203.1419003-1-diego@bynar.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SMB1 synchronous read helper CIFSSMBRead() validates the server's
DataLength against CIFSMaxBufSize and the caller's count, but never
validates DataOffset. The copy source is formed as

	&pSMBr->hdr.Protocol + le16_to_cpu(pSMBr->DataOffset)

and memcpy()'d for DataLength bytes with no check that the
[DataOffset, DataOffset + DataLength) range lies within the response
actually received from the server.

A malicious or compromised SMB1 server can return a short response
carrying an in-range DataLength and a large DataOffset, driving the
source pointer past the end of the response buffer. The memcpy() then
copies adjacent kernel heap into the caller's read buffer (information
disclosure), or reads unmapped memory and oopses (denial of service).
SMB1 is not negotiated by default; reaching this code requires an
explicit vers=1.0 mount.

Both DataOffset and the received response length recorded in
rsp_iov.iov_len are relative to the start of the SMB header, so reject
the response unless DataOffset + DataLength fits within that length,
using overflow-safe arithmetic, before forming the source pointer.

While here, make data_length unsigned. It holds a length derived from
an unsigned on-the-wire field and is only ever compared against
unsigned quantities. This is not required by the validation added
above, but it matches what the variable represents.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: Bynario AI
Signed-off-by: Diego Oliva <diego@bynar.io>
---
v2:
 - make data_length unsigned, as suggested by Namjae Jeon
 - rebased on current upstream
 - v1: https://lore.kernel.org/linux-cifs/20260828150203.1419003-1-diego@bynar.io/

Note for backporting: this uses the smb_EIO2() tracepoint helper added
in v6.19 with f80ac7eda1cf5. For older kernels, the call can be
replaced with a simple return of -EIO.

 fs/smb/client/cifssmb.c | 13 ++++++++++---
 fs/smb/client/trace.h   |  1 +
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/fs/smb/client/cifssmb.c b/fs/smb/client/cifssmb.c
index f5aad5f61dce..b89d49395362 100644
--- a/fs/smb/client/cifssmb.c
+++ b/fs/smb/client/cifssmb.c
@@ -1720,7 +1720,8 @@ CIFSSMBRead(const unsigned int xid, struct cifs_io_parms *io_parms,
 	if (rc) {
 		cifs_dbg(VFS, "Send error in read = %d\n", rc);
 	} else {
-		int data_length = le16_to_cpu(pSMBr->DataLengthHigh);
+		unsigned int data_length = le16_to_cpu(pSMBr->DataLengthHigh);
+		__u16 data_offset = le16_to_cpu(pSMBr->DataOffset);
 		data_length = data_length << 16;
 		data_length += le16_to_cpu(pSMBr->DataLength);
 		*nbytes = data_length;
@@ -1733,9 +1734,15 @@ CIFSSMBRead(const unsigned int xid, struct cifs_io_parms *io_parms,
 			rc = smb_EIO2(smb_eio_trace_read_overlarge,
 				      data_length, count);
 			*nbytes = 0;
+		} else if ((size_t)data_offset + data_length > rsp_iov.iov_len) {
+			/* check that the data lies within the received response */
+			cifs_dbg(FYI, "bad data offset %u length %d for read response of %zu\n",
+				 data_offset, data_length, rsp_iov.iov_len);
+			rc = smb_EIO2(smb_eio_trace_read_bad_offset,
+				      data_offset, data_length);
+			*nbytes = 0;
 		} else {
-			pReadData = (char *) (&pSMBr->hdr.Protocol) +
-					le16_to_cpu(pSMBr->DataOffset);
+			pReadData = (char *) (&pSMBr->hdr.Protocol) + data_offset;
 /*			if (rc = copy_to_user(buf, pReadData, data_length)) {
 				cifs_dbg(VFS, "Faulting on read rc = %d\n",rc);
 				rc = -EFAULT;
diff --git a/fs/smb/client/trace.h b/fs/smb/client/trace.h
index 12241abb8e2e..982b6ba1e429 100644
--- a/fs/smb/client/trace.h
+++ b/fs/smb/client/trace.h
@@ -79,6 +79,7 @@
 	EM(smb_eio_trace_qreparse_setup_count,		"qreparse_setup_count") \
 	EM(smb_eio_trace_qreparse_sizes_wrong,		"qreparse_sizes_wrong") \
 	EM(smb_eio_trace_qsym_bcc_too_small,		"qsym_bcc_too_small") \
+	EM(smb_eio_trace_read_bad_offset,               "read_bad_offset") \
 	EM(smb_eio_trace_read_mid_state_unknown,	"read_mid_state_unknown") \
 	EM(smb_eio_trace_read_overlarge,		"read_overlarge") \
 	EM(smb_eio_trace_read_rsp_malformed,		"read_rsp_malformed") \

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.39.5

