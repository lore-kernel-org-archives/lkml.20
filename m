Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6AC52FE40;
	Mon,  5 Oct 2026 17:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220756; cv=none; b=vA1gKO0YjgsysTuLYwr3L9pQq2haDbkEVhn+/4e1PSZPaF0o1rtAfdQ3b5e65/QJbLfuSqeVykyXwH3dHXnvIIhVDooFM3bayhXxkrmt6Fdg4qpD+5+0tVWxoW2oFM3EdDdPiIsfksRGtLdFZq15idbkZEXgnsm7aod46+wZADk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220756; c=relaxed/simple;
	bh=ixGzTt618acudIfWhUHiiEvO/zaTFQWnU2inPGvdKw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HjZQXA9a4dnc6G2bSOOcRG9w9J3FMwd/w5Byn1uFFB2Jy5jbMMP4CWSm2oNSzf/iNRhAJ1zGkpdZiqRiA/4OjokwUIvH/pzs35r3ogbxZJta870yMBsWuqoEQXNA+7NDAFwOaHQASjtB7TamK92GvlFO1Rj4jQh6+HH/NwofNDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Un9kShDa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Un9kShDa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B609A1F00898;
	Mon,  5 Oct 2026 17:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220754;
	bh=S12p/LUH1jU10dpLqaOaOgJAuS9xgzKrvmgufQl8ZDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Un9kShDaBbnH5fTOmDNKOuobmC2LTfsk7HyBiZOS2d5IMcC13ESICF91DYasjPhE/
	 uXTSSI3thG7R/jFXSl9ExbJq22FzJQk1hHOuqQsM18R1gioUJlqpZkMBu6VtHvjyDu
	 QpdkfyhiIFvuz4yjOI0NfKp2S03y69K/9AMYGm2wisQgj6fswlKd7eDg9WC4FutlW+
	 p7jDwJV3+GOnBjD2kOYmqWA6ml5J6VAVWDjEfcyRD7T0/RYrTaek6xleuK345wGdpb
	 xKl6bMqoH+wYBjOjZ53bLJ+1QM67j75rtHHxQvY798B7TItep4u73O85PCCRvza6zb
	 2wLxUNzjiHHig==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:30 +0200
Subject: [PATCH 60/74] media: qcom: camss: vfe: Select line-based mode for
 the pixel path's video node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-60-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2317; i=bod@kernel.org;
 h=from:subject:message-id; bh=KOBTGCHj3HcsfrMCMApcvhyDX/preF/McyKydgMwTXw=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9srvkH6xQK67nw31gq4Wb+U/ycbVWj02oX2G
 KK38szvl86JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbKwAKCRAicTuzoY3I
 OjmgD/9OrX3L7IK5qMwPjWWM2Zgq0syjAJE4Qr+r/2ZrWx1Hm1eLnbsizaFDBUDWKTFFIYaC3E0
 NGh2TM1O1pCevM0fZMhk//HdMv4q99TlypleW1wvCIR3AgD4nqAQ42YS0u1yAuRv4rV1633rb+7
 oa60su+xk8vWD1oCoKj7x3W4H7uKSMRkD7/HvytFH7lNr3Dor0JagHG2DErFBsaK4TINwxBeLVB
 hy1H3kA/CRR5otMPs7f2nARtv5T86tmgIRsosW3Mkcdk2bKV6CdmmDCGQq2O3CyfjHVCsw7ZtNU
 ANvPwjABV7dW/wbv9yVjfIo58Z5W8h1Zxsb/FJN5uG6wc06lilgbuFF0twfdiifNq3W2NDQI4wM
 XmzHihvij6y3QyYdfy1l+HhMjxOO6L17Ah61cUsmpkqVWpa/2Z4b7a0kYmLXBIVwD3LCLGbNa4j
 bDuByZmI9TIkjuD78QdAS7MO+1oPgjk+xMgYBwn/1sePwQWYH/6VffNJOja1Qo8XhBHF+sXgWE4
 vdDQkoyjDx9FLlekMhnlkfyPcCMdC69YYIOvzPeOqxubO7sBlTBuV+vCyTP3dl9sUl7QkY2yrO/
 eIujnwMh2UEQNWlpUXRRJ4fp0XZpz1i7cO9DaULlyzozJqVqYq7nRkVqKxazSwrpgdP8mKtmIeh
 yM2rQyyjAXt6Mkw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The pixel path's video node is always marked line based. A line-based
node caps its buffer at CAMSS_FRAME_MAX_HEIGHT_PIX lines of bytesperline,
counting every plane's lines together. That fits the VFE 4.x and TFE
pixel outputs, but not the SM8650 IFE, which writes luma and chroma
through separate write masters, each programmed with its own height.
There, single-buffer NV12 at 4080x3072 needs 4608 lines: the buffer is
cut to 4096 lines and the CbCr write runs off its end.

Add vfe_pix_line_based(), alongside vfe_bpl_align_pix(). Every existing
pixel path stays line based. SM8650 is not.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 0c7be87d7bd57..bf8ae6a6bfae0 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -2285,6 +2285,27 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	return ret;
 }
 
+/*
+ * vfe_pix_line_based - Select line-based mode for the pixel path's video node
+ * @vfe: VFE device
+ *
+ * A line-based video node caps its buffer at CAMSS_FRAME_MAX_HEIGHT_PIX lines,
+ * counting every plane's lines together. That fits the VFE 4.x and TFE pixel
+ * outputs. The SM8650 IFE writes luma and chroma through separate write
+ * masters, each programmed with its own height, so the cap does not apply.
+ *
+ * Return true if the pixel path's video node is line based
+ */
+static bool vfe_pix_line_based(struct vfe_device *vfe)
+{
+	switch (vfe->camss->res->version) {
+	case CAMSS_8650:
+		return false;
+	default:
+		return true;
+	}
+}
+
 static int vfe_bpl_align_pix(struct vfe_device *vfe)
 {
 	int ret = 16;
@@ -2377,7 +2398,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		video_out->ops = &vfe->video_ops;
 		if (vfe->line[i].is_pix) {
 			video_out->bpl_alignment = vfe_bpl_align_pix(vfe);
-			video_out->line_based = 1;
+			video_out->line_based = vfe_pix_line_based(vfe);
 		} else {
 			video_out->bpl_alignment = vfe_bpl_align_rdi(vfe);
 			video_out->line_based = 0;

-- 
2.55.0

