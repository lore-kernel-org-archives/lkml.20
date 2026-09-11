Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A503E35E95A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138725; cv=none; b=MhkKs1aMo3uiBj6ynsqdfW8hQmf1jRD1+6o2Wo41yLA/HZBuT8IRBjXAmn2kqdZMpU1Exfjg2AiG8Va4yNff8yFdCKa0rUW2mj535iLdtmT48prKcYHPg5ydJxWLuFTArYrDHGbbUmmYUJl3VY03O+iWjgszQuRreBUjon/MdQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138725; c=relaxed/simple;
	bh=6U2KyYESRummjrFiAB7QS+VzeYDYkDkZ1bo7japatKc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n+Fuvbs9AMk8OXv1++ZwXBiJCooEW8FsRMVhymD6hSTE65rIgwANIXhZG2KhNWIFyhhVUE43fyrbqOV9DDu7DsxOmBMpOj01wE2J8Bkr+jyYdcpq7OKuo2vjqzJHqoEOrekOkE3qIQOFq5D08uTajg514kbEM7Rp5xKi/Uwq2FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=FrDbkANP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="FrDbkANP"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so11288855e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1789138719; x=1789743519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJDLLy3mcgmNCllNfuwiuaOIAc//JDOWE+yHQCqzUAQ=;
        b=FrDbkANP9Qg8oSbW+WZDxccE5+J/bhYgR/69T65UIPo62HSvAPD4t4MiP6YiCRcbxj
         CWqmNPBcqelM4IfqdbYw6BksGk+bw89lJecmM8tOlJt/RBvVadZdkpf5cRqlHZHIyeTY
         gQefWPH8Zpr9Er+iZC2gZjK/Ib3q9dyw6KFDGKR1ymG9athpbeMn5ICkE8gYyi24x/iD
         3/JBykkCl2jUu6CsEM81MBjWdBXE8hpbwKa14fZP+zluhfmeORDMREwLp2cohSfbzn8d
         cm8cZ9jDbm3Scv1K+uYBcPdYrPhFTIbUIsZQIUOLU9F3aQdG1rbFom3692Cl+h1ZMvVg
         Fqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789138719; x=1789743519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QJDLLy3mcgmNCllNfuwiuaOIAc//JDOWE+yHQCqzUAQ=;
        b=WjG5X/APEhFU67DWG8xKiiLfT7s4c2Dqr22Jwmahkdxyidy3At45uWnwRbRiXGkXy5
         koNiuPrPWcmwZnsToqoivAcdwuSvD8zCcMz6OIKaonkU0ZNEo6vI8dBw29kjWYx9qz3Q
         67YqF2uxW46Iep5W3I7Ud1ecQeKDzC+FkeXm/jhxsrQtYrULLaiz5NFkk8PYDvw9+8GM
         A2Er4d6Ho0356C2fYEPBgFEIoLzZfxlxHWvmJ1NF2ePbyMWJzdcHEo80p4NdjiT36r2V
         HT//iBaCtuJi+9VV9pn7FYZ+NW/h4KbeaAQ2WwrLfIyFbjG2g64ge9LSzBFcOV0Wwaud
         evxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkOTihWzyrn3+I1HP8VdQTLjvmEL4U5xuSiOuBJMtGc+qsSt59Z5i4tnFX9gvhJSv+w2YE2zr/RzBvIQo=@vger.kernel.org
X-Gm-Message-State: AFuF++muKS+L84jwIba7Taxq3GrJLw5Ell1YTgeYKQRR6IzLGweRGwkC
	yA+eq/eSCAtQAW9DSIovypc+3NUemeaakNNH0TdBRzSHwaajoPBe6srsTi5axsZeXIHz
X-Gm-Gg: AYBFou1FHlG2tUO6AQ1QOxrpHEDpEak5xermEVph/K5Tx1sPZ9UbmYZfN3a0hla18yF
	G8EkBqmDqwV2qKYJdg5W4GUJErI3nYlnWbmlP+HtKKovSDNP+yo1pyPhAp1yYQGLXPwd5RXyYNG
	evMSpLy79Qox2w7VHGlKsBWuGpdAM2SLva/T+t3nIb9K9gSdzRg8JjZ5Bi9PUHn1K+TKRun/Hp1
	P0LieTvqupsU7iWsH9rlW6lJPPj/uwKMFMZ9xoSxFIXLLuybGcSnidxzm/2zqzIZ2eeYlfCn6JI
	12MN90F6PkysYTYPLP7FZtCCke7Gr3llDQoAlqQ0pacwcELUkIpYBa6dRKhzcFo1oc3/WQl+pfy
	5lQiB8Yv2xJRq6C1fBagYHcnERr/wI+WLnwqkzBR9bRKbRdEIWCW5dgCPsjcCY0RVAR3UdV7izD
	MLoLqaRrHozAiaPThxx8D1Zd+17qJJzYJy2JVqQr+NFlHaHGNau7Mp8UILoX6lmZxMPfRGvT1+M
	30uII9hKn8u9aHiFInliMWeK5Kt
X-Received: by 2002:a05:600c:4fc8:b0:49c:cedc:3c36 with SMTP id 5b1f17b1804b1-49e619bd0femr54492545e9.16.1789138719577;
        Fri, 11 Sep 2026 07:58:39 -0700 (PDT)
Received: from debian12.ucl.ac.uk (eduroam-int-pat-8-79.ucl.ac.uk. [144.82.8.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm50432915e9.1.2026.09.11.07.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:58:39 -0700 (PDT)
From: Diego Oliva <diego@bynar.io>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	linux-cifs@vger.kernel.org
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	David Howells <dhowells@redhat.com>,
	Jeff Layton <jlayton@kernel.org>,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] smb: client: reject short WRITE responses in the SMB1 write paths
Date: Fri, 11 Sep 2026 15:57:56 +0100
Message-Id: <20260911145758.3833254-2-diego@bynar.io>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260911145758.3833254-1-diego@bynar.io>
References: <20260911145758.3833254-1-diego@bynar.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cifs_writev_callback(), CIFSSMBWrite() and CIFSSMBWrite2() all read
Count and CountHigh out of the WRITE_RSP returned by the server
without first checking that a whole WRITE_RSP was actually received.
The length of the response is available to each of them, in
mid->response_pdu_len, bytes_returned and rsp_iov.iov_len
respectively, but none of them constrains it to be at least
sizeof(WRITE_RSP) before those fields are dereferenced. In the
asynchronous case cifs_check_receive() has run first, but it only
verifies the signature and maps the SMB error; it performs no length
validation.

A malicious or compromised SMB1 server can therefore return a response
shorter than the WRITE_RSP header and still have it parsed. In
CIFSSMBWrite() the response buffer is the request buffer, since
smb_init() hands out a single allocation for both, so the count is
read back out of the request that was just sent; in the other two the
reply lives in the demultiplex thread's buffer, so it comes from
recycled slab memory. Either way the client reports a number of bytes
written that the server never sent. SMB1 is not negotiated by default;
reaching this code requires an explicit vers=1.0 mount.

Reject the response unless it is at least sizeof(WRITE_RSP) bytes
long. This cannot reject a conforming server: WRITE_RSP is documented
as wct = 6, so the smallest valid reply is
sizeof(struct smb_hdr) + 2 * 6 + 2, which is sizeof(WRITE_RSP).

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: c28c89fc43e3 ("cifs: add cifs_async_writev")
Cc: <stable@vger.kernel.org> # 6.19.x
Assisted-by: Bynario AI
Signed-off-by: Diego Oliva <diego@bynar.io>
---
 fs/smb/client/cifssmb.c | 21 +++++++++++++++++++++
 fs/smb/client/trace.h   |  1 +
 2 files changed, 22 insertions(+)

diff --git a/fs/smb/client/cifssmb.c b/fs/smb/client/cifssmb.c
index f9aff0712794..b1525d491ce5 100644
--- a/fs/smb/client/cifssmb.c
+++ b/fs/smb/client/cifssmb.c
@@ -1880,6 +1880,12 @@ CIFSSMBWrite(const unsigned int xid, struct cifs_io_parms *io_parms,
 	cifs_stats_inc(&tcon->stats.cifs_stats.num_writes);
 	if (rc) {
 		cifs_dbg(FYI, "Send error in write = %d\n", rc);
+	} else if (bytes_returned < (int)sizeof(WRITE_RSP)) {
+		/* check that the received response can hold a whole WRITE_RSP */
+		cifs_dbg(FYI, "%s: server returned short header. got=%d expected=%zu\n",
+			 __func__, bytes_returned, sizeof(WRITE_RSP));
+		rc = smb_EIO2(smb_eio_trace_write_rsp_short,
+			      bytes_returned, sizeof(WRITE_RSP));
 	} else {
 		*nbytes = le16_to_cpu(pSMBr->CountHigh);
 		*nbytes = (*nbytes) << 16;
@@ -1927,6 +1933,15 @@ cifs_writev_callback(struct TCP_Server_Info *server, struct mid_q_entry *mid)
 		if (result != 0)
 			break;
 
+		if (mid->response_pdu_len < sizeof(WRITE_RSP)) {
+			/* check that the received response can hold a whole WRITE_RSP */
+			cifs_dbg(FYI, "%s: server returned short header. got=%u expected=%zu\n",
+				 __func__, mid->response_pdu_len, sizeof(WRITE_RSP));
+			result = smb_EIO2(smb_eio_trace_write_rsp_short,
+					  mid->response_pdu_len, sizeof(WRITE_RSP));
+			break;
+		}
+
 		written = le16_to_cpu(smb->CountHigh);
 		written <<= 16;
 		written += le16_to_cpu(smb->Count);
@@ -2150,6 +2165,12 @@ CIFSSMBWrite2(const unsigned int xid, struct cifs_io_parms *io_parms,
 	} else if (resp_buf_type == 0) {
 		/* presumably this can not happen, but best to be safe */
 		rc = smb_EIO1(smb_eio_trace_write_bad_buf_type, resp_buf_type);
+	} else if (rsp_iov.iov_len < sizeof(WRITE_RSP)) {
+		/* check that the received response can hold a whole WRITE_RSP */
+		cifs_dbg(FYI, "%s: server returned short header. got=%zu expected=%zu\n",
+			 __func__, rsp_iov.iov_len, sizeof(WRITE_RSP));
+		rc = smb_EIO2(smb_eio_trace_write_rsp_short,
+			      rsp_iov.iov_len, sizeof(WRITE_RSP));
 	} else {
 		WRITE_RSP *pSMBr = (WRITE_RSP *)rsp_iov.iov_base;
 		*nbytes = le16_to_cpu(pSMBr->CountHigh);
diff --git a/fs/smb/client/trace.h b/fs/smb/client/trace.h
index b442cccd1530..a0ad8068425e 100644
--- a/fs/smb/client/trace.h
+++ b/fs/smb/client/trace.h
@@ -150,6 +150,7 @@
 	EM(smb_eio_trace_write_bad_buf_type,		"write_bad_buf_type") \
 	EM(smb_eio_trace_write_mid_state_unknown,	"write_mid_state_unknown") \
 	EM(smb_eio_trace_write_rsp_malformed,		"write_rsp_malformed") \
+	EM(smb_eio_trace_write_rsp_short,		"write_rsp_short") \
 	E_(smb_eio_trace_write_too_far,			"write_too_far")
 
 #define smb3_rw_credits_traces \
-- 
2.39.5

