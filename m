Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF663FB04E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656149; cv=none; b=Np8C1QfUuVNPjuxAzzqPkt+DOysn7Z500CaQYQ3Qo4ERpGIBH8ydlpDOiKCPx6frnRFTy7Q4e9LX5zS2Ka7L1/whCtZ2kt+Y7rb0ptxGzt/5qooKAWGcFwhkUWzj2+OAfAEUjrVF+CoMvb2UK7UPMQnxTdAm1RGGi37wwgimPRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656149; c=relaxed/simple;
	bh=5HoDkLOV8SkieCOs56wkyW3/fJOyikG28UiNJ6xOq3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iklvfL00c9RPTuD4hnCVPgx4Jc+sk3PIP6y1AHeZ5sP9Pl0Jl0PFFBAftQTJVNUE3II5tXLZF7qKLUUbc+8TnnqnL0s81C+EBpRNzazwgzhTmPOiCyWOgGI28Dzk7ka2T+wMlL1Ssu7tagIwRkVaGyCNpgFth75kTALtXdL26/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JU+EqN1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EwsK3xNU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JU+EqN1c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EwsK3xNU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Z9U2775351
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fvTWaqBB1PUL3a3elu81DZH8VrrhsuqglzEs765KJ4c=; b=JU+EqN1c9XfY0r1J
	1juZ6nVgiqH6ImcN/KyX0Qw3+zDg7CrmVGwn5cxevs5mst8XbuTapmhpQ6Kd0MwK
	gbd9MSeWOn5lhCZ4PrsmuKsAoDCm/v6OwBx0BlvTBtRvJMpaqBF/S5wId2oQvZLv
	sQs1adNIQ95GsMMGUGTx4ZQrXJK51NOjzmwuF+7DPqDKiuQUxHwDO54pCsvQAz0O
	KuhrecpFicepW+3umeLNNSGPYn8kdtxJyIPYMqea3aNxb6eDZ2XA3rVxfF5Jsk7R
	yceZfaDOUL0kbQ/wnVC64aSmgfsgJVEMmoCi8APEM3uLT5toS2GJF7FnpmsSn10x
	mZKiBA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw224fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:29:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91430af782dso85346986d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656146; x=1791260946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvTWaqBB1PUL3a3elu81DZH8VrrhsuqglzEs765KJ4c=;
        b=EwsK3xNUQZF8ofXvPiqb2QNJxALK8lvmIcpMOBKR+ifL1XZAhRKOmdf/fzFnaj19mW
         Zj1X6gVJzvBWfHkI/MkGaDQisR5wuP90t1lEURNNVDaSd31PWnhe929FeoxqoI1Ycu2x
         P0gQRzEvRBNjjT9DGnbIeOUMbl0F1N/CcrQGVJBU2RmBmHs25BomvwRRMf96fl9SaB3k
         0ATa+MK+69VdEgKk6KNlmdJBZ+rKGsKZXJOiPlgNtJ3ibJQRYHNkKOmVQuVLcj/iSCcr
         KgAjo64xmxYvpIJNU6vL4H/obKjVtDUsO8QIlp9bZBj5Aw13kkEWEcj8aamUJ6uYq7aA
         UiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656146; x=1791260946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvTWaqBB1PUL3a3elu81DZH8VrrhsuqglzEs765KJ4c=;
        b=LVLHioo7NwKoM66yz5jaSXSCoGGxx04jmD9VBtBFa9nHfoTT0jLhUx0gU5mBDig9ID
         L66eApllokyj+ryUmLLlNvWyWvztbWxG+W0CFTEF8ELg9Vx696mhJmrUMJRvly+UOleH
         IkEEZNr+r5XbpjSYxGAYGCO8J4Y4HyT9vXGn0xGTr3ZsyqIh1cHmTQHSyFgwhEnejZ9Q
         XPY1sG6c9l0quFlUzmtuV1qlNlFRBr1tgSNbTiR2hC7PF6eF4XAvmhQbFwW9tUzgH2by
         O6Fs2WkzsnCFqgixV0B5V7RcCPDzo8z6SsbaE4y06fUAd8P7j7Z4donX7fVDm16AtjYw
         m08Q==
X-Forwarded-Encrypted: i=1; AKwUvBws/L/7E9e/Vra5PG1QzwdY+eVvJR1+JDyhmZxKMnRZKF5WlHl2tKm1+3v3U3IWoHErTQeo189J9VVuNKU=@vger.kernel.org
X-Gm-Message-State: AFuF++lfKGEz3joHsBfxUSEWfZ8/l2goKmfjsx8mq3YX/IqbJBdb9LJ8
	QtMG8ZhIJtEF3+DesFeA9hcUYEZTHQx9MmZ4hq5cBR2i13MBKJOWARdd2ikD1m2XbFtCOiZlEGG
	Ccmy5G/c1d5Pb3IztwETsNOrKlXDEWLmc58jQ4/B4q8KEfseDa+o1gLLWzCKLd57ImBw=
X-Gm-Gg: AYBFou2uxZgUCydubFcvLZcjnM4PChuhL0ITdz78k3WK00fCt55oFL0Sa4ejiEEoqx9
	BGGMwTDIrCUEhTjleGx1SqqONp0YAu96hScxHHNOyjgOgdjz0et230dLlx27JreLtYKAJr/ZdFU
	l2YLBqgHvfNCdpA430Pmby+ATlhSqnTkBxKM6TIX6Vmdqsze5I98PC/FDeE8SSN+3+MP47+xdhN
	o/t4YIAQbQPPP6PdQmJo+e2/bQRdgHvUagcFlsJysljLX/qFokAUtznGpoZ2Ave6QQFuqTAB8lt
	GK8fOCxvSQr9aBv2bEBdHaDI7aceURGqpFB/zHUbClA+UXAERcj0hhK03YT+uPr3AJr1NipSQta
	6dEnysi/kD61NfbSFFp2SL+4W7xwk7HAtjrtD2Us2BzeMwqq8jraCv1sEPof3Fnk=
X-Received: by 2002:a05:6214:f2a:b0:915:4229:17a3 with SMTP id 6a1803df08f44-915422924a5mr124915726d6.25.1790656146440;
        Mon, 28 Sep 2026 21:29:06 -0700 (PDT)
X-Received: by 2002:a05:6214:f2a:b0:915:4229:17a3 with SMTP id 6a1803df08f44-915422924a5mr124915496d6.25.1790656145969;
        Mon, 28 Sep 2026 21:29:05 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:29:05 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:58 +0800
Subject: [PATCH v7 34/35] drm/msm/dp: order IRQ HPD handling with plug
 state changes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-34-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=1741;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=5HoDkLOV8SkieCOs56wkyW3/fJOyikG28UiNJ6xOq3s=;
 b=X5hZ0+OuSpBi7vR5rueL5+opW/dz2eAd+1WNy1z7PZWcpNAWiBghYD2OAf4MvD4N1UMNM1RVr
 CzBODr1vmXKDHHs2ovFFQHr+p1qRkd4UjzrQmks+015qqWB6lAvjk4h
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb3e93 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=BVs8Im_gJ9IRW4vRDg0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 5XNixITgcd4N8-EiN-IxM9ul3E3qwqfg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX2gYoxzNPSpPx
 Jpfu7MK8fsfOyiVFdYZgPqWeEZvzlU6ADaGmcN3waumAJjpfWMHich2nIyTahUtwHWeMSJVy0Fl
 HdlQp6jce9rT6Q6c3iUmaPzuqKYQvtQK9iO7AfEdBRxr8FIoFx8xtC3oD+czXd2Lo9KBY0xaGLn
 G9/g2OJsEZ2hMU/PGlzLbDseyTn5NqHWWsbAON8pLJUUvysAqM9GdC5TVjRcbQIbiSa9ycOkpp0
 0ujtHZNt3hF3oXw/nYrkwNDRbZuCcw3N+sZvJTVTNs+1mdF/rb3zH6I5O96dXtK5Zt6nIGUSFxi
 fNA1TMVdfJnfV7MrP20+i8A4Lk9cvuCjdNotszlt2DZWn1Wt3+8rJODHnx+LP4Ref0DsIL01Cca
 boab06e8OHSzHzsmhx4TaIpR61RrDX18/8MBGX6y5aNCe5L12Yul4Jqxeh8Q1gtrT86ufJAXxeG
 w+iR+mQppsv7tmKTSVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX6teiJFo/Ie/F
 o3b3xYbaW4WQZmcvKZSAmZZLUi0Mz2d2b7ul3TvYkFhCAssoEvQ2xrKErMKV/LVGXyXtiecDQ30
 B2GymUf1PNQayKDVzUnTxN6DsyIxq3Q=
X-Proofpoint-GUID: 5XNixITgcd4N8-EiN-IxM9ul3E3qwqfg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

IRQ HPD can be reported with a plug or unplug event.

For plug + IRQ HPD, initialize the link through the plug path before
handling the IRQ. This ensures that the link and MST state are ready for
IRQ processing.

For unplug + IRQ HPD, ignore the IRQ because the link is being torn
down and the IRQ may be stale.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ed0b93e3bd08..94446bcf9448 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1129,7 +1129,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
 				      connector_status_connected);
 
-	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
+	/* Do not access a link torn down by an unplug latched after an IRQ. */
+	if ((hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) &&
+	    (!(hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK) ||
+	     (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)))
 		drm_bridge_hpd_notify_extra(dp->msm_dp_display.bridge,
 					    connector_status_connected,
 					    DRM_CONNECTOR_DP_IRQ_HPD);
@@ -1818,6 +1821,9 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 	if (status == connector_status_connected) {
 		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
 		    event == DRM_CONNECTOR_DP_IRQ_HPD) {
+			if (!dp->plugged)
+				msm_dp_hpd_plug_handle(dp);
+
 			msm_dp_irq_hpd_handle(dp);
 		} else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);

-- 
2.43.0

