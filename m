Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE293CEB83
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164262; cv=none; b=YOA9MWy/+AKJvhvvFVMcJcA+T4D6LWMN5fy7zDHH77a4JnEERxUIoO8f1Bdwr0fsNh4h4mCpaANqoAQHj3dUaYktOPURhA1H8Cg8swJX7IHgJ5FcP86bwtzRHgd+TrkVGUjiBGCNG1yvX0eB6fFV5i3LntU0V0w3n12hh03oeC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164262; c=relaxed/simple;
	bh=vVQJvV0gs5hxq76XywBEqmy9ss0rB2oyPqG0yZFrPKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5BW9aU7iUp+WjtDpGX48WbiJaIeTLGHiy8N0SLGsDgyf+ouGx/e5+jEVwLMvBSDPuqR50fC6ODhKCzq2BQY3HUsGx8XFMfpbN9iheXN1H2758zvKgt6PuNqXhP6XSfmKiFka9O8x7fizibpdps16u1j5f/mSIL6JdUiDTYmE5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJsDgQst; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AqvPUQeD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJsDgQst";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AqvPUQeD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xNUI3018234
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7QYANziB3W7iS2vd0t3/lz0aNl4eNqxjJE2aCx4lKWM=; b=GJsDgQstBx9XcDaA
	NS+sq+9YihX+WT9MLK5977kiJneMpDGyGRWKnRyx4bu0ZEJ86MCpCprGTFAcPs37
	eZ58iVY5kgDVhJIzIDcfRZMkOav8WZ9ZUqiGVCs8Rd/InEYQ2ZQVxSLwXh9zopZR
	VHiIOjTQ1/PIl490AYcaZcDbWlKiffP5Nb7qp6bTPv8J0+l41D4Iyx4LveLv/qWp
	hRvm3Jx/KWSkIHeqZJX7cJMBbSigzO6nIcsy8MCkqoYzdLmQahYtWtnMRvnZeB1j
	qp4LL1veN26K9LshOVCSRpe2KmttXacb0thqvHWCIPGWaGc8b/OouP0dSKzOQ28n
	98ldkA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2nck5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:17:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494527488so536694785a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164259; x=1788769059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QYANziB3W7iS2vd0t3/lz0aNl4eNqxjJE2aCx4lKWM=;
        b=AqvPUQeDpfFc8acKFfgcYEc3nA9YPPsZinq9/YDXmUlgmoYdPtFby8/A7Y9NKhK8N7
         DfWMSGTK4hmcAwksGvJQaaigcz9ExUUShaARfTtsLes+NA4Fy1meLmiqAmZgmrqUZarj
         flhI9zLN6MX75UVp+rKxbVwmLGCFD1J51J9jgD92EgzpiBup0+VFNvZ1H12Ml+2MER5K
         Pk4peHybltKUxsSTqsNc4KgGGGiGj/YaAI49+3ykoXwDTu6SZFOcpR5tIRZpZ2TqV5RX
         ng+eTWgcnmu1vntu4f0kWILwpdsye/jww84KupJPj4kxlnQrGA3eeEKJf4q9fLauw3E4
         nB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164259; x=1788769059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QYANziB3W7iS2vd0t3/lz0aNl4eNqxjJE2aCx4lKWM=;
        b=HlRw+TXsfrhy+4SKPbeQTNHemiyFO9lvf9LhVJ8v0Wdz+OOhIN6Roc2RFK01krKEtj
         fH58N0bl5+3Zds+noNkX3ESRhg5K8svl31Noux+2Vrl8VXWIA6BN/77paNukrPah7reL
         /zSiyka7peecTWIHaeSIV0dlKL1vH9psZzaffAqaSqoCD14Fva8QfDej+baCD+Rvzn3/
         Kh8eJrNIdfLr7iASy9q82OioXp5DWdIsNJ1sUjk7daup4MR9nMyBaVN8mrf/aS9UIOSq
         LQU5nC5MleobTQv2W2jCWuBa+imoATcp6R44bgPP+c13ZiWyOVyWpfVREIqKktjpG+qx
         lzsw==
X-Forwarded-Encrypted: i=1; AHgh+Rqaos2YUYo1n074/iYa65m8mLcQEGKpAvVXApq8fgi5hwVDwqo0tfAmTrH32QXb6UAUwde/n40om2p+pzE=@vger.kernel.org
X-Gm-Message-State: AFuF++k0X4YTgEhwNB64HQI92lCgbOcblH3bi1vU2tkboPre7niobMae
	gtorItxUaz5g6envjTEjXIjV6aw/82MFbHvNmeVm6CgiSKF5utfvsTIEcvKERxWw0yA7Lkxf530
	/nm78AfbmE1Kg6o9n4YqxQhXbfeOiesi78n1NA0rF8tcioKXhvBSIZFekPfotmCP0YLo=
X-Gm-Gg: AR+sD12kp0Hh0KBnfXJXSTaJ+b27M71d9KPa935TDIxFx9eUjln91Tq25D+7UHppw5g
	GSOwtrudXBMF5WCJxMJBr+H7XF7T+iGuaNLk6dvEKJlesbjSXH1RdJgt3tnxhjvDLwAmHbayX6r
	6FpAOb6p9Cy1dIlMH1AmNpglI31QUQkpHcHBua1r9TQohgDzrMOM2MjFFOVgbZWB6qP1GIamBxP
	+9quwS6LH4MswxTVmw9Dmdbi2wN5DClpQwD8OmEV2Gfm+f03/RYsi0knj7wE1XEa0dIVrX3luW+
	//ghvs0DSNf7+nVz9nfB8jhcMr1x5y9D09vD09JZsmYJB3sOJVTWq5RRCW9AGPkP/6LpWlapKmP
	P0/dkReuSErQ7gfr31or8OEiUQ9g2C9CW9ZbVGQnS0lnNFV18pZ4j5bNireqeFhI=
X-Received: by 2002:a05:620a:9362:b0:912:1206:ddd1 with SMTP id af79cd13be357-939137b138emr2192440285a.1.1788164258826;
        Mon, 31 Aug 2026 01:17:38 -0700 (PDT)
X-Received: by 2002:a05:620a:9362:b0:912:1206:ddd1 with SMTP id af79cd13be357-939137b138emr2192437785a.1.1788164258418;
        Mon, 31 Aug 2026 01:17:38 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:17:38 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:18 +0800
Subject: [PATCH v6 01/29] drm/msm/dp: move link-level teardown from
 display_disable to display_unprepare
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-1-c91d35d6fb9e@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=2701;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=qcRrf3REEES67vfWVVl9C/KGWotx0DutXL36uVlj3Wg=;
 b=wzu/q03Cgn+niwJ4swCE42LwrJHPsyifdwT7QnCxcc/uaRyQ8KOcoYRcyXpyzYw5m8bOLiC8s
 OKTp2I503j/BwmbbLj7MTIJUwjF3Q1gAkgr8xc2K4SjpGoD5FMyajce
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: OnbS5koVVmS7yFD2OSa5uZsOppt21s45
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX1n4QZ4t44MKd
 aLC+ZHeT9761SJF52q9cHUWEpN4yo/gSf2auGUEZqDWzaXBLXhtLC4JGejNRuvKwg/KlrPeUG2M
 +/wyMRfXkVAwt33uftzTCxiz68nt0cKxt322vThjdu+Sh9h/TLFM9qfo9nz79HZoSWV4l1gg9ac
 Saap0aAtyu77uscufSfWWpu35fBMHLGJA/HAcHk99aGRl3AFT/DUknGnf8D8YUG8L6ENLdTC0qO
 15eN5XpIdQTPYjLBX+GQ9jpkHXU/embj61qablZ0FyqTfU72NTt3BlCvxpVQUfRAGvUn9ejgfNE
 +x7DTMXb/PJQJWcd2DfThFUhBXqbA4d6SbLrQaU2ZiAmDf6HX4IOswS+7mX9oWJ0FRsDhFzYIVB
 3b5LBogdQ+QBn/xzb+O6Vr/pNfB+ookDfh0gDFHNx6hLO0SLcmYpndB+YG+7IpkgSplEqfJ8yHr
 Dfuje9nOhWV92ioJdsg==
X-Proofpoint-GUID: OnbS5koVVmS7yFD2OSa5uZsOppt21s45
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX+PBzFtFD5Ydx
 GPtjDQTcHH1eM8D52UIelx37RZz1CLWGFJodFeZ5Rrc5iqVYhVGRjjPY9RPOgti+EWJ2P+2NQLQ
 YX9p82COJygzlw77W2ifcnUlIEJC0no=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a9538a3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=a95-bzEMD9sxZBs1_CcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

msm_dp_display_disable() currently mixes stream-level shutdown
(disable VSC SDP, off pixel clk, clear power_on) with link-level
teardown (PSM config when sink_count==0, off_link, PHY re-init or
host PHY exit).

For DP MST the same link is shared across multiple streams, so
disabling one stream must not tear down the link. Move the
link-level steps into msm_dp_display_unprepare() so that
display_disable() handles only the per-stream sequence, mirroring
the split already present on the prepare path
(display_prepare_link vs display_set_mode / display_enable).

SST behaviour is unchanged: atomic_post_disable() still calls
display_disable() followed by display_unprepare() in the same
order, and the cached dp->panel used inside unprepare is the same
panel that was previously passed in.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bc646d172abe..a7b0196bb1c7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -722,20 +722,6 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 
 	msm_dp_ctrl_off_pixel_clk(dp->ctrl);
 
-	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0)
-		msm_dp_link_psm_config(dp->link, &msm_dp_panel->link_info, true);
-
-	msm_dp_ctrl_off_link(dp->ctrl, msm_dp_panel);
-
-	if (dp->link->sink_count == 0)
-		/* re-init the PHY so that we can listen to Dongle disconnect */
-		msm_dp_ctrl_reinit_phy(dp->ctrl);
-	else
-		msm_dp_display_host_phy_exit(dp);
-
-	msm_dp_display->power_on = false;
-
 	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
 	return 0;
 }
@@ -1465,6 +1451,20 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
+	/* dongle is still connected but sinks are disconnected */
+	if (dp->link->sink_count == 0)
+		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+
+	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+
+	if (dp->link->sink_count == 0)
+		/* re-init the PHY so that we can listen to Dongle disconnect */
+		msm_dp_ctrl_reinit_phy(dp->ctrl);
+	else
+		msm_dp_display_host_phy_exit(dp);
+
+	msm_dp_display->power_on = false;
+
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);

-- 
2.43.0

