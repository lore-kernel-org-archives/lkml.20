Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED49D47F2F8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946206; cv=none; b=F6c4+0vh44sTs75xLyDJ77jAYUDrxpCM8YoNie8zuKkEBSRzsVXjQYIxsaD4uLrz5kGZ4WOJzkGCah1oNOI02vZooV7vgTZdyMVRzz41+NxNbpy1KoopT0/ZNhVbrS5Qzj6bFo9OYZ5sY++8E2sm0L6WqEpLZ8FiaUYp2g/Cg0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946206; c=relaxed/simple;
	bh=b7PwNKrUTbBjFvlvUJeBMdFvTRE/6fFMDE4OvnZCeS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UwZMtx70WgM62S5u3trHBKQRfxVa1IhRbuhv7GEPrQmZ8/PyTxNjPm6wk2AKhaRv8CdVPAWbSghz24vPtV3Ogtq01MGs3BsbjKSeE0D+MB3zWfCC/pzN+RaTqGnFAtLZp0lyIV0/kiR0o9BJTCsABCncTM8KzqmrXQs8Zvd5JA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+q85cQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PeHFLWtZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+q85cQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PeHFLWtZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nNlu343979
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 13:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqhXceR7YvU9pc3ZKzgyu+8pOAFFFFcPulo//ooWwzs=; b=c+q85cQauWQQgjvc
	KzztgxhxEZehiSS+zIJNvDt2Fi31aOrf1h3fV1hXug+eVtUSGn86w3LcydzMEzyc
	z73aNlgz3dWv4x5PQOvqiPRnRpvnJ9qHVf19jBnOfK9Y5p3O7vZuB7eaqm4vYMWT
	5g9wunBaEmEPQMN8ZWq6jSzM0m0VnVDz7/Z2nNT1I8i0sTwYKiZOJh8XJJdTyap0
	RANbexMiFxanquRD/8GUfLsW1AsJ875JHbqFMmqJ/xNfu29l+PCQrRHTatMgdP2D
	4jSEVDn4QnBECulI00lX2YfmvwqGVHZCOecOHHi0jnYbhZ08crvCuwptOPLVMtJ/
	E7c4FA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1rvqckm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:03:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34ef0362d95so1620245eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790946201; x=1791551001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqhXceR7YvU9pc3ZKzgyu+8pOAFFFFcPulo//ooWwzs=;
        b=PeHFLWtZhz7dlHp/504//XPmTMmkUIPHlwLU216KYAXg2vOB+CAXzruq92E24qXv3H
         p6z0Drd4Did3jlB2ijnzWwBGQ6yacSgLJc0OHxK9BtpFno5iOzEUNDIjf9RJfW8F8gSs
         LwoIQRHiGB39ACkWXLB7jBCmixn7vyPiPTcMWbHjK9WwFDEjy7+ge9Hwn/3hQiRQ+3oy
         QK+3s5KipO9CJ4bX3fF7S4VP23xu7tE2e8TaM+ort4IWOnRy5/3oGr57HoMbGYB/t7G4
         JO1tYs66K6zXCZZAXaf5x6L1rUIRzLOnYkMKWzD/SYMYIu/eFFlYbgqK3+KwJh5DnUQa
         J1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946201; x=1791551001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqhXceR7YvU9pc3ZKzgyu+8pOAFFFFcPulo//ooWwzs=;
        b=0GmaeV2R71++ylnmVr2MkIjtIPXnNmEBnWoR7J3PqT5k8O2VS7DPzw1iqE4Zeiy6Rp
         j5HW2JpdlvII9nG/gAJPKDYFVTL5ktq3s+T8uAzIa+y6WPUsQ/vOfaiiohZ2a49IOFP/
         NeD0yAeOiTvkA0jfDYwXQve3zhNdu/e8H3VbxNpqlTkFzegxyEsfAK2JzQSKwtoMjAE+
         bJ/XgwvYLmgG0H4a92BRqrX2t46jfzXaqx978lAsj+3MPhvRTxQruexeXGbKx1kMA6Dd
         BN+dlIKN5PhiG4H+QXjE1kj7QiDzJyGUtNWzLo5pxjPwzL3NDG10efoyxZ3uh5M2Qv/T
         Z+TQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwOf3CS4/v8ixeoGbhezBR2cAfVcDFJbkVADF5utaV2XFq69v6e2n+P/odJEVGSSH9q4VH7OtgKbA3wCg=@vger.kernel.org
X-Gm-Message-State: AFuF++mHehPrVjsR4bnXc2rD/ia6eEgOeOiP/m1Kc7gIQ50/2PElp2tY
	K938yD3is5OSpUxlubKWmFgxrVlE8fHukrPVujx3jg1JJh0hSTL4YQYMZ+IJvpJ/rJKYo4dDR0K
	p14hGvnzuri62bCEzjrPjrD9iexI2DDrjwG7oFm7y3D5iHeDOh5XSCU4kc8FWKT6sx1A=
X-Gm-Gg: AYBFou3YBvsr4Q1K82xoKxWZKnrgrc9nVTJ2flLP1uWEs2aJhYRzJIK2svV8OzrYdd4
	uYIDGWn0e7b3CUS4CmDrGzckGK+UU5qGcmpueCY5BPlK0xrs4wFOzRvlQIksAGJiRwGerVrbESG
	2E15lP2x+yr8GInwwXqG601FH2tPSDB6LDswxdwPbi/HwckCQ2b2HHIKNWGY/mup3KQ/PvZfBC+
	IF9CYB3ztVQzBRB5Egvl7YiItX6y1edGanbeexxo/S/7oczRGM9BSM9vOYqd2lMXXz3WejdvKyu
	rlA7zWvcFJLW6Na1vQRWR8HF9GV1Gl9HERWgbmnq8Erbi8kaZTaWe+PZ+qEKHHHturIXd9fXffT
	26qvC9BNpvHSNBXSAHHLdbVay49bdVEt+zZDTBdlz5CEbXzzFhUJiA6YQI0WN/5AShb8lu1BoQ6
	VfXErW7ipuAo7pexqwBEI5WSno86QWCUe1gw==
X-Received: by 2002:a05:7300:3a97:b0:34d:755b:d60b with SMTP id 5a478bee46e88-34f2199dfaamr2759015eec.34.1790946198978;
        Fri, 02 Oct 2026 06:03:18 -0700 (PDT)
X-Received: by 2002:a05:7300:3a97:b0:34d:755b:d60b with SMTP id 5a478bee46e88-34f2199dfaamr2758880eec.34.1790946196812;
        Fri, 02 Oct 2026 06:03:16 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm4217543eec.6.2026.10.02.06.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:03:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 18:33:03 +0530
Subject: [PATCH v2 2/5] arm64: dts: qcom: ipq9574: add the IMEM node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-imem_restart_reason-v2-2-61703c6362e3@oss.qualcomm.com>
References: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
In-Reply-To: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX1QSPbXxykzP6
 FJvjqpeghzM83abOaKifjZM3xD2cMBcaryYh6QvJsY4p9lAjMxLURvmnT7Xwa4DccxNE0TZfVwF
 4sUfrTnjkdk+RyCoCr82itM2KIc+1DN1IY5+HqMce1pZCYKyPq8eXmsKJEU/wggH4J0s+6Xobg3
 BID0U+QmKGpmJnAXvj95O1A70whwMWLDkeY+gWqgLBNKKRqxpm8XyPpCRsKXUpDu8CSnWvgILGE
 68h0LISxicinR4rChJW0OjWMlqjgLdABKebaxQBrx7iPbz4kmG83cXEbRwbIGR53nPF6iL+ZAc/
 2LqwkFgwcAEmNgJeIaBLSfIGp4Nv430RoV48PqnmOhV9k+O8cAwdqxzq8T5TdrcIYuC4Xe7Kncd
 DjHwXNlu5B1Wk2U1uDhLU32OHnzp/kv1XN5ulLDltE02qWlG7RorHukcFp5m0uieUk2pYhtVUQy
 issfmhmXQQ9KnueK8Ww==
X-Authority-Analysis: v=2.4 cv=JIauIMKb c=1 sm=1 tr=0 ts=6abfab99 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1EpwE-knX81bZyav7xYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: gTVsSnKMd5UgPCbpUm-F6VNhLVVDz35B
X-Proofpoint-ORIG-GUID: gTVsSnKMd5UgPCbpUm-F6VNhLVVDz35B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfXz8dyPVJwJNdm
 afAfA3J+INa8iDuO7oOBjTmUJaoGruQw9zw7N6c2FuU3Q9wo4PSjic0A8NX9A9A1LXwRbZLZtTa
 uBS1pMN/bG0xgTBWj4ST83s7xna/lGA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020051

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 32KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 771a59585645..f7cc6f274ca9 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -757,6 +757,13 @@ usb_0_qmpphy: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq9574-imem", "mmio-sram";
+			reg = <0x08600000 0x8000>;
+
+			no-memory-wc;
+		};
+
 		usb3: usb@8af8800 {
 			compatible = "qcom,ipq9574-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1

