Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762834;
	b=wO6vFKijABRR4VKR+9wsfeRMwbVAg8oVn8iW38PdNCI0+9ZrIfwC7r+RSnWv9z/fegFl
	 Q49IZaWoT9zlPfnVH+T+ARShZRxWAYYYN6AZN6s/A+Wurj1IdZEEFlISvoC2XABjDiKGu
	 wiTvps5kylp26LX3JerK6dJRF6eU+par6L8ZYgS0247eHgVavLFMG2qUKsLF2lwGcwKIB
	 tAHLvI7Fk9NNAMULh6jm0W6Vn+ozJUe9fibEKR8FPiGzm2xDxsDevku7HA21g9DMcZf1P
	 gMLWxn4NbjfRBoKkH5yJ2PDi0e0yef2SBCz1g780h7oSslboL6Lk9LMcDeLcOUB4+yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762834;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
	b=aX+3+Hhq2+AEWtKE09JsAsmz7oiKjAPUjABe3WQeKh+85hi+hYMUjpJ6Fa1B3GynTWWF
	 j/4EGpdAorgCyKrLebabYg2SemR5k8krHRUmf0l0LBCRnliThojwIdnqytKOM66wWdaf1
	 W6WDg3x1ZQbg3TBvImEv8FjWUjutBM2wOHcFfGpACEYExkAKoeTce2XJD99clvOQaiy6h
	 hD2nBULboTp12unNh+6mjFi/UYg85MSc5Q9eaPMJzAxqzxrc5LdkoT/0yLG5Tho4HtoHJ
	 pISn4NkSzn4NjQjIosiX/sIhEr2RUYxPZ52c70tTzDUahngFZrE3axz6eZuouVDZPoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=poibAIZj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hiRjmTIG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA42660A5BD2
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA42660A5BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=poibAIZj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hiRjmTIG
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NCAbU63822360
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=poibAIZjMsIdwMDV
	XD0Nb6ZGIrSar5g+ftoe7oeKR4r/ureliRS+fwtmnawiJ124haBPlC8VnHayoU1N
	P+JeiFeN3xPm7y8+gcXnNENnHMJrr/xtUeyzGXMpTmEdMwTQhyr0d2aI3MmuXaAU
	NBtFKojVwK1FFS92X8KqitmvSbY2xcZfHPhMk16BrldUGmALTTXYs6HaPbP0d7en
	bPpD2ylFczswpJvRbbZv8s/LmSdSc+unVFBJbmR8A67mOlzTdIKgzne428Q+mtmJ
	1LAIpPPnbJm1Xq2ZRL0XDKy9G7vIYgbuRsZidUDN0PR4Pij8xI9FnjlwehYDDLcs
	gNs3Tg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw0a0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917baea8e5dso20719596d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762832; x=1793367632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=hiRjmTIGfbYsWTl+OZcO+UiEfUDHbz0L72/2FJkAsOUSyDdnK3B2h8qu5OVO7jCXCk
         ee5VbOVervwWkxurV7c72j49HP5Yeb1ConVoF2MaSYQZCKxGtSOsd0GHWJQD44atfi44
         1a6Gfv5XQio1EpcAB0clOY0vwaa7QVHbewlioI5N8stQukjv6PUxlIPPMLoGPiQqmUKR
         HldNCZEC+8CNQ5yeAhQpGk21muZlh53g3ef2+7oeSkoU3nbK2YWeonvYMz73Z3RvR7+S
         UbB7XETFd8Sa9tquOpjAmFDTY75OLeuFv9SHWdSh2X282mJ+p1AiYvvuKa/qvp21hpBS
         e0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762832; x=1793367632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=ObuqK8QwNdtUYaqtwFV6zRYsK9iOydcHPfllQH6GR/1XnvWib5CZCwXSqGeQqN8L2e
         aU0P53SIwi/QPaMk9fmyeAimvtr+CZXLl2J68wXBVixvVFrGDJwVQDxUSL8UdZu5NKTp
         Hbm5Xn2KWzfFJJhF7qz5nSspbYxbOdOgIDVGEFrh0woZchXWvkAe9GKYV1rVGM3x4OO9
         RhECxsYatWSoeaCY+RwClswLEF6bcTKsQWHpiZqaDyyT6XHYogRkUcFxTT7n8d+n8Z+I
         rJvfAQfpqcgGKU+nNxSrcJJlN7gsBK9FIfz+GSLUgG0uEVGQGoP5AWFk9DXdW8CM0vve
         8bGw==
X-Forwarded-Encrypted: i=1; AKwUvByLAMMXFlJB2BwR+wNpm2MFsnpAew4/OJ+5v2fP7F1pQMt3V18vdEMfA1tha9cEZ3K6LNrVmkcySilbsw0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrpqXGTadid8NioWgNlNlnYmqsSC45Xu1HRpPIo+WmrpxrcL3N
	uNN7HIHRbRlqPRVkvOoR1Bq/0QxD4slRaW+2lMZGrP7Rce13ytRPTT4UbhcAe6kMO3GcR155i08
	1mvkDu7Ugd+r0wxOc2iikXT0aj8kmokshTIYr4aK+bt2tqEU9sIX9aWIhXZ3+tFCKxiA=
X-Gm-Gg: AYBFou1/re/f3UAVwmK5BKfGuS3CjgtRfC9Ii/5Ru02FCMRhVulSGt9CCfh6mhB82Sw
	RggGNZ0DrZVmu97Nk5N5lelcmHWcTg84jj7cgNFqM2EOPBfdQztm2H5YD5Hu7wOzcfehHIecJXj
	4RkN6a3N3T8ER2aJmcQQWbWvboUOmTqba99LoEFZzkoCg0v5qGBU1QcTm02RnnAlzRVW4vn9rLh
	JiCRRcYmZkCxZKYLvCTwM9G5NlP7Jwx6lWv2leSpEuFdwapzsEqooXDR0Y13DHFW4OS1lkj/FKj
	EeaMiEF5NNAIaJJatUdUznMF1VmnUTZ6eeJPRWVIhyxRnOHsuPCvAJcXF1N7/iNtoKa1MzmvjzT
	QSiIFeJNwxRglfS20sk+K+GtHDpNKrK99Y1wTRc4vdTLlxNMGRPVIjsYb2RYE9V9hT5vJUPYG2Z
	/FaV3qappxSA4C
X-Received: by 2002:a05:620a:4514:b0:93f:35fc:524e with SMTP id af79cd13be357-93f6f7963e4mr426445685a.35.1792762831954;
        Fri, 23 Oct 2026 06:40:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4514:b0:93f:35fc:524e with SMTP id af79cd13be357-93f6f7963e4mr426438285a.35.1792762831367;
        Fri, 23 Oct 2026 06:40:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:48 +0300
Subject: [PATCH v7 8/9] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
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
Message-Id: <20261023-hpd-irq-events-v7-8-57a3aea3f09e@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jYsdop2BAded35utDpfgQd5r9JZyyy8UmHQPRLGSyhM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OscK9ARrM0xnQy9PIe02PuQJWITjFRTOxcw
 EIXvBeXIeuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjrAAKCRCLPIo+Aiko
 1SVnB/9eqhMlFfXEGL7sx5uXnIsBFG4ztodN0vHA/44YV7W7G1OooLgbsvOvIpeBP0kk5e5Xhco
 j1tEinkSJoggU0cxwS2Xc9lfcqEmcMxaUo+LdMPd6j4UyQPiOiKsO5lJfHqCDXACMtfwP3c5K77
 YVat0zINwIdZaWq981pjrXiShkMmW7ZQGmd8rt3No0CePmXgOdV+xTS/b79D3wsbb6tiSGUOg/3
 A9g26pbXGiiAGGY1vEM01YKIFcpTtym6NCRX66BMn4aN7mb99cUWHM4OWQDs4doSiyeDmJrMeKF
 MVvCWf8Tx3Bz7WNIMfMzZpHZlXLooV/h/qxj6hCGoxZBslSn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Dl3OtC2SYoWyS58I-cs2akW2ibecrWlu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX0Ab0p52PzQRA
 VwRE3ejTrfx2HMpf/8VIrATc17y4fnatqmRLUXwc5rnjcDhyA7ouefbRmGZmO5KaCg0RBr0SqrO
 LTJUCT5sbPP0OtRrSAAxFDOdAwJcaWU=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb63d1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Dl3OtC2SYoWyS58I-cs2akW2ibecrWlu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX/Tnle11XsEoR
 oUc3u/Nu8j8LwtDKsBRTVtLLeOTrZ4yj3TcTnyXYdoP6ta9FvQ//KiBAzjeicQgOp+F2oe2XTpB
 z4f/GIbYn/gB/DHAQkU6eV/fLIIVjlGVT8MypvN3Y+aGw7Bs5df7a1XZoTgKXtCVNerNkMmaGo5
 mCl2G8I8+Pk5zCEzs/0Sw75JOnWuy8gPbfLsYefFirqY4wg4p7NfdEDahyOrEvIrReDMhGux7i+
 KzLIv1YQ/plPaTAfnH3xm0TZK+HiA+703kR3EIykXKEbMC85CiYYx7pSpZoLHwFMuje2R0KsgY8
 Zh8AcJcOh6v+rG3oa8e+MMHDF42zJrds8STSrKnOrShZiY1hQehXjrM9l/H8KlfKCzyg3zUl2vm
 n5d5L0rwfCwKZReeFJz+p1Jdmbk1eWypj/cqpeqB2pxjICE1SINDGUCHPljr6UOI/zBcem4QG6t
 zOd7PGs4ekUGQ7S+Cfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230053

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 13c434f8d03a..c463b23c99d3 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -374,7 +374,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+						conn_status,
+						alt_port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3

