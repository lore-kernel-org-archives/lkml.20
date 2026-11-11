Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416639;
	b=TZxVJXYJFkKLGcwibdsf8dpDHjtOzVKfMt4+iKkpa1bXoPikK/mCfhmmvseTS0AfK0Rr
	 UayJ5aBPiosZNnT/KGcSPYTYheCii6yE2JyxojXf42mpw/UykUJu64URGJErz4TQgVYq4
	 oIg0vA3vsO+D5at0yRzOn0fjd1wSWulEC7UMQWbPZIy1lyqkKkPFnE7SzCO0RBJB7PtLi
	 uVBkwlqUp0XIg0BbOr6N2TCUlI2J+VhlW+E8trg2xgXOOwps7jTSGMRNGPckndWCDMutA
	 43smKPxSuBpMZRiVT//lfRT1QpdcZf7tUo+4WUhj17gqDlILvIHCjGk1NrpTmuWRy3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416639;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
	b=TRNt+nclTbv1f5oHYWGhXt/7/fEzr6GGGgn8Xv7sDiRm0K5tmYsR/A7ryNpB51khNAay
	 N/5Zb9fs7zEZVGtPtGLm4oqm9OhR64iJgiRxRWaEbfLvTcCRrJ/qAc5Ki0c3E1373qJao
	 SBOXM9gkmwW2jOs+EwrJmYfg8BrooXo4Dos0Aia2IrxhSav/W84WKB08W+4CVztnmg/B1
	 fSo4Lds0HnDy1y1g8EWDD64py30FhJsHUtqOi7KfFIAFqFLtO0fOSbzd3Td61V6QqLa6d
	 upiAnmMCBukOvxXlitZUt3l4QIG2QqMocCRorToUQWf/00Lodf3fFpyyFxwKohmtu/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KPZWpA47;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cZZbcmcn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200AD606A331
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 200AD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KPZWpA47;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cZZbcmcn
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF053e1665585
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=; b=KPZWpA47NsnsKB7M
	BuFAPswPdt3wKsOnqRbCHz13jsxlFVR8ZlgWmVchtXGpQaPmWrOCFiGW05+lTzmp
	bkpO46GY9vES14qKi6r0uaNJepLRii7lkqVfeOe+ngkFNfSpX9aOkq5lHfPJHZrR
	LYN9PDMqAadhfsPJHh9SNViLDWL7r6hxUwon4cVK0tLfk3dTae6Gaz7o6L+J/pwL
	AP84Ip2VXpDjwBQXI6nY1Xr65To8Fmer+Y21MRsFIfKRrCy9OuFb4NPa2znA/3Ib
	7bU877ZvtH1ilDSrEJxnAHil2yj3Hf+kOu6a24q0HnTNGYkdKMkhGgQzlSOk0LVK
	Wf2Ucg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7ptb4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:03:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so1957494a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416638; x=1795021438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
        b=cZZbcmcnTPmIgwCiU16Ab1AoRRwIRrM6EIZEt9K6ASQSfARed2D07hYSKFUeybCr9+
         XoIR2hhul6KjiMHAB98sAGLa9wnMGeRENpA5/D9aSsfV6K9X+mGfdCL1eyiZYYPPXqR/
         iQ+vJVLQH5O0jyXbhqKPuwG1ZoqoC++DNjgCYX2CjEpqx7gpmw9xIxkyy8lvzZIU/zFU
         vxvI8O/yveWbOWnTlkp4Gt0njj3pC6Bqx4RtAPG4YsqxJLZyZ4n5zkGYxdzHzzWMN+su
         8hB1af7jdMvxm7JUkmM9Zm2Q+RS7r5pk0ENA3Nv7qiwpHuNa0tdwTbbRI3VW4PFwCcOp
         URKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416638; x=1795021438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
        b=KZ3J47ll+Io2kM2T04iYj6gLFT33mfxr3BV2P4B9VbjNwzgMKe+0kbga89lNJO5NdG
         rQu7N6+KlzDZdVXTdy44ePwC4W6q0OhpVPGOM4Yj/YGUXjRzcGANZb46gJSyNgtCuopf
         gSpiZ1TDK1PEelq8EuAKDPx8JvboB4kfe52m81s1FtpjYFdd9Fzfa83bjmm5Ty2KgYju
         94TG+76D164b+B/FbkZyaH/iRaOCRfYDqpX8DVVLc63oXz0uTOZfjpMaYW+bo1eRimSF
         Smb41ZR4xqiFMVQHuCSDJPtviBwnfvg+xjj/LKsMwob0ejs7qdYD+rFCut1PNYJ19ayR
         n+OQ==
X-Forwarded-Encrypted: i=1; AL+hErFntujxD3QE9hpOjT1Nn8u9g0sU5mTNw7VdPyVAAqAye0UnqmvaMf8OzppJqc/qoIecJkQPt1xe5TVlaaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z90GH4uLCivPhitZqVKb1+nwXsjBRsKki6tdGovXRHEmIRQqmkH
	62gz7NGbaalW95hStrUgQc8mD7XyUn+ElC7iuvF3PSCY5+NolcsHF0kE5juk5/SGfhWHb99zwAr
	o5U6X0+CsSDwX+z/3l+wn543CkJvD3YUSwg6vN02k71CufuMNrazQmWOCgv2HduMQWz8=
X-Gm-Gg: AYBFou0WTfTZhHvZtyY89y5FZ9gA/tfyL43Qp4K2IDL0cXZo0mwIQbL5OEDHMd0Z2yf
	iHQ0oTHlJh0fPEqI90Q5MwomOMsqmSoUH8RQf1CAPlAE98HRAC82YdgyfoN0QxyCOqzXooFz4D6
	Y5vutz0l91JZmJ+15Cm2ytUwzROrmM/WXo3ARXXQ+9c7VwwhTThrQITUUtrWp0X8GtMT0Du9Qeq
	gpmTK3HSetmBlz+NcdPhm9C6iXq9PBJXuxEMSDvqr5ByPXwIixkK48ZZwwFBx5aNda+usxCW5CC
	3K3TID4YobmWx33p/qVgJW/7t5iiO9u1+fKr7JundCoOcd4av+JfVeQa6NWAMoOUznAq/KNuS3y
	Px2ndl841XHUclX46+PtZnBNKxp7vXN7vVbW7f/Q8T0VYQHVbwEZAK+9GiWFb+iDLCnQ=
X-Received: by 2002:a17:90b:57ec:b0:3ad:b8c8:4a84 with SMTP id 98e67ed59e1d1-3b182f267f4mr3087854a91.26.1794416637508;
        Wed, 11 Nov 2026 09:03:57 -0800 (PST)
X-Received: by 2002:a17:90b:57ec:b0:3ad:b8c8:4a84 with SMTP id 98e67ed59e1d1-3b182f267f4mr3087809a91.26.1794416636929;
        Wed, 11 Nov 2026 09:03:56 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:03:55 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:32:53 +0530
Subject: [PATCH v4 4/7] mfd: qcom-pm8008: Drop GPIO support
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
Message-Id: <20261111-pm8010_i2c_support-v4-4-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
In-Reply-To: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=2884;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=+08zcnHr6A7yFclGJxbZHZCi6ixkui2rq8+7R3gOZmU=;
 b=xzvPfdQghclKk0q/pB7QkkPMalyellw/TxY0YjbTIMhwDnvrlZZuKyilv06UzkgTWlHqKNRuY
 SUPnvNock5rAB53CkN+/pRAaCUxIY26LdK098CCexFzYwUq7UwqvUif
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX0zGjUOoO4/Uh
 lHQHHKzeOoGNjiJhQPfFha/efN4ZDmNQII5gwnbqsgsATmZ+t9CQatBrAK+qSo0ck6SjZC47Q06
 QUGFi1zRNAeW9H/5/dx7SWdOfJPeiOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX4CevEB7xIztE
 cxrHoyk+kb1NKYipZRBJBOZSOeMR4COuxjhHRPOF7KJECyt4oAUTV3HNZhI+ZECjy3y9S7Ow8Os
 h66aSOoisOe9PcpKOlIg/HVKqrp+i0QxCacaOPPuj+ds8gSR3nSqdUfGnPQyLZd+3y2VekXZVDs
 VZIVvjRjnJYEV9gk8lLGqWpks+LmFZjtnn15yBguyooqqwr/qm3Z9TIEIkLpcEXim6Hes9TK7NM
 Z3wJTEGk6Zg3IoU4eQVqeFX4QmNDrTzmt+aMtAg/6zwFRzKkVpn5tLW11dywOfUdWGrokPodSY3
 Cc7Lv7XfHX7Cn/84a1PqGsv8tDByZizShwQIzvQr8UW9rMxzB7ZiYzHBXJMOKCgIFMOgGrBHNJc
 T2SPLn+0uhh7tdPFtxP2XfxT7IRsbSMoIgxbjzzlR40eC7W0JtcsswxD/j2KXkcJ4kH454JSmWN
 fvcmyj8W666yR4z9rAQ==
X-Proofpoint-GUID: Dndq7Mi9ZTzuQzPImfAVATunWPbY7g2E
X-Proofpoint-ORIG-GUID: Dndq7Mi9ZTzuQzPImfAVATunWPbY7g2E
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af49ffe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=-NFQ3DzUh64S9De9z5UA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

GPIOs used on PM8008 and also the upcoming PM8010 have fixed
functions (reset and interrupt input functionality) so it is
not useful to expose them for general-purpose usage. Drop the
GPIO MFD cell and associated peripheral definitions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 60204cc9a2dc..2d6c01cf54f3 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -31,19 +31,13 @@
 enum {
 	PM8008_MISC,
 	PM8008_TEMP_ALARM,
-	PM8008_GPIO1,
-	PM8008_GPIO2,
 	PM8008_NUM_PERIPHS,
 };
 
 #define PM8008_PERIPH_0_BASE	0x900
 #define PM8008_PERIPH_1_BASE	0x2400
-#define PM8008_PERIPH_2_BASE	0xc000
-#define PM8008_PERIPH_3_BASE	0xc100
 
 #define PM8008_TEMP_ALARM_ADDR	PM8008_PERIPH_1_BASE
-#define PM8008_GPIO1_ADDR	PM8008_PERIPH_2_BASE
-#define PM8008_GPIO2_ADDR	PM8008_PERIPH_3_BASE
 
 /* PM8008 IRQ numbers */
 #define PM8008_IRQ_MISC_UVLO	0
@@ -52,8 +46,6 @@ enum {
 #define PM8008_IRQ_MISC_OTST3	3
 #define PM8008_IRQ_MISC_LDO_OCP	4
 #define PM8008_IRQ_TEMP_ALARM	5
-#define PM8008_IRQ_GPIO1	6
-#define PM8008_IRQ_GPIO2	7
 
 enum {
 	SET_TYPE_INDEX,
@@ -84,15 +76,11 @@ static const struct regmap_irq pm8008_irqs[] = {
 	_IRQ(PM8008_IRQ_MISC_OTST3,   PM8008_MISC,	BIT(3), IRQ_TYPE_EDGE_RISING),
 	_IRQ(PM8008_IRQ_MISC_LDO_OCP, PM8008_MISC,	BIT(4), IRQ_TYPE_EDGE_RISING),
 	_IRQ(PM8008_IRQ_TEMP_ALARM,   PM8008_TEMP_ALARM,BIT(0), IRQ_TYPE_SENSE_MASK),
-	_IRQ(PM8008_IRQ_GPIO1,	      PM8008_GPIO1,	BIT(0), IRQ_TYPE_SENSE_MASK),
-	_IRQ(PM8008_IRQ_GPIO2,	      PM8008_GPIO2,	BIT(0), IRQ_TYPE_SENSE_MASK),
 };
 
 static const unsigned int pm8008_periph_base[] = {
 	PM8008_PERIPH_0_BASE,
 	PM8008_PERIPH_1_BASE,
-	PM8008_PERIPH_2_BASE,
-	PM8008_PERIPH_3_BASE,
 };
 
 static unsigned int pm8008_get_irq_reg(struct regmap_irq_chip_data *data,
@@ -180,7 +168,6 @@ static const struct resource pm8008_temp_res[] = {
 static const struct mfd_cell pm8008_cells[] = {
 	MFD_CELL_NAME("pm8008-regulator"),
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
-	MFD_CELL_NAME("pm8008-gpio"),
 };
 
 static void devm_irq_domain_fwnode_release(void *data)
@@ -252,9 +239,6 @@ static int pm8008_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	/* Needed by GPIO driver. */
-	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
-
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
 				ARRAY_SIZE(pm8008_cells), NULL, 0,
 				regmap_irq_get_domain(irq_data));

-- 
2.43.0

