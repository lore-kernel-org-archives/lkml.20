Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ECB423A6C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704302; cv=none; b=UISkjEExY72+uCym7fb51vmuWqqCZBvO6aprWblQdm1//auFLg3BWWgKLKMYHey+2ASQG6bnB5SfIi0hUPe4hh/UBJwP1+2dE5p6b0a7w0csAW2LJZlVmRNjIEUJE0m/7Zsf0eECB3fBv6nDOUdKQWBOeUZv0zX32PgCWFuHUbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704302; c=relaxed/simple;
	bh=wm5ojTXYs0wzd1J0NijUMU3VXfF8GgsZ4M3m9TTT98g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KqP62OkWZYEhXYl58PLR4u75bhvVpw2mD/KKKLYF2SyBcJFo0pqLYa9F2Jw15gd5SprePx4GxuONRN9vkZslz/XqDbl0OJD0Tg+kkPQNctHX2/g/cmFa9k54cgsuhVZ4m/PDLSxkJ78mnC9W2CvdhqT2QNZIcFLFHWc+AWOu658=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=esZv/qT9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3BygMGF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="esZv/qT9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3BygMGF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6865FF0h089754
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 14:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	INvmp9hR8PtjEw9PzeiXQdgYHmvSH90ayBewBLhZ8HQ=; b=esZv/qT92QZSdg5i
	b+YyxNrb8CE4YBUkyonPYSkpv0mMYzPV0ECzl7bU/jy+FoCMDreT3DWgHFmrxUmv
	ZKO2IKby1ZxvwcHyLNEpZuhsSF6H+d7r/AtwAA5s4mgcnRomVhphYnHYlZw37Exn
	hwJqz9gmrgblBLv66UF+Vi31MVRSsdWAo3XRuBr+oo97Z/X4HeLzMH4S5sHkSoQd
	NYOAU/TMYkWeHejCw2HYBfu+2+RYWx4ClLPxX99KX4N7WtVpk3bWV86Mf5W+ItME
	qxS4wrmLUaLK1eXql/pDjvM07nSHhF7Y84QMQ4z+7IfskoHwxUNLtw3Y/tz492EP
	2e/geQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhkjcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 14:18:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d292eac1so5850599a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704297; x=1789309097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=INvmp9hR8PtjEw9PzeiXQdgYHmvSH90ayBewBLhZ8HQ=;
        b=G3BygMGF5WPcE6HmYaXcG1XIsh8POGVTFiJ0HOUtM4gIUhdpQ9Q/R4yaQGPZB0H9Wy
         u3hm0zOdIRs3MY111+MqAg7UTSWfh951wOW5vOb4qcAhvkmKjtWaZYbNHE1LpTAD/edA
         PHo5QAgAEWs7pg/LR59mXCWFcAKilFnFqsuUMTcbAoS9gJ5tYOw23pu1PaBEqhqZEpH6
         I3nn35U+8Zk1CGjKWr4P1KXrwRGSqhksO1UMR3yn6cA+Q96wAb18AdMvjY6PXU4AnvVv
         MW3c5B1BUhiy28+naEnB88D1SjkOyOpEQyry9rM9PUET9GovfqaEqhrFAfAcx2k7R+fq
         3nQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704297; x=1789309097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=INvmp9hR8PtjEw9PzeiXQdgYHmvSH90ayBewBLhZ8HQ=;
        b=nzjLukmOcTSQqQAUBCuneJDNyNfYKCbz/mB2orwqVLxesHcZef5iGo120P8ou8D7s6
         85bwRxHNn1BQaPlB4ktdxHemfYjNDqpoFAvtnzIRXF7qbXx5KznowJgVNcFkULSKmIoQ
         1j1lDIqwyCrP/pwj6DEKvLHwyxpzFxxQUISQcocbqqpn7rGLkDq346UWAHwEUcJfIwKa
         1r8Q84WdmsbF2P5XhuoCZnNUG5lpaxM51zKE+f+K5O1cLTtAk+9Idc5GHVes3HVKnr7A
         Bh2l7UW8pvygjfewR/ide5TiNvYiQJ9RywhzhBm/0lPpQdQEK6tzHfpO8eWyNt/+dTAd
         fqIw==
X-Forwarded-Encrypted: i=1; AKwUvBxA+KD3J/WBP1TILC3MZGoZlVKroGgFQfNprt6VqtxDZAinUAKBS1L0IoH58Z5E35KOzbYz/QkE8bIBOdw=@vger.kernel.org
X-Gm-Message-State: AFuF++kHHHZ97mY5cpbk3lJB+b5iyJDM8Xa8V2C0Vk5xLwuMPN4XTH1k
	PZ252p2C4QB3e5vnj/mYGdIfMV/BhW5qAx3zrZMe0WxsU5Vsg3ztlewM/xWDpO2l4iOfFiMLR7m
	y3rpwf9z0d0BMhUmMk6tyH1wccmQpksRGrl23QaV3CK4uZ+qlrwDuAkb7gsVwMvzriS0=
X-Gm-Gg: AYBFou0mEIpyvcclRD5SIQraX7rpi5k6oGTYPwVJZ2yljUUVti9BJfV1N07WO6B450W
	kuijK9xkOvJCbVy4Ao7P75LORQaXX/sgfPZ4EZ6KAIrtAS/eh8znZ/Sh79AZ06zOmqeqWiqMIHB
	HKxXWHCZU8RjX8LFGqE/mJBrEblt19b63fkTFtkJW+2O+Sgya+IrDhbFdnNUyUQ94LeOjue23LJ
	XPNeZhpwkJIsHKBzZRieHsvtQwbZu+gZTDh2MHKZcrQhljj61O2yEx2JW8hPlUDDMeBrMYRop1U
	m3f7L+Nqn8M/czGuCeC6TXOCwskIMiIi9AYSv8EPgtNk5ghGnYc/xULElPYBPA4Rem9qzfgnXi2
	atcE+Cn7TCrUBSmFZX7v8KLBiy8yGFKUGqrk9SbfNDoE=
X-Received: by 2002:a17:90b:5344:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39b261b1a47mr29642842a91.13.1788704296823;
        Sun, 06 Sep 2026 07:18:16 -0700 (PDT)
X-Received: by 2002:a17:90b:5344:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39b261b1a47mr29642784a91.13.1788704296356;
        Sun, 06 Sep 2026 07:18:16 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:15 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:11 -0700
Subject: [PATCH v4 05/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-5-aec5ed642f4f@oss.qualcomm.com>
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
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=4836;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=wm5ojTXYs0wzd1J0NijUMU3VXfF8GgsZ4M3m9TTT98g=;
 b=f+v8eoJOg4gsKvP/Lr9o0imKYAGK6q/F8uENdDCVVoRnJ3kBfJcx4iHDDGzinJmLCbTEoCSCi
 0dWXBRrGJNBAPpjZ5QQ1zpET/TDlwHUglk+iF/fzsUGWCloITWaCR5D
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: PnXj81yyTaZa2wQ4AgfOfEAOUyvBGbLp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX73fIaBP6KI9S
 DIufPnTx4fp/HPVJnRn2fLGizVx/exRGse0Fkym++Qkyd6GggKmjGNWu2YQcHQhZCqydCNdI6O8
 cw7uxGmZJfgXAB+HKSuf8RxG+ljbQTA1ZkM6kz2J5smFr9D47gYGB/PE312aZiY69a/oUuQC1pz
 /Aj7Y0gpclhhULpEZhA2JF7iUax3GdkaS6M3txdqsG+3fshhEQW11OK4MQawarnZjq3oPmczWqj
 yYGs+W6aF8HVG0pE+bVwvh+ChtWuOWrxUs8GGej6Hypmipjm9w+cHVE0FZ8ygj30q4hkyoj1a1z
 WLVOpODrQ62cJi+8O+f8b1RKZVpqVyPUaa9ExEDQs9i1fdXVHYWHS5LvPGQy0qvkemEL/Dg6Xp8
 dnAW3zT+s2T4VqIUBjoNSF8lYyUWfLrt5sTz30V7TfoSh5oxDgLCbACqBiN8MF6yyfrCdrgFUCf
 LlNJTT2H3AmiyeYQPPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX9advGsKiglYn
 psC4stDPI3t6nzLFa14NYLQh+IFh5mDSh7PpnWsnbFJXXdtdhqvcPuJHz86tboWYOD0gWRYOrwI
 VqoU4oQnlBiS2siR3M9gYLo7vegU/Rc=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9d7629 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=g-8Oty4yfJ5la9H7Sy8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: PnXj81yyTaZa2wQ4AgfOfEAOUyvBGbLp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060159

The NSS (network subsystem) clock's parent is cmn_pll_div2 (CMN PLL
rate / 2); it is then further divided by a configurable 6-bit divider.

Register the NSS clock through a new ipq_cmn_pll_regmap_div_register()
helper, built as a plain struct clk_regmap_div instance instead of
hand-rolling recalc_rate/set_rate.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 82 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 77 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index c86f7982607c..7cf2b09e94cb 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -44,6 +44,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -60,12 +61,18 @@
 #include <dt-bindings/clock/qcom,ipq6018-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq8074-cmn-pll.h>
 
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+
 #define CMN_PLL_REFCLK_SRC_SELECTION		0x28
 #define CMN_PLL_REFCLK_SRC_DIV			GENMASK(9, 8)
 
 #define CMN_PLL_LOCKED				0x64
 #define CMN_PLL_CLKS_LOCKED			BIT(8)
 
+#define CMN_PLL_NSS_PPE_FREQ_CTRL		0x98
+#define CMN_PLL_NSS_CLK_SEL			GENMASK(13, 8)
+
 #define CMN_PLL_POWER_ON_AND_RESET		0x780
 #define CMN_ANA_EN_SW_RSTN			BIT(6)
 
@@ -80,15 +87,27 @@
 #define CMN_PLL_DIVIDER_CTRL			0x794
 #define CMN_PLL_DIVIDER_CTRL_FACTOR		GENMASK(9, 0)
 
+/**
+ * enum cmn_pll_clk_type - CMN PLL output clock registration type
+ * @CMN_PLL_CLK_FIXED_RATE: plain fixed rate clock
+ * @CMN_PLL_CLK_NSS: NSS clock with configurable divider
+ */
+enum cmn_pll_clk_type {
+	CMN_PLL_CLK_FIXED_RATE,
+	CMN_PLL_CLK_NSS,
+};
+
 /**
  * struct cmn_pll_fixed_output_clk - CMN PLL output clocks information
  * @id:	Clock specifier to be supplied
  * @name: Clock name to be registered
+ * @type: Clock registration type
  * @rate: Clock rate
  */
 struct cmn_pll_fixed_output_clk {
 	unsigned int id;
 	const char *name;
+	enum cmn_pll_clk_type type;
 	unsigned long rate;
 };
 
@@ -108,6 +127,7 @@ struct clk_cmn_pll {
 #define CLK_PLL_OUTPUT(_id, _name, _rate) {		\
 	.id =		_id,				\
 	.name =		_name,				\
+	.type =		CMN_PLL_CLK_FIXED_RATE,		\
 	.rate =		_rate,				\
 }
 
@@ -360,6 +380,44 @@ static struct clk_hw *ipq_cmn_pll_clk_hw_register(struct platform_device *pdev)
 	return &cmn_pll->hw;
 }
 
+static struct clk_hw *ipq_cmn_pll_regmap_div_register(struct device *dev,
+						      const char *name,
+						      struct clk_hw *parent_hw,
+						      u32 field_mask)
+{
+	struct clk_parent_data pdata = { .hw = parent_hw };
+	struct clk_regmap_div *div_clk;
+	int ret;
+
+	div_clk = devm_kzalloc(dev, sizeof(*div_clk), GFP_KERNEL);
+	if (!div_clk)
+		return ERR_PTR(-ENOMEM);
+
+	div_clk->reg = CMN_PLL_NSS_PPE_FREQ_CTRL;
+	div_clk->shift = __ffs(field_mask);
+	div_clk->width = hweight32(field_mask);
+	/*
+	 * CMN_PLL_NSS_CLK_SEL / CMN_PLL_PPE_CLK_SEL reset to a valid, non-zero
+	 * divider in hardware. CLK_DIVIDER_ALLOW_ZERO is deliberately not set:
+	 * a divider field read back as 0 is genuinely invalid and should trip
+	 * the core clk-divider's zero-divisor WARN rather than be silently
+	 * tolerated.
+	 */
+	div_clk->flags = CLK_DIVIDER_ONE_BASED;
+	div_clk->clkr.hw.init = &(struct clk_init_data){
+		.name = name,
+		.parent_data = &pdata,
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	};
+
+	ret = devm_clk_register_regmap(dev, &div_clk->clkr);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &div_clk->clkr.hw;
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
@@ -402,12 +460,26 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 
 	/* Register the fixed rate output clocks. */
 	for (i = 0; i < num_clks; i++) {
-		struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+		hw = ERR_PTR(-EINVAL);
+
+		switch (fixed_clk[i].type) {
+		case CMN_PLL_CLK_FIXED_RATE: {
+			struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+
+			hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
+									 fixed_clk[i].name,
+									 &pdata, 0,
+									 fixed_clk[i].rate);
+			break;
+		}
+		case CMN_PLL_CLK_NSS:
+			hw = ipq_cmn_pll_regmap_div_register(dev,
+							     fixed_clk[i].name,
+							     cmn_pll->div2_hw,
+							     CMN_PLL_NSS_CLK_SEL);
+			break;
+		}
 
-		hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
-								 fixed_clk[i].name,
-								 &pdata, 0,
-								 fixed_clk[i].rate);
 		if (IS_ERR(hw))
 			return PTR_ERR(hw);
 

-- 
2.43.0

