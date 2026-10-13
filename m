Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9AD3BBA0A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881166; cv=none; b=dCUIqX29Y7ScYn2+GyvlBKCVCCfwnUlZ+4EFIokujkSVTOxx7j0obfA4YiHkJZOcQif2FMU8HeNnNkAhprLy2QjcK720h809lZSagJ+qq+WzxUlDie7u+AkMjjhwWnN0kX4wcoU3x29PILaOfPPM9aO3D9KDmq0HZXqMBftQlXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881166; c=relaxed/simple;
	bh=D6ORrR4WZCXe337DEAaoy6vLh2qom8bYpV8ibq3sUAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cw9ZPD9B6Klu6B/ewiaA/NolcZLeX6M1cmvAZIhAYQ8gpI4o+wEIHzTk0ruBmjsgVpEYsszwiV20Hv0VAj2RxsflsCRAYDvDc5SHyYmnYuwJWZwwCmK8Gh1cSCd528kWRFIE92ZFy237MvilveiJsTChx2Gvt/L8LyGm4oFWn3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3WVv2WP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aG5j/1gS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3WVv2WP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aG5j/1gS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D46JdY174333
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hPMzbv/4wi4ODfA9XRSPX8ue5WbPDcJwnRMdAkV9P04=; b=d3WVv2WPID92/+my
	EBZkCwi7mvJbrTP/7xGwePIzSROWL8Dv5arppVeaG5wTdCr930+p5ADCfh6OXb1f
	UxHJTalSwWXW20z8MbmWI6lkkIs+Zoaf2F1/yqJVt7n24u31eYKy1oqHifUC91gZ
	Jw1Pll2iL+vuSJVRmBIZsbdNw60Rvm7Zfqis8ANZc6uB1oxi5BTwEYUa5pXnlF57
	Mx1KMRpSsXyezzyYEjC4swu7gBagk6QvJdJdAQK/MbJa/mdBpTQmdh44cEzrLwS6
	3yYs0k8ZNlWJUcwOfLjAtuZSV0yda8CzrIe2QUf1z8fOg+h/NAMKA9E/ATPuKS8B
	Fe4pdQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqs257-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:46:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so1557558a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881164; x=1792485964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPMzbv/4wi4ODfA9XRSPX8ue5WbPDcJwnRMdAkV9P04=;
        b=aG5j/1gSm7ZpsZdesxErDUw5gnjjql7yu5RwZL8P2a1l+UnFF12Hb/4eaZSzvB4MId
         OkFEWUa8jcAPPT9YaZDilkDGtCBCRiOHv/2NnYPwmEW40F6esibGJ3TrNbntyUVlR37r
         tOhbL6aSYywI3plqj/uGSPGucFt28ztE3rmjcDjxPjIlLv8zf9BH5ZkwBHfQ1XrKypvL
         thhaRaIUpfonU+IFaTeReobqjuotP8c5EtngclUeWKbpf/7ydNw/zTbybssImxwh9Msw
         cnMhV+ZNYlg8FgtKGXAntdwb8z6HWQ8Ii7IcU6ZiR5OnCRvXUBTvpkLfsM6OgcKlLB5+
         DArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881164; x=1792485964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPMzbv/4wi4ODfA9XRSPX8ue5WbPDcJwnRMdAkV9P04=;
        b=dNisJU5fjrT3lrai7IpIk4hzim+ylF74hyezJLwmirvcerwAOYEq9xFLcqqdxcsoXW
         b/UkqK57jiaU0sQpSgPbU9jwG4Xs6YzJqFpDYWE8BpKwjSwzvmMirgV7ZNjk3QMhUy7E
         SVJtwWzyLA341XN9ow+9bOh5dpP9qQsLZBZPc99DpUZ3QOqJWhJ1SKbJkggmmD2FcIxU
         io2HrFBtSs0JiPDOfyuuVgn8unyF9v+EEJK8Wr4OJeDQI9DU2kZ2yIqDE0gTTmDwN4WR
         vkVYvWv/l6NK9VJxbyCROjeslMTPFQ0gLlNuw2C3UhuYo8HPKHv/ouHMEaiRjNd6dFjE
         Nogw==
X-Forwarded-Encrypted: i=1; AKwUvBw851X1NfFQe6limxluWhuZU05qHWRlDElMWoFLDQhiA/9HWG5SBqs9khKxRfipxFaoRHDqpTbK/yrQeuo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHgqJ0cGdTkfnzAzDr5LbvyEoZYnxnfEhV/mWz2rq8utp5Dfsr
	SGtNxu494ZLf7krqWlrhYSjeFovtiAujbDChrmNCpyUV08ByllpRfTVO+z/OaCHJnAddrAY1C6C
	KFJRTi4BjoNZsXeLkP4oE5uCIHxvJAOSv+ZwxnqPKAB3lBi3hGg3rXB77wUJ+GRu9Qxth7nZGUr
	4=
X-Gm-Gg: AYBFou1i0jOzg4SvctKqaTBAWCClY9iPzSqzEtUnAjrmga38aeIJXKvWww5GvOzQ+on
	YoXUWN0Rk+ntfhQt7YWwSYkbVt+8SDwaXfbAErqVEm14uve34CdGp8ZeVq3OjqXDuBfZd0YIF44
	2euJSFn5H1S9bhSjOYhMPyiHssD6CCPbTa9vVwzEyKa80X+zQFyZhMLoCTaQvczYuNPhBzMbs3e
	r+SknvnElMWntevoY9hK+XeX0Z9Yw28ZjyFcsD3jPS32rbi0vMwEmGESVyxREZRbg6jR/UH24zh
	EVAsKBxx8Vx7ZIeFqGeOd6JnFLBQAS6RDsz8Ad1uPQKB7mT6Ze1KELRPefs0ZcBKtLUs/+SRk24
	H6hVI1qlSJ0CJkLC/x4wuIfys0LJi
X-Received: by 2002:a05:6a20:d80f:b0:3de:5a86:9dca with SMTP id adf61e73a8af0-3e16bd92915mr11238298637.19.1791881163638;
        Tue, 13 Oct 2026 01:46:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:d80f:b0:3de:5a86:9dca with SMTP id adf61e73a8af0-3e16bd92915mr11238257637.19.1791881162540;
        Tue, 13 Oct 2026 01:46:02 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da0596f9sm5384721a12.31.2026.10.13.01.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:46:02 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:15:35 +0530
Subject: [PATCH v9 4/7] bus: mhi: Add QDU100 Sahara variant and firmware
 fallback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-sahara_protocol_new_v2-v9-4-dc9f24357c4a@oss.qualcomm.com>
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791881139; l=5671;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=D6ORrR4WZCXe337DEAaoy6vLh2qom8bYpV8ibq3sUAI=;
 b=cEwEItZ/aATGDCtMC/IMrT3jaZb6dpHYBZq2vC/waUlcZ7wIK+wlAP4SywG/I48UQvIQC3YhZ
 pxVgVNGofNQC2mKIdvz7xAIDhtzAaM55jywh9knYnFS9wci/wTYMkp9
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: 8g8-5uFTp2cb01bWce87lmQ1OMqANhLM
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6acdefcc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3TBL8zyTcm-CCHetwZgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX8A7QHKsjwJdX
 KPruCNRqeXOyqqHmK6K3KRzj6FKHZ2rh6mCvx6+oLz3RWHivN0O92q0aLK3X2GuiA2ofGr/Mm6X
 3fKC1tXBcN04pzA9UoPQ5UNXc+q8eLE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX8+StlzYsPRWk
 20GxapIMQ68yGFsKmq04RPvOXc3gS2LFbZhAylcHm0kR4lPidhCIsF6GdPJ1IWnz761Lde1C6PT
 aif/gLECNS7S10Vm4BWXj6VisFsbTMQxNPpMFAZP24WfyE2MccspTXA4OTyu+Cr3n1C2PuigV66
 b2dQX8NmnRuTY6MPWSLHhOkGXzoNbkdfF7uOLGKNc84evgCQa6O1r/rKlGgxEx/R7QG32scXPnS
 mng7GFCDQN5vdoxXXpTMiDgzHT48cIWK94fVU5djSJS1J13Q3mNg6lTuv9jXys4q5yDFxqjMYn9
 k13rI/YHzAKv7Sv/ko7nJFh4cKSNRUwnbGVXxbjYr1Gejgh9y/eHj3UjKzqsUEUWbsI8mHYaEYJ
 Zjoakvl9/vNxNKStl8ju3VjMvLjXfNeUvPYox+SaXmb6Gdh0mCSriA6gA+3ZOmBwHWYFFB6WJv0
 9j1XcCaDNEAcB+ab2jw==
X-Proofpoint-ORIG-GUID: 8g8-5uFTp2cb01bWce87lmQ1OMqANhLM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130034

The Sahara driver currently selects a firmware image table based on the
attached device, but it does not recognize QDU100 devices that expose the
protocol on the SAHARA MHI channel. As a result, the host cannot associate
QDU100 devices with the correct firmware namespace during image transfer.

Extend the probe time variant selection to match the SAHARA MHI channel and
associate it with the QDU100 firmware folder. Add a firmware lookup
fallback for cases where an image does not have an explicit entry in the
device's firmware table. This allows required images to be provisioned by
the platform.

This change only affects devices matched on the SAHARA MHI channel and
does not change behavior for existing AIC100 and AIC200 devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/clients/sahara/sahara.c | 27 ++++++++++++++++--
 drivers/bus/mhi/host/pci_generic.c           | 41 ++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index ce4fcbd40baa1b3a3d65d0d10fc9e54b1c7eb04d..a4b3ef197b303cce5a36cbeda272119f0430e619 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -188,6 +188,7 @@ static bool is_streaming(struct sahara_context *context)
 
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
+	char *fw_path;
 	int ret;
 
 	if (image_id == context->active_image_id)
@@ -200,8 +201,28 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 	}
 
 	if (image_id >= context->table_size || !context->image_table[image_id]) {
-		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
-		return -EINVAL;
+		if (!context->fw_folder) {
+			dev_err(&context->mhi_dev->dev,
+				"Request for unknown image: %u (no fw folder)\n", image_id);
+			return -EINVAL;
+		}
+
+		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/%u",
+				    context->fw_folder, image_id);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = firmware_request_nowarn(&context->firmware,
+					      fw_path,
+					      &context->mhi_dev->dev);
+		kfree(fw_path);
+		if (ret) {
+			dev_err(&context->mhi_dev->dev,
+				"request for unknown image: %d\n", image_id);
+			return -EINVAL;
+		}
+		context->active_image_id = image_id;
+		return 0;
 	}
 
 	/*
@@ -869,8 +890,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {
 	{ .chan = "QAIC_SAHARA", },
+	{ .chan = "SAHARA", },
 	{},
 };
+MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
 
 static struct mhi_driver sahara_mhi_driver = {
 	.id_table = sahara_mhi_match_table,
diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 7193a384cca477be9e4f48cdf5f67e680ef55fc5..dcd49cd15074a20cab62a304143abbd0c0614cec 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -47,10 +47,12 @@
  *		   of inband wake support (such as sdx24)
  * @no_m3: M3 not supported
  * @reset_on_remove: Set true for devices that require SoC during driver removal
+ * @sahara_fw: Sahara firmware mapping
  */
 struct mhi_pci_dev_info {
 	const struct mhi_controller_config *config;
 	const struct mhi_controller_config *vf_config;
+	const struct mhi_sahara_fw_table *sahara_fw;
 	const char *name;
 	const char *fw;
 	const char *edl;
@@ -287,11 +289,49 @@ static const struct mhi_controller_config mhi_qcom_qdu100_config = {
 	.event_cfg = mhi_qcom_qdu100_events,
 };
 
+static const char * const qdu100_image_table[] = {
+	[5] = "qcom/qdu100/uefi.elf",
+	[8] = "qcom/qdu100/qdsp6sw.mbn",
+	[16] = "qcom/qdu100/efs1.bin",
+	[17] = "qcom/qdu100/efs2.bin",
+	[20] = "qcom/qdu100/efs3.bin",
+	[23] = "qcom/qdu100/aop.mbn",
+	[25] = "qcom/qdu100/tz.mbn",
+	[29] = "qcom/qdu100/zeros_1sector.bin",
+	[33] = "qcom/qdu100/hypvm.mbn",
+	[34] = "qcom/qdu100/mdmddr.mbn",
+	[36] = "qcom/qdu100/multi_image_qti.mbn",
+	[37] = "qcom/qdu100/multi_image.mbn",
+	[38] = "qcom/qdu100/xbl_config.elf",
+	[39] = "qcom/qdu100/abl_userdebug.elf",
+	[40] = "qcom/qdu100/zeros_1sector.bin",
+	[41] = "qcom/qdu100/devcfg.mbn",
+	[42] = "qcom/qdu100/zeros_1sector.bin",
+	[45] = "qcom/qdu100/tools_l.elf",
+	[46] = "qcom/qdu100/Quantum.elf",
+	[47] = "qcom/qdu100/quest.elf",
+	[48] = "qcom/qdu100/xbl_ramdump.elf",
+	[49] = "qcom/qdu100/shrm.elf",
+	[50] = "qcom/qdu100/cpucp.elf",
+	[51] = "qcom/qdu100/aop_devcfg.mbn",
+	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
+	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
+	[54] = "qcom/qdu100/qupv3fw.elf",
+};
+
+static const struct mhi_sahara_fw_table qdu100_sahara_fw = {
+	.image_table = qdu100_image_table,
+	.table_size = ARRAY_SIZE(qdu100_image_table),
+	.fw_folder = "qdu100",
+	.non_streaming = false,
+};
+
 static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
 	.name = "qcom-qdu100",
 	.fw = "qcom/qdu100/xbl_s.melf",
 	.edl_trigger = true,
 	.config = &mhi_qcom_qdu100_config,
+	.sahara_fw = &qdu100_sahara_fw,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
 	.vf_dma_data_width = 40,
@@ -1426,6 +1466,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
 	mhi_cntrl->mru = info->mru_default;
 	mhi_cntrl->name = info->name;
+	mhi_cntrl->sahara_fw = info->sahara_fw;
 
 	mhi_pdev->no_m3 = info->no_m3;
 

-- 
2.34.1

