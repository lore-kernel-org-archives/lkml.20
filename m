Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406672;
	b=dRWIhWuYeN7h71ADKOkXAZfDw+YcMZUyDDYSntNuFBrZgRBtrWW8VHBEVnvqXcrmcwgu
	 fakkIjIRmAzGjVUc24ztZGK6+5TP9PozFFFSF2z9cnS88Jm5GbHHUsEzAoxGg4aOQ1a7W
	 rQiXbHvvvZrlf03N1Ut/QhCGYA/MaTvVf9xDdciYl0fxKpERrByYc1Yw81ZWX/+wz4rAE
	 islmFf+1xTEwr/GvfL8X47NGctdKIj4Rl4LMxlaaXeJZc5uxgL79i+uRoqAwLO44tdsvB
	 7gj+M88RN2/2+A1/18NqhfboDQMxB6rKDCWTkbHAmEtlmP5jhibOsnlaNC1T2Xermxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406672;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=abnYs5U4L9bKrmw3WJVtrxPRARSoubCvJFVtGzfloC0=;
	b=o+GTDx0jUhMyVROiLbCdEvE/K3uvuEkbRMKs+jR2Qs7yttRSzhShvVuJxWsA59msR6j7
	 mYZK4Mn7Tt2+ZKq+HtgN6C2/dvA8WJw1HniZ/KTg6p7VtyLZTaOHqAdoICXeFi4CKB+Wy
	 9OXQ4jzvt2OtUYU+uoTfO0wm3lPoQnlaDswqLLvA1T9Wsy9tzRYCIMo9quuzWe9j/dcNk
	 3pXr/cW9rcrMeSBAkWD9dh3k8dOQbuE0TONdr+1wD1OiUE35AtC+QAcss2IxmC02q+vW0
	 G+suaKB2saBpxUeCHdhDGs1KNaAntumwcnlW2sAaCapbls0iFVMa9VKNWKg/mBZJ86A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1wu5TCM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UBfrJE19;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7D3606A88D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A7D3606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1wu5TCM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UBfrJE19
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEHnwe1471243
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abnYs5U4L9bKrmw3WJVtrxPRARSoubCvJFVtGzfloC0=; b=Q1wu5TCM1g5WkJp2
	KJene2q4aWFyBkiTGgzMpVCZUUPFxk26z8Qc0+Vc31DdYDEtGYpSMQbm5gq58S3J
	L1ncYOKKOAzHeOa6/9aWzNbnRIXRwIpYrGT49FXR++9LhqllIs4Qqc4YMMuZKSll
	8HwuXjYIdkHkHbh1qk78TTjlp07epU37PD74ohErEhOYwV+bcPmgkB7hRFubWvx5
	NDn6g1yevlEF2RFiugMuz3oTfvJoOzWndShm2gsvkt22Uu8fbXgq+ckgOubnIvWR
	7AecN4DVZzKjcACtM6bzCLS5+bRBZsdF5xinTfPR+CQmpQ5B49CbS49WRl30cL6X
	F23o4Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m083s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:17:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5375322eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406651; x=1795011451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abnYs5U4L9bKrmw3WJVtrxPRARSoubCvJFVtGzfloC0=;
        b=UBfrJE19stojvXAU7YUeRhPKeFIAXDFWdCs9R3G1XwCSWin5oJZPMeCCmgUNVz+Vx6
         c4s4q/YEDOivhxAOTeT/sv116bcs7x9FC4pjCrTtiDsYipiQFZEt3ry+LmZ5AlSqqxqE
         JOPO6tCXZqCFFVUbaD8+CMLPMUZ/SBgGk5HuET60dfR9Kq0tg9uCO52fm/LKewFWAxep
         99Lk0Lm73PH4VqoKYjDDRCe2QoTtukz0aLkquqM7Q5znH8X3CFNha8CVerVh5uZLWfBv
         /njCCGxKuTn4QLjt6E3YDDoRqIBbcZqT5dC1qhaId24/1eaTB8U3uJ0b9iLycqqFdp5F
         3zGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406651; x=1795011451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abnYs5U4L9bKrmw3WJVtrxPRARSoubCvJFVtGzfloC0=;
        b=ILuL4lztDFlTQVSztPxyopIHSyZpxC+4JhwwCx0oxdeI58By9kZZaMQKQL2cc6fr0B
         SHKYm4NIOhoD9s+BatgKuWWwzJ+6J7+C475IWhSNTRG0xqpzJuIqCkwB0D2SFiYKG80I
         pQsF3KFHEkKYMpgL5WFLfv/e/BP/Icn6mwl2crwMzmEliGd2j8lbwZXpVKmVJ47Z0qqY
         5HhxIEeqkILVrnvp+pFoBDaKqIGXnW+gEbXMOHPaOGoZfAfvZPk+Zr5n8mr2WjpwtM4B
         kVF3RLGIw/kn7wlvFdPf7sdSua0i7IeXz3nrO9hJAcIg8/g6EExKEF5Lqg8B6zE/RuhA
         CqPA==
X-Forwarded-Encrypted: i=1; AL+hErEKX50bdg4cCe4oM83rjE8OcTDe3vie71tT1iJ/vucWmYGRzrhs6vk+Zmh35qsUt0TAVaCzX38Nwcu/oFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gsrrMvfQrr/zqaW83gkNTLW6sckLgP+aBA7pSSSVQ6Fa+zHdk
	944pFxnznvzayKdgPt9lzS2czojr4A7wEKdgrBDbkK+xEu67iMVtnJBLau2AYlvmaMqUwDmdDW4
	NQRZ2o76cd4E0NheoAgVSM4a6irJ5x9aVx59n64tgOfp6Z1oaLIL4NEHTp4+GawBswtE=
X-Gm-Gg: AYBFou1+Q0R8iMJRl6758f6tH+0YHtumg+0pQpZN4eZXq/4roDLsyySR7dy5B9cLgsI
	YbNHCtdD9Hdb/TY7lotVbdcCpTN7sUIBj0x90mJ/idTVM4QKym4byC0QNcoJfwM3MBXaAHN3vP7
	muzOd4+/YHix3nIeQzRiVX8rTG2kdcqa0iShFB2oDWzB2FepOz7BRpU7jQlqVgV+H62BVoqzccE
	ipWWAKZHpLroshpU+ZBFYA99LE+6ogmbLiWKTMBTePRcAQyOminRndMTNNTj1j0tRFkFLnSAyLR
	3y5K0mNeVSIHtRG5LTgM6odqox+e9zsyn5g66ymmrenSMddlm7UWc+JoAf20T8xk0U5pZHMOk8A
	nZRuIvPxEreq0nBPAIM1ANeIlUFbVL1D9/82EtqBbBwOUzMmdgk97V360kIaKSNoZdQzCqk44ww
	==
X-Received: by 2002:a05:7022:ef0c:b0:1b2:611a:89fd with SMTP id a92af1059eb24-1b3c0376c9emr2495649c88.45.1794406651007;
        Wed, 11 Nov 2026 06:17:31 -0800 (PST)
X-Received: by 2002:a05:7022:ef0c:b0:1b2:611a:89fd with SMTP id a92af1059eb24-1b3c0376c9emr2495603c88.45.1794406650160;
        Wed, 11 Nov 2026 06:17:30 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm33747063c88.10.2026.11.11.06.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:17:29 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 19:47:02 +0530
Subject: [PATCH v2 2/6] firmware: qcom_scm: Transition to ICE TZ agnostic
 operations
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
Message-Id: <20261111-ice-migrate-tee-svc-v2-2-29d19f6c92ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794406634; l=10991;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=Pmb4MUn+uTR/v5tX3hXQMwdOTSqTP0Nj2WhJpwlwLmw=;
 b=zUWpKqbL5xLNfyVDZAOfcWbF5TnXjKWawJtSfb+GANBALuNeqZjC/8RiYq6IFP46w0FC1EW/h
 wdSksf2sOZ4ByMjJ4yemeiOvrDwWlG7gCN6k6dZk5+Dk6xgHaRXAyQy
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: FJELO5wP_RrG9z1pgUxL2TUUYUmFdZKe
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af4790d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XqWMBioEo9w5ZlPikzoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: FJELO5wP_RrG9z1pgUxL2TUUYUmFdZKe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX8XuDIRhccfdT
 o3lDhYRmnbODIvU0/AB3Y+1PATuD/PaVfMzOZrxhXsKzqFbyLq39C4Ko+e+gkBNnqesk+o4+Ho2
 iU7DAZ4Y1rXIca45wXALFyBHYN2xOrBXhoPiBafONuFywzDlfsA3LRZYTjaouLN5cQRNK3XdXti
 sgaYo73aesv021B6v9sHWbVAUVihskzLanoEYa5ISy2/PvHcCXpMQm7gCDobccmN8T0MMvTdsBM
 FDdpcaYcq2QEYWmZfu7fMY8cQnf6xWjwCCDsouFoc4+LzXt1ZYf+FzIPqY8mDF8NGxQapmK2LCj
 8si4urnhEofFsSg88Is8ZXJFgKtaJijCiFbg+vygtWinwQqQsKRmEa24j1xBpPJmqgypZXLucX3
 +qV77k3yUJiSIF59qSBatNQDfPzhqRH23sdWzx+tGZ5FRo4YgOutLXmJdt9B37ipdu5aAcPz1UX
 Lh87HddvARcm1KlMD2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX49R5bPkgvcpo
 cjXarvoI2bRrXux0t3WW9YTOvRleCrWx30Z5VDJ4pYh0B3XcmBaOTpTPO+QEgaBg2Kq3oFLIVk/
 OTzyx3au8bZenBc0AVgYOrI95BV7ENo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

Transition the ICE related SCM calls to the generic ICE TZ operations by
registering them with the ICE driver and wrapping them in exported APIs
with the same signature.

This prepares the ICE driver for eventual migration to the TZ agnostic
secure programming interfaces once the TEE bus based back-end becomes
available.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 131 +++++++++++++++++++++++++++++++--------
 1 file changed, 106 insertions(+), 25 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75..6b66bcedc84f 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -32,6 +32,8 @@
 #include <linux/sizes.h>
 #include <linux/types.h>
 
+#include <soc/qcom/ice.h>
+
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 #include "qcom_pas.h"
@@ -1397,6 +1399,14 @@ int qcom_scm_ocmem_unlock(enum qcom_scm_ocmem_client id, u32 offset, u32 size)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_ocmem_unlock);
 
+bool __qcom_scm_ice_available(struct device *dev)
+{
+	return __qcom_scm_is_call_available(dev, QCOM_SCM_SVC_ES,
+					    QCOM_SCM_ES_INVALIDATE_ICE_KEY) &&
+		__qcom_scm_is_call_available(dev, QCOM_SCM_SVC_ES,
+					     QCOM_SCM_ES_CONFIG_SET_ICE_KEY);
+}
+
 /**
  * qcom_scm_ice_available() - Is the ICE key programming interface available?
  *
@@ -1405,10 +1415,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_ocmem_unlock);
  */
 bool qcom_scm_ice_available(void)
 {
-	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_ES,
-					    QCOM_SCM_ES_INVALIDATE_ICE_KEY) &&
-		__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_ES,
-					     QCOM_SCM_ES_CONFIG_SET_ICE_KEY);
+	return __qcom_scm_ice_available(__scm->dev);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_ice_available);
 
@@ -1424,7 +1431,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_ice_available);
  *
  * Return: 0 on success; -errno on failure.
  */
-int qcom_scm_ice_invalidate_key(u32 index)
+static int __qcom_scm_ice_invalidate_key(struct device *dev, u32 index)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_ES,
@@ -1434,7 +1441,12 @@ int qcom_scm_ice_invalidate_key(u32 index)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 
-	return qcom_scm_call(__scm->dev, &desc, NULL);
+	return qcom_scm_call(dev, &desc, NULL);
+}
+
+int qcom_scm_ice_invalidate_key(u32 index)
+{
+	return __qcom_scm_ice_invalidate_key(__scm->dev, index);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_ice_invalidate_key);
 
@@ -1459,8 +1471,10 @@ EXPORT_SYMBOL_GPL(qcom_scm_ice_invalidate_key);
  *
  * Return: 0 on success; -errno on failure.
  */
-int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,
-			 enum qcom_scm_ice_cipher cipher, u32 data_unit_size)
+static int __qcom_scm_ice_set_key(struct device *dev, u32 index,
+				  const u8 *key, u32 key_size,
+				  enum qcom_ice_cipher cipher,
+				  u32 data_unit_size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_ES,
@@ -1485,25 +1499,38 @@ int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,
 	memcpy(keybuf, key, key_size);
 	desc.args[1] = qcom_tzmem_to_phys(keybuf);
 
-	ret = qcom_scm_call(__scm->dev, &desc, NULL);
+	ret = qcom_scm_call(dev, &desc, NULL);
 
 	memzero_explicit(keybuf, key_size);
 
 	return ret;
 }
+
+int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,
+			 enum qcom_scm_ice_cipher cipher, u32 data_unit_size)
+{
+	return __qcom_scm_ice_set_key(__scm->dev, index, key, key_size,
+				      (enum qcom_ice_cipher)cipher,
+				      data_unit_size);
+}
 EXPORT_SYMBOL_GPL(qcom_scm_ice_set_key);
 
-bool qcom_scm_has_wrapped_key_support(void)
+static bool __qcom_scm_has_wrapped_key_support(struct device *dev)
 {
-	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_ES,
+	return __qcom_scm_is_call_available(dev, QCOM_SCM_SVC_ES,
 					    QCOM_SCM_ES_DERIVE_SW_SECRET) &&
-	       __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_ES,
+	       __qcom_scm_is_call_available(dev, QCOM_SCM_SVC_ES,
 					    QCOM_SCM_ES_GENERATE_ICE_KEY) &&
-	       __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_ES,
+	       __qcom_scm_is_call_available(dev, QCOM_SCM_SVC_ES,
 					    QCOM_SCM_ES_PREPARE_ICE_KEY) &&
-	       __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_ES,
+	       __qcom_scm_is_call_available(dev, QCOM_SCM_SVC_ES,
 					    QCOM_SCM_ES_IMPORT_ICE_KEY);
 }
+
+bool qcom_scm_has_wrapped_key_support(void)
+{
+	return __qcom_scm_has_wrapped_key_support(__scm->dev);
+}
 EXPORT_SYMBOL_GPL(qcom_scm_has_wrapped_key_support);
 
 /**
@@ -1522,8 +1549,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_has_wrapped_key_support);
  *
  * Return: 0 on success; -errno on failure.
  */
-int qcom_scm_derive_sw_secret(const u8 *eph_key, size_t eph_key_size,
-			      u8 *sw_secret, size_t sw_secret_size)
+static int __qcom_scm_derive_sw_secret(struct device *dev,
+				       const u8 *eph_key, size_t eph_key_size,
+				       u8 *sw_secret, size_t sw_secret_size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_ES,
@@ -1552,7 +1580,7 @@ int qcom_scm_derive_sw_secret(const u8 *eph_key, size_t eph_key_size,
 	desc.args[2] = qcom_tzmem_to_phys(sw_secret_buf);
 	desc.args[3] = sw_secret_size;
 
-	ret = qcom_scm_call(__scm->dev, &desc, NULL);
+	ret = qcom_scm_call(dev, &desc, NULL);
 	if (!ret)
 		memcpy(sw_secret, sw_secret_buf, sw_secret_size);
 
@@ -1560,6 +1588,13 @@ int qcom_scm_derive_sw_secret(const u8 *eph_key, size_t eph_key_size,
 	memzero_explicit(sw_secret_buf, sw_secret_size);
 	return ret;
 }
+
+int qcom_scm_derive_sw_secret(const u8 *eph_key, size_t eph_key_size,
+			      u8 *sw_secret, size_t sw_secret_size)
+{
+	return __qcom_scm_derive_sw_secret(__scm->dev, eph_key, eph_key_size,
+				   sw_secret, sw_secret_size);
+}
 EXPORT_SYMBOL_GPL(qcom_scm_derive_sw_secret);
 
 /**
@@ -1573,7 +1608,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_derive_sw_secret);
  *
  * Return: 0 on success; -errno on failure.
  */
-int qcom_scm_generate_ice_key(u8 *lt_key, size_t lt_key_size)
+static int __qcom_scm_generate_ice_key(struct device *dev,
+				       u8 *lt_key, size_t lt_key_size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_ES,
@@ -1592,13 +1628,18 @@ int qcom_scm_generate_ice_key(u8 *lt_key, size_t lt_key_size)
 	desc.args[0] = qcom_tzmem_to_phys(lt_key_buf);
 	desc.args[1] = lt_key_size;
 
-	ret = qcom_scm_call(__scm->dev, &desc, NULL);
+	ret = qcom_scm_call(dev, &desc, NULL);
 	if (!ret)
 		memcpy(lt_key, lt_key_buf, lt_key_size);
 
 	memzero_explicit(lt_key_buf, lt_key_size);
 	return ret;
 }
+
+int qcom_scm_generate_ice_key(u8 *lt_key, size_t lt_key_size)
+{
+	return __qcom_scm_generate_ice_key(__scm->dev, lt_key, lt_key_size);
+}
 EXPORT_SYMBOL_GPL(qcom_scm_generate_ice_key);
 
 /**
@@ -1614,8 +1655,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_generate_ice_key);
  *
  * Return: 0 on success; -errno on failure.
  */
-int qcom_scm_prepare_ice_key(const u8 *lt_key, size_t lt_key_size,
-			     u8 *eph_key, size_t eph_key_size)
+static int __qcom_scm_prepare_ice_key(struct device *dev,
+				      const u8 *lt_key, size_t lt_key_size,
+				      u8 *eph_key, size_t eph_key_size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_ES,
@@ -1644,7 +1686,7 @@ int qcom_scm_prepare_ice_key(const u8 *lt_key, size_t lt_key_size,
 	desc.args[2] = qcom_tzmem_to_phys(eph_key_buf);
 	desc.args[3] = eph_key_size;
 
-	ret = qcom_scm_call(__scm->dev, &desc, NULL);
+	ret = qcom_scm_call(dev, &desc, NULL);
 	if (!ret)
 		memcpy(eph_key, eph_key_buf, eph_key_size);
 
@@ -1652,6 +1694,13 @@ int qcom_scm_prepare_ice_key(const u8 *lt_key, size_t lt_key_size,
 	memzero_explicit(eph_key_buf, eph_key_size);
 	return ret;
 }
+
+int qcom_scm_prepare_ice_key(const u8 *lt_key, size_t lt_key_size,
+			     u8 *eph_key, size_t eph_key_size)
+{
+	return __qcom_scm_prepare_ice_key(__scm->dev, lt_key, lt_key_size,
+				  eph_key, eph_key_size);
+}
 EXPORT_SYMBOL_GPL(qcom_scm_prepare_ice_key);
 
 /**
@@ -1667,8 +1716,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_prepare_ice_key);
  *
  * Return: 0 on success; -errno on failure.
  */
-int qcom_scm_import_ice_key(const u8 *raw_key, size_t raw_key_size,
-			    u8 *lt_key, size_t lt_key_size)
+static int __qcom_scm_import_ice_key(struct device *dev,
+				     const u8 *raw_key, size_t raw_key_size,
+				     u8 *lt_key, size_t lt_key_size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_ES,
@@ -1697,7 +1747,7 @@ int qcom_scm_import_ice_key(const u8 *raw_key, size_t raw_key_size,
 	desc.args[2] = qcom_tzmem_to_phys(lt_key_buf);
 	desc.args[3] = lt_key_size;
 
-	ret = qcom_scm_call(__scm->dev, &desc, NULL);
+	ret = qcom_scm_call(dev, &desc, NULL);
 	if (!ret)
 		memcpy(lt_key, lt_key_buf, lt_key_size);
 
@@ -1705,8 +1755,26 @@ int qcom_scm_import_ice_key(const u8 *raw_key, size_t raw_key_size,
 	memzero_explicit(lt_key_buf, lt_key_size);
 	return ret;
 }
+
+int qcom_scm_import_ice_key(const u8 *raw_key, size_t raw_key_size,
+			    u8 *lt_key, size_t lt_key_size)
+{
+	return __qcom_scm_import_ice_key(__scm->dev, raw_key, raw_key_size,
+				 lt_key, lt_key_size);
+}
 EXPORT_SYMBOL_GPL(qcom_scm_import_ice_key);
 
+static struct qcom_ice_tz_ops qcom_ice_scm_ops = {
+	.drv_name = "qcom_scm",
+	.ice_invalidate_key = __qcom_scm_ice_invalidate_key,
+	.ice_set_key = __qcom_scm_ice_set_key,
+	.ice_has_wrapped_key_support = __qcom_scm_has_wrapped_key_support,
+	.ice_derive_sw_secret = __qcom_scm_derive_sw_secret,
+	.ice_generate_key = __qcom_scm_generate_ice_key,
+	.ice_prepare_key = __qcom_scm_prepare_ice_key,
+	.ice_import_key	= __qcom_scm_import_ice_key,
+};
+
 /**
  * qcom_scm_hdcp_available() - Check if secure environment supports HDCP.
  *
@@ -2820,6 +2888,18 @@ static int qcom_scm_probe(struct platform_device *pdev)
 					     "Failed to request qcom-scm irq\n");
 	}
 
+	/*
+	 * If the ICE SCM interface is available, the operations MUST be
+	 * registered before the SCM API is published below, otherwise
+	 * ICE driver could attempt to call the ICE SCM pointers before
+	 * they are registered and assume that they aren't available.
+	 */
+	if (__qcom_scm_ice_available(scm->dev)) {
+		qcom_ice_scm_ops.dev = scm->dev;
+		ret = qcom_ice_tz_ops_register(&qcom_ice_scm_ops);
+		WARN(ret < 0, "failed to register ice SCM ops: %d\n", ret);
+	}
+
 	/*
 	 * Paired with smp_load_acquire() in qcom_scm_is_available().
 	 *
@@ -2876,6 +2956,7 @@ static void qcom_scm_shutdown(struct platform_device *pdev)
 	/* Clean shutdown, disable download mode to allow normal restart */
 	qcom_scm_set_download_mode(__scm, QCOM_DLOAD_NODUMP);
 	qcom_pas_ops_unregister();
+	qcom_ice_tz_ops_unregister(&qcom_ice_scm_ops);
 }
 
 static const struct of_device_id qcom_scm_dt_match[] = {

-- 
2.34.1

