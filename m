Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B383F328C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139508; cv=none; b=lHm2NA3ijOVhijLb2Qb0EUqMej8ZjmeGIKN5RDxhmE5rg9ot9pJE6jZP1LK/mTcarcoqO0WJ3F+Jt+rbUheLA/fc5JlqhjOszqWLvk1IEP5/T4fZdDSI/VEmVsknrenYzzL8Wu4dtSvN2ahvL114bhKm5p1oqfiQe9fj/PQ9itE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139508; c=relaxed/simple;
	bh=oFU/9yPXbZMIVmz7A2FIB8gBUn8jREr8ifXNqaMGDK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+/YKoWRur5acknkJVb1vxXMZKr/wIkwJazo8HMDpCbepx9UA7HuAsZsen6Hr2H/vuNeONuB07hyeUd+kDbMUmBmzPtVqkA51rvr3bf+46qZ2Yl/T5VFy0jfQ+U1l2Tk1LRJkVgxgHF5khn61mumst3ox5cnb8+ES7tWWjA/tjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1M5y0fh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXz436y4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1M5y0fh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXz436y4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3ight1425371
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tYbeAaBWwMNQyA41pglGGE2kILDe8d01HKFX1vOZUNk=; b=C1M5y0fh0hFUgnu9
	qhDQ/pYNNM1LifxWbumiwvgC1iagBuzhYm2rdrKKGMkS4H+L0gkKc2aQRwcVm26k
	xohm+W6P/7VZ/FnmrNkTAfxl5831JPdTdiGJvTNLnhIW4F9oiNftPBKsgeA1EK3z
	cMSMrePk6ZOHmsOlFYBqt9tfKzl4PUPN7LR+2/Flfzaf+fD8xGw5o7RntYvQVvKQ
	AlYhDREz41uMaBgQOVMejJF4qWfKyYKnd2uBFKJkb0xhLXWYYE6HgfAxRhfFLh1z
	UjoMsH+baac7fiMjvBdj+XXJG0KC7OLM6WA+3/XajLclLgsRk9n4NAUYj7bj8vcj
	6RN7uw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c27ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:58:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-333543ac378so564300eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790139491; x=1790744291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tYbeAaBWwMNQyA41pglGGE2kILDe8d01HKFX1vOZUNk=;
        b=hXz436y42tN/2R9aHh5PwaTj0DXJ3H/YCsJ8q7ktUXODbp4AG4f0PdZcYc+l26v/Ec
         mAdER9bCxmxXpCaesa2CVCRlzvzAOYCSx3HYFvU4XreIrfwATdeGO/2MPLq3VMxsE8+n
         loWLz8eC7Wdd3IiZ3+kQE4wzMH4PWuex5f5W0ZYK4erhohqG3Mff57rJOmIylTAcrcMY
         1jj1KvfCAKC5kgiRuWgABm5GlXvR03igEh1n7DSztuvRQEu8a/kGxsX1Jc7J+fWIGXyF
         Ue8TZXYewDPP8CYTAndEwQiHW2hE2fANfn1xyV78fcuCV1DEXgMXAPowp8xhxSGxksDf
         +bhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139491; x=1790744291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tYbeAaBWwMNQyA41pglGGE2kILDe8d01HKFX1vOZUNk=;
        b=eGzII9uUUWZr8djm50GnjrbYzvuFg0plwYYhmANXako5nTPRRm+eX2dixaD3lSyg5y
         QdPtXyN4wW9w//vZy8WAbVygBzqtQ6TwPZ3POtQuUXXcxhwSvJfwEMa02pjfagH12zWk
         T4v1gWrWF8xqcxdaV+ZGBIxbjvvmQb0quuUCMZImELkLKeNm4Fu2+bGfWiHz575jnd6j
         T3LO7P5k4/qEBO8YfxF5jGmMokcih41L3cM5jutdN2TBJhsTq1QEgr8allIPNs8fBJ/f
         B9QR7A9MVQVVe+21Bq63jH27Y5IZS/+/tlVz7YofTBeofaoMePxi5txOmtH9oilzT9fO
         HBRw==
X-Forwarded-Encrypted: i=1; AKwUvBxMnhuCppMV77hYrcrVCFX3Lw8xlGmyDP7+Jd/9qbjFyRFRr+pyzCRpmdrVguhMA95mRhbNKjTFWx5bXL4=@vger.kernel.org
X-Gm-Message-State: AFuF++lLxZ1HTDW79zQcAU7KYmoYVMtIzBJhXIjtcomtkjwZ40Chrp/G
	kGXsNMU+CyldGRz6LAfXwHSTOWfZoy1PqMTKTQOUyFC8Vj+kXy62efURbND29Wt4KvA0eY7qo74
	dmeS4H7fRizy/R1YwiCXJvvToq1Ct6q2sZBKftHol9c2LnzpGrRn5v/6vm4VRv/LfSik=
X-Gm-Gg: AYBFou3MTf2l1SEPqt4iejNZQwLP1QnGpXCfkDEBIcQghgd8G04aEKf8OvFfHOZzdDd
	YuIihjGr2hTRMqAki0dYtzlKtpWRyMrsK7PfXPrgn6YLt3yHY4bruoZle36C8byN80PAJFcppJX
	Gw88/pcs5MF9JxMRFw3hnE9oB9Ho5eK4p4KTBgR3v5mOonfuLKqIreCQkJdaCgZS4qFbMqGm6dl
	n6k2YM1XYotWSbFAIzST7g0wl21QrgMG3kNVG0nWqglc/819vT1YeGJAA88YqF35i7UUinPsXTr
	LV528RH7EU+M6smuPBS1hHEGjXmMFfAXtFopwVqTwmsb0PzweSj+VuDiJMC1WX9T9jDHN8tm7bf
	j39B30vGWNIn2qxTfBVQSLRqaRsqxLQ==
X-Received: by 2002:a05:7301:4393:b0:33c:1b80:8ae2 with SMTP id 5a478bee46e88-33e8ea84a8amr1335467eec.39.1790139490871;
        Tue, 22 Sep 2026 21:58:10 -0700 (PDT)
X-Received: by 2002:a05:7301:4393:b0:33c:1b80:8ae2 with SMTP id 5a478bee46e88-33e8ea84a8amr1335426eec.39.1790139487882;
        Tue, 22 Sep 2026 21:58:07 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3168907eec.26.2026.09.22.21.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:58:07 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:27:30 +0530
Subject: [PATCH v9 3/5] arm64: dts: qcom: shikra: Add mclks pin
 configuration for Shikra
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-shikra-camss-review-v9-3-09f5fbea1309@oss.qualcomm.com>
References: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
In-Reply-To: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790139451; l=1600;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=oFU/9yPXbZMIVmz7A2FIB8gBUn8jREr8ifXNqaMGDK4=;
 b=cYQTvjOakOXRnxQNaRT5qnq52PSjoCveEleIHVwfp+U8xTSS09RmcpVRgqjUiILafLCZa6+6v
 pWU/uQDTAVwCJjt87ewggNrsjGJyQuO1rWfhdTti11jI5FgLPplQdfH
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: uVziSwUMluAVO27tKpDTNlkJdT6wH-GK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX+nYyC5nq8s5M
 OmUeLk2JUmaXdPN6rZph/AGv/GFapFx1bwgJXXxzRpza1uZSBcHOWNE79NMNNBI4RTZt6sbdseX
 0U6W/D+DKSdERwbUgMK7SXS4R1DGN7E=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab35c64 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uVziSwUMluAVO27tKpDTNlkJdT6wH-GK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX2SOj0gcCjkUk
 MX3NIyvYXAoqKcq7Ol1dksJ5i9+3eD9EJwi29089xuTnfwyKV1HqeOpmqtkEg3YbMnO/0G857q3
 dL3H27RhJ+DMfPa4IobDfusT8NbdfLFF/oz2SyhLuEke+CpBeSxCdhu0wO70lgX7X/Y4Xoeeahz
 U9Y9kxwLOw6yq1AwroxZwNT3+ljAuDGFD2h+hn473eHGc2dZ93e4oLEXqPpl/dEWxgCkBNTcig0
 BK1AQ9NFnKcShAVxGvmCXBAUk0Kkx+6RbVw9Y+ZRwaTSqb6INH3ASQICe6TJHESh1z3alzkp0gv
 /u1ejLXBFXSda8ssiU2yNkLsLYye2bAzgcmwzDX7pNq1PdokFmOdryPqEoQQJfiLlSifZX6y5Bc
 5E7y9PTlf8uPgcH+weHQCeoIe4zlJ//NGzITzAlb5xTlqRD0saOMDE8HaocyfYslqXtOevVahdT
 7fyQ2VoYY1dix0I3RbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index ed73603c3dd81d92d84c91b57e33154a6fe5b470..580114806ccd0209cc5c4e4b05b9f321e6f77cfa 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -924,6 +924,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.34.1

