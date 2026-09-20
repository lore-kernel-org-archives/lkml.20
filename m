Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92FB3AAF6E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916511; cv=none; b=KDfbzDrhl4gL9oR1X8fhLWhGK6bWytb2W5zXD5/HejTlfPlQ/S0O7G5JbANTeQwfCF6MJeC9prAwXnJZaxXUxjTQnEOAyYFpiL3ncIX/rW6n6yVbiPNrEnD9+LAJ5G3aH0z4xqjZdAu58FAiCor7nxNNe2lAye73SLf38WDhJeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916511; c=relaxed/simple;
	bh=IHP/CEHKbEjbTAclh8cTAdfCEyItA+qP7FeirdUUoOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g/grn0WaXACSKCA0iWvRan2h3ZVEld0Lt2LV34mbyn/xhPlCY5pn8UlZEETupSkMDKy45eI93WNuYZjYobULiDoYtxBLEer8yNUFikQxYeZyzp/hIlTQia2X3NO+4m26PhmT+D93433+HH5BZbyKyI7wp2YjV3TpHgDI0zRrDM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXC/ueKz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDFiqNkt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DXC/ueKz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDFiqNkt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBoKCg2288607
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=; b=DXC/ueKzIq/kzAF9
	rFYqtVTFD/hrOYA2YzaXtLkcnUoXM2sFtzvQtwmd/9/ZSZ6Y/3CFQ8sg9RUnOeiZ
	RFVYdj9zMPsAnhI8p9o0mGPf/Wjr70Pl3ScG0L/EVdMNh78/beTatZcT9xf7ZxHd
	yD4hZW/OZLFu8g4dTZs5GmNjUuiDIqK+mWMecon6ao0P+rvaBAPtwiXz0wzLzBsU
	EthYaBSLNRtrODbJ8MFm/30Yo8KRbDC+8YVsY6Yr1m8vDa1DCBDIAx+ZhiYd9mwY
	rN3XRbVxjKOVnk8EYpA0uXNwGP3mMuf+mfD9AGoK5uhIrsAwuuf5AHCBxIbAp0Hv
	R5evsg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrnujhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:01:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so68173301cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916507; x=1790521307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=;
        b=RDFiqNkta/zTYZtlwTJwe1lhPgFCE9QGprC+fFiEPrgD7wgmBTpAVaMTaOAXf7Z4SP
         3evIQD7PvBNynOQmBOTR974I3UCwlQ96MYM9Z2btO9M5TA7Kcf3fPCIFGp7h/G1FPGwy
         H2VMgJxKzmM9CBeeH5qcbRt2URh27BpJ8uVWeoVLTh+9VKeeaXffPWMzQ7Vg3Fk13i/W
         ZvqGTfIznijfL79odua2xOjBSU44BulKKN8zxnwoovjcc1oSofV/HpC/CYXhwkPAhOg0
         dbJuGd3hthU/Es8D2izX5EDv419EcNE0Iyr59VQuZcO+SCfS87xF1J04VFv9xco2p928
         p8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916507; x=1790521307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=;
        b=xuevjcsgIExB3HURqCMDYtDJXUzIh0D4UsnWmKL9WpqJw0OaW2s532WCrkG34H03jP
         iAGmliRjtZjCWbs4iQ0oJFVs8Dn+Ioe/mTrufDHy594tKyEv5l4u/HTe2l6CaNYgtP5g
         ESqxHKRu2QvGsxndvvzOjjVp72QH10Vyj+xx07GeoEMNykPptyARBV2GlkhczDxXFZDU
         XiojFfEVLzRLz6TOH8Kr0BH3H/Mr58RHRqE0VPN8jrWALASwdT3+wUt0T6hCxJsHJpwg
         8aAWixYxr/9ou8LkuCzmo0B4IrdYp/J0z+zIr8LJTvSoMeIgQ1ozbGbiHmkub5PwRAQj
         pBnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcoCWYAWDlWia4xB3MxyrxM904ukV9b/0vLqgdmDMer90eNzKR9wSma9MeaGAAIgD4uNitavxuYiLuLl4=@vger.kernel.org
X-Gm-Message-State: AFuF++k4S1N3EHFUgDpXZqJ9gTPdvPzbjmvxox6BYkQSJOQcwBMh2vtJ
	07+Ak7JBXy4EBmnwRxb0E8RMmpO888MbH0DT/RR4fqltDbjLvaMSdEamV2UnaMyZviXUh0wl4vk
	kAovZgep8fP1gReMoOUAaRcWgrD593TtglMUbv8rBv9uekLJp8lbvOtuOfO7OAeNzDtA=
X-Gm-Gg: AYBFou3llRy92gC/r6wVp/E0kjaBaPFET5W5V9L5LzUqJoW+7CledDwaFvBMNvCLi6t
	JtiKh65XrkmOIX3qtM116WmPls5UXRKBAsuBJoBu103fJZ8NvbJQ5p1/UJ+43b+rPs3Tfvi6S3j
	6EaPkAGdgoJH2XanhypwdVTK33+n7DGvKJn0p6sWl9VBTG90pMypPnh2jm8NHO6lKJqVft7n02a
	VVmS1fn081xBQH/YgYIV1vFC3SWmmmPeFzLcIaQR4ZwQx0z/Pq+yw/eiAHsXu7kdmNmc53Ev3Ry
	2V9tc1Oa1Tui8g3alO6OTHrwc8Xzeh/vM2V4Awix5G4cFxJz0PoGskJymGdV3YC/dVxZwqZbxFU
	AkLcL02YvzPrqGVC7ZACvA9sH5Zeqki1weH5l+04xYxR9WhI9x2I4lg7PH447IH3NUnthgNhs+P
	M75O5XDyYL/zh7
X-Received: by 2002:ac8:5756:0:b0:531:10c:a525 with SMTP id d75a77b69052e-532b6f9c339mr59088201cf.0.1789916507131;
        Sun, 20 Sep 2026 08:01:47 -0700 (PDT)
X-Received: by 2002:ac8:5756:0:b0:531:10c:a525 with SMTP id d75a77b69052e-532b6f9c339mr59087721cf.0.1789916506618;
        Sun, 20 Sep 2026 08:01:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:31 +0300
Subject: [PATCH v5 6/8] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-6-ff1de0090c72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IHP/CEHKbEjbTAclh8cTAdfCEyItA+qP7FeirdUUoOg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VITghi4UzzRoE/FzgfbEnUTmORHJmboGa52
 XVMK6F5wo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1SAAKCRCLPIo+Aiko
 1Sv7B/0YL5DFJ/q87OBtIjQCInHBNjJWVturTDYh0TaYHFvNJxrU6AlpJU7OUMxKsZfCeqyUQTp
 CLdTznZPfsk0pHv4sgAH3ivr8voWJgY0gF9WW1EDhy+P4p+MTBHcM6fSGNNsIxaGRc7ZDzEWqYJ
 ZrusLtSE1bZYR78wlMziU9RHUX5W7lZPN+sZ/zgMF3FdhkI5Rg4LVp8wHKA3aQLQ4QWGBQ9y2yu
 PfH+vAfW7MsNUXcAVZ0L3QCDqaZCQ5D86IfEyPSfSumHYKRgKikqjEy9a27zrbpMhb99EoIaIMA
 533IC393BTUb0jdbU8nuR0DF7Xsw2gXSG4kvX3t3JpEU/nx/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aaff55b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=kFJzCQJ8v3RGWcIHJrMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX4+KzMWmida3F
 TGu5u0lfSt+4PPMLnTrvbzbwnEWBoRkRD6mNMEl2py5nIAhklbMmykacv+f1JpWmsPEuo60P2wl
 4mBoHD4gTcQ7LzkJ7veJo1Ci2TuCOf4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX89xwymHqzBuW
 1MZkgNBFsCuoOY4D/bP7IdpB/dPV0uBYKlWtfUC4Q1QPPRwEx1B3VzCYpjSlpw3hv/64JIGNbuA
 p9eloSts/XlGdzHI4qc9QgdIFKroPN3oPRFDcAVyXLzXZmu3Jws9Ro9Fm92PplszytH6n9ZzgYY
 CeI0XLGrHRVI/9GI4ryEbkqRJP9H4YaGScFFL8/Ol59gE43ApuibT9Z/4stCJ90mm+555omlkRe
 vKdHD6oOZ5kTOwIrC367A50VfBNy8i2pCfgGm91MoNiwPIJdNbpSgvXGK0+1Yi8LTyaIXnhaopB
 7A6oEauQ7RnspTH1VlHEJSP67+ompVNtdWrluZc1cuOj2ml1WZwjvB+ocNFrR2VbsOgsdt3bUYZ
 Qf4r9QseG8wIW3gXZe2b5ooPIXUBpKugOzIR7XUsprZc+uyW4UcX15A9vi/s0j/4E/GYvZ4hMV8
 IR5hYt8JpZW6eH5EIAQ==
X-Proofpoint-ORIG-GUID: BCMNQeoWj_vBiBrOYJc7uRhZojS0WRRe
X-Proofpoint-GUID: BCMNQeoWj_vBiBrOYJc7uRhZojS0WRRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side, for example DP MST events.

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9308e373447c..a420e3d49928 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1559,11 +1559,12 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		   msm_dp_display->connector_type, hpd_link_status, status);
 
 	if (status == connector_status_connected) {
-		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
+		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
+		    event == DRM_CONNECTOR_DP_IRQ_HPD) {
+			msm_dp_irq_hpd_handle(dp);
+		} else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
-		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}

-- 
2.47.3

