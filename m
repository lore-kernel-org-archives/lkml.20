Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793066153;
	b=r22dDFwRRY/I8CvIWVD7AvIZfsL6aU7BqvflqhTMNzNfLWnHg/Rt32p9OOpR23Q8hAAl
	 WppD3cUbGQzglvoSF8v0PErmjLwwd9eQXPrzgmH+a/lsC/3QDjiizsO/5T6McC+zAr7zu
	 JOHo1y0hg2HYLPuZr0zFTzqhrpXzoj7vhjv3AhO817cCK/KdUNK6JnbfLQ7QlUFWwOOdG
	 aFyzGWop5CE7fyG5ptvLnXCTQ5/CNJnMXXUD0iSoXi2feTy4aUIv+1nrdyTxAkR/xhbDD
	 S4jL+lzpHno8yUp69nrU6FgXjvSeel2MpLg6gv70gcebnILwBqMYAA6FQWwXxpvVjfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793066153;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mVOw01N8f93qaNHdsyiTHTU8YU7N7ALu4F7ZNIXUHgA=;
	b=aasv3mRGA2KXZXefdQV/h6wwdno1kB/+KinJjWJISWdkZXNksCo6TB3WJ0eAjnWdTOwS
	 /cDn0lRDRknRRxdT4CNFloVZps/pbG72Eh4sDtRXXeOmoDIBr0yUxXlBtPI23zdVnE7dx
	 +OnOycSerN3n/6nmxnXPt+oJMdpiqKUnBKpPeaU6V62cJDZNW5PNG/CspiCxVtKOAIt71
	 1pxph6VUnJwhAhIklDhohh/seG6cH6bQD4y196evnaW2xU0IvE9MJ+nMLDfwLk3F3JTO9
	 ZGIc/Jg5SdHqp9ydqQ1IlY3vUIe6q9BFmkMxdBrcQ71FfwhVM7MlY4WPTSpcWbaVDjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LhAuELVj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H85I+goA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64908606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64908606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LhAuELVj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H85I+goA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QMPLlL940965
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mVOw01N8f93qaNHdsyiTHTU8YU7N7ALu4F7
	ZNIXUHgA=; b=LhAuELVjKnhasKoO/qkllfXtOesRveW5Yp3ido/P4vVOOwrgm2h
	oamqO93pnWLgsAUBkFL5EtoKpgF60k/k+ON4IALTCDFxAbeZwGjQgy0TqijihDN1
	uk571MLu4lWSYwDcujo0KRYnRwA6s6sbrsCuG+nLfmILIfEhv8ym9wmTFNsoHKmh
	V+r6SHeCleMgNiIapOBBgfb2pezzWWr2xEN1+5Vvu5qTdZjSyLhu8uU5FVerlvkB
	iR7KrsZ7i+qkI13bm/mMIFAWoYQFmx97Mb6Hbwh26ELdSgDRWyoqYC9vRN4lx2xq
	VqKwk/VvIW7nd4UOdZNLq1Jl+TMp853JXPQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf38rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:55:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35cbea41088so5826335eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793066151; x=1793670951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVOw01N8f93qaNHdsyiTHTU8YU7N7ALu4F7ZNIXUHgA=;
        b=H85I+goAWA4ZTFBQC0Hpg87UlefGyXaW6pc2yKVVWb38WPrcpTjgnv04lb1s79XwgZ
         BPzmiOnNHlKrk/+MMnOm2gBS79YFm1i02Fgu2g8a5SPl0cIEfgsaSblnGU/VjE6abzNd
         T0Fu+x8H0c03BIx12mWcBrb2VQ5L2boAsajEE68M2f5+FgPw5+SUQLUjp6Yzqz16wG7Y
         FSItW+dm+AO+aZ3f4pkKcOl/3pkawBaM/1vGpN4BRJijJrabpHkQUKR5J1w7DcQuvA0G
         42cYkyf2PaNf1kQCMjbnk3lR5edK1qm2vr0/96drYuxCLOcmzr/7LozUUyUmSsw4O+T1
         wesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793066151; x=1793670951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVOw01N8f93qaNHdsyiTHTU8YU7N7ALu4F7ZNIXUHgA=;
        b=NMtgmYa6SIsGfjnA4vLtPI95xRXKNuFksu45tzCP1oEnzOfXhS86ZAnY5zYMS/Vz/W
         x4LhLdFOn4iQcLNWFgxztYgNrgAqHVvLKFuW02i/YdJRJWdFSDTDy3PnV4mwBhygbHDd
         BRsS5A/MpFVMAjXsjveJK0Q7Kd3lcybRTjbm57+qS3WZanjoXn1e1U7sCjkxJStZcW7m
         bzZa0xGxM5fgzkJpCgrVU9cD3Y1t1OgpN7+V4J+V9r9SIUEtVYjBfuNQXswdqwtW3dfs
         Bv9TU+IrXtCwPAUhsXhoeH46U/Z3nIbvPjalZ4tYLQwXiEpcbpkNSNiyrCJLMY7x3J7U
         MqHA==
X-Forwarded-Encrypted: i=1; AKwUvBxC1Q/iL27TjuBv3riGuKajoF8LE4Adi+0FksXjWfG5CUQLfPruLL+zs7wP4wO+tMnMMnSl32AaaeU8Nt0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPEOiuXSw3xEGk/IW2VN5sduVSGf8VdJCYfHXr1Ul6OUduepcU
	InSXJglO7a0PqE4QjBbHG0dUD/4yNjlsfMTdANCyGZa3W6Nuzht+16HqHJCbey0bC6G5iw1nubE
	kKEDqQRgJOIR5dCaqBkJOpBLbGBGR5s4vZNLJ14V7yhdfu+z6vW7BPIOiOdzXrAFgWkA=
X-Gm-Gg: AYBFou2C3xNgU9Azp39g7mO9L4NnI/lW22OC9ICEQtqNq+oT6Ckt53btZzS9VcmiPRo
	94hMoIP1d4jJog1iBrY9ZP0uBfTeWZrAhj5uj7aAzyo2xYSkoAFYrQduES0/9XPrJxfhK6aC93z
	vezt0Rb0nlNydVT2Oat0m9KRN7QUU39/44oWghB6SCMAASOLFM7aRcZ+03tljmcwRbf+3dy49bR
	KxHmkSYNtA/oHRBGV4aSrdtdmuvFsV20mRml6DEYVsUUYLl71kbb+MPZZLJdpgLWY1vCsZXQ0OJ
	aBNwjQ93XMLRamnH9Fd8vFA+YfLu1I8c95lmei3uoVNpKxuxd1pubMQ/gcue/4lDYy3NMJR+dbT
	qsEumoR1YfMwtA0IWgrlIz8TrvHLBeXCxTkA3bGaZ1hfFN0s9
X-Received: by 2002:a05:7301:1a01:b0:33e:c164:b5d7 with SMTP id 5a478bee46e88-369e834e226mr13349435eec.3.1793066151129;
        Mon, 26 Oct 2026 18:55:51 -0700 (PDT)
X-Received: by 2002:a05:7301:1a01:b0:33e:c164:b5d7 with SMTP id 5a478bee46e88-369e834e226mr13349386eec.3.1793066150420;
        Mon, 26 Oct 2026 18:55:50 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm33542534eec.13.2026.10.26.18.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 18:55:49 -0700 (PDT)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH v2 1/1] phy: qualcomm: m31-eusb2: Add register XCFGI_159_152 for SE0 recovery
Date: Mon, 26 Oct 2026 18:55:45 -0700
Message-ID: <20261027015545.2758784-1-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAwNyBTYWx0ZWRfX0GKfJ4u2xvxA
 3BO6w82N/Mjc+V2bm4QWrlo4d1vEUJRfwwbfST0yqvSNQyAruR8437B+zyrKgoU5tk3KhG1pg/9
 RyBQGSX7cH8IFpM5HaNdROZZtYfEW3I=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6ae004a8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fkmqLtjFOitS6APqvyEA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: GfqZA-YDYcgI-VEUGxXGFc5zibnoqqcm
X-Proofpoint-ORIG-GUID: GfqZA-YDYcgI-VEUGxXGFc5zibnoqqcm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAwNyBTYWx0ZWRfX8eLYXAbDR7BI
 38yKLznnmXElJCuULPA7HAUmmx8MD1IdCevxl0081jzQ3DrseHT3qQN5wx20BlQa39h65Yyt20k
 hWZBepDHkf6MtmOt5szLnHm9FkRC1RdGB8t1HoouUwLl0iHiN7sATqbMQqbsMoxiPrs1U3RWcDz
 y8z9yN2Y17+KdqqBncV9+lZ9BhuEGYE059KPvakLQCs3o6z2VOPJPfokVoOJ2iql03JIfAYOuRS
 oabuLLJEHDpvAOwC6nXYJIC9M8NOqbiVjM2VCg/moBkjXSqLVwek1hlq30EDjKOV4VbuJWOmGHm
 W6n770jjx1mZPi1nVNz24WBrBc581t0/jMJ4ovaEK3JGJ5ITvHdveZsKC3hu60yzxap6C2A5mle
 akPp5J4Sy5TPq8jGKMLd+3m7frxxVlgdhC7pQCVKkuGTlOgqlH+eo4ZtafANgMix1wszCJDkA0f
 PHCSyOe1dDNnFRZa0iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270007

From: Elson Serrao <elson.serrao@oss.qualcomm.com>

This patch introduces support for the XCFGI_159_152 register to enable a
hardware-based SE0 recovery mechanism in the M31 PHY when operating in
host mode.

During PHY initialization, spurious pulses from external devices can
interfere with speed negotiation, potentially leading to abnormal
behavior. To mitigate this, the M31 PHY provides a fail-safe mechanism
controlled by bit 159 of the XCFGI register.

When XCFG_SE0_TIMEOUT_EN (bit 159) is set, a hardware counter is
activated to monitor the SE0 state. If SE0 persists for more than 2.5 ms
before entering L0 mode, the PHY interprets this as bus inactivity and
resets the state machine to its default state. After transitioning to
L0, the PHY resumes normal operation in accordance with the eUSB
specification.

Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
Changes for v2:
- Add Fixes and Reviewed-by tags
- Link to v1: https://lore.kernel.org/all/20261020061811.3127511-1-peter.chen@oss.qualcomm.com/

 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 275df38256de..8d954e772585 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -56,6 +56,9 @@
 #define USB_PHY_XCFGI_7_0		(0x15c)
 #define PLL_LOCK_TIME			GENMASK(1, 0)
 
+#define USB_PHY_XCFGI_159_152		(0x1a8)
+#define SE0_TIMEOUT_EN			BIT(7)
+
 #define M31_EUSB_PHY_INIT_CFG(o, b, v)	\
 {				\
 	.off = o,		\
@@ -88,6 +91,13 @@ static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
 };
 
 static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
+	/*
+	 * Set XCFGI[159] to enable SE0 timeout mechanism in M31.
+	 * This enables a counter which will assume bus inactive if
+	 * SE0 is more than 2.5ms and reset the state machine to default
+	 * state.
+	 */
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_159_152, SE0_TIMEOUT_EN, 1),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_39_32, HSTX_PE, 0),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_71_64, HSTX_SWING, 7),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_31_24, HSTX_SLEW, 0),
-- 
2.43.0

