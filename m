Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625770;
	b=u3h7g0asabSLR5O1VWCJFnMPEDFk3dDmP69FaoSIM49kXGoJ8OiNSAQszrbNrtU0SRAR
	 sGikfnj7BTY1hPm3uguT/aMeQMqAZwpDSvOVGTxhhEZ2OfkxfKoJk7knARULSnkbOexiF
	 fWaD6tCMyD6A2A/8HxWKbyXqC6O2iqI74zL0vOIW8EViYJ/lDGrYuK77rbrMyjAMB9ywV
	 SYdBC9x9etT9WXp2dvB8vBc9xuZqrjLAgoe4E0MVoE71IdimMG4TU5CY3EbcAvLqCDQf/
	 mRopuRLu50Mppj9CUc574vCb5EVt3U1QpvD7mQ2JB0y5ieb7KAhq7csDmEaUGsD6ZHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=77+IMtUpB00Qp6x/b8balHWvRVzwrobQ8G4Lytlkt5A=;
	b=gSbOtxnFJIw40YL5BB3V/aQP5UeeZ0ivT+D65FLh3vgP9f5FqPNbwbkTyH76sJ9QfZju
	 nDBq+gby/uWCGfAG8GpaYIOludnVEfyRWIPnUjHjOMxClOcN8SFu8xaYXHCp7VbQwys6K
	 JyKcU3zl34Ha+Yxcumxvbpobb+3NVAheDhiOTEfuwoyIu+oYE+fSliW79JoVI/8q2+Mso
	 5Mo09eaZdlg/AlIG9MsuP3YZB3G2aGG8hEYVXJLT9+ulaDv6/K/uYAvzLDKnaf2qiy/ZY
	 ERUXD5LQJhKfiLaeYaz6jd7x5LZV15xcqd6qtH1s5ELuGM+82iDg/jq1itlchBLUaMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OO+vMrvB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S5aQEAx7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391B9606A8B2
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 391B9606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OO+vMrvB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S5aQEAx7
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE1xwfI2696093
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	77+IMtUpB00Qp6x/b8balHWvRVzwrobQ8G4Lytlkt5A=; b=OO+vMrvBr/pTZBPM
	wEzZ9A89/epJ8Rsl3ChTqw/wPmk3rd9NYgy12bWrVeEFq4m0RvBlkhnLeaScz1tL
	zn0YccJLJ9jY3shAnhTAxacRufOpzFeyZYpOViGeGOnU0XVid7S0rcpBSLk80sbz
	G3KVARjGWvjOj/AkI60f28xnuHN57t1JIcdZ7sB+gJ+Ua2RCmUqSzn9NEsO61vFB
	PLp5mfsOmJIPV8y67uwhzhelIUUWUJAl99L8efTUBW4d4WNnMynCP3tdXTlQrRFp
	pgnGkujn90cY0FkNc1ddf9JPr5XwdVKJi77JfjWKNlboIMIhGQydZ7Or4OnSP1ie
	iL07XA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx87dsf4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:09:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36c98e5ad40so161542eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794625768; x=1795230568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77+IMtUpB00Qp6x/b8balHWvRVzwrobQ8G4Lytlkt5A=;
        b=S5aQEAx7Gyvu5DcjW1V1r8sDw1GfxUvOMyH9FODxyI/Y1EyeNpjvsZNUGdK9Yd4aHh
         r76tbRBvOFSNbSr7GahiEIoAdswo//HQ6DT1i18BIkyrpzELMU648jcn6BS9CLLeOtIw
         0Wg+FsNFvHNTC6ytM+bz+Q5jVpEAFJu/Ln5lSva8qjLkWRIN+LRNJRX28pe1IhaHHAC2
         STZ+BAF5PzSm2Tgg8/Q/oyXyGn13SwTbroRbc/BiAkpKp6U91aXu2G8tdwoUMhxIEVuA
         13VRH7jwFkxyYdUJVv9lkMlD+Ixg7lf8CLpSceP+Z9qCRzTw9Ug4Ybv4rbGgI/aS2GIt
         t51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625768; x=1795230568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77+IMtUpB00Qp6x/b8balHWvRVzwrobQ8G4Lytlkt5A=;
        b=Ry2SYVMfsVqmK87w0INZxVnktzYI2FY6jB6j6qcjJpp5UGKRGieSsRfIOw3PQXWSV8
         Eom7A3lnfv4ncdWmVnEXmcCUtc+cUPkpluitWfdV3opIsZlIQQoi9JFj0osFiysJczXt
         dvctUQpGvMDjirg8Bw7864zeJd2lDENIseBgUxXgo1buWJn8zxU2NCvce7wuNHRTeWYS
         1op5088VLYDqenk+NnairOSfAp39ZoWPFUz60b0Wtd2/MZY7VIVP4JrCNAhxkURllx64
         Www3g6BLo5LjRhU54hmlPfCpz3UlMg3KPdeQUfnwxr/huxMW2lYoFdTndEu5qJvXNsLX
         QZIA==
X-Forwarded-Encrypted: i=1; AL+hErHoONc8R/1hQXhlUO8rMsGBRdFOCYNMr2ykI+x9dLDyLRVFrc1L5HIPlaQoiPniB5AtL3dC0FIzBseyviU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VM++zz3qR/ow5BHjVmKejAyKQ27bpxqoJqTF2T+x5QRAXUYvE
	3HG0WlSNLglQI/9orZ1Nlur3Oc998nWbMqEd4pTcrKhqsxGmroRCvemW+E9FqeDWYI0AmxL7ToL
	9S5Yk0VAB3JxRN/PpQoXZCIJVHvEYVFVSr0V3g73OJvX7+T/HOFQXZmLJTZX7K65j8MM=
X-Gm-Gg: AYBFou2F7ZXEwwNh6IkpTGZ6tw/ntg4cD10IbpJPshyt38DoUMhjT7+zDZHg7LPQy/M
	X+WLaMNebyFvLeGMKsl5cr3qn6tXVpbu/8Eh3FQmGJj1cff+wmEmObYL8iHQPtA5hD6w9u7DpjW
	8ZVV00IYSZJo/JqvepaOyxwlEFaE/VtqGilLxop6HMgte7Nh9BhC0F3ntsfAM7lq0UcxX7/1tAa
	UoYbAkQpEK/fmmJ+S+N5w85uh0bCFZScIXrhBLwfMdbL64oMamiD4GDuK/D80UmIatxzz7lue+T
	cxh9cYfWk59YZtOqSUrxldx42oQrg23c1hJD524ePZoEzTB7CsGul9+atAHUSPpgB47+IsY8z0j
	djt598boF2CgQv7Vsxj7+nCYrL/iBWQwmkmW0+mu0bHpdOPt5AO/MCEqvfHTK97YnUgnTgbX+Qd
	vGIUd4wcb7R6U1yNKsozSoucBDxQr1kB+k
X-Received: by 2002:a05:7300:7481:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-37964ff2d6emr8078972eec.1.1794625767928;
        Fri, 13 Nov 2026 19:09:27 -0800 (PST)
X-Received: by 2002:a05:7300:7481:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-37964ff2d6emr8078907eec.1.1794625767235;
        Fri, 13 Nov 2026 19:09:27 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm11158803eec.16.2026.11.13.19.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:09:26 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 19:09:24 -0800
Subject: [PATCH 3/3] media: iris: add mahua platform data and enable
 qcom,mahua-iris
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-mahua_iris_enable-v1-3-b7107e1cbcaa@oss.qualcomm.com>
References: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
In-Reply-To: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794625764; l=7925;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=oB0IGRdkITKcIXC/zt3I+h9ErkVTu3Th6dpwfef6C9Q=;
 b=XUsPh0GJDeS/LxJPpOR8N+sAgkcmtyHxtoy1C1pdPwXS25a94L6uWgsDQgcSnPI5MSQYOeY/v
 b+tXKuoqBcJAGp93i8B68cYkcLfCScaaxleiv+Ae/dW1e4FC7ntcASD
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxMiBTYWx0ZWRfX4lDkaPwJ3kWV
 ZAGQSjCHFVQESJzrrFgu67VpeEUxc5d1a7hbzIyiFu4o+Vl14aGZr1/74mav1X1KiBxnVx4KjK8
 bUmDWujAA0X93Y/fxE6R5h8vs991prSplKpNSPJQQx5Yh+lZsr1JK4AqxQXpRfWZulETrD7CTkM
 KPYwfeleS+/KVcFfwd+OAO41z8qhCJ3Fu+PjJIKU79IdEFa6nlBg+ZBzGLLMJ3gL6YEiXfA23Vt
 RUnVxwmlXnsb05kmv3WGVhig4JigX/TevS9VxuAgQ7BsNVCHYhl9sYhOC7h/sdtjYayGwo8+Gaa
 ZC9GbRWtdTzkIRGP0ALTSB8mKuQ1fVrAUU98roodttPz+gUF2L3NDOkNnsvFegJQ8AphOgWzSEh
 wJDQ5URRFnCrszm+/axiQRFHmhn0u7EV28gNswlVWvdnWDNf8RY/HqgK449GbulwftI0vIe+VHy
 beeI2Gn+9zGlTO8OLpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxMiBTYWx0ZWRfX8GhSBXSfxo0+
 zTyDaueoGVptm8y8SbGg7ivArJnH4hdWzVCCGnnpJubkZxuqHZ9NWXRbnsQQ1SQNXvw9PDJd5qT
 jn8IxC9urZZMEvLmTgGPkA2xvteDCKg=
X-Proofpoint-GUID: XcoFHO_JajQIz3b8eKekyxRm44HoeHu4
X-Authority-Analysis: v=2.4 cv=BusIUoX5 c=1 sm=1 tr=0 ts=6af7d0e9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=qMmPMGTIe4Jfwz3yK_QA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: XcoFHO_JajQIz3b8eKekyxRm44HoeHu4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140012

Add qcom,mahua-iris compatible to initialize the hardware
and necessary Mahua platform data describing the needed clock
resets and powerdomain tables only for one core, vcodec0.
Most of the data is leveraged from Glymur as they are the same
Iris variant. Firmware, vpu ops, buffer sizes are the same as for
Glymur.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_mahua.c | 44 ++++++++++++++++++++++
 .../media/platform/qcom/iris/iris_platform_mahua.h | 14 +++++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 34 +++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 10 +++++
 7 files changed, 108 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48570da56aa052577e05ead12bd26df090d97454..6c187d25980eabcd1c789b132e2f0bffa62fc805 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -13,6 +13,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
              iris_platform_glymur.o \
+             iris_platform_mahua.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
              iris_power.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 1024a2fd75a3ae2b7e194e583b91ec5f16e2773a..817b8a9e2712e7f1e335dbb8600dc033670c5cfa 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -58,6 +58,7 @@ extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
 extern const struct iris_firmware_data iris_hfi_milos_data;
 
+extern const struct iris_platform_data mahua_data;
 extern const struct iris_platform_data glymur_data;
 extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcs8300_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_mahua.c b/drivers/media/platform/qcom/iris/iris_platform_mahua.c
new file mode 100644
index 0000000000000000000000000000000000000000..14b085426ac29cf69824d1d0da142c026266a0bb
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_mahua.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_platform_common.h"
+
+const struct iris_power_domain_data iris_mahua_ctrl_data = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"core_iface", "core_freerun", "core",
+	},
+	.clk_cnt = 3,
+};
+
+const struct iris_power_domain_data iris_mahua_vcodec_data[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec0_iface", "vcodec0_core_freerun", "vcodec0_core",
+		},
+		.clk_cnt = 3,
+	},
+};
+
+const char * const iris_mahua_clk_reset_table[] = {
+	"core_bus",
+	"vcodec0_bus",
+	"core",
+	"vcodec0_core",
+};
+
+const char * const iris_mahua_opp_clk_table[] = {
+	"vcodec0_core",
+	"core",
+	NULL,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_mahua.h b/drivers/media/platform/qcom/iris/iris_platform_mahua.h
new file mode 100644
index 0000000000000000000000000000000000000000..fa30f33c5b03b515fa57e52a1b7413406cf5823e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_mahua.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_MAHUA_H__
+#define __IRIS_PLATFORM_MAHUA_H__
+
+extern const struct iris_power_domain_data iris_mahua_ctrl_data;
+extern const struct iris_power_domain_data iris_mahua_vcodec_data[1];
+extern const char * const iris_mahua_clk_reset_table[4];
+extern const char * const iris_mahua_opp_clk_table[2];
+
+#endif /* __IRIS_PLATFORM_MAHUA_H__ */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index aa03f86d19453a2f3b314d13b7137827d6939a49..0fe485b360d2a9271392f6e5a397211ed94cf99a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -13,6 +13,7 @@
 #include "iris_vpu_common.h"
 
 #include "iris_platform_glymur.h"
+#include "iris_platform_mahua.h"
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8550.h"
 #include "iris_platform_sm8650.h"
@@ -90,6 +91,39 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
 	},
 };
 
+/*
+ * Shares most of Glymur data except, num_cores
+ */
+
+const struct iris_platform_data mahua_data = {
+	.firmware_desc_gen2 = &iris_vpu36_p4_s7_gen2_desc,
+	.vpu_ops = &iris_vpu36_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = iris_mahua_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(iris_mahua_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.ctrl_data = &iris_mahua_ctrl_data,
+	.vcodec_data = iris_mahua_vcodec_data,
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.opp_clk_tbl = iris_mahua_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffe00000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.slice_caps = &iris_vpu2_vpu3x_slice_caps,
+	.tz_cp_config_data = iris_glymur_tz_cp_config,
+	.tz_cp_config_data_size = ARRAY_SIZE(iris_glymur_tz_cp_config),
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.num_cores = 1,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+};
+
 const struct iris_platform_data glymur_data = {
 	.firmware_desc_gen2 = &iris_vpu36_p4_s7_gen2_desc,
 	.vpu_ops = &iris_vpu36_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 411ef7ef8dae957fae1ca47131e84244e3306ba6..cf2e92f440351e7b0aaf19c4c71db90d8a2deee7 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -550,6 +550,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,mahua-iris",
+		.data = &mahua_data,
+	},
 	{
 		.compatible = "qcom,glymur-iris",
 		.data = &glymur_data,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 375defbb959424df5a6b0033af6e267187f97333..e981c8f93318c5afd5ead162e00690a0c6054edf 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -365,6 +365,16 @@ static int iris_vpu36_check_core_load(struct iris_inst *inst, bool mbpf)
 	new_load = mbpf ? iris_get_mbpf(inst) : iris_get_mbps(inst);
 
 	select_core0 = core0_load + new_load <= max_load && core0_session_cnt < max_session_cnt;
+
+	if (platform_data->num_cores == 1) {
+		if (select_core0) {
+			inst->core_id = IRIS_VCODEC0;
+			return 0;
+		}
+
+		return -ENOMEM;
+	}
+
 	select_core1 = core1_load + new_load <= max_load && core1_session_cnt < max_session_cnt;
 
 	if (select_core0 && select_core1)

-- 
2.34.1

