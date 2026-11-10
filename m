Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286503;
	b=p11/kc5LtaYDFFOooOYD5fanHOqg4/bFRFMEUkKnTl/k/248YDXPfw8m8c+63s5HVIYs
	 xpDrtBeK0BjljDMQKXpEg5FCOT2Kl4F9/YDaeWOqVqwjiuHYTaHB4QETrHAEehIONYDIf
	 u83esf+WOPmg9M68OZFmcKBT2LaLQwVsdRUiTDD8tnE5TNqNTL/MAfM0TppF29E+Um/tR
	 Od+sM0AAmT9FYP67KLTNY9ilS29yCOVfyeX2JqPyZJry+BgCTyuKiDvy2e8AnGOf7VqxL
	 DCXODdf1GMQvZXgvq8AN6CFr02PvvSEWLpJj/ONHrgoX/iEGKrv7KVYsz02bn1tIm8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286503;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o+4gC9v+ruTggTrvIA1zWjWIgQFEi8q477yOKxoTCWo=;
	b=Tmb0JuD8oxJ3HYlBZCdUAKL8vYlKHB0O7MkM/PK4AUP6g/nYNNMKUQm0yQJAc+HetlOJ
	 Uk8IBwktKgX8/u/OUBKOKKHWYWRmzW4iwj4++Biso2ehZU00NRhAVoTjrKKmklqgrq0pR
	 S3nVEm7HiPGw/z1bGwLrWGJ9MgUKHxuzNF6DwNnaVr0VDx/CqpuOyfrLzA0NNufyTsfHA
	 Ic7aTb9qaer+m4YnncaOvw5ZrDmBTwU0fTThC6HQ5PmPh/w1qnQIleQ1rQN3vhl3IdgO+
	 WCDJB3HvyGxToxush2SZuHk19R+IhbiLomlt6FPnDN9mR6itsZXVAEDbScLx3fxZZpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WOepiCYz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+TWmg2k;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB2A606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EB2A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WOepiCYz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+TWmg2k
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A6JO1330787
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+4gC9v+ruTggTrvIA1zWjWIgQFEi8q477yOKxoTCWo=; b=WOepiCYzZxZW5qsF
	Hgate/qHVjDxmMGqXyDyC90/Wt8zeS335/GAom+5VaBwty1f7dHk/yBc0Y0odrz6
	s6WWcynpMO859vh7Ru049HK+rd739oGY3h23T7eKvc3QK/ux6GpGMCDUedmARM9h
	faZSdCdhHc+Dvl8zS+h/uPahvCipofS1NFkS4wBhHbtozYsE3xi++ymZOkC3/U9q
	WuTKJBM8bLAn8vlHsXHrAzo0PZcOmrSky21O4/lfI8yQI2txsYUBZBzuEok57LCT
	r6FwC0f62gCj55k5cG3V39B/Q6p0spN0Kjd98VhMitkFLkg8WvPl64DW0CfDOqRl
	0JyjDA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcjbfxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so351405785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286501; x=1794891301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+4gC9v+ruTggTrvIA1zWjWIgQFEi8q477yOKxoTCWo=;
        b=H+TWmg2kqNWc7RZVatUqx5jC6Sl715cnlvg3SVnEiCgOTG8r3gM4bRmt9RaQxWsNNe
         w6g4syS9euuPeLER7i1Y+9BtYDbdDMT6T1M9maaLMcRFj6fnJdZVWyfT1/NOxonJlolT
         HU13/yXXYx6uoc0REzy/+8sBCn1j+WNjWUQv3WwLoq4vgVtFXnIiEdyJlOMJRSCXS28q
         cZKwg73Wialaif+127EQLKKhzlALsTwpB16LUm5QM+V6Ya5SWOtVEsnx1D34G/pGl3pM
         R2Trk8JpgyrAmi5mpJA5rxpzoISTjIEKrZ1FvuG9bH/1MD4WmITD+DuyCiKtI5LOuCbK
         cAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286501; x=1794891301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+4gC9v+ruTggTrvIA1zWjWIgQFEi8q477yOKxoTCWo=;
        b=tOiKChhRsJUyWiVxz7Te+AVUe0jbHMPuax2SWOjyV8vrNE8je16QQqMAjMdo/R4V5b
         crsfVUXk9bSuoN2SYhAdM21Y8KKbkUS0nlvV3ncvuEQ3F7IluJlzmONLXeyg5wV7O1qJ
         hJJxdiOihE/O2yhfy5k1cBQCr3D15suG9PUC1ezCq8QO8X8AZedkAHU5aAC7jRRhrIy6
         4xRB8rwGeOTFyeiKdE+fOKo51BqqF8aeE+Q0UAxnmlDQ3niDXCNw9VmJUS4gJabHIxKQ
         OuaweFWE+7XYqTcTQvTreyQx1JR7AekvQP2a1J7iaX9BjOmk/TXK33YFLzMNkumD6Unr
         GcEA==
X-Forwarded-Encrypted: i=1; AL+hErEV/4ai3shV2OhMXXtsDZ8orTVTSlJAVOZCzRKGydSPjeCrmC6uLFTo3ZoTPmEvKL6jvCwMpcSFt9shGQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c0zRAv6km8Ob+29CXPJA/H6r2vm7Jz/ORS8AQcYtsT3IHSIkj
	1Y/giaZaO4TI7O0XzLy6mtwOs0PyH87qaazJ/e+QsqLNl0dX47arZOXo0JT3HC8f4YZRKBTYPpz
	afnDsGVo3cXYVueWRS0GeeUxJMLr1A4aF0E2X7Rw000pdsOGNxjXbaSRk1cbdBga7Nsk=
X-Gm-Gg: AYBFou12TeUwRDbBRZcqzwR6uG8+rJRebFqR9Wq1Cb5AIHhP4lT3fweAzrJvtiDZNHQ
	JmnHgvXq12NZu9Yf/4l+iviKf5GDSBVpptrzaHuFN8AXP62vdCBKRuEqepf0bGyzaV0lzPrMqFR
	5u5r5sxHj/d1LE7bprfYd2igOh+nyejdaCDTcRmWO6Gq79Yz0QnCc6kWRqZQ6UXd/MJIKT1qtci
	YBycg5fjmTVrznb6aYrsaTLWwK1e1hPsWKj/ar9NAyj0Ag4kBTdO8exSBKTrs/mJImJ+d8s/HkD
	wmF+bUkUE9yRRLpXUXEWJeUmtAQnKjI03fGhao2tc/HqFRrQdpHJr1ycJLCY2/+PHim9W1qvb/h
	taqr7TDljug8z0znRb0q/XjJrntyDL/EOrHeTsNT+pvFqMtaqX5Sd3k4I002paD6i27EuEowxjq
	DjBainafW+SbbP1vKPEG8EXjCrs9VOjjzrURYi
X-Received: by 2002:a05:620a:4722:b0:93f:568d:ebbf with SMTP id af79cd13be357-9479f33ba8amr246376985a.75.1794286500871;
        Mon, 09 Nov 2026 20:55:00 -0800 (PST)
X-Received: by 2002:a05:620a:4722:b0:93f:568d:ebbf with SMTP id af79cd13be357-9479f33ba8amr246374785a.75.1794286500317;
        Mon, 09 Nov 2026 20:55:00 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:55:00 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:26 +0800
Subject: [PATCH v8 05/29] drm/msm/dp: always program MST_FIFO_CONSTANT_FILL
 for MST use cases
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
Message-Id: <20261110-msm-dp-mst-v8-5-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=2543;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=j2fqlJcjMVtjRnKxnkNTkMekgG+qai5ABTbaNabRSf0=;
 b=ENcaNasL578wGbSz7mh3yjYfPh1SGMpHK+rUDVSVqTXgskgMTBlJ0hnSef8jsVtVVlCktM9aq
 U6l9gtc9IysALu77JpO0l+Gm1fDVQ7zLSJpYXu11eDyTTzXdaSK5S1n
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: xMzRZX9_jd_lQNZU5dGBEQUOaWudRWFJ
X-Proofpoint-ORIG-GUID: xMzRZX9_jd_lQNZU5dGBEQUOaWudRWFJ
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af2a3a5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=_o_Q1azn2oY438DeJ5EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX1X/IFHEFBSI/
 WVyuSZNOaeO0IdF2xrIk8B3ZOZHvTqolb+pHBuyKPCtVymm7j1SAtoLHlYLzAa8cmYPE6iHc8Ex
 spSxHRQ16SWW1o0zn7Y0jD+1/rUiz6s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX3m6fjA7z6gng
 DVn2wRSyqxjkY5e1mmr8k0tRFaXpWsR0oYyVrus901/NwTROYL6X07rLTI+hCyFX+mUbh3aE08w
 XsOVuo9cy30QkFJsoues1XrPeKJ6ygwekOeNt6ufJ6/k3T0dQuLgy8BuMjp3ZgoA7NUSsqs06sx
 SpcdFPJmUYtfVggrQTHotyFn+NSgJJyagXdiQ6ERAwmNXuDMxivYI67sfI8m+IHo1n5aMssBxuW
 4gok06nfak5TZh6f9xOR+rgeR52Y90DhC3CDaNysa/DWVVECxD/bh/PwkNs/ggaNZXFFLQZnptv
 5Rv4JUJusJa0r9JFweGMC0MxspXtl4ZOMpJdO/C1wwNuN7jpRr+nj0NHY7p5rGXxvhHY//NfJq1
 nGDzNKyFagS0fM609IwWpG9XpmDfe1GbE2iJIdgivRbcjLQrqHI263OszvWgyvJxivXtCav1Iww
 rB2r8htI5cvBKsO19YQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100019

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

As per the hardware programming guide, MST_FIFO_CONSTANT_FILL must
always be programmed when operating in MST mode. Ensure the register
is configured accordingly.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c  |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c | 12 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index a7cd3c87cd7e3..249c818fe79c5 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -584,6 +584,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_config_misc1_misc0(ctrl, panel);
 
 	msm_dp_panel_timing_cfg(panel, ctrl->msm_dp_ctrl.wide_bus_en);
+
+	msm_dp_panel_mst_async_fifo(panel, ctrl->mst_mode);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index d3468b73fdc32..bc7bad5ca3b18 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -741,6 +741,18 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	return 0;
 }
 
+void msm_dp_panel_mst_async_fifo(struct msm_dp_panel *msm_dp_panel, bool mst_en)
+{
+	struct msm_dp_panel_private *panel;
+
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+
+	if (mst_en)
+		msm_dp_write_pn(panel, MMSS_DP_ASYNC_FIFO_CONFIG, 0x01);
+	else
+		msm_dp_write_pn(panel, MMSS_DP_ASYNC_FIFO_CONFIG, 0x00);
+}
+
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
 				 const struct drm_display_mode *adjusted_mode,
 				 u32 bpp)
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index dc046fec24fc7..04938b9d2091f 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -72,6 +72,8 @@ void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel);
 void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sdp *vsc_sdp);
 void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel);
 
+void msm_dp_panel_mst_async_fifo(struct msm_dp_panel *msm_dp_panel, bool mst_en);
+
 /**
  * is_link_rate_valid() - validates the link rate
  * @bw_code: link rate requested by the sink

-- 
2.43.0

