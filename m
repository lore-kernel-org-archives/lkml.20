Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5320E3EC81A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656068; cv=none; b=eVBVkquGuqjCCTxKlxu1JfaTDubRAtWYDIN6aEN03H17Q1XhvyWIuU4lvMyE0sP872Q6TBPW2Q/BSzeuj/diCYRL+5g4dglrJ66DYDzG9u2nzB6fU2EH/i/F9rQJTpcjqdWT22FD0mFTawgyeABmcjqawhlGf5Cet2W4ulWhFPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656068; c=relaxed/simple;
	bh=C/o0ZCDpplNMSGFNccofcP0FNVSX5E147vDc2o0AxL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QFiLIgDxFAYlA3XaMfxnLuVdE+SwXHIDOCNmtz0tBnMb61l8pirPqBp+XIXk/7Eh+ULrc2HQ7kN3/eaeMn1PW/92MT9kZ3NQDctFVPKeePdFUb52gH8U108xpdsIPncYbwYB/6V+uoIGWOej9DxX9DaPVASXTpTDGBHXA9ConwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lc+w9zQH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQv7d1rm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lc+w9zQH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQv7d1rm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T46xlO2685982
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hiy+4MSFHQi0b8MUudXcZS5aUdLcyy1D41z/sf1hcaI=; b=Lc+w9zQHGoHQYcav
	biKQMZEH8n0+BlB+dyjh1O7dhR3e0XMndIGNdEn4M+BOrfM3FaHuKuVz3mFCE2OQ
	2yR7WXE2twBLTL6a4mNYj96ZtvhP6A/RYKtbvjU37wqzOAk/pMxmCyFEUKsCXByB
	oRnU+a3bkv2Nv5EU3Td4XQPT7YzfI5RIgIR7HtTYtYKDU0WjpNUv/A0L8YdAiBDD
	6vVuGGkIphEC1GXeBzfAaVRWI1TAq8+lEH5KWUVcRgwGr5LDm2eeros5HSejKGck
	fNSp8vdpsRtrevL1+SB8PwVIEO79SACbD/g7y0ftiKRAgAeT6CJJIhNLsc8SFL/I
	agHsYg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mjgr2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so970401685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656064; x=1791260864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hiy+4MSFHQi0b8MUudXcZS5aUdLcyy1D41z/sf1hcaI=;
        b=cQv7d1rm+jy17YOMGd+nowMrBcmin/3uvji+Pg2eQ/VC/52vA4Wb6y8yWyKAfB0RxR
         oKg3yUCtFOT0yP9Ul/12YvCmrixm406r2jpO8USWMAxAXdYiQu6/y2ulaLaG5IsPF5oN
         RH6BALotGV4nJPdYAxU7W5AdP5wLZLZzV0vXa6QbgVB7xIK+cvYmazXWBY60tOrEk6iz
         ppEw7V6Uun6AzzSRoaYfIML2S9fwZzSX7G2P6WWh2WozI5BwTUQYXNgbvXEw1b4m3B0N
         c4hlVNkX9SCo6BW8qbKTo3i8GjlytUJ3hmQps6UzSAbAdQzEAUQNYW3UQli70oELP8Dz
         E42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656064; x=1791260864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hiy+4MSFHQi0b8MUudXcZS5aUdLcyy1D41z/sf1hcaI=;
        b=fX4k12OlHRpmeq+OcXJ9zLr5euTlsqXUPZ5eVbHxMg2kWzYJ4KV/LSuAEg2gUMzpu7
         bwRQoveYlpnldTTgSqn4Acq6H/2XYl948KksTo2xSY1CVudLTgF6JhBw0VTruMJ96J0I
         PGaCr2Y8EpQbnQ+sliZMaKtIsz/fqGSVJPRHX6/MPSj8Jei4t3SccRgfKKPc9uE/L8F3
         wfz1FGYALJmslpY1VZVmDA5yFjS1MIh3LHnIPBTNsTcgdfsZ/wcrDw/FY9FXBMeg9ZID
         RgPh27JyTTPViZHBN+t2QiieWHYC33IoMNp/Ox177e3E1dIoBsD5BPxNSKtrR/EaLUvm
         4SVw==
X-Forwarded-Encrypted: i=1; AKwUvBxB1RaLaU9jxYZQrkQj12S8hZKv+pV2Qf8z5SQWdeskThS3iXxOlJwCVWV5ycsXJLCG3G7QzNsS8uFao9g=@vger.kernel.org
X-Gm-Message-State: AFuF++mBPQmaNbQTz2w8wiYWkpUl656cGhrYubuE2ZCQDZ9xqahyK4Z2
	7NmD1YBPWLCi+U3co/49LXxb7kBHpiyaqjPfEa30MjIZj/6se1+FAOtyAwDP1G2WLtf4TVCsuvD
	ok/7Xex9B4P94AjQyuj5LTNZ9OEovlCynhSzp+/yfCbS3hoK599rjgoNEVZAKHysPoMY=
X-Gm-Gg: AYBFou21m8b54ifGS+XpvXu/Lih96WbQbWbDwuWZIM7bOW5xCkrqK0IjoXqwkvZADqG
	eOR0H43PGHBAanqQaq0urYz4qZRZz/N2djG8SR3Luk9tk2E64tXubfP9t9dhy/4RsFlKwVJ+bnl
	pxcvDcWqV3rJ6I9PX4MTykJeZnqyUx+By/2PTXZxyt17l0XZX3AsMVa2cckpxJavJD4ThXatvjf
	dWfM5eCiI/NmreX0+aF139EuSNSA9wo9a0Y+70dvv0hPp6mZP7954oS7l+ujBaWrodxk/Vagjoj
	U7ldsQ85xzbgUinUDXS51Rzqi0vrvYRGjz0SQUqXhX+EvX1FpwMJmlFrHwAuixDal84Zlh1XxKI
	ossbQp9sVMtPdq0a/NNxfTL2i443IFHS1NE0tsLeXwMDhQXzeIhwgllmlE45nxfE=
X-Received: by 2002:a05:6214:488d:b0:914:4e89:131e with SMTP id 6a1803df08f44-9144e8919fdmr170216076d6.28.1790656064334;
        Mon, 28 Sep 2026 21:27:44 -0700 (PDT)
X-Received: by 2002:a05:6214:488d:b0:914:4e89:131e with SMTP id 6a1803df08f44-9144e8919fdmr170215856d6.28.1790656063892;
        Mon, 28 Sep 2026 21:27:43 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:27:43 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:40 +0800
Subject: [PATCH v7 16/35] drm/msm/dp: add link_ready to manage link-level
 operations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-16-4b81473185e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=3521;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=C/o0ZCDpplNMSGFNccofcP0FNVSX5E147vDc2o0AxL4=;
 b=pUXU5DEn9FspX/uIKxuUa3h2Vd0pZ12m5jZssq9UMdQUTPtd14jVS7tdGQ14ufwGLAMA9CcxT
 wji2U832fCYDbDiMHklLX5A2B3U1+NWyeGMa7TS5wj5T2qidK+iwoEM
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXzrjaBCUiaLNN
 JdUMEI9DiVgG8MWLfJvPQPQbAZRJRMBmN0DY4mCzkU/31CPmAGBsjpW1DrX6iTjnoqEpb2Mv4fV
 1LfQn5RNCG+L0zYT87NHEBUxnjWXl8CCL5khqEUylhfBR2tv9bnkx523UmJOMKDNCpZ3Dp3xJrN
 G+lmhLm/P1oyRX4Al9Q0c7InA7SBGBIGx2aLS74P0nBqN/JAReRmypyUF2wwhakMtSjKUPfyHL/
 2WCq84EEjXqjQbkij8Hqb1v51oKBpWCXaGhV367wo8w87Klnb8mEzrn9rFBrVc+FRr8xI4RShUs
 RJe7E0aTKh76Vw2gqi42pQWo+n+fAFsuWkwwANkSbPWJI8BuSuvEwcDv3dRQcAwPbTHmQWkHppl
 eRhEP3s+CLLMqoCIhYSsFePSEPHjEEjWdL1VB87zxQx4zxtdVIQHH7RGJRJbE0RRhmDKxBiKguX
 2bw4ZtMPwjH4qJTNptQ==
X-Authority-Analysis: v=2.4 cv=OdgNnRTY c=1 sm=1 tr=0 ts=6abb3e41 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=r0U9Mmpn2XdHegFmGjAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXwJNRP89xQ6Qg
 4roRB1LLx0Ur9ubULrFC2/hRz4pwp55F0qI+lTNnh63kS+nr6qmhu+zyrlrsh56T1dUEeaggerU
 fd1xpAS+d+u/A7kT2Ao2JDIoK7aJDZ0=
X-Proofpoint-ORIG-GUID: GdjwSJDetgj37p7MuN-G4dmZkN0HIpGp
X-Proofpoint-GUID: GdjwSJDetgj37p7MuN-G4dmZkN0HIpGp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290017

In MST mode, multiple streams share the same DP link. Track a link_ready
state so msm_dp_display_prepare_link() runs only once per link and
repeated calls are skipped.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 33 +++++++++++++++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 49a718f4e464..487c76e0f990 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -638,6 +638,10 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 	if (msm_dp_display->is_edp)
 		msm_dp_hpd_plug_handle(dp);
 
+	/* Serialized by modeset lock or mst_lock. */
+	if (msm_dp_display->link_ready)
+		return 0;
+
 	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
 	if (rc) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
@@ -659,7 +663,11 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 		}
 	}
 
-	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	if (!rc)
+		msm_dp_display->link_ready = true;
+
+	return rc;
 }
 
 static int msm_dp_display_enable(struct msm_dp_display_private *dp,
@@ -1501,14 +1509,16 @@ void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display,
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	rc = msm_dp_display_enable(dp, msm_dp_panel);
-	if (rc)
-		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
+	if (msm_dp_display->link_ready) {
+		rc = msm_dp_display_enable(dp, msm_dp_panel);
+		if (rc)
+			DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
-	rc = msm_dp_display_post_enable(msm_dp_display);
-	if (rc) {
-		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(dp, msm_dp_panel);
+		rc = msm_dp_display_post_enable(msm_dp_display);
+		if (rc) {
+			DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
+			msm_dp_display_disable(dp, msm_dp_panel);
+		}
 	}
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
@@ -1565,6 +1575,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	if (!msm_dp_display->link_ready) {
+		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
+		return;
+	}
+
 	if (msm_dp_display->active_stream_cnt) {
 		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
 		return;
@@ -1583,6 +1598,8 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 		msm_dp_display_host_phy_exit(dp);
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+
+	msm_dp_display->link_ready = false;
 }
 
 void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 9ecd5025fe4a..51eace1d1346 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -20,6 +20,7 @@ struct msm_dp {
 	bool audio_enabled;
 	u32 active_stream_cnt;
 	bool mst_active;
+	bool link_ready;
 	unsigned int connector_type;
 	bool is_edp;
 

-- 
2.43.0

