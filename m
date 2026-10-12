Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DFE37B021
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812041; cv=none; b=fuVgeanKQa6h4o0SREk9ZpDYtU2tektKOblWrtBncvBgcDsOPRSrVWZcUePzlwwvAxwuc0tZXYoBf/VcQrRcHH9wQIuaxnLtOZiZXx0uWKdHXAaHYNw13yZH9UDWERS5Bvr/Bd8pU4x5M74FvvOp4a8M5IGOKWzZj5GohvhHZ0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812041; c=relaxed/simple;
	bh=Rh8+51xmesdsAqjaUz9Zrnaop3tGQ6wXITPFDrho03I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H76zWl8XefoLhqUI5Npd0I196MSwXjp3RMdghcXdF3AEB+GUObl87xTcKuT8rtw6RBWKBtOGPPWbdoM5OQdkUCIdt87rG6A3GLNhtCN24WQci1aCe2oClAeULk9V+0g/buJFn6yCvRrjZuLFlQNx0QT8oy19TtZTbU5DnmvYwIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCJNLrAe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZk+cEgd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCJNLrAe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZk+cEgd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0bo02679920
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Od+TrUClwjrX5+hkKzqIi7EJ7XLdt4/11sgnHdpGxog=; b=MCJNLrAequiREmjB
	PDk9C45kgpQ69YTtqe6lKCDhadl9DOqUy0allHu37/NhNakupBR7uCfHq/GPqV3/
	Uu01a7vkg1KecNWvSkc0RmfNtN171mVolaDVcGEOVPaZzvpDwPcUJpSNQBUwUBCO
	+TujjhnK7FdPmZNQraYK1Uyu+o3Wgf/6giuBAKDwjIiLg313Nk2sGy8coSG7OWhs
	vsN7AzPSa6U9ehv0EStwMKZX8VcTtpfdtuiNS4w0BlsGyVM/EIXqXAYtC058Gup8
	Co57l+H57iMC5q50lcV4RCcoakg/qMJjw9kbgpKnKOGFmoYtv+DIPg3Da7rHR+w4
	HRIoyA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1t5dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso3093603eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812038; x=1792416838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Od+TrUClwjrX5+hkKzqIi7EJ7XLdt4/11sgnHdpGxog=;
        b=hZk+cEgdl1wBIBnBk4zOY9qOOPZ9ZYD6sNhtzTjhsmbccfJQ7bjzW2XZnglZsxt3/V
         /D/OO1l/qN3xag43h2bT8MJLatKT8shtwtQ7bcvptUGRpVJhikII9H5Y6pktSwnWu4uf
         xeusjdHoLZNRhbSfxWuNYcsI1EgmzXqLuQ+tE9PLmdxgT4vcDCYXQjr2+o8kP9f+9Y1W
         0roEZYEDFU8Dw0vVZKl0lDUyiMzSkDl3kBCvELiwcsAytL01ZpaPHeRKkVIecGxq/s63
         KIOH2b8oLS+N6WUxmjYPDr+0HiVERysYST7H/fMTR6d0DwThlmmPdNw7v/UBH3HxhQNX
         4q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812038; x=1792416838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Od+TrUClwjrX5+hkKzqIi7EJ7XLdt4/11sgnHdpGxog=;
        b=hdgjNKD6gAeW8HZFQYvGGL4BdkQFhZwb2/u8kUH8b67pJOIQVf5RmEzA2UwgICcWMM
         Ih1Tfu8obWWHwsiXbcnLJ9IXZPO7sekpFfQr/76t+VTychCvcsya6Z25E13hTu6+XiWy
         5kVu7JJ2sU1EZj73oGyGmheilGU7L9fa596+TYiwTRrBI1SLX//V0+rdxYpcS+2R5usW
         CtkwmZZYq6TDJbXh7ekcrNnrxomwPgn3aLvQywvsPz6bsg7ztuOyTFzVZHS1x4EE+mP2
         Q7ErOX0hBC9beq1NMpsSZwewXXc2Kxc1i/zU1//oUcnuJoiXhPLhwAwg7uBuoY0Ioocf
         T6ow==
X-Forwarded-Encrypted: i=1; AKwUvByThSbmSfToQNCHExWXDcMM3SI28QOQ31ZW/RSh7dN/VKHtCwPG+RQ8e9MPw6I1W0PO2YZyFRJiSlwDWLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHUIOPaOfMQPBuouxuoQxXQIlAh9ZOzul9YE9KYP7seA0iyYKh
	MNrvV06GhvQsE0cTVWnyku1+PyO5AtjNVPwst1RBSeJu+gTkHb+xBbHEIDg9WXz6guLTSD3qNgn
	msLo5Cn2EIcU4HSiF41DhJ6FhOx9lreG7Aoi1sdxSEmxVryifialB/oWPISvoZDx9XjE=
X-Gm-Gg: AYBFou1fh0yllZ4nDzZ1B5rnQdai3l/7sJqqb/kteor00NDLMdEjSar+i3IzhaTDx04
	4dSLTFEtd/6vrt6dvbxJMLgCHqNk6TsA2YMVt82BsomqK0yNNjFL8A4JTikTRDnn3F6YzyASQtU
	bCdYY955cOeEWvMu8WN2okQS88xE849xRqvdcMIeJpYgcFwuSdyvINUfZd2HJ64ogU0CYwJ9qwq
	CN0qLX7Kt8cAh9MR0ZikUmzQh6J3eh2NI7/eV+UagfAU2av3OlXUkdWE1aENO+V/YxKNx+wUHvS
	hPd7b2zrx3PGeHsdMbb65OqhaJYLZ9IHA9kVcaV9Ifz+/Y1siEhPXIRShF/X+0Nbk69R5OrTtow
	+Y/S953SG+j7HMeCaBt68y4POOzY=
X-Received: by 2002:a05:7300:ac81:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3537ddd6fb4mr19923687eec.3.1791812038301;
        Mon, 12 Oct 2026 06:33:58 -0700 (PDT)
X-Received: by 2002:a05:7300:ac81:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3537ddd6fb4mr19923629eec.3.1791812037692;
        Mon, 12 Oct 2026 06:33:57 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:33:57 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:19 +0530
Subject: [PATCH v2 09/13] phy: qcom: edp: Add Nord voltage-swing and
 pre-emphasis tables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-9-a2ab9af954d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=3101;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=CEoKlhJonvYt6NmQldHYRVO2WGAxSRpS2Dn8PYH86g4=;
 b=welf+AIsozWBI/rasdD7NUMQbrBCIazetk8Ol+j5VUE/ckwHcp+iugZMNgXGDin8z8/kk3W32
 AMA26NoKdhqCzKoOv6U3AEUS2eXuFfpFjw8/yxN0AFMc0Vz3S9q8pzT
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: vlRcxy2pptsWxxCrxjPtpV26r-FFUOZT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX6NJ8UvZckZmx
 vfJYBro+J0KYZGv3TYm/xkvdJIUq6hWqY+bLjM3py+H/pJLJbfV07JZmWVjieuBnZ4TsKoqa0L8
 M/KY7n3BiKNoA6lY9Z5Yy7JIGlUs4Zw=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acce1c7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=eOzNwhHgGilJcvbUjtsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: vlRcxy2pptsWxxCrxjPtpV26r-FFUOZT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX1q3caDUGS+uG
 YcpqyLsX2djqWP1825wPoTNlctliF19ITWzCHsX1WZX+SfHNnl/LyjZfntwZydY4qfR6Fj+ae05
 KYPWIPo41xB8ToMNzzGKTnvgcP0DQUuhzbyD4ZT0LRbFLzinE5W474eQAOeVnQQGbsCby8yStrA
 SwtIgtk8DSeeisixQO+wfow3TdvcrKqTv3DV6PiFDk0w+yPpsVtgwnIJKxA3RbOu7PZwu+L53O0
 Avj3ItNhmw8Cfth9PguC28yWSTRwP9nTRAngm0SHU5dkFd0dEcelFBvZWwfe9QtmMV426OZk8IO
 qHmNQr/E3hsCsax038+Q8PVqrlSKtZF5j1VWWxMsqnYvioy7rNFVBcwgpm/C53Ogb96vP3QdN8w
 FM0WVlX5AAk58b2SNM0x9UjE3KUvsCvCnXOSvOTE6OqMxV+B5pLCbjt4Rc5cmU2J+wlyoybPWLG
 Pw14GEzorZymbgEK1Fw==
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

Nord requires different TX voltage-swing and pre-emphasis levels for
both eDP and DP modes.  Add four pairs of 4x4 tables covering
RBR/HBR and HBR2/HBR3 for each mode, sourced from HPG Tables 2-2,
2-4, 2-6-a and 2-6-b, and wrap them in qcom_edp_swing_pre_emph_cfg
descriptors.  The eDP RBR/HBR swing table reuses the existing
edp_swing_hbr_rbr directly; all other tables are new.

Assisted-by: LLM
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 64 +++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index c5df1086607f..c63f721702b1 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1538,6 +1538,70 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
 
+static const u8 nord_edp_pre_emp_hbr_rbr[4][4] = {
+	{ 0x05, 0x11, 0x17, 0x1d },
+	{ 0x05, 0x11, 0x18, 0xff },
+	{ 0x06, 0x11, 0xff, 0xff },
+	{ 0x00, 0xff, 0xff, 0xff },
+};
+
+static const u8 nord_edp_swing_hbr2_hbr3[4][4] = {
+	{ 0x0b, 0x11, 0x17, 0x1c },
+	{ 0x10, 0x19, 0x1f, 0xff },
+	{ 0x19, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff },
+};
+
+static const u8 nord_edp_pre_emp_hbr2_hbr3[4][4] = {
+	{ 0x0c, 0x15, 0x19, 0x1e },
+	{ 0x0b, 0x15, 0x19, 0xff },
+	{ 0x0e, 0x14, 0xff, 0xff },
+	{ 0x0d, 0xff, 0xff, 0xff },
+};
+
+static const struct qcom_edp_swing_pre_emph_cfg nord_edp_swing_pre_emph_cfg = {
+	.swing_hbr_rbr		= &edp_swing_hbr_rbr,
+	.swing_hbr3_hbr2	= &nord_edp_swing_hbr2_hbr3,
+	.pre_emphasis_hbr_rbr	= &nord_edp_pre_emp_hbr_rbr,
+	.pre_emphasis_hbr3_hbr2	= &nord_edp_pre_emp_hbr2_hbr3,
+};
+
+static const u8 nord_dp_swing_hbr2_hbr3[4][4] = {
+	{ 0x02, 0x12, 0x16, 0x1a },
+	{ 0x09, 0x19, 0x1f, 0xff },
+	{ 0x10, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff },
+};
+
+static const u8 nord_dp_pre_emp_hbr2_hbr3[4][4] = {
+	{ 0x00, 0x0c, 0x15, 0x1b },
+	{ 0x02, 0x0e, 0x16, 0xff },
+	{ 0x02, 0x11, 0xff, 0xff },
+	{ 0x04, 0xff, 0xff, 0xff },
+};
+
+static const u8 nord_dp_swing_hbr_rbr[4][4] = {
+	{ 0x07, 0x0f, 0x16, 0x1f },
+	{ 0x11, 0x1e, 0x1f, 0xff },
+	{ 0x16, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff },
+};
+
+static const u8 nord_dp_pre_emp_hbr_rbr[4][4] = {
+	{ 0x00, 0x0e, 0x15, 0x1a },
+	{ 0x00, 0x0e, 0x15, 0xff },
+	{ 0x00, 0x0e, 0xff, 0xff },
+	{ 0x02, 0xff, 0xff, 0xff },
+};
+
+static const struct qcom_edp_swing_pre_emph_cfg nord_dp_swing_pre_emph_cfg = {
+	.swing_hbr_rbr		= &nord_dp_swing_hbr_rbr,
+	.swing_hbr3_hbr2	= &nord_dp_swing_hbr2_hbr3,
+	.pre_emphasis_hbr_rbr	= &nord_dp_pre_emp_hbr_rbr,
+	.pre_emphasis_hbr3_hbr2	= &nord_dp_pre_emp_hbr2_hbr3,
+};
+
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },

-- 
2.34.1

