Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793452270;
	b=ol88e3wE9iE1nOJuw/DwXon6lsaI/obm1vqMGr2uIYkB89Amm5lPrMToljWF3HjwiJDc
	 4PmZJm2yssEyitUJ/ZZdoqnVRHDaGcg555iJrkg0Ma+QEEtD79n14emN2SnvxJdQUECe3
	 5avnNR+96R9LNlDvpIGDNJq/8xNOmE3GEcTOQQDUPHSoGAgxe1sI/GDab53xGL3VEMxeI
	 /B4Zx6rCAo6h9tl/Qw06zC0MnvY0Lx96asrIWoe3DNfprCCTWCgmv8EzhqmBx+vZa4iHa
	 Ky3lgyc1YpKtdtCFdKueLv+wHuOb1+y7LPSpjTGYNVg38G/webWtCBUwHJueIJLJt6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793452270;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=asHu4GXPz5fLHrrz6Ei9GBrY+ABzF2Ylj4/w0B7RXwM=;
	b=oytqK5M2tQWdgla1FWOWPLTVITmimQozZbIJnthnYQ3cYKrnKB/mJ3c1CjlymR2rD1Wr
	 oR/vdoCZ6NeIiMrw+rqJbiXiMzso4A8NsEa/3y9dFvxHiWwVVYD3MCcetnjJn97J6Cue6
	 1T80Vip2T/aWd6oVs7/y7q+KcPwsy+m3GKuHUAJ82w4G7f5JjZz/kkhAZnsxcPei0ooDU
	 kLjuwWMC8qustWMLrvPkTbuJc44HQgAbfw3PB2NkO05eUNky416qQhNnl6kXrOILCISyF
	 X1QM4zGeR2d+YB1yYUd70DhIaS2qqLErydxencRKJY4ylDDMNBCDAdrl8iZT77Fjlhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gSDhn9MR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ildK4kzN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D28E606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D28E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gSDhn9MR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ildK4kzN
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0V111233833
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=asHu4GXPz5f
	LHrrz6Ei9GBrY+ABzF2Ylj4/w0B7RXwM=; b=gSDhn9MRNdl7gDueUVNxdBJVyMK
	XYc6eAcW8yRB8ktQuRk3aD5bERYL8gq6RZGpZ0moTynjJHKW43xrZ9SmRIelRLwf
	AiZt715TwmEF8EROBRU5EuQ4kZ/zLt7JLdrLZLm/CNmTWrb34ysJURLfFFbJAuK+
	fzyIo7jS3JFGR3HcS+Kx0p9F7R6RnMhmBQ1pXsfqwOVJxkrJaRc9/9yogonJy/pZ
	FagRrcMpc8Ic//CBEj7vtzy+j3MaXCdRSpSvqhrlmVhge2brIkdPajcsD4/I3LUd
	HgJqmUUQiAt8HJYI+l8JAa5FvGfLAheA1OUg6KE69saZs2vDmWa0CPvpLHQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m98y3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:11:07 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1663fb7e005so1862992c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793452267; x=1794057067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asHu4GXPz5fLHrrz6Ei9GBrY+ABzF2Ylj4/w0B7RXwM=;
        b=ildK4kzNNcRQB02y2gfFmJeUjdUMG99l1ZNCnnXnjIqBqN/4vY/gcIqZ58XG7doBrV
         oretG0sFaArHWOh+RmkChkvNvgg3KLiRB+Z0vfe73zs/IsvCzCo2zO0VQnHv8udoplOF
         n8Zp7sCo8yj8xWVb5eoo0HgcV2/QFTKSqdUhhfXoW7Y+qp+gXANkPYHjsWoZEzAxDPcJ
         EsfKuDkCNyZyT8JBJeMmMLQFWA8zVbdeeKYU5seKsE4+BzUl83ZpxyIjj2mshxmODnRj
         qR9HKYCj+63U1HMiFvgdDr+bZLQhxkkFKWpYo1zzzgSy775dXEhYV2uNOoHEb5Ae595j
         H0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793452267; x=1794057067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=asHu4GXPz5fLHrrz6Ei9GBrY+ABzF2Ylj4/w0B7RXwM=;
        b=hJ37NStvjFS+h0Pece7d9B05MQEZ3iX8HIakzerqd6oZFKc7gh9KvH6CPZ4gZJOvEQ
         G/aLbrUHumlpIlAF9U2MI+KXYePxpzhFYdtF2ApKdWzx8ucHYivRtO/V8u3nocg6NiRi
         V15qnEUhvxBct6hPl8LNpbE/Fc3CJ0Nra7da+OBbZd8kW01A9H/luDQpOBU3m426HcWb
         hGc+7ID6bpgcJYiHRh/XyO7rrYfcsorkMJQ5Q05w2vfG+E5iBpGf/Z+MmpfMzjqAMZBI
         2cFSKZwUWC8jzeljevcDh7tKcijXgle0Ryq4KvdOkYYP6aHBsfb4deDnqP227P4a8J37
         ikWw==
X-Forwarded-Encrypted: i=1; AKwUvBw0tiHiE3RyO1/HHeZ/F/U0F5tyMVQv6UhNopsVKSLMYdUw6tDgnfxR3v3eLMBy47vRMCoNc4edzBHCk0Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBXtKPp7zHIwh6nLxYZaFg6AC2+4pfGAMU7ttCBoOMnEtmBLZ7
	whLoRDT9NorPaQQeHpVe9DxT9bVkPhEiKix51wor5qr6hRRGhu91Aqh2Nc22reqGyaGwfBk0jq8
	fkQpIqm9kkh92hzCTqdHNeF1AsKXePZAbZncwUw9eXYqV8f16s5Mx/X8xOAHuy54qaTI=
X-Gm-Gg: AYBFou3f7Rse0FY9fKzZsS/d3Vx50TCmoADXKuQYhLQC4WifCFvmxb0ZcgtnxNSHnT+
	Xgq6eiZKwMTm6+45BTonMe7TrjDn9fz9cR2fCkCHVXXb58hREtTrMz6DXwuM+faXUAfeX31XIrv
	Wi1/oE5ypGPUiQy0rEapCK9zfKT15qWQk78Crlkz9BoY5Pr4vh9fv6ypsTBMiOs+ZPxdJ6wHYif
	zvIXoH8KjeUDM1+imzN76gxP/1kJK4MvaKct6jP9F2CJoGeoRTV1F2Ytqn/gcE1HcrHK+WWfuPj
	AbMGF9nZ8VwyNFNqxGr3hqvkn7tnCdvGwobswzl4X+lVNkpzmAS8JBld2zyXBuaeg1uh0hNso0J
	xcYvo/Qj2z/eq0dmXQqXeOMQkVvZHXxiFrKyq5/gymwRnzE53JvQ0lzE1UqBdBn/JLfgmE7FVzp
	CnZO6ohmLm71JltV1WGXkZ+/SVfW/jucMZ
X-Received: by 2002:a05:7022:3a03:b0:155:7721:3a4c with SMTP id a92af1059eb24-1ac5f18175fmr8217676c88.35.1793452265047;
        Sat, 31 Oct 2026 06:11:05 -0700 (PDT)
X-Received: by 2002:a05:7022:3a03:b0:155:7721:3a4c with SMTP id a92af1059eb24-1ac5f18175fmr8217549c88.35.1793452263042;
        Sat, 31 Oct 2026 06:11:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm15717872c88.5.2026.10.31.06.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:11:02 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 3/6] arm64: dts: qcom: lemans: Move platform resources into lemans-embedded.dtsi
Date: Sat, 31 Oct 2026 21:10:39 +0800
Message-ID: <20261031131042.1200862-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fzlXwQShILpv5C05NHEWjTHoBFtXpbeQ
X-Proofpoint-GUID: fzlXwQShILpv5C05NHEWjTHoBFtXpbeQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX25/D8izzX8Zm
 TkE1FgxMzwJje8HKhF97gWk29owu4r5E9HkZ+xXC7e6VYGWImMKk6GrbOUOfF0vZfx0N0itymUU
 M4jB5YdY+oYCeJEqfiaB7fxwxsdgAnhW5DPPSmsHnnS4a++SNVUfrVWx5vGILMejyH2y9xYeNf/
 uqC5azqwUjZcX4mI8bWbxcfdM0EfPqPyqNhZhMDLknR8Xsu4ZCK1pcur7JZcfoMVxFPLOHP4p/E
 il/aKFPbfGkdDKSIhusMhtS3m2zZtMB8Td+3Ye6ep9SNv6JyxwFOlsW156HXHvTge6uPHYWXeJe
 XppHHDSA5uORRFRfg04fq+7kRxY8DOHbZzrRwg/dAIZGAJNryv8xmsqd5eqvORitrnfZ7A2GqQA
 +4kjBzzOXXgnGweqqEZMoEmno7Wmqwko6M6GvosxNUorlHlz3YV32kUYXz2BHFKtD0sCFuySb2z
 2ySZKH1k41FUa9j16qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX7YEihVj6+3Q3
 g9xTB6FvceitNkmfnJcBy84Bm0g8JwUlYOTAFSf7i8pHmnjpg/uo6TuF7I/uTn5nrnzRn1Wc6i0
 a0NWa2dzT64o5QUL2ls0UW8Qesxqckw=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae5e8eb cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ufUiiq2eHYeagfSBbOgA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310052

Devicetree lemans-embedded.dtsi was created for Lemans Embedded variant
where platform resource like clocks, regulator, interconnects, pinctrls
and PHYs are managed by Linux. Move them from lemans.dtsi to
lemans-embedded.dtsi, so that lemans.dtsi could be used by GearVM
variant.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 2871 +++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 2559 +--------------
 2 files changed, 2875 insertions(+), 2555 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
index 107db7a74756..0be39bb9de1e 100644
--- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -3,8 +3,2505 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
+#include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+#include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
+#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
+#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
+#include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+
 #include "lemans.dtsi"
 
+/ {
+	clocks {
+		xo_board_clk: xo-board-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+	};
+
+	cpu0_opp_table: opp-table-cpu0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-1267200000 {
+			opp-hz = /bits/ 64 <1267200000>;
+			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
+		};
+
+		opp-1363200000 {
+			opp-hz = /bits/ 64 <1363200000>;
+			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
+		};
+
+		opp-1459200000 {
+			opp-hz = /bits/ 64 <1459200000>;
+			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
+		};
+
+		opp-1536000000 {
+			opp-hz = /bits/ 64 <1536000000>;
+			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
+		};
+
+		opp-1632000000 {
+			opp-hz = /bits/ 64 <1632000000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1785600000 {
+			opp-hz = /bits/ 64 <1785600000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1862400000 {
+			opp-hz = /bits/ 64 <1862400000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1939200000 {
+			opp-hz = /bits/ 64 <1939200000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-2016000000 {
+			opp-hz = /bits/ 64 <2016000000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-2112000000 {
+			opp-hz = /bits/ 64 <2112000000>;
+			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
+		};
+
+		opp-2188800000 {
+			opp-hz = /bits/ 64 <2188800000>;
+			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
+		};
+
+		opp-2265600000 {
+			opp-hz = /bits/ 64 <2265600000>;
+			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
+		};
+
+		opp-2361600000 {
+			opp-hz = /bits/ 64 <2361600000>;
+			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
+		};
+
+		opp-2457600000 {
+			opp-hz = /bits/ 64 <2457600000>;
+			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
+		};
+
+		opp-2553600000 {
+			opp-hz = /bits/ 64 <2553600000>;
+			opp-peak-kBps = <(3196800 * 4) (1708800 * 32)>;
+		};
+	};
+
+	cpu4_opp_table: opp-table-cpu4 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-1267200000 {
+			opp-hz = /bits/ 64 <1267200000>;
+			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
+		};
+
+		opp-1363200000 {
+			opp-hz = /bits/ 64 <1363200000>;
+			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
+		};
+
+		opp-1459200000 {
+			opp-hz = /bits/ 64 <1459200000>;
+			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
+		};
+
+		opp-1536000000 {
+			opp-hz = /bits/ 64 <1536000000>;
+			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
+		};
+
+		opp-1632000000 {
+			opp-hz = /bits/ 64 <1632000000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1785600000 {
+			opp-hz = /bits/ 64 <1785600000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1862400000 {
+			opp-hz = /bits/ 64 <1862400000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1939200000 {
+			opp-hz = /bits/ 64 <1939200000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-2016000000 {
+			opp-hz = /bits/ 64 <2016000000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-2112000000 {
+			opp-hz = /bits/ 64 <2112000000>;
+			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
+		};
+
+		opp-2188800000 {
+			opp-hz = /bits/ 64 <2188800000>;
+			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
+		};
+
+		opp-2265600000 {
+			opp-hz = /bits/ 64 <2265600000>;
+			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
+		};
+
+		opp-2361600000 {
+			opp-hz = /bits/ 64 <2361600000>;
+			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
+		};
+
+		opp-2457600000 {
+			opp-hz = /bits/ 64 <2457600000>;
+			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
+		};
+
+		opp-2553600000 {
+			opp-hz = /bits/ 64 <2553600000>;
+			opp-peak-kBps = <(3196800 * 4) (1708800 * 32)>;
+		};
+	};
+
+	clk_virt: interconnect-clk-virt {
+		compatible = "qcom,sa8775p-clk-virt";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	mc_virt: interconnect-mc-virt {
+		compatible = "qcom,sa8775p-mc-virt";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	qup_opp_table_100mhz: opp-table-qup100mhz {
+		compatible = "operating-points-v2";
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+	};
+};
+
+&adreno_smmu {
+	power-domains = <&gpucc GPU_CC_CX_GDSC>;
+	clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+		 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
+		 <&gpucc GPU_CC_AHB_CLK>,
+		 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+		 <&gpucc GPU_CC_CX_GMU_CLK>,
+		 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+		 <&gpucc GPU_CC_HUB_AON_CLK>;
+	clock-names = "gcc_gpu_memnoc_gfx_clk",
+		      "gcc_gpu_snoc_dvm_gfx_clk",
+		      "gpu_cc_ahb_clk",
+		      "gpu_cc_hlos1_vote_gpu_smmu_clk",
+		      "gpu_cc_cx_gmu_clk",
+		      "gpu_cc_hub_cx_int_clk",
+		      "gpu_cc_hub_aon_clk";
+};
+
+&camss {
+	clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+		 <&camcc CAM_CC_CORE_AHB_CLK>,
+		 <&camcc CAM_CC_CPAS_AHB_CLK>,
+		 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+		 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+		 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+		 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+		 <&camcc CAM_CC_CSID_CLK>,
+		 <&camcc CAM_CC_CSIPHY0_CLK>,
+		 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+		 <&camcc CAM_CC_CSIPHY1_CLK>,
+		 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+		 <&camcc CAM_CC_CSIPHY2_CLK>,
+		 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+		 <&camcc CAM_CC_CSIPHY3_CLK>,
+		 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+		 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+		 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+		 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+		 <&camcc CAM_CC_ICP_AHB_CLK>,
+		 <&camcc CAM_CC_IFE_0_CLK>,
+		 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+		 <&camcc CAM_CC_IFE_1_CLK>,
+		 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+	clock-names = "camnoc_axi",
+		      "core_ahb",
+		      "cpas_ahb",
+		      "cpas_fast_ahb_clk",
+		      "cpas_vfe_lite",
+		      "cpas_vfe0",
+		      "cpas_vfe1",
+		      "csid",
+		      "csiphy0",
+		      "csiphy0_timer",
+		      "csiphy1",
+		      "csiphy1_timer",
+		      "csiphy2",
+		      "csiphy2_timer",
+		      "csiphy3",
+		      "csiphy3_timer",
+		      "csiphy_rx",
+		      "gcc_axi_hf",
+		      "gcc_axi_sf",
+		      "icp_ahb",
+		      "vfe0",
+		      "vfe0_fast_ahb",
+		      "vfe1",
+		      "vfe1_fast_ahb",
+		      "vfe_lite",
+		      "vfe_lite_ahb",
+		      "vfe_lite_cphy_rx",
+		      "vfe_lite_csid";
+
+	interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+			<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "ahb",
+			     "hf_0";
+
+	power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+	power-domain-names = "top";
+};
+
+&cci0 {
+	power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+	clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+		 <&camcc CAM_CC_CPAS_AHB_CLK>,
+		 <&camcc CAM_CC_CCI_0_CLK>;
+	clock-names = "camnoc_axi",
+		      "cpas_ahb",
+		      "cci";
+
+	pinctrl-0 = <&cci0_0_default &cci0_1_default>;
+	pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
+	pinctrl-names = "default", "sleep";
+};
+
+&cci1 {
+	power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+	clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+		 <&camcc CAM_CC_CPAS_AHB_CLK>,
+		 <&camcc CAM_CC_CCI_1_CLK>;
+	clock-names = "camnoc_axi",
+		      "cpas_ahb",
+		      "cci";
+
+	pinctrl-0 = <&cci1_0_default &cci1_1_default>;
+	pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
+	pinctrl-names = "default", "sleep";
+};
+
+&cci2 {
+	power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+	clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+		 <&camcc CAM_CC_CPAS_AHB_CLK>,
+		 <&camcc CAM_CC_CCI_2_CLK>;
+	clock-names = "camnoc_axi",
+		      "cpas_ahb",
+		      "cci";
+
+	pinctrl-0 = <&cci2_0_default &cci2_1_default>;
+	pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
+	pinctrl-names = "default", "sleep";
+};
+
+&cci3 {
+	power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+	clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+		 <&camcc CAM_CC_CPAS_AHB_CLK>,
+		 <&camcc CAM_CC_CCI_3_CLK>;
+	clock-names = "camnoc_axi",
+		      "cpas_ahb",
+		      "cci";
+
+	pinctrl-0 = <&cci3_0_default &cci3_1_default>;
+	pinctrl-1 = <&cci3_0_sleep &cci3_1_sleep>;
+	pinctrl-names = "default", "sleep";
+};
+
+&cpu0 {
+	operating-points-v2 = <&cpu0_opp_table>;
+	interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+			<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+			 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
+};
+
+&cpu1 {
+	operating-points-v2 = <&cpu0_opp_table>;
+	interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+			<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+			 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
+};
+
+&cpu2 {
+	operating-points-v2 = <&cpu0_opp_table>;
+	interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+			<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+			 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
+};
+
+&cpu3 {
+	operating-points-v2 = <&cpu0_opp_table>;
+	interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+			<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+			 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
+};
+
+&cpu4 {
+	operating-points-v2 = <&cpu4_opp_table>;
+	interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+			<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+			 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
+};
+
+&cpu5 {
+	operating-points-v2 = <&cpu4_opp_table>;
+	interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+			<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+			 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
+};
+
+&cpu6 {
+	operating-points-v2 = <&cpu4_opp_table>;
+	interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+			<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+			 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
+};
+
+&cpu7 {
+	operating-points-v2 = <&cpu4_opp_table>;
+	interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+			<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+			 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
+};
+
+&cpu_bwmon0 {
+	compatible = "qcom,sa8775p-cpu-bwmon", "qcom,sdm845-bwmon";
+	interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
+};
+
+&cpu_bwmon1 {
+	compatible = "qcom,sa8775p-cpu-bwmon", "qcom,sdm845-bwmon";
+	interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
+};
+
+&cpufreq_hw {
+	clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
+	clock-names = "xo", "alternate";
+};
+
+&crypto {
+	interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "memory";
+};
+
+&ethernet0 {
+	clocks = <&gcc GCC_EMAC0_AXI_CLK>,
+		 <&gcc GCC_EMAC0_SLV_AHB_CLK>,
+		 <&gcc GCC_EMAC0_PTP_CLK>,
+		 <&gcc GCC_EMAC0_PHY_AUX_CLK>;
+	clock-names = "stmmaceth",
+		      "pclk",
+		      "ptp_ref",
+		      "phyaux";
+
+	interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_EMAC_CFG QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc MASTER_EMAC QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "cpu-mac",
+			     "mac-mem";
+
+	power-domains = <&gcc EMAC0_GDSC>;
+
+	phys = <&serdes0>;
+	phy-names = "serdes";
+};
+
+&ethernet1 {
+	clocks = <&gcc GCC_EMAC1_AXI_CLK>,
+		 <&gcc GCC_EMAC1_SLV_AHB_CLK>,
+		 <&gcc GCC_EMAC1_PTP_CLK>,
+		 <&gcc GCC_EMAC1_PHY_AUX_CLK>;
+	clock-names = "stmmaceth",
+		      "pclk",
+		      "ptp_ref",
+		      "phyaux";
+
+	interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_EMAC1_CFG QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc MASTER_EMAC_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "cpu-mac",
+			     "mac-mem";
+
+	power-domains = <&gcc EMAC1_GDSC>;
+
+	phys = <&serdes1>;
+	phy-names = "serdes";
+};
+
+&gmu {
+	compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
+	clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+		 <&gpucc GPU_CC_CXO_CLK>,
+		 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+		 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+		 <&gpucc GPU_CC_AHB_CLK>,
+		 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+		 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+	clock-names = "gmu",
+		      "cxo",
+		      "axi",
+		      "memnoc",
+		      "ahb",
+		      "hub",
+		      "smmu_vote";
+	power-domains = <&gpucc GPU_CC_CX_GDSC>,
+			<&gpucc GPU_CC_GX_GDSC>;
+	power-domain-names = "cx",
+			     "gx";
+	operating-points-v2 = <&gmu_opp_table>;
+
+	gmu_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+		};
+	};
+};
+
+&gpu {
+	operating-points-v2 = <&gpu_opp_table>;
+	interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "gfx-mem";
+
+	gpu_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-405000000 {
+			opp-hz = /bits/ 64 <405000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+			opp-peak-kBps = <5285156>;
+			opp-supported-hw = <0x3>;
+		};
+
+		opp-530000000 {
+			opp-hz = /bits/ 64 <530000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+			opp-peak-kBps = <12484375>;
+			opp-supported-hw = <0x2>;
+		};
+
+		opp-676000000 {
+			opp-hz = /bits/ 64 <676000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+			opp-peak-kBps = <8171875>;
+			opp-supported-hw = <0x1>;
+		};
+
+		opp-778000000 {
+			opp-hz = /bits/ 64 <778000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+			opp-peak-kBps = <10687500>;
+			opp-supported-hw = <0x1>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+			opp-peak-kBps = <12484375>;
+			opp-supported-hw = <0x1>;
+		};
+	};
+};
+
+&i2c0 {
+	clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c0_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c1 {
+	clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c1_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c2 {
+	clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c2_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c3 {
+	clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c3_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c4 {
+	clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c4_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c5 {
+	clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c5_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c7 {
+	clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c7_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c8 {
+	clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c8_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c9 {
+	clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c9_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c10 {
+	clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c10_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c11 {
+	clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c11_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c12 {
+	clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c12_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c13 {
+	clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c13_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c14 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c14_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c15 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c15_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c16 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c16_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c17 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c17_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c18 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c18_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c19 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c19_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c20 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c20_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&i2c21 {
+	clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_i2c21_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+			&clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+		   <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			&config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
+		   <&aggre1_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
+			&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+				 "qup-config",
+				 "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&iris {
+	power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+			<&videocc VIDEO_CC_MVS0_GDSC>,
+			<&rpmhpd SA8775P_MX>,
+			<&rpmhpd SA8775P_MMCX>;
+	power-domain-names = "venus",
+			     "vcodec0",
+			     "mxc",
+			     "mmcx";
+	operating-points-v2 = <&iris_opp_table>;
+
+	clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0_CLK>;
+	clock-names = "iface",
+		      "core",
+		      "vcodec0_core";
+
+	interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+			<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "cpu-cfg",
+			     "video-mem";
+
+	resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+	reset-names = "bus";
+
+	iris_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-366000000 {
+			opp-hz = /bits/ 64 <366000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-444000000 {
+			opp-hz = /bits/ 64 <444000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-533000000 {
+			opp-hz = /bits/ 64 <533000000>;
+			required-opps = <&rpmhpd_opp_nom>,
+					<&rpmhpd_opp_turbo>;
+		};
+
+		opp-560000000 {
+			opp-hz = /bits/ 64 <560000000>;
+			required-opps = <&rpmhpd_opp_nom>,
+					<&rpmhpd_opp_turbo_l1>;
+		};
+	};
+};
+
+&llcc_bwmon {
+	compatible = "qcom,sa8775p-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
+	interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+};
+
+&mdss0 {
+	/* same path used twice */
+	interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+	interconnect-names = "mdp0-mem",
+			     "mdp1-mem",
+			     "cpu-cfg";
+
+	resets = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+	power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+	clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&gcc GCC_DISP_HF_AXI_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+	mdss0_dsi0_phy: phy@ae94400 {
+		compatible = "qcom,sa8775p-dsi-phy-5nm";
+		reg = <0x0 0x0ae94400 0x0 0x200>,
+		      <0x0 0x0ae94600 0x0 0x280>,
+		      <0x0 0x0ae94900 0x0 0x27c>;
+		reg-names = "dsi_phy",
+			    "dsi_phy_lane",
+			    "dsi_pll";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+			 <&rpmhcc RPMH_CXO_CLK>;
+		clock-names = "iface", "ref";
+
+		status = "disabled";
+	};
+
+	mdss0_dsi1_phy: phy@ae96400 {
+		compatible = "qcom,sa8775p-dsi-phy-5nm";
+		reg = <0x0 0x0ae96400 0x0 0x200>,
+		      <0x0 0x0ae96600 0x0 0x280>,
+		      <0x0 0x0ae96900 0x0 0x27c>;
+		reg-names = "dsi_phy",
+			    "dsi_phy_lane",
+			    "dsi_pll";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+			 <&rpmhcc RPMH_CXO_CLK>;
+		clock-names = "iface", "ref";
+
+		status = "disabled";
+	};
+
+	mdss0_dp0_phy: phy@aec2a00 {
+		compatible = "qcom,sa8775p-edp-phy";
+
+		reg = <0x0 0x0aec2a00 0x0 0x200>,
+		      <0x0 0x0aec2200 0x0 0xd0>,
+		      <0x0 0x0aec2600 0x0 0xd0>,
+		      <0x0 0x0aec2000 0x0 0x1c8>;
+
+		clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+			 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+			 <&gcc GCC_EDP_REF_CLKREF_EN>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	mdss0_dp1_phy: phy@aec5a00 {
+		compatible = "qcom,sa8775p-edp-phy";
+
+		reg = <0x0 0x0aec5a00 0x0 0x200>,
+		      <0x0 0x0aec5200 0x0 0xd0>,
+		      <0x0 0x0aec5600 0x0 0xd0>,
+		      <0x0 0x0aec5000 0x0 0x1c8>;
+
+		clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+			 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+			 <&gcc GCC_EDP_REF_CLKREF_EN>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+};
+
+&mdss0_dp0 {
+	clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
+	clock-names = "core_iface",
+		      "core_aux",
+		      "ctrl_link",
+		      "ctrl_link_iface",
+		      "stream_pixel",
+		      "stream_1_pixel",
+		      "stream_2_pixel",
+		      "stream_3_pixel";
+	assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+	assigned-clock-parents = <&mdss0_dp0_phy 0>,
+				 <&mdss0_dp0_phy 1>,
+				 <&mdss0_dp0_phy 1>,
+				 <&mdss0_dp0_phy 1>,
+				 <&mdss0_dp0_phy 1>;
+	phys = <&mdss0_dp0_phy>;
+	phy-names = "dp";
+
+	operating-points-v2 = <&dp_opp_table>;
+	power-domains = <&rpmhpd SA8775P_MMCX>;
+
+	dp_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-162000000 {
+			opp-hz = /bits/ 64 <162000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-270000000 {
+			opp-hz = /bits/ 64 <270000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-540000000 {
+			opp-hz = /bits/ 64 <540000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-810000000 {
+			opp-hz = /bits/ 64 <810000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+};
+
+&mdss0_dp1 {
+	clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
+	clock-names = "core_iface",
+		      "core_aux",
+		      "ctrl_link",
+		      "ctrl_link_iface",
+		      "stream_pixel",
+		      "stream_1_pixel";
+	assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+	assigned-clock-parents = <&mdss0_dp1_phy 0>,
+				 <&mdss0_dp1_phy 1>,
+				 <&mdss0_dp1_phy 1>;
+	phys = <&mdss0_dp1_phy>;
+	phy-names = "dp";
+
+	operating-points-v2 = <&dp_opp_table>;
+	power-domains = <&rpmhpd SA8775P_MMCX>;
+};
+
+&mdss0_dsi0 {
+	clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_ESC0_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&gcc GCC_DISP_HF_AXI_CLK>;
+	clock-names = "byte",
+		      "byte_intf",
+		      "pixel",
+		      "core",
+		      "iface",
+		      "bus";
+	assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
+	assigned-clock-parents = <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>;
+	phys = <&mdss0_dsi0_phy>;
+
+	operating-points-v2 = <&mdss_dsi_opp_table>;
+	power-domains = <&rpmhpd SA8775P_MMCX>;
+
+	refgen-supply = <&refgen>;
+
+	mdss_dsi_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-358000000 {
+			opp-hz = /bits/ 64 <358000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+	};
+};
+
+&mdss0_dsi1 {
+	clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_INTF_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_ESC1_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&gcc GCC_DISP_HF_AXI_CLK>;
+	clock-names = "byte",
+		      "byte_intf",
+		      "pixel",
+		      "core",
+		      "iface",
+		      "bus";
+	assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK_SRC>;
+	assigned-clock-parents = <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
+	phys = <&mdss0_dsi1_phy>;
+
+	operating-points-v2 = <&mdss_dsi_opp_table>;
+	power-domains = <&rpmhpd SA8775P_MMCX>;
+
+	refgen-supply = <&refgen>;
+};
+
+&mdss0_mdp {
+	clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+	clock-names = "nrt_bus",
+		      "iface",
+		      "lut",
+		      "core",
+		      "vsync";
+
+	assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	operating-points-v2 = <&mdss0_mdp_opp_table>;
+	power-domains = <&rpmhpd SA8775P_MMCX>;
+
+	mdss0_mdp_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-375000000 {
+			opp-hz = /bits/ 64 <375000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+
+		opp-575000000 {
+			opp-hz = /bits/ 64 <575000000>;
+			required-opps = <&rpmhpd_opp_turbo>;
+		};
+
+		opp-650000000 {
+			opp-hz = /bits/ 64 <650000000>;
+			required-opps = <&rpmhpd_opp_turbo_l1>;
+		};
+	};
+};
+
+&mdss1 {
+	interconnects = <&mmss_noc MASTER_MDP_CORE1_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&mmss_noc MASTER_MDP_CORE1_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+	interconnect-names = "mdp0-mem",
+			     "mdp1-mem",
+			     "cpu-cfg";
+
+	resets = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+	power-domains = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+	clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&gcc GCC_DISP1_HF_AXI_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+	mdss1_dp0_phy: phy@220c2a00 {
+		compatible = "qcom,sa8775p-edp-phy";
+		reg = <0x0 0x220c2a00 0x0 0x200>,
+		      <0x0 0x220c2200 0x0 0xd0>,
+		      <0x0 0x220c2600 0x0 0xd0>,
+		      <0x0 0x220c2000 0x0 0x1c8>;
+
+		clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+			 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+			 <&gcc GCC_EDP_REF_CLKREF_EN>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	mdss1_dp1_phy: phy@220c5a00 {
+		compatible = "qcom,sa8775p-edp-phy";
+		reg = <0x0 0x220c5a00 0x0 0x200>,
+		      <0x0 0x220c5200 0x0 0xd0>,
+		      <0x0 0x220c5600 0x0 0xd0>,
+		      <0x0 0x220c5000 0x0 0x1c8>;
+
+		clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+			 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+			 <&gcc GCC_EDP_REF_CLKREF_EN>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+};
+
+&mdss1_dp0 {
+	clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
+	clock-names = "core_iface",
+		      "core_aux",
+		      "ctrl_link",
+		      "ctrl_link_iface",
+		      "stream_pixel",
+		      "stream_1_pixel",
+		      "stream_2_pixel",
+		      "stream_3_pixel";
+	assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+	assigned-clock-parents = <&mdss1_dp0_phy 0>,
+				 <&mdss1_dp0_phy 1>,
+				 <&mdss1_dp0_phy 1>,
+				 <&mdss1_dp0_phy 1>,
+				 <&mdss1_dp0_phy 1>;
+	phys = <&mdss1_dp0_phy>;
+	phy-names = "dp";
+
+	operating-points-v2 = <&dp_opp_table>;
+	power-domains = <&rpmhpd SA8775P_MMCX>;
+};
+
+&mdss1_dp1 {
+	clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
+	clock-names = "core_iface",
+		      "core_aux",
+		      "ctrl_link",
+		      "ctrl_link_iface",
+		      "stream_pixel",
+		      "stream_1_pixel";
+	assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+	assigned-clock-parents = <&mdss1_dp1_phy 0>,
+				 <&mdss1_dp1_phy 1>,
+				 <&mdss1_dp1_phy 1>;
+	phys = <&mdss1_dp1_phy>;
+	phy-names = "dp";
+
+	operating-points-v2 = <&dp_opp_table>;
+	power-domains = <&rpmhpd SA8775P_MMCX>;
+};
+
+&mdss1_mdp {
+	clocks = <&gcc GCC_DISP1_HF_AXI_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+	clock-names = "nrt_bus",
+		      "iface",
+		      "lut",
+		      "core",
+		      "vsync";
+
+	assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	operating-points-v2 = <&mdss0_mdp_opp_table>;
+	power-domains = <&rpmhpd SA8775P_MMCX>;
+};
+
+&pcie0 {
+	clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+		 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+		 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+		 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+		 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
+	clock-names = "aux",
+		      "cfg",
+		      "bus_master",
+		      "bus_slave",
+		      "slave_q2a";
+
+	assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
+			<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
+	interconnect-names = "pcie-mem", "cpu-pcie";
+
+	resets = <&gcc GCC_PCIE_0_BCR>,
+		 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
+	reset-names = "pci",
+		      "link_down";
+
+	power-domains = <&gcc PCIE_0_GDSC>;
+
+	linux,pci-domain = <0>;
+};
+
+&pcie0_ep {
+	clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+		<&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+		<&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+		<&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+		<&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
+	clock-names = "aux",
+		      "cfg",
+		      "bus_master",
+		      "bus_slave",
+		      "slave_q2a";
+
+	interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
+			<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
+	interconnect-names = "pcie-mem", "cpu-pcie";
+
+	resets = <&gcc GCC_PCIE_0_BCR>;
+	reset-names = "core";
+
+	power-domains = <&gcc PCIE_0_GDSC>;
+
+	phys = <&pcie0_phy>;
+	phy-names = "pciephy";
+
+	linux,pci-domain = <0>;
+};
+
+&pcie1 {
+	clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
+		 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+		 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
+		 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
+		 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
+	clock-names = "aux",
+		      "cfg",
+		      "bus_master",
+		      "bus_slave",
+		      "slave_q2a";
+
+	assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
+			<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
+	interconnect-names = "pcie-mem", "cpu-pcie";
+
+	resets = <&gcc GCC_PCIE_1_BCR>,
+		 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
+	reset-names = "pci",
+		      "link_down";
+
+	power-domains = <&gcc PCIE_1_GDSC>;
+
+	linux,pci-domain = <1>;
+};
+
+&pcie1_ep {
+	clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
+		 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+		 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
+		 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
+		 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
+	clock-names = "aux",
+		      "cfg",
+		      "bus_master",
+		      "bus_slave",
+		      "slave_q2a";
+
+	interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
+			<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
+	interconnect-names = "pcie-mem", "cpu-pcie";
+
+	resets = <&gcc GCC_PCIE_1_BCR>;
+	reset-names = "core";
+
+	power-domains = <&gcc PCIE_1_GDSC>;
+
+	phys = <&pcie1_phy>;
+	phy-names = "pciephy";
+
+	linux,pci-domain = <1>;
+};
+
+&pcie1_port0 {
+	phys = <&pcie1_phy>;
+};
+
+&pcieport0 {
+	phys = <&pcie0_phy>;
+};
+
+&qupv3_id_0 {
+	clock-names = "m-ahb", "s-ahb";
+	clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+		 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+};
+
+&qupv3_id_1 {
+	clock-names = "m-ahb", "s-ahb";
+	clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
+		 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+};
+
+&qupv3_id_2 {
+	clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
+		 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
+	clock-names = "m-ahb", "s-ahb";
+};
+
+&qupv3_id_3 {
+	clock-names = "m-ahb", "s-ahb";
+	clocks = <&gcc GCC_QUPV3_WRAP_3_M_AHB_CLK>,
+		 <&gcc GCC_QUPV3_WRAP_3_S_AHB_CLK>;
+};
+
+&remoteproc_adsp {
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+
+	power-domains = <&rpmhpd SA8775P_LCX>,
+			<&rpmhpd SA8775P_LMX>;
+	power-domain-names = "lcx", "lmx";
+
+	interconnects = <&lpass_ag_noc MASTER_LPASS_PROC 0
+			 &mc_virt SLAVE_EBI1 0>;
+
+};
+
+&remoteproc_cdsp0 {
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+
+	power-domains = <&rpmhpd SA8775P_CX>,
+			<&rpmhpd SA8775P_MXC>,
+			<&rpmhpd SA8775P_NSP0>;
+	power-domain-names = "cx", "mxc", "nsp";
+
+	interconnects = <&nspa_noc MASTER_CDSP_PROC 0
+			 &mc_virt SLAVE_EBI1 0>;
+};
+
+&remoteproc_cdsp1 {
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+
+	power-domains = <&rpmhpd SA8775P_CX>,
+			<&rpmhpd SA8775P_MXC>,
+			<&rpmhpd SA8775P_NSP1>;
+	power-domain-names = "cx", "mxc", "nsp";
+
+	interconnects = <&nspb_noc MASTER_CDSP_PROC_B 0
+			 &mc_virt SLAVE_EBI1 0>;
+};
+
+&remoteproc_gpdsp0 {
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+
+	power-domains = <&rpmhpd SA8775P_CX>,
+			<&rpmhpd SA8775P_MXC>;
+	power-domain-names = "cx", "mxc";
+
+	interconnects = <&gpdsp_anoc MASTER_DSP0 0
+			 &config_noc SLAVE_CLK_CTL 0>;
+};
+
+&remoteproc_gpdsp1 {
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+
+	power-domains = <&rpmhpd SA8775P_CX>,
+			<&rpmhpd SA8775P_MXC>;
+	power-domain-names = "cx", "mxc";
+
+	interconnects = <&gpdsp_anoc MASTER_DSP1 0
+			 &config_noc SLAVE_CLK_CTL 0>;
+};
+
+&sdhc {
+	clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+		 <&gcc GCC_SDCC1_APPS_CLK>;
+	clock-names = "iface",
+		      "core";
+
+	interconnects = <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_SDC1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+	interconnect-names = "sdhc-ddr",
+			     "cpu-sdhc";
+
+	operating-points-v2 = <&sdhc_opp_table>;
+	power-domains = <&rpmhpd SA8775P_CX>;
+	resets = <&gcc GCC_SDCC1_BCR>;
+
+	sdhc_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1800000 400000>;
+			opp-avg-kBps = <100000 0>;
+		};
+
+		opp-384000000 {
+			opp-hz = /bits/ 64 <384000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <5400000 1600000>;
+			opp-avg-kBps = <390000 0>;
+		};
+	};
+};
+
+&soc {
+	gcc: clock-controller@100000 {
+		compatible = "qcom,sa8775p-gcc";
+		reg = <0x0 0x00100000 0x0 0xc7018>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+		clocks = <&rpmhcc RPMH_CXO_CLK>,
+			 <&sleep_clk>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <&usb_0_qmpphy>,
+			 <&usb_1_qmpphy>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <&pcie0_phy>,
+			 <&pcie1_phy>,
+			 <0>,
+			 <0>,
+			 <0>;
+		power-domains = <&rpmhpd SA8775P_CX>;
+	};
+
+	config_noc: interconnect@14c0000 {
+		compatible = "qcom,sa8775p-config-noc";
+		reg = <0x0 0x014c0000 0x0 0x13080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	system_noc: interconnect@1680000 {
+		compatible = "qcom,sa8775p-system-noc";
+		reg = <0x0 0x01680000 0x0 0x15080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	aggre1_noc: interconnect@16c0000 {
+		compatible = "qcom,sa8775p-aggre1-noc";
+		reg = <0x0 0x016c0000 0x0 0x18080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+		clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+			 <&gcc GCC_AGGRE_NOC_QUPV3_AXI_CLK>,
+			 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
+			 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+			 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>;
+	};
+
+	aggre2_noc: interconnect@1700000 {
+		compatible = "qcom,sa8775p-aggre2-noc";
+		reg = <0x0 0x01700000 0x0 0x1b080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+		clocks = <&gcc GCC_AGGRE_UFS_CARD_AXI_CLK>,
+			 <&rpmhcc RPMH_IPA_CLK>;
+	};
+
+	pcie_anoc: interconnect@1760000 {
+		compatible = "qcom,sa8775p-pcie-anoc";
+		reg = <0x0 0x01760000 0x0 0xc080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	gpdsp_anoc: interconnect@1780000 {
+		compatible = "qcom,sa8775p-gpdsp-anoc";
+		reg = <0x0 0x01780000 0x0 0xe080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	mmss_noc: interconnect@17a0000 {
+		compatible = "qcom,sa8775p-mmss-noc";
+		reg = <0x0 0x017a0000 0x0 0x40000>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	pcie0_phy: phy@1c04000 {
+		compatible = "qcom,sa8775p-qmp-gen4x2-pcie-phy";
+		reg = <0x0 0x1c04000 0x0 0x2000>;
+
+		clocks = <&gcc GCC_PCIE_0_PHY_AUX_CLK>,
+			 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+			 <&gcc GCC_PCIE_CLKREF_EN>,
+			 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
+			 <&gcc GCC_PCIE_0_PIPE_CLK>,
+			 <&gcc GCC_PCIE_0_PIPEDIV2_CLK>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref",
+			      "rchng",
+			      "pipe",
+			      "pipediv2";
+
+		assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
+		assigned-clock-rates = <100000000>;
+
+		resets = <&gcc GCC_PCIE_0_PHY_BCR>;
+		reset-names = "phy";
+
+		#clock-cells = <0>;
+		clock-output-names = "pcie_0_pipe_clk";
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	pcie1_phy: phy@1c14000 {
+		compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy";
+		reg = <0x0 0x1c14000 0x0 0x4000>;
+
+		clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
+			 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+			 <&gcc GCC_PCIE_CLKREF_EN>,
+			 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
+			 <&gcc GCC_PCIE_1_PIPE_CLK>,
+			 <&gcc GCC_PCIE_1_PIPEDIV2_CLK>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref",
+			      "rchng",
+			      "pipe",
+			      "pipediv2";
+
+		assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
+		assigned-clock-rates = <100000000>;
+
+		resets = <&gcc GCC_PCIE_1_PHY_BCR>;
+		reset-names = "phy";
+
+		#clock-cells = <0>;
+		clock-output-names = "pcie_1_pipe_clk";
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	ufs_mem_phy: phy@1d87000 {
+		compatible = "qcom,sa8775p-qmp-ufs-phy";
+		reg = <0x0 0x01d87000 0x0 0xe10>;
+		/*
+		 * Yes, GCC_EDP_REF_CLKREF_EN is correct in qref. It
+		 * enables the CXO clock to eDP *and* UFS PHY.
+		 */
+		clocks = <&rpmhcc RPMH_CXO_CLK>,
+			 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+			 <&gcc GCC_EDP_REF_CLKREF_EN>;
+		clock-names = "ref", "ref_aux", "qref";
+		power-domains = <&gcc UFS_PHY_GDSC>;
+		resets = <&ufs_mem_hc 0>;
+		reset-names = "ufsphy";
+		#phy-cells = <0>;
+		status = "disabled";
+	};
+
+	ice: crypto@1d88000 {
+		compatible = "qcom,sa8775p-inline-crypto-engine",
+			     "qcom,inline-crypto-engine";
+		reg = <0x0 0x01d88000 0x0 0x18000>;
+		clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+			 <&gcc GCC_UFS_PHY_AHB_CLK>;
+		clock-names = "core",
+			      "iface";
+		power-domains = <&gcc UFS_PHY_GDSC>;
+	};
+
+	lpass_ag_noc: interconnect@3c40000 {
+		compatible = "qcom,sa8775p-lpass-ag-noc";
+		reg = <0x0 0x03c40000 0x0 0x17200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	usb_0_hsphy: phy@88e4000 {
+		compatible = "qcom,sa8775p-usb-hs-phy",
+			     "qcom,usb-snps-hs-5nm-phy";
+		reg = <0 0x088e4000 0 0x120>;
+		clocks = <&rpmhcc RPMH_CXO_CLK>;
+		clock-names = "ref";
+		resets = <&gcc GCC_USB2_PHY_PRIM_BCR>;
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	usb_1_hsphy: phy@88e6000 {
+		compatible = "qcom,sa8775p-usb-hs-phy",
+			     "qcom,usb-snps-hs-5nm-phy";
+		reg = <0 0x088e6000 0 0x120>;
+		clocks = <&gcc GCC_USB_CLKREF_EN>;
+		clock-names = "ref";
+		resets = <&gcc GCC_USB2_PHY_SEC_BCR>;
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	usb_2_hsphy: phy@88e7000 {
+		compatible = "qcom,sa8775p-usb-hs-phy",
+			     "qcom,usb-snps-hs-5nm-phy";
+		reg = <0 0x088e7000 0 0x120>;
+		clocks = <&gcc GCC_USB_CLKREF_EN>;
+		clock-names = "ref";
+		resets = <&gcc GCC_USB3_PHY_TERT_BCR>;
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	usb_0_qmpphy: phy@88e8000 {
+		compatible = "qcom,sa8775p-qmp-usb3-uni-phy";
+		reg = <0 0x088e8000 0 0x2000>;
+
+		clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+			 <&gcc GCC_USB_CLKREF_EN>,
+			 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+			 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+		clock-names = "aux", "ref", "com_aux", "pipe";
+
+		resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+			 <&gcc GCC_USB3PHY_PHY_PRIM_BCR>;
+		reset-names = "phy", "phy_phy";
+
+		power-domains = <&gcc USB30_PRIM_GDSC>;
+
+		#clock-cells = <0>;
+		clock-output-names = "usb3_prim_phy_pipe_clk_src";
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	usb_1_qmpphy: phy@88ea000 {
+		compatible = "qcom,sa8775p-qmp-usb3-uni-phy";
+		reg = <0 0x088ea000 0 0x2000>;
+
+		clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
+			 <&gcc GCC_USB_CLKREF_EN>,
+			 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
+			 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
+		clock-names = "aux", "ref", "com_aux", "pipe";
+
+		resets = <&gcc GCC_USB3_PHY_SEC_BCR>,
+			 <&gcc GCC_USB3PHY_PHY_SEC_BCR>;
+		reset-names = "phy", "phy_phy";
+
+		power-domains = <&gcc USB30_SEC_GDSC>;
+
+		#clock-cells = <0>;
+		clock-output-names = "usb3_sec_phy_pipe_clk_src";
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	refgen: regulator@891c000 {
+		compatible = "qcom,sa8775p-refgen-regulator",
+			     "qcom,sm8250-refgen-regulator";
+		reg = <0x0 0x0891c000 0x0 0x84>;
+	};
+
+	dc_noc: interconnect@90e0000 {
+		compatible = "qcom,sa8775p-dc-noc";
+		reg = <0x0 0x090e0000 0x0 0x5080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	gem_noc: interconnect@9100000 {
+		compatible = "qcom,sa8775p-gem-noc";
+		reg = <0x0 0x09100000 0x0 0xf6080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	gpucc: clock-controller@3d90000 {
+		compatible = "qcom,sa8775p-gpucc";
+		reg = <0x0 0x03d90000 0x0 0xa000>;
+		clocks = <&rpmhcc RPMH_CXO_CLK>,
+			 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+			 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+		clock-names = "bi_tcxo",
+			      "gcc_gpu_gpll0_clk_src",
+			      "gcc_gpu_gpll0_div_clk_src";
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	serdes0: phy@8901000 {
+		compatible = "qcom,sa8775p-dwmac-sgmii-phy";
+		reg = <0x0 0x08901000 0x0 0xe10>;
+		clocks = <&gcc GCC_SGMI_CLKREF_EN>;
+		clock-names = "sgmi_ref";
+		#phy-cells = <0>;
+		status = "disabled";
+	};
+
+	serdes1: phy@8902000 {
+		compatible = "qcom,sa8775p-dwmac-sgmii-phy";
+		reg = <0x0 0x08902000 0x0 0xe10>;
+		clocks = <&gcc GCC_SGMI_CLKREF_EN>;
+		clock-names = "sgmi_ref";
+		#phy-cells = <0>;
+		status = "disabled";
+	};
+
+	videocc: clock-controller@abf0000 {
+		compatible = "qcom,sa8775p-videocc";
+		reg = <0x0 0x0abf0000 0x0 0x10000>;
+		clocks = <&gcc GCC_VIDEO_AHB_CLK>,
+			 <&rpmhcc RPMH_CXO_CLK>,
+			 <&rpmhcc RPMH_CXO_CLK_A>,
+			 <&sleep_clk>;
+		power-domains = <&rpmhpd SA8775P_MMCX>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	camcc: clock-controller@ade0000 {
+		compatible = "qcom,sa8775p-camcc";
+		reg = <0x0 0x0ade0000 0x0 0x20000>;
+		clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+			 <&rpmhcc RPMH_CXO_CLK>,
+			 <&rpmhcc RPMH_CXO_CLK_A>,
+			 <&sleep_clk>;
+		power-domains = <&rpmhpd SA8775P_MMCX>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	dispcc0: clock-controller@af00000 {
+		compatible = "qcom,sa8775p-dispcc0";
+		reg = <0x0 0x0af00000 0x0 0x20000>;
+		clocks = <&gcc GCC_DISP_AHB_CLK>,
+			 <&rpmhcc RPMH_CXO_CLK>,
+			 <&rpmhcc RPMH_CXO_CLK_A>,
+			 <&sleep_clk>,
+			 <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>,
+			 <&mdss0_dp1_phy 0>, <&mdss0_dp1_phy 1>,
+			 <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
+			 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>,
+			 <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
+			 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
+		power-domains = <&rpmhpd SA8775P_MMCX>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	apps_rsc: rsc@18200000 {
+		compatible = "qcom,rpmh-rsc";
+		reg = <0x0 0x18200000 0x0 0x10000>,
+		      <0x0 0x18210000 0x0 0x10000>,
+		      <0x0 0x18220000 0x0 0x10000>;
+		reg-names = "drv-0", "drv-1", "drv-2";
+		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+		      <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+		      <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+		qcom,tcs-offset = <0xd00>;
+		qcom,drv-id = <2>;
+		qcom,tcs-config = <ACTIVE_TCS 2>,
+				  <SLEEP_TCS 3>,
+				  <WAKE_TCS 3>,
+				  <CONTROL_TCS 0>;
+		label = "apps_rsc";
+		power-domains = <&system_pd>;
+
+		apps_bcm_voter: bcm-voter {
+			compatible = "qcom,bcm-voter";
+		};
+
+		rpmhcc: clock-controller {
+			compatible = "qcom,sa8775p-rpmh-clk";
+			#clock-cells = <1>;
+			clock-names = "xo";
+			clocks = <&xo_board_clk>;
+		};
+
+		rpmhpd: power-controller {
+			compatible = "qcom,sa8775p-rpmhpd";
+			#power-domain-cells = <1>;
+			operating-points-v2 = <&rpmhpd_opp_table>;
+
+			rpmhpd_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				rpmhpd_opp_ret: opp-0 {
+					opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+				};
+
+				rpmhpd_opp_min_svs: opp-1 {
+					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				};
+
+				rpmhpd_opp_low_svs: opp-2 {
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				rpmhpd_opp_svs: opp-3 {
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+
+				rpmhpd_opp_svs_l1: opp-4 {
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				};
+
+				rpmhpd_opp_nom: opp-5 {
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+				};
+
+				rpmhpd_opp_nom_l1: opp-6 {
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+				};
+
+				rpmhpd_opp_nom_l2: opp-7 {
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+				};
+
+				rpmhpd_opp_turbo: opp-8 {
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+				};
+
+				rpmhpd_opp_turbo_l1: opp-9 {
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+				};
+			};
+		};
+	};
+
+	epss_l3_cl0: interconnect@18590000 {
+		compatible = "qcom,sa8775p-epss-l3",
+			     "qcom,epss-l3";
+		reg = <0x0 0x18590000 0x0 0x1000>;
+		clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
+		clock-names = "xo", "alternate";
+		#interconnect-cells = <1>;
+	};
+
+	epss_l3_cl1: interconnect@18592000 {
+		compatible = "qcom,sa8775p-epss-l3",
+			     "qcom,epss-l3";
+		reg = <0x0 0x18592000 0x0 0x1000>;
+		clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
+		clock-names = "xo", "alternate";
+		#interconnect-cells = <1>;
+	};
+
+	dispcc1: clock-controller@22100000 {
+		compatible = "qcom,sa8775p-dispcc1";
+		reg = <0x0 0x22100000 0x0 0x20000>;
+		clocks = <&gcc GCC_DISP_AHB_CLK>,
+			 <&rpmhcc RPMH_CXO_CLK>,
+			 <&rpmhcc RPMH_CXO_CLK_A>,
+			 <&sleep_clk>,
+			 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
+			 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
+			 <0>, <0>, <0>, <0>;
+		power-domains = <&rpmhpd SA8775P_MMCX>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	nspa_noc: interconnect@260c0000 {
+		compatible = "qcom,sa8775p-nspa-noc";
+		reg = <0x0 0x260c0000 0x0 0x16080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	nspb_noc: interconnect@2a0c0000 {
+		compatible = "qcom,sa8775p-nspb-noc";
+		reg = <0x0 0x2a0c0000 0x0 0x16080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+};
+
+&spi0 {
+	clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi0_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi1 {
+	clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi1_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi2 {
+	clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi2_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi3 {
+	clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi3_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi4 {
+	clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi4_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi5 {
+	clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi5_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi7 {
+	clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi7_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi8 {
+	clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi8_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi9 {
+	clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi9_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi10 {
+	clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi10_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi11 {
+	clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi11_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi12 {
+	clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi12_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi14 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi14_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi15 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi15_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi16 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi16_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi17 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi17_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi18 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi18_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi19 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi19_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi20 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi20_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&spi21 {
+	clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_spi21_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+			&clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+		   <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			&config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
+		   <&aggre1_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
+			&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+				 "qup-config",
+				 "qup-memory";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
 &tlmm {
 	dp0_hot_plug_det: dp0-hot-plug-det-state {
 		pins = "gpio101";
@@ -812,3 +3309,377 @@ data-pins {
 		};
 	};
 };
+
+&uart0 {
+	clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_uart0_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&uart1 {
+	clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_uart1_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&uart2 {
+	clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_uart2_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&uart3 {
+	clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_uart3_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&uart4 {
+	clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_uart4_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&uart5 {
+	clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_uart5_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&uart7 {
+	clock-names = "se";
+	clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+	pinctrl-0 = <&qup_uart7_default>;
+	pinctrl-names = "default";
+	interconnect-names = "qup-core", "qup-config";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	power-domains = <&rpmhpd SA8775P_CX>;
+	operating-points-v2 = <&qup_opp_table_100mhz>;
+};
+
+&uart8 {
+	clock-names = "se";
+	clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+	pinctrl-0 = <&qup_uart8_default>;
+	pinctrl-names = "default";
+	interconnect-names = "qup-core", "qup-config";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	power-domains = <&rpmhpd SA8775P_CX>;
+	operating-points-v2 = <&qup_opp_table_100mhz>;
+};
+
+&uart9 {
+	clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_uart9_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&uart10 {
+	clock-names = "se";
+	clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+	pinctrl-0 = <&qup_uart10_default>;
+	pinctrl-names = "default";
+	interconnect-names = "qup-core", "qup-config";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 0
+			 &clk_virt SLAVE_QUP_CORE_1 0>,
+			<&gem_noc MASTER_APPSS_PROC 0
+			 &config_noc SLAVE_QUP_1 0>;
+	power-domains = <&rpmhpd SA8775P_CX>;
+	operating-points-v2 = <&qup_opp_table_100mhz>;
+};
+
+&uart11 {
+	clock-names = "se";
+	clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+	pinctrl-0 = <&qup_uart11_default>;
+	pinctrl-names = "default";
+	interconnect-names = "qup-core", "qup-config";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	power-domains = <&rpmhpd SA8775P_CX>;
+	operating-points-v2 = <&qup_opp_table_100mhz>;
+};
+
+&uart12 {
+	clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_uart12_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&uart14 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_uart14_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&uart15 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_uart15_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&uart16 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_uart16_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&uart17 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_uart17_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&uart18 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_uart18_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&uart19 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_uart19_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&uart20 {
+	clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
+	clock-names = "se";
+	pinctrl-0 = <&qup_uart20_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	power-domains = <&rpmhpd SA8775P_CX>;
+};
+
+&uart21 {
+	clock-names = "se";
+	clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart21_default>;
+	pinctrl-names = "default";
+	interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>;
+	power-domains = <&rpmhpd SA8775P_CX>;
+	operating-points-v2 = <&qup_opp_table_100mhz>;
+};
+
+&ufs_mem_hc {
+	phys = <&ufs_mem_phy>;
+	phy-names = "ufsphy";
+	#reset-cells = <1>;
+	resets = <&gcc GCC_UFS_PHY_BCR>;
+	reset-names = "rst";
+	power-domains = <&gcc UFS_PHY_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+	clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+		 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+		 <&gcc GCC_UFS_PHY_AHB_CLK>,
+		 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>,
+		 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+		 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+		 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+	clock-names = "core_clk",
+		      "bus_aggr_clk",
+		      "iface_clk",
+		      "core_clk_unipro",
+		      "ref_clk",
+		      "tx_lane0_sync_clk",
+		      "rx_lane0_sync_clk",
+		      "rx_lane1_sync_clk";
+	freq-table-hz = <75000000 300000000>,
+			<0 0>,
+			<0 0>,
+			<75000000 300000000>,
+			<0 0>,
+			<0 0>,
+			<0 0>,
+			<0 0>;
+	qcom,ice = <&ice>;
+};
+
+&usb_0 {
+	clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+		 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+		 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+		 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+		 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
+	clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi";
+	assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+			  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+	assigned-clock-rates = <19200000>, <200000000>;
+
+	power-domains = <&gcc USB30_PRIM_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+
+	resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+	interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
+			<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
+	interconnect-names = "usb-ddr", "apps-usb";
+
+	phys = <&usb_0_hsphy>, <&usb_0_qmpphy>;
+	phy-names = "usb2-phy", "usb3-phy";
+};
+
+&usb_1 {
+	clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
+		 <&gcc GCC_USB30_SEC_MASTER_CLK>,
+		 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
+		 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
+		 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>;
+	clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi";
+
+	assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
+			  <&gcc GCC_USB30_SEC_MASTER_CLK>;
+	assigned-clock-rates = <19200000>, <200000000>;
+
+	power-domains = <&gcc USB30_SEC_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+
+	resets = <&gcc GCC_USB30_SEC_BCR>;
+
+	interconnects = <&aggre1_noc MASTER_USB3_1 0 &mc_virt SLAVE_EBI1 0>,
+			<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_1 0>;
+	interconnect-names = "usb-ddr", "apps-usb";
+
+	phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
+	phy-names = "usb2-phy", "usb3-phy";
+};
+
+&usb_2 {
+	clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
+		 <&gcc GCC_USB20_MASTER_CLK>,
+		 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
+		 <&gcc GCC_USB20_SLEEP_CLK>,
+		 <&gcc GCC_USB20_MOCK_UTMI_CLK>;
+	clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi";
+
+	assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+			  <&gcc GCC_USB20_MASTER_CLK>;
+	assigned-clock-rates = <19200000>, <200000000>;
+
+	power-domains = <&gcc USB20_PRIM_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+
+	resets = <&gcc GCC_USB20_PRIM_BCR>;
+
+	interconnects = <&aggre1_noc MASTER_USB2 0 &mc_virt SLAVE_EBI1 0>,
+			<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB2 0>;
+	interconnect-names = "usb-ddr", "apps-usb";
+
+	phys = <&usb_2_hsphy>;
+	phy-names = "usb2-phy";
+};
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 7547042d8e85..821c86409c5d 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4,23 +4,11 @@
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
-#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
-#include <dt-bindings/clock/qcom,rpmh.h>
-#include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
-#include <dt-bindings/clock/qcom,sa8775p-gcc.h>
-#include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
-#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
-#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
-#include <dt-bindings/interconnect/qcom,osm-l3.h>
-#include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/firmware/qcom,scm.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
-#include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -29,18 +17,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	clocks {
-		xo_board_clk: xo-board-clk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-		};
-
-		sleep_clk: sleep-clk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-		};
-	};
-
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -57,11 +33,6 @@ cpu0: cpu@0 {
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
-			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
-					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 			l2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -87,11 +58,6 @@ cpu1: cpu@100 {
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
-			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
-					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 			l2_1: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -112,11 +78,6 @@ cpu2: cpu@200 {
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
-			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
-					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 			l2_2: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -137,11 +98,6 @@ cpu3: cpu@300 {
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
-			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
-					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 			l2_3: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -162,11 +118,6 @@ cpu4: cpu@10000 {
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
-			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
-					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 			l2_4: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -193,11 +144,6 @@ cpu5: cpu@10100 {
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
-			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
-					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 			l2_5: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -218,11 +164,6 @@ cpu6: cpu@10200 {
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
-			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
-					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 			l2_6: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -243,11 +184,6 @@ cpu7: cpu@10300 {
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
-			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
-					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 			l2_7: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -327,176 +263,6 @@ cluster_sleep_apss_rsc_pc: cluster-sleep-1 {
 		};
 	};
 
-	cpu0_opp_table: opp-table-cpu0 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-1267200000 {
-			opp-hz = /bits/ 64 <1267200000>;
-			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
-		};
-
-		opp-1363200000 {
-			opp-hz = /bits/ 64 <1363200000>;
-			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
-		};
-
-		opp-1459200000 {
-			opp-hz = /bits/ 64 <1459200000>;
-			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
-		};
-
-		opp-1536000000 {
-			opp-hz = /bits/ 64 <1536000000>;
-			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
-		};
-
-		opp-1632000000 {
-			opp-hz = /bits/ 64 <1632000000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-1708800000 {
-			opp-hz = /bits/ 64 <1708800000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-1785600000 {
-			opp-hz = /bits/ 64 <1785600000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-1862400000 {
-			opp-hz = /bits/ 64 <1862400000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-1939200000 {
-			opp-hz = /bits/ 64 <1939200000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-2016000000 {
-			opp-hz = /bits/ 64 <2016000000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-2112000000 {
-			opp-hz = /bits/ 64 <2112000000>;
-			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
-		};
-
-		opp-2188800000 {
-			opp-hz = /bits/ 64 <2188800000>;
-			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
-		};
-
-		opp-2265600000 {
-			opp-hz = /bits/ 64 <2265600000>;
-			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
-		};
-
-		opp-2361600000 {
-			opp-hz = /bits/ 64 <2361600000>;
-			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
-		};
-
-		opp-2457600000 {
-			opp-hz = /bits/ 64 <2457600000>;
-			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
-		};
-
-		opp-2553600000 {
-			opp-hz = /bits/ 64 <2553600000>;
-			opp-peak-kBps = <(3196800 * 4) (1708800 * 32)>;
-		};
-	};
-
-	cpu4_opp_table: opp-table-cpu4 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-1267200000 {
-			opp-hz = /bits/ 64 <1267200000>;
-			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
-		};
-
-		opp-1363200000 {
-			opp-hz = /bits/ 64 <1363200000>;
-			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
-		};
-
-		opp-1459200000 {
-			opp-hz = /bits/ 64 <1459200000>;
-			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
-		};
-
-		opp-1536000000 {
-			opp-hz = /bits/ 64 <1536000000>;
-			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
-		};
-
-		opp-1632000000 {
-			opp-hz = /bits/ 64 <1632000000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-1708800000 {
-			opp-hz = /bits/ 64 <1708800000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-1785600000 {
-			opp-hz = /bits/ 64 <1785600000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-1862400000 {
-			opp-hz = /bits/ 64 <1862400000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-1939200000 {
-			opp-hz = /bits/ 64 <1939200000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-2016000000 {
-			opp-hz = /bits/ 64 <2016000000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-2112000000 {
-			opp-hz = /bits/ 64 <2112000000>;
-			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
-		};
-
-		opp-2188800000 {
-			opp-hz = /bits/ 64 <2188800000>;
-			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
-		};
-
-		opp-2265600000 {
-			opp-hz = /bits/ 64 <2265600000>;
-			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
-		};
-
-		opp-2361600000 {
-			opp-hz = /bits/ 64 <2361600000>;
-			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
-		};
-
-		opp-2457600000 {
-			opp-hz = /bits/ 64 <2457600000>;
-			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
-		};
-
-		opp-2553600000 {
-			opp-hz = /bits/ 64 <2553600000>;
-			opp-peak-kBps = <(3196800 * 4) (1708800 * 32)>;
-		};
-	};
-
 	dummy-sink {
 		compatible = "arm,coresight-dummy-sink";
 
@@ -518,33 +284,12 @@ scm {
 		};
 	};
 
-	clk_virt: interconnect-clk-virt {
-		compatible = "qcom,sa8775p-clk-virt";
-		#interconnect-cells = <2>;
-		qcom,bcm-voters = <&apps_bcm_voter>;
-	};
-
-	mc_virt: interconnect-mc-virt {
-		compatible = "qcom,sa8775p-mc-virt";
-		#interconnect-cells = <2>;
-		qcom,bcm-voters = <&apps_bcm_voter>;
-	};
-
 	/* Will be updated by the bootloader. */
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
-	qup_opp_table_100mhz: opp-table-qup100mhz {
-		compatible = "operating-points-v2";
-
-		opp-100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-			required-opps = <&rpmhpd_opp_svs_l1>;
-		};
-	};
-
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
@@ -985,30 +730,6 @@ soc: soc@0 {
 		#size-cells = <2>;
 		ranges = <0 0 0 0 0x10 0>;
 
-		gcc: clock-controller@100000 {
-			compatible = "qcom,sa8775p-gcc";
-			reg = <0x0 0x00100000 0x0 0xc7018>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&sleep_clk>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <&usb_0_qmpphy>,
-				 <&usb_1_qmpphy>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <&pcie0_phy>,
-				 <&pcie1_phy>,
-				 <0>,
-				 <0>,
-				 <0>;
-			power-domains = <&rpmhpd SA8775P_CX>;
-		};
-
 		ipcc: mailbox@408000 {
 			compatible = "qcom,sa8775p-ipcc", "qcom,ipcc";
 			reg = <0x0 0x00408000 0x0 0x1000>;
@@ -1056,9 +777,6 @@ qupv3_id_2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x008c0000 0x0 0x6000>;
 			ranges;
-			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
-				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
-			clock-names = "m-ahb", "s-ahb";
 			iommus = <&apps_smmu 0x5a3 0x0>;
 			#address-cells = <2>;
 			#size-cells = <2>;
@@ -1070,20 +788,6 @@ i2c14: i2c@880000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c14_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1097,20 +801,6 @@ spi14: spi@880000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi14_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1122,16 +812,6 @@ uart14: serial@880000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00880000 0x0 0x4000>;
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart14_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1141,20 +821,6 @@ i2c15: i2c@884000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c15_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1168,20 +834,6 @@ spi15: spi@884000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi15_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1193,16 +845,6 @@ uart15: serial@884000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00884000 0x0 0x4000>;
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart15_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1212,20 +854,6 @@ i2c16: i2c@888000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c16_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1237,20 +865,6 @@ spi16: spi@888000 {
 				compatible = "qcom,geni-spi";
 				reg = <0x0 0x00888000 0x0 0x4000>;
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi16_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1264,16 +878,6 @@ uart16: serial@888000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00888000 0x0 0x4000>;
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart16_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1283,20 +887,6 @@ i2c17: i2c@88c000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c17_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1310,20 +900,6 @@ spi17: spi@88c000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi17_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1335,16 +911,6 @@ uart17: serial@88c000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x0088c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart17_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1352,20 +918,6 @@ i2c18: i2c@890000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x00890000 0x0 0x4000>;
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c18_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1381,20 +933,6 @@ spi18: spi@890000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi18_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1406,16 +944,6 @@ uart18: serial@890000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00890000 0x0 0x4000>;
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart18_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1425,20 +953,6 @@ i2c19: i2c@894000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c19_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1452,20 +966,6 @@ spi19: spi@894000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi19_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1477,16 +977,6 @@ uart19: serial@894000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00894000 0x0 0x4000>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart19_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1496,20 +986,6 @@ i2c20: i2c@898000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c20_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1523,20 +999,6 @@ spi20: spi@898000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi20_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1548,16 +1010,6 @@ uart20: serial@898000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00898000 0x0 0x4000>;
 				interrupts = <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart20_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1591,9 +1043,6 @@ qupv3_id_0: geniqup@9c0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
-			clock-names = "m-ahb", "s-ahb";
-			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
-				<&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
 			iommus = <&apps_smmu 0x403 0x0>;
 			status = "disabled";
 
@@ -1603,20 +1052,6 @@ i2c0: i2c@980000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c0_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1630,20 +1065,6 @@ spi0: spi@980000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi0_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
 				     <&gpi_dma0 1 0 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1655,16 +1076,6 @@ uart0: serial@980000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x980000 0x0 0x4000>;
 				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart0_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1674,20 +1085,6 @@ i2c1: i2c@984000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c1_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1701,20 +1098,6 @@ spi1: spi@984000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi1_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
 				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1726,16 +1109,6 @@ uart1: serial@984000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x984000 0x0 0x4000>;
 				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart1_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1745,20 +1118,6 @@ i2c2: i2c@988000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c2_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1772,20 +1131,6 @@ spi2: spi@988000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi2_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
 				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1797,16 +1142,6 @@ uart2: serial@988000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x988000 0x0 0x4000>;
 				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart2_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1816,20 +1151,6 @@ i2c3: i2c@98c000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c3_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1843,20 +1164,6 @@ spi3: spi@98c000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi3_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
 				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1868,16 +1175,6 @@ uart3: serial@98c000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x98c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart3_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1887,20 +1184,6 @@ i2c4: i2c@990000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c4_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1914,20 +1197,6 @@ spi4: spi@990000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi4_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
 				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1939,16 +1208,6 @@ uart4: serial@990000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x990000 0x0 0x4000>;
 				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart4_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1958,20 +1217,6 @@ i2c5: i2c@994000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c5_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1985,20 +1230,6 @@ spi5: spi@994000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi5_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
 				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -2010,16 +1241,6 @@ uart5: serial@994000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x994000 0x0 0x4000>;
 				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart5_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 		};
@@ -2052,9 +1273,6 @@ qupv3_id_1: geniqup@ac0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
-			clock-names = "m-ahb", "s-ahb";
-			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
-				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
 			iommus = <&apps_smmu 0x443 0x0>;
 			status = "disabled";
 
@@ -2064,20 +1282,6 @@ i2c7: i2c@a80000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c7_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -2091,20 +1295,6 @@ spi7: spi@a80000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi7_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -2116,17 +1306,6 @@ uart7: serial@a80000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00a80000 0x0 0x4000>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
-				clock-names = "se";
-				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
-				pinctrl-0 = <&qup_uart7_default>;
-				pinctrl-names = "default";
-				interconnect-names = "qup-core", "qup-config";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
-				power-domains = <&rpmhpd SA8775P_CX>;
-				operating-points-v2 = <&qup_opp_table_100mhz>;
 				status = "disabled";
 			};
 
@@ -2136,20 +1315,6 @@ i2c8: i2c@a84000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c8_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -2163,20 +1328,6 @@ spi8: spi@a84000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi8_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -2188,17 +1339,6 @@ uart8: serial@a84000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00a84000 0x0 0x4000>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
-				clock-names = "se";
-				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
-				pinctrl-0 = <&qup_uart8_default>;
-				pinctrl-names = "default";
-				interconnect-names = "qup-core", "qup-config";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
-				power-domains = <&rpmhpd SA8775P_CX>;
-				operating-points-v2 = <&qup_opp_table_100mhz>;
 				status = "disabled";
 			};
 
@@ -2208,20 +1348,6 @@ i2c9: i2c@a88000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c9_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -2235,20 +1361,6 @@ spi9: spi@a88000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi9_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -2260,16 +1372,6 @@ uart9: serial@a88000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0xa88000 0x0 0x4000>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart9_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -2279,20 +1381,6 @@ i2c10: i2c@a8c000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c10_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -2306,20 +1394,6 @@ spi10: spi@a8c000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi10_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -2331,17 +1405,6 @@ uart10: serial@a8c000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00a8c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
-				clock-names = "se";
-				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
-				pinctrl-0 = <&qup_uart10_default>;
-				pinctrl-names = "default";
-				interconnect-names = "qup-core", "qup-config";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 0
-						 &clk_virt SLAVE_QUP_CORE_1 0>,
-						<&gem_noc MASTER_APPSS_PROC 0
-						 &config_noc SLAVE_QUP_1 0>;
-				power-domains = <&rpmhpd SA8775P_CX>;
-				operating-points-v2 = <&qup_opp_table_100mhz>;
 				status = "disabled";
 			};
 
@@ -2351,20 +1414,6 @@ i2c11: i2c@a90000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c11_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -2378,20 +1427,6 @@ spi11: spi@a90000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi11_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -2403,17 +1438,6 @@ uart11: serial@a90000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00a90000 0x0 0x4000>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
-				clock-names = "se";
-				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
-				pinctrl-0 = <&qup_uart11_default>;
-				pinctrl-names = "default";
-				interconnect-names = "qup-core", "qup-config";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
-				power-domains = <&rpmhpd SA8775P_CX>;
-				operating-points-v2 = <&qup_opp_table_100mhz>;
 				status = "disabled";
 			};
 
@@ -2423,20 +1447,6 @@ i2c12: i2c@a94000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c12_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -2450,20 +1460,6 @@ spi12: spi@a94000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi12_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -2475,16 +1471,6 @@ uart12: serial@a94000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00a94000 0x0 0x4000>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart12_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -2494,20 +1480,6 @@ i2c13: i2c@a98000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c13_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -2537,9 +1509,6 @@ qupv3_id_3: geniqup@bc0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
-			clock-names = "m-ahb", "s-ahb";
-			clocks = <&gcc GCC_QUPV3_WRAP_3_M_AHB_CLK>,
-				<&gcc GCC_QUPV3_WRAP_3_S_AHB_CLK>;
 			iommus = <&apps_smmu 0x43 0x0>;
 			status = "disabled";
 
@@ -2549,20 +1518,6 @@ i2c21: i2c@b80000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c21_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
-						&clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
-					   <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						&config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
-					   <&aggre1_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
-						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-							 "qup-config",
-							 "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma3 0 0 QCOM_GPI_I2C>,
 				       <&gpi_dma3 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -2576,20 +1531,6 @@ spi21: spi@b80000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi21_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
-						&clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
-					   <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						&config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
-					   <&aggre1_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
-						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-							 "qup-config",
-							 "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma3 0 0 QCOM_GPI_SPI>,
 				       <&gpi_dma3 1 0 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -2601,17 +1542,6 @@ uart21: serial@b80000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00b80000 0x0 0x4000>;
 				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
-				clock-names = "se";
-				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
-				interconnect-names = "qup-core", "qup-config";
-				pinctrl-0 = <&qup_uart21_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>;
-				power-domains = <&rpmhpd SA8775P_CX>;
-				operating-points-v2 = <&qup_opp_table_100mhz>;
 				status = "disabled";
 			};
 		};
@@ -2621,62 +1551,6 @@ rng: rng@10d2000 {
 			reg = <0 0x010d2000 0 0x1000>;
 		};
 
-		config_noc: interconnect@14c0000 {
-			compatible = "qcom,sa8775p-config-noc";
-			reg = <0x0 0x014c0000 0x0 0x13080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
-		system_noc: interconnect@1680000 {
-			compatible = "qcom,sa8775p-system-noc";
-			reg = <0x0 0x01680000 0x0 0x15080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
-		aggre1_noc: interconnect@16c0000 {
-			compatible = "qcom,sa8775p-aggre1-noc";
-			reg = <0x0 0x016c0000 0x0 0x18080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
-				 <&gcc GCC_AGGRE_NOC_QUPV3_AXI_CLK>,
-				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
-				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
-				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>;
-		};
-
-		aggre2_noc: interconnect@1700000 {
-			compatible = "qcom,sa8775p-aggre2-noc";
-			reg = <0x0 0x01700000 0x0 0x1b080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			clocks = <&gcc GCC_AGGRE_UFS_CARD_AXI_CLK>,
-				 <&rpmhcc RPMH_IPA_CLK>;
-		};
-
-		pcie_anoc: interconnect@1760000 {
-			compatible = "qcom,sa8775p-pcie-anoc";
-			reg = <0x0 0x01760000 0x0 0xc080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
-		gpdsp_anoc: interconnect@1780000 {
-			compatible = "qcom,sa8775p-gpdsp-anoc";
-			reg = <0x0 0x01780000 0x0 0xe080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
-		mmss_noc: interconnect@17a0000 {
-			compatible = "qcom,sa8775p-mmss-noc";
-			reg = <0x0 0x017a0000 0x0 0x40000>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
 		pcie0: pcie@1c00000 {
 			compatible = "qcom,pcie-sa8775p";
 			reg = <0x0 0x01c00000 0x0 0x3000>,
@@ -2696,7 +1570,6 @@ pcie0: pcie@1c00000 {
 
 			dma-coherent;
 
-			linux,pci-domain = <0>;
 			num-lanes = <2>;
 
 			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
@@ -2724,35 +1597,9 @@ pcie0: pcie@1c00000 {
 					<0 0 0 3 &intc GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
 					<0 0 0 4 &intc GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
 
-			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
-				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
-				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
-				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
-
-			clock-names = "aux",
-				      "cfg",
-				      "bus_master",
-				      "bus_slave",
-				      "slave_q2a";
-
-			assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
-			assigned-clock-rates = <19200000>;
-
-			interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
-			interconnect-names = "pcie-mem", "cpu-pcie";
-
 			iommu-map = <0x0 &pcie_smmu 0x0000 0x0 0x1>,
 				    <0x100 &pcie_smmu 0x0001 0x0 0x1>;
 
-			resets = <&gcc GCC_PCIE_0_BCR>,
-				 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
-			reset-names = "pci",
-				      "link_down";
-
-			power-domains = <&gcc PCIE_0_GDSC>;
-
 			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
 			eq-presets-16gts = /bits/ 8 <0x55 0x55>;
 
@@ -2764,8 +1611,6 @@ pcieport0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
-				phys = <&pcie0_phy>;
-
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2783,69 +1628,15 @@ pcie0_ep: pcie-ep@1c00000 {
 			      <0x0 0x40005000 0x0 0x2000>;
 			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
 				    "mmio", "dma";
-
-			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
-				<&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-				<&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
-				<&gcc GCC_PCIE_0_SLV_AXI_CLK>,
-				<&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
-
-			clock-names = "aux",
-				      "cfg",
-				      "bus_master",
-				      "bus_slave",
-				      "slave_q2a";
-
 			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH>;
 
 			interrupt-names = "global", "doorbell", "dma";
 
-			interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
-			interconnect-names = "pcie-mem", "cpu-pcie";
-
 			dma-coherent;
 			iommus = <&pcie_smmu 0x0000 0x7f>;
-			resets = <&gcc GCC_PCIE_0_BCR>;
-			reset-names = "core";
-			power-domains = <&gcc PCIE_0_GDSC>;
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
 			num-lanes = <2>;
-			linux,pci-domain = <0>;
-
-			status = "disabled";
-		};
-
-		pcie0_phy: phy@1c04000 {
-			compatible = "qcom,sa8775p-qmp-gen4x2-pcie-phy";
-			reg = <0x0 0x1c04000 0x0 0x2000>;
-
-			clocks = <&gcc GCC_PCIE_0_PHY_AUX_CLK>,
-				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-				 <&gcc GCC_PCIE_CLKREF_EN>,
-				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
-				 <&gcc GCC_PCIE_0_PIPE_CLK>,
-				 <&gcc GCC_PCIE_0_PIPEDIV2_CLK>;
-			clock-names = "aux",
-				      "cfg_ahb",
-				      "ref",
-				      "rchng",
-				      "pipe",
-				      "pipediv2";
-
-			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
-			assigned-clock-rates = <100000000>;
-
-			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
-			reset-names = "phy";
-
-			#clock-cells = <0>;
-			clock-output-names = "pcie_0_pipe_clk";
-
-			#phy-cells = <0>;
 
 			status = "disabled";
 		};
@@ -2869,7 +1660,6 @@ pcie1: pcie@1c10000 {
 
 			dma-coherent;
 
-			linux,pci-domain = <1>;
 			num-lanes = <4>;
 
 			interrupts = <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
@@ -2897,35 +1687,9 @@ pcie1: pcie@1c10000 {
 					<0 0 0 3 &intc GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
 					<0 0 0 4 &intc GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
 
-			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
-				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
-				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
-				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
-
-			clock-names = "aux",
-				      "cfg",
-				      "bus_master",
-				      "bus_slave",
-				      "slave_q2a";
-
-			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
-			assigned-clock-rates = <19200000>;
-
-			interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
-			interconnect-names = "pcie-mem", "cpu-pcie";
-
 			iommu-map = <0x0 &pcie_smmu 0x0080 0x0 0x1>,
 				    <0x100 &pcie_smmu 0x0081 0x0 0x1>;
 
-			resets = <&gcc GCC_PCIE_1_BCR>,
-				 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
-			reset-names = "pci",
-				      "link_down";
-
-			power-domains = <&gcc PCIE_1_GDSC>;
-
 			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
 			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
 
@@ -2936,8 +1700,6 @@ pcie1_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
-				phys = <&pcie1_phy>;
-
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2956,68 +1718,15 @@ pcie1_ep: pcie-ep@1c10000 {
 			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
 				    "mmio", "dma";
 
-			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
-				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
-				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
-				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
-
-			clock-names = "aux",
-				      "cfg",
-				      "bus_master",
-				      "bus_slave",
-				      "slave_q2a";
-
 			interrupts = <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
 
 			interrupt-names = "global", "doorbell", "dma";
 
-			interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
-			interconnect-names = "pcie-mem", "cpu-pcie";
-
 			dma-coherent;
 			iommus = <&pcie_smmu 0x80 0x7f>;
-			resets = <&gcc GCC_PCIE_1_BCR>;
-			reset-names = "core";
-			power-domains = <&gcc PCIE_1_GDSC>;
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
 			num-lanes = <4>;
-			linux,pci-domain = <1>;
-
-			status = "disabled";
-		};
-
-		pcie1_phy: phy@1c14000 {
-			compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy";
-			reg = <0x0 0x1c14000 0x0 0x4000>;
-
-			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
-				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-				 <&gcc GCC_PCIE_CLKREF_EN>,
-				 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
-				 <&gcc GCC_PCIE_1_PIPE_CLK>,
-				 <&gcc GCC_PCIE_1_PIPEDIV2_CLK>;
-			clock-names = "aux",
-				      "cfg_ahb",
-				      "ref",
-				      "rchng",
-				      "pipe",
-				      "pipediv2";
-
-			assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
-			assigned-clock-rates = <100000000>;
-
-			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
-			reset-names = "phy";
-
-			#clock-cells = <0>;
-			clock-output-names = "pcie_1_pipe_clk";
-
-			#phy-cells = <0>;
 
 			status = "disabled";
 		};
@@ -3026,73 +1735,12 @@ ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sa8775p-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x0 0x01d84000 0x0 0x3000>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy>;
-			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
-			#reset-cells = <1>;
-			resets = <&gcc GCC_UFS_PHY_BCR>;
-			reset-names = "rst";
-			power-domains = <&gcc UFS_PHY_GDSC>;
-			required-opps = <&rpmhpd_opp_nom>;
 			iommus = <&apps_smmu 0x100 0x0>;
 			dma-coherent;
-			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
-				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
-				 <&gcc GCC_UFS_PHY_AHB_CLK>,
-				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
-				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
-				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
-			clock-names = "core_clk",
-				      "bus_aggr_clk",
-				      "iface_clk",
-				      "core_clk_unipro",
-				      "ref_clk",
-				      "tx_lane0_sync_clk",
-				      "rx_lane0_sync_clk",
-				      "rx_lane1_sync_clk";
-			freq-table-hz = <75000000 300000000>,
-					<0 0>,
-					<0 0>,
-					<75000000 300000000>,
-					<0 0>,
-					<0 0>,
-					<0 0>,
-					<0 0>;
-			qcom,ice = <&ice>;
 			status = "disabled";
 		};
 
-		ufs_mem_phy: phy@1d87000 {
-			compatible = "qcom,sa8775p-qmp-ufs-phy";
-			reg = <0x0 0x01d87000 0x0 0xe10>;
-			/*
-			 * Yes, GCC_EDP_REF_CLKREF_EN is correct in qref. It
-			 * enables the CXO clock to eDP *and* UFS PHY.
-			 */
-			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
-				 <&gcc GCC_EDP_REF_CLKREF_EN>;
-			clock-names = "ref", "ref_aux", "qref";
-			power-domains = <&gcc UFS_PHY_GDSC>;
-			resets = <&ufs_mem_hc 0>;
-			reset-names = "ufsphy";
-			#phy-cells = <0>;
-			status = "disabled";
-		};
-
-		ice: crypto@1d88000 {
-			compatible = "qcom,sa8775p-inline-crypto-engine",
-				     "qcom,inline-crypto-engine";
-			reg = <0x0 0x01d88000 0x0 0x18000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
-				 <&gcc GCC_UFS_PHY_AHB_CLK>;
-			clock-names = "core",
-				      "iface";
-			power-domains = <&gcc UFS_PHY_GDSC>;
-		};
-
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;
@@ -3113,16 +1761,6 @@ crypto: crypto@1dfa000 {
 			dma-names = "rx", "tx";
 			iommus = <&apps_smmu 0x480 0x0>,
 				 <&apps_smmu 0x481 0x0>;
-			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "memory";
-		};
-
-		lpass_ag_noc: interconnect@3c40000 {
-			compatible = "qcom,sa8775p-lpass-ag-noc";
-			reg = <0x0 0x03c40000 0x0 0x17200>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		ctcu@4001000 {
@@ -4305,171 +2943,19 @@ sdhc: mmc@87c4000 {
 			interrupt-names = "hc_irq",
 					  "pwr_irq";
 
-			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
-				 <&gcc GCC_SDCC1_APPS_CLK>;
-			clock-names = "iface",
-				      "core";
-
-			interconnects = <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &config_noc SLAVE_SDC1 QCOM_ICC_TAG_ACTIVE_ONLY>;
-			interconnect-names = "sdhc-ddr",
-					     "cpu-sdhc";
-
 			iommus = <&apps_smmu 0x0 0x0>;
 			dma-coherent;
 
-			operating-points-v2 = <&sdhc_opp_table>;
-			power-domains = <&rpmhpd SA8775P_CX>;
-			resets = <&gcc GCC_SDCC1_BCR>;
-
 			qcom,dll-config = <0x0007642c>;
 			qcom,ddr-config = <0x80040868>;
 
 			status = "disabled";
-
-			sdhc_opp_table: opp-table {
-				compatible = "operating-points-v2";
-
-				opp-100000000 {
-					opp-hz = /bits/ 64 <100000000>;
-					required-opps = <&rpmhpd_opp_low_svs>;
-					opp-peak-kBps = <1800000 400000>;
-					opp-avg-kBps = <100000 0>;
-				};
-
-				opp-384000000 {
-					opp-hz = /bits/ 64 <384000000>;
-					required-opps = <&rpmhpd_opp_nom>;
-					opp-peak-kBps = <5400000 1600000>;
-					opp-avg-kBps = <390000 0>;
-				};
-			};
-		};
-
-		usb_0_hsphy: phy@88e4000 {
-			compatible = "qcom,sa8775p-usb-hs-phy",
-				     "qcom,usb-snps-hs-5nm-phy";
-			reg = <0 0x088e4000 0 0x120>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "ref";
-			resets = <&gcc GCC_USB2_PHY_PRIM_BCR>;
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
-		usb_1_hsphy: phy@88e6000 {
-			compatible = "qcom,sa8775p-usb-hs-phy",
-				     "qcom,usb-snps-hs-5nm-phy";
-			reg = <0 0x088e6000 0 0x120>;
-			clocks = <&gcc GCC_USB_CLKREF_EN>;
-			clock-names = "ref";
-			resets = <&gcc GCC_USB2_PHY_SEC_BCR>;
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
-		usb_2_hsphy: phy@88e7000 {
-			compatible = "qcom,sa8775p-usb-hs-phy",
-				     "qcom,usb-snps-hs-5nm-phy";
-			reg = <0 0x088e7000 0 0x120>;
-			clocks = <&gcc GCC_USB_CLKREF_EN>;
-			clock-names = "ref";
-			resets = <&gcc GCC_USB3_PHY_TERT_BCR>;
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
-		usb_0_qmpphy: phy@88e8000 {
-			compatible = "qcom,sa8775p-qmp-usb3-uni-phy";
-			reg = <0 0x088e8000 0 0x2000>;
-
-			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
-				 <&gcc GCC_USB_CLKREF_EN>,
-				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
-			clock-names = "aux", "ref", "com_aux", "pipe";
-
-			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
-				 <&gcc GCC_USB3PHY_PHY_PRIM_BCR>;
-			reset-names = "phy", "phy_phy";
-
-			power-domains = <&gcc USB30_PRIM_GDSC>;
-
-			#clock-cells = <0>;
-			clock-output-names = "usb3_prim_phy_pipe_clk_src";
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
-		usb_1_qmpphy: phy@88ea000 {
-			compatible = "qcom,sa8775p-qmp-usb3-uni-phy";
-			reg = <0 0x088ea000 0 0x2000>;
-
-			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
-				 <&gcc GCC_USB_CLKREF_EN>,
-				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
-			clock-names = "aux", "ref", "com_aux", "pipe";
-
-			resets = <&gcc GCC_USB3_PHY_SEC_BCR>,
-				 <&gcc GCC_USB3PHY_PHY_SEC_BCR>;
-			reset-names = "phy", "phy_phy";
-
-			power-domains = <&gcc USB30_SEC_GDSC>;
-
-			#clock-cells = <0>;
-			clock-output-names = "usb3_sec_phy_pipe_clk_src";
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
-		refgen: regulator@891c000 {
-			compatible = "qcom,sa8775p-refgen-regulator",
-				     "qcom,sm8250-refgen-regulator";
-			reg = <0x0 0x0891c000 0x0 0x84>;
-		};
-
-		dc_noc: interconnect@90e0000 {
-			compatible = "qcom,sa8775p-dc-noc";
-			reg = <0x0 0x090e0000 0x0 0x5080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
-		gem_noc: interconnect@9100000 {
-			compatible = "qcom,sa8775p-gem-noc";
-			reg = <0x0 0x09100000 0x0 0xf6080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		usb_0: usb@a600000 {
 			compatible = "qcom,sa8775p-dwc3", "qcom,snps-dwc3";
 			reg = <0 0x0a600000 0 0xfc100>;
 
-			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
-				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
-				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
-				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
-				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
-			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi";
-
-			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
-					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
-			assigned-clock-rates = <19200000>, <200000000>;
-
 			interrupts-extended = <&intc GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
@@ -4483,20 +2969,9 @@ usb_0: usb@a600000 {
 					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
 
-			power-domains = <&gcc USB30_PRIM_GDSC>;
-			required-opps = <&rpmhpd_opp_nom>;
-
-			resets = <&gcc GCC_USB30_PRIM_BCR>;
-
-			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
-			interconnect-names = "usb-ddr", "apps-usb";
-
 			wakeup-source;
 
 			iommus = <&apps_smmu 0x080 0x0>;
-			phys = <&usb_0_hsphy>, <&usb_0_qmpphy>;
-			phy-names = "usb2-phy", "usb3-phy";
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
@@ -4527,17 +3002,6 @@ usb_1: usb@a800000 {
 			compatible = "qcom,sa8775p-dwc3", "qcom,snps-dwc3";
 			reg = <0 0x0a800000 0 0xfc100>;
 
-			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
-				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
-				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
-				 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
-				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>;
-			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi";
-
-			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
-					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
-			assigned-clock-rates = <19200000>, <200000000>;
-
 			interrupts-extended = <&intc GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
@@ -4551,20 +3015,9 @@ usb_1: usb@a800000 {
 					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
 
-			power-domains = <&gcc USB30_SEC_GDSC>;
-			required-opps = <&rpmhpd_opp_nom>;
-
-			resets = <&gcc GCC_USB30_SEC_BCR>;
-
-			interconnects = <&aggre1_noc MASTER_USB3_1 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_1 0>;
-			interconnect-names = "usb-ddr", "apps-usb";
-
 			wakeup-source;
 
 			iommus = <&apps_smmu 0x0a0 0x0>;
-			phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
-			phy-names = "usb2-phy", "usb3-phy";
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
@@ -4575,17 +3028,6 @@ usb_2: usb@a400000 {
 			compatible = "qcom,sa8775p-dwc3", "qcom,snps-dwc3";
 			reg = <0 0x0a400000 0 0xfc100>;
 
-			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
-				 <&gcc GCC_USB20_MASTER_CLK>,
-				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
-				 <&gcc GCC_USB20_SLEEP_CLK>,
-				 <&gcc GCC_USB20_MOCK_UTMI_CLK>;
-			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi";
-
-			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
-					  <&gcc GCC_USB20_MASTER_CLK>;
-			assigned-clock-rates = <19200000>, <200000000>;
-
 			interrupts-extended = <&intc GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
@@ -4597,21 +3039,10 @@ usb_2: usb@a400000 {
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq";
 
-			power-domains = <&gcc USB20_PRIM_GDSC>;
-			required-opps = <&rpmhpd_opp_nom>;
-
-			resets = <&gcc GCC_USB20_PRIM_BCR>;
-
-			interconnects = <&aggre1_noc MASTER_USB2 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB2 0>;
-			interconnect-names = "usb-ddr", "apps-usb";
-
 			qcom,select-utmi-as-pipe-clk;
 			wakeup-source;
 
 			iommus = <&apps_smmu 0x020 0x0>;
-			phys = <&usb_2_hsphy>;
-			phy-names = "usb2-phy";
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
@@ -4647,11 +3078,7 @@ gpu: gpu@3d00000 {
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
 			iommus = <&adreno_smmu 0 0xc00>,
 				 <&adreno_smmu 1 0xc00>;
-			operating-points-v2 = <&gpu_opp_table>;
 			qcom,gmu = <&gmu>;
-			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "gfx-mem";
 			#cooling-cells = <2>;
 
 			nvmem-cells = <&gpu_speed_bin>;
@@ -4662,49 +3089,9 @@ gpu: gpu@3d00000 {
 			gpu_zap_shader: zap-shader {
 				memory-region = <&pil_gpu_mem>;
 			};
-
-			gpu_opp_table: opp-table {
-				compatible = "operating-points-v2";
-
-				opp-405000000 {
-					opp-hz = /bits/ 64 <405000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
-					opp-peak-kBps = <5285156>;
-					opp-supported-hw = <0x3>;
-				};
-
-				opp-530000000 {
-					opp-hz = /bits/ 64 <530000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
-					opp-peak-kBps = <12484375>;
-					opp-supported-hw = <0x2>;
-				};
-
-				opp-676000000 {
-					opp-hz = /bits/ 64 <676000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
-					opp-peak-kBps = <8171875>;
-					opp-supported-hw = <0x1>;
-				};
-
-				opp-778000000 {
-					opp-hz = /bits/ 64 <778000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
-					opp-peak-kBps = <10687500>;
-					opp-supported-hw = <0x1>;
-				};
-
-				opp-800000000 {
-					opp-hz = /bits/ 64 <800000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
-					opp-peak-kBps = <12484375>;
-					opp-supported-hw = <0x1>;
-				};
-			};
 		};
 
 		gmu: gmu@3d6a000 {
-			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
 			reg = <0x0 0x03d6a000 0x0 0x34000>,
 			      <0x0 0x03de0000 0x0 0x10000>,
 			      <0x0 0x0b290000 0x0 0x10000>;
@@ -4712,49 +3099,7 @@ gmu: gmu@3d6a000 {
 			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hfi", "gmu";
-			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
-				 <&gpucc GPU_CC_CXO_CLK>,
-				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
-				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
-				 <&gpucc GPU_CC_AHB_CLK>,
-				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
-				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
-			clock-names = "gmu",
-				      "cxo",
-				      "axi",
-				      "memnoc",
-				      "ahb",
-				      "hub",
-				      "smmu_vote";
-			power-domains = <&gpucc GPU_CC_CX_GDSC>,
-					<&gpucc GPU_CC_GX_GDSC>;
-			power-domain-names = "cx",
-					     "gx";
 			iommus = <&adreno_smmu 5 0xc00>;
-			operating-points-v2 = <&gmu_opp_table>;
-
-			gmu_opp_table: opp-table {
-				compatible = "operating-points-v2";
-
-				opp-500000000 {
-					opp-hz = /bits/ 64 <500000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
-				};
-			};
-		};
-
-		gpucc: clock-controller@3d90000 {
-			compatible = "qcom,sa8775p-gpucc";
-			reg = <0x0 0x03d90000 0x0 0xa000>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
-				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
-			clock-names = "bi_tcxo",
-				      "gcc_gpu_gpll0_clk_src",
-				      "gcc_gpu_gpll0_div_clk_src";
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
 		};
 
 		adreno_smmu: iommu@3da0000 {
@@ -4764,21 +3109,6 @@ adreno_smmu: iommu@3da0000 {
 			#iommu-cells = <2>;
 			#global-interrupts = <2>;
 			dma-coherent;
-			power-domains = <&gpucc GPU_CC_CX_GDSC>;
-			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
-				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
-				 <&gpucc GPU_CC_AHB_CLK>,
-				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
-				 <&gpucc GPU_CC_CX_GMU_CLK>,
-				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
-				 <&gpucc GPU_CC_HUB_AON_CLK>;
-			clock-names = "gcc_gpu_memnoc_gfx_clk",
-				      "gcc_gpu_snoc_dvm_gfx_clk",
-				      "gpu_cc_ahb_clk",
-				      "gpu_cc_hlos1_vote_gpu_smmu_clk",
-				      "gpu_cc_cx_gmu_clk",
-				      "gpu_cc_hub_cx_int_clk",
-				      "gpu_cc_hub_aon_clk";
 			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
@@ -4793,30 +3123,9 @@ adreno_smmu: iommu@3da0000 {
 				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		serdes0: phy@8901000 {
-			compatible = "qcom,sa8775p-dwmac-sgmii-phy";
-			reg = <0x0 0x08901000 0x0 0xe10>;
-			clocks = <&gcc GCC_SGMI_CLKREF_EN>;
-			clock-names = "sgmi_ref";
-			#phy-cells = <0>;
-			status = "disabled";
-		};
-
-		serdes1: phy@8902000 {
-			compatible = "qcom,sa8775p-dwmac-sgmii-phy";
-			reg = <0x0 0x08902000 0x0 0xe10>;
-			clocks = <&gcc GCC_SGMI_CLKREF_EN>;
-			clock-names = "sgmi_ref";
-			#phy-cells = <0>;
-			status = "disabled";
-		};
-
-		pmu@9091000 {
-			compatible = "qcom,sa8775p-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
+		llcc_bwmon: pmu@9091000 {
 			reg = <0x0 0x9091000 0x0 0x1000>;
 			interrupts = <GIC_SPI 620 IRQ_TYPE_LEVEL_HIGH>;
-			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
 
 			operating-points-v2 = <&llcc_bwmon_opp_table>;
 
@@ -4865,12 +3174,9 @@ opp-9 {
 			};
 		};
 
-		pmu@90b5400 {
-			compatible = "qcom,sa8775p-cpu-bwmon", "qcom,sdm845-bwmon";
+		cpu_bwmon0: pmu@90b5400 {
 			reg = <0x0 0x90b5400 0x0 0x600>;
 			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
 
 			operating-points-v2 = <&cpu_bwmon_opp_table>;
 
@@ -4893,15 +3199,11 @@ opp-3 {
 					opp-peak-kBps = <16265000>;
 				};
 			};
-
 		};
 
-		pmu@90b6400 {
-			compatible = "qcom,sa8775p-cpu-bwmon", "qcom,sdm845-bwmon";
+		cpu_bwmon1: pmu@90b6400 {
 			reg = <0x0 0x90b6400 0x0 0x600>;
 			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
 
 			operating-points-v2 = <&cpu_bwmon_opp_table>;
 		};
@@ -4931,102 +3233,20 @@ iris: video-codec@aa00000 {
 			reg = <0x0 0x0aa00000 0x0 0xf0000>;
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 
-			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
-					<&videocc VIDEO_CC_MVS0_GDSC>,
-					<&rpmhpd SA8775P_MX>,
-					<&rpmhpd SA8775P_MMCX>;
-			power-domain-names = "venus",
-					     "vcodec0",
-					     "mxc",
-					     "mmcx";
-			operating-points-v2 = <&iris_opp_table>;
-
-			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
-				 <&videocc VIDEO_CC_MVS0C_CLK>,
-				 <&videocc VIDEO_CC_MVS0_CLK>;
-			clock-names = "iface",
-				      "core",
-				      "vcodec0_core";
-
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "cpu-cfg",
-					     "video-mem";
-
 			memory-region = <&pil_video_mem>;
 
-			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
-			reset-names = "bus";
-
 			iommus = <&apps_smmu 0x0880 0x0400>,
 				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
 			status = "disabled";
-
-			iris_opp_table: opp-table {
-				compatible = "operating-points-v2";
-
-				opp-366000000 {
-					opp-hz = /bits/ 64 <366000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>,
-							<&rpmhpd_opp_svs_l1>;
-				};
-
-				opp-444000000 {
-					opp-hz = /bits/ 64 <444000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>,
-							<&rpmhpd_opp_nom>;
-				};
-
-				opp-533000000 {
-					opp-hz = /bits/ 64 <533000000>;
-					required-opps = <&rpmhpd_opp_nom>,
-							<&rpmhpd_opp_turbo>;
-				};
-
-				opp-560000000 {
-					opp-hz = /bits/ 64 <560000000>;
-					required-opps = <&rpmhpd_opp_nom>,
-							<&rpmhpd_opp_turbo_l1>;
-				};
-			};
-		};
-
-		videocc: clock-controller@abf0000 {
-			compatible = "qcom,sa8775p-videocc";
-			reg = <0x0 0x0abf0000 0x0 0x10000>;
-			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK_A>,
-				 <&sleep_clk>;
-			power-domains = <&rpmhpd SA8775P_MMCX>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
 		};
 
 		cci0: cci@ac13000 {
 			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
 			reg = <0x0 0x0ac13000 0x0 0x1000>;
-
 			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
 
-			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
-
-			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
-				 <&camcc CAM_CC_CPAS_AHB_CLK>,
-				 <&camcc CAM_CC_CCI_0_CLK>;
-			clock-names = "camnoc_axi",
-				      "cpas_ahb",
-				      "cci";
-
-			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
-			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
-			pinctrl-names = "default", "sleep";
-
 			#address-cells = <1>;
 			#size-cells = <0>;
 
@@ -5050,22 +3270,8 @@ cci0_i2c1: i2c-bus@1 {
 		cci1: cci@ac14000 {
 			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
 			reg = <0x0 0x0ac14000 0x0 0x1000>;
-
 			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
 
-			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
-
-			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
-				 <&camcc CAM_CC_CPAS_AHB_CLK>,
-				 <&camcc CAM_CC_CCI_1_CLK>;
-			clock-names = "camnoc_axi",
-				      "cpas_ahb",
-				      "cci";
-
-			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
-			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
-			pinctrl-names = "default", "sleep";
-
 			#address-cells = <1>;
 			#size-cells = <0>;
 
@@ -5089,22 +3295,8 @@ cci1_i2c1: i2c-bus@1 {
 		cci2: cci@ac15000 {
 			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
 			reg = <0x0 0x0ac15000 0x0 0x1000>;
-
 			interrupts = <GIC_SPI 651 IRQ_TYPE_EDGE_RISING>;
 
-			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
-
-			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
-				 <&camcc CAM_CC_CPAS_AHB_CLK>,
-				 <&camcc CAM_CC_CCI_2_CLK>;
-			clock-names = "camnoc_axi",
-				      "cpas_ahb",
-				      "cci";
-
-			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
-			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
-			pinctrl-names = "default", "sleep";
-
 			#address-cells = <1>;
 			#size-cells = <0>;
 
@@ -5128,22 +3320,8 @@ cci2_i2c1: i2c-bus@1 {
 		cci3: cci@ac16000 {
 			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
 			reg = <0x0 0x0ac16000 0x0 0x1000>;
-
 			interrupts = <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>;
 
-			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
-
-			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
-				 <&camcc CAM_CC_CPAS_AHB_CLK>,
-				 <&camcc CAM_CC_CCI_3_CLK>;
-			clock-names = "camnoc_axi",
-				      "cpas_ahb",
-				      "cci";
-
-			pinctrl-0 = <&cci3_0_default &cci3_1_default>;
-			pinctrl-1 = <&cci3_0_sleep &cci3_1_sleep>;
-			pinctrl-names = "default", "sleep";
-
 			#address-cells = <1>;
 			#size-cells = <0>;
 
@@ -5212,63 +3390,6 @@ camss: isp@ac78000 {
 				    "vfe_lite3",
 				    "vfe_lite4";
 
-			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
-				 <&camcc CAM_CC_CORE_AHB_CLK>,
-				 <&camcc CAM_CC_CPAS_AHB_CLK>,
-				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
-				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
-				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
-				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
-				 <&camcc CAM_CC_CSID_CLK>,
-				 <&camcc CAM_CC_CSIPHY0_CLK>,
-				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
-				 <&camcc CAM_CC_CSIPHY1_CLK>,
-				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
-				 <&camcc CAM_CC_CSIPHY2_CLK>,
-				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
-				 <&camcc CAM_CC_CSIPHY3_CLK>,
-				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
-				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
-				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
-				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
-				 <&camcc CAM_CC_ICP_AHB_CLK>,
-				 <&camcc CAM_CC_IFE_0_CLK>,
-				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
-				 <&camcc CAM_CC_IFE_1_CLK>,
-				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
-				 <&camcc CAM_CC_IFE_LITE_CLK>,
-				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
-				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
-				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
-			clock-names = "camnoc_axi",
-				      "core_ahb",
-				      "cpas_ahb",
-				      "cpas_fast_ahb_clk",
-				      "cpas_vfe_lite",
-				      "cpas_vfe0",
-				      "cpas_vfe1",
-				      "csid",
-				      "csiphy0",
-				      "csiphy0_timer",
-				      "csiphy1",
-				      "csiphy1_timer",
-				      "csiphy2",
-				      "csiphy2_timer",
-				      "csiphy3",
-				      "csiphy3_timer",
-				      "csiphy_rx",
-				      "gcc_axi_hf",
-				      "gcc_axi_sf",
-				      "icp_ahb",
-				      "vfe0",
-				      "vfe0_fast_ahb",
-				      "vfe1",
-				      "vfe1_fast_ahb",
-				      "vfe_lite",
-				      "vfe_lite_ahb",
-				      "vfe_lite_cphy_rx",
-				      "vfe_lite_csid";
-
 			interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
@@ -5312,18 +3433,8 @@ camss: isp@ac78000 {
 					  "vfe_lite3",
 					  "vfe_lite4";
 
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "ahb",
-					     "hf_0";
-
 			iommus = <&apps_smmu 0x3400 0x20>;
 
-			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
-			power-domain-names = "top";
-
 			status = "disabled";
 
 			ports {
@@ -5348,43 +3459,11 @@ port@3 {
 			};
 		};
 
-		camcc: clock-controller@ade0000 {
-			compatible = "qcom,sa8775p-camcc";
-			reg = <0x0 0x0ade0000 0x0 0x20000>;
-			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK_A>,
-				 <&sleep_clk>;
-			power-domains = <&rpmhpd SA8775P_MMCX>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
-		};
-
 		mdss0: display-subsystem@ae00000 {
 			compatible = "qcom,sa8775p-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;
 			reg-names = "mdss";
 
-			/* same path used twice */
-			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
-			interconnect-names = "mdp0-mem",
-					     "mdp1-mem",
-					     "cpu-cfg";
-
-			resets = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_BCR>;
-
-			power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
-
-			clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
-				 <&gcc GCC_DISP_HF_AXI_CLK>,
-				 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
-
 			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
@@ -5403,23 +3482,6 @@ mdss0_mdp: display-controller@ae01000 {
 				      <0x0 0x0aeb0000 0x0 0x3000>;
 				reg-names = "mdp", "vbif";
 
-				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
-				clock-names = "nrt_bus",
-					      "iface",
-					      "lut",
-					      "core",
-					      "vsync";
-
-				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
-				assigned-clock-rates = <19200000>;
-
-				operating-points-v2 = <&mdss0_mdp_opp_table>;
-				power-domains = <&rpmhpd SA8775P_MMCX>;
-
 				interrupt-parent = <&mdss0>;
 				interrupts = <0>;
 
@@ -5459,30 +3521,6 @@ dpu_intf2_out: endpoint {
 						};
 					};
 				};
-
-				mdss0_mdp_opp_table: opp-table {
-					compatible = "operating-points-v2";
-
-					opp-375000000 {
-						opp-hz = /bits/ 64 <375000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
-					};
-
-					opp-500000000 {
-						opp-hz = /bits/ 64 <500000000>;
-						required-opps = <&rpmhpd_opp_nom>;
-					};
-
-					opp-575000000 {
-						opp-hz = /bits/ 64 <575000000>;
-						required-opps = <&rpmhpd_opp_turbo>;
-					};
-
-					opp-650000000 {
-						opp-hz = /bits/ 64 <650000000>;
-						required-opps = <&rpmhpd_opp_turbo_l1>;
-					};
-				};
 			};
 
 			mdss0_dsi0: dsi@ae94000 {
@@ -5493,29 +3531,6 @@ mdss0_dsi0: dsi@ae94000 {
 				interrupt-parent = <&mdss0>;
 				interrupts = <4>;
 
-				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC0_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&gcc GCC_DISP_HF_AXI_CLK>;
-				clock-names = "byte",
-					      "byte_intf",
-					      "pixel",
-					      "core",
-					      "iface",
-					      "bus";
-				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
-							 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>;
-				phys = <&mdss0_dsi0_phy>;
-
-				operating-points-v2 = <&mdss_dsi_opp_table>;
-				power-domains = <&rpmhpd SA8775P_MMCX>;
-
-				refgen-supply = <&refgen>;
-
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -5539,34 +3554,6 @@ port@1 {
 						mdss0_dsi0_out: endpoint { };
 					};
 				};
-
-				mdss_dsi_opp_table: opp-table {
-					compatible = "operating-points-v2";
-
-					opp-358000000 {
-						opp-hz = /bits/ 64 <358000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
-					};
-				};
-			};
-
-			mdss0_dsi0_phy: phy@ae94400 {
-				compatible = "qcom,sa8775p-dsi-phy-5nm";
-				reg = <0x0 0x0ae94400 0x0 0x200>,
-				      <0x0 0x0ae94600 0x0 0x280>,
-				      <0x0 0x0ae94900 0x0 0x27c>;
-				reg-names = "dsi_phy",
-					    "dsi_phy_lane",
-					    "dsi_pll";
-
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-
-				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&rpmhcc RPMH_CXO_CLK>;
-				clock-names = "iface", "ref";
-
-				status = "disabled";
 			};
 
 			mdss0_dsi1: dsi@ae96000 {
@@ -5577,29 +3564,6 @@ mdss0_dsi1: dsi@ae96000 {
 				interrupt-parent = <&mdss0>;
 				interrupts = <5>;
 
-				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_INTF_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC1_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&gcc GCC_DISP_HF_AXI_CLK>;
-				clock-names = "byte",
-					      "byte_intf",
-					      "pixel",
-					      "core",
-					      "iface",
-					      "bus";
-				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
-							 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
-				phys = <&mdss0_dsi1_phy>;
-
-				operating-points-v2 = <&mdss_dsi_opp_table>;
-				power-domains = <&rpmhpd SA8775P_MMCX>;
-
-				refgen-supply = <&refgen>;
-
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -5625,67 +3589,6 @@ port@1 {
 				};
 			};
 
-			mdss0_dsi1_phy: phy@ae96400 {
-				compatible = "qcom,sa8775p-dsi-phy-5nm";
-				reg = <0x0 0x0ae96400 0x0 0x200>,
-				      <0x0 0x0ae96600 0x0 0x280>,
-				      <0x0 0x0ae96900 0x0 0x27c>;
-				reg-names = "dsi_phy",
-					    "dsi_phy_lane",
-					    "dsi_pll";
-
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-
-				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&rpmhcc RPMH_CXO_CLK>;
-				clock-names = "iface", "ref";
-
-				status = "disabled";
-			};
-
-			mdss0_dp0_phy: phy@aec2a00 {
-				compatible = "qcom,sa8775p-edp-phy";
-
-				reg = <0x0 0x0aec2a00 0x0 0x200>,
-				      <0x0 0x0aec2200 0x0 0xd0>,
-				      <0x0 0x0aec2600 0x0 0xd0>,
-				      <0x0 0x0aec2000 0x0 0x1c8>;
-
-				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&gcc GCC_EDP_REF_CLKREF_EN>;
-				clock-names = "aux",
-					      "cfg_ahb",
-					      "ref";
-
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-
-				status = "disabled";
-			};
-
-			mdss0_dp1_phy: phy@aec5a00 {
-				compatible = "qcom,sa8775p-edp-phy";
-
-				reg = <0x0 0x0aec5a00 0x0 0x200>,
-				      <0x0 0x0aec5200 0x0 0xd0>,
-				      <0x0 0x0aec5600 0x0 0xd0>,
-				      <0x0 0x0aec5000 0x0 0x1c8>;
-
-				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&gcc GCC_EDP_REF_CLKREF_EN>;
-				clock-names = "aux",
-					      "cfg_ahb",
-					      "ref";
-
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-
-				status = "disabled";
-			};
-
 			mdss0_dp0: displayport-controller@af54000 {
 				compatible = "qcom,sa8775p-dp";
 
@@ -5702,38 +3605,6 @@ mdss0_dp0: displayport-controller@af54000 {
 				interrupt-parent = <&mdss0>;
 				interrupts = <12>;
 
-				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
-				clock-names = "core_iface",
-					      "core_aux",
-					      "ctrl_link",
-					      "ctrl_link_iface",
-					      "stream_pixel",
-					      "stream_1_pixel",
-					      "stream_2_pixel",
-					      "stream_3_pixel";
-				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
-				assigned-clock-parents = <&mdss0_dp0_phy 0>,
-							 <&mdss0_dp0_phy 1>,
-							 <&mdss0_dp0_phy 1>,
-							 <&mdss0_dp0_phy 1>,
-							 <&mdss0_dp0_phy 1>;
-				phys = <&mdss0_dp0_phy>;
-				phy-names = "dp";
-
-				operating-points-v2 = <&dp_opp_table>;
-				power-domains = <&rpmhpd SA8775P_MMCX>;
-
 				#sound-dai-cells = <0>;
 
 				status = "disabled";
@@ -5756,30 +3627,6 @@ port@1 {
 						mdss0_dp0_out: endpoint { };
 					};
 				};
-
-				dp_opp_table: opp-table {
-					compatible = "operating-points-v2";
-
-					opp-162000000 {
-						opp-hz = /bits/ 64 <162000000>;
-						required-opps = <&rpmhpd_opp_low_svs>;
-					};
-
-					opp-270000000 {
-						opp-hz = /bits/ 64 <270000000>;
-						required-opps = <&rpmhpd_opp_svs>;
-					};
-
-					opp-540000000 {
-						opp-hz = /bits/ 64 <540000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
-					};
-
-					opp-810000000 {
-						opp-hz = /bits/ 64 <810000000>;
-						required-opps = <&rpmhpd_opp_nom>;
-					};
-				};
 			};
 
 			mdss0_dp1: displayport-controller@af5c000 {
@@ -5798,30 +3645,6 @@ mdss0_dp1: displayport-controller@af5c000 {
 				interrupt-parent = <&mdss0>;
 				interrupts = <13>;
 
-				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
-				clock-names = "core_iface",
-					      "core_aux",
-					      "ctrl_link",
-					      "ctrl_link_iface",
-					      "stream_pixel",
-					      "stream_1_pixel";
-				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
-				assigned-clock-parents = <&mdss0_dp1_phy 0>,
-							 <&mdss0_dp1_phy 1>,
-							 <&mdss0_dp1_phy 1>;
-				phys = <&mdss0_dp1_phy>;
-				phy-names = "dp";
-
-				operating-points-v2 = <&dp_opp_table>;
-				power-domains = <&rpmhpd SA8775P_MMCX>;
-
 				#sound-dai-cells = <0>;
 
 				status = "disabled";
@@ -5847,25 +3670,6 @@ port@1 {
 			};
 		};
 
-		dispcc0: clock-controller@af00000 {
-			compatible = "qcom,sa8775p-dispcc0";
-			reg = <0x0 0x0af00000 0x0 0x20000>;
-			clocks = <&gcc GCC_DISP_AHB_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK_A>,
-				 <&sleep_clk>,
-				 <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>,
-				 <&mdss0_dp1_phy 0>, <&mdss0_dp1_phy 1>,
-				 <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
-				 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>,
-				 <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
-				 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
-			power-domains = <&rpmhpd SA8775P_MMCX>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
-		};
-
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>,
@@ -6315,95 +4119,6 @@ frame@17c2d000 {
 			};
 		};
 
-		apps_rsc: rsc@18200000 {
-			compatible = "qcom,rpmh-rsc";
-			reg = <0x0 0x18200000 0x0 0x10000>,
-			      <0x0 0x18210000 0x0 0x10000>,
-			      <0x0 0x18220000 0x0 0x10000>;
-			reg-names = "drv-0", "drv-1", "drv-2";
-			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
-			      <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
-			      <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
-			qcom,tcs-offset = <0xd00>;
-			qcom,drv-id = <2>;
-			qcom,tcs-config = <ACTIVE_TCS 2>,
-					  <SLEEP_TCS 3>,
-					  <WAKE_TCS 3>,
-					  <CONTROL_TCS 0>;
-			label = "apps_rsc";
-			power-domains = <&system_pd>;
-
-			apps_bcm_voter: bcm-voter {
-				compatible = "qcom,bcm-voter";
-			};
-
-			rpmhcc: clock-controller {
-				compatible = "qcom,sa8775p-rpmh-clk";
-				#clock-cells = <1>;
-				clock-names = "xo";
-				clocks = <&xo_board_clk>;
-			};
-
-			rpmhpd: power-controller {
-				compatible = "qcom,sa8775p-rpmhpd";
-				#power-domain-cells = <1>;
-				operating-points-v2 = <&rpmhpd_opp_table>;
-
-				rpmhpd_opp_table: opp-table {
-					compatible = "operating-points-v2";
-
-					rpmhpd_opp_ret: opp-0 {
-						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
-					};
-
-					rpmhpd_opp_min_svs: opp-1 {
-						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
-					};
-
-					rpmhpd_opp_low_svs: opp-2 {
-						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
-					};
-
-					rpmhpd_opp_svs: opp-3 {
-						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
-					};
-
-					rpmhpd_opp_svs_l1: opp-4 {
-						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
-					};
-
-					rpmhpd_opp_nom: opp-5 {
-						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
-					};
-
-					rpmhpd_opp_nom_l1: opp-6 {
-						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
-					};
-
-					rpmhpd_opp_nom_l2: opp-7 {
-						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
-					};
-
-					rpmhpd_opp_turbo: opp-8 {
-						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
-					};
-
-					rpmhpd_opp_turbo_l1: opp-9 {
-						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
-					};
-				};
-			};
-		};
-
-		epss_l3_cl0: interconnect@18590000 {
-			compatible = "qcom,sa8775p-epss-l3",
-				     "qcom,epss-l3";
-			reg = <0x0 0x18590000 0x0 0x1000>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
-			clock-names = "xo", "alternate";
-			#interconnect-cells = <1>;
-		};
-
 		cpufreq_hw: cpufreq@18591000 {
 			compatible = "qcom,sa8775p-cpufreq-epss",
 				     "qcom,cpufreq-epss";
@@ -6415,21 +4130,9 @@ cpufreq_hw: cpufreq@18591000 {
 				     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "dcvsh-irq-0", "dcvsh-irq-1";
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
-			clock-names = "xo", "alternate";
-
 			#freq-domain-cells = <1>;
 		};
 
-		epss_l3_cl1: interconnect@18592000 {
-			compatible = "qcom,sa8775p-epss-l3",
-				     "qcom,epss-l3";
-			reg = <0x0 0x18592000 0x0 0x1000>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
-			clock-names = "xo", "alternate";
-			#interconnect-cells = <1>;
-		};
-
 		remoteproc_gpdsp0: remoteproc@20c00000 {
 			compatible = "qcom,sa8775p-gpdsp0-pas";
 			reg = <0x0 0x20c00000 0x0 0x10000>;
@@ -6442,16 +4145,6 @@ remoteproc_gpdsp0: remoteproc@20c00000 {
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			power-domains = <&rpmhpd SA8775P_CX>,
-					<&rpmhpd SA8775P_MXC>;
-			power-domain-names = "cx", "mxc";
-
-			interconnects = <&gpdsp_anoc MASTER_DSP0 0
-					 &config_noc SLAVE_CLK_CTL 0>;
-
 			memory-region = <&pil_gdsp0_mem>;
 
 			qcom,qmp = <&aoss_qmp>;
@@ -6514,16 +4207,6 @@ remoteproc_gpdsp1: remoteproc@21c00000 {
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			power-domains = <&rpmhpd SA8775P_CX>,
-					<&rpmhpd SA8775P_MXC>;
-			power-domain-names = "cx", "mxc";
-
-			interconnects = <&gpdsp_anoc MASTER_DSP1 0
-					 &config_noc SLAVE_CLK_CTL 0>;
-
 			memory-region = <&pil_gdsp1_mem>;
 
 			qcom,qmp = <&aoss_qmp>;
@@ -6579,24 +4262,6 @@ mdss1: display-subsystem@22000000 {
 			reg = <0x0 0x22000000 0x0 0x1000>;
 			reg-names = "mdss";
 
-			interconnects = <&mmss_noc MASTER_MDP_CORE1_0 QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&mmss_noc MASTER_MDP_CORE1_1 QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
-			interconnect-names = "mdp0-mem",
-					     "mdp1-mem",
-					     "cpu-cfg";
-
-			resets = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_BCR>;
-
-			power-domains = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_GDSC>;
-
-			clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
-				 <&gcc GCC_DISP1_HF_AXI_CLK>,
-				 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>;
-
 			interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
@@ -6609,29 +4274,12 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			status = "disabled";
 
-			display-controller@22001000 {
+			mdss1_mdp: display-controller@22001000 {
 				compatible = "qcom,sa8775p-dpu";
 				reg = <0x0 0x22001000 0x0 0x8f000>,
 				      <0x0 0x220b0000 0x0 0x3000>;
 				reg-names = "mdp", "vbif";
 
-				clocks = <&gcc GCC_DISP1_HF_AXI_CLK>,
-					 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
-					 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>,
-					 <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
-				clock-names = "nrt_bus",
-					      "iface",
-					      "lut",
-					      "core",
-					      "vsync";
-
-				assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
-				assigned-clock-rates = <19200000>;
-
-				operating-points-v2 = <&mdss0_mdp_opp_table>;
-				power-domains = <&rpmhpd SA8775P_MMCX>;
-
 				interrupt-parent = <&mdss1>;
 				interrupts = <0>;
 
@@ -6657,46 +4305,6 @@ dpu1_intf4_out: endpoint {
 				};
 			};
 
-			mdss1_dp0_phy: phy@220c2a00 {
-				compatible = "qcom,sa8775p-edp-phy";
-				reg = <0x0 0x220c2a00 0x0 0x200>,
-				      <0x0 0x220c2200 0x0 0xd0>,
-				      <0x0 0x220c2600 0x0 0xd0>,
-				      <0x0 0x220c2000 0x0 0x1c8>;
-
-				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
-					 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&gcc GCC_EDP_REF_CLKREF_EN>;
-				clock-names = "aux",
-					      "cfg_ahb",
-					      "ref";
-
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-
-				status = "disabled";
-			};
-
-			mdss1_dp1_phy: phy@220c5a00 {
-				compatible = "qcom,sa8775p-edp-phy";
-				reg = <0x0 0x220c5a00 0x0 0x200>,
-				      <0x0 0x220c5200 0x0 0xd0>,
-				      <0x0 0x220c5600 0x0 0xd0>,
-				      <0x0 0x220c5000 0x0 0x1c8>;
-
-				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
-					 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&gcc GCC_EDP_REF_CLKREF_EN>;
-				clock-names = "aux",
-					      "cfg_ahb",
-					      "ref";
-
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-
-				status = "disabled";
-			};
-
 			mdss1_dp0: displayport-controller@22154000 {
 				compatible = "qcom,sa8775p-dp";
 				reg = <0x0 0x22154000 0x0 0x104>,
@@ -6712,38 +4320,6 @@ mdss1_dp0: displayport-controller@22154000 {
 				interrupt-parent = <&mdss1>;
 				interrupts = <12>;
 
-				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
-					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
-					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
-					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
-					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
-					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
-				clock-names = "core_iface",
-					      "core_aux",
-					      "ctrl_link",
-					      "ctrl_link_iface",
-					      "stream_pixel",
-					      "stream_1_pixel",
-					      "stream_2_pixel",
-					      "stream_3_pixel";
-				assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
-						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
-						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
-						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
-				assigned-clock-parents = <&mdss1_dp0_phy 0>,
-							 <&mdss1_dp0_phy 1>,
-							 <&mdss1_dp0_phy 1>,
-							 <&mdss1_dp0_phy 1>,
-							 <&mdss1_dp0_phy 1>;
-				phys = <&mdss1_dp0_phy>;
-				phy-names = "dp";
-
-				operating-points-v2 = <&dp_opp_table>;
-				power-domains = <&rpmhpd SA8775P_MMCX>;
-
 				#sound-dai-cells = <0>;
 
 				status = "disabled";
@@ -6783,30 +4359,6 @@ mdss1_dp1: displayport-controller@2215c000 {
 				interrupt-parent = <&mdss1>;
 				interrupts = <13>;
 
-				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
-					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
-					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
-					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
-					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
-				clock-names = "core_iface",
-					      "core_aux",
-					      "ctrl_link",
-					      "ctrl_link_iface",
-					      "stream_pixel",
-					      "stream_1_pixel";
-				assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
-						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
-						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
-				assigned-clock-parents = <&mdss1_dp1_phy 0>,
-							 <&mdss1_dp1_phy 1>,
-							 <&mdss1_dp1_phy 1>;
-				phys = <&mdss1_dp1_phy>;
-				phy-names = "dp";
-
-				operating-points-v2 = <&dp_opp_table>;
-				power-domains = <&rpmhpd SA8775P_MMCX>;
-
 				#sound-dai-cells = <0>;
 
 				status = "disabled";
@@ -6833,22 +4385,6 @@ port@1 {
 			};
 		};
 
-		dispcc1: clock-controller@22100000 {
-			compatible = "qcom,sa8775p-dispcc1";
-			reg = <0x0 0x22100000 0x0 0x20000>;
-			clocks = <&gcc GCC_DISP_AHB_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK_A>,
-				 <&sleep_clk>,
-				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
-				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
-				 <0>, <0>, <0>, <0>;
-			power-domains = <&rpmhpd SA8775P_MMCX>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
-		};
-
 		ethernet1: ethernet@23000000 {
 			compatible = "qcom,sa8775p-ethqos";
 			reg = <0x0 0x23000000 0x0 0x10000>,
@@ -6859,27 +4395,6 @@ ethernet1: ethernet@23000000 {
 				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			clocks = <&gcc GCC_EMAC1_AXI_CLK>,
-				 <&gcc GCC_EMAC1_SLV_AHB_CLK>,
-				 <&gcc GCC_EMAC1_PTP_CLK>,
-				 <&gcc GCC_EMAC1_PHY_AUX_CLK>;
-			clock-names = "stmmaceth",
-				      "pclk",
-				      "ptp_ref",
-				      "phyaux";
-
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &config_noc SLAVE_EMAC1_CFG QCOM_ICC_TAG_ALWAYS>,
-					<&aggre1_noc MASTER_EMAC_1 QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "cpu-mac",
-					     "mac-mem";
-
-			power-domains = <&gcc EMAC1_GDSC>;
-
-			phys = <&serdes1>;
-			phy-names = "serdes";
-
 			iommus = <&apps_smmu 0x140 0xf>;
 			dma-coherent;
 
@@ -6901,27 +4416,6 @@ ethernet0: ethernet@23040000 {
 				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
-				 <&gcc GCC_EMAC0_SLV_AHB_CLK>,
-				 <&gcc GCC_EMAC0_PTP_CLK>,
-				 <&gcc GCC_EMAC0_PHY_AUX_CLK>;
-			clock-names = "stmmaceth",
-				      "pclk",
-				      "ptp_ref",
-				      "phyaux";
-
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &config_noc SLAVE_EMAC_CFG QCOM_ICC_TAG_ALWAYS>,
-					<&aggre1_noc MASTER_EMAC QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "cpu-mac",
-					     "mac-mem";
-
-			power-domains = <&gcc EMAC0_GDSC>;
-
-			phys = <&serdes0>;
-			phy-names = "serdes";
-
 			iommus = <&apps_smmu 0x120 0xf>;
 			dma-coherent;
 
@@ -6933,13 +4427,6 @@ &config_noc SLAVE_EMAC_CFG QCOM_ICC_TAG_ALWAYS>,
 			status = "disabled";
 		};
 
-		nspa_noc: interconnect@260c0000 {
-			compatible = "qcom,sa8775p-nspa-noc";
-			reg = <0x0 0x260c0000 0x0 0x16080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
 		remoteproc_cdsp0: remoteproc@26300000 {
 			compatible = "qcom,sa8775p-cdsp0-pas";
 			reg = <0x0 0x26300000 0x0 0x10000>;
@@ -6952,17 +4439,6 @@ remoteproc_cdsp0: remoteproc@26300000 {
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			power-domains = <&rpmhpd SA8775P_CX>,
-					<&rpmhpd SA8775P_MXC>,
-					<&rpmhpd SA8775P_NSP0>;
-			power-domain-names = "cx", "mxc", "nsp";
-
-			interconnects = <&nspa_noc MASTER_CDSP_PROC 0
-					 &mc_virt SLAVE_EBI1 0>;
-
 			memory-region = <&pil_cdsp0_mem>;
 
 			qcom,qmp = <&aoss_qmp>;
@@ -7072,13 +4548,6 @@ compute-cb@11 {
 			};
 		};
 
-		nspb_noc: interconnect@2a0c0000 {
-			compatible = "qcom,sa8775p-nspb-noc";
-			reg = <0x0 0x2a0c0000 0x0 0x16080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
 		remoteproc_cdsp1: remoteproc@2a300000 {
 			compatible = "qcom,sa8775p-cdsp1-pas";
 			reg = <0x0 0x2a300000 0x0 0x10000>;
@@ -7091,17 +4560,6 @@ remoteproc_cdsp1: remoteproc@2a300000 {
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			power-domains = <&rpmhpd SA8775P_CX>,
-					<&rpmhpd SA8775P_MXC>,
-					<&rpmhpd SA8775P_NSP1>;
-			power-domain-names = "cx", "mxc", "nsp";
-
-			interconnects = <&nspb_noc MASTER_CDSP_PROC_B 0
-					 &mc_virt SLAVE_EBI1 0>;
-
 			memory-region = <&pil_cdsp1_mem>;
 
 			qcom,qmp = <&aoss_qmp>;
@@ -7247,15 +4705,6 @@ remoteproc_adsp: remoteproc@30000000 {
 			interrupt-names = "wdog", "fatal", "ready", "handover",
 					  "stop-ack";
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			power-domains = <&rpmhpd SA8775P_LCX>,
-					<&rpmhpd SA8775P_LMX>;
-			power-domain-names = "lcx", "lmx";
-
-			interconnects = <&lpass_ag_noc MASTER_LPASS_PROC 0 &mc_virt SLAVE_EBI1 0>;
-
 			memory-region = <&pil_adsp_mem>;
 
 			qcom,qmp = <&aoss_qmp>;
-- 
2.43.0

