Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2EA448393
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704309; cv=none; b=ZApnKlbUaju9V7lmdiLISyEeqR4cdfQktcnFm5V5ylmtAmqak4YT4nrqgrMVod8lPw+/o6lloS0Av+ZVsKU7vwnKJkF/vb+Ox+aBojU+BZhRbQL81kQlM/i1QIiUf2IDNHtBBa3tw5JsalU/5wMBGoraLloeVsUQDAuAburR6ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704309; c=relaxed/simple;
	bh=5TarJGRML2ryvcb/ClCF+1MotlwLtOVZ//s8pIACGiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=moraGxIbvErRbCemCeDIJv3SXkeS/ce4IznG0y8qh9wSyQfoO5fnCOBURXeyZrdsEaXFeDeBHKOCVaGbi43X+d8HPpeSCg2B+OenpFC6O5zeZSyBpyr7AzwK75tP1GbTBylla7u4+iV7W9F+qSqFX3ilsLqUmm7ld0VzcBufGWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cGu0Gjl6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gYWf7dUy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cGu0Gjl6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gYWf7dUy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6869qjWW729236
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 14:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=; b=cGu0Gjl6xQFFS2wI
	fS8N8/YvEBzdmzT6q/i50Vwj156tHt0FIJjLuuuyX+scufBbjaVV79dZ36+RhoQ8
	Ij3CKs7jORp31GyBen4JL1dkCj0NhuzYF0buYVMMr7WdPTzx9awfA3McWA4hs0U5
	IO6mjGKMKOVL156q150o24YxzYNKQUmAs23paqATm9XA869qTngY12xj61ACkx8p
	TE7KExtno4JcAT0acL+X+ELYA4Auifv3c/Z8kg5UaMSePJfiesahPhG0HsqQInad
	Ih1pIudCf1Dr57bJLSJt4mPGNh+5niKxWnYwrUo5O5nghZzptE5E++m4QWn21e7a
	D104RA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg8eq42hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 14:18:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398e1fafe17so4197485a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704305; x=1789309105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=;
        b=gYWf7dUywyFE76/TVv0E3aBDPDayJHW39dLi+i1dIS8VdoerSS04P491ouubtreSmy
         3kXbis31nuhx3mAhsgh9dLfvsWt5qPe90sM6qcf1VutwPze+9ikUPf9pgn5qsg4h4j/7
         D9+um4okThMNq2yXG/dWlWZlAxkaLehgR8g7/zw1V9Dg4aLvEy0HkfZZymCgv65y98wI
         nEWmv3/E1D+MenWHkjziSackE+wQ4a875T+32qnmJHuPAWpahJQtSqQ/do/72jWdpezH
         q6tOh3cgsVPsJOB9LpECXhGOFdIK732dtJAC0uqQ3z7edSvNY1IYLFGNzQhBcRGbjU8j
         gNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704305; x=1789309105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=;
        b=P1QeOIbOD13aBhOXkLtkdu/y+Jt49HSXtCfcQwDylyZXIvmbHlceRzf6Rj3jHEs23T
         I3yYT+lXT0jhwHvvACAWlkX0r2Ax/K3iT/rMymX8/6fbmK47onT8Bu1yNitQVIZS7PBJ
         ZTre0SXmAJTFCou47q9U7d9fPnejyZ7QXJSQiH65noxaqIuTF1j/Hf5SKVYsBNeION8L
         588P3ZtnHSjHAIsetTgEgJRhCPjOLmLTpChfdgbZjH6v5neHQcWjEg24v/tPbvcuXrFO
         v1foxtTxhg7+u+v4ZKB/Jzn/RMXWwlHS3tJAxmekbtsyO0ztVJews5JfBJioUwXyb/h8
         11iA==
X-Forwarded-Encrypted: i=1; AKwUvBwsmyUox9zrzP4SvgqYZjL337kem+sjdNHbl+J+CqOFIUaPDPMg1eEGkpW34sjOe3wAA6FVRpXJ/N7Ya1c=@vger.kernel.org
X-Gm-Message-State: AFuF++l2A9vr0TGO4BI04Q3/B6dMZ5KKs+Y8M6XktRYQS9lMJzo5wJBy
	VhU6zoPus/AUt4C/1kJVx6RoQFy+23kBukisBjiWoPmcWiegVn7D8Cdbhi/iuQeXaUOsQJTg0yp
	OGr+58B5M6x7n/kc2Y9s+JKxFxD85E5xArghUHZVAa+tGMIx1b9gBR1EEbL2M5bnMYS4=
X-Gm-Gg: AYBFou2I/6KrZasm84/IwHgd63XNvdxdM9TMMY8e+sjYjwEm41nByiSsP3/eswA31Jd
	EfONZXaIgpLnzOYw5uhnLk1n7+PwimywjvRaC5EzMUL9otEVtME1u5TkmAj44J8Pr+n9pcMa7wj
	aVvsnvA2C8Turqko5+vdccK/7thhFADV6Lissyddp8Q6ZSSlThI/Pbbz8vYTqitKBR09LZ9jRYT
	OwxR0WPu+Lz8q3QFbHYE2Y8qMyVDaalMvpRxihNX+dICIpPN5iUlURm5/OlqjbFGUmIhrR9mpIC
	MSfd0a2jUb5rWhCaAbeG2KEufAoNZ0cLbmmMZ6X7SDSRZdc99OrCwk7JILpjy+XS2Kb49JGCXSD
	gT1WAMGS4tdaRYB+Dcz46pF6c/jtFp/jGIAAPh8K+1E0=
X-Received: by 2002:a17:90b:1641:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39b260dd3fdmr25225207a91.5.1788704305170;
        Sun, 06 Sep 2026 07:18:25 -0700 (PDT)
X-Received: by 2002:a17:90b:1641:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39b260dd3fdmr25225145a91.5.1788704304726;
        Sun, 06 Sep 2026 07:18:24 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:24 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:18 -0700
Subject: [PATCH v4 12/12] arm64: dts: qcom: Update IPQ5210 xo_board to use
 fixed factor clock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-12-aec5ed642f4f@oss.qualcomm.com>
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
In-Reply-To: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=1379;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=5TarJGRML2ryvcb/ClCF+1MotlwLtOVZ//s8pIACGiY=;
 b=ClyvdlYrjCm0Dts+/2Kw0WqePRi11bO7CD0TlEZFM0byj3cUx7AwrxTkX1CaOh14K/W9n1PWd
 uTxdaDTEzP8Bdn1StQ6EEXXXt7bcYxGjHzqzYWX+s3DH3KtvcLKLDYp
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=F61nsKhN c=1 sm=1 tr=0 ts=6a9d7632 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oqiXH2A-fwTjus5yMdMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX+5mRXgWjbUbE
 N3p4QaFh6E/zCOpihFPs3hQ0ljQQSTcvvKffrgXINwIRosniK/JquS9m4m2fGvkimjOPgHwWR7r
 ccVXhAUOwR4dJAiQa69wY+sELbHja3w=
X-Proofpoint-ORIG-GUID: LKESBv2BX2zVv6JpGvXnGdApadlKBbwN
X-Proofpoint-GUID: LKESBv2BX2zVv6JpGvXnGdApadlKBbwN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX8KqEp/LGJOmH
 eep5z5G1c8PGxP+wWAhuotauVAcNhBiBdWKBANeatuQOM95G9DwX9bZzFrvazHMG6GwZQhASLdW
 zqR95prmanFWiqyx+5qQSF1FJoVjhiEj5Q9KqgN7uOuFB7mqsOZMP2Jt0dQ5nKGs0wZe4Ij3UW2
 +aWaHdDYgidoe128hzu+NltbcBP4OW+ficvXhwHCoBNK4hAcErjmmSNpllIeVWn/o+oBMK8z23R
 mNROMm9E/VdSUyf1E83Pmd2XRDhpo3Lu2540sAN8oWJqu8WGDOc1krtWbJGaGaKcQmx94JaUrIa
 YD4KehFKB2mAktmgZk3RCVe1UA6VEPpP1SgesVHW8ivyEU3sW8MYiWQo53glbApkB/Nfk8ZjyAk
 MsJg/IsLUJelHPrrWq7HZpfSAydjWSIVa/HRKFcERfg2lNDNF+9We9RLrSsYGrcrSXjPfml4CJd
 zKaKmBdtT3WzWWJx4fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060159

xo_board is fixed to 24 MHz, which is routed from WiFi output clock
48 MHz (also being the reference clock of CMN PLL) divided 2 by analog
block routing channel.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 7 ++++++-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 61a53361138b..519307c6b61e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -85,8 +85,13 @@ &uart1 {
 	status = "okay";
 };
 
+/*
+ * The frequency of xo_board is fixed to 24 MHz, which is routed
+ * from WiFi output clock 48 MHz divided by 2.
+ */
 &xo_board {
-	clock-frequency = <24000000>;
+	clock-div = <2>;
+	clock-mult = <1>;
 };
 
 &xo_clk {
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 52d851a0dc2b..0c1ede0f73b2 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -26,7 +26,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.43.0

