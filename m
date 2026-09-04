Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D0D48CD5E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524518; cv=none; b=JVqHxMY9oFAR52wwFoN0Rq+n81HIQXJUv4kMJ10DuDG6TmRCHKe3ZBfQawSZ4xGeKNmN0SMTRCpl41cgVezRTC94BVycI6CIBor4gynsG2UnlRWtSrj2PK1ufFxXU2lAimmj+QZQ4wvKBIZcReH0lUnqC+hr8Pb8PAFJf+cVmYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524518; c=relaxed/simple;
	bh=YRzvAVRkZbWBIqG50cR4+R6msLR10iB8DJJthyfOr8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YYrB+YEsz2QWbTm2SEESdZzQGL1RIfgbH4O4mBRyb5rhz98RDp9jY8DyB6zUX16GxTK0aULtWJJOdofpI5I2Vdt2W/N97n3QE3iV9/1WWGc6fzJcsfRTQT5l8s2zJ7izdWIrKGsAmprD8uvFubD1jVT6EhPDu1NM8VLPyx5GgnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXRFhNQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WuJkOmkX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXRFhNQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WuJkOmkX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIDVH3168564
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 12:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=; b=NXRFhNQTrt1PX6k9
	AmaZVvdhvkTskOhx5hNvbDTxSzv4zgz/E99KNZIl6HeDzz9/HIt8vBts5124tFYm
	XqtOUDUWedKyR9FKSIPSdOntGtd5HBcclno3TXECgiAdwkmpTbG3IhcZiSUQIDI8
	iPIGqvD9OkxCPGqdDfHCqV4J7bAxZ20KCHsCYy5vcsi+1evYrJvgLCIgTuz818dM
	myHTKS4emBJFwZuveRgNzeFxn8NxNQLN5NVXVkkNy74Fju2rnUj+AZjHWgcmKFqw
	TJqGjczOgcYy4JuVGPSZdF8bwWYPmn8tHlZ2ItSMZxZzCk6PTLYyNV7WdrNjPiIA
	v5TcZQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqtsa4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:21:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90cdc69a7b5so17996056d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788524515; x=1789129315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=;
        b=WuJkOmkXPX7x9W9DxbTnk2GzcP2kcwaZ+AYq2C4Gb6KR+O1M6Z1a0zIeW2KB1zp/Uq
         D5ZZLZ40JAwXl7hTvrcLFf9n+IiVKyC4xLQMCwAlRcWS/FE77Pv1H2vy0YIGcjet/iAF
         GtW17hvvRSrLIqxJrVTkGMR16sthP93VIh3KsjJ9hJhA9FgKDT1FpX1wryGL2rjUoFTG
         fi73aRRJYjnYl208H+3CzC+nwxdv7HM349vlS3Bb64/zDNLt5YdCjSa9XitMtQ1rjncB
         s7r7jwmWdRv2Cqq5YBUBCKJsEKOs1LRxZx8fsAKYxu4jo/qVEbZqKC0CM37mZ52cOuJW
         J5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524515; x=1789129315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=;
        b=T0v6HDSCRuhSPN4l81wIAQcmizGbVPHcGaxgXOGKtZoZRrS1z7Gm7nPw2n0rL8jDZm
         f1TtSLz8iV1+SSJnZB82NSdTTWfEb1SehZAKJvk2fPw6O842F5QFOCZgccpv9D9CmqZ0
         UnEIUAJVmL36n8FoKzAi/GeHyZZSQyqGXtdX2PxeXMbSryApZJEpP8nfIjXG+5ASY6yt
         SYbUAstd/9xstz5cA1dZrVgzLTNrHMZRDFfBgmmq/E5KX9uex2pAxmQlxieGbphgG5jl
         Decc8Gw56bEKAWR7zBZ15l3rtIy/55DqzPTFdpI/uqEyG0GzhW2JNbyvcGmF5vewzug0
         q8Hw==
X-Forwarded-Encrypted: i=1; AKwUvBwGPqsYiOy8bLlgJZx8qCfOvqTDR1pHWrL2/7O8vUUHmX5GUpwJN/QfRaWV5wrl5xwod/2U/ozG5+vSuhM=@vger.kernel.org
X-Gm-Message-State: AFuF++ncGMb8Zjwv+bbshzCF55+uEjVqikY1nJ8y4dZzNJNLUhUbRZID
	bBQfdF8wOxWtABucyQUIrn7kuTuVXJ96lVJtkTnr5/L2rjf/PenTU2U3G9KUgKWBFdHrjepUU78
	UBn3qrwWnLXAxuKjxibvZgemjYyjemJ+/31zHmwjCZtL2ZyeSC0BpVwx841C4t0xDs4s=
X-Gm-Gg: AYBFou2kXWIwb3A7kT+SPn/rVAIuxGwC5xmKZR4MvSE1OgyLkDK2S2EcYGL4n6+qcUw
	1DkJb0KZvErqdXUF2b/MrraIvDVHQIDOBjAnsDac48N135TjZPyzdzUO+okipLYavcIkrVTsEZr
	gYiVtZqGV0dDg0+z1YysVHTjXHr0njT1bDmpso5m//j082yYOei7islL2w9hLq+u1aYpNFRUr8z
	IJw1S54cyKMqf+s6EY4Qrm+E6Gk7NRtqlgI5shbPDAN1xZx8Qo7OlhW4S62ZHQiBbUQ9ELhtPsO
	3UvKNAdh7boQEFnlc3XBNYkxGcO+alRmr8YEUbw5LfFDHgl6qu5MqqPoY6bIGY+qFDph5Y591J8
	/8IZ9ew==
X-Received: by 2002:a05:620a:4484:b0:939:6de9:d52c with SMTP id af79cd13be357-93980502f47mr482087785a.49.1788524515217;
        Fri, 04 Sep 2026 05:21:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4484:b0:939:6de9:d52c with SMTP id af79cd13be357-93980502f47mr482079785a.49.1788524514468;
        Fri, 04 Sep 2026 05:21:54 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm195686665e9.1.2026.09.04.05.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:21:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 15:21:42 +0300
Subject: [PATCH v6 3/3] arm64: dts: qcom: eliza-cqs-som: Enable CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-dts-qcom-eliza-add-cdsp-v6-3-d4f38936902e@oss.qualcomm.com>
References: <20260904-dts-qcom-eliza-add-cdsp-v6-0-d4f38936902e@oss.qualcomm.com>
In-Reply-To: <20260904-dts-qcom-eliza-add-cdsp-v6-0-d4f38936902e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=YRzvAVRkZbWBIqG50cR4+R6msLR10iB8DJJthyfOr8U=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqmrfZq7frxFIaffCzDsLIydxrjeqPaqmxisfWz
 vAJavffgHqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapq32QAKCRAbX0TJAJUV
 VhzED/9DZAbPBjiY4HjbvYJbueMinZFwHeIpWUXvgyX+feOuDpwY5OD9cIPOXnbg6ChcO8oSqKR
 YspPZeM3lk9w26/RcUaj+4C8bju4bAqBSL9ff9+WzrHg4caLZPuvVPFuE/7Er07EmX5JwbkU9UF
 QstnTzan/s1OYPU5Tf3qIO2/GD+tEoqmpUCHbyUfOcQrzN1N6hzbz9wVOYhLSjoDBfbFVZNFy1D
 lc0uGrZFYu4D+z8V0j59cqUuHD7qq+SxXpCNvAH0PfFtm6vkl0sKyM1+xSWV1J1j2FC3wDiKQEn
 kphjd6vKK7JS/dQBFxMc9caKDWDkONNuV9g2ZTMqEzWIAT2elAwRl84+Mwy57cLMor3MiGKgCVW
 DXcqS06WuqBtLxF16K+WzMA5kAZ9y2zkoJReltZSea941qL0j/N5owyiuO4Quf5foJhO4i7EY3L
 OxIi4EZ0vqtQ38szhtmxpWil7lfI2I5Li2/dm2I9dVamJNOdK0g8z5QjtayA3DjcxvoQdRLqb+f
 PyarX2SuaJtdrbDguIlOzB+VYFuZ8MDq2i6+aIZNwQX079EXNtTFmHtAgMfyxml3qYFx5Odb5s8
 1DFnJZ04adHE/fN2+ongNu/V+qP7+tUqTcX2/fyOHy6OGaz7glUojqEqUdvkbCiaq2qrOvh2jQ/
 /3N3tMV92nvBh2g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=YtA/gYYX c=1 sm=1 tr=0 ts=6a9ab7e4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gskBRPyYVKVSocykC0cA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: DCXwS9Q4PBous2dHqqYDESRiNP-xsENP
X-Proofpoint-GUID: DCXwS9Q4PBous2dHqqYDESRiNP-xsENP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExMSBTYWx0ZWRfX3W1gPtUZQwox
 I6SoHsPDJU4kUiUd0ltEfmybnm7+Weceuvhr2/bMl9FylWZ1ub5zDGxQCeWRcNMB6A9iaT+z8vI
 7lfPIYFWcd7MalQCed1O1I3I8bwLF+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExMSBTYWx0ZWRfXz/U3AMw9vfDJ
 mXGPkMdVva2vWQdxj3KDDY97Mg2v68KiRmOM+aSusLAozg/vtarmJqfqEFV8orPHKb5pi7lpiFv
 uR9jzg//31HK2JjF8GiSNDzk5rBdhmBtxD0yS6mjE6oopqp79zU79foaQ223MdpJ54a3XEWQDcl
 C2oHOyqKZ7CfX1kseRgVHnr8og8P2Hd4MnJEgAzrpyRMIWpfVZTA0vcB/kiJHCHfhgbdexvBk6e
 mhNJsr0sOIc8QrqGv3qpoMC3EddakmfGCRD3+jNIx0yr1B2GSHIZBNO5oSRCK3Z1OOcqyl32B4g
 BVgh1fvg8baQ7/bU492aGzUOEhBmOL0t2jjime4FESw8/3siAP6ELocqFJ7jqU8spXYOmWgZ9pF
 k8F2XGLsmeDMRGNJUgQ0muFpRlL5cEOwlsa1cO5qyMPGO4a1tvxdYGJIwFtvs3EueJTlq5MUbK2
 aNUUg3U0yQbdxWI58bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040111

Enable the CDSP remoteproc node on the Eliza CQS SoM by providing the
firmware names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 5ef6c51618bf..c55947f52123 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -381,6 +381,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&vreg_l12b>;
 	vqmmc-supply = <&vreg_l1d>;

-- 
2.54.0

