Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477101;
	b=naa8ReKoJxqTpxJBA5TXj7WbK6I374h2jlEqG6i3OTsTx6jUJliF2uhzFkUIwjXYuu1d
	 tqMqJR7xPQg97PZHNtcIzgcIr+pPlJbCbz/mPAV1HGfQmqsyvH7Rd9LOtL+YcxsibdQsW
	 wYX2PglE+vMKQlqwqe07mrmmt0s/Hk+zngh5HlR9yOubJaI3DYyj1CA9zm0/3BC2TGIlR
	 uhPuP77/mB7xEonhEEZqZJ+ZDG+kCMJ2aA9G4freMDz3RaZqlnDI4jhAs+0+qleINlHAK
	 zpLVEH28Nqb8IksUR0uIqXyVNI9UHkoSsEU3vFZ7c7ZaepK0JISaDBb5L07vvrYzZ0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XAsGOIGfH/JxbAjnzlFqcJgkwSEZVDVRf2rQqbDcdDA=;
	b=jMg/6MZPDLNZr2zQdwvESU0s/IdD7zhBvUh81kNr59kU/Yw03iEH/j2ZnONUDCR+U+eZ
	 Ix6Lv2/PwfxEXl/yRoh2ELBdyQ21Nc42Dt35COg1LujmDcmxibovr+bXNqr0rDF/n+lHu
	 xmcitLYIealyClxyhYf+3YdBI9h2vHbCeinjrWKPU59axNVdxfAwSVska+nHqVSfs9gbs
	 gRkGN7pZuWFPCFkXApLthXf8FIHUuIwcbM6765q3tJqbmudspYuljsF/rpohBYS93HJWU
	 O4cD6cfsKvIKWLBmQd+tKm/aXd9YteGFuscjg0MxiqJmXHV/9hua3gTNh0iGinj6vWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bv4vtO5h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="C/xxifIQ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E84606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2E84606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bv4vtO5h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C/xxifIQ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tjKa620796
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XAsGOIGfH/JxbAjnzlFqcJgkwSEZVDVRf2r
	QqbDcdDA=; b=Bv4vtO5hJ19j7WBJjuthUVSk1Xab5xkRnWlcGgN5wNNLO2sck/N
	rmmmEodSWVdUvxE+Dm/XuseswlLrCm+Ppbmm6EgiuYVMSg45Cy2gS0zsBfR27zl/
	xtFY0fPxHiJBT11okZIizTxzQvARCyWUz3hwtV+b/aqzLoYzVzKSeZWjVGctBcW7
	6pbtO/1WwdzjDU+W8D5dveTSH9edKtjeD4OiT4V9BMFAa9H53dlzQayu0571rk0y
	u34TwaiWSDzu9h4V1CnHEkviCxKvutgSgNRYQpb3U2aPBPKXRIgjioMImHsqaut4
	wgJN6zE6bEwQ3XijPjdgMcL3TiBVn7Pu84A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ns38k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:18:19 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-186c1aae818so4255553c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477099; x=1793081899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAsGOIGfH/JxbAjnzlFqcJgkwSEZVDVRf2rQqbDcdDA=;
        b=C/xxifIQHmegt9SjgkuvBsKXLrZq2BtyIntAh6DzjNIq/mMoqxmXf/pHwO0okiDzkl
         8OK40aJVKPgag7GPtkIyU/lpIV7bKJt1FmnK6WdXaiF2Ydlj61wSM4mcqr84GXaPAxmD
         i68xaQ+l7vVQuRFEBqaHQlrOiFEfXxbSsKcXNA4X6xrpeDWzscjhXZLy4F4HZLexAHlR
         JkEwwgn1yr2/yuFRn/7ObDy27yr3zB/RdKhy6440jziF73w2T/FTbqK+EC4+8Xl/0Mvy
         9xBRS+QvU1G/hdXcOTxzL60f27xedVC+1yf6TD5MHjFsuIeUDTIVtrmJYv21iuRU1e/x
         KPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477099; x=1793081899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAsGOIGfH/JxbAjnzlFqcJgkwSEZVDVRf2rQqbDcdDA=;
        b=CYEvgdafzxeANl3u3PW54kbmhq+iG5aolcDU4VpIcBNlR3E3QIaaID38H4r36yLJk6
         XIhjRlZPwDKOX+pdnuuEC6lh0JNNeU4rOzjHv3zPcpxwKuZizNDN+1GSUx4wRPsdRLBy
         6xgufjcrJu25p56uUaUJtvoMqs/QplqhanDTYLdHtu2bRQ6H9N9qyx8Vw9Fu9wxJ4Wpv
         qeQi80hdqI0GK0+I4MJBf2arkaYXP1ghurFLlgm6S4qESWzPdGBtxmJqfbJi9qey8uV2
         HlP0E001EwNBQWlZCFeGD3JjcBAsZZuXcleSdnnE6aU3MIeWgoqgYXpyhKkj55tkrJG+
         ublQ==
X-Forwarded-Encrypted: i=1; AKwUvBzl+83aIkbuv8CI/4lN0zMM27A1NX5jMH+C4JiSbgH4Nxmw12s/DnLRQDcdVALaOQtfmIB1sX55iddHXzc=@vger.kernel.org
X-Gm-Message-State: AFq9FYITeJHISPzDlQ1RI1St7A3s2E2gdUbvwJpqzgTEcYTWb9SMQs+M
	v+so7PbH69AijX+zotyv2ZWonK7IjwPeW98h/6ey9ONUnj5V6eJ07gyzZ8+6IgeteTV7r+La1zN
	1vpK6hDqNDTVkpolYIGMnheY88YGX8srhdjl/bISTS2iH7SW/ZdJ9ag+VPMIUa9QLWZ0=
X-Gm-Gg: AYBFou3+AG6Qor5KxOHikysrlVqbTSnDC1zjdQCipfCgIWYtiIev6lk4gJsvRjkmlY+
	Wuie6fZBcPV+M1LJfit18PvsM3OX6aMdthDU9HV3f2BUd7a0surZJyMbDM9zzPAC9hwRkBA+OU9
	/6O+xalT4JYXYmvyeaXSuaGT7f/SSxYA7hOb/eXS5oJ4UR/EPuO9nXmGPYD5oNvxjvCkr93sT8f
	ILJDn9Bsk/N6WLD5rpHxf988GbdK0VrKAPpPOhvjmWyJ61HwC+urfv8Crk+ta44FEIRIuOlb6Pw
	6sv1SlwgM3tMk6bAk8OTwHIwFnvU21H5geXsDKGz1mMIkNzwombcylaHJSyhjvg9geT9UoQJJLG
	NlfEhp9nVUygBbDqoShOc6OvVpAOntPxVQwqfLq4Hn4v0ikm1
X-Received: by 2002:a05:701b:4518:20b0:163:d97f:96f3 with SMTP id a92af1059eb24-1850ce9e858mr13860655c88.4.1792477098557;
        Mon, 19 Oct 2026 23:18:18 -0700 (PDT)
X-Received: by 2002:a05:701b:4518:20b0:163:d97f:96f3 with SMTP id a92af1059eb24-1850ce9e858mr13860632c88.4.1792477097963;
        Mon, 19 Oct 2026 23:18:17 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ca95700sm33197858c88.23.2026.10.19.23.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:18:17 -0700 (PDT)
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
Subject: [PATCH 1/1] phy: qualcomm: m31-eusb2: Add register XCFGI_159_152 for SE0 recovery
Date: Mon, 19 Oct 2026 23:18:11 -0700
Message-ID: <20261020061811.3127511-1-peter.chen@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX6XR+hmM8zd16
 NfGr9RZE53GwgEjkCG8HIw5CXh7Ewhnb6opmNBEwTk6s/siiRAjsFdbpZO1fyeHCMdrV9XtccNb
 wUqPlW4Ke6xicZk20mLoz+OLbl6lKOc=
X-Proofpoint-GUID: DVUjv8JHvJZXyP-v3EM-R2l6OqEI8akI
X-Proofpoint-ORIG-GUID: DVUjv8JHvJZXyP-v3EM-R2l6OqEI8akI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX46MwsRwyirqO
 uB6HXS5I5JTpPLep3t0Qqcyg7uImMEDyXdrqXdShIzqLqPTFEzVhKNckAqNrJgM5bxIKZBzw5wD
 rV4a8uZn33u/tUr8F5DyX1yUdA/JWyGaoAwLGw3xPosvnEf1t60txnsevzIkv3sXpEdLGm0xdoM
 aIQER4ayb1dP+GVRPrDKxZcC9Vna+lRpZa6MHhVBIG8SCLLJGC+LC3+h08gTV0bD5Wxpyoetpfq
 1E5vPPgi9ThcgAaESjTHCSaWdc8GwqzUIHBwQ18cTyBO/qDwhpi0xCwd+mcaouTCTq0tiSr569h
 6hQMFBIlXmdUWofMaI8DvEPrzEx1Pc2CmU1cBYABZeuO8Jrm1RJ8bG4UUumrPTqkdNiZsMxHNjE
 KXV4MJvP9olT1fjYhIbQQvk2eJEZv3f3zs5y8OgypmZT57m51tixazpXmIPgpLgaaDi+J7xIde3
 Y12w9nemOy/JiY3YsKg==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad707ab cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=fkmqLtjFOitS6APqvyEA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200024

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

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
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

