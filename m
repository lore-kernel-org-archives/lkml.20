Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382313;
	b=XmiveiwHuYc22IpDFCxZL9lc5TAq2sME6hdgphYt/tiEbb7c5zMKvEdakaF3S/z6uZ9X
	 BgxDWa2y0WKbLXL6chjTqmKhelzByw+YXUZoS8haqWk5sXBkdX2fo4yyl4hgt28TbAaDT
	 SU74jhtSMVKlPQJbCxVDEa08wLGws2t62wNQtQj9Z6zG0BYPQauOguDUc+DiNEXK1pVVX
	 ZJcPQjsaHT3o3ItFGX055kZVjC9OPhggzZ5DeDodYmqcAybB6WuUq/EyRbgyNEUW/UuUA
	 88OppmJX1OkaPh/tI7sDd64ND5j1YTvOB+kqWZsm0B/udKIGwbZPx3XB/L9no7MRJ2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382313;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=whaNoV2zARA/Tl1+q9SOsPQlZziCwZUpaFnGneKJwq4=;
	b=o6JaZVSOUzfunhV8QmRuGxObGZi0UFCtq+Zi4E5iCaxNYHIe+O40xghhyFRU17lzRSpK
	 41aXrQi7JkpR2856wZCIcikSVHMSKXuGksRJaeeBduV6ewTGp5/O8mc5xvYhH9Hy+dhNe
	 u98IzVqR7GG8ykOHWmMymAMViKP3S822Nn/KrCyCAHX/ZBIBwyQhA3Ee/EhNdPwaSXhsh
	 SjHTK/nlVEMV3WqEYVOboRk/Ox9c4/xaLjYOPPoOfeu+kySK7o4rtGV9/pt6q9rVCMNiG
	 dvqvZsSvhRQC4GqG8EOULtPoHKZBiAFpCfmyKKCZrFFKIo2b21bxzIfG5LDj1Cz3PdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QSEQI1MV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HrqVv9zr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4221A60A2610
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4221A60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QSEQI1MV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HrqVv9zr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KIMU1369010
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=whaNoV2zARA
	/Tl1+q9SOsPQlZziCwZUpaFnGneKJwq4=; b=QSEQI1MVrTQlP0zUt+4EYMyS5vS
	PjLDejtKDC5EgRRvC8+zcxS14DTVg3bGlh+c64i2AWOSROzHqTl8kUtHv5b9IaR2
	ZWOzuCVGlpBKGMrAc230TFU2B6EfnR3VMoXwiexpppxaZ6Jms1t8mSdDlQOIF1ZK
	7pncxV0JbF19eJUsT0W6OmWiN6nfGIjqD3/ChnPm6/UrBpR95De8XTpqhC9KFrUw
	u3DIgPvuBAp7rwjgTxDW99D+74nqTtfHt/ztSOnczReKhv9YFmDXOstYXWoQA7ts
	UcrRxs9Pb80qckpjRS7pvZbFUHBXYq3q3ossHJCPUxdq1GNgzNjBYYMvjzA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvcpehk6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:31:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so4265140eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794382311; x=1794987111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=whaNoV2zARA/Tl1+q9SOsPQlZziCwZUpaFnGneKJwq4=;
        b=HrqVv9zrpRk23pX7cLtGVuRn9vwMv6+8Lv1y2c3+w23iMBqdSBDPpZuGwKR31XZYxI
         h0aN2rrYQ4jj3CYne5tZ6YO2fMPAVsi9QMaDMOyminoUyBkjG9z5I0rey190CVBIrrwE
         /SDkcoN9K/jNXoiSQz4apEvO29UxDT+OG5Pa7ExhCoGXxEMNmqZ7B5kYlj9SgCRq5uAz
         pBnUj8vhY1bq5Q6vbgyMCfDUtoWVWi6349vx1zYk9FmHg9UAut4hNKoiNEZJFUeKuclX
         QfBQfXSoP1y21/kiOJIqRP9oOkFEq6GB35TLYNVlmVJ26R5Wb6BfYop55knYqv8DEBLM
         P3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382311; x=1794987111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=whaNoV2zARA/Tl1+q9SOsPQlZziCwZUpaFnGneKJwq4=;
        b=DtDe0+3eabj5ypYXBdLzTt8ieF/1MDb1GzCyzxsw3q7xYT/fTyzOdaQbT54hoRlM91
         RDfCXJ8LcDJSiMPJFvFIhst0xPyTTXrtxaTrk4xa+AumtIR7HrYVN9HKMNv65dxfalCF
         blp0NZPE2WQqUSeGQKF7AGDfSRVCO9FDWO/Ug3sbK5YHPHbOP0JjhzC9Xw7GHH/wu1Nz
         rIcefxyuLYVXUaLxMGAGfif2KE4ldvxfr41pNTiUAKbmoTTsli7xt7tHFWhP/UVMHkO7
         vZdV7nvWjX0kF77JrJ75wtP3/S12JgBa/NDXliAXIm9vvYMHhZQyioqK5trGRfaxKhHn
         DHDQ==
X-Forwarded-Encrypted: i=1; AL+hErHsyDl7EfN80if73hlFlNOnrSnkisjb1i7EilU3jsZn4ioDjlm3Ak1GTtAktUnis1OPxzLe2OHosMmAz7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z++uxC6DT5p2AKxvOR0q0r9ObEJuxN0gcBJTxSUhIQ5ADONiQHs
	y/M66q3WwHBwcI9AJ1BWm0eZDilkRlCRxLmyf4V3FEA3+A8Jf76qdeaqoie808yQ/1JTocb5Mpr
	5M/ge8urlE51PCC1YDr+azCuu+wxtLZWF//zkE/7mIgpn5Liik/FuhSfkqvNKPPlEJ/k=
X-Gm-Gg: AYBFou2+WKK1r7yRJ1fAEZCZgDrOcmBiXYpR198B4GRklxXmZtJwqomkWr3iZhAeVrO
	GzZlOSC3xrn+V+6QAxCVcF2RyGBJW1lamWmIwqS+W6k96VzSYvVbvstbR8MSkloPUafFDqqBpQo
	Qp5PDCUuwI8eIELE6pwiGdsWOimBGsAoVmoYY1s7Q3ymWUyddTh5lNAbxN5Dz6U8ogTHAZD/hfy
	5mtkZtweAqGuaV8VFybZoIgEvMCQLVqvUwUICfjeqIyRNd0isN82SqzImB3wyvwYltSayohW2ia
	deZVtQitMZLniFmxrWr7Vc/Is8vtOIEK38xZThBh//mwiF2jpvDnWEosRUYh7uNAG8v3by+fOQr
	k2zDXfllNYnuxdpC+ny+PE5mcHIuFonrxZPePVL0OIp/mKngXp/LdCALX5pmTryfRlQ5+d2gXy7
	/TYHH3aL6X7RuNe0UCAJMijSa0xuhGqoU/
X-Received: by 2002:a05:7022:38b:b0:144:fb31:a597 with SMTP id a92af1059eb24-1b3c03b2be6mr1811634c88.47.1794382310825;
        Tue, 10 Nov 2026 23:31:50 -0800 (PST)
X-Received: by 2002:a05:7022:38b:b0:144:fb31:a597 with SMTP id a92af1059eb24-1b3c03b2be6mr1811593c88.47.1794382310144;
        Tue, 10 Nov 2026 23:31:50 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm27220027c88.10.2026.11.10.23.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:49 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 3/5] arm64: dts: qcom: nord-embedded: Raise i2c18 pad drive strength
Date: Wed, 11 Nov 2026 15:31:19 +0800
Message-ID: <20261111073121.3707030-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
References: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX1XGRJhCR3bWW
 ky0EhDGWjApqZjvyjjsLBw7xy/IbqnSWJkjY4ObaX7X5lQYWCBe62MiZEiHvKQs+vkW825xL73W
 EoRUnJ9vdu/d6111HTkJndInHjM0vAA334XzA6AJtCcnb2e9CzZd6FUk/7Av/sCl6GzKG65O9XI
 EyQ0xE9rrjzg9yT3U7ubR6aN1JKgpGDuL6Ym7dmKk/gTWrr0eAUSfFblz4TmM6SZf/CHqslAk7v
 +8zAxY7yFmWzGD4GrlEJ8APzZtOzp+bxF4P7HqgvPGksGc6vtoAR+nYwOSfX9P8A5CWYnGmvigO
 hvcYxkROWAPPur6u0chFR1TksrruV8yyBTtg6O0+S33GXsJgVraFZBBn7WBcLhTN5NatEYVk3bJ
 X/RyIvHdSh2Me4Ed220EGj1hN2ep0Ma/Ax48OKlKdalF2Y9vkb6GVS5H0phjLY5tO4mwoqdbpkB
 OEApyyIG05C4MZI9HoA==
X-Proofpoint-ORIG-GUID: jV_CsKHvwUigkGAKPTKZaaIUBm2yRRDh
X-Proofpoint-GUID: jV_CsKHvwUigkGAKPTKZaaIUBm2yRRDh
X-Authority-Analysis: v=2.4 cv=RfAFmFtv c=1 sm=1 tr=0 ts=6af419e8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=OVRx4QOUdiRTB1v6uAIA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX7AUGmCqfIkVF
 A0cODEOb7U2GwQcyXLNiQopLjBGvwYXwTbPNhbIXqwfjtTgjXRIumXkskGtEeiaTBaBkRFIrsT/
 Ww6RSLZ8C1SVJK8kUYZvrtpnLwyB8Hw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110029

The i2c18 pins (gpio154/155) are configured for 2 mA. That is not
enough on nord-ride-embedded, where i2c18 is the audio control bus
carrying the TCA6408 expander, ADAU1979 ADC and PCM1681 DAC behind
TXS0102 level shifters. Transfers intermittently fail with arbitration
loss and unexpected start/stop conditions:

  geni_i2c 890000.i2c: Bus arbitration lost, clock line undriveable
  geni_i2c 890000.i2c: Bus proto err, noisy/unexpected start/stop
  adau1977 0-0031: probe with driver adau1977 failed with error -11
  reg-fixed-voltage regulator-5p0-dac: setup of GPIO (default) failed: -11

The failure became much more frequent with commit 8cb5c17be3a2
("i2c: qcom-geni: Restore the source-clock selection policy"), which
moves the i2c18 serial engine clock from 32 MHz to 19.2 MHz. That
commit only changes how often the marginal signalling shows up:
reverting it, or lowering the bus to 100 kHz, still leaves occasional
failures in a codec unbind/bind loop. With 4 mA the loop passes
reliably at either source clock rate.

nord-rrd uses the same level shifters and has not shown the failure
at 2 mA, but that appears to be margin rather than a guarantee. Since
this audio I2C arrangement is the reference design that customer
boards will likely follow, raise the default in the shared dtsi
instead of overriding it per board.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 5a1520e436c6..003c5ba2771c 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1255,7 +1255,7 @@ qup_i2c17_default: qup-i2c17-default-state {
 	qup_i2c18_default: qup-i2c18-default-state {
 		pins = "gpio154", "gpio155";
 		function = "qup2_se4";
-		drive-strength = <2>;
+		drive-strength = <4>;
 		bias-pull-up;
 	};
 
-- 
2.43.0

