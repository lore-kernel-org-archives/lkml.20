Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B00C3546F9
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791356545; cv=none; b=Ew5y6eHJhYP6/BG8x5bYF7gq3pjVIumNmQESQQF1L3UQMClLYmEXCgONjakQliZWBNm2xOR9uqDsZF99iLmuVApP1GiYVd++fvUw4Ss1LYoHbfLJkwAq84TvhNzflZRWqLjyD/DhPdmuhyExvzl9ICdUXJxz/NB8jRopsVOuuts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791356545; c=relaxed/simple;
	bh=o63V1ijAdPWCDvOZCLITZ3O3bMHmId42cgNkldwX+1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KqQk/dljZh6+m3UEDm0eGfHIeYvQQo9unVnsP5ldJOk8Jc/tT3SxvsN5ID0DAf02Hmh819FRsnor1/YBsiRyMUFvDuT29AE2V2lVJm0A3sVbgSCj4Uly0R4tw84eZk+dNqoal2DRkxo7FVY6Az1yKnVfmztDNm1fLC4dLl6G6Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=dvIQzf/g; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="dvIQzf/g"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8520161fdb9so2446402b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791356543; x=1791961343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/jLrXG5gTZ+zX1DfiLYTPg1R9dvEde5Tx+K6jVK3Ic=;
        b=dvIQzf/gHv8SYzDsV3XaRdXAj0DfIA40c0Y7UCWTpS6EMXbpN5jSYx4HZCgL8V2p8Y
         SWyDFhOpTdHRLlFRBDVP5GJb9XgDDlTe5Ny8YljAqLO8tx/SdpN4mgw3+ZA5fqnaAiK4
         KejoKWid5pbeeORQ8+dHEAQ7W8yHKyux/tUrG+MUYOcPB20MvL+MkQMyt9zSscudPUfa
         Z/c4W5l5UXtKl2HUfvAnNTSWzZFalZmox+2DqQmZ/AgdSwHcMcx5DEbN44bx9CJMVE/C
         IlSqdCQmJN2AInUhNhpuUY322dFBckJxRzEXTJDhn8SU3H0e7NxpJO2sJbcEj/AOdYq4
         3F7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791356543; x=1791961343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/jLrXG5gTZ+zX1DfiLYTPg1R9dvEde5Tx+K6jVK3Ic=;
        b=xpV8b7OxI6KM+2neKWjYlttojTT6rXtx/ICpDAM9iUruu78lvrNGllfWGYPvNvZXDq
         abmKdxRMjiLmVLPIdCk4TThyVsk5tjloHrHQ1m7WslinjKP65PwhlSdd+UGuZiNdOsI4
         xJi5a+KLKleBhBgJWNlt0S1Yha70CyvFkZmG4jQ0CMUe7+7D5JYt9hmNRQMcZci/avXd
         LOhizgxPT29bsY82oEYQN7rfAIrHSgONG/zv1FstZuKmcc9dZvNSh9mrm579wfXpya/z
         fXRGNBIeIuN45jJMBZHGQMSHKCzEQrsqLhtqTcA/WB7YmKxw9K40cN6HxfdHHrH3Nk5a
         0tuw==
X-Forwarded-Encrypted: i=1; AKwUvBw9bt2YfIRBWKecgda2hpO0i7SKwe5rbKp1/37pwjre50Ha2vRJ2dNLaIGrTNQML6Qe5nz2pQBAgF3PREs=@vger.kernel.org
X-Gm-Message-State: AFuF++lKoeHyt4S8QQ/ZI0jHpO355wFMgb25u+QZjIFQ/uUdramXC9n/
	S/BnHsMvn6bgp0EQvtgFa9tPvwst3LvgBxNad1Ru9t1QBU95QGcGUbXnJqKgwm3vSp0=
X-Gm-Gg: AYBFou0q9xrQosUWqJGiF+wiCyHmObChksVKUuqEtah6SIZzOBLbLuYsI6adSRXTKwu
	uOauSYVlhIvCW7V1lyH0cXWCR4mwXPNEvylsVX5MQ/tF4XrHUJpnvMBzjNg5g5HtZAvozRO2/ZT
	FpEjVQZhf/IAhWlKj/sOh9cpTVPmCdswmhPhsQJ1xNwksubNWO2Qa7NHSOEdpCGryCRCnK6FizC
	bbTQCApDnYeLhKf+/hu7yN5e060WGHTeH3z61EgwLl0HmMvYPjKmrb//d80zAZPL6IaDlwlViqw
	IqzOLJHNEBl+Z/R4HcNSpLyzXnK3ietbMMGjQDGbRXFRKrUhYs65No5JbkT6q5wTEUj6dxBsABo
	DoUSe7oyO4JFXghuoXSxhQatvxGQjbnATzwKMHskAnTeM0FPqz1mV2OMJatLtQyt0b49gb1Y3PR
	ZnAOLtLz81pQvSk/+UgFjYT2VG0m4KBSkNQDf7U7pTEtDO2EYwMIGRrQhzOvIghbdL+MxWi6zK2
	MGJuw==
X-Received: by 2002:a05:6a00:228e:b0:881:fa65:d507 with SMTP id d2e1a72fcca58-891b19751e2mr1093519b3a.22.1791356542567;
        Wed, 07 Oct 2026 00:02:22 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89188ff25e3sm903740b3a.28.2026.10.07.00.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:02:22 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: michael.christie@oracle.com,
	martin.petersen@oracle.com,
	lduncan@suse.com,
	cleech@redhat.com,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v4] scsi: libiscsi_tcp: check that a read got the data the target claimed
Date: Wed,  7 Oct 2026 16:02:06 +0900
Message-ID: <20261007070207.666738-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A target can finish a read without sending the data.  iscsi_tcp_data_in()
bounds each Data-In PDU against the command buffer but never adds them up,
so a completion that declares no underflow is believed and the command
ends with DID_OK.  The pages keep whatever they held.

Over a 1 MiB pread of a file that had never been read, 999424 bytes came
back as the contents of an unrelated file the same process had written
earlier.  pread() returned 1048576 and errno was 0.

Count the payload per task.  Require each Data-In to continue where the
last one ended, and at completion compare the total with the buffer
length, less the residual when an underflow is declared.  A read can end
on a Data-In or on a SCSI Response, so check both.  Writes are untouched.

Fixes: a081c13e39b5 ("[SCSI] iscsi_tcp: split module into lib and lld")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
v4: also validate coverage when the status is CHECK_CONDITION with a sense
    key of RECOVERED_ERROR.  sd_done() counts RECOVERED_ERROR as the whole
    buffer transferred, so v3's "skip every non-GOOD status" left a target
    able to short a read and still have it reported as a full success
    (noted by Sashiko AI review).  Because the sense arrives in the data
    segment, the SCSI Response check moved to the point where that segment
    completes.
    The Data-In continuity check requires in-order Data-In and so does not
    interoperate with a target that negotiates DataPDUInOrder=No; that is
    deliberate, as making a safety check conditional on a peer-negotiated
    value would let the peer turn it off.
v3: only validate coverage for SAM_STAT_GOOD completions; a non-GOOD reply
    such as CHECK_CONDITION that omits the underflow flag must not be
    treated as a short read (noted by Sashiko AI review).
v2: take back_lock once on the SCSI Response path and make the counter
    uint32_t, both per Mike Christie's review.

On "was it built over another patch?" - no, v1 was generated against
v7.2-rc5 directly.  It stopped applying because c1dea15f819cd ("scsi:
libiscsi_tcp: Bound SCSI Response data segment to the connection
buffer") folded ISCSI_OP_SCSI_CMD_RSP into the shared response case,
which is the block v1's last hunk patched.  This version leaves that
fold alone and applies the check inside the shared case, so the data
segment bound stays in one place.

v1: https://lore.kernel.org/all/20260814121428.359541-1-yhlee@isslab.korea.ac.kr/ drivers/scsi/libiscsi_tcp.c | 128 +++++++++++++++++++++++++++++++++++-
 include/scsi/libiscsi_tcp.h |   1 +
 2 files changed, 126 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/libiscsi_tcp.c b/drivers/scsi/libiscsi_tcp.c
index d35f93451ee9b..599bfed79847b 100644
--- a/drivers/scsi/libiscsi_tcp.c
+++ b/drivers/scsi/libiscsi_tcp.c
@@ -397,6 +397,62 @@ void iscsi_tcp_hdr_recv_prep(struct iscsi_tcp_conn *tcp_conn)
 }
 EXPORT_SYMBOL_GPL(iscsi_tcp_hdr_recv_prep);
 
+/**
+ * iscsi_tcp_check_data_in - verify a read received the data the target claimed
+ * @task: scsi command task
+ * @status: SCSI status of the PDU carrying the status
+ * @flags: flags of the PDU carrying the status
+ * @residual: residual count of that PDU
+ * @sense: sense data segment of that PDU, if it has one
+ * @senselen: length of @sense
+ *
+ * Check the payload only for a completion that reports the whole buffer as
+ * transferred.  That is SAM_STAT_GOOD, and also CHECK_CONDITION with a sense
+ * key of RECOVERED_ERROR, which sd_done() counts as fully transferred.  Any
+ * other status means the command failed and the data may legitimately be
+ * absent.
+ *
+ * ISCSI_FLAG_CMD_UNDERFLOW and ISCSI_FLAG_DATA_UNDERFLOW share a value, so the
+ * Data-In and SCSI Response paths both use this.
+ */
+static int iscsi_tcp_check_data_in(struct iscsi_task *task, u8 status,
+				   u32 flags, u32 residual,
+				   const void *sense, u32 senselen)
+{
+	struct iscsi_tcp_task *tcp_task = task->dd_data;
+	struct scsi_cmnd *sc = task->sc;
+	unsigned int expected;
+
+	if (!sc || sc->sc_data_direction == DMA_TO_DEVICE)
+		return 0;
+
+	if (status != SAM_STAT_GOOD) {
+		struct scsi_sense_hdr sshdr;
+		const u8 *s = sense;
+		u16 len;
+
+		if (status != SAM_STAT_CHECK_CONDITION || !s || senselen < 2)
+			return 0;
+		len = get_unaligned_be16(s);
+		if (len + 2U > senselen)
+			return 0;
+		if (!scsi_normalize_sense(s + 2, len, &sshdr) ||
+		    sshdr.sense_key != RECOVERED_ERROR)
+			return 0;
+	}
+
+	expected = sc->sdb.length;
+	if (flags & ISCSI_FLAG_DATA_UNDERFLOW) {
+		if (residual > expected)
+			return 0;
+		expected -= residual;
+	}
+	if (tcp_task->data_in_bytes == expected)
+		return 0;
+
+	return ISCSI_ERR_DATALEN;
+}
+
 /*
  * Handle incoming reply to any other type of command
  */
@@ -410,8 +466,30 @@ iscsi_tcp_data_recv_done(struct iscsi_tcp_conn *tcp_conn,
 	if (!iscsi_tcp_dgst_verify(tcp_conn, segment))
 		return ISCSI_ERR_DATA_DGST;
 
-	rc = iscsi_complete_pdu(conn, tcp_conn->in.hdr,
-			conn->data, tcp_conn->in.datalen);
+	if ((tcp_conn->in.hdr->opcode & ISCSI_OPCODE_MASK) ==
+	    ISCSI_OP_SCSI_CMD_RSP) {
+		struct iscsi_scsi_rsp *rsp =
+			(struct iscsi_scsi_rsp *)tcp_conn->in.hdr;
+		struct iscsi_task *task;
+
+		spin_lock(&conn->session->back_lock);
+		task = iscsi_itt_to_ctask(conn, rsp->itt);
+		if (!task) {
+			spin_unlock(&conn->session->back_lock);
+			return ISCSI_ERR_BAD_ITT;
+		}
+		rc = iscsi_tcp_check_data_in(task, rsp->cmd_status, rsp->flags,
+					     be32_to_cpu(rsp->residual_count),
+					     conn->data, tcp_conn->in.datalen);
+		if (!rc)
+			rc = __iscsi_complete_pdu(conn, tcp_conn->in.hdr,
+						  conn->data,
+						  tcp_conn->in.datalen);
+		spin_unlock(&conn->session->back_lock);
+	} else {
+		rc = iscsi_complete_pdu(conn, tcp_conn->in.hdr, conn->data,
+					tcp_conn->in.datalen);
+	}
 	if (rc)
 		return rc;
 
@@ -491,7 +569,7 @@ static int iscsi_tcp_data_in(struct iscsi_conn *conn, struct iscsi_task *task)
 		iscsi_update_cmdsn(conn->session, (struct iscsi_nopin*)rhdr);
 
 	if (tcp_conn->in.datalen == 0)
-		return 0;
+		goto status;
 
 	if (tcp_task->exp_datasn != datasn) {
 		ISCSI_DBG_TCP(conn, "task->exp_datasn(%d) != rhdr->datasn(%d)"
@@ -509,7 +587,19 @@ static int iscsi_tcp_data_in(struct iscsi_conn *conn, struct iscsi_task *task)
 		return ISCSI_ERR_DATA_OFFSET;
 	}
 
+	if (tcp_task->data_offset != tcp_task->data_in_bytes)
+		return ISCSI_ERR_DATA_OFFSET;
+
+	tcp_task->data_in_bytes += tcp_conn->in.datalen;
+
 	conn->datain_pdus_cnt++;
+
+status:
+	if (rhdr->flags & ISCSI_FLAG_DATA_STATUS)
+		return iscsi_tcp_check_data_in(task, rhdr->cmd_status,
+					       rhdr->flags,
+					       be32_to_cpu(rhdr->residual_count),
+					       NULL, 0);
 	return 0;
 }
 
@@ -783,6 +873,37 @@ iscsi_tcp_hdr_dissect(struct iscsi_conn *conn, struct iscsi_hdr *hdr)
 			break;
 		}
 
+		if (opcode == ISCSI_OP_SCSI_CMD_RSP) {
+			struct iscsi_scsi_rsp *rsp = (struct iscsi_scsi_rsp *)hdr;
+
+			spin_lock(&conn->session->back_lock);
+			task = iscsi_itt_to_ctask(conn, hdr->itt);
+			if (!task) {
+				spin_unlock(&conn->session->back_lock);
+				return ISCSI_ERR_BAD_ITT;
+			}
+			if (tcp_conn->in.datalen) {
+				/*
+				 * The sense is in the data segment, so the
+				 * check has to wait for it.
+				 */
+				spin_unlock(&conn->session->back_lock);
+				iscsi_tcp_data_recv_prep(tcp_conn);
+				return 0;
+			}
+			rc = iscsi_tcp_check_data_in(task, rsp->cmd_status,
+						     rsp->flags,
+						     be32_to_cpu(rsp->residual_count),
+						     NULL, 0);
+			if (rc) {
+				spin_unlock(&conn->session->back_lock);
+				return rc;
+			}
+			rc = __iscsi_complete_pdu(conn, hdr, NULL, 0);
+			spin_unlock(&conn->session->back_lock);
+			break;
+		}
+
 		/* If there's data coming in with the response,
 		 * receive it to the connection's buffer.
 		 */
@@ -995,6 +1116,7 @@ int iscsi_tcp_task_init(struct iscsi_task *task)
 
 	BUG_ON(kfifo_len(&tcp_task->r2tqueue));
 	tcp_task->exp_datasn = 0;
+	tcp_task->data_in_bytes = 0;
 
 	/* Prepare PDU, optionally w/ immediate data */
 	ISCSI_DBG_TCP(conn, "task deq [itt 0x%x imm %d unsol %d]\n",
diff --git a/include/scsi/libiscsi_tcp.h b/include/scsi/libiscsi_tcp.h
index ef53d4bea28a0..a6e63db75d674 100644
--- a/include/scsi/libiscsi_tcp.h
+++ b/include/scsi/libiscsi_tcp.h
@@ -66,6 +66,7 @@ struct iscsi_tcp_conn {
 
 struct iscsi_tcp_task {
 	uint32_t		exp_datasn;	/* expected target's R2TSN/DataSN */
+	uint32_t		data_in_bytes;	/* Data-In payload received */
 	int			data_offset;
 	struct iscsi_r2t_info	*r2t;		/* in progress solict R2T */
 	struct iscsi_pool	r2tpool;

base-commit: 2c3418fffa9d037b2038a6db48be63f9e2291806
-- 
2.43.0

