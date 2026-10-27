Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113655;
	b=AZHOlNhVrU3UhTpBDekAYtPMlAd/AjPI9YIdgK4XeT4gjvQbamk+5BnYV/YFYsC3LW4y
	 gzO8/pSfaEpMYcYagkGwkkzHdQ8Pi5UdMvSop9kosu/otA8v1debv3ySV8DLO9nOpGgWJ
	 Dj0+QJ5kwz6Z2yybpHTyK0IHgd8Ijwx84psKUzaUPqe09aE5zUFlq+RuQwM9rTHTI7Uqc
	 nKCfEQ5WslMlvXnDG94XWXmFdLQ/Yn3uNYVzhE9iv2OFWBFNj1S7yNcT8oOE3xnbIPlDF
	 Ev1PBycIVZfVGnUQ871GeN3rF10XtNeuv8uIPosxwdDrOq44JIq9Bhk3gLfpJ6Rmknw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mxxURynAR9bAxx4Uoj/0ut49X9XR1HFcD/rz/A3dVCU=;
	b=t1BgnFAhdRO7X+N+4Fs/gleG5An/138875j15sFe9SIA/aIGJwMZl8EfVNdsdxQoOonY
	 fcMp/N/5KmHukgT0ZoAjAHx39Jw2GZfwfWf3lXYp7zFOhBghTz4gN52Ib8+fq9QR3191k
	 f23DgRQ/wXK7zWeLW+BS1//FYOIV39B4ZQ1/u3U88FME2fOV+PsoNbWBrrYHqlJGPM6Cn
	 IjBbTtxqmBI9VbChpIscYERQuxFkJG6U6/1VpIFjHTmHJWZIlb7Oe0NlKXGVyORzsJY8e
	 WGNa9sF/1DM0wDQOFqem9d4gkcHyBhwaGM3HUDwgdAY2LvR5WJAi5b8qjLzKEK1Fgxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pio6rIqo;
	arc=none smtp.remote-ip=74.125.231.200
Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D1D606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D1D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pio6rIqo
Received: by mail-oi2-f8.google.com with SMTP id 5614622812f47-539edfadfa9so1771522b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793113653; x=1793718453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mxxURynAR9bAxx4Uoj/0ut49X9XR1HFcD/rz/A3dVCU=;
        b=pio6rIqoVvBFD4OXEdzToeCLjwWtoTweeKR6MCtT/UloGziG1bqsYU+jO8UiUKU2YA
         2bSh992AF9MKghf37YyuB4AozwHoXyuCZBIEZTUBzKm7XiQ+L3/HzcZ9BIDX6mRUA1cA
         waVy34j4xO5fhA/uwxC+IoumHD5aRr8k1raiR1PxwXZuP444zRIuISqASaYfBHbBzxxY
         F9RLYzpaFRGv9XqIMQCviqmA/Q62yPLj1/f9noiWgUruUNxuPx8cxdWXgYBvOPZBGtMd
         QofyHI137pP/03jgyQPbDEGsXll+AY7Mj0UBRP+kH6uMtWz82pYknxyx9MdkTv717A/X
         tbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793113653; x=1793718453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mxxURynAR9bAxx4Uoj/0ut49X9XR1HFcD/rz/A3dVCU=;
        b=V9iAMd+B6KSSphWhCJMj8mW0bHCBrAjoraAiyLzqSq32Ls4u/X2UxWABGmDEr6p3N7
         XXFv2DGq+tKrNXFphLcq5CuR2gevSKX8TKApxxD/DZcBqinKOAv05/BZSaEF9x07WjOD
         CKophh1mMs1oy1q9jEfnZG3sTZKg2JlQGXkjHpMspQZi2CIBnxDD7ETFkH9H3CegIWWW
         +mc/1RvnjR/NfR26V8GClIsoFlUI2MxbYX3mbiw2KCA5PgSXrvYXal1bKhG6cnmfni+z
         tMctS6FEkF8Rih/QuB4XYs+j2O3ZyS8ibvZsUPdm515SH5bN7+EH2ysO56AYl2LL6fbG
         4zRA==
X-Forwarded-Encrypted: i=1; AKwUvBzwLOV6A91DI6FioQQl0cpsmaxdBDmXSQZV4awPPVnK+LeVoTxMPmHoafZNyxCuhbaxx+W5UgHeZNE/VGs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPp4mlk75nt6X+giccTv0r30OG+O0CROyBXDWCK5zZIXYl4OfD
	RpLfjymwYgizVgsAV5aVxCS9kBXgs3lnzuwBkhQctmFHbsNSgQumGoFV
X-Gm-Gg: AYBFou2p1eOqqgwE8AeoJ0/oQAQuFfSvGEWr9P+eRyBzcGhDH4M+O2SqSwiDHVaf4hR
	Ve1xutBUlsGTSpXp8fmDRqz6rXuKlKxfroKosFQNHI/cwn0bzadCV51nSin9FZ5+GqYz8SOau44
	7Wcu7/wG+G0+Bbb9vudP/tTJcSIAesF7mWaW+RNnR1qeMsbc8R/DPNr+oFNp8xPVV2alcETGFn+
	zJTtoUodCAdognbjxgWJLFgx9CXvRtQuYGxhQ3qI9TR5mRlk+95mDG7TS3rmOKmHs5U0knheedz
	0XPcVXcp7BSyC0C98dKx3jfeTG57Jp1SgB8GA/yPvvaVbdlmMYuc+UJQFwfd9FFXmJKaZf3cAxl
	AI2hy41wu6waH+7cqjk5JeBf/4dW7c6yaYjw7+g/SPtmhx9pHEw8SqMJtFgsauBGpZ8LhJLbL1m
	9ZsgFyG+Sg1sjcCZc0+Q9BDTnkmyD+kNBl+iUjba+EIUY2VvAVXFOUuiXSbmAdCybezb2HbdCSz
	gYbfVsqfDMyBS/2NyAki6PUYwe4VV7yQltwvZWTC7GXh5ILymWowkI8/svZcfg7+ls58bOz5J5a
	bCX34UwW0rPHx7LpOw==
X-Received: by 2002:a05:6808:1494:b0:4f8:4a95:9b3b with SMTP id 5614622812f47-55c003d7fdfmr6129548b6e.68.1793113653505;
        Tue, 27 Oct 2026 08:07:33 -0700 (PDT)
Received: from localhost.localdomain ([14.22.11.180])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm7448276b6e.5.2026.10.27.08.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:07:32 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Nilesh Javali <njavali@marvell.com>,
	Manish Rangankar <mrangankar@marvell.com>,
	GR-QLogic-Storage-Upstream@marvell.com,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] scsi: bnx2i: fix OOB write in login/text response padding
Date: Tue, 27 Oct 2026 23:07:18 +0800
Message-ID: <20261027150718.949711-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

bnx2i_process_login_resp() and bnx2i_process_text_resp() take the
payload length straight from the CQE field (login->data_length /
text->data_length, u32) written back by the adapter, without any bounds
check:

	pld_len = login->data_length;
	bnx2i_conn->gen_pdu.resp_wr_ptr =
			bnx2i_conn->gen_pdu.resp_buf + pld_len;

	pad_len = 0;
	if (pld_len & 0x3)
		pad_len = 4 - (pld_len % 4);

	if (pad_len) {
		int i = 0;
		for (i = 0; i < pad_len; i++) {
			bnx2i_conn->gen_pdu.resp_wr_ptr[0] = 0;
			bnx2i_conn->gen_pdu.resp_wr_ptr++;
		}
	}

resp_buf is an 8192-byte DMA buffer (ISCSI_DEF_MAX_RECV_SEG_LEN).  A
CQE whose data_length exceeds the buffer makes resp_wr_ptr point past
its end, and the pad loop then writes 1-3 zero bytes out of bounds.
The data_length is also passed on to __iscsi_complete_pdu() as the
response buffer size, so a login response with a fabricated data_length
turns into an out-of-bounds read of the same buffer delivered to the
iscsi userspace daemon.  The login response path is reachable before
authentication.

Clamp the payload length to the response buffer size before computing
the write pointer and pad bytes, in both the login and text response
handlers.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: cf4e6363859d ("[SCSI] bnx2i: Add bnx2i iSCSI driver.")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/scsi/bnx2i/bnx2i_hwi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/scsi/bnx2i/bnx2i_hwi.c b/drivers/scsi/bnx2i/bnx2i_hwi.c
index d24cc2c795d61..735cfdb28289b 100644
--- a/drivers/scsi/bnx2i/bnx2i_hwi.c
+++ b/drivers/scsi/bnx2i/bnx2i_hwi.c
@@ -1466,6 +1466,8 @@ static int bnx2i_process_login_resp(struct iscsi_session *session,
 	resp_hdr->status_class = login->status_class;
 	resp_hdr->status_detail = login->status_detail;
 	pld_len = login->data_length;
+	if (pld_len > bnx2i_conn->gen_pdu.resp_buf_size)
+		pld_len = bnx2i_conn->gen_pdu.resp_buf_size;
 	bnx2i_conn->gen_pdu.resp_wr_ptr =
 					bnx2i_conn->gen_pdu.resp_buf + pld_len;
 
@@ -1528,6 +1530,8 @@ static int bnx2i_process_text_resp(struct iscsi_session *session,
 	resp_hdr->exp_cmdsn = cpu_to_be32(text->exp_cmd_sn);
 	resp_hdr->max_cmdsn = cpu_to_be32(text->max_cmd_sn);
 	pld_len = text->data_length;
+	if (pld_len > bnx2i_conn->gen_pdu.resp_buf_size)
+		pld_len = bnx2i_conn->gen_pdu.resp_buf_size;
 	bnx2i_conn->gen_pdu.resp_wr_ptr = bnx2i_conn->gen_pdu.resp_buf +
 					  pld_len;
 	pad_len = 0;
-- 
2.43.7
