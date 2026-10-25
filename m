Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898258;
	b=yfAy8dejsHzxxDDCwy5x+XTtThLnIrjL5D1NU5FoQn+dAYys5UbtaDbsttNPB9/h3rGz
	 L7jh38g6eNM1trly3Dz4EtWizFTFAIwdpCuFlPrQv+PgqF/dnVqEJBUcTwSpL8howyVVK
	 ueUUzA2sEb9cEdIphBhO3ofRTsmw3RMxLzItkH24ydJfcLrHjPTDaPjIUu1Se9brxL4W7
	 xJbRHsn+P/cScGEwkJhIscE+RIsrOM2b20ejuKmYnKV0M4lXZxO0ytaHkBionnUn/+Tay
	 4mxh1hpyomLqzPS0eq0QGp6xfJKqrKIY7Bxex7NEnEenXkUq88S8D/MTqR0U86IwWOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898258;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/2hOVnJgU2YYsTWcNQEbWFWVbrTdtgCaqJitAByw1aA=;
	b=g0E3Uj3iUPOV1Ba9pmR1wAW85+zR3btlZ02dE2Yhu0yfPSlLR2surTlaAZAXj+UuqqGM
	 PnTSUSZLha1kM4bwgLByNQIDX3aYzSaa7X6lflDl3FTilY2V10clzju90NCQrt33vigND
	 aqP1Ht1TqzuvCbaZQR0N2SBrbgJw+T6LCfYhxbECb+onGP0cR5mqALUh7oN4d1spy+SHJ
	 8sGp/UZr1QcGYN+wz5jqRm2s0drfEENwhjXnmUrNVeZoTwnmOAiFxBTXzkZAX41a+qgRi
	 Ux7KXDTpimwZW2s/2wY5GbXMKezXbKjE2XKc+sxusTca/M95Wu3OgHCQCOgJwkRhWMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GY7uEl/X";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NPXrd2NJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EA860A6F5F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22EA860A6F5F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GY7uEl/X;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NPXrd2NJ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P165ON3094755
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/2hOVnJgU2YYsTWcNQEbWFWVbrTdtgCaqJitAByw1aA=; b=GY7uEl/XfU7cvSDY
	1mwiQFEsI1sj8T+9cyXLpmVj5F1M4g33l4/ZcyCR/1axDT4F6py8nimooC4IphZg
	7FiS5wWc4hVAgqwzyQ6OozZwoiXekhyMCigWPT2VAva9OFLgoBGXxGh5z3UM3Q9a
	xI+XXM5CNBvhuif/+cmSAi3wvhJndoDUMYVE203cKNntmCU9TZYDMrkrYIb7gH8p
	dG6PlwAXzRKjrykyOyFJBexdtKumIx0lgFEaarqAZ+2Bug/Lo9kiv92f7+6uAKzf
	xDA3w9t7zsQPd900XRM1Xyvz1s7dajoHHcj30+dG4s1Kr7cXDcfxpWRJeYLD3g0x
	PEJDhQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgj1pantf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso4118618eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898256; x=1793503056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2hOVnJgU2YYsTWcNQEbWFWVbrTdtgCaqJitAByw1aA=;
        b=NPXrd2NJ71j0seHNBtZb/K4o+GHdV0pSkTxsDRd16DJoWkFH3j6vbv8w7NuLjtFSQ0
         HCsL4c0uyCmK+uj/NPkZYsCYEPJ4jksLh743b78Lp67HjGtP5jHQEruJbRv8sTbWwZy0
         tbds/XQGcrhhkOkoAYRHKOuWl+2IgDvzAtJSvBQfy3nANiL5Q3GsAZFT/7lKw/S+GnfD
         qc82scyCmwhBDAviv/JuR4a7upzNMw8IiYuq6OglvOnCsUpR5GF9tysEIvpPzRFMKK8L
         hCQgdnDpktzMwkxN6JJhaCuImeZ4MkgLD9Bkf4WWZPJw7ssjCK8iewbsfBgRiu7tjkbv
         W3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898256; x=1793503056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2hOVnJgU2YYsTWcNQEbWFWVbrTdtgCaqJitAByw1aA=;
        b=weeGEwxMLJk8MsnNpn/5e2PBf+aWu44wQRXr7EBnhyO36rfDnHNg08bNcd3eRz0BY+
         KAl1W7fE3HlKhBxmFOBhVKoHPVopvjRgoO8gexpCqL53GGeh0LQFlpZ0qexnZ8nKScRB
         NDbzTCRxiTe9yyNrqMfpbtB2fjtLGwZ70hKRKtHN/oXPFG7fpDh7vK2ruI2FkFuBVkbf
         wqIx1xbWnOF37Hi+Kfp5DSkK8RARsweRVAvaeifMXk9KngfHA7CABMkTs4qk32rhgYv0
         nq3sKOSSjsw4PNO5ASbHTQ8S1c/wBqVGz1flVy16wTI/Az5yporu00wLYlDwSp8g3tlo
         i1PA==
X-Forwarded-Encrypted: i=1; AKwUvBzSHyfBPoGU/Emo0xKJR89LVJClvdYb2Q7ePRcyhq2i3NdrXT8HM5zzJyiSUzDHIOadsazQ0mgDhx4uYuU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdDH1O+ierMnzKE/Zk11F+SWOaH7w4/Kw9tleSv7ckmcb8wuHk
	hcgx++kBGtq5FvXQlVNnU3AQexTNojlqDKxa4AjrGjdO3dJ8UyQwROUNZtrqXgInl8DGLGb12ud
	5MQMtSE0fe1CsLmRL5CBoD5JDBUQsa/jH7aOxht41qC/P3Q9u1HIg6hSfFmiz5lIRwII=
X-Gm-Gg: AYBFou2tfcpvUIXBJ9v2o8ZSJEzYerg1Ll8YCJmr/JHkhlbOQ9qSIo0fza0fOVpb/R2
	Rbays8NXGdWXX2dc3I8eiIZFMDrDT0BC0qDmI8LgJMzAMO7idE4dijD0kW48Q+Ma1L+CBrvJxxy
	XWb90ncHWzqgJT4eN1aYxojU/hFEZUhyREqOjgcHpLClsvxEF+pvRd2SEZc/hCmSjXUBcDje+rT
	tgWEwD0k4pOB5WurXYUgzbD3ZpahhFvBjuNqfi9Dqd5hTdYhSahqEmlF/hn11Q73BFbaxEwEAOD
	IrMAHGlJ5gphnTSWCMWsoh8Ees+cZ5IWv33/UY/EcaZfffqYBRkWU3X7HPzMUKyTgHbuw6pPA+1
	Bdajbvwrr6C8+peoMVA77IwwHj0tuAuUBk14wSkgdXH9My9YcMViVD9CZEgG2kRvqA/EAq0twvt
	n6HhCY8ZVXqw==
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr3405524eec.11.1792898255993;
        Sat, 24 Oct 2026 20:17:35 -0700 (PDT)
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr3405489eec.11.1792898255447;
        Sat, 24 Oct 2026 20:17:35 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:35 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:29 -0700
Subject: [PATCH v22 10/14] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
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
Message-Id: <20261024-kaanapali-camss-v22-10-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX/kJFm7hc/gji
 mpHmJNVxYhXwpDebP8ci9dYPgJGd2aHqgtDAbuGOoXacCVmXhLBpQe0tcrg/rRCV29H3/3AcoZx
 Pac/zmAOzFjBJEo15ddLY3Kiz1TsXZo=
X-Proofpoint-GUID: 1oeTPEXbNSmqHWbQXLgq7J5yhju-fOcM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX8J2q4kFiSMkG
 fbHfXlQSuE20takZ7TmTi60lOi7oRDB+KoFtCjsm7OldawvTm5sYMLcEiFelIDnFgYFXPTV0avD
 3E5PsWYy7h0qtGzKxqbX6c/Xt1gz9shpkGkXAdR9nXUDU5RC8DMLhruU5AvpFDkhfGq9tPeI8L0
 ljztxDtOG9Y0Nk75bP0g1rmNeky+uq9OY6S18pea1kNPdvneHixEA6ITdw+ZlYnvqp692UJ8XKl
 r1m/QPtGzjfF1e7/WrEmniXcuJAYfalwgfiNK7hhHwDwXNpi3LfIsmx9WvlBs9ecbQagHQb84jo
 /1VdmPIvJhpb1IHwe0PXRxxCSmYb72Mzb7wTEhpctTy2tNmRMygbG2enVaHpGkz4rDe6EFdp7/I
 L8Ar5CYqfIJaCks4p+IgLpJf60DuUn8fqTnzS7WIdKoSyT+6eMUpMCRENt5aVV4YG7CAL8UIsHd
 J0yZUfNS9/wmqjZE5dw==
X-Proofpoint-ORIG-GUID: 1oeTPEXbNSmqHWbQXLgq7J5yhju-fOcM
X-Authority-Analysis: v=2.4 cv=D5vSufRj c=1 sm=1 tr=0 ts=6add74d1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1CCqUJFLb0VynuEnu9gA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through the
TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
the data source when a test pattern is selected.

Add the TPG resources to the Kaanapali camss resources so that the TPG
subdevices are created on this SoC.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-1080.c    | 15 ++++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 23 ++++++++++++++++------
 drivers/media/platform/qcom/camss/camss.c          |  2 ++
 3 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/drivers/media/platform/qcom/camss/camss-csid-1080.c
index 9830fa0f8d24..0b87ad0c1bd7 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-1080.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
@@ -64,6 +64,8 @@
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
 #define CSID_CSI2_RX_CFG1			0x884
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
@@ -148,6 +150,7 @@ static void __csid_reg_update_clear(struct csid_device *csid, int port_id)
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy)
 {
+	struct camss *camss = csid->camss;
 	u8 lane_cnt = phy->lane_cnt;
 	int val;
 
@@ -156,8 +159,16 @@ static void __csid_configure_rx(struct csid_device *csid,
 
 	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
-	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
-	       << CSI2_RX_CFG0_PHY_NUM_SEL;
+
+	if (camss->tpg && csid->tpg_linked &&
+	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
+		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
+		val |= CSI2_RX_CFG0_TPG_MUX_EN;
+	} else {
+		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+			<< CSI2_RX_CFG0_PHY_NUM_SEL;
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..cabbb2638cf3 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
 
@@ -33,7 +34,9 @@
 # define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
 # define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
 
-#define TPG_CLEAR		0x1F4
+#define TPG_CTRL_CMD		0x1F4
+# define TPG_CTRL_CMD_TEST_EN		BIT(4)
+# define TPG_CTRL_CMD_HW_RESET		BIT(0)
 
 /* TPG VC-based registers */
 #define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
@@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	}
 
 	/* Global TPG control */
-	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
-	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
-	writel(val, tpg->base + TPG_CTRL);
+
+	if (tpg->hw_version < TPG_HW_VER_2_4_0) {
+		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
+		writel(val, tpg->base + TPG_CTRL);
+	} else {
+		writel(val, tpg->base + TPG_CTRL);
+		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
+	}
 
 	return 0;
 }
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	writel(0, tpg->base + TPG_CTRL);
-	writel(1, tpg->base + TPG_CLEAR);
+	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+		writel(0, tpg->base + TPG_CTRL);
+
+	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index beca4b827b32..e09d778feafc 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5871,11 +5871,13 @@ static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_kaanapali,
+	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_kaanapali,
 	.vfe_res = vfe_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
 	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
 	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
 };

-- 
2.34.1

