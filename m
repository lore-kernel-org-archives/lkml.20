Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BFD2C11EE
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185089; cv=none; b=d4rc9Uc8MnnOIzZh9BS2c6Txu9TEPjsly5FJTjwqKKojhIUGU/rUfK8X6QHAWz1Wr6vJbzJv5DqfH9zbxDg8+x18ZbA2F36KNV3QYSKv1CiwWgxZxegHclPHUe/dzUJJuiXHiOLjjaae6QRBqqcNtNhTHGkFMucPybIuRYhX2zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185089; c=relaxed/simple;
	bh=GzWzFpAa/mVkpqK2itZgfHllvdg0sj9Od9l5xCjY1dQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t+r8cJAfe+wsaR1m9AJaPHlA0y0V5E1QtK4WdTnL0I8C1O0yxPNukQrrWBoxequbiGwKajQGY5QBVh0nNHCii9JwamWxOA7TZb3SM6QllkzyBldt1Tev606t9n99OzcaxH7yjs30kHOKjITLwzj9r27dA5d5i0N+ooO0c8Ii7U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JioyAYkJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OVgK4ylx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JioyAYkJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OVgK4ylx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510CMS471070
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 07:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V0KMvSzLsthB7rRatilMFr5VvRODHVlblv8W8R1UUWk=; b=JioyAYkJQdu3jO2e
	i3S+TJExvCGVTrWISwvMO8aSYfvJbLzsGS73dADHsghN0AdzYLh8gCZrNb5XprIr
	FfNDI0ZDYDimD9ODAZBczR93hvrx61q40HhudbbWMDzt3VBsjTVTghHB69hRiNpg
	ag9fy41DQIEccS/Y729yG8pv9NDaupgE0C8Hb75svA1O4EmGBgz2PFZoZRxDXC5A
	yl66QHz7jYYglTj7gjNgUf/n/6nx6VueevDTaTQGwJSDT6l9TJEg1mOyBWZC2NUP
	ESauN2L6YU8CWBMoM54PqJ13LC2j5n5NXWvOBXTOKPRlptz+FGwJlGlrBPhdeJrA
	tPWG2Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssucw35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:24:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so2650700a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791185086; x=1791789886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0KMvSzLsthB7rRatilMFr5VvRODHVlblv8W8R1UUWk=;
        b=OVgK4ylxrEzaX9daBGQdvdxF7R6PXxsExcy6jvd6BzhLuy61lpWfV7wcKP1o0+mjNB
         I8+VaV0VFEV4TKlpAP8Lmv4XTOJu+0nPO+K2GOxRx1Vsny0WaubGMpWz+4H25LpTAYd3
         TQ8Kv9f+0Z13mwi69Bxmq8uebvLLEzSOshNUDQ5CWlyM8dXQ4XL1PZtDCaYG9/oqOBPv
         OwXyPMF8LcwwmPppDqPR5LOErQ19WAhQMCf3NA/npvK9A8+bL3QbqXwi1sSBBFKlSqvv
         89Wwhsq6zsr/FRfIM2YL9pl86kRDNUh38/6fu7pEJTRP3iYdWHy9nl5Q/+88Q2hxtrF3
         89ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791185086; x=1791789886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0KMvSzLsthB7rRatilMFr5VvRODHVlblv8W8R1UUWk=;
        b=inin6kK9nJ/dnyx6+PFmo/lOhdEA8Eb1A1/h1NxWrj9+Ms+1dzAMD1cnssFyi4yIIY
         m9GxnYnU3y/85jZlmOAhDZGpDDV6pD5eLJqmyN5T7Kbxm5/0KhwH8lXWz3V1mleOslWR
         kYUtCraXbL3VaGLlLcgt9ak4+3++bWQVcv7In++YC3Zt/zBsqsNnv5vixIcg/Vp3WTS8
         XCoG0cz2H055nBScsd235eBUhYw3s9r4qd18UEMN7vyFjTVw1oyhbqoeo3fHvTmyirLh
         JH8RH4HN08+d1fckz25NdqvSs1O21nKW5yxzdG+zpfkuOxRLdUNji1WPHBpSDaPFoX66
         XmTg==
X-Forwarded-Encrypted: i=1; AKwUvBzvCJ4Xg9BghlDo7Z0lvqe0M05mTzgjuQZgWFSlehhDgNFiManefVDavjYrJFijHLGJuUrOjDrIUq0OmWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaHye5FqtXwi5fiacWAh7fzzUY4Zk2Od6sxU6Z4bsRm6By6YVD
	iUPyEPt7bma0dWgp3fZRuOI8JYYuca8O5wJUR+URs00stzxoZUm4UyWEd7VBd0z8KuVa7UgY17v
	fhZUegp0uwnRt67E2oiG5nAfl5CcrrnJXXAh+TsrF/HijtHx0VRMdPSE8GyFos38yP5Q=
X-Gm-Gg: AYBFou0fF8hHLRyNQIUyK0oZRGrMtUXxSa4ZTuRc7Q3U3HMpcQIhrgZZkocEV8uJF0G
	Zp7d2oULYFjiQPgcbgHEID2pM9Ri19edoBZA1N24gRaTbM1efAejvjEohiw4/XGQD5XU/PPUiKz
	YwRT9UpF3JxXV77vANxWV1n42gsSI+f4cfbFN1M6AeEhBHnIfUhtH8pj5dQeBVVN+UqNc9uR0KK
	S0pRqJFCUv+klwYgjJBmCAbdQc/OmXl0xF6/HF1GvZmCVWCmgbHNMc0H30ZrZbchfT5ReNzqpWS
	W8imfZWXLfD+l7c1RAtmG7NP1djjOgvhAbL5mTx7X8DLYVL3KSKWtOj2t+c1iE+J1SPjzWHKekd
	dPFSD9aVIOIxUkLtYEMFXT4aQN6NztZtJ8HI=
X-Received: by 2002:a17:90a:1506:b0:3a7:9adb:2a18 with SMTP id 98e67ed59e1d1-3a79adb329fmr3032548a91.62.1791185086121;
        Mon, 05 Oct 2026 00:24:46 -0700 (PDT)
X-Received: by 2002:a17:90a:1506:b0:3a7:9adb:2a18 with SMTP id 98e67ed59e1d1-3a79adb329fmr3032532a91.62.1791185085659;
        Mon, 05 Oct 2026 00:24:45 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4f3911sm9901421a91.15.2026.10.05.00.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:24:45 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:54:26 +0530
Subject: [PATCH 1/5] dt-bindings: display/msm: dp-controller: Add Kaanapali
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-kaanapali_dp-v1-1-6faeac3a6d59@oss.qualcomm.com>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
In-Reply-To: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
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
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791185070; l=1609;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=GzWzFpAa/mVkpqK2itZgfHllvdg0sj9Od9l5xCjY1dQ=;
 b=F0QT1yp2Viq4LAlgWRSHhvhMjTJ+g+n3oKrwjm2SXdjNKzrBNl3f8R+7CveNVgDKY0NfKM5TN
 ay9pTrDY/mWD7mYUoOARSEkseOF2JgxbJ0Q5VwMw7wAMtANqLf8nO1i
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX9rGTIG5VsbVW
 C36yJ/7kg+MfKhbOer+KAJW23hHAAFQAd04OCvW0Mdnu8LGoAmJDRxg23POppDZBsRwx1A4IFNE
 9i8Sypx2+LrELp2djwl89KtIns3pefE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX7GMGR7Bs99/m
 1rsVVu3TAeDfp0gIoLIeR3F7H56OUf+eIXRUxMzD005zmLXv6wgiNwk0uLvoJ/M2OcJzch1zP4F
 bQjw5+oGIhbUWZF1X9ZscfZKwBARjPxH199IO1eUPzSiDbMoJjFt5r+E2nLo/U3ErJ5zbWcBcZ4
 W7fN4AQS6DUJlvVly2ngRxNfw/jl9lFBzARQ6QsC+h0kGLESkLp+riyZFEzi6lED3zjdOGuSKpx
 BeYiNvBwJXAYrNqKA9qKx51VR4TLdsDeXr4guCB/+VO7Ez3R/1eHrcYuYYt/yi1qJQbYaFctvCA
 ZhPPTagjeZTicbvdPQbajw6IZZoZ1NbibFWykbsBC1J+XNadAMmYYZSOOiCLDxo3YA9T+d8g+Un
 W2Wi4Nnmz9eYVna/iswsvMkl5USCzAlRIFnUeEku61x7pMA323g9l5oJtvH3r8Gq969UQ9ijNfX
 4Cbt51LH0y36UwskXuQ==
X-Proofpoint-GUID: y7s-Iroh4Rb5PWFuRDlxH2WrH3uf94Ui
X-Proofpoint-ORIG-GUID: y7s-Iroh4Rb5PWFuRDlxH2WrH3uf94Ui
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac350bf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=H-7iiLwglXPwSBWBkKcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050028

Add DisplayPort controller for Qualcomm Kaanapali SoC which so far looks
fully compatible with earlier SM8650 variant.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
 .../devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml        | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 094a6383bb77..8bb0f6e15942 100644
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
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
index 9f935defd6b1..83e3596ba0ed 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
@@ -48,6 +48,12 @@ patternProperties:
       compatible:
         const: qcom,kaanapali-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,kaanapali-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     additionalProperties: true

-- 
2.34.1

