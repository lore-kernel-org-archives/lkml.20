Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597419;
	b=LzC38fSenPrC+o2Rg4XQ1qlNxHIaef7knYDzhR9EeydUaEJIvx+IQORaCMrFtg2bh/mP
	 3nw0HEc52MCvERUGKw+3J2t0SzFQxj1z515VNGRtUGHTALQrgqJFSqVglLw9w/RT5Cb3V
	 wE6uTi1bck2151MwKV72kVHeM//hw9cMmIE555hNtJiEKvLVHtcb+O7Uk3gSFsWuSanTv
	 1PkdDqnnEhdVCidLZyQl7x52UoH3hugmGTWIyqhecQd7pzWzAoWsGNef78q7jTkquc/1k
	 h2k60+8sSO++3FQgf7BaqVccAXry89Hp9tuRfr9j9Si2oC9emrYORxL7XP8WiEB8pBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597419;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PK1O9DLe2zPgJMY35B/jdWprIHSb/6My/ydSWK7Ng1I=;
	b=dh0R9wXhFxW4JwpK0gRZpa6S4GBiA2pD0QKoB8aKA/at8YxKS9zNw5aIbftFErd1v4dz
	 PhLz3vlD5IM4y23o/HV2nGbTej3vHt9ogMZj2sfvatQ+KxynzN2AF+z/YSy2Xo0PgK4YZ
	 WyivMgpwzjxTBzfzIYhKk5b3lhBJ6wjfd9vRDMPpF6HFzz2O55svRIp2pktwyASkrLqM1
	 lkFAcUaU+ijF3RPHyyp4DPnufWIOy1AwdsQZujUM7EDWGwxE8H5Ulf6KOnj+n7a8AnzxR
	 RETgY4yFWcyRRF7lrWunjm6TR3u0UpCAKQLQfdgtnCROy2haGGQ41ky2YPKiTPNaLkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SJzcbxrk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hkhICCtZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D8360A2617
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71D8360A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SJzcbxrk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hkhICCtZ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU0tg479278
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PK1O9DLe2zPgJMY35B/jdWprIHSb/6My/ydSWK7Ng1I=; b=SJzcbxrkM9dqPxpy
	57+YC7/Xz9kpNJ5h4KxPyJ4aD6jOQzcdFfQey3hRod0Yz42koCI8F0F+apUF+ZsS
	whocLkc6Hwa2GJKJ/glI1fVW9PBF7Q9Vc8JXKTSBeRghuZ566/1orctL99QRdrcz
	gklYN3s4kvoyyctMLBLyPD41/DANaHvohY1eTq52nVaN4LU1QIgwC3z/MeFX2BfC
	v0C58rhi0xAsdQ4wcy2vRqWmjE5b/iEwK01x8D9GZl879bynldhVtaxzcUqT+eWV
	huS2VYe+S33fQwcx5emaLVzx9N0qBDHUSGGaiKYOBHvwLeIzilGK40yD8lL6GqZ0
	caUHAQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0mqwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:43:32 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-155a75f91e1so1102585c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792597412; x=1793202212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PK1O9DLe2zPgJMY35B/jdWprIHSb/6My/ydSWK7Ng1I=;
        b=hkhICCtZ2okWYFEAo/477yTp8ZZdECyuLAXYE/TGV66orjwVf6OP7H2TJR+9haVKim
         BKkdOb3PKfhkYdAc02PXzwM32ACPhEsqv0qfhc9DOrTxyG0VKpAoaygBRlBwr3C4pPQp
         G/M5rjRi8QO8k4PMXkKyzSdS/lzDCytt5pEAtzWzni/05o8tlR+6CPc/lmkFYNkoe8PG
         toXmayPajDsrA7uxHCsyR1XNJp9VVSuG4PNSWWCiwNnK21s8PHaCFNsJxZldFLnf7rH9
         8zbNHDAm0FwkNdsC1lGcn7y4XG5Y/UV24pdOiFzgRs7Rvpm85EOsCEPIoBfB+gWWzBxw
         R5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597412; x=1793202212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PK1O9DLe2zPgJMY35B/jdWprIHSb/6My/ydSWK7Ng1I=;
        b=TopoZ5FybTDuelbHharlVZWBRsMQUNusa1a79ETlvfxb3PB6E4pCLBDwta7cC68IB9
         gNssD+IkXaamVJuUO8qWfCIdY8Uk147QbgHvntS2YNfMEQLU8elUyV7J6jwf5Nx+G2Au
         3Kvg1UUNIjO8rrENM/v+R5Fab0mI59/jhrfV+lJfKZRy139jmsqtqEXWymLG/E3jonJ1
         co2YMZRDvlplpSy+soqFyBsBCzXqLDDgjnvLffbADXZXkPtT4JlUyN+RQp7wRQijc8J0
         0nZU3AsGzngAKaz8MDGJXUFrDIrUpYeJKGb/YHNj77p2qWxj1hBl0sBdisjs4vS/mW0G
         FfeA==
X-Forwarded-Encrypted: i=1; AKwUvBzOV73j4P50Lvu1ydN0Hs3ErDHDZLjjZKzDHQM8/r+vR1zUHoCHG+iQLbWlQp+AYYv04TjQl/sVQiYKimM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJD25NFwTupBkUqBr4RrGdMMSDSmamWYsqF4yyx4Cg/Jy5TphZS
	HF1ZvHvMv2j4XchVWwrhohSF4jZMidmIzCncia3u9yrTqjIJiwqcATgjp1Tx00YTGV394jg3WVc
	B8RHjWG5pQHSlJ9zxXRgo1eThJHry2WbocHAjH0RmsPqorIr49st6hAG3fIDuLBmPCDo=
X-Gm-Gg: AYBFou1MToMdjh5GybpTa4adU7bG1owmCIKjJPz3f4aLN+wz4kUsnZ7kDSifRpJ/HzW
	kQSerpPH3rIJOPJ0N12AYEcwDjsgAFLNCbjAFr9NvFNXoG56Mu4i4nUA0jB2/8bkenheeAGLt8u
	RsIhMxEWAATzm4or15MJ2nR871CUoO6jHRFkmhht/Ag22X04QcU9+Ob1EzEgLPz+CG6XOOTPgup
	HXHjktiyaIzxkBiEJFiFDUJMu3F+FUf+dpV51hThWZffnaa6Css0XfpB0SvsQbDznSnTEj+p4Ma
	zQlNI9N04XHzv+mH2zdJJ7ayn4uyeS6HHqs1M/mf4dBVl7IdhyjmjMk0uUFaRVz2fw6HopUGqbY
	dt8MF9gRBOyimqqmyoonbmjQv
X-Received: by 2002:a05:7022:419e:b0:185:e68c:904c with SMTP id a92af1059eb24-18dbe2af64bmr10406236c88.7.1792597411401;
        Wed, 21 Oct 2026 08:43:31 -0700 (PDT)
X-Received: by 2002:a05:7022:419e:b0:185:e68c:904c with SMTP id a92af1059eb24-18dbe2af64bmr10406192c88.7.1792597410688;
        Wed, 21 Oct 2026 08:43:30 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1902f96dc4bsm7937768c88.0.2026.10.21.08.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:43:30 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:13:07 +0530
Subject: [PATCH 1/5] firmware: qcom: Add a generic ICE service
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
Message-Id: <20261021-ice-migrate-tee-svc-v1-1-b035be7aab0a@oss.qualcomm.com>
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
In-Reply-To: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792597401; l=10247;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=vfJmdr9eEKYwCZJp3EElKbzW79+lSOJNHBy6jnHe668=;
 b=dchV6/8fR7XW9p5INJZThG4HdgkSgTl2oUaBFr/zI8OKdt+qkGcKrVlO9KFygRmC3YThiKue0
 lps8+4IHKq6DcsZvuuMrJzJfS0MWmSrPThT0C7EXKOYB8I4aS8vxEUH
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MiBTYWx0ZWRfX1b+fsvduXVfM
 QWFUXGJt6QUD4qjHZn0jZ9YeqVYY8ZAuL4x9ESUnZeSOBEe3t++gbICRHYdVzYUve8JCZle9N0G
 ugIGj49QAMV//QD7Bv/famxhlqIiFIbgLemruQBjp77C90ocw7vj4idWETfQbIW7ojS3UBljSLR
 OmkBvFtmQkgO6oX/mlJ7uhE3iW09oQiekZIw7XTZ7vk8z21f98Fxizv6dOeMLTghaH91/YPcK0t
 Ltx8OK40K9SogEpJ9ZLbayhWEgjisr2TTwVwWDbsOBG4Z5RrB5+IZV0jSDkOvd/T54UajVGUn/L
 iE0LU7ERdAH+ZJV+j/cWPD1Vt00NfQHWwQeeei/nXpCSIsdWQ1ujlVLt94DfFKYBYccH0yMGhp3
 rWys4S93C4pakWDDTuQL/LpWe+nOGJXq+M6iT7gKhONvfGQ8EdsWl05o5tZzMyFYZcYrnzMyJrF
 wargcTRXwKbEWQ+LZrg==
X-Proofpoint-ORIG-GUID: Pu_I3j1rm7gdzFn21CVd0HeAh2I8SWy8
X-Proofpoint-GUID: Pu_I3j1rm7gdzFn21CVd0HeAh2I8SWy8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MiBTYWx0ZWRfX31ijYeYBnWu6
 +RJPJ6Rcd/AmyrkhbQ5qJv7+UEj2ZpdMpDJ9HessKHoB/nsEq+7Y9Gyj2OfvCQIpp+gG5hQpJy6
 qNVgbprNrtjfbSiEWVdJDvzFRTYvC5o=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8dda4 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=FunFjVdMjTOM9eWGH8wA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210062

Qualcomm platforms such as the IQ-9075 EVK now boot with both QTEE and
OPTEE. However, the Qualcomm Inline Crypto Engine (ICE) driver
currently only makes SCM calls into QTEE. With the arrival of ICE
support on OPTEE for Qualcomm platforms, there is a need for a generic
layer which re-directs the call to the correct TEE at runtime.

Add a generic ICE service which acts as a common layer with different
TEE backends plugged in whether it's an SCM implementation or a proper
TEE bus based implementation (such as for OPTEE).

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 MAINTAINERS                            |   9 +++
 drivers/firmware/qcom/Kconfig          |   8 +++
 drivers/firmware/qcom/Makefile         |   1 +
 drivers/firmware/qcom/qcom_ice.c       | 125 +++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_ice.h       |  51 ++++++++++++++
 include/linux/firmware/qcom/qcom_ice.h |  32 +++++++++
 6 files changed, 226 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f58a305de664..7a80b776896c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23007,6 +23007,15 @@ F:	Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
 F:	drivers/soc/qcom/ice.c
 F:	include/soc/qcom/ice.h
 
+QUALCOMM INLINE CRYPTO ENGINE TZ SERVICE
+M:	Harshal Dev <harshal.dev@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+F:	drivers/firmware/qcom/qcom_ice.c
+F:	drivers/firmware/qcom/qcom_ice.h
+F:	include/linux/firmware/qcom/qcom_ice.h
+
 QUALCOMM INTERCONNECT BWMON DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index 3ad22f8fc3e5..e2d1c17296c2 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -25,6 +25,14 @@ config QCOM_PAS_TEE
 	  Enable the generic Peripheral Authentication Service (PAS) provided
 	  by the firmware TEE implementation as the backend.
 
+config QCOM_ICE_SERVICE
+	tristate
+	help
+	  Enable the generic Inline Crypto Engine (ICE) service provided by
+	  firmware. It acts as a common layer with different TZ backends
+	  plugged in whether it's an SCM implementation or a TEE bus based
+	  ICE service implementation.
+
 config QCOM_SCM
 	tristate "Qualcomm PAS SCM interface driver" if ARCH_QCOM || COMPILE_TEST
 	select QCOM_PAS
diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
index 88ce74d74c3e..6403e8a17249 100644
--- a/drivers/firmware/qcom/Makefile
+++ b/drivers/firmware/qcom/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
 obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
 obj-$(CONFIG_QCOM_PAS)		+= qcom_pas.o
 obj-$(CONFIG_QCOM_PAS_TEE)	+= qcom_pas_tee.o
+obj-$(CONFIG_QCOM_ICE_SERVICE)	+= qcom_ice.o
diff --git a/drivers/firmware/qcom/qcom_ice.c b/drivers/firmware/qcom/qcom_ice.c
new file mode 100644
index 000000000000..2e42d70c855a
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_ice.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/firmware/qcom/qcom_ice.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+#include "qcom_ice.h"
+
+static struct qcom_ice_ops *ops_ptr;
+
+bool qcom_ice_svc_ops_registered(void)
+{
+	/*
+	 * The barrier for ops_ptr is intended to synchronize the data stores
+	 * for the ops data structure when client drivers are in parallel
+	 * checking for ICE service availability.
+	 */
+	return !!smp_load_acquire(&ops_ptr);
+}
+EXPORT_SYMBOL_GPL(qcom_ice_svc_ops_registered);
+
+bool qcom_ice_svc_available(void)
+{
+	if (!ops_ptr)
+		return false;
+
+	return ops_ptr->is_ice_available(ops_ptr->dev);
+}
+EXPORT_SYMBOL_GPL(qcom_ice_svc_available);
+
+int qcom_ice_svc_invalidate_key(u32 index)
+{
+	if (!ops_ptr)
+		return -ENODEV;
+
+	return ops_ptr->ice_invalidate_key(ops_ptr->dev, index);
+}
+EXPORT_SYMBOL_GPL(qcom_ice_svc_invalidate_key);
+
+int qcom_ice_svc_set_key(u32 index, const u8 *key, u32 key_size,
+			 enum qcom_ice_cipher cipher, u32 data_unit_size)
+{
+	if (!ops_ptr)
+		return -ENODEV;
+
+	return ops_ptr->ice_set_key(ops_ptr->dev, index, key, key_size,
+					cipher, data_unit_size);
+}
+EXPORT_SYMBOL_GPL(qcom_ice_svc_set_key);
+
+bool qcom_ice_svc_has_wrapped_key_support(void)
+{
+	if (!ops_ptr)
+		return false;
+
+	return ops_ptr->ice_has_wrapped_key_support(ops_ptr->dev);
+}
+EXPORT_SYMBOL_GPL(qcom_ice_svc_has_wrapped_key_support);
+
+int qcom_ice_svc_derive_sw_secret(const u8 *eph_key, size_t eph_key_size,
+				  u8 *sw_secret, size_t sw_secret_size)
+{
+	if (!ops_ptr)
+		return -ENODEV;
+
+	return ops_ptr->ice_derive_sw_secret(ops_ptr->dev, eph_key, eph_key_size,
+					 sw_secret, sw_secret_size);
+}
+EXPORT_SYMBOL_GPL(qcom_ice_svc_derive_sw_secret);
+
+int qcom_ice_svc_generate_key(u8 *lt_key, size_t lt_key_size)
+{
+	if (!ops_ptr)
+		return -ENODEV;
+
+	return ops_ptr->ice_generate_key(ops_ptr->dev, lt_key, lt_key_size);
+}
+EXPORT_SYMBOL_GPL(qcom_ice_svc_generate_key);
+
+int qcom_ice_svc_prepare_key(const u8 *lt_key, size_t lt_key_size,
+			     u8 *eph_key, size_t eph_key_size)
+{
+	if (!ops_ptr)
+		return -ENODEV;
+
+	return ops_ptr->ice_prepare_key(ops_ptr->dev, lt_key, lt_key_size,
+				    eph_key, eph_key_size);
+}
+EXPORT_SYMBOL_GPL(qcom_ice_svc_prepare_key);
+
+int qcom_ice_svc_import_key(const u8 *raw_key, size_t raw_key_size,
+			    u8 *lt_key, size_t lt_key_size)
+{
+	if (!ops_ptr)
+		return -ENODEV;
+
+	return ops_ptr->ice_import_key(ops_ptr->dev, raw_key, raw_key_size,
+				   lt_key, lt_key_size);
+}
+EXPORT_SYMBOL_GPL(qcom_ice_svc_import_key);
+
+void qcom_ice_svc_ops_register(struct qcom_ice_ops *ops)
+{
+	if (!qcom_ice_svc_ops_registered())
+		/* Paired with smp_load_acquire() in qcom_ice_svc_ops_registered() */
+		smp_store_release(&ops_ptr, ops);
+	else
+		pr_err("qcom_ice: ops already registered (%s), rejecting %s\n",
+		       ops_ptr->drv_name, ops->drv_name);
+}
+EXPORT_SYMBOL_GPL(qcom_ice_svc_ops_register);
+
+void qcom_ice_svc_ops_unregister(struct qcom_ice_ops *ops)
+{
+	if (READ_ONCE(ops_ptr) == ops)
+		/* Paired with smp_load_acquire() in qcom_ice_svc_ops_registered() */
+		smp_store_release(&ops_ptr, NULL);
+}
+EXPORT_SYMBOL_GPL(qcom_ice_svc_ops_unregister);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm ICE service");
diff --git a/drivers/firmware/qcom/qcom_ice.h b/drivers/firmware/qcom/qcom_ice.h
new file mode 100644
index 000000000000..aefaf1ecc3df
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_ice.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QCOM_ICE_INT_H
+#define __QCOM_ICE_INT_H
+
+#include <linux/firmware/qcom/qcom_ice.h>
+
+struct device;
+
+/**
+ * struct qcom_ice_ops - Qcom ICE service backend ops
+ * @drv_name:                    ICE backend driver name.
+ * @dev:                         ICE backend device pointer.
+ * @is_ice_available:            ICE service available callback.
+ * @ice_invalidate_key:          Invalidate keyslot callback.
+ * @ice_set_key:                 Program keyslot callback.
+ * @ice_has_wrapped_key_support: Wrapped-key support callback.
+ * @ice_derive_sw_secret:        Derive software secret callback.
+ * @ice_generate_key:            Generate wrapped key callback.
+ * @ice_prepare_key:             Prepare wrapped key callback.
+ * @ice_import_key:              Import wrapped key callback.
+ */
+struct qcom_ice_ops {
+	const char *drv_name;
+	struct device *dev;
+	bool (*is_ice_available)(struct device *dev);
+	int (*ice_invalidate_key)(struct device *dev, u32 index);
+	int (*ice_set_key)(struct device *dev, u32 index, const u8 *key,
+			   u32 key_size, enum qcom_ice_cipher cipher,
+			   u32 data_unit_size);
+	bool (*ice_has_wrapped_key_support)(struct device *dev);
+	int (*ice_derive_sw_secret)(struct device *dev, const u8 *eph_key,
+				    size_t eph_key_size, u8 *sw_secret,
+				    size_t sw_secret_size);
+	int (*ice_generate_key)(struct device *dev, u8 *lt_key,
+				size_t lt_key_size);
+	int (*ice_prepare_key)(struct device *dev, const u8 *lt_key,
+			       size_t lt_key_size, u8 *eph_key,
+			       size_t eph_key_size);
+	int (*ice_import_key)(struct device *dev, const u8 *raw_key,
+			      size_t raw_key_size, u8 *lt_key,
+			      size_t lt_key_size);
+};
+
+void qcom_ice_svc_ops_register(struct qcom_ice_ops *ops);
+void qcom_ice_svc_ops_unregister(struct qcom_ice_ops *ops);
+
+#endif /* __QCOM_ICE_INT_H */
diff --git a/include/linux/firmware/qcom/qcom_ice.h b/include/linux/firmware/qcom/qcom_ice.h
new file mode 100644
index 000000000000..c3d93259c72a
--- /dev/null
+++ b/include/linux/firmware/qcom/qcom_ice.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QCOM_TZ_ICE_H
+#define __QCOM_TZ_ICE_H
+
+#include <linux/types.h>
+
+enum qcom_ice_cipher {
+	QCOM_ICE_CIPHER_AES_128_XTS = 0,
+	QCOM_ICE_CIPHER_AES_128_CBC = 1,
+	QCOM_ICE_CIPHER_AES_256_XTS = 3,
+	QCOM_ICE_CIPHER_AES_256_CBC = 4,
+};
+
+bool qcom_ice_svc_ops_registered(void);
+bool qcom_ice_svc_available(void);
+int qcom_ice_svc_invalidate_key(u32 index);
+int qcom_ice_svc_set_key(u32 index, const u8 *key, u32 key_size,
+			 enum qcom_ice_cipher cipher, u32 data_unit_size);
+bool qcom_ice_svc_has_wrapped_key_support(void);
+int qcom_ice_svc_derive_sw_secret(const u8 *eph_key, size_t eph_key_size,
+				  u8 *sw_secret, size_t sw_secret_size);
+int qcom_ice_svc_generate_key(u8 *lt_key, size_t lt_key_size);
+int qcom_ice_svc_prepare_key(const u8 *lt_key, size_t lt_key_size,
+			     u8 *eph_key, size_t eph_key_size);
+int qcom_ice_svc_import_key(const u8 *raw_key, size_t raw_key_size,
+			    u8 *lt_key, size_t lt_key_size);
+
+#endif /* __QCOM_TZ_ICE_H */

-- 
2.34.1

