Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662611;
	b=Z+0hWFRbpGEUk2x031OQJRwQUZoZ9xplyuFIvOFkT7Ipz9HiaEPn4P8Aibp62uPjUsbI
	 a57zoHDzMR3obGq7d9k9Pxg1T5DIcN3T40Zf6IEnMR+gfVCxbhniXk59pMoGdqr4mV90J
	 jXuQBBBenvVcVG6bucSZy/2io8rq2XPzullaKw8mNIRXX2uS6dfmjGtEJ29gzxf1uQjkj
	 PHeaHslPx3s2nsLDiA5rzhnjjySowL/R1Y6DWy9kSPDObHOXMqFfpt7Xtt0XnXCthwTWR
	 WXpOQN9T0bIrTZAoah0BmV/s+wq1B70dFazJOalCLhZo2OFhRhBDcj14ncxZ+GK0/Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662611;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dnWRkXpHDUV/iq5zv2EkNTP0NIBqskKv9yRVf0xDCaw=;
	b=i0mw8oeEzyq5AODFaSJrBuP+IICwr7exeDx2ooAkJopQ7WqB4kBxnEOpYLpMV+3qNxWH
	 rhm4Iue8NBimk7QQD2XEH6b2Va0R/kNplB0yvtA6gtrVdFo3HJklI6W89KUM7qSAWhTEU
	 BxpcOLXdtj4hJ8jD87LmnQ3qeQrBqTq8/rrVM0y0QrPH0llnf2QGrl53IgmtK1tIdDUyw
	 G8BhQGvsjjNcl04wCK5O7irp3/XRgIrq9IDdI/YwnHaYL1eKsjw7V4HaOknqL31F7NVDa
	 FJs0J2/XwedWrYUoBOze4sR+ym0vyum1iZ8IQNF+LibVJ5fAs8kHQzM1Zy3+MDs2TSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AbXPla0A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KXt/qt+D";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB604606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB604606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AbXPla0A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KXt/qt+D
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M700x33076286
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dnWRkXpHDUV/iq5zv2EkNTP0NIBqskKv9yRVf0xDCaw=; b=AbXPla0AkEHYbGxb
	OtMj/fQ/ZX2XeVwGNsyn4zdC1u5ODfSLmejfHwDj24HV1jeRxjB49jrugb4ckTCl
	rHRtmK3VYImSrD2oN1zxhiZsd9/s6SCvxvtAUh4NU3jvfc29dm5WOql1NSuVj60Q
	VLGdxU6vMwpifPZPK2HCsoTfbB4Z862NrISLeKW+BPRhN3qPkUcIEqot7KT1QMAD
	GGu3GHT9z0c6+3Hi2jX+Tcj9F0jqeXwGminVTrlH+S6aAutNxeUyXg5HMVh8csTo
	/c48n5M9bA833A/8fieLN3X35L0jJl0Bge/X+xpPaxiGonFUNKjn40SfOqJaQMuI
	NfWIpw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a1s54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:50:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3692c5b061bso962660eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662610; x=1793267410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dnWRkXpHDUV/iq5zv2EkNTP0NIBqskKv9yRVf0xDCaw=;
        b=KXt/qt+DY4mDCY+KZ7KYaXnGAxX1103IjWW2iaUV6/B5mnOS89nxnFpezyO4VxNI7a
         y7RYFfiTJ1y76OwJZ2YOA9gR43Nr6gJBPKlab+DoFQz0uGYSrQ29iTRxwNSZg+9MHble
         LbvQ1D9J71zcyEM7ar7rq6cdtOg5pgGGE+3z9pT4najBHJJdOx7Ecsk6uF06euFgNk6X
         47sKVH19wTnRsiGChxN5xZ5Jv2G8ia18cy9T+8UUVDaIgNPWeXDeQItixrPKE+CRVxvC
         SQc0OOx2eYAMiMNCvIHLeWDrvXmiDCFW1TQRmU31a3Vs3mltuQ+25dgaytGCoK3ung7M
         JR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662610; x=1793267410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dnWRkXpHDUV/iq5zv2EkNTP0NIBqskKv9yRVf0xDCaw=;
        b=tOefc2zNI6rTwBJFtSOXGDwjUuur0VqM33Z/qYqVVLDQ9uYsxBenzf60ZQrc82QSfJ
         JJLXRso3EkVwf/QOlYQZPrCJJuimiBhm1dvu1ZuJT70aul9XMCzSug5ha/Ct5fOKhP7w
         9RaNmC/w8ZqAfBlV6ogiQSihaK6Udh4icnaD6JSyjL8CEEfaLdFWDEVihmBbfc+ozh/C
         AyMiPkzXQ8Kk8aZszHIsfALyAOrFd/ydGl1CWMJNAlS+KDZMp1juJrU6aBfF7eajQqgR
         kx5sfM5aYMVS9B28tsUZGm5YmyitjKwoSPi36mmkfykUfR7z/tYNGkYi2Ft/BNSk3Khz
         VBNg==
X-Forwarded-Encrypted: i=1; AKwUvBxp4Pz38mazy6iEnHqns0hRXZ2v8jKtjI6yBXU+umKn5SHq3MssHRN1kEjIQYopMvKhmkSTF4j1bg8MuP0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwdEgxO7oDG4AiQ/rWbkUjUp1nkBwQTBp99gyUZhtkIgHNgAd2
	/TS7nj2dGnBJSrlfhkb7nR7Ycu2vcCipf6geKuaAnwq7a6IE1lc4J9cO4RUDKFFDvc++dnlDKc2
	EffdqameKtjwHLhM4bAQdmDQ4KowAwFTAN0nzWHukzOOP+hmxMEKsDQIbwYMIziz5a2Q=
X-Gm-Gg: AYBFou35eV7cQ/NT8j4iI+Tkc1ZDq+CacRjIUipqsIPTJ3BYOdOEjWzg0O6KMZaZOn5
	dr0pXbwV7YvQ0Ra8Dj31s64gmtCRGNBRtVYqLBmt0GaKmdL7F25dJIhbUVzwbhTfNbsuMbpmF/f
	0YtZYViDb4I8iezCZbpqjgpYERhP1IvDg7T6r+em9ylpFL3qtXUsT8gVZdyB/QZIi2Y+jCUg4Vq
	VZXMGiVErJpdaI0eF/5XPnLdZDUIx1Bk6gMuw1AntGh5Ql/nII3ZD5mUaTLAH+LesYYAV5Lf05j
	Pj3ujnXFH1t7GFvN/WN9ByN689wxAyqHfvoCcGsD1N1784o2ZIJ813AU8QV6MOVjpddJFerhIL8
	4AsmByaIwg2Wty3xLii2maJs/bqjlRNmEMQE=
X-Received: by 2002:a05:693c:414b:10b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3674ff008ffmr6968374eec.32.1792662609435;
        Thu, 22 Oct 2026 02:50:09 -0700 (PDT)
X-Received: by 2002:a05:693c:414b:10b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3674ff008ffmr6968325eec.32.1792662608877;
        Thu, 22 Oct 2026 02:50:08 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm14418035eec.21.2026.10.22.02.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:50:08 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:19:42 +0530
Subject: [PATCH v3 1/5] dt-bindings: display/msm: dp-controller: Document
 Kaanapali
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
Message-Id: <20261022-kaanapali_dp-v3-1-b5ae8e6083c3@oss.qualcomm.com>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792662591; l=1990;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=gFpmXsiRDLU1j4jPsZHAla7qt4QGjHqNVO9ALlnOzsc=;
 b=97hfX5kyCQXb5TRjlzEy6alGk4pMuHZazh7cCYnWQ/zPZQo/65Uck0Tbax8iowk6/bE5tISAl
 rH73MZ9wRI8AWLCySmVAhq8+krivvAC8Zo6YS/NcF9mJmASkt1UH34D
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX4VKUvN+OBAJC
 mpH1fJtRzoNdcmKUZJflwFd/IWdbmJ7CyYwO5QDSjp7ERHCnbENOMmB55ecuHz1Op+XsZO/x3fD
 aKnnCaXFHlFhFl0F8GaY/1kGjPrnWRnmPqKQRcNy8wAxEkDK+JyOE1to0yoMqk+gmXScFB5ShQF
 /1rFCYLzb+2weAwrfNd3tHHixoHSK3qjH6R6IwC8MyPEtDu7rxqm4XMB/pSH5tXufITk09MbRaB
 8XQZ2vtACP9SdpodJpH9U0gtStCWysJDB7sTsPEZJg7ciNBh0DNPSAgS+ACU9l6EAC6U5jZ8HZj
 +j9XRrrzKd/027l7E7A8etROjnfZL1TdtPyxaqTNVj3ZdwC+xlkjb+8h13LygF9Wu3tSF8GGjKo
 Qh8/5nA5jsg9qnq9g0WsImZo/qz+swaf35ZpBTGFTlpEcera6ZGvP44LwELjJ9X0bkyPNOYJKTF
 PQdMe7sIOS66i8neiKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX45TG+NdskScX
 zp4x4feBCZyoEmzjg9bZcRVB24y/TEOly0U1MR/+PX797VCYn3x6EtsxrDCrLBihYwMOUVlwk/n
 tcInmx3T3+0dhCbH4iPl9TkR6hPsByM=
X-Proofpoint-GUID: n2ptUhRJDFuKs-s0TwGzWWqTygLKhOxt
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ad9dc52 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vzAMpc0yBbT7bysrcb0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: n2ptUhRJDFuKs-s0TwGzWWqTygLKhOxt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220039

Document the DisplayPort controller on Qualcomm Kaanapali.

Kaanapali uses its own DP compatible string and has a resource
layout with five register ranges and six clocks. Add SoC-specific
constraints for those resource counts.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml   | 2 ++
 .../devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml       | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 094a6383bb77..63e1b515a355 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dp
+          - qcom,kaanapali-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -275,6 +276,7 @@ allOf:
           contains:
             # 2 streams MST
             enum:
+              - qcom,kaanapali-dp
               - qcom,sc8180x-dp
               - qcom,sdm845-dp
               - qcom,sm8350-dp
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
index 9f935defd6b1..b4851d1d48ea 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
@@ -48,6 +48,13 @@ patternProperties:
       compatible:
         const: qcom,kaanapali-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,kaanapali-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     additionalProperties: true

-- 
2.34.1

