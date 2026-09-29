Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8549415B62
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656154; cv=none; b=OtOewSJGykqFwmzvg36t7Snkg0A9x2XtkjqQuVkrius0WtNhHfQfS1dWI9DRYhLkHKVL6LS12OB31LPLELBBGb8HqxrGB4LS6O9p7tWTCYbhPh3UXK5OKPSINWqdclvSCfmscIH4TLlACUlJ53JF6eu2BC0pZvHdvp336Bf8Po8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656154; c=relaxed/simple;
	bh=6r0ejZlAtNiiuitmrFYzWgKZtKiCeBVKShHo1hB4+8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aY+dy0MBl3Ts6Vp7OqtD4QQdk52BtIAGuyZTfZQG1XFHYqQ5RoYHPGzymfD59uTUCJyatP53fsTQjc2GRF0v1qCaOjJvskIGc5ieeEtYaAa95CsntjtKfurna4xP5dNT3tU3dgTza0tTHFa+QVxMmKumW3oFdkeu60WrqvWaEKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YiEo1fYg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NfukHFNR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YiEo1fYg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NfukHFNR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Ogx3891460
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kGmOSxaugPIJYRGrz5sk5TBB1f5tCohgbLSqz9Wr2Ns=; b=YiEo1fYggdE2ThvX
	Y/LhG9Xr8VhFGMc8tRWjJPR6/JCnbBarLTDP5XyeJMXQzTcgSfL+UNtJAuWSTfPZ
	IhGXHry15WDn3FrOtCPAFqj78QE3Q6COklwwzkVuKnzkS6UexK6+GSZ8m6lL6YTN
	Jy5Tey71XyE92HJB1Pfr4+RelASISh1BExUUsHssDGVtq6pqNoTEXF1aDj2/KvNK
	8oSau+eA2J0HIg1Zribowm0O5Fae8LWayzRhj6+aNIunTxxZSJneZQSV7WmN01kp
	wotPo8jsvqMllzdfrhcLSU/mHKbJd0Q/kvK2X2H0TKYC78DExKOu+bzk72kjnJB2
	Ujfa+w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfkv3wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:29:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91235881828so77539006d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656151; x=1791260951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGmOSxaugPIJYRGrz5sk5TBB1f5tCohgbLSqz9Wr2Ns=;
        b=NfukHFNRUNJJ4Y+w67oMuF9nOvGaAv7b52wTi49hUTRgBnfqE9wv1SrCqApm5OS5eF
         e8XvBKNTdoVyCqUdcKvqugfixqfSZzMQT3w+FNYW9wNupCcA9tq8td4PQ7+r7XzbtpSQ
         to/qrLYtGRLNTnfY/55Id8CylpQ6njYlwOdmxTCwekcuHXffngTq8mYUBRHhhfAirFqW
         16FXtMZTGSbvoleX4GVJxGKylUiraadjqN8e/1gAg3+9Jg9l3r109iBzh7KIMKPwqP6H
         fxzXFZV26S/M+ASR2ygsTDi03C1rXZ95y1XD1eePqyG0ncYPvXBkeMkMHPtxIH5V0moi
         0OCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656151; x=1791260951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kGmOSxaugPIJYRGrz5sk5TBB1f5tCohgbLSqz9Wr2Ns=;
        b=bjVD7WI+ie4pEJCJMFu8hSJPhC0B2gwk+O5zcu13dEYb2Ql8U5GHUtGoNGpGhB+e9u
         Yj8+vX8WZfmcu0Ll7+r3iAHnyHhDSwVHSZzqnlJJek3p60QV20Q2iCkU3qMfiCD7ILpD
         npvOfOzTj1hwedlbWn6RUQiqOxhbXdZDKXJyMuVYHxsZ8IxwHj1jcjVgr6TGnXj9N+qA
         rJ+jNv+e3kFr8Npu3/Gl82+W+ddckQLL082TzUDk23bPoo7aXIKavbEBd8pTcxq8PLTZ
         jzXlmLF7TA6eiakbHswOVcaBQGqxZUu4hUAdZhJ0kxUe4bcFjP7C6n2j/JeyRWQt6XqI
         iT3Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7xscLkGhqKw7TANJuUf0Aa7hzOtA8aoxqSBz/zptEhy80AjacA3+G3uftjLMnjp+0NfA86Ulcq5Qa060=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ9XVawcQ0Z9V1HmrdTIYqzgoswpxGduaD4Ve4UBMxrsSl6g5D
	nuRhlIZ1X0D4uueSNbxgdd1FmAujGFBfbehsPb3P6uZ4pNyks5LIGOYa3qqpAQ4ReMpFZthEQOI
	w0it9MD0fF5ny6GRj28JuteZEUTQcqGYthy/mFBvy77prjbePYxbrm+iWDmzORToOAY8=
X-Gm-Gg: AYBFou0poy6Sj+sGaRF3P73DKkAwnj4mi+sanC1xwzYD09S4yUE8cZSs9pqDEYRcXtR
	hhmm+BmopTbJDEKNCEethv/Dy+j7H06gKRzZHcEUER+cpNNjbb7Uav8QPbQO477YP54Yr7eoG3h
	ok7i13ZsyIB90QAQwX4HODXd0ydl401hI84OrFVaNTt5KxkfFhgrF2ousP3gZepcgixBlK5l3zO
	n/8MarewtiNGO7ajAdwBpZ+8aqV2gmS1mjFgK/viDbB65zOc/r0YOs6Wqu79LwU4oiRQ/QuH3kU
	mIecgZglWCBOKvRRyUInQeZG1g96dVHKnPCWEkmRGwgz1O59W9Ta3U8ykVOe7rQl9HneRJBiikc
	VZPx3oUePXCrV5ZKEBZTotZZ0PrETlOzxnbV/KZbc4YOGNnegy/EjunSaUUrlh5E=
X-Received: by 2002:a05:6214:2528:b0:914:4c57:510e with SMTP id 6a1803df08f44-9144c577f72mr168219166d6.19.1790656150654;
        Mon, 28 Sep 2026 21:29:10 -0700 (PDT)
X-Received: by 2002:a05:6214:2528:b0:914:4c57:510e with SMTP id 6a1803df08f44-9144c577f72mr168218996d6.19.1790656150286;
        Mon, 28 Sep 2026 21:29:10 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:29:10 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:59 +0800
Subject: [PATCH v7 35/35] soc: qcom: pmic-glink-altmode: skip retimer reset
 on DP IRQ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-35-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=4115;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=6r0ejZlAtNiiuitmrFYzWgKZtKiCeBVKShHo1hB4+8c=;
 b=UtJF5iVXVfQmOgSJr+NOadAJ3joackPYqRg1XJ71aS+LX/cOB+k/B4cYH2gpRTQaGVj6o3g2k
 S1JaNrh5jUEA978B10/jOwfccfpA2xnvNFUaL84QUkLrt/vE0odsEYD
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX3ie3ZbKDMWiu
 quiw7UVnOXNatLCl+j7WoEOLyeU8LpfB9UgkRhgRXicE5ALwi3ln+kXPPHWwHWEUhXG+CSQ3cAy
 5OivpdU/Fo9zUUGPyEUMtLOhFnIqhB8K2Tgm18Ww4oIptCRe9/DOqh74qwmEwerADAAnzPgyqwA
 x/oxWRvAlBlRw7BGdMPccTnvfYuSf+OrRmQsn4VACooRx3b1dEzZZOFxpAmavytXV79eTOpC6aV
 u4fG2/5HppGctVJENu7M28b/Fu7vTGxowDrOp4+dYZRKkSDxK3LpGHTrQQCaBsX+NI6e7iy9pb2
 sNtQ5D8Q/tnOC3sNu1Petu5yXmPoDpYIkXA7k5sicORDf80lcjz6MNormlD4KpjKM7ubuADVIiK
 Leof1+yOkRC4SCV9NID43W8Jr5T7T71PpSHMwY2Oo6d9QboRJVwW6vHBPBkM9wwEudQl43uiluw
 dxVZiS3RT5cFOZPwoYQ==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6abb3e97 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rzLW7fUJNTnmvIt_Je4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: IsfOAjboBlbWAiuJu2IdVasFg3oWb0Jp
X-Proofpoint-ORIG-GUID: IsfOAjboBlbWAiuJu2IdVasFg3oWb0Jp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXzdXjoNXDSMFx
 YVJ7no3ojbXbVdDHVKhtNeVktLBrylZsrDYBll+zWZNmQdBQRUxfTyo/wK5Yg3Xq73t1++YKm+w
 U40jtZPE9Ahuq4IDQKFhKhIU4d58ybg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

A DP HPD IRQ reports a sink-side event and does not imply a Type-C
routing change. Reprogramming the retimer for every IRQ can reset or
disturb its datapath while link training or video transmission is in
progress, causing intermittent DisplayPort link failures.

Cache the successfully programmed DP retimer mode, HPD level, and
orientation. When an IRQ arrives with the same state, leave the retimer
untouched while continuing to notify DRM so MST sink IRQ handling is
preserved. Invalidate the cache on non-DP modes and after a failed retimer
update so later DP transitions are always configured.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 38 ++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index e903d4910e9c..5ae554dc01d9 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -121,6 +121,12 @@ struct pmic_glink_altmode_port {
 	u8 hpd_state;
 	u8 hpd_irq;
 	u8 mux_ctrl;
+
+	/* Last DP state successfully programmed into the retimer. */
+	bool retimer_dp_valid;
+	u8 retimer_dp_mode;
+	bool retimer_dp_hpd_state;
+	enum typec_orientation retimer_dp_orientation;
 };
 
 #define work_to_altmode(w) container_of((w), struct pmic_glink_altmode, enable_work)
@@ -180,6 +186,7 @@ static void pmic_glink_altmode_enable_dp(struct pmic_glink_altmode *altmode,
 					 bool hpd_irq)
 {
 	struct typec_displayport_data dp_data = {};
+	bool retimer_state_unchanged;
 	int ret;
 
 	dp_data.status = DP_STATUS_ENABLED;
@@ -200,10 +207,31 @@ static void pmic_glink_altmode_enable_dp(struct pmic_glink_altmode *altmode,
 	port->retimer_state.alt = &port->dp_alt;
 	port->retimer_state.data = &dp_data;
 	port->retimer_state.mode = TYPEC_MODAL_STATE(mode);
+	retimer_state_unchanged = port->retimer_dp_valid &&
+		port->retimer_dp_mode == mode &&
+		port->retimer_dp_hpd_state == hpd_state &&
+		port->retimer_dp_orientation == port->orientation;
+
+	/*
+	 * An HPD IRQ is a sink-side DP interrupt, not a Type-C routing change.
+	 * Avoid rewriting an already configured retimer while DP link training or
+	 * video transmission is in progress. The DRM HPD IRQ notification below
+	 * is deliberately still delivered.
+	 */
+	if (hpd_irq && retimer_state_unchanged)
+		return;
 
 	ret = typec_retimer_set(port->typec_retimer, &port->retimer_state);
-	if (ret)
+	if (ret) {
+		/* A failed write may have left the retimer only partly configured. */
+		port->retimer_dp_valid = false;
 		dev_err(altmode->dev, "failed to setup retimer to DP: %d\n", ret);
+	} else {
+		port->retimer_dp_valid = true;
+		port->retimer_dp_mode = mode;
+		port->retimer_dp_hpd_state = hpd_state;
+		port->retimer_dp_orientation = port->orientation;
+	}
 }
 
 static void pmic_glink_altmode_enable_tbt(struct pmic_glink_altmode *altmode,
@@ -214,6 +242,8 @@ static void pmic_glink_altmode_enable_tbt(struct pmic_glink_altmode *altmode,
 	u32 cable_speed;
 	int ret;
 
+	port->retimer_dp_valid = false;
+
 	/* Device Discover Mode VDO */
 	tbt_data.device_mode = TBT_MODE;
 	tbt_data.device_mode |= TBT_SET_ADAPTER(TBT_ADAPTER_TBT3);
@@ -271,6 +301,8 @@ static void pmic_glink_altmode_enable_usb4(struct pmic_glink_altmode *altmode,
 	struct enter_usb_data data = {};
 	int ret;
 
+	port->retimer_dp_valid = false;
+
 	data.eudo = FIELD_PREP(EUDO_USB_MODE_MASK, EUDO_USB_MODE_USB4);
 
 	if (tbt->usb_speed == 0) {
@@ -307,6 +339,8 @@ static void pmic_glink_altmode_enable_usb(struct pmic_glink_altmode *altmode,
 {
 	int ret;
 
+	port->retimer_dp_valid = false;
+
 	port->state.alt = NULL;
 	port->state.data = NULL;
 	port->state.mode = TYPEC_STATE_USB;
@@ -329,6 +363,8 @@ static void pmic_glink_altmode_safe(struct pmic_glink_altmode *altmode,
 {
 	int ret;
 
+	port->retimer_dp_valid = false;
+
 	port->state.alt = NULL;
 	port->state.data = NULL;
 	port->state.mode = TYPEC_STATE_SAFE;

-- 
2.43.0

