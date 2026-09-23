Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559C656853D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191317; cv=none; b=EgYYKoWkDX+vbKS4bE2PF8a6WZHHdYcWfk+qBV3bsJMTE+DoC4a0+DVFeY9jQwOGJSZbLtQIMJzbqj1QMRTBDEDZ7Pkng0RJPhtDomtb4iHf4yG0s1+hsISY2ibw1AtwScBlI7IaS1p8hUmby0qGW14C406MroU3Jia2o/KSlJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191317; c=relaxed/simple;
	bh=ohYSISOq06N0qko9lQIINmh8oV1XAgSUzbXRNHalapw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S/BtDNTLmYLXrqF4TaJVKZiWS75nuqY0r28hu6Kw9hOAqjv1Duc/cNSPdlpeHIhTpnxf5SVLMfCLMoeVTPyqVR1vZ+KZ3xzAiGehZOYf5avWL6pGfGK5in+Kq1sSvSUsXa9+lzhOeeqs6Fh8PyqU7c0U0RyzOb/879Jntupfjho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLBtLebf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KF+rsfmS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLBtLebf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KF+rsfmS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTkXY3081971
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yncM0a4mFwW905Dld7hPX0qqrUCWQieBsnAkpGF5H1s=; b=JLBtLebff9IsiU9d
	DVksJj8ihP26gIeD1PEBkECAykY11rJqs6/91gwc844sn8XTjZmMak1MQbiTkjWH
	UUM2wtzpL/4HM/5xQgoB8zcWl5iKS04T9fnpVuRoLhQNILWcFDbWEkVa869ucycf
	Icw00LQw6rtc2IIebME90dyqRFA/wgDmfCE7SH0HPbiPr/9GQg/2dTHAPXhe74eE
	y4+F82VGyZEIJo8qr4/l46caV+RkVsY79seeNZnCqQZ//Wegw53wn0uWDFwvfGzz
	WXp5AMCvI87VpXoXUnV5JoIDGi/a9JxxJWMVNIPDkYD086BAn4Oj1rhmWa/XN0dM
	4E2IZA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7jkh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:21:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso1590338eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790191309; x=1790796109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yncM0a4mFwW905Dld7hPX0qqrUCWQieBsnAkpGF5H1s=;
        b=KF+rsfmS8LcfxyrRnL9BGzl+zOBaP/zr9cji8PjaJFoYgV2oahGT8wWRMbepNSG/uY
         H7l8w7+tf6MmZSVAU4Yy2mPOiYUrdZFQYENgyna03RrpoYBGEt+7x8YE4w5pdkdiP030
         6KyeBDlm1LCDPFBgcNVFFVn5OTa4KdtyYRYg74T/aQ8c1MawHZ36sXvu0IpWkT6UML4n
         WWUr8F21R5dI+Fv0t92Kj7UDT2bss2av3eDBL7v6gbEoPxbTntQNgHDETYOwmN8g71eL
         gCrgnXWCs7AMeE7L3mg8hZY1kFPvg3OzLaOOGFVW4Qtn8VGhZG/tfwgZmWMMBldSR7x6
         7w3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191309; x=1790796109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yncM0a4mFwW905Dld7hPX0qqrUCWQieBsnAkpGF5H1s=;
        b=FVUeIWscN/IvAZbe7IlNvCFvMpZ8Qtnibm6s+XKqUCE4V6E+G+1Hb1mH9392Q9a7ho
         Wlf5En3PRj/bsOjoLnyF0X95FibB7IMUhr91sIzATg/NAxTbWX5F89eEgPkvdUgtsDcA
         Bu4bjmAc19u5aN0vEgmrQnANcyvkzONYu8Q9y1uYyGNJTvAqZiDeMGuxdivp5p2l7nXQ
         9vD0YNa2mVtapi48ARrGzn1XfB3Xu12meuYzfpOxcrd+XR7wbP2Uf5Hc7Z9MjLW4xirg
         huQBB/xGRmI4D5CMlr/4B+f1vjownZQFGmtBfIrgphst9FWByfgibdwJ0M3X7Tnbd88z
         w24Q==
X-Forwarded-Encrypted: i=1; AKwUvBwlw2ft+xMzAHJ8mSSxK1p08VZY48qsVb7PMS2UUIOHAQ6gotfPEKAmABihpDo6xk5K6v67mPkiJjErcGA=@vger.kernel.org
X-Gm-Message-State: AFuF++mEU7oMv6wsaVxmUMWGr6YeLX244zO3WeJNxYUIv6UwFe1nDStA
	2ET5fS3VROuJF808A+4b9E0hS1iM/3nphvQ2TVPkxaea52so3sXn8zl4CIgc+A+qFFBtjH9WmTK
	cLwgXECbvOpFA+YRdLLi1EGkHxuZZ767Bpmzni7/+g1D+IlPKsvAzpfyngM7vpkNEj8g=
X-Gm-Gg: AYBFou2xg8G5OM6OdOZIAtVqc8ADBNyRxcgHA6Gc0MVh85FSbRItrI5GRHlDbvL6VYK
	vpMGFZWB/TQmV4W/97it1pZhNTLN/+GNoU1fLE9XTTGZAEQ+Rse0ABBbn7kc4JzBdbzb46wbjUg
	7tsrvQIkny8UM8qmbn42AybYJCIcfht52KRQOL+HcA2vPvuHsUhKT6HZ0efvUYOpg7t9eIBRrGS
	w3kb4M48UTnvxP9hkt8j/2Pf9G7elu60nKd4YKUrlT0uS2sHbWdVpOuG77T8EWpc0LiyZhjhW5H
	BlcUUaj9Jv/RbScLFf/U2U2HmWTgdNiHCex50/YpMSw0CSuCl7CmDve+xc2dDEgbSqqKYdu/X97
	qzQGGq5abpQNF1AVdP4lWkrw=
X-Received: by 2002:a05:7300:ea11:b0:33c:e82:70c8 with SMTP id 5a478bee46e88-34000c300c1mr119875eec.31.1790191308862;
        Wed, 23 Sep 2026 12:21:48 -0700 (PDT)
X-Received: by 2002:a05:7300:ea11:b0:33c:e82:70c8 with SMTP id 5a478bee46e88-34000c300c1mr119839eec.31.1790191308191;
        Wed, 23 Sep 2026 12:21:48 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9684d643sm17609309eec.18.2026.09.23.12.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:21:47 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 00:51:31 +0530
Subject: [PATCH v2 1/3] clk: qcom: clk-alpha-pll: support a 28-bit
 ALPHA_VAL width
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-nords_dprx-v2-1-fa4364e087ef@oss.qualcomm.com>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
In-Reply-To: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: sY52FG6dUAn6MkXS5-OtIdeBeCPZavaW
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab426cd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iX_rjOfq5r2Sv1zA3QwA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3NyBTYWx0ZWRfX9luXyjtdbv9i
 D8PXyNdnN2lCA2t/lyiVBGwHQabgEdLSr5C+43Txecsx2dp316vG7BtcZAbAdmSxv7lWLTVY3Kw
 VBmxly7ZP0chOPmKeHqdJ/UhRYjT/vwoovgNqv8GnZxu7ehTWyaJmFU53J81ZUQPXrWed/7tJ5J
 PFouZsohbw+gv5XFGjrtw9hOhSQWaScajYozwmn5sT9U3YuXff7K7AT2rugkqovKupRLSl0KjRT
 73ouo3KXmtQFumqQ/D7k2LnjQOjSuwytxmBMvrEcYgJVz7tNVOucVPUUc8mCI4WMktIscKnLTx/
 OyQFGnwx9R31gfhP05R7SuiuOoGyfuTAENXkd6paPlhxgvilopz8wmKto6WERGOcFLNZn4BZ961
 lJUib/HnVOzLfFIdkUtk1GwatXBb6sIdlHJ323RGpfQQQ4px78eUFgVCWC8qeABv4elOzwSnKLX
 Pz0a6FHw5TnnN+HM16Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3NyBTYWx0ZWRfX6YZVpMa63CoU
 oFjIBdZbNtDNDJlXlnlhY/vWEbdGHuVEBDlPInfKJZN8a4DEk/cGK/x7XPS9KVmQUhKS1AoJp9s
 XQ258YDyt48Tgz/wBPNQNSoG4NhMh9I=
X-Proofpoint-GUID: sY52FG6dUAn6MkXS5-OtIdeBeCPZavaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230077

On some PLLs the PLL_ALPHA_VAL register has been increased to 28 bits to
carry the fractional word at a finer resolution, for example the
ZONDA_OLE instances on the Qualcomm Nord DPRX. The alpha-PLL core,
however, derives the ALPHA_VAL width solely from the register-map layout
and can only express 16 or 40 bits, so it programs and reads back the
28-bit configuration at the wrong scale on both the set_rate/slew and
recalc_rate paths, making the PLL lock to and report the wrong rate.

Add a way to identify the wider register: an optional alpha_width field
in struct clk_alpha_pll that, when non-zero, supersedes the
register-derived width. This feeds pll_alpha_width(), so the recalc_rate
and round_rate math scale the fractional word correctly, and the Zonda
set_rate L-adjust MSB check is derived from the active width instead of
a hardcoded BIT(15). PLLs that leave the field zero retain the previous
behaviour.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 8 ++++----
 drivers/clk/qcom/clk-alpha-pll.h | 3 +++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 60173b076cc5f16bb55343a1d1136eb07f3c050f..be5840600967942ea0d8df9e8ecfa2da763c4d23 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -41,7 +41,6 @@
 #define PLL_USER_CTL(p)		((p)->offset + (p)->regs[PLL_OFF_USER_CTL])
 # define PLL_POST_DIV_SHIFT	8
 # define PLL_POST_DIV_MASK(p)	GENMASK((p)->width ? (p)->width - 1 : 3, 0)
-# define PLL_ALPHA_MSB		BIT(15)
 # define PLL_ALPHA_EN		BIT(24)
 # define PLL_ALPHA_MODE		BIT(25)
 # define PLL_VCO_SHIFT		20
@@ -382,8 +381,9 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 #define ZONDA_PLL_FREQ_LOCK_DET	BIT(29)
 
 #define pll_alpha_width(p)					\
-		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
-				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
+		((p)->alpha_width ? (p)->alpha_width :		\
+		 ((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
+		  ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH))
 
 #define pll_has_64bit_config(p)	((PLL_CONFIG_CTL_U(p) - PLL_CONFIG_CTL(p)) == 4)
 
@@ -2290,7 +2290,7 @@ static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (ret < 0)
 		return ret;
 
-	if (a & PLL_ALPHA_MSB)
+	if (a & BIT(alpha_width - 1))
 		zonda_pll_adjust_l_val(rate, prate, &l);
 
 	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 3a2157bebc52cd15f55381a068953f21be18f6bb..ab3b4f4fc7501df0fa3f59d741d64646383e4cfd 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -86,6 +86,8 @@ struct pll_vco {
  * struct clk_alpha_pll - phase locked loop (PLL)
  * @offset: base address of registers
  * @regs: alpha pll register map (see @clk_alpha_pll_regs)
+ * @alpha_width: optional override of the ALPHA_VAL width in bits;
+ *		 0 means derive the width from @regs
  * @config: array of pll settings
  * @vco_table: array of VCO settings
  * @num_vco: number of VCO settings in @vco_table
@@ -95,6 +97,7 @@ struct pll_vco {
 struct clk_alpha_pll {
 	u32 offset;
 	const u8 *regs;
+	u32 alpha_width;
 
 	const struct alpha_pll_config *config;
 	const struct pll_vco *vco_table;

-- 
2.34.1

