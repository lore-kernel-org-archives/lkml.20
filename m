Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7E837E304
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812060; cv=none; b=UIaao4j/byKdwOGwrsJCL1iIDeJcFqA9LPPg4FufH5FJzUaMODiGVzqIcATQOX1W/40PFQNgk2Uu5xdx7vr5EALFdNxzzZ7ONASfsKHVaGVjNrIxoU9Px3pGlvL5TDuPXxHX0k2eDNetOF7Ht4UpE1stNxB16kcLvc2yagkywYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812060; c=relaxed/simple;
	bh=AQuXFsW4tNdVlh5swpJRCxyG6y9zl4i520crN6qxLqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ko3XUUkf2HvZoRwCMr7XsZ+7U3+EH9kPpNNVnAotlffPpe9+J9mrWi77u+V30XNs72z1Q7xx7Doub6kU6Fa5lRybcekLNX/OVWoWYxXanr1j7khFLYBaG5PLaFmBBs5qNdqIQPgWJj5iC1F8tFFjUxHkSfCraqrAdy6+bCQD5t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpOuWOIZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGFfxO88; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpOuWOIZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGFfxO88"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0eP72679983
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ZO9HNLLNqcZbFHntk3RATNGGcfmE74k0W1y+uxwR6k=; b=CpOuWOIZk9ag2DlI
	cALe4RDuNCgZqete2ha44vZAThVKLX4mveYdEk9vKfmSsVeoxt1N1WgaZf4xPCer
	xpzexobcirKwxYCEFUI6HDs9ym9oXuKMST26S3QG4KhEDJwccHcxk/UB3SC5j9SK
	AGaZmSHCak83GnNcP4Xxx5Mc9xqkYF897lCTagUU1/2GNl9URFqW6/s8wpnVJ63h
	w6ZMYIwtKeCGNH/siQ9t4o6jKggYtuvOrBQGWrWvzo/pr4vd8ndoq4vJrEhDHDAe
	CjZW0Ifu8OMLLdudkT/Ls08+mPKSEYi+cuneZL18jY8qyq42uc9OKHwgnSZX7sOc
	EZ/dAg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1t5ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:34:17 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso3169522eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812057; x=1792416857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ZO9HNLLNqcZbFHntk3RATNGGcfmE74k0W1y+uxwR6k=;
        b=aGFfxO88VBvZFCJZ+0O/aUQuFHep1hgkoN7eGjJg1eBk3CBuARH6b+5H9moxoMIhW0
         6CBxOw79g0OUwHJJx+1F1fCwbG1VgE/GwPzOGIcRCZpgYml6AkUzLA0BVeE9IKHBie+g
         GsNgWtqRjqq9YHpyfL7zjeIMJhF+/JPKW7pWW1Eps0H94bJxjIGeJoI5YWDGAQ6OE826
         vxdp8cRoimu3GI6J42+MniHKRjqlaiw8NwXDq6c82XS7snMrFsjucpevgKWXMu2P9uIy
         N9uhbB4+mPUtwMxkeeOJfu5Qrjvsmhpq2HLJONl1XkiZ+icRxy/iGNzVaqqIq5siq6j4
         OA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812057; x=1792416857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ZO9HNLLNqcZbFHntk3RATNGGcfmE74k0W1y+uxwR6k=;
        b=zM2rGrv1t8QfICgbeDB4p1f0xGjf8ymcq4uC7/aQojrFZJBCWeh+pDRMlORnlLUE0R
         rruDUT6NAtxep1+5kp2slQ4u5DvXBNnJVtk3zW6jNRMvRAr3ngt/RJPDUK1jEYBXt1mF
         9WjF7hcK4j+e7+6N/aiVw0jETcUVSDudSxBHb8Thi3X75RQN4pj1fbh/0fR0EkCeISPK
         tPyfbHRR+o1q++xRVyPmIn1OY+j78satxzx3DnGUxszPJSypWW9sU6mMek37Vsbrn4z+
         NQ6X96FR0Gin5p+MK4PW1ecYibW7g7nOLMaJJAirGw6tseKvb3d+tO9nifbmeCKMRftK
         fwxw==
X-Forwarded-Encrypted: i=1; AKwUvByeteoAV8GSAPJIzF94V1bp+uiXYoi2Qdjyp42LR3yg8f2AddIiaFlsK2VTZF060MHBocq3+TT/ptLlXXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFN0GHPvCbS2Pnp7QEa+602wsQvfM8zX5RtCwNMpLoX7rMks0S
	uT79ZE6KH30LTffpUu3lhP9DhtomDqAHJZBScO3ETvjXN+XHFlbt2Yy4d3zIZAFsMfjWrDEcdNp
	gWPUp0WvYsfhyJzZ0Weus20yCnHvx3rScwg8uwaYaVC4nJhcAMvCJtYlIWGkbLK2MKSc=
X-Gm-Gg: AYBFou3vXezMjA1aTWZbVahUKEb2LaF3flIxtvfxjMw3O0FTbtpoRbGFFCYTY5ldUE4
	7b7wPKY/5O5YufmQkFY5GjdURcVKYkrphpzo84AOLPcS5TuzI8YtccNr5zCDAyIJdIa552sx9XA
	gH5lNgESDZxTrwDlXZt+iMv2IA5+0snUMwCzUbChveGe4kXdCdoMSZT2dxrKcBEGYsxOAtSHH+6
	wXRnz6Q5u9N5ukEohxXiA7Ty5htMtZ8Ig93lSk0PovqaXiwIKaNStLi5CCMlAIm7v7WbZkHWPgA
	mIppoON/wqR5maZuC+26AjIyczDobnUp6cczCWHEe90rpPwSQKcKy8ysOdpxZmivnVpcWCHSgJb
	oldsD7JhbeEt9iphuRkTErsDiRYE=
X-Received: by 2002:a05:7301:f24:b0:351:595:750b with SMTP id 5a478bee46e88-3537e2964f7mr14905681eec.36.1791812056927;
        Mon, 12 Oct 2026 06:34:16 -0700 (PDT)
X-Received: by 2002:a05:7301:f24:b0:351:595:750b with SMTP id 5a478bee46e88-3537e2964f7mr14905657eec.36.1791812056418;
        Mon, 12 Oct 2026 06:34:16 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:34:15 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:21 +0530
Subject: [PATCH v2 11/13] phy: qcom: edp: Add Nord PLL configuration
 callback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-11-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=4783;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=a5XRl2SA0hyveR2kRhO0hXsLMrPVZAn2FeKG/SbK1s0=;
 b=MRmRCsYT29d/XMuAeE3OCY6Sz58JMZtl8zQgVvmaVSzML6Ox8JKoC/1kMoc5vsqlDzaQVZPML
 6JtvlNFTVpQDqrYRinG9QIqunEFz0eXzpAhz63XhsYsU5gi2wyPR8md
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: sb7S6MXhdtd7qAOWq6R_1GvDJdSQ9QI0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX0gkqDaWAwAzw
 mbgSUoglY6YAgjAM2noxKnVjmQPuXcFSLIQquyny5C8LV9XRI8UCbg/CQIWtOy5aXEHlbwJNZ6v
 anQ9LNyjZ+b9EAHPJM1kMR3DGsMUDL4=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acce1d9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PRaozp5Bz6Goyj2T3wIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: sb7S6MXhdtd7qAOWq6R_1GvDJdSQ9QI0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX+sdG8sEiLJHV
 BfPmDEdnkCPR+hiRoHrlcm0o08OfDpURrogdb2q5bwf8UDkUk1WiF53XnAuOlldYng8uyaU2Dmp
 cnd+R2DLzWfmbSI3CPFOn8oTUNWnoEKkzMMadM1uT9z+78IDGhWrAHagaD3ZZB4ktyNISOZCfXI
 9SNIAXxtvW429W1n3ryuaUR0CHufr50nwZ8xKI010lzTNPKiWCnyISGN+8R6LUenibTMssecn8C
 VidHYvsLCrZZ1ggPP5WjSHEKZfc5HoaMpUVlRUKG2pXFcz/WMjrD+28IcYIaaBpcr2ZfnAXzCA+
 Q7tTtPaVsuZ2rBqpimCE6l9nl7mqD7o80TK86KgaT6OcaL7pxib6QsF+PIxZuYXi+/kGk2J3PSL
 4HK+BvwLNApvZ522J212c/l591utKQSDpGwJ3KxyhX9z4nP6AlNA4qT/lXxgb0wLJ5hfO54yv0J
 D3ruaZT12YbJthnN6pA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120053

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord uses a 38.4 MHz CXO reference with a different QSERDES v8 COM
register layout and PLL coefficients.  Add
qcom_edp_com_configure_pll_nord() which programs all QSERDES COM PLL
registers with link-rate-dependent values for RBR, HBR, HBR2 and
HBR3, per HPG Table 2-1-d.

Assisted-by: LLM
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 103 ++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 66c31684c48e..3e857d105668 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1638,6 +1638,109 @@ static int qcom_edp_com_configure_ssc_nord(const struct qcom_edp *edp)
 	return 0;
 }
 
+static int qcom_edp_com_configure_pll_nord(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 div_frac_start2_mode0;
+	u32 div_frac_start3_mode0;
+	u32 dec_start_mode0;
+	u32 lock_cmp1_mode0;
+	u32 lock_cmp2_mode0;
+	u32 lock_cmp_en;
+	u32 hsclk_sel;
+	u32 code1_mode0;
+	u32 code2_mode0;
+	u32 core_clk_div_mode0 = 0x14;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		hsclk_sel = 0x0c;
+		dec_start_mode0 = 0x54;
+		div_frac_start2_mode0 = 0x00;
+		div_frac_start3_mode0 = 0x06;
+		lock_cmp1_mode0 = 0x37;
+		lock_cmp2_mode0 = 0x04;
+		lock_cmp_en = 0x04;
+		code1_mode0 = 0x8d;
+		code2_mode0 = 0x27;
+		break;
+
+	case 2700:
+		hsclk_sel = 0x04;
+		dec_start_mode0 = 0x46;
+		div_frac_start2_mode0 = 0x00;
+		div_frac_start3_mode0 = 0x05;
+		lock_cmp1_mode0 = 0x07;
+		lock_cmp2_mode0 = 0x07;
+		lock_cmp_en = 0x08;
+		code1_mode0 = 0xf6;
+		code2_mode0 = 0x20;
+		break;
+
+	case 5400:
+		hsclk_sel = 0x01;
+		dec_start_mode0 = 0x46;
+		div_frac_start2_mode0 = 0x00;
+		div_frac_start3_mode0 = 0x05;
+		lock_cmp1_mode0 = 0x0f;
+		lock_cmp2_mode0 = 0x0e;
+		lock_cmp_en = 0x08;
+		code1_mode0 = 0xf6;
+		code2_mode0 = 0x20;
+		break;
+
+	case 8100:
+		hsclk_sel = 0x03;
+		dec_start_mode0 = 0x4f;
+		div_frac_start2_mode0 = 0xa0;
+		div_frac_start3_mode0 = 0x01;
+		lock_cmp1_mode0 = 0x17;
+		lock_cmp2_mode0 = 0x15;
+		lock_cmp_en = 0x08;
+		code1_mode0 = 0x14;
+		code2_mode0 = 0x25;
+		core_clk_div_mode0 = 0x0a;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	writel(0x01, edp->pll + DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL_NORD);
+	writel(0x0b, edp->pll + DP_QSERDES_V8_COM_SYSCLK_EN_SEL);
+	writel(0x02, edp->pll + DP_QSERDES_V8_COM_SYS_CLK_CTRL);
+	writel(0x0c, edp->pll + DP_QSERDES_V8_COM_CLK_ENABLE1);
+	writel(0x06, edp->pll + DP_QSERDES_V8_COM_SYSCLK_BUF_ENABLE);
+	writel(0x30, edp->pll + DP_QSERDES_V8_COM_CLK_SELECT);
+	writel(hsclk_sel, edp->pll + DP_QSERDES_V8_COM_HSCLK_SEL_1);
+	writel(0x07, edp->pll + DP_QSERDES_V8_COM_PLL_IVCO);
+	writel(lock_cmp_en, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP_EN);
+	writel(0x36, edp->pll + DP_QSERDES_V8_COM_PLL_CCTRL_MODE0);
+	writel(0x16, edp->pll + DP_QSERDES_V8_COM_PLL_RCTRL_MODE0);
+	writel(0x06, edp->pll + DP_QSERDES_V8_COM_CP_CTRL_MODE0);
+	writel(dec_start_mode0, edp->pll + DP_QSERDES_V8_COM_DEC_START_MODE0);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START1_MODE0);
+	writel(div_frac_start2_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START2_MODE0);
+	writel(div_frac_start3_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START3_MODE0);
+	writel(0x12, edp->pll + DP_QSERDES_V8_COM_CMN_CONFIG_1);
+	writel(0x3f, edp->pll + DP_QSERDES_V8_COM_INTEGLOOP_GAIN0_MODE0);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_INTEGLOOP_GAIN1_MODE0);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_MAP);
+	writel(lock_cmp1_mode0, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP1_MODE0);
+	writel(lock_cmp2_mode0, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP2_MODE0);
+	writel(0x0a, edp->pll + DP_QSERDES_V8_COM_BG_TIMER);
+	writel(core_clk_div_mode0, edp->pll + DP_QSERDES_V8_COM_CORECLK_DIV_MODE0);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_CTRL);
+	writel(0x1f, edp->pll + DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN);
+	writel(0x0f, edp->pll + DP_QSERDES_V8_COM_CORE_CLK_EN);
+	writel(0xa0, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE1_MODE0);
+	writel(0x01, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE2_MODE0);
+	writel(code1_mode0, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0);
+	writel(code2_mode0, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0);
+
+	return 0;
+}
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },

-- 
2.34.1

