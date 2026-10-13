Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8934C10E3
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887436; cv=none; b=lsBGcX1OAp3xMaqUoUihpDwmPndFjolcVkt53Y3jaZ40z+w7As79x/YBokmqFuwGmsnPzP91wk9LhHrZz9qg7zXyaTBJi2gS/FCKQxp6VMGoirxCK7tZI5eZ2BeWYqPVww8KPXqBlVE871xHlIoXuubBdGFqP4uOkKUyECfW/xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887436; c=relaxed/simple;
	bh=vfE6OmYRp/eyHIg3fq4n77FSKItN33OklybpiIvREks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M/P5zrQgifkv/umNUZNXKAScC/KriSosnQlXDH+4Z6pDTwfuTunOpYScyibNa3V9MHz3gnUUMRzUNLWgJhwcodr3COWKo1eqnwDFt33mEH7HbQJMaAdAsdPVDlZ1CRsoQ7Qqt1hmNSgTBYY3pWYo0Yqj5RYKLYD7PbQnCTKqK0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knuYwcmN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AUJNA+VS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="knuYwcmN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AUJNA+VS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8RFu9302938
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gWdIPEJCACXXkjJjb8PQxL0SVTjR4Vn5uqqJdivVJIs=; b=knuYwcmNJlZpeD6T
	tnChmTxyDpiKpv6fuWw6NbVWize4q0qGS/2Qj9dDfN+GX7BaXAJhibHjfEx+j3R3
	Uc95hNbliSAZZymsvOwCf0+LEQfS/pmWAmGQpgsl+Vd+0YU5ghMth5BeVgK+AVQy
	SVhTpsG/HDc+UrWMtz+QnOottQHAAKAwoxUBubC4fEZTZ24IM1/nzq7lVQ0GXO7q
	UR93Yj2g9zY/nD3KWzTsIU+kYDTCL32WQBxdA64UuOtf6h3jZth2RknCXkJWXf0z
	0Yjc7vBHlbqwyyIPONmWq/8xry4i54LWbGC21MWfnPnZ/hVOMs6471cmMpFYsdpc
	4TVGkA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sqacx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:30:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e49a1d3b1so662442085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887433; x=1792492233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWdIPEJCACXXkjJjb8PQxL0SVTjR4Vn5uqqJdivVJIs=;
        b=AUJNA+VSP/F6yJbHqRZQuzwWFtQSg0BNRhA7yQcIc/fnZgIrzp9Yw5QyxV8rUSvIEa
         SR1RZkg7rAj6i08/yjYwGnZJC+fwxf+iWcePgcGpSW0iZR2oY99mOCgEp7Hg030Q7RyA
         KHboU4HmnEuFImmyE+3UARpqUuU7J6qcqp+e+cP7VGMEIjZ2RELFJWXfORLMgXjpWGK8
         5qLc2VaZSFxEcKjJeIZF3ss3TxcYQDaogeoWwESXuLphdz02jiK9FxxdcakaQrkUc/41
         nqdjSJ+DJNbv3KvtcVaveYgIg75IoemRHcwOzWkKAAYadjVZsCQxxHDoJtWzlVo+jT5v
         zYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887433; x=1792492233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWdIPEJCACXXkjJjb8PQxL0SVTjR4Vn5uqqJdivVJIs=;
        b=EGfl79wkLKt1zptr/l7Wyc6AcHWJ/9HVyOI4sKixsFytXr48NKzOdgkAiLOzb+Ao0s
         ytR3FmW6BkCndvtt208om5Mo3qn7lDsdnu5dWmMgUL9boYeMruY7v1u/HE88Yf7efL1E
         og1zV1g3/kGOIg0LyyUC45ttpEc3bnRBgCT3UTaVt6Bcc1bNV6wr39cVKnOxERLvhtU4
         FmIYbYL+bYSEVfCSUQ+4epJlaZfwiFW5ldOX4IIobIh18Z/mczi4Q0lAxN32fyYjPopQ
         CkT7sIr7Do7WjgZgEG5f15WA+WnwrbMOGAXzpUuO6BhoSYqltHWQ2wP7GwNC5CCYO6Bu
         f4Ig==
X-Forwarded-Encrypted: i=1; AKwUvBzTRIoZJ7dUN3jdjVHueEe/a39u6QyXI/ssj0Mz9QPZkEmvLglEV/N0lCVACP/ArTejNkNqzCZruHQ1VKY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHQAc/8VOg89YMz9Oxo58MUxhzZWwH+S7hYwDvQVA1U73hqu7f
	kGFF4k2ZRetLLTK6W9yCjZFjUg5mAWTT0EQXsNV1c1IXBCgsgYZ55ySAU4q5LeYRHG3nsvyUpDf
	TCnliWdxOsb6zo/cC+4sUtGd4NN0kme1not2rQSKeYYt7aHQdEcNpB7wPtPAad/pehuU=
X-Gm-Gg: AYBFou2G3BddZqrzxUO/6xJNWL9Uoe7+Nw9fggMsx63V7tlUIzaBzSDK2m7ac0VAkVT
	7AN87l6UGTmjbhIwl43ACQMWEeYtWMC54sBMMnK2e0bDw9OLVgBqsHarP2/8eWUoNnoqpDdZa+Y
	pqOE2h7N3FnN8QzXhLg6OZKfnK0Ogf/hmXybbDsUD9Jp1DjsW6vxadFfu2xwUim/XnuTu6G43SX
	iPUBW9ISoyO7rheJkD2lzjQkHngnNOpFI20GFcvaiPc9VhlAv2xwvJvGR4+ksxk64Gsbfa/3G5X
	8B7h76zouNzrBk1XCOM5S+r6dVRjIbaewYCwDUpDulPNXIp0luXur6Sew+8RI/+iGIeAxwLWASR
	YiCmv6Nl2mQ8ge+e1aUYY5uTMOFYSck9qrOxJXuQlPt4hs6rHhrUDAgeNFXmh7/qfDmDo452kon
	yvI/7Nxnu311nxoAptsGlyQPpcOqHf4/ClDA/shGB2e0my8O0+wKE=
X-Received: by 2002:a05:620a:4689:b0:93e:5312:3c96 with SMTP id af79cd13be357-93ebd20e0c1mr2147145685a.26.1791887432813;
        Tue, 13 Oct 2026 03:30:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4689:b0:93e:5312:3c96 with SMTP id af79cd13be357-93ebd20e0c1mr2147140185a.26.1791887432174;
        Tue, 13 Oct 2026 03:30:32 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d108:3895:812b:662a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be964dfsm349955115e9.7.2026.10.13.03.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:30:30 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:30:26 +0200
Subject: [PATCH v2 2/6] i2c: qcom-cci: Handle and report queue
 overflow/underflow interrupts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-cci-imp-v2-2-6873326b44a3@oss.qualcomm.com>
References: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
In-Reply-To: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfXyzzE1XhPqc5w
 1kvTulyaeoKeJ72ec6R3+4nxGgmqdj01y0gENiCADE3xHg3C5GdhkC89mE9NdQueMoH7OSP2Pgo
 N8puuW5R9xIFowfBdf7Y1LKRA/5PfCq3lPgaHfOZZAi/O6dKPFmBYvdBu9039VIVssnsAlSdje9
 QCz4gNYzi3Eha9VlnfckFBqnoX5cTXlZTKbN93b9BkzDf7ghcC9VuVT4fjARB+6s8YBgCsxxu91
 nkh7tR8ckmZ6IBoQ+wgFm+xqtyK66d6BdkMA61eLBjgEhFWFm2FjnYYg2omab/9It/9EXp8eyEV
 1EodXu/pVLYWcPy+9AYwkNQMAtkN42/3BIaXz9e+dplwzu0+99RH5J+kOxCnDkTr4erYA9JiXAY
 tylAAiwtRIDWjWKh8LeYB9xVLNZY82r/hwMxy9I2KLqOhqf8OuSp2anM2beinZZBj0FNyBDgJfm
 ZqvDpum56mg3WXohzjw==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6ace0849 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=L19FZshse16xndK5FkAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX8TjR/MWi9MKQ
 CkDyDejOMAmeee27gD7iQyqrVQkGmF2y37/MF/EgxJ49i2fq6+Y3tfXwmEJTmt+eQaURmhS+d2g
 Ji/aD89IuF/TWzVLuCtDc0byf3f+mA4=
X-Proofpoint-ORIG-GUID: pNBmDw9uFlPNrrtUQn7i-j0vThlnCHd8
X-Proofpoint-GUID: pNBmDw9uFlPNrrtUQn7i-j0vThlnCHd8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041

CCI_IRQ_STATUS_0_I2C_Mx_ERROR aggregates the per-queue overflow and
underflow bits together with NACK_ERR, and all of them were
handled the same way: report -EIO and halt the queue. There was no
way to tell a NACK apart from a FIFO overflow/underflow in the logs.

Decode the individual overflow/underflow bits for each queue and
report them with dev_warn_ratelimited() as such errors are not
expected in normal operation.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 3304760411082b72e10e529a2bd66361e100fa06..099da0069251681cc52e351fb656bd73e78a96c9 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -54,10 +54,18 @@
 #define CCI_IRQ_STATUS_0			0xc0c
 #define CCI_IRQ_STATUS_0_I2C_M0_RD_DONE		BIT(0)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q0_REPORT	BIT(4)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q0_UNDERFLOW	BIT(5)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q0_OVERFLOW	BIT(6)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q1_REPORT	BIT(8)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q1_UNDERFLOW	BIT(9)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q1_OVERFLOW	BIT(10)
 #define CCI_IRQ_STATUS_0_I2C_M1_RD_DONE		BIT(12)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q0_REPORT	BIT(16)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q0_UNDERFLOW	BIT(17)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q0_OVERFLOW	BIT(18)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q1_REPORT	BIT(20)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q1_UNDERFLOW	BIT(21)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q1_OVERFLOW	BIT(22)
 #define CCI_IRQ_STATUS_0_RST_DONE_ACK		BIT(24)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK	BIT(25)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q0Q1_HALT_ACK	BIT(26)
@@ -190,22 +198,40 @@ static irqreturn_t cci_isr(int irq, void *dev)
 		writel(reset, cci->base + CCI_RESET_CMD);
 
 	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_ERROR)) {
+		cci->master[0].status = -EIO;
+
 		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q0_NACK_ERR ||
 			val & CCI_IRQ_STATUS_0_I2C_M0_Q1_NACK_ERR)
 			cci->master[0].status = -ENXIO;
-		else
-			cci->master[0].status = -EIO;
+
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q0_OVERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 queue 0 overflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q0_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 queue 0 underflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q1_OVERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 queue 1 overflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q1_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 queue 1 underflow\n");
 
 		writel(CCI_HALT_REQ_I2C_M0_Q0Q1, cci->base + CCI_HALT_REQ);
 		ret = IRQ_HANDLED;
 	}
 
 	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_ERROR)) {
+		cci->master[1].status = -EIO;
+
 		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q0_NACK_ERR ||
 			val & CCI_IRQ_STATUS_0_I2C_M1_Q1_NACK_ERR)
 			cci->master[1].status = -ENXIO;
-		else
-			cci->master[1].status = -EIO;
+
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q0_OVERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 queue 0 overflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q0_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 queue 0 underflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q1_OVERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 queue 1 overflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q1_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 queue 1 underflow\n");
 
 		writel(CCI_HALT_REQ_I2C_M1_Q0Q1, cci->base + CCI_HALT_REQ);
 		ret = IRQ_HANDLED;

-- 
2.34.1

