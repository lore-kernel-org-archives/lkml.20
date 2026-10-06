Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832183E3160
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284836; cv=none; b=XO52vruh/Xm5y+5GVUFKpzpk+4Z4y7qy1JVyWjUGMLY08WQx7uuqew/L6CVJ70Sy34aJOKvBL3VYCLzrqDERA4kgKAj4jcJ1VcYQX2MXYuo/5YEsmZujhI0J56ww2H/C+pSYtyT5Q93UEhPwRBkY2iE0zqPFF1Vt5SPxmFAvQYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284836; c=relaxed/simple;
	bh=4sgJry/QQHs4jyTSXxdIDrgEAIUEVZCTNNj25giXh5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cVTbFsneYK9STPUbpfcGwfPjlER8PgNQWpi3dYqBxW5BKNPAdEZHdkJdjclMN0w+cxnL7O/N85pCuOk6kRwUMC9uOXY2IE6giNmE5M8swJg2to2tHzDHKkzugzx9AdWHsrBgnxsBkjwyznednyqNe3sA/jwCsueMNTd3x5Ssvy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=mcqmA4rb; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="mcqmA4rb"
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696A6eXU1790091;
	Tue, 6 Oct 2026 12:06:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=v
	gTTFKevrVAkjO9I5ivRvfHK3WPX4M8LG/KLEVIhoNI=; b=mcqmA4rbc+ktqwM8t
	U66wE7lygGiwGpsAB+KTBBB8ZkRfFMjgB7IIrgNkupo/rMHT0y7NdW3zsQ8vTnrU
	2dKSy695kzMvriWO/RJyFskpe5F63dKBqdGnqBSjoV5WR7YuXVGVVCwOT1fEWgqu
	JitI70+Z6hNhz1LmBNoEBOrr1p3BA3TUrtTmH9ecOOzjxdgUa9ie9GMZ+dh+OarD
	S2yAmps4ysc8XSEcb3Qdk3FA4YE+FvuU1gFkFxnAKEIzdj75idTJcQw6Moe6pvn7
	Ci82w1eU2AG8TyxsVTDjEDd/EQwoq9LZXmorjLDCICxhesXqQRCqKkHetEzmrIek
	caiiA==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4h4brugugr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 12:06:54 +0100 (BST)
Received: from [127.0.1.1] (172.25.5.23) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 12:06:47 +0100
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Tue, 6 Oct 2026 14:06:38 +0300
Subject: [PATCH 2/2] drm/imagination: Add utility function to write and
 read back register
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261006-b4-utility-function-to-rw-regs-v1-2-a9faca685c4c@imgtec.com>
References: <20261006-b4-utility-function-to-rw-regs-v1-0-a9faca685c4c@imgtec.com>
In-Reply-To: <20261006-b4-utility-function-to-rw-regs-v1-0-a9faca685c4c@imgtec.com>
To: Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sarah Walker <sarah.walker@imgtec.com>,
        Donald Robson <donald.robson@imgtec.com>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791284810; l=4840;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=QJQ3JLtReACHU8Nq8bSp8snKZThuBwcSu1XjWsOFZpo=;
 b=cU1gUrd4sG7gzLN9PT94zsXRV9VB1xss7vCGw3OkR7O9mT8eWF7VfcajT8SYfMQt/2i0KQLCe
 U0wOEnt+uldCUuR1mq2K2+0lcvbof3f086b816tDKAI/g0PBKd4HumH
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Authority-Analysis: v=2.4 cv=FNOOVOos c=1 sm=1 tr=0 ts=6ac4d64e cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=Vfs-8JXWiL0A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=RihMtEClj2EdTCFu1X4A:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NCBTYWx0ZWRfX2jav+18pl11Y
 IeG2zsw/6g67+DHSMxhBtywKJMHU5DNQK7ZQ70goapLA3nEvwC19x9JsnY1Nx5eKh3hwcABCIFq
 WNUBtR3uPi2L0TeUbE1eepokOWntre8=
X-Proofpoint-ORIG-GUID: wDMN0YJXyvfk_uhiIa5VXbPXKLajWEMo
X-Proofpoint-GUID: wDMN0YJXyvfk_uhiIa5VXbPXKLajWEMo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NCBTYWx0ZWRfX8AF+GJadNsLG
 WbOu2LOvzisJ1M3F9tRzsF3jw7i/BLCrZinkLcXlTjiwfZx1Rc5uAImYqGBpWXfICtJgBcXe6qN
 z3MdICe52QBQ2f202dmr7kXIV7p79rDKlQ8oUkTcU14ahN1OWvP3IuelHjOYifHrRWnEdAVYSfJ
 PZ37uf1Wc8Lau5aGMpHqlvkWx3fDbOrU4wuKT8rmqUg4e7qgjNGYxTESHuN9lnA0xgrYGuv8Aq9
 6KxgvoJsW92J3diN27Q+IXsep65Jx6ykRDt8zx9fofHrWYD32A+dD91SDCId4KJ77EOxTHOVuj0
 1+nxAeyCf+q+XJdi1Bz1g7YeuI5UHN3HEg/IpTJIWdkFVxMj8svTKYQHSlqtzTyc4N6MnpePO9M
 77syTA/OnAsZ9JVwLeN/6dFFvYmcsGRgAO/s9ChLJvnf3rBhxPyPCJXvZoIC8TGlZ27J9Bo81/h
 4i9D7Tp1LiyFRi8JZAw==

From: Alessio Belle <alessio.belle@imgtec.com>

Used to avoid repeating the same pattern multiple times.

Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_device.h       | 28 ++++++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_fw_meta.c      |  5 ++---
 drivers/gpu/drm/imagination/pvr_fw_startstop.c | 21 ++++++-------------
 3 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index d51c57cf9332..c246122b4caf 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -606,6 +606,34 @@ pvr_cr_write64(struct pvr_device *pvr_dev, u32 reg, u64 val)
 	iowrite64(val, pvr_dev->regs + reg);
 }
 
+/**
+ * pvr_cr_write_fenced32() - Write to a 32-bit register in a PowerVR device and fence the write
+ * @pvr_dev: Target PowerVR device.
+ * @reg: Target register.
+ * @val: Value to write.
+ */
+static __always_inline void
+pvr_cr_write_fenced32(struct pvr_device *pvr_dev, u32 reg, u32 val)
+{
+	pvr_cr_write32(pvr_dev, reg, val);
+	/* Read back register to fence previous write in order to clear the SOCIF pipeline */
+	(void)pvr_cr_read32(pvr_dev, reg);
+}
+
+/**
+ * pvr_cr_write_fenced64() - Write to a 64-bit register in a PowerVR device and fence the write
+ * @pvr_dev: Target PowerVR device.
+ * @reg: Target register.
+ * @val: Value to write.
+ */
+static __always_inline void
+pvr_cr_write_fenced64(struct pvr_device *pvr_dev, u32 reg, u64 val)
+{
+	pvr_cr_write64(pvr_dev, reg, val);
+	/* Read back register to fence previous write in order to clear the SOCIF pipeline */
+	(void)pvr_cr_read64(pvr_dev, reg);
+}
+
 /**
  * pvr_cr_poll_reg32() - Wait for a 32-bit register to match a given value by
  *                       polling
diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
index 84f568b5510f..38a91dcb66cb 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -48,9 +48,8 @@ pvr_meta_cr_read32(struct pvr_device *pvr_dev, u32 reg_addr, u32 *reg_value_out)
 		return err;
 
 	/* Issue a Read. */
-	pvr_cr_write32(pvr_dev, ROGUE_CR_META_SP_MSLVCTRL0,
-		       reg_addr | ROGUE_CR_META_SP_MSLVCTRL0_RD_EN);
-	(void)pvr_cr_read32(pvr_dev, ROGUE_CR_META_SP_MSLVCTRL0); /* Fence write. */
+	pvr_cr_write_fenced32(pvr_dev, ROGUE_CR_META_SP_MSLVCTRL0,
+			      reg_addr | ROGUE_CR_META_SP_MSLVCTRL0_RD_EN);
 
 	/* Wait for Slave Port to be Ready. */
 	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_META_SP_MSLVCTRL1,
diff --git a/drivers/gpu/drm/imagination/pvr_fw_startstop.c b/drivers/gpu/drm/imagination/pvr_fw_startstop.c
index 34c757267a22..7db7f16e62fd 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_startstop.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_startstop.c
@@ -126,29 +126,21 @@ pvr_fw_start(struct pvr_device *pvr_dev)
 		 * Disable the default sys_bus_secure protection to perform
 		 * minimal setup.
 		 */
-		pvr_cr_write32(pvr_dev, ROGUE_CR_SYS_BUS_SECURE, 0);
-		(void)pvr_cr_read32(pvr_dev, ROGUE_CR_SYS_BUS_SECURE); /* Fence write */
+		pvr_cr_write_fenced32(pvr_dev, ROGUE_CR_SYS_BUS_SECURE, 0);
 	}
 
 	if (pvr_dev->fw_dev.processor_type == PVR_FW_PROCESSOR_TYPE_RISCV)
 		pvr_cr_write32(pvr_dev, ROGUE_CR_FWCORE_BOOT, 0);
 
 	/* Set Rogue in soft-reset. */
-	pvr_cr_write64(pvr_dev, ROGUE_CR_SOFT_RESET, soft_reset_mask);
-
-	/* Read soft-reset to fence previous write in order to clear the SOCIF pipeline. */
-	(void)pvr_cr_read64(pvr_dev, ROGUE_CR_SOFT_RESET);
+	pvr_cr_write_fenced64(pvr_dev, ROGUE_CR_SOFT_RESET, soft_reset_mask);
 
 	/* Take Rascal and Dust out of reset. */
-	pvr_cr_write64(pvr_dev, ROGUE_CR_SOFT_RESET,
-		       soft_reset_mask ^ ROGUE_CR_SOFT_RESET_RASCALDUSTS_EN);
-
-	(void)pvr_cr_read64(pvr_dev, ROGUE_CR_SOFT_RESET);
+	pvr_cr_write_fenced64(pvr_dev, ROGUE_CR_SOFT_RESET,
+			      soft_reset_mask ^ ROGUE_CR_SOFT_RESET_RASCALDUSTS_EN);
 
 	/* Take everything out of reset but the FW processor. */
-	pvr_cr_write64(pvr_dev, ROGUE_CR_SOFT_RESET, ROGUE_CR_SOFT_RESET_GARTEN_EN);
-
-	(void)pvr_cr_read64(pvr_dev, ROGUE_CR_SOFT_RESET);
+	pvr_cr_write_fenced64(pvr_dev, ROGUE_CR_SOFT_RESET, ROGUE_CR_SOFT_RESET_GARTEN_EN);
 
 	err = rogue_slc_init(pvr_dev);
 	if (err)
@@ -168,8 +160,7 @@ pvr_fw_start(struct pvr_device *pvr_dev)
 	/* Need to wait for at least 16 cycles before taking the FW processor out of reset ... */
 	udelay(3);
 
-	pvr_cr_write64(pvr_dev, ROGUE_CR_SOFT_RESET, 0x0);
-	(void)pvr_cr_read64(pvr_dev, ROGUE_CR_SOFT_RESET);
+	pvr_cr_write_fenced64(pvr_dev, ROGUE_CR_SOFT_RESET, 0x0);
 
 	/* ... and afterwards. */
 	udelay(3);

-- 
2.43.0

