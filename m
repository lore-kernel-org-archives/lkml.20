Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357794;
	b=ZOxoSr2gUk56Rwl/s08m7PzHUIsKVSW3augKCtamuc6fiHegckS2FKeBemOiAF27maWn
	 DYdukts/1k/7QqD0Zw19qA5lSkMFgV/igqkKjHQZNtulcneGrWJX5DTmvgc75t+wIzytu
	 ECdjWOYx8QZU+iHZoJHmc2Ve/L+eAPp0xktZx0Ur4hdhY76F2w7aq9a3dRf+u8wmURX7r
	 T+mwKEgU8gqR5JwVY/eUcQLg0HXwc6zImk374hov+PO4wyVQMln6mDKz3pN8IxReb106s
	 9R/54EHR8tiapWzvDcY7CLGACWENFbU+/vUh4upZHPqxbtXwvghh5AlWB44UDnNTeBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tYkh+z66tNbAJ8FVwlggHZ2adHY5L3co1eCKtyvHahg=;
	b=Yf2gvQMhFTX8LhnTLBbNiwu85VwHdMqWyaFR5ukHKTn7O5Sr+Q8SuOx8gqEx0lb/OjIF
	 x+BQdQ22QbNPH70uNonmwBz+29T0YxI6NubIYJte7Q3gLyj5bxuGQLU6GZR9abU97PaJ8
	 /TELs8LWHej45Ls1/C4Hh7Ce9x7EUzF5g25GJ77n8ODfYCpq5UFWEsMEh4MU4gt/X63I4
	 2A2Kp+m73waySMThjX8FgLHGwy1CU+mB0/WcZ/yBVXImU8BDZJakwzIq/4FDR1Au7o6Z0
	 H9lnIAqZJHJS/pTN70YY1c94GJyq2KIjgRTPG72tAt2CZQhwl+EUP3HwZK3qQuQv1nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qu85sXKk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HmKqYk9q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058DE60A260D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 058DE60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qu85sXKk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HmKqYk9q
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKuUr502129
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tYkh+z66tNbAJ8FVwlggHZ2adHY5L3co1eCKtyvHahg=; b=Qu85sXKkU9xLdMSG
	0GdQTJjN/yjDowV2Yq2N76Fxh1YoihQsvJ/NRt+FRmlw2PvQv2FJTUY1FZ4hXq+K
	Wmq7XofYgmHzeA4hqPpyK127tENK4iIGI/wDTZsAJFk27BWTC65ehkEilO8bGuSy
	SkLoFNZS4QmULEvNZ1NNRpX0sRQtL9ojDC2cQua+/WqjelIw0KwPVjjR7hbP+BuJ
	+6UBzfqtPb4iGmOAJe6SDuNMJOXNEjeOY6y4Is+ST9rPIGkHHPA1t0lXIlKZbMH3
	SGm86B7aTK3Gc4A77iV+JtlpCThVTpVJaFEcGB28W90CUBSvgvCEL/2s1Mtj/ZWG
	PWg9hw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5dbste-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91edde88d16so35771366d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357792; x=1794962592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tYkh+z66tNbAJ8FVwlggHZ2adHY5L3co1eCKtyvHahg=;
        b=HmKqYk9qvoaSi3zX3RTzunsCTPH22bHDazql97kfUiahIPKuB9CrW2bmX1WLaR8yGD
         5WxaSeKKuvtSSdHHvnCdqoZL4tQKug9z5hUtnsXly/zOva8zEm/Xlj+Fg+7TrWmYp6tR
         6bJu6pcuXdr3cgZzic8Ff2OoaRuU/XLK7+l3hnUVjOcGMY8KV4LI2h5/Ysug7Z8jJ3Ad
         Bu62Tbl8IRWExt+t1JaXYlEukMesT2Vbeg3lb7+pd7II9PShXmM8M+SPuipjZq984KNu
         ZLZpyAvaAAsSMcmxtz9Sz9P5sZjs9Zs198cZ4ODMjN5/UrCcoxQ2ak+OvKwbkA5gunFW
         HHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357792; x=1794962592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tYkh+z66tNbAJ8FVwlggHZ2adHY5L3co1eCKtyvHahg=;
        b=RgI+ZsYfR4MMHl6QWAPrGMpv2r2sgVWPON685ASv+m+LS3hPp3O2SvF14sL0RXwIpI
         WkdG0czpDM8m+ni+QA3n02N1IeKFhzdU2a3zJrlShZhdrbQkbtmqC0jNxvr8EwN+o+Oy
         zX9unr0Nt9C9Bk6utjeRUIR08m9YpID6EB/YTypzDfysviQJT/tDrZPS/Dvrlk3q/WJt
         7PVmwQ1TTt4yY7FdQhYbOs3MZZ9C82e/Pbe+gHJUh8AdW1QyTs1hMnsx3n9ZzItt94RB
         i6XpQcPr8NFaDhUPWHaBcyQwuawyVHUJdfaRqQqcr6Ja12IM+UMkhaaogzOgNWRX+LAh
         oBlA==
X-Forwarded-Encrypted: i=1; AL+hErG1lXWB9PfOuwLVIwDIBgZyYdmWXUZJ0LARUeo4dnEtlSQFLU3G8vXYHxRbim3dpn56cw6MJLCssAb5SpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9isCoNpv4bGWIAuYnSCV6NvjpDjDUkHGSjtALZ5Vr8VD6n/CUo
	EeeXg0t1IDC0EozAMZQfmxguQ7yGYZXfQrUvZKVrC90WOEMhVmRphqT841aNuRYnH+fpMbQYZeT
	EYlV+nB0W2jFhe9DA9LPNNLOJ1jgolSDN2RswbC+QhbjJHv74P19W7SzEVAn4S+EdLnI=
X-Gm-Gg: AYBFou1ePLKM4LPKMetKieFQJxTivyB5VMI26Q6AGKk60OyDAaBzQ4GXSptrb8ywNx3
	3wm1rzJPiEF8R6WoblWj9RRSEDWPmybjFyhOf0N7pHL1BeUOFJmbJFYVfoc9hOn3craEcz5rbOn
	C+jgSOMz8w8jVg89UZDL9q0HLWAxFyGncOPidhS6HFBJunsIiHZemxZItw8qmiV1wji13RZ0Gmq
	CJQ/6d/MrENW0UOxXa/DDV3htkIFwBQophswO/vz1lkn1694k4gL3bboAnHr0MyiP8XEIDFYRfb
	apqAMWd76ZhFoayap0mhkZVr0o9YPyCfgb2gsdr8LGAgzcR1PkNbsbNdPVm0H3HQsgpXH8pvE8S
	0AEpDdLBxUrsPvj8ihIQZLPXZEI2v6ZLy078v4ZKdUvOilPZnpxiuDi78z4OkLHmTsDi/VSUfPE
	Q4rrBsuZxgp5lTAXrbjL7bvdKH5X2LmVPwZDSAYm+xDsdi+Of7zfwSNC8BpNNw0Q==
X-Received: by 2002:a05:6214:6591:20b0:91f:2f6:75f7 with SMTP id 6a1803df08f44-91f0402b509mr12798356d6.19.1794357792064;
        Tue, 10 Nov 2026 16:43:12 -0800 (PST)
X-Received: by 2002:a05:6214:6591:20b0:91f:2f6:75f7 with SMTP id 6a1803df08f44-91f0402b509mr12798036d6.19.1794357791417;
        Tue, 10 Nov 2026 16:43:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:42:32 +0200
Subject: [PATCH v8 03/10] drm/mali: embed the writeback encoder in
 malidp_drm
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
Message-Id: <20261111-wb-drop-encoder-v8-3-62948ed87d13@oss.qualcomm.com>
References: <20261111-wb-drop-encoder-v8-0-62948ed87d13@oss.qualcomm.com>
In-Reply-To: <20261111-wb-drop-encoder-v8-0-62948ed87d13@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        John Harrison <John.Harrison@igalia.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Eric Anholt <eric@anholt.net>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Starkey <brian.starkey@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=E8fyyRc1CUF7FSoEm8fh0yWXyrNQOVyyvWVqx7oX1Go=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87oHuW8SCWzKcZcT8xTfb4OdrADN2PwQ4aNlT
 eNqGbQohZuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO6BwAKCRCLPIo+Aiko
 1XVWB/95Fm8C0b3IbmcoRzt1brzZIQcMhBStgGGk9rF0UfIzfwbnxXo3Ho/Yv5anFOpvp7ghDDc
 /XveR5mbKD0lhwGgC+HdhlLQm0szbOY/secPillX0Ya8j9UOFdreJYhv7XpOozMI2DufOWFJbm8
 YYlFT5m8kHwLcqqoBbRkwuQ0iUQK2AHCZkeAtYKtYIL8s9tmZhbTxCwL/60XBSKXodgn0aNV4Ry
 Yk3QyHvm81b5nC4GYAVxQpaHreE7EEcN9diCiZT2aMiO/j2Hm/ZKP79hLIxwQGO9K8FudG9rssf
 pjHrio9g4ZJylmbr8GjnA72h1BOQIfq4Ep/mo2qkpM9/reXs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Gvmi08uDuaHmNKkuKUboXpHTHj0DEtVW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfXzDZVZR94MsZp
 9BIuzOmEXd+hwLeABv9FRGzGgzAN495qt4zCym2mRO+Sw4fS1yDRxgghGZABAAkg+vriZ9JZPG5
 q9ZBNeXH9mUaMj8d31TKyldG3RM4g0Y=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af3ba21 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=eAXNdYJVcktrDQ6TNNUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Gvmi08uDuaHmNKkuKUboXpHTHj0DEtVW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfXzpoKyKDYjMac
 vHjVFewU+GcujfmdMmybUuXT2Jf5FXooLaqWVzmR+O3CKPozC+NB8zSLaw64ABk8lAfe9Muf1Kk
 OPYehoULoE+GQOhqWzdqTcqEJBKs87A30rjwOKourd4w3sKWG6p0SnYd2opMhQx1L57ZMWnj8id
 WJaZz+h4FcBiTMIRsf3xPvPS+4sHgiBa7+c8uhPrAFC1fAG2XIlgLqNmoBJ2tyrhJVqcLFoKoBB
 DOW8kho4PrD6+KV8CAhNiznObVRFEdXEInSTk75vmwZXz+EIQbL/14bGDZZRhJAjFxqGE7gcsHz
 QG/+SEWj4NZEgjlSajTZGpOwU7W2f8Np+B6LvxmJCljJviM2IFRE4833f3YKnlu5nFgz62DiK5M
 7HkgmZUjISaLAhJ6bDHZSXfHDMnThGQ1KOjPXT/xYAwOMsGPASLc/X1CHnAw/nGmI+UL7Tb5ZC/
 JJbgI1wrMwskkAFiFpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110001

drm_writeback_connector_init() hides the encoder inside struct
drm_writeback_connector, which is the only reason that structure carries
an encoder at all. Every other writeback user already owns its encoder.

Embed the encoder in the driver's own structure and register the
connector with drm_writeback_connector_init_with_encoder(), so that the
encoder can be dropped from drm_writeback_connector.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/malidp_drv.h |  1 +
 drivers/gpu/drm/arm/malidp_mw.c  | 29 +++++++++++++++++++++++------
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.h b/drivers/gpu/drm/arm/malidp_drv.h
index bc0387876dea..64610f2d23e2 100644
--- a/drivers/gpu/drm/arm/malidp_drv.h
+++ b/drivers/gpu/drm/arm/malidp_drv.h
@@ -33,6 +33,7 @@ struct malidp_drm {
 	struct malidp_hw_device *dev;
 	struct drm_crtc crtc;
 	struct drm_writeback_connector mw_connector;
+	struct drm_encoder mw_encoder;
 	wait_queue_head_t wq;
 	struct drm_pending_vblank_event *event;
 	atomic_t config_valid;
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 8d1e1e3a6deb..889d0d1db85d 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -110,6 +110,10 @@ malidp_mw_connector_duplicate_state(struct drm_connector *connector)
 	return &mw_state->base;
 }
 
+static const struct drm_encoder_funcs malidp_mw_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_connector_funcs malidp_mw_connector_funcs = {
 	.atomic_create_state = malidp_mw_connector_create_state,
 	.detect = malidp_mw_connector_detect,
@@ -223,14 +227,27 @@ int malidp_mw_connector_init(struct drm_device *drm)
 	if (!formats)
 		return -ENOMEM;
 
-	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
-					   &malidp_mw_connector_funcs,
-					   &malidp_mw_encoder_helper_funcs,
-					   formats, n_formats,
-					   1 << drm_crtc_index(&malidp->crtc));
+	drm_encoder_helper_add(&malidp->mw_encoder,
+			       &malidp_mw_encoder_helper_funcs);
+	malidp->mw_encoder.possible_crtcs = drm_crtc_mask(&malidp->crtc);
+
+	ret = drm_encoder_init(drm, &malidp->mw_encoder,
+			       &malidp_mw_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret) {
+		kfree(formats);
+		return ret;
+	}
+
+	ret = drm_writeback_connector_init_with_encoder(drm, &malidp->mw_connector,
+							&malidp->mw_encoder,
+							&malidp_mw_connector_funcs,
+							formats, n_formats);
 	kfree(formats);
-	if (ret)
+	if (ret) {
+		drm_encoder_cleanup(&malidp->mw_encoder);
 		return ret;
+	}
 
 	return 0;
 }

-- 
2.47.3

