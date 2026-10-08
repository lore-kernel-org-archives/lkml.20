Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF1D4A5EAF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465311; cv=none; b=SU8KmNnpuwVGJYbvkcpaiUjeWBBUHCGNZY+NfY0WZOMwFt/auTwrVjKpXYD9ddY1hhtmIkyoatFztr75+jcNxVzEaQKVrDSX14b9WuNac0o5i87k1Fv3zUzDhy1u7jnPHLNTR0AFovgmUYaP+yXaChaDZGprjR9eaXdjgSpM/Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465311; c=relaxed/simple;
	bh=L5JDbGe2zS2DEbSeC985zbiJ0u3XsyxFbnA7BGKrMNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VbsHYiluZam23XmNmXMuQinam7yUU2YUEAPyYL3j3Sofn8DthkSCOd/8x6A8dLqN1BBdy31z2DOqv2sEMgQ7EkhhvnsUKw/64oQPzZvIYg5fFRNwPIVgKkuvAvt30niv6nOtGgA4vsN3YWWIx+APbuu0iPf10PGbshyEYOpLKEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GLqEsLlX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ies9aU2S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GLqEsLlX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ies9aU2S"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK73g2384021
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 13:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0CM60eRkOWtuG19BA/pq1pewSHHDCFRHsPAVhWCO6Q=; b=GLqEsLlXLp8HLkTu
	P2tDIeBhuIgzJb6Qi+7tGZbV7ve33nA9JcdrhWCxx89kmGVKwnm61Yzk1WRTB2mI
	FZkw8TsXFzsgyTLQVL8NGJsMgo09lYh26LJIJwpeqqEa8ThT/M/RM2j6UAC1FFHk
	ZweLFIRm3MySStEwMor+zOS0i1a1E7VqUat3MKbVEiCQArSHA6OzQHjwdK88zkBg
	3o25R7/Nc6WO030djGS9b4fzL4rXo7CIoTjDjCcM6J1jsdVm5jnzMo6pbLuldKma
	b7h+usripzx9j+he37VzCqM+8JE2JbYBhn9GjFOd636mDICqxfPqwQsGi3XkAfe8
	QZOljA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3k3ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 13:15:06 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98c660a704aso543825241.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791465305; x=1792070105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0CM60eRkOWtuG19BA/pq1pewSHHDCFRHsPAVhWCO6Q=;
        b=ies9aU2SOLnUvAw6DPdVViRT7UO7D9MQvw2cmDdalUvBkcyxzgy90CXTwtD5VKqPYd
         H/Itnhu9BRmgq9BGDFKpTwcmiPjrhVHOXs756pAmjc8IHBlbtpItKMtMEYb70gIhJtk4
         YaG4z80bez3+oyFmXSl3GqDMZF7Mg7nKuehIQC1W543HrvmTysStCkbtwJ8m1ivTNqIO
         n9aUqVVs/1PpoowqZZPMNrSy5Ue474E3nJ55/WC3MpN4Pt9bK/T2f8Wn72NGnoxpSMO9
         VFs5+2v3ufxnnHNs8wPsWE9BJ6ibN2OL/tzz7WWslp+J0GWGfLQzWwP5p+wvZP7nrYSI
         oPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465305; x=1792070105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0CM60eRkOWtuG19BA/pq1pewSHHDCFRHsPAVhWCO6Q=;
        b=TMCwcgtribNtu5SAQhz1piwIbNWaHvf+LXHVciaatYpraRCB/uyBr3G/8XV9mQGE//
         J/ncNVyCP1dHVNaZWaJfhvNy+kQDllQnrGXdoc7dHjniODAqi1FZ4aF+CAXcy0tLF+lT
         yrTDCTkMj7BRNv161gw9Y74OfIrVX4YMVB6eERbZ4gpTyJEGN3gbeq+EWblmBQhaLuZ4
         aBRHnewOhy2XIgeoWOAnP5YtphPR2nVTIoXvDeaXloEFk57w/ah9iWAMOBsbhILWsn9c
         3c8GBBb7A8YmsLGlXuATqOJN1kywB24+93ItGbW9cTBKEeWroARpLbjTNpUgRa5Q5Hhm
         XoqA==
X-Forwarded-Encrypted: i=1; AKwUvBwmFXS62dGUmi8y3r+2IoINkUeoSHntLt8NgAOB9XfiwHjJtQOo/yOa6x1Dl2dRgHnAthoLEik/54RFYfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAvv2HoKJCUUnr84fyusOQOQmdOxkszzD4gRt4Ae5c/JmMwIIx
	rdrTMgEximkH0eLqQScpNZSiopD+x6+4aRlYmCO8gOd4mytu/39FJkBsLGQdeK7NgpCRKJ2Et/c
	uPTP2CrophXPCO0c9okBJnSIuJ/9XDphs/nVvzaJ31r5rfo7SVe8OtsKDBStN8/EfUJs=
X-Gm-Gg: AYBFou20JrEFym87hUwhPOtyNStaKJDJ8ucAMIoppKWLzzd4v8KrS0tJ03OeepB2VHF
	zc717ORKT5A9Ze7Pmoqmhsn+UYFXB2TQVpmfPY3/z34JpfjtbW8sgF4gQ+HJ8O5n6eVd5ahpo09
	VHw8qCIJEcgdUE8mfeJEQ9NGJZCQ9g9Ua0rbGc+h2Ki+U3chRb+EE9AMBvMIypNhxc7Z4xU61fJ
	+n4VXk8qS8C/SgWF1PTmCrk9wsaDuyEFmfi52D9UtILulKuZ4Uftz5i5KekihflfsZgg/2M4UYP
	EkyOUh+9wbF7gstNY4tTitzb7lrZ4VMc5k/Mi1/S4orKyKKZG0zwFBpC/PjhlBxooN8cYdBeg/L
	8oZHwPddP/DzLjd7hwiFqQGQK9kXKwgrfqFEHl+mbOgZP/uL0DddUHFef22ek8dOYSp95Qur9yU
	Tqyfr7OiEhcEUn
X-Received: by 2002:a05:6102:2929:b0:7a2:7ccd:280d with SMTP id ada2fe7eead31-7ca38913d7amr1244008137.8.1791465305340;
        Thu, 08 Oct 2026 06:15:05 -0700 (PDT)
X-Received: by 2002:a05:6102:2929:b0:7a2:7ccd:280d with SMTP id ada2fe7eead31-7ca38913d7amr1243980137.8.1791465304665;
        Thu, 08 Oct 2026 06:15:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9ae563df4sm8691441fa.30.2026.10.08.06.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:15:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:14:29 +0300
Subject: [PATCH RFC 7/9] drm/panel: add atomic variants of the enable and
 disable callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-panel-atomic-state-v1-7-b157fddb8de1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8798;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=L5JDbGe2zS2DEbSeC985zbiJ0u3XsyxFbnA7BGKrMNc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqx5dHcaOJzxngINynszu2UMOmvhbuEv++2DWBj
 wMxztTNiM2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaseXRwAKCRCLPIo+Aiko
 1U2LB/9YVTDANuaqn4XC1qtcHTYzuFFzzX12OpQYhYX8LvzRtPHtTkJYc4M1rI1GWTH2tvvkmiY
 u3bNuSaDeWhYT0QEaVJxRhonouNedZ3WOuwPS0qvuZG1n8CA1yddl7jfmedyTxACrugXawKzDJt
 I6t5nEcE7U0FTRl29OeAHGHsegA7vlJ30ExgqVMKgl25xHdcxQhKztDIO/3GgX/0/reLc9xi0Cj
 dsr88xAjR07NnW0faRBhA9GEIXr5SxoIpjXHxjw00C8qU97BCj1uAkDzk/47QsNh5ACUniV7GPg
 Z7fAJjfoXNbO9Wu5F9MQW136Us5UtlhmESyllIaXx52vwtm0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfXwSAq00iW3H20
 G2WeHcJN/YWqsQ4G5WTQ8Ep/j9bZqtUWF7of3PVN8cbpNuoBPw1tBIwul8Hi8hnw2N/fSND5fbR
 l2VkdaGOwEWRkbBCTTXhqA3XWr4Xz40=
X-Proofpoint-ORIG-GUID: KYHErM3YttUG9MT7Skk6V2Gl4TclIiu8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfX4So1Q9lUjpgz
 omwyvedo0pvM8WIja1va8PuBzbm4K/Fh68+Ay6ikmntYurQU4yADfBuUgLfJqvsZYxHHc253azu
 IiK2VuiRsOLqINuOPqA3k+4p0IFsg+v3OJRCoBDi821RHcg0uB6eMW7CJu+QMKQYV1EGX4wja0Y
 WbYClZlHLlGf7fzf6jjTGUXxzmaz9RdCACX5Dxy9b/pf3PEuCvh5fkUW9vsSV8vygbFdcVoW6jf
 W4tyAisTx50RvewBMieKaulcg+eWxD7NwVXd1X1emjFxJsXv3EN0hmDjQ3tb8SU/KHKktYjU5xQ
 wGslKXCVranX/KRzemqEWvHmz9jpLBBMGiRelT0IqoIB8eGSLRc6Q+O621kIPI+c9sZ0OqIdqaB
 RRs9l4B4Oop0CcvcID7iStNZg+QZ4F6Yo8RTXvvPq+lW+BbUj8W6E54Vf2W7iv37i7RXO9zcnCK
 hJVMhI8hguhAeKOqU4w==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac7975a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=HYHJ6GXdE3zNCkCZCCcA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: KYHErM3YttUG9MT7Skk6V2Gl4TclIiu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080052

The prepare, enable, disable and unprepare callbacks only receive the
panel. A panel driver that tracks its configuration in the atomic state
cannot tell which state is being applied, so it cannot program the
panel accordingly.

Add atomic_prepare, atomic_enable, atomic_disable and atomic_unprepare
callbacks receiving the commit. They are called by a second set of
functions, used by the bridge embedded in the panel, which fall back to
the legacy callbacks for the panels not implementing the atomic ones.

The callbacks are only meant for the panels using atomic state, which
are never driven through drm_panel_prepare() and its counterparts. Warn
about the panels implementing them without the state callbacks.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_panel.c | 125 +++++++++++++++++++++++++++++++++++++++++---
 include/drm/drm_panel.h     |  54 +++++++++++++++++++
 2 files changed, 173 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index ed0d16e04eae..a2cd043fe146 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -56,7 +56,10 @@ static LIST_HEAD(panel_list);
  * drm_atomic_helper_panel_create_state(),
  * drm_atomic_helper_panel_duplicate_state() and
  * drm_atomic_helper_panel_destroy_state() helpers or with their own functions
- * if they subclass the state.
+ * if they subclass the state. The state is computed and validated
+ * in &drm_panel_funcs.atomic_check and applied in
+ * &drm_panel_funcs.atomic_prepare, &drm_panel_funcs.atomic_enable,
+ * &drm_panel_funcs.atomic_disable and &drm_panel_funcs.atomic_unprepare.
  *
  * The panel state is the state of the &drm_bridge embedded in the panel. It
  * only exists once that bridge has been attached to an encoder, so the panels
@@ -221,6 +224,112 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
 		drm_connector_cleanup(connector);
 }
 
+static void drm_panel_atomic_prepare(struct drm_panel *panel,
+				     struct drm_atomic_commit *commit)
+{
+	const struct drm_panel_funcs *funcs = panel->funcs;
+	int ret = 0;
+
+	if (panel->prepared) {
+		dev_warn(panel->dev, "Skipping prepare of already prepared panel\n");
+		return;
+	}
+
+	guard(mutex)(&panel->follower_lock);
+
+	if (funcs->atomic_prepare)
+		ret = funcs->atomic_prepare(panel, commit);
+	else if (funcs->prepare)
+		ret = funcs->prepare(panel);
+	if (ret < 0)
+		return;
+	panel->prepared = true;
+
+	drm_panel_followers_prepared(panel);
+}
+
+static void drm_panel_atomic_unprepare(struct drm_panel *panel,
+				       struct drm_atomic_commit *commit)
+{
+	const struct drm_panel_funcs *funcs = panel->funcs;
+	int ret = 0;
+
+	if (!panel->prepared) {
+		dev_warn(panel->dev, "Skipping unprepare of already unprepared panel\n");
+		return;
+	}
+
+	guard(mutex)(&panel->follower_lock);
+
+	drm_panel_followers_unpreparing(panel);
+
+	if (funcs->atomic_unprepare)
+		ret = funcs->atomic_unprepare(panel, commit);
+	else if (funcs->unprepare)
+		ret = funcs->unprepare(panel);
+	if (ret < 0)
+		return;
+	panel->prepared = false;
+}
+
+static void drm_panel_atomic_enable(struct drm_panel *panel,
+				    struct drm_atomic_commit *commit)
+{
+	const struct drm_panel_funcs *funcs = panel->funcs;
+	int ret = 0;
+
+	if (panel->enabled) {
+		dev_warn(panel->dev, "Skipping enable of already enabled panel\n");
+		return;
+	}
+
+	guard(mutex)(&panel->follower_lock);
+
+	if (funcs->atomic_enable)
+		ret = funcs->atomic_enable(panel, commit);
+	else if (funcs->enable)
+		ret = funcs->enable(panel);
+	if (ret < 0)
+		return;
+	panel->enabled = true;
+
+	ret = backlight_enable(panel->backlight);
+	if (ret < 0)
+		DRM_DEV_INFO(panel->dev, "failed to enable backlight: %d\n",
+			     ret);
+
+	drm_panel_followers_enabled(panel);
+}
+
+static void drm_panel_atomic_disable(struct drm_panel *panel,
+				     struct drm_atomic_commit *commit)
+{
+	const struct drm_panel_funcs *funcs = panel->funcs;
+	int ret = 0;
+
+	if (!panel->enabled) {
+		dev_warn(panel->dev, "Skipping disable of already disabled panel\n");
+		return;
+	}
+
+	guard(mutex)(&panel->follower_lock);
+
+	drm_panel_followers_disabling(panel);
+
+	ret = backlight_disable(panel->backlight);
+	if (ret < 0)
+		DRM_DEV_INFO(panel->dev, "failed to disable backlight: %d\n",
+			     ret);
+
+	if (funcs->atomic_disable)
+		ret = funcs->atomic_disable(panel, commit);
+	else if (funcs->disable)
+		ret = funcs->disable(panel);
+	if (ret < 0)
+		return;
+	panel->enabled = false;
+}
+
 static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					   struct drm_atomic_commit *atomic_state)
 {
@@ -237,7 +346,7 @@ static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	if (old_crtc_state && old_crtc_state->self_refresh_active)
 		return;
 
-	drm_panel_prepare(panel);
+	drm_panel_atomic_prepare(panel, atomic_state);
 }
 
 static void panel_bridge_atomic_enable(struct drm_bridge *bridge,
@@ -256,7 +365,7 @@ static void panel_bridge_atomic_enable(struct drm_bridge *bridge,
 	if (old_crtc_state && old_crtc_state->self_refresh_active)
 		return;
 
-	drm_panel_enable(panel);
+	drm_panel_atomic_enable(panel, atomic_state);
 }
 
 static void panel_bridge_atomic_disable(struct drm_bridge *bridge,
@@ -275,7 +384,7 @@ static void panel_bridge_atomic_disable(struct drm_bridge *bridge,
 	if (new_crtc_state && new_crtc_state->self_refresh_active)
 		return;
 
-	drm_panel_disable(panel);
+	drm_panel_atomic_disable(panel, atomic_state);
 }
 
 static void panel_bridge_atomic_post_disable(struct drm_bridge *bridge,
@@ -294,7 +403,7 @@ static void panel_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	if (new_crtc_state && new_crtc_state->self_refresh_active)
 		return;
 
-	drm_panel_unprepare(panel);
+	drm_panel_atomic_unprepare(panel, atomic_state);
 }
 
 static int panel_bridge_get_modes(struct drm_bridge *bridge,
@@ -740,7 +849,11 @@ static void drm_panel_init(struct drm_panel *panel, struct device *dev,
 		      !funcs->atomic_create_state != !funcs->atomic_destroy_state,
 		      "Panel state callbacks have to be implemented together\n");
 
-	dev_WARN_ONCE(dev, !funcs->atomic_create_state && funcs->atomic_check,
+	dev_WARN_ONCE(dev,
+		      !funcs->atomic_create_state &&
+		      (funcs->atomic_check || funcs->atomic_prepare ||
+		       funcs->atomic_enable || funcs->atomic_disable ||
+		       funcs->atomic_unprepare),
 		      "Atomic callbacks require the panel state callbacks\n");
 
 	INIT_LIST_HEAD(&panel->list);
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index a5879b7b986b..dedd792d2c52 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -192,6 +192,60 @@ struct drm_panel_funcs {
 	int (*atomic_check)(struct drm_panel *panel,
 			    struct drm_atomic_commit *commit);
 
+	/**
+	 * @atomic_prepare:
+	 *
+	 * Atomic variant of @prepare, used instead of it if implemented. The
+	 * new panel state can be retrieved from @commit with
+	 * drm_atomic_get_new_panel_state().
+	 *
+	 * Panels using atomic state can only be used through the bridge
+	 * embedded in the panel, drm_panel_prepare() and its counterparts
+	 * will refuse to handle them.
+	 *
+	 * This function is optional. It can only be implemented together with
+	 * @atomic_create_state.
+	 */
+	int (*atomic_prepare)(struct drm_panel *panel,
+			      struct drm_atomic_commit *commit);
+
+	/**
+	 * @atomic_enable:
+	 *
+	 * Atomic variant of @enable, used instead of it if implemented. See
+	 * @atomic_prepare for details.
+	 *
+	 * This function is optional.
+	 */
+	int (*atomic_enable)(struct drm_panel *panel,
+			     struct drm_atomic_commit *commit);
+
+	/**
+	 * @atomic_disable:
+	 *
+	 * Atomic variant of @disable, used instead of it if implemented. See
+	 * @atomic_prepare for details.
+	 *
+	 * The panel might not be routed to a connector or driven by a CRTC
+	 * anymore in @commit, the state the panel has been enabled with can
+	 * be retrieved with drm_atomic_get_old_panel_state().
+	 *
+	 * This function is optional.
+	 */
+	int (*atomic_disable)(struct drm_panel *panel,
+			      struct drm_atomic_commit *commit);
+
+	/**
+	 * @atomic_unprepare:
+	 *
+	 * Atomic variant of @unprepare, used instead of it if implemented.
+	 * See @atomic_prepare and @atomic_disable for details.
+	 *
+	 * This function is optional.
+	 */
+	int (*atomic_unprepare)(struct drm_panel *panel,
+				struct drm_atomic_commit *commit);
+
 	/**
 	 * @atomic_create_state:
 	 *

-- 
2.47.3

