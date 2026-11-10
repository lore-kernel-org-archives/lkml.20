Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286578;
	b=g05b0A0c6uT136TTomb+1gVw7R1mSZ00/1Y6roISIc9+/j34ub19nXRHOMm0lujKRkUy
	 aZYz490M60+UohrNayPokShvJQZJM/TTLfjSHjir/sYON9iG2pUioueDCFgCr0wSt0fpd
	 TU8oWkqH41/Dsn31nlKC1cmVGrAe9UZ2TxmBOw82pp3LQrTUUhz9R/6jqWyQyb9oicZDC
	 3jZ1Q/tZXQqfGuptuiVELDzKeR8vLXXQhrpqV3fAUNqHO8/ggLTahzbi3bCvSY4bias82
	 OfHasiiHDl6ewbGvI8CsJ29wNWNFkBcQE5841XW3qiXmJ/PfW2MeCwp91mPqDEeQA6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286578;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gcJuLk0l3ec0GmBsp4PXj2UGdG/pl7qEEqNuXIeXQ28=;
	b=eCllEUSuH+3daECMJQA0UCu8WUuQ2V91WyFcY9UwKBcTZsoWXYBFeXZnRScW6k4AY17l
	 sKrnY6QRqfFuCRkE9JWdEWWmxxQbxzPfwk59AvMaIxYCbWnTBIJ/VkmgaJknSCSsn8j68
	 Exn39HthkI9EhfVX1oef7J08S+zpJ1iUcCALKIDlXMiVADXmHweyvFVCda2WWihPeqMI4
	 gcaC3KFCyhqJia+4Q/r5tcVS5IJsLCFmJlduK+w3GiPRwtFK5eUQMVImWfbgi7xDIoieT
	 dkFf7Td7WXamPLde993cJ2ZJZax03cexcCewPw7lsyDZZvhB+n8NP/kKLURwXwWZlgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MBB5LUTx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YQ9m/LeU";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8EB606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A8EB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MBB5LUTx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YQ9m/LeU
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A9ZW1957698
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gcJuLk0l3ec0GmBsp4PXj2UGdG/pl7qEEqNuXIeXQ28=; b=MBB5LUTxDSpMGfFt
	bhAhq3ZXNGAjYsd8Evh7dk8mzCnoMqkQNbHS3jbyd+QpiXfjW7Pddv8EjTYv08S8
	lia1DnQBOw89cjcOBClz6+lOk/PBfFrjykHYjxq3fGRqIKuHwhhM5oUnv3T6XDj1
	TVjgG61ZjJdW3Ho8lBuXtx5OB+alqifQ3/DdoCymhDI8ZwEPX1HIJ9nD8B+PjSHV
	dSZRTeJiEt7LgBF0/tpdcBVOp9j20wpLqy7u8yTlqrVb3ElFVSCX3KwEVXW6jHbY
	OV5N0PHuuzM4Bdgi/T476yAdDOcBqpyzSdlBYIrX/PFcONpoNBbh1p91gT8xbXrZ
	whbuYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydknkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944101e6367so313542885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286576; x=1794891376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcJuLk0l3ec0GmBsp4PXj2UGdG/pl7qEEqNuXIeXQ28=;
        b=YQ9m/LeUwjBpmCgVu/cLGe3SD4S+ZfVhUvt2DsYuuY6D/5nG0ZAVxanaNSoPgRsWA6
         psN19xJLc8AVimvNZkqSdVDHB9Mm/ETzBkVpdjXNZMSjaQq2y3aqvGYbStKp7GaDfybD
         SHakOvibp1i7ekV661SKwwyQjGe2NvIb5RPnwXSTmF/XrJNwojLrc1quEA0xGULyUZMZ
         MY1Etw9EbAUwpBKn1jgceAfSYfuEsulCupV31ZS/2BQ+6eQ0T+2cqHAnN+dX8hHqize+
         29k4MYsaE+yHFvDum92p6Oe2hOfBh8KsYwogVSWROX5ixZ78m26G3UEhPvlk3lAv8G+7
         OAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286576; x=1794891376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcJuLk0l3ec0GmBsp4PXj2UGdG/pl7qEEqNuXIeXQ28=;
        b=vXdkRKE0v0pOUqo2v/TWxogSZyL+MHiWOWTZPVPsQQ/low4YmnK8BRyGoIJmJTAFwe
         OVNxF4WgDBec0rnk+vOdzH16WQHQ17tSb8WqDuAngownyHrRTwzyQhnI5znyv0GPuAGt
         LFhsveBDKuUAKiq8koAlQV8Ru618m152jmg0+zCKhlJ2VpghNm9cl1Wo4Cf4or0wvbAF
         BQoRjBqFzQ4qfd0Hq6bAFkogF+WNvQzBUJhe9IF33LkChGdpOo0VrQA4HfQcP8z2KYza
         qgWfuBEZD92+0Deg7S58ZnmqZHpIv6An4PXv2bWPNe/SKYhlHFOO3Ir9rbFrRmEjPD/8
         q6nQ==
X-Forwarded-Encrypted: i=1; AL+hErE8qrsBsSFCRG2EtaJN1YpagrV6I7ouTH1dLFUuLXXXKDSvNOZsLqxjmAun4bgo0pBT3Q4csQRn3aA/Cp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fab0W9RCJWC+sZABPuhUv/6cxLLhBzeblim9+GEvEIjbBC968
	Pk2fYRgSY35a1TkMQ2kTX1Xbuyx0nJLxRj0trrF7dBdEkhLK9KbA1O12ixxW9r01Vp6Mz4f+d5l
	TuatmmuDqKCjt/PcOs0+ytOYfPtAiV1X+PuTklaXxeEt1vVKOMfMIuoBNqkk6Ir1Hxe0=
X-Gm-Gg: AYBFou3+uv7kua6v/ti4pVGi8WpOBGpk6nWbQMa9vxG15IO0IKm/Yt+J350UNTETQ4y
	HBUuW7g1XhWiDzHXBkxGKzbT9qos+J5f5a8xFFwCNH9aEVwuhRn3ejRcyp2IlqPk5Q+BGSua8mI
	x++nWOQsrePPjHcWyzw5gWyYYzdVG30Xu5c887T5FHWLdc4mi2VzHaPWJKqzjo19vw0KZ7bd7fN
	aKiOuBpvYHAn/CaxQxotykpTP0V6uO4uR3QE36dVIOXJKTDNweReq6HVvtsBGxs5Utu5rqvmVKn
	kWEy90GsqQ4oFTv3Hz5NoacCpkjVXNrpCpet6FfbUMpCaqJpnKvBViNNr7FWxsspVnOqBQlNLio
	Gf5Ynx2CExlRS3TtiA5Y7lqbGffZGuZtHa16C5DXkCERDvdR7Wv88P4UMADaBA4vcKjVoNY1qLx
	q7HTvn32M6360K4wRhKTdAuKc8rwP2Kiz7tS8L
X-Received: by 2002:a05:620a:640d:b0:93e:95ce:5394 with SMTP id af79cd13be357-9479f315948mr221651785a.2.1794286576394;
        Mon, 09 Nov 2026 20:56:16 -0800 (PST)
X-Received: by 2002:a05:620a:640d:b0:93e:95ce:5394 with SMTP id af79cd13be357-9479f315948mr221648685a.2.1794286575881;
        Mon, 09 Nov 2026 20:56:15 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:56:15 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:42 +0800
Subject: [PATCH v8 21/29] drm/msm/dp: add HPD callback for dp MST
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
Message-Id: <20261110-msm-dp-mst-v8-21-d040fb33db5f@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=6603;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=ajtVF3560HpCRMYYVeGWs70pSZiQqv0MSipxC58fLeM=;
 b=9R22Jtrw/AVyh/2i2/V+LyBwNBPy/SylEqC5wtvEeUtlcJjgqotClGKLkDnzMct2Df0kxSHm4
 cGnPxjPv0BiBU6MJCOz9CIykj77EQwe//Q8oUFXKHf8tfStcP8rcXTB
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX+q5zdayUubr4
 n4IybNUUgg3l+25xre5KM+DV5rBTz5wvhpbC0b23voGcTCkxsixeKs2BcUEyyT+UPAckiSB3omp
 zJxHM5ZLnibuyazIqdP4iURaggGod8Q=
X-Proofpoint-GUID: 1prpUuIhHsxb5rkvGqaYSAmiVDwHwKNh
X-Proofpoint-ORIG-GUID: 1prpUuIhHsxb5rkvGqaYSAmiVDwHwKNh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfXw6SbXERFsXbv
 GGGVafqM9+RoJutMDFZuH7a8dH6VFGo+JWzH6D+4tAw3xHfkzpbS49rG4mLgZhSatKHN9fZxw+k
 IGAYtPVkeb/Vt9ieQRf6K/9M0ZazGHUT8/C6Ohd/RpEHEmoq6meVNTBZ7tEGblX0FPuozqTVREb
 abWk9LCKi/hJl6u2TCgQkBL+uv3IQOU7jpfr1t5cOrsHDGs7rko+7acKbC/PxQvW/L9GcwY3i2s
 cPjgPlXT26kn1HYudpsYDQB2GN1ub26orr5qeXoLiXXMGuhD9GLLrGDLzIoQx0fJ+xF4W6/Lq60
 B08vz9+2bUSGk/lEC9vqIRkwbR0NGGkyuRe55opGSw5dR1bPPkLx/kDBbY4ZQAxuMzhTfMtmM2F
 psfySKfKluaHrEv+41zKNs/hMNDG2lpMPE6uWhqg+rUCfOvis8NE9Lek0FMyVTKjjPmVPtft5uo
 /OSo58Cv/eh/8ygw5kw==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af2a3f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TC7KtrVTTV83HWuqwI4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100019

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add HPD callback for the MST module which shall be invoked from the
dp_display's HPD handler to perform MST specific operations in case
of HPD. In MST case, route the HPD messages to MST module.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 21 ++++++++++++----
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 48 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
 3 files changed, 65 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index af8d22fd4fc5..b4e788d1f611 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -529,6 +529,11 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
+	if (dp->msm_dp_display.mst_active) {
+		msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
+		return 0;
+	}
+
 	/* check for any test request issued by sink */
 	rc = msm_dp_link_process_request(dp->link);
 	if (!rc) {
@@ -1078,10 +1083,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
 				      connector_status_connected);
 
-	/* Send HPD as connected and distinguish it in the notifier */
 	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
-		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
-				      connector_status_connected);
+		drm_bridge_hpd_notify_extra(dp->msm_dp_display.bridge,
+					    connector_status_connected,
+					    DRM_CONNECTOR_DP_IRQ_HPD);
 
 	ret = IRQ_HANDLED;
 
@@ -1318,9 +1323,15 @@ int msm_dp_mst_register(struct msm_dp *msm_dp_display)
 
 void msm_dp_mst_unregister(struct msm_dp *msm_dp_display)
 {
+	struct msm_dp_display_private *dp;
+
 	if (!msm_dp_display->msm_dp_mst)
 		return;
 
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	/* HPD is disabled by drm_kms_helper_poll_fini() before KMS teardown. */
+	synchronize_irq(dp->irq);
 	msm_dp_mst_mgr_destroy(msm_dp_display);
 }
 
@@ -1755,7 +1766,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-	u32 hpd_link_status = 0;
+	u32 hpd_link_status;
 
 	if (pm_runtime_resume_and_get(&msm_dp_display->pdev->dev)) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
@@ -1778,7 +1789,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
 		    event == DRM_CONNECTOR_DP_IRQ_HPD)
 			msm_dp_irq_hpd_handle(dp);
-	} else {
+	} else if (status == connector_status_disconnected) {
 		msm_dp_hpd_unplug_handle(dp);
 	}
 
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index eae82e857c84..15405080107f 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -15,6 +15,8 @@
 #define to_dp_mst_connector(x) \
 		container_of((x), struct msm_dp_mst_connector, connector)
 
+#define MSM_DP_MST_HPD_IRQ_MAX_TRIES 30
+
 struct msm_dp_mst_connector {
 	struct drm_connector connector;
 	struct drm_dp_mst_port *mst_port;
@@ -36,6 +38,8 @@ struct msm_dp_mst {
 	u32 max_streams;
 	/* Serializes concurrent stream link-state access across streams. */
 	struct mutex mst_lock;
+	/* Serializes HPD IRQ handling between IRQ handler and poll_hpd_irq. */
+	struct mutex hpd_irq_lock;
 };
 
 static void dp_mst_connector_destroy(struct drm_connector *connector)
@@ -358,6 +362,40 @@ int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 	return 0;
 }
 
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
+{
+	int rc;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	unsigned int esi_res = DP_SINK_COUNT_ESI + 1;
+	int i;
+
+	guard(mutex)(&mst->hpd_irq_lock);
+
+	for (i = 0; i < MSM_DP_MST_HPD_IRQ_MAX_TRIES; i++) {
+		u8 ack[8] = {};
+		u8 esi[4];
+		bool handled;
+
+		rc = drm_dp_dpcd_read_data(mst->dp_aux, DP_SINK_COUNT_ESI, esi, 4);
+		if (rc < 0) {
+			DRM_ERROR("DPCD sink status read failed, rlen=%d\n", rc);
+			return;
+		}
+
+		rc = drm_dp_mst_hpd_irq_handle_event(&mst->mst_mgr, esi, ack, &handled);
+		if (!handled)
+			break;
+
+		rc = drm_dp_dpcd_write_byte(mst->dp_aux, esi_res, ack[1]);
+		if (rc < 0) {
+			DRM_ERROR("DPCD esi_res failed. rc=%d\n", rc);
+			return;
+		}
+
+		drm_dp_mst_hpd_irq_send_new_request(&mst->mst_mgr);
+	}
+}
+
 static struct drm_encoder *
 msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_commit *state)
 {
@@ -473,8 +511,16 @@ msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 	return NULL;
 }
 
+static void msm_dp_mst_poll_hpd_irq(struct drm_dp_mst_topology_mgr *mgr)
+{
+	struct msm_dp_mst *mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
+
+	msm_dp_mst_display_hpd_irq(mst->msm_dp);
+}
+
 static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
 	.add_connector = msm_dp_mst_add_connector,
+	.poll_hpd_irq  = msm_dp_mst_poll_hpd_irq,
 };
 
 int msm_dp_mst_mgr_init(struct msm_dp *dp_display, struct msm_dp_link *link,
@@ -506,6 +552,7 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, struct msm_dp_link *link,
 	}
 
 	mutex_init(&mst->mst_lock);
+	mutex_init(&mst->hpd_irq_lock);
 	dp_display->msm_dp_mst = mst;
 	return 0;
 }
@@ -518,6 +565,7 @@ void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display)
 		return;
 
 	drm_dp_mst_topology_mgr_destroy(&mst->mst_mgr);
+	mutex_destroy(&mst->hpd_irq_lock);
 	mutex_destroy(&mst->mst_lock);
 	dp_display->msm_dp_mst = NULL;
 	kfree(mst);
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 822d34cd6ff5..3bd3e66b4eac 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -12,5 +12,6 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, struct msm_dp_link *link,
 void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display);
 int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 			      struct drm_encoder *encoder);
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
 
 #endif /* _DP_MST_DRM_H_ */

-- 
2.43.0

