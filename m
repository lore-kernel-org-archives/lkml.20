Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E422044AB6C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345754; cv=none; b=mE1NmDG6jp29to9p7HXPVnn9hL9xM+uZeSHA1DPEwxCGpWJUKEI+zOBCDZerFCCE/pCizGMHMuZzh4XOOjrE0xe9pjNe80sl3nisqdSCYCssv325TuEY7j30i+xG7UTAF/TP9OU4pmR5C9rA4vMIEi1Sn7M8aegBN0Z5lH9dwwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345754; c=relaxed/simple;
	bh=xyYMKLzzCsfncAvDaJj0J+b5UPf66aPFS2Ga9ljseK8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RAkH6j0m1tefB+snwfWcznUtnenW1ptsIk/vLc+y95tAlk8jJsZ/DBNRvBRT7dB8eGeZslK1sxFKqfB1C4CjCl3VqT/N3pEVAVYbf8pYSY59oOCP6duTRv1/dJr0qSTK8A+qOqVk9Bj5e1Lwb68689Q70SO8q5FLQafL8Za0tpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=Yhz0cfAh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="Yhz0cfAh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso6429835e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1788345747; x=1788950547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FzrA12XVRpjhCE+SpE7Wp9kAWsl7VDT912zdHqjkACw=;
        b=Yhz0cfAho8UY67b4afxOXTaB8VnlJUJQoQazyl/tqD7mZVVfctVBfa+EoQssIzKvwc
         VwGgNTmXnzLIZf9T1+ChpV0GpIPIpustDAKnFH/VIJdv5b7h+BW0WA1VX7zz8i/rSEZu
         Ug6Z885M3pP/gz15SUtiwiBx7YOPbCbNICTZoKFCsdzuG4zCU2rk2guKyD1i+zShWNGo
         WeGYtey3SsKxDGyAN8fOYeVFMHJXpx9E1LGCehWX/CW5KNtp6+tgV98MyibmHRxkJ1sH
         6gNomp42LfqTw8UWKwzWHIXd8dIDfSQ5KEn3H8vSSFlzXUmYmTPczCM9PyhPf6Azkxab
         v6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345747; x=1788950547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FzrA12XVRpjhCE+SpE7Wp9kAWsl7VDT912zdHqjkACw=;
        b=LaL6U+VM9bpE+oMfW2Hjh/Tuy/zw1q21lHcVS/6ro/5u+mWwYLMrlcf420bhEkD85L
         B6brAOJDa+fT0Rj6a6AcJf4Mvr2kNGniJ6BnSC7WNGXZgHCb0hWmL3+1TSC63+G43H0S
         U6EsJCyPPkWhsFV+Meuld6Yr3lietotJvYodYOiMheDuduw/gVwrXQukANx5Bn+9YOhu
         qPRBleUZnNK3ZfWZm410WxMkFnLyZh3HnwJViFDfaihEZOw0CRJkmVBX98K0pLbnG7Rl
         ZsBctQKyCIgWAiwBW+3s/UYCSobUNfkg6oCMQkfletZhfKfP0tvwGEbLh4KLRRCdXAiY
         rI8A==
X-Forwarded-Encrypted: i=1; AHgh+RqJ0YDmjboT/XCOVCvBNNLvV6D0IPAEeEVMQvCtnPZuRnrcD3QPr9Ov8LbmA/B96e9tFRR1jzcY60KVBrQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kTqH0FyW2bf6z7NIY5lSjiiyUtMiBXPAT0ezEcvMxoPYwu/IAH
	Flfg1C0tahzBfCIRik9e70s0LJPQFvk7dALKVC7Ro4nXs61W1U+BTSLXwYcGlIjrpP6HUd2rL+y
	0aUEVCssx0Ik=
X-Gm-Gg: AR+sD12isLsyamovs171aFCDJ1SqJFOGROLoj7/R42di+RYH65YOPkzdBv4ybzobHlR
	CDR4fYOl/e/4S0eSO9RNCySnhrYiKywH6MQrMwTZ4fBsyb6oRUClCoY46QxseITtJVG9QMu92Ly
	o0nzdxk5ZICIWIaIGfAHrVqVSryB5Kk9NOQ9aeJZIGIoXMAgeIiJAVTxkUcNwWeBZ3T/CZ99zm3
	qTurMAuxSun9mNyqqDgO7dyvddmcjLGgZMsnC7XiIXRl58f8I56w/tLKdcZeXZFX5MjCzVtHWh6
	ewjjpRS89dNMA1ceidT71HZ/ar4GEMJhc+gAgLwsbKnzJgBpETnKacb5UhOB+V1YlYHzp0q3whW
	8oO/0E9LoDeUiKtP1ncDpBHt6TMkEp2vSX10+s+KabHzxIfeudFZdvoCDmJp2B9Ndv7Ldj4tsHY
	AtLaw5Yn66gUgA2ART+1a2rXQ3670/sxdr66TfTVAsut4kgcYnSWWIUimlmHhgz0ZH7H4Rl+lsD
	7gnrtZf9C73qU5OTA==
X-Received: by 2002:a05:600c:1f87:b0:49c:dadb:18a7 with SMTP id 5b1f17b1804b1-49ce5818132mr59943005e9.10.1788345747514;
        Wed, 02 Sep 2026 03:42:27 -0700 (PDT)
Received: from debian12.ucl.ac.uk (eduroam-int-pat-8-79.ucl.ac.uk. [144.82.8.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce5e5sm5197521f8f.36.2026.09.02.03.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:42:27 -0700 (PDT)
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
Subject: [PATCH v3 2/2] smb: client: reject out-of-bounds DataOffset in CIFSSMBRead()
Date: Wed,  2 Sep 2026 11:42:07 +0100
Message-Id: <20260902104207.1820332-3-diego@bynar.io>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260902104207.1820332-1-diego@bynar.io>
References: <20260902104207.1820332-1-diego@bynar.io>
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

A malicious or compromised SMB1 server can return a response carrying
an in-range DataLength and a large DataOffset, driving the source
pointer past the end of the response buffer. The memcpy() then copies
adjacent kernel heap into the caller's read buffer (information
disclosure), or reads unmapped memory and oopses (denial of service).
SMB1 is not negotiated by default; reaching this code requires an
explicit vers=1.0 mount.

Both DataOffset and the received response length recorded in
rsp_iov.iov_len are relative to the start of the SMB header, so reject
the response unless DataOffset + DataLength fits within that length,
using overflow-safe arithmetic, before forming the source pointer.
The response length has been validated by the previous patch, so the
DataOffset and DataLength fields can be read safely here.

While here, make data_length unsigned. It holds a length derived from
unsigned on-the-wire fields and is only ever compared against unsigned
quantities; print it with %u accordingly, and add __func__ to the
cifs_dbg() calls in this function.

smb_EIO2() was introduced in v6.19, so this does not apply to older
stable trees without returning plain -EIO instead.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: <stable@vger.kernel.org> # 6.19.x
Assisted-by: Bynario AI
Signed-off-by: Diego Oliva <diego@bynar.io>
---
 fs/smb/client/cifssmb.c | 17 ++++++++++++-----
 fs/smb/client/trace.h   |  1 +
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/fs/smb/client/cifssmb.c b/fs/smb/client/cifssmb.c
index aa6b904ad866..3c86eb6cf76e 100644
--- a/fs/smb/client/cifssmb.c
+++ b/fs/smb/client/cifssmb.c
@@ -1728,7 +1728,8 @@ CIFSSMBRead(const unsigned int xid, struct cifs_io_parms *io_parms,
 			      rsp_iov.iov_len, tcon->ses->server->vals->read_rsp_size);
 		*nbytes = 0;
 	} else {
-		int data_length = le16_to_cpu(pSMBr->DataLengthHigh);
+		unsigned int data_length = le16_to_cpu(pSMBr->DataLengthHigh);
+		__u16 data_offset = le16_to_cpu(pSMBr->DataOffset);
 		data_length = data_length << 16;
 		data_length += le16_to_cpu(pSMBr->DataLength);
 		*nbytes = data_length;
@@ -1736,14 +1737,20 @@ CIFSSMBRead(const unsigned int xid, struct cifs_io_parms *io_parms,
 		/*check that DataLength would not go beyond end of SMB */
 		if ((data_length > CIFSMaxBufSize)
 				|| (data_length > count)) {
-			cifs_dbg(FYI, "bad length %d for count %d\n",
-				 data_length, count);
+			cifs_dbg(FYI, "%s: bad length %u for count %u\n",
+				 __func__, data_length, count);
 			rc = smb_EIO2(smb_eio_trace_read_overlarge,
 				      data_length, count);
 			*nbytes = 0;
+		} else if ((size_t)data_offset + data_length > rsp_iov.iov_len) {
+			/* check that the data lies within the received response */
+			cifs_dbg(FYI, "%s: bad data offset %u length %u for response of %zu\n",
+				 __func__, data_offset, data_length, rsp_iov.iov_len);
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
index 12241abb8e2e..b442cccd1530 100644
--- a/fs/smb/client/trace.h
+++ b/fs/smb/client/trace.h
@@ -79,6 +79,7 @@
 	EM(smb_eio_trace_qreparse_setup_count,		"qreparse_setup_count") \
 	EM(smb_eio_trace_qreparse_sizes_wrong,		"qreparse_sizes_wrong") \
 	EM(smb_eio_trace_qsym_bcc_too_small,		"qsym_bcc_too_small") \
+	EM(smb_eio_trace_read_bad_offset,		"read_bad_offset") \
 	EM(smb_eio_trace_read_mid_state_unknown,	"read_mid_state_unknown") \
 	EM(smb_eio_trace_read_overlarge,		"read_overlarge") \
 	EM(smb_eio_trace_read_rsp_malformed,		"read_rsp_malformed") \
-- 
2.39.5

