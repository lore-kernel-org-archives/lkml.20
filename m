Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0D751CF50;
	Mon,  5 Oct 2026 17:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220710; cv=none; b=CJAoufanzCP61OEGJTtHUQaKROqFT0VLEGQJv9FOJrfKG/zyeyq3NsiV3ny8Y7+/hTZ69oxAX2tJtm14zh2B9Akwy44EXEKUzqC7wqLtHuQLNuWSD0OuaaHbNUy7rm5YnMx5bJ0HNHszk+C8vt45Jf9QJG64l0LAKgierKPA+QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220710; c=relaxed/simple;
	bh=Q8MpsbsN4rMHNi18N2B30JWanKj85QwRxbgBE6Ry7ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l8HVS6NpNoIwcBOY67RKRBiLYiP0ALbvqWYPexRZu42h2s7m+/Nzzvm5iuGRryV3DPtSFLi61ocSbSLNen2gXQA8nGM8w5lRPt0sbAISPhbC8NYKifJ8bB1AheJu+pZ1tArymLJx4NpRq6kXgWv9QJAUx+C3S1MVat6XJUw/sf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E5LB/JGS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E5LB/JGS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAA01F000FF;
	Mon,  5 Oct 2026 17:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220709;
	bh=ZBm2O6AztdOMwKrXVqy1hEMlhuAiH3VcbKRO7AUFTDc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=E5LB/JGS6ZD2QE3NfY/0GUnDeyrOyMR6xlH56pB8+jzyljtAHXLu48jEncCdBuJxE
	 Zjx3JNZ2R5YxBHSqlzhYxF9jxpp02KYqkQNnWZEftGCRXXcWLJUky8gJE5moYe39lz
	 n5q56kJ4+uNqQcleSe/CrWo31C3xeG8oHWFWLLvYt7tkRhtExgeCpWiJiRntTqO7iO
	 9rcmI9unih3QZkU+HOa6Gu6xFWnCirnLeN1Vnwmy7oRMDoOhAt49k3Ra9dcSGmz01j
	 ncJUGh2Ka8NVXz1HOvfIMRv+7UuJ08vHw1aDVyajIyE+yKwBmmq9QZTmHqjWYGK2wu
	 NTXVZq39G2WEw==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:17 +0200
Subject: [PATCH 47/74] media: qcom: camss: Pass new struct
 camss_buf_done_info to camss_buf_done
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-47-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4288; i=bod@kernel.org;
 h=from:subject:message-id; bh=PUHHmV/hhP/W13esYVvcz9GZrS/vw7l9MnIaHRi//ls=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9si3tSLA7o9/0p0/VVaG6IqfslPXsuwPtI+L
 USyPCLmE4aJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbIgAKCRAicTuzoY3I
 OkR5D/9V81l3YnRAR73XeLEvwkEl9SwIePHH1Tn4qR1j58/ZvdYDuRj67SHisq2TUK2+XNXMQci
 qSUlxZeiBi/lMUMFQu+nww2I6jyj1jUrn+hz6jzQqqTZOTAw7rTB9In+4g7UwRNCyJS3rgTRWyb
 CY63eTNWjf+O+dqfgWjol5KheyXsDSH8QpX1/wBDODfnCtaeupKnZBTSSPgZoFwdDU9mKCtKnHO
 nLKdfked9+I0F39j41czUwAXcDo6w5h6ihSkAzEJPa2bbCBx1Cv+48WkmUiJl0/XQ2x0bmu0DNR
 KbFg+JN7TusjLjdJo5PZH/pUm3K8M9N87hmcvbg5+eHx3e9bqPFWKOhgt9alpJ/jFJXYjwwvauJ
 dAMmXPIRqQ+0oF6j7tjVN6cvzp5SWa71b0E91XfX/h3+Y3D7M/dv89Yex3sMcF17T0H/w5nxrt1
 lPJ1PBbRM3rYo2TLI4JJQubfL/6EnkuGTAfqLk2JPG8d37IxInnN3Zp8jyl47FRnjd8ncQ/8NDv
 XkyWb5vXZS/Dfx4dkfnJH+qXo4X9SaLzngbXaWERjUkfv3yjUhk1ZqSPiRA26fH/hx4HhbfpDgH
 ko2jVP3hcSKG8nz+im26JNduq3zMe0R/8w8JbJKRs/2SO4LEZ/KjUpRNzWbsjL0sINzFcZJXJbI
 AcV450BKCrl5iQQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Right now we pass hw_id and port_id to camss_buf_done. That data will be
useful outside of this method so in preparation for better passing of
data-around define camss_buf_done_info including the two data fields.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-680.c  | 8 ++++++--
 drivers/media/platform/qcom/camss/camss-csid-gen3.c | 5 ++++-
 drivers/media/platform/qcom/camss/camss.c           | 8 ++++----
 drivers/media/platform/qcom/camss/camss.h           | 7 ++++++-
 4 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 345a67c8fb947..8ed190db5b528 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -373,6 +373,7 @@ static void csid_rup_complete(struct csid_device *csid, int rdi)
  */
 static irqreturn_t csid_isr(int irq, void *dev)
 {
+	struct camss_buf_done_info info;
 	struct csid_device *csid = dev;
 	u32 buf_done_val, val, val_top;
 	int i;
@@ -398,8 +399,11 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		if (val & CSID_CSI2_RDIN_RUP_DONE)
 			csid_rup_complete(csid, i);
 
-		if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
-			camss_buf_done(csid->camss, csid->id, i);
+		if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i)) {
+			info.hw_id = csid->id;
+			info.port_id = i;
+			camss_buf_done(csid->camss, &info);
+		}
 	}
 
 	/* Issue clear command */
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 0fdbf75fb27db..3a48bd072e0df 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -258,6 +258,7 @@ static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool c
  */
 static irqreturn_t csid_isr(int irq, void *dev)
 {
+	struct camss_buf_done_info info;
 	struct csid_device *csid = dev;
 	u32 val, buf_done_val;
 	u8 reset_done;
@@ -289,7 +290,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 				 * CSID from VFE. Once CSID received bus done, need notify
 				 * VFE of this event. Trigger VFE to handle bus done process.
 				 */
-				camss_buf_done(csid->camss, csid->id, i);
+				info.hw_id = csid->id;
+				info.port_id = i;
+				camss_buf_done(csid->camss, &info);
 			}
 		}
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2551f0dfa37bb..065d14a872526 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5033,14 +5033,14 @@ void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear
 	}
 }
 
-void camss_buf_done(struct camss *camss, int hw_id, int port_id)
+void camss_buf_done(struct camss *camss, struct camss_buf_done_info *info)
 {
 	struct vfe_device *vfe;
 
-	if (hw_id < camss->res->vfe_num) {
-		vfe = &camss->vfe[hw_id];
+	if (info->hw_id < camss->res->vfe_num) {
+		vfe = &camss->vfe[info->hw_id];
 
-		vfe->res->hw_ops->vfe_buf_done(vfe, port_id);
+		vfe->res->hw_ops->vfe_buf_done(vfe, info->port_id);
 	}
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63b..6a0d781ae7951 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -140,6 +140,11 @@ struct camss {
 	const struct camss_resources *res;
 };
 
+struct camss_buf_done_info {
+	int hw_id;
+	int port_id;
+};
+
 struct camss_camera_interface {
 	u8 csiphy_id;
 	struct csiphy_csi2_cfg csi2;
@@ -176,7 +181,7 @@ void camss_pm_domain_off(struct camss *camss, int id);
 int camss_vfe_get(struct camss *camss, int id);
 void camss_vfe_put(struct camss *camss, int id);
 void camss_delete(struct camss *camss);
-void camss_buf_done(struct camss *camss, int hw_id, int port_id);
+void camss_buf_done(struct camss *camss, struct camss_buf_done_info *info);
 void camss_reg_update(struct camss *camss, int hw_id,
 		      int port_id, bool is_clear);
 

-- 
2.55.0

