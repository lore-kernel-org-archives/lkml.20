Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBCD468C15
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793968; cv=none; b=ByCuE2ptCjdEq9KDq5JRRgaDjBcrajDiEy2+I+OCFUVn91kNXsMDgehsNsGQPxPlh5QM7U1fCp/YdSTuMnia8HF+MvSILmlkf4Ezo6QwyXfWAcghZLWoodVwWzLsaXxV/llm8f2spTYaIoyGIB8KXtYjUUxvVc3m6CG8knuDgKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793968; c=relaxed/simple;
	bh=ExkRX2l1iIkYDq9kgcTCCd7CSc5H/urStxIl9201EGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iEXza0lvWrz8fVJYxgeTg/HKiKFOcWKxahMpu8x21eWaLoL11TNWrJlG6wvTWGE00Zqn9vGcETZh5pvWw5HtmqNXrxYZJMS16wmT6HIPuqT1ImWuTYwlzNe8RpgP9r650FmOhiR/4D0pPMdGpezNtMJ0HRIEPi1v1UMOMNxG7Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJaP69lZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YY2g3haf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJaP69lZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YY2g3haf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8L8bt2296412
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UK9oIxJd9lX7Wy3mWsbMb3G6xBMvsXJpxCDNzyTrQho=; b=AJaP69lZ9UuaD7qd
	OSJijOX7fPxRPzhYX1U8TbvnzlnyeE8IK5smD8X2OFm7BGlszhjRXSStsY+LeeVX
	L1hSXNP9YvgDYrldHY5P0pwniVrA+sPXGZt25bvBFaZGS2FZ3VwokOqjXI1j08Iy
	u0gFcaVx5prmu0pimB3ddhcIgEa0X3vDoelzne7yRRVXtOtHm9H8O8I1gL+bgGjX
	VYwT56Ewv8vhv6B8X1IVbSpy+HSqX40OmGbRzcqnU+VMY7mYo1gPkmN8fXgXZHO4
	77iFiQte8a8FYC8M0c5TETASbLMowqEHFZqK6vABzO1wwzRei2kia5tphdffLQ8R
	nI+6Hg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxns0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:32:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a8041a532eso1123798a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791793964; x=1792398764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UK9oIxJd9lX7Wy3mWsbMb3G6xBMvsXJpxCDNzyTrQho=;
        b=YY2g3haftGWeBFyFoQua5YWM+AEDkSAEmqmMtZd8LGTNe0yN8xU57J/9cLLGkuwzQY
         Ym4Blo81noBDUNeaUV9/l6wVNrcR78/e1JJNkoSbkrRRSBK0jjQvVEbodTuw1jqA4VLP
         Xi5if5mKjaqmevN5o56EAiaALIMJR3Ld9gtPsYXsc+mtVCzse/nontPedooJ+C1AaHiZ
         hfk0YAxQJ+CPzwpYABfFSFFPNe6RnCE3DTqY7sD7EvB/RETSduA1nZD/VmQ5rKXKDEEB
         1ixvHdsCUiLTwXRNCoEoI29CjOk1N7dW7IKHeSFDN2SJwS9aIBQ34o6iXaSLzmThcjto
         O7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793964; x=1792398764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UK9oIxJd9lX7Wy3mWsbMb3G6xBMvsXJpxCDNzyTrQho=;
        b=OogXAe0BOapV4hBrr6/EWSRgmcE8wOUp4Pc7LK2AThwUAUplc7w9ru/fU9r3dVPe75
         wjyUzYp0SkSEhHk0IIPhJB0/P0vYahPjvVsS2YG/vW/5vHkx5oDzocxVcql260jeN7Eg
         H+lUzFuH78grC7lol/LvOVWDv7RKihqDiyOqQOCDssPVwUicJN/Ee2do8IHNrvlTaGZk
         vdeWkWbrm32IAPyoaC9SZfisSl83MLhH8GIlXr6NfYDBek+V4wUib62PnMCuyx7WpPdr
         YnQfnyOmeLfbjBxPMI+R5p95HcZtr9WtuJDzvAKKXo7Nn98Qo8WZpKX0s7TN20dOgQRN
         2DnQ==
X-Forwarded-Encrypted: i=1; AKwUvByKkJJKvsEARrXsNRFmPGzxDhO0idIgXEne083GiZi2XF8wQC1NB+k2KlXgW7yZd3yRvLgsVFJLs/3Q1qQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXcvHPdQQEXvJrxW6st65OOerWTbCRf7SXwmqpahGKD5kZlKo/
	IceJUw5qI9e3JbIpIwMMXg5PqpUFLTNmifSU9A2wMTSaHjYeAzyi2BNP0DpNbNVlDIoyPoXCG32
	PMjpHMl28zAKwAUXPibwUAwRhaiqCRs6fiP5VHwSHtOG55QTRa5XONJAmvC70ZZh4OaU=
X-Gm-Gg: AYBFou2elrCOib1xWJ8pUC6u7fd+vicqLlcSehG8C5ywO88pmufVW1n1FKITuwq5MCn
	hlVgaT+1IipGytBdbBxfFWyl2f4NNb6VIjtGfmHoT83LYFUtDFzYKvDp5ADxs8IylvlQs1ySi7v
	2n5OaLBGruI2O4/lRZh+x/l1Pl36jzTGhICtiNB25A+FL/4gX3BOZum1VZMY2jJhmUh4NgpdIJA
	0awRm3S4oOnLLjpr0i0yGl9TYd8B1h3lj1dfHGTFgshCotmMWDXkEwRmTf2YD8hs9Brukwuikyg
	lXajNJq+pmYq6kFMt1RrtQ8BVjF5jdTjbPpsvyGi/8LYvXc0fYdh7FAAFronn4D38WTtVzHMHLY
	UoXIxjriBcyT1Tbk113osNev5ic84PCISoV/rS0GIJCfvxsLVHQ==
X-Received: by 2002:a17:90a:ec8c:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-3ab3a2902admr8257999a91.3.1791793964439;
        Mon, 12 Oct 2026 01:32:44 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8c:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-3ab3a2902admr8257977a91.3.1791793963944;
        Mon, 12 Oct 2026 01:32:43 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm15749423a91.0.2026.10.12.01.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:32:43 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 01:32:30 -0700
Subject: [PATCH v3 1/5] dt-bindings: arm: qcom: Document Maili SoC and its
 reference board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-maili-dts-v3-1-8b499e7b9a52@oss.qualcomm.com>
References: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
In-Reply-To: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791793957; l=982;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=bFgYH5TvYpmMe+3DkZYQN4L3cjnfL2VwrYfhO+yt2ag=;
 b=LjINStvUqvCMiO/tEJna6yxBw8Nmw/mJKeAciEVn/VkjLtmRTgAjithJWHrMFSZ5pMKJjqK0+
 wBCtJ6FR5+WCL54eC7ZD+KpKB4MYMN7raA6VvitAqDH9vgX1Ppbqof/
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: HNcqsE61I6avjYq-Pt3LrXjeValf_DA6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMyBTYWx0ZWRfX3UDcJASo+7K6
 cB9Ojo+GMKwdkfgpTy+6jrNN5qc92gta+nSE+J1a3PY3gpM+6/3Ojl47o3g+jiDLTmc7brSDwRM
 c4JVOpIv6gQn9CEo55+pAuLgsNspeks=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMyBTYWx0ZWRfX1f0CxYdeaqhY
 +7xmkDg7XnMitee748AildkP0WHCb0fIPfMiQQQSQwXunGlG3hGBogU1k2w4pES7BJ8jdQIvbYU
 z7UL7xcTMXVviialAYWuYbQd0o3EPiTNyX2M1P146OPotUtM0obN4X8WDeq/vIu6khEUNDqwRVJ
 ukO5Z7N8UVKnEUDhXW4+y42WycleguaUmWBYGRtqDzRppTjQSX+vR3SjN413X+Ak5YqWmuR9bOZ
 RXGQBgcZkzjyN+2j7oQdCwH3O7P8GblMq43Gz7AdXZWx2mt99k3C9ESVpYOFcbSQfxDqWr+9hit
 S8KJ5CDYgjWf2in54mOshVg3FEkdm4uBzv6XKvPrcYK5MPFnDYSq4900mMx5teXyZkLAjqG8jRo
 KigXI5aJFnkBFNxn/XXwJVXeA58EpeVF+UiEcxBoNL7ecmyHUKXxXVrMIEvQLOc+/i0SJ8XDG2b
 0vTB2Xvv5jk9WYwtr6A==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6acc9b2d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6Y7mjEJBC9y1Ajt-k3MA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: HNcqsE61I6avjYq-Pt3LrXjeValf_DA6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120033

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Document the Maili SoC binding and the board which use it.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..360bf529d0d5 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -201,6 +201,11 @@ properties:
           - const: lenovo,thinkpad-t14s-gen7
           - const: qcom,mahua
 
+      - items:
+          - enum:
+              - qcom,maili-mtp
+          - const: qcom,maili
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548

-- 
2.34.1

