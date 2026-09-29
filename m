Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8F73EAC68
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656108; cv=none; b=jyiHRZciyRcvWGIwv7BJ2CVz4o5wb1Yr1Q0LucCnlgKW9Oeq9pZcs7QFpEDfM0RvWsM6rNDk0SQfgmTyKab4Qy+uxpCv7o2iOG4Y+yXYOvvfm4lnhd/78qiBXpbBHbT4NdqVjRjrBAs+bo3YeM3qzZxFAFP3P7s68tkY/lZqQyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656108; c=relaxed/simple;
	bh=CLbVVBYelNsj8sdE7+NVQ8dLNUaav0lNbJrTunVQ/Ew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NCLxa0gP/1otauZxgc9oCsKJB9X8DMzFZyOJpKzZjJXkIU4VyZIfpmnq8retGpTjxPW1uG3LrcL6uTsmvATAARcSyYzk1PepYck+26jml6Wte+RRUF4wgxjVQUezwbSHlPSN1ZGk6NBBvNRFOXIaLUrDLRKhBBltCpHw+O+CMBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G1FcWL3L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XAhk8Oky; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G1FcWL3L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XAhk8Oky"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T479id3643011
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oY0q5XC0pkiZTt3/6qdFj9UfGA4NLUgl/6Lw3RihIkc=; b=G1FcWL3LUzMF6QQq
	ShYzlXluMhTr1R6X/1x9xtbsXocuC4HMfp3TMEItPOEDASJoECu5C9hsdq1cuHg2
	OaU2wWss7tXQBk6c74Rm/Y4qy+UMeCBS90dTLoNkGi8/7CTF57DZyI/HIkk5lDyB
	frsZBRQD6JbczioLw6yEf6WxXmMlfVhkDd7D/F0zpwnXw76HQzg4zXTUB2a0YFcl
	TtBd03EQs+As8vbXEn8kCoSLjl+Jhb6EF3mhHzfEdeZh4wGtY+d8RHgItaq5QQga
	TfXFKoD0W5LCmkDtyiARpZxcPesKEnuKNgmf1BoZDvtBtqcZstTo9m3M8h7yZuve
	3UVF0g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4s4ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-914321eb48eso72117856d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656105; x=1791260905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oY0q5XC0pkiZTt3/6qdFj9UfGA4NLUgl/6Lw3RihIkc=;
        b=XAhk8OkyC6sv2icd/WbHVOOFa8lcnWmNmRjOuWkJhfSXZ3DBpx6z8APF1PHB+bch8/
         67l+jdYBLHiI2gY4kjNA85zD5xHcu105PywTo9YN3WVKNwFJsXN0+NUmRrob/jW+yJKo
         3rRfqwUUg5OlSPKdAq06AKBRp3NTLThK6FMjLE0itfvSdy1i+1lbY8EpfqWw5sftTVKe
         a7cMJKYpZomB7WtucgJFtSofLCqFWuclnEIRd1EGm6wjumssdjycE75Z0MAwQEoPSIzB
         9lgcdk7JCQv6GVfYwIq1PIxnJAjHGhMTlyk8JZCvMiF4weUPgAEVTCJg6xErg35BdpA2
         Rh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656105; x=1791260905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oY0q5XC0pkiZTt3/6qdFj9UfGA4NLUgl/6Lw3RihIkc=;
        b=O6GKkrLfJUb0MlhDrJBi2AW8i3LlGecabWPt75wFFN+uR3wQQyg3n7UqqWMPH/UQ5l
         laTtE3T53Pnm/ORvfGA+KQEFNyp8AAAZ5lBc1T/HNQ2gWSULf9FfP0jBaDAXLGwxTSw1
         wNAMw/K6I/ejpzGo+wGpBx8dHQ42qwf2L9Yw7Z46OetEigVuST84vC/JYTGgniJ+jhw4
         yjs+rqYno6lYLXtI1gOKkX4l0JEJQCXXSrfYty1w82JMhbcShqWqi/Gfx/atR3m2l2fG
         cY+VcF75Swg6/ndgWm7rXKCs5Cm9IfSlnDTABOIuwhWjDs76Fc6I6fBmcykuMqiaXMJR
         JCCg==
X-Forwarded-Encrypted: i=1; AKwUvByj/avtkNG+Jrd2TPPnq/iXYaAZOePVDQg5+qFxQQ3SPZ7yitG8Ja3mHa1MMdSwJ5lqKyug9xmlHAgfCsE=@vger.kernel.org
X-Gm-Message-State: AFuF++kVit+WNiFLjpcKoySj6/g5/7jVayRSOgCXL3O19d4z4oxx4k3E
	hDpHjAtYSbIIKXd2LdVSRBXGFD2TdNOLMl03am3RSurt8j7fWLZXROWfl1CcP8T+u2C6yllwr7q
	nfA4JBlSs37rn3fGYr+HDgAgxjRxUeIBdY8dfAhs5BcowAdGBDjRd3ES+ICn08dYUAkw=
X-Gm-Gg: AYBFou1o6hCk2qIsApdX0Njc7d6Pnt9m4dA2EXDy1xQAm4Lr/euEoGdiv4Urc1M4gdH
	op+soUJqScn0+GlWXikwHsG/ePytQuz6Kg7xjjrEHvJRQQYk5306gwrysXOGl3DZqkJsD6Td1bm
	k6iUKMSBB9zv/GlT2wW5wD9Sj7daHwSzMFeHLTGKgHYBJ1VQWAMi24v9bt2B+c95oCtWGnnUJvL
	gd7cc+Qv3FxTcjbxBnwlpJIkzJh1KhSNHEgns9pbPfa4njxyJGlNlkp5Pviddgou4TkaJxYVfVU
	bRco8u1kg8toO9DDocj79DupTjc1IwUv8G7IIPaARtYevoEbjk/6IxiGXLKbvYimJPIIBniFEoj
	gY8wGq1LoBC4Bd5GZpsq3ciDB+pL3dp2YsmNFc1nxJBQPD+maXLM0MW60BFlDj1U=
X-Received: by 2002:a05:6214:5345:b0:912:517b:8f9 with SMTP id 6a1803df08f44-9142f961a9emr247433546d6.43.1790656105444;
        Mon, 28 Sep 2026 21:28:25 -0700 (PDT)
X-Received: by 2002:a05:6214:5345:b0:912:517b:8f9 with SMTP id 6a1803df08f44-9142f961a9emr247433326d6.43.1790656104895;
        Mon, 28 Sep 2026 21:28:24 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:24 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:49 +0800
Subject: [PATCH v7 25/35] drm/bridge_connector: suppress hotplug for
 IRQ_HPD without status changes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-25-4b81473185e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=2991;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=CLbVVBYelNsj8sdE7+NVQ8dLNUaav0lNbJrTunVQ/Ew=;
 b=A0b+oBrA0/U/ti9lb6u9TS+Eh3+rRxrFXVCwDgyk2OouZVBR6YzUksss304F1pK4XUt0HPdnK
 Ik6bnZJZ/IuAYsRyEu3im0021tTAqeR4Um/eGzupa5Slnufy2rvYzZe
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX8DhF/EXxBdZj
 Pc6mY7uRtyLe5v70xH3Ef1ucJxdHcNDoPNU3Gq8S5IzMWvanduayj78WfLI32EAZIEJO7b5Ces4
 LrezBi/DGuoGDDECcThpHpy+Cn8hr9o=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb3e6a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XU51oE-CMt0mn-qX91oA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX+eFn1CY+knc4
 mGLsp5GRLaX7bdMTDRVTbBMXqZ2bkZE3HqQhA3H+9L0ZFv6dRf2a2OHEZS502n6BrSUAiMm0Lcl
 DFwh7X1YqCRg5bv1k1nDY7yqAKexAjhuIhch/57e7NL661UXCXZvPzXgCidKJrbIXGq5gPCmMSc
 ieDvM4UE4fYqwqAEWNdKRG/LJLAbL7xwf7EJZvNDhqm2FK9r3xJbgP15lTJw77cuzzc54eCS+VT
 D5YljCMD/4zSX9Vm2K0/c1/3oOnGuKO9/A/R5/U2wFRHmGjzbVwVYTXJ1RzZ7OFYHC5zLSUpN87
 d5SPxBM5vPT40/yS7mgPsqVHe6FsU8bc4z+hBjuzpnSk20CNYTpLWvup5kn1T8MNw2NfGh4lL8K
 Td1RmDfRHLDgoTHKuOlJiIxhC7CWmeCF5lYPZcrf4+DBymnsBtIluXWdbZO5+wcH72sryjs7EIG
 C98+KmSqFu0AqpcEREw==
X-Proofpoint-GUID: 4hFpr96d9wvEGba_0-rcPpbjxZvY9iJB
X-Proofpoint-ORIG-GUID: 4hFpr96d9wvEGba_0-rcPpbjxZvY9iJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

DP IRQ_HPD does not necessarily indicate a display connection change.
It can also signal link status changes or pending MST messages, which
need bridge-side handling but do not necessarily require userspace to
reprobe the connector.

Currently, the HPD handler sends a hotplug event for every notification,
without distinguishing ordinary HPD from IRQ_HPD. This causes IRQ_HPD
notifications with no connection change to trigger unnecessary connector
reprobes.

However, filtering out all IRQ_HPD notifications would also discard
hotplug events for downstream display connection changes on a DP branch,
where upstream HPD can remain asserted. The decision therefore needs to
use the actual connector status after handling the notification, rather
than the raw HPD status reported by the event.

Pass the event to the bridge chain first, then call the bridge .detect()
callback to update connector->status. Fall back to the reported status
when no .detect() callback is available. For IRQ_HPD, send a hotplug event
only when the connector status changes, suppressing IRQ-only notifications
while preserving notifications for downstream connection changes.

Keep hotplug events unconditional for ordinary HPD notifications. An
earlier detect may already have updated the connection status before
subsequent plug handling reads the EDID, so a reprobe is still needed.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 083d70017f02..d27ce59ca32b 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -159,15 +159,28 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 					    enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
+	struct drm_bridge *detect = drm_bridge_connector->bridge_detect;
 	struct drm_device *dev = connector->dev;
+	enum drm_connector_status old_status, new_status;
+	bool level_hpd;
+	bool changed;
+
+	level_hpd = event == DRM_CONNECTOR_NO_EXTRA_STATUS;
 
 	mutex_lock(&dev->mode_config.mutex);
-	connector->status = status;
+	old_status = connector->status;
 	mutex_unlock(&dev->mode_config.mutex);
 
 	drm_bridge_connector_hpd_notify(connector, status, event);
 
-	drm_kms_helper_connector_hotplug_event(connector);
+	mutex_lock(&dev->mode_config.mutex);
+	new_status = detect ? detect->funcs->detect(detect, connector) : status;
+	connector->status = new_status;
+	changed = new_status != old_status;
+	mutex_unlock(&dev->mode_config.mutex);
+
+	if (changed || level_hpd)
+		drm_kms_helper_connector_hotplug_event(connector);
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,

-- 
2.43.0

