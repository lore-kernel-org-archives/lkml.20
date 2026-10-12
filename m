Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535E14D0CC1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829110; cv=none; b=mkNCuvSQ5xvLP/I7kCFdQ6yRQrGy+HJ95kCLWp38xN6E8W25p1uLTvXsg53o3U5QXXuDBKBkn0WW9xIfNDarGgV007bDxYZ/yikggYyZPfc8Vg5vCEaSXR4CqJrvrISkCvIb/rf/fOKdOk1Jwpbm4moTVvMwRVA4Lc9cPd+2NUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829110; c=relaxed/simple;
	bh=ZtZ6u+DRu7HtGnSn8MYFTYGuqWBEm+LcrAFnqwamhXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gHojl4txNp8OmNZESb66gI0SU3vIyjo92hBABFelF6CEIkjapJYziWfGcdvcWxR8oC3TxYgXbQK9PXbctCUU3t6cZiKmtzdpa/98KxbnL+MSeG2MCTGY06LJTmKn8ARTt/cH2xhKya2N9RAh283VI9qO3k4ah1gh7sGqXBPiuUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJNPNYbE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aK0YPdux; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJNPNYbE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aK0YPdux"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHv2pB3573462
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a21CXdr0TVN/MkDPeYS8OA9CRqpA5gzmbpeFwPwg8Ec=; b=RJNPNYbEDiwh+LU3
	Gg/AzqILPsJnnlf4PuWc1gFQsjFNewwQdv4CyjFuXBY+13fZhtMDMvYr1DK62DlW
	6jZUI6EpY8JVnke73A5MTy222pNVMTPyv2q9xDbK8rJ+1tC6sxktDWDrd3vTFlMu
	vdZxf7ek2xsD3AWGZXSKeQf8hUEeelYEFz4U2CsGJaQMECMERh8b1P76YVdyTjzS
	FgtrWwkiKTFiqmCA5phuVyZLCUXhW9peny+lt8lc47nQXyg20YrSRmlVIfgX2OpI
	bU0aJCqqwn0WoP/IZbsLV2VMlGvF2wpAQJq6IMk6uOVfoq1blEv/th1rNmamJBHH
	6zK2QA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffj5vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:18:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35b68bc1985so814527eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791829107; x=1792433907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a21CXdr0TVN/MkDPeYS8OA9CRqpA5gzmbpeFwPwg8Ec=;
        b=aK0YPduxIZN6ro5JjLv3RX+rHYm+CNda/KnruTAig44px2v+Oets9/jAH3NJMLjI58
         dJiCZPl0eqU7AZB47ItWrJEXYFxo7Uqc5HZ/uw2GLt8ABqrz7i3ReLkQqtvaPSqhzrDO
         prui7PkaYvPlSZBmBijyic1ExSedm+7SyVhGK9WRtSJpACSHXPlzC1TV04RheiEB05oV
         PVDRLYGNtZsJA8OBzn9ofLN7VOlO670nX3wcXRnVLD5/HwbBpejuXDb3Py/nKPBzX5Zd
         HlNSPq4M/eFCSzoD7ka/nozcWG3bN7Ce3HEk75nTxyZuu/XjJA/Khj93CY81t0RkwZMx
         9LKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829107; x=1792433907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a21CXdr0TVN/MkDPeYS8OA9CRqpA5gzmbpeFwPwg8Ec=;
        b=Y3oNRw3pBaNgmx/xGWdOmPndLSC3LfD6snXehTnkS+84B/hFPBEznFseDft523wrl+
         hMx7tOAmMaZoME28mi5oMGoZ4/DkLofxAxork6B2Ff/9+EOAP+RGa31qYM+vMp6HaNRb
         6vHoxfV21K9YaMLBVG/LxNuiV2DcWyLcWNcvVSIakyv15/D1+s4GfBJ6iUnUi/Bthmx1
         yV9KN6qJGfRrrDn9dQoSpgL1l+Uq4Ng6VadPmxI8IAY+9W2gixHuOf75xRHczhQtXwTa
         01gk9LFY0aztghvfpC18vzsdwEI3ebLjikVGH/CuOWTlu+hH7CTuCWbKJO3NDzl1+Axh
         JXIw==
X-Forwarded-Encrypted: i=1; AKwUvBz9/8zsnJVAHStpiAb9QeMv1e1f/uC+liYVb39RudI397pqjAtJ4a/sg7jZAj7aSDpo6INqb1n2Gp+IfvI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWYcdovMaienXvnMso2WC0ORR2BPCchzFAXRj/kBiE1netfee4
	EGeMVsf4e9UOoCpqR2SKo8QWviWHJen10ESlWQ2Ql1RVYyZg5Ng0t7pfokwhwLGIKdUdtipkHRk
	bxgWseeFjTLO6D8PfSd6l5iLRUAZE9O/LBnbwMhGwmn2FQc3ZBMVLrHpmF8o4AOEARyw=
X-Gm-Gg: AYBFou0MA85X/yohu2qVK0XxyMOhc+ZdQOr53ZWR+47kPBFVvC1nJL2e0HExkREjmQA
	YLpzC6X8I1Flx6TtUxh0JfFgN/04ifmFXPo+9G/2aWQZoyOWDZIeeJrJ1Ieu70mINL6zpKJbIsu
	ZQtbmLjdL8Whh9bGlDp019Zs7ECO2h5R/ncU7aM6+J99yJTr6/MLPodFxEg7SZ6OaOjEvHnXYCh
	lUqdNjDeSWfpdls+n9UmvjGd/u+1Ul21C0qjk/120yvhhHLxM97LQWxuM5PnuLo+MFmHQwLIxMN
	Ji21ixlSxih1zctK1WJ8jZsV7hEB/G5Sh63lLb1hsyEF1/8ZXymWgBKKawmg0Rmw9LCzjORfPPi
	gBB5Q0q0Roeq9xVcQi0wuoLucgPqE
X-Received: by 2002:a05:7022:3b8e:b0:166:fc9a:11b3 with SMTP id a92af1059eb24-16a1206fed8mr15088041c88.12.1791829106994;
        Mon, 12 Oct 2026 11:18:26 -0700 (PDT)
X-Received: by 2002:a05:7022:3b8e:b0:166:fc9a:11b3 with SMTP id a92af1059eb24-16a1206fed8mr15087908c88.12.1791829104780;
        Mon, 12 Oct 2026 11:18:24 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm22827311eec.31.2026.10.12.11.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:18:24 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 23:48:01 +0530
Subject: [PATCH v8 3/7] bus: mhi: Centralize Sahara firmware image table
 selection at probe time
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sahara_protocol_new_v2-v8-3-e12939d229a1@oss.qualcomm.com>
References: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
In-Reply-To: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791829086; l=8671;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ZtZ6u+DRu7HtGnSn8MYFTYGuqWBEm+LcrAFnqwamhXs=;
 b=6itkh64ThW6+pfLMUuaUqc9NPEi6VPZWJcO0Y1CuAsqnrXwtH3sJFh7mZMrw2y93zC8mfOIf3
 53QEPLu6qPjA85xpzUM1pc99nRv1o7M4S7wjoHA9uHsx/PwzrlRHost
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfXzl85lrr5SQm6
 4xETvkzb88Kc8IH2aZS+fizY7IBATGMsVRA962WvniKLSa8rTJqrlNkrb++GIndVDvNhv7LvKEr
 997glMGyLNW2iD5+ohE33iZ0BDGKNge6f1mNNGdtlIRIACG3riyiGo2j1emXGlL0VXffIMSv+cN
 ardzqu3CgcSTboyRqFXYxnxk5rJBnil/jZjjd0bqQ48I3HCo3+/+gwYllMhUHJT2xZGiJhiQGVh
 r3/n+yDiPrYcX4AbbuUiix/CMZ4zYo2VL/UqUwaoXH17yeS3awycb+HZE4f0dUJeXQRww4ytWlf
 HzIq/fw05Wct7gp0VUOEcX3FAo8ycgo0w0BgUPUCyu/PZfqOhDxrxgm3VPmNJT7jYHuoY3Z1li6
 RHUg7EvUtfJyj2YnLyKi9HuZPjPYFrem1rjvmXBSY4ENkSjYBc/MjZaVtJ9fmSXeyJsJ5M7iUR8
 3ECDWIMXxfHhN6gH5ng==
X-Proofpoint-GUID: 1s4QZb3Z7wbr3OwrUYLAqcWrWgOV5RLS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfXwuuHfsE/23h/
 RMJA3LJXfLiKHRZ8f04rE7EW9Sc7LZuwDQoBIJfZ2grp4HO+4+3croEMeA5nsZLZjyREI4vWOQX
 7n2IUWCJfAUgK9x2S3wHhF0rhImgFeI=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6acd2474 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FaWmrOfgj8M-bvBoqZ0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 1s4QZb3Z7wbr3OwrUYLAqcWrWgOV5RLS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120072

The Sahara driver currently selects firmware image tables using scattered,
device specific conditionals in the probe path. This makes the logic harder
to follow, harder to extend for new devices, and spreads device knowledge
across multiple code paths.

Refactor firmware image table selection into a single, explicit probe time
mechanism by introducing a controller provided firmware mapping table that
captures device matching, Sahara image tables, firmware folder names, and
streaming behaviour in one place.

This centralizes device specific decisions in the controller driver,
simplifies the Sahara probe logic, and removes ad-hoc conditionals while
preserving existing behavior for all supported AIC devices. This is in
preparation for adding QDU100 support.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/accel/qaic/mhi_controller.c          | 61 ++++++++++++++++++++++++++++
 drivers/bus/mhi/host/clients/sahara/sahara.c | 60 +++++----------------------
 include/linux/mhi.h                          | 17 ++++++++
 3 files changed, 88 insertions(+), 50 deletions(-)

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 40e6d262ef217aad8ddff6f69a38388ef683e3ed..dd320739c07ad4a35b74446e32f0e8e64e847d16 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -20,6 +20,62 @@ static unsigned int mhi_timeout_ms = 2000; /* 2 sec default */
 module_param(mhi_timeout_ms, uint, 0600);
 MODULE_PARM_DESC(mhi_timeout_ms, "MHI controller timeout value");
 
+static const char * const aic100_image_table[] = {
+	[1]  = "qcom/aic100/fw1.bin",
+	[2]  = "qcom/aic100/fw2.bin",
+	[4]  = "qcom/aic100/fw4.bin",
+	[5]  = "qcom/aic100/fw5.bin",
+	[6]  = "qcom/aic100/fw6.bin",
+	[8]  = "qcom/aic100/fw8.bin",
+	[9]  = "qcom/aic100/fw9.bin",
+	[10] = "qcom/aic100/fw10.bin",
+};
+
+static const char * const aic200_image_table[] = {
+	[5]  = "qcom/aic200/uefi.elf",
+	[12] = "qcom/aic200/aic200-nsp.bin",
+	[23] = "qcom/aic200/aop.mbn",
+	[32] = "qcom/aic200/tz.mbn",
+	[33] = "qcom/aic200/hypvm.mbn",
+	[38] = "qcom/aic200/xbl_config.elf",
+	[39] = "qcom/aic200/aic200_abl.elf",
+	[40] = "qcom/aic200/apdp.mbn",
+	[41] = "qcom/aic200/devcfg.mbn",
+	[42] = "qcom/aic200/sec.elf",
+	[43] = "qcom/aic200/aic200-hlos.elf",
+	[49] = "qcom/aic200/shrm.elf",
+	[50] = "qcom/aic200/cpucp.elf",
+	[51] = "qcom/aic200/aop_devcfg.mbn",
+	[54] = "qcom/aic200/qupv3fw.elf",
+	[57] = "qcom/aic200/cpucp_dtbs.elf",
+	[62] = "qcom/aic200/uefi_dtbs.elf",
+	[63] = "qcom/aic200/xbl_ac_config.mbn",
+	[64] = "qcom/aic200/tz_ac_config.mbn",
+	[65] = "qcom/aic200/hyp_ac_config.mbn",
+	[66] = "qcom/aic200/pdp.elf",
+	[67] = "qcom/aic200/pdp_cdb.elf",
+	[68] = "qcom/aic200/sdi.mbn",
+	[69] = "qcom/aic200/dcd.mbn",
+	[73] = "qcom/aic200/gearvm.mbn",
+	[74] = "qcom/aic200/sti.bin",
+	[76] = "qcom/aic200/tz_qti_config.mbn",
+	[78] = "qcom/aic200/pvs.bin",
+};
+
+static const struct mhi_sahara_fw_table aic100_sahara_fw = {
+	.image_table = aic100_image_table,
+	.table_size = ARRAY_SIZE(aic100_image_table),
+	.fw_folder = "aic100",
+	.non_streaming = true,
+};
+
+static const struct mhi_sahara_fw_table aic200_sahara_fw = {
+	.image_table = aic200_image_table,
+	.table_size = ARRAY_SIZE(aic200_image_table),
+	.fw_folder = "aic200",
+	.non_streaming = false,
+};
+
 static const char *fw_image_paths[FAMILY_MAX] = {
 	[FAMILY_AIC100] = "qcom/aic100/sbl.bin",
 	[FAMILY_AIC200] = "qcom/aic200/sbl.bin",
@@ -871,6 +927,11 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
 		mhi_cntrl->name = "AIC100";
 	}
 
+	if (mhi_cntrl->name && !strcmp(mhi_cntrl->name, "AIC100"))
+		mhi_cntrl->sahara_fw = &aic100_sahara_fw;
+	else if (mhi_cntrl->name && !strcmp(mhi_cntrl->name, "AIC200"))
+		mhi_cntrl->sahara_fw = &aic200_sahara_fw;
+
 	/* use latest configured timeout */
 	mhi_config.timeout_ms = mhi_timeout_ms;
 	ret = mhi_register_controller(mhi_cntrl, &mhi_config);
diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index dc64beae06ada6915a506ed8f4ae4d71c03158bb..74bf57f02873e463d0c2cfdd2673237840169df2 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -179,48 +179,7 @@ struct sahara_context {
 	u32				read_data_length;
 	bool				is_mem_dump_mode;
 	bool				non_streaming;
-};
-
-static const char * const aic100_image_table[] = {
-	[1]  = "qcom/aic100/fw1.bin",
-	[2]  = "qcom/aic100/fw2.bin",
-	[4]  = "qcom/aic100/fw4.bin",
-	[5]  = "qcom/aic100/fw5.bin",
-	[6]  = "qcom/aic100/fw6.bin",
-	[8]  = "qcom/aic100/fw8.bin",
-	[9]  = "qcom/aic100/fw9.bin",
-	[10] = "qcom/aic100/fw10.bin",
-};
-
-static const char * const aic200_image_table[] = {
-	[5]  = "qcom/aic200/uefi.elf",
-	[12] = "qcom/aic200/aic200-nsp.bin",
-	[23] = "qcom/aic200/aop.mbn",
-	[32] = "qcom/aic200/tz.mbn",
-	[33] = "qcom/aic200/hypvm.mbn",
-	[38] = "qcom/aic200/xbl_config.elf",
-	[39] = "qcom/aic200/aic200_abl.elf",
-	[40] = "qcom/aic200/apdp.mbn",
-	[41] = "qcom/aic200/devcfg.mbn",
-	[42] = "qcom/aic200/sec.elf",
-	[43] = "qcom/aic200/aic200-hlos.elf",
-	[49] = "qcom/aic200/shrm.elf",
-	[50] = "qcom/aic200/cpucp.elf",
-	[51] = "qcom/aic200/aop_devcfg.mbn",
-	[54] = "qcom/aic200/qupv3fw.elf",
-	[57] = "qcom/aic200/cpucp_dtbs.elf",
-	[62] = "qcom/aic200/uefi_dtbs.elf",
-	[63] = "qcom/aic200/xbl_ac_config.mbn",
-	[64] = "qcom/aic200/tz_ac_config.mbn",
-	[65] = "qcom/aic200/hyp_ac_config.mbn",
-	[66] = "qcom/aic200/pdp.elf",
-	[67] = "qcom/aic200/pdp_cdb.elf",
-	[68] = "qcom/aic200/sdi.mbn",
-	[69] = "qcom/aic200/dcd.mbn",
-	[73] = "qcom/aic200/gearvm.mbn",
-	[74] = "qcom/aic200/sti.bin",
-	[76] = "qcom/aic200/tz_qti_config.mbn",
-	[78] = "qcom/aic200/pvs.bin",
+	const char			*fw_folder;
 };
 
 static bool is_streaming(struct sahara_context *context)
@@ -796,6 +755,7 @@ static void sahara_read_data_processing(struct work_struct *work)
 
 static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
+	const struct mhi_sahara_fw_table *sahara_fw;
 	struct sahara_context *context;
 	int ret;
 	int i;
@@ -808,14 +768,14 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	if (!context->rx)
 		return -ENOMEM;
 
-	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
-		context->image_table = aic200_image_table;
-		context->table_size = ARRAY_SIZE(aic200_image_table);
-	} else {
-		context->image_table = aic100_image_table;
-		context->table_size = ARRAY_SIZE(aic100_image_table);
-		context->non_streaming = true;
-	}
+	sahara_fw = mhi_dev->mhi_cntrl->sahara_fw;
+	if (!sahara_fw || !sahara_fw->image_table || !sahara_fw->table_size)
+		return -ENODEV;
+
+	context->image_table = sahara_fw->image_table;
+	context->table_size = sahara_fw->table_size;
+	context->non_streaming = sahara_fw->non_streaming;
+	context->fw_folder = sahara_fw->fw_folder;
 
 	/*
 	 * There are two firmware implementations for READ_DATA handling.
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 65e8a397cc50b89d045a242aa1164ea7fb8c9696..e1d12e8c1eb80945be6a6d0a5896d92ac221ab81 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -252,6 +252,21 @@ struct mhi_channel_config {
 	bool wake_capable;
 };
 
+/**
+ * struct mhi_sahara_fw_table - Controller provided sahara firmware mapping
+ * @image_table: Sparse array indexed by Sahara image ID
+ * @table_size: Size of @image_table
+ * @fw_folder: Firmware folder name.
+ * @non_streaming: Streaming feature support (optional)
+ *
+ */
+struct mhi_sahara_fw_table {
+	const char *const *image_table;
+	u32 table_size;
+	const char *fw_folder;
+	bool non_streaming;
+};
+
 /**
  * struct mhi_event_config - Event ring configuration structure for controller
  * @num_elements: The number of elements that can be queued to this ring
@@ -381,6 +396,7 @@ struct mhi_controller_config {
  * @no_m3: Device doesn't support M3 state
  * @irq_flags: irq flags passed to request_irq (optional)
  * @mru: the default MRU for the MHI device
+ * @sahara_fw: Sahara firmware mapping
  *
  * Fields marked as (required) need to be populated by the controller driver
  * before calling mhi_register_controller(). For the fields marked as (optional)
@@ -467,6 +483,7 @@ struct mhi_controller {
 	bool no_m3;
 	unsigned long irq_flags;
 	u32 mru;
+	const struct mhi_sahara_fw_table *sahara_fw;
 };
 
 /**

-- 
2.34.1

