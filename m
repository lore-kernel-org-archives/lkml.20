Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675708;
	b=VHyx1LmwL1KzJmJPtP2lNeKCCh8WFeTUPB8pi7LPNfPH111wgZlG9tk1MBVVxJ5MdhTp
	 8F31ekmHVH7XAgfYVkihgirBoqI5C0zuHkdOPK/7MjVKFtwHXJwiiKicAhDArVzGCTKHY
	 6aFbTaXTrML3esjmlupwTF7kEDfRV1ZbshMZhdL1awag3Hp4Bd5zNtTT5kqqWFFUAq3O3
	 8o5E/V6YQCYfLHQ3qFGpv0/yRmUsORXje1W+7wuDdwGye07Q95TpvVQOZ10JwX09fUTWj
	 WuPyAjGm4azoO4kaHp7M4/LHR2ImWCPoNLJj/Td7Hxi7J2610btihU5p51XJEM4BQfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675708;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GMjekKslBoodemGPPh2ySDDLJdT5DA5F/zIx2IC+Abs=;
	b=1FYxIyfcSGgA3tjXhJedf0t/XZ2ywCHVulY2HkC3nKkw7Jrw7wnJHvMuxKQAkY1Se10q
	 O2RU0kt03SAMFShHop/kZsdJJ8i+BDPba1J5OMmZkRBiNybd5pP3CqvkzGx/8Mi0NMVkp
	 GiZEL9X80i1a56nlCsJX820heqXk4RQ+8kFfgBSBskZjNRVLQVP6/aZ5VhjffR0pJLkJT
	 kdFLIbzsteIiOqqfB8XkzJhtLz8h5dIDvCHjmhwDBU18DAVUTwOkQllKAN2f4murjfz4E
	 DP6fraZg45oahB0aubbtvE6np9uHCAnD+tWoGSSZNYvbDtW4Sw6asvPvccM209SLdhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dc+eivA+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cb6YTbpV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED6460A2618
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ED6460A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dc+eivA+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cb6YTbpV
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0DP63116018
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GMjekKslBoodemGPPh2ySDDLJdT5DA5F/zIx2IC+Abs=; b=Dc+eivA+pgTCnNFS
	6pVZLbl1NJnTyKBqT6sSNMddhGpD0Dc7mqO9LK94GtJFXhwm/ybn6vNC7ItTEyKM
	7yKHHE+qDLLfPGzjXOTdXST7YuSckfkZRY6i0mmnKD6HqchOer3iP0vm7x+kkeQP
	mpfMiVrSJAz4Y6s8UF4jM2C7dZ3tSMEUL4YTa+UkAvHgqNgyC7eTLODjpJ28+vWJ
	PkPJwnaTBeo8PvFpOR10A5hbLotVucaFV6/tqcqeLj01L7sfZFIRG6xGZvxgaW81
	Vx/1g70Y7Ip+4ExijYT7TyqrwO8dDUiR88XdFfL1qfHpyvfIJP25gEiiCtBNOdo1
	WSN1jA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bus4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:28:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so410499185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675706; x=1793280506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMjekKslBoodemGPPh2ySDDLJdT5DA5F/zIx2IC+Abs=;
        b=Cb6YTbpVqwzy+mafS4SFtLhLnnA/dzvns5MuIJ1n5llxVLWy0anaEnQ19WRAjxK0aR
         u8RLJOpOOXpWl6LzCnviWS65cd+kJpLgo6G1IQj/CyL8KzESzXMHyST5JscaVcEFWsQH
         ntGcBq/zmyLJmW6BH6t1jbdBK9nGXJY+w0clFsNWykKyP1B62Lv76rYIcl91xqum+rYa
         AGOtwdOQWOotGt3Ik1wtB7RhMnzso6q8NUidWjWmMaAbKKzZ2ih4Rfd90c6ZwHpj/yZS
         2rkAthiVFmSQzV93QKN8vOrDq7iFgspFDhEKHpGI3JN6NbzWBOUTbyAv3tnnySDPkk3J
         KXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675706; x=1793280506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMjekKslBoodemGPPh2ySDDLJdT5DA5F/zIx2IC+Abs=;
        b=I0RmBmScJ8TLyQfShyG3cUL/NPVrcp4Q4ztqKxBugmqqdoJLpJt9g1M33b1qIefmDe
         xiO9GUIl2dXfS8jzehNq7diYIMhlVGkoThXPW+lb926gJGSldRlSsrdyrV7NfAdjirzg
         ioYj4becn15bz/CE5945VrbQO8mKH/AemdwMMX1F/qePfCn5/1W+z66U6naT77M01n1S
         f0R9RjxGGg/xNFtc6LUaZ6wPtmC5fgtkIimI6ff8eKawUmMhG9uQ0YBOpR8AOpqmTqS6
         JCf9oc5ANPM6R/8T5XK/cgQjv7ac2uBhD9f36zoutCZtk1+yFsGem8tuTGu+8kNJMc2/
         Hovw==
X-Forwarded-Encrypted: i=1; AKwUvBwI5k1c/CGku87UVMM1MHi63MyOvGYS+31iDoCl0jem52cBH6uSzmGdapDuQyl0Hj3z3tvADSC801Xhhdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9rGtABdnuclx/iigTKsoYSs6J5apdze0WXBHDfnunj+kVG60d
	t0G3veOKvO3V4KRX0luV3Q6D/ThyxNRs8ZrnQqVzsVV/mIlsqOADFcglCXTdhx6y+X3eVsCG9ZK
	dJ1R0Sa1PfGE9evp6W7Xp+NDvCQTrj2Unswfpc/9dRqqs0mpcQd7Wj9c40ZR2nwjMFyI=
X-Gm-Gg: AYBFou08vf2CNE+Wndr7E+3F6jm9O0Q2i+ji/+r/gab+3OSXMdFuLCtfheUpsbBfN6h
	xQhsz14qCw2GEuxWu2243bZt3kxPKRqOuzQvuHJ3LMvA+QCMX98f6QenhOD1EMSHJ9JxhzGkR4u
	DjOAYJK26DxtS/a/0NJwhDIQJmYyGAuzNkW4bqzCCkDRNUCeiVUhDTiJ6wjFt93J55NrxioTs7A
	I8Hz9SIBNoCaAw5y21i+uumevGwwpblBYyXS+cYWZMJcd7A1vKs7aUL0eVZ2YKli0wuRpTAuIqd
	vmYpLfVwWBffxHLoox1UHm5sKZmt65zkPF5OafPtZavWnIfetujZpylGljN2MdeuPaQsehgCNAg
	vBvP1eq6UdqPdahxl3nMqRQIzaaEnw2p/fDhmdfMWJf52LvuvErGbAebZfevzWoo3WaeBQLHri3
	+izAHAzFh+mY5/
X-Received: by 2002:a05:620a:45a2:b0:93e:e1fd:b87f with SMTP id af79cd13be357-93f5803fa9dmr909487185a.83.1792675705462;
        Thu, 22 Oct 2026 06:28:25 -0700 (PDT)
X-Received: by 2002:a05:620a:45a2:b0:93e:e1fd:b87f with SMTP id af79cd13be357-93f5803fa9dmr909480185a.83.1792675704780;
        Thu, 22 Oct 2026 06:28:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:27:59 +0300
Subject: [PATCH v6 4/9] drm/bridge: pass extra events to the HPD callback
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
Message-Id: <20261022-hpd-irq-events-v6-4-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
In-Reply-To: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
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
        Francesco Dolcini <francesco.dolcini@toradex.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8438;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TKKw/H3SXfDs3PoOXuNmfA50Zj1t8JLh5+PJ27RzJ3o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9l4MGN3+pOxp2wWkk8jSBOcIdcisazLhG+c
 8y9sv79MiiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZQAKCRCLPIo+Aiko
 1XJ2B/4+vL/dxLSshuFXSsXPFtrDWqWXVr/EKb/pzizx0rqVug4K/foeUZ1orqKfbh4RFqYNpPU
 FLkHabaJJy0246JZUiGqd5gYPrDU/FAsmd2H2TW1mnMKnp1nFzewurWPrZohH5/2WJ9WJEcPVlw
 HM4533qMiJQhy36NLUvFvu9tUvYSJOhmyTj/Krj0f3327BCe7pE1bDBBugOQlJn12CgMAz0I7Gd
 0b11C89GUdey2f+MK/rhvU1h10xJlOi/lUtEVs0A8UAlR73xnYR9Y9S48gCtpsamr2Bg8b2Mnn/
 HhLXomeadRSNx/KpffF4B7D7NBCc2ex3V2kDBiZBw7CvNaEF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX3ykbnKm0ntx3
 /KEbIFZQnhDc2xPYE/w1AnlP+m1ovH86RJRxTA3USPZjakuijlxKb1BTmoB8WG7h+84006F6KAR
 2sPyu7AsscL5j9ZB99cj5gnVUj70uD0=
X-Proofpoint-GUID: ir7cpNypY0nIThESTcaz1FxdhOhCfOoK
X-Proofpoint-ORIG-GUID: ir7cpNypY0nIThESTcaz1FxdhOhCfOoK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX84elnqTKWfAa
 HKyOYKzDTZCKhtnbr9g0Xm1q3j7IAObLlJYtWMOC7i5wBcH+4CJ/OC2yboDunCITXbnOe8nyjq6
 L/ubPxAbY7nNeA0a1glJZPgOHmcdibdZun/AUvih/LJqHeD28TwnJC0FSt70E5SDrN5yagoWKVF
 TaAxgnEWgng3DFPub9zOaAmtvNhEdVpxisYieJhHhqUDVd5A0IUBn2OmiDGGXAzHCMU/SgqdKBA
 IKFzduyNVopTKK8mtxmJeiFEmEOJsV0wAXZf/4F2GZBBQSbJipWYh9dicAT3ustxq726MPf9JT7
 w4TgFdWlyATvxYDe/jHN2nRLz0anYO05C/1Gsctq4ZJJN3ZpWGOnY/Ah0frUjPNgvE/TRIr256t
 FyTzVdIBN1s1TpYrFcfgJEwi8Wyw8A==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ada0f7a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=m8ToADvmAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=KfJoKOGgR5IJitVib78A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053

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
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c |  5 +++--
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++--------
 drivers/gpu/drm/omapdrm/dss/hdmi5.c            |  3 ++-
 include/drm/drm_bridge.h                       | 28 ++++++++++++++++++++++----
 7 files changed, 47 insertions(+), 18 deletions(-)

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
index 1b0a1a00d8eb..4ade63306653 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -172,9 +172,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
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
index e7f9e6d58927..2bc54131e58b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1553,7 +1553,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
  */
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data)
 {
 	if (!(bridge->ops & DRM_BRIDGE_OP_HPD))
@@ -1611,25 +1612,28 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
 
 /**
- * drm_bridge_hpd_notify - notify hot plug detection events
+ * drm_bridge_hpd_notify_extra - notify hot plug detection and sink IRQ events
  * @bridge: bridge control structure
  * @status: output connection status
+ * @event: additional status recorded by the sink
  *
  * Bridge drivers shall call this function to report hot plug events when they
- * detect a change in the output status, when hot plug detection has been
- * enabled by drm_bridge_hpd_enable().
+ * detect a change in the output status or when the sink has reported extra HPD
+ * status events (like the IRQ_HPD in case of the DisplayPort), when hot plug
+ * detection has been enabled by drm_bridge_hpd_enable().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status)
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status);
+		bridge->hpd_cb(bridge->hpd_data, status, event);
 	mutex_unlock(&bridge->hpd_mutex);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
 
 #ifdef CONFIG_OF
 /**
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index c542ba6ce7d3..a21f9355594c 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -427,7 +427,8 @@ static void hdmi5_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi5_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    enum drm_connector_dp_event event)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 6382ef5f1ea2..c839a6993a83 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1208,7 +1208,8 @@ struct drm_bridge {
 	 * @hpd_cb: Hot plug detection callback, registered with
 	 * drm_bridge_hpd_enable().
 	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	void (*hpd_cb)(void *data, enum drm_connector_status status,
+		       enum drm_connector_dp_event event);
 	/**
 	 * @hpd_data: Private data passed to the Hot plug detection callback
 	 * @hpd_cb.
@@ -1517,11 +1518,30 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status);
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event);
+
+/**
+ * drm_bridge_hpd_notify - notify hot plug detection events
+ * @bridge: bridge control structure
+ * @status: output connection status
+ *
+ * Bridge drivers shall call this function to report hot plug events when they
+ * detect a change in the output status, when hot plug detection has been
+ * enabled by drm_bridge_hpd_enable().
+ *
+ * This function shall be called in a context that can sleep.
+ */
+static inline void drm_bridge_hpd_notify(struct drm_bridge *bridge,
+					 enum drm_connector_status status)
+{
+	drm_bridge_hpd_notify_extra(bridge, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
 
 void drm_bridge_debugfs_params(struct dentry *root);
 void drm_bridge_debugfs_encoder_params(struct dentry *root, struct drm_encoder *encoder);

-- 
2.47.3

