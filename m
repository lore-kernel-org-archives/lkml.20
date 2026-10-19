Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C484E431D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409161; cv=none; b=SgO0ETi4Oq+b4g5kE987RYG2GA4UVa2SNBZb2K8MLoBFAb1HYDmsnhECKEmbjoE8iagrg4lfssr3ChRoWmWfwS5r82OwGLzqsxZfENT7MBkpG95lRuOtvhZFvjHvl3I3yGYihDb+MNvbubLC1gDH7hV9J8+QlLRx74nQ0t0NFdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409161; c=relaxed/simple;
	bh=3nXXqhpzf8K/+hXUe7l+H8MG2OcKbb9smch8ETujRsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dIhafd3c64tZgVAPKQjU9g1rUsrbHtNGpbdaj65PIQNRiVyW6dL09OECi5UpqondWwnXF54pS586gkrkcUiaY5NNLagogc1+qX8niCZ8ruLV0ZMjwUX3z/DjkBes1RqRacK7Df+RmSQwe/MY6/l/AJ+FLn25lnuorKShOPEb7d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UIFem/zo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YRIed5od; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UIFem/zo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YRIed5od"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OkDL1348030
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6xC4OVordP6iIQiBzMB05d4qBQ+iHW7wsc04Plsjz2A=; b=UIFem/zoWNDHQCPl
	3DA7+TickshegyHDg59S4MZEFkAYyvMUDurzAA42UiqpF3CVDAcFIE2xvTZViT9M
	zjOSA0QE6Cfi/QqZmnkZKU7rn4dtlWxqBFw+lQzFTNxQViCoiaMVGkpmrzqCMPVy
	lScB0WeQLD+wGCNTIo5dx8X3RwleXaDu2NzM9W+uZX4+FAn6QZuNQIyvax2/AZTM
	2N9x9AVPj5IJO2Foclidry4TBDmRBNTNhd2FDQ9JZXvBb9FGH4Q7u/O62nTDEn8x
	q2V6yEKVRyO8jm48HDr+5wfL4IXnC2U2cBvPwfTRxmSyUfxKLYT0peLXpPO7a3uu
	rDgLkA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rgtbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:25:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso398906385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409152; x=1793013952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xC4OVordP6iIQiBzMB05d4qBQ+iHW7wsc04Plsjz2A=;
        b=YRIed5od4JriAkw6+dvb9Giz3FHCF8o6vmqbbrxeCw8OXC+UuTCo2NRK3dxP2442Cd
         1nGbJbNeLOHUJ++Dw+U9V4tGYWR+j7rwh7SgXsNEWuA6D2+Tnw0gweafM51aHHT8X1kZ
         iX93deZBElWXmC+Ma7N7MdcnA/Ab7dKJ+/33dK9IFNApIJE01FiRzCLU93MWTLvv83D5
         J/+wVUrAzSbAScJfARXEEYU67BZA3krQdRGpaFEGQp8zpgvGT4jgw0/jLvPbm9qm6osT
         ujjkuCANQ0wIKw5tMZAY8DkYj1+/J36qm4WGpEJwvKp6NqPETiI6UmcnVRA4lrqiwFvZ
         ZV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409152; x=1793013952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xC4OVordP6iIQiBzMB05d4qBQ+iHW7wsc04Plsjz2A=;
        b=Z5113eGs7mwf/cdfZtUyYCGuZlItVzWIXncdGd9yYXGZyoRny1HycRyRiRA4YprXaL
         mtD3xlZRoaDl7RG4EFlZCliVPnUmHYibnHfkk3khkRvYBUMTAoTrjptMptWEX8ZVWt4e
         ElwAvWIWa/Kk67Syhq6iq+aC6A/o5/7E1KzwigaC7ONVQwmOTn7P8U8LVljry6Uc7SCa
         z8+rkcpelaxBybs6Ikf5Q9ooK8GDKyviCfJoKis+XnUYTa8sI59TjgkdeLlB06L9MpaW
         ylONrrnkpco86eaiTr4RdtChxUI6iymJYdfclIVhMbIB6upWLElydJydkh1pR5wDqPA8
         PUnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQWEyRPTJp3/KRAkxEtH09J8NejN9O8r4idS4OcwcU++tzuKi2rlzCe18BtgWixZcn1RrNtkOMbdtQRdw=@vger.kernel.org
X-Gm-Message-State: AFq9FYILaLrqLrAVcvwQatSOkIEn3utYvMbRmUHG/qRlK1MW6wzbE5CH
	wryIlfZuEYmY/2FYJa9YrzCCXVWEDbFAqxlcWDseNSYepVL5OLalOXs3abGg7vhFF7a6pcLwMrf
	iWcYNER85/5V+gRAxKH4vCevs0dqZQH1QEAmd/tdPVGBB47eL9ZNj21z6iNmQbvPkjVU=
X-Gm-Gg: AYBFou0bTh9eEaLpiFVdVhHRAh0FDXdB6pyTYCwO+0LgQHHsdjA0+PkYebUfyFg+z54
	E8+ybXygOtihfWAQhsdbZ58k5tc+U7JHzOtmlmK+xsgwJFYiKzs94BXyfqwY0PG3mG/0OWQ842B
	hsyHGAB1Me2Y4dMLNQapEH4MC+B+pyyzgeBZ/E6YLxeFtH63uX7oR9KpzSo0WYoXWXKl8guW3VJ
	eSaXPVsc4axPm8oaTfH5wRDH9f3AVeQlsBY6IdX0h5i+VQL6ciY+5VB3aeCpJhQQokVFMJ0NanF
	WHusAoccY/mQYQKeHuxCgIRLOHwCez8g9q9RqlH879zDuO4M5Dwha8FGjcG7/65OzOMBAO2v7T4
	Bj9kWUl4lDaaiNVFRMYi3uWSf2W+/66gS3vHStJCyGCY+4k3kXSWJfLahpgSBSsg2dqwLgZ+012
	YNXH/+iYEI5Da6
X-Received: by 2002:a05:620a:4589:b0:939:1222:b9f1 with SMTP id af79cd13be357-93f29a04e12mr1226299085a.0.1792409151737;
        Mon, 19 Oct 2026 04:25:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4589:b0:939:1222:b9f1 with SMTP id af79cd13be357-93f29a04e12mr1226295185a.0.1792409151143;
        Mon, 19 Oct 2026 04:25:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab37ba8851sm12807621fa.22.2026.10.19.04.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:25:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:25:37 +0300
Subject: [PATCH v2 1/8] backlight: qcom-wled: fix string detection
 brightness on WLED5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sm8150-display-card-v2-1-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4040;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3nXXqhpzf8K/+hXUe7l+H8MG2OcKbb9smch8ETujRsw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1f44JBbEvJI7ao/F7pVDoA9QA3FdEnuTWMXG1
 9mEYCtrJkSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatX+OAAKCRCLPIo+Aiko
 1eB6B/9XXxaG1spzShZks/wIC8Z0XwqpE6aoNNn8zhK4sg7GP5JCjXeYh/h1U+9QR/GK6j7xTto
 QFOmZ/kLOfZXMqlVlposw0b8AuIu6Z1WOyWcfLDbnl2vxLekiVTxa3V9TRPKm7IbUGzY7j4ansr
 Ru2MOcMUt+lPMfvMHUCOOusAb8sbx7zFrec5PgQf3+TWLmM9jMj/TWFLKhLt6ZMwDcc9jfC2VF+
 VdJ31VYpQxu0SDoP1qGKN26HhsTuujZYrCgkHwkj3oV7N9+g9BzgNuQzkBdMXoQ1Hkpy/PZp9zc
 EjQKQZk2dTjqHc319u+F5r2KaBsXFiNcuAv5fPvLH5GkHDas
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 55uiE695LwkKEyRSQcX6sF11LqyIYg0R
X-Proofpoint-GUID: 55uiE695LwkKEyRSQcX6sF11LqyIYg0R
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad5fe40 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GhjHCLKht-b4gqHrCnQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX4lymlOMi5R30
 uR0YxDxkEFOqznkDc3TYAOzHyzoif0yOvHC81FQVCGuuW9CguvCKj9bs5InJfzW3ZK430XaJJlF
 MtRVAu5Ih9ZWtNcUFaAhWAJGvDsTSWd2Noe24AVg8QnipTFLvUcK8Ec7f+LeEAnW87pxuHvbwQw
 +ZO9NmM5eThVsrqAJvlD4ehn1CJ073YvNv6EcV6MLkX6UyUB7org7hlvz+2L6clZwqbGddxA3z1
 d095v3lx2mFSbJyiJqtoezocDg8zHI208PUCqzNwuj5ev6seeZaxMxWKVhxMF4KELxXqO9uwn5g
 T95o833jtI38YAZw7UZLN82uIXF/7oUvbn2LapPHJDDacQCaQk7B681I1+8zhgGD1/yeeIzKMrd
 EL+TdZY0SkTe5sexXmkg2TMNG6Fel/QfNryKbKtB9HmLxBBz9Sy59HewC2ZHSmV4T8w6LAWIjZq
 IxZBW/bG7pEK5MKziIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfXy9f6u4WhmB16
 6OwmSUiW4E178m86lFQEGlJWjIIXbxl8l2+L03e+6EQv1pjDE9Hcr8WRyZ7IBIZGuJxkzmlKRM0
 Nv+Vx2SQb5jbWHYCVP5nZUyZcOkmVsk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190045

The string detection sets the test brightness through
wled4_set_brightness(). On WLED5 that writes to unrelated registers and
the detection runs with whatever brightness has been programmed before.

Use the per-version callback. A WLED5 brightness write also only takes
effect once the module sync bit is toggled, which so far was done by
wled_update_status() alone. Toggle it in wled5_set_brightness() instead,
so that every caller of the callback gets the new value.

Fixes: 62a1d3f623ac ("backlight: qcom-wled: Add support for WLED5 peripheral that is present on PM8150L PMICs")
Assisted-by: LLM
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/video/backlight/qcom-wled.c | 56 ++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 32 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index ca350f320e17..c5243a6d547e 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -269,6 +269,24 @@ static int wled4_set_brightness(struct wled *wled, u16 brightness)
 	return 0;
 }
 
+static int wled5_mod_sync_toggle(struct wled *wled)
+{
+	int rc;
+	u8 val;
+
+	rc = regmap_update_bits(wled->regmap,
+				wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
+				WLED5_SINK_REG_SYNC_MASK, 0);
+	if (rc < 0)
+		return rc;
+
+	val = (wled->cfg.mod_sel == MOD_A) ? WLED5_SINK_REG_SYNC_MOD_A_BIT :
+					     WLED5_SINK_REG_SYNC_MOD_B_BIT;
+	return regmap_update_bits(wled->regmap,
+				  wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
+				  WLED5_SINK_REG_SYNC_MASK, val);
+}
+
 static int wled5_set_brightness(struct wled *wled, u16 brightness)
 {
 	int rc, offset;
@@ -287,7 +305,10 @@ static int wled5_set_brightness(struct wled *wled, u16 brightness)
 
 	rc = regmap_bulk_write(wled->regmap, wled->sink_addr + offset,
 			       &v, sizeof(v));
-	return rc;
+	if (rc < 0)
+		return rc;
+
+	return wled5_mod_sync_toggle(wled);
 }
 
 static int wled_read_brightness(struct wled *wled)
@@ -391,24 +412,6 @@ static int wled3_sync_toggle(struct wled *wled)
 	return rc;
 }
 
-static int wled5_mod_sync_toggle(struct wled *wled)
-{
-	int rc;
-	u8 val;
-
-	rc = regmap_update_bits(wled->regmap,
-				wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
-				WLED5_SINK_REG_SYNC_MASK, 0);
-	if (rc < 0)
-		return rc;
-
-	val = (wled->cfg.mod_sel == MOD_A) ? WLED5_SINK_REG_SYNC_MOD_A_BIT :
-					     WLED5_SINK_REG_SYNC_MOD_B_BIT;
-	return regmap_update_bits(wled->regmap,
-				  wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
-				  WLED5_SINK_REG_SYNC_MASK, val);
-}
-
 static int wled_ovp_fault_status(struct wled *wled, bool *fault_set)
 {
 	int rc;
@@ -494,17 +497,6 @@ static int wled_update_status(struct backlight_device *bl)
 				dev_err(wled->dev, "wled sync failed rc:%d\n", rc);
 				goto unlock_mutex;
 			}
-		} else {
-			/*
-			 * For WLED5 toggling the MOD_SYNC_BIT updates the
-			 * brightness
-			 */
-			rc = wled5_mod_sync_toggle(wled);
-			if (rc < 0) {
-				dev_err(wled->dev, "wled mod sync failed rc:%d\n",
-					rc);
-				goto unlock_mutex;
-			}
 		}
 	}
 
@@ -651,7 +643,7 @@ static void wled_auto_string_detection(struct wled *wled)
 	}
 
 	/* Set low brightness across all sinks */
-	rc = wled4_set_brightness(wled, AUTO_DETECT_BRIGHTNESS);
+	rc = wled->wled_set_brightness(wled, AUTO_DETECT_BRIGHTNESS);
 	if (rc < 0) {
 		dev_err(wled->dev, "Failed to set brightness for auto detection rc=%d\n",
 			rc);
@@ -791,7 +783,7 @@ static void wled_auto_string_detection(struct wled *wled)
 	}
 
 	/* Restore brightness */
-	rc = wled4_set_brightness(wled, wled->brightness);
+	rc = wled->wled_set_brightness(wled, wled->brightness);
 	if (rc < 0) {
 		dev_err(wled->dev, "Failed to set brightness after auto detection rc=%d\n",
 			rc);

-- 
2.47.3

