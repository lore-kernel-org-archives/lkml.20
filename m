Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92C1443C27
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447077; cv=none; b=NHmVt7/FfoYDMwN9rs44XYXIGmbBTU1yDx9uXAOPHWAnMTj7KSSpCkHGkNb47xn0uNBQ/LbVKdoOiBUl0RsTnfXaMlke/bHFk63eRY5J1a3sHsHILUZT9UZZ+wAi9SRdCVyWFYGa/PF5YfLZS3ItJlYnv6Jg/bcYZzzw+Mz8O3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447077; c=relaxed/simple;
	bh=KLSCJNqWTfQH3hCgEppY4XAKXGuCvDCp1TPzxwkMcv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eATpPwNoqDw55HlvUmT9PoLu/x0B6B/Ob5zP+CpQMciYAEgD79OeSWuAntnb4R36Q0UAsZQZJosgg944NSZo34nT26y4GtKlCrlkQdruWhEHghBfiUDB6qgREWFv7MRoamcCxs8tdO+E3rhPqDvUtI99kWARRvmVfRThStWQhiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBbLNoTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFntsM90; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBbLNoTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFntsM90"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KPbR3308266
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 08:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+YSuDvOoF29
	231NTS5Y9qMD1wu3gOUz6rCSgcpTgpGg=; b=kBbLNoTkninLLPGDlqi3hsZIptQ
	a/40r68KnX6acR0fd66zyls/hkS2Z7hYP6kaobnupT9oVAqstkTfCsIVzqZKkxim
	XMiyI2MnHNbmRhvGqwQxkgkOs94yGeP3ZxiWbqZ0vgWXuk5jXsG282myZ8tAdyzN
	sUfaA5bOfOw19E0+Rc/xOjKtO3bbS/BL0XMfoRI90MeAQXSaW8sa4evSiHI5G7mK
	FbUsQRt29eAUoJu7VyXdczJTj8x9ouvRbqzVvTafdcH2w/ilOTVziQqhUv5pWlEp
	RgBBEHEsY+83dZ90QS9JNyPBCzkqRiqmVqeqirO8ek64w9KA+aVAaXCT3Ow==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg9e76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:11:14 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so17508201c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791447074; x=1792051874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YSuDvOoF29231NTS5Y9qMD1wu3gOUz6rCSgcpTgpGg=;
        b=DFntsM90gzLfHlfqVYPF73BoRHH6ehRGRoSHoIuhXoQ9BqycPa2ra4+rNpAIVuyW6g
         0aDM7XtQg9AfUCvdthqHLpZigjPhEAmQvV9R/cJNK5AYGZEE9VT21YP1s4cZvUkJNI8p
         QFM7hjZ5bOA0DBrrmeO0Wkct9a+iL6Z4vTIH+qyoDvuTkxo5d/RMJpIjyYitnyarPjcC
         mGf3ht9jRS5vgyZe20FIH2HPa0DJfZxnNAQJtH+lKxY8blW5OIS3FJJdCbkV+tcD4cm0
         TtdLtvNbyNk/2inTClojzrQoP5H/qkP0aJZ8GsDGiH6WQiB/3zw5CmNA6anMAfkLX7O8
         /ZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447074; x=1792051874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+YSuDvOoF29231NTS5Y9qMD1wu3gOUz6rCSgcpTgpGg=;
        b=UuN7h3e8sj3WIjFaHST0lx0y4ZHNiPL3P3mjMyuevIBy/HdHBO7WGmGL68y8vXpGqi
         s5GnTlRsc6bj6ZdtYIR9aRt7U1mC5Jr0BMWB823cMW1MecsRpAkqzn1BZiL2OEGH6/wW
         6Hi6tCt2nyj2hz5Cp1HON+FuP4G0ir6cWoJK0hWpGWQeE2oK5NIL+MYGq2NU1rVMFdR4
         iY/LHyKHPi6njhjanrEFt7irUAhhXipJsZN9mvIM6PM04fbrqxgypiknhA1p4k6GVV9h
         sF4I751pm/EwO85uw1qGI7vtqL2Wpd1/8QlbWvqqjQtpdIRUQU7sIIHtC6K9SaOYxpNz
         lQiw==
X-Forwarded-Encrypted: i=1; AKwUvBwvr6wkV/4jtNWxFBkJdBimpbxc+uptYatDks6PeGs0IODxEpFvAqDtZc3gBg4O+7DuD+R6Dlh+31jU1/I=@vger.kernel.org
X-Gm-Message-State: AFuF++mWvYpCtNBvhTYJeLWxiXY9+MKPS/gIysGn71qCx4aYBF6939Oh
	mkAttwQKYE91STC8/ymVxz6Q7OoKGkkcZ7MYVREd/jyqhCJ8cv0JXgM6EmUDnfZq2Dye6Jx0xKW
	JaGZfrmCRyVr/dp5JGob9+QHcJqFJPZx18Q5c0CHpls7Whkqrx4A96OvspU5m2tIz0qIbaV3edX
	KP7A==
X-Gm-Gg: AYBFou3lWMjNUnBCVtuOtXR1dSByuQu7gMtJc+9pcl9ot8fZjaARSIMcYRRb9vmy1T8
	qvE1Pskgmll1HtNlU1rWvWM5eXxGzW7oe0NdRZX+F4TbnZongmCTs0QE2rc1MGVB+OapY5qv3xz
	EkoqEJVLguh072fGPnUfjXMPxcv93Aq3tyNzxx/DUsg2Rrbh4a+ThaDmSIh7SS6coj+nVxhqtTw
	6JPA7F01gbNaN9X5wIIS1xHqoHl3WSrA0qGrkt/Ue/oECoMYPhWT6o90uPWMbxV3R2wT33Khg1Q
	qItGEAIp5Ab2J+nmLRUDSnPwcd5IbmJJuak5K+ihujsx6aTrA+JqEU1dh0k5LWU1ppUcr4TGiCv
	k3k9zbBXBw3jaj4IuV9Yqr97Fht3c20VkyV9j/mQNI4S6j/1K6VkS33YOgfM=
X-Received: by 2002:a05:701b:4354:b0:160:8d8e:7e3b with SMTP id a92af1059eb24-162047a18efmr6279171c88.10.1791447074285;
        Thu, 08 Oct 2026 01:11:14 -0700 (PDT)
X-Received: by 2002:a05:701b:4354:b0:160:8d8e:7e3b with SMTP id a92af1059eb24-162047a18efmr6279101c88.10.1791447073475;
        Thu, 08 Oct 2026 01:11:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166121f2asm14522277c88.4.2026.10.08.01.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:11:13 -0700 (PDT)
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
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: nord: Fix videocc clock inputs
Date: Thu,  8 Oct 2026 16:10:36 +0800
Message-ID: <20261008081036.3492003-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: U6WnLmHzExAmOQ2hqiuvtajdND-MPFMO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX8mMvU5uPtT7X
 Rq1+BrYNy+bBc+hEXhtdHZ0DBlASA/YMOZWV1TWNuOSoCLuLUe9Egd0muakk8uGzwINtSJ6mKSn
 IatUdPZheEPwbc1yAlChfWVIFY4TMeI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX0Fw6TmS6k8nB
 QzAlg4zaMRgPOe0m6H8xY/olEcert69AlNn6pfcfkDUdlB9/1YB5nZHxONozbEpsrli96QPoUMN
 KfnstyYlYM7XgvlmD9HSXjqLA4Msj5ZD8r1m0gPTA0WTLz0LeGx9C3WzRTvlbg5e7bNiH9KYgx9
 IKtW/zi48yAISZhmbwH2pNXwep9r9khPPbN2vqYk/BC1oeNZ7kk0WyfuptJxsobOApfiGY/zeaq
 UUv4Gl+0+DklEznBgRhUCZho8GptmhoZqlnJhvGpc16yk26F6zExzmrSNKNq0uLdgEiXNKsspOZ
 kUJCCyUo+k9QXZisuBQ8jsXroOugV6CZBKRPs+fb4P+Upu9oTg86bUwDKUkdh0o2WmdDr1Jbv6l
 xP1/ZvRxTlYJkzKhJmCQ5pTcQQlMxUAOHH94DlvaJabxEHxsd5CpvggWJr++0DSP2vobjWHrOMH
 aCrdQ8eTmNUbY8L0Jpg==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac75022 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=I6E1kIfsyqVcGmBSIt8A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: U6WnLmHzExAmOQ2hqiuvtajdND-MPFMO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080032

The video clock controller binding describes three clock inputs for
Nord: the board XO, the always-on board XO and the 32 kHz sleep clock.
The videocc node instead passes the board XO and NW_GCC_VIDEO_AHB_CLK,
which is not an input of the controller.

Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
clock. No functional change, NW_GCC_VIDEO_AHB_CLK is kept always on by
the NW GCC driver.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1ab7d9bc3cfe..62d14be55839 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -886,7 +886,8 @@ videocc: clock-controller@aaf0000 {
 		compatible = "qcom,nord-videocc";
 		reg = <0x0 0x0aaf0000 0x0 0x10000>;
 		clocks = <&bi_tcxo_div2>,
-			 <&nwgcc NW_GCC_VIDEO_AHB_CLK>;
+			 <&bi_tcxo_ao_div2>,
+			 <&sleep_clk>;
 		power-domains = <&rpmhpd RPMHPD_MMCX>,
 				<&rpmhpd RPMHPD_MXC>;
 		required-opps = <&rpmhpd_opp_low_svs>,
-- 
2.43.0

