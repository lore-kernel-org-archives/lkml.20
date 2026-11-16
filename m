Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806892;
	b=Q5YKW13Ce/sTMJ6gJtt5JUgOGR+of2Qq5fXz7IKxVHA6+eptDcgoLK6ZqA3rGBZ8cc76
	 LnSSeg3rCj3vN7ENNiapkX4iRK50p7vIJHTyEiEuj1BS10GooZvAgY99tQxNKTNw//GHz
	 MSKSNE58NFzU2b8qZmqIrjWdBbZCYpZ2Oal4/CTnYB+XRX1Sgl7LaFjwdqbrS63XYFDm8
	 9I6AKqxsQaziiKOaE8S6Xhsg0zdPvjnZl88Zzuz2KBwAxj8f32FlR5NJ5v6oJa+M4WPRC
	 GXnRxywFfCxbPYtl5SYlV7RKCoiDu/Ov5ueOlSnDY0HtEy1ieUby4tfajZ5lHVDmCAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806892;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YecMylx2hx1tvInV4SmRbK9nY8pk6Nkcij5FJD5aBUE=;
	b=y6Sk9lTkVoFdt2Af8dzof8k0Yn79NyjgnBxKwzSrbFnBGe1emi3pOIVLibDozWhTy7wl
	 MSAPbUvALCeHF5pVawN+0sbLHEFHuRequVhj7DiOJ4S4c3gmNBI9RoK4fifGZBNctOWU8
	 Wl2HL/Bx2MXZQUcUQ+OWuOPwdcDpNZZPDje9VXMcOj52aUu35Cd7MCqp1b/g1fmEgRSuQ
	 cEXMEPwrGolpJ7648XlNDGFxelwBCbX0UyDjHjYIzQ+wNW74K8jz2SEKc33acbU7Bv/OY
	 wdS2gz7L/R6IBtiOwRTgAT3dHsGkcOyU9ltatgeKq6TomVeKDZM2wg/tGc2q8GDHvKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9ASdc+d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTHw56Qs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE20606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE20606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9ASdc+d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTHw56Qs
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5MjEn2233626
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YecMylx2hx1tvInV4SmRbK9nY8pk6Nkcij5FJD5aBUE=; b=i9ASdc+dFArBZJF1
	J2TL8pAAfcAJniWfpqQ9iIlS4m9M+4LsFmM8dH4h7ka6x39UpA3k32mQsJV/Wycv
	sQr8yWCEDyul6fTYwrrqwzfqNYwKM08cQa+QRlVcN2wWfxjBDxAl2M5gFOhqzOas
	m8SX8JYzD8jD0df5LycrmWb4eyClIRy+3V8mqWuevfodur3hDMMnwl+pdMOpQ4/U
	eoIq29/dbruF+t8GKK51lcry/z71BwDz8/pEkF5G4+3Z/6oKiqDB5zIk7Skw+C5/
	6B9pIkECRMPHXdZtHJlnFWSowNmojPt5PmdxsGpNt1C8COX0kSLfKCrRd6RrkBNv
	58aX4A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8vt0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:28:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed08904845so12604645ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794806889; x=1795411689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YecMylx2hx1tvInV4SmRbK9nY8pk6Nkcij5FJD5aBUE=;
        b=eTHw56QsmFnZpNq0v6EqdzxrNpgoVces8lX4s5u7LTQrNpOIbpNTb7KHQyJbIwundc
         0p7mImb8IqvGEnWUhf3NdFbpKuUZ2+oUDjph9wi67qGzX9wLGIvAeEK+P4gOLrt9AuPZ
         fpoaSNxRsI2Qp4x+pgIpRkE95FQApJisi1y/5vGaSBxbesQCJN0ooa7LHiLL/+Fm9vUF
         /EfQlJAhYDIFgz7gW0jJqbYbP7hS7flUKEMNDp1Un4w8AC4G1f9Vbv5lJ9s+3ydR8Grj
         1MDXAp2CenQJVlrM+5aD1EsECVjTirl3POB1EUfeNBE3jpqDxJoLwPweFqUTFkPcbeUA
         rHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806889; x=1795411689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YecMylx2hx1tvInV4SmRbK9nY8pk6Nkcij5FJD5aBUE=;
        b=xBDLH5A+0Azwos/JTI8sGOw//vqaUChPY47vPSwUuyjfwHfYVdSdseXWrn/ubZYtI3
         EC6o4sJGN36Q3KzE5OeikaS7+kcyAaSH9J/3uw6QeFO5DX63uznKKyBtE+US4lfWtK48
         ZgYjFR3HHgfnGaqoOutsgWkrmxinhWY6cOPGE/PSor4OQWVW1UlB7pVPZqLjPxlWbnax
         vV2ujFY2NEir9rCsmQ1svbcNBw3kp6xERufqAQv7iYtvgzqMlt1h+77VGFIX3N6jFfaQ
         vVaU3e4Sq1qA8AzOHKw6AXH8QB+r+8dcjCQqJuWQOu9Tvcg29H12E1+opK+ucRe9QR/k
         B5mg==
X-Forwarded-Encrypted: i=1; AL+hErEHVQU7BE5euHgsux3X2tCXwC49TVUPklq5x3BwvoBGvrRp7YEqzcIUMg6GhGvcL/2FSMjIuyi7lHA8Yac=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iL2xCWnZwWM9Kj1n7nWR8N69O9UjR41vv8P59qEYnG55tGC0F
	rVm8p62IeeeC/6OWpvdWmnVTU1wvtCOF5/LTfmnzvK/MdmIo7AwYKpDFQmT+ID0iC8WxrV6Dl0V
	O+vKCKZycYQGQCQMOu8UbMf8aUZZe+FjhpsEiHcs7x/5LxOyYpJRqLU8TCurdDNDoPNw=
X-Gm-Gg: AYBFou0WBUTVjj/98c3eantzPIV3mF0rP1MDc2NzaO+7Yuysc5BCm2uaG+zBW2RFkY9
	NCFzORDK3EOgdtFZz5rZZa3WqDOavedc1rrqypHf2k9Is65eEAnT0QgU5Ns//D4korbQl4tuzOU
	y+E22/Jiu+cklTNkTx2PKa1mwvJcqb4AUVnu0iQKfZvZMhzIxZFedpI/u5wdkUXVb4HL9LKJ32H
	TKiq7K+jgDh7bdrYgTrYR3pwy6tY2z0smdp2YxUEfYNLRiwVFTXF0vZtoW6Atxq5J96ug93VuYU
	XtwrAHrYXqozA6WWFhJTGAFOgrwDiTpAvSpGWq2x2W6AVE/bFW+iX4ZJU0LiWo7reZqwa4FbvJp
	JRkTOZw1lhrj4NE9f5AQAk2GqcM7IP4efWfw5PJNc3mcUNkdvlQZnxxQkbsSzko/L68gFRuUAbw
	==
X-Received: by 2002:a17:902:e884:b0:2e9:8202:509c with SMTP id d9443c01a7336-2ee0d672781mr99831785ad.7.1794806888928;
        Sun, 15 Nov 2026 21:28:08 -0800 (PST)
X-Received: by 2002:a17:902:e884:b0:2e9:8202:509c with SMTP id d9443c01a7336-2ee0d672781mr99831575ad.7.1794806888523;
        Sun, 15 Nov 2026 21:28:08 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad519sm31478885ad.2.2026.11.15.21.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:28:08 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:57:45 +0530
Subject: [PATCH 2/2] clk: qcom: gcc-shikra: add PWM XO512 source clock
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
Message-Id: <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
References: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
In-Reply-To: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6afa946a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=dI8U08jQLcRiIMuaFhoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX0mXEfGSHV1P8
 5I0izlja2p+JdBd86+j1vcCN4KVxLFrQ0+PXp/3ySfiB7hX3f2tYGE5vTSnHHukonDk5de0U8Us
 aG/eEtAYP4hMyXmAscdei8fsd/F4kes=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX9cJiaZxPfQiD
 1PEHqUWRNO1Gd/pD6udCfv7V8f8zbYxOtZoxbD4fJx3a1lv8ax7xwiEMZWnOsOFqtXTpHqZfcOX
 5tVptcgG/X1snNUfVUgt9JCmXrOhQgvNhNBLfGw9jY5pDcVShCqlqbraA9dSFGvWHcnr9/gVNdi
 HCKMfBLaJhdSYZ/v4q7gZ3+Jj3BAxG8JMRd364X/G/GB/XHrItZmip4snCQyWC3LjQavU8SvFbA
 3AX+0qO2w0nIlk+g2+aoD6BC4dhVTt8J3H9IRga+u4F7IUcynWsSzI1+DF1A3KFL92fIabFIgE6
 Wqtnb0at/IoyKCXXhHJr5qcFJafBoONCjQGIBVAEmJs72s6W7jxcKEtIxcVZ1BgrrcLUuY65/PB
 KRp+GEvuwtQgrZvGMT8hDSc0DzmYUgc+lnz3SAUiAjGrg/TUbMTXSpPlsXvUs/U1fUjOymPSMOF
 b76kOrp/5Z7u8NFSkcw==
X-Proofpoint-ORIG-GUID: t9AqM3LXgg7BXXNRFyjTzqa8oJyp-3LM
X-Proofpoint-GUID: t9AqM3LXgg7BXXNRFyjTzqa8oJyp-3LM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160021

Add the programmable PWM XO512 divider sourced from bi_tcxo and make
GCC_PWM0_XO512_CLK its child. This permits PWM consumers to select their
PWM core rate through the common clock framework.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-shikra.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index 13c99a883e29877d9a929f26ca0b3b04b1ea0b11..93df784ba14376ecf2b60c5eb37e6d0b5cef9501 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -1888,6 +1888,21 @@ static struct clk_regmap_div gcc_usb30_prim_mock_utmi_postdiv_clk_src = {
 	},
 };
 
+static struct clk_regmap_div gcc_pwm0_xo512_clk_src = {
+	.reg = 0x20030,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pwm0_xo512_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.index = DT_BI_TCXO
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_ahb2phy_csi_clk = {
 	.halt_reg = 0x1d004,
 	.halt_check = BRANCH_HALT_DELAY,
@@ -3212,6 +3227,11 @@ static struct clk_branch gcc_pwm0_xo512_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pwm0_xo512_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pwm0_xo512_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -4294,6 +4314,7 @@ static struct clk_regmap *gcc_shikra_clocks[] = {
 	[GPLL8_OUT_MAIN] = &gpll8_out_main.clkr,
 	[GPLL9] = &gpll9.clkr,
 	[GPLL9_OUT_MAIN] = &gpll9_out_main.clkr,
+	[GCC_PWM0_XO512_CLK_SRC] = &gcc_pwm0_xo512_clk_src.clkr,
 };
 
 static struct gdsc *gcc_shikra_gdscs[] = {

-- 
2.34.1

