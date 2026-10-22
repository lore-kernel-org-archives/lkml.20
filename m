Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641218;
	b=xItebCe97Ul6WWEmol33nDTww07QFbMrBBC4KWcohMqic/FFGWEqa9iMcvaNFLWAssju
	 4WjBzSny/90e43J5Zl91sM8GyGfpUlfhc6bB51xDYmDpokgPwMPmvp/869K2nXkMLuChz
	 E4Ddc+RJ/8glzM7JFc/Z4wjX5Qm21FfID9/AsN3Fh39BENRlxMMs8zbick1J73SiozB/I
	 1DxL7f6byDX+4c1e75ps9bCutt/QonrHzr6CjBuGk/AS4szQGpfywCmoLKsrL6iL4Bw/3
	 CC8m6eXc/Cl5pNu2xbB7Y/916V0x3qhpoU99RWbPnr/aekSrXvSjV4gU2ZaFv8tyhIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=81J3smnygA2s3kCWaWEydJPIgP+ALOjjSzDrlRy5GOM=;
	b=yz6gX2SSkk0UU5pWBmapLihA/aXw2vZPT1Lk37CoZ4YxSE+nPxpm2z9T+zWn0Kn2+zIb
	 qgmlg6VOM4iQ1ZtrrJsscjY3RUR35Oa/mxGCeJqZcoa9zSakfvZIe0zr6Upvi4eXvNgde
	 KuVoGjFkh1wLuKR5+na5d6b/53yOiiUH/5/zE9YKhpm/S7odIkI9X8US3b7fvK2uphr+R
	 pgJ7Iy8VWVEVpnAB5N333TWFARSgMau9/W84G68AXB4D6aZbICIiLbg07l/vvcD8Lqszi
	 11v9M/7ORYFdD6R9qpRB2dp2YuuP5rRjchnZiQUw1Q4zc2/nXpicKiFc58HpiFbfNJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h5dPeZ+P;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A54606A327
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A54606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h5dPeZ+P
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso876825e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792641217; x=1793246017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=81J3smnygA2s3kCWaWEydJPIgP+ALOjjSzDrlRy5GOM=;
        b=h5dPeZ+PhvVJ8IkAxiRIc1zrTHCrLKeJW357TN6gvuntRyx0ZT/+C1AcDCauXQtabp
         WhNMS7vkHg090RJHV7vJwxdspfaISi+2t3JlViBluJldeYQTRTqQdT9duypTfFQXrnWs
         4w1KFEEPD63yxsjx3m9hvXrthhDen3863XVvyLrVsxYUaCXIlMoJzVXj86wV3oPkjqVS
         o5t6+90xP9/B5yiWbIyLw0yaHgvkqJaJ0vEHq3sUrri7/bZJmUM9l8DFCFvZYDtTNucb
         rrTSqQEeiFDAWyQpnerEJfZUYvKdk9uZSaY5BU2mh0a0XDTY5tjQCOCBCkuu9Mnw48Xp
         tbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792641217; x=1793246017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81J3smnygA2s3kCWaWEydJPIgP+ALOjjSzDrlRy5GOM=;
        b=JsKv/ifJAVtByMpJWB4teH23ubcqO8N2AeGOEGN2gERGWPcvPMQ6Yj95u+oR6+PVzC
         q8AUcvFSIdHzxF3s3vmgBhM4C/tgRsUBGho3gwtSkdaT52T/ECbsxjnA1ThOaijBIyas
         5E02zeSnNqDfCSrAwOuGcpGD7TnZwMF/3bpu1q8oDTxBYErwKJB3VRBWx6iHMkit+px2
         DqEMUF1RUAKfZ6Pt/AbSGseoHky3ZtbpAA8pcnz1t02VmXYWs3U+18uUWWS8EG1bemXF
         SYoG+lWoOAx1n5AESOG4Q+LY5kPq7t7YBhKMmqCS2Izda1fCUTA99V0IT9UpMqLuBTiN
         ho6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwI1m2eHGhEf8HdAUrU2zuZ2sCDiPLgIgd9Qo535JtAkmTAG9oieWQa44lD6ShP1D2fUrlhiKnpNlUqNL8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuEqd6n82TwEABpCCK0uIPZxmAtGWkqruLDm8K/rJUl7KmAKRl
	TrDiFf1C5xbdy+LKrNxnDNeaprfc+9kgL53J+1HLJWoSTvylSgW6gjes
X-Gm-Gg: AYBFou3N9tbg6/5quhNIQoM76jWvzK3bvqFLDIzdtRYXlIMiv4LirNx25U/PQ5p7rj2
	VYDoMt/P6lFVJ4BiI0truMH2HcgYPNfaCER5k88SI8IR+ZAqBlAYalDQmFMcY6YxgTCRskc48oS
	LGXSMze6pddzzccSLiJ0r5qVK76yPzJ5AsHw+9baD1N9Bp7+A3oPqW7xo+aO4rxz5+Aaa6vuW15
	krUSecnwoX5ek8UZWCgJPRs5xg0L6SqPJxukDV7Ft3/wHuf/hEh65orPnr3EwJG2s8WXB27Oq0o
	QwtmNfEMUkdVRN/e3ZEkujVfpiSVV35MaHMzmdyFQ4rtZ0bqsSD0rLRt76QdlVTChytkvqCe2jc
	czisidwO5dFVXj+qK5T+kFZ3qSmHEzPWleqxwNAiWYQE3uA5LX0csOZeEAFzZgeZX3Jz6Z/LJez
	oXvyRpF+in74CPOfjnsogEAEZ55ueP4waE6Y90IE/q5nrh5Q1z1aQWhiMEUXDPB5Z1qQut5iTj2
	WLhcx//zWT/mOk8tMWDJ1trGZItS1kwHcaQR0wVIxMgUnWoa1xMOzqjsUXRdRTs/8NF9+rp7JJ7
	OPmciEdaFadElNlHTkyhD2T8JfEjh/E=
X-Received: by 2002:a05:600d:4:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a1fdd39eddmr63730625e9.32.1792641216572;
        Wed, 21 Oct 2026 20:53:36 -0700 (PDT)
Received: from SurHub.localdomain ([102.213.69.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd70027sm44020925e9.0.2026.10.21.20.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:53:35 -0700 (PDT)
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
Subject: [PATCH] smb: client: validate the data area in SMB2_read()
Date: Thu, 22 Oct 2026 06:53:29 +0300
Message-ID: <20261022035329.17871-1-suruurism@gmail.com>
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

SMB2_read() copies le32_to_cpu(rsp->DataLength) bytes from
(char *)rsp + rsp->DataOffset without checking that the range lies
within the response actually received. A READ response with
DataOffset == 0 makes smb2_get_data_area_len() zero the data length, so
smb2_check_message() accepts a frame as short as the fixed response,
while SMB2_read() still uses the server-supplied DataLength, capped only
by CIFS_MAX_MSGSIZE and the caller's length.

A malicious server can answer the synchronous read used by the
mfsymlinks (or SFU) symlink parser with an 81-byte READ response
carrying DataOffset 0 and DataLength 1067, making the client copy 1067
bytes from a 448-byte receive object (KASAN slab-out-of-bounds; up to
16 KiB in the general case).

Clamp a zero (or header-overlapping) DataOffset to read_rsp_size, as
handle_read_data() does for the asynchronous path, and reject the
response unless DataOffset + DataLength fits within rsp_iov.iov_len.
The SMB1 helper was fixed the same way in 5be5bdda5863.

Cc: stable@vger.kernel.org
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/smb/client/smb2pdu.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index f276acf7b..8291eadd7 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -4947,6 +4947,7 @@ SMB2_read(const unsigned int xid, struct cifs_io_parms *io_parms,
 	struct kvec iov[1];
 	struct kvec rsp_iov;
 	unsigned int total_len;
+	u16 data_offset;
 	int flags = CIFS_LOG_ERROR;
 	struct cifs_ses *ses = io_parms->tcon->ses;
 
@@ -5006,8 +5007,29 @@ SMB2_read(const unsigned int xid, struct cifs_io_parms *io_parms,
 		*nbytes = 0;
 	}
 
+	data_offset = rsp->DataOffset;
+	if (data_offset < io_parms->server->vals->read_rsp_size) {
+		/*
+		 * win2k8 sometimes sends an offset of 0 when the read is
+		 * beyond the EOF. Treat it as if the data starts just after
+		 * the header, as handle_read_data() does.
+		 */
+		cifs_dbg(FYI, "data offset %u inside read response header\n",
+			 data_offset);
+		data_offset = io_parms->server->vals->read_rsp_size;
+	}
+
+	/* The data area must lie within the response actually received. */
+	if (*nbytes && (size_t)data_offset + *nbytes > rsp_iov.iov_len) {
+		cifs_dbg(FYI, "bad data offset %u length %u for response of %zu\n",
+			 data_offset, *nbytes, rsp_iov.iov_len);
+		rc = smb_EIO2(smb_eio_trace_read_bad_offset,
+			      data_offset, *nbytes);
+		*nbytes = 0;
+	}
+
 	if (*buf) {
-		memcpy(*buf, (char *)rsp + rsp->DataOffset, *nbytes);
+		memcpy(*buf, (char *)rsp + data_offset, *nbytes);
 		free_rsp_buf(resp_buftype, rsp_iov.iov_base);
 	} else if (resp_buftype != CIFS_NO_BUFFER) {
 		*buf = rsp_iov.iov_base;
-- 
2.53.0

