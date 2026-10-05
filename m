Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5E94E80D8;
	Mon,  5 Oct 2026 17:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220607; cv=none; b=dhhG7DEqskXA+MLKltR1sAN0hfRUlU4EbaWqf8RJdVJ7w6KdnMpuuVRtJ1/cczmVkeYkJyJqn/jPh0IJC7UF0d3yq6uSiCcj2nVDKvE3uBN1b6OhaHNTeOwObUdrszqHURuHGQ8CknLSlI45lAZ0ZvUudqJdxvOg8o6ypfj9iTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220607; c=relaxed/simple;
	bh=w2wwxc+vXtkZuVngjMDId+G6VbktTVOeStGEG+ggNVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Begb4YmKfmPGbRG9YARvqQSsYa/iDRJYy0KxkNMbydNfdtRmt2de0krPM1q3jL08RAK61SwjxYiFHlMgCxmPsINi/symogTRCUMD+KJgHjuhLMwDG9TpXNeTK2QQNEUqOCoZ9Xgdy+fXSzbokR3T4b/WJMYW7ebiN/OxVxwtEVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rcxjfr29; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rcxjfr29"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F118A1F00898;
	Mon,  5 Oct 2026 17:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220606;
	bh=zbxG8NAQ5PCfX6FEMtnQ7f5Nu6iD2U12hBuLX4TzKLc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Rcxjfr29GTv6vqa3U0f/OQbO1hS0kmjPR9jkDSaYRp8DNCn4kwTcpsLJfK4Bm6n1V
	 +LGreeVpnAcWrhyJ6SkVYLZypX5oEOngyfS9sRhlLfexCjDKlpzXBniwvJwb69ZOlC
	 UIkBFP3vAna+XLnoqoqAA51x8PO9Qjycs4XAI3TOYPg44iUxUdFbiYTF1vjw5muJj4
	 NT17+/5VooKg5rHbVlmEi/m8UedvX0LwpCWYBeK6Ql/SZQOg+ow+m4SfzwRkiOmPVf
	 ay/E+k0U4cBjqGDZRrhbuSAfCavS8FPPS4/ZmdYPzcPSfwDX2TTHBuvYgljuCpkrjf
	 +weruwIPCQnag==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:13:48 +0200
Subject: [PATCH 18/74] media: qcom: camss: vfe: Add helper
 vfe_bus_v3_packer_fmt()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-18-ed985aefd611@kernel.org>
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, 
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, 
 Robert Foss <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4246; i=bod@kernel.org;
 h=from:subject:message-id; bh=w2wwxc+vXtkZuVngjMDId+G6VbktTVOeStGEG+ggNVw=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sNAU2O9SxZWjTmRi8+l5ubOpJfJFsiE03lu
 f+eqyLuTUqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbDQAKCRAicTuzoY3I
 OuvZEAC21/0pR5b0oK/X95b3qebm15KDFK58mvoVjg/WW8iYstGWMA6OZ5XYkmNnZOPJBLI89D7
 zROvShQnbrrf8F1AyTzarrCyyts7z6kuFmV7im1RNAclxgPMXa68OGGL498tw1lNiSO6/1quxuR
 3O2jhpSGo/f77q/MHoUbHYLqgV5AlUr6oWrQMvvIDPBWAJ5nx1EEW6pSOKVy0sNKu6DJmL0DQof
 J2C3M+sb0aj7RBsxXoPKSu4hSoxg8KV0k8RZOkS/V+GFaB1DhUYzI3nTNFmXWJNM3lhke9q9TyL
 uuGNWIWZZ+rAXmrTeZnvKsYdbP7JJctxa75XC59pfKPBUpx3KCbPJ+cCIlkRYwhDAATu3fHnUvd
 rRyhmOSTqDjguMtzGh5/urAVdISuL8q3pwhRwn0+MmMzEGv2e3/42h6IQqR3f6/qyTOfZPUmayS
 eIsY7MGQZCP8Lket8KC650KEa97Z9WMPeXFjoBoxvl9jpIe7qilhwHrDCeYFw14sCKUQ4ubgCNI
 SkbN6SN+wtb0NcEij2dlk9OnEq4F6TBo3eBi3pJzS1e++EZC618w5CygcB508Bqxw9fM25AtO/1
 XliRvED17G7thg/wHNbFOHbWkRzpATCO/WydGvf+KhTTqsW8uONWhVoxD+odcdCCuJlEouOAVqN
 UmJtGJaq5k41+ug==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

vfe_bus_v3_packer_fmt()'s job in life is to translate a given v4l2 pixel
format and plane into the appropriate bus packing format for v3 class
hardware.

Other versions are currently not covered.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 53 +++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h | 32 ++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 5b5201b55a485..c95fe5b0b05fc 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -370,6 +370,59 @@ const struct camss_formats vfe_formats_pix_845 = {
 	.formats = formats_pix_845
 };
 
+u32 vfe_bus_v3_packer_fmt(u32 v4l2_fmt, u8 plane, u8 align_shift)
+{
+	switch (v4l2_fmt) {
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV12M:
+	case V4L2_PIX_FMT_NV16:
+		return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10;
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_NV21M:
+	case V4L2_PIX_FMT_NV61:
+		return plane ? VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10_ODD_EVEN
+			     : VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10;
+
+	case V4L2_PIX_FMT_SRGGB10P:
+	case V4L2_PIX_FMT_SGRBG10P:
+	case V4L2_PIX_FMT_SGBRG10P:
+	case V4L2_PIX_FMT_SBGGR10P:
+		return VFE_BUS_WM_PACKER_FMT_V3_MIPI10;
+	case V4L2_PIX_FMT_SRGGB12P:
+	case V4L2_PIX_FMT_SGRBG12P:
+	case V4L2_PIX_FMT_SGBRG12P:
+	case V4L2_PIX_FMT_SBGGR12P:
+		return VFE_BUS_WM_PACKER_FMT_V3_MIPI12;
+	case V4L2_PIX_FMT_SRGGB14P:
+	case V4L2_PIX_FMT_SGRBG14P:
+	case V4L2_PIX_FMT_SGBRG14P:
+	case V4L2_PIX_FMT_SBGGR14P:
+		return VFE_BUS_WM_PACKER_FMT_V3_MIPI14;
+
+	case V4L2_PIX_FMT_SRGGB10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SBGGR10:
+		return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_10BPP |
+		       BIT(align_shift);
+	case V4L2_PIX_FMT_SRGGB12:
+	case V4L2_PIX_FMT_SGRBG12:
+	case V4L2_PIX_FMT_SGBRG12:
+	case V4L2_PIX_FMT_SBGGR12:
+		return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_12BPP |
+		       BIT(align_shift);
+
+	case V4L2_PIX_FMT_SRGGB8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SBGGR8:
+		return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8;
+	}
+
+	WARN_ONCE(1, "no packer format for 0x%08x\n", v4l2_fmt);
+	return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_128;
+}
+
 static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			    unsigned int index, u32 src_req_code)
 {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 089f525b98cf5..98d403a71cf95 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -56,6 +56,27 @@ enum vfe_line_id {
 	VFE_LINE_NUM_MAX = 4
 };
 
+enum vfe_packer_format_v3 {
+	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_128 = 0,
+	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8,
+	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_ODD_EVEN,
+	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10,
+	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10_ODD_EVEN,
+	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_10BPP,
+	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_12BPP,
+	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_14BPP,
+	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_16BPP,
+	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_32,
+	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_64,
+	VFE_BUS_WM_PACKER_FMT_V3_TP_10,
+	VFE_BUS_WM_PACKER_FMT_V3_MIPI10,
+	VFE_BUS_WM_PACKER_FMT_V3_MIPI12,
+	VFE_BUS_WM_PACKER_FMT_V3_MIPI14,
+	VFE_BUS_WM_PACKER_FMT_V3_MIPI20,
+	VFE_BUS_WM_PACKER_FMT_V3_PLAIN32_20BPP,
+	VFE_BUS_WM_PACKER_FMT_V3_MAX,
+};
+
 struct vfe_output {
 	u8 wm_num;
 	u8 wm_idx[3];
@@ -315,4 +336,15 @@ int vfe_enable_output_v2(struct vfe_line *line);
 int vfe_queue_buffer_v2(struct camss_video *vid,
 			struct camss_buffer *buf);
 
+/*
+ * vfe_bus_v3_packer_fmt
+ *
+ * @v4l2_fmt: v4l2 format
+ * @plane: plane for the given format
+ * @align_shift: bit position of the PLAIN16 LSB alignment flag
+ *
+ * Return: the bus packer format for the register
+ */
+u32 vfe_bus_v3_packer_fmt(u32 v4l2_fmt, u8 plane, u8 align_shift);
+
 #endif /* QC_MSM_CAMSS_VFE_H */

-- 
2.55.0

