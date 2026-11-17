Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905176;
	b=UzZopGOrmcJt+zimIZmuH9Xsa+Tle9OFO9d8GWj9bFHs2fLkzNBDr9Agg2bIaDABlxJT
	 G4DXv6oVo9lJJIHm5DZ/GwM+d/9uGfHfqIxqAcxhqFi9lRfoFA/AdnaVM9PtqPIwwUOCZ
	 7nSIwfzAmLvhECntOhakSEJMV+Px34+ulkqivndU4lxxV6B4pxW79qKeRmtgR81cZROnJ
	 6Vw0VIcWX9EXEWF4z9qY1iQbIhEP3PqpDfhjjeaZEiIyjYZ/bZJN0Tfmg88dwNJGGqhzz
	 N1A+vkMRpCVu2mmkNFJpOd/DYu4mNcoWuJQ8G3aaZwF6iYBVnDTtAoHRVfzGx3BvQeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bAObOgv4fSLIH/J9Ziw1VGMImzcun+B3vJBISd4JBTY=;
	b=RWVxNdIFoyGGRFMIZY0HMpgeu6ryVBiYx3WJo1gezhrgr9hNEC50Qs9VSF0R9y/2DGta
	 QbNg627IYqFu9agPYXTxMbgt3nezca2/VwebIoza3K2R9U1oSZ0qY7cSlPYyoFq3fcKqa
	 t8VF0vcLyk5yox+rSrYjfe/kL/3bn2di4eCym0TtcX8IuGBKp2qxYKY4jrwHkDNJBNefm
	 evvy3P/6zuFlnZxLBVofUpFtyhnehDL8ioOGLLKj83Zv8pozTIiG4t+tYEhQTm8kNhMNY
	 Or5u0NZ1x2ufFsANMsPbbzjFD1QrEHvV8iOOuOHJyUCKverJ4C2+5deLjmf3aO24ocw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M18rxBSS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YLMZ+iF5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7000606A886
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7000606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M18rxBSS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YLMZ+iF5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aXgR1801438
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAObOgv4fSLIH/J9Ziw1VGMImzcun+B3vJBISd4JBTY=; b=M18rxBSSsEMhIqJr
	PXBfchimancq+y9b5XcD7PidRhr3x16OH5bDcp/ELGm9t6bM80gRzc2BdxEcQI6n
	pB+jLk7DbkclTK2SbrvG3/BYEq6w6H3lvbSlfCV8JvixxJ9h6ZZCIPAjgcZpycX1
	265BAY30empgxsZiZnud3g8EEBQVkSPVHs3xs/XYOyuaK4hp71FscYseeD52IfFu
	o6+mxmm/UDL8P0YkMuU0Hyu8Cks2shSchWkwhRGIs+krgO6fPieRm/swGK6sVBHM
	cDfSNj4ZmMa9vaewQmHwNerPHqP3Nt7m8z8pC4vp0ePkQ3FXnzkSPhfldn4lph0f
	G3Iisw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y3xgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:46:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so4014875a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905171; x=1795509971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAObOgv4fSLIH/J9Ziw1VGMImzcun+B3vJBISd4JBTY=;
        b=YLMZ+iF5FndT7Qs8sovBrfwOQMh7jRsYghGLfxl8N+Wzao5os1W/kP2hvCKvchkvg2
         zUUK8FuuSo31p/BrS96dhf8xjxGqE4uFgckSsFtFfLHBGjuugu0Rg+Bd1w+olriTRN7r
         W9nJ6varzeDQ5DzZ/IHVUQ6NyNKL7kO5ugnLgfMK5xMuDhb+/bHLN9H5ySy4T9YvK4iS
         K4tx4vc5HG1UxfgDnOS969ObIQu4CL32dZ7uOemIacQya0soFlscWPZbZzxfTc8AQSEb
         BCVZK2DGTgFy1AtMeXKdMuor2Bjz3JeTGvKcQvz2cuMMgKgx9NyS5jKtCk4Njo2qKCFv
         1kOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905171; x=1795509971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bAObOgv4fSLIH/J9Ziw1VGMImzcun+B3vJBISd4JBTY=;
        b=geTmlYwJIuOJQpJNRb8fSe7O3l+jwhLqTWZWczJlx26x/ZJD2JRf6Arb9LY4OrgIil
         sKhXFc7f3NuOm0By58ehQ+iaxjlbCmL+/FUzoI5Sqbthrd9aux7te8zO/jzmFkHU5+bL
         EKYkhjul3XfsDyVcSqy7u7j95kZeWIl2Qgvtvhq/VzGhg50P8x4qUouMbtt0F+O1TjCP
         xEQiyU3RkYfUYne2lFGKNlKEE/4YNOlEALK29Ss0oQeobTTqb9sqVaT1AsQ3J64GcRTY
         uFEqBiUbxAMiJNdnAydqy0CW3e14PaV8rThHexjSGGh0O4+s9gSb50LuiKl3dyUdsiAE
         svag==
X-Forwarded-Encrypted: i=1; AL+hErGrdaHpFyH0CClIhailApcARS24QX9XIvwb+V3YlZsFkH944uMbsab1kK3i0gtoTHyC508bTT24HUCfRe0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XNMY3E1AODaxyOQ7jteP0Iu4vsxqb+NwWlGEENB2RXw/Hrs9F
	GM0o0qihVDqyy8VXiBsFoHvMgHmUdQCORaPXFUIJTQf+EkRSTnOZCQBFbeYT50gy+uL+I3+CSyU
	QlaeIlRRgEiuPqC9Tuh8W5R5l/cVfiqnR2gUapKhhCJGUFWRXfhoJwj3wmeG0xBzcKmM=
X-Gm-Gg: AZFdTZcPP2k+Hhb84ThJnYE1UhaHjWSBKvQ7n5vNWL4Kop09O50mQWUwD/No0yDl6xy
	8nCgyIPgIfsIK9MMmlVJHOqXIy53CwwYaS5fSBRy1/G7Qmcp0ogJlVJ2quAVo+l8IPe0q5lG5Xx
	Ya/VYF2so1OBwRDa12bw8vBm5zjETbYY1Zunafiw+RQbTFNEoaYH61A05qRM6fI5Aou6ZxPLA5T
	YhX/w2/fuVuljsGrqyU2211/9gz9UpLj6AywdrzoMV/irC9unuotJ2IevQo+cTZo1Bzrr2DMZy5
	F3TLznq4AU4zzAiPbdiB39nc2xmNiNY2bj+fxfDY87ANBhXjR8qPECufP9y3VaIrlqqRfSBbpl7
	Ogfs7shOcOfILCon9mbe1Ztx1Vs1wIc80Too9nlm7LyCJO04K2xqNZg3w7XVztD0zMKDt+9hNQP
	pusg==
X-Received: by 2002:a17:90b:3b4c:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3b1b0a1ff62mr12688279a91.14.1794905171043;
        Tue, 17 Nov 2026 00:46:11 -0800 (PST)
X-Received: by 2002:a17:90b:3b4c:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3b1b0a1ff62mr12688235a91.14.1794905170522;
        Tue, 17 Nov 2026 00:46:10 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:10 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:22 +0530
Subject: [PATCH net-next v4 02/10] net: phy: dp83867: add regulator supply
 management
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
Message-Id: <20261117-shikra_ethernet-v4-2-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=2626;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=YMQ5tDefjahp4F278sVpJOmFjvs9217PzQ14SbOl828=;
 b=9DYxR2LtiyVkshLd2XOkW8YZL+bGdidE43jGBndpxcLF7Y2Yr0ul8pgYXZ21EzTlUrEcetxJD
 sfHhXFgqkVMDGoUQqCaDh5KFdnJser9ZSG4dFXK3H3x6st2IkhTedBJ
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: 3rF-sSFRxO-6Tz4BNkYp1kP6YWO9rqdo
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afc1454 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8 a=uuhe7hOpKvpPPjRdXc0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 3rF-sSFRxO-6Tz4BNkYp1kP6YWO9rqdo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX7lTjM5N+wHZ7
 vQG5P7Wi2O5AXZeFf4Tdu5aXgBffTwWN622mc1V/1KHd2tGSdot1vfzgdwT7mDHzO91RNDfCGX1
 Qa/xWj/ILCA8Nr0Vmkq89cc1GppyQvA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX1Fwbh/7Znq4h
 1aXzXoJ9YTHSka/8kUogMagO4lSUYp2hqOKAj4nQ/g+vGCI8zwAsqF7AkyLOmPUXOJG6kICK29J
 vJYypMKuS14BK5SdLUCscjTU3cZzCxuzUZRf7zyCZ9w6ibvlNSW8jrYxMoMw8eXesPcooMHKq4V
 WDEA5OZHw2hnKGfw0e2AeukXG2M5gRQDcSr2nawCDUP8uwdH0WYAp9ucNGk55g0UAqFDH/aSl24
 /SxFS7Lb104yC9RbXjrcXNCLrdC8sPcEaMvmQAjQVSUGD/YKxs1s6N6G0GDbtT0ENKKbwJLY6ir
 Q688Oqje+uMsOCwIviQVXqaeiS3ZMjpR+HA8wPMFFQQrYIN+14ons7SLJmNHRhyx6ootqPue8Pd
 eEwOn8AxgySSZ27flI4Y5iTAX4KYlziAG1fIIEUdUhLqbVFz8nRrx8Cj29K/Z6jZCmlUZsvsltJ
 igzsOVJzIhMMmeE3e/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

Some embedded board designs use GPIO-controlled regulators for the
DP83867 power rails. Add dp83867_power_on() to enable all four supply
domains at probe time. Absent supplies are silently skipped, so boards
that do not describe them are unaffected.

When any supply is newly enabled the driver sleeps for 200 ms before
returning. This satisfies the post power-up stabilisation requirement
mentioned in section 6.6 of the DP83867E/IS/CS datasheet.

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Acked-by: Andrew Davis <afd@ti.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: Sashiko suggested adding a check to skip dp83867_power_on if
CONFIG_REGULATOR was not enabled, to avoid unintentional delay due to
its code stub.
I have kept the Acked- and Reviewed-by tags since it's a small if check
requested by the AI review. I can drop them if required, please let me
know.
---
 drivers/net/phy/dp83867.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index b4b4931c6f8c..ed8b3089e8e0 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -16,6 +16,7 @@
 #include <linux/etherdevice.h>
 #include <linux/bitfield.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/regulator/consumer.h>
 
 #include <dt-bindings/net/ti-dp83867.h>
 
@@ -730,11 +731,45 @@ static int dp83867_resume(struct phy_device *phydev)
 	return 0;
 }
 
+static int dp83867_power_on(struct phy_device *phydev)
+{
+	static const char * const supply_names[] = {
+		"vdda-2p5", "vdd-1p0", "vdda-1p8", "vddio",
+	};
+	struct device *dev = &phydev->mdio.dev;
+	bool supplies_enabled = false;
+	int i, ret;
+
+	if (!IS_ENABLED(CONFIG_REGULATOR))
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(supply_names); i++) {
+		ret = devm_regulator_get_enable_optional(dev, supply_names[i]);
+		if (ret == -ENODEV)
+			continue;
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to enable %s supply\n",
+					     supply_names[i]);
+		supplies_enabled = true;
+	}
+
+	/* Datasheet section 6.6 suggests a 200ms post power-up stabilization */
+	if (supplies_enabled)
+		fsleep(200000);
+
+	return 0;
+}
+
 static int dp83867_probe(struct phy_device *phydev)
 {
 	struct dp83867_private *dp83867;
 	int ret;
 
+	ret = dp83867_power_on(phydev);
+	if (ret)
+		return ret;
+
 	dp83867 = devm_kzalloc_obj(&phydev->mdio.dev, *dp83867);
 	if (!dp83867)
 		return -ENOMEM;

-- 
2.34.1

