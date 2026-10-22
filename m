Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675714;
	b=iWvcdA8O3ZiBmttEN2EuBovyF8aqcQ9ToA6ip0ebAorosfOs59YVPoUt8CsF9rtNYH5F
	 rZjYeIm3mddYvR14UcteAlvzZE8w8Bz3RHxsJ0xoxnSq8IuKT5wqXEW10B3JEWzm1UzPD
	 +BsyhFHIcCQoM71vPUP2WKx26Y2hFOyVEDUad7d3Oh9AAK2pu4KfgyadFtAJMuU3rMOLK
	 27xxvsChOtoKEyD/2xfSgb19NZx8uqEtpw1w4aXWcX9U4e8Ezht0dQHgQ4t6o8ShvcxVJ
	 aJUJpTUBLMs3+7QugdoGWJJalHlvAKdAotpSFqzpRTuEGEaU4G+XjctLp9KvCBC5Zpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
	b=NJPojV8/B5IYUTjXVqkGXysz4CaqhnZWs16Pyh+ayXloNrd7Yk7wVj2+zFCZjLJVSNSX
	 YCY68+FFQDP5UOQOFzR/n7L+3oBgTUmP9octNHYIGUHwkmnytXDpvMlDFyXnceJF1bS6j
	 YVDoHawHKj+SGS8MefE/MGqlHFo1vW+1Wb6Qkk69gu4ZJYqB/nn2KdstJjFe9OloNvDQD
	 DRiK7kfIO1Otd2k+B+saupVGkMFMikkEuO2GWYkZ3MWtFZuu48NpnrVR/KVXntMVyRnIC
	 6TZ/wBObqASB6W23v4f77Xwx2ax4BVvUWg5pDg8mdGbwRixkcJrX9uh8TH5dBOtM4Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lDZZTSrs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fWRpO2XM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B8060A3837
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28B8060A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lDZZTSrs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fWRpO2XM
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MCPr8t3807647
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=lDZZTSrsyHzIsGBU
	PNHByJxzu03sVuEFd7YCa9N4r/dTQMKGmX5g6LTrvGZKfxSVdSkvQnawX0Enj2Zs
	nW8hDHxxVDkC7W8oK0W1IHzhDvyLhFvjbe/s/UmIPaEd4W/t1M2uOgmhipw2JXJQ
	twptPeIl5am4ilbMTLfAM41gLjjifhlKDZadM8+uw/8xXnssNP9BAb+54fS+/KC1
	oem4zKn3O3B57IvTePSecSpKhSbe07Y9FAURIXt2xn0Qu16IASAjB6qBhOACCJ6k
	xqnKWxsW6B575ZHIaEg/r/xyVHw1NaOTQSGgi+OkzIbX3aXI9wYliFoMn7FIobxh
	nKHhCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93auqmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:28:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ca9b53afaso585733385a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675713; x=1793280513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=fWRpO2XMwSTFLDsn/wzLIxXKg5eSyZOwD+t0iJP6E8TCY8ZTUN7Huh3oWuktDppomz
         sRtTl3mTIqZJnmX2HTml8EUSYZGRkesQErkdlaMctoG6tZNZxR9walnVbLXgWXVPHqlI
         4zOof6s2b9tOM21vn5lZNImlA4ffZqn0y+udz+DxfeV38vnUjaRlJ/jUy22tE9TQTTjc
         UPNNs62YS55+tTCpwNH5H/ltBjE4YTvgjDzyNqcucYGyXJYyRKvcql6CjWqhhubbBJKp
         Bk1YUHYg8RNDfll5RO6bjxbLa6F4C9mUjeYm1sSC3t+yKPB8pEcr/RI+oGguIgmN9v/z
         agTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675713; x=1793280513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=G0LAmpspaRbqYfa0Uc00w2NO3eFNO3Gf2atYPZVtcW1B+d4C/0Ri1acJYtldYsk0kk
         dEPtKAPvXkSEBQjWf6FeCYdSL3BBWT2x/JGbqA3/WNHMpmer4rQqsbzu4BhRg1xsxUqL
         XIf4t1lswbyZ1AImMGOiPMwZkgXRNSxt5RhSNaIYaChIJd9b/BntWAdUpYaq/c4Oimwq
         UsgwE9QO691A1YyFNQLwrX34gkeGwp2D1+SPJA+ifyrysPCMdO9MZMIL7e60Mr59oGGo
         dqG/AHbRjKifDEMrCc/mARKY5HBrvSnuxVyK22Bu+0eWP8uLAlrTb3LdwRbfaHglhecZ
         YVgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdxW2HWns9ctfq38AZMxEKyErGWiBShXOg6h9NFFmPqoV1EzFxu/1/J3tMWr0VlCHO0SjrhnuEpDKwU8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvJjSLpvX34wwOrSsIukCNNAKXoO97DEJ0XcjXpCXu/sYmxp5Q
	RjAmWZlG1iOhhDQmpeKMFO2RkOUqZuwnAeMgs8Kv72+6HKFBLq3T9MYj3JeSr5zE2NxBfulGjYR
	s4HV/kR5k2thlmJCG8QUjCamDfPJjeFY0f0QURte9O1472ppC7Y7JQZQDBEn4hhlv7D8=
X-Gm-Gg: AYBFou3goFZWVnFVPGir7fbMDp/duD1PhYErl9k9zRuPf6325Bnc+jfbAExfQ3NXmFM
	0HYNnAp4wThExcSOv6clSgMGxb+eszdQiQu0KdFXIz+IHu/thKGN7KobWCkPfGwpU9ub5/mn91W
	8k2aZ6NiJDTGOlgBA36QU605JRB7W+m+B44d6oV2SAloDgNVr1/csSDYDZdeGlyinNuHSCiOfLG
	MA77+zng3k3GJYPspy0o4/1rT9eqU8JKzC14mGjgmbYQXRTO9vo/kaR8xNFEuSUeO5B10K8x94Z
	54LYT8RcbHDhL8vUN36Gru0SgICdAlY+RwVuH8L/rluNVtIesgh3cKFAsrcFfIobipjRRwJhXax
	Lk9dVPEB+nMd/xRqkVjbUA0G3PE+jtsCLPF5zomGmf/3ddPA87v3CkfCRiL5zBQFTTW1+nsF2aQ
	o9O1ZuKLjQTfUk
X-Received: by 2002:a05:620a:4441:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93f57f0551dmr905865685a.25.1792675712627;
        Thu, 22 Oct 2026 06:28:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4441:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93f57f0551dmr905861085a.25.1792675712171;
        Thu, 22 Oct 2026 06:28:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:03 +0300
Subject: [PATCH v6 8/9] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
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
Message-Id: <20261022-hpd-irq-events-v6-8-337ea3ddaa62@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jYsdop2BAded35utDpfgQd5r9JZyyy8UmHQPRLGSyhM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9n9zhrOEK/rx5gX2YWvMmc8jjptMWLaOtO8
 lGcaMlPGN6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZwAKCRCLPIo+Aiko
 1edwB/9YWfc2EM5dtSwi1Jbu3T4rlHmDDCXXx/nWp1kfXy0H2CCngN1eB6ZYMcxQtWmtadH7jVn
 o1ni7leB3t6qsyNfhfjzVK9bH5DxI8ykunhBwboni1mwzg//NnCAkchdPC0bT/n15WxKQCLyNcm
 Z/qS/EDw2gQ2yLhg3dHrpwM8RPmJ9kVwIvpF7K7Y2gbF5wAGLrBYa0LvtwCVS35/K/RvlHejThf
 6VdCYsYBJHHa9HS8h99g1E0vihe8vNmkSPwrHgdocyqB1rPFA1Xs2dD22Vyh1WLnDJ4N/9m0iag
 EISm7/cQe+/sZsMYSOeTi+FTCVIt+wn8wBzeI+jPBp4Kl2KP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX7FTsz2Hccxiw
 en7oOe6dpLngKU8xZqViKWZSv8BkJwmc9JCjQRDlw4obvuVc5DSrsGyH1lS9HTriSqlXMfS0Zz2
 oaeDIe7OMjDcPdn2sePjSyFJ6Y2rGF28W7W+bOo1X2TDHh2OaHTl8Iv3nTIWEu5x4TdYcNit3cp
 7kwBKX8BJeCC7WXxTMVadX8hErael7M3xssUDyfKjH14EJYLdk2WfQYVE07egQEoaJEw8OX8dI2
 YAgjVzLKmg3LJT2C12FOXIsdGCb5cwcE1hxvx/b40HcrIWlM/CAkLQx4njnDOfI9p5y0yV2IX8P
 kEqYTmBu2CaSRdAyqA63o/DPlYuaCYfG7sjLsP+oeUQSXU2WQttRg//fLEoY9tQZpSaacZV4jiJ
 KHxzOnxoqlB/kc/F7mvGi/taHrT57w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX+guFzFnlI27Y
 R2TFl8krNLLScoZJvtdIaM3dR+eoIs+HJ4J5gnkzaZuqoVtD9KMjvAnkVqhREAsp68dy28iS7dc
 TOHbLSr/vg419ABcKJc4/r8WL3yBYgc=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ada0f81 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: xXDEYYu_yLKfobtrMtB7BHTeE1RrDx4n
X-Proofpoint-ORIG-GUID: xXDEYYu_yLKfobtrMtB7BHTeE1RrDx4n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610220053

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

