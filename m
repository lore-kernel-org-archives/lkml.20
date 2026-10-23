Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762836;
	b=sU4U6UVT9Wk1XjYNOEWD53jiocQsuct/slijBMO9eFz/mG1JbjQu63/CQSEGwlrU83BX
	 rk4qB4RPJPqCnob/I36VZIInSzPmr0bN/uZeit+B8rKn2oP2xCxSYPeCWBDkC9JOTABul
	 vFmzcFLq2di1U/1hYFia2uq694S0jlbOaM+ZQmGw6NrXV3dPdFO1wgNeDnT02Y+l/OSEL
	 Oj+98jhNAwjHWGO1tAeGMMMpIjuAYqrDy5poJrtcVKEJGlDQREBWYgdwgcdKdjccXr5YV
	 IiVuvojSPLOGVyAy7N3H4hwqKI9OL9QKR+xjBc7q1dWK0donLTYkLl5iGLRxhZETzXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
	b=CVPuUOKpYsMcWNdAz7zyFCecDRLibfSalfZR04sQ9fgk1FDpw74QwX4dW5UOoKBoRSDl
	 ZBVcz6h3v0A/82UXBGWMmRbhf3uqsewlFOuIx8YRt8HZaSR0KVXWg/ezPetAqGLtnQ3Qw
	 A1xtdgbNKPnt4gSoClIQep7ZS/2qOQkfRNfUZhb877OXLQt+uxlHy7TSow/26b/0jviEi
	 AoVPtd4EOFDEbnWUQr2ZcKgLnsWcFyqYWexsaNR/kqyZE+JsUkvEXTkpBzH0bQQGXfYjh
	 EkpsXJ1fSXzloLgbmgxXEl6kmCYft4S+JRJnkWVDyuWLqK00XEJeJycNs1iFVMaEAqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZDQmjEo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="T/0MoPdM";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1AF60A6F4B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B1AF60A6F4B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZDQmjEo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T/0MoPdM
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAEl91597326
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=NZDQmjEo3XEu43PU
	qrUt2Yrt5RNEiHBrhrMODLvo7dCNn7vAd+G9DrNpFcK3+vA1y4YExqlfev88biMw
	79PH/yAhbyjzkThwN7o1j9kuIJTRhI7K6EgmIxIjQ0rz33bMhHn5SSkf7hE4QgF9
	SGU8BlGv05gCsCjyKIC6KPwhiWTld2YdDRiuS1YvFppdx2MjXwouWB/MvwUhLfPo
	SdBhQ2zFD4QBatW9pJBcfxdzCt4pG3JQl82VixJB6m3wW0jxV04pueNbdyBUrYjG
	GvGHl0357Xvcf3xrKjxOK0WkSX0WYqe581JBMznG33H9raDKY37gxnLM2VWK1e6E
	0Z8UQw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms3vny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so167600585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762834; x=1793367634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=T/0MoPdMFHqM8/bLHW36BtLWaYU2JHkJtDwSFT2BfVt/FVMcZDifIhRABRZsQSXtPD
         yn2Fz6hVbJQPHdWipyq+IsiEBm50/Nn5KCleGBgwmNUJeZpApztNNcfocRpKecmyhvm9
         hBOjsl6ec57X0/D7oE4A5w9B0JR9xcA1vrSjF+HDpfKiEgv2+G7Na7q+1jQu74pmj41a
         Pn90xA4XG/iOKagTKyVP+FRe37MuCkRTcU2YSvpqkIYZfrAjWCDTYd65ytoGP+Dpzzh2
         NzIWKfQcEX+aep0SL2RZGFo+yVPicn34zWU7Ka1+KpxWzPoixcZeeWJbKB7vbqHn3UPH
         +1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762834; x=1793367634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=21O77+x24xB1GmG+TcmN+qXhV1zBhWj9dkhMgxxL0j+a0O8RuDrk6oSWzg8SHtwMiS
         XPpz185WtoMOLk5ym7qLn8bM7w/BalZjP+gUPfTnvYBe4dvlzRKQ7m2KRXHw5GB04Qx9
         8BOfbM3CR32WaqzEgsbux8kbEf8+h3BEzgz7HsE8h1l//SR9F9ti6MQUwAEi39JF7b4A
         nW6QvxIYj8NiRC8jOSA/ITH7iWU6IzSpWv5Zm0HpaxZD1A2EDB+xd7qMKardxNccny2s
         kuyOxNXNNjyfLqnwNsoQypf3oIQ/Xr0fQDVf3yKSH2ipq7CXfc/poc5j+3kYYpEExuUm
         hYZg==
X-Forwarded-Encrypted: i=1; AKwUvBzIxox4P3A85dXkmxSf+T91Nhokolcg59jdLbq98o4l31CJvdNrL6F6p2IKgOYImuQG88UHcHkHXzf4910=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9mG49cxluN7kJ5ubxhKNDpdsVuwWxeHA0payy6qFvAaZvBHIK
	UvP4rEvhBV4bM17aR8r3hpxhMePtMUPKwJGhPgp/iaHxvgC3dJSi53epOqrjiFHDzJehaGyt9cg
	2C9vjhwyAMvC3TMwchZ6TfFyvr+BK5wMWz5Zh6iW5OxKOsRHuGFbIdGeRKlYAABzu8Js=
X-Gm-Gg: AYBFou0EBNkrzN6rpbqbS2bOdB0wQEaBNsZxGYCzzhVBjbb4DB7NayX37o2n4rniKmI
	V8ZtXC7vbNFvtuHv/ivSzu2n/oh4JJ7HFadj8uLCNSvc3WB6ZCGB0LBdu0orBJT7PSwqAUlP6ma
	KdM5icO8ziYiJ+6dRvJAnrZfOUwGCZKD78tjFeLzddGUtINVYt2GW4g3SVZt9novCUabr3T1Z4L
	Ppgrde3aG7RH+DfawEKyZTuC1k0G2E3NNZQVdrfR6+su15T9c3+bBoaaywAeoGsQWpzj9OlwZZU
	gT+8loRnF/X9dlwq709f6DcjuAfjh5tQPOUiI5MnA+WZHqcBqRvzfCR/vvd6u2KrPphrglGkq54
	lrrsKY3GdVp56B/759LjxS5gHPH8tOqnJxM0vC+HOuKBeckRgKcuDgIbZhDoU4mx+R9zZo9UnAt
	xNbguAxONvfom9
X-Received: by 2002:a05:620a:4727:b0:93c:65e3:df81 with SMTP id af79cd13be357-93f626db2e2mr856693585a.13.1792762834378;
        Fri, 23 Oct 2026 06:40:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4727:b0:93c:65e3:df81 with SMTP id af79cd13be357-93f626db2e2mr856686185a.13.1792762833809;
        Fri, 23 Oct 2026 06:40:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:49 +0300
Subject: [PATCH v7 9/9] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
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
Message-Id: <20261023-hpd-irq-events-v7-9-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
In-Reply-To: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OtA5kQaJAzu3uDsBpPRilZ5f2hkyP8+qPHe
 NeTG5AI00KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjrQAKCRCLPIo+Aiko
 1RI2CACg5pQDUEeajZzHEEghd4rfxKwDm4JgwgS9OSplIDBiAHrg2w/55A4G94IWULDp5wDxMxc
 jlgkqR47eCTeNzA2l6yZUkkMMvkCVWKhBM8U09/ys0hiHXYUW036cBiTAsb0Dj58VFU9dRl/R8+
 abZrn9cWVIKIHzllDpGW+CiM838Koz2EgVRrFKk76B1j/Rwx3fzwTPICryRsDzdbAzliuRvqaXV
 O8Vvtzbw/1Z+5I7/WE9Ic24Yk8xBHdCBSoATwKaz16mXwtSI8XwYvM0MQqwwSSiJ98d9mY7UwAo
 LfRTAJ62c1+UgsjyAEfClwnjIwik4AOmFfFZQCmJ4l6CZhuc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX5HWxaP2C84Hk
 c4aMnhZXEx8HW3++D9I9gLsC7Cpijcv1UKG/4GLE3vslcwNZcT3NqHT7uxLTtHX1i9e56NFwGsx
 jlCSQCBeQB6nKCKKc6Ko+mZah3Py01Pf0K2coik9+9EHCJEte0VZJVor8YD9/ggDlObnAXYB2xA
 NLtXS6eiOUeb8d1rWwbaCmccWla5G/qsXkTjZNYOEVcbkXbPHePYV1lPHZnRbz8OgGcQAfcwbk+
 LOZ+V53cN8MYaF0dsDE4MzUVHDmtUDReZ5sqvV7M7K6XVQhd6Zah6Wwxjb6E2iCu3OFMdyzxvut
 evQN3QuK4yI6BaY3W+dbj3L1R6PqG1ssE/GVvRXtFswSKi31lb635nHOvONk4um8+1tFP3WNLyy
 Jtnhfa1f6h1AOUCOzpFNadWg65OUgym9YbtriacmZDf+0pkPSJ1wyGTEj4z2rElVi8zZ8N6pw8i
 yoC33YI+fL/dRRm5/rQ==
X-Proofpoint-GUID: 9ZoB4Ijpo5IXgNX1F_xkcQthfMc4saiv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX/+j8AZszC++a
 ktJa4pvbs3HJeKYFIyZoCTUlS7tKto+nwv9iZHrBIRPL6KCHHqFizepY6hxKfCN4X1Sb4n2NTdK
 Dcwqek5l9GJOtkv/Nj+ndBCckZtDrYk=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb63d3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 9ZoB4Ijpo5IXgNX1F_xkcQthfMc4saiv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230053

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Pass IRQ_HPD events from the EC to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 57b37fca150c..cb0312e2b8dc 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -316,10 +316,13 @@ static void gaokun_ucsi_handle_usb_mode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge && port->svid == USB_TYPEC_DP_SID)
-		drm_aux_hpd_bridge_notify(&port->bridge->dev,
-					  port->hpd_state ?
-					  connector_status_connected :
-					  connector_status_disconnected);
+		drm_aux_hpd_bridge_notify_extra(&port->bridge->dev,
+						port->hpd_state ?
+						connector_status_connected :
+						connector_status_disconnected,
+						port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-- 
2.47.3

