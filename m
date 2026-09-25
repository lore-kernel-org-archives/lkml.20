Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008D2379C5C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790316852; cv=none; b=m+K7Y1dPI4kqD2DuKWJGOKlzLQCfREgNIKPx0QEF+fxPyfK7UIwRiHe/a4of0YpYSwPpjlIt9jyop8EdFObI6lg+yTX1ceE+fBXRAaoMpEGIILuflkUnVgdbz7h7maIoV8SogRmA1eCnn9Fc7nayDljOwSZUA1f31E6hUU2uXFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790316852; c=relaxed/simple;
	bh=N0OOnxapM5BVqS0QhcEoUV0huDI5emgXQOtYs55ziCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aAyLD/9YlvvQn8ACeuzg1NWGKPASRhwl1tf3AZT+5AqkZiHVc+ECjfq46ej9a8tam6P0rD3pk32djZ3Jgs0XXJ7AEF3UUNjQUFiT7ZweTnl2S18pdyWF2q/1VqvGQ0s5bfTLrKp9GsujQ+cWUBjPnDQK3Xbu+4w2Lv8MJHvMDHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itV/Xc2O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APw57q1j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itV/Xc2O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APw57q1j"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5JEQB3627536
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MDH76ytCDa4JSm1/Kre1+UeN1hcmafzcONYDPIdKbpM=; b=itV/Xc2OUeqwGC9f
	m4YdvsOk7656+khmB0PPENw8pBkqzdMIFCe5Hh1geC5apoe5p/m0q2vIw+lWzeDo
	t8xU/Cm8fuJDmtwQFE6LKNNDUBN+LdEShD9ClhWJWZLbUW80T/KGZ0w++ucVRE7R
	2HiB4Z38IHxRG6ERLoNnnH/mgaB//AUwwnSFm7s9tvzfomVUASscEK/M7Cmt+vYN
	g95X+Wy91hVGrLLzA8qZt8N+ln7x3yPXvzDtFMWwOfkdiVlcpOFxyOHCsHDkmDVH
	wyy/XBPSMg0VUp8JRODExgoZQlLz/DlOJ7k5pmTXBdOFKkyilZYMc8/fvFzfvVsW
	wqxc3A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq384qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:14:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-342138eeff2so107933eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790316848; x=1790921648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MDH76ytCDa4JSm1/Kre1+UeN1hcmafzcONYDPIdKbpM=;
        b=APw57q1jrL4jXZSWgNHADpHHv7PnG7NwSuCe6ZmbQcsJLueScFDChnoGxjuVTxfX26
         ngfpS8Cfq9pmBywoL4I2o+qgsmKtzeg+Y1lfit8DrCpikspC3ADVxSZlx0qlYP77D5Gf
         PiZxl29OPf6v+2d7BJFMMH1TmkUlsnceS2I49v5wwLb6uLBc1Fjxs7sffPjjylu5nn++
         YN2z6HlI62F3TrjTld1LOJixLmlvfjaySXuk/hC9mBq6dTfLAcGnsKTLP2AnZTFIX6Ps
         3b/r9NANu8npWJQQ/D8JLqZo3dnTMEqoLWZNou5+dII80YC4e8yJLzPew9nGAKN/1RH4
         YLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790316848; x=1790921648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDH76ytCDa4JSm1/Kre1+UeN1hcmafzcONYDPIdKbpM=;
        b=rzmBPB7WybVC3LcrXxUmdE9bucR+GRLLHP4ldV1l6VUkXkLMCcUNMLZQfw49heOdvX
         1vgwhrbwYgTwM7uz5CTbEeyMvdoD3+pjMj6/0EgjXNPSyMG9b5qU3z+sUAdShcPWrQ+I
         pv1L7SqvLSuixbq7X9RLCPjI0E7iCyVj/yDzLML591VGRlTR3v7OIavTklJOz0UZAzp/
         0CC6PLMj6lM8Yqt46iutOUDE5i3uHlExg266IYUwODfJTUanBJlmUPS4whJcD2SHqO1E
         C94Tim9bdOv/WsBJf9uqYM15ANqJYmTP/qs6C4xLixnyH70V7QsoMbAMCVmEAQcdBxmg
         8ptw==
X-Forwarded-Encrypted: i=1; AKwUvBzS/x1rm9g1GaPzYQ1cjA0zVP+7+E4z2hcfx6dqXqAa8bpz2o/q/j4U33B9JCGphR3btczsl3Vo/tBQmxA=@vger.kernel.org
X-Gm-Message-State: AFuF++nflwBrOGaudTPEDN2ppbxqQXCpIYI/QtCcD5BsDzs/rY5a+D2X
	FoEKCtn52SxCm6nyzHh4ewXNheREttDcxwmwhfuyhytkm67h4QesHV2Vpn2QlB4IlmKci6XEVSV
	2UmssR/mO1f5kIC3+omrg5sFteWSSgCjMEgU4WKbA0WgpjgO6BXnV8RzZiJkwY8G3foI=
X-Gm-Gg: AYBFou3A65uATjhBDYpYuXcOaC6TIa/62EA4xcSQ97dvXBVGEalF36cvnVf9l2WRBKC
	ztjzJIWTJIESr41UKWX8JgUO/hbb6O7ztI5F9YOljJTrjNDxNX7CL5PM4ICQb3ZP9eoI/aGm7+b
	icwqNWjsvvWDTSTyjdZm1DS+f2RKg+bFTMwpLgZDx7jikU+yGuB5+XoH8Xh/6sh4KogYrvq+Hnf
	llUVtzMq0YoGbqRIsM2yMcOd/Hq9Y1EYXXlb+14thevbC/Yh9O+gYePZClCNMuTnmo6X96d4xNP
	b7R6SdBymH1mUQqATMOCPAGDB4+6LSsS4vNRyT09HD/4Zc56mhJ6xSpBKnEWqHni4YiVZYzNs2U
	Lw26+9y6HG7Azo8OIDfZQLwgLcqo6
X-Received: by 2002:a05:7300:a21e:b0:341:cbb8:3c0a with SMTP id 5a478bee46e88-341cbb83dd6mr573149eec.0.1790316848298;
        Thu, 24 Sep 2026 23:14:08 -0700 (PDT)
X-Received: by 2002:a05:7300:a21e:b0:341:cbb8:3c0a with SMTP id 5a478bee46e88-341cbb83dd6mr573123eec.0.1790316847633;
        Thu, 24 Sep 2026 23:14:07 -0700 (PDT)
Received: from hu-ysiddu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c17074sm3381039eec.26.2026.09.24.23.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:14:07 -0700 (PDT)
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:43:35 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: shikra: Add WCN clock to Bluetooth
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-bt-wcn-clk-enable-v1-2-30bee88c4de4@oss.qualcomm.com>
References: <20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com>
In-Reply-To: <20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        quic_mohamull@quicinc.com, quic_hbandi@quicinc.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790316831; l=1435;
 i=yepuri.siddu@oss.qualcomm.com; s=20260603; h=from:subject:message-id;
 bh=N0OOnxapM5BVqS0QhcEoUV0huDI5emgXQOtYs55ziCs=;
 b=qgv2xkw7Prwdx7QeTw1JEJI1qxL9krj+1XW2HC4Jd7ADQ9Y/REcXaFmuvm0/Dc/zeytlEAhHm
 HfYlXhF65tmAeK8hXzY8k/pI8F6gK+BD8rsr6QEb84yY4kB+7gNAUdd
X-Developer-Key: i=yepuri.siddu@oss.qualcomm.com; a=ed25519;
 pk=ldEQwkUmctxwDtIVURg3xvXfzZavX8decqpk/pVLQZg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfX4YCBxcAK+dtp
 BpzGbyAd0NzttOfUI9dYrr1XJ8sPETvpjUynD1evsTc2e7sT2s5hF3f1eL/d/H/ggfJR9oFGTDL
 PbfqzNC4k3nPayhP8017fB+JDXx/lgI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfX78CHmUW00y9X
 A4DHzr23bkr3o4FXS+2roNAFNVug2WT0fr33o4KQLjqGBX2D8kX5RfZYrnD01XIrUJ24wj/xCQp
 K+CFpZObhXgLO6+Tv0dDU25LPsvbANEBjytoAd8eI3OgoyKpy3vpBVRlqNsIA3iNCdlyKzuCNA4
 rl7aLfsf8hx9G1luiYrdBldwst1q3NQMSHI4OZmSVhz0R/SX5bwUtlnHxZv8GSMrY7sxg7nzj7u
 dckbF5w5e8lQirYjpwjVOCKrotHZo9l8df2Y2ZFt4esLLibz+p/5t7G1KB+Mcn7yoX7n46U/pTh
 8VAzmu+ZRIj/MgA6jY3qZsBGuWW97AD4BClQS8cS0KwbkLZ150bMzumwf3ibD8uRkQQ8BKf/Riz
 +2uZwPd4Fs/TIIygj4hsWwFrcyGsTT0ABhoDCUrEvJASfNvsN99x2VIow/ZCTYNGbYus6f5d8FT
 qJ/udeNzLLtiTJUV7JA==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab61131 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GHRrtK_Kqm7Fu9zWAW4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: CcUaKXHD7DPWmE9jI_onCofTytjf8J1b
X-Proofpoint-ORIG-GUID: CcUaKXHD7DPWmE9jI_onCofTytjf8J1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250024

With RPMCC proxy vote removal, the Bluetooth node must explicitly
declare its WCN clock dependency so the hci_qca driver can vote for
it during BT power on/off via the pwrseq path.

CQM SOM uses RPM_SMD_RF_CLK2 while IQS SOM uses RPM_SMD_RF_CLK1,
reflecting the WCN clock assignments on each board variant.

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..4e03e459c7c1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -220,6 +220,8 @@ bluetooth {
 		vddxo-supply = <&vreg_pmu_xo>;
 		vddrf-supply = <&vreg_pmu_rf>;
 		vddch0-supply = <&vreg_pmu_ch0>;
+
+		clocks = <&rpmcc RPM_SMD_RF_CLK2>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 4ff97945274d..227283ab74a8 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -242,6 +242,8 @@ bluetooth {
 		vddxo-supply = <&vreg_pmu_xo>;
 		vddrf-supply = <&vreg_pmu_rf>;
 		vddch0-supply = <&vreg_pmu_ch0>;
+
+		clocks = <&rpmcc RPM_SMD_RF_CLK1>;
 	};
 };
 

-- 
2.34.1

