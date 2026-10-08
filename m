Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758D33B9D9E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465313; cv=none; b=mvJpqHATi4098lBUMh/NAnuBik7BlIV4t604/5Y9LgliGQK+zPwSjaenPXXhMTHZ+JIIWl8zCBA7eNfg0z+re+zsmjLFwCeus/q1jExNq2tVI/UCa+w4BR4SeCxG1PMUwl1iWkmwZtG3fOO2du2ZRV7owrjjnzD9gKKSQxBAj9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465313; c=relaxed/simple;
	bh=8Vtfc5Vhy1+cySlmiGbXt3R0OZFZEbN5OOD72ntakHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oJ9h+sswJk6TIwQz0Fn8CDFrzP2dHEmhSoszdnRBhUQkVWgDmmAmriCI0a17jGrn1y5MX610LlQSzYGNlIyHkUQhNewp/eLeH5/TLcwGg7E0iWMvUXFU8/1yMng6J4shvIz2JKb2x8ZMbJm+asEBs+iIYxk4ex68vUCdB4VefpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=la2CDEXk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZFizvnI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="la2CDEXk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZFizvnI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKJY83225005
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 13:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	csvfm07mHvVhHKbV5agBPH0uNXrDO4Yl/0BBvYmp7jE=; b=la2CDEXk2OvSLWVx
	anXfqjh3tzEhtm865n8TYn0mD3aBXk3YIyChQsL8DBO6blAvGCGe/gVK8YFW3/G2
	k7G/6Q+MtpL7wWHwxWRUHl+Jhu+NKP1vKy7nV8yFgtIfzkotB1V/FtrMIAh2fF2b
	Q7EyQcY4yOf+z6+KvbwVy/7/GBI8TN4Bq2cAiznSYRh0ZzOElGXpR33x6ofQODRM
	mf0Vda9GcvQrt0JCp+di8V4+/qesD04T5m1tdKKENRc1DxieeREsNt64jm4oXYWy
	scYtzdJSAsMvHXqdhHs/pVOxAyu+L1/lKi8UWVuwfR2/QkhKrmNfAfmeQG1Zp0Au
	+wv+Hg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe431qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 13:15:08 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98c6374b678so4039127241.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791465307; x=1792070107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csvfm07mHvVhHKbV5agBPH0uNXrDO4Yl/0BBvYmp7jE=;
        b=cZFizvnI8S/RY5OMh3sYxJSpKXH2HRjv7ByjQI9hAdw1V9WEiclFCdsUwbAGHU/+Xh
         hRvmJERLkehTo8cU0nFLWjuCSShHuNCwdaj7XHesRBTGWwkrmxJydFJL1akz1XQYeN5z
         b+93tWeFAtlX+JwuLUNwQ5h0lwoezX92IFx8W478PjJ9P/suebU+yWK/Y8zx80fRYQS/
         hMBba2l3876AJMvJahAXQKJXz12k2B8ZseE2mORgEr7hkCLcWl0LTbw0VLOnS4EgtzUg
         4sHNuID3qrfmbIn7330SaubwflHrqBMH1yC4YSwBsg6xTktncmWJjNpR+sBJkh4fMlgN
         p/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465307; x=1792070107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csvfm07mHvVhHKbV5agBPH0uNXrDO4Yl/0BBvYmp7jE=;
        b=I5GCCNzfQZwc5H2gep2+rDNwb90wQwbVaHt5Dfw0BFc69XFPO1einhr+jQOo/9C8ig
         u5ibdWkh7e5qrXfofUKa7fBRPohXHMDFz3Pb28JYbs4WolqVHfxJvAs7lyAU2oQLFxwl
         5XYaCrBRWFeheiPjOW3b/GtpcSWQT78PHTAAkVmWre4UwybOcIbjSXYFJvPv2VuZU9AG
         a5Am+z8bu/PUrch+98NtSTI0J4Wa1QMNzaGT1q+VDncLhKhpBm2bip38EyjCf3e+/q92
         OtRy9vzma8wf7GGRBbtRgUV8p15gjilZTwsxlnIDSR/b8JuXIhErNCIlaAO205vk2IhZ
         N9Qg==
X-Forwarded-Encrypted: i=1; AKwUvBy7VUvWoDxIZ4icowWaUfRlvYES9A94d0KRTaHQdHu3BfdL90W6XEpBLEoDGGu5sBJ6ffYAGxL2BKlIeKY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPme04hMjJ3q2ktR6cXwa7Gp22t2TRXhKxoXic6oWOUmQ4u/HX
	A2XA0zyUpS4X4sll1UF4So35Qaefmd+Gi5tyIcEx2lTg2OVa84Lgena+qU6/LjKpaSiR2c6zhmD
	rB8KmOI9V4Y3TQlAlqcvkYHUEKltSNrUObB0165KXLJaTJ4dbYbsJK44b9Ll+P0Ey6BU=
X-Gm-Gg: AYBFou2zSrikxCE/SBKlThLDfUDwsd/ZnK4joTSp/XF99xErdz0eKaEEHnIlmMqCHaH
	6qGeV3ABeR4KmaOw1LeoNSetN3sUtIZXly/0Murin2EQFI8x8ECuXVgZuMxRnZvTq31bGoqOYf8
	R1Z4GmBNJlEdQxPj90PkXxkrD0utChckCbyDIeHQvqHqV3wWMhRiejV6J51TzX2qeBa2h2H1hNv
	NfBLf0DWYyDdb84ZYltGVUk+vimQ8CY872BD6qfVY2ln7rIhC8vvedh6mdcw+txXiz4zDlgxkQw
	btFBorXDFcvVAvfudFf+lYxkc16mS89KyDZ3qzlGY5OA/fxTALWdj8b/aeovP449nQICQSh6SNy
	TgG+qCeh5KgZGIjFBmXe2Ahi+3AYy2jXLqprH+N55p0dFTEXV6IRAk/XzHPoHAlLtzkrHinTK16
	xF+B0iUO/mFekV
X-Received: by 2002:a05:6102:5124:b0:7c4:5129:8e17 with SMTP id ada2fe7eead31-7ca38f24bb3mr2010582137.31.1791465307333;
        Thu, 08 Oct 2026 06:15:07 -0700 (PDT)
X-Received: by 2002:a05:6102:5124:b0:7c4:5129:8e17 with SMTP id ada2fe7eead31-7ca38f24bb3mr2010556137.31.1791465306755;
        Thu, 08 Oct 2026 06:15:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9ae563df4sm8691441fa.30.2026.10.08.06.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:15:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:14:30 +0300
Subject: [PATCH RFC 8/9] drm/panel: add atomic_print_state callback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-panel-atomic-state-v1-8-b157fddb8de1@oss.qualcomm.com>
References: <20261008-panel-atomic-state-v1-0-b157fddb8de1@oss.qualcomm.com>
In-Reply-To: <20261008-panel-atomic-state-v1-0-b157fddb8de1@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Val Packett <val@packett.cool>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3289;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8Vtfc5Vhy1+cySlmiGbXt3R0OZFZEbN5OOD72ntakHM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqx5dHkhcl/dRf92UtqStXhuyjnMMpcO7OTegm/
 6IelH591c+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaseXRwAKCRCLPIo+Aiko
 1c5lCACkvON31pjWuwjbQjdxOf7Mb2UoJz7PCeluWDNicQbjHqBg5RyMTSBfQzOjsD9lSrdMJAw
 0Xs7pTYCm+HS2D/mlwjV7f4UMReB+WK/O6HAkY5UGTuCZVcAJ0yU+Wd2IdrnQdT8oHYXuPfisvc
 VDXpP6PpiZI9px/CDDHDID/Ff7sn1xGPN7iia3tzlPJc84NH5S4aBfoaJ1PNUuXjhkCZzx3tuff
 9huScJAmaCo0jz/o341FauA3r/SgVRTamSPkZVdboi5OrQiMrQzzWB7hcyrykrpwsU307RlOQzP
 Cl2rxTuT3zBwhMscKeQ9xcz36NH6Z6xTNwemC1eaIz/84KxF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: zoMM7vPAhIZ2h-KCvLl8vzLARKurAWNH
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac7975c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=10bbWnoWcBPEOdUi84sA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfX8cS9x1UECc13
 giCJauYzGo8jmzLYFeD/PkwotEjYL1THniT9Ded2z/vPKh3bIu0hppDCO1uIvDgPwEOEt1IgDWy
 L/JoF7dL4TaMVEi0GX/xeKeZiSU6HuI=
X-Proofpoint-ORIG-GUID: zoMM7vPAhIZ2h-KCvLl8vzLARKurAWNH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfX5ap2P8RPDOHp
 iPXceDF4BPy/ymX0cMaiTY3DHsD8acLMqzUund06ZxcGjADWeTnq/G94YK1uL71dcFaDH8RD7oU
 QCLq3mBG0RK/VSV4yn38XLBOMGW3NWiUS1snFJzB7tWpA65Ht85Kx2MZEDivKJIcQ5daLBgLqEb
 hpG/dIene+icMsHs3W9gbSsJwVx7f+Ed5/To2cOldhdgAXJyvWPLOfVwK+bO7EEcKQk+IgSv9sR
 cYXPNgXkvWsz531cd9GypiO542KzAj+5enaJXF9NModR7t26b8NpaArLf0sLM1O3X26JH3kvwnE
 ro2VQi78Ab0IGRZ5Oudg8EyMMtVvVSbXOWOfMqAB8Bgo1cEkapVIBb7jiw0LHOUyTAymUgM0g85
 HQNLXk/FkuNAmpWCHQIrsv0UAU4IGCcRj5iu5pQyqIm1s1tdBT45J3jh6EtXC4K9mjopw/UjsPY
 qgSJblYQN5MN7cRp2Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080052

Panel drivers subclassing drm_panel_state have no way to get their part
of the state into the atomic state dumps, as the state is printed
through the bridge embedded in the panel.

Add an optional atomic_print_state callback, called from the
atomic_print_state callback of the embedded bridge.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_panel.c | 14 +++++++++++++-
 include/drm/drm_panel.h     | 11 +++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index a2cd043fe146..9be36c5b1037 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -483,6 +483,17 @@ static void panel_bridge_atomic_destroy_state(struct drm_bridge *bridge,
 					   drm_bridge_state_to_panel_state(bridge_state));
 }
 
+static void panel_bridge_atomic_print_state(struct drm_printer *p,
+					    const struct drm_bridge_state *bridge_state)
+{
+	struct drm_bridge *bridge = drm_priv_to_bridge(bridge_state->base.obj);
+	struct drm_panel *panel = drm_bridge_to_panel(bridge);
+
+	if (panel->funcs->atomic_print_state)
+		panel->funcs->atomic_print_state(p,
+						 drm_bridge_state_to_panel_state(bridge_state));
+}
+
 static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.attach = panel_bridge_attach,
 	.detach = panel_bridge_detach,
@@ -495,6 +506,7 @@ static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.atomic_create_state = panel_bridge_atomic_create_state,
 	.atomic_duplicate_state = panel_bridge_atomic_duplicate_state,
 	.atomic_destroy_state = panel_bridge_atomic_destroy_state,
+	.atomic_print_state = panel_bridge_atomic_print_state,
 	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,
 	.debugfs_init = panel_bridge_debugfs_init,
 };
@@ -853,7 +865,7 @@ static void drm_panel_init(struct drm_panel *panel, struct device *dev,
 		      !funcs->atomic_create_state &&
 		      (funcs->atomic_check || funcs->atomic_prepare ||
 		       funcs->atomic_enable || funcs->atomic_disable ||
-		       funcs->atomic_unprepare),
+		       funcs->atomic_unprepare || funcs->atomic_print_state),
 		      "Atomic callbacks require the panel state callbacks\n");
 
 	INIT_LIST_HEAD(&panel->list);
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index dedd792d2c52..20e5b1e5f50d 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -43,6 +43,7 @@ struct drm_crtc_state;
 struct drm_device;
 struct drm_panel_follower;
 struct drm_panel;
+struct drm_printer;
 struct display_timing;
 
 enum drm_panel_orientation;
@@ -301,6 +302,16 @@ struct drm_panel_funcs {
 	 */
 	void (*atomic_destroy_state)(struct drm_panel *panel,
 				     struct drm_panel_state *state);
+
+	/**
+	 * @atomic_print_state:
+	 *
+	 * If driver subclasses &struct drm_panel_state, it should implement
+	 * this optional hook for printing additional driver specific state.
+	 * It can only be implemented together with @atomic_create_state.
+	 */
+	void (*atomic_print_state)(struct drm_printer *p,
+				   const struct drm_panel_state *state);
 };
 
 struct drm_panel_follower_funcs {

-- 
2.47.3

