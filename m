Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655840;
	b=a7QWXgUL1soP5ytz58Ek/gceCQ92D9aFZHMgNvj41VA687jimNSrYhHbBabOG8aWhHG/
	 /rdL9jesjkNgwO3Ux1zHIApbB2vyjNgzEWwby4PFr0V3w06ZTS8Exj8oRXN49YahZ1gKA
	 SJPKWlvMlaR0RzAJ3skQdNQEG9zxsjwvz8mVymHkRFVnI5WpI5npHCXEATMfU8ixZ4Z7k
	 C53BPSk5eftaxvH92rkDZCJyhAPcuxcYeZBbN40V+NKxX2MgIoEHkkyNZ/YEaZEQzqVK2
	 GlVo+wrSTudUy8naJYNfahYwQmcm3IVlfM7lNXtW+SzmelAO2B8jxBxrnCJn+gKtQSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JtnzJyvk1KhH53ox2qEGTYmgQHbNRK/nZXY80+689io=;
	b=btB64jMtOJIVShT1D0oWrDZFlqHz9j+IISvv8FeDQHmZYQpCZ+1/gj8Lq8a7Tf9HBrT3
	 J+K0Ao0HEvmYqXi94wZrJJAFvF6613deqvpRzIWP9KJgZ2z2MPoBNOW242Z3L77wQYQDJ
	 qqUr2/pKEmxSH5SiB559B1IpwBCzY7dWg3cEPPKvEll8FUtS3dbU/uOfsXuDLr3H/xXB6
	 u1DViatTVN0mbOg9QkyBQx3B3ju7Uk8llPFX/Yfr3/ZTKDA6Cxo4rxSeSwfz4gVr0tnfj
	 Zjiw+Us8puIAnY0QBe8Df6PtFtdVO1IGRWp3fUE79CL+gyUNomp7xMeaXGm9a/eCe5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pqurAJuF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bc7ziPU0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983E8606A897
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 983E8606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pqurAJuF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bc7ziPU0
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wBvI173884
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JtnzJyvk1KhH53ox2qEGTYmgQHbNRK/nZXY80+689io=; b=pqurAJuFTeiYXqDV
	PyIQkXvxpjpyOy9IqxV9p6GZJze3lWc3aHDuaHQxtr6RxRNlW8+MsC8+84GCVfkI
	5DaXgM+Cy0efyHNjf8yQdoFNskRnxVVOpvJCc1bvCCHlI/Rt+VsVPgeo7BKsjwb3
	XKEsbr/3xFQVB4ss74w2lVoxko9PIDGVoJ0wBJgHN5CsYSN09dXpIR5RI9Bq8bLt
	4omvte/5mvOkWdRsBKB6pETjJ98KpvnMLwqxG7JvNFJRPSpboiZTEasOfTuoSsq4
	YEmjCDkyHFLTPpEgvsL695fjCrtpuOVpyZdEXersqS6/EJ7MbdHvaK64FxMRYRRT
	lXZvcQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmagkfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:30:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91f1b3070f2so36859366d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655838; x=1795260638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JtnzJyvk1KhH53ox2qEGTYmgQHbNRK/nZXY80+689io=;
        b=Bc7ziPU0uqwTepl5svhOvaFNo1R/P6fA7OYtr0UVoF1gR0b/UvIWOPnLrpTTnYH3p5
         1C0J3UUO0xd3Ply3G49xmiU3E7EseOCLOmdwHw2aU6aoSC+NRAovAlHdre3kEGzFffjS
         aImh3UCFKCbDX1K3H1CQsDPho/br5Qh26hqpQ948cuMMbiY1Wlg1qsZ4xOxpTJ2HG4C2
         gs0EQ7YfIRe/ujzGe7iyhd+LAwjuLqmsjTTKPPgN8sTl+uVJr9iplW4YwViUMT8LiFke
         nvjUR+y4bqTsJACfmpbsbj67WE6ilDjP3bNmVG52XHFyTNzM4gS5QQelaR41SNKOniUS
         NR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655838; x=1795260638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JtnzJyvk1KhH53ox2qEGTYmgQHbNRK/nZXY80+689io=;
        b=Yk9/ew4OYRGr1CJ8t5A0eDezhgVHnH2F4nZCjU8sf8gkKt/Ot33+2c84BznLT6JWi5
         2dIt+rjP4lOCDUz+4IYKJxEqoG1TE07f6sUVuXMrAAZEBqdV9UjtZdUqWc3x1X9nF2rB
         oG89M/lFJUEx08IeKJUt3blg1Fg8OaUZC1VNreiDHOhMSdX9HpZEM1MGgkgr+xFHFxGi
         nmcPdUv5PIstzSIUD6TeaiYUpBdwhWR5Y1ZXwUjjyf5YsMrG5SAqfmatnV2rDjJPxbXI
         tYMsJkpyZcWFdUvUy9x2t3v1u2B7+Tua+3vWguOffZHJ7zL4p9DQN4QKOQGJ1ou0ITpu
         1vWw==
X-Forwarded-Encrypted: i=1; AL+hErFRRaTL1bFEiIk47v4t+L12ZfpizF+VUoJHLg/hUaKgfy5b7zhxFhGkb854yLJdAVu+rkL/TSWNge6RHfM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rjfJYCP/tFVheJ8d1mlegLOCnlAVOyDmpkX/+k45VUJhoc5c6
	E7dQRFvZb5wW466qoSvJ6xTnyZ4BN29A+ZpbEgw9eb4brid/pB75Y8INEiNyXNwR9KGE43tcMCl
	hTm0/kVhuvWl5n/BZObdCDOtFj9TTevEgQgy7ca7Ip10UlJ9dSYYHB9hrXENNNqOEwgU=
X-Gm-Gg: AYBFou0YI4ySseWx+0Gb/AFK8pxJhVUol8Bp98dWntJG3oXpQesyKaxPCUfZl8/LcNh
	U/tiMcyScQtxG6eU4bfE+OLvr7niRyaUMgdOJLe5IrkLnu1hEn5U3baOBoYz4yJhf/+Fy6grJDc
	EOceeUBU90Z9/CfI4P6Qg3K8nmtYUWriHfrBQU8mgy7bVD7zybm6v+OqHNrC0lHG+x0yb/JlOvT
	u3w1j2iM0shcxuWCoCsnoVg1BRd0XAidqJPX13gHnf+1KqI70t713Gps5gvAnlYgdIah0Qhqvxo
	TyCyMHMKYlvi2DAw7WV0u7CwtlREqmv9yZx3/TKg9xRymJKMKjAwaI2l8Spy40Jggat1Tw4HjTw
	RzBRzj+pp1FBAPaVydPXXKKiLuVBB0xJPbuOjIXuSKhAbJEa2q52XaCYoaWhR+pYEWNlN44zKsA
	PM/VmOW5ih2/lzFnCMl+iztQvCOa1U0aPB+d1Bs2oK
X-Received: by 2002:a0c:f00e:0:b0:91f:119c:49e7 with SMTP id 6a1803df08f44-91f242183a5mr64201036d6.33.1794655837818;
        Sat, 14 Nov 2026 03:30:37 -0800 (PST)
X-Received: by 2002:a0c:f00e:0:b0:91f:119c:49e7 with SMTP id 6a1803df08f44-91f242183a5mr64200736d6.33.1794655837376;
        Sat, 14 Nov 2026 03:30:37 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:30:36 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:23 +0800
Subject: [PATCH v7 06/23] phy: qcom-mipi-csi2: Add SM8750 support
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-6-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1231;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=WftKjWMmd6ufkhmpBXP+kU2zClT4Pa5uPn8ECol2Zvc=;
 b=1hq3oXdyhFU9AflJEQbTquWWh8o+HWgH0+JcuLjn6dZoVnqZtl2X29Hz4G832z78mH6JrsmOn
 5bOzwxRADg0DavMNQ2fCQoeoL6og74SBbUdPXifKfoxZgdufnUPeutY
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: KuEJqmmT4xiKtzYx2lKDEwmRL0gzrl7R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX9wuKrjQHs+CS
 wK46DdOUICxYR/bHRt9bhHJFwDb18aeZJqVsCTT8OVZfoxmFhUYN5QQ2BlE/hYoii9PlFjtr+0O
 RKwaX9WIVTLHS31MwbAMgVt81cIEughI3a4qESZn7mDtGHpReAG1NCNDUXYv+TVldOmtkQm1js6
 bdYj35fajm+CROLJ5XZDxjoPvo5RORlpYSvMrI1i4TDcQ/dFvvd5HAYFuI64GyLbH+yTxZkK5Ra
 cZXnl4yDKP7zmDV7Rggj9EI2x59O4I1Dqg0Sv7/6W7T0Iq0bn+oRTjRO+MGXkCNwGR/yP8W3cbR
 PBEARxBl4+TXM8xJUKgU5L5CKVR8RUqNoXrfH3YmGiykYQJ39sN9d4uIjyaiHj3FfozApBcUBnc
 Ad/fiYWo1P5xNs7lJxnrQY5/wlC03/TFGj8kTxQLaKCPZxwaypfZnwaU4Q6/i4s4f9mgN/034qK
 fFT3brHwqbjRW9l3CPw==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af8465e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ccvM8GEhhlxfBWNg_LwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: KuEJqmmT4xiKtzYx2lKDEwmRL0gzrl7R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX+8Vh/FSLz2G0
 04Nx9Sc7FSzKdd+rKhjTkgicmCpAwRXvVnSOrwiKf/pEqa8eHWelxIdmnZWsB7WpNPdoYX2zBtH
 m9gjlqZ3tK2X9/fBGMscs6mcmoN6+F8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add the SM8750 CSI2 DPHY compatible to the match table, using the 3nm
DPHY configuration.

The SM8750 CSIPHY nodes only carry "qcom,sm8750-csi2-phy" with no
fallback compatible, so without this entry no driver matches them and
the PHYs stay unbound.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 165e3d026872db85e54a99c5dd25ca68a1a4e450..a672bf318487b16aacd1ecf165554cde3f38e292 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
 	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
+	{ .compatible	= "qcom,sm8750-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ }
 };

-- 
2.34.1

