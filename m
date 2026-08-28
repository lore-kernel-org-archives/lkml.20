Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B18473C88
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929339; cv=none; b=b8KcbW3Al0h5hinJgajY1piywJy665OB4jnwJLXFslDHC9Sko2fIaaRxED9h+SSOx6eT6eGfCw6fYBydGhsn1M3773iPIujgkktZHxtW36IQ7Y5sjcqLPiAYOf1Ps8v9CURmT5tA9Imq+ZCgDEh1Z4ITsoPHBKcl5wVsVH/ZJ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929339; c=relaxed/simple;
	bh=Wa7DU2ONyVHxxUL57YXAP/BmtCQAuho+dw66VWI7TlY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BnM0kfiko5ysqQSz5XEYK3NAO1E2M0QwA9Gg9DFNwvewK/UdILFVlrxhwerbFKtlhHGJsBIqvHVWJA3guJhbm2hk7dQa9qmYQsR1tvPYPpVuu7mv+sqb9lD/28DD0nzRQCxZIP9WhTYhVnaqC45sORRzCWqm2udTODoCzHoM2D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=G1fReh8E; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="G1fReh8E"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso7344425e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1787929335; x=1788534135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u4y9nYNVrdiwOeZUDCV+lDVrZEAd7aSbhGr58JFBRsg=;
        b=G1fReh8ED7PAAcwWjBu3pmsxfu4BaAwG/hGfUSoG2y9o85vWzPgMhC6uSZI3ngEqKl
         sJe0EmhaDTboC2ypxnokHxr3lKF6DFLlgGNxapOaR405UlFGW7uJeI9NmYEiQsAxB/7y
         WwcmNyZr+q9hYw3D5s5KhpmiMlybWtMWIkXx37kZLkfW9/eCYuatLpHTXX4HC1wWr3ZN
         iy/UwFAzJ+rrrEbwXSmGtkSK3t+Gy/OdMMEnDiFPDAsSl/TfuduxJevc+2bd0r/f97D/
         GbY8DCn9nidURv6balwwdBQ9sFFm5NiwbHDH5y4xgnOtNXJY6pZHoZsXhE5hGjwH1OFR
         yQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787929335; x=1788534135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4y9nYNVrdiwOeZUDCV+lDVrZEAd7aSbhGr58JFBRsg=;
        b=L6dhadC8PkI+2rjl0JwKGeRF1zRgS6Rj7L1JhwCNIXLuOIsp1eoQ+BTW58d8Gsavqy
         DEqKFdCtOXiuOb5GtUAOpmnMxMtRpHU6sS248j9rKeInOyj+E6dBKq/PB7DAGUMB6qPm
         3bG35yhVz/Wndx5fPlE6VuLoqK+SsRjK5MPnHb+QAGWLwCB5AR0el61t9MB9iohkQa7o
         ThzTxa1UNuZoAXFPoMfCo5HAxwyAAI7lF1qGUJNAspUmsFhXgeJdZEUNtEozgHDmTiuJ
         TxLESl/ECgmJNnYnLCCo6TymMpq8r6xlwU2N9u/y0m6FeHeGE7JGV0eQ5lrP/FHALo5P
         Lydg==
X-Forwarded-Encrypted: i=1; AHgh+RqNJHMIQ3NxrL22oowYGN3EPmZWz7PKhi4TTr3wunEitsMnUz388Mxe5aLZxozcpA1DawqfzTBXXpkOorY=@vger.kernel.org
X-Gm-Message-State: AFuF++n6t0aE0CM82Faggtums0tzbwdHKCrZfV/Vk1CxJUgsKdHcC5Li
	jNuUUsVpQKTZe2EUE0PxPJoJWq56Epd0fWHCBNQM4C6KvIxuMCEQN8qEpBL8q9KhhFy7
X-Gm-Gg: AR+sD124/BTcGw1ybL1HgohUJQBLcL+N2tTlhkuNw5+NGmdiIm+cvF7xRFDcbFPFirT
	RhTA0B7CbgJSA9SwUUfCIKr7q4jv8yemJSVci5iqXFcVZJuxSUzCSiH8bh1egcMXxL5FqdSciHH
	nznTE1Wze/wmU3FkZg7lrd1wp01laD9/lNCliOuoQv0axRB2aCt374Myf5fUwuzHqjZ+zkaLo5Q
	RsWCG99NICa1GD7/+S6OA3yD7ioYtNgo55EqIkuDuc3GB7/xow3bO9WfNIY2CBd/Z0wKCjfoNN9
	vfzcmp492Z0Y6mu9Mwyh9GbpyJaLQaF7CQ6Y+VhRrGmHPUv88GoGHso1DlkHk9xwU+T77RVzbOI
	zswRe7X1+IinBgebwpmmaab4gmdsh26KnYM9I53ym6cwoXqzh64p4qT+ruWK+PeQEcfZqTK5iXm
	TMhlwVtHX+6uqzH8v38AH8VKI0P94blzhQ32dMUGF/1kQy3wc61/7HQeg8yY3Wp6ChYqCrE2ndL
	tFU5lfvgXyONXWmCg==
X-Received: by 2002:a05:600c:8587:b0:499:dbae:43d3 with SMTP id 5b1f17b1804b1-49b91c489bbmr109262455e9.9.1787929334941;
        Fri, 28 Aug 2026 08:02:14 -0700 (PDT)
Received: from debian12.ucl.ac.uk (eduroam-int-pat-8-79.ucl.ac.uk. [144.82.8.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac4d0asm4696842f8f.10.2026.08.28.08.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:02:14 -0700 (PDT)
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
Subject: [PATCH] smb: client: reject out-of-bounds DataOffset in CIFSSMBRead()
Date: Fri, 28 Aug 2026 16:02:03 +0100
Message-Id: <20260828150203.1419003-1-diego@bynar.io>
X-Mailer: git-send-email 2.39.5
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

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: Bynario AI
Signed-off-by: Diego Oliva <diego@bynar.io>
---
Note for backporting: this uses the smb_EIO2() tracepoint helper added
in v6.19 with f80ac7eda1cf5. For older kernels, the call can be
replaced with a simple return of -EIO.

 fs/smb/client/cifssmb.c | 11 +++++++++--
 fs/smb/client/trace.h   |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/smb/client/cifssmb.c b/fs/smb/client/cifssmb.c
index f5aad5f61dce..1a822121a883 100644
--- a/fs/smb/client/cifssmb.c
+++ b/fs/smb/client/cifssmb.c
@@ -1721,6 +1721,7 @@ CIFSSMBRead(const unsigned int xid, struct cifs_io_parms *io_parms,
 		cifs_dbg(VFS, "Send error in read = %d\n", rc);
 	} else {
 		int data_length = le16_to_cpu(pSMBr->DataLengthHigh);
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

base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
-- 
2.39.5

