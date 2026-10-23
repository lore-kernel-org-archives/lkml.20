Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762826;
	b=Drx8fJQIlz4e2bBhvv3jtpp4UK97uZxurZChP3hLkbGHMdPVABernp20EH2qqUdVcchR
	 iWTuH8NCJSRdkz6lOZHrwygaCRqdDO0w58oZH4JMiaLqViQgEqngTIyZlp8UfBY5frgha
	 3ni+QEUA2YxVa0CtMWvDQ9nmXCN9WwN0Kn4sbRjwnqeVgMBCxW52sAkGBEGUGTWRSoSZL
	 e9ZhCYHWHYwkWCHT5bnk1wMHqKwB/nhdbgG2vEkYblljwJungJTFZJfxhbgLU6C/fPDit
	 pHnOYI36xZLPAMs5aWsVVFHGY3X8J7vXsuJ1kajN9e4j2mtCDo/ptLNczS3OL6SfvyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762826;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
	b=0mgN40o1Hxs84qWWfjTAyb3MYGjUlokzsrvoCyAQw84uqmYaWaqfNv/0usHwD+C+OUQY
	 NhR5diZMI5+hKeYlYRMfHfxEjZ+OZuiPV2hABPE+UPPFsjeBjJutN8SeFL/bmvyzYOXXw
	 PbamoxE9NvO56KWdolnvBvClEMIz0qMWizQboXjvP5lBNl+0g9y4p5KTr/k5UPpBvcE/U
	 2CJm+Pjs1Q4K02y2tXaUaVPUyy+gwiOuYceJSSIYHvsgrCBLOoCXfNaVUpdLAmuMkvkrB
	 5HuQivfCBei83JL4QXwrxfzGw2CtRGJ/iNdgqnwvFsQe5xdB2UuwZYJLtya3jcYd69g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HJlErNqe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WQGIawd4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EF460A3807
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74EF460A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HJlErNqe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WQGIawd4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAHYA1597391
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=; b=HJlErNqekbOdhbGu
	fq2JdyVxxnhNnzhKDDJFKd0T3DVu7DzZmUgPWl6QZKXfvt3vvObkM3tjay+9hwL9
	bieK2sbsTVVU/5P6AbfilMgaXi+1l+64oVUBLC405ul3DaQdghriXAciLH25sdlp
	zAUxptVQ/3LRvJyRmkitrRH1L9N4E2QuCrzaHQet6aKbJzc9K4E7Fkzztv7KtKpG
	Zd/LnXFr0Nwavc109VXGpqqdJ3rHVukP6XHwd2VSGCIPlz4vuUmlVSFmisvoVxkD
	mk1CEEz3V4+xr35FV49nJXDUYWzjq5mNgFsElBMx9Z7ZVdnPLUAbNWNa2sMd6mx9
	4LxOnw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms3vmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf6c528aso143301085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762825; x=1793367625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
        b=WQGIawd4Gt5PV6EVEi+DfSH4LGTANYaKnNrsd8+nrYB8wEr4J7gnlb+a9WyEBFdPH5
         kyaabmuXLDMrJ16DYggbJBFEjtdzSM1CCnq3DPq7TOFMtjePkgypm7P9R6BFiAldSgTg
         cE32SHhhshL5A8rioCXhAc6Ps7k72HQRfvpy++UKsB35O8YW72N+LzhINIyDcmYbTEv9
         YaRcfavQr5XjENniBdc6Ks5oC3UZjAviJlreXebl7XZALZSx1WQPjCC0rfCDtzSNOp3/
         LD7oL7yrwY372Drr64pGgfac3Ao+1MhC1UYEAEyGYtwVZ8CUL88CUTregA8lkmdMBbOc
         098g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762825; x=1793367625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
        b=hStZRwkP5VwGBWBtLO8WnCeq9EHTH5w35q4N8B8LCrHTBSa/5eI4qnGkGfz/by6Eeb
         2kk3rOBaJuc1Cai9HyTvNg9hq17ctTJOnR0qNomMiwRiY6j5YHmsw9IGEH+p3ZNYhFMZ
         DjeTh7OD03f1NLgwFcalP32pFmswljN0R01D+zUCZXVdBujBzOw+LUhac+rhu8lX5mSe
         RnRgoe85ubCjN/w+Gq5QlUKgvTlVH7x+niiPWC9D+cW3+Xr/fhTpdVUFmfM+LFdTcguC
         4vMP/vbtIe1znNyWWtW9buyhBazG5ezW7+x651wJHy0pwD3tIACDxF8EJMR6JIltBNMc
         wocg==
X-Forwarded-Encrypted: i=1; AKwUvBxhYGSD55oHMMi+w3xR3TG9Tj/PzGGnNWSKL9WoddhBgnhLAn6QHt/r20CeLXTk7OrI3343UJl5EEH6Wvg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLB3dGL69BnNm0hgN8IPEWrv5lSyINyJp20566IQOWORWnkaz0w
	+d4PX6kVu2jLwTYfgGmeyzcLTnjsCOUbChQfukkgHBW8TUcuWjbWtVI9WBvEx+y6U93eiDyatF0
	A6eWnhRGLrFpKLL5PtYxXg7UE3seO0PkWmQPsDJDPgtzT5sBfeZBmlqLd6UpbKIbX94w=
X-Gm-Gg: AYBFou0WtbBe5MK7sAi6KFQH/2jpV24qyvk9GAUj+4Apvhcn+1zU4Zf9nRzU7cRKSFw
	I61PycZuHRwHsOJ0UnxnXbABWe5RkKfZKmajnerfX1jtVmJJ4dx32uJUtg6sF1hco+DORjLZzym
	uMaHiK/ASZX2QLO+DEU9RBjQKTummcfgb8wI/OFrYcp5dS8JEqJpKxUXD/FavK9Eiajem7aItwb
	ZRq7WuQ2seCFKSJmMSoaLBo/NygiudNFut4qWNYHKLPzBB+cwsYyWdmuSOG+c6Mtj0sItbJdt8u
	G85kOm2BTx4zFvJh3S6h8WlDCSj9Vhz7/gCLO92LmcJ5xPwhR2Mu9xlrpD7Va7kHDph6xmG8EtO
	mELysJX6jXjVYCzqiffhdGJ4SelJVDF99EXlc3eIZu450JBtfRCQIjPzpmmHtc4moz3rj+Wewhb
	q5ehLryL0oie4q
X-Received: by 2002:a05:620a:1793:b0:936:df48:d507 with SMTP id af79cd13be357-93f6f91b90bmr404249485a.18.1792762824582;
        Fri, 23 Oct 2026 06:40:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:936:df48:d507 with SMTP id af79cd13be357-93f6f91b90bmr404240185a.18.1792762823901;
        Fri, 23 Oct 2026 06:40:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:45 +0300
Subject: [PATCH v7 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
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
Message-Id: <20261023-hpd-irq-events-v7-5-57a3aea3f09e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4192;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BIcHzWfG5902z+M7u42M0vyUpcn4l5zulhIbCsx30p0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OpPKFLb0QP2XHRz897yeuMRZWhayLOJL9in
 wL0DwIb9xmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjqQAKCRCLPIo+Aiko
 1WMnB/91SjQ2z1G2jcpsMEUAbLrvbhHjUWRqN9sYOBcBnF+Xi/fsnadkbVkBkay8z9UzDLAAWGm
 ZJay6mLJuy9ZxSPM1Q1KBpJBynYTjlRPeVT6YmBj/i4w/3dpKkd1h94Gqce5bTTVe3nq6ohfcwi
 Q0FZX2plfnEhtE2p2/Hs8JwGikunLW/CTudWq8qotyE00aQtd8EEx73Xf6YxfppACGVESQXt6EQ
 jwiJUlk3B/H4Lu/sM+GsNfAlSQiXTTwlFPUiB0bGv3rJttkVXl3ZlN3ZFbPk4GNyyfGRdDtqX1Q
 uDLK2Zrs89ydnUo86jdmaZFwx0gYui5hMi+aCE6sx8ROdlt4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX3qRzRT65EOSO
 GuK4IMozu4bnOOEtQJA6Wk0TpBIPh7hqS1hCtHDg4A+jkRQcP3sWTMJ7uTXbH0yvyMEBdBhTGe1
 Sk0RfoFeXeLLGolzqLks3SKWJe0/I+d8DlLK0Zin4cW3UbEjnM9RvoSlcnFvpKiah1ZTZIHQDF2
 ugbou6JHLZ0CoRdYf4BGLvcmNg4gTVBElX+MeCY7Rdg5N2tZMiCAfeC2WqPCC/doycmpsGvdVJN
 HeLCOKf6KtfaTmQITsPCiCCOHY6516AKjzCjAFwzxD7683fNUuZs0fmOIAhSJkPcXzYUSvyoSD3
 kyJSNbkVq25IjfE7Gei7/NkdE6/+zPM0U0ItpVRlun0uvPI/BLO+LcQCQJN42YXWecdcBcw18RK
 e/e4w3bOQyc9S1WdMcOuUPfX0m54xYd02vxBJN+k12+e7RCz/JLrSTAwsqB9CUhSZ4sPpdoAzHg
 PNINHmsRMViq4Baa6CQ==
X-Proofpoint-GUID: QucZ2LRAGiwzsbre2I8kbA7BWZiLtOdb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXwjel3LRGvH7S
 x/i46ce6l9+hKm4SnKqNDIneHa+1zgcPHYLMUwkeY4O0q94VL5fI0wVGiUO1jw8aUrqa7yij2HR
 rRUzavc5bUUHqO+igUFav7KjzG5JdYY=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb63c9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=8Y3P-FUPaDH5FmT9qQkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: QucZ2LRAGiwzsbre2I8kbA7BWZiLtOdb
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

