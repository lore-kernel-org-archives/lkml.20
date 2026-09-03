Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FF5376468
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788406491; cv=none; b=fkZBYPoRmX/C17ctuA6lbYFGQgjCuFZf/ifzXE+L01ZRaqaDV1ZeIxaX7GSBhyS6Cp5eL3Ned3owpNMT7VxlJGEVNMGgC3B//mO+ibgfD3kdqu8M5wEnisxd4dwhGhAYYDuKDUaawkYofLhm/kHhOy75Kb7dVpdl0XKkP/sq5AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788406491; c=relaxed/simple;
	bh=zZGUjvb6YCx9n8jvJbB25pXxGhg60nmlkZDIY6j3MeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oZcieoaxVKep1m+silri1ULLupMZ2OQwC3y98+3Wpkd8auaWIGH+Ht21R4I3FmgYXBlNLPkRA5Vhease8FoBkBDPhKpVGwlDKqelyam+8poKZfWwLWjF8rELcKswM/cMG42PLl62hXKeIlyxaQTsZ0aft3RUXvr0RI4zy+3SzFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwNvRL0G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkaSYvG3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwNvRL0G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkaSYvG3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6832ximn3547134
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 03:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YsL7iQZmCzBBBew3E4bbH+fx6exYIogFa3gd42Otras=; b=jwNvRL0GQHZMXdky
	laLb+4ABcQ/dE8+QoglcxOuocYhJ/yvCiXMp4X73WF3xzPYG6xCtxoAODyAObNwb
	gwPcR/8i0CypKElQDtx4UIJr2y8ZsXoSxv15hYks4yAIJCLraLucP5CCpHoR7hFP
	gT/btMadOEIyRpaQi2KCxWmBeUMfzsYATIneuh9jW8UwEvHJSb1lbHi1IpcosKX2
	ksNbkr+jiDVgy2cg5oLZapSdEl7dTg/4MpsBc6KE1U5IJpW29Uz+RrxoiyW9rfCb
	nWrBGPPIC7e9JbOmwC9vgcniZ4wSrQc+RhXTxKdBh+FPhHygrmzJjfp5VVf7bJK3
	3hq9Ng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8bqjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:34:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8d1600b3so399980a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788406485; x=1789011285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YsL7iQZmCzBBBew3E4bbH+fx6exYIogFa3gd42Otras=;
        b=hkaSYvG3tAQD9gBns1J16BFpAlxiKfc+mf5gAPqm4wBEsmWBoE/W4BeC8t2XhUm4wy
         +qlk1BM+CVD3AA4nt1AGeKz4qa3QGJaYSFycIlyxdFJVFZD0qqUEdpk3g+AuPQGesYDJ
         uRZc/RFMGNc+CZ8w7QEkSopb1cn9s5DEaV0pPtqVTmIVPbPYZZ3aICtdgWZ06zBQLCFb
         yKTEKaC+++Qs7Rx2MezDLqpp0XI1Ee0DQ23mtq7pC0xlEaiuEunynw/DvgrvTo1G9WGj
         ZZwXDJj8/37DR/f1rqZMbmmVofRD8KHhyEO1uhVivJKx1tTPOFMJUguMZnj68OZrfboF
         P8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788406485; x=1789011285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YsL7iQZmCzBBBew3E4bbH+fx6exYIogFa3gd42Otras=;
        b=TQgW2piiCXCNO31hxKzBhlN1TeO2p++aGnsIlP3OgcxsXK9adLzTbbB/lGFWswcojF
         TbBpmN4/GTDub6kZ9+r0sD+maRvYFW/F5qIlBbFLaPIaMADmbwNjmKGj9OySwJdCLF5g
         MzdyX0zqe1zLLTzY9G5zckek0P27WoeZCDdzS7Zk2L4iyB9l2/I7K3ADGx8tCiJi9zAe
         +RRD1U5swOPg021LhHoOqYxOAEkcg9d71k8uBu6OPVJ/JnynhpkkIIUVIAYGW+425lH2
         XjLdO9EB7aVVBmi0UQknEztF1V2tT+97EwImJ41T/DVNhLZX2hC9h5zPb0hcW5rtTBnc
         1jgw==
X-Forwarded-Encrypted: i=1; AKwUvBzWLjzAeEdZ8LXg92IX8b1Q2jD+KRTNsSOLgn72bU5eCUXeBgA9ZfQ5kFbFgCeSkxmmx0G7q6huCrkRLNo=@vger.kernel.org
X-Gm-Message-State: AFuF++lUaeHEABa4W7MTy/ugjajInBUVM/8oai2gSiZ7J9j6xWWFRZ7C
	E6/s9dwh02Oe2vFCKDhlQC9xMldtuav0vXKHVLHhKHGAMavvf1KZ1Shy3dct78NpxUV3LXpuAZT
	Q9b6Ytp84AfH4kIdg1orv3oJASY92bwCyqljo2fpMyplgWtMZfOyz0cqKjJ1HxM9dHAQ=
X-Gm-Gg: AYBFou0enU1I7kwL8ohWQqlHHYUNTrd189e1qkLuO2rgCAw78QY3HFEWi/c5lnJbY4V
	+Fs/l0N9lLwCkpZ/bGG+lwd/cIkxGFtFtc8RpHJjKyQjNfWq8QDPn9vXVtXDCQiWF5+gfBb4tBB
	95FN9yhdlsvQv8Qi7Ji0aEVT3jbGWIUgOP2ZDT2RTBGjBKhftekJOSdDp75fWs9HmfZ6fmQxmxt
	EdXHQHBAMeSQcc5au+9Q4xqdwO6QgNUsi45lz5oLr7bQV1OtvaomeW6ZwwuLlGd//An5JRWckDt
	AvgSuApjBLos6cVgkW4+O2j1IxbHvU7ALJWhIcRrRbwqkfDM2uzuRHYPlhHWRxRVbpxH/9bwtHT
	YzxRmt6kBN8NbY8ZQYQbcNgG3chekN00CZmLlJwzQGYIG0UY26ctaP7aHNuip3VrewkyR1MkOT7
	F8przJM5gXjCbVETNNwA3s
X-Received: by 2002:a17:90b:3841:b0:398:bac0:238e with SMTP id 98e67ed59e1d1-39aee24957amr8725535a91.6.1788406484878;
        Wed, 02 Sep 2026 20:34:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3841:b0:398:bac0:238e with SMTP id 98e67ed59e1d1-39aee24957amr8725495a91.6.1788406484457;
        Wed, 02 Sep 2026 20:34:44 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33253672941sm2375624eec.3.2026.09.02.20.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:34:44 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 09:04:18 +0530
Subject: [PATCH v4 2/2] drm/panel: simple: Add BOE DV215FHM-R01 panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-b4-lvds-panel-doc-v4-2-861738a0d5de@oss.qualcomm.com>
References: <20260903-b4-lvds-panel-doc-v4-0-861738a0d5de@oss.qualcomm.com>
In-Reply-To: <20260903-b4-lvds-panel-doc-v4-0-861738a0d5de@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Liu Ying <victor.liu@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788406464; l=1872;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=zZGUjvb6YCx9n8jvJbB25pXxGhg60nmlkZDIY6j3MeU=;
 b=gv/fHMyoMWmWYkDYIndRSqUHRkaTpxdJAupcpi0ijdNzJB33Xwzw+Ozibq/aEzCNWBGGu1fhR
 jc1rMKkxicEAUFillZ7fPltE5AWdvIBPxlb/85YV+2PlpYyPYCt+lhF
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: YdIV4lzZoTxykca-Id7ok9fk_44m64ee
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a98ead5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bP93rsPOkRt1mgqf1Q8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAyNyBTYWx0ZWRfXydu31u883OOi
 VWvm0njsN/z6sMkS4g10ORbVTLtF/5max94HxkfGGqVNOwWetG1toPiMvYLXciibgfPSXFBUFNi
 23Yr7DmI1vgX30EUdj5rUlh4miVnQtPdlWoV1xOopuklI/4yLglyvPIq3A7rJB4kEJRgeWbIT5e
 1YWFOMffYjslNjt7A5Eg51dCtUuvzWEe1l0NiEemcauXdkDgklVAmTV/RXMaJ43yaY5wDXNhS/g
 WEyF6OlEiX0CewoIFnepEx/fqEUvlDGJVOMoMmo2HRd5CSd82sYRt6f+v9H/m1MfTF9SMYazgba
 Ih8sZxqf3RN2Qj3+gm+gdIw2xzuwElPxiOc0Arh2ngGTUe8sTZ1biE4FV0snwSGNiabNsnZuQ95
 hAUuXo7fLcmaGWIokdU7MWCJqSRBDYewCHBTlwz77MVtlzne5W4t1CagO9RyobHfXbJxAXuOdEf
 N4Ii2dbfYzlXKHalHIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAyNyBTYWx0ZWRfX1yInx2645Lxz
 aoL1gdLo+uO/uvjaC/z2p4A4+gLKK+rk2R3gbxFdKvwQkz5qfMDGMI0+U2rsCjjogT5CA2UQ1aC
 9akSOHDXLvtMrgkKeAAsDLQqmEyCG0c=
X-Proofpoint-ORIG-GUID: YdIV4lzZoTxykca-Id7ok9fk_44m64ee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030027

Add the BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel
LVDS panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index c95964ba25a9..0b516385b267 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1593,6 +1593,31 @@ static const struct panel_desc boe_bp101wx1_100 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing boe_dv215fhm_r01_timing = {
+	.pixelclock = { 148500000, 148500000, 148500000 },
+	.hactive = { 1920, 1920, 1920 },
+	.hfront_porch = { 88, 88, 88 },
+	.hback_porch = { 148, 148, 148 },
+	.hsync_len = { 44, 44, 44 },
+	.vactive = { 1080, 1080, 1080 },
+	.vfront_porch = { 4, 4, 4 },
+	.vback_porch = { 36, 36, 36 },
+	.vsync_len = { 5, 5, 5 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc boe_dv215fhm_r01 = {
+	.timings = &boe_dv215fhm_r01_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 476,
+		.height = 268,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing boe_ev121wxm_n10_1850_timing = {
 	.pixelclock = { 69922000, 71000000, 72293000 },
 	.hactive = { 1280, 1280, 1280 },
@@ -5759,6 +5784,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "boe,bp101wx1-100",
 		.data = &boe_bp101wx1_100,
+	}, {
+		.compatible = "boe,dv215fhm-r01",
+		.data = &boe_dv215fhm_r01,
 	}, {
 		.compatible = "boe,ev121wxm-n10-1850",
 		.data = &boe_ev121wxm_n10_1850,

-- 
2.34.1

