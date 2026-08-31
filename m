Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6217A3D9527
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164304; cv=none; b=eCuKmV69PAlir0efP761ivSS73yovio8JZa/0pQbnbZekfsJSp9ue7v18qFdIkyLqppsQEtVm0h64+bp8tj0WuEa53gf205SUWakSIhvbmuF8weEgHTj4aoDw/2uJ+YqNSPpKlcsGL1I2SKt6tjcHP5nxU6WuOl5iW3YORuBklo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164304; c=relaxed/simple;
	bh=Rmad8rIknz1sOMSvhuH7OEp7pReINDO+wK4qwai4xjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hf1drn4xkY8uk7O0yaf2Hnf39q5PLvyvuuF4C/wOiUF20K4kpRN+kWFgFVFRIXT96Rw6RaVKDd092Xk0meEPhue07CayUVr9f9g0e9qgWsLpYvozU+8bTE9I9/2N4cbdxsglFspX5ZoFqslqwV6EeAnDmkmazvhSUFBDDZEfTi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RClJgwUo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdErDLvC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RClJgwUo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdErDLvC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xsbT3167407
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TOMG3yp218IRb7X4mHLShdrli/+A+w+d0UixRrJLDGE=; b=RClJgwUo77pHmJAY
	6hldljYsej+SBGeFDATTQ7DAPg4GbKFxE3jBYHnBOD40YEzwCdtJj94kiKRc/LhE
	DR55lro1hbFv9358OPYwvtcKZldpeEiijNqiqErlF0B/x6EpNHrl8N3Noq5rxLYl
	M1DYQcz4cs9NRhvd46uunakQG2a7Q+efAvz6ew831g3uEEXj/jZ+pF257NP44ayi
	ADle7OwGgkuTMM5QiNSzmOOBptCGy5BGliRs0B9kE65eLdRAVlRZxwZiDNGRYCd/
	VmH7LYHbERuV4JAWdEbHftdA4oEmKpDI9FdKbqkAp+mQttFSPmloX0zoWyzNj+F3
	qMcV6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqgyndqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e820609d9so643183485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164301; x=1788769101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TOMG3yp218IRb7X4mHLShdrli/+A+w+d0UixRrJLDGE=;
        b=fdErDLvCfhbh+02oR2e3Yv41vfo2t2ym+NGwp7cBAqbAgF7cbTi1ZTFsbwkIyfBZ8c
         L7WBTd9mge4Eq8BFpmdQmTVUVA4BHbGe+HErag4KCfUJObUBa10gUSsZmQ1qxYagQhEE
         pUFZblMbmGotEIMdXAdd9iUV/2KRCGRW1gs1lZ9f0lfysrbZmIkUne0zCf0dKwEpVT7S
         gtcNJ5XVcnMhI9ShKAlb72AyOj5o7+htYV5gGx6cEfUwtriCzR+0YxZcxYHj8KE+leR6
         UIuXraprwbv3nq4wXWJW6Xu4KVlbjqazYNv+dbBJ5/oEFU2JomIWJLPVanpucBNwdFpW
         3p1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164301; x=1788769101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TOMG3yp218IRb7X4mHLShdrli/+A+w+d0UixRrJLDGE=;
        b=a8Gd1Wx+XGLCK7OSIclYtOaPEa13y3t43E1Dryh954uleu6rhO0asRKAQEHrjm3wWf
         W1jfWl9R8vPt6Pn68NzY5hPnKUKFt05++L7h9Y0GZzTycoRU5RnZ+mkGRR0ETtmr/xZX
         ceIzZ6to7LXh+KjML1aSL9KpjggW9QsjoSlBoxe3hIcgWXNjagiepTRYRecyAoK7EfzL
         EK8BxHaa7n8eTpH1Zvb1zTasI3ZpWPIl3oElp7bvp9/JNnOm5vtxYWWB85bZ9YEQIofW
         gLSyd/MYXOiWtTCIbrz35XwmiKPtWyTP8YXx16x5dZRvRYO10+ABIYctCw96BpwsEWHn
         yuaQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMB6cwPv89xkgqiOhkFZlfidaI29HLyKM6+moUo+KEZ13xv1LCz3b4wrYiD0knH6fyv7TSHW0MhRS3GEU=@vger.kernel.org
X-Gm-Message-State: AFuF++m0mTXzcMCm828jh+0gmpUR6cp6k9ob1ZaDmRmBbeGbU3f7djPC
	rhQrNbnMQKppPOl7OgpOAg6US4mbXxk6F+pjeZa9MzRUFoP2eNm/7jsOo7ATzlhStdDoq1jc7Dp
	pu/0b7VtDc52+wGfoxbjR2D95rjGrTeJynwaz8dOy5iFliMrBrHn3Zq131USTWrVG7Fw=
X-Gm-Gg: AR+sD11zR9eBN2a/rmdG1/BuGgjvncZmmYWoPriCumZUJT2kpDbGAuM/XSBnfjtqH3+
	8A971WM2iw2EKzDk/Z1cgJLsGudLP/g6bs+As7Urk3Y/9nxMktAfBiRhyUAPZV9bUMgvPIbInzZ
	KGSxNC1lJDVN8bQ999bHZ80g8Rlo3ioIhJagSnM8uqxU4RQGzoilD8GdO2A8y9N1eNSohIcDut4
	n318cy2GwOnCrTwKXQG8kqmZd+SDY2dxRckQOKLXsJ0ynqbqM+CBrqAPZ0kVw6qqkPkaXcYE1CE
	QxuU8uFL5DSiJ1gX4zrWOZVYUKpXIULCPp8e963ufEJV4Wojo/OzlXbRsDocNxbt3lDN0+kZZFq
	+mYXV2HkUtHot7wA0fi0ltzAf2QaMBbUYPsXDIQQ+8o0NA8RXjzjM/H2sHnq3YWE=
X-Received: by 2002:a05:620a:800b:b0:939:7c8:78a9 with SMTP id af79cd13be357-939427fc764mr120627785a.3.1788164301467;
        Mon, 31 Aug 2026 01:18:21 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:939:7c8:78a9 with SMTP id af79cd13be357-939427fc764mr120625085a.3.1788164301042;
        Mon, 31 Aug 2026 01:18:21 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:18:20 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:26 +0800
Subject: [PATCH v6 09/29] drm/msm/dp: add support to enable MST in mainlink
 control
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-9-c91d35d6fb9e@oss.qualcomm.com>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
In-Reply-To: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=2557;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=8IxMe+vOOiLPxKEsXO6U2qctxURhGCfNOY0j4XpqOyE=;
 b=5Lliw3sD7lBYuB4Fhpkt0TWooGx6Wfwa+3oaQRLxQPkkMtj8jfKPFkgbLrvA78umzegQp9FlX
 XbaNtx+8RPSB56FR9NXiIqgKFVI2H+O836qf1iXoazP7hMeyWMuXnTS
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfXxB917gDeADQI
 1nJxBG/LET8TN89blYL6xqSuWJiErz5HrxePGOT5l8+vxmXzWJw5ypkT0weiufRNqZmj4or769h
 MHj2tx/HJAzN7C9kH/+MDG/3S08SeXU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX5VYer/w2blyW
 CTnMHFVaXmjYc5Zl4uGmRTo6vvZng6Kuc1AO3kvOSyvSoywgt+XjWsWU/xVvF5gHtfS7yygdqsL
 5P+Vyb4yoAFajYxHmnjTw0+ZVYRntgEnfvx7JLiiwrzHoB3qKmFEfHzwd+O9HvvbqqtM/aqVATz
 5er0LbV6LMnW8+2X6MKsDk+sPWIMiVakmsZplAMPuyYAqHgHquPlJH35Qqo9N+2LMhesVjHFRmv
 lX77jnRhZfU5XuyUIVGxO/98ffuGeE79ArWne2PrmNmiDP9QRlZZkqwE9YmU11+tbHkk/orZuzS
 C+kG1Me7fpvblCdE+rRe5gk9UInwwCK8rQj0ZunBNHXgraVliEQbvEgd40pCytC2LHE4rtSU/pp
 dp/SKECV/ZrCINHpw+STlmSn5o7o42UQZTtDXBnvwipeyFwpIsC8ZshlqFe9TLf63CBnGgT8B+4
 frnojdstxDXKb6S3XhQ==
X-Proofpoint-ORIG-GUID: ttTxN5WScWr9KtX7brY_UK1kdMRKsgfr
X-Authority-Analysis: v=2.4 cv=R5Ez39RX c=1 sm=1 tr=0 ts=6a9538ce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GJT6Fafo9oTAj6z5dyEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ttTxN5WScWr9KtX7brY_UK1kdMRKsgfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add support to program the MST enable bit in the mainlink control
register when an MST session is active or being disabled.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 16 ++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_reg.h  |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 65d22505c2b6..cd6ae0d5372c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -276,6 +276,19 @@ int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
 	return 0;
 }
 
+static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable)
+{
+	u32 mainlink_ctrl;
+
+	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
+	if (enable)
+		mainlink_ctrl |= DP_MAINLINK_CTRL_MST_EN;
+	else
+		mainlink_ctrl &= ~DP_MAINLINK_CTRL_MST_EN;
+
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2680,6 +2693,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
+	if (ctrl->mst_active)
+		msm_dp_ctrl_mst_config(ctrl, true);
 
 	msm_dp_ctrl_configure_source_params(ctrl, panel);
 
@@ -2730,6 +2745,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	phy = ctrl->phy;
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
+	msm_dp_ctrl_mst_config(ctrl, false);
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 9263e61c794c..cc74b1ed628e 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -128,6 +128,10 @@
 #define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
 #define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
 #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
+#define DP_MAINLINK_CTRL_ECF_MODE		BIT(26)
+#define DP_MAINLINK_CTRL_MST_ACTIVE		BIT(8)
+#define DP_MAINLINK_CTRL_MST_EN			(DP_MAINLINK_CTRL_ECF_MODE | \
+						DP_MAINLINK_CTRL_MST_ACTIVE)
 
 #define REG_DP_STATE_CTRL			(0x00000004)
 #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)

-- 
2.43.0

