Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113682;
	b=cfX5cg7emyF/gZzk/EHW0dAKKRXsjcq704C8gHP8nM68hTG8GrY1zA381211q2e0exbN
	 kFUbFtK9bIEi5BvtdJobvXoGrHjiJLlf8vLvmuG85GTL+ZopqS4yv0JU4tYgag/CBVnp3
	 Nuk8DpET+JhiJBwckR625YFvmNiwmb9jBM4b6S/x2/ABItX6k1sZCgQ4sdB3UngwFgIdH
	 4THg6lIsIfC2XM/buDvFXHSclCdEPWFJwLxrtQWMVwljem12pageeht4mjKey9IwYKu7E
	 VpFfm5dUAU53JOgmLH0ghbh2zgd9P3viaUzYRMIVTFFjPxbSW3htbkpzziH4jgfJPPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1KzTeYbxSizdExmDLUTY3oH0bwSQMee2NZJRt9PMZ0c=;
	b=zjbHGZFB3yqoVwj9ZRQksImprbP+dwWic2Z9eJSd0rpVg63v1WU1xh6r8yJtOMX4WdyO
	 nMQr3PVicvaOkYEytSMOe9VMP6QT1/LP7mDJ/obJaSSFVmNaAeBcN0aopmoGU7VMUpOsC
	 8X0KUhfWiCosrkGcRUTVDYCv1rDjoA1MYVljC8P9Phm1POW2koZugmxlrlcbDSaF95fRE
	 2ekyjb1J7zFl70lSD2beJ9OkMbbK5ff2HVH1s5JY9so1XkCU9+Zr75b0GUtraMD/k+xYR
	 kd5EJco/p/s+5L23t/Sa87U414onjKv/vFoDI5fn3cnNrhfVds6VnsA7LDc7KU+3qEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nJKW8S6;
	arc=none smtp.remote-ip=74.125.231.137
Received: from mail-oo2-f9.google.com (mail-oo2-f9.google.com [74.125.231.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC2D606A337
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEC2D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nJKW8S6
Received: by mail-oo2-f9.google.com with SMTP id 46e09a7af769-821a4a69647so2150961a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793113681; x=1793718481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1KzTeYbxSizdExmDLUTY3oH0bwSQMee2NZJRt9PMZ0c=;
        b=0nJKW8S6y7i+XLa6TPGMvU6QxLKy9bw6wEcfFTBpFlLA8HJkuCw+P3q11A9CRHn0JO
         LRbj2FMNQ3jCfMrsnhP6CnZnf7pkC5IRUyU7LxQXBMyRHw4tNedJGfnZeO3qwSg2pym3
         IypH6124GeziLwLLdO1Dno+EQszr/ENlTzJPrhtRWuaOUa/75B6x0xk8DPmcc+wfkK64
         poeK4EsUjAQg4AcVKN5wGUmmEcEsks+t9+dKX5tFophAUiWQAxydvsbPBaV5DIy4T1Mm
         kEl/EesO2/+KU5huhumAHWXlclun2AU3sw4nAcuW9ZnII415N6+rRa8jcnV5OU3MsApr
         aiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793113681; x=1793718481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1KzTeYbxSizdExmDLUTY3oH0bwSQMee2NZJRt9PMZ0c=;
        b=EViUvEMiQ5/crmvfvXXmtpCM/kyuHTgMg7PoG29CdZfAEZLZViJ/AxPYNvjVG9MmWB
         iM09nvAr25msPrmF7/zgvzZh+1yM4QGEWdpKvLN3RSXVSRAguyXqN51z+9HAaPJBAFpL
         MtBHI3TAUgImWcdfdusb5xTHFtT5d9ZV8j5w0MkttprP52ERsQOM7jHhbIJAG7tMahWD
         SWPo/A1sqR9Q7nuRJXwKSb706mu0KyY+O4uOSWFs+E6mlPhr9lZEQZotAPLjRXW8OkfD
         7MmEK9u9dpP9cjqkdcXIFZ4LMqtO8vh88RBIEpkPf3A198QZ3mMaR28pWO3u6TfLQVey
         QzQg==
X-Forwarded-Encrypted: i=1; AKwUvBzGCL8kuNkQXk8W4jwNfpsAG4Gb1MxhdmFeIeRg136S6pRhmhufkM55klLOQQXrR1hKKWmAHc+khCg0m1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKN0iBh+YZulZuaTiI7urQsTVp6+aT7BJtNy9XQqJJnMrzEDqBw
	Io2lVOeEyKLa6T4Uw25FtrDgOYhs9sFCvZtsajRBl3WQOfcNw/xzZURu
X-Gm-Gg: AYBFou2ectc2VzeUcxSXu0HnmTi3eOOEQNhwkbtCgFqhSXI2SL/219S0Ap7n5Ity0BS
	BR/1BlLmCYL21RsyIlzZg+C01Iacj2JQofVvhPx0o6iQV+p+SZAXoOQEjJZpeS34LQFQM7Avjth
	mEv5HZ2j78pytmUy6nUIi6n/vkLMMuz0/N/j33Sqx1CcOPsJDXwenaVkyiLJgttCp+Pt4CYeI+K
	Hy+m+Trt/Dj8DJSwWf0CjbV4Dl279L5NX8ztYice1t0IEvDEyU75cxJL7apwckjnEcMypgw7avK
	AYFvw9OBVhqZBr7WUZ4u/U4L95TplmMQlWA4zivJU5A8kJUWz4SSVxWLTNDstrYGPRN/WLe2tGq
	ZPhcFbvDM9SRH0v7Cvw5h+joRcCyWTS9Q8RqzL/WUAE+iFyMyLak8XiwplYTXGyFz7ailm8PpBY
	oCnpARpw+aIbnaTFXEqkiKQRW14RnTEwGdBMDjycsYz7l/PmUxgEjA6Xox4FqwFl7lHjHDixvbn
	NDYhixjUl2H027iROPwz+64gqNP+tGC0rpKx38tlJMhZciXB6hiuC1NvZHZ8iykI7pjEWT0bnNi
	8VRKFv3f3x72bzmhUYm+sfYAE9Qs89T0Lmey/mMK
X-Received: by 2002:a05:6830:927:b0:7f8:4ebe:2854 with SMTP id 46e09a7af769-850fb0769c4mr8385648a34.4.1793113680898;
        Tue, 27 Oct 2026 08:08:00 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fa99ccfbsm11397711a34.5.2026.10.27.08.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:08:00 -0700 (PDT)
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
Subject: [PATCH] scsi: qedi: fix OOB read in login/text response completion
Date: Tue, 27 Oct 2026 23:07:52 +0800
Message-ID: <20261027150752.951217-1-bsdhenrymartin@gmail.com>
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

qedi_process_text_resp() and qedi_process_login_resp() take the payload
length straight from the CQE field (hdr_second_dword &
ISCSI_{LOGIN,TEXT}_RESPONSE_HDR_DATA_SEG_LEN_MASK, 24 bits) written
back by the adapter, without any bounds check:

	pld_len = cqe_text_response->hdr_second_dword &
		  ISCSI_TEXT_RESPONSE_HDR_DATA_SEG_LEN_MASK;
	qedi_conn->gen_pdu.resp_wr_ptr = qedi_conn->gen_pdu.resp_buf + pld_len;
	...
	__iscsi_complete_pdu(conn, ..., qedi_conn->gen_pdu.resp_buf,
			     (qedi_conn->gen_pdu.resp_wr_ptr -
			      qedi_conn->gen_pdu.resp_buf));

resp_buf is an 8192-byte buffer (qedi_iscsi.c).  A CQE whose data
segment length exceeds the buffer makes resp_wr_ptr point past its end,
and the fabricated length is then passed to __iscsi_complete_pdu() as
the response buffer size: an out-of-bounds read of the buffer (and
beyond) delivered to the iscsi userspace daemon over the iscsi_recv_pdu
netlink unicast.

Clamp the payload length to the response buffer size before computing
the write pointer, in both the login and text response handlers.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: ace7f46ba5fd ("scsi: qedi: Add QLogic FastLinQ offload iSCSI driver framework.")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/scsi/qedi/qedi_fw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/scsi/qedi/qedi_fw.c b/drivers/scsi/qedi/qedi_fw.c
index 854efa4f61d87..24724fcba6571 100644
--- a/drivers/scsi/qedi/qedi_fw.c
+++ b/drivers/scsi/qedi/qedi_fw.c
@@ -115,6 +115,8 @@ static void qedi_process_text_resp(struct qedi_ctx *qedi,
 
 	pld_len = cqe_text_response->hdr_second_dword &
 		  ISCSI_TEXT_RESPONSE_HDR_DATA_SEG_LEN_MASK;
+	if (pld_len > qedi_conn->gen_pdu.resp_buf_size)
+		pld_len = qedi_conn->gen_pdu.resp_buf_size;
 	qedi_conn->gen_pdu.resp_wr_ptr = qedi_conn->gen_pdu.resp_buf + pld_len;
 
 	memset(task_ctx, '\0', sizeof(*task_ctx));
@@ -292,6 +294,8 @@ static void qedi_process_login_resp(struct qedi_ctx *qedi,
 	resp_hdr_ptr->status_detail = cqe_login_response->status_detail;
 	pld_len = cqe_login_response->hdr_second_dword &
 		  ISCSI_LOGIN_RESPONSE_HDR_DATA_SEG_LEN_MASK;
+	if (pld_len > qedi_conn->gen_pdu.resp_buf_size)
+		pld_len = qedi_conn->gen_pdu.resp_buf_size;
 	qedi_conn->gen_pdu.resp_wr_ptr = qedi_conn->gen_pdu.resp_buf + pld_len;
 
 	spin_lock(&qedi_conn->list_lock);
-- 
2.43.7
