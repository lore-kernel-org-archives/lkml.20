Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D70499F14
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390227; cv=none; b=RtwwCLE6nhpplpTGjn/fIYN6gmbajutfbAOz+MYyzgWP/j5BTy5nWOyT7I57uIATP0JWuu5kTP9Ki1rx8V+8MYwoEtUJtUXfuHWmhmZr8l3Stdu9wWjYDlrYgnEJ4yw0poNd43yZIeMLzZOJiCgQwT5NOhJEjjLUfxXCegYTRJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390227; c=relaxed/simple;
	bh=zokKifpcWDTYAQ0OW5XV2QtUKjrgfCsVMCeLEN4vAAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rUwoJRbr91hj43LPew48XC5/MoJO1zfzEOBArgyAyN0/eURSYAl+CNDUXTrDb7/P91lpdVnj9toVTV8Eh57BzjqBJHRnr8TfpIf2TCSiKoa1I6vR9p9bw1LMJ+qIEV0CiCsQkv1JNFhXOoR6V2K95KmczgHR0SsnJncOTGLLFD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceXaywzI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KXjWjJR2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceXaywzI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KXjWjJR2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmNaF4032584
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VoEoiAR4xGAty5CIO9eeYSrddXDkp9VOnQQwHBV4Ckg=; b=ceXaywzIh6R1jIJP
	UFiNZsonKkg5zt1wexhmFMC5/jVxOYKpJbraPf6xkGVucuIyjVtfuTRTcobFs6T9
	ysJXr7hIxUdtrM/OkAvcBQtS3HKR4x7iQN85BfIxkq/xrza5g/OG91cIlN6cHrdR
	57DVCPJYc5gO1mpmgjkQgNchC6BF+lK0HqDoLQ9aCKpwRAvRi0mRY+LgXWGKIV9n
	nIrvBJV5Cuy9hscq2sSJUakn4z73TheeL1KJKxyWMy5y+1NGq80UZAy0cNPcLBLd
	lDO9XTcDnUCJpXcF9upp+AkPYWPaTEIPTRnSnsKQh6yx+w4Hi3yOWsAPb8w7qjG+
	d+nbXg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8kvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f248907fso242148985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390221; x=1789995021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoEoiAR4xGAty5CIO9eeYSrddXDkp9VOnQQwHBV4Ckg=;
        b=KXjWjJR2Y2avb4KMFFJ8xehP89QmLmWrJdJNxU3TGXTvHTxREnJx24htxAjRNlaHOG
         fHIa5ZB9cXlP9pglVrKsoSHYOmgCtFF9qMWeThOXjOaaJj9EfP1gESGb7WxPnvcLEm33
         wkdHaQmfbMjo5fq27rCG5eI121xw56hQt1d9uXfT3FmVbYHZKY7sH4+fRvn9L37n3+4S
         CiWIFy2RqFvwYV1P547XtMMYXlptx7yogMcYLVR+IlK47Zr297k9UpydG2+vHpoMAB5f
         k3khcERLoh4ilHuzyphpyYiiN5uTkbZb8kSChGgDql7xJs5AXxv9MRmpwwdeYMLOX/ZW
         wzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390221; x=1789995021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoEoiAR4xGAty5CIO9eeYSrddXDkp9VOnQQwHBV4Ckg=;
        b=OqDgkMezB9pMVz89x7fFJd/163Qhtq3/y8iDPSIoGUtpnRLTEtXOSTcxmmG0DZZp3R
         yDzL/m3QPrsmeGXsgEZ+oEbOnhN4j1qmqapY/peayI/rx50tEHZDw54X6v3P7FA080Gy
         pG1E+aCnqwX1+oxQ890RbVjYoEf13k6ynhPnyoZqKEvxrakqJzccSek3b93C7J1w0rjh
         +3qQ6b6m+gkqzgp0A+HNpHHGd+G3FNs5Z5ZbVE3bps2mDKArnNaLqMF0eOP9pryL80M/
         ylYhnPD1kWKt7RvZSp/17VHD25RgQZEof0I9zFa3KURCbwOmNZ3+0dTX+hVnjPoKiAYw
         ocPg==
X-Forwarded-Encrypted: i=1; AKwUvByzqsWviGj5zZl7CLtAjptREU8Dj3pgQArytMEw8LBAuz7Fo5KVc2qTQZFHH7f3druOc2kbHe6A6gyAp9o=@vger.kernel.org
X-Gm-Message-State: AFuF++n+/1zvXxfgLA7uwANYbJkhRtn24M9XzkJSmlJEyYwEt8bioqCX
	2ZR+hNDaY2ZC4zB5tThDxpk+oacElmaGhFdYqp9ZY8Cjir2DsDsBy1/qt7WwN5pdd+cM7qfb0Sg
	+we5NfOwpy540PhSZZ08tC1qqpkhEjmCg6MQC0X6B4MLTbyEmTVT9PZFnw2TXK82uc/w=
X-Gm-Gg: AYBFou1a5OuujgDKHUiOeiZtGaIgR4HI2lR50ZB91EqslmWXELWycUMHikTk6REe7Ww
	JWHXEWlKe7UFWu5u2Esgzl3IzaBGd2qJ7sVUkW2amXJBO3gcpw8BVaBNvki5TIgmUVywccwO7A8
	PR0ZxUEYS1S5HK5Q2Xj9SRCgNK/v/mOQsXE+Zk9DTjKiiKor1j8a2QsnTnoeTCKYTwaP4vUfwgz
	W2esZf+k+ME+7TE3+K4sG0oJDrZN5y/oNqzIV/m5KyuW4kYpoyGz6LctBBOC2EEPF1aGQQPvDUF
	xp0Y5/h1LtbOFhAP2nxdojM+RPd78gSU6j3LpYF1spH8F4eoVld9LDdbLi3fTM8DOwp4FfksoGU
	l8P6TEogT
X-Received: by 2002:a05:620a:170b:b0:92e:e559:fe6b with SMTP id af79cd13be357-93a297e904emr328329885a.7.1789390220895;
        Mon, 14 Sep 2026 05:50:20 -0700 (PDT)
X-Received: by 2002:a05:620a:170b:b0:92e:e559:fe6b with SMTP id af79cd13be357-93a297e904emr328322585a.7.1789390220145;
        Mon, 14 Sep 2026 05:50:20 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:51 +0300
Subject: [PATCH v4 52/52] arm64: dts: qcom: talos: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-52-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zokKifpcWDTYAQ0OW5XV2QtUKjrgfCsVMCeLEN4vAAE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z+OmJx+PqFZf6u4EjFnsf8uru9IyGCiqaYO
 pVC5ZN5b/uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs/gAKCRAbX0TJAJUV
 VncdD/sHJiMHTA/yytuKmvV8g9Ltx3AmWpGo8uRqI6hppvjBnnbrhciliYWbGPcPF2GWEoJzVMl
 GJS7yXUqdhhF2KW/b+t8xXoj2wRBQhcjPYPmlDoqDt+K+/8KhMmLCIKYbNtncQ6bLQx5/s9kRiD
 6eZm/Wpt1iOpldSRc7OGOPtMiG5REfUWKo7I3RkB7SUpLddJlDAtEOvJHG+BC74mYLxR4lRZhsY
 yBvTKkgExgFlPENRPWx01KRgedmKlW3Pr3cT0nqBlDe4cV+GVZeVXGr38EVv5CmswCsWnzks6Nb
 9evnjhMm3Sk0dpvYv8Xu3pC5EVVoUpQjA9uATiv1rraC6P5y8vUn4Gm4ODfqCVzfF7kCktWVGIt
 y/TMCxGmqWZX+tlzJS9092g6J5zQ0feMsP+HHi108YKka6nXxrrfeVYorByE2Q6yUFBeY9ZP7iW
 EWbKpYWTtnWBLJPbZfebiPz3/E49tjIFj6IktqLX8YeAyKW9BPILpJA8A808oasnV0qW5tzS6V6
 c9rD4J1gajttpdDVgctcjg42HuhdK0Jw/tcvlUaj34NE3VRdcV6qOGe9xeHOXEXUyzLWw9AV1oK
 R3npk1PqmM+N1irkQfFkD33pJWAjdI5A75O2QRXGJxK5UDa4GJi1/Pzmpe2VAE46kpurYHv1djS
 /OX9p332JloHFFw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX1lODeXOixDKr
 sM2NkUXMWLXto7Im7ScYUGsDg+aDd9IP62m6a2W1GefXrfiJqz5HMdhz73SbZTmv0xxxD7/Dfc9
 IVGQdG9Ts8pHncdWXyDo2h8oWnBLV7C2tpQBWiBPRW80OwW7vlSLDURUDJNx9xttHqXGLuVkuay
 BNSOH37rkv2LsFyPna15l5q+LhfGNe/Shj4VpO7V+mEg2s7Uv87tf69jQr1xetm6mNhXfxM9Sx5
 mjr51l17x/lMksImPScHlFOvmZX0w9CC+JD8ekfE5GEFPILcZfWKHBlRRmwFnxJ6vA/m0yJBd1f
 QwKTx7x2nRc4d+GdBMtlMZ4+rnmmgXvSSuPp7TGfb4UUf3SB0eHe3nuaSHrc1orrEOTZzSKsFS+
 l+u0ZaMGCaEEf2aRLL5T7TUZh9/dBuTffOqkp9eFjfzOn6hWi3J0cm9mM/oqEveY7bD/xdLJlSW
 EiHmnXDUWxBxOzdrh9Q==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7ed8e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: qQBaEHaLCD2pZ-bfXy387ubiS-vROBlw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX+oX0GULbaJg1
 xa0XigZpGk1v/AqirWiBUvJnGCBsbI0B62HQXBUCqaOGlgxgHo+kTQoKkkexw05O7eypLLZO1mU
 UnzQo5VUeSiiGITd8EkV3wHMjCRC9pE=
X-Proofpoint-GUID: qQBaEHaLCD2pZ-bfXy387ubiS-vROBlw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on QCS615 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 531cf41b94dc..860673697f1a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -705,6 +705,8 @@ gcc: clock-controller@100000 {
 				      "bi_tcxo_ao",
 				      "sleep_clk";
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

