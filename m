Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406663;
	b=E+5u95kerSwRMhSuWzVDubvBKAxCOoKLjHq+Ey6WXoElVdvcPZ0VBawq2m7lEXq0mWuE
	 tAHsqxEy4Pno8dpK54gjTwePmrARvsp8FxhbSlqZZPNxJzx1lIfcjxrBSy+9+l7a60vQd
	 071IwDWcPusEvULVQBD+W3DXofp0UdZ5VLx9fJlh+fkMa6cvi/mEjz7cqRlHS+5HQjE7a
	 6T0eJl+2ZDX7QzgFu2/vXhas8YlOUmd3IzEfcHRaq4/D7C4vfqskMIYA73djVpHK5kkd7
	 oGK1Oe8ztGUXVDIkNvMLa1kW67NRv59wFJTKN+4q/uZIBteGc+UoEvfOCuCKMVX4KSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406663;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EbYuLbuCu6GHLhZz+1gsbZOrUrWD8uGqE3YcaX6kj2c=;
	b=h2+wlH9aTd2LILk7jOGQmX/tYH4j5sHs+6MysUWrZxl/ABKRPu2DJFKvM9z2F1PP3BK0
	 xamF6R/nFCUk7qS6oAEAnpXAMfgMkBYHD3nEH2lumz+IiD8lQRBQUkf8Ea1Q6s6C+3io7
	 vW6I3xCcGsZqPwMXA5RlDh5tS/Ky+9SKM3Fth5z7ti72pDSDl2kO/uonKLtqCziEQtkZB
	 yB/tiY6zg3SI1ZnAHWXaJlXHXfiRqC9tcDO+4UTtM97p9f5FRfuHtA2Soa+sV5Nok9ro9
	 BC32nJIem66awLtgpiPHnsEErjWdl9PBZj/5EjDLlVEm/tdsCVSnVrlTOqosaFqGSCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RM0BBs3I;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dnK+2xsj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B49606A8A0
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B49606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RM0BBs3I;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dnK+2xsj
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZH8m2975688
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EbYuLbuCu6GHLhZz+1gsbZOrUrWD8uGqE3YcaX6kj2c=; b=RM0BBs3IKOBedbUE
	/iUSnxzHYbKuJeLIt4Bql/gwWvKPniNz90Wh3Au0zmaV7FLe4nsT42FjAvuUGdZe
	8rWfLKJ9wur+KYOIjdkml5yzM9jqDD7d6cMvOgQQqivrD5teuSRSGB7BRxK5Pwqh
	fzpkQZleTkB0PuyvyYR9Y9q6xF/eEk1k3nqzNSOwYivxmAPkVLqTe7ZScKI3zH0Z
	1K+YvSPIdTElewctsApbtzeZCZQ6w7hxLwGrWyJiq+ldIbpc1kv+ki+l9P/PkCDM
	ITz/eaus49UErF30O2xkKl91k4/mPAIRK8Cw4MZoTgGzyqzr+4AD4d5nt789mMAr
	aVKeKg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cc6ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:17:42 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1aa0fb7f157so5154161c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406661; x=1795011461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EbYuLbuCu6GHLhZz+1gsbZOrUrWD8uGqE3YcaX6kj2c=;
        b=dnK+2xsjAtzAMi2bPlsyHKnRITgJFkNo41X/3WSycXFID7yjGknIbDwyLVrGmkbAop
         OVuLBpXS1lD/D1WV0F+CxTdEk2CAhftK+e+fcouSSoejJuZVycWBQxEnkzvULkpuGJdt
         bj4bsOuAVU56KoJX0jru2NvPalWdVYldILh1tkXM30Csf/mD6PqlXk8O2yltvy+NpOcR
         JQclUs+5tiFV9X/e+lM8tNy9GOegAuI97m0QaVJHC2HFXVL3d87Gs9VB15UHuZ8OgIxv
         X/GxQA1vZMjtM9twfHIqiavDyuWYCrENQzE643NX2fxCVwARV0E+8H/Y2L0BRYsgqtZd
         fyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406661; x=1795011461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbYuLbuCu6GHLhZz+1gsbZOrUrWD8uGqE3YcaX6kj2c=;
        b=iapPgNqWNDTdmI9D6Mm1TQ/EBGzOc7e5kjRZM2uW/1Wl2O5sZvR7EMqRc9d/XBR4mH
         +M1JlmwMvSAcHlRIs7Z6N7yXUyRX7dIkA8SQuS8Kydql6jsgv49QQe1DvPoO3mpoQyVK
         jugnAFFpyh/1aZLO0381LsK5NiDw0eWpebZXU+D763XQmdGM+6m792+WgRd0szmx/gO5
         brbG0bsJ5nhHryJGAdA9gTGjh5TRjO0h9BlHjT2fSiC0TATWZpL5OEP/NktOYGd45Oac
         0GPTkdlYqyleNDrTyvpYl/+OXrwiZ8i+aBwJllcNkCWgf3zYwtFjdQSEu79t0gxUuNln
         5V8w==
X-Forwarded-Encrypted: i=1; AL+hErGkdoePSrxVmbTncbWbG0sGE+sRa3Yjk/HsuBZZzmEtjR5ELd8VEq+rF0tJ/y35OCyzrqvDHTacbTMaYD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1Uk6lbFB4T91MhHtq1dGDyIWYtS7WWfFfiosWmeHkOJ3Aev/p
	WGXU7YrOFIXpD9Icg+YFUBeYlpv5IERIdxQk9MJx5PN5Kyf5pKf/eamTaPJaf47tyHb/Vj2s+e/
	9VgLja2O299DjBnJ93H/FZKuRIVrd4G/D3PYL4/k7tZrVN4WnO6R/6JMmmQKRxSRQHZI=
X-Gm-Gg: AYBFou3hCgt7X8FookhDa2WEu+FveIKDfZGdpa0gNE+izG0YV6xu20Qymi4RZzuJzQ0
	xr2KT9V01JO51TWCZIyDSyiypi+uA/MpQ6s+AGQoHkeN+HC63f6va0uy2z4E992Ci3bRTVG2URO
	PvJ9INufrZ0pvY+HVOp4lBwyIab9Qp58pbl/EvqGsdddW12D0PGVm1YbYF/edx5u67DlHscWZT/
	flAXgj9J2V+JeY2HG1Jqd/ajT8vGH+CoOiCgWxEPThKwF45SH3C8DtoxV3LTcDiPlh+DpFHVGhh
	xqRN0kfN7aClI9N2JmxSkBc9j05tV9m1/9RDW4l6u6tyst3ShDpphFp2V8DibBzDn3JAtcy+Wq3
	NnnSIFUJJkk8Ef1bly3b20mXf6Vl1vBDjj1JiLqUAyU9YylyrNlA2IXCUOO9JdkzHJPx1T8ubSw
	==
X-Received: by 2002:a05:7022:7f0f:b0:191:3c:aae7 with SMTP id a92af1059eb24-1b3c032edcamr2238345c88.26.1794406660662;
        Wed, 11 Nov 2026 06:17:40 -0800 (PST)
X-Received: by 2002:a05:7022:7f0f:b0:191:3c:aae7 with SMTP id a92af1059eb24-1b3c032edcamr2238312c88.26.1794406659867;
        Wed, 11 Nov 2026 06:17:39 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm33747063c88.10.2026.11.11.06.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:17:39 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 19:47:04 +0530
Subject: [PATCH v2 4/6] tee: optee: Register TEE devices on the platform
 bus
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
Message-Id: <20261111-ice-migrate-tee-svc-v2-4-29d19f6c92ab@oss.qualcomm.com>
References: <20261111-ice-migrate-tee-svc-v2-0-29d19f6c92ab@oss.qualcomm.com>
In-Reply-To: <20261111-ice-migrate-tee-svc-v2-0-29d19f6c92ab@oss.qualcomm.com>
To: Eric Biggers <ebiggers@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794406634; l=9180;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=g8hrXonUjMAbRhuTx2hbMpd9FGdmzLcfToO/WIbOHXA=;
 b=2k+B/kFL0yK3VXm95Likwpf3GId+nH9+I89GqjV/M7CdbQJcCBzE4mXWoy7bSZOWlkZ1UAWpE
 AEjSf4+0/0VB5hum87wb/D7p8DK/TT5TqMrQzLqdW780zRf+t9lM46X
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX/W+9HisflIKb
 UJCKjDkO73zPi2KKex0MlH4EPPY0b/8DWKv1nSYXiCp6lreKxUHlUeNXSRxPtAtm++2HvAgjiBm
 CSGo/Bx49wZU2S7Krye4IZkCpy6i5LOF87h2rhN4byS2NSbe9dfBM87Azdxqtusd9blag2rTYWF
 oZ8Wenjnz22Vx4OdKAPK+lfAAcgonI+cwJiBcN6o3sfxDRZNzAu15vMHVPyfB1c8lk1YBb++wmo
 l0NsEkf4OTWKTiobXx/o9lv7MfM40QSvv1kwzMSPopqKR6VCfX1MS1zoyq1Ra3rSkBVARmwCJ19
 45CcEtSJf0wtd/6/3qY5eIbPELaPIgXOw32+Qtwbvrn84Eswh0t92eVQ2Bq3DbyzfXbNy8Z7dSj
 LcszUKAU9BT4aDLs1mvqzYBs8JSBwwlfx+9AJs/6bVut6+EcmWs37223u9C/lkAUHl05pEgbrOm
 Qb6cdF1h2sRKIjY2BEQ==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af47906 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=xMNAnnMEu-nZTh-EPAMA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 2dAj6eWt1tZjCsI7voVtTzvUnFH5bvDS
X-Proofpoint-ORIG-GUID: 2dAj6eWt1tZjCsI7voVtTzvUnFH5bvDS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX6iQiBsK1ICM6
 iM3vu9CdjZwvjCDpvx0Gehm7npZAE1W5lJWZ2+0TttKL4DDKi8EisxuC7lgL7h/4jB0pypUOq6Z
 Na6aDJFQGZGu/1k0f1w1MMTlF1LbE/g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

The Qualcomm Inline Crypto Engine (ICE) driver is an independent platform
driver which polls on availability of a TEE interface (SCM driver) before
checking if the ICE secure service is supported by QTEE by querying the
qcom_scm_ice_available() API.

The TEE subsystem currently does not provide any way to notify regarding
the availability of a TEE interface, i.e. whether QCOMTEE or OPTEE have
probed. And so when migrating to the TEE subsystem via an ICE TEE client
driver, ICE needs to defer probe until the OPTEE ICE Pseudo TA becomes
available on the TEE bus. This means that for OPTEE builds without the
ICE PTA, the ICE driver would indefintely defer probe and the dependent
UFS/SDHC storage driver will fail to come online.

Add support for optionally registering the back-end TEE devices which
represent a particular TEE (say OPTEE) on the platform bus via the
tee_platform_device_register() API. This allows drivers which poll on
TEE secure interface availability to be notified even if the TEE service
itself is not supported.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 MAINTAINERS                                |  1 +
 drivers/firmware/qcom/qcom_ice_tee.c       | 41 ++++++++++++++++++++++++++++++
 drivers/soc/qcom/Kconfig                   |  1 +
 drivers/soc/qcom/ice.c                     |  9 ++++++-
 drivers/tee/optee/ffa_abi.c                |  8 ++++++
 drivers/tee/optee/smc_abi.c                |  8 ++++++
 drivers/tee/tee_core.c                     | 21 +++++++++++++++
 include/linux/firmware/qcom/qcom_ice_tee.h | 10 ++++++++
 include/linux/tee_core.h                   |  9 +++++++
 9 files changed, 107 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1132e456488b..06dba76996b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23013,6 +23013,7 @@ L:	linux-arm-msm@vger.kernel.org
 L:	linux-crypto@vger.kernel.org
 S:	Maintained
 F:	drivers/firmware/qcom/qcom_ice_tee.c
+F:	include/linux/firmware/qcom/qcom_ice_tee.h
 
 QUALCOMM INTERCONNECT BWMON DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
diff --git a/drivers/firmware/qcom/qcom_ice_tee.c b/drivers/firmware/qcom/qcom_ice_tee.c
index 694aa05847f0..39f7094439d9 100644
--- a/drivers/firmware/qcom/qcom_ice_tee.c
+++ b/drivers/firmware/qcom/qcom_ice_tee.c
@@ -5,6 +5,7 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/tee_drv.h>
 #include <linux/uuid.h>
@@ -22,6 +23,9 @@
 
 #define TEE_NUM_PARAMS				4
 
+/* This represents the back-end OPTEE device */
+static struct device *__teedev;
+
 struct qcom_ice_tee_private {
 	struct device *dev;
 	struct tee_context *ctx;
@@ -281,6 +285,18 @@ static int qcom_ice_tee_import_key(struct device *dev,
 					     lt_key, lt_key_size);
 }
 
+bool qcom_ice_tee_is_available(void)
+{
+	/*
+	 * Paired with smp_load_acquire() in qcom_ice_plat_probe().
+	 *
+	 * This marks the availability of the OPTEE interface informing the
+	 * polling ICE driver that the platform supports a TEE.
+	 */
+	return !!smp_load_acquire(&__teedev);
+}
+EXPORT_SYMBOL_GPL(qcom_ice_tee_is_available);
+
 static bool qcom_ice_tee_has_wrapped_key_support(struct device *dev)
 {
 	struct qcom_ice_tee_private *data = dev_get_drvdata(dev);
@@ -398,5 +414,30 @@ static struct tee_client_driver qcom_ice_tee_driver = {
 
 module_tee_client_driver(qcom_ice_tee_driver);
 
+static int qcom_ice_plat_probe(struct platform_device *pdev)
+{
+	/* Paired with smp_load_acquire() in qcom_ice_tee_is_available() */
+	smp_store_release(&__teedev, &pdev->dev);
+	return 0;
+}
+
+static const struct platform_device_id qcom_ice_plat_id_table[] = {
+	{
+		.name = "optee",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, qcom_ice_plat_id_table);
+
+static struct platform_driver qcom_ice_plat_driver = {
+	.probe = qcom_ice_plat_probe,
+	.id_table = qcom_ice_plat_id_table,
+	.driver = {
+		.name = "qcom-ice-plat",
+	},
+};
+
+module_platform_driver(qcom_ice_plat_driver);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Qualcomm ICE TEE driver");
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 535c8619197b..8dc75c252f52 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -296,6 +296,7 @@ endif
 config QCOM_INLINE_CRYPTO_ENGINE
 	tristate
 	select QCOM_SCM
+	select QCOM_ICE_TEE
 
 config QCOM_KRYO_L2_ACCESSORS
 	bool
diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 452896b1858f..4844621b7497 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -18,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/xarray.h>
 
+#include <linux/firmware/qcom/qcom_ice_tee.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 
 #include <soc/qcom/ice.h>
@@ -132,7 +133,13 @@ static bool qcom_ice_tz_ops_registered(void)
 
 static bool qcom_ice_tz_is_available(void)
 {
-	return qcom_scm_is_available();
+	/*
+	 * Both back-ends should be available before we check for
+	 * qcom_ice_tz_ops_registered(), otherwise we could pre-maturely
+	 * assume that TZ does not provide any ICE secure interface.
+	 */
+	return (qcom_scm_is_available() & qcom_ice_tee_is_available());
+
 }
 
 static int qcom_ice_tz_invalidate_key(u32 index)
diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index 702da7d98fbc..2c0065f3d9e4 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -1177,6 +1177,14 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
 	if (rc)
 		goto err_unregister_devices;
 
+	/*
+	 * Device should only be visible on the platform bus once the
+	 * child devices have already been enumerated on the TEE bus.
+	 */
+	rc = tee_platform_device_register(optee->teedev, "optee");
+	if (rc)
+		goto err_unregister_devices;
+
 	INIT_WORK(&optee->rpmb_scan_bus_work, optee_bus_scan_rpmb);
 	optee->rpmb_intf.notifier_call = optee_rpmb_intf_rdev;
 	blocking_notifier_chain_register(&optee_rpmb_intf_added,
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index 51624443359b..85ee76173982 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1920,6 +1920,14 @@ static int optee_probe(struct platform_device *pdev)
 	if (rc)
 		goto err_disable_shm_cache;
 
+	/*
+	 * Device should only be visible on the platform bus once the
+	 * child devices have already been enumerated on the TEE bus.
+	 */
+	rc = tee_platform_device_register(optee->teedev, "optee");
+	if (rc)
+		goto err_disable_shm_cache;
+
 	INIT_WORK(&optee->rpmb_scan_bus_work, optee_bus_scan_rpmb);
 	optee->rpmb_intf.notifier_call = optee_rpmb_intf_rdev;
 	blocking_notifier_chain_register(&optee_rpmb_intf_added,
diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 1aac50c7c1de..0d3c266b29c7 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -10,6 +10,7 @@
 #include <linux/fs.h>
 #include <linux/idr.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/overflow.h>
 #include <linux/slab.h>
 #include <linux/tee_core.h>
@@ -1225,6 +1226,26 @@ int tee_device_register(struct tee_device *teedev)
 }
 EXPORT_SYMBOL_GPL(tee_device_register);
 
+static void plat_tee_free(void *data)
+{
+	struct platform_device *plat_dev = data;
+
+	platform_device_unregister(plat_dev);
+}
+
+int tee_platform_device_register(struct tee_device *teedev, const char *teename)
+{
+	struct platform_device *plat_dev;
+
+	plat_dev = platform_device_register_data(&teedev->dev, teename,
+						 PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(plat_dev))
+		return PTR_ERR(plat_dev);
+
+	devm_add_action_or_reset(&teedev->dev, plat_tee_free, plat_dev);
+	return 0;
+}
+
 void tee_device_put(struct tee_device *teedev)
 {
 	mutex_lock(&teedev->mutex);
diff --git a/include/linux/firmware/qcom/qcom_ice_tee.h b/include/linux/firmware/qcom/qcom_ice_tee.h
new file mode 100644
index 000000000000..a5906c5d4e39
--- /dev/null
+++ b/include/linux/firmware/qcom/qcom_ice_tee.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef __QCOM_ICE_TEE
+#define __QCOM_ICE_TEE
+
+bool qcom_ice_tee_is_available(void);
+
+#endif /* __QCOM_ICE_TEE */
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index f993d5118edd..d5310b404c1e 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -205,6 +205,15 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
  */
 int tee_device_register(struct tee_device *teedev);
 
+/**
+ * tee_platform_device_register() - Registers a TEE platform device
+ * @teedev:	Device to register
+ * @teename:	Name of the TEE the device represents
+ *
+ * @returns: < 0 on failure
+ */
+int tee_platform_device_register(struct tee_device *teedev, const char *teename);
+
 /**
  * tee_device_unregister() - Removes a TEE device
  * @teedev:	Device to unregister

-- 
2.34.1

