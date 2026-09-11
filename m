Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021693F1052
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789107759; cv=none; b=t6PJ+zQPtNC69ps1QTAAtXg1O/vUzKhNXWSIXJgUS3f2ZrqgL+1gqKY/nCWiNCrcKeAq3mdWfZ2cEtwCK+umeAfAKhv+AV5+35Ruky1+egNAjhwBxqG54/ujM8ZppuqBMDDtfDy7lmrdrYMaC7eQ1dcwLKGtTGob5n1D2UVvfMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789107759; c=relaxed/simple;
	bh=8sgciIDVExgjJLD3rIKKOvLlqAT+p0grCGzz/zZzc5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=saq+V8UoSBofd8cS6SroQmFpgyFts4cPgIz+2geqKG8/lmPplscR6+1rgs8tDZZuG505IcjWMoVVJPA1RV5+Gb3UfC7MjY1cSwGbUcql+D745UB9oXdLE/GYoFWK0Ju7YsnpWcvMVBF7stehbc8oun0dBJzT39Tfie3KLEqdlgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ealk/Wuk reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ealk/Wuk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vjlo3665845
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Rhj2lcG2YTl
	mrBluCpPTnZQuKB9AWdOEgJD05Ko4Lfg=; b=ealk/WukJl5xjNkPsLyu4VbRde6
	7SyjJbqK4iZ6y9Z19jMes9e6Wps2/eU1dziNEldeinxISBP3mECJNCzKtgfkoip5
	zr7Ow0P08juJfE5pqIMOGmsZwR0D0/8yJ8ZyLjCMs6POffyua/Q21iWOYO+LR37L
	hJ6Kf8opXtAm/KasQmZupGuO7x7UHqOkUj+ERjE7eKUGvl9BhIv37WtjNbDBFc/L
	g/uwS6wfXys8ccfcCyb2vD1Rsr1Wc5kYnPsMbQ5hBpnZrcpnwsC1Gd3N6EYjoqDW
	NfQct5eL80+5KV5zTlDm6ZJMdwH2+z/0FOoN11tb5A8i2UHdOsMaAVu2mGA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q1222b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90ceabcd64aso10306676d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789107749; x=1789712549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rhj2lcG2YTlmrBluCpPTnZQuKB9AWdOEgJD05Ko4Lfg=;
        b=KKXv1vwUfiRx+Cbp6cEZGxIKqCOb3K9fxFD6N9m1OrHpFTNWZr3kz3YencpYofqbz9
         HWZTjN0+EplzmUTzuI26hmNaRG5PjLXKUZ3/kmDwpQdRBb8RVGD2qHcQEN5LgcOf8skp
         UtQQzexWpK+6IXrKfghDedtaqcDbzG0jHiVmHsZdNP/tWO25Q+bplThFdNiUVFEgYwyV
         JGfiDAmJ6zhymsalfwDeEbbq4vP87FE949PpiMcGNPkkQKkcYxGYVAtFcSBn3udoW8NP
         WsOrzZGaukQbyvi9Z+NSd0Of1YaGUOEQanXKu2h8a2UfNmPTGeHzi2aXekwSuRQQHyb9
         KNdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOOt8XBa5d+tvMD1ipw3i1qKhOUiiep01C8eDvcp2AVcmGgoGInU8/U+0/arYpUMr37CgtlJGamPYVMIk=@vger.kernel.org
X-Gm-Message-State: AFuF++nud4G9Y4K8HU/6q2Z56N+WbKtHo6heiZTQEnYp3XIlaDrDZz62
	m6tjWAQizgadYLD8JOYVZomrZTkx7tlyCKRCHuUiLC8trnGSrd0wC2ML7HNQFGRwpLnWEjm1NJk
	1qYqBWXo3u5Z+d8V4P8Gb1R0a1ZfYkrffczHHNmozdviaxHPmksSpn9nU1QqEA8pAuuM=
X-Gm-Gg: AYBFou1KmtPOn4W5KKnnlQcE5swN+euSD7JLwTKnWQ8aDl8Px+rUnsyAz0DIULrlSId
	XduqaHWYykjh7NYz3WMthvOnWPeKylKBhpWUwhKNRIRlFqvA+mih0B5BlK1jqhh0+ZZx1lGyvNA
	moE3DuiEyAnY6kTxzCZy++AIfYppx78su3l3hue+L9+IkCUho5P5NluXUA+gy/smphI6bN1hfLP
	yNapHDR95sL1O7OlRISymzAHfIRzYumVi07mFnh897LsB4q0T/BFtYk/RcrLItCnYuDdbA9c248
	SG6iq+vqv6WIF0kqo3808nYE7Heec6zifoNyGw4upkBXWZ/LMjL/NWavNa0=
X-Received: by 2002:a05:620a:29c4:b0:939:a1cc:f234 with SMTP id af79cd13be357-939e9d9bb34mr349700085a.5.1789107749207;
        Thu, 10 Sep 2026 23:22:29 -0700 (PDT)
X-Received: by 2002:a05:620a:29c4:b0:939:a1cc:f234 with SMTP id af79cd13be357-939e9d9bb34mr349698185a.5.1789107748789;
        Thu, 10 Sep 2026 23:22:28 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea60sm3681969f8f.17.2026.09.10.23.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:22:27 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH 6/8] media: qcom: camss: add streams API support for VFE
Date: Fri, 11 Sep 2026 09:22:11 +0300
Message-Id: <20260911062213.195007-7-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa39e25 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=1wZbyvoE6vXdBGjt7Z0A:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX67DgJaKNfLwy
 jdLergPwTCBpDTBSzoU7yrXwciI24aEBG/ZZfamdjyw9GG4h4Y0mICF/OAPQi4XE/AA+lNZjQSh
 Kn9e31+uG+KTJTl8ap3c0+eqPkQfLaphFpt6RLQju3PH83iAwtbBRtAwMjE2NtuorUxgKRMGcGF
 59mztVcs1SjUTuGSbzTzjjr7JXIAQq1NJ4k2aBQYOpJfhXUAIgQQw2P7cv+CRwerJXe7ks6v26e
 ejWl0lMtp51FPjtEVg/f3CKIPkkj+Ll6ETzLuttX4qlCbSNOYpNFLcmLSQxSlNYMbXWPG9CZkYT
 Y9XeVHz61eIzoszZwPtdS2qit6UMBT3PkSW7cKE05PIjOYj5Ib185adc8vF9eCKCoZNyOcWwbIQ
 +BPciwFyEEpOb9aXqteBrLKPjODvKHgbIzTt4xIsIfUawHiRpxAy5xpwKKPupDLj3mOOOKxPqU9
 2seAhQk5vgHWU0CtKMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfXz5b2IANaiFZ8
 k3KYKXXVyXqMBLDaCYG9RutRCBzjnwIGFBOJdqIXoRpjyAOooYC10FZz6nBCBgoEJ0j4ymR+7yh
 LtqONE9yEDd0tf3RISfbGmemUI3iSgU=
X-Proofpoint-GUID: GHNZ71Md7_5G5KaxmmaauJlhETJcMl3P
X-Proofpoint-ORIG-GUID: GHNZ71Md7_5G5KaxmmaauJlhETJcMl3P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110086

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Add the V4L2 subdev streams API to the VFE driver. VFE lines are
inherently single-consumer, so no per-stream refcounting is needed:
enable_streams reserves the output and enables the line, then
propagates a single-stream enable to the CSID; disable_streams mirrors
this in reverse.

On disable_streams, both the local VFE hardware disable and the
propagated disable to the remote CSID pad are attempted
unconditionally, and a failure on either side is logged rather than
skipping the other side's teardown or attempting a rollback. This
matches the best-effort error-handling convention used by other
streams-API drivers (e.g. dw-mipi-csi2rx, ds90ub960, cdns-csi2rx) for
this same situation, since there is no way to un-disable a peer that
already tore itself down. If the local disable also failed, its error
takes precedence in the value returned to the core.

This is opt-in per VFE instance via the new streams_enable resource
flag; no platform sets it yet, so VFE lines continue to use the
legacy non-streams subdev ops unchanged.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 119 +++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
 2 files changed, 118 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 319d19158988..84da6600cf99 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1993,6 +1993,104 @@ static const struct v4l2_subdev_internal_ops vfe_v4l2_internal_ops = {
 	.open = vfe_init_formats,
 };
 
+/*
+ * vfe_pad_enable_streams - Enable one or more streams on the source pad
+ * @sd: VFE V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: Pad number
+ * @streams_mask: Bitmask of streams to enable
+ *
+ * VFE lines are inherently single-consumer (vfe_link_setup() enforces one
+ * link per pad, and each line exposes only the implicit stream 0 of a
+ * non-streams subdev), so no local refcount is needed here.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_pad_enable_streams(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
+{
+	struct vfe_line *line = v4l2_get_subdevdata(sd);
+	struct vfe_device *vfe = to_vfe(line);
+	struct media_pad *sink_pad = &line->pads[MSM_VFE_PAD_SINK];
+	struct media_pad *remote_pad = media_pad_remote_pad_first(sink_pad);
+	int ret;
+
+	line->output.state = VFE_OUTPUT_RESERVED;
+	ret = vfe->res->hw_ops->vfe_enable(line);
+	if (ret)
+		return ret;
+
+	if (remote_pad) {
+		ret = v4l2_subdev_enable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
+						 remote_pad->index, BIT_ULL(0));
+		if (ret) {
+			vfe->res->hw_ops->vfe_disable(line);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * vfe_pad_disable_streams - Disable one or more streams on the source pad
+ * @sd: VFE V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: Pad number
+ * @streams_mask: Bitmask of streams to disable
+ *
+ * Local and remote teardown are both attempted unconditionally on a
+ * best-effort basis, matching the convention used by other streams-API
+ * drivers (e.g. dw-mipi-csi2rx, ds90ub960, cdns-csi2rx): a failure on
+ * either side is logged and does not skip the other side's teardown, since
+ * there is no way to roll back a partially disabled pipeline. If the local
+ * disable also failed, its error takes precedence in the return value.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_pad_disable_streams(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+				   u32 pad, u64 streams_mask)
+{
+	struct vfe_line *line = v4l2_get_subdevdata(sd);
+	struct vfe_device *vfe = to_vfe(line);
+	struct media_pad *sink_pad = &line->pads[MSM_VFE_PAD_SINK];
+	struct media_pad *remote_pad = media_pad_remote_pad_first(sink_pad);
+	int ret;
+
+	ret = vfe->res->hw_ops->vfe_disable(line);
+
+	if (remote_pad) {
+		struct v4l2_subdev *remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+		int remote_ret;
+
+		remote_ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, BIT_ULL(0));
+		if (remote_ret) {
+			dev_err(vfe->camss->dev,
+				"Failed to disable stream on remote pad: %d\n", remote_ret);
+			if (!ret)
+				ret = remote_ret;
+		}
+	}
+
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops vfe_streams_pad_ops = {
+	.enum_mbus_code = vfe_enum_mbus_code,
+	.enum_frame_size = vfe_enum_frame_size,
+	.get_fmt = vfe_get_format,
+	.set_fmt = vfe_set_format,
+	.get_selection = vfe_get_selection,
+	.set_selection = vfe_set_selection,
+	.enable_streams = vfe_pad_enable_streams,
+	.disable_streams = vfe_pad_disable_streams,
+};
+
+static const struct v4l2_subdev_ops vfe_streams_v4l2_ops = {
+	.core = &vfe_core_ops,
+	.pad = &vfe_streams_pad_ops,
+};
+
 static const struct media_entity_operations vfe_media_ops = {
 	.link_setup = vfe_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
@@ -2070,7 +2168,8 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		pads = vfe->line[i].pads;
 		video_out = &vfe->line[i].video_out;
 
-		v4l2_subdev_init(sd, &vfe_v4l2_ops);
+		v4l2_subdev_init(sd, vfe->res->streams_enable ? &vfe_streams_v4l2_ops
+								   : &vfe_v4l2_ops);
 		sd->internal_ops = &vfe_v4l2_internal_ops;
 		sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 		if (i == VFE_LINE_PIX && vfe->res->is_lite == false)
@@ -2100,10 +2199,18 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 			goto error_init;
 		}
 
+		if (vfe->res->streams_enable) {
+			ret = v4l2_subdev_init_finalize(sd);
+			if (ret) {
+				dev_err(dev, "Failed to finalize subdev: %d\n", ret);
+				goto error_reg_subdev;
+			}
+		}
+
 		ret = v4l2_device_register_subdev(v4l2_dev, sd);
 		if (ret < 0) {
 			dev_err(dev, "Failed to register subdev: %d\n", ret);
-			goto error_reg_subdev;
+			goto error_subdev_cleanup;
 		}
 
 		video_out->ops = &vfe->video_ops;
@@ -2147,6 +2254,10 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 error_reg_video:
 	v4l2_device_unregister_subdev(sd);
 
+error_subdev_cleanup:
+	if (vfe->res->streams_enable)
+		v4l2_subdev_cleanup(sd);
+
 error_reg_subdev:
 	media_entity_cleanup(&sd->entity);
 
@@ -2157,6 +2268,8 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 
 		msm_video_unregister(video_out);
 		v4l2_device_unregister_subdev(sd);
+		if (vfe->res->streams_enable)
+			v4l2_subdev_cleanup(sd);
 		media_entity_cleanup(&sd->entity);
 	}
 
@@ -2180,6 +2293,8 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe)
 
 		msm_video_unregister(video_out);
 		v4l2_device_unregister_subdev(sd);
+		if (vfe->res->streams_enable)
+			v4l2_subdev_cleanup(sd);
 		media_entity_cleanup(&sd->entity);
 	}
 }
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ae9dad353a37..d1c54a516ba1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -138,6 +138,7 @@ struct vfe_subdev_resources {
 	char *pd_name;
 	bool has_vbif;
 	char *vbif_name;
+	bool streams_enable;
 	const struct vfe_hw_ops *hw_ops;
 	const struct camss_formats *formats_rdi;
 	const struct camss_formats *formats_pix;
-- 
2.34.1

