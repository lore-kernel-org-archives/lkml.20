Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762819;
	b=IaTKEJBk1kB0723e0VTz97q/7VyrhVlZto7HrdUBHGyVEUIYC3eZVnABc5CfXuUo+k6M
	 +lge30kjADUCBas7qHjxVX6ClKPgf98i5D3hpbxsT8YP29ZDNOpyVXDTPeBFAkS+mfEYR
	 cB7W5TB/RIVIHVgkoFarbhwUNDzG4ynJ6Nh/aAPN84IcyvChEJVqsB7+LWbDuFOdkuyD0
	 HmgnFoyaOmihwIU+XyyW4oLCsC59gkL2ssXqQmA8NlBVuAtiAlXtkPvNBQbfF3nxx1faB
	 /M2Buomvk+BgSY3estDcDHyvHVOwHVHhrLiDzy1mOLjSe1zaRyvXW0xdL9Qtj0RZgCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
	b=KpDeidQHxYcIwgL6sOI0uBbDxQTE4vXBL1Of39gBkExGwU6ndn9JPK0xEpTw7Wq1Ac2n
	 0igSVeU+UJKLe7igLIt1LSlH9Sgv9pBkCBKoEHp2tZZz7iFJ9nj1gaOXLUSx4/whHjeDS
	 yeOwvKYxy69vvgEMxg2DjK78YF03hdpTRVSuPVkN7exHGD8IH3G1t+IznG3Yx/eNH06G+
	 CKwAaj9/kYeztIc0uqXe8kqQzaVA/v7kxrV5oGnpZesE6i6wZk8Ngxf0f+jxWKRd/DPgl
	 HEgQaO2LOnabCKXDCCSKYQE5AmMnXrIynTCAc2qa0is/feeQclADlf2VpL5HCIaCxPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zg3PiU9q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WrzhrGPr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0A5606A333
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D0A5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zg3PiU9q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WrzhrGPr
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAUhL1948366
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=; b=Zg3PiU9qK0tppPun
	NsspjomwNbA7Q3M2FEW8bViXiyhEwTBhewpJU1QOtdz/9Vq6N/xGDk179SBHhGYd
	z2b7OXKyxKFr9eY6lud2eagqwV7Pyq0x8dsik6CzOszsefGpWji4GLyWZgKJRJV+
	KisIhC+SwX63a/RXDx8Y2wdc06OSUXRopsrK5KdjEjtMBXIcojsdDwayUhphPCj1
	7Rp/YEUHPVgMXRxH/HoXb/RnRewYY31lJnnoUm7N6C2n3evmS+7VZ+K0BORCjalS
	VLG+hirHdGSM7O56TQcyyk7zdj6WSM0NLNPJ0qkux8AYn6kGpQZVVS+ZNvyJPext
	rUYD4Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtuwvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so195113385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762817; x=1793367617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
        b=WrzhrGPrqw8lqG3tTKoC3VGfvaTFv/LRKA4VYV7dQEM/7vGs6Na57HhS6bnrcGvzVy
         IRsJPHb7Tgsh9Fdhc1G59JozpxO1CLnVhG2OnYlr8NjUP59wmKf862gybMdJeEFX7oP3
         7AqLKUIUeJtXmof+KjTji92agG+PJPpefKvYJyiaFRX5yKrIKjfccO3n9IYvai6jlecG
         HKGAKQtOTqRpwMgCwJhXVcaR3yo5KTbx3vktGiuqtlvIPXx+A19OuDdNUD/gdkZku7Dc
         XRbhymdq38QG4j9W65WViYHHUDta6X39O8U1cXMEHKUzFQ0oVy+jbh5QRbcARue72OMn
         tZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762817; x=1793367617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
        b=J0tiZ5Ixvq5BbXMwR2XtnffMS8gZsFFs3ZeW95vB98ng20zqF2wWFNFHahNLTMAG1w
         8xnvLlCHC7jPhCM8B7tCeBM0WkUK6RIKcg85OnPhGuqNBMe+yaxk+yrI5JIO9oTtY8af
         YUduIO59P3Qr+xXz8OfQ2/V9asIKI3R45ztv2VctLMTd97YFY7X3CmnFseLigdSAf9CL
         JsEK9HSbnbGREZnt6UXlneH2jgEbU0mk62FwGG5ga9xZTrkOqBaumEx7ZzlSnuto7lKT
         KwqBiDGr++xIIG1i3vtJGpODfchTZywCJQnq18TiV+ebFpCb7UousOarVWPVFatMdOBN
         bA7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxLVz7LN2Ehseeu9UWzes2kUiW+91F81HDhNr519vRcM99HG2qUjjC4Tv2aGa5zGm7AvSaTjmi4gVaXbLc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7aoqLn59k9eHBD6lMXuCpWO4YyrwzAbaP7rmiZcDbTkzdLDzF
	xpAnQzTVPrh8CzCD0KyC/uWtEuKwR6PfKPUZD/R50ECDP2AA0/wL/dpDIkRrZMj5FkPMQruPnW8
	a05POz+yr9DbH54phOY8B3PFPFtuSgA9Bfe8BeCCvxp/dU5xnX1raMC5hNSPABdxwkghHenSEi+
	o=
X-Gm-Gg: AYBFou0P8+LZ5Yo5MYFNA+260krp9gv1nUiwvUwZnBjc0dyo0QBvRamMFHK6b5ajqE8
	Uau+fyBJpbqLxo46RWMwX7KUULpRktCPkKJwzNBAFVwSeAqXdv+wDaYdY4sCSTU+LzXTa5gGIxB
	OM7rDWN1lo3bQ0sfZ59kZvUqNLjs7NYHt/ZTz3Z4uwC072tWeBMCPYMpsS/wnDbmkeo/rFAgNTx
	d3lXWhDKNq6hYuHucQuZoBufZFr/2tCDt7b+6XkfbulxvIy3vidpjnT9lLXIV5NoJaJFj7u08qn
	puTw0ztDBMzsT8pcFcu6C2NyIsqP3r3yKMX9VwdLrLquw4N23d6rQLLDM+g0SFg7sWR8bezg/vw
	Bh9ynAXf/uyuq1aEnTYs6Y7ZOrvbZLAojZDYhSEMfKFF8aVnrnMsL6ljAtsULEWB0ebYGHCkhJ/
	5p+3XaTbnD2YEY
X-Received: by 2002:a05:620a:470a:b0:93f:2d10:ea49 with SMTP id af79cd13be357-93f6f8151d0mr410840585a.45.1792762816428;
        Fri, 23 Oct 2026 06:40:16 -0700 (PDT)
X-Received: by 2002:a05:620a:470a:b0:93f:2d10:ea49 with SMTP id af79cd13be357-93f6f8151d0mr410834785a.45.1792762815720;
        Fri, 23 Oct 2026 06:40:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:42 +0300
Subject: [PATCH v7 2/9] drm/connector: pass down IRQ_HPD to the drivers
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
Message-Id: <20261023-hpd-irq-events-v7-2-57a3aea3f09e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5315;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EorsOQHW0H0nqzv28S1rGKOICW2UJpSufyghXnThB60=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22Om//UNyL0fPhmHrD6nuKbi2vX3GDx0s1bTr
 hXsC6vJjfqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjpgAKCRCLPIo+Aiko
 1ZdYCACfUyt4MtbHR6/ige4IwYp4trmZXbGoAwMtHMMD/UUH5j+5B7lEYrOMjoRsyPM/XHGlOKd
 KrJ66djgMsBcMB7IPANZGY3FqaAwnvTYLklmj7WnOPSgu3roa0DyVJDTf9hG0yTfv5GKiDbQ8Pl
 KmhArrUvjAOC6NlZmE37M1IGxwF02butanpr3L5qsTjcuO3s71a6a/npS6k80fLUVrGMEYea2QV
 NWGFdXw/NUM92MRh8HK3KyD860qCSA+GJ+WtCnFR6Hy2D4nls1AdzWrq+d9Ww6UPkZMgFO7FyA3
 3SVzSOu0HVBdTqlWc59ycZoxM9LHd/p4JO2Ovjobd6LGAZ3h
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb63c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=DclysrjFOTLD0Guyi30A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: FiXekco3lub2HZqz6VCfpU_0k-L-OEoX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX3/pSnvuY5SY8
 OoIK+YRKnz18fmCC6jSw9wNqMSpsmuFwnOTfQlI0qWIDrbSW4QHVRxBglZz6I5nxpqaiUSEwR6I
 32hEqWznDh+3oGpCYdib2rRFVS65Tj2o/wvZFbXc+CJEHmGTpuCoXvC6nZvwYkhqrleu9TgrzCd
 L1kZlFfmxWtBGYIiZbpCn+5HZHCr22Fysg8rjsWTc2LOFAazrO17fJmhd+QCEiVL3C5Q1mCMyrB
 hMNlcFD7iJe0syvu4GNgS+78oxv9uAUGx0cXdG7pHzwAJbm4p5e0jJ/q3Y/EaDvoqpiyEd25nNN
 cPoOpyFelEtYsPTUoLlxQt/kJdVKl/IqylbRs84MvF697RQ8mrMgSEWewML8wXPtWBN0RKhaWS1
 bbZAvRRXVIRPOfVGq8xLzUw2pLZhUFkPS+b28XNs9ZMGhueqaFHrDg0fMFvWdidktu6c7HS3OAi
 lKpvJcJc8enFll2sWbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX5oop1HbicY7E
 zyC1izTbwvPBz9uWrSYf9IbvjRa4x4g3VPnqdJQhKRrScbGlN4QR5mlA61KDlXwahDRmz0Slq99
 VXAqqmgxPisB116H6eIY3hWowm4yReI=
X-Proofpoint-ORIG-GUID: FiXekco3lub2HZqz6VCfpU_0k-L-OEoX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230053

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Extend drm_connector_funcs::oob_hotplug_event() to pass the
notifications about the IRQ_HPD events down to the individual drivers,
letting them handle those as required. Bridge core is converted in the
next step.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 include/drm/drm_connector.h                    |  3 ++-
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 81f3e26f6fdf..898273f60cf6 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -142,7 +142,8 @@ struct drm_bridge_connector {
  */
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -155,7 +156,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -164,7 +166,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status);
+	drm_bridge_connector_hpd_notify(connector, status, event);
 
 	drm_kms_helper_connector_hotplug_event(connector);
 }
@@ -172,16 +174,17 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 static void drm_bridge_connector_hpd_cb(void *cb_data,
 					enum drm_connector_status status)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status);
+	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
-						   enum drm_connector_status status)
+						   enum drm_connector_status status,
+						   enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
-	drm_bridge_connector_handle_hpd(bridge_connector, status);
+	drm_bridge_connector_handle_hpd(bridge_connector, status, event);
 }
 
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
@@ -301,7 +304,7 @@ static int drm_bridge_connector_detect_ctx(struct drm_connector *connector,
 				return ret;
 		}
 
-		drm_bridge_connector_hpd_notify(connector, status);
+		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index e3c8181df6bd..90e27d0b165c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3847,7 +3847,7 @@ void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector, status);
+		connector->funcs->oob_hotplug_event(connector, status, event);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0cd5e6b5034c..911c3b269279 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6760,7 +6760,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
 }
 
 static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
-				       enum drm_connector_status hpd_state)
+				       enum drm_connector_status hpd_state,
+				       enum drm_connector_dp_event event)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
 	struct intel_display *display = to_intel_display(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 4f65c97a89ae..39814f10fcd4 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1974,7 +1974,8 @@ struct drm_connector_funcs {
 	 * has been received from a source outside the display driver / device.
 	 */
 	void (*oob_hotplug_event)(struct drm_connector *connector,
-				  enum drm_connector_status status);
+				  enum drm_connector_status status,
+				  enum drm_connector_dp_event event);
 
 	/**
 	 * @debugfs_init:

-- 
2.47.3

