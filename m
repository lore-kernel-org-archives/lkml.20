Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793122821;
	b=Ef/vz1MInQcQdTGt1Bz0WWlifGoR+OWT8sZtNGWODovHlDzk3JhYB5iE1jT72tsiEDbY
	 qfMDbVzsjOqN6TfbuqySV4566XTNFxmEnACeWAWQcFPJ/da9vpqtHadYijEki7SDyWAyf
	 ZGewZnAHYlQQ2YdGi7UsHpUymmqd4ullJ1gtREvrj4sKlvkG0KYAUP4W1RrDIJuD0C6OB
	 NNqxDhdcKDlSXO5l+c7vx6cDFzX2lFR4jZQgLpc9orz/wx5V/zcu0QLIouUEnJiwgKUIX
	 lnBlh5ziGAWz/B9q4kBl/+EuMvuL+phKlkD8c5QkBFlOIL9+5Msfc54Zslnvocwp2bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793122821;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=McPP3ymZht6uAE6A2iXYhx42vJRVuaSOp5Y7/j5DZyg=;
	b=XKo2wg/CNnkxal1Al0oiiXLAvccnmZUlXi8hocwME3Lz24hrrmp4bW0VX1Jne5jRuEba
	 3hO0zNRPlBc3W5Dl3kBi57CxDOhhTnCvOvKdYICVQBk7gH4ejeGm+SDqkw5JbICNhb7i5
	 7XDKJiy1ujw+H0VRZI1Vb21CndcolJUPHoYHkV69RZUcZ9aZO1f5sGgil9T+abwuxNC3U
	 JMltIZLs9IG1LPR0F6ItBYJS+wPDP6aG/i3oDrRjMdMypsp22mm/0o0vncGUFmLlchLUm
	 uivvROCqv5ZHgHFcyhI7l2DuhasskQ+PO7nbSQJIFXkltQDxxbSXJ/dquheNYtqkyfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=sRHfQs1D;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27C5606A31D;
	Tue, 27 Oct 2026 17:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A27C5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=sRHfQs1D
Received: from pb-laptop.local (185.221.143.99.nat.pool.zt.hu [185.221.143.99])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04EB834;
	Tue, 27 Oct 2026 18:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793122686;
	bh=M5HJ7BzKtBZKYC3WcSZicr4Kpe/Kt0WSiCMlCPpfeHc=;
	h=From:To:Cc:Subject:Date:From;
	b=sRHfQs1DgBsNE+SlEYx2++Xuo/4bdeF9uELihXq16p4Nx5aPeTYAsVW9NBcKZxeMW
	 MHAgbPKus021aHuYEThyFrQpdLwKuX8TzIcZMVP3kaXU+QlNYD+3NWCKsUllcQcMwD
	 M1l9PLJ8zjmNbuCP2IT6t0c9owqM00qiT+UmiEAs=
From: =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Subject: [PATCH v2 1/2] media: rppx1: Move register definitions to header
Date: Tue, 27 Oct 2026 18:40:13 +0100
Message-ID: <20261027174014.315061-1-barnabas.pocze+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some definitions will be subsequently used outside of `rppx1.c`,
so move the register definitions into `rppx1.h`.

Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
---
 .../media/platform/dreamchip/rppx1/rppx1.c    | 92 -------------------
 .../media/platform/dreamchip/rppx1/rppx1.h    | 92 +++++++++++++++++++
 2 files changed, 92 insertions(+), 92 deletions(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1.c b/drivers/media/platform/dreamchip/rppx1/rppx1.c
index c502be7979146..c03dd061783a5 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1.c
@@ -14,98 +14,6 @@
 
 #include "rppx1.h"
 
-/* RPP_HDR Base Addresses */
-#define RPPX1_HDRREGS_BASE			0x0000
-#define RPPX1_HDR_IRQ_BASE			0x0200
-#define RPPX1_RPP_OUT_BASE			0x0800
-#define RPPX1_RPP_RMAP_BASE			0x0c00
-#define RPPX1_RPP_RMAP_MEAS_BASE		0x1000
-#define RPPX1_RPP_MAIN_PRE1_BASE		0x2000
-#define RPPX1_RPP_MAIN_PRE2_BASE		0x4000
-#define RPPX1_RPP_MAIN_POST_BASE		0xa000
-#define RPPX1_RPP_MVOUT_BASE			0xc000
-#define RPPX1_RPP_FUSA_BASE			0xf000
-
-#define RPPX1_RPP_HDRREGS_VERSION_REG		(RPPX1_HDRREGS_BASE + 0x0000)
-
-#define RPPX1_RPP_HDR_UPD_REG			(RPPX1_HDRREGS_BASE + 0x0004)
-#define RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD	BIT(1)
-#define RPPX1_RPP_HDR_UPD_REGS_CFG_UPD		BIT(0)
-
-#define RPPX1_RESERVED_3_REG			(RPPX1_HDRREGS_BASE + 0x0008)
-
-#define RPPX1_RPP_HDR_INFORM_ENABLE_REG		(RPPX1_HDRREGS_BASE + 0x000c)
-#define RPPX1_RPP_HDR_INFORM_ENABLE_ENABLE	1
-#define RPPX1_RPP_HDR_INFORM_ENABLE_DISABLE	0
-
-#define RPPX1_RPP_HDR_OUT_IF_ON_REG		(RPPX1_HDRREGS_BASE + 0x0010)
-#define RPPX1_RPP_HDR_OUT_IF_OFF_REG		(RPPX1_HDRREGS_BASE + 0x0014)
-
-#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_REG	(RPPX1_HDRREGS_BASE + 0x0018)
-#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_ENABLE	1
-#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_DISABLE	0
-
-#define RPPX1_RPP_ISM				(RPPX1_HDR_IRQ_BASE + 0x00)
-#define RPPX1_RPP_RIS				(RPPX1_HDR_IRQ_BASE + 0x04)
-#define RPPX1_RPP_MIS				(RPPX1_HDR_IRQ_BASE + 0x08)
-#define RPPX1_RPP_ISC				(RPPX1_HDR_IRQ_BASE + 0x0c)
-
-/* RPP_OUT/MV_OUT Pipelines - Base Addresses */
-#define RPPX1_GAMMA_OUT_BASE			0x0000 /* HV, MV */
-#define RPPX1_IS_BASE				0x00c0 /* HV, MV */
-#define RPPX1_CSM_BASE				0x0100 /* HV, MV */
-#define RPPX1_OUT_IF_BASE			0x0200 /* HV, MV */
-#define RPPX1_RPP_OUTREGS_BASE			0x02c0 /* HV, MV */
-#define RPPX1_LUV_BASE				0x0300 /* MV */
-
-/* PRE1/PRE2/POST Pipelines - Base Addresses */
-#define RPPX1_ACQ_BASE				0x0080 /* PRE1, PRE2 */
-#define RPPX1_BLS_BASE				0x0100 /* PRE1, PRE2 */
-#define RPPX1_GAMMA_IN_BASE			0x0200 /* PRE1, PRE2 */
-#define RPPX1_LSC_BASE				0x0400 /* PRE1, PRE2 */
-#define RPPX1_AWB_GAIN_BASE			0x0500 /* PRE1, PRE2, POST */
-#define RPPX1_DPCC_BASE				0x0600 /* PRE1, PRE2 */
-#define RPPX1_DPF_BASE				0x0700 /* PRE1, PRE2 */
-#define RPPX1_FILT_BASE				0x0800 /* POST */
-#define RPPX1_CAC_BASE				0x0880 /* POST */
-#define RPPX1_CCOR_BASE				0x0900 /* POST */
-#define RPPX1_HIST_BASE				0x0a00 /* PRE1, PRE2, POST */
-#define RPPX1_HIST256_BASE			0x0b00 /* PRE1 */
-#define RPPX1_EXM_BASE				0x0c00 /* PRE1, PRE2 */
-#define RPPX1_LTM_BASE				0x1000 /* POST */
-#define RPPX1_LTM_MEAS_BASE			0x1200 /* POST */
-#define RPPX1_WBMEAS_BASE			0x1700 /* POST */
-#define RPPX1_BDRGB_BASE			0x1800 /* POST */
-#define RPPX1_SHRP_BASE				0x1a00 /* POST */
-
-/* Functional Safety Module Base Addresses */
-#define RPPX1_FMU_BASE				0x0100
-
-#define RPPX1_RPP_HDR_FMU_FSM_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x00)
-#define RPPX1_RPP_HDR_FMU_FSM_FSM_IRQM_FAULT	BIT(23)
-#define RPPX1_RPP_HDR_FMU_FSM_PRE2_SIZE_FAULT	BIT(20)
-#define RPPX1_RPP_HDR_FMU_FSM_PRE2_TIME_FAULT	BIT(19)
-#define RPPX1_RPP_HDR_FMU_FSM_PRE1_SIZE_FAULT	BIT(18)
-#define RPPX1_RPP_HDR_FMU_FSM_PRE1_TIME_FAULT	BIT(17)
-#define RPPX1_RPP_HDR_FMU_FSM_SIZE_FAULT	BIT(16)
-#define RPPX1_RPP_HDR_FMU_FSM_TIME_FAULT	BIT(15)
-#define RPPX1_RPP_HDR_FMU_FSM_MV_OUT_SIZE_FAULT	BIT(14)
-#define RPPX1_RPP_HDR_FMU_FSM_MV_OUT_TIME_FAULT	BIT(13)
-#define RPPX1_RPP_HDR_FMU_FSM_HV_OUT_SIZE_FAULT	BIT(12)
-#define RPPX1_RPP_HDR_FMU_FSM_HV_OUT_TIME_FAULT	BIT(11)
-#define RPPX1_RPP_HDR_FMU_FSM_MV_OUT_SIZE_ERR	BIT(10)
-#define RPPX1_RPP_HDR_FMU_FSM_IS_OUT_SIZE_ERR	BIT(9)
-#define RPPX1_RPP_HDR_FMU_FSM_PRE2_FIFO_OVFLW	BIT(7)
-#define RPPX1_RPP_HDR_FMU_FSM_PRE1_FIFO_OVFLW	BIT(6)
-#define RPPX1_RPP_HDR_FMU_FSM_PRE1_INFORM_SIZE	BIT(5)
-#define RPPX1_RPP_HDR_FMU_FSM_PRE1_OUTFORM_SIZE	BIT(4)
-#define RPPX1_RPP_HDR_FMU_FSM_PRE2_INFORM_SIZE	BIT(3)
-#define RPPX1_RPP_HDR_FMU_FSM_PRE2_OUTFORM_SIZE	BIT(2)
-
-#define RPPX1_RPP_HDR_FMU_RFS_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x04)
-#define RPPX1_RPP_HDR_FMU_MFS_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x08)
-#define RPPX1_RPP_HDR_FMU_FSC_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x0c)
-
 void rppx1_write(struct rppx1 *rpp, u32 offset, u32 value)
 {
 	iowrite32(value, rpp->base + offset);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1.h b/drivers/media/platform/dreamchip/rppx1/rppx1.h
index 3bf3955afbaed..825499f8f709c 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1.h
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1.h
@@ -13,6 +13,98 @@
 
 #include "rpp_module.h"
 
+/* RPP_HDR Base Addresses */
+#define RPPX1_HDRREGS_BASE			0x0000
+#define RPPX1_HDR_IRQ_BASE			0x0200
+#define RPPX1_RPP_OUT_BASE			0x0800
+#define RPPX1_RPP_RMAP_BASE			0x0c00
+#define RPPX1_RPP_RMAP_MEAS_BASE		0x1000
+#define RPPX1_RPP_MAIN_PRE1_BASE		0x2000
+#define RPPX1_RPP_MAIN_PRE2_BASE		0x4000
+#define RPPX1_RPP_MAIN_POST_BASE		0xa000
+#define RPPX1_RPP_MVOUT_BASE			0xc000
+#define RPPX1_RPP_FUSA_BASE			0xf000
+
+#define RPPX1_RPP_HDRREGS_VERSION_REG          (RPPX1_HDRREGS_BASE + 0x0000)
+
+#define RPPX1_RPP_HDR_UPD_REG                  (RPPX1_HDRREGS_BASE + 0x0004)
+#define RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD     BIT(1)
+#define RPPX1_RPP_HDR_UPD_REGS_CFG_UPD         BIT(0)
+
+#define RPPX1_RESERVED_3_REG                   (RPPX1_HDRREGS_BASE + 0x0008)
+
+#define RPPX1_RPP_HDR_INFORM_ENABLE_REG                (RPPX1_HDRREGS_BASE + 0x000c)
+#define RPPX1_RPP_HDR_INFORM_ENABLE_ENABLE     1
+#define RPPX1_RPP_HDR_INFORM_ENABLE_DISABLE    0
+
+#define RPPX1_RPP_HDR_OUT_IF_ON_REG            (RPPX1_HDRREGS_BASE + 0x0010)
+#define RPPX1_RPP_HDR_OUT_IF_OFF_REG           (RPPX1_HDRREGS_BASE + 0x0014)
+
+#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_REG     (RPPX1_HDRREGS_BASE + 0x0018)
+#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_ENABLE  1
+#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_DISABLE 0
+
+#define RPPX1_RPP_ISM                          (RPPX1_HDR_IRQ_BASE + 0x00)
+#define RPPX1_RPP_RIS                          (RPPX1_HDR_IRQ_BASE + 0x04)
+#define RPPX1_RPP_MIS                          (RPPX1_HDR_IRQ_BASE + 0x08)
+#define RPPX1_RPP_ISC                          (RPPX1_HDR_IRQ_BASE + 0x0c)
+
+/* RPP_OUT/MV_OUT Pipelines - Base Addresses */
+#define RPPX1_GAMMA_OUT_BASE			0x0000 /* HV, MV */
+#define RPPX1_IS_BASE				0x00c0 /* HV, MV */
+#define RPPX1_CSM_BASE				0x0100 /* HV, MV */
+#define RPPX1_OUT_IF_BASE			0x0200 /* HV, MV */
+#define RPPX1_RPP_OUTREGS_BASE			0x02c0 /* HV, MV */
+#define RPPX1_LUV_BASE				0x0300 /* MV */
+
+/* PRE1/PRE2/POST Pipelines - Base Addresses */
+#define RPPX1_ACQ_BASE				0x0080 /* PRE1, PRE2 */
+#define RPPX1_BLS_BASE				0x0100 /* PRE1, PRE2 */
+#define RPPX1_GAMMA_IN_BASE			0x0200 /* PRE1, PRE2 */
+#define RPPX1_LSC_BASE				0x0400 /* PRE1, PRE2 */
+#define RPPX1_AWB_GAIN_BASE			0x0500 /* PRE1, PRE2, POST */
+#define RPPX1_DPCC_BASE				0x0600 /* PRE1, PRE2 */
+#define RPPX1_DPF_BASE				0x0700 /* PRE1, PRE2 */
+#define RPPX1_FILT_BASE				0x0800 /* POST */
+#define RPPX1_CAC_BASE				0x0880 /* POST */
+#define RPPX1_CCOR_BASE				0x0900 /* POST */
+#define RPPX1_HIST_BASE				0x0a00 /* PRE1, PRE2, POST */
+#define RPPX1_HIST256_BASE			0x0b00 /* PRE1 */
+#define RPPX1_EXM_BASE				0x0c00 /* PRE1, PRE2 */
+#define RPPX1_LTM_BASE				0x1000 /* POST */
+#define RPPX1_LTM_MEAS_BASE			0x1200 /* POST */
+#define RPPX1_WBMEAS_BASE			0x1700 /* POST */
+#define RPPX1_BDRGB_BASE			0x1800 /* POST */
+#define RPPX1_SHRP_BASE				0x1a00 /* POST */
+
+/* Functional Safety Module Base Addresses */
+#define RPPX1_FMU_BASE				0x0100
+
+#define RPPX1_RPP_HDR_FMU_FSM_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x00)
+#define RPPX1_RPP_HDR_FMU_FSM_FSM_IRQM_FAULT	BIT(23)
+#define RPPX1_RPP_HDR_FMU_FSM_PRE2_SIZE_FAULT	BIT(20)
+#define RPPX1_RPP_HDR_FMU_FSM_PRE2_TIME_FAULT	BIT(19)
+#define RPPX1_RPP_HDR_FMU_FSM_PRE1_SIZE_FAULT	BIT(18)
+#define RPPX1_RPP_HDR_FMU_FSM_PRE1_TIME_FAULT	BIT(17)
+#define RPPX1_RPP_HDR_FMU_FSM_SIZE_FAULT	BIT(16)
+#define RPPX1_RPP_HDR_FMU_FSM_TIME_FAULT	BIT(15)
+#define RPPX1_RPP_HDR_FMU_FSM_MV_OUT_SIZE_FAULT	BIT(14)
+#define RPPX1_RPP_HDR_FMU_FSM_MV_OUT_TIME_FAULT	BIT(13)
+#define RPPX1_RPP_HDR_FMU_FSM_HV_OUT_SIZE_FAULT	BIT(12)
+#define RPPX1_RPP_HDR_FMU_FSM_HV_OUT_TIME_FAULT	BIT(11)
+#define RPPX1_RPP_HDR_FMU_FSM_MV_OUT_SIZE_ERR	BIT(10)
+#define RPPX1_RPP_HDR_FMU_FSM_IS_OUT_SIZE_ERR	BIT(9)
+#define RPPX1_RPP_HDR_FMU_FSM_PRE2_FIFO_OVFLW	BIT(7)
+#define RPPX1_RPP_HDR_FMU_FSM_PRE1_FIFO_OVFLW	BIT(6)
+#define RPPX1_RPP_HDR_FMU_FSM_PRE1_INFORM_SIZE	BIT(5)
+#define RPPX1_RPP_HDR_FMU_FSM_PRE1_OUTFORM_SIZE	BIT(4)
+#define RPPX1_RPP_HDR_FMU_FSM_PRE2_INFORM_SIZE	BIT(3)
+#define RPPX1_RPP_HDR_FMU_FSM_PRE2_OUTFORM_SIZE	BIT(2)
+
+#define RPPX1_RPP_HDR_FMU_RFS_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x04)
+#define RPPX1_RPP_HDR_FMU_MFS_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x08)
+#define RPPX1_RPP_HDR_FMU_FSC_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x0c)
+
 #define RPPX1_IRQ_ID_256HIST			BIT(27)
 #define RPPX1_IRQ_ID_PRE2_DPCC			BIT(25)
 #define RPPX1_IRQ_ID_PRE1_DPCC			BIT(24)
-- 
2.56.0

