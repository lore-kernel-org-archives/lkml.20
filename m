Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762821;
	b=pqHnIMg6rG6ZRQuBV0C6guFDILRuP3ddrMBnbkE517yeGAXmYAkpdqBroZUK51vLrjJk
	 cl3gGg1t4cl42jMtZjQaWu6qFLFmKniZ7QCMVtm9T5HGGTeADLfs1EyjVkTDL89LcFksf
	 V/A2xuzn2eynuF7qoqdxMetx0bPCEkLPEkPgGlRiVzJSA4yKAlr7tFpmPoLXgXNak9p3l
	 A+KOTmFsfP3NXcG/DzPe3J5xndT7lXUEEyBHFR0+BkGf2KaS2TXmEoF9oWlHqTybZCWAx
	 FPmsNCDTii7EhPE7BzNBzgaUsKSCFUmFatDlMeKGsI4eCJqQ7Re3gY/P+OXqCoGizZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5ld7/NDhxBfD4wQ0h8W5EU7EeR2jFzqpd0RH9i43qSw=;
	b=lnNUmlK8gMroUiI1UP5Anc7Wsx27f7U+AxPSxPV1jYfVS4Gs0x4TxlZYJx7TR4ZoC9Io
	 lSD4Dd6k3wBrS0RS8RbDTPe5Sy/wQjnBiPYrpmxeB+2yaTEHFfr5AOOn0CSIe8Kgmx83a
	 ugN5cbaS7t2zwdcVM1BR3qX5M86N9mr5BsPeYqFBaNlw0SrV6rS7L0hYFGbFh1XYp9rVO
	 8e+ououQgV5qiXzpXjzwZEL4CUGhkC/+lIGW3WkF9XUPz1GlShDLwNwAlXKedE2rqMvtF
	 juYFs29ht/5z2qVWId7N/hmoe5a1FQh6/71+V4x6cHeGlpziPwQfCKRlySM5dLADalQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hDJWPxkA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aILNUHKM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EEF60A2603
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11EEF60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hDJWPxkA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aILNUHKM
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAYJx980612
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ld7/NDhxBfD4wQ0h8W5EU7EeR2jFzqpd0RH9i43qSw=; b=hDJWPxkAKoIKlgAA
	SusW8uZE+xFL1P2FouiMwWxolVkIozu/GnoEgzBRpmbo6Ef0/cZx/32qBVjLkvCf
	26brYVJxMwDSTEAL3+TYnvgkQ/u+8hVCLYlIf8f60kpaiFVthfSVcWb9UjxJHaoG
	5Ccx7EpYaRdoJ4Psrtg/Wcke+AUfXNf4RjDbec49A9yBcJQzYJi923liHwrXtSkf
	2Dc2HcDIfd3DfjZCJcTA71jRGELd8gNpRoiAc6/sjwU03MNCmgWznSu8lEEcSCPF
	LQ7YnC5ZWc//ABmd8p+JWGXIZtUphaGL8b8dCB1/Kh4R0Px0reae5cm8FwtSu/yM
	d1qkzQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmaubp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so195124285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762819; x=1793367619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ld7/NDhxBfD4wQ0h8W5EU7EeR2jFzqpd0RH9i43qSw=;
        b=aILNUHKMLUdLBuv71JoBAO4iTXMrUy1sol9I386Wt/+uZM8mYCAealk4m5LPEKF/f9
         IBeo/yQrA8sd5nGl4LFfR2m1ahwe51b+eJpSUHH/Sr/dYNa341xwfnfuAJldnuuR+TvC
         CxGsml8XSQOshajO8nWL/0uADFHEuWvg1xS5cy/TxxVl+U14rcJ/S43aRkCKgbmJGVkE
         6nAN6DWzjcfWfsQQn3AcSQc0jReptHd8kepS6ypBogc0ytEKVSCaZ2IwduuatFMO1Y6j
         qplAQd1DMlh5I3auYdT9M8DEO9/I+t7LA2fKDVKJbxKC/VhQSiSxfbHxHOdPIdNFLxl2
         hLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762819; x=1793367619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ld7/NDhxBfD4wQ0h8W5EU7EeR2jFzqpd0RH9i43qSw=;
        b=JApDPmYH7g/1qRtawGOHE1u0lwCUFHdFBLOw5A2s0xZtt6NEZqSEHX6OygrcSEv1C5
         GUwObo1O2W3AUxUGlabb198fKYa7sBmKEXhfdSHbAogVpocYZnoSy69PGefyGkpkGwMW
         JK5PZCqIFjVYh9aVHiVPPOMwFLxtKPUqeCTWiMNhm6sAzbm0SSXhJU+B/sqkcH1NsCbq
         MtkzuHxAw5EAQ+QFMRzKPdN/QNMc8bCfdze+RMHvSB79xJZdhItGWKJLIOQ5sOH5DoSd
         mkd9qRpYg+aknfj7A4T5xgLYwruDAzScRd2IUj/HtZXhiZPbkclinDb5QiDXzYN1e8+g
         ZgfA==
X-Forwarded-Encrypted: i=1; AKwUvBzr2tv8fOP2s+zhOOV1+c5yYNMUz+Gz6FyX8v/sHMipy6+2wRlyk6kzCMLT24XqK3TfkxSRXlmH5WgMQ2Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqcNZuTtLP+nNZ2PGrJlevdJlSqHoD7IwzYZDILIpMoBcO65ou
	sF7ovFbqPXkWCsIJ5z+c6hUwx50Gs4896iApKAGzqQwOlri1N489xFtIdspuV5V+lxiRM5cBDVG
	NCKWz4zLUdYvlQi9bVodVN5YapWNg5IY7wjskLUkm/42jVAGkrdvl139hwNpbYpcAps0=
X-Gm-Gg: AYBFou3kGBsyo5wPZHlI32QxyPKLKB2b/sdokJidYAL4w45xpFnDmLThYJPijIX7AKD
	CJ1MSXBoI8m08Yxe9f32nEDmuQfyQRItpiE7veUVk9XrIUQiPSS1U6/od9+Es3t8MPOL846SP0I
	wdTyDn4QMdlJ+7Wx9VjzKfq0LUwv8tq6BVLsDFMvIhLM1UGma6duhecbDirNXvOh/q3R+fxNAul
	WcjIFRF0eCB1sYoMmWksM48vMHQRef7gMHulgxkzzqjB7a8KPnHhwiEBt7hXDRUJDDJ5Jd9G3wT
	/pIadbaYOYRAW3+XLHyYSzv9vJunvlvevo0rZ71wEKEfTWwbscFiAkv9JHkB1D40LsfIDlCs3up
	/g4nk7ZIiVvFNuvCSTNl0GTj+cmU4khHctajriATDMQzSI9qBxQEFahvSYuNvVafcOZoFozpzAx
	nN+th/RbEuuHvM
X-Received: by 2002:a05:620a:711b:b0:93f:22f4:f0cb with SMTP id af79cd13be357-93f6f7e7050mr447542585a.43.1792762819222;
        Fri, 23 Oct 2026 06:40:19 -0700 (PDT)
X-Received: by 2002:a05:620a:711b:b0:93f:22f4:f0cb with SMTP id af79cd13be357-93f6f7e7050mr447532385a.43.1792762818611;
        Fri, 23 Oct 2026 06:40:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:43 +0300
Subject: [PATCH v7 3/9] drm/bridge: pass down IRQ_HPD to the drivers
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
Message-Id: <20261023-hpd-irq-events-v7-3-57a3aea3f09e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5185;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KMVFy4RL34DmdlhxPX5tz7BpH8GKfVJsVv1QEc03rr4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22Ondx3gq8X6yduxIREyCDV85YYpkIg3G2DLz
 s1gri8a0W6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjpwAKCRCLPIo+Aiko
 1T+lB/9bA/2MncyaM38hRnnIf4AbnFXT/EXnYTkG2+JVmd8BpfAxBlQP17JAf9zGdkwA0pE890H
 AvogyzPKNNYjAaS8HXV6tkF8XY/fwx9SCziwRW2uM5bPBYtlV2QsCUJCYZ6fx6otzqXI3onW13e
 s+d6EThrjsDLr4hyuRYceEdkKfH5lpPfPlXoisHOi2Y26QjFfwJ5DDDFHmGOK5Qj+Bcs9cU+jAe
 WnGX6wFayiY1QqTrAnralEeCjIbTE3J/S2aT4y3IicatdzxoQjv6yky88cu0NBiqqyDFWDl/sau
 hm3FOA9WnlEpouexSGHNPLOZ+1F+MFK5BWPfYXIA1+48Pehl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb63c4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=s8YR1HE3AAAA:8
 a=EUspDBNiAAAA:8 a=P5073aSicUuGdIvNCfYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX4ADrsf5Wckh0
 LxDOExDqKuR+wKQYvYXHltMk6fYIP/4vp2VZSk3ynMsGHe8Y1CqE/rMW7x95ZqtQGItL5q2s/LJ
 PQFnIp5fx/m1YJfg8g4hXHg9wR+R43M=
X-Proofpoint-GUID: 1yO6naKefjTlBedJwRu62r83Ek-IkzXF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX7xZfk4Pu4UoZ
 HIWJXemvyzE8gKexsr18L4iZwEhCCce+7GOO69IiHSiIzIy4XzotYMeiyJ5JtJp5vwrBXvrH8ZY
 nNOpdfJEUONjEGlfyyDiP8Jdl+SC5cBqKFVsdueRB83xImFK03k8cOAXqFgsZUsusLCgxuR2PNh
 Bvs7E9kI4IUkU2V0VhBJfgfTbhrFf1LSuotKJGRyZLXUP45ssjtRqTjCRN3eEdOPRSP+pLEWtSt
 ngjIiGf+XGm8DP67X1UqSqnvOLC165qMo4ZiX8J3FcSn2W+CpZThx+SaISRzyx6jogNRi2jZpAm
 V4gAfvKpmrH1M/pFOEu9cobNCqDZr2fB77U/BnSfpgo3AZg2TN59mof0jxoSmSzFhVPcr2yhtgF
 W38gRMwfkDeZMiLi2IqiCBOrGpkz5+X5s8V5x2XUoxseHHmADv1fSHRAIARvVJ4FCw+M/G2Hm+g
 QmxZXIOM52WHEOWWFfQ==
X-Proofpoint-ORIG-GUID: 1yO6naKefjTlBedJwRu62r83Ek-IkzXF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230053

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side. Pass down the extra status to the bridge drivers via the
hpd_notify() callback, letting DP bridges to act accordingly.

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 3 ++-
 include/drm/drm_bridge.h                       | 3 ++-
 7 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index b3bb7f2cebb3..b1ffbab89a16 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -429,7 +429,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 
 static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
 					struct drm_connector *connector,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_dp_event event)
 {
 	const struct drm_edid *drm_edid;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 898273f60cf6..1b0a1a00d8eb 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -151,7 +151,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, connector, status);
+			bridge->funcs->hpd_notify(bridge, connector, status, event);
 	}
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index c4355c5cc340..a637613ae2e1 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,7 +323,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 					  struct drm_connector *connector,
-					  enum drm_connector_status status)
+					  enum drm_connector_status status,
+					  enum drm_connector_dp_event event)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6abe30bdff12..fa8942922b53 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1541,7 +1541,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status)
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index da412c788503..8f2f4201da60 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -31,6 +31,7 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status);
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index bd6c4d2dcdc8..72972a6fe989 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -429,7 +429,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    enum drm_connector_dp_event event)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1981d24a700d..6382ef5f1ea2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -509,7 +509,8 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
 			   struct drm_connector *connector,
-			   enum drm_connector_status status);
+			   enum drm_connector_status status,
+			   enum drm_connector_dp_event event);
 
 	/**
 	 * @hpd_enable:

-- 
2.47.3

