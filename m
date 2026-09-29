Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94E4524AE5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687449; cv=none; b=mMnmNbURaBTszug6zNUfM6ZBdzaOCXNVJ63Z2Gol+R9fP8xvho9NeRH7PPmIzkq40AXkQk0R9yT6/Dzzvl9koxem4HLeLp/iTdu5dqgP8JVEtQjJHncD18G4gBs+UQx04h+U2Rse8juY2ExvBBAXFOSw0wB9mBQrzcyoIjexzvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687449; c=relaxed/simple;
	bh=rlQM2xDP6AVNaE3KnI4qJlUs4e7i+us9u/51Sh7/Pls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tilq+UtYLsTGBpmh90mCzjXlSdJCxofyIhqlFcpeK5AqDZV4gEEu1fhk/JlVB4inm2osPiGtEPill7iZfl14Vo/zcwzYZgVT2n4WYaa9P2Ev7K6G6rmfujRNu/QfvIiZ/FezCKBIfkXa2xzHTBneDkLLH3fEDgSpIL8urykC3qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ej7eO5rt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRHXPxvx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ej7eO5rt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRHXPxvx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqfWZ3842777
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1b8t4hv7WpwL5+Ofk4EWyJpeOc+vV9QjAf3AhgmHPKI=; b=Ej7eO5rthK1xRofA
	5Je50gHyY7bpNpcacJ2DM4MSH0rel84o8N9vFcPXYIGe+WqC8hwQ4R4VOqpP4LAl
	3Xi+yyyEVJq3Iyu4Az4RN13+O/WEA8YWqXZFCw6G5kER7UqSy77prgfYJzZ3/j4A
	qeUFGvUsRl1b5XkkmOIYoHwF+HmZ5TloBkDG/6SQ+PxjyD1hjpDOs8NUT5znw8mb
	8euDFQ+6fBe3Gz97iOJJji90joN59ClINGIydwY7Uy+cvWWMzyA+NidxTRz38B/j
	SIAVft143cWzHOBERwwQWtOBKrnUQ9PzW6seS44xd35r7PifbMb4kPaKOfv9UBea
	O+4knw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0v8tuu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:10:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5333e3f5811so19519461cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687446; x=1791292246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1b8t4hv7WpwL5+Ofk4EWyJpeOc+vV9QjAf3AhgmHPKI=;
        b=fRHXPxvx9QWDbjLMVH+Xl9x+Xo9KU6sHg5QNHrts2tGxfm1HUOTSZdJdVY1Ct9geu0
         GItPg583edfb9xDwXq0wBJ5lpa+UVzvseK3WPGTwlR4vcbKw+QDkcTrK0MWGozXar4lS
         sXGVXeX8/wF6F1OnERLleMGk8RXav7a+CHSh5QSPdmiq8yI3Iua9Lsife1vhOCrEHjKE
         Mzl24fw48RMYlLHuXLj0XNlJcWlMsxIUho7C48Q7URczGgh9tVZpbU6qjETyWtMsqx9I
         4ABIc5u6C14sotgvrRfLKqV7696EQXBOq5pKu3Zu07SQF6YFQzhy9TS5M+sULJVhXv3O
         KfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687446; x=1791292246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1b8t4hv7WpwL5+Ofk4EWyJpeOc+vV9QjAf3AhgmHPKI=;
        b=ZjMGPgs1yLHgKxloD5MG5sFP7CmcpsW1vugnQE56X1mnm8dPlb8IDIDzmu7h+bZ5Ld
         okhTLu+D7JMJO21863VJuzqeTxusSkuXs43xEl1ptjce/EkaihNTAv6PgBTLSWaKJinA
         pGdQZux5963rg1cHzzXNBe3ubXJA3tCXBz4jsiYh+eYERE67X5pHrHsNAS6yK+Q1Cla1
         jjCvpCs6oQolPhSpsdV1PDHLm4Tv2b8PGCU2cJGCuO7fzpHryBPW+jXxW+HM2D0FBpH6
         VYsg6U9WgnAqKyPbNRQIhiyMmNYJpgxDy+fgIjgPcNDbc/KZ+XDj9xMbOQqyOjCtAlgt
         6lBA==
X-Forwarded-Encrypted: i=1; AKwUvBz9tKlBhXSjSNvkOZ/tmXz7hpQBlDw6VgrYSRfd049VHE1/Wm+uAu0O25pSxiukp4j6EAzZ3UFUryxHTJc=@vger.kernel.org
X-Gm-Message-State: AFuF++kmetr+wOhTeMj1dxD6mooLiI22yuxp+MzndDyq1KeiVRAnC7+k
	18h1KrurgPSQAjmTmvyvcBsvlvlg91gXFUyF5/igzA+1nx4BNiYXHk5M62RMq0iW4w8t8OGdfmk
	Rhnd551z6UwshpgHUKw5dlqre2orYMTtihB3Wx1aiTOhvILykno+ftK5VL2EDGe0mFJU=
X-Gm-Gg: AYBFou29zPCxBNZYpcN/okbgx41W4rjTUA5l+rvBWlFdhSb3/GONg4pcVPDRuBnaia8
	c0QaVALJmChrA3hHCINc0GMw1Dt/OD2AErIYS4hsX4FzBGXalfrW/bMFkgHDPmBYt/GkF0KQH0y
	lNws69+p4zDb7Q2Itj9+ej/7aaJ/aP9GeZxQryi6Xy/McNasRxx9rk7967checNvNnR8cTITvy+
	PwQDp9bkq2ZLWALUt9nHyKSOBVN8B8gf/k4SGczxcqhq3UTa4UAJqcG0ufC+XKWDWEml7eDW8OW
	Zp8PMbi+E2z3rBM06gJCyjuGP23jp7awEdlF51Qe4de+T3r0kfDWayqNMfChV1AS/7hYCjxc+ZU
	tzNLyEx81y+R6jhl5fsDQG9G13rKuD89ouj8=
X-Received: by 2002:a05:6214:250e:b0:912:16da:b387 with SMTP id 6a1803df08f44-917864940cfmr44609066d6.18.1790687445718;
        Tue, 29 Sep 2026 06:10:45 -0700 (PDT)
X-Received: by 2002:a05:6214:250e:b0:912:16da:b387 with SMTP id 6a1803df08f44-917864940cfmr44608336d6.18.1790687445128;
        Tue, 29 Sep 2026 06:10:45 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:44 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:40 +0530
Subject: [PATCH v3 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1136;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=rlQM2xDP6AVNaE3KnI4qJlUs4e7i+us9u/51Sh7/Pls=;
 b=Ij/auBEVeIbBbuG7Iw2UVKBhfAem37HjgrfVKieJ6/q+RgiiLD7FfUKtfdiI/wqiodchKqSNh
 JVj8QaKLRHZCW7XZzz1C4BCkqCyWhCwhZxiXw+uyGZZKYdY++bZduOA
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: T4gov2ZtQ-BOkmLsPYK5DI5KyvNtgEzF
X-Proofpoint-GUID: T4gov2ZtQ-BOkmLsPYK5DI5KyvNtgEzF
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abbb8d6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eLLqEcyxF3qFMBJkHZQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX4zLBaP/myAV+
 P3WtaIS9nQDo7AeOaNsSpIuldAoQBuokHkeWOe3mB7lajnUvri6QfK022fAhZH2Toqjcu7CGSBT
 3mp1qWA/3gD7RRglRwDIneNtV695MTknuTc2ymS3dwYiRT8eiqMMePxDczHDIjT2xO0zQ+7wTcq
 fOTajpHPrzBA1FkMyeLpu64Kdhh7mpbdLq6QZdFtWB84InS0ifRbkDJcObtd6FvQHfPeQ3sqUjo
 T2Ff7GRVJv1vaBEQIhlp1J/+Tmp7nnWZN4W26VOCQeFIG1XUqzP2LwXYeUl93GG7GzoXfKWquJw
 6DB2nidBCYgTbt+9IeZMVcDIuXlDfswyMR0HvuzGOoWechnulvfL6c4JrJkjYdJmefns0/wGpON
 /n4UP79wwWNwCSji58M36oO9wjMtYeIdsYISatoOGe2IYOyeXeWPe//LAzcVovTeWsoMB/wiaZT
 Q0st8c++zwVIqqUMWkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX10JFy3QXWiPT
 tMAkkUwf21IcbMHKKCc6iXu3qkXmwEgayU0zEs/XM21SIPx3goAgyb2XVZuzdMJYKfZVmZ9+XQt
 9bx/LgqpGr5mxgQtws+DtFmTh7XpiuU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pm8550
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 896bcacb6490..c4a575af7bb6 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -45,6 +45,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

