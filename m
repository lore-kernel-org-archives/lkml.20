Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEF237E300;
	Fri,  9 Oct 2026 03:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791515908; cv=none; b=j1uHV/9ZobROr9wSoqhECUG78SrXsyZ7gTgJLk/UWykTXdla0CRL+5cn5UXEaDZSun0AwxSk3nIw11JZX6AY+SMJCehF4jam1goJcVhw/GOrg/U1mSomd6Toq8/XKwPlSyAz4JesXalhsSr1PVTtFAHaFKGp/FrFADUs1Aiq90k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791515908; c=relaxed/simple;
	bh=zp9J/I3KL2ekRKRZ8uv9r2FRGz6DzqPhr0mZSqbj3oI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e6byizmAOwgJ3DUDCdqS7+7Mxv/j6aRriloR8VGp9fxqZEuj2LAcY7OfqYS6bSFw7eJoNpVCmjnWD4YqCSNuo+otlamkfE5bJb9umQ7u3NZ5QQ9gzOiMpjhrjtGG83OLfa+NMdAGaV0xckkFlfO6Uka0Ejl+5HotUhvvcAuUJbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1791515842t5bf99465
X-QQ-Originating-IP: EPo9yvjcUKSxfds5pH10PS+8bETia1Xjr/JTyOz/FM8=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:17:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1232975757929523936
EX-QQ-RecipientCnt: 30
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:15:57 +0800
Subject: [PATCH v2 05/20] drm/msm/dp: Support multiple generic SDP slots
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-msm-dp-hdr10-v2-5-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dragon@radxa.com, Xilin Wu <sophon@radxa.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3697; i=sophon@radxa.com;
 h=from:subject:message-id; bh=zp9J/I3KL2ekRKRZ8uv9r2FRGz6DzqPhr0mZSqbj3oI=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlaUy17ccsbAemrHk8quDZmxgcmqxgUGifWiH5n5U
 npr6zg7SlkYxLgYZMUUWRTiGeayV+ZeeypWqgczh5UJZAgDF6cATCTQieGf9Z2fvZMTV6QYZqeY
 /Zq5b2t2t484/6WsjY57l7PdbmYyYGT40DnzKPOMH7vyVOX3uR+sWjfrsf6yWzX65TofD67zZc1
 lAwA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NMDsnXof05FG0W9l1NoTqTZ1r92JkcZomcgWpXeUzMRWBra7D23xcqAW
	Jq2n05lnc2cW5rSU5oMC+GzbpScXF72bGtXTVV4QExUqG+NmU8e0H3Ba5MEudsmlRer0KIi
	tBWKFWEX30c/5ZL8m2SA7Nixbg8JRPpwD9JP5BdQCYsY40ZICWO2okr6C9uIHSP/SQcyU/L
	XkVQ1YOazwuX44b7Ni6+HhoWkshjClKqY4NAH8nrWyKb1yxm74rGd6BbCPN5fRp5KrTqOk3
	Cxq3RwSGvX/SORO3967M3DOlSWNyyUBgLWlpuufDSkfPyvusgFdqKSF1veRev5F7fJI6bfi
	j0wv3v8MvvMnvlMDbxUKnVXzwKlCP56NUMPtgPbyAtChh6mczxeMiBnFt5yk8AzYcFknKcq
	+BBr35JFNSkDmucKtgsI7j5NKXO7CtcY0kMyRiN0zJjfnDtXP+OSoxfqZERaqWwo7uS9s0m
	0oAIuVGhYNtPQJ/DFWa2xirR6m7RP4CAClpboptK1vhcW3u2n1xUskzdIujPGpeHOvRYZvl
	x97Brnw7MNyh5yeG3Anq79rmQmcxIjGgtU7pRICvl3TZbGvs9HwT6U44hTNIk5dlxpRtt5C
	gPG2Kh6ppRogaUAl9Z9GDh5/pIFFyZEX+52YFti0rXc/pYVgDx0AAF2YyNLk3QiyqQ0hhDc
	jsjv30bjqKtYo4KDWXHu9cM/b691hwg4/E60XAY/3QgwmpDbCAvd7Fc6413X2cLGE4sUq2Q
	JU9mwduJ7PLwOC9ImfuiHfzSWr4LrRmmFoIF3HOK97+rzFoj8CVV1gnVI2ELsjnNDvABvtm
	L+RsXm8XZLpNhINKzx4FYh9ajmeRiDBj3XV9alTQ9qfsXpBcodecFXoZWJsDGuz7jGLy6aU
	QO+N0u9DrIvmIkAF+2ecxO1DuL50ny54uheVyLqnzMSMdlwS1YkAgNQ2XwDKcgo5pIldQbJ
	7u99oPTr8AaABxADYWxyHcYt8CDXTUfVRYgr1kd7LMMQfB+gezPJBcXXPa/SGS+bdrOGN1m
	GkPlwqbROAhveidBa0j0JCmMS9ypp5IOWxq6JtVRsg9q5ciFNG1rxyg0zdM/HG3/9ZfFARh
	Q==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

The SDP writer currently targets Generic0 for VSC packets. Static HDR
metadata needs a separate slot so that both packets can be sent on the
same stream.

Allow the SDP writer to address a generic packet slot, and define the
Generic2 registers needed for static HDR metadata. Use unaligned
little-endian loads for the payload words.

The existing VSC packet continues to use Generic0 without changing its
layout or enable sequence.

Assisted-by: LLM
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 22 ++++++++++------------
 drivers/gpu/drm/msm/dp/dp_reg.h   |  4 ++++
 2 files changed, 14 insertions(+), 12 deletions(-)

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

-- 
2.56.0

