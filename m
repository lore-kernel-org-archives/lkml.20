Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802154;
	b=SMicUKKOu/vmwZ5a9LH79HqWboKzt7/h0ZCUkbKu0/oMeQZFf5PF3uUsP9+HkVftP+ms
	 hdv6f09JKSMKOs88b9cfyKhrzoLMAmp0/ZuR4C+i8V3vIirDdliXp/GWKGETRA4ROr8xi
	 /DZan4onqRbK4RIGVZP7H/aLk6X5aCMxFFi9MX6W50Is3mNpX6SGoS95YvPnP7iCt+/n4
	 ND049dAGC0gCkD2QiljLPLbJ6hQ/YuMFVf9uhubMxUjCU4bOM+/+9/QnmQiWIeGZ5YveA
	 s4sF2Twq4uP+89/gCFgFZCF3CmqEjmqjWAGtgBGZ4eK8z2UfRykSd3gW0Wr0taf9Lpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802154;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1MqBEm9GcwXWuV98ckY8EXxagMIV0AXE/oG5ttG6PlU=;
	b=iOR5d/OQXRYSWnJtL5+1hB3d1Ey+t9kNCXs4Xx/Gzf4AeHkNfu8vuHhW6T8sJ/meYPDP
	 bCTqNrmnjtPC8U5zsbnIutIodk8r8Uc8XLfzbwzUf4CtNVBF2aogdNj05WrgVboVTLHSh
	 5ggVh5G5GhuUFjIFR7kbtNxocxAAglU/TzgfMh4HptAf2gt+QU378HM5rxdTBrb0eE+gu
	 RD5d71YGYVnLVTdGu0eb4hRXSYBabkjIG73adY35/BxbyoyQLpQHBeLjNGr2UUEgP1kIh
	 f+oBTmOaAzCYQQFWISRCBNVzuE/rKTguspmTNudZ2o7TPGob0TbNH7WIt9lvaaMc3mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iSvT0cdV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GB6PpQTB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87F5606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A87F5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iSvT0cdV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GB6PpQTB
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLv46k2962998
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1MqBEm9GcwXWuV98ckY8EXxagMIV0AXE/oG5ttG6PlU=; b=iSvT0cdVgJ0EsrL3
	VeUXDYlR1oe5zbT2nm0wBC4FnO8cxqsNKwrwDhJmAvn9i5lSih2nc5iErX0a+Gtq
	roodXLvWOdppJmPElzGeOnCQjpDETl5gVeLhlfLW6qTCKqh7FYr6Un9Ie4R6i1en
	ls/82xYkae/pNdhQ08MGuYtbltS9LJFdjhEqtuCte+ZEKzudj1kxIWYc54coJZyL
	Z76e/G6Kw/js6zM/zMJplDPRmv2FwKk1DAt+Mo/E5NoN7jKYVgNkBSBsmpL9q8fq
	Bs7VnL+R9stFWJhrI1Wa/UP95RCplurVhAX07Iu+ZwjBfLUvaemJpEA6LyttJ7En
	Yr0Txw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgatc9hpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:35:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so195875085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802152; x=1793406952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MqBEm9GcwXWuV98ckY8EXxagMIV0AXE/oG5ttG6PlU=;
        b=GB6PpQTBgTljpf8xobj+MJt3SHKMOjojoRJx/QVyTk8k1XpSty4EpNxxdaSTYF5Qiz
         M0gjvquNI1XztnguoLB6i3rR9X6/8l8w3w8t/ceZ5Dau5BC1FFqnJxFcLDJsGLWryaT0
         7M1mDGy+lHyxjxCe3HAElFd9qFjFpX7alWfTKOfRRzgtFSvqMiYMnrd8CJkch6V8ZFBC
         tk/PzqGGMbhFUn5F/rq/80bFdOknGuKqBZFLkCFx5zr31y6JP6uDsAX/J8zixNWu7pE/
         U+osYOMHPE24RRwwRBIT8/emdsT0DNrts6bGj/46b5UirxvYhG8WLHwTjqKvI4S/jvJU
         MCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802152; x=1793406952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MqBEm9GcwXWuV98ckY8EXxagMIV0AXE/oG5ttG6PlU=;
        b=M1x2U2oUZoYwP4Td4TyMV29Wois+s0YSuDJd0OUHl8YOZLxQ7QJ2DEadKmz/oS3Wi+
         4DpVc2lINKFMqp4pqENWQGJYJYMY6M/6v/LAMPlt+FdgPPcBdSKKHyytYdIqQ7mboj8l
         E4osiAAtzhD3GlxeqvgdIzppg7oQhiQoT1VYqmRqJMssuEUrY9YMN2ACxBOeu9+j2Bbz
         rmP41CZBSdh3lesn8WfBi+QTthYTwlN/eykHt7HqYWi2negwRcUL8BgC1XtI9gD6E6n5
         og6ax7AqKA9b/IfFpjF6w9USPulIg0ar32N9yVudeezx2QvQv8dA2NUc+utFo+Is7jMl
         keig==
X-Forwarded-Encrypted: i=1; AKwUvByYeVlgwwDvd+iWBx28PgQJRxcS60cZIzhBwSS1KAlEd5dmidlEs0uQQUNzh7yZ/GfJAxLiv5wssNS52Os=@vger.kernel.org
X-Gm-Message-State: AFq9FYKU72I4DSjlOMWuQoMhdMOZqqB8n2Iimo81eEqHOrp7UCvhdBih
	RIqmChPf7WKpIMWwLqt6HLgk/xpfI63zBIVHDV2VHRQ/FGzUn35ND4QnG1pxQzjuFqZGd9bQFLm
	Ttwk76Z9WQDpekFMnS8r7/af8SSzgQqEpUms+ELATg+9Al6PGC1SdEouMqW3mHok1yXk=
X-Gm-Gg: AYBFou2t+e85VK9O2sNq163BKwjoTSekvZl/LqDA+qMIILYB/5Qbn5j7nzkLINFFosj
	rvhJjQYRZY7tmQgddmkN466ZpUlKMJ4+Nj4bSfw+TxbA4PaTs/PaqPs0Tgt4Nr2Yy6vbeK7hd/F
	G3DWHtG2NJf8ibB9p9DMbbP7qWaNI4KH+CBRXEMoeHpnzHX/W26AMOvdxl+gnsipfM+UIxBDi9t
	E8+HNkQdKpSHB3a/GJPZZ4Fy9E9zIEUtqvTZq6iTYjD6HDngwNW0mnD3f0WfoYNqp0UzWBNZZPw
	4VNPes2t03mER9qxm4gFXYeRZsvtA8T6BkNWJB4MMVbiuN8oEtxvQ4B+CcuMesL4arL/xLZetBX
	ctBsBUjfAGwd2KPtQtzYaNSsRTuzA3pwAyc4M7eYoLuy88E8tnKxFOoZpVCQkEz5JbPUaVMVHCq
	mNgrYkA6vJd1kf
X-Received: by 2002:a05:620a:31a1:b0:93e:7ddb:5098 with SMTP id af79cd13be357-940ef914055mr112225185a.25.1792802151698;
        Fri, 23 Oct 2026 17:35:51 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:93e:7ddb:5098 with SMTP id af79cd13be357-940ef914055mr112220485a.25.1792802151133;
        Fri, 23 Oct 2026 17:35:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:35:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:19 +0300
Subject: [PATCH v8 3/9] drm/bridge: pass down IRQ_HPD to the drivers
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
Message-Id: <20261024-hpd-irq-events-v8-3-6ee949e7a384@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5845;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cbl9yZWv2wcwZMEJm5DgazWObDlawl+w/YpgLor6f/M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1Q5qq94RDFJmqbrbH7//o5wMxn1txHfn78s
 w49BIQASi2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9UAAKCRCLPIo+Aiko
 1YYQB/4gOy8ZDd8HxSiS0ermuGBCe/hOc4/eCJhGWEwmzSzxuGvDIciQZHmqatS3ReVi/3StJvU
 dENoSV2zGwvHZbVEK9yPEFib63ePlwc1i7cPZX6HPCVQrHd6Rvt1g3wi93xkccFMUAB/UVKqRue
 F+JA0xVmUayRO2ZgrXX19jyiXe4PvtTcRqKj39KHj/eiPb5tSnL7HvlFBeX0X53be9aycR81pt7
 MR9fdS8Pw5smA9t3HMU14UDhj3PAWAH9VrtqZ2vBYeoDM+EewOEhEpgSnop27oIv+UXDHEaY5R1
 RHAazD8SmCrw7qew6GgxaS9/2xv7WvNkSnfWeWfwgp3Wc/xu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX1q8MGrVxuDZ2
 +a914gI74exzku53ixO1sqRpxei2TV5S5Ik1zG26ug5jC/BOauY1u+W+t3ktN8z3uuHaQ/cF/nM
 vE8gn3EisaMbBBf5xjiESdv/xSD4l3gW4tgakQe7vXgVO8D97g9/dEySJkRLiAoVNKDIxYIv0uP
 lcS6pM3/yDYcyv44htj15qoWz6UPJ9v/XwkWyHGxuyRaipnQlH/+owDjSA21dFUdGveyKxQWNcz
 6MHJ8JJPgNCliu5tY5XdD3pbWCKsp3sR1WZa9Hw9dbclfhCv1GcgOl3eu1bRhCPT7im8qmypwvI
 IDqB+JXI4woDn8KEIwMiPhPD77bV4PZyAMVDGW9Qx88GzHFE/n+iGa+uhFBKhA65zIZSzVyfJbG
 GIyrfIiC/GLdBJtzM8nhEcLF4/9tPjN2pX8MSdU5OMfp8IJkXSx599IfGgw40gnh+WbXssep6FK
 hY3cH/hdr2ht0Ui4ulg==
X-Proofpoint-GUID: Y4Q4DeLlyzhvmxwtfy-Qf_eSvGhPZOo4
X-Authority-Analysis: v=2.4 cv=Scxi5fRu c=1 sm=1 tr=0 ts=6adbfd68 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=s8YR1HE3AAAA:8
 a=EUspDBNiAAAA:8 a=P5073aSicUuGdIvNCfYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: Y4Q4DeLlyzhvmxwtfy-Qf_eSvGhPZOo4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX3obAT0gfW4mU
 KUnIX0Ga8XguIfOsr23TrmGTJEnmL69nVLnSRB0DL24VYotLppQ3EjNl+XUpO8rOeNRa/9fd/CZ
 HzHhh4dWcwZcEPy20/zrQaTv+NIoTfQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240001

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
 drivers/gpu/drm/omapdrm/dss/hdmi5.c            | 3 ++-
 include/drm/drm_bridge.h                       | 3 ++-
 8 files changed, 15 insertions(+), 8 deletions(-)

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

