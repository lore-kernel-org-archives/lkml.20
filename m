Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597420;
	b=IdM+QXx41ZnPYHEQiZYA+qAG+YXyYcdH/DU3Ysy/7p1cCMcmUJKd17PBBTSoXYrnbT+q
	 YxVHLJNoB6f9cIhVkdrUNqPE+3Jmwdza81i0qU4nXrowF05My+ZJg9F7YnPut4wL7A/gQ
	 97rQXjRDcpabZeP2lVz0YwbSVja1Lx3WLfmGsfkBcCoYWftEUMF0ha9hNeqdjRZAqWZmQ
	 nXNiSnn6lV4OeTJ0fTwLcim1+1Mq0CJhkUNn/f1PU4yQlHH0DhzodrFh2hdIpWLWy/F0n
	 BYIppDijomybPcAzAfLLryQb3jIAnS/0ePTpa1nJFXl7dGeoaAZ1/ZGjUX3HWqyPwTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=olpwlg8gEN8Egx4CaSMemLhWlD9PqLTTy09YtNXp7mc=;
	b=Bma4cmNoYjHXpNP+eC3VHNO+t1KIBfqepATTXjnL/unqxDcIFUjztSKR+F/ThvZtDum0
	 ARovwcWda0jWhnGOCZCP9FJOPQp41mFcNaBuJlJC6CY7KwF+PamEwX9BVa3cIaoSYnb/G
	 vtpm1e5UBG7BmkGtQoZbUwe/sJsCsDPHNac7SRWnnpGVHpVrjWhOKzQc04RexLk6+K6YE
	 h3+zsI4WV5VH0Q21WoyqsKexA3qesFlyae8S4filVDC+e6L1aKbHSOuGzHmGw1p+rcj/P
	 aKO1XKRP4lNs3Oo3/ylIlWrIJH95t8prrbadDVcc6YlIjUbCHBqDuY03VLtMPKAManQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=opD580dg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kM88Pf27;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C8460A4AC7
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C8460A4AC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=opD580dg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kM88Pf27
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFUEA11482651
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	olpwlg8gEN8Egx4CaSMemLhWlD9PqLTTy09YtNXp7mc=; b=opD580dgmjVHGF7j
	ultv2wYrextwU+njt9iZKFVmwCk49SsMVHs8pKCwfRdsZQ3xyMGhLvOBj1/xxOwB
	bLxOQFEnAYrFf4LQlPKDN6LpoBPbmVkWfPphrD3MW2bSEhmGUr41fYW8E7yW1w4A
	CUtX6VFqn+z2nujwac2MOay2BTIlHpPoIXrKQ8XRRS+axXVr7qtmF9GPVIGEnPkm
	/i58lZlvSE8vsI7X2DDM6lsjFjJ/7L91sfvOpEzZVIjo+bmh9xZR2APBM0WkQuGY
	8rlyC1ztHeqKQIC9NIM3tBXaGtS4FAWdcDCMaYKw22bmyy0+Cc2x2+eGIbQ+hE4n
	FU9zoQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs04016-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:43:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso40787eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792597417; x=1793202217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olpwlg8gEN8Egx4CaSMemLhWlD9PqLTTy09YtNXp7mc=;
        b=kM88Pf27fk+I5jhfQsiO85VWtDUaGH1jGOZeQGCDPPw16uTj4Replfju2AwsUNiiEM
         xV7DaVt7xl6kJZmvFAP6kp1rlZk4B6ldlMt99sStOlrm/BHvc8Jrnqa/hgEGQKMrunoS
         V3A2RY6f58f0dUknN5KKVdZNuN99PVgKKEL6MMgGrZL2DE/WyK77HkoLcK/PuucUZI3H
         7Rb3VSs+YSa1UzQOsnvZQTIyc8hx56hkNgrPR1XWz7nwf6u7S/avkWZunLw121DFu1qE
         WqloLPuZQv9Vidgqzb9dYrPcZ6iZ37mXYAHa+g7C0tA4YBdI17fJL71Lh1nKnjHPsG7s
         gAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597417; x=1793202217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=olpwlg8gEN8Egx4CaSMemLhWlD9PqLTTy09YtNXp7mc=;
        b=r0735XjtcvISrE3DucO3D37f29b2IeYBsU7bbW4vQQK/N4UIRcVdk4WoWDkKXSr4Et
         4YefCkSVoJXUfvPNgKOp/Kvnq2s89jLZOMViq/zZPej7uGW6hKtDBhLc56eztcPqtXX+
         ew5dizdIXdfaNXmSnZdILSQ4TB5prD3jRBgUu5xvhxY4zlLvm0kjBQ/I5GJt4KqC+DRD
         kg+M8JN13m+hKGUirTwU+zt2wxbfzgOJ5wb46un+3zRgzEtbxDVAMHna6OfCT1XjqAbz
         b+WcpU0AblCJ3CvZnyXVdqiaahsaZZlIYBDrmh+8DDbnJ/IYoGd0pxGnnDARoerJrJbL
         A47Q==
X-Forwarded-Encrypted: i=1; AKwUvBzmZIjMdpONlKTSUZleuwx26gpUiAO/XViCD3bMbRdbCz2nzFMS6nkRzxGTcoHcdvD+8wNc4ZAmSp6BE7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpgO32itrgqQABRPf6oPPYGbR/V8tvOzXcAJmCqX5Q81KHjrh+
	j0PSIADH9HjDDVzyO8Y4NgSSoBTq+tZSXqSA3w9QwIh78dJmyDEXSccqKPwwqxZxxVgXXTx6vkF
	wj47UfGq9TEFGnnfH0pdgvZlMLj8E80sZhB/PifdMCK3OxdsBXAH+HFlO0Q50d/45JRgW8/pAb7
	Q=
X-Gm-Gg: AYBFou0PWbnsVGAlB1ixhpKqSeIPDI29tDq91qP58bneJ2PoyP3bLU0T332G6IFJ9vL
	hyWy8wjPjONexKxYMaTlg95Zu7kneRESYIbjHciJNtJUpDKCRCYchzkWNqank4sUQlWe9ccF3Zl
	mUKgN0b8jWEWvE+yGZaS3tkWiVYoWAOY3qpA0YrNE1C0VoidgGM5i/SfrNdwlp7lhq8QY6r9roh
	8JyqFp0t5x69Pa4RwCcFKY6EWqnDv7HiMFgDmzfFe3161fM8VblFiOKAOZl4rOFk8Th0CnIzIiT
	Ffa4fgnFVWRpa2mn9JJnbE5R1eMyvFmP6augdtDT/XacH0pfnHrY10VTMin1scSy2D1rlvUfNvJ
	WA0pubBSDATGl9Gr6SFBi70jx
X-Received: by 2002:a05:7023:d02:b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-190a5e66402mr2859986c88.12.1792597416435;
        Wed, 21 Oct 2026 08:43:36 -0700 (PDT)
X-Received: by 2002:a05:7023:d02:b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-190a5e66402mr2859940c88.12.1792597415526;
        Wed, 21 Oct 2026 08:43:35 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1902f96dc4bsm7937768c88.0.2026.10.21.08.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:43:35 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:13:08 +0530
Subject: [PATCH 2/5] firmware: qcom_scm: Transition to the generic ICE
 service
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
Message-Id: <20261021-ice-migrate-tee-svc-v1-2-b035be7aab0a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792597401; l=11327;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=Hi4fbfuKHFRA6vICdQw/g8HjK6iIui3Vq9W41jHlmw4=;
 b=yW3RMHXlidVdDxcYsjzhZpUnW+g2kakE0StdsmRlLie/Y5+nffcc9AxqRFytRBj/M5KFlrInh
 0r9PdB4ZFLwAAp397TG4jQiYWBadO3ZiZylSRnc31Zchedls818tFOU
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8ddaa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=t9iFzsT6rLjdDGhdGP8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MiBTYWx0ZWRfXzPAv0a6ITCwb
 a2xxt5j4APbxnOGUxfF1jKWNl30UbSfHlRd/lhovKkOu1NmJv3oke5Zl39F4FYZudwTbdFY6LR/
 w6GqIHvMauP1XOsRyj8W2lUa85BuY8eFluvtIfpL8wl3P2k41cF2XUxOhVRREEjgHbGPBGUId2+
 ikM/EKWnWGtqJmpNa5Z1+3E3Xjyhsfja0xSTln0HgWpWLmfGe+bJ8Rjq8Mmkk2EozE5PfXerwHF
 pNhRra307Lu3vYVV55F/304J5HJbaYuBURHBqkenoudKcBRlrlqjFULKZr10p/bVV+FbJs4A1Oa
 Ml3bsr/IX4A87lozuE1YRTR4JTvnLq/26X5KfWWz6w36NaIDB1dmqVPo8KY0SWYmwr1rgEL9gz5
 u5ZzdOzNv+RUEY10voQ5/cd4hjVNnPa1CW4aA27jEpnJXRW7T9na+hZeomqZUMWXxA/g7erdR+b
 OKoF1/TLKEVwD5CP/mw==
X-Proofpoint-ORIG-GUID: sxIb5kADvzPXkq6yU6c4FddNm6D2CvKE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MiBTYWx0ZWRfXxOuWHQrfWDg1
 ryAdKPSTzzTMlCbmm7pbtI68DJGrZpTrpjTFXsloIVpXvXyNay4tHDoIY13taACMSt5AOueF9G5
 6YZ+RuSEESC06eniRrcnWSlrtiGazhI=
X-Proofpoint-GUID: sxIb5kADvzPXkq6yU6c4FddNm6D2CvKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210062

Transition the ICE related SCM APIs to the generic ICE service by
registering them with the service's operations and wrapping them in
exported functions with the same signature.

This prepares the ICE driver for eventual migration to the ICE
service from the SCM driver once the TEE bus based back-end becomes
available.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/firmware/qcom/Kconfig    |   1 +
 drivers/firmware/qcom/qcom_scm.c | 123 +++++++++++++++++++++++++++++++--------
 2 files changed, 100 insertions(+), 24 deletions(-)

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index e2d1c17296c2..6cde1704dbc7 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -36,6 +36,7 @@ config QCOM_ICE_SERVICE
 config QCOM_SCM
 	tristate "Qualcomm PAS SCM interface driver" if ARCH_QCOM || COMPILE_TEST
 	select QCOM_PAS
+	select QCOM_ICE_SERVICE
 	select QCOM_TZMEM
 	default y if ARCH_QCOM
 
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75..9aeb2cefa77a 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -13,6 +13,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/firmware/qcom/qcom_ice.h>
 #include <linux/firmware/qcom/qcom_pas.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/firmware/qcom/qcom_tzmem.h>
@@ -34,6 +35,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
+#include "qcom_ice.h"
 #include "qcom_pas.h"
 #include "qcom_scm.h"
 #include "qcom_tzmem.h"
@@ -1403,13 +1405,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_ocmem_unlock);
  * Return: true iff the SCM calls wrapped by qcom_scm_ice_invalidate_key() and
  *	   qcom_scm_ice_set_key() are available.
  */
-bool qcom_scm_ice_available(void)
+static bool __qcom_scm_ice_available(struct device *dev)
 {
-	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_ES,
+	return __qcom_scm_is_call_available(dev, QCOM_SCM_SVC_ES,
 					    QCOM_SCM_ES_INVALIDATE_ICE_KEY) &&
-		__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_ES,
+		__qcom_scm_is_call_available(dev, QCOM_SCM_SVC_ES,
 					     QCOM_SCM_ES_CONFIG_SET_ICE_KEY);
 }
+
+bool qcom_scm_ice_available(void)
+{
+	return __qcom_scm_ice_available(__scm->dev);
+}
 EXPORT_SYMBOL_GPL(qcom_scm_ice_available);
 
 /**
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
 
@@ -1705,8 +1755,27 @@ int qcom_scm_import_ice_key(const u8 *raw_key, size_t raw_key_size,
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
 
+static struct qcom_ice_ops qcom_ice_ops_scm = {
+	.drv_name = "qcom_scm",
+	.is_ice_available = __qcom_scm_ice_available,
+	.ice_invalidate_key	= __qcom_scm_ice_invalidate_key,
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
@@ -2836,6 +2905,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		qcom_pas_ops_register(&qcom_pas_ops_scm);
 	}
 
+	if (__qcom_scm_ice_available(scm->dev)) {
+		qcom_ice_ops_scm.dev = scm->dev;
+		qcom_ice_svc_ops_register(&qcom_ice_ops_scm);
+	}
+
 	/*
 	 * If "download mode" is requested, from this point on warmboot
 	 * will cause the boot stages to enter download mode, unless
@@ -2876,6 +2950,7 @@ static void qcom_scm_shutdown(struct platform_device *pdev)
 	/* Clean shutdown, disable download mode to allow normal restart */
 	qcom_scm_set_download_mode(__scm, QCOM_DLOAD_NODUMP);
 	qcom_pas_ops_unregister();
+	qcom_ice_svc_ops_unregister(&qcom_ice_ops_scm);
 }
 
 static const struct of_device_id qcom_scm_dt_match[] = {

-- 
2.34.1

