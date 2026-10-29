Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298839;
	b=mYZpeI84B0RNLsQHl7uQaaYrTo0nFPYhh6+GpuWwQDYmfTRVjDfAN91SrZ5FJlUdU5Yl
	 vNw2ZuC9knfvTydFmYYc0W/rWxyZ7ly2G5rBV/N441KD+Ct5HNjWE+MBbn/4M5sfx1rUM
	 mRiSWQzEsY66DM9+HBK5icbum/BYXCkLyCq3yYcy4yLnkb9cAwh3ZO5tZVLDbjXTHNWY/
	 S0KL80jdw0PQajq866A8fug/sn2nHCx/b9n62rlZjCd1LShoB1VvwWqOhrFymww2isbfA
	 MwApE3aub4POp/VGnQPVCr563TX1gZL3To5h45eHWqp7anwiJwX0LAmvwu+ycip66UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2CAJyPhpa6QznNIgLhqAIlirscwOU7OV9QJtd2vOwM0=;
	b=PLIY/yXuYHxVh3JRQwCeBm+mQqijKP7kli13VXgAksxsaa1zGMEmGSQjuXtKIfKCtHO7
	 Eq4S0VaiEfLxcKisfARrhB0xEdxaiU0BnFuh4KVDI5nInEd9RtHoqpcn5MxBlIQ3VhOeQ
	 xCf2vVr+zHVQrjojde6Cu8SLUHZEMaWMaeIDhvvnVu7T+Ai+jkuY5YpCo396nap4dcLli
	 kJ3rfdLrgeXIuJlle+x4n5aNDm4n0UJUmVkv81O9o8HPw7NvOsrf8PeidcCjCppRJTPnK
	 gflSX3bx1cq05bK2tNOjhlZ2id+hRpIJOVrZCfRiXqo8krZWT1rvgEynJfhw7gnJ8PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TVhUESn8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DfiT581k;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3635606A327
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3635606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TVhUESn8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DfiT581k
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGCxtU1619586
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2CAJyPhpa6QznNIgLhqAIlirscwOU7OV9QJtd2vOwM0=; b=TVhUESn8L5Jztaxo
	vwV0LtXBD+zuV2n1orKBY+J19QD5tCa0jLw9doM4m+nRa/ibYcegEFjunDOXqNw9
	oGz7vkzWS27DmRwzjbNDufVrmCQosUkddjY0khxvCBgyzbDSPPc9bVlK8LXWd1mg
	eTfFUKW4Oxk6huZQbG0p3zTnY0aYfHKOvERqqvmEJUZmE0s/XzfQKqXuLy5d2Dfg
	ZwmXLm3xTV77RXGYu0Qicyx/wYtlaG4ZrvLxGepHnX57e33r5sA8lDbKnQw88wPj
	ny4yB32Pm6LN+HBscvI4CtKuLMGQa/otAlN2kxqQcIqq8QFcWC7Rh6ipskD2G4us
	WCdZQw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm44qa6tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:33:57 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so3186122eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298837; x=1793903637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2CAJyPhpa6QznNIgLhqAIlirscwOU7OV9QJtd2vOwM0=;
        b=DfiT581k8Q36ciNqEU6BCRdU8je3jm74FGalztV3Wx6d/AzzkOFWyCvRRYtQJXYd3N
         NMvLZn21k9py1DE0WAvWuBVA5v/8Fp8q71L5bCUrMzDRan/7KLCLaIUMKqrhsFxGYUum
         J6Jmye2dplBBD0gZB3Fqy6h4FRaat+wNOwbvBPlSJ3zOLPON8BvlLo21RwF2+Br9txNI
         YTbcpEHVEN80eA0+qZr5R0HkTHdMeJtSW7mqramwzCvjc0UGplXaz9ruXDMsMSLZp+Vk
         vene53ao5mqu5UtifSwhcYpOf8t34P3MAK9zYo+Jo6I/vDaeHUoIyw4EKrIq0sIXMMZg
         3njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298837; x=1793903637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2CAJyPhpa6QznNIgLhqAIlirscwOU7OV9QJtd2vOwM0=;
        b=uBPzEyEtYD7tgrnknMES1hyEtAf+XafJMH/BIOrym9VNu3g1sK39uiLSdJ4lxYqdgG
         /XlWjc/t6Ij7uBYiprcTkfg3pgnEK1+bbLRSYDqse1E5WUdftXP4migpPxArhFN2r/MF
         OiB5WKYxnVCa9AvSjNgr/Cd/vJEKMn4hZjaVkaHsz7Aji2mD6BoO0IIaYDnB+dx30zCo
         pEBh+M4uJmimaoGgTiC86EuTs+tf8XcQ5/W7xqIcnCPuosSQn52WxnNf4KrZ1tJNnnvi
         ungHmRQeXvPqKb1/H8Wyuo225kd1vF29Qn9asSCGkIjwOdGByfKKNa7jJo63GzkISbO9
         M+yQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcBSRCCn7WmBsKFgoNpZkKPOaZ3b72IhpTCHq1JD53akrsylFRiydXzy1X7rcI3Q1NzFn840g16naXY1g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRYrNEc1iOEOzOE6z2sesx9+jDxDUYNJUEqlvvicgfyCaik7wC
	2UkklaLgpc7WxV3+4OV4xQF/H1YcOpowe4qYm96W3UFCOYylceWiXdDsp8mVLAU8QoR9e4sMJu5
	vq63Mp67ADH0zVmqvS6qPhMPZSeho20wDubYKbGrIwRbXF0jBJshcMuBa9hXGDS/XVDV445Z9uK
	o=
X-Gm-Gg: AYBFou3tmxhgcu/6mi3s2dZDd97dF8NC/krtf/LmtR4VZ7P/UO0iiJf9ipsPyXNLT2Q
	43YIugozy8icwnz6dN9pXbPI8fbQMbM6ygnQX8jNRE3deiG/5iN8nLXpEj2ntAMjug5kZAH2po0
	ST6pG7m72p9u5BZsguidhiDMRFg6xIPSE2Q+lyFDlPDPSgyVIyU54uLQ5whGLIA+cw59tToVvM7
	lJoQgGi4hiJUWlvssn90uOGqP8Ctg06ElxRbG4KCRaJ6+pEbg9YeQyrVyBrXzekm4HlM30fSC94
	gnnRPby8xGDLhrejivkqzlYKukDoJ12xc4Uyb0w8PNhPYBpSiX3OVhZm4oDz673QdAmRGiBjeui
	4T7pU8ViOa1mbw6W3aLrUyfSn+q/JBT6BzOaWjpEGrJ/OUlZTOi+5iiRGcflK6syoWxmrpG9ami
	bve6uhH1okY7IsXQO9nmcv7BHPml8c2AzaeE3IIPmlWg==
X-Received: by 2002:a05:693c:4159:20b0:351:29c8:643 with SMTP id 5a478bee46e88-36a423a8b7fmr306333eec.18.1793298837229;
        Thu, 29 Oct 2026 11:33:57 -0700 (PDT)
X-Received: by 2002:a05:693c:4159:20b0:351:29c8:643 with SMTP id 5a478bee46e88-36a423a8b7fmr306294eec.18.1793298836638;
        Thu, 29 Oct 2026 11:33:56 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:33:56 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 00:03:38 +0530
Subject: [PATCH 1/6] arm64: dts: qcom: sdx75: Mark USB controller as DMA
 coherent
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
Message-Id: <20261030-usb-dma-coherent-v1-1-3147b8f7aa64@oss.qualcomm.com>
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=631;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=+OqbijMYtB+KJcNcCbpkz9lazAOGznYVUp++9xMNG2c=;
 b=9s0X3JikLumPl54K9hWE1koPi6+pdA8ibImxbvvhC53MzYP/a4TgARzycgn5PFqWVEndKy4ov
 RTIJYtgoBLoDCIQmONddfH35efLW1NjjvgGG993SPVYluLj30jSNKOD
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX+LgMpfDuIk1s
 3MUxlHD06h8n6KHOkxLIbTPoocSFw11pAGKUaSHdzMyB7azAI50+EYUoezfm++rcCnswkIXeJS0
 aVaHUGcJAstpinMZ3gF6XvdsuJrViD4=
X-Proofpoint-ORIG-GUID: JDTRczYPvGO4WWou9RxpDr4IlHkgh1hP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfXwcRpQUIgbZzj
 3K0d8qyvuEgJ3ICjfD/B2uZMoAzpvTGC5X6CLVlSwkSmVtEFjUghoPm0ZcGJ2LsPtOFk0sDqTsN
 jXAHEwIczDePMUFlyUchrdU5OU9h00HAeEntu3xce6MrkZTvR9YzKzp56Dw8dagD9tf6SzH6g5d
 mOjZt+np9pBC4okT85Aju2YZieodmw4YTZ6X2PEcen8y+WcLKZAKbHgsb1bA5IV0t2DjMSlzYNe
 zdXXYNNsxqlrek2wqU/OA7d7uCJNTiV9eZdcHCu0Wt+ly44fEiNFSAQDWWdNGoCGedTivBkW9mI
 0qR8W6kKqB0MXdLt3NViSPzyhVFkp/6RQpUTdfSRclTSgltO5RLrUbgFIM332N0Aud8NNrIf7j8
 9uKwVmcbq3egm43vZpSNy6zqUiAtFyUmg6MskJ28IoBpF9rzrRhzrY4w/OJwhwdj8oDNf1OzJbI
 cUP4ZId4TpEYonOo6aA==
X-Authority-Analysis: v=2.4 cv=CYmdd7rl c=1 sm=1 tr=0 ts=6ae39195 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XGKAOdI6-ny3jh5XtK8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: JDTRczYPvGO4WWou9RxpDr4IlHkgh1hP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290072

The USB controller on SDX75 is DMA coherent. Add property
indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index c66f7bd9bf9a..0ba8d45a3930 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1075,6 +1075,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 					     "apps-usb";
 
 			usb-role-switch;
+			dma-coherent;
 
 			status = "disabled";
 

-- 
2.34.1

