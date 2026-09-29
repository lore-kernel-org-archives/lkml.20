Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15443F1052
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656127; cv=none; b=hpIkpuC7z44aIemCXQb6yGZ+r20E97zQ16zj0jGiyrafnW/YJKpvgqihTTUzkbh9KMPGwEDgqwqfnf+BSU72Wh4V0u52MuYO7LG/FhkaLirQzBKtJ/yb3y//cXIUX/4D4Oehc9I+zhoKC8Uf2nhOyetiXUK3spM9JZPTul7yDco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656127; c=relaxed/simple;
	bh=Bo2HzP8euFhYPQwf5+QM5KfP/7JHVOHS9fxBqkowr48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1AsA5ONf+9J1pXOq8ERV8T3sXpJ8dcaAO+AaPkNxRoYEqZ9qUKlxzVk22AcLWdVyq5Vp48vjbhGPVykB5O1Z2mEOTgQDNikewuctX+3tpJ/2yCgrPTNxLJ6K2aT78Z0B7kf72i3aJBrY7zwFUb397p6tlBpPlQ6uS+y3TuixVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKt9raKT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jtn5iw/s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKt9raKT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jtn5iw/s"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T479MS3643010
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCLBU4VkRPFhZ9rgabFpRlPORMDBRpimMrnN9bVDHCY=; b=BKt9raKTwei6g/lR
	tFP99Lf0nwv7CrMpS143/pO+DQ+PAxIHTV/Uc2U6FO4HvmRYtUrGVUAUEJLbstGo
	v9FCvPmuPUHZYTPdEg8U695jolVQt9VFJSWDnHtjUxBVa0xAnv5jv1mo37oZCDHq
	yTz0PXPl4Uc4Ndm8gbIv8M+gZdl5jo5xqtWy1w+EEsmViwrlafRirpyjYiH+oEX/
	cmF1e2PZo6NEt33Bjs3pDVAuc4BZqk6Hzz8etuaoy3qvEelmzH2y5d+PGW1Iiwqh
	IZltkw2BZf/wErnxbFTspKPJosk10jWKGV/lzfoKI2tJuKWaCfq3O7DjrChkcJar
	ajiGBw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4s4h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9123be39eeaso78909286d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656124; x=1791260924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCLBU4VkRPFhZ9rgabFpRlPORMDBRpimMrnN9bVDHCY=;
        b=Jtn5iw/sUZ38YtfbsgfQIVfV26+a96QdydquMGChgMG5vwbAVcHCldKyfBdSLoa9Tp
         GFbbZhMbWSABnagudCRyRFOcUMjhc00fhOJzR3M8spQJf7Gc9BNUnG43O+Jbw9qrokON
         oKwNfSqSavNojHWYUIQmHKWYCx2NiOe8jn4+UCnDIkUOwfH9wE9Xn3lorc/z0d+043su
         KdrMzUS8/QYEJpA1VpivrpOZS3+ecb6QbS26ug3rZkDKh88p+R3kHOmd0b9fbo+rHHH0
         Eeoz+mCYzugDE+0kMZyV700x22XqFAg/mqOA5GRI3pCpIyR5GbnXf+/6yotez3s2fP1K
         MGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656124; x=1791260924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCLBU4VkRPFhZ9rgabFpRlPORMDBRpimMrnN9bVDHCY=;
        b=JmtCHADhIik7hPFO7q3Cp7w1J6+gdtlwee7l70c2AB+lx68dVkxNHgLzghALWO9+SB
         7xV5GFvPZ+Rv8rnzRZbvh2PX/iiESCCCUCLbECjMsB625YepkgL5YTHSkcDY2BErXVYJ
         Ao52JTepI1BdFXuEnwPIn8lhMVoQ0KfMtSEzrCPqx9YvrxR9Tgx272NFLa3XQbQ0W/d7
         kOacRovGzNcSK5WwmE9cOoJ4w/0o8q9M7I6QN/rAI23nMbdXHhgspDNbdCfKecCDaTPu
         cG43Z611PZyWGNqybq/dFGiY6aVZ4Tb2Iy9jOV3saE9YFkl1MwF7t0tpQlVm8Y/ruguj
         94EQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH9xXF2LtF27h1e0kN65dUblY2zZHYgghd3c+I4nb8ryPGuj3J1rlTM3o3sxBjtBhUslkAhrGfTwFZlEk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBEKQlSGntqIXWaMYqCtEBYZbsq+1x/bajQJkGnJBt/67F2H0L
	ClmX/XqOYvFkUGWRkAqC2mUKB2lUueFSiA8aDLbksdZSxx8ecR3YnxiiuYJLy1DpbgGWWHglQhp
	7LXTd/kB4G0Js0m06zTBNDcUNqIBHH365larSDSzzhaA+Ey14lXsn1bV35eLoyCc5RIE=
X-Gm-Gg: AYBFou2fBwWK6b4yJTzdFGifv35XbJLveGdpV0ErGSIRDMZUqDEP8SuX0PQ7DMkOmlU
	BYnjGu3bcKsGs3iylETiUiYquUF5yH1v9Nxl6qfIt2xPKsQUa/IwKxZrlPVCI0qxpyCw3sawCgQ
	7zl8xdde8of4aGQvm1lqBdpW7V3VRiVW7UfGmlGAqN4IDljAVwlnPf9uofDbSLYKVkjDujWckNh
	DKcKXTr9LKWJlssv24NFH1VOFqzxT6UtvUYRh5KDxJpr0K+o/qwuDugXbGW2TihGttrcTUwa5PE
	V9rEWMCh3iNgqSWeDK81AqKvNvbxJkbzMCnr8S4CeKbjhKkqU2/UwMgvk+WgvwIHfQWG3w3OHlW
	clHPvAj+VvgftO4s3WWIo/eYzgIpum1lbTjIUHAyo81sAuadVoL6a1JzsgoT3WmI=
X-Received: by 2002:a05:6214:4281:b0:912:d9b:aa2a with SMTP id 6a1803df08f44-9142f8ac3e9mr252107456d6.25.1790656123973;
        Mon, 28 Sep 2026 21:28:43 -0700 (PDT)
X-Received: by 2002:a05:6214:4281:b0:912:d9b:aa2a with SMTP id 6a1803df08f44-9142f8ac3e9mr252107206d6.25.1790656123486;
        Mon, 28 Sep 2026 21:28:43 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:43 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:53 +0800
Subject: [PATCH v7 29/35] drm/msm/dp: mark the SST bridge disconnected when
 mst is active
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-29-4b81473185e7@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=1108;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=+026P7+prh4NS9j6xdmzfYv32FGxKTxrN6W2/TiN1eY=;
 b=dB6YcfyoNpRTMSE7Bm1AdeuK5NYSg3GwxdnE+13qGKwLZIKqZVwIFcyWDZrq7aPsPrwF2OR+N
 AndXn8vwxlBAiXhLZmqActN0p0D5jYLtTCCmx53jTLFptIBzD1DRcEo
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX4lTd4WyeuniN
 QcvX+J/NebhzYFXk2J3aGo9IhfpLYZ3Q9L7HaXolHpUgn0kU6hWeBXmGIUr06y7vBfFC3K0AwoO
 +NdWPUITuDCchLwYaPvnoP6l8rY4ONM=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb3e7d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ao9NmXljvuVdf-BuN7wA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX8KqZ0Ibjzhab
 UFfM4OWwI5P500PuR1CdbGr9MbT2q7GN4xsHWcRjVLQZouZ9A7N+YVgjbXfZX/6T44hyaAg4Uor
 /4DqF3hoIoV/pUbzJO5f0tci4hpcQ4z+AzC7np1ZM6Ghb9JRlu0bMJShE+84WFCqgE4od8OQmMl
 +SsF0sDjHaS+ieGoRWieVXnVHjIfC5lGFHR/xvFWXJFgrJQ3HgPQLo82iLu3qZ+Y1RsRyFXaTGV
 DUEIojGInZ/w+DnLGupR8AzqMzfjd8IaPcENYRjif9KVhBzSFTxd4AJWqkErbhILa0ONAJhNLvg
 VlI+05rflOpwp5jaAYFnrgNqVlJXg2C8Fw8UDprrFgmw+Z1JCivYUhkNltwcHUXooQ+8G6EuikM
 /v0UQ5OuDnOV9FSR3GwkYv4P8Nhw1pGC704ubpT04vaDUnZJt1lBCDVTzQnUhcTOr57SgA4s/IG
 mGAU/REGIWegYRKxr/g==
X-Proofpoint-GUID: RW4H1a1rqw3fKqFotlXKejBuSvDKjlFE
X-Proofpoint-ORIG-GUID: RW4H1a1rqw3fKqFotlXKejBuSvDKjlFE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The bridge detect function is only applicable for SST. In MST mode,
connector detection is handled by MST bridges. Skip detection for the
SST bridge when MST is active, matching the behavior of other DP MST
implementations.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 71c5e6bef02f..21dadc2e6cdc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -971,6 +971,10 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	guard(mutex)(&priv->plugged_lock);
+
+	if (dp->mst_active)
+		return status;
+
 	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.43.0

