Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504533F4DEE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792039960; cv=none; b=OUENZgQzn3a2Iq5Ql6v3+xnPaBxJGRGmEaDQcK8yk8WJwsbKUHdbR7TZhowqFN1siedkuGRcPCd7aZ3IC+HNQKLKqOAPJI8tQWHKYXB5qORH9cR2w/0TYytUvCzKdrMXXCJQduDhX6P5UvZMRUGb+kEc7puXFdWIVfzJ2P3TPmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792039960; c=relaxed/simple;
	bh=kiM6u0W/hsmshBfNmT71PePxEzLKAzCU7ISAde3J8oA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DmALmTr1ekeTXyXSlr8B/EjDsnZlV6/VgrH1uDjwa8YKTrjENj5aJ2nx51QlVCrCwOXhJPImXgcD9L/Cz8O1EM54g0zHXk9LsuJjvwdLUGmrphQFT9eBUf/2l0HhHStLysHJ/xRp2eXSwHu3FjYhWgM8I2blX2aMQOKNS9lxq7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=k7EIbpDj; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="k7EIbpDj"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so2150716a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792039958; x=1792644758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nK6+12BDaJSc6Zv5ydKjvBfAWgujcnGE1f71j9SWy/Y=;
        b=k7EIbpDj7LIcP2VR3ZNBWMZC5x0qPcMXEzcxHhOUAwgPJGIfY4ekmduRst54+Onqik
         q97sKdUIOnA/Jr/bWJQryTcHupVWKnaoygFtIWzbmRalg3zfhCAn4S244qBKcXQo2lsM
         w+/fwrkjChTVCw3Xy6Bt7lqR2MUkemaQPwgV4cPyk2OdMlLtzEDsXPUAk9MI8a34YUbo
         IZIItOqMdA68iyg2aAaR1DcilvIBMLf138mI8p1CcxEeR5Y4HLc/FAFgTqzvodOJCKqI
         ktG0uSdH3ME3Xp3NsBmZTDE59h5Bel1FG39OYUUd5Evhw2e4t32O7wlKU0vQ1JPBrruQ
         v9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792039958; x=1792644758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nK6+12BDaJSc6Zv5ydKjvBfAWgujcnGE1f71j9SWy/Y=;
        b=Uvdhw5VH+/aj7FvDCXpWMu4BO9zvJdHTQBDdAo1LH/euSmy68F5VYkSP638MaC1Hbv
         Q5WaqmpUFUqBfbKMJm+SyUQ6jT35s2a4eScvdS3v2GSPedXK4RDOHoQLjKKNlNEjTRKq
         FUa1O228Bxj+fGkkNZeCUUywYQh3ywpz6/bFuIZj+7i0Q3YHbOcke7jcC1ntY+jrqH0j
         onHzEc4oWdu1L3OfQmS5YcrBxjjf0tf2GGnzr1+BKiYTdiYiv1xAIwUBrQFmHgi6YN/0
         g9D/YymLjwHwiCTwbWyyuuaIe1C002zy9xeGNe4Hej4FHMUgswuSjt0ggkp5UHnrzY6b
         CgMw==
X-Forwarded-Encrypted: i=1; AKwUvBxlEMU/QYaa/cd8cJKvQ9eTlhL5WNI4E9kvEKJDum15OvMvmUC65rjaeXPypfYjVQaBTOrXmLaLdLlPYKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3bEAnhnxyFDf5ETLN1AgGldOuOL8MB3r3uP6wDDL3WzUrAZAi
	qTne0KQkDfVfkrKFFwzjN5aMT3spSF8PgBIYKaTZmDco2CPmZobAthwId8fplFD5Lmg=
X-Gm-Gg: AYBFou3eOStX61K1BgGo2kRyzqwm4npY7UE6VYSfvN4Hmv30OY9BVmPLHSwX1tbCaOy
	oZVXIeJDVkbfFNHn14Hld2jk6y1sD3aEWhMQ4FZvxyHAY6ecy2niKK/kFgstLTIO//EQAhmtL8k
	CEwDRQBaDijE6Ax30yEOdYIOkycu6nmVWUdV8GZxZD/SmuU8zKvtKHOiM6nOXhhfuGuP2JPbTid
	GO6It3H5TZSWHGRB1ZqnRmw2o9MA/lu3V4JfpFiqCKZz7awfWAM7uHgp6tYYNZWLW6MKTJKNsyl
	Wpdwhr4wH9Z7jOrBsaK9HLIuPQF2FTQue6b36R37ickRt/Gt1H9YKJ3Q9xO5nfYaW+h/OVBskQ0
	V1sU9df6/GgTmtUobyHGYL6/nSkYB8r6+vyx1ixjBw73bfL5QPR05Ck1UXRANmtiKEqHOr7Klrq
	NnptBmcV4+pDHbMCn2In3J+d5mFUPqbID+FxrfDFqZXocTWIOGOtMPb5H6z+tS+5TPgJh/FSQAv
	VEkfMpvTabh6avu
X-Received: by 2002:a17:903:2987:b0:2e2:b557:aa56 with SMTP id d9443c01a7336-2e842dfb377mr145527345ad.57.1792039958534;
        Wed, 14 Oct 2026 21:52:38 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e962a4dfbbsm1615915ad.58.2026.10.14.21.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:52:38 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v9 7/9] scsi: mvumi: free the internal command buffer by what was allocated
Date: Thu, 15 Oct 2026 13:52:11 +0900
Message-ID: <20261015045213.3975845-8-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015045213.3975845-1-yhlee@isslab.korea.ac.kr>
References: <20261015045213.3975845-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvumi_internal_cmd_sgl() allocates the internal command's data buffer
with dma_alloc_coherent() and then publishes the address and the length
to the controller by writing them into the command frame: lower_32_bits()
in baseaddr_l, upper_32_bits() in baseaddr_h and the length through
sgd_setsz().

mvumi_delete_internal_cmd() did not keep any of that.  It read the frame
back to work out what to free -- sg_counts to decide whether there was a
buffer at all, sgd_getsz() for the length, baseaddr_h and baseaddr_l for
the address -- and handed the three results to dma_free_coherent().

That rebuild does not say what it means to say:

	phy_addr = (dma_addr_t) m_sg->baseaddr_l |
		(dma_addr_t) ((m_sg->baseaddr_h << 16) << 16);

baseaddr_h is a u32, so both shifts happen in 32-bit arithmetic and the
term is always zero; the upper half is never put back.  That is not
visible today, because the driver never raises this device's coherent DMA
mask above the 32 bits pci_device_add() gives it -- dma_set_mask() moves
only the streaming mask -- so dma_alloc_coherent() cannot hand out an
address with an upper half to lose.  It is still not the address the
expression is written to produce.

Rather than widen the shift, stop reading the frame back.  The driver
already has every value it needs: keep the address and the length in
struct mvumi_cmd next to the virtual address it keeps there now, free by
those, and decide whether there is a buffer from data_buf instead of from
sg_counts.

sgd_getsz() and GET_COMPACT_SGD_SIZE() had no other caller, so they go
too.  sgd_setsz(), which writes the field, is unchanged.

Fixes: f0c568a478f0 ("[SCSI] mvumi: Add Marvell UMI driver")
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 19 +++++--------------
 drivers/scsi/mvumi.h | 12 ++----------
 2 files changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 2410d2aa147d9..133e53bc2cb37 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -238,6 +238,8 @@ static int mvumi_internal_cmd_sgl(struct mvumi_hba *mhba, struct mvumi_cmd *cmd,
 	m_sg = (struct mvumi_sgl *) &cmd->frame->payload[0];
 	cmd->frame->sg_counts = 1;
 	cmd->data_buf = virt_addr;
+	cmd->data_buf_phys = phy_addr;
+	cmd->data_buf_size = size;
 
 	m_sg->baseaddr_l = cpu_to_le32(lower_32_bits(phy_addr));
 	m_sg->baseaddr_h = cpu_to_le32(upper_32_bits(phy_addr));
@@ -286,21 +288,10 @@ static struct mvumi_cmd *mvumi_create_internal_cmd(struct mvumi_hba *mhba,
 static void mvumi_delete_internal_cmd(struct mvumi_hba *mhba,
 						struct mvumi_cmd *cmd)
 {
-	struct mvumi_sgl *m_sg;
-	unsigned int size;
-	dma_addr_t phy_addr;
-
 	if (cmd && cmd->frame) {
-		if (cmd->frame->sg_counts) {
-			m_sg = (struct mvumi_sgl *) &cmd->frame->payload[0];
-			sgd_getsz(mhba, m_sg, size);
-
-			phy_addr = (dma_addr_t) m_sg->baseaddr_l |
-				(dma_addr_t) ((m_sg->baseaddr_h << 16) << 16);
-
-			dma_free_coherent(&mhba->pdev->dev, size, cmd->data_buf,
-								phy_addr);
-		}
+		if (cmd->data_buf)
+			dma_free_coherent(&mhba->pdev->dev, cmd->data_buf_size,
+					  cmd->data_buf, cmd->data_buf_phys);
 		dma_free_coherent(&mhba->pdev->dev, mhba->ib_max_size,
 				cmd->frame, cmd->frame_phys);
 		kfree(cmd);
diff --git a/drivers/scsi/mvumi.h b/drivers/scsi/mvumi.h
index d20eea2b61a31..3fc76addbf304 100644
--- a/drivers/scsi/mvumi.h
+++ b/drivers/scsi/mvumi.h
@@ -189,20 +189,10 @@ struct mvumi_compact_sgl {
 	u32	flags;
 };
 
-#define GET_COMPACT_SGD_SIZE(sgd)	\
-	((((struct mvumi_compact_sgl *)(sgd))->flags) & 0x3FFFFFL)
-
 #define SET_COMPACT_SGD_SIZE(sgd, sz) do {			\
 	(((struct mvumi_compact_sgl *)(sgd))->flags) &= ~0x3FFFFFL;	\
 	(((struct mvumi_compact_sgl *)(sgd))->flags) |= (sz);		\
 } while (0)
-#define sgd_getsz(_mhba, sgd, sz) do {				\
-	if (_mhba->hba_capability & HS_CAPABILITY_SUPPORT_COMPACT_SG)	\
-		(sz) = GET_COMPACT_SGD_SIZE(sgd);	\
-	else \
-		(sz) = (sgd)->size;			\
-} while (0)
-
 #define sgd_setsz(_mhba, sgd, sz) do {				\
 	if (_mhba->hba_capability & HS_CAPABILITY_SUPPORT_COMPACT_SG)	\
 		SET_COMPACT_SGD_SIZE(sgd, sz);		\
@@ -259,6 +249,8 @@ struct mvumi_cmd {
 	struct scsi_cmnd *scmd;
 	atomic_t sync_cmd;
 	void *data_buf;
+	dma_addr_t data_buf_phys;
+	unsigned int data_buf_size;
 	unsigned short request_id;
 	unsigned char cmd_status;
 };
-- 
2.43.0

