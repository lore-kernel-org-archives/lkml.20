Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6639D4C10DF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728016; cv=none; b=V7vPmdy5Y2yyg6es6e6iG4s3yuC7o7fnSIupW2EN10v86IQs6eM2/3o5zOsjCHzASdP5N1RGC8Rbo3NTWrAph2qpcCLvFWNmp1PzFmDxOKtOL+Ctgqhek1w9fY7mRSmkCFY2/Ib9kSxNnEMwzcOJdDgEmfD5dOPfNTiP3yn/bC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728016; c=relaxed/simple;
	bh=I1mRwR7K7EnzLPFseGGbpmG4c+9ay/Pl6zNSd0sY/J4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WcG4nEgYXjrYGAOHEe5r3pV0Y3TsPqGoXEdvPDg0nywXx1Ov+SAT2mNxdX+IkXv4XkYDHW52F14kkpgIGFR7eME2esNwuxkzsiLBrZW49iFozb/6siYXiJ2uRYK8Ex2vO8g3AhxOOTp2fEBiG4yg0VIrUtubL5Pc0uW10mb5/DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UF1ExfZN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JTmM5rYv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UF1ExfZN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JTmM5rYv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dVmx3916155
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFPu2RI6hiDBD6/m0GKoUaVlJ12SxA5BFYsofXPkU+Q=; b=UF1ExfZNM8odd+dp
	iybtbJGMm3mS63gkUMW5jdU3EU0nHKFctcH6Xz+BsUqWXzjzRON5bm7lUTkjniPF
	g8c11R78qbzKtlZUffFhZIwddJs2DGtClSXFUrZRA6N+ABUDnRLF0Ye+zr4StahU
	cEKQzub940ny15PiaL41gFjNhFw1swNIpBMFIXsWtOw1FeYFTDozFYZyWer0ckpw
	AaifSiSAi/75s1yiYNBk+Dg3xUKlB8VOiDLb5BDdVsQx2U926U+IKKP1jwrnRL+c
	MInAMZ25YP1rqNqyqzPrNZE54PpzgM7OfgAR5McB8B5oSEHIVLK9nvW5R0Au3Brv
	Xqq3FA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdtqpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:40:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de1f85cb2so892353a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789728009; x=1790332809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFPu2RI6hiDBD6/m0GKoUaVlJ12SxA5BFYsofXPkU+Q=;
        b=JTmM5rYvW3qqGZ6u1L4BGP2EMeeB4+CtdrgLpWUiFN27rEKkdcapcqMtesUUgYQYJn
         9l/JOHXTwJPoQip99n1WJ30JrK2BTMsi8qxU2f7SNr7pcItHM65ovQfjj9Hz1S2Q0vPt
         gErz3HaWzzBX2ixebRLfxeyB48ynCoXneAmLERZHP2u+sDPGSO56sGe8YL/SqYmqc+GH
         0Lh3MsRJ2ejt/Oa2KT4nYmhDiiGrCqFUZprmSYZrgMbOSoyU5/phxyv6OQLADkESQlo5
         pNb4NTuB/cRJSMLpBR3sZtbQsxp7TTHmNKeXfeOqLqO83nJoRS6z0rX/pBwjRyBJU02O
         6UdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789728009; x=1790332809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFPu2RI6hiDBD6/m0GKoUaVlJ12SxA5BFYsofXPkU+Q=;
        b=DF+iihM8vDASMtZo1NKFk3F3viF4bf1YyR+wngOtoyXshjE2pkWdpfhgrGxrzTUd2H
         OccRWyzYXJvYgoh7wXAS8c7xbA4nVzvEzMAIp2ZlMV9fMxeo2hDtpntEBm/F7ch2Uecb
         V/zL+d8svrMsGIQAtO/didJaaJUxwe7PhKBGgmnV6JR8Znmx53N/obxajeOPiM7A79AS
         Oht3kZEU1QssyygO0HNaesFpYXLzFfTPWu16JPCAf0cOI0m1KqqDs1GixgwAOkp7Rj+G
         Ni4VqWgxF1bVMksQ5oj7DZ5pXjh8AqGKs1HJ598yk3zLWs30sZaQbUv7o7yHsff1ilMj
         4Q/A==
X-Forwarded-Encrypted: i=1; AKwUvBzJXsGW2gDhsbVLnT+7TRxEYXMZCkBt9WifkfzrJe8TxDgkmsX40i31ayO9CIiQ6bC1psOlEPaSPQorCDE=@vger.kernel.org
X-Gm-Message-State: AFuF++lSUDJyUgX/4cLnyZsWRX9idarUfOVed1aRz067qfD2UMfIBaXn
	OxnWyTQpVMuJoPbd7ofHoD6QvDZfLpCk5V1YowJZa0nsBUDrjlteHxVGX23yVIGnsNXnYZrGhjU
	mdoxXfEtsroYXNKqlq1+qBhRYko2KtN4gswpqXpEkDwHaKHoxPdA8UaW5riaY+9Y0EpR8H0PqRU
	I=
X-Gm-Gg: AYBFou3cF7MIgkbgFPYOuEFBuOenkvlKRocOY59LjXTQa3rHVYpJWEz8CRyvDMVTCaQ
	7zSMuABI6kNEkxHb76yX5TAwIlylxX0FDvrr0oD6vNTO8S9Ur5Teqz+l1YH1ZzQQ0S1LEWNWpEE
	reHDhWHc5Di2pS04oZb4foNZ3+ZXzWBKDzd+3RVIYHsMr9U/vEVuDmyX8Tv7pr2K2jpH6Wn1bsS
	y/mrFwuEf8fngpeQ04yjbMN5GVQwZsgFPCbAl63TS6H82BmqW5wgnjJZiqPZ5VYSv7XdOhDOGzi
	Vhi+KeFqjE9KXXtDuYF3w5DVGQm0a0EfQU3nr8WVkB0Chb6BD2cKc+DgUV3ftIvKFWCL1UKPQOq
	cbj7gCi5rLt0u0pPLvSVj+jqxTA==
X-Received: by 2002:a17:90b:2b43:b0:39e:1ff0:331b with SMTP id 98e67ed59e1d1-39e54d37ad0mr4977679a91.2.1789728009115;
        Fri, 18 Sep 2026 03:40:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2b43:b0:39e:1ff0:331b with SMTP id 98e67ed59e1d1-39e54d37ad0mr4977586a91.2.1789728008619;
        Fri, 18 Sep 2026 03:40:08 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c286d98e7sm4020702eec.9.2026.09.18.03.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:40:08 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:09:10 +0530
Subject: [PATCH v2 4/5] arm64: dts: qcom: glymur-qcb: Enable UFS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-glymur_ufs_qcb_enablement-v2-4-16619f7e36a6@oss.qualcomm.com>
References: <20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com>
In-Reply-To: <20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789727970; l=973;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=I1mRwR7K7EnzLPFseGGbpmG4c+9ay/Pl6zNSd0sY/J4=;
 b=DfM4/laHLX4xA2mks5Zzb/g/4Wz3+mAzBmMZrZOblqmoTBlaIWSm4NNTAIkn7kzpKrmfwLqba
 W2aVf9BEHHNBGg51mkYE/u3/ijAPrIUhR5HVXUMZ1tEwXnoL5aCEHT3
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0OSBTYWx0ZWRfXyBmDjUbePogo
 CugkOV5dxzbhhcJrxzL1ZQWTAehG3ueEwLbmxp5HMMxFfNWh9a2HnI1Diot7LWHj9BDuygphBu4
 nDWlATy1rrvK9ShApdrQVxUv7n0K4/DLEqRHVzcJm6wltS1E9xYIhbyvUOvxaeDxWv5psTa2QWf
 ZhkysU2poOy3jQAXYosixUBTzH7/F71jGYIOybRVzWGQNPbUw6urLfHeXuYsHQUICkBJq8FDWl7
 9z15oDIJZg/vbUTpR/mBuQJhlhGSQSdiuE/RaoD73qniGiXeVJkQBMMxSQsQD5rT25T5OMEvsIe
 05OhDW7ExeEw/IO2l6GYQOaOr5Nouc5nNYOGPrPB+YHSEeivBCS3qyMcl6M+NQY9lfNmksHWbpC
 OcFmQjZwJz0uRv4EJX4dsaL+AE1qpJsNVFipK7ZyuwRifGUxm/qMPw5VG7IeVbIhboeTG39v15o
 P4LzHeHgf0tCRvLBeXg==
X-Proofpoint-ORIG-GUID: 1FWGkLCVK_9hLwBWMAx1Tciy2zIfCE6M
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0OSBTYWx0ZWRfX+tTttL+6I0KD
 GNtgGBPKn3sKYDpUfKZVBNHXambqwjeUgAtAZEUFvrTzSfGWYvZmwbaPZ5Xs5lMH3fqdQywHz9e
 DtGHU6Djq7WLhrc1kURcZ+NmtIwqF1g=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad1509 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cMKPt8sKVRzp0kMMbBYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 1FWGkLCVK_9hLwBWMAx1Tciy2zIfCE6M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180149

Enable UFS for glymur-qcb board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-qcb.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index 17d8ff3aed23..f17181bfeadb 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -697,3 +697,21 @@ bluetooth {
 		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 	};
 };
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 250 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_e0_2p4>;
+	vcc-max-microamp = <1200000>;
+	vccq-supply = <&vreg_l12b_e0_1p14>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};

-- 
2.34.1

