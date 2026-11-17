Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906403;
	b=RGiTatJVMmdTYlg15M4ugDMeSioW8luVV30LsxwgTIM1wgOFuJaNju/36zPvY6FGairM
	 4Oe11vaqN/Qxo+94qUVGyM/z+VQdjJev0kJwvUDVh2c7zxxDQwPrrphdJX+2ytH4VJoRX
	 ZdAG4YkxsNJVYlyLG54x0HoB+ZMj6PbE0OPV3SpqvH1KtmlqN2uZRxNG33Zr63behBkn6
	 a7TSJnSaDfbeoXtoxrAypDKghw0/+lkWwHXbStNw2vxXxHXEgi51ix4InWHYXW7ZvSbTz
	 +rlgJnRoDR5/rDtCOw/x/UhIDE5g0UN8R7PwLRw2pMwgoVg9xpKnj4IpNA2g5uytgyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906403;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y0ibUOV8qb2w57M8b54S8KkbL/HbqzP6ta1cCOvmksM=;
	b=JS1w7iBav4UXoN9HQcvSfYJ2PCGqNuX8uoS5B1GQ62/xYlKMQJNhQLfG90fvzRmzrCpp
	 CHFQrrAh5Zm5iqeaRnbFmcH7hvzROalh7mJJwKiAF1s9usKj9/0o1DqNUBB1HjmaGEmLx
	 i7VGpETEyEY2beibqnAeAQbt8jM1NxL3KGWTXIIGA0ZdbK3hGuGjPjGSWQ5x+ZfAnrBOs
	 TSNYk/HVKm/rD5z7pHCj5ueP1y1ipxYSOItPfjtDYmWvuwOz/bR2+3TXNVK+JM6Rgp5+7
	 ugXr+jnn+XIwk4NIi5Cr7O32r8Qsk6DOmoe1ZiuG9sJldq6czOn2HO8qxH6PVGUfljg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E7uFNKpY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XpYjlkaM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905B760A260A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 905B760A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E7uFNKpY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XpYjlkaM
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8NHsg721447
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0ibUOV8qb2w57M8b54S8KkbL/HbqzP6ta1cCOvmksM=; b=E7uFNKpYl50J77JQ
	3v0ACauajqFZZ1L8KULdMKi9CWIClbELw8U7atXet56C/wQ9VsckYLASZk09w/Su
	1JCHW4CDv6IbC9qAvESDKqNa9rnfJ5qmaCiBkTtOEUh1yRV3+/Ew9lPOSvODioSI
	lh7cJGkb5Xkxua78e+KrZWEKNCA1Ekg7Q4egqG98hq/kan1CzqQwXR+9QTUYOhs8
	DPaysVIqjb+l/eO15qUkcZvmGb6nyGarX39qGnO2CO4pOcTXdFH6npG/a3Ub8F5Y
	220j98tmZ+4jsXlHq735m0OWWVIwJSIzcBdhMFiSvuOQrHPYdkC4RBJ86Qk6H7O8
	Rctj7Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kcc85h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:06:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so853600385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794906401; x=1795511201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0ibUOV8qb2w57M8b54S8KkbL/HbqzP6ta1cCOvmksM=;
        b=XpYjlkaMhzpe62g1vNmghbL2k577N6VCs1uJujD7xnC1nj28KrDUFudp9nWYbaaALG
         NtJ5PwsxKDzBFaPyIiCtjeueDqc3Cb7CzoK80JBiWW7CGKNnU/jYQCyG0AsDQcYEKIt1
         gCtOYMIKd/OxsHgfZZAT37KmOmraA3qCn3tQXaJ51fMA5xUwD3kyql4HCOfP3a1MuNdA
         8F5YCQG0lXqxw9v6F4od7RN4OtL95p1yMPva+L6L7MIdTgG4kPO6mIU7GJKkTGBwwwzw
         sTn1sw+T6WCRMqYBXtwWLFR2hFvfNfmo/fd/4YNC0aEWIVIhmtLpO3Go2wEimc7T8s7W
         n4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906401; x=1795511201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0ibUOV8qb2w57M8b54S8KkbL/HbqzP6ta1cCOvmksM=;
        b=gVzY04Wi5jAfxeTSxac36aKp8YEKcIHBi/uoqrEE2CvYPXf2ANVBezaXfoGtYwggcR
         xcc0yz3wQAk+MpXksTtkd+Xz54etDNOqorZTpy0jV/7B9oYpz6ZvlyscRMoXZGa30o5i
         4bgihYlniIIfnleGkYMkc22yqDD/Ub1OpDWtfBBtUdQ7Ox1t+bCHtIWki2YQwc1zV+wQ
         hVVChBRJJbmDo7jr1ENIVdayFWm0EOdd9DXL782HMlhTc6gf2E5gyjjOEEShHTkFwE1W
         25BnGDUD90u4PD1xgbI7Ktp5BKbTBX8mO13JfP9ruTU+fKkjqdNlrLDRz1ofvWpNSGho
         Dq7Q==
X-Forwarded-Encrypted: i=1; AL+hErEFMKXq7gInl9AHgFd26fIe+BTcEypz6vTTa+gE7/iurHZ9ifSySqz10IxKdSnkZLBOohF9YjvQAmzxzhQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qGzmHpen/r6/uTG/RC/yKvBOJalBkxia3svW9MZXbhe/SO9SP
	eV3G84ya2cObk98oNGwfvT5XlMsm8iMrIkXcEJ9fg5yl4FYVdNkZIN50d3G5Z2woOrS/T+es4su
	V4Q78dhWIDdRcl2Frcr9WzX7J3OJjcGLFmvR8NyzlkSlZ77r1adWaPBZzzixD3HZbWHs=
X-Gm-Gg: AYBFou298AEFFnO5iVVeEDrR8GnWYhF0ChHCyi5yYxwt0yFQcszUwSO3YP1EWaQj9sp
	R2f/8NSkZtktkyrL/YZu/4xeTWMAFz/M9IOsJGcQN+z/ecnbsOXl4HWjNg0evYyQdHDVn5EJJae
	Qw792ZhwKkA1kHNIUB9EYiRhu5jJJfIgzp3xrfYrOU7w4VZTV6+I81QF5UWQEaYWzR6QPqZabTx
	cbhumm+NKW75bLGrpat8QBhVTLBu6DB8xwByIaVBlPihjf2jod3WTBmYIT6J22b0IfplW98Hsl/
	XJ1b/ujcMrxPTnqkSUhdttbfzqQ+vdQzgP2Vk+tz2AAFANbTE0NzIpzbMipjn0cZrZgNxMm+wQT
	Stf+OA0R9gm2YToqGDl4f5yliMiAo48z6eraicIMQzp5eW5L/1HKxINiaeYDRl7A42zhiUc8ORY
	c=
X-Received: by 2002:a05:620a:4109:b0:93e:fc4e:c490 with SMTP id af79cd13be357-9494bb849c7mr2069482885a.15.1794906400691;
        Tue, 17 Nov 2026 01:06:40 -0800 (PST)
X-Received: by 2002:a05:620a:4109:b0:93e:fc4e:c490 with SMTP id af79cd13be357-9494bb849c7mr2069478685a.15.1794906400136;
        Tue, 17 Nov 2026 01:06:40 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm27310657f8f.56.2026.11.17.01.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:06:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 10:06:30 +0100
Subject: [PATCH v3 3/3] phy: phy-snps-eusb2: Enable AHB2PHY bus clock on
 Nord
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
Message-Id: <20261117-qcom-nord-ahb2phy-clk-v3-3-ce5ee1073208@oss.qualcomm.com>
References: <20261117-qcom-nord-ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com>
In-Reply-To: <20261117-qcom-nord-ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0QzX4LF5lSbbC5DnVnFoOIfhrWUJ8IJ91S32d9U04Kg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq/BkXPVVw/zXDKGn/WN3BO3CD+t1o1itzre7fU
 IU2MWIFaFCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavwZFwAKCRAFnS7L/zaE
 w/7aD/92Nf5Ny8nlbehp89MHvq35uh9yLF+ft/kDShrScyndWe7PBoxVej9ssJCksx+LZPRMQn1
 AzJrGRL7AyyHeJqpdc878d5rcXub9dgsPX1mx1pLmKQj2z5R0xaFPtjtV/pRdPCsJlRqt7kmck7
 jsH5bClk9Fve/w8OYso8EQkKm1Sf9hjMYUEchLMhPZmws0BNlyukRSiXumm7ZwJUjnlZx43SRDZ
 n7i5/mWHeprRpmqhrmX33efQMFgeCiDR++1aE7fPwQ15fzoVF1Gfx57ZqFL8ZreZ2WAwC3KWfzs
 M3ej3IdxmnBsQp5YmwcL0mL/cVpMk0W2/CVTe8d1nVJm8oC5gahBK+IsdC1Rd6crib1h6y+bUmU
 7GVxDzsPbbQD4rz61DQThGQb+9HI/LG1+AIP1EFl8ua2a64qjuJeT3LRgVAgo4bnZiw4XzMud6B
 aV5wqVkv/pItbzS7Lpw4kWYBp61wNxJnQfZSMqb90sAn66bRd9flv3stmCseigCowLYIAncgUOg
 lTgSaa2a4UMlV8GU2KQ4AVz509zyMa6x6nPgrjkMurpa1srcTjJ3iZTUDb/8TLBdlO/7BfRFZfA
 dzdj2yAo0ks86w7A7PePfTaK49J5NvLq5A+h7bPf3vfwF0rocYvtmjFn9J23lm7QIoH8RQLMrp6
 +VSbw5J1veozpXw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfXxzmUxWq64EQy
 qXre1D1GtRW7exIggh5KGi5PykDcgAhQ/YnsaZRnh3iLTWwO5qXLK3mM3xhXRFEsW6MPQMrFmi7
 0V+vbt/3kqcUwikXr5/LdAAGT5wtYfU=
X-Proofpoint-ORIG-GUID: L00TA6b-euiArpt5aDuDmIbYHViNXFyo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfX1h+TpYgDj9Vh
 01aMwqBVcJFWp/XMooKAII0bVPsYoZivE9IGUVHsi6kXsR8G3R4cOsVC9LXOTvabwWjxu0Z7BZ+
 YzF6CsNQgUPIpWQxG07dyzDQXRDZTgW2922QnLw6dk+lCDDM8MW53DL8V7tT9GIULf9XZGw9wHA
 o5a43Knb4list8rQBYedQ1eHD8Cxuz6CwA7QAzdml90jzzhYdskd21gI2AuokKnkLbsD2+5TJ6y
 zxZP6m7hsNljpZ96hO3kCV+Vgiygsu5ba6B5o3bY2MpYYBVt0FTfnCSZI1j7RacnnU58gigVkIf
 W0HVUhvdfjPQymnqaAT6hy7guW7tMfA+NSQr+apY0Pssck6vsYMNPC9dx2bCsYWumbYs27VGu8O
 OqlXAMx46upasi1kZiBlUE8/suRs48qyTvh18ocnXtAJiBAhY2cQbIQsNEEHeMU0uJ9Jx7V0q6j
 tMkNZl0vTZA9+wlkamw==
X-Proofpoint-GUID: L00TA6b-euiArpt5aDuDmIbYHViNXFyo
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afc1921 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bNGo_Fnal8ggQfzXgYoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170036

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

On Nord, the eUSB2 PHY registers sit behind the AHB2PHY_0 bridge, gated
by NE_GCC_AHB2PHY_CLK. When nothing else holds it, e.g. on boards
where only the USB20-only controller is in use, clk_disable_unused()
gates the bridge and PHY init accesses go nowhere:

  xhci-hcd xhci-hcd.2.auto: can't setup: -110

Add Nord-specific match data that requests both "ref" and "bus" clocks,
reusing the existing Qualcomm init sequence. The bus clock is enabled
and disabled together with the ref clock in phy init/exit.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index ee473b32f116d..4c70d15210c68 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -452,6 +452,16 @@ static const struct snps_eusb2_phy_drvdata sm8550_snps_eusb2_phy = {
 	.num_clks       = ARRAY_SIZE(qcom_eusb2_hsphy_clock_names),
 };
 
+static const char * const nord_eusb2_hsphy_clock_names[] = {
+	"ref", "bus",
+};
+
+static const struct snps_eusb2_phy_drvdata nord_snps_eusb2_phy = {
+	.phy_init	= qcom_snps_eusb2_hsphy_init,
+	.clk_names	= nord_eusb2_hsphy_clock_names,
+	.num_clks	= ARRAY_SIZE(nord_eusb2_hsphy_clock_names),
+};
+
 static int snps_eusb2_hsphy_init(struct phy *p)
 {
 	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
@@ -607,6 +617,9 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 
 static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
 	{
+		.compatible = "qcom,nord-snps-eusb2-phy",
+		.data = &nord_snps_eusb2_phy,
+	}, {
 		.compatible = "qcom,sm8550-snps-eusb2-phy",
 		.data = &sm8550_snps_eusb2_phy,
 	}, {

-- 
2.47.3

