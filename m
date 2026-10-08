Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E083C5DA6
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440658; cv=none; b=UGhdloXXFPgsMkqfSsvWTRE1Lt0M3lTS0PWINYPg+YJHrArgrntED/pJJB0oNGZmapgqNUOhnhnmBsUaUUaL57zEOJ7YsdzkZDVcxuv3xgkHedM4R609IoaPe/10IlUbUsTDdcZtApePzNeTg4kIf3sbCygCiHMW9ZRU9LVw98o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440658; c=relaxed/simple;
	bh=ZaqDfyw09JWl1bCHSkMhDsGYhH9DzyYO3h9kvzfqJ9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dKrrj6iXBDdM+xPr3ycNoAvaOquInqEzLp+2LnRpzTwjSIQUuxsIu91c6iM0Q5wHocCDnSxHOgxDb00Y4byxrV7anubSzbV/YxBtKxgxJ62vMfh11b/l7+PX5Hrgd1MLMNJre2+1re0tDLMYZmy/a3nTeGEcqxPlSSffhVgyQm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GB7hGEJL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HItSmZqv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GB7hGEJL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HItSmZqv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BYg21654215
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M10+H3mdfMfIIvSdDU1YuzpojPnarWy7fgHcTZ+8/Ms=; b=GB7hGEJLkusTnjJa
	j+tnf0TwsyDF8uraBMAHXJNUdSAj/nPGbWhkIC13vxpgQGzCyPuTH4cDHcJnBFYW
	0DiplTwRgOlhJTl8sb/bT1tj3hOpg+V2LQo95NynNVhmb+g5Pyrk8x3oGakmOZI4
	B98+JIxsDnmOayQtFEDg0JJLhH3X/iKkPJCOxHtBv5Df/sHQEIli30uWGnRAtLwe
	dPppwx0wLgqK8SGp+m7U1ctOVqZyZ4OHKs10Xr6XrrtW9MwVmy+n1h0aatlKx2k1
	Q/AEnFa8Kez/5x0uCpl7d2h7XHb2lcihsOEEg4fWfHJC4qww44YDgUzmpmaLIyNR
	OL2tHQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3hem5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:24:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df7bc60df6so34588005ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791440654; x=1792045454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M10+H3mdfMfIIvSdDU1YuzpojPnarWy7fgHcTZ+8/Ms=;
        b=HItSmZqvVx5dCbOKl8uRCtw9JFFx6xqn2iTImXuqMthFp3PlS+JT6wqWlQsX6wvMBf
         x9qAYwTQIy+b1gqzNMZqWttH2S5zUQo3wVvkjmDcRRQdtZ9UiDggwGKibmLxtoOXiZq6
         JGKOs6EbhyCeNvs+gf5BvImJ8/64FmZwt2Coggx+8F2h0tY7KRQ8wFcVPHhD5x/MfqVj
         2ELn3P7BQXOGym33EXV/isHtLoFnPk1Aw1Wcyjvq7+itHj9QL8qlGD5Ll8AuTQGqLUs8
         1NH2Sbysw0YCD9+llb+/xSf+yBy1KigQTkXU5egN+eKCCyu+Z4SM76nNSV2kIioSRLR+
         83XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440654; x=1792045454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M10+H3mdfMfIIvSdDU1YuzpojPnarWy7fgHcTZ+8/Ms=;
        b=yQHjFiK/mLW6MlHBTMsg8Cl1YBCeettCH1PX5JrZ0+pcglMIaRKO5kpG2WxCTY8Kp6
         L6rPY+i6FjNR0PAFnfG/cjBLFajA/dvtZPU5h+p/rPK36kOFu4AuDK9v+hy+tDVi83jw
         OLlf4fcHTu48idq7kIkqdeIxTjlaV+bs51kBLH/kx9XFzuRMYdbS0O5pmmkOx5WHFnbf
         oqYBqN6uQAWkwCqOJaf+TwQigGxSCn6WNlAr8QVL4iZCjluPhJpx4LCjEeA9kbQrps5V
         Kr+IAeit7SlyVZQQSeDJwpBcsnk2tzakYPLS9gZzK46SUjulfCq+pKfM0fK1EP5Gk739
         ILqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdWpSOiHDNClUoSWN7bpjkFEzVOLfFx1u98kp+nzCOX66UrmFu6HxYNdGTWEcImoG4W/lQkV7F/bcp54k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDeDzeb9Dk+uevSGw/ccZRWio7HQQpX6++HgIjsRh12rpMtlUt
	M1ZQyTs6O4x334ng9kWNzd2CxdVxmlOUHWHWjlKwjn0e3opJVgUM+rndaPhj8Ovb1VEZKfc2hmP
	M5wY85pLTMBZgeM63CEAYHxwP3gKDGY2f5PojxKxmGWvPfle+1gOGDqgo/DhQrgSIz0M=
X-Gm-Gg: AYBFou3ncQlQ2Hb0TnhHE4I8+5zHxuj2VdEo27q48dcne/QX0uVdSRVltBpTTPy9E4a
	eSeoTqFeIcpeJnhzllG1cXT7eWM8p3TvkaUDbWSAxGVRB8fe3pAXpBHJx5EDmdXyee+MMVyiGdW
	jbN3Gwcd5PntN4a+ysjj3zu3xLYF2L8JcElrT+uP9aqJbgM/RiCWCX6zLihGJaKA+lxGbiplRJ/
	vumFz1N0J6IFFlypO8JRe4MsCPv2V4zeuGUYKzixBkYIqhUhdlJEeuQQlMDYTPcAF3AjbjabZLp
	f6sOo2o1elbeuxhbVS8IXji6yKoahejd/6orb/9Xn+jwu9eIgK4mIQi9qnOJfZ3uEsEuZCuMIza
	RFzBuheEKYIHtIsyCv2akjCFo91V/
X-Received: by 2002:a17:90b:2e46:b0:3a4:b8dd:1447 with SMTP id 98e67ed59e1d1-3a8a1aeebfamr3335959a91.34.1791440653940;
        Wed, 07 Oct 2026 23:24:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2e46:b0:3a4:b8dd:1447 with SMTP id 98e67ed59e1d1-3a8a1aeebfamr3335948a91.34.1791440653451;
        Wed, 07 Oct 2026 23:24:13 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ab034sm2767618a91.4.2026.10.07.23.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:24:13 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 11:53:48 +0530
Subject: [PATCH v7 4/7] bus: mhi: Add QDU100 Sahara variant and firmware
 fallback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-sahara_protocol_new_v2-v7-4-90d278bd7414@oss.qualcomm.com>
References: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
In-Reply-To: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791440631; l=5713;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ZaqDfyw09JWl1bCHSkMhDsGYhH9DzyYO3h9kvzfqJ9s=;
 b=LxkYNz96eXwqjouBL1LaEkPJaxPXcu9+uugL3BStFlS2Sc2cgjoHWimGZMm8CP+u2d+p9RWVh
 FHTG1ZeH1ahCQMdi3R5OftUF5E1g48WmwUw9dTXxad8pk6uBJZbNFVl
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac7370e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3TBL8zyTcm-CCHetwZgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfX9LUJC8aDpObY
 k7xtpz4Qrgfks9M6BXL0VyY7wGeIEdcoWoKrYjdKauKPKURmEyEZdcx0I/B/7xfYer+1dRbZzjh
 F+22b3z5cXmYtw6y1Qki/MOM5hzaYWY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfX6t3+OI9pyF6b
 kjJhJv2d9+hamyR0PWfG+EITbhliu3eLxmyuDlKQfa/bep8PPID86dFXaNGR1kR3YHt1m0RZH5Y
 8fVpc3wP1aW09YuxHeLdbiz3sVTJ+LdIVn1A1MBcrSKZ1Zd9hcEV8z50CWmubJ7efMrV7SehLYz
 ZyLwp/tsOWbqcApELgiQrv884FhZtXUHlOrJks+zpQA4s1RUlG/nw5+aNbG4iQxQ89S/03McxzH
 zGrq1otAfyGukBlpvMrLT7b2PM+gQqGWsklqbBKwtU/SBHTdKNS9kB9OQ7nzNPTB4XilhgET/X+
 zLrDNs7+KcuWsIrs3n8ZWjdWIUp1EAsVIqTUUw62A3lGVEHCDlZSqQwcTXLbyR6S0bSUa9m5uJZ
 ZjewIdtWDEgMI6lE0UPvJ4pWDrwGKzJW4YKEa03wSkub7t4Lgnq9jqvZIdUFFpay4ZlM3qI8/A8
 wfobwmLTMUwWN8TKOCQ==
X-Proofpoint-ORIG-GUID: A5A4jnZg3zwglGc0U6zOfoTXnLNaLS13
X-Proofpoint-GUID: A5A4jnZg3zwglGc0U6zOfoTXnLNaLS13
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080025

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
index e339c67e236af271645ca81cc517efd9eead87e4..7fe5158c17e9814f50b2065202a629eb10a742a8 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -189,6 +189,7 @@ static bool is_streaming(struct sahara_context *context)
 
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
+	char *fw_path;
 	int ret;
 
 	if (image_id == context->active_image_id)
@@ -201,8 +202,28 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
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
@@ -870,8 +891,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {
 	{ .chan = "QAIC_SAHARA", },
+	{ .chan = "SAHARA", },
 	{},
 };
+MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
 
 static struct mhi_driver sahara_mhi_driver = {
 	.id_table = sahara_mhi_match_table,
diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 391ab146f501c6ce1c81f6138f7c491a49c2f264..3f8a01ea2f7d52331c4db0f2c0b8658650e2eab6 100644
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
@@ -1376,6 +1416,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
 	mhi_cntrl->mru = info->mru_default;
 	mhi_cntrl->name = info->name;
+	mhi_cntrl->sahara_fw = info->sahara_fw;
 
 	if (pdev->is_physfn)
 		mhi_pdev->reset_on_remove = info->reset_on_remove;

-- 
2.34.1

