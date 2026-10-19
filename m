Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FD248594D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392639; cv=none; b=Ehts9+3Dz4XRXzVhQg7rbvptQg1Hx2K8RThRXtc2+hKfgNyXeOe/bzMp9A/p44KmWV8CfDsJigl/PQ1j43vupnq6R5l0ob+ox/9BnreKAO5AWb0+qef5dpLqYCGQ7lJU3SkPgPsQfhMYTVb0fPF6fn7cnA+sCcBJh9i2TJEL9Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392639; c=relaxed/simple;
	bh=z6OivWSzqfsIkGB+qypMYD9sy6gvak55sKurmHllDIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=asicFqEmP0wX2LNpuSksh7T1+6fsgutVcqr4iulsLWpIqAwPtYLpI7kbMvRori73mA2gi6Qp/6uarb5WokfYChgvO19JAkQERUiWo6MrC5LHjjqXwJshV1kOpuK1oRZF3+6drXlbkq6200pbA1rN/B7McwbD6wr+JlSsWDdE5PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=PnNBLts5; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="PnNBLts5"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so749691a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792392638; x=1792997438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6wresGPlOerJ8rL7c+F8upCIM1dzOSfqyD9Zn2laIU=;
        b=PnNBLts59+ZjE0mn8497vEQjSIMe0AW7vywZSY147n9N9YyvJ9FV6Ki2+5VXzWv9Jj
         5hvlLOE4s/PBGD1jMDFEMrL5CB6jtqLAutGd4FUPLaEgPJz/J1lLKArD6+XQGL9McuCn
         +/GIqK7XVyqC3qgHLhfT1AUbHoqpVNQLBtYJXahT5H3xkHtB7PaJYUWOxW0ESlLdGFcb
         3TLM7SB5bc+2mHqV0zSbAOufEFYxaxbuL+ZaSjHICVhGE5OwqkDwIZLvGCoZoZvlIw42
         YH1GrqjMJ3Z4Z0xkd5F46hQgb6N6pl10jTslgJIS/i/agPkqBnzk52G8uWyR5wu3sSB6
         I2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392638; x=1792997438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6wresGPlOerJ8rL7c+F8upCIM1dzOSfqyD9Zn2laIU=;
        b=hMUXIdoDXX5nkJVSEdgL4Xlj50Qx81LhW09WTYrGZFj8KznCvDNXVc93/GEjptkPnk
         79GWSqlmceoQ1FS/IbaPdozZ8NE1K9Abq0B4xOlykxcBHyab7sjX+gsPlmrbNWL14iF6
         CHAq8f9izLHtIf0UbqJMZLSL/6HiGWLHMOFd3g2DOrZ5odJK8uOI0mF6wMhh+Km4bN8j
         +frafCflnfUuseI4U2gcMXSn09NLYdnIdJvt6gHI9VTAzVyPSJbjarmVnlVdlcpayazG
         R99lYZ/7xCoLcASQZcqtLFNaKHaH6O1ysHutiJOlRCofZUF/FOA6mLvUIb/2D+TMC3d2
         aNbw==
X-Forwarded-Encrypted: i=1; AKwUvByAEO1yrhQrTVPpeUxBwWCjLd9arB5v8j8l8WZOVfw5YBTa7l8FXQpf7VBGLw45iVl5kDbwMrn2lKK7TIo=@vger.kernel.org
X-Gm-Message-State: AFq9FYISR7vaxU49Ns8FUzLMwFFAH/1UWvdrEdoVMc2OWQNjySjUsjk/
	IJ8xMQRe2gXvtWbwO85zJVGvZCvEaz9hN9jybNjKr2adHQElCZtTT4IhaELReRvif4s=
X-Gm-Gg: AYBFou1GizH7PzlLrKU5x8VOGWPjozRsFmk0ATJEppVU0ZplB2g/BIYLBtLPU2Yo/iN
	NEGnbOTm/oh1X4MtH33bbBZEBCe4isTrfSiNt4HzVd70DFjXjCQQ9W+g90WmiSigbA06+rDs7u/
	U03F+Jke1QjvGNZXllVMNaRivqPitgUZ+TjYUX3chUGiEre458xP8nsEfNdbHGKbwzZVBETu5SO
	oca5owH0liwguIxbFM+3P3WcccrO8h55INpwCOSMGVltlACX8wRIXdKfmyqfdLecsnWq9lZehRS
	/UO0M/pn1uaas8JfdpOS/HvpsRIYGhJMcmShFGcY3/Rk6KrsrstK0tpHxGrf/0uuK1ezWOEHjyp
	5Hg0/+35XQ74cWeL5rc//36hzAZToHsyNOPj3HZSk6jrMiCjVpoHkf16Rm9zGeZcwr0IbJQ+IPn
	UHzOEf6Duch9yA3v7jwQf2T25qeFfyO6vFByOgUOswDO95SUendraPllxf6LihtYcEyFuHX/eVj
	NVUxrUMO4SZTnZs
X-Received: by 2002:a17:90b:4ac3:b0:3ac:7874:639e with SMTP id 98e67ed59e1d1-3acef4fb85dmr6103457a91.46.1792392637645;
        Sun, 18 Oct 2026 23:50:37 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3f3ce5asm5870887a91.3.2026.10.18.23.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:50:37 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: njavali@marvell.com,
	mrangankar@marvell.com,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: GR-QLogic-Storage-Upstream@marvell.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] scsi: qedi: bound the sense data length reported by the firmware
Date: Mon, 19 Oct 2026 15:50:19 +0900
Message-ID: <20261019065019.537183-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019065019.537183-1-yhlee@isslab.korea.ac.kr>
References: <20261019065019.537183-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qedi_scsi_completion() reads the sense length out of the CQE and uses it to
copy sense data out of the command's sense buffer:

	datalen = cqe_data_in->reserved2 &
		  ISCSI_COMMON_HDR_DATA_SEG_LEN_MASK;
	memcpy((char *)conn->data, (char *)cmd->sense_buffer, datalen);

That mask is 0xFFFFFF as well.  cmd->sense_buffer is a
SCSI_SENSE_BUFFERSIZE coherent DMA allocation and the firmware is only ever
given its address, so 96 bytes is all there is to read there, while
conn->data is the ISCSI_DEF_MAX_RECV_SEG_LEN buffer libiscsi allocates for
the connection.  A reported length above 96 reads past the sense buffer and
one above 8192 writes past conn->data, and datalen reaches
__iscsi_complete_pdu() afterwards, which reads it back out.  Every
SAM_STAT_CHECK_CONDITION completion takes this path.

Cap the length at the size of the buffer the firmware was pointed at.

Unlike the unsolicited path in the previous patch this one is not covered
by the KUnit harness, since reaching it needs a whole task and connection;
the bound here is just the size of the allocation the sense data is copied
out of.

Fixes: ace7f46ba5fd ("scsi: qedi: Add QLogic FastLinQ offload iSCSI driver framework.")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
diff --git a/drivers/scsi/qedi/qedi_fw.c b/drivers/scsi/qedi/qedi_fw.c
--- a/drivers/scsi/qedi/qedi_fw.c
+++ b/drivers/scsi/qedi/qedi_fw.c
@@ -640,8 +640,10 @@
 	hdr->residual_count = cpu_to_be32(cqe_data_in->residual_count);
 
 	if (hdr->cmd_status == SAM_STAT_CHECK_CONDITION) {
-		datalen = cqe_data_in->reserved2 &
-			  ISCSI_COMMON_HDR_DATA_SEG_LEN_MASK;
+		/* The firmware can only have filled the buffer it was given; cap at that. */
+		datalen = min_t(u32, cqe_data_in->reserved2 &
+				     ISCSI_COMMON_HDR_DATA_SEG_LEN_MASK,
+				SCSI_SENSE_BUFFERSIZE);
 		memcpy((char *)conn->data, (char *)cmd->sense_buffer, datalen);
 	}
 
