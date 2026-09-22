Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17555275B0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063540; cv=none; b=S6eHHVD5d0DAjv/mbqPMqhbJOiIDszDdb7kb1b8ZpF13s2BZ5ny/6HRbIb8p4TX66jSpZ6SxyMKSHjk+habopb9t84NV5Rc0MjsP95uULur4RblnW+nonkCgloCPk3ZOe2dUMn0lTpt7WIKU+rZ73OacK5ZhQkYQF0Ieucyh/vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063540; c=relaxed/simple;
	bh=262v1U0Tkp5x+C6S/jtE3f+Te40vfsxOH/z2Ilw8EfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qGpDUI3P4ggFyWHkplVCbkTLo67CzMq4lDmLoQIEGvYYfyT0ANj8R3KbM4aC0H1KpOUwn3CJe2ZcS6m5CFBlfbLGd68VxDqRL20dSmFaCaYF1/2p4oB8MywTOei9Eq0J9e61tyR5UN78QfPitiKPIgSgbuwzQHVlPdx8sxxRAC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FzZWn7JV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=icjh+4LI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzZWn7JV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="icjh+4LI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M4MaWO3382626
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IQT5Lf8ST38dRnd2k/xXz0WnJEWxcT2JfYhUujtaKuc=; b=FzZWn7JVcw3Nk2J2
	xFeEusuewCsy80TkQ1NBvRne0FTd3OXA3F+sABOdHGRlF+QWMz07hTD2+3rKfMUD
	7o22mwlLevrkA769NqyELtDo1n0XXsblJzaTlJjkT9gr9MOA5isQCVwHc992ZWzW
	gA+7d0lcgpPpMB0y1XcViCt2B7yL0p78fEUbdDubPb1eilzoGZZM3vnQ56yWfRBr
	br/Aixedp0RJqgxu+EoeEBDWGVVJrBMo/cBd8uICEIYmwAc8SFItGmuc+lhMtIhN
	APADHj33N7Zu25EApQ7jEMIYer8yK3zc8uFDVYtQaG53QSJIEs36TgpBZmC2wamW
	NCAgGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj8rt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903622880so123267985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063513; x=1790668313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQT5Lf8ST38dRnd2k/xXz0WnJEWxcT2JfYhUujtaKuc=;
        b=icjh+4LIiZO7TRApEcLZpW7pfipMNuFIFVy+bgC6uC9jFsO2V02xjRuEUyrexB/Gs1
         J8mdqd4AadI9wezOwMQhqHWzx04sMeuzoTcrSUrFY9vOGtvR3SK9vt7+lacb7I0/JuJH
         WlWtpZQd3NtyYFyTBqR1GOzRz6kpSeYM5JN6mwOx7+i9VHsFg6HIOgKveUPj9r1nCj2c
         dKAWI382A5xgP91cBktXo5QTjHuFDAyoZ+fD6U12dNtq1EKR/j/BayZXNGV97xpHmq4m
         Pp0Pz0DnBwtbjxl94krckPhbsLaj4jj0F5lig8l3cGyxmfDZdthHSkwVnnb/hZASIVB8
         t6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063513; x=1790668313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQT5Lf8ST38dRnd2k/xXz0WnJEWxcT2JfYhUujtaKuc=;
        b=ZdurOVqH9JAdkFXW2lBOEf53VlanDAR47AQpYtEXYKc46BQ6nR49ol5i+eFxGga90v
         OOM2GoakMkWE8ZEvCnZQoL/PVoru5hOlf46rNsNE0a9YIpCb/b8TvrqFeDFic1B++ygF
         PRz5LcXYQY7Io+vDydu8DKK3gvG7acXv5o0DahupPZqh7H1/oCunxQAtp7fNl+cNwJ3h
         nSOJBf2D4qSTpucSAvPHwSVS4QQSsIhps+3kgwqXlCZCk+I9BDt5nmevU4YFMGCKl5ld
         IIJGgVTUX96NpXr+XHLrCn5zV2iIa/7A3Mf5b1rbTfJ2jjogIZWCsYL8QdCRQPiue6Gr
         /aiw==
X-Forwarded-Encrypted: i=1; AKwUvBxY3Q3Il35sxXeTEQeMuh+lSby9Sg7XfOeX7INOi3jfYsYEnu2e/gTo/A796eynAbKeAnvuXDzXYp+YAIc=@vger.kernel.org
X-Gm-Message-State: AFuF++mKe3RvQkLcg2lZYTcACEh7SPlJyCPyw78Yc8jOw6wK2lDH+LLz
	nO/oAazRORmCMOJ6pY5KaMxWpEFFd53Sw4cYpf8MWdaArj9pnittyIxZOgNFNYX7jbPPudrUBKl
	40yfq84Ui7xIueCM4YgV7DXWimW4wpW0NgfwvOEMThDOAuWpOJelohEDdKVjRaTEck0A=
X-Gm-Gg: AYBFou1r7rP1D4PD3hkjmi28uxA11kpJBtHTtY5oAhwyCeYePfZi5nOdAR12vHBY9oL
	BhgtbDHRZiJsWLnMYoIEc7e5rSIL2oi9fRavP9WoeKzFAA4219zYWODVKTMIPK0ZdQFH713jMdb
	yIwOmfITwAElpgMoS5kKwcn3YHVqaDc2Yls5g9y7fkQR9VTE0oxG+VDA57tgONKFpOU3+EwUYJc
	ZCayDVsb1m4xAgig/NcBmS440Vvug48Dr6k0Nn8jn92scDxXXJOCBtL40gLMl8rBDxGJsgKD7XC
	FyD1lG8O07fICMObSi+dwgzIRDo38Z7Qw9a/5jCSJTRFRch/meljaQXPsmrYOS9kzOrd2F8EDKx
	io3+vG7n7
X-Received: by 2002:a05:620a:2a08:b0:939:5d22:d1f0 with SMTP id af79cd13be357-93c17e14a30mr337164785a.2.1790063512918;
        Tue, 22 Sep 2026 00:51:52 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:939:5d22:d1f0 with SMTP id af79cd13be357-93c17e14a30mr337161785a.2.1790063512461;
        Tue, 22 Sep 2026 00:51:52 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:20 +0300
Subject: [PATCH v3 11/13] arm64: dts: qcom: x1-dell-thena: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-11-fde7f8a53382@oss.qualcomm.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=262v1U0Tkp5x+C6S/jtE3f+Te40vfsxOH/z2Ilw8EfQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjN85og7VxTIZPWFmWeX5+qi8Om9Oo84WWRyt
 mTPm60+MbaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzfAAKCRAbX0TJAJUV
 Vtj7D/47OFf9X9oAR1PvlG+2DOGGn9jW1z3e50der4cRdUraX5qHZvl3Q+bsaCmPsJfUHNdDqVF
 ZkuTiZ2ZvrJpeLJs6E7GwsGwu6jBEMXn2esPZWF82rUg28HxANfXg0GOu8RvqIGPURD86Tr3Luq
 VP3BbPNFoKZVbMgwQPjqE7akRvmowBCrJSw1/aYISi6kGnz5Yf4XHkoVRef71mLs4AAY9nVLPpL
 /i/5uVOmMLUNLtNwZoOcSV0KjVMv4dzlp16JU9c93L7nY1VsMPv5JGGvRwiXF4PX6JZIZBj8Isr
 uUAZsvOu/iiuymAv0CcJR4R5/xjkBzHgRg3osZ7WKNJf1CMuoleuECqiza2uEwJrR9hBOdx5BaU
 9PcccKiSEJ8+Z1pnIKxqDLrQrqz5zne/a2ByaCuvMDmYqcEwFDKOUlrvJTAQWTwllQDdM9i/9Qk
 xYNL/kKMJs/RWfeu+8EhSdp1cZQlRJqkyKrzUgBZ/htqQBEdviey10BF7JJ5nb7ibXaU4AwNuZX
 JskgsWKB/MWRaOb9BF9TR7WT4cl7oCsnttIWIfBS0lVORMy5zrea0EkgLF2ddiygGUylPfPxmXP
 n4ygLXgYWLGl94V3bcs8DILcqwmOdG5I5KudplIZYlB/nj7OzzLlgsSgDksERrS7jMY9KYiPbOM
 q/qzqJICzvrHdZQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: dRcVTgk0CMMdH6SQ4PI8DTlpIWB-IgRl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX8RlHvimY5iCp
 KKsbeh3Vt4wwuI8is7q1K6E4B2cN30sXliDYjAl+Dha9v3v+GpuQGvUsi3EU+yVYCaNjk5Z9G0L
 PcJwp/+mdQ2D8ApPLIW7QMVK/anSM5OZEa3uAhEkW5fauIGfGMy03U+eweFTHt2wkVtLZTVlbC0
 3cT4NNMBC25DyK0iXnKb/T0BAQyzFqxuYawTnJ27qcbYZKwWfAcjJ4ITsbC+18UEpk2XJZ0EcVx
 zRzkiPRyKKRIJGDGb0juk7tjgKzkUzKgeEnPAA2FEfGXNIh4ZHWkHyof/VZHrrVUMJaeLrLP19B
 FFwXfXepz2Zk2h3flKTXGiY3b+iNmFkzXAwO6ubawF2SGlZlxf6gZnpETau1bG/8WSS4ITTNU0m
 bvd0277Yvhk6z/eoiHZunGEqd9mJM8bpWeLa2EOUlWV3BDxJMmZjv1SADAH31/qdxige4TIPQAT
 +D/HCLBgTM2k0fCm8kg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX9u20i3CTZARf
 4XT9MlpX6NLyAmoxq7Y9GVXYC68Y16H5DU8IBWLXtVqY0N75ZGLxetv+9UQAFqnnPY+MQu+Y5vp
 VW7x2Ft/KQDyXqzAIBRscxV+lpDpBhs=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab23399 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: dRcVTgk0CMMdH6SQ4PI8DTlpIWB-IgRl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index 2ebb42906c9b..034fd320fb06 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -1324,6 +1324,7 @@ &tcsr {
 
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
+			       <65 1>,  /* EC reset */
 			       <76 4>,  /* SPI19 (TZ Protected) */
 			       <80 2>,  /* I2C20 (Battery SMBus) */
 			       <238 1>; /* UFS Reset */

-- 
2.54.0

