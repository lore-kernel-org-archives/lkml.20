Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB003E832B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790655998; cv=none; b=QxgyqRIqVImnzKbPlxdSCUDVtKqjgRcUZnb8CVOB5GyJzc4CNtHbWZysTQnUDS4CffRPgtBPSqNKHSY5l/PvGFx7d+6SA/Up0+XYGNiQFIb6n7CpXjakB7QcZE3LTFrHnNuDpqXWdiF5tV9904XobBVCqf/xAuq9CXoJhnqP0ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790655998; c=relaxed/simple;
	bh=f1K4UM0j8Cl3LGM224EgN5DwT8LVjxn8PqEmhdhVTyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nL0ffjK8ACHrIpnGzVMHgXalXNyT53q+NRmu6GwO2yS2zTRa938gWwEfS7z0sKvYkA4jhWf2PUwZ9V4YkoDvp33HF9vvUAenXu7AOyiosJ+P9NFJR/IZ91MoOmwsTcgsTdtYp6FJinZGcTeXIFOrKlKXviPrNUQ+qa0q0N+dmh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIfvVlvJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OFVc6mt2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIfvVlvJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OFVc6mt2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47XBX3654790
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oyHmFa9wvulObjT4LWttQonigm0eeqeoGmSfl65guNQ=; b=hIfvVlvJl159u6UI
	9vUei3ndeCvErksnbbiFNQIAA23X3IMaoyXdrkJi9NJfPsbaSNF5wOgPSz3AEApi
	PvQUNakD+mFpHyD+l0Z57noE7RCfWm8EnFwj41DB1nMmCMSMsDQtGd30FPKHSm1N
	kg36m20ekUJgM8hnTbqkEWtytPFfBk/4d1Gvy6wUJWujzbwbTpj1hIBmQ3KXfH0a
	WzkjO4d7kSfKe2YxaHeCOm4VqLd2JTrpAkhC36wbJL3RQFyJRc0AuPn3DkIGfvBH
	EnlI9cyJgfQP4IQo42XH4KIzXO+ollI3XalV+p6k5vWQ7Z4L7u07GfQTES/INvae
	nizBlw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew0js5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:26:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9143d796129so64802946d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790655995; x=1791260795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oyHmFa9wvulObjT4LWttQonigm0eeqeoGmSfl65guNQ=;
        b=OFVc6mt2dVbshPR4NqGq377+6EsgmRvREg4vx6e/cLLMfi7o3e7r7uKujXDew58//6
         ilHTWm/nR3Yn2yjRo5/bNKuuvKMGZ3IzCCfON5/qerM+IwcTWg1f2I3PptXBxXPu3Yol
         GuidhCuSK8B/yyKYcNDZg+xn+vuIckGNdIHbsCFqUMbDFAa9/ma4Yag9KWUDrzDW4Owb
         uJKyFXXDiJI6cRm8IzTV0MGlNjjt7U5pO5gys+OdiumKbqkJQRyBN93MyeqyH/SK1elh
         1MwVT2/EAxTtpInj6xoDW42nWZKrFtCODG9PPeuiWNh1S45WjeIyzcJeFiUWu/dfXReA
         /RvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790655995; x=1791260795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oyHmFa9wvulObjT4LWttQonigm0eeqeoGmSfl65guNQ=;
        b=HVCY/7k1zvY4CN7pa5s670rLOo+bOtv93N3vOkF/JHvjybM4D2Inj6K++UGZTEfYUH
         NWL7Gi/5wLoj+HM430kmbW2mnbKW6SzqmHaGvnqVS4C7kA+0YzRjc4R3ggILprb+0+eZ
         R0Jc4EFQ02L7FVuhN0Zgb77+nBLV8+YKRRYfgdM1mWPVW6fBKWu/hs9NerrAFhgP6ukE
         28n/fWuTtnPxvrxbjWlewKx+MOzC/wTDMn9TfPgwXRe+3Yn+t8SYGajcqV6xzG1RsWNX
         crr+aEN6qTCNATAEbvn1im/FYJnb35n0HpvbONay6VCn/Z7YWqPRO6TW6fPfvV0ynrc4
         viGg==
X-Forwarded-Encrypted: i=1; AKwUvByj+TxVv6dKJxDkLcZcYptB0EEvu/VAyCBkF/F/Ji2o7c2Sg6TxlwBr67wa9EoZTieaQS3MpbFJrYO985M=@vger.kernel.org
X-Gm-Message-State: AFuF++lgkGcQDDojgHKvlotliSfnd43F2pcq3Wuo3o7+4u3ElyCl/onU
	iM5uWJ5pZuLRmHNkTmMBMgeoVce2pIeD4qYGFjQbV3OfnlGpmcpFWkwaOOvxRK1GwjvYi2nm1z4
	BAHR1TTAC2SKd6z1g8VrKqYTxVJ6BRKDnE/9VbB5oMtyem4yRWYZQIttIeQBdpD3Om08=
X-Gm-Gg: AYBFou3O355uFsROj9sYZcysbbGCie4XwfWAlPpUJrT6QopuHMPcc951paKbCTFqx4L
	NvyTHpB+Ez+NnJXkSptZ9ef9RiR/xgPcsz2BioOUpMl7AgtVSv9PFOo+3pLBGYirL9hhIcyGKmr
	bK0yo4xkRPlJfPL4vnVELS6iX4S7dYSMacLHo4UWnCaHon67M+yY8gwcp0NDRPUe8HH7oJhoUPq
	1EBxx/1MFB7/yptR9FRytl3f5M5GCz+jcUkzoqoXIe5eQa/LJMiBXA/af4A9TZuZ7la5m1FNFwS
	p0zc5ZGT+3ALxk3BkLGpD4LgzIEa78GPvD3n7TOTCyF+hT5w0gD/dSIaYcpfz9KR5WEAW8DKObi
	AiGTe+/sdWH3lIhRAOh+psdwPcFB9gt9tJRSE0wnmlgMBD3kryyQHiuUU6tcGnAI=
X-Received: by 2002:a05:6214:cc2:b0:915:ea96:d746 with SMTP id 6a1803df08f44-915ea96d8c5mr98257336d6.28.1790655993733;
        Mon, 28 Sep 2026 21:26:33 -0700 (PDT)
X-Received: by 2002:a05:6214:cc2:b0:915:ea96:d746 with SMTP id 6a1803df08f44-915ea96d8c5mr98257156d6.28.1790655993310;
        Mon, 28 Sep 2026 21:26:33 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:26:33 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:25 +0800
Subject: [PATCH v7 01/35] drm/msm/dp: move link-level teardown from
 display_disable to display_unprepare
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-1-4b81473185e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=2701;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=U5xt8vpiVAWHAYVlgspV/jOouZBlgXr0Z45thYBSl0w=;
 b=mnCVYmvynhZjvcbku2fjIveX0aUa6o90Mrbha+MhPr0b30P9vazI5lWLiXIWJ8adE4vGKknar
 F9pEXIjcF9gA1xqJjIq2npMvB4bL5tEvk2psaWB44cx12CMfyfN2WYS
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX/uaDvzV74VqD
 hUc9fHdzveVrp2UM6wenk+YnIQ61S2okIgIFnuajixVwYJifm5IuLDx81eUZLqJA8eQRaNhXlQX
 IpcDaqvqsBZ4X1wAMrAf+IxZvkkAq4w=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb3dfb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=a95-bzEMD9sxZBs1_CcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX5LlGjLf2Q/XG
 6NbhBTz8oEkTegnWnzNV5Ff2pLEEpskkvniY3vScArD65vyXajw7Th5VVFV5PKX6sVs/5hd/Mqd
 D4TygUNoGtoYI5rK2sl7qXwAfxjyPiDL+aKS7+WI6Wr7REHeIEwIU17ct/GJAnGYxBxuWTmRNuJ
 elu2J+DU7c8+hCpTrLn8l9HvQNod1vbH21RFaIlm4mym/muw1STVuRrxCKxhcrNZYnL/RFtaUQL
 dyda2DWrFoWbrywcIDDW1X6mpmMsNhvRbR16YOhuSs97G1jL7q6nHH2oGWvQojsX2PWFCjOCIgr
 TdyFIlXDkWwkpeBvjSVLHOpeFnElNimTvPrECHh2JQbhOBwvFGRQn7zxT/prvDSvhQql3y+xxCI
 8bi9cimXOZ5w+pJ5XAzSbLqG+WlYaNNqvYT13lfUob6EDEMXwJCOQzFUVLyBxXEJNghp60pCcN7
 mzsiXaKOHnfFAEC8a8g==
X-Proofpoint-GUID: vNdVv8TqoMuqzN1-0ZAVjzIpn4BZXvCq
X-Proofpoint-ORIG-GUID: vNdVv8TqoMuqzN1-0ZAVjzIpn4BZXvCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290017

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
index a420e3d49928..03ccdf7e0366 100644
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
@@ -1482,6 +1468,20 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
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

