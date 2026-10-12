Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E305438466
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787533; cv=none; b=tjO+5Ruio4Yq7+1TbBRMFkQAw3aEXatLWRbHQSPgXSeRPnFNsgcWDOTDrD6BLrWPiFAoV1mrPadHhYICW+4YHdBhmWWMfttOTmPkwV58fX9vPz4dvB6e4nxpgBaw9bsnwa7Ex8fVHFl381kYvLZPTWiQmP2ksvhbWiOwItGw+4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787533; c=relaxed/simple;
	bh=gj+4ZcvyLGFiNfdHePlCKWvUe6dp75D9P6rXGa74vtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GACLwFKxuFEZsfQX9IArEJxGmrk+UGFnuS5ALVZ0a1i6hbTTbAhl1zRBGObFLNZFfmLK2KNV0VFR5o8daXuHzFvOHoklr5mrDBOFd76CbEai/ghjD4YC9TJJvFvoUIOI973ZoZRMJfG5WLvKZd85VJZvrHzUbMZDkydYPHoUX5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMXDbcIc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VJgDlWel; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMXDbcIc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VJgDlWel"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55cHi1314411
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PGMq8T8n/fmFChQTImLI0/8YOyadttJOmYpYwXVmHL0=; b=WMXDbcIc8KpFBudV
	ryIZVcX5CaPbs3/Ujav+lrEs6biDXJ98H7FzUqBjZClC+6VHx9EehFjrBjw4oY+F
	FUyFo8WaOYe4+OiAAQv7+In3i6KZrWWokbcZFvwgO31d9XC/YJ7zFUP2h9HhF7Au
	x2hsa2HNjDHemOcRUVkoa21XJkncZF5vh+QC75HHBJ/Wska1yLOcCy+xtEL1l9VG
	uGZ62w3hmlFsxiC+f4XausKhqmN/KZi6VRpQH2NBKVCrJIxaChuy/VuCVrJrbsbv
	uNqPQnNB82vRfXuJD0aXMMi/bLMvhczTwyeNmA8j4CKAAZ4KroZwYFdTLwKygp5q
	0rZDbQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j711d05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:45:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88bbc27f85cso2295987b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787529; x=1792392329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGMq8T8n/fmFChQTImLI0/8YOyadttJOmYpYwXVmHL0=;
        b=VJgDlWelkZwZXsBvq2PNRIAub0GQXli2f7EqbTDLYlkJsPPrR4hmx2Wv0VUcHa6UZa
         4hgT9Mqw2ab8/pwlUvu2En0xOG/yS7xhcVV37BY50WAAHC+NrIEgYkRCzR4+4Zi8G/0G
         +IFNTr/gY3uaFIxRthJG12KEoeJA4PzJoNEcEAhT2pwwOHPZcsbnm8Y6Qw51qx3fergi
         0T8wNj2BSSxbfjPeFDO4av9PueRYGnoZkQ0lannpOfiq4GA8uyqtj/AkKEt18JG4W9o3
         LKI7QOiCPVbuUmI4LHv2ltRIbOhsps+eV8RtA3wo88d32XBL468aBBab1Z4lLtED5hnw
         0BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787529; x=1792392329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGMq8T8n/fmFChQTImLI0/8YOyadttJOmYpYwXVmHL0=;
        b=ZEiteOfoJ7ar8o7BAljahr4pMZt17wrjpWDjdrKk01F2qo9t6tg+5aimNnqtS0tITg
         lhl6LgRBAPekpUthxGNJ4xL1ezJINGcaSMsLNb1Zf09OgianTNwaA7QWYAqkyzGTkCYD
         pvxO/YDUuDUPxxo9llFzp35l0rCaNJ4Ujnz1w2KaTdkEZzSQ60XJ1S0DYdbXfjmLOVFX
         6SnxW8BB32y3rt3pkvs82EOUhynRcTbQt4HyouBDbgm21TvTwVBsAfAI+/f2sPfB4Wi+
         L30CbKe5UNyKTijDNx6jcIBg0Hn2V1M+U/4AlHNvsulj6qrHSxjJahaArTGq6GVF3Xni
         d62Q==
X-Forwarded-Encrypted: i=1; AKwUvBy/xdIyLMWxKU16P2IgX6ucquN1/kZTIyw1JVetKzrihGP2EWhejzvWbCYXPsFW73naUj4VfZbU10vyW10=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwvnqZH9Qwn6atR4bNnFMzYY+xDXlvFyABdGVfwoT81j7+oVrF
	Ove1cyrUHF/IAw4xAhG13oRNl1PJlVxrdmZ3HTADU2S1c1BxFav2gtgJ1Lqsh6rHg8PyHKFsR0i
	XMam5Y4Bg8BkhO9yGpLKQhdA66MB4frk8JueYZj2u+cfQsFcAN/C7mhuddPGBA07XI1g=
X-Gm-Gg: AYBFou3OA3N06GoeSqTj+nQWYgsDP/iCSGL63gRwhS6LCFWeyrBfPRbvNwG+FSKLFc4
	gAsmOILkT96g5YQgMD6xrG/7V3iDCV5G+8AaKkE+gsqzDrMZXxkClwMKqzbs+YJ+u42Cie7Ep0q
	Et3lAs1927ZBGCGpcPCPJhQkMKfMkqyOmggVLseyQNQIOjAnfMFDTW0M2HC+bNsMcbLHGCEiMSz
	k+RawIckGihJP/ApuJ9s5wfwDzsBcioEooNXebIVab4Z5onOVck5Rsz81NXPrxksPU4dbMuG5kX
	aaddHSGWvn7XSipjRdyt2QxlzZqSJF4LmGPfBGZwV6r9O7r5pEwG9a2hEJl59+/J3GFiPAFOP3x
	fj6RfuSn88ct4UqieJxRkPeXQhsbLraUj9UiEdN7pPkOxOmW5sqFjk2EmnkwmkCOAbyx598Yj58
	/LJZ+4H7QeBw==
X-Received: by 2002:a05:6a00:18aa:b0:888:119d:efae with SMTP id d2e1a72fcca58-897c8b899cfmr8312973b3a.53.1791787529006;
        Sun, 11 Oct 2026 23:45:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:18aa:b0:888:119d:efae with SMTP id d2e1a72fcca58-897c8b899cfmr8312949b3a.53.1791787528518;
        Sun, 11 Oct 2026 23:45:28 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6c93sm3534420b3a.33.2026.10.11.23.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:28 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 23:45:06 -0700
Subject: [PATCH v21 04/14] media: qcom: camss: Issue stream-on REG_UPDATE
 from CSID
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfXzL4evY73hzEU
 7vJaPGWvAc4y6Z4J72ck67jMnb525bvgt0PPkV1WkhNv90NxAf8+HogTGLyx35AtTK3UDNIPmBT
 2jjFY6pYQiGJOIhoch9y2AHwPaC6Uec=
X-Proofpoint-GUID: lSts7IPy6g6fe3F7iQaVoRTsgx0VKL3s
X-Proofpoint-ORIG-GUID: lSts7IPy6g6fe3F7iQaVoRTsgx0VKL3s
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6acc820a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PawOzgAtrr2O3SqsEfcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX0Ua8oqMXaYTW
 74uQ6B71oKIRzpf7B6ayp5tHIqZ6dm8WC+wf0Yc+m2FBfwEbvrISgewZTeD3uwcJ6WIXwomJddw
 7uxrFlJqWBoNLOILR1uYTd96k650Zici8yc09UlEQ0ZI3c+OTdn3H2ZBvWjzVAYYQZVNVjWT5Cw
 Btah/MPyR6UxxIZyoIAlZaS5DqxRwmndBXQzfgZAZlhoDLf3Q/XDjoLXR4C/T410RVodFpe5fG/
 oXQlW+9TsDlwauRmUAmq5BmYI4NqyutviotHzsah5L480wmbnJ1LI3FGDcbH3VTL90LiQaYeQOL
 DchxcppXtZwVoO9M9tFpw8jGI1Pldmp2XSkRxoehbmXhAMKUExOg9qI48WxmIXts8/YTrYlfeEl
 iFZvNU/TR6pjl1LiY6pLK/4zAYE1OtCdq089v0EQ8IosE6kFY6NlFuH+FxwTpmB1IwsEwKPhETV
 vDGiT13AxGC6EE/w+Qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120026

On stream-on, CAMSS starts the subdevices upstream from the video node
through their sink pads, so the VFE is started before the CSID.

Starting with CSID 680, the REG_UPDATE is issued through the CSID
rather than the VFE. However, vfe_enable_output_v2() still issues a
REG_UPDATE after queueing each initial buffer, before the CSID has
configured the stream. The VFE then never signals BUF_DONE. Therefore,
the CAMSS now issues the REG_UPDATE from configure_stream() on CSID 680
and CSID Gen3 instead. The operation happens after the RX configuration
and before the RDI path is enabled.

Skip the VFE-side stream-on REG_UPDATE only when the CSID connected to
the VFE sink pad implements the reg_update callback. Platforms whose
CSID does not provide this callback, as well as lines fed by ISPIF,
keep the existing VFE-side REG_UPDATE.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-680.c |  3 ++
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  3 ++
 drivers/media/platform/qcom/camss/camss-vfe.c      | 37 +++++++++++++++++++++-
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 345a67c8fb94..556cdfef6207 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -296,6 +296,8 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool is_clear);
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	int i;
@@ -307,6 +309,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			csid_subdev_reg_update(csid, i, false);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 	}
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 0fdbf75fb27d..830c9c818d3d 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -219,6 +219,8 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool is_clear);
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	u8 i;
@@ -230,6 +232,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			csid_subdev_reg_update(csid, i, false);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 }
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765..16a0b5663fe2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -502,6 +502,37 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 }
 
+/*
+ * vfe_upstream_csid_has_reg_update - Check whether the CSID feeding this line
+ * issues its own streamon RUP (i.e. its configure_stream does the RUP).
+ *
+ * The CSID->VFE link is created in camss.c for all CSIDs and VFEs, so the
+ * upstream entity of the sink pad is either a CSID (possibly with RUP) or an
+ * ISPIF (no RUP). Only enabled links are considered.
+ */
+static bool vfe_upstream_csid_has_reg_update(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+	struct camss *camss = vfe->camss;
+	struct media_pad *remote;
+	unsigned int i;
+
+	remote = media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SINK]);
+	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
+		return false;
+
+	for (i = 0; i < camss->res->csid_num; i++) {
+		struct csid_device *csid = &camss->csid[i];
+
+		if (&csid->subdev.entity != remote->entity)
+			continue;
+
+		return !!csid->res->hw_ops->reg_update;
+	}
+
+	return false;
+}
+
 int vfe_enable_output_v2(struct vfe_line *line)
 {
 	struct vfe_device *vfe = to_vfe(line);
@@ -511,6 +542,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
 	unsigned long flags;
 	unsigned int frame_skip = 0;
 	unsigned int i;
+	bool rup_in_csid;
 
 	sensor_pad = camss_find_sensor_pad(&line->subdev.entity);
 	if (sensor_pad) {
@@ -523,6 +555,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 			frame_skip = VFE_FRAME_DROP_VAL - 1;
 	}
 
+	rup_in_csid = vfe_upstream_csid_has_reg_update(line);
+
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
 	ops->reg_update_clear(vfe, line->id);
@@ -552,7 +586,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		ops->reg_update(vfe, line->id);
+		if (!rup_in_csid)
+			ops->reg_update(vfe, line->id);
 	}
 
 	spin_unlock_irqrestore(&vfe->output_lock, flags);

-- 
2.34.1

