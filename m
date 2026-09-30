Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E9F4F472F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779969; cv=none; b=LaUrvKcN2wXH/dpvi/GNKznOGjJViD96LlnEv3yzAIMoww78gaJp4kHRp81sXcOXYC1dii6SMtTubAdD4Wh1XoFEUqAaWE/B/yQRLwf80VuwOfluXWGMAN+457tYp7xGaNNScTmkh9Ox2WQpgcR4n5Vpks/7pfbYOkZ+gfv3wqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779969; c=relaxed/simple;
	bh=5GJGXU8fsHQt/qFopLvzw/9Pem+53Rp3DL4C9MNnYlA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CHaLB46mZwCmSo8hHNEchFw9U8J9bnzHAnm3bZ845IqgCRIXWLi+NOv6ccdtbRmi+joFGlwleCz2gcYRR8dC9JyLxS6v9++HQn/8rwsJ3OgRtL0fKiktTC2+6c2n0dWsYZJNoCKrJYULH5uDUCmpDjYYO2GZwkMq3QMC08EGmZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLWuNrds; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fweErejb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLWuNrds";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fweErejb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE07tT2970797
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=quF3R874oc+
	nzE7gwS/oZ4MN3r+xqKntIK58vfepnss=; b=iLWuNrdsLj6wcg2qoSsJPCDsBML
	jbKsI+ZMr93owVlWQ8RjqIvwOX7EolPr8zeRNSFWNWArisnvp5RewanbQ1bfN2sQ
	yxh//x8e+UzLMaPZmqnJWwPZ9RumtuBjlibPB0Pxhppy3hsucWsjcCjU41v1DAM8
	rU7nmYDu+UxIrJLAVcaH/5eUqvdezSnS+ybiiaKEPWzzFaAoPihPrJoQbpMIWpsd
	gxq3Qm8GB3O9JnWHIuNn0QFuiMipv7ySI/RX800CXpoHgymTr3j/EKE/EeeIR5yr
	zLE98yWnXqTwR8bGK+AyoJZ8U8HxIHGf/IqqU/y1/FA+6f/86y33DUgUIpA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhekctt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:52:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34d49d8dee1so463569eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790779946; x=1791384746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quF3R874oc+nzE7gwS/oZ4MN3r+xqKntIK58vfepnss=;
        b=fweErejbo8VT8vyZs5H+mx5ckIlaSR6aJe52n4slceuTXC4qxocewHfN7Pi6t/7Z6e
         P8gWh+dobj+GNKd0JPVvvxmS+EpcdR6+VFNPuz/fRIT+60LI/l4ww+g7FjLc01HDwVZQ
         PV2yVc2UcoRVygwqPpHnlQvBtgJ3pTv/4kf3VrLuZVsilQOMDcvUM4cFcRnLKmDSXZXL
         2TUpHwEzLJD8NnK0+9cXJGiwYN4rlMOMi/SriYo3PckK/e/FLNo93iFsTP7EIqOT508b
         BtgCrlB0nZeQjuHcZ/eQpNfGn6fuSRlkIgeNCXI0gNAZBz2QLIKnwMnN43DWVruF9sme
         6OSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779946; x=1791384746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=quF3R874oc+nzE7gwS/oZ4MN3r+xqKntIK58vfepnss=;
        b=i/TCQRRfBceDve1DaRJWuO8vjVy/gElxMuimhkXbJN3T8dyigx42W8RTFK3rp06g9O
         5CuwCd5iiKB7Lrt36+zygwCzP13Wjl0sjoijKeMH27NH9R8LQeESY9g6eCmTFtvD1dIJ
         mdGYkS3uuu5TI0w7GSU4mYlTu6pZK0yZQwqyU6Gt1a+3eOypNFyelp9X/OuFq24WfCFK
         3HxkhWWaUniiSdERRS0dgENY/lyu9Iuxcy1DKOhG1etK9fjom4l5PB4rkZBYE1gAZby5
         dl5EEdkiyq3xSfHIKrm3NFWfnZ9MEzlPgiAhdddb7r6aWyFncfPcRdPQ1muLw4MHbnVT
         TVeg==
X-Forwarded-Encrypted: i=1; AKwUvBz0s3TCQCead5eSeqZiI/yoXWRB8gJwbdFZlRWM50xRNoiKJmSxq3xaC15wbCV4aSq0CJOEAulonOSvw50=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSHRfanCYpv/ByGU+DLtuKxbQc4etwmTaW3i7Jor/nVZFJtsWV
	nMj9tmsv9tfUn8Equia5v3RvY9R7wzzU7BC/dKRsveHnp+BWfmFQLJR7fjuhuL3Q1icWJolsuyr
	dmA6pqgvxOWZNHYU8sIBhA6GxpKi8u2MtSyWCNTQ4GS4/zIqde7NGyGTHhF4lgE3jxcU=
X-Gm-Gg: AYBFou1Sr+nSn/zm6oK7efajy09oSB2spbLKF34QIMSeADuoQJYrSs82FVriYGUkmJK
	DsGEBt3bKRcCtEsZRoTCI97vuuphFj2kd+utcBuackB/Z6lrVOYmwErwehFRbBOc3ZtAHgHa9G2
	GpuC81Io7OzNCzvQy8lJ6g2E7TGWU3x9lxA8eNpqm91TFUgxd4WYQGeuMe4r0N7tMIQS0ewWtoz
	Y+VwgBTlHWkrSu73/NGxbi+hAnsY1nBuKjuyR41fm76GH3Pj+VchmCE1flJK9kqbQ9qjSwbIbxh
	M+pqpX4OAVo4Q+Nv2ffNFX9HPAd0na3V7EFpwE81JUtjSQHv1OgF82Se+JJWDbU8ZLWPwUuNRtr
	RYsv1t5/W1drRarlGpNQ6iAqPUPJmkUbQBnsgeD2cFijIdg7Yszt0uUo=
X-Received: by 2002:a05:7301:9a81:b0:33b:c24c:d31c with SMTP id 5a478bee46e88-34cdc0cd8dfmr1890756eec.7.1790779946315;
        Wed, 30 Sep 2026 07:52:26 -0700 (PDT)
X-Received: by 2002:a05:7301:9a81:b0:33b:c24c:d31c with SMTP id 5a478bee46e88-34cdc0cd8dfmr1890729eec.7.1790779945736;
        Wed, 30 Sep 2026 07:52:25 -0700 (PDT)
Received: from hu-c-gdjako-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf5639339sm4524609eec.18.2026.09.30.07.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:52:25 -0700 (PDT)
From: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, senozhatsky@chromium.org
Cc: axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
Subject: [PATCH 6/6] arm64: dts: qcom: hawi: Add QPaCE DT node
Date: Wed, 30 Sep 2026 07:52:15 -0700
Message-Id: <20260930145215.3380977-7-georgi.djakov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kjiuqzp4YO_lvbdZSTda0JtN8J41f4RJ
X-Proofpoint-ORIG-GUID: kjiuqzp4YO_lvbdZSTda0JtN8J41f4RJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX9wYKq26sEnK4
 nHAfaMDNPLotTqJ2wLvegtMIMLypOyNYfPEDjr1sdp1g14Be7BAAiaL21u6PGkQpzs96TEEk52V
 c03GvayS4vG0WkRDgJAWpS2eTIyF4VM/SB2SoH3dSJRu0WXDCJ87SNAai7jTNPRhWgqktThyaO7
 ezs/UpKOfYGUGLa5m+gmwix6A61ksK4i/TI+H607gM8xB2382TI3kHF44AIAnfbnSqml0JzZSH/
 4dQB68wJ6YzMfi5zf5ryBqkl77xJhSc4xNq+E3SiXCb9mss0viFhC3ACSW5YMefsvb8px+oHFmY
 M/IZAHbCNDnK1zFGva2tkx2au8ECsLMfo+wohxCN/0yYZot53IlGUye7gPrQeuq3aPTmJc7yMPT
 iqLieAOh0HdjJB+9AkNjKFpWppKNEzRwKgsuOkE8MwqLuNRWPkEx8p1vjrIZBaLe04gjOKjvp8p
 p97g0XeKXu6ARMpxojA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfXwcfW+OC/6L7r
 3zfOciGuB0UrndB3la6SRrYahhbidMBdojYbIVIenXZBZ4x8ecg4aDYFMKHcqr4v1YHIDjAUBi6
 s164DNuESiKL7CUfArjfzZsOLMaI2wU=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abd222b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=caZMlNoC1EqYFQpew0QA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300059

Add the device-tree node for the Qualcomm Page Compression Engine on
the Hawi platform.

Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 6b0a0ff0faa4..283a5acfa073 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -5677,6 +5677,23 @@ llclpi_noc: interconnect@31310000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		qpace: compression@31400000 {
+			compatible = "qcom,hawi-qpace";
+			reg = <0x0 0x31400000 0x0 0x80000>;
+			iommus = <&apps_smmu 0x1c20 0x13>,
+				 <&apps_smmu 0x1c24 0x13>,
+				 <&apps_smmu 0x1c28 0x13>,
+				 <&apps_smmu 0x1c2c 0x13>;
+			dma-coherent;
+			interconnects = <&gem_noc MASTER_QPACE QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "qpace-mem";
+			interrupts = <GIC_ESPI 72 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ring-and-bus-err",
+					  "urgent";
+		};
+
 		system-cache-controller@31800000 {
 			compatible = "qcom,hawi-llcc";
 			reg = <0x0 0x31800000 0x0 0x200000>,
