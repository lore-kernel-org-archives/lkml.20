Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075593033FD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792025863; cv=none; b=PGlTEr98MSYCEpa4DYIBRcnykKAzlHHjXAPp6TczV7wX/SwhK9FwQ/iZhyqqNQRq9O/kGfBOtCeL7rQR8zlLm9fqYlJG2AfHSAcB591BIOl+1LFqjsu1dTNUlMQGiA2Z2rM2shN9ivCEAyt9/snFhtmOuMPQUaVGH92bw7k28xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792025863; c=relaxed/simple;
	bh=d/UWuIDLttRptXRjgPCr2gHnKIUlkWJphZ/F4/3NVHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cPaNFGk528rhXrXuMbMTr0edpigCDfrLjoMpKlguKdT6rNSW4ebwhH6NVRCi6CdhVoOZt5xUC/KXVNAv+6+KoPFbLgUWC7C2SuAkgW99F2l0Wq2TFY3B+FX1xj0yNUKobhHLJxgzhMxsMt27ZkMULHtsEoEw1v/44VHJyazmUwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=QVAw729d; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="QVAw729d"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so401528a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792025861; x=1792630661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=parD2IM7xfaD1K9JnqVrI4SVPT6JMErPe2GlYkxbGxg=;
        b=QVAw729dcca6gKV2kmVL6uFQRZIJNxeiOU6tsLY4zkEuJBU9wVl+hikTwWVHj7eHma
         lR/u0EFP1mML0L5fwy78paRU39IDaWnOWU80IGaRNR5cCFnoKcZgZo8asEyg9k4TDeG6
         jqfi4epWHfvGwpiHLT0/opPyXRtumX2JpYSINPYTThK/iKthkZmCoLW/IJ05AclHhCg/
         A2YWu7UXmN3naxLn2ZsgdZpQGqkUtOOQlEup9JqtouAtHi+GMwLkuPtDbxhh8hK2NagA
         4pLBxuS8U9N577XBW3RZmD6UgPZBKwWPZnBvPxCKaslcJ8LjoEsIWF12pLmEk8tU9X4Z
         qjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792025861; x=1792630661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=parD2IM7xfaD1K9JnqVrI4SVPT6JMErPe2GlYkxbGxg=;
        b=qTVVc72A5TNfhC/mDXfeKiGcJdjB6HbkN2iSX0bdHhac+81wLBUtzdmdpeQozjjSUw
         XdypSgAIK0DoInRbK4JcjkFiso9giUgx0yYVN2kxDPSkYIneOEoHzN7FVT0xve9cUh/t
         T6L+4Flulo/dv128zO7//3VLM0FovVHrj7+oJDn/Fx3i5x4MO40Ca9kGuVPF4mzZo/6q
         bwf2lKpJMQEFe7e4VQCICX6p407mvhsYg8gc3QqEXybqzNd/MHZuZVhO8fGllEXAz7u0
         U4VsAVYV0Ohmp/2Mq5oo8i/BlKZucb0J/luERulbbdJEthc4ju6fAdINCmZ6Rq5YKE5e
         YhZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxK2dYPP/BA1G8kD/liKp8WTAy6JB0pcxkZMjotX2NnXmEyDPjxTaEhwhRq0qBZkUP98/gGPd/ToEZhfyY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR3ydGWuxiJSJuYMHMT8qg8M5pZhKDX79944ie01J2DT80Avuc
	57IX6yo8bpEPV1vdEUbcCHV3hgevrCJzR+vgdnVV3WruIFsT6tSZsyZfuc9bW/R8Phs=
X-Gm-Gg: AYBFou2VAKpI7vV7Vct+BnRnL+oD0d9XhTT7sPLgbKPGxpRn3JjWOv+N5ZrcbeuTzKz
	ogjRk4ziA84G1q4IUAtxKp/WzLsMML9ojZEFcgc+o3JQFcvddYjlF/H41H3Jfnx7cmRWbkbksQ6
	oJH9iE/EFBqTJIqnABnABJgrSa4u3t/KdWClj7pttdCcvgZVUrnqU0Gg62WPAWSgQCvDmC/Qsmc
	RBJnPoVrnzjPy7mtKPQUIGGA1Q+Id8AcEZIkF+QbFZUikDwGD+qIQUeOjw9fCTr07ymQT5S8pkg
	jD7yd28lt04UYdFL5jgoam8veF/PZe6B2vsZT+dgdPBAp3YMOc3d0H/NrNi7or8BpXGLXbJGPKp
	OwTyebCeYqHKwkR1awbPbivGYv1mnuXk1o7nXMpPxqhvhScj6W642of+3UXEgyS5evGq9u11YYU
	tF5ltqkXdzejcVWsgbtgBUA6K4kkcf/K03BFw6dcM1JHRLmx+MytcX4wIOrjqfkGK8IuGVP3PYF
	xZ4vg==
X-Received: by 2002:a17:90b:2b4e:b0:3aa:9a32:5054 with SMTP id 98e67ed59e1d1-3ab3ace05e2mr14023296a91.62.1792025861287;
        Wed, 14 Oct 2026 17:57:41 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a43d98sm999198a91.0.2026.10.14.17.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:57:41 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v7 3/7] scsi: mvumi: bound the hotplug event bitmap
Date: Thu, 15 Oct 2026 09:57:13 +0900
Message-ID: <20261015005717.3719956-4-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015005717.3719956-1-yhlee@isslab.korea.ac.kr>
References: <20261015005717.3719956-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvumi_proc_msg() takes size from the hotplug event the firmware DMAs into
the event buffer and uses it twice: as the bit count for two
find_next_zero_bit() scans, and as the byte offset of the second bitmap.
Nothing checks it against the buffer, which mvumi_get_event() allocates at
a fixed 512 bytes, and size is a u16, so a firmware reporting 65535 makes
both scans run roughly 8 KiB past the allocation and places the second
bitmap past it to begin with.

Reject a size whose bitmaps do not fit.  The second bitmap starts size bits
in and find_next_zero_bit() reads a long at a time, so that span is the
furthest either scan reaches.  Compare it against sizeof(struct
mvumi_event_req), the only length the driver ever puts in
data_transfer_length and therefore the most the firmware may write into the
shared buffer, rather than against the buffer itself: dma_alloc_coherent()
hands back zeroed memory, a zero bit in these bitmaps means a device is
present, so scanning past what the firmware wrote would add devices that do
not exist.  Read size once, since it lives in memory the firmware can still
write, and give the buffer size a name while here.

Fixes: bd756ddea18e ("[SCSI] mvumi: Add support for Marvell SAS/SATA RAID-on-Chip(ROC) 88RC9580")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 18 ++++++++++++++++--
 drivers/scsi/mvumi.h |  3 +++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 2378b676a7a78..9a3dde53dea97 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -1652,11 +1652,25 @@ static int mvumi_rescan_bus(void *data)
 static void mvumi_proc_msg(struct mvumi_hba *mhba,
 					struct mvumi_hotplug_event *param)
 {
-	u16 size = param->size;
+	u16 size = READ_ONCE(param->size);
 	const unsigned long *ar_bitmap;
 	const unsigned long *re_bitmap;
 	int index;
 
+	/*
+	 * The second bitmap starts size bits into the event buffer and
+	 * find_next_zero_bit() reads it a long at a time, so that is the
+	 * furthest the two scans reach.  Bound it by the length the firmware
+	 * was told it may write, not by the buffer: the bytes past that are
+	 * still zero, and a zero bit here means a device is present.
+	 */
+	if (sizeof(*param) + (size >> 3) + BITS_TO_LONGS(size) * sizeof(long) >
+			sizeof(struct mvumi_event_req)) {
+		dev_err(&mhba->pdev->dev,
+			"invalid hotplug event bitmap size %u\n", size);
+		return;
+	}
+
 	if (mhba->fw_flag & MVUMI_FW_ATTACH) {
 		index = -1;
 		ar_bitmap = (const unsigned long *) param->bitmap;
@@ -1708,7 +1722,7 @@ static int mvumi_get_event(struct mvumi_hba *mhba, unsigned char msg)
 	struct mvumi_cmd *cmd;
 	struct mvumi_msg_frame *frame;
 
-	cmd = mvumi_create_internal_cmd(mhba, 512);
+	cmd = mvumi_create_internal_cmd(mhba, MVUMI_EVENT_BUF_SIZE);
 	if (!cmd)
 		return -1;
 	cmd->scmd = NULL;
diff --git a/drivers/scsi/mvumi.h b/drivers/scsi/mvumi.h
index 1306a4abf19ad..5d45f0d99e639 100644
--- a/drivers/scsi/mvumi.h
+++ b/drivers/scsi/mvumi.h
@@ -124,6 +124,9 @@ enum {
 #define APICDB1_HOST_GETEVENT		1
 #define MAX_EVENTS_RETURNED		6
 
+/* size of the buffer the driver hands the firmware for event replies */
+#define MVUMI_EVENT_BUF_SIZE		512
+
 #define DEVICE_OFFLINE	0
 #define DEVICE_ONLINE	1
 
-- 
2.43.0

