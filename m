Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616E924BBEE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138728; cv=none; b=SIudvlbnSE/TZR9pXLkzUUS94vTcz2ez0DLQ8058W74WmNqd2ILUqWhgbSX4PP+94UEwIDKWEDf4o2sN5KySJODialIoM/jWNuOnrAkuuwAK/vlkJXpgZNQuaPbIFA/3X3xJWmU68/SpQFXh+nGSLqYJRULDWcSyb/UrMrPfFxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138728; c=relaxed/simple;
	bh=tXun5SzxalV9Hzmv86f5QD4391irUID86zoYreFOlLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tC2oTvYXuBXzZ+fC6J9P0C6YA1SC3mR2fZc67wx3Qm7J/us+BPQNXm7LjGea9NJWbkZUbWMgXMgaPknxWCd7odXKYKDGPUtB4aAgKwbysYR4Y2j/YlTJRlajMXcWMEtsGE2Ay0r5XWwQaeD3SsBMBn2Ym5azBWEeXwYujwzkCkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=aT8XxGWa; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="aT8XxGWa"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49e668491f3so3546285e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1789138723; x=1789743523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlzncFxui7IWSYNS6TVWMZnw5flt5qN9CiLy90tWUhs=;
        b=aT8XxGWaA1H4lwsjLIrOGR34L1TRsXsLwfDZPfjDZsCnAhxvtAmXoCuQYKhj0O7oKG
         Der4jnrnt9qzb7URDLOLQMJjhVVJPQnFpBkECBaxaa93JxgMceitSOjfyH5+vZdwLtCg
         jOt8oKSoB8PkXcms94QCwyzKqUCgIbifnbpsGlRMQgkIUTSTCclYPRveDUWttSgfPz1B
         j/rUEO+obIEETotNHBuJRqU470D3LQquybYKTdJ4XOijs3CPcbrkNVhMxFUsXFOPExjB
         /qjVWVHgeKyo4Q8M/koMNwQ/4wnKUsmPdfGSmh7knKGJaO9M5NAyFGzXdzThtoNZsPxW
         hq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789138723; x=1789743523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RlzncFxui7IWSYNS6TVWMZnw5flt5qN9CiLy90tWUhs=;
        b=B2ENfDh1hxhUTWdwOxPphxdEqdOfe75FIcmhvDgRsZLEETbIzwOGR7fPh+RN6KRC6H
         Q+n46c3LBdp1l+wnaKmZRkcHOLt4Mhdr/U+30Vf+QZCJ8ubobtcS9ACCyn0rWMJ1PgnP
         1mCtSdiWvBTJJtJ2QUhPsXC3AWzBfttalNCWxehl7vLPJTV7P65DGejYE//QfXL3QhrZ
         VqXetzKFotqEbL+8PQ5RqAWRdJhfzCRyFZPGaapd8KuaiN/aKyC4sBtLRmhjN3MY72Nx
         CRgHYWJHAD3mAX3mwTocmaQdM0URzJiyYTiKSRNilZyc284bqw2q+kc3R3dZy5kn44XP
         E8Vw==
X-Forwarded-Encrypted: i=1; AKwUvBwhvhkeivFDC+8jHrSuOhJAcSlpl+50iZjT2GPwqNy+L2NHXThq5Zi5ygCR/43LCmKzvQ2QGksi6OdlCjE=@vger.kernel.org
X-Gm-Message-State: AFuF++nmElE/kCOYHF5Qc8gLL3tTf1IK01t/7vg2haJrGIEdzH55Pm+d
	ClJ0iGTSdOi56kydgTZvns/1QWxYHTzzrb7XKLeg3OyfQxAvepUJN6Tqg61rQPVMNAI2
X-Gm-Gg: AYBFou1mFsuAKWXqdHZvy8ckqtZ5whpb6I0BL6ymzF4IVlCfzvnrroGQmxBkqboar5+
	NnIZuHrWJG/FPaja/A/9JHFFdryUujS5ABm8XERgFS3OAyHjvKtvT8y7/QpIGMhzVtRplz4Tlzp
	yOHQ62cXuGZjE2dR6SY6vbq+XjrO828OLoQ2Bqxh29A92/G0rUqiPQoWUPa03kHJ48hUKX0qIGz
	C0iXnPVAU7WuCHmIhWQTyHuOvsPmlldbuWV6Gk/AYqOzqnK436zQRGTSb0jMIYWSWwZo6GX2Vgp
	CmsgYh0tx7VaQls21kkTq9zoaLTBsaEeWXUWR5zO4cfpx5EtsaapMn2HzGfNXu3SDU3nKhnlmXI
	K09m1XPo+7EFKuGaTw81pcfOta554oAgpY8NATDNNNgPiLXcQwzrhbMxK9BHanIi8Z8Xz+OGrL2
	FRLgKR3as0HLkZdu0auFlkW3Q/wuJX+oVJj3OlWZ6g8KPOa5nU6Ov9WJ7INLmwlXfOpvSoEa1fb
	pd/JdNKtgGulZcVKm0549g5IpFX
X-Received: by 2002:a05:600d:8648:10b0:49d:1f10:8b9f with SMTP id 5b1f17b1804b1-49e619836aemr42807155e9.7.1789138721935;
        Fri, 11 Sep 2026 07:58:41 -0700 (PDT)
Received: from debian12.ucl.ac.uk (eduroam-int-pat-8-79.ucl.ac.uk. [144.82.8.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm50432915e9.1.2026.09.11.07.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:58:40 -0700 (PDT)
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
Subject: [PATCH 3/3] smb: client: reject short responses in SMBQueryInformation()
Date: Fri, 11 Sep 2026 15:57:58 +0100
Message-Id: <20260911145758.3833254-4-diego@bynar.io>
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

SMBQueryInformation() reads attr, last_write_time and size out of the
QUERY_INFORMATION_RSP returned by the server without first checking
that a whole QUERY_INFORMATION_RSP was actually received. The length
of the response is recorded in bytes_returned, but nothing constrains
it to be at least sizeof(QUERY_INFORMATION_RSP) before those fields
are dereferenced.

A malicious or compromised SMB1 server can return a reply as short as
35 bytes, a header carrying WordCount and ByteCount of zero, which
checkSMB() accepts because the calculated size matches the length
received. last_write_time and size then lie beyond the received data.
smb_init() hands out a single allocation for both the request and the
response, so those fields are read back out of the request that was
just sent, and a timestamp and file size synthesised from the path
name end up in the inode and are reported by stat(). SMB1 is not
negotiated by default; reaching this code requires an explicit
vers=1.0 mount.

Reject the response unless it is at least
sizeof(QUERY_INFORMATION_RSP) bytes long. This cannot reject a
conforming server: the response is documented as wct = 10, so the
smallest valid reply is sizeof(struct smb_hdr) + 2 * 10 + 2, which is
sizeof(QUERY_INFORMATION_RSP).

Fixes: 6b8edfe0f918 ("[CIFS] Support for mounting to older servers part 2.  Add support for legacy getattr (lookup).")
Cc: <stable@vger.kernel.org> # 6.19.x
Assisted-by: Bynario AI
Signed-off-by: Diego Oliva <diego@bynar.io>
---
 fs/smb/client/cifssmb.c | 6 ++++++
 fs/smb/client/trace.h   | 1 +
 2 files changed, 7 insertions(+)

diff --git a/fs/smb/client/cifssmb.c b/fs/smb/client/cifssmb.c
index 30b9621664e8..aad1c866d8e1 100644
--- a/fs/smb/client/cifssmb.c
+++ b/fs/smb/client/cifssmb.c
@@ -4068,6 +4068,12 @@ SMBQueryInformation(const unsigned int xid, struct cifs_tcon *tcon,
 			 (struct smb_hdr *) pSMBr, &bytes_returned, 0);
 	if (rc) {
 		cifs_dbg(FYI, "Send error in QueryInfo = %d\n", rc);
+	} else if (bytes_returned < (int)sizeof(QUERY_INFORMATION_RSP)) {
+		/* check that the received response can hold a whole rsp */
+		cifs_dbg(FYI, "%s: server returned short header. got=%d expected=%zu\n",
+			 __func__, bytes_returned, sizeof(QUERY_INFORMATION_RSP));
+		rc = smb_EIO2(smb_eio_trace_qinfo_rsp_short,
+			      bytes_returned, sizeof(QUERY_INFORMATION_RSP));
 	} else if (data) {
 		struct timespec64 ts;
 		__u32 time = le32_to_cpu(pSMBr->last_write_time);
diff --git a/fs/smb/client/trace.h b/fs/smb/client/trace.h
index a1c0cb1a5833..6926a62ddb05 100644
--- a/fs/smb/client/trace.h
+++ b/fs/smb/client/trace.h
@@ -71,6 +71,7 @@
 	EM(smb_eio_trace_qfsinfo_bcc_too_small,		"qfsinfo_bcc_too_small") \
 	EM(smb_eio_trace_qfsposixinfo_bcc_too_small,	"qfsposixinfo_bcc_too_small") \
 	EM(smb_eio_trace_qfsunixinfo_bcc_too_small,	"qfsunixinfo_bcc_too_small") \
+	EM(smb_eio_trace_qinfo_rsp_short,		"qinfo_rsp_short") \
 	EM(smb_eio_trace_qpathinfo_bcc_too_small,	"qpathinfo_bcc_too_small") \
 	EM(smb_eio_trace_qpathinfo_invalid,		"qpathinfo_invalid") \
 	EM(smb_eio_trace_qreparse_data_area,		"qreparse_data_area") \
-- 
2.39.5

