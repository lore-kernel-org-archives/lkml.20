Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905242;
	b=ASp5QUD/wKj7Y0gCHK2Xq24qCMPrZnJ5hf0rzzlLYlJNSwgH2HUhnA90hHcmQMBja4KR
	 tOoLl0PP1ij7mutE1bhkm0WL+4qg4U5oY9Ka8OcVg9kXjFFrq6a2Y6N9lVjh61YXuK0JV
	 Avh6ZCIvZBBn8r61viM5QYYJ7RvpvNINCIWJREC+oNIwi/y8gvpkb/lMEKHnKvlOTpDHW
	 6hViEZoT39SMsVF6ycFcgPrL4/N6IXQbIQMxB/YtOJljOWZvlof4vxkWTyBlEEFg/ns6P
	 xZFwTLkW6mw+Q8KwYLrzyTmx4xCSo+KfWGZGLo8qkMxV3XkbmTmqfoXRyyg+s72lnJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZlnZcf5WGlV/0XScJzhW2hb8hYkrrF83WmIeGI+EWBQ=;
	b=1qAzFAAvrNQgGZzdWBPtMHAeHSPLb5ifjmD0+Ymh+WCRQ1OYFUsI2pTS0GStjY0LEbP/
	 +7dwwZLWfv8nvf6N1RqIdYHJIFy6l6UhhrMF8s8xJnPcIED5KasHzDXy7QJJg7gV2pc0E
	 n6uMim3t89SkEifW5Fykq5hKtg6NORv/nB0X83yxaUkFs5AyM8iM/YZpeZoN29hsgjcM3
	 1a/4gP+377MID522gxAcl1FFN/wf84Mz/fN9/O5/HB1RXsS2hM5NR0pj2vbA31zqeTqBK
	 89nK5D9yl/bwVVnqvdCLsQZM5yWJrpSE+RTZ+wiNnVyFwBNL4Ye83ty3ApfzofuxLpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hRTRieTb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U5s23NFC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE567606A8BC
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE567606A8BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hRTRieTb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U5s23NFC
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8eVud200034
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZlnZcf5WGlV/0XScJzhW2hb8hYkrrF83WmIeGI+EWBQ=; b=hRTRieTbN2H71Hcz
	NetHHMXDVeqveZSMQpuoRLzIRQRjusqvuhVwBBbO+zLnMbHfITksAejBbs7je2XI
	dZuCmKSe/LoqBnVhuWGXsQbCgPsoYAyEPSWPnhIMCoO2RxmJXu4L9j2gK39iyev5
	dp3R4AdsH2yqBUyQXFnKYLodioXRTx1Uh9fN/VOluLwurG7pdEIP+AR7OrBZwubq
	Oanb57PZPRFT/4Evn5lpykIEL4hpJL9fWCANcXS8Ruq6+BPNTBxo6TCb5Stkjfi3
	gSM5IHUATEQS3gMD4FT1gYSaceAkaPQtq7grWRnZas0pAXqNEcUYIzTfUnPPgD0I
	17bWrA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038mbvhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:47:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cddc4bde4b1so2102589a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905239; x=1795510039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlnZcf5WGlV/0XScJzhW2hb8hYkrrF83WmIeGI+EWBQ=;
        b=U5s23NFCIeut2AkO2rx8uPXX/f5MZsaXruk9eClPaS/wmjKl8ZWxVAOroioFVqOZ9Y
         A1xMqunj/FUsxtoW6svQPRoMuqQJKUPtLaRmtWvur2kbCHFCCHPl8aZijYxdUOtSm5i4
         9doBDH/FpXh808r62mrWKgPLHtuc/BXzE8RfvtwuOg/YCJdNiw0YJYssQSjUvSPaidqm
         H3n/OEqiE5IfKz++DlxO4Sjil0ZXhhnnA+M/AqjotJ0gKgRs+ugeukEv3s25LzOQIA6H
         ep+y2Vpusqy3wtNx6A/n9JN04s0ni3INI60ttRf0kuCdyt0SqpFdiT6OBYBOg8b2BCqN
         JsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905239; x=1795510039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlnZcf5WGlV/0XScJzhW2hb8hYkrrF83WmIeGI+EWBQ=;
        b=gjs8FEq25GX5P4wBZ1Du0ae+XosKZ4Eb/FyGC6f1WXTyWXapkH73wz+/XGStbWVNCq
         G2oQdNB5vKHF7e/a1AKndv08HUQH3LjhSeGb2Mto29D5byItYZgL0d38IMz5Iox6YAVd
         6M/v1Qc6fUnKFdsktFCCR49U3bXYENXS/2GlL3rsSDwEokfxdrXK2MJAXgH89G19Vj8T
         27xq9/HjF9X36YdtrW43f0BEiN19E0zvFmfPg0cCIcNGqLC76JNOYoQigjL/3MRjmhCI
         kZjt5ManMzHpi0qIw+BL5nai7BNNlSMo0F9rXJqXMiDbZWY8++ZaR74aOM6Vrx/74Jri
         cKrQ==
X-Forwarded-Encrypted: i=1; AL+hErFBXh5Gy6pGjKvlpShqd7007pukIK8OPZdnx5FT7VrLufWk4WzUSqz5Og86sPdHawW2kJ4d3s0T1utrTzg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MHOIzVGMgZPG0/oAwGZteGKz65FsRgMEU2r103L3V5m/YsyEf
	a6HpPiUqx7qkjWUFElMOvfEdeoJDDNgYMzKJNuLUCkuQ7Vb3p3h+96Pq2aiqggur15hgrbLmkIg
	qY2ZyhNxpjnTeowPV7Hw7EuMbb25/bKabkHq1jAlAQmImFndpeAg6BzZ+P+BZx8Nnr+s=
X-Gm-Gg: AYBFou3gltKTY495rHbVImQd9cC9WgnZFiXzDhs9bUvRJZwVCypVWPTi5MScmWcpCqt
	lpTydKySDywLG5JJe5r1wHiYYZvsyBj0Cw3JFTiECVv4ATmkgJPmzzL5QXnymmEjFxutSoHnTzu
	9RiZxT/WceL3GaSbUPzr3vka+BxRlOQQ1OdmGz+Z9/1k4ClxQ/9iJTdDIwTxp2YDVDbQfBGVqTY
	mACwoi73FaGZ6eILL/cTR4wLgggorVn4fbvIQv86mVQXnKDKvDVaXxccltUKA1XUoPuoW5mh6oM
	NVkYm/S945nhrMGrPODyzSw3mRvI5/OkU4MGZUUh2A/bFXIN2B1HsRmgMtjOMSoyuvjEQmf+MYe
	7DokZl6UDxkDC4jPer6dRurE2RqgbndOeNKCdoufP956tJOwJtzz3DxnaUgBvyqurbREmaynHkj
	B9ag==
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id adf61e73a8af0-3f7a6e9f331mr10337458637.26.1794905239350;
        Tue, 17 Nov 2026 00:47:19 -0800 (PST)
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id adf61e73a8af0-3f7a6e9f331mr10337427637.26.1794905238817;
        Tue, 17 Nov 2026 00:47:18 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:47:18 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:30 +0530
Subject: [PATCH net-next v4 10/10] net: stmmac: qcom-ethqos: add QCS615
 EMAC support
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
Message-Id: <20261117-shikra_ethernet-v4-10-c41902e5f2fa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=2190;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=CFQDYIAl3U52nN9LE0obd03q0TxKqjDn7YTLgvYGBHc=;
 b=fAch74fvJse1lz8Pb00vNJqw+5n6bQH0vo490NO3MVqTDE54OpN0lMvZ607uPvmPjMjjngfa3
 gUWhheLbt9RBHNf+sBwp+FG0Ls3EbFzzZkRAIpHhpTy/lUoczip7j14
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXw+oLMR1nZTm/
 RtxL0DIZpvdaQDDH2i4KlXZoh7/4HtmPOU68OlLZN+VG+mzQVJCo44QvkLuBWbhZ/yoJkl1IIgf
 b6137+Be224HxL9CK4nnyvrnsVgM7ogxrvq/f7D2SzTgIhBwqyV++CAvpdA/dm1zuTXg92FPX90
 hOWvNFq/aXAzHpF/yFOgE6wTlLp7QAke4wTKZ9VRtIflULA0ogWu4kiuTHkcWLsM8Ae5LVjvAsf
 48HKlbysB3uBCFqI8BJWx8M1oT90A6zM8jOHfQgRs83jubkuirdqdePtgEkyuMzZS0SNBfKryPH
 c3rSrALmsIb3RAAcvKUM1Xq5g2xPbRtSDQ72nRX3/nIPvlfxWiQ/YjrBsmtBhJoeakUbE4pvgF4
 m5hdsfP8WBiySHRpLRd46PRHMi5xFu2UTdzsBXE/zfBvzDAXqmBxrC+FO/nUBYR7DR2PXHRvMJK
 T9RPppLcak9P0VKEYsQ==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afc1498 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hVEubRZtVI2ybN1AIPMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: I-p9u5zUHeen0z49rgEfvhVVyXEoDRQM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXxG0MGplu28AH
 ZtqeZ+sm0YFFywE4/zBZ4PP7gI3ooQqDBJX/kB2a7ucf+WXtWi6WuKR73Mtsj+klP+kvtcKxMlM
 CsbYRBJeF/E1HX+/T80PnBsqkSESxgQ=
X-Proofpoint-GUID: I-p9u5zUHeen0z49rgEfvhVVyXEoDRQM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

QCS615 (Talos) uses an ETHQOS controller which is extremely similar to
the QCS404 version, but unlike QCS404 its RGMII clock source supports
the 25 MHz and 2.5 MHz rates used at 100M and 10M with PHY-managed
delays.

Add a dedicated qcom,qcs615-ethqos match and descriptor and enable
phy_managed_delays so rgmii-id uses the DLL-bypass configuration.

The bypass sequence has been tested on three QCS615 board designs,
two with a Micrel KSZ9031 PHY and one with a TI DP83867 PHY. The
existing compatible binding and qcom,qcs404-ethqos fallback remain
unchanged.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: this is a new commit which ensures that the phy managed delays only
affect actually tested hardware (Shikra and QCS615).
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a7fdba73da2b..790159ae1be7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -250,6 +250,13 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct ethqos_emac_driver_data qcs615_data = {
+	.rgmii_config_loopback_en = true,
+	.phy_managed_delays = true,
+	.has_emac_ge_3 = false,
+	.setup = ethqos_hlos_setup,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -1116,6 +1123,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,qcs615-ethqos", .data = &qcs615_data},
 	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},

-- 
2.34.1

