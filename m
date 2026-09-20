Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9733AAF5B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916500; cv=none; b=ZVvqTBMelWiFBi4880wr/k3YiOOZOKVR8ydjIPUtNuXu9EFWDTMAED8m5Hl7fZA2ebX82JPwv2y34jLuy/JsQ38vPiHaxe2oXnawqcM2IVj1934Q7rf8Q1OZtJALcEyzUfDiv5rbZN0Yu/tGZLoBFeM2Rc3JpnoKi1HeleKezJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916500; c=relaxed/simple;
	bh=WQsv8QazF+E5QQ9hUw9l40V69yXFmn0I2Nu5uJ04hXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qJxQbkoTZ0u2F01U9CKkKGV2wQzBdchpbrYYGzWHXGuZEry6ByYwHydLgT8P8WqSdjwq4xwrBqPx6oObwSSr1ihxHGp1qCJ6NSjv7WmBmumWdz+k4E+Z0+1MMMv0d+0JqtiWvxYOBbVKbE89BwWJd2vHJHkPMnftXs5llhDY5NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VRBBz23x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DTynG6BI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VRBBz23x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DTynG6BI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBnmsY2568986
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SknP0ek61nWxcALGWerlRGpQ+hsm6XCBNnS1Dt62yI8=; b=VRBBz23x/lhTLFHq
	vbgWnynOvIuNGZfKl60nmBA/CnhuqEgT1wDLlE/pqvtl1N5tyZwRdSw1YmxX2UOC
	VrlnWiiVFbnfLfbji0ASw2xVlZlB60g1ZjUCbdrWfUdf+MbR+mSO171p57OQv0cP
	5VL4aZSAMNaIH93DLVFl6Th6V6XyNJgztZYWHEECcZUM/ZxFs/48KsWYp6Bcy1Tl
	qB0ysSK1O1QIin1qYKSA1u95cBe7RjXBRoh1FajDvkvTIyOyHvxp3/ngoa3kqhpH
	wgGIUF7WtadnN6vdCDRXxwxm2/Ju5YAV3j6+5xg86otCMPEhi9FmG7hl8zcqaRrX
	41EkPg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjfuk707-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:01:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530256c61b4so50990351cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916496; x=1790521296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SknP0ek61nWxcALGWerlRGpQ+hsm6XCBNnS1Dt62yI8=;
        b=DTynG6BIz/T2Z5NrzCnQXU24X9w1w5+V7WEq73Ex0pWbBrX110AS2J1Al8TkeVRz7M
         0Vw/cHR8N8Nu1Rhik3l9Cc/2tZu6zVsCQVLpCC93h+UCdQwOR+fXWtLT58lLsb8CrBIm
         g3NfEQndtaq642Pg2MvdyC2AvZO92FNOkl89scCOw+5cbLriYfO9tr1/FB5jasOAh1h1
         bL1TX+zQTh/oVJZJfNsKs04x1dxv16AWbUsbgTur2j7rSpR2A5x94IsaTOEoqP7SB8Cw
         V3JJ3EeoUkBRP2ZHpz6Rh8souRm59TtdHaw64C1pkaOFiRI8c10YrnByII5R5nt3JmUU
         yJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916496; x=1790521296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SknP0ek61nWxcALGWerlRGpQ+hsm6XCBNnS1Dt62yI8=;
        b=mfghCGYP1p7U2tbcPmf9ZkGMpHZRQPaK3Cltmyy0dKFhZAKQJm9stKzmC0mOdW9aXN
         o5+I49wgPyQKtlRh/XZ/HKGoYAPh6uwRDbOugGJBP1FOpWEatUNRFDQSSVBBjkQ1IVw3
         250Fu0SypMKHW3xEjDHwRS4zU+NSazItgraRtQVPzaCSyi6lo+sm6WwFrVBf7RSfpE96
         2BP9PxSiB+k3w1XSEgP15UMRsX0F3t9tZjRVwIgYTtfvrxyxGpZojszgLndd9XHMpwci
         ig6hGx0E92PbktuY0+GZd3uUkTRrD7ALYmSpy07Ebh38jbQbMlVL+y0C+nBXqHr3y0T+
         peVg==
X-Forwarded-Encrypted: i=1; AKwUvBx5QqIjA3DTe/mEleNJSwZ2rZvAvlk+eZHLY+ncTf5xznS0BRjHYZSbBrLaDN2KEuW1AcN2zwYAOkC+0IA=@vger.kernel.org
X-Gm-Message-State: AFuF++n7pYElwwffYhK9raSlT0qGzmwJXMlO/64zJhV4OY75x0I3Bcn5
	DEzfoVb8b+R4HajKFuWSFWlinMzHY3/eP7LT4VGKOMjJzBfa74jXs9XPKoWY9V1CEriAxy2y+xG
	uO53Cq0cpi1YaSD6VqN01FRTraV9mqf2XUz1Tw/qhGY6yG8hwWL8DgChUzOrV8vLzCFs=
X-Gm-Gg: AYBFou1twiap8ZaU3aUarj6HeK9lixt33gQ33ZfOFEeXnZkVuOOl0OfAX0dynZ70STh
	dKjkl1pOys8V4jkeax7uZoIkG/FvDHmR4X/TucwJGSMstiYYr3/ihelm2geiOeZ9dlXoeuI8aOL
	HvFx/squI0gl3pbCoWtikRJU0seTNZAWiwY+TuSguqI9Ds7xuG2rQCO98EPZjqPBuJsS7BeBfyN
	BpxzyNoGC0ieHl0GYmZctWzhZZ9nu8+Yt3ItRee0Yp2KY2X95AiVbnIObyRJKkKdgLkmoGpxGT/
	MNjPW+4fotWmGvN6VbsWHUGttn17LQd2zxeDEBV7HUOAejmhlSxcMtS5uVjD5j2jt2wDELxMI65
	CGTli4NMhSO6JreI0COvlue7hWPzZRCXyxm2nDEUtWZHxxjqmGD9Rp5kFN2HX8VbCr348jklzwS
	e0GYl75zX2twy3
X-Received: by 2002:a05:622a:4d4d:b0:532:9f22:3072 with SMTP id d75a77b69052e-532b732a721mr69391691cf.48.1789916496015;
        Sun, 20 Sep 2026 08:01:36 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4d:b0:532:9f22:3072 with SMTP id d75a77b69052e-532b732a721mr69390801cf.48.1789916495488;
        Sun, 20 Sep 2026 08:01:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:26 +0300
Subject: [PATCH v5 1/8] drm/connector: report out-of-band IRQ_HPD events
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-1-ff1de0090c72@oss.qualcomm.com>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
In-Reply-To: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6882;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WQsv8QazF+E5QQ9hUw9l40V69yXFmn0I2Nu5uJ04hXo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VH7SDFu/E9XO4Ljq+GFlzDqUHCr1Atofft3
 XNL0tySY9CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1RwAKCRCLPIo+Aiko
 1WqsCACd+ETHhlHes6LYxN908aTCxnlg8YPDwcAKEl6ccZM/R905V27dwX3LkSnwi67C8bbG7yo
 6Sz7dGScskcTUID4khs3iJVPJclCXA3GP+P+f27/HhozuwQqbrSXhI7oFP147QdJkrW9314X3oh
 qHB2c3dQ51Lrcop2wOnPS7CthWnRqjR7xh0bJNP/golUD+FZ+zOxyPkMApKfehCTNn/6l3kaT6G
 RK04ujgV9DXHYgfhNXajrWrhFopVdRQDqiucqCGGNR4NgzjVQCay+H1Ok0jqJ05MpyCj36wIEcS
 pnjwTo+kxGzrCrgMZ9G3mrP+FF+AhQ+7pS4JAuhkR6+dgHjh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfXwSnPxbH2DTsY
 mnWajcjfEzURSgtlp/M1F6lrnrKyWLLRw4VdL0x7km0RzQTnPEiD2CE24HGUXDGPtsFIOtlP9UF
 m+uRnz6rjrWxbeQldE9W9Aj1wZ8GaeU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfXz1LVQE+paq6z
 6cbXZfygw9IsCyplOxP4jWuysLLSjoXeyvjy6EBZ+RJQTN/o6uRTmPN87759FTGV76IDBHeApzt
 kPpLTn5+Db3C0rm3X8mQDeXsINU+f46e08EryerI74bP+vo+jj/76LQB5v0jMRpXmkgL4k9Bmwt
 uA2QIyClkuZt9rRC/Id+A2BRZMayUaD2n6BDSw6mwwk35zbctz+PywTKLQ8uwW7aIK6heBbNLdV
 +7x11xNptd4vZ/zUdw+FeJwlmnGCdrd6DdQfp+B0f3xBlY2fYT8htH839bGl4RFnhRnecc3l7P+
 RsDd/bhYqtF/IoFNqNGid8AZT+ehsxgVCMGE4TdnyDIQ/WNVW3wE7WpASe8Tta3VraTGJMUsFli
 5PifPzVOvGkE40OiuQqYr713UO1Kz7zWG4JMjaEusVTe8h3YwBGZjaP7FKsA01AhV9F7IWDWaQp
 FXfRPxaJE2E7FzZcGow==
X-Proofpoint-ORIG-GUID: ytkFT0dqRtIJPN37rlkETQjwbg_E-htT
X-Proofpoint-GUID: ytkFT0dqRtIJPN37rlkETQjwbg_E-htT
X-Authority-Analysis: v=2.4 cv=QKv91QLL c=1 sm=1 tr=0 ts=6aaff550 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=m8VRbRV2F-575zZTFkcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609200219

The DisplayPort standard defines a special kind of events called IRQ.
These events are used to notify DP Source about the events on the Sink
side. It is extremely important for DP MST handling, where the MST
events are reported through this IRQ.

In case of the USB-C DP AltMode there is no actual HPD pulse, but the
events are reported through the bits in the AltMode VDOs.

Rename drm_connector_oob_hotplug_event() to drm_connector_dp_oob_status()
and extend its interface to report IRQ events to the DisplayPort Sink
drivers.

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c          | 20 ++++++++++++--------
 drivers/usb/typec/altmodes/displayport.c | 23 +++++++++++++++--------
 include/drm/drm_connector.h              | 21 +++++++++++++++++++--
 3 files changed, 46 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 8b4baed060f3..5d4945ea1e95 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3672,20 +3672,24 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
 }
 
 /**
- * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
+ * drm_connector_dp_oob_status - Report out-of-band hotplug event to DisplayPort connector
  * @connector_fwnode: fwnode_handle to report the event on
  * @status: hot plug detect logical state
+ * @event: additional event reported by the sink without changing the HPD state
+ * (or in addition to such a change).
  *
- * On some hardware a hotplug event notification may come from outside the display
- * driver / device. An example of this is some USB Type-C setups where the hardware
- * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
- * status bit to the GPU's DP HPD pin.
+ * In some cases when DisplayPort signals are being routed through the USB
+ * Type-C port the hotplug event notifications come from outside of the display
+ * driver / device. In this case hardware muxes the DisplayPort data and
+ * AUX-lines but does not pass the altmode HPD status bit to the GPU's DP HPD
+ * pin.
  *
  * This function can be used to report these out-of-band events after obtaining
  * a drm_connector reference through calling drm_connector_find_by_fwnode().
  */
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status)
+void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector;
 
@@ -3698,7 +3702,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
 
 	drm_connector_put(connector);
 }
-EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
+EXPORT_SYMBOL(drm_connector_dp_oob_status);
 
 /**
  * drm_connector_get_color_format - Return connector color format of @conn_state
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 51c92dd887ab..344a13c2a296 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -187,9 +187,11 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 				dp->pending_irq_hpd = true;
 		}
 	} else {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
+		drm_connector_dp_oob_status(dp->connector_fwnode,
 						hpd ? connector_status_connected :
-						      connector_status_disconnected);
+						      connector_status_disconnected,
+						(hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
+								   DRM_CONNECTOR_NO_EXTRA_STATUS);
 		dp->hpd = hpd;
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		if (hpd && irq_hpd) {
@@ -211,8 +213,11 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 	 * configuration is complete to signal HPD.
 	 */
 	if (dp->pending_hpd) {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_connected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+						connector_status_connected,
+						dp->pending_irq_hpd ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		dp->pending_hpd = false;
 		if (dp->pending_irq_hpd) {
@@ -396,8 +401,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.status = 0;
 			dp->data.conf = 0;
 			if (dp->hpd) {
-				drm_connector_oob_hotplug_event(dp->connector_fwnode,
-								connector_status_disconnected);
+				drm_connector_dp_oob_status(dp->connector_fwnode,
+								connector_status_disconnected,
+								DRM_CONNECTOR_NO_EXTRA_STATUS);
 				dp->hpd = false;
 				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 			}
@@ -844,8 +850,9 @@ void dp_altmode_remove(struct typec_altmode *alt)
 	typec_altmode_put_plug(dp->plug_prime);
 
 	if (dp->connector_fwnode) {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_disconnected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+						connector_status_disconnected,
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index c61345e6fb08..906aaefca7e1 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -91,6 +91,22 @@ enum drm_connector_status {
 	connector_status_unknown = 3,
 };
 
+/**
+ * enum drm_connector_dp_event - additional events sent by the sink /
+ * display together or in replacement of the HPD status changes.
+ */
+enum drm_connector_dp_event {
+	/**
+	 * @DRM_CONNECTOR_NO_EXTRA_STATUS: No additional status reported.
+	 */
+	DRM_CONNECTOR_NO_EXTRA_STATUS,
+	/**
+	 * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
+	 * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
+	 */
+	DRM_CONNECTOR_DP_IRQ_HPD,
+};
+
 /**
  * enum drm_connector_registration_state - userspace registration status for
  * a &drm_connector
@@ -2703,8 +2719,9 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 		DRM_CONNECTOR_UNREGISTERED;
 }
 
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status);
+void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event);
 enum drm_connector_color_format
 drm_connector_get_color_format(const struct drm_connector_state *conn_state);
 const char *drm_get_connector_type_name(unsigned int connector_type);

-- 
2.47.3

