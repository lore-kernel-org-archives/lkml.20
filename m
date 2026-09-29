Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FE83F0767
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656136; cv=none; b=ohjzu5omnG3q09YWcCddLh/h3E2H1hRSKMgtF5oZbaqt8TP32MwKVe2cfFyccFrQnV/Lgs6/iXJOrDNcV3soHI+BnB/EGNXPir/qrXx5eR5PQ/0+uZRxUmOiJ4itX6IvICIAVtqrXKTtkW9jeGFCLrAfv9a/Yl2uZnLBzyTKBrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656136; c=relaxed/simple;
	bh=dlX5BtjgU30Mpwy53Vc7kqbKtziu5xsv1Bn+E6LPXDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lODDs7x1v0ay+iSsP8f9Ya2uVTDD/4mpfR9OoOp/X3OdCzIliUMBOASJmP3t9QjEw13c8RhjryCLvJwHP7z44xrJRMUYSGPar8oLRsUNo+mydMdv/Oq8WDaEKTZlPLTFjo+U8LmZKUyJFBviubnFYUynDceESAyE1hzejxw18hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V052ugJ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XAIJmVYg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V052ugJ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XAIJmVYg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Agb2126506
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOq7VIBslc55pX7juh2Nxe8h7Akt+B0A2pEl6naHBj8=; b=V052ugJ4zHcSbCLp
	exXlAEviZdoyGPqnTUzfB7bUtuC1Cp97ryz6+6pqc3Pi6hI/00+tReypjDAtCtv7
	F8PGp53oUvT8qrjCTaqNGi84g68zwcILEl+W6urYivlSlyNX1VKfLYMPwKD+0Xiy
	Equ1WuFecjTUYp3cxywgj2XCiENPpMW5IviVxWxQvN4NHFXvSHFGtfzsnEtqAIAJ
	y1vAaCFGponvKTk7UoLe1BCEGx6ORSBI4DJ/TuqY0b7ARxh0T1AUBxSdF4EL1fbs
	ldv/dOuR1gehCNQLTwEeXG/EmhVJLRA2kHjUm2kR0bG9+C+WQJDchASM3yX/Lhh3
	E4vhCQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mn8qut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91785bd637bso13083846d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656133; x=1791260933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOq7VIBslc55pX7juh2Nxe8h7Akt+B0A2pEl6naHBj8=;
        b=XAIJmVYg2w/tmSqPavOCSKCYFbbOqG+JWMuQwvoT7cdGWZG2/5X4+GD1mTaCfJ2j7f
         qUm10rSXtRKYZNk1Wqntb7c4AGBeuzrgy5mW0atdfg8tzjTDcMF4J9Oq7cnwwnOuX2Q6
         bdjrJTckAKh7g4EJDnLdsP4lSlJTI9tFQYu0+qNxqVy6Gz1PZagZIdtCtDZKsAVe1xK/
         cOj9rLfo1TodCj7lN0hIFjVQCuCflsZNw/B9Sv1Fppw0VhokVQ2adajfJuwiePNAU8d7
         DeWNTxlZdNOVVAorKrYgtBnqft8ybg64BpNvG4Vlro2sq5QPvZ7aQg3SKNjSAYHh7Bks
         EBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656133; x=1791260933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOq7VIBslc55pX7juh2Nxe8h7Akt+B0A2pEl6naHBj8=;
        b=lOHHX1O2RanqvSSU1gs7FvON9QPyJBNKLjIuQ3csddCy3G3HTjxuAPhYJye7rQ0a5v
         qL5Zo8T8hzcc/PKvoOVeos7NjHbOq8o6Zrq7Ka5+CrHDROU3+kwyk4wYZtIGUoinxUQp
         wMmEgvx8AyO/tbDhcOQxq89enGOv1q6YAjxR3M6kfrSlukfT7xGh4LjZc4pT10AoiGE0
         ZDlqX8o/FYGscRXEq/vNfAoD99YWxiNjImLl7FtcGvny/Vliafh0N5rDG+T+IymNbo76
         L05VgLh7GY3FSMhEwl8ttH8uwIz5alWpUqNNNa8BHKXcdkgG7Q/exHg3eFR9osZQ0ukw
         L45A==
X-Forwarded-Encrypted: i=1; AKwUvBw6Q5q4iDQhfT/ozkSD0xMipS4V4bNHjri8cPvTXP2lsrJ94ZyU7r1QvfcGsCHm0cQUJrMmvc4jPWk7Z0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWYDAguZfHd0gOeBSRgInxfGEcHGXPvAj0R91G5tonMrgSnFog
	ABCUrk8zwfdO/SbW/mOwEiaZBKYVhn/t/pTGESkN1tZVbF4T7NQ2TZ5jV7n7c/Uq361qV0dpBHK
	W3bi+olft2j70Ougm4FhuIOZdq3XG4oGTsCfScY8NvdlL9SavzexemgQCF4szYtbA+8w=
X-Gm-Gg: AYBFou0+57e8Pml3OqHFecgtXd+dxOUG90672HoLfGRjPVbHHPdzLayitWBNFREO4/s
	/Yp6CpsLUEeZ2awFK9lwGCcD27k/IqhFYJDiZKyy6S1bZOUOsjuyURPYJy7EAIbEFyo5KqtHyAw
	D2+fCpX3XA+WTfpx5drLUdlY9wuIiiy0+S2zJj9efFkV36yeURwL6MFIA0DKEkYfT+njEgXof10
	GfmSFv5vkftst9GdOxkIp5Tq/kEiRYi1/V/UiYDXAh+JI0Ul2ODrJZHRRdruLPChgZwhLcVJirf
	LHUVvS5rxKfEVLNZ5MfMkNj1EvJBvxMC8p0DNooFsJvyaPHSRcjk8FWRzOGrXpu/O7c+AnZ4J3q
	j3HuC0xq5C16fy0umdgWT/R9VMz5YhYR59mk/bQXbQ7pQgj9kg5H1E43fBM/W+8c=
X-Received: by 2002:ad4:5766:0:b0:916:57f9:6b6 with SMTP id 6a1803df08f44-91657f93836mr79982046d6.46.1790656133080;
        Mon, 28 Sep 2026 21:28:53 -0700 (PDT)
X-Received: by 2002:ad4:5766:0:b0:916:57f9:6b6 with SMTP id 6a1803df08f44-91657f93836mr79981786d6.46.1790656132652;
        Mon, 28 Sep 2026 21:28:52 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:52 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:55 +0800
Subject: [PATCH v7 31/35] drm/msm/dp: mark the SST bridge disconnected when
 an MST-capable sink is present
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-31-4b81473185e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=1383;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Q0M9eu0gJ8kozUV6W/p0p4f4GrBEI4mkkt4w23E91HU=;
 b=rvmfUrXoCdDbySP7zij2KQN5vq44q01KMRK9e9P5BIlKVibYvveFS4CBnqdfrCJVQzhl1vJhY
 /lVN0vF1HkRAbTd1wpuGzKQ46jUv197v2BH3LTo66D3YbABQT/OO5gn
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=X9fHu2Te c=1 sm=1 tr=0 ts=6abb3e85 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=E_DJWZ853T03DlUWG8wA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: OQLCMQ4l-hfjIiL_wUQGYl-PCWWoHJi_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX1qFHkk/TRhE5
 rxxnUVHjwXM1b1ekMv3I4vrAfkrEgxmJcOyEveLJVbOxEEwYOluNm2010iJt6wmhIL8T65KW28V
 kWH+bGGBYFgHa/yavHVlrg94FIZhrdQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX4oTwReAGsWKH
 CtyFV24qOSgn7oz5uNYl3yIH5zO8BCq+V5/ngwbG7cvPDMPNGeHFNwBp5z9e1iIKyMgr1GBZgb1
 rKSRYHTftU7h3QOaCiq7roH+Fbd8knhAGXZGY38MWCqnpHTfVYFxsWxvumlrgkXVgSvOnFb/QFU
 LDyGEI8UuYKSTBOqey7gkGa+cMQJi/dWymNQKY6o5lrlB790wD+zCOUj9MgnH//Qdx/ScJBGg95
 QHeIoAYHwMe4d2LTRocIP7/bxdeFRsX+plrU1fTzjomOYR70gMpUK8OR434TuLIU5czh78L/ZQO
 I+IuRyy/8Eoi+BmpUpsFWBNC4XDJFWzpfzU9GsPKdQr6yV7X/ASLZ/EWbJhf+TxDaRE6QEjyWw9
 uHf+v5fVKhnWuMgvziDDnIRwBM1e1/AA6Ms4ALeZFwg9XlHKa/Drz30cgd2mb0wc9TD7NCV89Vx
 7yUVM+Hyg/1t3ysTyTA==
X-Proofpoint-ORIG-GUID: OQLCMQ4l-hfjIiL_wUQGYl-PCWWoHJi_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

When a DP cable is already attached at boot, msm_dp_bridge_detect()
runs from the connector notify path before MST has been activated on
the sink. The DPCD capability read at that point already indicates
that the sink supports MST.

Return connector_status_disconnected from the SST bridge whenever the
controller supports multi-stream (stream_cnt > 1) and the sink reports
MST capability, so that connector detection is handled by MST
connectors instead of the SST bridge.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e913ed91bbfd..0e8181932c27 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1057,6 +1057,11 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 			status = connector_status_disconnected;
 	}
 
+	/* Mark SST connector as disconnected in DP boot-up case */
+	if (msm_dp_ctrl_get_stream_cnt(priv->ctrl) > 1 &&
+	    drm_dp_read_mst_cap(priv->aux, dpcd) == DRM_DP_MST)
+		status = connector_status_disconnected;
+
 end:
 	/*
 	 * If we detected the DPRX, leave the controller on so that it doesn't

-- 
2.43.0

