Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286611;
	b=R9/bg++1sTuhhGbcfeG7iQ1F+9De8YlXHFf6Vg6q+mwFeS22H5hYWM1oIcJDIrH/NCuy
	 z5RAU9OY0zXMeHh3ipnJ6RKjlQu1POwcfcUU5l3fLELZwj81tPJPNmGi7vGB2vtuPLi2D
	 RJ/Vqt0vjcVIy0daL7XJA2ulUqsCWtXyaML7vtzSVvbLs/26h6oc6h7EuSn0hRN/bWU+U
	 4GUgAsjBH+mF66bKH+md97uASoOkMi7bUcfHzQD1GOsNj9HntvnUH4W99/xQK3XZ/4T0Q
	 kT+ppllDdAoM32dilIi4GEpdPMTsO0pHb5gyG4Mz2DFWOQDi7eU8JQRWL5CbwL0/3nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286611;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d+WYdt08Ufsm3x+Oe0Q0W8lqpRG0RHBqFyGwH/romlI=;
	b=CwtiwLgBHwo/phiNKLWwdDlqN1mqiMgE5D/gbhKQa5vjPgPGhK1rl+BvDkI+d1C6w+Fq
	 OKcfqb/R5yiZJOs//mVFYXDmtRt8C9rIPIieRFZOSQGUmVHfRMJE/r0FVPdJgS08KA59e
	 pzZYT9KpAWqaf0oPVErVGpbFdZ1ZhCB6g/XDuHr0MtQZhXSEwQFANIDIJQmEJpGcrC4HH
	 T6bNMKGqoqz8rEQAFBKPEy3HMAoebkXzY6RPMgtCKds5Rc/cXLUIa+etVlJaGgpuuqsrY
	 dZNHK/4HYtHhNlK0jfpiqT7mhR336XB1PWxGCCLiWOmzLy2mLtvyLUuqlADFnr5Q2Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ogXxMzjk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d8gHd0U2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2848560A3812
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2848560A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ogXxMzjk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d8gHd0U2
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AZKN2920169
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d+WYdt08Ufsm3x+Oe0Q0W8lqpRG0RHBqFyGwH/romlI=; b=ogXxMzjkUToWBYOF
	/DrV0VFSkGW6AMne8H+iaRpoagyvj1RY4N4OnsR5sisjxFOZnNMka/oFI2VeVKHt
	2IJJoc3XR2RsHix04GpPjpC+RqUl97rQFHg2gDrg6i9Y+oBEnrztGyRxVhSOrJDF
	Tns4EWFgKAxxK74K3MEpdzQMKQmnGSCm46U2EmO/zWlv37CixswUcHhzmXMnRHfZ
	aQI3YFThIMg8tfU+sQUk6j0MthuF4Fx5L+C6WKs+KIXwZUkqBJS+NVbByQbpZOYx
	+OfhHTla0k0opUFFeD6E0xNWtVThwX6Wp72R0aXciDFf81wX2BnZxSct2Wf9xaus
	P+WwHg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg1r0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2005ce21so313099585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286609; x=1794891409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+WYdt08Ufsm3x+Oe0Q0W8lqpRG0RHBqFyGwH/romlI=;
        b=d8gHd0U2xnBqYQ+CLG/Y9tPaFHNZAvcmK1DwvoYJmeM2CqwDm+qlPZ/+Iy7wSED2z7
         14lUx2crui2fyyOmTqf3Ogh+4i9ERbzi6ZbTnRxHu21YSmafm2pN/L/NaT0h5NaucWoM
         HCn0ueyDlQWgH21v2LY/+nxV2ZQKxyi4KssI9PyQC37sq0qQavq2Q3NlKsVcnqohuDQc
         KD2tpXBsTRbnyzHtbRXZ1CS57zdCvcaE3YJbAijmNcK1NrkiBp4WmJufp6coviFsNrIY
         9trhhUgJFd1ziM5paAMQK+lFczfVeTgshCCuZrC/rhmC/CC4GayB5wsXFLjwKUdB9cxB
         1k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286609; x=1794891409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+WYdt08Ufsm3x+Oe0Q0W8lqpRG0RHBqFyGwH/romlI=;
        b=oir67aEJi2HOnR0TT6cYu3LLbFaTwtzsCGfbxPl1YO5YRlewR0dy46pQT0nS3+fKRF
         rL/jVkgFrYFKsb6qTEv/f9zu0SAfwb+XypzBFHAxcMLbcO7Nh5BuZpTFWryPPTSELIKf
         CpjJckYSso17vC35SHo/KTcTvoU03Z/r+VkjNmRnwBpp7Iyh36l2iqewDItuWAZ6V4iG
         BLX71bQtQYGdlHplEw6Qp6NjqIuqYdk/2M2Hde2YtqxVUYwLZO4UnQPV40gehgBEffPe
         rncl9HnPQT2Uroo8whpYu7gFXQO1imLfiJfxYdklIQNrEEGQBsdRLkQxDFHTLFRZzNhO
         7wkQ==
X-Forwarded-Encrypted: i=1; AL+hErEK572LurX7fFPncW234lCGIfd/8Wo8BQz3o3bXxrwnwrjohGwmNk/Tj0IV1tMen22jjVTh2EQtKc12bWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9u/g6hoTR47wNhpGHq97iYWgdH7Sg2YAYRwL0zIe488nDb5VXr
	73KDcYv+vOLd342Qy8dilFUwpD2q8VBB3RRzLDRk7xW9npgkIzn4W87ocefqoH+omvULiO38qJj
	uonqd6MypUXB8MnRsLlyVHfISzRS4z0O9qRKY/qUy6bXXudsQtK2fVCxBDWHdRB/7xXQ=
X-Gm-Gg: AYBFou3aBxWdg5V/Kx7Lec/ora2oRQD6vRgp05sZjNMmtv5TVqCJwEv0On809LqMxOp
	1t1mlmSogaYQQExfXuFIDFvM6s7gs39fif3OwwXXSEY2UESXtQalV0SNiWO6/1uMVoIHNbAk98/
	HpcRgNOVu29BEDrvtaq40jfaI2q6HEdLd/HWtDu6zlWxMDleVd0KLV7w5IJFGPpDaoFO4qP0ERl
	plPFs0Em/uREmTMwP8LUbMDygdvZg2pWOW6mpdsH5r2zRaexr3FCWHMGU66Sdvdh3wX5u/CAu4L
	Tq2fFnisXPTtfeu8l79lqS/zLI9gqBlQ4bjnQjZ6w+lbpZabSTeZ0jV/U8xN/1hJ/hVeMW8AnvC
	LtwGc2+ATLWRypUnvof7n2iQrSt4QEKR6KlrLjwWPworFqX+AQ79NHvvJ9CDcINSkLtSRVnB7ny
	ab0TJsUFiwjsGrjtgZ80E987yREtFDY/f3WXkK
X-Received: by 2002:a05:620a:46a7:b0:93f:5677:9950 with SMTP id af79cd13be357-9479f38a57emr252637085a.53.1794286609148;
        Mon, 09 Nov 2026 20:56:49 -0800 (PST)
X-Received: by 2002:a05:620a:46a7:b0:93f:5677:9950 with SMTP id af79cd13be357-9479f38a57emr252634585a.53.1794286608628;
        Mon, 09 Nov 2026 20:56:48 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:56:48 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:49 +0800
Subject: [PATCH v8 28/29] drm/msm/dp: select MST stream bpp during atomic
 check
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
Message-Id: <20261110-msm-dp-mst-v8-28-d040fb33db5f@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=10659;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=CPwuoOmLN10Kr6wWpYVMMlD9otxVbPsvSEjJAEPgNKA=;
 b=FQ0zy+S7GNRXYJCUV/Vx2hfM4nirkoWyPewEtuHCfRbZlMXCz0+04bc5CkuX1zOJhXcxBMgRd
 Mqptn+wMrRDCYbYKwM4nGAVpMwgniBOyHThFcZ6j0/vZ0O/XDhDvAkO
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX65LVfYSBlQE7
 2qCXswXlLGBnMHufcEaTbG3DHysa39uBxgmguzFBOfTw7icPpQvZkGsWpIhf+BMxPo+SBK/1sOh
 i6bZYELWWL4fGlWOvklmZohDPKqFhuZqtMvOHLEOePJVQGR5U5Fa0GTKuFhEExCLKU6QYVNFp9d
 FWTPmTV+4IPXEH2RAK9jhlBAUr3GKwQzleFdpb838O7Muen4b9s+BmDpY2HSPvHNjAUxgMB4Wm5
 go7XYQ9Kwqn/y3KDa4h1Jc1Tdzy6xjz6Oug2Khb1d2g5N7LedEsG62kO4KFoaWab38CfboLkYId
 /lDMF8q2LWZrQEvKkBSKGAJv8rqV3DvgLAHVomUvZptl1I1GJlGdB7I53IB3Lxgm72u3i16rC/q
 uoys8/7xC6PePchBGKP8mLmXWeqRi6xdfB/ELVO2KEH7kbSf1UehqBjfSrLFvQzBUY5NCqA/Awm
 5UsK4KKAXqy1zGuW0sQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX8PwLsaL2MotQ
 wMl4ljhuKVqV5vQNOpB888uE3XWPtKaqiEcNPjxKQikEb50TgTPT+f57FRJd9SDs0vdSHQGx/3M
 mL0xXK/dXjiNezdqOJ8mfEeYBPDzDy8=
X-Proofpoint-GUID: DB09aXkD38QepOKAY3sGPrVZHZV3VWVX
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2a411 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JPqAu_mP4Hh-pTAkM0kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: DB09aXkD38QepOKAY3sGPrVZHZV3VWVX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100019

MST streams share one link, so each stream reserves a share of the
link's time slots during the atomic check, sized from the bpp the stream
will be driven at. That size was derived from the sink's bit depth,
without checking that it fits the bandwidth of the MST port or the time
slots left on the link. When it does not fit, the modeset fails rather
than driving the stream at a lower bpp.

Try 30, 24 and 18 bpp in turn and take the first one that fits. This is
the sequence msm_dp_panel_get_supported_bpp() already walks for SST,
where the whole link belongs to a single stream. Carry the selected bpp
in a connector state subclass so the commit programs the bpp the
reservation was sized for.

drm_dp_atomic_find_time_slots() only records the request and does not
report a full link, so compare the time slots it returns against the
ones the link has. The aggregate limits are verified later by
drm_dp_mst_atomic_check().

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  22 ++++---
 drivers/gpu/drm/msm/dp/dp_display.h |   3 +-
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 116 ++++++++++++++++++++++++++++++++----
 3 files changed, 119 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8e30420a017f..b9e01b74dc14 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -693,17 +693,19 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 
 static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 				   const struct drm_display_mode *adjusted_mode,
-				   struct msm_dp_panel *msm_dp_panel)
+				   struct msm_dp_panel *msm_dp_panel,
+				   u32 bpp)
 {
 	struct msm_dp_display_private *dp;
-	u32 bpp;
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	if (msm_dp_display_check_video_test(msm_dp_display))
-		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
-	else
-		bpp = msm_dp_panel->connector->display_info.bpc * 3;
+	if (!bpp) {
+		if (msm_dp_display_check_video_test(msm_dp_display))
+			bpp = msm_dp_display_get_test_bpp(msm_dp_display);
+		else
+			bpp = msm_dp_panel->connector->display_info.bpc * 3;
+	}
 
 	msm_dp_panel_init_panel_info(msm_dp_panel, adjusted_mode, bpp ? bpp : 24);
 
@@ -1604,7 +1606,8 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 				   struct drm_atomic_commit *state,
 				   struct drm_encoder *drm_encoder,
-				   struct msm_dp_panel *msm_dp_panel)
+				   struct msm_dp_panel *msm_dp_panel,
+				   u32 bpp)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
@@ -1614,7 +1617,8 @@ int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 		return 0;
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 
-	return msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode, msm_dp_panel);
+	return msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode,
+				       msm_dp_panel, bpp);
 }
 
 void msm_dp_display_atomic_pre_enable(struct msm_dp *msm_dp_display,
@@ -1626,7 +1630,7 @@ void msm_dp_display_atomic_pre_enable(struct msm_dp *msm_dp_display,
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	rc = msm_dp_display_set_mode_helper(msm_dp_display, state,
-					    msm_dp_display->bridge->encoder, dp->panel);
+					    msm_dp_display->bridge->encoder, dp->panel, 0);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
 		return;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 62400547e01a..7a50367c36a5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -57,7 +57,8 @@ void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp_display,
 int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 				   struct drm_atomic_commit *state,
 				   struct drm_encoder *drm_encoder,
-				   struct msm_dp_panel *msm_dp_panel);
+				   struct msm_dp_panel *msm_dp_panel,
+				   u32 bpp);
 int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 2b96e003225d..a452b3d2ba22 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -23,6 +23,14 @@ struct msm_dp_mst_connector {
 	struct msm_dp_mst *dp_mst;
 };
 
+struct msm_dp_mst_connector_state {
+	struct drm_connector_state base;
+	u32 bpp;
+};
+
+#define to_msm_dp_mst_connector_state(x) \
+	container_of((x), struct msm_dp_mst_connector_state, base)
+
 struct msm_dp_mst_encoder {
 	struct drm_encoder *enc;
 	int stream_id;
@@ -51,12 +59,51 @@ static void dp_mst_connector_destroy(struct drm_connector *connector)
 	kfree(mst_conn);
 }
 
+static void msm_dp_mst_connector_reset(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector_state *mst_state = kzalloc_obj(*mst_state);
+
+	if (connector->state)
+		__drm_atomic_helper_connector_destroy_state(connector->state);
+
+	kfree(connector->state);
+	__drm_atomic_helper_connector_reset(connector, mst_state ? &mst_state->base : NULL);
+}
+
+static struct drm_connector_state *
+msm_dp_mst_connector_duplicate_state(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector_state *old_state, *new_state;
+
+	if (drm_WARN_ON(connector->dev, !connector->state))
+		return NULL;
+
+	old_state = to_msm_dp_mst_connector_state(connector->state);
+	new_state = kmemdup(old_state, sizeof(*new_state), GFP_KERNEL);
+	if (!new_state)
+		return NULL;
+
+	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
+
+	return &new_state->base;
+}
+
+static void msm_dp_mst_connector_destroy_state(struct drm_connector *connector,
+					       struct drm_connector_state *state)
+{
+	struct msm_dp_mst_connector_state *mst_state =
+		to_msm_dp_mst_connector_state(state);
+
+	__drm_atomic_helper_connector_destroy_state(&mst_state->base);
+	kfree(mst_state);
+}
+
 static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
+	.reset = msm_dp_mst_connector_reset,
 	.destroy = dp_mst_connector_destroy,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.atomic_duplicate_state = msm_dp_mst_connector_duplicate_state,
+	.atomic_destroy_state = msm_dp_mst_connector_destroy_state,
 };
 
 /* DP MST Connector OPs */
@@ -142,6 +189,42 @@ static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
 	return drm_dp_atomic_release_time_slots(state, &mst->mst_mgr, mst_conn->mst_port);
 }
 
+static int msm_dp_mst_select_bpp(struct drm_atomic_commit *state,
+				 struct msm_dp_mst *mst,
+				 const struct drm_dp_mst_topology_state *mst_state,
+				 struct drm_dp_mst_port *port,
+				 const struct drm_display_mode *mode,
+				 u32 max_bpp, u32 *bpp)
+{
+	static const u32 bpps[] = { 30, 24, 18 };
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(bpps); i++) {
+		int pbn, slots;
+
+		if (bpps[i] > max_bpp)
+			continue;
+
+		pbn = drm_dp_calc_pbn_mode(mode->clock, bpps[i] << 4);
+		if (pbn > port->full_pbn)
+			continue;
+
+		slots = drm_dp_atomic_find_time_slots(state, &mst->mst_mgr, port, pbn);
+		if (slots < 0)
+			return slots;
+
+		if (slots <= mst_state->total_avail_slots) {
+			drm_dbg_kms(mst->msm_dp->drm_dev,
+				    "[MST] bpp=%u pbn=%d slots=%d\n",
+				    bpps[i], pbn, slots);
+			*bpp = bpps[i];
+			return 0;
+		}
+	}
+
+	return -ENOSPC;
+}
+
 static struct msm_dp_panel *msm_dp_mst_panel_from_encoder(struct msm_dp_mst *mst,
 							   struct drm_encoder *enc)
 {
@@ -204,6 +287,9 @@ void msm_dp_mst_stream_enable(struct drm_encoder *encoder,
 		drm_atomic_get_new_mst_topology_state(state, &mst->mst_mgr);
 	struct drm_dp_mst_atomic_payload *payload =
 		drm_atomic_get_mst_payload_state(mst_state, port);
+	struct msm_dp_mst_connector_state *mst_conn_state =
+		to_msm_dp_mst_connector_state(drm_atomic_get_new_connector_state(state,
+									 connector));
 	struct msm_dp_mst_slot_info slots[DP_STREAM_MAX] = {};
 	int rc;
 
@@ -212,7 +298,8 @@ void msm_dp_mst_stream_enable(struct drm_encoder *encoder,
 	drm_connector_get(connector);
 	panel->connector = connector;
 
-	rc = msm_dp_display_set_mode_helper(dp_display, state, encoder, panel);
+	rc = msm_dp_display_set_mode_helper(dp_display, state, encoder, panel,
+					mst_conn_state->bpp);
 	if (rc) {
 		drm_err(dp_display->drm_dev,
 			"[MST] stream:%u set_mode failed rc=%d\n", panel->stream_id, rc);
@@ -311,9 +398,12 @@ int msm_dp_mst_stream_atomic_check(struct drm_encoder *enc,
 				   struct drm_connector_state *conn_state)
 {
 	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(conn_state->connector);
+	struct msm_dp_mst_connector_state *mst_conn_state =
+		to_msm_dp_mst_connector_state(conn_state);
 	struct msm_dp_mst *mst = mst_conn->dp_mst;
 	struct drm_dp_mst_topology_state *mst_state;
-	int bpp, pbn, slots;
+	u32 bpp, max_bpp;
+	int rc;
 
 	if (!conn_state->crtc)
 		return 0;
@@ -321,9 +411,6 @@ int msm_dp_mst_stream_atomic_check(struct drm_encoder *enc,
 	if (!drm_atomic_crtc_needs_modeset(crtc_state) || !crtc_state->active)
 		return 0;
 
-	bpp = (conn_state->connector->display_info.bpc * 3) ?: 24; /* fallback: assume 8bpc */
-	pbn = drm_dp_calc_pbn_mode(crtc_state->mode.clock, bpp << 4);
-
 	mst_state = drm_atomic_get_mst_topology_state(crtc_state->state, &mst->mst_mgr);
 	if (IS_ERR(mst_state))
 		return PTR_ERR(mst_state);
@@ -334,10 +421,15 @@ int msm_dp_mst_stream_atomic_check(struct drm_encoder *enc,
 						 mst->link->link_caps.num_lanes);
 	}
 
-	slots = drm_dp_atomic_find_time_slots(crtc_state->state, &mst->mst_mgr,
-					      mst_conn->mst_port, pbn);
-	if (slots < 0)
-		return slots;
+	max_bpp = clamp(conn_state->connector->display_info.bpc ?: 8, 6, 10) * 3;
+
+	rc = msm_dp_mst_select_bpp(crtc_state->state, mst, mst_state,
+				   mst_conn->mst_port, &crtc_state->adjusted_mode,
+				   max_bpp, &bpp);
+	if (rc)
+		return rc;
+
+	mst_conn_state->bpp = bpp;
 
 	return 0;
 }

-- 
2.43.0

