Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742071;
	b=WOkW2BuPiYUtyX9RSzHVwsOPVhsxNLlvK++UNas4/TSv5n4F4GJH7c0/ACnr+EqaCnya
	 nJDlK1tbedreRSvBCwSmJDk2CS2l50AXPc4X99ogHzCKEE/LNuV6YdqnYG6+sL+pb/nGr
	 qatYn/XW16m5V9JLSlJ7GwRsRvmf04aPt4rfFkzsMDQZvhUEDKbNJnpsjMbHiIIkO6b5J
	 vd1hzi/hwG8M57ccwlK9et3vDd09pEVrcEp0T0wTc8P/p73DhDsojXFEYyOplwDK1b1Tp
	 EpLdgroZ91Mynkqmw2rdDYLPFVWrAS9T15LjWCgBO6JXSy/paQG4X6NpQr3n8MysYVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=poSSODbWEoxTyPL5Lk4+LMqs3YK0EF3Oc0Nf3TL++Y8=;
	b=ow/f84jQQf1CzjaT1v8o6Oit3WE3M+2lptogeodcAjExfwVgTNHqaV4jDKw6eQ20Jvf/
	 AH/UwosHN38D7uySJrIcqloe7lfkqvYRElx96gp5pzzokmEabEghbcu4JjL816r0GDfMy
	 rQABIJSGjlijHSPJN0C405CdJB7AlBp6VH/iprtpd70IdG43Kd5yM3u24kGcgwfre0uE2
	 odf10EzoTrDtqkR60MdL8QfaR7m0BNnmDj8AdGyfnYeSIDTT0L5kEHK+C4DVsQqkjpwvq
	 bd3Ro72r/in4fTjJHSosZnQXk+Wa3fJ37rnC2JU6JxgT73qgTBoSK1TwCo5uQkseQaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WCGvaw9B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T6KVELgu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F348606A336
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F348606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WCGvaw9B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T6KVELgu
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKpsm3065598
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 21:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=poSSODbWEox
	TyPL5Lk4+LMqs3YK0EF3Oc0Nf3TL++Y8=; b=WCGvaw9BNgg+n8BWam4+pgrlVpT
	Q3WPDyP3w+uLyxXN3t0QKyVAFgkVixJ9TYP6BD1FhVOtJqG5J37MkRHB/QQf4ih1
	qZJCJnyGUIkz+OnyNv1Hpy/g4bHKxylkfGCmd3G0UCIoC7dnHf4H5cY1v8LoFinx
	E6ADBCbX9egBYrS1EUAMlk3oxLEianPOt3I8F5awkco5UUEvncXSjujyzyVSXmqq
	/NG+Q3kyOAESg+TcW2Og6lbAt5RV0KlHmO0A3D6QopdkmQSAaU7QusvdCzaR+2Qt
	px9/8hoh+obNyigvI6bYsPjcy4PkfDvDcgYP8QduLAEgVBS5snZAuW5/heQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bswn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:41:09 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso55747c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793742069; x=1794346869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poSSODbWEoxTyPL5Lk4+LMqs3YK0EF3Oc0Nf3TL++Y8=;
        b=T6KVELguYNSYMtaxHGd1aPkuQdpocmnf0MT8p5JDFXoAXTB3UDC4e/HTJWhwM45mbo
         7PhcM6TBQ1oNZbtmip6iCfhYuqv9+VHMS4dYGtHtQYemr/CXKQtIqA1revjqL3TcZXEf
         UJL3F+PQ61MPZRipiE88ZInhV8deT4lsjKsvdF4yqCar0ZvV20F3rT/Px4KXeqlR2K3v
         0XvCBtBHP0u7Sg5j5y5fPK3uH9RqOqmTNMkGU2iOQlyMXz7EVXQFzIfnv8vc0UKMEZxz
         7mpraHzUCWEC+bg+xcxEiUKVhfR7bCakWu9bKgc1XJSj9qMcgGZoUj48UvHjIjXTHy1G
         8Q3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742069; x=1794346869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=poSSODbWEoxTyPL5Lk4+LMqs3YK0EF3Oc0Nf3TL++Y8=;
        b=Adv1T75oDkDYx+a1c2qqnVYWWowWwStarLG+xKlUIGu8WNlOVQO51Xp9bQX01V3H7Z
         Z5veTFEj9N2c2UO2vVAqePSK8p4rsowNdd5wK3Bs1KYt8HfeOybXRoocUNyGHY73056R
         YqTGPz8OQJSviju57kdHs2IZEO82GhVH/VNnfMCx77lefb0sLaGK6zwQzV1cj/l9yxLo
         edtUqk3EulygtnNFqrzM8JZZkz548njXcoexPeIPytwyzfafybrob9T0Kv9pBnbhLdcQ
         QjFS5y4fzyEg8zQ7VS1aGmPswu9EwcgLaFRXOMYz/vEiJRQZP9aULhPTdZ8WUA5Cvu7U
         jcug==
X-Forwarded-Encrypted: i=1; AKwUvBwOPqa5bimCT245GbRKNdpoHhM08pZvRQinnYlFrC7c9x96T225ToQg+rIr5aVFWj9Lo0joxYB2z1SfDFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o6oZ+uijMpxS702KfJV7pH6lkYwPHPTo1fHxk8+xK5vMr2qzw
	/tZ4cNS/pHcg/3GM098e3HoMcmpmeefEZ103eqmnrQG4Gk2IevjTnEaYVu043F4JZ0A8D6csXNN
	6SRIXQiw1JUQunXbHuscefEhpzFN3teLX0yUrcU1DzKW+pGmiRA9H3RS1zwqBWsdTa6w=
X-Gm-Gg: AYBFou2Vem0/YE1/m+i10a0/LVu+vZp96v/QN/J2RJjULFxj3bUuQOHQPfOzC6dcC7z
	r5UHabKdznFdeST7RXXcaUosywQxHLbafHFRgW1nEbzU+aZ55HOfZHwgwR4qInm/NnY0Om9PHUD
	GcOuBElzgk2YC6ja4Sed/SIt9kSa37jFwUOAAo/4K9LaJqSSeFG7Dkyr7yUSMBZ257izH1q+g1o
	xZ5TVI4vYYIDO2TRF/5vAMDdPWO2LmCUnJ7HAQ4KDXn0Xy6YX9CkA35tqVhEGnFpjdtrc9J8OyY
	Y+6Wd0NdbdEe9c1dF7mqiInNsd8Z2u373kv7yPo1/xubxpx1WXH1iPbPcGldh/r4NKkb+A2Sda0
	FIycK4Edew3zwSb9ef7Rya98s8hCZ46WCupfjmtq38C2wXjrpnrcVQWuFE8MVMrQHkCwmWQyVWP
	+ZK8fEPzO+7hhdsPl4cIr3CKfapi8=
X-Received: by 2002:a05:701b:4186:10b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1ac4f91ee96mr22118942c88.0.1793742069115;
        Tue, 03 Nov 2026 13:41:09 -0800 (PST)
X-Received: by 2002:a05:701b:4186:10b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1ac4f91ee96mr22118916c88.0.1793742068608;
        Tue, 03 Nov 2026 13:41:08 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm1537440c88.8.2026.11.03.13.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:41:08 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] phy: qcom-mipi-csi2: Make timer and OPP clock names configurable
Date: Tue,  3 Nov 2026 13:41:02 -0800
Message-Id: <20261103214105.3605181-3-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
References: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX+hGvdSbuQ3Uw
 Z6zWK15THwuQ3LDFUt2GDdlEBK5PITzz5WWEWNm1K4NYW6Pk2DwfMPPKu01S7lY6xC6F7EXbYnr
 Ii4nUnaYV7ykwUR3M+wAY8Euor9FqSc=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aea54f5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=YDrJLkQi9lszU93BSgcA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: B2jzRTS0qYshumYNmOvMaFLGd6PrE960
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfXzFTXX+N3KVzZ
 4fzy+tF4gxr8vZudiSJm46FtLfG5AfZrOsK+fjxMNETTEDcAUhQBvJSkh3pf4O5Yt6z5QbvRKBm
 4Svt8d5/5UvmyF1YeqBMub7UYOXz1eWO1ET1IwTfLbJe1m0NMrHf2j66B9EUl7pBVJQLaeyuSRp
 brDJXMo8Fl9oFmkGe2lPEYeaRFt9OTNRdXrLdwRHnHpRzOIU7pgK/43VqZlvxeSVwsRkgEoIxd+
 v7+NOSDmXHMkr1MmsTu6S22F6dUSemfsu51JXv4+GnC2bnXyxzRjT/cMpYkwEIxpUK4VHnd/azS
 OVVcMrOay7IRDQXgSFIGxub7SCDwVhj/Z/2dHpK3CUNAqOw9+yDxhcx3skqeg6WPh8cp6mtorUY
 PNwmkLK3iEUFiw8BvSmqb3cSUG5GaHezCg2EXHBqedtZMJnCaXIR6u1ZUxsUVX2RdPbMYJNgRQ7
 99BU9yoqAb+293A6cGw==
X-Proofpoint-GUID: B2jzRTS0qYshumYNmOvMaFLGd6PrE960
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030086

The timer-clock lookup in phy_qcom_mipi_csi2_probe() and the OPP
clkname passed to devm_pm_opp_set_clkname() were both hardcoded
string literals sized to x1e80100 ("timer"/"core"). Add
timer_clk_name/opp_clk_name to struct mipi_csi2phy_soc_cfg so each
SoC can declare its own clock-name strings instead.

x1e80100's soc_cfg now declares "timer"/"core" explicitly; no
behaviour change.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 2 ++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 4 ++--
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          | 3 +++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b..8f1939e81e13 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -380,6 +380,8 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.num_supplies = ARRAY_SIZE(x1e_supplies),
 	.clk_names = (const char **)x1e_clks,
 	.num_clk = ARRAY_SIZE(x1e_clks),
+	.timer_clk_name = "timer",
+	.opp_clk_name = "core",
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 269232499fca..3de25728ed28 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -397,7 +397,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 		if (!csi2phy->clks[i].id)
 			return dev_err_probe(dev, -EINVAL, "Missing clock-names\n");
 
-		if (!strcmp(csi2phy->clks[i].id, "timer")) {
+		if (!strcmp(csi2phy->clks[i].id, csi2phy->soc_cfg->timer_clk_name)) {
 			csi2phy->timer_clk = csi2phy->clks[i].clk;
 			break;
 		}
@@ -405,7 +405,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 	if (!csi2phy->timer_clk)
 		return dev_err_probe(dev, -ENODEV, "no timer clock\n");
 
-	ret = devm_pm_opp_set_clkname(dev, "core");
+	ret = devm_pm_opp_set_clkname(dev, csi2phy->soc_cfg->opp_clk_name);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to set opp clkname\n");
 
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..359b58660db8 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -68,6 +68,9 @@ struct mipi_csi2phy_soc_cfg {
 	const char ** const clk_names;
 	const unsigned int num_clk;
 
+	const char * const timer_clk_name;
+	const char * const opp_clk_name;
+
 	const struct mipi_csi2_genpd *genpds;
 	const unsigned int num_genpds;
 };
-- 
2.34.1

