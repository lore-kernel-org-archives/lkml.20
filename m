Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72D74772B7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786059; cv=none; b=fOponQP7ute3K2aSm4j5kqa3KAfxR4F9C0GYGs/KAvqsyxFtj1xtQo+9FwLJtOBxzK90uBGugaE2rA5u39eHDFohoFp/R9ifuWq1k5dmuSPhC6pffMwJYrgum5zZTIbcmiemU1wQ6jVV1bAC3EydRQIfZ/CAKZziHGb++PoYEZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786059; c=relaxed/simple;
	bh=lpPbeM6c8VvIV5J0fpRx6DMejGRPAycCbF+JSHgz2Hw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fLB6rysxQ/lowsAqOBeKoE++jk8UgyJov03MG7vDTwijH+FavOnVDOgcYdSR59gaF72NMiue0KaOnXEjfFpmnIGRbcGQVtvGfDAqsQxs4IbuZuHgeI7y66nC5fHxbRc22ULJhqdnHn8D3POkFYgzVLh5ESMYHHPaerXRNTJTKBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XUZdxr7m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGr77XLW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XUZdxr7m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGr77XLW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AvJWs496162
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 13:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOCrMECTJmCrKwJs/AjWGhAhZLHRv6vQjyZ6M+guQ54=; b=XUZdxr7mZFNkNTFP
	sTtyHTKLw8amstQ/qeGkdGX4+b77Tm9hJ3Sz5K83eyFhOUkL8OfloU1cbZ7I1JXl
	9Y+gvlE3GnVNxTD0fWEzKNKFgnQMRvHAGDD2MLj9gqwjc8g+/DLAYcujXeJECs/I
	gGX+sDe0+ZzOk4F5Ke2khBAHhuwjmntx6quy2SgdPrTR0MoSTA8AyXUImFuiHRDZ
	F6aeobqnC7r9n57K56IluFmUbL82yHF/xdgpiZoITwtwLcIFCsrOhdDjy5thQNjM
	P9N7oHaDMO96AvT1haLipN67lUtSf43qiy7pWMmGYu0v2v/jSjQGwO0bWNjvNovG
	U4oARQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk8d6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:00:42 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7866c4ed349so3086361137.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786041; x=1789390841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOCrMECTJmCrKwJs/AjWGhAhZLHRv6vQjyZ6M+guQ54=;
        b=cGr77XLW812185t5R5ZHKyS10PYYecps7qi33ArZsKlxeZNu9upKkW/KSQQeqZN3j+
         0Znym+ygYDEgNCisfXPfENuY0LDkDdjWfx3iZ4ZU8YjaqZIpgwzSuq9QWNUVc5XJQRtt
         arGnliBpqc4lhUUbG/Lg1AnAd4zyK/8Jz9ukPwqGZRnrXTuyaS4ExFf/XjkmP/+RGFNl
         jzPxIFnMzocD2q+0rKWwKkwljXB+6OuVAg6XPKwPC4X7z15h6ct6NZi2pCPKs+PqpDtb
         ij1nJGJyHGRxG/Y47lpQf4o88ohbEmaaudGQU5SR59lCYUMtSUHW05GpjxWekJqlF/9B
         +tjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786041; x=1789390841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOCrMECTJmCrKwJs/AjWGhAhZLHRv6vQjyZ6M+guQ54=;
        b=Ze1zFrFWgYZ8hOJr/2QUDVuvqvMTqJwBbLJbUAJNi6Ys8+fOZj3naQWLRua2PPWq/z
         jmwOjZb/319c9f3xn8SDD2fFQTJa48IvLKE6hgWqUhWXAV3psD/QWEk7mtpH7iYUj4iv
         Qte8NhOiMUVUBX8t7TGb6WFjAuagOazf9HJQmPvAsVMOOWpmz5tVHgVROvL+40Zq2CFf
         vfyxrybW/qUidudQ1raa8E1pFM09YNmo3XPcLUFj3VYN6fAvmM9ELFDYnixjLY4Dc8lw
         rQFfwki5m7x9hLKkgxDTAVqJeMnjN6dovWIXiA5tEeOX3ZXFGGESBTajwp4D4OZJ9khJ
         LV0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwAKfGsdsEGF2G2kyTN8Lq4ZTar39WapISO++1puD/02HV4Xz6ftwwNxfrdHztoLfQllpLHIaNOAvXDV1A=@vger.kernel.org
X-Gm-Message-State: AFuF++k/UcJPGhD/HK0glhqjOAkKzyW9pe+2sORX4wdX0/DuCYnVAjhP
	ksWGhry3QuPMYTi8VZxlf5VMmgmGCiUlxfgeqYIHG1/uaoN52E2M2YPRII6q8bCBZe10imJns1j
	k1fqZGjMmp2jgNvSXdBo+qmcGy/cM5vB49tpQgGFPwu9EjxuwLCiOGvN7EWGCJBXSRvo=
X-Gm-Gg: AYBFou2hJBj1w24N3sel04nzhC/Wfabh9yUwN5NwXITFw/ajmyuoDHcGrq1rGPhwWCF
	H4CqGyPrFBLXkwj2zn1xBv1M6BXAN/yaPjMqwWaXxENW/CsctecRMMBIOO941yeFlhks/vsadr8
	X9o6syYUgEvMmReYygj6j8Ll8f84Tnr96E/NrUlasBgvuY781K8Q/pYqNoxX+NH2JqmWBJg/Vbf
	Gfb2UDwAnk7ryGROAidTM5kHo91+6y9+mkie5Bo6VZ5f+4roTsyH4LX9ZhrGuUIuE2zFQL333Yd
	70KKRb7RONcLLdH8Ur9DvMQymFlv9K7MBBAy64N+zb53j7mMUSuj6EvgJlxMyM4Mc6QpdTBlRjQ
	lRvUHTxLBPnyIAXYH6AlZTZo=
X-Received: by 2002:a05:6102:1481:b0:784:b9ec:9144 with SMTP id ada2fe7eead31-78a4a9c3a45mr9664127137.8.1788786041501;
        Mon, 07 Sep 2026 06:00:41 -0700 (PDT)
X-Received: by 2002:a05:6102:1481:b0:784:b9ec:9144 with SMTP id ada2fe7eead31-78a4a9c3a45mr9664094137.8.1788786041073;
        Mon, 07 Sep 2026 06:00:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff81c9b5sm198751205e9.4.2026.09.07.06.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:00:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:00:18 +0200
Subject: [PATCH v2 4/7] drm/msm/hdmi_bridge: Drop redundant initialization
 in msm_hdmi_bridge_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-4-b097cf1eac77@oss.qualcomm.com>
References: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
In-Reply-To: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=909;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lpPbeM6c8VvIV5J0fpRx6DMejGRPAycCbF+JSHgz2Hw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqnrVmM7LwsR9IfN8orQYy9CM5ColVQFdi2Uxw+
 R1SoJgAFDmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap61ZgAKCRDBN2bmhouD
 12GkD/42dhUM3tdTjVHlHyOQ7i4kV0Aan+nz0E+fR4TctoYft9l66IJD9FM+HWeUC89stXt/EIK
 6LpHTvJ+b36jnJGjNf8EHYsqmo1HoKt+khdlrHPyM5lEAzyPD7RynzOdKZsdz1zictBsgCJfjPD
 L+Wf3hSqhX1Fsr9opjEdDkhKyULS/OSKaQ+J55baoZQfoFKXXh2BAkhex+dABVJ7MSx2z+f5OTF
 0IElxMpwoqE1m+LkD54pBbkVnOHlqQrWWNKwDJl411Yq1oyGANl90ZabtI5OxaJcad6hh8u7EDm
 2vCklTdYoFl1zNsYVmBi5r9iLwcN4RRp0ueNuJ/km/BzJbR6Ad1hVMB4NxT3pfUOwBkLsUZRxiC
 ZbAdbqDZ0dpdKB78kUqhSG+xPxtACQxTSr4+oH1vrytIxyKdagXWHziIVUKYpklGFogWF39J048
 AnDV4+gqGjNWa7QHbaYrbNqdQnMghBzumeYKOrZpXQXIVz94wNn48563ddTHz3Pc+eaLRL4TBUn
 4DuWY7tOrno5IQdppx4UWBjkHsVObLKxPcLdnf78QMi3eKvVRjF7kf6ZaPfnbp2AtuxVTeDkBCq
 JGB2CVKzS4Hbk/vDl7kzLY23iJrEEbMpwvegL8yuBMOhXKa9U58zta4Ox0HVw5jv53/epe5b9LF
 qlKdMnieE0dCW3A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfXzwvV+nizETwx
 z/Ioe56NIQWz6PC3YOmHWkqiKRAKMfFnL2fBl4qErTO7iMn1T7uHJSrluPvSyVk+lHjGtWOe4Yx
 KG7Io+jEx1wnhejc3TxZ2y6vauyJTBI=
X-Proofpoint-GUID: OZk2vRZag3IEH1K5vZEoVDVZYW-CNgSa
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9eb57a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RZP3y24nY_lDZDhlvS4A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: OZk2vRZag3IEH1K5vZEoVDVZYW-CNgSa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX/0WmPzWz4jZF
 In8DhUSejotUR68FUg5EOhjMpLjm10U6WZD85lK03OeFTMQMQItw4VZ3OL7TAsEAuCNp4/teaRg
 R1+oZXBJ2XWN1QrRE1aVV1CnQS0KDass8MV7gTJ2Jw/YfltV7EiNbba9sK8CiGKriSsqJo/PrXm
 G6agimbLHJV2g+0XhOWDfKbeSdSxJGepxIfTM8ca4jVv0uj8mhgehKpC4oPaEJwOO4tzjcc1ske
 HV5eYkM/oy+BHNZotwTtONgJroVxgKvfI4z5aiw2G5IDmJ/OEsYxw0qSHczR8/wdBCn15iI2ueR
 svKZWVyA/SKykBOdNRa1SD51NP92hmcKX+hVNF6miEUdPUbvy2lLkt9aMNWP8/6O+ambJgjy0qs
 7qECLVNN1Tb41lH23ycYWx2Dd5tMpDj3quGCP5jDhkZVaVl6sLIkrR77OD9d1wz22wJmwGIwm7I
 4bY5npBbeS1o0zuCGBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070143

Local 'struct drm_bridge *bridge' variable is assigned in ~13th line of
the function, before any first use, thus explicit NULL initialization is
not necessary.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 04c893062dbd..5400edd7507a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -484,7 +484,7 @@ msm_hdmi_hotplug_work(struct work_struct *work)
 /* initialize bridge */
 int msm_hdmi_bridge_init(struct hdmi *hdmi)
 {
-	struct drm_bridge *bridge = NULL;
+	struct drm_bridge *bridge;
 	struct hdmi_bridge *hdmi_bridge;
 	int ret;
 

-- 
2.53.0

