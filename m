Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5E24457BA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704305; cv=none; b=G/pI3UGrmCv6aifOJzJRuUe7jtx+UU6HIeR0QjOjpQw5Mau7WKGGBWGXZ8Xhbt4AIrV8WVZ4IK7J7tHkqVVaDFpja7coDv3DGNB+xD21imk+goHJ+aoNmmcGKiXP7PpxckRzf53L7SNu3zVxtLroeRL+OYUpf7lYBPjG4JKp09o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704305; c=relaxed/simple;
	bh=rGQ8+nc1QUBhR4ykJuirDDIWWMzMEvjt/KKxJUxrNKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fSSk5nzvDWNUebAlsWTMowD9y3zjwWpRgMFmutuJs33Dy8Q1VSKlfw8wKTFQMUwF+nGNVAy/IN+5+0GcgNH8iGppUysDO7eZG+WK9J7Bm6wrQI4JMQQKi4+BY71aMnrjDmGp2HLxeWivJm+FP30edvTtl6KsgQ/tThPSWXiM2h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gi7a3/LZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VK6ZkADo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gi7a3/LZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VK6ZkADo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6860CwQj3142385
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 14:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRebI5CBy4iXhBmzl/PlieX9oBN8y/gJBXE/yKnY16E=; b=gi7a3/LZ911zT9a8
	/0LSZygU9XcVhrERLAhd+LuYKHMLt9+Gd63nEsGDUUryKDJ97D2GKZTsP7mJuOcG
	5zYV888latQ+mdZLBfgXP0qT2X9/f20i7qDYaKTL1VMjs+4+9VJycAmZu7wXOctC
	DINv92VM7dxsPSRxsFfJ4nPTfTfYrzTMWIooUs8P9n0rdisfFz8G5IU9IUNtbyRK
	5YDaM2bvm/+URjWXszRqJIy81hSgM2a0Z0CIKFJnx5Kk+3issTtI1BJTRSO7fZ63
	+tWMtE2E/aquEZJXs8XcPpwoHDFsuRyNze9R2UEL8N/EI65B/1itiaINHbe8N1yb
	nZYCXQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbf8kh5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 14:18:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso5427840a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704300; x=1789309100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRebI5CBy4iXhBmzl/PlieX9oBN8y/gJBXE/yKnY16E=;
        b=VK6ZkADoXPf2KpuktmwXuTCmn3QUxLLw6Nk3n3dxoKL2ip0n5OiyYlaMJ1A91jyi9Y
         IbX+H+g7Eua7sxkjEPfke9pDPQcVY/SGEAtybESn7/Jw2ZPcoDq0uUVfWjYI7VLI5Fxd
         EGO4cJPVuikgJtCIhVRzaIhy7B4G1j9pnX/k8rJsD2/IRuELKWOWjJNe3j8g/+bFKa/b
         2QrBoIUyWqx1pC9ZLqBsS59Jvtyl/DsPL8rsIZ8NZ9uZw5eCnlcd7GFsX558EbsXcyOE
         zeU8mZUaMRoho5KzGLfYokAcwaOQBm7ZhTBCepNflmXE0P8bWjQPa33bRovGsxHj5zvG
         Nbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704300; x=1789309100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRebI5CBy4iXhBmzl/PlieX9oBN8y/gJBXE/yKnY16E=;
        b=bmTuCjwyzWQhHiNlQFWYFM9TzkvdNUmoEcISvDXDU7l2QKDdWNef5KACENBCXkAscM
         C+qUfyV9f5VZZ/9PZCzVGu3bHbnYIGIJrjk7MQ5KuFRAC5sEw0crY07ktr6vML5GUNJR
         DLUR8jWwj59TXVPvkhQGFNLs+WMEy5tD0a02bMVvzP3P4helpNHLpTzUKrr2E5Z6FAfE
         L8CZsEdkhLRxpPp/SyirhXXRWaMEGUUmRrSzzP0j3CCUymx/rnJMOGu9Csw2pJLiiu0L
         eb+Xrn5VKOVBzhu0dLK/iNNKI0xEfaBGr+tUm0s3bHrZwK5Wh4jHa1+gx8QfEg4oA/v1
         QnZA==
X-Forwarded-Encrypted: i=1; AKwUvBy7OtSaTfRarREFyFl+TMFNlEpSOy6bceCVU+9XxVNVCeYFajzthMhBcNS1JQDFxydSfZTzkaa5BxaaW2A=@vger.kernel.org
X-Gm-Message-State: AFuF++lEaSDLsBaqMtgilXSunrr/gAoZ3LwojwbTXkrMnDK7tlE+aXOv
	qsTEjrxmPoJ6exMWsH8G+S/CMFCnilnwpi0dtZ2k8iVS2afheydQn5i0mD0H9PJYt7ZYaR1/ZG7
	sAfTc2LpnKiTv2Lu96DXVbLZef9T9+anbU6bzx+/SdenzgwsSjkyIwap7PVKWmAC4wsQ=
X-Gm-Gg: AYBFou3mmqi7oM+qAdDpt5l9+aNTonKgZ8W3z25sQE/3rlricX51MG2gbbAomOYtBlD
	lNc2ZTvtiMrmxhETWjrmK/X+sIY79rX/GRtJMuVJDAXLRNWNM4s1ps6uKo3tljrcHTazcvFwb9S
	l1M37ylQcwIpN4y0W0133uTqh02/7nTym80d4EyYEKIZ+IAZMwuZaAZvETeq5F4Tsd/IBhJh1B7
	LhRKJBTqOGuuowu8YzSKJ88ieM4lLb/J5xz5SXnTWrJm/QfyAmTNIl9NUvHiAobNtfS9lMS2+sb
	4KDGy9+OFbBZyj8UGVahDnfiDGeZ24sAZC59lSZy0D9j8vI+pGU5WYswBGcJPwZLC9xewQr/7h5
	e7Op4KmaRVMF4iNs+qXrSwJqup7h6xY8ICbnnt/udbbU=
X-Received: by 2002:a17:90b:3a8e:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-39b260d2eb3mr27214684a91.7.1788704300427;
        Sun, 06 Sep 2026 07:18:20 -0700 (PDT)
X-Received: by 2002:a17:90b:3a8e:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-39b260d2eb3mr27214618a91.7.1788704299957;
        Sun, 06 Sep 2026 07:18:19 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:19 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:14 -0700
Subject: [PATCH v4 08/12] clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-8-aec5ed642f4f@oss.qualcomm.com>
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
In-Reply-To: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=5084;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=rGQ8+nc1QUBhR4ykJuirDDIWWMzMEvjt/KKxJUxrNKI=;
 b=eDib7Q2eY84EoE93iSBIqLnqj4VzUkuGDTEVz3khxPSn7gzaBfrEu2aCXvAGR0R7Ja4tVkR2v
 IS+/kD/zTN0D1rDIpM8wclr9dYySybJWbfcsKzQ0szFnGoc9NgOD9MF
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX6zv12p+7FtuI
 HtAkODijE7GD1KWvEsDevYiZj36VJvjX2nNi9bOxtdkB4SDFGSuIzrNq0rCX6QfbEQew0MS0RZ5
 D1U/pADgBgbK2Ps0QXyhuzlEkdyvV5A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX6htP2e/IMObH
 zX07jdmpP7tYubscgGTBNFnl2QXqaBCFqnUHkAgRJ3cLVwGTdFowd2kNJHjxFljrV+CUkBgYCAt
 wfg7zzSWQdZI7NippuqjftWNV2M0PiiFxhaWc5FWyyDrVocvsoOGdoJStn3jeAfzCXadqfqkFZe
 GIV7xSqiLdv174IQpVFmxAqRPoxY4zDgD/nTp2hIIwh//iSN5BqKH1q6oUMc2frz8cqXizXZbrN
 OY3peX0I0yU38ek0rZpixagU4rw0RRmaJnY8HyGGa/ykFwqlW5Ie4LvYFAOcwNNpudPiQ7suXhb
 1kJbEtAku87xPnN7f35mI7bcNUN1WVm1nDw6tn/lrGtWlbGlXagqQExr+SORxjmxRmapggwydfN
 +7faWcjZeJaMtAX4LAOtBBD713qv18PwhH++E8yGZbHPSUp7pd2FcO3UIqSrfKIFpMeJywkeSV3
 +PIPsOVfyT2Y29NxVhw==
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a9d762d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VFrLHRkP8_lOF4sqez4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: VKsD3RezMp6sVmKDnuoIzkBZW4vbQLUq
X-Proofpoint-ORIG-GUID: VKsD3RezMp6sVmKDnuoIzkBZW4vbQLUq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060159

The EPHY-RAW clock is an IPQ5210-specific output from the CMN PLL that
provides the raw reference clock to the SoC-integrated Ethernet PHY
(EPHY), which supports up to 2.5G link speed. The output frequency is
selected via bit 10 (CMN_PLL_GEPHY_312P5M_125M_SEL) of the
CMN_PLL_PON_CONFIG register:

- 0: 125 MHz   - for 1G/100M/10M link speed
- 1: 312.5 MHz - for 2.5G link speed

The clock is parented on cmn_pll_div2 to reflect the hardware clock tree,
while the exposed output rate is selected by the register bit.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 110 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index f12352a707f7..6e09c14d7edb 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -78,6 +78,7 @@
 #define CMN_PLL_PON_MODE_SEL			BIT(9)
 #define CMN_PLL_PON_EN				BIT(8)
 #define CMN_PLL_PON_DIV_CTRL			GENMASK(7, 0)
+#define CMN_PLL_GEPHY_312P5M_125M_SEL		BIT(10)
 
 #define CMN_PLL_POWER_ON_AND_RESET		0x780
 #define CMN_ANA_EN_SW_RSTN			BIT(6)
@@ -99,12 +100,14 @@
  * @CMN_PLL_CLK_NSS: NSS clock with configurable divider
  * @CMN_PLL_CLK_PPE: PPE clock with configurable divider
  * @CMN_PLL_CLK_PON: PON reference clock
+ * @CMN_PLL_CLK_EPHY_RAW: EPHY-RAW clock
  */
 enum cmn_pll_clk_type {
 	CMN_PLL_CLK_FIXED_RATE,
 	CMN_PLL_CLK_NSS,
 	CMN_PLL_CLK_PPE,
 	CMN_PLL_CLK_PON,
+	CMN_PLL_CLK_EPHY_RAW,
 };
 
 /**
@@ -572,6 +575,108 @@ static struct clk_hw *ipq_cmn_pll_pon_clk_register(struct device *dev,
 	return &pon_clk->hw;
 }
 
+/*
+ * EPHY-RAW clock operations for IPQ5210.
+ * The output clock rate is selected via bit 10 of CMN_PLL_PON_CONFIG:
+ *   0: 125 MHz  (for 1G link speed)
+ *   1: 312.5 MHz (for 2.5G link speed)
+ */
+static unsigned long clk_ephy_raw_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	struct clk_regmap *ephy_raw_clk = to_clk_regmap(hw);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(ephy_raw_clk->regmap, CMN_PLL_PON_CONFIG, &val);
+	if (WARN_ON_ONCE(ret))
+		return 0;
+
+	if (val & CMN_PLL_GEPHY_312P5M_125M_SEL)
+		return 312500000UL;
+
+	return 125000000UL;
+}
+
+static int clk_ephy_raw_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
+{
+	unsigned long rate_125m = 125000000UL, rate_312p5m = 312500000UL;
+	bool rate_125m_valid, rate_312p5m_valid;
+
+	rate_125m_valid = rate_125m >= req->min_rate &&
+			  rate_125m <= req->max_rate;
+	rate_312p5m_valid = rate_312p5m >= req->min_rate &&
+			    rate_312p5m <= req->max_rate;
+
+	if (!rate_125m_valid && !rate_312p5m_valid)
+		return -EINVAL;
+
+	/* Pick whichever of the two supported rates is closer to the request */
+	if (rate_125m_valid && rate_312p5m_valid) {
+		unsigned long diff_125m, diff_312p5m;
+
+		diff_125m = abs_diff(req->rate, rate_125m);
+		diff_312p5m = abs_diff(req->rate, rate_312p5m);
+		req->rate = diff_125m < diff_312p5m ? rate_125m : rate_312p5m;
+	} else {
+		req->rate = rate_125m_valid ? rate_125m : rate_312p5m;
+	}
+
+	return 0;
+}
+
+static int clk_ephy_raw_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct clk_regmap *ephy_raw_clk = to_clk_regmap(hw);
+
+	if (rate == 125000000UL)
+		return regmap_clear_bits(ephy_raw_clk->regmap,
+					 CMN_PLL_PON_CONFIG,
+					 CMN_PLL_GEPHY_312P5M_125M_SEL);
+
+	if (rate == 312500000UL)
+		return regmap_set_bits(ephy_raw_clk->regmap,
+				       CMN_PLL_PON_CONFIG,
+				       CMN_PLL_GEPHY_312P5M_125M_SEL);
+
+	return -EINVAL;
+}
+
+static const struct clk_ops clk_ephy_raw_ops = {
+	.recalc_rate = clk_ephy_raw_recalc_rate,
+	.determine_rate = clk_ephy_raw_determine_rate,
+	.set_rate = clk_ephy_raw_set_rate,
+};
+
+static struct clk_hw *ipq_cmn_pll_ephy_raw_register(struct device *dev,
+						    const char *name,
+						    struct clk_hw *parent_hw)
+{
+	struct clk_parent_data pdata = { .hw = parent_hw };
+	struct clk_regmap *ephy_raw_clk;
+	struct clk_init_data init = {};
+	int ret;
+
+	ephy_raw_clk = devm_kzalloc(dev, sizeof(*ephy_raw_clk), GFP_KERNEL);
+	if (!ephy_raw_clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.parent_data = &pdata;
+	init.num_parents = 1;
+	init.ops = &clk_ephy_raw_ops;
+
+	ephy_raw_clk->hw.init = &init;
+
+	ret = devm_clk_register_regmap(dev, ephy_raw_clk);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &ephy_raw_clk->hw;
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
@@ -643,6 +748,11 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 							  fixed_clk[i].name,
 							  cmn_pll->div2_hw);
 			break;
+		case CMN_PLL_CLK_EPHY_RAW:
+			hw = ipq_cmn_pll_ephy_raw_register(dev,
+							   fixed_clk[i].name,
+							   cmn_pll->div2_hw);
+			break;
 		}
 
 		if (IS_ERR(hw))

-- 
2.43.0

