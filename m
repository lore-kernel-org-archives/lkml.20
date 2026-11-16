Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823881;
	b=nAEMpeA5DIEszBYPPejgR+q4hr2mstl+Jwwgjjngp4xtLNcRqwB8zJ1kFJ6Yc5ynUkSa
	 5Cr9XyBwHMTDmLN9dTM32biaCXtfIz5HPtGho7qLG2L/Hba8Y6eQKEjcjW8zVUrhqwUnk
	 0ax6PXEf5YDcK7yOUd1IiFVkRmjNcFMFeDkeCCOHjcDNGquEk+DwNocS7NXj4215UQirw
	 QoYphxgITNp4p/pSl//cQpv/dn3lPMTO5pyiul8IoltpX+JVFwFBePtnUuqm61XEGIYJ7
	 YAYfRR5Ha1Uo7BgWWRosCHWPmcpSdWWL/jt+hJRvbfqCYStMzwAqWbqEDTVQfWZn8tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gIfgCrbgWP+O7J1dWGPslYkeZ9aFum9ZTgaeYRl4oTQ=;
	b=HkgbgeCwYLvUwrpPWemHI02B9GHwWvRO8Db79HoefSU3HLH6YrJ95c+SnvMOjwf9LveJ
	 gzWVWtnJS+klrydvHSmRnYOSbPiuRj3OwnD2nrY74zd0UG+apifVIdRZmaRR587giaKtL
	 GTqllIqiH/zOgmkrUFspUMBJKV+Y04sJDr5B4AnO62mwGL3y8yYgtnvrkhYVnATCWbxZz
	 vPpktA8XiD38P7CJyumvtYdapmSEveh6K74wsarKWbKqll7CjJAD373/o6ray7+JskIV5
	 nzeMHhj43gCcBLuMn69Tr3A6VZs9ZL3vqhHZpSSiTqtBJhUbg/DFqeYA3VLoIIzBgxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OCB6XAfd;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51345606A338
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51345606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OCB6XAfd
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9995ce866so32598435ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794823880; x=1795428680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIfgCrbgWP+O7J1dWGPslYkeZ9aFum9ZTgaeYRl4oTQ=;
        b=OCB6XAfdUc5s0FIoYt6+yjDyITD7EIoOFHulkz03GRmgPZdWkYgAmmFPBLmBgISuvG
         dlm0YB3Ij428Uz5sPUHFyOUKLsyIo7SHUka78fzxljkttoUrDaVHoZDRdk5fY8JtJWno
         T3JKboSNGx542jV1xu1WEQiTlVNN3hH7WH2TyY9TyLGsCyCvnLyHlMTE99OoDi8bvLDQ
         Ann8xa9PcUJqFYKCASqGQuj8HXd0SDUAgdTNpUmxkkJ7MLVxvwK411y2HvGro+Vqhurc
         IVkkFiCDoK1hu3kvAIx30RQR5MRUm6h7Y+Ja7TphHPuXQ/8vP4JeKsBp+99Eckmu9xpI
         1LDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823880; x=1795428680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gIfgCrbgWP+O7J1dWGPslYkeZ9aFum9ZTgaeYRl4oTQ=;
        b=zwg/mCIyRzmK0U1sq5KX7HEEjUWYm1ldcv9Ucd23vJKtdbqhLQhnkrItUHwZ7qLz+d
         NHNvRWp4XFlrT1wyI/nUOsB3H3IZNDjAXyYBtEoxM0eoNurl/uao+8faIZNHf/bg1jsN
         Ogj+qXRyyd66RLMPUE9HOJMSxUshYWz4a3a8SlReKXikBh3mqcqZ6jHtHgLyEUBC6Mh5
         ZVSl0UfXlap8NEWYbaJ68CWq0X8q75Kyp1jdXctDua7vNg6k0xao1DxOSQgGpdwpWNEV
         EDcqWL/064AwRPlAzAxbXybfTf2uJ8Yr5KpV8VTrGErEwxwg04mazI07QFcuZ1QFNCBK
         Q3dg==
X-Forwarded-Encrypted: i=1; AL+hErHycRx3pV0AdmPXznrTJm4EA9jKIAaYloH1wTBCdRi0giHq8EtU6XJRAajS3kOrBrR93rw7sCqcB71kFis=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gtYobFF2w3uUDoyeLC/ELiWNy2PUqs6Ov5nohhiBaya1zV2l1
	fvdiPBDgv4MsR5UgZ5QID+Lrn7/DpffrEj9ZDSzvXExcZGJccodCIVtaPmWuJmhEcy8=
X-Gm-Gg: AZFdTZeJu1eDkTWzNQS2cwsnxXXKijIzTS+D64drkTMCU3SvsFfUyt6ygwsC0fhZRqP
	hHC8hszQ3Lb0rA4i2uWKIAM8SJVllT1khTZRCvD/iUywl03mUcmVkbB8yqXOjCYHAbozGFat59C
	DdDdOtTeQE4AbHB6txhRchOU/dJOtP2yrbuqtoh4Jb72Mbt0fD46PD+CvWEMXypzeuM4ejGi5U5
	doLX13xeD9h3jpUZYWvhLQsxQhRHiE4S5ZMcfNEAD6zwKONoPSAQ1G1GkJXKNNw2l7rRo7Dl0u0
	ik2h9p/3SjhmUPdZPs0w6GcQDznsfU8LETscvH+7e5GzMxDfroOhCrJW0WZO1S47OGas3VCj0QU
	KhX97Pil7q3i3O3rkwzMfxYa09J8UVCdRNd/LsUzteCT6FJ+Kqw/KAcrkuklgvj+bzicaWXIdyi
	F8fn2zJXjk4BerfE22Kt4sjRIjxEhSBH1NE5mfDjO/hscIL0IFRfIjCacFUoiyMZg/8SE7K54KS
	jMX0V5TJ/hiS/2qN9EqKaQdJnuXnfY8hPNYp29OLphwqGK51fjQ0B/hwhmdvm+OTPWK92kJ6lKu
	h9k8iOr2aMnJgqqwQSLGhKRdoATCBuikKrVgo6dpRbW2HkHouk+V0hhAJCZxlsAU9tc8rRf5xp0
	B1vMv5DXmZhf8v31iv3qgh7Wc1c0WxImEaJeIMA==
X-Received: by 2002:a17:903:1446:b0:2ed:56ee:af8f with SMTP id d9443c01a7336-2ee0d65fb69mr101733635ad.2.1794823879687;
        Mon, 16 Nov 2026 02:11:19 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:35d0:694a:1071:9bae])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7e5055sm35533795ad.39.2026.11.16.02.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:11:19 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sagi@grimberg.me,
	jgg@ziepe.ca,
	leon@kernel.org
Cc: linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] IB/isert: do not leak the receive descriptor of a dropped Data-Out
Date: Mon, 16 Nov 2026 19:11:08 +0900
Message-ID: <20261116101108.1650132-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116101108.1650132-1-yhlee@isslab.korea.ac.kr>
References: <20261116101108.1650132-1-yhlee@isslab.korea.ac.kr>
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

isert_handle_iscsi_dataout() works on the command it finds by ITT, which
holds the descriptor of the SCSI Command PDU and not of this Data-Out,
which is why the function posts its own descriptor explicitly when it
succeeds.  None of its other returns do, and isert_recv_done() ignores
what the handler returned, so each such Data-Out costs one of the
ISERT_QP_MAX_RECV_DTOS buffers.  That includes the returns where
iscsit_check_dataout_hdr() answers 0 without a command at all: 200
Data-Outs carrying an ITT that matches no command stop the connection
after exactly 128 of them, in all 3 runs, with no response to a NOP-Out
sent afterwards and nothing logged beyond the per-PDU "Unable to locate
ITT" message; with this patch all 200 are taken and the NOP-Out is
answered.

So give isert_handle_iscsi_dataout()'s other returns the same post its
success path already does.

That one function only.  Everywhere else a handler returns non-zero, the
command isert allocated still holds that descriptor and the response
posts it from isert_post_response(), so re-posting from
isert_recv_done() would post the same descriptor twice; the second post
is skipped only while the descriptor has not been refilled, which is not
something the receive path can promise.  iscsit_handle_logout_cmd() even
returns 1 for an ordinary logout.

Fixes: 4366b19ca5eb ("iser-target: Change the recv buffers posting logic")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/infiniband/ulp/isert/ib_isert.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/infiniband/ulp/isert/ib_isert.c b/drivers/infiniband/ulp/isert/ib_isert.c
index 81164881dcc241..8a57c880335cc3 100644
--- a/drivers/infiniband/ulp/isert/ib_isert.c
+++ b/drivers/infiniband/ulp/isert/ib_isert.c
@@ -1130,17 +1130,16 @@ isert_handle_iscsi_dataout(struct isert_conn *isert_conn,
 	int rc, sg_nents, sg_off, page_off;
 
 	rc = iscsit_check_dataout_hdr(conn, buf, &cmd);
-	if (rc < 0)
-		return rc;
-	else if (!cmd)
-		return 0;
+	if (rc < 0 || !cmd)
+		goto repost;
 	/*
 	 * FIXME: Unexpected unsolicited_data out
 	 */
 	if (!cmd->unsolicited_data) {
 		isert_err("Received unexpected solicited data payload\n");
 		dump_stack();
-		return -1;
+		rc = -1;
+		goto repost;
 	}
 
 	isert_dbg("Unsolicited DataOut unsol_data_len: %u, "
@@ -1158,7 +1157,8 @@ isert_handle_iscsi_dataout(struct isert_conn *isert_conn,
 	if (page_off) {
 		isert_err("unexpected non-page aligned data payload\n");
 		dump_stack();
-		return -1;
+		rc = -1;
+		goto repost;
 	}
 	isert_dbg("Copying DataOut: sg_start: %p, sg_off: %u "
 		  "sg_nents: %u from %p %u\n", sg_start, sg_off,
@@ -1169,13 +1169,18 @@ isert_handle_iscsi_dataout(struct isert_conn *isert_conn,
 
 	rc = iscsit_check_dataout_payload(cmd, hdr, false);
 	if (rc < 0)
-		return rc;
+		goto repost;
 
 	/*
 	 * multiple data-outs on the same command can arrive -
 	 * so post the buffer before hand
 	 */
 	return isert_post_recv(isert_conn, rx_desc);
+
+repost:
+	/* Nothing else owns this Data-Out's receive descriptor. */
+	isert_post_recv(isert_conn, rx_desc);
+	return rc;
 }
 
 static int
-- 
2.43.0

