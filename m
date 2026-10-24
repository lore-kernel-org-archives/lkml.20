Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802161;
	b=a128WS3Eqay5DbyyW+hosoguLxQfuMwSgn9idOolFg5DMKc1sGcd1s3J11yttfl3Byse
	 5Xg4EnfmLe9NCVnw41jE36jTxSchQpgO1f/gVc/AJe+QCSt+jmNi8pJd+/lCebinutqVU
	 72pNmj13E7f6Ydi4xi46LL+/xU4r9Et0OjBGqWbf/U0YOERGxy2yM1fCs5OSnIIqaXe+Y
	 +p4D4QglwKeQ8fUpwOZXvJAwGJWFQG8Kxi0Z4pIfuUrrBqUoB1A7eEHxasG4NHWHiISIC
	 /KG5hox5lvjB8BT2UmuvaF6+wHoOZtwqiqUBKZ9vtY6NzXuog2vNobJymxSJVp9n78g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802161;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
	b=Rgxgk4JavIcVtTlhDTJipo9Rbyzny68ReWcwiCIri+mvYP/ooYeSlDtwbNm8QaqSBTP/
	 AG6/+1mQRdv+Pcl+dwKy8fwXmJCYoBr3bmFP/lOoHtXtNamZedqapI1xVHsnCmJrHJV6X
	 sO82T1tmhudhfUWOZBdBT6XUMbYaXBRMox3jA6a4iHNo2jhTKgrW1pDdw/hAo5OP8pjDC
	 +aIPVJTLpd37eQq6MfGvKVIGrO21c0bPqvOHsdtBfM8JYhg9HxiGbqtUHmgxFSnCpYCuC
	 RREXNtJEdz2s9J2/XMDgJYAnBnVHAm8RXgaTxqnr537dzQyNZS7DBFu9ckn0IXPujpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nitdk4fL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kve2LYc+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B0F606A32F
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21B0F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nitdk4fL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kve2LYc+
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O0Js8a106716
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=; b=Nitdk4fLxCYglS5v
	lpNE3xcYM0PqcPyymcS/VsKjtz9XRBd2fGGM+MttgQ23j4E3RvdXlud5yqSlf8pU
	p2DAz7X16VzLG4CZ/eflG8HzWlkYcaXYdZMYdZOqcPOE5e3JrQVm9A9FZ3YuNstc
	zEjksrxxleEr/nNnwQ2WvQC1T+MQ5thCConlrJlwoBa75i3NjcCHvEE3s/myQl+F
	AcL7XQ5TZg54z1WL3z52y2LhJd0vEJHF5BKNlnByZztXx4TETwsmhkmvXYRa8X01
	W++kkmvGBq/6VIhEQ9N9gXjl1cpDba65rBu+hrppGCwYlCAbDG5BIFyzJmbMG0/M
	I3fbTg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgj1p8140-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:35:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f62934ef6so338324085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802159; x=1793406959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
        b=kve2LYc+goJW2rXl9ZH5plkgEHkBrcRVjmCEutiHzcFmmEnZ8agxzxAL6uX2hIhSdO
         jN9KgLoqMoKPwcfb44KOQ7iwKdoIYxfvWls2plS6R1N1afTSW3JxU80j6MBGVF2bOEQM
         8BCJJYa7IGLD0HP6egKXSAPVoJXbZEqMrFVgjWLzh+tsWYBgNW9Gi3YdpGYxmuwRxN46
         YIEQP93lHSWiccv1A8I21DxRRajKc1nTJdsJQ1coBZbWnuVDmNV4EvzsHWib0OuOxgij
         PoqPh1jjtszyq4yXCdbsqAmbH9QvdGmuJDC8E7dhvRd1eJKUkHL7Mn7IKY0+gjEfMaY+
         jZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802159; x=1793406959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
        b=vxDfuUjQ3Ld3AjbEczA677Ge49+LZnDI8i1LndEt6l7cuHxAq5ZGKexukvLOcZTtDx
         ab09BfqenhtqVaNKwBNH03ISECj1EMYafgVMA5KFa/WkGxjQ4tFePc/HBrypD9y727Lr
         gWzapNOqSdzfS90BZH/T8ynSrE0btWn7HH//P/VyB4octyr/FxH843K8Nm9F13rEV1Ei
         L/1ph0UQRzCGIIfViiRSH3z+v25AFdD4ib+EiOs/iZE6CwKXb4hMVX7CPFlfQEX5MPs2
         cxcpPf0FlAHl7p8nutE/I8bAX7NPaOLrY8GLiTF4N32IeLkhUl+fCpACSQV7PM9v6iI8
         Zn0g==
X-Forwarded-Encrypted: i=1; AKwUvBzSJtX91jinZczRd0B8A2iaKRbZ4+sdqcorE+3QL/BHJvRZMdz8YeFq4/aeip06LWzgRQK0dXeh4l8Tjm0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxZRqspQYx5W/X2BCJhRXuTHUhxTFB+fOlbwKceCmA44Ify0j2
	GnbNaSKgRb6Hq8wzv6PI6yolZtmGavHRrsrd+usLL40HzjlB6paXcIdpveu7t7L7/bV8cYNIS/5
	SAV0mt1vwkcysgsqGpMpB1o3daan9O8T1oCfLAfyQns8slpWPmZ6ju1jqNbmKiWIaQfk=
X-Gm-Gg: AYBFou1dQRYDts6czoZtrp23YdP1H9w38XTtyVbHufVyWEo0Qh4CUFki/IjTgTUR1Br
	jj+CeSelO+q3MnTifg9K/p1g9B27XSkHgs70qHi/YHBCv9d6UP+hu0XIjXWcxaFRlYzt0iNKXq3
	iMfBPDRutWI8hEn5EFQA2f5WcmVrzzoLoCKerwrH1CUk1rT+MjgqMaNhFMXkmVKXhCxFoJaDcOd
	KRJDD/XrMI5tLdnFATGCt37X5tWhDUuZSN0Z6p+PIx21X1e7i9fSytMEDGn9cl44ExvBeWL+CZI
	BJ+0g0YkYqVo1mor9zputH9XPxhauIzS7IIU7qc7vQEZfoHzJbjaXETC1TAaQQmjZNMbtP9U5RM
	hh0fZ5QDZcO6Wg/jJyKT5WUF8vr5IOVZnyClE/Ihq9+N3u0aGQWvP+oDo3oJHBGOjRSz/7QTEvU
	9Gs3bCUe2k3L9o
X-Received: by 2002:a05:620a:4728:b0:93c:e83:6ba4 with SMTP id af79cd13be357-940ef8b10b5mr103663585a.25.1792802159317;
        Fri, 23 Oct 2026 17:35:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4728:b0:93c:e83:6ba4 with SMTP id af79cd13be357-940ef8b10b5mr103661585a.25.1792802158887;
        Fri, 23 Oct 2026 17:35:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:35:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:21 +0300
Subject: [PATCH v8 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hpd-irq-events-v8-5-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
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
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
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
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4192;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BIcHzWfG5902z+M7u42M0vyUpcn4l5zulhIbCsx30p0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1Rc1jx/WVBAxhw3KU26OrNO85SIxkJhkU7q
 NYdX6NMwxWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9UQAKCRCLPIo+Aiko
 1YRyB/9LbMVmJl7aI7tpQ3jFBUMEiNWDbwwRnlu62xPezLv+SehXjKyLlaYUYq036rwE5Vfn7fr
 fjO6IAXeOJobPd5Ps7ADXWTuF8TK4SEkPazkCfk3+c0JqmcwguNt+U06PIDbhMme9q5VezjPLra
 KP2vD/cNIA8QWyiywCqlwJCKmH8WevIVz1NOx+lxbvjX1QJpGxYVM3sXjkPNBOvimQHxjdbWpNY
 yeNR0ZAJMXAlQmPkYIepBREJkOnaUQm6YNANcZHlAKBfgxog5KDW4y9avHL52SAu/vxpuvUBpni
 T9nszAnpxs5dD5mJCT1ZSn++ImmOCpc1qsnP630ey/8TOX2b
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMCBTYWx0ZWRfXwxWVKQZGNoPy
 0eN1fmrJ/uTCCsRQA0FNj3DPfei+POWXLZ+dPJxLeYN4t/btB3KZuc8dQonIcIxLx261MHllVSL
 6yxsgpKj/vRG5H1E+trUUQFbT4Pf3OE=
X-Proofpoint-GUID: V-LwFYLv1XILIINRzJ57BoUcWdT7i6wP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMCBTYWx0ZWRfX8fOsFpSchQcx
 ptpoNm8sXxe2Sw96WD6CpmRML96A9KRMLloaQOiYKhL0VGMGFL+0m8KA1Kq1mSgygfi1Gknwl28
 oIX0/R6p7PCkoE0wKxMhXgzo23iTMKNxI8GeAmv5+VzS1BqGDi+vVhNiIQm/9vz+OaINbbATO+5
 KJui0sh8Dn5GJBNiMUPoJn0AbpQ9lCOQLnux7BFyoQoIdEJRf7RhYrRFyOM3NzwVMbxjND8R9XE
 yESTsBYpumFDf8b9etJJBAwmMArmIya0lIkuK7NVi4vNhaXlAJ3PLvLh8ECIxwcpA2SS7pG/52m
 8GM/f41gRlBGYU+yyoZKKgDR16jJRRB32GVeD/wPZIN2pnSpPHlKlNPhfWogawoSKbFI1/ii1Xz
 Ka1bp08PV4sZZtyjbZhrFYZXMpmkMyFlUnMkgx17gIClG/etbatC/+FGJe2apLsnzFa7m/r2yHL
 ys6kAr7aCM4gOUFzHrw==
X-Proofpoint-ORIG-GUID: V-LwFYLv1XILIINRzJ57BoUcWdT7i6wP
X-Authority-Analysis: v=2.4 cv=D5vSufRj c=1 sm=1 tr=0 ts=6adbfd70 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=8Y3P-FUPaDH5FmT9qQkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240000

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
events to the DisplayPort drivers.

The drm_aux_hpd_bridge_notify() is kept to ease merging of the series,
preventing extra cross-tree merges. It will be removed once all
drivers are converted. The drm_bridge_hpd_notify() function is kept for
the drivers which only care about the connector status and will always
pass DRM_CONNECTOR_NO_EXTRA_STATUS as the extra status.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 11 +++++++----
 include/drm/bridge/aux-bridge.h         | 13 +++++++++++--
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index a2e525aa5788..930a03496ac5 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -137,16 +137,19 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_n
 EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
 
 /**
- * drm_aux_hpd_bridge_notify - notify hot plug detection events
+ * drm_aux_hpd_bridge_notify_extra - notify hot plug detection events
  * @dev: device created for the HPD bridge
  * @status: output connection status
+ * @event: extra status bits like DRM_CONNECTOR_DP_IRQ_HPD
  *
  * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
  * detection events for bridges created via drm_dp_hpd_bridge_register().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_dp_event event)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 	struct drm_aux_hpd_bridge_data *data = auxiliary_get_drvdata(adev);
@@ -154,9 +157,9 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 	if (!data)
 		return;
 
-	drm_bridge_hpd_notify(&data->bridge, status);
+	drm_bridge_hpd_notify_extra(&data->bridge, status, event);
 }
-EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
+EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify_extra);
 
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..233ca885736f 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -25,7 +25,9 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_dp_event event);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
 								    struct device_node *np)
@@ -44,9 +46,16 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
-static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+static inline void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+						   enum drm_connector_status status,
+						   enum drm_connector_dp_event event)
 {
 }
 #endif
 
+static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+{
+	drm_aux_hpd_bridge_notify_extra(dev, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
+
 #endif

-- 
2.47.3

