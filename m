Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B51377EBF
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 05:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791264596; cv=none; b=OjAAuB9iv09XDmMIPsnVzndVk6yFXqtQbrihytnsMTslMJmTOwqRfUJ9R//68L58EcaHA1ZrbGEzMq+pawWrECRFNeDxnupFPoS15AHC8W3hn6DGRGGiZs4WeDAIo9gtyaw1VlxhRG7uo2pLjz+wwh7XyzzoJaDnyCW3bAB8/7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791264596; c=relaxed/simple;
	bh=Swbffk7gSaWY0Wx8h7GWibLTdR+plzDCp23uNbU2Mss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iYJWV48TJ7hKiOUcCS/5iuPjPTdibjEm0hfR3U82PaPVLqwq7q3qXRDFAtaTg9NfdrGK+8+WCjtUUbmDSQno1tI33aoVQUrkeWgyfWb36+eJDTDCZF4CUtWq1e+rSYLdrhKEumPXuxIWHo+3QOrB4IXrR7pcuJKW2cfrcRMiMqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FoUMA5Rd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BA/lixxC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FoUMA5Rd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BA/lixxC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963Ag4M3450761
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 05:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qUVEH4qPe/WvTV01E7edf1dmd38bUwh693Oze6d4mZM=; b=FoUMA5RdEZqACW9S
	Odxp2Q9WbO9JTNPtAEZdYTelvG0gMiGCLIIGaSoN0yIaucmoPbqvBPw64GaDW7zr
	IPyE+HdJnJwmxye1kJtosgb3odILmmJhYPyF8o6c4liaN2pi3ViZjnMJSeEHFN1s
	6AoDdoYZcAX9XLWMb77JR5RrU8WPMaeZr+LSlnh77aHFC5FEZ41r2c0H1RCJa9mH
	DWL23LKIJxgULVxTxedttGkBoXLXGX5GEIv728Y78/hNGKlBopv7PNbuRimML1DI
	//Q49YWWfZ8qhx7aBhr4OAkEaatPO9PtmHZ9FhptZqSqEcKnZdTDKBaRj+J3kkzI
	aLGoew==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7durgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 05:29:53 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510562ef98so3213426eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 22:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791264593; x=1791869393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qUVEH4qPe/WvTV01E7edf1dmd38bUwh693Oze6d4mZM=;
        b=BA/lixxCtw2g/NlbgT4HDRyrjMB3IC2irT9z5BridYlVZedFRt95ksDJfNKT1oayVP
         1NrxJN0lv2t2wsOLmH2j4Q8bjJcb0PcYiehSb/SNfLtgEXILvRwN6EfKTlYVzIhYfBMt
         3tbNnWV7MdGlgyM5yBsGO+NkdHzgHdE8Q4VcDgNeBynKeTMb45b8GObDcNiO1WZJp1Va
         RoALk1xtW218srnvkCvZVovLQky9tZyzdUrQuEHPsQ6+BbGHabIR20A32rLrIpgSZdX1
         SuUe6C3OrWsA4VnnYW9iRXNpVESqlV9ksKL3SQAW6zz7ylQ6RpqzKEUwNqbiAvsS1384
         Tklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264593; x=1791869393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qUVEH4qPe/WvTV01E7edf1dmd38bUwh693Oze6d4mZM=;
        b=vP9Qt0OoNMo4FGjfZnXa04iZs+UZHTd8Bv7/EhD2BKDFw2Fpm0vUSgdJ9T8P18Hb75
         GQtVWIipmJwJ5FfGhRSaDl1Az1QkrMYorIAClMglLjSYudCBj2ha+cT66X2wvX7tBAu1
         0hJQmD5H3+juxPi1gMtC22aUiIlADW/ytsG7G4b/xF8L8RbxJIBRIBimJTZDUFNPD44O
         H+zLFbxulY3VNLWotrSDmyvTrrXAv0iqy+Ohrc8jUef9LNRtk9Z8pKw/2u5TybT/Fka6
         z6ME+sFg/fiiRy2Z0BuW2SM0FjrrWDr+93t4MW1tMwTfO+dbOp39CXZhcX/FWHMc26Hx
         x6Uw==
X-Forwarded-Encrypted: i=1; AKwUvByijzX9ZKCrVw1L04+KmWHqzhIr2tta+XDTmE4rmu89FJ+pqGnayDmW7ke5HG0LSZWaT2D3nQWtQ0Mufdo=@vger.kernel.org
X-Gm-Message-State: AFuF++nDQeLEWdL0EnFwJq1vqraeEZWIUp2FMDyW4319OFNvAUZmCrwM
	+TNB6ExsO7WhH28WospgX3DZvMudUIy7B4CWkWSJONG6SWDHpOaoCz1AUswSHrE4uY6zkDuHRVh
	yTu5tsGubf+LcTVhEzAxUo9v7+QW2dJtyWKZayxv+aG5vyfHSHMIV/Zl1flY3qi5ze1o=
X-Gm-Gg: AYBFou2FIXPDewuKdawqoLngQc61bVyQcXltV4dmWDSYF8hWAsoWZxg70EN2mySH+nM
	YGssG4mAxygjTWjI/jNwrrbZTWgpuu/c4X+ZevSGfgWrmLLtX10t4QJzwK6CuyTxxY8XCHtQuPn
	B2s4Lju9NSHKaDj6QGD/UuD/10c8JA+lXrQXpsYz3OAfCSvdi1Eb+m8LDsxwFo7iK7YGsPCmDY8
	cGzFSfzzPZgWLJmInkMvIl9MEIRYX27tKBHC43/ldv7kndS7GcNUrRok1c1AnQ5iJY0ttYJ/C0t
	EstoWN+XiQeI6UMFI2qUAJqGVkjnP77c4+8566YIVQdc0pjsM31QrTSlANjNlxx2fOQNLbwQdJz
	hmuO8wZhtY2g5JpR9o3SU7/NfvOrG0MOMKNpo+Zns2yhPrcmnbUhxzc9/uoBwxxaeuF/kmJNhcY
	CgZlD50Q+bjRsbqh1Pq+hjvEWYUyHq
X-Received: by 2002:a05:701a:c950:b0:15b:afce:62c2 with SMTP id a92af1059eb24-15eca925216mr571888c88.41.1791264592559;
        Mon, 05 Oct 2026 22:29:52 -0700 (PDT)
X-Received: by 2002:a05:701a:c950:b0:15b:afce:62c2 with SMTP id a92af1059eb24-15eca925216mr571858c88.41.1791264592016;
        Mon, 05 Oct 2026 22:29:52 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d85781d49sm4017403c88.16.2026.10.05.22.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:29:51 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 10:59:19 +0530
Subject: [PATCH v5 5/6] phy: qcom: snps-femto-v2: Move PHY init registers
 to config tables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-phy-v5-5-cbe9330a6449@oss.qualcomm.com>
References: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
In-Reply-To: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfX9sIHoqzgKYg2
 XACCAm5MfO3kp1bSiwlGmfOhBcCdCbYe7PHLXeZdKpHYtXtt5v5YpbXsbHlthcff2IgHHQ4Ib7H
 Fb9gzCdzhaV+XqaXpQnvfNX/x9Tlbog=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfX7HunZ9QqS9/x
 HZHqUILBcdXcpiVOK1LLxxRJ/qa6uwq26e889Bd/8WLA7qjidBy3dp+JkFS0XFqTDNGSf3K5yVN
 SiQxXs8sNkPZTWx9zzpUPsFp8RgKnfsNb6+9B7SwSlEto6Vl1hq4dtVUSaIj4W4HAgxPRjYnajC
 bw+xRX4lgZqyifJSVEW1AI+YwoUhmEM2fRriC1PuVz+XdRz2i8keyeWn6asXuNCRnOy/rQWWj3/
 q0UD4t6Eutbx/h899XziDw9n3lhvwC8G3kBBpVSUIm+b4uZlFhWjHte/mc6FzfE8Z3+nQIi+ByS
 tSgqlH68lubb00EjGLKghwBfdES5+Uq+OT1DIHWEv4+gXkHdGtHG/9xijql8UzxvNK+D1t1tuEE
 D3f+VfV7XQKHfKep3AH/TV2/yV1tR4+fPE0oeqZXE44g7K2k4yXgx57aZYSBOl25CSRMb0cvfvG
 GuMa8whZdNaWTOA/gLg==
X-Proofpoint-GUID: JGhWCqcS8ScIXmWwLXkUeJU9m9C5zAvj
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac48751 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dpbSYRCFOxhwq305YcMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: JGhWCqcS8ScIXmWwLXkUeJU9m9C5zAvj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060021

The driver currently programs the common PHY register sequence directly in
qcom_snps_hsphy_init(), with the fixed register writes split around the
override parameter handling. This makes it hard to support SoCs that need a
different sequence or different values.

Move the fixed pre- and post-override register programming into per-
compatible configuration tables, and keep the 7 nm override parameters in
the same match-data structure. This allows the driver to share the common
sequence while adding SoC-specific sequences for future platforms such as
IPQ9650.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 129 +++++++++++++++++---------
 1 file changed, 83 insertions(+), 46 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 0ead37c0dcfd..2e37b39dabba 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -104,6 +104,20 @@ struct phy_override_seq {
 	u8	mask;
 };
 
+struct phy_reg_config {
+	u32 offset;
+	u32 mask;
+	u32 val;
+};
+
+struct phy_config_data {
+	const struct phy_reg_config *pre_tuning;
+	const struct override_param_map *override;
+	const struct phy_reg_config *post_tuning;
+	const u32 num_pre_tuning;
+	const u32 num_post_tuning;
+};
+
 #define NUM_HSPHY_TUNING_PARAMS	(9)
 
 /**
@@ -383,13 +397,39 @@ static const struct override_param_map sc7280_snps_7nm_phy[] = {
 	{},
 };
 
+static const struct phy_reg_config hs_5nm_phy_pre_tuning[] = {
+	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, UTMI_PHY_CMN_CTRL_OVERRIDE_EN },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, POR },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, PLLBTUNE, PLLBTUNE },
+	{ USB2_PHY_USB_PHY_REFCLK_CTRL, REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, VBUSVLDEXTSEL0, VBUSVLDEXTSEL0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL1, VBUSVLDEXT0, VBUSVLDEXT0 },
+};
+
+static const struct phy_reg_config hs_5nm_phy_post_tuning[] = {
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON2, VREGBYPASS, VREGBYPASS },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
+					 USB2_SUSPEND_N_SEL | USB2_SUSPEND_N },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL0, SLEEPM, SLEEPM },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, SIDDQ, 0 },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL, 0 },
+	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0 },
+};
+
 static int qcom_snps_hsphy_init(struct phy *phy)
 {
 	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
+	const struct phy_config_data *data;
 	int ret, i;
 
 	dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
 
+	data = of_device_get_match_data(hsphy->dev);
+	if (!data)
+		return -ENODEV;
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
 	if (ret)
 		return ret;
@@ -414,24 +454,11 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 		goto disable_clks;
 	}
 
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
-					UTMI_PHY_CMN_CTRL_OVERRIDE_EN,
-					UTMI_PHY_CMN_CTRL_OVERRIDE_EN);
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTRL5,
-							POR, POR);
-	qcom_snps_hsphy_write_mask(hsphy->base,
-					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0,
-					FSEL_MASK, 0);
-	qcom_snps_hsphy_write_mask(hsphy->base,
-					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
-					PLLBTUNE, PLLBTUNE);
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_REFCLK_CTRL,
-					REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT);
-	qcom_snps_hsphy_write_mask(hsphy->base,
-					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
-					VBUSVLDEXTSEL0, VBUSVLDEXTSEL0);
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL1,
-					VBUSVLDEXT0, VBUSVLDEXT0);
+	for (i = 0; i < data->num_pre_tuning; i++)
+		qcom_snps_hsphy_write_mask(hsphy->base,
+					   data->pre_tuning[i].offset,
+					   data->pre_tuning[i].mask,
+					   data->pre_tuning[i].val);
 
 	for (i = 0; i < ARRAY_SIZE(hsphy->update_seq_cfg); i++) {
 		if (hsphy->update_seq_cfg[i].need_update)
@@ -441,28 +468,11 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 					hsphy->update_seq_cfg[i].value);
 	}
 
-	qcom_snps_hsphy_write_mask(hsphy->base,
-					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON2,
-					VREGBYPASS, VREGBYPASS);
-
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL2,
-					USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
-					USB2_SUSPEND_N_SEL | USB2_SUSPEND_N);
-
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTRL0,
-					SLEEPM, SLEEPM);
-
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0,
-				   SIDDQ, 0);
-
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTRL5,
-					POR, 0);
-
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL2,
-					USB2_SUSPEND_N_SEL, 0);
-
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
-					UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0);
+	for (i = 0; i < data->num_post_tuning; i++)
+		qcom_snps_hsphy_write_mask(hsphy->base,
+					   data->post_tuning[i].offset,
+					   data->post_tuning[i].mask,
+					   data->post_tuning[i].val);
 
 	hsphy->phy_initialized = true;
 
@@ -495,14 +505,38 @@ static const struct phy_ops qcom_snps_hsphy_gen_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct phy_config_data hs_5nm_phy = {
+	.pre_tuning = hs_5nm_phy_pre_tuning,
+	.num_pre_tuning = ARRAY_SIZE(hs_5nm_phy_pre_tuning),
+	.post_tuning = hs_5nm_phy_post_tuning,
+	.num_post_tuning = ARRAY_SIZE(hs_5nm_phy_post_tuning),
+};
+
+static const struct phy_config_data hs_7nm_phy = {
+	.pre_tuning = hs_5nm_phy_pre_tuning,
+	.num_pre_tuning = ARRAY_SIZE(hs_5nm_phy_pre_tuning),
+	.override = sc7280_snps_7nm_phy,
+	.post_tuning = hs_5nm_phy_post_tuning,
+	.num_post_tuning = ARRAY_SIZE(hs_5nm_phy_post_tuning),
+};
+
 static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
-	{ .compatible	= "qcom,sm8150-usb-hs-phy", },
-	{ .compatible	= "qcom,usb-snps-hs-5nm-phy", },
+	{
+		.compatible	= "qcom,sm8150-usb-hs-phy",
+		.data		= &hs_5nm_phy,
+	},
+	{
+		.compatible	= "qcom,usb-snps-hs-5nm-phy",
+		.data		= &hs_5nm_phy,
+	},
 	{
 		.compatible	= "qcom,usb-snps-hs-7nm-phy",
-		.data		= &sc7280_snps_7nm_phy,
+		.data		= &hs_7nm_phy,
+	},
+	{
+		.compatible	= "qcom,usb-snps-femto-v2-phy",
+		.data		= &hs_5nm_phy,
 	},
-	{ .compatible	= "qcom,usb-snps-femto-v2-phy",	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_snps_hsphy_of_match_table);
@@ -541,11 +575,14 @@ static void qcom_snps_hsphy_read_override_param_seq(struct device *dev)
 	s32 val;
 	int ret, i;
 	struct qcom_snps_hsphy *hsphy;
-	const struct override_param_map *cfg = of_device_get_match_data(dev);
+	const struct phy_config_data *data = of_device_get_match_data(dev);
+	const struct override_param_map *cfg;
 
-	if (!cfg)
+	if (!data || !data->override)
 		return;
 
+	cfg = data->override;
+
 	hsphy = dev_get_drvdata(dev);
 
 	for (i = 0; cfg[i].prop_name != NULL; i++) {

-- 
2.34.1

