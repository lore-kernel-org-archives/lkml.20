Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F75F3C4176
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916506; cv=none; b=COSp+aUkbWqHEixs2za9k/PnQenpQVkr1ItxoWmaeI8Hb+Hqo0HWNOFTO2fu+u/LlmYHs+KYyIPvfJLrjjwCXd8kbOi9RE+oi8VZ4U3abgSmg+zjn5uFCiGXYoPbbXql+q/8cvcR5SqmYhbVoEO02zD4X2050UxmI1MrCmTXh4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916506; c=relaxed/simple;
	bh=W8+dSW1VgSZF8q215iEdhBX5ykoFxgbgfDkuRRpiXGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HoKJBo/e9V9LVVj/KnPobmgWAkIliq3s11J6sXHVUAOTR2PrPLVt5fm1RkKiDWNOagXoZIk3WwaOPK+BRJ5Tz1f3F/hKbfdahz4wK5TmA4R+Xfju2MiLnzgxQ8JHDuDnnaKY19Jn3DWkH71sE5w/z18GYWxlRgwcCJ2Ejh6HPzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1mNjvbu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMyGazA6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1mNjvbu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMyGazA6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBo1WC2910056
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zStCBOCZUCMVPqW0oCjGuFnFZLx+MrPRud3qOX6ra0Y=; b=i1mNjvbuWlpROKjp
	tl2Av4keFL0peAw2HFTxnLXUiLxn8mKQvgtfq0/h+3+3d4Vk7pFERuCXG/uQ5BaR
	A7zU0GdXT3bwjEWGr1pcGqXLKYpRZ+GcdkH2MPABg+Rx0ZY7J4Wg1q0PDEcyC8EG
	JK1kh8QGfXlaJsP4r4grrDyDDt5iqDUKm5ocneMQEcB/aEZyHpkG9SIWRs0X0BrH
	jAIi7ZuegxB9XjW6DheaqyiS1zT2Hev2RCKzur0xNLPd5FimQ8vZMRhPvh3DpB7n
	DXuoQYT7n1P67fAEfwlpe/j53r763hxQ3wr0MOm28pLM3mTDCrg8qVf2qaCnDjmM
	m6IGpg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshyxu8ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:01:42 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-79014f0b44cso2029413137.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916501; x=1790521301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zStCBOCZUCMVPqW0oCjGuFnFZLx+MrPRud3qOX6ra0Y=;
        b=EMyGazA6PHmSIRUjSY0TstEMEUj+lIk3nAjok22GZtMPEm6m5GpVYMcPiWu6X3wbAj
         IWFhMyETMF+oizEYIRZGLv41/aAW+INM87y5tA6lbfQGBdRHQNwhdB6+6YGLFJZt/H9s
         U23FfRdXCNy8knkHJ+wN6SRYJ6Hz3UOI2qYo9z/1i3xjD3H+XvaBvSjSReM6y3zqhqER
         uNUJeylpq5dk2tBExIbmyX4STKTT7Q4GmF+vsDv+AQYJhyxpiCTHA93Sr0SFGCN/NHqi
         T6gznZmfXqa96MWYxiTXhi4CqB/HWla2TwwF8MoaVZpQVZ/oclsuDgmY9zY9+vPomDWx
         w3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916501; x=1790521301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zStCBOCZUCMVPqW0oCjGuFnFZLx+MrPRud3qOX6ra0Y=;
        b=FBwYUhDuG4BpcQmpPhAniDIRnVd3twv8HvM3VeMC2OIf6z68oz4Fxp3+DGQaPAOzjD
         4DE6mYWGkwCdk+5yaJw1ZuKf1nQI+tum/37YvMIB0g7LoQVQfpenWEc4c9ivcCs2CMck
         YzoOUiHzzleTgq2hVR4D1rJACBHwoY0UDHVnoyrSoVex+XSTm3KCLBEqdK18fXd0O5Vo
         2ogVDTS34iA6CMARfNkePyQyVraMfQ+SYGabNKdBK53dOZ5wCuoTq4r7ExQnr/S7+6Ho
         MAqr1bbv7rDOxMxv+99iHI1gcQVgtKceoD61Wh5pXiTC1zRERhXGP8EITPcr3a9EJTyh
         oqkw==
X-Forwarded-Encrypted: i=1; AKwUvBzBoTTwgtefcNcd4kQtyE5ymMABG5xFvKgCtm2GQWqauRSuEyAyXnxANB5nnvbaGP9gjzzJuOqf9uoe7X0=@vger.kernel.org
X-Gm-Message-State: AFuF++m+Rfg08XGJMaorJ/3h6kzow8uXuFR2LnlgtI5HmfYMxRFVkg4C
	lOKyBGCyxoHcx2A2e5SnWo8PQ64B9sAEJhEifFaluXNQ3pDPk0BOI0FDKkGmXwIYj0tlFNTwKYn
	fyG0T6tEIiYV6CmdQpvKRU2A0p9Ip2NjL1FXI2P4VwVnlKhVIHrWOwVInDozZh8kJ3Iw=
X-Gm-Gg: AYBFou0vrhHJWcNBMm9dsgs7z73l9COsRWVv/Y+8Nf1Kai912PTDVOOVc02VSBpbqcJ
	C3bUT7W6A2/4y9WyffXg8EnNLFP30+MhDi0LbTQE/0r5R5KNogPFSENdkPTN7rHvexgGmlUXU9M
	s15ls8OH+qdwsR+xUWNnApvjJ8+kFrHbYlo7h+TMa6X+COAvGJTJTElcKOKMMS3wWlvI4SlBLgu
	Kn9984d2Z9DBoiTBUMIrXwUAI7VpQHDXteOYSO1LW0cctyfhzfA6xqRu+e1dtL4K4l/3LrjooAD
	mDfO0o4NmdLU3qaAP1ExZ9gyLbnVyVyal0RU0nRmSKqToY4OdWCHBqDkjeTcRhlmnphGwecZCvE
	MUHfNmlGOn8n20VNwklo3//WLCjIdG1j/QrNXqRh93aCyTEUVGEbuI5hGoRX4QKGucccwksZRCb
	DiqCgiyZpzg6dt
X-Received: by 2002:a05:6102:8027:b0:7a2:2068:6e37 with SMTP id ada2fe7eead31-7a55c28ccbemr3816298137.15.1789916501318;
        Sun, 20 Sep 2026 08:01:41 -0700 (PDT)
X-Received: by 2002:a05:6102:8027:b0:7a2:2068:6e37 with SMTP id ada2fe7eead31-7a55c28ccbemr3816245137.15.1789916500850;
        Sun, 20 Sep 2026 08:01:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:29 +0300
Subject: [PATCH v5 4/8] drm/bridge: pass extra events to the HPD callback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-4-ff1de0090c72@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5637;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=W8+dSW1VgSZF8q215iEdhBX5ykoFxgbgfDkuRRpiXGs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VHeWln0CRT8ndJl7DO8mpwH8QQf9pokn6b4
 h6oSogFWHuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1RwAKCRCLPIo+Aiko
 1QdFB/0dCly5ef1TT2JBJq7MbiOMvtgxWTs7fwcZmOHeIrtXQCDrDLrdsdkK9cUFFX8uIU/kxxe
 PFQMDQFdm4FVA3BGIf2LVEWspNgrvGSJaYE9cWglW7QkdD9YjP2Bogl/6qY53ZUQ9B0lsvyH3Tx
 c4A75hrKrpk2+hRKKqziW8w3HwY2lJwSJDDf7C9FTfrZ3oSUw+HZPI7HXBB3qrTS87hbdJA+/e+
 eOCHYDy8ju9wCEgcMI174ZpLPOr0wDE3aV2qONKItsWfZvG3LxkV92cledQd8HWrN5vwke/Cjn/
 5SNKSrKGv4g1wOJWZzq8p51qwhA3fFhQ7fiKRb67FwKIq8f8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=PaRqFShd c=1 sm=1 tr=0 ts=6aaff556 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=m8ToADvmAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=x0urvBsf9yKnxdYdiaoA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfXymANeJkF//Pq
 FXiy67nfd2QuUoG3opkrpOFtj9qK80ocpa21rq0VUJl0QnPqjE2geI5GdzZ+IPosf/yKsnVkQYv
 u/yCmHXez5VW/2PMHgsTgvF1Tm+zqpA=
X-Proofpoint-GUID: 6cuciPMtPskGhQ8yn8_yhIUn3pRjuwfD
X-Proofpoint-ORIG-GUID: 6cuciPMtPskGhQ8yn8_yhIUn3pRjuwfD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX5HFkwmVqOuu9
 BWBuNKLeFif2Oh7iiKXZPmK3NhVjUh0thoxaHxQkBlOfWtPrpxEMoQSCQPyMA/J7/gMbxAjkuTL
 mb6dTTfjy8/dj6rNZZExNsHyDkGqUu81DKWcsau55Kx3Qy/EefJNw1R1XztRZ9rtsBPnaHX/kCi
 qtJA0UjG0A4j/80CQsWmWP9jnDjcrA33/ovUhM3/7EvRlNKR/STWWEe+7Y0+G5IwgjfAEf+q79S
 M/9WU8I+tiI1ykSG7YaDgBGUmMGj1Zf8Ul3jPSxgE4u0oVBwiVVzY/kl6SB9O4+h5sBJn4Rdb0W
 lf6DGorosrXbmNY7Ht4cfD+ZAcdaxBTkZ8KV/69gWrXd94/BR5QzECWTp2gjyK8nVVuHWwWUwrb
 5BISukCBNNbETiMAIh6uvbVVfppANswH0Lz1b5uvKD84ZK0z9WMT1xnwjp4/4MNkPOh38u2z4+g
 loJ/z6wqlYgEsEzl60g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Bridge drivers report these events through the
drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
callback, specified during the drm_bridge_hpd_enable(), letting
underlying drivers (e.g. drm_bridge_connector) to receive these events.

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com> # lt8912b
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       | 3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       | 3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 5 +++--
 drivers/gpu/drm/drm_bridge.c                   | 5 +++--
 include/drm/drm_bridge.h                       | 6 ++++--
 6 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index 4bc64b2885f7..deb5d510a616 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -258,7 +258,8 @@ static const struct drm_connector_helper_funcs ch7033_connector_helper_funcs = {
 	.best_encoder = ch7033_connector_best_encoder,
 };
 
-static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
+static void ch7033_hpd_event(void *arg, enum drm_connector_status status,
+			     enum drm_connector_dp_event event)
 {
 	struct ch7033_priv *priv = arg;
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index e347d04b7b2d..82f5232b4205 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -506,7 +506,8 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 	return 0;
 }
 
-static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status)
+static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	struct lt8912 *lt = data;
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 629ff7095e87..03dbb449e0a7 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -110,7 +110,8 @@ static void tfp410_hpd_work_func(struct work_struct *work)
 		drm_helper_hpd_irq_event(dvi->bridge.dev);
 }
 
-static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
+static void tfp410_hpd_callback(void *arg, enum drm_connector_status status,
+				enum drm_connector_dp_event event)
 {
 	struct tfp410 *dvi = arg;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index a51567d19550..f8aa2dd1cde7 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -171,9 +171,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_dp_event event)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+	drm_bridge_connector_handle_hpd(cb_data, status, event);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 58927e0d0191..34871e5b0328 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1549,7 +1549,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
  */
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data)
 {
 	if (!(bridge->ops & DRM_BRIDGE_OP_HPD))
@@ -1625,7 +1626,7 @@ void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status);
+		bridge->hpd_cb(bridge->hpd_data, status, event);
 	mutex_unlock(&bridge->hpd_mutex);
 }
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index d64a0ab02c90..ed9f77a2597a 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1158,7 +1158,8 @@ struct drm_bridge {
 	 * @hpd_cb: Hot plug detection callback, registered with
 	 * drm_bridge_hpd_enable().
 	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	void (*hpd_cb)(void *data, enum drm_connector_status status,
+		       enum drm_connector_dp_event event);
 	/**
 	 * @hpd_data: Private data passed to the Hot plug detection callback
 	 * @hpd_cb.
@@ -1467,7 +1468,8 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
 void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,

-- 
2.47.3

