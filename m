Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FD24772B6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522240; cv=none; b=O1Q31xSPH/hrmzY1i3FDbJJXdb0ZmJa5lsL7fU5e1mOppd0J+1UB2cbLkMzDVb4LCXI9w669y+7IV1nS0MBWVGiJkRF/I/+skurklfVP/QvIbrOSsB/STSWH3IBBWlsvXAqZqh1E3naSTvRF9sTv8koNIArmls2w/x5/ICWdMqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522240; c=relaxed/simple;
	bh=fIMuzBUE4Zj1EFjD63EIb19sNc/ePv1J5PzlECDI6rs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JtvXWI/q4OASbyaZUoe4M8BXnP1kGfOzSqfkqdbzrYSGOE1YLP6CRQi3aLM5MI10SKYXzaT3cJcQb/es2RE8nyikRfe2Wxe7b6oy4qWWT3icYoxNDV8DDl/3MTtnsJTj5YhhSbCQzn14a1x7E0ydTqN7XAkQqMOPQ9Q8n8mz5PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCa8n4eW; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCa8n4eW"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso854587a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522237; x=1789127037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eHXljnuOo7jmxlWanqN7JoMXcPtjZ3FAb8iBM6xDPOo=;
        b=aCa8n4eWX6+wTyUf+kxvIxmYyLZvcelcDoFbzkBi+bJF47SxVLQZcyaa1XXogljOoK
         7azUM9F7/BqxgJgydCOlsIQxEes1e6pMVe9bgpd0xcM5HuiFUIwjlc0t5xPj+tBev+Dz
         Fzl0n2Orl0TX0OYXhv2/GIhVJiPzu70cKrt3lHWf8b5mfOSBBndLeq9GnSGh56YnDaRB
         f+LAg5B7rrqxHqzBLRcv/+sWzzMvUw8bvHglcerzWz9fSZzSizj5d+sSP+VGZiuoM+Zm
         MY7gI+x4Yl1uj4xwNJ/3nBTWHns3mXFZ9+tGpyuCdOlYD+V9RnRRStEFdhX/KdQY/XWI
         E69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522237; x=1789127037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eHXljnuOo7jmxlWanqN7JoMXcPtjZ3FAb8iBM6xDPOo=;
        b=lrBOu1eOxsItu3rd0kMKQ54IMyQQ90h3keWMlz2/rNFznQBoXkz4V/FXEQth4xhhcN
         7bhSq+GHSweP+tMZOnKmMRTrskG1e2CmvdIPGoKr6MbFe/olU8XIaYBURu/L5BT84yZ/
         7iklGH3hRrkxQs6agcG/R/Dj8RTFkBy6qLkyjnsgW2xBkhad6M1tXGg4otJlW21BPJk2
         dhV4P6AO8IMsA2zhNMlTOYsaphwykYC60KrNoTZtt3QeqEZLgR+jgAwBcrFylwVE/vVw
         y8p8P7on0oGfidJoSPu7FPGraatdMywN8pbkiw8Fi4Ut1RLBs9mFmhXRqZfK/TicwCPv
         9TKw==
X-Gm-Message-State: AFuF++lPQ3CWgk7+KbltL4Q1NI4oFzWbeQr2FcfTzeigFXvvo6dprGK3
	MgSYFe38DBD9lBfb1MOoD2PmXczm9EbQUpK1gkgFlhtF9z76t4uRT+kp
X-Gm-Gg: AYBFou2lmPAfwnQbvfRUYvzZCLf12Ciiy0YAIyW7Bl0YZvP+M1Se8EMJS3OxPmUb9bb
	OZme/NX+mHQTMsSdQmgxOHm2jjum3b+TLK+CyvH5Qsl8SQKDSqCOCVa1IxI7ec8DzsoyqTN1+IQ
	QYHywQpczZbh8ETkzF49cD2BiE4/ucxLb1FlwHcEUl1hcULOXufA65d5/5gWiI575l8qNaLtFYA
	kNYLBB3SiY/tM3KiGUPcyOsOO+vSXNMxTH4BBuWrK7emeT7ToG5A0g+haL0sBwye9cOJjseXdNL
	phtmrXYtUGZkaG4AGE9ImhTBQly7IoWSVu61r436NYekMw/0/rYyJzqI4oVbzeLHFOlfGeyaB5X
	kb6S15y2mxGX4avklR6q5W6s1tzFy//P4P7HiUY8lUp4OqHpjHRW1i42ah/9xzi17ADBZJRCef7
	jSCfJvw10Hx5h1CuVdZhs5wZeRIDGvQoyIkRJj5E28IsVFqQUAvOa9/semDGJ4lHWS2AZk3W6VP
	1Azx+DacKM7fuE=
X-Received: by 2002:a17:90b:4d87:b0:380:540:d499 with SMTP id 98e67ed59e1d1-39b26100bfdmr7413763a91.6.1788522234956;
        Fri, 04 Sep 2026 04:43:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm5576999eec.6.2026.09.04.04.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:43:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	George Cherian <gcherian@marvell.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	John Allen <john.allen@amd.com>,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	Ayush Sawal <ayush.sawal@chelsio.com>,
	Srujana Challa <schalla@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] crypto: fix typos in comments
Date: Fri,  4 Sep 2026 17:13:39 +0530
Message-ID: <20260904114345.27509-1-hemanth.selam@gmail.com>
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
 drivers/crypto/atmel-sha.c                       |  4 ++--
 drivers/crypto/cavium/cpt/cptpf_main.c           | 12 ++++++------
 drivers/crypto/cavium/cpt/cptvf_main.c           |  4 ++--
 drivers/crypto/cavium/cpt/cptvf_mbox.c           |  4 ++--
 drivers/crypto/cavium/nitrox/nitrox_main.c       |  2 +-
 drivers/crypto/ccp/ccp-dev.c                     |  2 +-
 drivers/crypto/ccree/cc_buffer_mgr.c             |  4 ++--
 drivers/crypto/chelsio/chcr_algo.c               |  2 +-
 drivers/crypto/hisilicon/sec/sec_algs.c          |  2 +-
 drivers/crypto/marvell/octeontx/otx_cptvf_mbox.c |  4 ++--
 drivers/crypto/omap-sham.c                       |  4 ++--
 drivers/crypto/qce/aead.c                        |  2 +-
 drivers/crypto/s5p-sss.c                         |  2 +-
 13 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/crypto/atmel-sha.c b/drivers/crypto/atmel-sha.c
index 48f54b615504..89c0a3bdf4e0 100644
--- a/drivers/crypto/atmel-sha.c
+++ b/drivers/crypto/atmel-sha.c
@@ -1203,7 +1203,7 @@ static int atmel_sha_finup(struct ahash_request *req)
 
 	/*
 	 * final() has to be always called to cleanup resources
-	 * even if udpate() failed, except EINPROGRESS
+	 * even if update() failed, except EINPROGRESS
 	 */
 	err2 = atmel_sha_final(req);
 
@@ -1338,7 +1338,7 @@ static int atmel_sha_done(struct atmel_sha_dev *dd)
 	return err;
 
 finish:
-	/* finish curent request */
+	/* finish current request */
 	atmel_sha_finish_req(dd->req, err);
 
 	return err;
diff --git a/drivers/crypto/cavium/cpt/cptpf_main.c b/drivers/crypto/cavium/cpt/cptpf_main.c
index 9358c1c041d4..4234f9f156a3 100644
--- a/drivers/crypto/cavium/cpt/cptpf_main.c
+++ b/drivers/crypto/cavium/cpt/cptpf_main.c
@@ -90,19 +90,19 @@ static void cpt_configure_group(struct cpt_device *cpt, u8 grp,
 
 static void cpt_disable_mbox_interrupts(struct cpt_device *cpt)
 {
-	/* Clear mbox(0) interupts for all vfs */
+	/* Clear mbox(0) interrupts for all vfs */
 	cpt_write_csr64(cpt->reg_base, CPTX_PF_MBOX_ENA_W1CX(0, 0), ~0ull);
 }
 
 static void cpt_disable_ecc_interrupts(struct cpt_device *cpt)
 {
-	/* Clear ecc(0) interupts for all vfs */
+	/* Clear ecc(0) interrupts for all vfs */
 	cpt_write_csr64(cpt->reg_base, CPTX_PF_ECC0_ENA_W1C(0), ~0ull);
 }
 
 static void cpt_disable_exec_interrupts(struct cpt_device *cpt)
 {
-	/* Clear exec interupts for all vfs */
+	/* Clear exec interrupts for all vfs */
 	cpt_write_csr64(cpt->reg_base, CPTX_PF_EXEC_ENA_W1C(0), ~0ull);
 }
 
@@ -115,7 +115,7 @@ static void cpt_disable_all_interrupts(struct cpt_device *cpt)
 
 static void cpt_enable_mbox_interrupts(struct cpt_device *cpt)
 {
-	/* Set mbox(0) interupts for all vfs */
+	/* Set mbox(0) interrupts for all vfs */
 	cpt_write_csr64(cpt->reg_base, CPTX_PF_MBOX_ENA_W1SX(0, 0), ~0ull);
 }
 
@@ -140,10 +140,10 @@ static int cpt_load_microcode(struct cpt_device *cpt, struct microcode *mcode)
 	 */
 	if (mcode->is_ae) {
 		core = CPT_MAX_SE_CORES; /* start couting from 10 */
-		total_cores = CPT_MAX_TOTAL_CORES; /* upto 15 */
+		total_cores = CPT_MAX_TOTAL_CORES; /* up to 15 */
 	} else {
 		core = 0; /* start couting from 0 */
-		total_cores = CPT_MAX_SE_CORES; /* upto 9 */
+		total_cores = CPT_MAX_SE_CORES; /* up to 9 */
 	}
 
 	/* Point to microcode for each core of the group */
diff --git a/drivers/crypto/cavium/cpt/cptvf_main.c b/drivers/crypto/cavium/cpt/cptvf_main.c
index db76df14c4a0..e07448098ac0 100644
--- a/drivers/crypto/cavium/cpt/cptvf_main.c
+++ b/drivers/crypto/cavium/cpt/cptvf_main.c
@@ -417,7 +417,7 @@ static void cptvf_enable_swerr_interrupts(struct cpt_vf *cptvf)
 
 	vqx_misc_ena.u = cpt_read_csr64(cptvf->reg_base,
 					CPTX_VQX_MISC_ENA_W1S(0, 0));
-	/* Set mbox(0) interupts for the requested vf */
+	/* Set mbox(0) interrupts for the requested vf */
 	vqx_misc_ena.s.swerr = 1;
 	cpt_write_csr64(cptvf->reg_base, CPTX_VQX_MISC_ENA_W1S(0, 0),
 			vqx_misc_ena.u);
@@ -429,7 +429,7 @@ static void cptvf_enable_mbox_interrupts(struct cpt_vf *cptvf)
 
 	vqx_misc_ena.u = cpt_read_csr64(cptvf->reg_base,
 					CPTX_VQX_MISC_ENA_W1S(0, 0));
-	/* Set mbox(0) interupts for the requested vf */
+	/* Set mbox(0) interrupts for the requested vf */
 	vqx_misc_ena.s.mbox = 1;
 	cpt_write_csr64(cptvf->reg_base, CPTX_VQX_MISC_ENA_W1S(0, 0),
 			vqx_misc_ena.u);
diff --git a/drivers/crypto/cavium/cpt/cptvf_mbox.c b/drivers/crypto/cavium/cpt/cptvf_mbox.c
index 1267e1eba7e9..9f2ae10bbd60 100644
--- a/drivers/crypto/cavium/cpt/cptvf_mbox.c
+++ b/drivers/crypto/cavium/cpt/cptvf_mbox.c
@@ -120,7 +120,7 @@ int cptvf_send_vq_size_msg(struct cpt_vf *cptvf)
 }
 
 /*
- * Communicate VF group required to PF and get the VQ binded to that group
+ * Communicate VF group required to PF and get the VQ bound to that group
  */
 int cptvf_send_vf_to_grp_msg(struct cpt_vf *cptvf)
 {
@@ -139,7 +139,7 @@ int cptvf_send_vf_to_grp_msg(struct cpt_vf *cptvf)
 }
 
 /*
- * Communicate VF group required to PF and get the VQ binded to that group
+ * Communicate VF group required to PF and get the VQ bound to that group
  */
 int cptvf_send_vf_priority_msg(struct cpt_vf *cptvf)
 {
diff --git a/drivers/crypto/cavium/nitrox/nitrox_main.c b/drivers/crypto/cavium/nitrox/nitrox_main.c
index e474c84d8d38..54b2db6bb5d0 100644
--- a/drivers/crypto/cavium/nitrox/nitrox_main.c
+++ b/drivers/crypto/cavium/nitrox/nitrox_main.c
@@ -468,7 +468,7 @@ static int nitrox_probe(struct pci_dev *pdev,
 		err = -EIO;
 		goto ioremap_err;
 	}
-	/* allocate command queus based on cpus, max queues are 64 */
+	/* allocate command queues based on cpus, max queues are 64 */
 	ndev->nr_queues = min_t(u32, MAX_PF_QUEUES, num_online_cpus());
 	ndev->qlen = qlen;
 
diff --git a/drivers/crypto/ccp/ccp-dev.c b/drivers/crypto/ccp/ccp-dev.c
index 246801912e1a..aff3348b8351 100644
--- a/drivers/crypto/ccp/ccp-dev.c
+++ b/drivers/crypto/ccp/ccp-dev.c
@@ -30,7 +30,7 @@
 
 #define MAX_CCPS 32
 
-/* Limit CCP use to a specifed number of queues per device */
+/* Limit CCP use to a specified number of queues per device */
 static unsigned int nqueues;
 module_param(nqueues, uint, 0444);
 MODULE_PARM_DESC(nqueues, "Number of queues per CCP (minimum 1; default: all available)");
diff --git a/drivers/crypto/ccree/cc_buffer_mgr.c b/drivers/crypto/ccree/cc_buffer_mgr.c
index dc7e0cd51c25..a592f5ec1b6a 100644
--- a/drivers/crypto/ccree/cc_buffer_mgr.c
+++ b/drivers/crypto/ccree/cc_buffer_mgr.c
@@ -717,7 +717,7 @@ static void cc_prepare_aead_data_mlli(struct cc_drvdata *drvdata,
 			}
 		} else { /* Contig. ICV */
 			sg = &areq_ctx->src_sgl[areq_ctx->src.nents - 1];
-			/*Should hanlde if the sg is not contig.*/
+			/*Should handle if the sg is not contig.*/
 			areq_ctx->icv_dma_addr = sg_dma_address(sg) +
 				(*src_last_bytes - authsize);
 			areq_ctx->icv_virt_addr = sg_virt(sg) +
@@ -749,7 +749,7 @@ static void cc_prepare_aead_data_mlli(struct cc_drvdata *drvdata,
 
 		} else { /* Contig. ICV */
 			sg = &areq_ctx->src_sgl[areq_ctx->src.nents - 1];
-			/*Should hanlde if the sg is not contig.*/
+			/*Should handle if the sg is not contig.*/
 			areq_ctx->icv_dma_addr = sg_dma_address(sg) +
 				(*src_last_bytes - authsize);
 			areq_ctx->icv_virt_addr = sg_virt(sg) +
diff --git a/drivers/crypto/chelsio/chcr_algo.c b/drivers/crypto/chelsio/chcr_algo.c
index 6dec42282768..e2f2b2a6200e 100644
--- a/drivers/crypto/chelsio/chcr_algo.c
+++ b/drivers/crypto/chelsio/chcr_algo.c
@@ -1605,7 +1605,7 @@ static struct sk_buff *create_hash_wr(struct ahash_request *req,
 		req_ctx->hctx_wr.dma_addr = 0;
 	}
 	chcr_add_hash_src_ent(req, ulptx, param);
-	/* Request upto max wr size */
+	/* Request up to max wr size */
 	temp = param->kctx_len + DUMMY_BYTES + (req_ctx->hctx_wr.imm ?
 				(param->sg_len + param->bfr_len) : 0);
 	atomic_inc(&adap->chcr_stats.digest_rqst);
diff --git a/drivers/crypto/hisilicon/sec/sec_algs.c b/drivers/crypto/hisilicon/sec/sec_algs.c
index 85eecbb40e7e..995aa598a1ed 100644
--- a/drivers/crypto/hisilicon/sec/sec_algs.c
+++ b/drivers/crypto/hisilicon/sec/sec_algs.c
@@ -790,7 +790,7 @@ static int sec_alg_skcipher_crypto(struct skcipher_request *skreq,
 
 	/*
 	 * Only attempt to queue if the whole lot can fit in the queue -
-	 * we can't successfully cleanup after a partial queing so this
+	 * we can't successfully cleanup after a partial queuing so this
 	 * must succeed or fail atomically.
 	 *
 	 * Big hammer test of both software and hardware queues - could be
diff --git a/drivers/crypto/marvell/octeontx/otx_cptvf_mbox.c b/drivers/crypto/marvell/octeontx/otx_cptvf_mbox.c
index 90fdafb7c468..38d1de24652b 100644
--- a/drivers/crypto/marvell/octeontx/otx_cptvf_mbox.c
+++ b/drivers/crypto/marvell/octeontx/otx_cptvf_mbox.c
@@ -180,7 +180,7 @@ int otx_cptvf_send_vq_size_msg(struct otx_cptvf *cptvf)
 }
 
 /*
- * Communicate VF group required to PF and get the VQ binded to that group
+ * Communicate VF group required to PF and get the VQ bound to that group
  */
 int otx_cptvf_send_vf_to_grp_msg(struct otx_cptvf *cptvf, int group)
 {
@@ -199,7 +199,7 @@ int otx_cptvf_send_vf_to_grp_msg(struct otx_cptvf *cptvf, int group)
 }
 
 /*
- * Communicate VF group required to PF and get the VQ binded to that group
+ * Communicate VF group required to PF and get the VQ bound to that group
  */
 int otx_cptvf_send_vf_priority_msg(struct otx_cptvf *cptvf)
 {
diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index 6d2dd0b88f15..12d6dc68438a 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -1265,7 +1265,7 @@ static int omap_sham_finup(struct ahash_request *req)
 		return err1;
 	/*
 	 * final() has to be always called to cleanup resources
-	 * even if udpate() failed, except EINPROGRESS
+	 * even if update() failed, except EINPROGRESS
 	 */
 	err2 = omap_sham_final(req);
 
@@ -1732,7 +1732,7 @@ static void omap_sham_done_task(struct work_struct *t)
 
 finish:
 	dev_dbg(dd->dev, "update done: err: %d\n", err);
-	/* finish curent request */
+	/* finish current request */
 	omap_sham_finish_req(dd->req, err);
 }
 
diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index a9642c67f476..a6b446bbb499 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -379,7 +379,7 @@ static int qce_aead_create_ccm_nonce(struct qce_aead_reqctx *rctx, struct qce_ae
 
 	/*
 	 * The crypto framework encodes cryptlen as unsigned int. Thus, even though
-	 * spec allows for upto 8 bytes to encode msg_len only 4 bytes are needed.
+	 * spec allows for up to 8 bytes to encode msg_len only 4 bytes are needed.
 	 */
 	if (msglen_size > 4)
 		msglen_size = 4;
diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index bdda7b39af85..60547fa89ac4 100644
--- a/drivers/crypto/s5p-sss.c
+++ b/drivers/crypto/s5p-sss.c
@@ -1446,7 +1446,7 @@ static void s5p_hash_tasklet_cb(unsigned long data)
 	return;
 
 finish:
-	/* finish curent request */
+	/* finish current request */
 	s5p_hash_finish_req(dd->hash_req, 0);
 
 	/* If we are not busy, process next req */
-- 
2.48.1

