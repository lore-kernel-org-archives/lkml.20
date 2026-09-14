Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6315B497B85
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390223; cv=none; b=GALcuwHNFTu3L/rTM1lRzGQuUm2ye9uCB6V+Gbljlg+cRfMi/zkgcpHCiB/AOiyLVDS4NFRNIwteoDc+e98kQzIXEiiXYE31x2/fcELWvgabTPv9iwkvCuszlW0PIpZgc0Se5R3k5OcjRn53D6j6v6yQdqlS3U9j4wGdF53KJsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390223; c=relaxed/simple;
	bh=gDMpFJWapcnhBZHow5tYWj4u0/ni4AXCm1hEuPmwG5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwbEtm371DaSh4q3kteYBdY4V6v+8e3l4nq9SbfrZi4Pj9Zv75ISISPRiwXacWBP7kKW3IglO6P3hGZA7UTCCNqeJvu8THbI/DeegWRXAMhk0QkAK5BttqTETfzc5lq7KpuAOJzy9fzkVAjUJZttUM6GPR4R+ixaXK+KRfaiPPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjpOMBOM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+f1fRZ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjpOMBOM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+f1fRZ0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlxTG1460629
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBk697OcXRYhQ5p1XM5h8Xcl5jMkWBXjU8/ArCjrsWQ=; b=TjpOMBOMnolk1QWI
	ZZOYnirI51SSYdlfuFYoNBqQyE+fpwiIqjrgCAUQlDJ9ynT0qGzik+zl6TUX+IM9
	fA/xFsoId+u0LbJ3XV/8UVBrzbZ5gnY5X0AhsM2zPzflqNO0pGFQCAtndzohBN0V
	O8dJzCgZywnRhsQKP32P7FKENyRbSjm4bu8J9gqNHCSb1zkK1OED8jYQxibBM6Z2
	j7YLsRUGhFP6q8JME+g8XKAx5dVOK1x6jw6hHTxJYl7Dv/BoMnPd7CScNcPhD0hs
	yXGRX3WjNYzhBAFrwxTfX/pHGr+74rjpv6eH/jNDukoDNUU9c1TBFKaoeV269z0H
	HzB02g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8qs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so675624985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390218; x=1789995018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBk697OcXRYhQ5p1XM5h8Xcl5jMkWBXjU8/ArCjrsWQ=;
        b=b+f1fRZ02ERf6o5Xb/LAv2HfBoUSFGxbRGXilmf8222X/McGkujLA+Uki8h26OUf1g
         WCi5P7CwrPoFhj6EBwUB7xJgenQ27KleTkdJQ8IYoeXlbnPtLg7+hriF+dW3Fc95E6xZ
         P7ElaMEijFQdnwmxHxAYctNfxjKsss8Qb1ByNhyClLy7HjcvbU0X5ILllvvzGRjpQMcc
         kDQxeYdJt5IlWiCB/dnu1kM5kEPeq9CZjQisXkZnbXh1UM0/sRXDLEblyT5cNR6dIp2H
         kMGjp92hWn2VoUwM5GfmiMd//DJPsGnu/Tg0iRWqnhgVxF4YrJt+rHOmdKJL0pRK+Tip
         h+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390218; x=1789995018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBk697OcXRYhQ5p1XM5h8Xcl5jMkWBXjU8/ArCjrsWQ=;
        b=T0GWdVGTSmfiSXxT7xGxsKAAIFD6ORXHKynyLR0oqrmSS3lQKRQmSIoY8yC6g1+77F
         /lm0ekOSmFlXJtObJOsuue0wwJvzKVWwkI2KqMkjURTjUNX9jj669JD/qObeCnXY6zat
         kTuSI8TizbkNfpLJhvC5n+D4nyL+A5VlS2xoi/CKX2/4AsdYD7A9KZavjr0PishbzPrI
         BPOvrrwYwxFAsbx5k1ejYnFNpcD89MyAY1TA+v12fCUHrpMpMYBhlO/Kuv1gnsAMDD67
         32YRYqmF9ahW1YhZx33gG1N0iNMiVcWQC/rXwWMI1j1/h5moK+vQM1fof3m7ek2eX9Zv
         E5Rg==
X-Forwarded-Encrypted: i=1; AKwUvBwEUvhKmokpIpvcj7PqGZPvqYRaDRKu+a99QFa7kmUTOB7hiqahS+EKKgdc5G4LaKdnrWYXk22EpCLrK0s=@vger.kernel.org
X-Gm-Message-State: AFuF++la65LMknffgEIQmuvCKcUoJ4FJTjOoYC2nxKudAWvUEE2LdGK4
	AAuyb533FyXT1cz5CRQV4VqEyfIEkbdP2m6rfrjFjWPEJMkL4BbCSjSt1bToPjs+jwVd3IaFu2U
	1PuOvvPzYyKBfBMigsueAnv+Kv0th7solesgkq6UvhN7tw5fLmu6JmFXV+bG+TNjzNK8=
X-Gm-Gg: AYBFou3Gqz7BLqSDZRgE/U+poeDhu79UPc/k5dLB4d5f3VX5sK3cgn6UI97fo7Ijeos
	wBKNupnkMcFru7kovwFXchYbu+0Ck8oJUwMwBSYahxhkO5D0sGCpzisJyIn0vSF2U2ZzNYpHpov
	kqFpQ2UYmERzG249jj3JImy21Ox0492FbLPKlcocb+Cj94dWfY+v8E3jTyiLINFf1tKuo7AWH7H
	Re5CkjTG7Os7aoftqcy6iithyZEp8HOrzuEqLwPXyuMrFhgj0Etewu+fwD8cce9r8puj0hIfJfe
	FJHKi96dG6oaLyA8JcPrMvR2LSTaNVvSso5XO9W+N9UhhzhcD7wyI0dtArkWmnP+wape+phORIY
	fH/fg9TEM
X-Received: by 2002:a05:620a:4885:b0:939:5f4d:67b0 with SMTP id af79cd13be357-93a29766649mr345894385a.8.1789390218141;
        Mon, 14 Sep 2026 05:50:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4885:b0:939:5f4d:67b0 with SMTP id af79cd13be357-93a29766649mr345886985a.8.1789390217488;
        Mon, 14 Sep 2026 05:50:17 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:16 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:50 +0300
Subject: [PATCH v4 51/52] arm64: dts: qcom: sm8750: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-51-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=gDMpFJWapcnhBZHow5tYWj4u0/ni4AXCm1hEuPmwG5w=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z99RrWtRkAmEqS+3SUBLhnWTdNFd2KpIwrz
 ImDoDhFN+aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs/QAKCRAbX0TJAJUV
 VhVwD/0cBO7oZN0lN/wkNiy5t0jlMMGSOEGTNF30cWjVGmUlWn/f0HKcWx1zf/9PJ802mrlKHmb
 Eb3sT3obVr6vcC52UG18hDKNFUK+k6jDqWKfodSlEORd9iIv600ucrs1qVDsp7fzB4YASSselmO
 cyDAWlIBwYnx73kFB1DjALRCXjKJ79uiq49hUQYhO/Dmw/0TrPtXUa01aeQeYSH+wJ/NFTAVlqG
 NvNtesIRd8RobVyUkAjFarJ0stKDh/BGWuPuT5ZdW+XCZ47fA52LLzikfmkU7ZFANUPi17l6xUU
 zx6OD/57BuAloRYjxVENexoJa4GFWYcz1F4qU+C9kC/o244qfB6xZ2uqDA8RUGNj4ARBMK+TDu6
 NP14we0P8nqrami8i6s8fQFTOyXMUiFAOjjLQYiobDOs13c2IyGztV4kC9BZWrCFo4XNwYfkmhJ
 +7fYEJVXUZ2qro90p64Kgowm5f3L/pkXt4sM5myDVhOUCMquoeTfrKHxmsPKLgAQdXJjIkpDmh9
 Bo8ch27D0ODG2CMgPmtFEFNgw3iUAC2LIHYMItCT/YgQqXW0DRDw2spcaAE5NpqOxVq/Wml/u8D
 3h5RlOoYw5DL9zfIT1eZNfrRSum3B4BFR6dyoccYGVKc3PNkhmgLfMVhCD+hqJ111ZMeUPCI7+2
 eRyxSeSYY8w90kQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXwu13E9g+vGns
 QKSt4byEDEF7WtuwpI3kHJaaoFNi54bUlAJgcebjC+EdxTtfS42EAAGDq5hP1rJ823o4adFqJjL
 97hQ50kBhtAS44K5W/cC8WqR1ZhgeAI2sxz19oGcJeztUstU091RetLWMLkWdnRUGbp9jgubDU8
 kFixaNRzpFZT0sqi/NFDlT9kgxNlWDecFJq/sGSwaOLZyWFvP33uuLLHY2H8kI43JZXgtIjwBW7
 mG/wsSGXG/375/qBGwa10gmJ0o36eTo1Xsr4Sq0bv39OdDTF+vjsjiYuF9KW6Nl8yZfyQhl0oIv
 KJy+MQjKaThHjdo1HP0SScKesh/Kh3QMMI6lGVSb7SiqmyUVFa9c9NAI7/UJ4bIudM36bwHDm/H
 xTymL8FoX15Gn7/7QMP/XmjARpVROgZd1r3ndK4W2L6FQM70Og9r4rKR3TlnR+bw4UfW1usC8Bs
 d1txLooCRChms4S0wbA==
X-Proofpoint-GUID: TsFG6emE5KhndRN6OSkjcNmCLWpcSBPr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX9a4htI6Tublt
 vEfP+BbYpfo/uKj1JYLiJ0u79pxDll4CwwQZ10jjTd/CPiBBGPvb8P/4tTFAIrhWdmmWlU2Do56
 nAmKaynIVKGABPDfuPIpPPGLuySVIO0=
X-Proofpoint-ORIG-GUID: TsFG6emE5KhndRN6OSkjcNmCLWpcSBPr
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7ed8b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SM8750 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 28cf22da854d..b9e943afc510 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -677,6 +677,8 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

