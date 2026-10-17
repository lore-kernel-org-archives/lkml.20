Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E2A3DD521
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792213123; cv=none; b=fgQkiu6bfKeCmvPYG75CBPix+Ia4yQczwA9G6qHoFi5X7v7KCT3sryQZM+GKZ3fnr0jDeEy0AbCIJvVLW00TU/7Ur9pqJZaWHXSELrELUkYFWCuLcqgLINsVCRI1dWCOWddfZjxHyAUzAT8wvuscH56J3HM22lzU6O4bXmBVUo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792213123; c=relaxed/simple;
	bh=gUbGpMehdXTAOT2mYSW1dLh9J4F58m2XPrcBI0Gk4AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TyFw4831/nGynM7y+83QOs2Dvqtdx9iGfJ/vcv8FE8SOWeL6z57pg5afJxNZrA0y1abTvQkDtIErWpbW//hcVx2P/dVMOeXxk6RGgL7CHkjUp3ogiPwjVrpEb2Y4ImY/aCxnUJOGsFN92n/aEkKFTrg4sBbJ0BTf9SFfCn+gSbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzHRHq+q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ToMtdU0C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzHRHq+q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ToMtdU0C"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30s9E440920
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TGJ+GhNnkEO
	Ld2KsiipWAv56syre7ugC3IzB9jrXOZY=; b=OzHRHq+qbBfS3s+Jv/xpFwPPr0X
	G1VwwW6tqkf+6KjhPcaKItgFrJiEq6lCsvKw/QaklHeYRS8sZE8zH/spD3K5DL9b
	E5KpVSffr/I6CXHchGJ86hvF/9BWmraON6KPN8OLumnEoJZPoPV0ocskzIX2eJCY
	vVMHW2xcuR8B2SfswMi0xdNv9CTLsQNvE8xWblQ0+srJ8WWutut69zhyUOv7CSq5
	KEMDhmILHBRkv40vc4zsewWL+RnKf8TRMShK+7bM6CplJe11WtuTsM6EmiIva+DM
	lvulMLYlh/FdZGt2AGF/NvwVqBIEtLc+kk3LhKP75wTnuzjBnxs7ZibObgg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxg6mv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:58:41 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-147be78cd56so2144389c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792213120; x=1792817920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGJ+GhNnkEOLd2KsiipWAv56syre7ugC3IzB9jrXOZY=;
        b=ToMtdU0CfSk25hCBtzjU28U6HRrDGdr2SbZWGB5eepQ2liNF25II9nRTi6+QrEiDA4
         ZCP3jZygtGOl2zFCOMTz0Q61dga62z12CtImYc+CCJ03S0jFKOxGbcwMC0mNvhdUDUA9
         zwd8mgYw3j9lv12SGYQtuXOHBUC53gmlZe9wcnMdloAwheyigY9Vs3YnSnzv7/SJFhFq
         T2FffIKlxsizNrh+LUEUp52lFOxrwZpzBTkhWrBhctJCz/MdsqIIQKuqFTW6+jHOKqJB
         xTjRJE9ZjLQ0dbAHqdDX94ni75J6xoDK7NM4xwm2oINoN5rVHfg2DVrIJE8pPZ3dFsdo
         J+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213120; x=1792817920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGJ+GhNnkEOLd2KsiipWAv56syre7ugC3IzB9jrXOZY=;
        b=T9Oxgc+Vr9+kUlXLy1JVALD/CVoX49FWo3LtazIGQy9ztq/kFsFIdGWCXomudP74+B
         qIb6DeieSE2RPy5RM8PU/p9VNZlNUTzmwB1grOxzSc+d8D2OhftzkMvjIJzxPE3FjhJX
         NG2EgDeNqTeo/NsSG6cC+eNAQ0mDx9fIcbMuSOV4+keDcVC0iRUWDlB4VjAWnkWmRAnp
         7Zh4LRajgsofZ6C2hLfgBUEZkoy9wZaK/USJKcnLmsTtlQtTI5P8tjiL8Jnp8uYs4MTC
         O1wnmiSB+qlM4XsTX1zYS5xvfNczsecU5U9R9evyh7nGTSFZNVgCO0EradVl4JzAAx5/
         ciiA==
X-Forwarded-Encrypted: i=1; AKwUvBzxtYsqSELankcBApAu2tf6AnkG0riWflcGJ/qBnoXusKvXvRpQZkhm5qmwpDW6dAT7P2J5Si4Lbm261hw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKD4d8v2Jf5GY7jztq+TqIj7YJDPDNHfZ2NyERg3fnT8GaZSjbV
	7J3kmQuufmbSklh/Mk3GSyMv5ZtHMMWo2EXWbiYW+6QRp16o+SNM83b14pyKkRpZl+nLZ+zj1Tb
	I6mwOXVgPNWfnH+YM3RQicpYnvhYc2M4uDn+yK7Wh/OvXkuLg7e3gimJI/1bAXuQWDMU=
X-Gm-Gg: AYBFou3q8Op8jRFeCb1BBe+AnpiNUbYqiSw485eS55TeHqLHYh1bPSYmfT+LabLpTTX
	opQXflmYLYeRNbHV3buEJ6e1vlzVtY5Vm5SC00ocozfKLqUTOjiOBeNH1UFyl7dOY948G7Bp2vL
	1MOop/tQyyqo64GN3dyhuQjzBPskN/xUUpV/Z5tSBhR7aChDAx6nXyWGliP9/19ZIlcapHIvB3B
	m9FUe2zknt0/NwUgcosChZml4tPNMSuRS7nZCZKhSP0udfzxlqY+jSIQFPwpyFwrn8+s6QUlzpL
	oD/ZYjyrPUe3U20XX/flTCBNm09X79tbeY+2Fx6Z05nlcDkb8N1YIcxdHsCg+9wus3SoIf8RYHp
	LoNqVWF0cUnbapbYlkjgWZvMTMtOm6cFYve63oCBmCa6pomsdyekGgXzz/do=
X-Received: by 2002:a05:7022:ea50:b0:184:ad2a:d1fd with SMTP id a92af1059eb24-1851434f3a6mr2450127c88.37.1792213120142;
        Fri, 16 Oct 2026 21:58:40 -0700 (PDT)
X-Received: by 2002:a05:7022:ea50:b0:184:ad2a:d1fd with SMTP id a92af1059eb24-1851434f3a6mr2450095c88.37.1792213119588;
        Fri, 16 Oct 2026 21:58:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm15203817c88.11.2026.10.16.21.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:58:39 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 2/4] arm64: dts: qcom: glymur: Add videocc sleep clock
Date: Sat, 17 Oct 2026 12:58:15 +0800
Message-ID: <20261017045817.1506961-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
References: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfXw6aOg7ZCaSMU
 Ps7bAl1DWPXwP5PeGTk5OFdYOCwWDmz/PlHxxi7p+bMBT/wF6vRDhVcmoGHQhRHTHYtcIyZ4FgX
 8p+Nsauc+bCTDXQsS6O81evTVDpyE7U=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad30081 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=kYVbGFCUSVokFan4DuAA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX2GqJlKfVrSi3
 hV+4+uFVREeRjkBo7iRtiUy7ejcsEWbyJYLkPBkc5KFo7frXYSLEKbQOPn4BMlgb9fiaIaqOI19
 7uKxc70OlXy2j+BhsLIJNtgZPuKpsE3VetelB8nJOIdle7hGuZZs+Vkm3kVUJknMq9Zf8vZcl8T
 in4D2MK/iZMdz+CPqieR+X/2H93rNFYFTD1KQusdv1FyCGPuaJbn0mzr1aqr8wCVeFLUCQ4suwz
 K9oIu/QvCzjfruAyKrr7DMXNhahRtxUExxS77bjK1hCLGPUyG3uesgswsMmMWsDmcnN3gKqgTT6
 Swd1Ql6KuNOxkZTyteaK7DCf6v9UP+wqu8319sYCDe0XOFqNzrinJPrhDOgquF3d5snLPWPLMWH
 i8o7v11OuGMajsG/XPDZMju7X7IPHpkqy7BnfhwlMKTFaQH/WXcoBFiwIkgx9UHeztHF5061uCD
 9IjR0Yr1G43w4Y4LRXA==
X-Proofpoint-ORIG-GUID: IVImPyvyvevrQufsxo0_CIMoGENnkxj-
X-Proofpoint-GUID: IVImPyvyvevrQufsxo0_CIMoGENnkxj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170019

The video clock controller binding describes three clock inputs for
Glymur: the board XO, the active-only board XO and the 32 kHz sleep
clock. The videocc node passes only the first two.

Pass the board sleep clock as the third input. No functional change,
the video sleep clock keeps the rate left by the bootloader and has no
rate consumer.

Assisted-by: LLM
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..b389f953f97f 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5810,7 +5810,8 @@ videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK_A>;
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
 
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
-- 
2.43.0

