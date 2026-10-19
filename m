Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CAF48F850
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395939; cv=none; b=uW93TkHaFX0vmFSrEKlFzcnHyIC0jCRqdgSr5j6J0dHsL8em5GJR7qi4o/M3SPhMAecOaTc81TS9K2orT//sRrXIsX4CvKYPIGn3dPrMX4W21A/eY5QTJUI2+4wc07WsbZoW4ZrS0xOs5QBlmau8sufLLuSFHTTILEf5DdEtGQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395939; c=relaxed/simple;
	bh=KFzqFt36Mxg0PEqNKBvEegXtqyyn8gNpLIWgf9rcm1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DdcD5laHOfob/mCd1Vf2Nv71qVYyzecQxVutiuPX/wSN1hQLkLNf0gaYAyh8LPLq14U874EgJGQqmiTHPIWX/tJwdOMFYbg4Ck0og5EbCIZDI77wVNdFsPmUKv+VGYnQEpRaX9P7CMOO/vzd7w2IlgDkdx/x7O75temDYtyRFGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=lkGDhPri; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="lkGDhPri"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a06b44bd01so294228b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792395937; x=1793000737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wv36J9WWjzNdf3uQYboz2o0X4Yo9Dp1/goKB74IX4RI=;
        b=lkGDhPrif28OtIRvL0L3z93AfEpRueQC58X5YRV0578kpBXf7OYDM1WFLdxK6KIUXU
         8noVPg1gTW1YokbYruVnQ8Ty3FqidPmt1cXCx71coK3hZ4/B4Pgokdxv7MVhnMZ5qIU3
         Y1pFrkoj14n0fR1gVvWtL5Q6dTAtOG7a21uvGe1asQjwdlAH85kKSITAvTVlNyyEPbsz
         wFQQk47YZr7x6J10OWHAnJvjKJ9nlwzqu1wblabOOeKZPjbshbA7IEjq68L72HZNMSOk
         xTNWkwx6b0izOu+ZAPjwU16Sh7NW4AiT08zQJzuOpkTYTSyBGI+xD4/LrZAmu4eT7rj5
         XwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792395937; x=1793000737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wv36J9WWjzNdf3uQYboz2o0X4Yo9Dp1/goKB74IX4RI=;
        b=Am2uKmHewyaLzpVUrPZkDAk8vcC4QjKKQmnQvK+MBuf29lGh6G3KxqyzaYLvIXRXCD
         sK6Uwdftk+jUqp4VXbyQt53iPlRErSeOpyxIO7ajxl6hvOJtEWTED7y8QorJR1d2N11K
         FWh3eByW7x7Au9JhP1CakP3WgAsO5Vgqrf2AgHK+s3bIY2nlNCvUfro2ht0M8v3grRuB
         qkRn9Q6gCh23HQcOWydcr/2HckJJTpM+Y9bj7mi+HSdwCppHzjLsOQlZYFMfH4/Er12L
         NyXN1JQlWSwMdUI6czjhUBreMFzGH/fIixmG0/B++AoWzMRC6eR7CbnU7qK55BPbVRjg
         YVPQ==
X-Forwarded-Encrypted: i=1; AKwUvBykaB7ALY2Db8LU2/clr4yqC2+jf7VfKv4GB8MWMdkRVQ6y184apFRH9KPdBDFMYVAoEXQ6womWgow10J8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLssG/ibKg+tAFIHCT7Il7HyuobBErfvpTZPfeTLVKJivSLSiEW
	6IdKCU+URy+XF3nvzdE3oSjO0VEYRYOAAMhPPk1a0/ECZh9fXhIQX5ZSqD1xvF+EdO4=
X-Gm-Gg: AYBFou2QuRDvv+sqiSLgzccITBuj++s5j0Xyqmajz/KxhgpET2SsJeTLno1nfFo882Y
	pX0xKLMv0t5N6Re44E1J+i3P+Iawgc7RVrcZHTw37rztPcuT9nEbZdTDBJbBpbb3xcS23q23hG6
	MdZxzV+4beAkiiPzRgGsvkPazuVowiuNTEpk+xyn3Km6ISAeJ4BQOxkB2bs/C8sJwfwePwQDgLv
	1Uw0aI5HqgieEImvJJNQxZSR3xnjLsoJfgtLJhibWhla+wAoThoR6ZWqcAmo6fnwddqcjZvvSkN
	m1UkeGPRueKcbGsIuKFGAGeCJkEphqYGgHCzhQAZ2AagvixeIVHl+4KxNfcVYDia/gZeh1JtMvr
	S/5PZUcCHFwpPKEsxzMhuolTcKKs9rh+wqYovvU1PyyXwPu2p7f5kql8rVidc5DgQYt2bYxwGAM
	EPyhzTgFkmp8JDlEVaEyK9gyUeKt5CnXWTMCxYqUp7Rhf559V0rdK1P/4ZH2moTU8+VS2kpej03
	InXwA==
X-Received: by 2002:a05:6a00:4c88:b0:89e:d76c:327f with SMTP id d2e1a72fcca58-8a04cd23fc7mr5017000b3a.34.1792395937189;
        Mon, 19 Oct 2026 00:45:37 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58017244sm3494351b3a.47.2026.10.19.00.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:45:36 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: njavali@marvell.com,
	mrangankar@marvell.com,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: yhlee@isslab.korea.ac.kr,
	GR-QLogic-Storage-Upstream@marvell.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] scsi: bnx2i: bound the login and text response payload length
Date: Mon, 19 Oct 2026 16:45:21 +0900
Message-ID: <20261019074521.658170-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019074521.658170-1-yhlee@isslab.korea.ac.kr>
References: <20261019074521.658170-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bnx2i_process_login_resp() and bnx2i_process_text_resp() take the payload
length out of the CQE and use it to place the write pointer inside the
buffer the chip DMA'd the payload into:

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

data_length is a u32 and nothing bounds it, so the padding bytes are
written wherever the length the chip reported puts the pointer.  resp_buf
is an ISCSI_DEF_MAX_RECV_SEG_LEN coherent DMA allocation, two pages with
nothing to spare, and pld_len is an int, so a large enough length puts the
pointer in front of the buffer instead of past it.  The length reaches
__iscsi_complete_pdu() afterwards as resp_wr_ptr - resp_buf.

The size is already on hand in gen_pdu.resp_buf_size, which so far has only
been handed to the chip in the login and text work queue entries.  Cap the
length with it.  The padding stays in bounds because resp_buf_size is a
multiple of four, so a capped length that needs padding is rounded up to at
most resp_buf_size itself.

Unlike the receive queue path in the previous patch this one is not covered
by the KUnit harness, since reaching these handlers needs a task and a
connection; the bound here is the size of the allocation the chip was
pointed at.

Fixes: cf4e6363859d ("[SCSI] bnx2i: Add bnx2i iSCSI driver.")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
diff --git a/drivers/scsi/bnx2i/bnx2i_hwi.c b/drivers/scsi/bnx2i/bnx2i_hwi.c
--- a/drivers/scsi/bnx2i/bnx2i_hwi.c
+++ b/drivers/scsi/bnx2i/bnx2i_hwi.c
@@ -1461,7 +1461,10 @@
 	resp_hdr->active_version = login->version_active;
 	resp_hdr->hlength = 0;
 
-	hton24(resp_hdr->dlength, login->data_length);
+	/* The chip can only have filled the buffer it was given. */
+	pld_len = min_t(u32, login->data_length,
+			bnx2i_conn->gen_pdu.resp_buf_size);
+	hton24(resp_hdr->dlength, pld_len);
 	memcpy(resp_hdr->isid, &login->isid_lo, 6);
 	resp_hdr->tsih = cpu_to_be16(login->tsih);
 	resp_hdr->itt = task->hdr->itt;
@@ -1470,7 +1473,6 @@
 	resp_hdr->max_cmdsn = cpu_to_be32(login->max_cmd_sn);
 	resp_hdr->status_class = login->status_class;
 	resp_hdr->status_detail = login->status_detail;
-	pld_len = login->data_length;
 	bnx2i_conn->gen_pdu.resp_wr_ptr =
 					bnx2i_conn->gen_pdu.resp_buf + pld_len;
 
@@ -1526,13 +1528,15 @@
 	resp_hdr->flags = text->response_flags;
 	resp_hdr->hlength = 0;
 
-	hton24(resp_hdr->dlength, text->data_length);
+	/* The chip can only have filled the buffer it was given. */
+	pld_len = min_t(u32, text->data_length,
+			bnx2i_conn->gen_pdu.resp_buf_size);
+	hton24(resp_hdr->dlength, pld_len);
 	resp_hdr->itt = task->hdr->itt;
 	resp_hdr->ttt = cpu_to_be32(text->ttt);
 	resp_hdr->statsn = task->hdr->exp_statsn;
 	resp_hdr->exp_cmdsn = cpu_to_be32(text->exp_cmd_sn);
 	resp_hdr->max_cmdsn = cpu_to_be32(text->max_cmd_sn);
-	pld_len = text->data_length;
 	bnx2i_conn->gen_pdu.resp_wr_ptr = bnx2i_conn->gen_pdu.resp_buf +
 					  pld_len;
 	pad_len = 0;
