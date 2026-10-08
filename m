Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994DE446C01
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447073; cv=none; b=f46j35hP0HC+EVhU7jixUN05ie7sV5dCw34t+4a2OL3KFg3X3u+nYfNYsilynzmkQNR5837d9dzwOblPICiiLgQDP9ZXlKmW/QAM1MJDzSlF365oA83DlykPry+MAG61d+2zdohEVO1rC9WW3X5F8cbDluq0cyEKCIBt1qAQ/qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447073; c=relaxed/simple;
	bh=u/PW08aRrxDDpWBnDNET3ssO+UW7wTEeeUrFIy/d3z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W2qHNynkg3Z91ATA6WflHJTnQOVH7uHhoCCkpytzZFrERKd34vIYsFLbTLjoUhaqDUa0NCW/RjW4mCvF5H1GRMFozOYJduns2TBWf22oWT/Oj4/MEXxaaPMjG1a6lYcQjE0niKNqqNJJsK75iUYufpMTP2L5KboXBLv9jpEg4uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuoCQLgS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FtHLHCEY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BuoCQLgS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FtHLHCEY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K9OV2560086
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 08:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xa79qxnOojd
	qdzhevM4v7FsqD+kJqqEikGCHIJRtyNA=; b=BuoCQLgS92IRygsnI1NQbtIP1wh
	JJlFI1v6NY0e247ZA3ROfD8RkDkb7tk2Wd5bBT94Uq4kuSiweRYicmcp3hWqLQPr
	mwQIK5Ck0jps+RiTEo4t3qlOxVxxacmdyTvyZfjz9pnAjvYE6io3qTOUGc5uiB/i
	8IVVYJ5zKHT9PYtQcDb9lfi4O82FYANZ3xzNPbQI7J3jgx3aS9kOD10s6BKCNOXu
	mpyjMvd8K2mGVjs4JY13wbNs+bts9ZgLv1/hK0dJBdW4w81VnYBt3NXvjUEoNGTm
	p6r7S+m5HkV6a8mlmD/hUXYR12dJ9N2tV2pfLgfCRRjFN4evsk8ppRKJGMg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe81teg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:11:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso9724126eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791447068; x=1792051868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xa79qxnOojdqdzhevM4v7FsqD+kJqqEikGCHIJRtyNA=;
        b=FtHLHCEY5xcLjPZmFT+CdCmjw+kB4D7h32gdofTd/2sHYejxCRGqkQrWqChBiWs3ub
         Z2L5SVAN32zWPX+/bCI1XwblEP6HmoGMmyyEv31dWWTDdtK71CUBNC68sK5OahJ48VSp
         xpE8A0vqNVeEXaQTEFbCQFcIuRjOudmEcVzeHwJo1L4kdHsXlJGdeaOQAO7qKcCQr0yV
         tpdXxH2ub9rma3MXPCZjBVgHCGmiIHkIRM6QfAzHCmQ8HVIhpEkzYTCJbAUK1hgEFo5L
         31ahssk/bOunrsAeALT8qgZWKnKtL38oO39Dzdd18UKbABrnt2sZHSV4scvkQxanmt91
         7lNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447068; x=1792051868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xa79qxnOojdqdzhevM4v7FsqD+kJqqEikGCHIJRtyNA=;
        b=jeJ3audv98Ld5eyvaFF86pjv9y/QPNADm8nWry5Kl35lrgeBlItTSpJJ8z8u7Y2Oe5
         vJQ4gKQ8AceqY4sLP9KZOmXiQVXqebHTUZTZg5XpuDJH3psA2iw5FX4uudR5ZkKz9jtK
         0Z4oA1LdZHaYLqypcQCVi41fDNc5wI/bMofZ44uPvLFEfCQfvpsjYUfeq/LxG4eJMCwD
         RnramAnuISJQEFB3cKPkZcnJ7w7R357J+YoUrkzOcST3LWENolzmtBMKTOsmixIAPZcW
         pjIVxB5mzizCC/Gd/L7td56khXjmfyvMowD6VIrvy6aee6M4od+fkCm355dU8FSgpXSz
         sC7w==
X-Forwarded-Encrypted: i=1; AKwUvByeEQN0qLIeKeSijCw+KRfNO5Nd1g+Y8+yR7zsyUVnyoVjgVhERh7Zxsk8g9dKmrMp8OemfSEazR54WMtM=@vger.kernel.org
X-Gm-Message-State: AFuF++kMnFjlmDebW1vzMVLu1OyjACBlO96++v+4G4zmNLB9BV2dSpbk
	L8NkoQZ4gksOeKjPBrskfSUO1YiyJ3dD6vMC8zG1OF8k1ygZRy3uYPR9YRkXZXHtj/gR5GVXDdb
	YUTc/sSSmhr4vB2EgCtPUuax5LUEc/lEfLUmTctVSa0Kh7m0NnxrAGi1oKyRIbjYTBO0=
X-Gm-Gg: AYBFou3jiQd86C8mf4Vqyg1dvRGD2LfJ6DT6N6vUcZHRZ3DEkIozkkBCT05V+joaGDm
	1FXELVS6e5RXHi1LdVswFnGykAMC+bbMu8o1YrsCQeKTJIN2CSyv/eK4BVX3KbaRrYOPeX5gMJ9
	tV3ywBOn7O2JBDDs/mo9tCGBTCjjTMOHfHsnFtzsJZeUKKb3rAaF6VrMM9gB1Tbgt0cf4nYbVxc
	F8KV+Pj63F2tB03Ca1W8DSxJH0T3RfieoRErj2ijJo0EzUnBmH6LwV2FfwcWcAVlFoYq4SsJj7g
	CX3kvv0Ix8r7Kxn8kWj7dvmFQFrmakZiE4f6oyp2u4PjTJ9ranGndCIQNuCEMsjp8ngZ8I/Di5+
	pdbPeSZLC9oLEiblGVPxj/5QWvFK84onX/1wvSrJ+f4JDhBCqt6CkGC2/PRQ=
X-Received: by 2002:a05:7022:fa4:b0:14b:992f:c168 with SMTP id a92af1059eb24-161fdfc675dmr7382758c88.4.1791447068506;
        Thu, 08 Oct 2026 01:11:08 -0700 (PDT)
X-Received: by 2002:a05:7022:fa4:b0:14b:992f:c168 with SMTP id a92af1059eb24-161fdfc675dmr7382725c88.4.1791447067829;
        Thu, 08 Oct 2026 01:11:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166121f2asm14522277c88.4.2026.10.08.01.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:11:07 -0700 (PDT)
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
Subject: [PATCH v2 3/4] arm64: dts: qcom: sm8750: Fix videocc clock inputs
Date: Thu,  8 Oct 2026 16:10:35 +0800
Message-ID: <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX9JCmNj3FRbbK
 /cLsIqgfftTwHLW/DcHR99aavBCqVr8VmtXHoskad+UUdOieKzyUmW7tin2s47J1GmE0Mcejb5Y
 njKojb4DbBhl/KnfXWRukxjdMHNF9glutIxbWFvwS0VkO8biD7SC3pJFqjoDW44iBcy2THog+Tr
 t7FeoZ3lzfNigRXsohFdPAl3IOfy0DGUf3a5q0evEhqZwKmdHW71IbnUc7UlXiGwiE+exaPKyQZ
 Rxsm/YjbviLTxDoh6nhT8Kj4xHWtOuHuQOQUGZoDopPdxP0tsEaiWrwhcpAcjuWq7cxjHf28yHx
 GnrJ1wmqUWAq3HIRAz6ZV8NJk1lopc2ImRHf4gZGvXlOxOMTaLJta9lfe01HkgY5BSuDmec+yfz
 3px6voR8/D3+hVOdyw11mRIAm258csJ+pd/8ZHdMD6oOFpdLEHQFpFYzyry0QjOsDuJPy3lz7po
 OwusNlcW/2usRr2UhAw==
X-Proofpoint-GUID: 5QvSnbKj1tx3vPQ2iRZ6Wnnl-_NO7J9q
X-Proofpoint-ORIG-GUID: 5QvSnbKj1tx3vPQ2iRZ6Wnnl-_NO7J9q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX0X3KzLAW5YvY
 48EmOhuqxenhirsXz+2dRV4ScC0uIBQkkKc5K0w4RdnxErpRSaOKea114mY3hyIiUjeyXCv8oKz
 0YZHmfebh0IDfxf9zr+B13UFAJ9WLrw=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac7501d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=PKgm7S4WkqlbYhXdoGMA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080032

The video clock controller binding describes three clock inputs for
SM8750: the board XO, the always-on board XO and the 32 kHz sleep clock.
The videocc node instead passes the board XO and GCC_VIDEO_AHB_CLK,
which is not an input of the controller.

Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
clock. No functional change, GCC_VIDEO_AHB_CLK is enabled independently
of this node.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index cf947acc5760..678e6e167bde 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3338,7 +3338,8 @@ videocc: clock-controller@aaf0000 {
 			compatible = "qcom,sm8750-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;
 			clocks = <&bi_tcxo_div2>,
-				 <&gcc GCC_VIDEO_AHB_CLK>;
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
 			required-opps = <&rpmhpd_opp_low_svs>,
-- 
2.43.0

