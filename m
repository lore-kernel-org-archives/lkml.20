Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23144CEE7D;
	Wed, 30 Sep 2026 12:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772188; cv=none; b=WVmLroQQ6jfSXXemoTkcQE2bGjwN0ij59ddSX1ND+u7LtMUukPJp4mevYxixCtrf+rLBJ/G7w3haGlKoCNBOULyAsa2MNzP9iwvlsfCrNxoVdGC7YtIJXy8Syrjw4Bp/+gjSSYJxK7b6jvKujOaYMPNEH23aFvjhuQ+NoalSkL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772188; c=relaxed/simple;
	bh=q8kaetrGFNEPEL5KF0HC44382x67d587QU+JcdIqgLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZFBSjsHWmC9AcBKJItIRv9rkbXA1gtcbNecFxjGGa+F3vRlDmqrMeHngMvrwFJB/8EoQZInfONsMaLbLf5XTVkkehGWmBfuOFNwyoCiEDkf0Hs9BKgP2CA5ESTpo3jwZFiZejH3cJwNW7y943H1GZrbSJEiLin5bEKI0KQIpog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1790772143t79ee699b
X-QQ-Originating-IP: zOO+HqN63uHDLco1J9sZubYYQJGF3SjCLO8JhGcq5sM=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 30 Sep 2026 20:42:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12881138118086274213
EX-QQ-RecipientCnt: 16
From: Xilin Wu <sophon@radxa.com>
Date: Wed, 30 Sep 2026 20:41:46 +0800
Subject: [PATCH 02/13] drm/msm/dp: Support multiple generic SDP slots
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-msm-dp-hdr10-v1-2-dbbf8b2b42bc@radxa.com>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
In-Reply-To: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4973; i=sophon@radxa.com;
 h=from:subject:message-id; bh=q8kaetrGFNEPEL5KF0HC44382x67d587QU+JcdIqgLQ=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFl7mZcu/85/2tdX97t8pl9mun9n6OeTbq33P2w5rnUk8
 15imOaWjlIWBjEuBlkxRRaFeIa57JW5156KlerBzGFlAhnCwMUpABOZNYmRod03TbeCeXvhtvj+
 rW77jqjUN29wnZGotqFMPOUB++GGWIa/Yl/XFC/4rtJS4xJUnhl5Yl9Tw4ZJ/1IMDllP0Uz3iP7
 PAwA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Mutteg8H72qDpNN0ausjfstcM3FyXvND2rnlYEHE1WTUrZoDFaF+TMbF
	e6MmPByPT70xrDv5i2lSk9cDDUOX30wRJRdU8klyxnNrHtZLob6kRx9aVO4RNmXLgXYWdX4
	4Y7aOoCoEWffJZ2DiyFWZ+T8Pa4h4tYlyM0hnAA4Usvo4clPjY5pWQyAeb3o0ed8oMu3CU1
	gCrC9b357zkoJ6jSdsGc1btnLUApsMXjUuVLc89Vrustw+9/PV7mjmahWoC/ZtOW0AYSAqY
	VbiFrgwNQVYKCFLvHmQNBcyocT0/3TgZouDyWaGfyLj5t9j5ZXVaynx/lSDj4bR0xsq+hsE
	7enK3dKBWHd/y8vxmHG5ZG1sOjhi9lR+ZigwHcCYqiGN1Z9fXkvPZlmT5AYq1SuLBUnDxYt
	1VSkPR+5YIWQ180Mz5cL9C0iGGYYxjdq8++hM8QOK/uClg3SX2d2ZOOBRiaP+8tv6dMPrvr
	lJ3kL1JI+NQOJKvLKSVad9ACyjuERqG/QrsiUF5029628Qtc34Sr3jp1bXtk6KxojOejJz+
	V9CuOBkZ5W+youeKSRw3JODIPgBpOMZaNZ2WsLbWI2mjvWkUa1A3O6JV4FksYGdIqMOqs0t
	ZOh+F9DzdGb5MJJlAE6X2gok3d5b059FRdzEDgTOBirzcAPYB7m9Af2TV3eNVTsaQBsosOp
	iJu/KsGow8H7UvOxIFtPfU//vGuX8QAHApa7UaCn+4vPUQMJuit22l71GPmgkU/HApDizcX
	A1cfVHue7jdUJunjU7OUHpoiFcuEuAJYpikYKlTxZ8HOoTn8qiY50wugOcSnNLeyiiZQQ8J
	xvqDb8GyzuNxWSNn5wABEwH548/8GwhUiVuA6PQX5WJ4rHoxDGmQYrYk6QCTJQI/ZKnFp0N
	B+k1cfO2hXKm2fwFf2fy9zfIhTDNViKUIHmXOysDh6+Nz+9nOXSh4nGHxHrQgadxjWSkuR8
	SrWBoEEwuIn1r/q6wu6rocrW8gaCAXRB10cHzy99Zjn//GUJ43+JkCaZ7xXZVUwovRObYjJ
	FUqM/pal+11ChIEtpntAbBTqb6gGk=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

The SDP writer currently targets Generic0 for VSC packets. Static HDR
metadata needs a separate slot so that both packets can be sent on the
same stream.

Allow the SDP writer to address a generic packet slot, and define the
Generic2 registers needed for static HDR metadata. Use unaligned
little-endian loads for the payload words and accept a const SDP header.

The existing VSC packet continues to use Generic0 without changing its
layout or enable sequence.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 22 ++++++++++------------
 drivers/gpu/drm/msm/dp/dp_reg.h   |  4 ++++
 drivers/gpu/drm/msm/dp/dp_utils.c |  3 ++-
 drivers/gpu/drm/msm/dp/dp_utils.h |  3 ++-
 4 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index e76dad0f6663..fdf1a3f437ba 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -14,6 +14,7 @@
 
 #include <linux/io.h>
 #include <linux/types.h>
+#include <linux/unaligned.h>
 #include <asm/byteorder.h>
 
 #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
@@ -442,22 +443,19 @@ void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel)
 	msm_dp_write_p0(panel, MMSS_DP_DSC_DTO, 0x0);
 }
 
-static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct dp_sdp *vsc_sdp)
+static void msm_dp_panel_send_sdp(struct msm_dp_panel_private *panel,
+				  const struct dp_sdp *sdp, u32 base)
 {
 	u32 header[2];
-	u32 val;
 	int i;
 
-	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
+	msm_dp_utils_pack_sdp_header(&sdp->sdp_header, header);
+	msm_dp_write_link(panel, base, header[0]);
+	msm_dp_write_link(panel, base + 4, header[1]);
 
-	msm_dp_write_link(panel, MMSS_DP_GENERIC0_0, header[0]);
-	msm_dp_write_link(panel, MMSS_DP_GENERIC0_1, header[1]);
-
-	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
-		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
-		       (vsc_sdp->db[i + 3] << 24));
-		msm_dp_write_link(panel, MMSS_DP_GENERIC0_2 + i, val);
-	}
+	for (i = 0; i < sizeof(sdp->db); i += 4)
+		msm_dp_write_link(panel, base + 8 + i,
+				  get_unaligned_le32(&sdp->db[i]));
 }
 
 static void msm_dp_panel_update_sdp(struct msm_dp_panel_private *panel)
@@ -487,7 +485,7 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
 	cfg2 |= GENERIC0_SDPSIZE_VALID;
 	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2, cfg2);
 
-	msm_dp_panel_send_vsc_sdp(panel, vsc_sdp);
+	msm_dp_panel_send_sdp(panel, vsc_sdp, MMSS_DP_GENERIC0_0);
 
 	/* indicates presence of VSC (BIT(6) of MISC1) */
 	misc |= DP_MISC1_VSC_SDP;
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index dda4b642c81b..6767a215b662 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -232,10 +232,12 @@
 #define MMSS_DP_AUDIO_CTRL_RESET		(0x00000214)
 
 #define MMSS_DP_SDP_CFG				(0x00000228)
+#define GEN2_SDP_EN				BIT(19)
 #define GEN0_SDP_EN				(0x00020000)
 #define MMSS_DP_SDP_CFG2			(0x0000022C)
 #define MMSS_DP_AUDIO_TIMESTAMP_0		(0x00000230)
 #define MMSS_DP_AUDIO_TIMESTAMP_1		(0x00000234)
+#define GENERIC2_SDPSIZE_VALID			BIT(20)
 #define GENERIC0_SDPSIZE_VALID			(0x00010000)
 
 #define MMSS_DP_AUDIO_STREAM_0			(0x00000240)
@@ -291,6 +293,8 @@
 #define MMSS_DP_GENERIC1_8			(0x00000348)
 #define MMSS_DP_GENERIC1_9			(0x0000034C)
 
+#define MMSS_DP_GENERIC2_0			(0x000003D8)
+
 #define MMSS_DP_VSCEXT_0			(0x000002D0)
 #define MMSS_DP_VSCEXT_1			(0x000002D4)
 #define MMSS_DP_VSCEXT_2			(0x000002D8)
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c b/drivers/gpu/drm/msm/dp/dp_utils.c
index 4a5ebb0c33b8..226b370ce8fe 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.c
+++ b/drivers/gpu/drm/msm/dp/dp_utils.c
@@ -74,7 +74,8 @@ u8 msm_dp_utils_calculate_parity(u32 data)
 	return parity_byte;
 }
 
-void msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 header_buff[2])
+void msm_dp_utils_pack_sdp_header(const struct dp_sdp_header *sdp_header,
+				  u32 header_buff[2])
 {
 	header_buff[0] = FIELD_PREP(HEADER_0_MASK, sdp_header->HB0) |
 		FIELD_PREP(PARITY_0_MASK, msm_dp_utils_calculate_parity(sdp_header->HB0)) |
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
index 2e4f98a863c4..2fdb89efc57c 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.h
+++ b/drivers/gpu/drm/msm/dp/dp_utils.h
@@ -31,6 +31,7 @@
 u8 msm_dp_utils_get_g0_value(u8 data);
 u8 msm_dp_utils_get_g1_value(u8 data);
 u8 msm_dp_utils_calculate_parity(u32 data);
-void msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 header_buff[2]);
+void msm_dp_utils_pack_sdp_header(const struct dp_sdp_header *sdp_header,
+				  u32 header_buff[2]);
 
 #endif /* _DP_UTILS_H_ */

-- 
2.55.0

