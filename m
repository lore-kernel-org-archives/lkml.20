Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E663AAF71
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851477; cv=none; b=lMKwJQmxWPpN21juxKfELEY76/tQEYxc3KD9LHeM95oQQnPZpsekHDNAXpr5slHwJCN7ozR8a4bLfDGePLJGzvDMkxcHt2L6K/om3UIIkycc4r6qhbHRItuUDbchKPkesCkltKSLI4fyvocBH4MlROlDvISWzxUl3nvMN78Y62o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851477; c=relaxed/simple;
	bh=dxt0nRLMlCSOHXCt5GgWA+SbZAKlsIeSxAesz/KABiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ewPDjkFsd3CGxIhwp62vLTapjkT0Io7FGWGpO2FsZ36Czr9T8txAF+87jjqp+PeA8A4OYIddnIS5Y8aO7qIAGAga8lYQQwKztQdIjf9JEpILCwbbHeJ9XG7Kea9txA7H0Z656QF5OcJ5Bq6ExyurtGAiuiMmkbpQd6A0umyBsFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GtPmM1f3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CF2YLa+e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GtPmM1f3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CF2YLa+e"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M0IA2979113
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 07:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Zxd143ASUomJNNgHPeOAeQIGghuC3wI/sji5Dtl2sM=; b=GtPmM1f3isY+uh8N
	pdBqgLuXJb7JBeJA2dPIzkM5geLG5/9uRvpMY4lKxfNVf3A023aLEFZBiajDFqLl
	6tiNTA9BqFC7NIKScvsugAmQKsTjBZ972F96fbAR3n5BTtwAHcSHmxIdkK8EFJ7u
	LqNRRc+luSSfnFXauixOh0q8LJu4IWf13TwYiicrPlM9tmc7BjV332qE5DM8UHXk
	4VFPDOMgCvr4NU0DP5A899uOKOjxij1QyoUaE1K8DGhcP87PjMoyUk9s9VHrjP1R
	vxF1ycJBzQ4KE/SsQGxGVPNz6MO6MSP6ppYTFHOjfixcXaIjTp30kla+yfL1oHR7
	6Egv9A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuykbkbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:11:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90cddf4f59eso72943766d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851473; x=1789456273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Zxd143ASUomJNNgHPeOAeQIGghuC3wI/sji5Dtl2sM=;
        b=CF2YLa+euET/dcVYtIRJgEN07kgQUnxBjpMiYhy7phpgJaM5Ur4BZ0C6lOAG5HF3ME
         GHLz6ygxVAkbjD17WbqsUF9JIR9razmm4TDGMa32wf4yDOxMiR6j6b/1R86FdTSFMYxm
         ZeI6C19h4pSGWdR4azOPEm8ihffB5sxFiT+1Niiiar2PvXWM5jY+F/J5MWR3bnacygy0
         Om2o5Lxy+zEq2W6zSZyRehKnTSGaxTa3V1WCnotJl233fJAMSblRHY8KIkfolTmHHx9T
         /OHTfbEvSZQmUPIa27bF6G+mpc5rMKSdwVsqaLM/bd5mx5AY2b6Ipmhu0FlXUStDuW7s
         pnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851473; x=1789456273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Zxd143ASUomJNNgHPeOAeQIGghuC3wI/sji5Dtl2sM=;
        b=UCJtxAmwY9QkvQZO2izna26wX1a/3g+8rmc8fOdUios+ITcuVIW0JMKbgqhBeBctcS
         z6HDJDvfyXBMwLdUONyGuFtPw3Rr9jWygJ7XjyKA4xuSA6E+t1smWR6PzNxODy8lx1v/
         Mimk1QTwav4JWOz5jg42nR5AFLLjTrw8/uBJXJC38o54ndIjtUyUD0rXekXyVX9Iri6B
         1UR7OLvgse8Ygxcqh8I5d6uzXaP078BQzDwD7U7iN4WG0XAiNtMb7KUyST7+eOAbHO7D
         D4IfT9faQKRq1wiq5iB1GOPXfFxTKT95OVhF2RhNNzFisjqFgAwdKb2pJohXYUJcp9lE
         ZEPw==
X-Forwarded-Encrypted: i=1; AKwUvBwc6O30LLcVa0w45VWd7k93aVGcOccPBiRLyQfbN1X/LecQAGg9pjeJBJkL7ka28DHV2TqXNbX4zyE+z+c=@vger.kernel.org
X-Gm-Message-State: AFuF++mzoBfLrc27PtpAYXTJm3p8Ela6kJzdGZKe6+TWGOXRB5HKBtJc
	wKx4zaAr5Zz8deSRqEz3n9qPVw6I6xevnqRL//LWDkecd7MbbZJIiZ66qY4DB61jEZNYhdKq+R/
	EAUqG+lHWnMzufk7JlRkKy0AXvzlYHAKuT9AB3MNSVyofNA+Q8hJkmsitPFo89kD4KwQ=
X-Gm-Gg: AYBFou254k0C1IIs1P08pa7/U3uhCrGizwBvO6YRH9X5XEZq0urpjP8ZeG1kpcA0m+H
	UmGoDkNQVrx+YLdzfumw4uDf9A07tHHQwOTbEhPrd9sOLx1KgaBESPUAU610M44Sfvlt5R+vkjm
	+ksijA7XFaujomSbC95N323VbD6/O7kp6szvq/BXoMa2GbqnzXSfFtCET0Aqa+NvZht2tOsQJsb
	dX3hXDRU/CNcMpA9u5FxIVjh5bPbdQPkD/eyWFt1DjadBcYndj2e5B5mUMVZ9qug6hmnUSqMWC0
	PyfPg3yZr9Os60P3evmv9ECeZEeFl0AGZhibZUmnM2pQ9sX3/moGea+gz2UtsiA3PIN41c9u+wo
	oCEkwj9QcBF4eoPSCuEDeqbo=
X-Received: by 2002:a05:620a:4386:b0:939:ab43:77a1 with SMTP id af79cd13be357-939ab437868mr1036813485a.6.1788851473068;
        Tue, 08 Sep 2026 00:11:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4386:b0:939:ab43:77a1 with SMTP id af79cd13be357-939ab437868mr1036808385a.6.1788851472658;
        Tue, 08 Sep 2026 00:11:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm453173805e9.1.2026.09.08.00.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:11:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 09:10:47 +0200
Subject: [PATCH v3 7/7] dt-bindings: display/msm: hdmi: Correct name of
 disallowed supplies
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-7-dcf8956878ca@oss.qualcomm.com>
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
In-Reply-To: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dxt0nRLMlCSOHXCt5GgWA+SbZAKlsIeSxAesz/KABiI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqn7T9MnI6ATGiwoaT3dl5k4X9A1cAjL6JxfQxT
 tHgqDDpmN+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap+0/QAKCRDBN2bmhouD
 1159D/wJEN5EBolsu3UWPjUjuiwXYqvL7bczKzQULBtpg205n35tDaTi75OTlxy1e9JEgIRrQam
 /+VQ4dojOQuXB7Rm5XKKYkAM96q+S4z7JWRi8GD4roaJbPWlxLAOkFjsLfQR7okQW0L6Jae5b56
 qg5t4gmct2lyrOVYZ4n3m4EGz1vjf+AttIjwKxdaXOFFBVfDsz8X9n/ZwoyhwhhvlfpuRa0yqzZ
 /GQiVg3TlnQIGlHh+MGoN57q6aDjdD2pDf9gtS8uBlSCIJOWsN/REIMM9ydibPl81DivKDnFPkw
 11nuWJDSKkdiJFXMoqKW9IPeDJ9RtCnpJzqkj5Xuq7W/kb+jQXHZDkn+wuK5U35YU59B6TGicQJ
 gOh0HlYFeIww10cex+Ag2zFis1gMzJL+8n4CVL2CbCyn0EAQ/Z/6+876Tbs3p5ZZqeVSztP5Afl
 QbRkVOQdrawJGCrQMi4atnXequexJkSOi8Wl/F6Z1ttC+aQGxJAGz+59+ef81QiH8jrlgZC1ile
 U7g/lj2XMEvhTUtvHDK0aAqIMGBffTNeOiRe84i2z2twEuM+KUBSCMPOEEHJw222BiltuPKGtgT
 RVJlLPUj+P3zm0XsUhuesMJeHN8lesO1hrMGrDWW3GYMWwML2nuqLSVXcM4B4SBtLjFXqkKiWbr
 FzBPqMDD17Y6ZYw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX6Ut+rArcUPxf
 cIKnoWdRIpXpkoERj90fNKBIb4ZytP/8U/aYxzIqmuLiqHwiilqGkDufZDhF4U1hr3fmMhohM8R
 gB2dSgq7pwlaXdQJQEkgRrb03Cf0NzY=
X-Proofpoint-GUID: 0PHbKvoH0RqOuQaK9tZaktKVpfjG30v8
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9fb512 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LSMMCDwwRte7x3nqQVUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 0PHbKvoH0RqOuQaK9tZaktKVpfjG30v8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX512yP/uJETdi
 GpFHI6TdRhS7KZdXfPlmBFI5/UtvEpYLfTOpHOZLFcQlVIJLH8qgCGpHTZ6YvczNN4S2xwXYeQZ
 LBI7fRP3Zs47FYFdSFU75Z6R62ARF3sjbwjdyz+u6Eq1/GKbYJgduGmbr4sH+8oXy7GmMYTqwST
 2GYOu/pexVWiNDIv6iRGBkek7isYEK0wDgttsLHIL2aQ5AcoVUkx6pQeT6zhrc67DAiuW5YKeYy
 H0JV+3/0eMTdG7zijbgubvStClPwYNe5DcRFvXfje4KOaWC4dRFbldS3uZYXn9WgTHPwqeGt/rv
 tP3KJNSUFgSK3vouSvl2eIk2YWjKq+2kkSPynqnKysnJsBRqMFhFSdYn553oL/roitTsuMynH+C
 b6P8SKCLTUoy4AtPUrMVjkvTtGLUlZBjuQjmv/tFUcrfrnWVHnsrxvkRzsCU8jU4cNIT9gQ9Og2
 fmURRmWuinm7aCtoH4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080072

There are no properties in DTS or Linux drivers called
"core-vcc-supplies" or "hdmi-mux-supplies", so the binding probably
wanted "-supply" properties instead.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index dfec6c3480f3..02d27ccad024 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -113,7 +113,7 @@ allOf:
             - const: core
             - const: master_iface
             - const: slave_iface
-        core-vcc-supplies: false
+        core-vcc-supply: false
 
   - if:
       properties:
@@ -136,7 +136,7 @@ allOf:
             - const: core
             - const: alt_iface
             - const: extp
-        hdmi-mux-supplies: false
+        hdmi-mux-supply: false
 
   - if:
       properties:

-- 
2.53.0

