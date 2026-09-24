Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C520A48822C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246495; cv=none; b=Phtfe1Zi1NLhRq9VJcLvdE71zkj+esuAsmma/wqa223SiwYPkfYRyWBhQtZ1p0DLylBofOgkwG8GLQvaQgGWFeAi/BP9nBoxzMxKrg9GePaWuTiyN5hmm3bQzDTxa5at0bILGRGH1TuFX7qbyG8Hx7w2mOjEhDkjz7uocS0Ufwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246495; c=relaxed/simple;
	bh=yQHDVatt72dxAqTGiEP/fVb8h6kq5JRi5hP7B73zVGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=btXKEGjAUrQT247623/xG120scbMmqvP896kRwXc1RKxDgTPswawREy1hiDP29ToSQPr/d7WXceOdlxKVvB/sojpHcPMYsa0DhFQ7uvprVoT6hYLjiemTGvJay6nqL97yADLmwymTwZ1IAgdvyV9RuRyVCAvaqUlsMK/Ceraaso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRuZJpZD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APMpAWIM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRuZJpZD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APMpAWIM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3LT62483651
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=; b=IRuZJpZDpc49/oQx
	6rMU/u6YrG+yjJC1u8+hboDA3LjpLmcW+njOUmsAGrqbomebt73ZrJQMlf+GwqiH
	RnFWUvW5w1TevP8k/DHjLGTgKcvyp3vVsHoZXnpjHFcVt+S6nUcukCeYAUVlyPKJ
	3fb9jvRdtsR7Tk/nYeej6rm4WlqLzv2+Q0IWDwpxG2NIujFeVz6Z0utE2O52VBlX
	U7Y25bJn9oino1oECv2Wa31lCa3ZTcAbScbILzHlcajKggxhl9/PUDWOSPxh6bmY
	QDxFFVnayh9Ve7OUcZOAj/aKs+RLuVjzf3t/UQUBnKSX4TzBF5u6hiTcrir3tKlh
	ps8NaA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s904gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1de6d5c3so380498185a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246490; x=1790851290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=;
        b=APMpAWIMb8guaIc0TgTI8ZEjEmY6jTrqH0d1E6JLRpXFZvcBhZraq+lmVPFCKoPRnB
         oHkweUwoDehKmTfYDi+iaYUCmOtv3oMutcB+HwfkRE/Rbpn4nhLWag+sWr0QszoJjQVG
         NI4J43jO95CWfAoRSVer/+5WDuMb3eirBzNJMR1ESn1gXAupJbhpoKl3LGkHRLc5QciI
         sHMUE/I/O+lV20T52fHc/5kiV3cWseUet9Mg3HMWc8gQnvbIdXHCpFRVEOdK3LspgIQq
         rn667E6JdWzTEbinhYbnIRq/D+J6s4ABF3U2b1akMAS+FxTG2U9sc2GfFPlRXyrtqNWq
         oo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246490; x=1790851290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=;
        b=C7XhUmMfaKzDJBOxPFz3oL/HQy8UQmVSOPWgvTEsPCo8lnkpzJk64YhuR6TO9rfY3t
         /mEIST1jnaMFpOCvQprafqHb0zU1yrtMqUCl6w761vx1Z6TITdRnKMQ312G6o766FwRQ
         VOtZbRSelqCGUPjO7SCO6oGM3Jk9M+6LtXLFgMw3HxwqyaXs/m6EcBP+me1emU8aUdwT
         mbOvo6eK6DNtlYltabQgMq3Vh8SiWMcfMZEDb7W9Zeww/r+n7z8dyIehHLRXatYFKIUo
         9LADKXVBZDmzwqDNYO8ZVjikPMZ20Oj8E4QhEJPlS6A0vnnYavCYfrGZwFlMpBVzWCdv
         yNhw==
X-Forwarded-Encrypted: i=1; AKwUvBy6O8yQT0tVxSGCAvvHeA5HDNeZIulXMuHvb4pMR+y0Cbxi3f4RrQe1e0m0yOFyJO3G6r8Bs20QiQYF/pE=@vger.kernel.org
X-Gm-Message-State: AFuF++lOi9GMHlIoZaQ0t4+MamNLuflj2WsaxqgKgDVS1df54Z5U5hT6
	eF6SVOY46XiQ3vRY5TJ1bO+Ij+qRNp2+za8R5/5HKmDuYScQWSh144z15UiTAeQG9V5mE8q+nqo
	4xFOcYxPL8ao6yvCfRomUoI6P2cPIfgGvhloFk+WFB/oA5qX23UpWpC7dPcCtgH+xPvE=
X-Gm-Gg: AYBFou1D3mkyirzj8tlzQnLgxwm4ANtZXeXVpbNNPjm1t4tTqcplhx0X2I4+5WOPagZ
	QwuUVWuyCrsoB+K9DSsMO6na+Drs+IFLjp8BD/ace/nV5IcJPHq9BoZLvcWZ0nDBiFN6vHMmD24
	qm1w+eykSoJrWUPpdqt0GLfaTkyppQjT6+kJMNXrFJqRKfQ7SGXubBLyytUSgUmc5DVBsYuSNBm
	IMyepifaTtktCkK8KwYi40F/TrdXBJ6CklNaICVy31Sne80Xqu4repxgwcziwJv/gRJz0UYWEpp
	W0EgeOPSUU85xN2KO8ZzQKcj37O/OFzCK3wJVKcbIHRH3jCl9Ay+wdJo7CaMb78wKaa6YTlUaoE
	oeATg8jjh
X-Received: by 2002:a05:620a:6604:b0:93b:d79f:d949 with SMTP id af79cd13be357-93c36428079mr213856385a.62.1790246489751;
        Thu, 24 Sep 2026 03:41:29 -0700 (PDT)
X-Received: by 2002:a05:620a:6604:b0:93b:d79f:d949 with SMTP id af79cd13be357-93c36428079mr213853085a.62.1790246489143;
        Thu, 24 Sep 2026 03:41:29 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:44 +0300
Subject: [PATCH v5 28/42] arm64: dts: qcom: kaanapali: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-28-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yQHDVatt72dxAqTGiEP/fVb8h6kq5JRi5hP7B73zVGs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3150VKLVCnGh5T7vQAYhZlzOGSDYW0slUy2
 mCfhq9iX5OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT99QAKCRAbX0TJAJUV
 VoG0D/0QZ91uGvffLXiLnx75qIbQIeYQRIWsEakjq29+AAiJJySYhir+59JUdxeLK1XBAwEpmLp
 bPwqJQhgWCP4Tza1RFbwZjElJa/lKHwo28dZak1BDE53Mo9Hvxx2MZw+MgF/gepdF0i8oUJdVk8
 XlX/1sVw7l14kxU9G1sZ4U+B6Rd4q3jNRAacL/+IIYmTjqS+cULobdn+IBpbhA66ONDEihJJUSm
 d2/aPqAU8yyu0B1GXZugpix7ZImXaqTVC9Va86lPRibif4iJGQKI4nWDPBwQsirofn+cDmfQMMg
 j/3wSjiuctKIimhcYCmP5jcCTD62965+BFdcF0hzVn50JteYjgm8GiLrko+Mxvfjj0F97QEW8uh
 5ODIoRkz8SXO4H84fGpAjmxCTJj2rdjsQgsRUz/zyvtsc87BMjL0wl91ulm6J12dxK6290tjZc2
 prytt9VRgsjTH0vntspkWptVFQY+mr86uI+7HE7LBPCOBLhHOSBPE/UlczU9HgXDQM/rYAL3uQN
 J0h2Fjr/7BrA6X+i5ES062fnzGiuxYXFZXFFrBzw09QJjhzBUceZwHm87OkCro3xWHYy5BLv2sj
 sX8EBHTxLbDiHltGJsLDuQFLufAufIZZMKU4PHafqJzSFwPABW8OAkvDmtWa1ptA1taiTK133Q9
 yksVKa0xYFJo+cA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXwDJQ+znhELE1
 /VsgevDUhXYtbCyeWuE5fsu5Cp9WfGxd9FuAvkcc5myoJccyF615wj2XAmX3ysg437Usdfov5dH
 Gy7M6xMeEy7LX3R0KoI0/VVUupcd6TPIOXlr/T9kZvkRWEd3tIOVV3RS1a6bmQk4SKJ7609vBLn
 1w2OgPJxjB4H0dCQngwyfYCmSttUvQ2vP0PyvfwFmB5V6qJyyTZ11qwOhwIsJOO7gJKZf/liq5I
 rSAZ/D6vakHIUFswaT2Od3d6eaRnwq6PY7jrsfiqau0zeJmKvhsxcZ75yptPqwvkSEDzyUMgwE1
 mX7/BU5K2lpLiLDqCtcQAAjMLt9WnejB74UmnxQmnc77rrNRKFVvISYdtjuUzcOIlLGa765UA4h
 SoTLUY3CaAe1/JNgTszTuhM5JtYXrVQJbdEqEooMWguOLVAoXXKmmr6cXYLT0WBG3fskcBZRVam
 KHNY/3EXI80Vzf7xacg==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab4fe5a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3K_yQeBcBf-sZL04j2EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX5uuV+U3ycEny
 c27hMriCmiv5xRPKlj9ecRieP8JcHQevw0LcXFKdPRw5qVDFNuDY1QzHa3WH+mkej2cyRKnmHwU
 JcX5O7q8nERUas9yYtWR7G6QmZbeYNw=
X-Proofpoint-ORIG-GUID: 2td1joj6mpINHNi14d74eA2ze_wqt6Mg
X-Proofpoint-GUID: 2td1joj6mpINHNi14d74eA2ze_wqt6Mg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GCC GDSCs on Kaanapali are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Fixes: 2eeb5767d53f ("arm64: dts: qcom: Introduce Kaanapali SoC")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..c1528cc8b7b3 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -552,6 +552,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

