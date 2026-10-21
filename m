Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597430;
	b=GXm8sLnu2hRWxoNF7CBQbFYbXrB6KADH6SS8sfQZJRo+K3lk4BrldMOgQNOdWLwXBL+l
	 v0bIbmXPw9MIuK+W97cvMggxqHlChH0NyN1dUnMnJ/GrNhM90zqXdTB7SdfNbp0VKXdpH
	 9Lo7VbLPgFt+CXFSYGPOPpniNf0NQFooGJzg6ff0Dt/jm8NxWk4BDtnIwQKeB6P9Ksl4y
	 UXc299sy0Z8ij/ac0eGXZ9l1Iky5LWlcu5R8jV7ORGlcBpYLl1+AgxvAmZx32ez/6ZA24
	 4JDTKzGjEYeHZesyxm0U/rNuoDTrf2PM1WRwPGq+7QJfIZUCTgjkNihstNWd4xocytg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZLWd/oX18V9jLjSX18NKFAoygb2L++PIgsVFAZj+Sws=;
	b=XS0G3N38ho494nZWfwEBNffNdo0rei9mwJ9403xxX1Gq9oUhAkNJBstYYab3kD9AktGa
	 HQkWQwtH7i57wxVx4PvCa7fh4I1KoRSrfj19w/ZODDaPklurEIwPGqcIGdoXw3Qn8kqdo
	 6yTbDayXDKpiZwmgICP9L9H1WfvS6gejN5HHi71kiQy5pV3nWqh8TArVdbHSXNhndqfml
	 Am7uMWifQYmnnaro5Cjj7h9kh1zXobGkzjfKTcDMAxuJQZ52EWEFYdczL2wv4GfmHwQ5J
	 nlfNYlIKp5uigi2eA8ZbREpQL4PCHzPggPdhQ4txyYkRW413BNtCnmdyAM1Ri9r7q6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MOJoRxa/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ERvtbX17;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1637660A2638
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1637660A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MOJoRxa/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ERvtbX17
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU9Mo682672
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZLWd/oX18V9jLjSX18NKFAoygb2L++PIgsVFAZj+Sws=; b=MOJoRxa/gFS9MKEO
	Q6ZlB+mB/8FFJTi9hgIjaiykmuEAU8n8T1ZUU+60omqyF8OShj2cZUZM+77e0H9R
	Bfy7OVtN6UctT2RPCsbIm9wQfTP6vf4HNF3DMHWEZ2O39IaR8lLoEAay5EhiLn6E
	Y9pYOAkbHS3jNuCoesjjOd1EFqcAxMbJZ88PfYq9iJLIOZJ50WViMsTu9mqVYQ1L
	1YlV45ACaF4v1DMVk2mOo6P+s7xb8pYfNTRlZ9ZfjlwkbJ3j2kBdE/B7at0pz3Is
	4IWns6PeVDUUNNxoH2gBvjr0AeMSzOUZyLNgL2ybeHbrqDK9yDV21mE90BV15ELT
	Uk52pQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vrmw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:43:48 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-155a75f91e1so1102696c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792597426; x=1793202226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZLWd/oX18V9jLjSX18NKFAoygb2L++PIgsVFAZj+Sws=;
        b=ERvtbX17av2gSYEKCenvZowLkSPL5JjX2+2jo7cRI0Qg3zlmBqb4DgVZi4cU85lvsD
         01nSRi8+9jaq/2Pb08H7keuFuUHgYbBlij1I1rMGOfJmOF8VgfmnUrvnZ9eQvUe8T6gw
         zzCONaABhE010zXRbJRXJbAd6TR/2pHqXyyhABdOjn0sDAfocc3wop2gIKOgvG2vXR1H
         nNhFTLu5s6yZ7vD3MKc5kVCDqN3Lm0A4zSIQ+1DvAhWGwsB63NUuKbHB4LAbCCXUQn/y
         fdbtnNkHkoxAv8UuSHjw7TNEShLz42ua8yB7l2+MiAc+AjDNvO+VPTXVDqDah/Mk9r3r
         Eycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597426; x=1793202226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLWd/oX18V9jLjSX18NKFAoygb2L++PIgsVFAZj+Sws=;
        b=2peGdZxyC71JEMpcL8ldjMHC0/BvcuGE7FrayRsc+9FtMthKsgzdd8z6arBTwVDl2i
         C9mhDLoWhOo/q8IwCeX4ipvBzqh4pyECC9DZRy13ZyJcUCUrqaJbYQYpj6R80qp/3Pp6
         b+bfLxMDhJp1ZBir1wP62T16MFFBY4mZXlJrXXbGJQB0uBKHgG0g03jmtP2SzeU7JkaO
         u6Ki6w4Z1pdj9JiPnlYVKLUwrZ/yn0Xq2/3YFk+DQUsf+2Wgota4PC0rq5ofiRNnju0X
         DlFiX9kj0+bjN4nKK7npgCB+xmwKmvk0J3yVRQwhpuBftZjKZXdU+1jVMgEAh0h8ZEbu
         cBTA==
X-Forwarded-Encrypted: i=1; AKwUvByVfv9VRmWUo0WcxWGqEvH4h7Ylc7xcKF6KcnTdb08H/mxu3R44lcm07zOz/j3l9XMQuKD608yEFj5a1RA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9yo8lNd5NNDScO8Kr84OQZJM2RWmfhAkFQD9EOEsY3+sYcIDS
	FKGugI5uET73+vzS9r5GTleMwi81kZqi+RBQq43tu1yy8jRArNqf6+fAPZHPX83oIfutAgXC4EB
	9yV99XaR+60pOJUMXOWz+YT6onS/I5GqKVjKn9LsHS5Piqt+oPwQhgzqWmKugDNgYNx8=
X-Gm-Gg: AYBFou2yMitgrpGENyKgATMTAqsvVauO9hpDjJGpvOFR2vtfv6C11qUk5Ii5Wh1jGww
	HWwqpXrYSejdVcwyGwshWspNzTQKrVfjTtZNqukYFOToBNDuNBK82E8yhBpszvyvCsQVa6TEfhu
	LARv39YEMfKQ5kCu9B2gCCXeqWpxepCGSh0HCIKQyz6jr21xqzI1b+D0uCgPtQJdXuMUVTvjePn
	2AWFuIbmVwxrrp9Sv0Q6xwbQKG9IDvcuJJ3AOCwGi61pg10e/M9lcs3nApXxRoJjaJR6/IlwwJ2
	2fhlZq4awD2MBRp73iyQW+Ea9pZ03gAfEMTn5rwiFqprgsG+yZaufm7DyTKngResatxtH43IU0L
	zK7C5mYY5/1DcHoRZUDRcPp6A
X-Received: by 2002:a05:701b:2802:b0:166:f097:6f10 with SMTP id a92af1059eb24-18dbed4c47cmr5963920c88.11.1792597426071;
        Wed, 21 Oct 2026 08:43:46 -0700 (PDT)
X-Received: by 2002:a05:701b:2802:b0:166:f097:6f10 with SMTP id a92af1059eb24-18dbed4c47cmr5963882c88.11.1792597425270;
        Wed, 21 Oct 2026 08:43:45 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1902f96dc4bsm7937768c88.0.2026.10.21.08.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:43:44 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:13:10 +0530
Subject: [PATCH 4/5] soc: qcom: ice: Migrate to the generic ICE service
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
Message-Id: <20261021-ice-migrate-tee-svc-v1-4-b035be7aab0a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792597401; l=5281;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=+jNoF4nSNn7Yf6UxxTwa2YXwE8gWaW0+Cv1ap5fH/wQ=;
 b=Bz4X6vlOflWQsqEMHIZ+6+71ELhtmKTb4xX9ZL7PtoeTcrbbPN/rBptEqXWLrPhwgM46yjRtQ
 whk++DOpC2JBavv3FIN7kko7Y4o3NtoRuDSvRhB11mUWYOp+o7YQjub
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: CeRC2LF32xtVKwdqQd_XYcGzcA1T0Oss
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MiBTYWx0ZWRfX068XnoeB85Aa
 0XsU3GAPvdOlL/iPw+G5sV65HyMvUxQCpY9oQ60+nXySWHiyJ6yckwPAM1ehrjlqqw2JH6Asl7x
 bEP3s5neCLBbGo0DH/ecOFwXPWR0f0g=
X-Proofpoint-GUID: CeRC2LF32xtVKwdqQd_XYcGzcA1T0Oss
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8ddb4 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zftoU6j5KQ9PehORJHMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MiBTYWx0ZWRfX+YlJksJTb2A9
 xJzJ2uGG2M2Pqn3hsZ5I5OSrsC8EeHKD3S3cKRmaD7hpFMifcts3moV3lbsbE7YdClyQ3/GO/w/
 uc4gO7DGHOmW8NQMoO0Z9n/GNBtTvSUL4eY1WdXZp88b2hbocuZXWvfy8S7Bx0LHd+QHdrAZCSz
 IoForXuRKrqEq3EXQxfDinI+X9OnRFVMpJRm7OGLeDrEc77qNqq90kihxD1z4tMGHyGHblrsSJT
 mqQ67U9l0gUW3yxowdDEcODyKHKHXhyfYMmKdeR6pX9ipczlNeOyD65RCH7LWz8MTLe34jFUWbs
 tIsn8aMf5dyDkpjDDv7kZPrUgHk4gaO5KKCTQVB3QW+LUo/85B1tTc8q2GQwS+AcIUL8DBwLv9a
 BER2J3BJWhLP6zDPDprkkA9kbG64ZtmD13DY+B6xHx2aQ0Sc/EwPABONrUNaDr5Zk6u99Dw2/z3
 oFnjVcjI2Bpao7pw+fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210062

Migrate the Inline Crypto Engine (ICE) driver to the generic ICE service
which re-directs calls from the driver to either the SCM or the TEE bus
based back-end driver at runtime.

This makes the ICE driver agnostic of the TEE firmware running on the
Qualcomm platform.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig |  2 +-
 drivers/soc/qcom/ice.c   | 30 +++++++++++++++---------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 535c8619197b..f68973efcabb 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -295,7 +295,7 @@ endif
 
 config QCOM_INLINE_CRYPTO_ENGINE
 	tristate
-	select QCOM_SCM
+	select QCOM_ICE_SERVICE
 
 config QCOM_KRYO_L2_ACCESSORS
 	bool
diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index e256595b9826..c075cab6f7fd 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -18,7 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/xarray.h>
 
-#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/firmware/qcom/qcom_ice.h>
 
 #include <soc/qcom/ice.h>
 
@@ -176,7 +176,7 @@ static bool qcom_ice_check_supported(struct qcom_ice *ice)
 	 * advertise support for raw keys or wrapped keys, HWKM cannot be used
 	 * unconditionally.  A module parameter is used to opt into using it.
 	 */
-	if (ice->hwkm_version && qcom_scm_has_wrapped_key_support()) {
+	if (ice->hwkm_version && qcom_ice_svc_has_wrapped_key_support()) {
 		if (qcom_ice_use_wrapped_keys) {
 			dev_info(dev, "Using HWKM. Supporting wrapped keys only.\n");
 			ice->use_hwkm = true;
@@ -352,7 +352,7 @@ static int qcom_ice_program_wrapped_key(struct qcom_ice *ice, unsigned int slot,
 	struct device *dev = ice->dev;
 	union crypto_cfg cfg = {
 		.dusize = bkey->crypto_cfg.data_unit_size / 512,
-		.capidx = QCOM_SCM_ICE_CIPHER_AES_256_XTS,
+		.capidx = QCOM_ICE_CIPHER_AES_256_XTS,
 		.cfge = QCOM_ICE_HWKM_CFG_ENABLE_VAL,
 	};
 	int err;
@@ -370,11 +370,11 @@ static int qcom_ice_program_wrapped_key(struct qcom_ice *ice, unsigned int slot,
 	qcom_ice_writel(ice, 0x0, QCOM_ICE_REG_CRYPTOCFG(slot));
 
 	/* Call into TrustZone to program the wrapped key using HWKM. */
-	err = qcom_scm_ice_set_key(translate_hwkm_slot(ice, slot), bkey->bytes,
+	err = qcom_ice_svc_set_key(translate_hwkm_slot(ice, slot), bkey->bytes,
 				   bkey->size, cfg.capidx, cfg.dusize);
 	if (err) {
 		dev_err_ratelimited(dev,
-				    "qcom_scm_ice_set_key failed; err=%d, slot=%u\n",
+				    "qcom_ice_svc_set_key failed; err=%d, slot=%u\n",
 				    err, slot);
 		return err;
 	}
@@ -422,8 +422,8 @@ int qcom_ice_program_key(struct qcom_ice *ice, unsigned int slot,
 	for (i = 0; i < ARRAY_SIZE(key.words); i++)
 		__cpu_to_be32s(&key.words[i]);
 
-	err = qcom_scm_ice_set_key(slot, key.bytes, AES_256_XTS_KEY_SIZE,
-				   QCOM_SCM_ICE_CIPHER_AES_256_XTS,
+	err = qcom_ice_svc_set_key(slot, key.bytes, AES_256_XTS_KEY_SIZE,
+				   QCOM_ICE_CIPHER_AES_256_XTS,
 				   blk_key->crypto_cfg.data_unit_size / 512);
 
 	memzero_explicit(&key, sizeof(key));
@@ -436,7 +436,7 @@ int qcom_ice_evict_key(struct qcom_ice *ice, int slot)
 {
 	if (ice->hwkm_init_complete)
 		slot = translate_hwkm_slot(ice, slot);
-	return qcom_scm_ice_invalidate_key(slot);
+	return qcom_ice_svc_invalidate_key(slot);
 }
 EXPORT_SYMBOL_GPL(qcom_ice_evict_key);
 
@@ -473,7 +473,7 @@ int qcom_ice_derive_sw_secret(struct qcom_ice *ice,
 			      const u8 *eph_key, size_t eph_key_size,
 			      u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
 {
-	int err = qcom_scm_derive_sw_secret(eph_key, eph_key_size,
+	int err = qcom_ice_svc_derive_sw_secret(eph_key, eph_key_size,
 					    sw_secret,
 					    BLK_CRYPTO_SW_SECRET_SIZE);
 	if (err == -EIO || err == -EINVAL)
@@ -496,7 +496,7 @@ int qcom_ice_generate_key(struct qcom_ice *ice,
 {
 	int err;
 
-	err = qcom_scm_generate_ice_key(lt_key,
+	err = qcom_ice_svc_generate_key(lt_key,
 					QCOM_ICE_HWKM_WRAPPED_KEY_SIZE(ice->hwkm_version));
 	if (err)
 		return err;
@@ -523,7 +523,7 @@ int qcom_ice_prepare_key(struct qcom_ice *ice,
 {
 	int err;
 
-	err = qcom_scm_prepare_ice_key(lt_key, lt_key_size,
+	err = qcom_ice_svc_prepare_key(lt_key, lt_key_size,
 				       eph_key, QCOM_ICE_HWKM_WRAPPED_KEY_SIZE(ice->hwkm_version));
 	if (err == -EIO || err == -EINVAL)
 		err = -EBADMSG; /* probably invalid key */
@@ -551,7 +551,7 @@ int qcom_ice_import_key(struct qcom_ice *ice,
 {
 	int err;
 
-	err = qcom_scm_import_ice_key(raw_key, raw_key_size,
+	err = qcom_ice_svc_import_key(raw_key, raw_key_size,
 				      lt_key, QCOM_ICE_HWKM_WRAPPED_KEY_SIZE(ice->hwkm_version));
 	if (err)
 		return err;
@@ -565,11 +565,11 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 {
 	struct qcom_ice *engine;
 
-	if (!qcom_scm_is_available())
+	if (!qcom_ice_svc_ops_registered())
 		return ERR_PTR(-EPROBE_DEFER);
 
-	if (!qcom_scm_ice_available()) {
-		dev_warn(dev, "ICE SCM interface not found\n");
+	if (!qcom_ice_svc_available()) {
+		dev_warn(dev, "ICE firmware service interface not found\n");
 		return ERR_PTR(-EOPNOTSUPP);
 	}
 

-- 
2.34.1

