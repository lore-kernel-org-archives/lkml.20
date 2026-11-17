Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897307;
	b=teBerxMEICQ4v0r5XmmWhKEtgGfYQ2E/Hy8x3QzziF51+aVc+oo2uGGYtrSbHsQi0ju8
	 +4YcLR6Lpkt6niffvpT8NiSOAcHLzodpW7jkAGLqTRyv4g2fOct6HwAfA6CeQVO/CMket
	 xiXlyQUrMTzculIYba7FUePBgax/1UAksAazWJMaBkn5ik0t7yBN+2B52qriZOWMGnjBw
	 WZUS0a17/iw5IjNJsS5YuTg+BVvdPKFLE/0Y4bqHj9UNc01JKAlnbL4SZitqUDsq5ZEsw
	 5mx7letTtM09QkNzyWRsSVeVc6+NXgCsd9BOcLEm6zqixUni+d72XSgOCZQ21Rh5laQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kik5QMSbYah4R0SEuIqUCX21MmNHorcARzAYXRMQrUM=;
	b=NqqUYzNkp3lCc28xAylFWPsazGHOgsNjJz4zeCk4REgYMKr/hLFeE3cHnWd23zsFiVNM
	 0L8N/YV+Zkpuz7py81yzHxZ39RwIUol5l/xbOeoYcWhf+nh2hZr7s/euwTDBe76pBUv3p
	 2AlzGQyC7UeLItu7ZxRyRA053qd15fPHe5w61P1PT6SC1JEWH309bvY8jDTZT0Osyh2+H
	 2SX8IXrSgEV2ofREJm7aD2uA6TtkBFI9PfZoyOHDmdMkHthl7WCJOqgx6peFvYLZfDrl+
	 AfvgHtY+r/gC7bLyCdFV41Za6x/gL3Wz7ZkQqoDP34PcwwQEpl8vbvB2OtoF9OQG88g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I2KWypeg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4AJjMBg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D982606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D982606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I2KWypeg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4AJjMBg
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2a6wv2934224
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kik5QMSbYah4R0SEuIqUCX21MmNHorcARzAYXRMQrUM=; b=I2KWypegpIKX/zlI
	wA4fFaO1UuO5Wf0TGwyU1U/k4JH/x8x/N8BqZu7TA4bZbRGJuWkJE11FTTTtT83j
	npX4Q1lryah+GI3BJODIxaOlwbxqNz6Fu55bcPzeKOlm6lzdDbn+r+HkShXF3o2F
	A96RqTL5bT75/sGhXV00GOfafhXlLrLecNKRvOyK268ZIlv6d/07yVTgbyduxWHQ
	NMbn3PdZED3FrwLPb0nixfQmrx6YAZygN79yg1iUdfl+CU/qw0afsEwRAMkY3ey3
	CqT9fcFUDwDZosvRddG+a+hu/hQAoE7GzrkRvqeIJSHkrltWLiBWemtzj/OKBUOk
	j1AQkA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m09pmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:35:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd652c0385bso2923483a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897306; x=1795502106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kik5QMSbYah4R0SEuIqUCX21MmNHorcARzAYXRMQrUM=;
        b=D4AJjMBgBB6SSobpVhX6bUzvJWyXdEWEdszmfRIE93v8YTdRTjEA1xKAEsggCXUXtY
         Q0sk2rnCXLOouNlO9L3s0QdwzI7rBF7Uj7MnGXo9Jqd0lLsdPCFvXOb4yvIvcu+FqJFu
         U1vISL+JWOcDufscFpWyhUQGR74sQhoP7i6FY45m/MwnSSUdsAZxCBFqUHpWh1QyIL2R
         Yj/KQjB6sYySBRcCTglx0rW0yoPce5ORusC8jdxZGeaDbSiSDYaO8tQAhwis+Dn2r7/G
         rsOFhAqKjcWNMpwn/WBv1/wEikP5FsfK0Mz5yOZDLSOeIB36l8cx2CQPHrVZYaT9iiM7
         q2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897306; x=1795502106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kik5QMSbYah4R0SEuIqUCX21MmNHorcARzAYXRMQrUM=;
        b=J/S9hq6JQ8ngnlXn1nOrpbC5tuJFUOSbvAbjeWOcqi5vR4x+cxPNUO2TgAnmQUVtm+
         UepKbEpRG1wzsWB1M7FOB8qagJR5kO25cErnmXZ68MY5Ldba2X0gdw/HkRqjCnrBQ6sT
         ZUr6pISaVKHGL9VWli4dHLH68djsDU9lqSGpxOQ/0xCs186tWEgf1Wy9GFHm0T6EGOD9
         4I8P0TYngurui4ugwOpYOuqiLqMfVQ/z7+iFnI4gO0oy3Ucov+b1A6G/yEHZ1xg8Qj2h
         b7qkwdjRl6OuHCRgRCXZJYsabouxMQAGLIWmZ4Ravbot4yf35YPoahi/OcNFwKxxI2RO
         sX+w==
X-Forwarded-Encrypted: i=1; AL+hErH3Ryx0IXmwbNgqwnPDB8IWznyBKBzH86IEsHVENIp5x2qfTYmNrFrPCWIPICPFJBlROGOZpiJ1lUGQ+gg=@vger.kernel.org
X-Gm-Message-State: APuU4Z91iAzxIJ+16gSZqwo5j6I0bNIVyb0k7OgVYGr+HSxWUyNVoiul
	NmQjtS9DC8Cj2co1Ujww2/1p/+IRSPEvIdOrE3IzTZ1MRGE97qBp0hdvsb+Hs1+q0JuZbtN7b2+
	Z+/9fMVdujzbtmk+Kxs+PWGdeKLVEcIkWhXtCktw8zYnAaEkEq4P5ZhnVKLwd9TLdRFg=
X-Gm-Gg: AYBFou1Xv8Sk/Gz4S99muazP2ZmpznkkUnlztLmowx3aA2hoPJeHNzE004EKtNAflMg
	R/YdJDQTtY2B9HrNmyvFsQg9PLutV9eAk15AGlVUT10QoNivnlAu9dfoVH80mmff5tTaFzdGJ7I
	tU0tf9ed0gHQoi91mMuUhovZ7h0m+vjRkSDAa1rVDlSb98/hO34zXzqlu8KFb5RoaYul9U/F9ni
	2rINj8N+x8llfBBbZUW8sGjhstp4Vw0iYNg5Kqx29wG9N3yOHZtm8bqaainf1e3LtyAIEaotmoT
	5N1hdUlNUE5+CfrgVyGe7qTf/aIsS3bp109uQKrrHBXL2OTSuWE2yc/+fDhORZ5zJe0pZr/G5m5
	kEOhE5hXss2+VOIQhAeJdNx+jAH+9hU5u1u4hdpFdYMiCQ5h43Pa5kkClj3jRPic0rCLdBtDMsA
	mJdlkqwZHYh0WD6HXePK8aV5nfJenBDX5QubL30X/WXVaH36a5
X-Received: by 2002:a05:6a20:9149:b0:3fa:cfec:227d with SMTP id adf61e73a8af0-3facfec31a0mr6338090637.57.1794897305680;
        Mon, 16 Nov 2026 22:35:05 -0800 (PST)
X-Received: by 2002:a05:6a20:9149:b0:3fa:cfec:227d with SMTP id adf61e73a8af0-3facfec31a0mr6338065637.57.1794897305193;
        Mon, 16 Nov 2026 22:35:05 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:35:04 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:34:34 +0800
Subject: [PATCH v3 5/5] arm64: dts: qcom: eliza-evk: Enable iris video
 codec
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-add_iris_for_eliza-v3-5-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
In-Reply-To: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=834;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=ghIyBjSSA206L5G45TbC9GZYxrWFbBzZFE2qCT1QgA4=;
 b=tXqNmKvAQiAY3laS0Mr4X1rW77yW1NwKCGBoUtiDeM4e0ryc+Z92bIRvJc3uOa/NYOZeFQIi1
 xRT9/DQkbXvAtcGSmlsVcaKcg2UqZXU84lCxESmMjmWKZQxsjGibyS8
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX764ELOF0o309
 ydud5l2JfAeKbTQxIlmgFsj4OBhHzhAJNDobvVZw5l0NK8G1CbeSNA5iRPCObh/+VC9xGiV9YqI
 4GsIkeWv/nKiiN2WC8EqdGlpuijFYuE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX3M2xU4GWLC6x
 7zw+n1jvoMt3EnpO9iUl8GPMhN5i2bShf2SreXaFxg5R6xWSb3jPnA+gNrk9fjZnAtMLPf2rXTd
 z3JqkUpi17hPEfq1K0Ke0terazh6O2eF0mpLNueNS/cMMZorVdCryQm4NtHvVHp2AJhH+oAI/F7
 uoFjOVDoNRpEaWMg80L9FnMN5Y6kgAbVftO8Gx6GLAqexPqdyuBGxqzo7RibQt6CN+GNbx7UYFI
 Qpz/iOjCpA7EGDJMJSNROL2yTQtO8Hf8ciS4ZK1bRcsHK0oXoOu+SVlP8JE7ON1k/jCR7zQln8L
 HjfNiNWGL+4grRoNXPgdYkTj0rhgomgiOe38JJjwpmtkgcfKJ7QhPK01pLqT+nM3ZstmBITmH72
 KElYFHtnLyjWLTkSDG6LwxtrpBYOTm61bmP5dcGwexw40ywWXSXsqiKABGeS2KHiHudMqN2367D
 Mc4R1D7WKQsp3dpw41Q==
X-Proofpoint-GUID: lX-jFrHB5NASWL0fCq6eNd5UfRmYfI_0
X-Proofpoint-ORIG-GUID: lX-jFrHB5NASWL0fCq6eNd5UfRmYfI_0
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afbf59a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8ycGgHVmDalfDplNnMAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170025

The Eliza EVK includes the Iris video codec, but the device tree leaves
the node disabled. Mark it as okay so the video codec driver can probe
on this board.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 02e58a4bc91d455278f2ae9a3da60b02448e4fdf..b8e8c67c70b0318a7d24da8ec4031267605c0200 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -209,6 +209,10 @@ gpio_expander1: gpio@3c {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
 		    <&dmic45_default>, <&dmic67_default>;

-- 
2.43.0

