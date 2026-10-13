Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0903B9D84
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881161; cv=none; b=sbfHhlq26BUF1gleaPtwDLID8jGwW2t3yz5D//aeTDkNQZp9NY9qoVqhh9hYSK7LcN6Q7YbuQuJKP+qgT/PWQovVTm4Y0F8b+rTXYDidfFXNd+KIPv5V+ti5b45hMJ7Z8ICn/6CR67qJMk+fPU6REXiTrs8kvoTfKHcKR5FCd9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881161; c=relaxed/simple;
	bh=5j9+3paXM74BA37EpHul8NySFWdjFa3+C/GAH89afRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z/crzOyqb4X9YXrgIpQghwsXb/n1WhaCTuqKb6OEvG98W0Du+t5N4aU8u9hPNDwu9xGQzYjTSwClk1/9VAGca6nKa9ARNG5iAJWh4XQ8aXGjFd6sunadXXYyN+in/J3osUaqY3dzNtYIZDHirXt55dmBr3Nu0768+mw821R7zFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VtSlW8AB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QVDjS6oQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtSlW8AB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QVDjS6oQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8Okj0989880
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vCxi905d9q4rUONhJ2dAjgP2sHgeij5B5kBfOhQZz7g=; b=VtSlW8ABWnQZ2BF9
	FwQkhjDB0Pi48ajtQA11LkcFTtdUu+llkYKRZzePjzg/KjTl6ezDG2SHazho6tBD
	77XVK6CVQdRIQDqc6lN/bypjZ1UCRSxayV2hOFjGXwcHr7e0o/9o8gAt9Y8Mb3bZ
	InW0I6FHwFX98X1QNnagNHy4rDi5l59Ny+IZIE/+xNeU7QiKsRiDtvUcREc4/crp
	M1/zfMo3jhv9QxiiHAnJg4mtQFcJc9CwcHJrhWmLlGap5tF4mrxJO1tIFS0JqSWW
	wal6shwo9xCId5NnZLVK36PlOrlMoj57xhFCz0zyp64S+VLkG9MUNFHVeX+hFxCs
	mXQ46w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hca0e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:45:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso3307478a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881158; x=1792485958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vCxi905d9q4rUONhJ2dAjgP2sHgeij5B5kBfOhQZz7g=;
        b=QVDjS6oQgiX60OnX+qyZtEhK55LVl6+rTlXwqmiKbnVdHMv4IC0yZD0PsbYSeAds/o
         p7KL6HUT6xofkXYAzy8xlLsFhQ6TzFJwC9hvT3WXRWZhGlusMl7zKvsbUqzbMEMeDFp5
         pzZk02R1DWWpMofXW5vyPNWwJXhIGJzncdcUaqXYxjJrcmNhcWb+itj7LHS3IA2SNRcc
         UjDPaW0gAAqq3MaCByeGydiT2HcfySISvjso7DYJXNXR0akcnds6xpY2XaspvbzzPA/O
         CfJ4S3HEkuTsE5+OBi/cfcOQKv6Ir+5dMp42URbvIQfh1A0UWou3RICQZtc2Mb2CyQNo
         bBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881158; x=1792485958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCxi905d9q4rUONhJ2dAjgP2sHgeij5B5kBfOhQZz7g=;
        b=WY36p6iC0YUuDTJo9JrrJiPxYcfyhyU+0V6EWNJ170ftEKpZE8/k/C7wXrrQ1V19qP
         vcVV/qdhHdLiyEmIbYaoyzYUVVFQiVWqqI+sTlD2tgWCdzbtPBL/QvJExKKxwdAyCLOU
         WiVNK5UBIMWUKIwLOg0LDnqC3mngDzaMzQpTCSehanA2Ln8Tg2pGg7NmLf6oUx719rfw
         BjrYWAlym4iP3lkjuSOl56MuKhWhgwfG9QaWRTKySBQLkA/GcjlI0bJ+4tB+8XHTaj8J
         brXbsV8G2Kv7KE5VbpPdyS+eW6L8XXqFPIKGiN8Uzl+FdThOmZ0LZP3T2OfAJ+KskNBB
         L46w==
X-Forwarded-Encrypted: i=1; AKwUvBwfImx2muO+hBSxksFmzoEA6NB8U016tFLzd6L8aylmS5GYce36iUWXaTBh9BFos0Yphbft097tS8LZmZ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrGBqzCVqREHwC6jbDLGFHpwdc/+yk1VLU/uPSnVkTCgKRbHoN
	Y4q3ZJTafMoeapJHu3I6f2KJS3b+ZJ5kqMlh1WFED95ENHCDeGXZVkkr6JzaHGrAx+Z+y89NbCR
	9nLLxzllb85N6fesa1XimsooO+kP6S5aPq+b780mMmKcsQG4A/EL1WGKgdGuLgZBMq14=
X-Gm-Gg: AYBFou1338CyMwEfGn5TT4nPsfa1fEuZmvcSNF2L5DJ+CR6gFrf/P8vKieRlNXGYdxQ
	+P5CpQ0lvPRh+I9ihwVBQwisEMtYedzLJoE/JcsZOyYu7ISY5IMJbNiwxYTp8u59Ii/jXt7EpMp
	XjGDYxM1/hTPzd9crfNTugzMqGsZtUY2LBUndedfS2cI82gEm+u2kaRR90PrJ8NOTamLuLAgJFr
	kc2PJuTwd6ClplzY/B/sjXfRNBa4wvpNRkQJw1+FlNCPF/5XLOQYgl4nDKx+TU5mCV1K+CfwLwM
	5Exk8N0NQLzvBozi1ikXnsyoAeGeqG+1Vl4Loh+Gn2kGKs1GeX9YW7nil9feaAN/Cj/lg0Yc9vb
	uKxBLP3ZnHof9w7Loh4gET16/IJ1r
X-Received: by 2002:a05:6a21:ed02:b0:3e0:cff8:10c5 with SMTP id adf61e73a8af0-3e16bf2150fmr9325194637.74.1791881158332;
        Tue, 13 Oct 2026 01:45:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:ed02:b0:3e0:cff8:10c5 with SMTP id adf61e73a8af0-3e16bf2150fmr9325164637.74.1791881157810;
        Tue, 13 Oct 2026 01:45:57 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da0596f9sm5384721a12.31.2026.10.13.01.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:45:57 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:15:34 +0530
Subject: [PATCH v9 3/7] bus: mhi: Centralize Sahara firmware image table
 selection at probe time
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-sahara_protocol_new_v2-v9-3-dc9f24357c4a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791881139; l=8671;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=5j9+3paXM74BA37EpHul8NySFWdjFa3+C/GAH89afRM=;
 b=y8GKFG4gyf54OtsIZCB9aqMVfqP9LdaK3omi7sJ0SAHSt1TdvI0XHdQnLeBayMr4TWcjpp1gr
 n3/kVt8VagcDoRLgt5ExDyZrlTlguQVfAfaG8LSOM9ZCVWOAKCBbu3Z
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX76ofo+CGtUtA
 LKZ1mvtJBP7n4BvNfR96vJCY1Ab6/TjfIm67Y9SPPtx5tm/M+itwo6wqIahcQjzabYe1jjYt5VU
 80FDGhhbXqqaXG3pP81r3YrEjItob833fdieukNoAqB5xbetlQ63S276VRswhHivG24uWa214A9
 3sOG3jB+DzGDaBulQnE3iW6ZNRUunF5DeogZJ/MnQBzusdvZQqg6l5WPCsY9nmv20Ql98+ksk7X
 yyTF/nMQxzeO7+5gbmsm0incxqavluK2HczZumq6KqNt5lOfD4dyi982I/CfzDAd5WHtQeaR1qL
 LSqblvmSHpeQI0cJ6H5MNhZfFxTiJHDYm/6sRc3kuRAOrVkwaMzOSYKRMiSaQHNsIArerSFNvxv
 FxRY7lu0G6UZs4IeXDD5CbW6tNS780/nLLDhk6uwr2Lo06EWX+x/WBnD3I6tmBHG5bgdHNNrD/6
 1vzLvg4aJCuPtkal0cQ==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6acdefc7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FaWmrOfgj8M-bvBoqZ0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: GUstbUyfjFWxGcNTUhSpqTY_mxNJY7mT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX8lVAZv1Yr1Nl
 0DNcGJ0LK1KksM7/9MhJiU7HewB9ZEktD653PZ2qT+DFnNCfpFpVYJcOlaStY00XBR40O2v/+vc
 7o/GAiK6wikki72PRUian79gtJm+GV4=
X-Proofpoint-GUID: GUstbUyfjFWxGcNTUhSpqTY_mxNJY7mT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

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
index 75c0cf6010e1506fe661cfd110112bbb37465880..ce4fcbd40baa1b3a3d65d0d10fc9e54b1c7eb04d 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -178,48 +178,7 @@ struct sahara_context {
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
@@ -795,6 +754,7 @@ static void sahara_read_data_processing(struct work_struct *work)
 
 static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
+	const struct mhi_sahara_fw_table *sahara_fw;
 	struct sahara_context *context;
 	int ret;
 	int i;
@@ -807,14 +767,14 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
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

