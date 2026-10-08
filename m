Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097C64A689C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465314; cv=none; b=RIl3wia/RNPJCCBZCKUnYJVcD7JM6JMGR/+jYhAv1GytPY5/9I32ZBOAh71iIuLNmz7uzpdkdkUsCuIFDUhyk5I52jnZa0NUiqRZVjJ5cZcoXWYzMO8IGIwXhZhJRxvsqTqj/TAWQZISuhD0YvaMIalpInQC0ZY5dXJ4cCR6Jq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465314; c=relaxed/simple;
	bh=0EHBy/jzblv5Vkomml7MHPaurJB1shiJM+DeJwesgcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LuwZPMIIVHWe+u1sf8b8z5sqzDzXhA/8SjexbwaCWBAoPhIYDlDi7094mfVNWKz5jIPvrmbw6XKFYI2/F1xkDqOxkNPb0ukB8UtiWnUdXiHV6gGM3d9197Z4QP3SmX9gdWg+XWvS3PXWmoqpSEwHqu6TtlHf+fxCl6qsXUhyEDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PM+lgsKQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ge5iBKOF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PM+lgsKQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ge5iBKOF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKI0K1708470
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 13:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WI5iTmHpDCVv0wS51qzRWwuSZihIVcAlgqKABFXN+8w=; b=PM+lgsKQw62gmPPm
	IVbRcdw9JzAp/zuf5kXVW7qzGbXQnV1x3bO4KUvR+scNPwGIyObDL6heCsC9rtpe
	Ixs0jw7wY8QSY2Ni1IiIovXla9MkXKkQfrjy9TazOUidT32hPP4OnIMessJ8FgvI
	jTWRD1A3VGbsM5UAxFfu61xupDytkFmTI9enlxJvLJIt6slX5KNUPlZQ1knYB3qA
	8sCkqtRgjy4iGUfcNk+EpjpwhNlqYvB5/bLubBRFFfscxGjmGLZs49DGXBd0rJ1b
	PluFFCic9zhyU4X+fnsLjmOCogxKbTotjmt++QsUuV49VjG7iFyF5mWeUyy3xZ9w
	GvGl5A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3b029-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 13:15:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b4bf686ceso6300936d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791465310; x=1792070110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WI5iTmHpDCVv0wS51qzRWwuSZihIVcAlgqKABFXN+8w=;
        b=ge5iBKOFzOI7pxBqqXK33WdPTWnKztJbNCmt1tRdLDfp2f/C14Wgt4rgMopXC9IAt6
         wgzlb90t8BGsqlaBVtciYfNGYWnSZmXaRjHDVoYRpLB4k5DXvhVnVls6iviNHADGHcw2
         UPO1eYykYf2BZ1SJikqhHcA5ygxZomRzrtQfHyaIutuoDQnGA+lkn6e0JvgHLl4vuvn2
         k2UuqpB1nt3f9/aR0OkLo3du6okv1hEZFje4ACNoHFyAVf4RgPxyzp++P55hXsYx+jp/
         d0TaVLmMLIPGYH8FHjJe125YBhePlvZJ25iuRaMeVU82sLKcz3nHRgaCuSPQEHEJLm35
         gJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465310; x=1792070110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WI5iTmHpDCVv0wS51qzRWwuSZihIVcAlgqKABFXN+8w=;
        b=pOYv4DNLstDR/3rnVFoNV8slAJqXEqju4jxiYNbWLP5tYBDxd5dyhH4G52cLqHOVQb
         lE8772lFl2B9hGHiW4op5AcM+JP/Fzm3FIEgs9PoxeB4qg32grNhhJNwJOhdjwJt1vzw
         Rl+m00hqHfa1nyCzrflwDLqVwKrIQpAk3EOZ5yOfbFUO2j+z7Q5H5ZagTL2qWQya510A
         Prhl19yn4ruj9vX3UZQzlSAA43CBNHnZruxXiDM9ko3b9EHS75saxVFYxm+XccG+ykAh
         8beETcRHNfCrRY5wkFx3WQGfOJOfUNWrxFAEr+In7YPRbtyaBl/LMEPGo8WjPzgAEPmQ
         3tVg==
X-Forwarded-Encrypted: i=1; AKwUvByUdxOS92jVLR1+iXe2RkeOMguicVysCPmo53JR9IL4EnsvX2wkLdb7R93egPlkCbUpwuuQViINAAbxjvc=@vger.kernel.org
X-Gm-Message-State: AFuF++n2FoyKdicm7iz9lr46Y3F7fOh/KJxQWJLV41uzB/9dzGMlFiPU
	zigauNaaBUDedznTIN45ArAy/3SEb1psfp6Qi38/SKJ6Xdly0w4NFWxX+OgCfDqWLdz9vEmSQMA
	7syTzY/FOEk3IrdrzEuCdOdvJc6u4dnK85iVKtdAetEcrz3H/oXbSRL3vZt9zRIH6qNk=
X-Gm-Gg: AYBFou1tL70e3W35dx1SZTtFdOLNQ38d1+yGc7zQC1ALcB0Qr5Vl0DvL/7vnVF8lNiG
	vjvXuh641xs/W+i/3gThfv+LTv2Uv7kw4hhJr18DFxBngo7Gs9nfS+H/yITI8pQI8nWDD9tjEdo
	l5u11RmurdY63o1P2y7Hd+3ZVqEQxPX1N7/3h38hiwiBqbyR8OM5/vufvBnOfQNZEVoV0dYv1+L
	wsHkYdIfC8oclZpW/bz9+9NaFkcWNS9j4jU0tNnHAz5wmsz4kHH9yO78gkC8CG1LMt4aaJP6f9J
	7GQRIOk5IGcNex5J5nuvyEvgr+oEd42NGvfMI3AxNlYIO/1eaV6d6pX8e/cXKjylIdPmu1xgkJf
	j4wJecK9pR4MWYcbZHOphkG4B/8t2JW+3IqKJv2dQmbrkRXgVsLSSgq1cAJsFgbepG4AclG2eF+
	ytHKqMO8i5szCV
X-Received: by 2002:a05:6214:29ea:b0:917:863b:8409 with SMTP id 6a1803df08f44-919976fde75mr103850896d6.5.1791465309772;
        Thu, 08 Oct 2026 06:15:09 -0700 (PDT)
X-Received: by 2002:a05:6214:29ea:b0:917:863b:8409 with SMTP id 6a1803df08f44-919976fde75mr103849596d6.5.1791465308891;
        Thu, 08 Oct 2026 06:15:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9ae563df4sm8691441fa.30.2026.10.08.06.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:15:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:14:31 +0300
Subject: [PATCH RFC 9/9] drm/panel: novatek-nt35950: use the atomic state
 to select the mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-panel-atomic-state-v1-9-b157fddb8de1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9580;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0EHBy/jzblv5Vkomml7MHPaurJB1shiJM+DeJwesgcw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9bx6e6sS4UtfvDYTrTf8sOq4rO934IQyVbtrww5nAVnR
 e4+b/zVyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJ6P1i/6dU1OE776LtU1Ur
 pX7GO0vrdq1zFlRmueH64YijoXP6xRq1ogK+/Q0fv/Hly/5okH4sHz/3rJUae6+eY9ONeZ016w6
 6Pv7fl1kZIfxEbf3p5btPvkuISd33+jzzjoMGi0WUwviOvy4+kLL4FnuhkVGA0bSTrG41NsHR58
 pPvJj8purHzmmvs6o+NB7wufz8t24Ap4uKZCoD36kHW/j4O2Iu719r2Cn5aKVo3WrXWa/Sds0Qd
 GM15HSYU3wxOYA35fSXv4KLS54wtCV2Mmawxj69HdhXyfHgy+JSlxxpmRNREe7dWvZqjQcbO/Me
 y2QdErgWmBfKckz5ye+HQUvanu1ytwk78iTUYa6JW1U2AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: tZhhWghiyJBBTNE7uN9KMaxAaRrv-ixq
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac7975e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=VdZGNx2Yb9MlkK5L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mhi-3aykUTELmbTksFoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfX47YvKPPt2WBW
 tiePjG6AZk5lqtLfYsxQ4akk5nge5SXPJ4qKCnKxG/Bq40WMyDEks3A4EJCjY6BaMc3e7tdqARl
 wCZdG00yeJQqXJaFRyVsmdY6a0MK9s0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfX+u/fiib6VJtL
 ndz0yOTyQyD3B3pX2M4mDvsiHKPt6cB2AoAgpSZ54Ey1Ua8ftXnwfL+eoeM6FnD+08uZd+b4lAo
 SWlJBLLjRDF/bz9H6woazi91TqubkY4pE19Az2ZXwjuzT6csW41NQX8ZbFofwTjgWnKtMtZEu64
 Xq0JWBWhSyoxOfdrAG5USKNqvHm9sRUUodFIPojuIg9t4Bq9nVHLIZDG/GcJDOFP1R3u50xW5M3
 83Q81l/TFozkgFPkFYiIi5UXJtZrqVw0DesTSwLauWFbxszfwIW/x3r4T8EkRVAzT+2wYw2WOtJ
 1un+aj1A5pjnk77YGQzURGGYsNlO/vpThBBIdPpr/dDIxDCqYmG+vZeCs1AwEOtxm1ACCL8nCys
 Lp5ZsX7WCYRFDu0juzGHIafD+THxDwXuFcXcnYivkAHBvL3b62w4Wml9MKyjBwOQ1deL27MzQpK
 w0d6BqE/6FtWDdXpDcg==
X-Proofpoint-ORIG-GUID: tZhhWghiyJBBTNE7uN9KMaxAaRrv-ixq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080052

The compression, scaler and display output settings of the NT35950
depend on the mode being set. As the panel has no access to the
configuration being committed, the driver saves the connector pointer in
get_modes() and then dereferences connector->state->crtc->state from the
prepare() callback. This is done without holding the modeset locks and
it reads the current state of the objects rather than the state being
committed. Moreover, if none of the panel modes match, the driver
silently programs the panel for the first mode instead of rejecting the
configuration.

Subclass the panel state to store the parameters of the selected mode.
Look the mode up in atomic_check(), failing the commit if the panel
doesn't support it, and use the stored parameters in atomic_prepare().
Switch unprepare() to its atomic variant too, so that the driver uses a
single set of callbacks.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt35950.c | 159 +++++++++++++++++++-------
 1 file changed, 117 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
index 94aa6489d99f..f5161f11b1f5 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
@@ -11,12 +11,15 @@
 #include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
+#include <linux/slab.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 
 #define MCS_CMD_MAUCCTR			0xf0 /* Manufacturer command enable */
 #define MCS_PARAM_SCALER_FUNCTION	0x58 /* Scale-up function */
@@ -51,16 +54,19 @@
 
 struct nt35950 {
 	struct drm_panel panel;
-	struct drm_connector *connector;
 	struct mipi_dsi_device *dsi[2];
 	struct regulator_bulk_data vregs[NT35950_VREG_MAX];
 	struct gpio_desc *reset_gpio;
 	const struct nt35950_panel_desc *desc;
 
-	int cur_mode;
 	u8 last_page;
 };
 
+struct nt35950_state {
+	struct drm_panel_state base;
+	const struct nt35950_panel_mode *mode_data;
+};
+
 struct nt35950_panel_mode {
 	const struct drm_display_mode mode;
 
@@ -88,6 +94,9 @@ static inline struct nt35950 *to_nt35950(struct drm_panel *panel)
 	return container_of(panel, struct nt35950, panel);
 }
 
+#define to_nt35950_state(panel_state) \
+	container_of_const(panel_state, struct nt35950_state, base)
+
 static void nt35950_reset(struct nt35950 *nt)
 {
 	gpiod_set_value_cansleep(nt->reset_gpio, 1);
@@ -212,61 +221,37 @@ static void nt35950_inject_black_image(struct mipi_dsi_multi_context *dsi_ctx)
 
 /*
  * nt35950_set_dispout - Set Display Output register parameters
- * @nt:    Main driver structure
  * @dsi_ctx: context for mipi_dsi functions
+ * @mode_data: Parameters of the mode being set
  */
 static void nt35950_set_dispout(struct mipi_dsi_multi_context *dsi_ctx,
-				struct nt35950 *nt)
+				const struct nt35950_panel_mode *mode_data)
 {
 	u8 cmd_dispout[] = { MCS_PARAM_DISP_OUTPUT_CTRL, 0x00 };
-	const struct nt35950_panel_mode *mode_data = nt->desc->mode_data;
 
-	if (mode_data[nt->cur_mode].is_video_mode)
+	if (mode_data->is_video_mode)
 		cmd_dispout[1] |= MCS_DISP_OUT_VIDEO_MODE;
-	if (mode_data[nt->cur_mode].enable_sram)
+	if (mode_data->enable_sram)
 		cmd_dispout[1] |= MCS_DISP_OUT_SRAM_EN;
 
 	mipi_dsi_dcs_write_buffer_multi(dsi_ctx, cmd_dispout,
 					ARRAY_SIZE(cmd_dispout));
 }
 
-static int nt35950_get_current_mode(struct nt35950 *nt)
-{
-	struct drm_connector *connector = nt->connector;
-	struct drm_crtc_state *crtc_state;
-	int i;
-
-	/* Return the default (first) mode if no info available yet */
-	if (!connector->state || !connector->state->crtc)
-		return 0;
-
-	crtc_state = connector->state->crtc->state;
-
-	for (i = 0; i < nt->desc->num_modes; i++) {
-		if (drm_mode_match(&crtc_state->mode,
-				   &nt->desc->mode_data[i].mode,
-				   DRM_MODE_MATCH_TIMINGS | DRM_MODE_MATCH_CLOCK))
-			return i;
-	}
-
-	return 0;
-}
-
-static int nt35950_on(struct nt35950 *nt)
+static int nt35950_on(struct nt35950 *nt,
+		      const struct nt35950_panel_mode *mode_data)
 {
-	const struct nt35950_panel_mode *mode_data = nt->desc->mode_data;
 	struct mipi_dsi_device *dsi = nt->dsi[0];
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	nt->cur_mode = nt35950_get_current_mode(nt);
 	nt->dsi[0]->mode_flags |= MIPI_DSI_MODE_LPM;
 	nt->dsi[1]->mode_flags |= MIPI_DSI_MODE_LPM;
 
 	nt35950_set_cmd2_page(&dsi_ctx, nt, 0);
-	nt35950_set_data_compression(&dsi_ctx, nt, mode_data[nt->cur_mode].compression);
-	nt35950_set_scale_mode(&dsi_ctx, mode_data[nt->cur_mode].scaler_mode);
-	nt35950_set_scaler(&dsi_ctx, mode_data[nt->cur_mode].scaler_on);
-	nt35950_set_dispout(&dsi_ctx, nt);
+	nt35950_set_data_compression(&dsi_ctx, nt, mode_data->compression);
+	nt35950_set_scale_mode(&dsi_ctx, mode_data->scaler_mode);
+	nt35950_set_scaler(&dsi_ctx, mode_data->scaler_on);
+	nt35950_set_dispout(&dsi_ctx, mode_data);
 
 	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 	mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx, 0);
@@ -354,11 +339,43 @@ static int nt35950_sharp_init_vregs(struct nt35950 *nt, struct device *dev)
 	return 0;
 }
 
-static int nt35950_prepare(struct drm_panel *panel)
+static int nt35950_atomic_check(struct drm_panel *panel,
+				struct drm_atomic_commit *commit)
+{
+	struct nt35950 *nt = to_nt35950(panel);
+	struct drm_panel_state *panel_state;
+	struct drm_crtc_state *crtc_state;
+	int i;
+
+	panel_state = drm_atomic_get_new_panel_state(commit, panel);
+	crtc_state = drm_atomic_get_new_crtc_state_for_panel(commit, panel);
+	if (!panel_state || !crtc_state)
+		return -EINVAL;
+
+	for (i = 0; i < nt->desc->num_modes; i++) {
+		if (drm_mode_match(&crtc_state->mode,
+				   &nt->desc->mode_data[i].mode,
+				   DRM_MODE_MATCH_TIMINGS | DRM_MODE_MATCH_CLOCK)) {
+			to_nt35950_state(panel_state)->mode_data =
+				&nt->desc->mode_data[i];
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int nt35950_atomic_prepare(struct drm_panel *panel,
+				  struct drm_atomic_commit *commit)
 {
 	struct nt35950 *nt = to_nt35950(panel);
+	struct drm_panel_state *panel_state;
 	int ret;
 
+	panel_state = drm_atomic_get_new_panel_state(commit, panel);
+	if (!panel_state || !to_nt35950_state(panel_state)->mode_data)
+		return -EINVAL;
+
 	ret = regulator_enable(nt->vregs[0].consumer);
 	if (ret)
 		return ret;
@@ -380,7 +397,7 @@ static int nt35950_prepare(struct drm_panel *panel)
 
 	nt35950_reset(nt);
 
-	ret = nt35950_on(nt);
+	ret = nt35950_on(nt, to_nt35950_state(panel_state)->mode_data);
 
 end:
 	if (ret < 0) {
@@ -391,7 +408,8 @@ static int nt35950_prepare(struct drm_panel *panel)
 	return 0;
 }
 
-static int nt35950_unprepare(struct drm_panel *panel)
+static int nt35950_atomic_unprepare(struct drm_panel *panel,
+				    struct drm_atomic_commit *commit)
 {
 	struct nt35950 *nt = to_nt35950(panel);
 
@@ -429,15 +447,72 @@ static int nt35950_get_modes(struct drm_panel *panel,
 	connector->display_info.bpc = 8;
 	connector->display_info.height_mm = nt->desc->mode_data[0].mode.height_mm;
 	connector->display_info.width_mm = nt->desc->mode_data[0].mode.width_mm;
-	nt->connector = connector;
 
 	return nt->desc->num_modes;
 }
 
+static struct drm_panel_state *
+nt35950_atomic_create_state(struct drm_panel *panel)
+{
+	struct nt35950_state *state;
+
+	state = kzalloc_obj(*state);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_panel_state_init(&state->base, panel);
+
+	return &state->base;
+}
+
+static struct drm_panel_state *
+nt35950_atomic_duplicate_state(struct drm_panel *panel)
+{
+	struct drm_panel_state *old_state = drm_panel_get_current_state(panel);
+	struct nt35950_state *state;
+
+	if (!old_state)
+		return NULL;
+
+	state = kzalloc_obj(*state);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_panel_duplicate_state(panel, &state->base);
+	state->mode_data = to_nt35950_state(old_state)->mode_data;
+
+	return &state->base;
+}
+
+static void nt35950_atomic_destroy_state(struct drm_panel *panel,
+					 struct drm_panel_state *state)
+{
+	kfree(to_nt35950_state(state));
+}
+
+static void nt35950_atomic_print_state(struct drm_printer *p,
+				       const struct drm_panel_state *state)
+{
+	const struct nt35950_panel_mode *mode_data =
+		to_nt35950_state(state)->mode_data;
+
+	if (!mode_data)
+		return;
+
+	drm_printf_indent(p, 1, "compression: %02x\n", mode_data->compression);
+	drm_printf_indent(p, 1, "scaler: %u, mode %02x\n",
+			  mode_data->scaler_on, mode_data->scaler_mode);
+}
+
 static const struct drm_panel_funcs nt35950_panel_funcs = {
-	.prepare = nt35950_prepare,
-	.unprepare = nt35950_unprepare,
+	.atomic_check = nt35950_atomic_check,
+	.atomic_prepare = nt35950_atomic_prepare,
+	.atomic_unprepare = nt35950_atomic_unprepare,
 	.get_modes = nt35950_get_modes,
+	.atomic_create_state = nt35950_atomic_create_state,
+	.atomic_duplicate_state = nt35950_atomic_duplicate_state,
+	.atomic_destroy_state = nt35950_atomic_destroy_state,
+	.atomic_print_state = nt35950_atomic_print_state,
 };
 
 static int nt35950_probe(struct mipi_dsi_device *dsi)

-- 
2.47.3

