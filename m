Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A9C3FC5AE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762831; cv=none; b=AwyZlRz4QCfqn/kwCXlw7KXxmBhfjFjJtz9VETdBPvkKZ1Id8Vao3/jUh0cm1sWyQENJQ2AHE00tK6VlxEM2KICWB88VdJujOKFlBn8Z2Nh2ybqFSBKsTTw5XvhqFTOQ4mv4WSxi0EiTrdM1HA+RQeykn82DrnOkLxJu/XpGU8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762831; c=relaxed/simple;
	bh=EupwhBBA0XKHCYmRNKSbJlq9cupLkfPTP3S7D6QZ2DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OjUygGA4ltoO64TxoKZl9H/a+dhEOBEHUxKZSopr4WgxN3aGRtLhDLtQebTYPIWZla4vyH9lZ8th1eF2AFegrZSJqGDQ4R/+OmrQlzvq63V52Xw4rDDNgKNurlMeJSOWq4QGJn7MLzkBLHobwE9+33OQWX/1nahGUdCE/TZXxYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZIfiRLB; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZIfiRLB"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2885486a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762829; x=1789367629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kLzy/P7iaMHDyU2RTvFBICZbCqw+7JdGE4URD73Sj1U=;
        b=nZIfiRLBhxeLPmXfq7g6Es+Jx25Q7KVZmbCHU+i2wUvORJsmkuWVaYavnOCBAxtBYy
         fnOLsjhIF3KvImyZhxK0FWOWxJYnOlfUSjNYw32xEOZPmZipf1a7kDVZYVlIpmK8uUX1
         5SW7QGVLVthfLVg1oQcUu5h4AA72uFpkQnuh3n5VVr92ru71Bmfcb3c1t+wt9SVScDtj
         76FPR+BmdxYDRPS2nFQO8JGQuOyZAVPP6Hu14ghjOBp87rj4jnTA9tWuzibW9SRSZboC
         YNx7r0nfMSC5usqiliTNXD+Jq0voqjN9dYhCuo/M2vD2XOKLx0t4w+SWl/bIMKPOkIN0
         AjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762829; x=1789367629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLzy/P7iaMHDyU2RTvFBICZbCqw+7JdGE4URD73Sj1U=;
        b=eio8jkfuID9m3d4HsKeShOX5mO6ue0Ig+14NkYQvNy8huTyD0J6aEF3J+wPF5MF0tM
         s09MN2haQvCl2gbpfAmvkzEYJbdwdQjCUOI6OPUfg82mdekdPcvtOlfGnvx6mcqefEFh
         wF2l2v+IpaFigmPPvZjiM9JClDPPDu09oPENiw9DYbB2yUjcQslvz4xRpcPyTtp7UimV
         M7Xe/2wqdHCYxJgqvbmHVaFJJSqeRNi4AliZ6r+pddUVf/Kp+rZpg4psrkgFRlInmSz4
         i+ELVwmn50GyIjA2JEyktH+IGZdwWLfeaisXPQEgqoRht2xeMRbgBVmdLl7Q/UHJlk2p
         njhQ==
X-Forwarded-Encrypted: i=1; AKwUvByikatKcRBi4HoiOgYpvUvLvrB3ZLHiS0YGQLxP1AXi+3LgemLCNH+mQB8yYHDuKWgwx650+PK7+7nkBCQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m1KvYl+x7rvp7UZr9KbwG55QedfTScuMClo6FXAfq19l0p/Bdn
	Hrs9Pl7C2ynLhCycTv129bWd6oNh/OFkWuxFk+JZGrcHyMjnc8nCNwv5
X-Gm-Gg: AYBFou2N0XtE+RV5xstfs0grpW7kh5X2WCyEztKX1ysbj9gm/kn1Sd8snREAVldGcAL
	/F8QToRBcTuF+N65Sm96Ra5lsEPduu+PU0JQnHqaAWWTRmjbROQDFLTosII9aHMm7S1kmC0gN33
	Njoo2ukse7w5nl0N0i1yE04s35106RtTEaVk69c8JZzbgpqtKlsOYkh/3zCerydrdewHzYU0MFg
	JHn1hHjTD/f6X0tVX0Iaj4mz3x9eFg1wSi5WGCgGg1vASi6+c6OgIBLgcF0Kr5pw+oBxZBD+jok
	3V/aK4uDTavDT56MaEZKdLvjUNdenRuxPRJC2bFodcDbknv2J/dIPN23Q6lOAgm3RMPW0MOjrfA
	YQiPJnwIFlw28iO2sgUl0v+PXTXF5X3ei7iR9ShQXW8Lx0TNdSSpPUMOqbshVjVd8tkPiQCdhc5
	t6uUyFIrisg3ZWBImoHaXY5BeinqBLHSf8bBulC+kPCCcGYENBoimZPsBGF52X+UJzt5m/6CGHl
	UuaH5tJrZIANQ==
X-Received: by 2002:a17:90b:5287:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39b25eeeef9mr33408081a91.0.1788762828715;
        Sun, 06 Sep 2026 23:33:48 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm17093204c88.8.2026.09.06.23.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:33:48 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dmaengine: fix typos in comments
Date: Mon,  7 Sep 2026 12:03:43 +0530
Message-ID: <20260907063343.22255-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/dma/bcm-sba-raid.c        | 8 ++++----
 drivers/dma/ppc4xx/xor.h          | 2 +-
 drivers/dma/xilinx/xilinx_dpdma.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm-sba-raid.c b/drivers/dma/bcm-sba-raid.c
index 0de03611252e..485fcde390dd 100644
--- a/drivers/dma/bcm-sba-raid.c
+++ b/drivers/dma/bcm-sba-raid.c
@@ -734,7 +734,7 @@ sba_prep_dma_memcpy(struct dma_chan *dchan, dma_addr_t dst, dma_addr_t src,
 	struct sba_device *sba = to_sba_device(dchan);
 	struct sba_request *first = NULL, *req;
 
-	/* Create chained requests where each request is upto hw_buf_size */
+	/* Create chained requests where each request is up to hw_buf_size */
 	while (len) {
 		req_len = (len < sba->hw_buf_size) ? len : sba->hw_buf_size;
 
@@ -877,7 +877,7 @@ sba_prep_dma_xor(struct dma_chan *dchan, dma_addr_t dst, dma_addr_t *src,
 	if (unlikely(src_cnt > sba->max_xor_srcs))
 		return NULL;
 
-	/* Create chained requests where each request is upto hw_buf_size */
+	/* Create chained requests where each request is up to hw_buf_size */
 	while (len) {
 		req_len = (len < sba->hw_buf_size) ? len : sba->hw_buf_size;
 
@@ -1356,7 +1356,7 @@ sba_prep_dma_pq(struct dma_chan *dchan, dma_addr_t *dst, dma_addr_t *src,
 	if (!(flags & DMA_PREP_PQ_DISABLE_Q))
 		dst_q = &dst[1];
 
-	/* Create chained requests where each request is upto hw_buf_size */
+	/* Create chained requests where each request is up to hw_buf_size */
 	while (len) {
 		req_len = (len < sba->hw_buf_size) ? len : sba->hw_buf_size;
 
@@ -1626,7 +1626,7 @@ static int sba_probe(struct platform_device *pdev)
 	sba->dev = &pdev->dev;
 	platform_set_drvdata(pdev, sba);
 
-	/* Number of mailbox channels should be atleast 1 */
+	/* Number of mailbox channels should be at least 1 */
 	ret = of_count_phandle_with_args(pdev->dev.of_node,
 					 "mboxes", "#mbox-cells");
 	if (ret <= 0)
diff --git a/drivers/dma/ppc4xx/xor.h b/drivers/dma/ppc4xx/xor.h
index da1230df2817..0931e18cd0d3 100644
--- a/drivers/dma/ppc4xx/xor.h
+++ b/drivers/dma/ppc4xx/xor.h
@@ -12,7 +12,7 @@
 
 #include <linux/types.h>
 
-/* Number of XOR engines available on the contoller */
+/* Number of XOR engines available on the controller */
 #define XOR_ENGINES_NUM		1
 
 /* Number of operands supported in the h/w */
diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index d9a3542c4531..bcc188e70441 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -1032,7 +1032,7 @@ static int xilinx_dpdma_chan_wait_no_ostand(struct xilinx_dpdma_chan *chan)
 {
 	int ret;
 
-	/* Wait for a no outstanding transaction interrupt upto 50msec */
+	/* Wait for a no outstanding transaction interrupt up to 50msec */
 	ret = wait_event_interruptible_timeout(chan->wait_to_stop,
 					       !xilinx_dpdma_chan_ostand(chan),
 					       msecs_to_jiffies(50));
-- 
2.48.1

