Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585993EA976
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656011; cv=none; b=ggiRAnzsVlyJzjhGrm88MZ01Ia/2LpTndDCoXMmTBdEBvWmnywp8Q64JAkoZIg0tYseQ3+dSmWsjW/qWtdJYVNeTTnmX19PdJdWoT3lkINICV8327tTnVFfY5TUmwAyj9o3ClmgRKbpL7ISuIREypcrTwZOQV1vMHD+RYsxFhHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656011; c=relaxed/simple;
	bh=l3kj2XFZKhSVeXs/EwHuBjXsmXKipTRBq8F/1NT00G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G19UDahLeCJ9RuEqIZgf9jB450/UhtknUZQKNAUr2s6GQDFjiHF0u5mV3x9Oxe+wk51mM1hxJ1sQoCK1duVk19e9pXNsYgnjlfGrpNcOfUzYbLB54BvTisxqXxxLiRv0eqVCnejYlScoodo83QzhSP/1in5hsfi3SZ8A6OWgzvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onM7lK0g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DXEICw2M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="onM7lK0g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DXEICw2M"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47YMl3892368
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s5WtCUacc3bD5fuIuPtCEfEQcZc0oIBJ5KxhXjwfY9Q=; b=onM7lK0g+nle0/Uq
	nGdI6AbGLGiDpzgilNQb8p0+f8VZj/FCDSV70ENvcJOWPadvC+aTrLa04qFdTcjd
	W/xfW9iPMyuzdv7Eeh1hnZTY4UjRjUZbrlcS1VqQZXcWbVVnAKZPNpN/CYXhc3iy
	kpcMjCNd3pRuGzCYNO607uhFF4NAQdCOgb/DYTYB9ew/4sng6Pl0id+1EqmPKWyf
	Mofn9NlyNRoGGp8loUhXNaYZdv7mWum01o0v7d4fEGAu5XuF10eUJgia0s5hhngu
	7w6aqKVVHu5p2PFrIvkJlxY0ZHHWzZNnhk/9rw3cq2VErpTTY1GSFlOUfqa9irr2
	VZxrTQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfkv3m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:26:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91452ce83b9so39726516d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656007; x=1791260807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s5WtCUacc3bD5fuIuPtCEfEQcZc0oIBJ5KxhXjwfY9Q=;
        b=DXEICw2MIAuq21zls+AxTYb3yOfoDeLQFJHAR88/oFhIifhQp0G6OcoZTSm2QKwn59
         TNRI3pL7WlkZDyxGYPcc5Vm8aP9GFEwXMpxE9fQ+81aAsBG/CCETsRZvtuANNx+y5Uya
         J5eGDgxsyYUmTFOXu0INH4EeePsYp4Dfs3UWSleyFamvynw9oW48z766+EzyAGtzDD/b
         F+8loTB75oPAzhmUQJbqtgSf6DwQEdgq1bpZAYsTWjt4FfPj6JNIiUi6ExHTFkSMIPsI
         qx3tpHVDoMeYab6QUJUMZc83ALcOOxLU68YnhO+ON3/2fkZIStkClEMY+N9eFuJ9dk1I
         T1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656007; x=1791260807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5WtCUacc3bD5fuIuPtCEfEQcZc0oIBJ5KxhXjwfY9Q=;
        b=Y/7JJM3+lrhTKLm8W82nTYQ2IeBd7KftOr1lhMXmifhPUk+atlIQGUZYku30pcfTNX
         8EdhEk3fryApR2FAZexHQk3dHmPOGYNJW4qo7ybbiCrCaooyEmRDkbicJbhfTb8sbbHQ
         qXF+H3Jc4wmF+aiOMPlKPFuec6jk+W0QuH/5YWZTEG/z8mQpLXjOtF7I/qOSthwEgxR9
         GKEWyBw51u1yGJPogPYoCoLmiULSspiXgQnkaVc3NIgCS5n/SBJdloVgxJt60bJRXbE9
         p5kTHKYg880HUeqv7bgJhslWjCzYMWpaYRtstKI6hfQhv18cGKUg5sjuQulF+DqZUFr/
         8rsQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2K389aDGOYe92OaYm+ABMI5MnY8ds4oLBO3lgoGTiN+mzDvxFYmMwqtwhu/GI4aP6j5Z4Mou2wanLovA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2MKcYQRPykyn7PGqpXmUtRCbj6k3xhYuEYMHY/GLjlsvG3g4u
	dLdJi2oSoKxrIxxMAGFrjINOTs2e77IhtK4GZHK7CQ6C1D21xGnsiOjnEw5rKHtnKUuVdNwFb34
	nJGgQXnu51+xNOzMN17qKit2ByKGGcos4yT6LGVKNkoiD7aiMKHzFf6WuE5pMIPO5gYE=
X-Gm-Gg: AYBFou2h13D4jh5RWKJfEgoClubDhBJZup2Cul3LpL/rumW2oD0pEd30Xp3zCxWap7p
	RT0t9ggR17qSY6hhcQHA9/HuE1UbXK1xT7DGHBstkpAUE6TIAIr0CC5k7bCSKUe+V0xqA1HR9+x
	rF7diNIgJWzQRbCi/06/2KgMscgsAhNy2kw2r9HoU6c4/ms1WxZuUkuBUo4U1ndfaMieqApTS/C
	uXFrKhafdpwXiJzfrOrpbG3S/SbgTeyuD4kmFo2DE7/nGeOX93s74wmfYOjT7wXnSRr2GHEZRSf
	IIIyC7Or8zx6ek6JUT5xZlOzxK046gfZSjVp50umN2AyJ9P+xPGD/JAf36O/8SHUaWOtyQnrxxu
	lNmRTSuEmAi4Y66U748JzVN87ktlSyVUOg53kKcfprR+LEUFVrjX2yKTaxKhgG8M=
X-Received: by 2002:a05:6214:c6d:b0:914:4b3a:3ce0 with SMTP id 6a1803df08f44-9144b3a4502mr170247746d6.33.1790656007149;
        Mon, 28 Sep 2026 21:26:47 -0700 (PDT)
X-Received: by 2002:a05:6214:c6d:b0:914:4b3a:3ce0 with SMTP id 6a1803df08f44-9144b3a4502mr170247526d6.33.1790656006594;
        Mon, 28 Sep 2026 21:26:46 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:26:46 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:28 +0800
Subject: [PATCH v7 04/35] drm/msm/dp: introduce stream_id for each DP panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-4-4b81473185e7@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=10495;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=41nlGV9qWMuPuVmOYIL5Ba/E3cBLGe/ctcI4XCZfVHA=;
 b=bXdNG9VcDripz0aL7X+HveYJ2igTqxdrpTw6do2TbL46otWzlaVq9Xldf/V4ic5AvddD/YHgr
 zvl72qPVNPoCxJuMSnsnJSxeRWea4EoeNmLhgTE1bthm5mKfQYcMzcw
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX11JCoS8t00qt
 dUlVflU2NN9PqcSRXB4GZNIV2XVm/AGkIzrrdO5zYuEkM8ni2N/ZZIOZ4XnBmyNCTYMFH4HCWEo
 0O/NQ5mERS4tT0NP8YNeosmx6GPPG2dWrfZr5s+ztv8gd9sq/aiy17FmOKOAqI9K5+qvYI/8I1d
 7SccCXM55iqAR/Nqc5eGf4B4H/6YjyAU9vSoT/ytazpQ+hEP1dwpHEulaaKKq4XbwoRwXRuLNpx
 Amn8T7pZwyHb4MEmgCJaAIfz+ymtcX0W0HHfj+5tbefvAw5+K/VUQWg5S85a+IsssSOkNSzahfK
 NBLvmzcMLLksPnGnHy4nWdQpQ39lgArgqOU6InQ0PZtqw/9ZGXAHdRlpmDK6URo8Ink1lQ7/Q57
 /37Z9V7gkFRT6ETwHYILJqn6G2Ut27OsbCRwCvtxron/E32ujtQuit3ni0cjEbsHqv3j8VATmFv
 U4UreYTQe358EJoREnw==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6abb3e07 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=2DdK-DT3ArwjwnIMWYkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: sruSil6wlASHdtKKiKeDoXe2Ml48I-6m
X-Proofpoint-ORIG-GUID: sruSil6wlASHdtKKiKeDoXe2Ml48I-6m
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXzUsg/+S/epiZ
 5pPWBeAh6/RIzV5brypMlRffeFEBzqckmNkPgrph0w7fxx+X08RvinM4UCbJPwQILfiZMx0X3Db
 hMpyn4nuG+9kEKk8zDmNmfsQdDIWReA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

With MST, each DP controller can handle multiple streams. There shall be
one dp_panel for each stream but the dp_display object shall be shared
among them. To represent this abstraction, add a stream_id field to
struct msm_dp_panel and introduce the msm_dp_stream_id enum. For SST,
the field is initialized to DP_STREAM_0.

In the MST path, each panel will be assigned an actual stream_id at
stream-enable time by the MST layer (added in later patches).

Use the stream ID to control the pixel clock of that respective stream by
extending the clock handles and state tracking of the DP pixel clock to
an array of max supported streams. The maximum streams currently is 4.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 70 +++++++++++++++++++++++--------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   |  1 +
 drivers/gpu/drm/msm/dp/dp_panel.h   | 11 ++++++
 5 files changed, 57 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e7bb9558c0b4..67f1da46b973 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -126,7 +126,8 @@ struct msm_dp_ctrl_private {
 	unsigned int num_link_clks;
 	struct clk_bulk_data *link_clks;
 
-	struct clk *pixel_clk;
+	struct clk *pixel_clk[DP_STREAM_MAX];
+	unsigned int num_pixel_clks;
 
 	union phy_configure_opts phy_opts;
 
@@ -138,7 +139,7 @@ struct msm_dp_ctrl_private {
 
 	bool core_clks_on;
 	bool link_clks_on;
-	bool stream_clks_on;
+	bool stream_clks_on[DP_STREAM_MAX];
 };
 
 static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
@@ -1750,7 +1751,7 @@ int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "enable core clocks \n");
 	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
-		   str_on_off(ctrl->stream_clks_on),
+		   str_on_off(ctrl->stream_clks_on[DP_STREAM_0]),
 		   str_on_off(ctrl->link_clks_on),
 		   str_on_off(ctrl->core_clks_on));
 
@@ -1769,7 +1770,7 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "disable core clocks \n");
 	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
-		   str_on_off(ctrl->stream_clks_on),
+		   str_on_off(ctrl->stream_clks_on[DP_STREAM_0]),
 		   str_on_off(ctrl->link_clks_on),
 		   str_on_off(ctrl->core_clks_on));
 }
@@ -1800,7 +1801,7 @@ static int msm_dp_ctrl_link_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "enable link clocks\n");
 	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
-		   str_on_off(ctrl->stream_clks_on),
+		   str_on_off(ctrl->stream_clks_on[DP_STREAM_0]),
 		   str_on_off(ctrl->link_clks_on),
 		   str_on_off(ctrl->core_clks_on));
 
@@ -1819,7 +1820,7 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "disabled link clocks\n");
 	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
-		   str_on_off(ctrl->stream_clks_on),
+		   str_on_off(ctrl->stream_clks_on[DP_STREAM_0]),
 		   str_on_off(ctrl->link_clks_on),
 		   str_on_off(ctrl->core_clks_on));
 }
@@ -2190,38 +2191,39 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
 	return success;
 }
 
-static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
+static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate,
+				    enum msm_dp_stream_id stream_id)
 {
 	int ret;
 
-	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
+	ret = clk_set_rate(ctrl->pixel_clk[stream_id], pixel_rate * 1000);
 	if (ret) {
 		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
 		return ret;
 	}
 
-	if (WARN_ON_ONCE(ctrl->stream_clks_on))
-		return 0;
+	if (WARN_ON_ONCE(ctrl->stream_clks_on[stream_id]))
+		return -EINVAL;
 
-	ret = clk_prepare_enable(ctrl->pixel_clk);
+	ret = clk_prepare_enable(ctrl->pixel_clk[stream_id]);
 	if (ret) {
 		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
 		return ret;
 	}
-	ctrl->stream_clks_on = true;
+	ctrl->stream_clks_on[stream_id] = true;
 
 	return ret;
 }
 
-void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id)
 {
 	struct msm_dp_ctrl_private *ctrl;
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	if (ctrl->stream_clks_on) {
-		clk_disable_unprepare(ctrl->pixel_clk);
-		ctrl->stream_clks_on = false;
+	if (ctrl->stream_clks_on[stream_id]) {
+		clk_disable_unprepare(ctrl->pixel_clk[stream_id]);
+		ctrl->stream_clks_on[stream_id] = false;
 	}
 }
 
@@ -2242,7 +2244,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	 * running. Add the global reset just before disabling the
 	 * link clocks and core clocks.
 	 */
-	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl, panel->stream_id);
 	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl, panel);
 
 	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, panel);
@@ -2252,7 +2254,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	}
 
 	pixel_rate = panel->msm_dp_mode.drm_mode.clock;
-	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
+	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate, panel->stream_id);
 	if (ret)
 		return ret;
 
@@ -2546,9 +2548,8 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 		   ctrl->link->link_params.rate,
 		   ctrl->link->link_params.num_lanes);
 
-	drm_dbg_dp(ctrl->drm_dev,
-		"core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
-		ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
+	drm_dbg_dp(ctrl->drm_dev, "core_clk_on=%d link_clk_on=%d\n",
+		   ctrl->core_clks_on, ctrl->link_clks_on);
 
 	if (!ctrl->link_clks_on) { /* link clk is off */
 		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl, panel);
@@ -2586,7 +2587,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
 
-	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
+	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate, panel->stream_id);
 	if (ret)
 		return ret;
 
@@ -2643,8 +2644,6 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_panel_disable_vsc_sdp(panel);
-
 	msm_dp_ctrl_mainlink_disable(ctrl);
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
@@ -2714,6 +2713,13 @@ static const char *ctrl_clks[] = {
 	"ctrl_link_iface",
 };
 
+static const char * const pixel_clks[] = {
+	"stream_pixel",
+	"stream_1_pixel",
+	"stream_2_pixel",
+	"stream_3_pixel",
+};
+
 static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
@@ -2747,9 +2753,19 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 	if (rc)
 		return rc;
 
-	ctrl->pixel_clk = devm_clk_get(dev, "stream_pixel");
-	if (IS_ERR(ctrl->pixel_clk))
-		return PTR_ERR(ctrl->pixel_clk);
+	ctrl->pixel_clk[0] = devm_clk_get(dev, pixel_clks[0]);
+	if (IS_ERR(ctrl->pixel_clk[0]))
+		return PTR_ERR(ctrl->pixel_clk[0]);
+	ctrl->num_pixel_clks = 1;
+
+	for (i = DP_STREAM_1; i < DP_STREAM_MAX; i++) {
+		ctrl->pixel_clk[i] = devm_clk_get_optional(dev, pixel_clks[i]);
+		if (IS_ERR(ctrl->pixel_clk[i]))
+			return PTR_ERR(ctrl->pixel_clk[i]);
+		if (!ctrl->pixel_clk[i])
+			break;
+		ctrl->num_pixel_clks++;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 5902cf7e746a..be0d89d60914 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -24,7 +24,7 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 				  bool force_link_train);
 void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			  struct msm_dp_panel *panel);
-void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 			    struct msm_dp_panel *panel);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 03ccdf7e0366..01a60b4f83e9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -720,7 +720,7 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 
 	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
 
-	msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
 
 	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index e76dad0f6663..745ee6976897 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -723,6 +723,7 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 
 	msm_dp_panel = &panel->msm_dp_panel;
 	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
+	msm_dp_panel->stream_id = DP_STREAM_0;
 
 	return msm_dp_panel;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 4519ac374220..50a721401751 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -27,6 +27,15 @@ struct msm_dp_panel_psr {
 	u8 capabilities;
 };
 
+/* stream id */
+enum msm_dp_stream_id {
+	DP_STREAM_0,
+	DP_STREAM_1,
+	DP_STREAM_2,
+	DP_STREAM_3,
+	DP_STREAM_MAX,
+};
+
 struct msm_dp_panel {
 	/* dpcd raw data */
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
@@ -40,6 +49,8 @@ struct msm_dp_panel {
 	bool vsc_sdp_supported;
 	u32 hw_revision;
 
+	enum msm_dp_stream_id stream_id;
+
 	u32 max_bw_code;
 };
 

-- 
2.43.0

