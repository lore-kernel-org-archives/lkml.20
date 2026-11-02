Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612868;
	b=q2wm0bveeBduqFZ8g3WMClqS+m+5K4oDyYSeB/vCyJ2LY3bSeuLaMfHuXznprAC1olsP
	 aHKqLdiyhzH3QrtiuZDaqy3InZ2LoNYCDOXphJThPizaDZWRXIpScfhyhUat7r/R1PzuI
	 w4PBH8iAPHemua6tpRc5/zcTXAHrKCnTnKDdF0w4FSRcSNW4Q0IyGwhbSj4S9ie1quF/Z
	 UUZnICebHhcfZAgGVcX20CkcVkbRCKc6MK7IjIxqqRSMoJI5x9WDMH7vzy4yEjGlZVjCc
	 8wqyAn6PVxdYTfLzd1kaiWVbZ/4907WULelPbfwAw8Ax+m4MMyxqxc11tNFUOfdDW1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EopcEXVJlshc6fFdssRRk7Nmikd8/mCpBz6B8w6T8bU=;
	b=wWOq46iw8xo9YQKjrli+JKgefcyh5WHQF/yZM1Q/0SNlEIPbMS+fWf+DH61nEAkL9OKo
	 6c0zr8Hzf3z/A0Sz9qIYP1EbdqYgLDtc3Wc32glUYgLOw61UA0A0cV/eY31jv+zP2m1rm
	 xONFHYBtZaF8x8A4eGrXl8Pra4pAOh0wLzg29z14zQLCcGVhY40BU5qAoSM8dYQ32piyq
	 2mq38Gbt5lsG79d1ExsYwp5qrNyD5zmMTejEeD7ZSVOUdPGHKlAMrmdjto3yyarpBu7jD
	 GAhRvhKSpY4d7n3b6kYkQIpRTpFJOXAZbl7/4LHsUhPzfbAGd0+La98paHV9ervwhLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mHk190Vv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UmUQHS54;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8B660A2608
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F8B660A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mHk190Vv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UmUQHS54
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A299xdO3430281
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EopcEXVJlshc6fFdssRRk7Nmikd8/mCpBz6B8w6T8bU=; b=mHk190VvNDxCyjAU
	jOxW7DpEW2RjomncdQIKanJwYxnrHQJMQY9UmATTa0BDsg3mWuIOfYG061G6MVS+
	XejDBe+qkRtwJaoNrE7wd4SAwzIbtf6XuxD48nHNNa0aS/4ckAUgNhrYWLqMdvv0
	bi7qbkUGHA46QmGRANwLgMS/VN2AXkpYoHQNVOqo25kZR+mnApoM7z2cxK0XgWx2
	7s9EAhF3BXl8jJ25WV6ppjLBA9AcShdez45U/fdIBEHFEo220B7frMKWCN7Fm6W1
	2LHEUU5+NDs+VRF7f7+951XxvHmVJl5PaxG5Vx8PA8SJc2wC2AihKqig823GhfXq
	E/ANcg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmerpkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:47:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so2937381a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612866; x=1794217666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EopcEXVJlshc6fFdssRRk7Nmikd8/mCpBz6B8w6T8bU=;
        b=UmUQHS54WrXpI8T1A9R5DQMowWD8xbHKQIt+yflf9wnPSV9RhlufI1d8ul0lI1QCV1
         VWLj5kwQTyPIWDxhEBKRdsaep9oeqapG7ELaKngyvscTV5aBsaUhSxen9oeFp2VcO+F2
         ECFx7Z7bNXboRvjEzcpcfvKzqWTMdWp0CM51N72AJ/nBCmIvrc98LK6b0WWJV3Hy8uLV
         FLF6EHoyhKisGyP8ZwxbxfOofwJ2zDXM4Kx8Nwd3ax3HUY/WIHUJ+SXNuWXawML7lVHH
         UXpV4Hw6Sf8Tt1YTI2i7AsnT/OrPq6COHU7EPAJhYxvdi33HdPo17jpiwr3SzEBFU1na
         5CdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612866; x=1794217666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EopcEXVJlshc6fFdssRRk7Nmikd8/mCpBz6B8w6T8bU=;
        b=Vh1tufTzIsfZeZIyWPP5jqBncHqcbKWueBvOtuHiF46l1ru83PEpSBHBmxZu9za/cH
         U/FdDUXoEQL5sKSyvXDUWQxLgfC1O4eY5mGJWdIB5GH1LoVGKBUiV3hJtkKEcuXTFLiv
         1L+BjYbYifxJzqYQLFbvQyxcDeY+eg2Ez/RjTKJGCyGJD/0FSxT0vDHSjahKDe791DjD
         /v8zWhYw0JGWUmzWh3BtlbcRxkdT09WxaRxP0Y3Afd7goTl2oGpeSpmJo4quDnIu6swB
         PqV2pVR8ceRtQSuwuJxXKqcYtmv70iM7ZET8VcwTFhhlojdsG+563myv+mfOeZfNdXr0
         95DA==
X-Forwarded-Encrypted: i=1; AKwUvBwHmiB8m98pdnLAaUQz1y/ylqyBFahxPIXpkh+CgXsTnIL6i3QIGU6tlqExv8NkxEhhnns0B9Eh8uh/qFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1vYMCWztAATK1viU555p5q6889Z6r77GO1GdTBiuMQp0+jsQZ
	e/NY+othH6JsMelj+nPxp2KclZozuIyeaWfLYEh2WpQKBRcqPX33k16eNqlswqWFkE/faiGoLeM
	SaCwsYvoqIP4MF0HKLS/9lP73D9X9dnPvQA/BcSX0joUSC0ir4nI8G8+LufPmTfckWG0=
X-Gm-Gg: AYBFou1/LrvEF19b0iLKyM6wbnjY7ql0nH6POabQxKVQyOdxAXXyikaTbySMW4XXr4k
	5JizmgOTpSz1Afoxg9iA2Fk7hVnI0uym5rr+h/yqD0GllBGavwdtN6zPl48HwlizQ2fJHWU3GW2
	1C6Pi73WxX3dsFX8EJC/QfMUyHvPRzuKK9So7jBJxHCFmAQNONghsF/s7O7KE6s6CYWGnfl3Y52
	jflL31/+opFrboUwXc0jhaW5ttyiL42pqGTvopgwTYUW/U2KEWWJf4HbJ+etk1yItyyxc61oyQ4
	vwFLe6L/c6vXX8WTYlh80bCuIw9i1wwLVIMRb3Ja9AwOWocBXzcNZNKopOYUkuvyM1RFyuBhGX0
	yKjYneWb5h+hMrOi0iqXv7sPZSClcdI+UMwCJmm9ey9qjfcZWtHh1e13jzCFvweN3KdqzzxWwea
	dy5lseLKfgkOdlvr4pTbXzfMj3JNXd78e5BzE=
X-Received: by 2002:a17:90b:280c:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3ae8972a6d2mr5341896a91.18.1793612866215;
        Mon, 02 Nov 2026 01:47:46 -0800 (PST)
X-Received: by 2002:a17:90b:280c:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3ae8972a6d2mr5341870a91.18.1793612865710;
        Mon, 02 Nov 2026 01:47:45 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:45 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:33 +0800
Subject: [PATCH v21 5/8] coresight: etr: add a new function to retrieve the
 CTCU device
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
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-5-231e069b7853@oss.qualcomm.com>
References: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
In-Reply-To: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612830; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=xCitoVuPyJdwSq/nLCm3rX+LYZy3JMTxp5Mg/VzmuLM=;
 b=5p2RYwhfoSCqZkty7pDs+7dTH+BH8Bgud1+7pW8gEyNinxJ/eqvEgnmt/bmLvWqgYdKb3BUd6
 JCRfQNfi86lDp2fsgLmxn7w0iJoIR3bLMMjDDYxd22InIfHVOXchugo
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae85c43 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX/TdV5FdqBHO/
 7YS/HqlAO0bXJwi+D4gQ5Cuap/f9eQ04+XZCTucNayEh13AIsCmP9z6xA3Zm99eHhF0B7zMbYgw
 ZA363DNM0SGSiPMeUGc+6JcCRUqcw+aAQN4I8AR2FJ8+aWqAJ8ihOqLg/9B//Pq+Fy8UD0wNaw0
 VsSmxjFDAH2rWVl4IGEhCpDYbssOdugCrcCLgsP70L7dUl6zrO51yZuxJCjkM+S1YbcNlTHvlSk
 4yVGsqSwVBglMH4JbivaLBDZzAueglATXuIbbYI3EcfO6Qad0Audhod2jlwYCflFWCdxslhKtA3
 CiwZdfDBfvssg8sK9ff/J2FPcKcsby+ekbBkjOUVyt9LXO0P97d94N2sXCtNqBeiEUjRB4jSgKQ
 kAH1rg8xHB/sp6KqP3xkn3wM2lT2BizjJrgYbFzksCJRgAXMJ95pG0/2J1SC3Y9L4LhavwhEvlK
 NnV0y+LWfyvhbp1EaGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX/2gp/z3ddRI3
 HiaWRTFsuE1kyuZcBJbp1iKDoy1P6iNMVUrKTt4iS0vb5GqjMAzVVQykHXAajZTwYiHI4ADPJK0
 udE+H1faFwxogzv+R33zxlbJo7c4dxM=
X-Proofpoint-ORIG-GUID: eJG9hZ3iNRXWOXu4CzC2bLCOryVJI33H
X-Proofpoint-GUID: eJG9hZ3iNRXWOXu4CzC2bLCOryVJI33H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020038

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 2de31d73a4b4..bf4c1d8f7b2e 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 36c80918958f..2345bdbb0b9d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -474,6 +474,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1

