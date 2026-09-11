Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406A3436BC0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122601; cv=none; b=QofDK5EbiU2EXYjb/iwiWmXlWYAl9dsFkxp/X6ASkSJInUPM1yVbtRYIbo7t/g1LVF2cqJyQlFvvdrvliGYsEmeF8ufGjJtHULqHtmFEhkOc9nJnZx6wvcBaUZLmHlJrpXs4htk7pzkZQlZ2zHHiZekc+d1Z8m6WNPKokdBGbac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122601; c=relaxed/simple;
	bh=DVXNSz/QqITCQAR3c9vgiIReGo6sp1REqUL1NIZWtK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tXFTL94+lUXQhnVFBbcqUs5T5AUKVpZqROyHRo993cw6AgY91QWuIBW6imCQ5KzaFKTExfsDDxmDokRQhu/G1ml35XH3luSrT1KDWHKftFTG58NvlVZ4Pyz0LpDuZECd61Ju9TB7ncIDjTEDLDvLEIw4YmMN83Syz8sd6i1YvE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pHksfQeY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G0yMTHjS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pHksfQeY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G0yMTHjS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kpjh2311499
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E0C2reVv1oSwnphcZX04pJknqbbG7msmctVikhe2z4c=; b=pHksfQeYf+c/aAK0
	N6tQXPebPfDYihRs0gnVQe/eqzFFTjAB8xAzmnM1YHLbYxJw+DxXVzC/80mhbH4I
	BXRnlakj1LB8IQrGWdsCpYEbKmOZB9yTLuLn0YbRvPECzZzQLMiFrU3Yp3NkeOb1
	pBMdk7NEnG1IALukD/ZEoPag1T3r8Rv+i8XojZORFUdEVwPEIKIadbwHIG94rZ23
	SuD5VwUoZ4WfKYKdqq2LOZfZLYlri6UlTBoEuVBk99+oZQIKtT1HoG236X9xqJ47
	a50oV1cqqUjLzIDsk58okArCct/ViYflsBt7jlCb4ffDZ7DNeOSnTG7jTzdUSyyP
	mtmCcg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uchyj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:29:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903622880so384651385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789122598; x=1789727398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0C2reVv1oSwnphcZX04pJknqbbG7msmctVikhe2z4c=;
        b=G0yMTHjSJMVP764Y8/V80FXYuN+PlpIQ+3rhkO1oWMH1SfEo1hnPrv8lhaF82pdcTe
         2xW66Yqo8yFXObMUwt7sDPEbQ8dZ4u2KHMnwz2gCiM78IFzosfJytKnFKLoQ38g2FB3x
         /rSw9VbJit+wOaeOHLyb2LdFM9u21dmiQ85TvjQVYhJ+tOP8HJ25NE4bItftk2qGejhg
         Oiqyg6JHtyoBoByMWQo4jvtsxnElOMpomRCcWYyqdoCbx7ZiSBXYETzJohoe76po9UCk
         JiYbzJ8jYRgKKYVmMq1hUPRhfaOkQrX99atESFmz+mYXoN45fmBPb2sREbLTrew9AoJV
         nosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122598; x=1789727398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0C2reVv1oSwnphcZX04pJknqbbG7msmctVikhe2z4c=;
        b=sMmjtiS9byjJGbiyDBzNX3Y8jJYiWAM8o/ii3jer61lTUMLQsGWopPlNnJ+F4Jbsmq
         0SHkiEgs3oETJnJTuXXK4ZTxQPDxQ9kKn4bmgYrbBr0qiq7FGJ8Y26WJeIQcRqjoi4WK
         qYOVHFmM247n9ODiCEK04DFtykDulM30DTk5Y1bEMZYVayNUlo5+cEzTOJWniYGzfgsK
         p+kJdSjSpxfHra7yqPT+o1oeSH1aU9Pq6O1+CeAlHcYpBF3HpqFcTcA1pxKnfqCdXW8I
         Z0orBoeGxZSMCPYiJPLnERw0Fh3NVuvlahfyKCTC1DXwlS+OYYm0fgEgfvxGCLVJMO9+
         XRLA==
X-Forwarded-Encrypted: i=1; AKwUvBwxwfhCjCWQc13bC9MWyobW6lebtGZmj4OQ2Y3kN3QBtEJab9gXDsiPde5pre2+pM7m6RdpbY4Qmm53oOc=@vger.kernel.org
X-Gm-Message-State: AFuF++nmhbEyKCCqqBlQx8kV9p5p2TH95w+SYj9oeIOKrye6G4w9MpFz
	erfb4KYQClGhTh7GzF8+SqBCX0MB2vFGQcZ1f8X2xcbaedS/8C8Gg6oevuo3S2T6qHoPIdvdHYH
	XegQ+wCq3QxsXday3C1lqCBWkmTyBl+XXFqVUVKM2p/26jfsnsryz5nsYOQ/xp56763g=
X-Gm-Gg: AYBFou0n5FwZlYC1aMAU2k8YcfSu7ckLgEU7AfOAvUL6sgkGKhjiB3RALtrEA+rql/0
	U8njfSL+SRcaW9lhxd0lpJB6E+tvkkwy+OR61vTF45Jc10ANWGYLX8N2fSlJmh3Wsj4bygFvpuZ
	aIjRVq4f9HgOodVMdgG//ff4D63d3lXBEPv61HNAdm7s31wV7i0PpWOmr7z2nD84/vRxxvtwdIe
	uWpEQTJpabMsEYi2ZmYtj4R2wSXVGqFJVwV+I4rqBOvx+a1n9CT/+seWT3LwMEEJj4g1O8a2D25
	psGkXv0MXLJ5+CuUI8tQc7qCS1ff0epPX33nz+vIPHsoGCucKan7fUmVTX8f9Vs4dYh0P7vUi/R
	7K1OH1ZDhTq0X0YTNNifMWHU=
X-Received: by 2002:a05:620a:450c:b0:937:6f98:c68f with SMTP id af79cd13be357-939d7e3ff2dmr1128907285a.1.1789122598386;
        Fri, 11 Sep 2026 03:29:58 -0700 (PDT)
X-Received: by 2002:a05:620a:450c:b0:937:6f98:c68f with SMTP id af79cd13be357-939d7e3ff2dmr1128904385a.1.1789122597996;
        Fri, 11 Sep 2026 03:29:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm38651965e9.1.2026.09.11.03.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:29:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:29:37 +0200
Subject: [PATCH v4 4/7] drm/msm/hdmi_bridge: Drop redundant initialization
 in msm_hdmi_bridge_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-4-87bdb9f1987f@oss.qualcomm.com>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
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
 bh=DVXNSz/QqITCQAR3c9vgiIReGo6sp1REqUL1NIZWtK4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9gTV0/YW3nDgV588FrAxTLe9cG52WMzAMMYr
 NKI84Lz0GmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPYEwAKCRDBN2bmhouD
 12GBD/9RqSUlV9uXlVhuHr2uUrrhS6rxshyiGQqKwcZ7ksHEN5NVwnshts1XzecGukzkys9Jjl9
 GoTlteAOfZpaYwvtJ9iN+XLFs54jScHcP/7eqO4R6Z/cKzQjeB2HGzaf1UTUiHRqBBVDQMhUo+A
 RBtZcL+7XmiQVESJ9ZpMmyo+0xejSPquCYO45iV3Np48YlEA1Dl35EjkLhuPo5XU4O7/WrP8tH7
 lts6l04ekv7YMO97ElLTS93qNnMuZ/MuR99FosbezHM59KO33o4XtwVqJGDQsxEiMY3ASamii9q
 5Ljuho09Vs3yTJCvKgNDmFWKxcj3TyshRUfuy00mRPnF1AnpoTPNPjDxU1o0AoX/sCXovf1rc1+
 pkrsI/9joUx0hs/2AX/9HEkoTJOZCxeOstg8vPkIBLY/OQl4HY+6coP9jkOwP5Hkiwy6U5ad/lT
 CFzm6wyEkaEixq/tq8YJGrkPA2oRPWqzD0vJUtxIyNmwXX+gvd5fbSSNhFaET6RdNjci4/8REGc
 zXAtOBPUBFKr2QR3L9hJ4QTKTRmjjBguyU53XS9CEOscIWKaqPXi23wilUDtmts2WJ7fSEnbSGr
 X4K4Ic9vaJpmQZom4HKVt4NSBE4JA++KrmJ3vmJ6nSWR6NG/Vybn8Kuaoo+0nVncsVlj6eKN8iL
 zd/lzs+F9i6/8aA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3d827 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RZP3y24nY_lDZDhlvS4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX2oBv3Rx0On0F
 tL/bTSlq2XFrLkqsMV1IWNoPmbMxRipWxLgBmvKj45rNw4VP4f9rCmbWwzjCXQaExiPEfQQMzph
 93KTS8v0oR+FMdPc3feOlf5NhNPi+lgQFwTCjG/vOgraJx/jPYJL32BiKqchiVrIc7XZIjiD2SG
 txET9nHGO1b0LHzL+bR1IJsn/VSrayggD9TSEVj3LBCRoGM9wRav/7rK795TIp9p9+RawC43NAW
 ZGsnSCGhYCx/h7UrJrz1545lPxMP5WAXJ9XjKLesuQ5Lqc0pHkfKSfyhmCgNFm5vuTfC4lQiHH+
 1gk9GGGGLutnTw4ZvEcShLx4BiRwDs9KCbJ8dLvlcSyvErkdj2KJ+NUQYuamDnNW4wvHB8TVyvn
 ZUz3yx7jTGRU7Gg4ixDDRR17js2x0kxKDkVuSY3QwIwNkJpZax/LFN+GJAIFKIIsHKaC1AlkNhZ
 GVy3hFxck8xe/1mak3A==
X-Proofpoint-GUID: aIjAhPqTigGSKucFl_hL8AO_6ZHo-HC3
X-Proofpoint-ORIG-GUID: aIjAhPqTigGSKucFl_hL8AO_6ZHo-HC3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX75NTZzDzigaY
 7RqLzxx7iKW7c0JKRtetUVeyJMgfQCQsrd3JcUbpVEjOh89ZCguvd1nFH04r0CBQIQZklWWMJV+
 p7HK+e7MbmXMEU48eV8w6Q+PpXrtRlA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110146

Local 'struct drm_bridge *bridge' variable is assigned in ~13th line of
the function, before any first use, thus explicit NULL initialization is
not necessary.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 1860605850c9..49587927e8a5 100644
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

