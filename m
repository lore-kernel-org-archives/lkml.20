Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358354E56FC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284536; cv=none; b=cfXhNGLwoZpSusmnETvQAdM5fBUAZeM/dI+lLiKIkGRtKKXtBQQRmNNV59GHJv9JyKS1o4Ym+LCDcd0DfdQbwMm2nMzSZv4LsJZqQOuhYUnY/7vprc4FIB9Mw+4aUzXyKjalWV2/YsCOfX4IJK2KG/lb9iP0P6bTdZ/q7cGFIhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284536; c=relaxed/simple;
	bh=dmWP87UxI7uBujY0f2nbWfb3eJIAq1CPzDfzqVzPMAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tT5nlJdrXdjwgqIiYZ+drnRaYiArQX1AH8sxlCGEAUJJvBqZgeZiGqRpTj7+mtGiVqfEVNPIQbw0c2AUYpKCSBMn+L20kEyoBgsQ0e51bfVLDzwCp2Ly6cpfOnNYkRNfCMdEAwJbG06boaFzhxfYh7AfddAzqkZkSVQ0ADYaYpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVMR9lyd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pbl7pmvH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVMR9lyd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pbl7pmvH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIdk853462594
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tdcekugkB66ivyH706zrRjgKb9wjBOeIcQvd77Bs0o=; b=cVMR9lydDqbJ2eM0
	G72iokSL9QiT6pKIanwZ1s8jWrDZ4g/wIY+JhOxxFyIDzvJraI4SxTcuxc9G3WWX
	0xpfN47PJGNIKeVj2hUTvT94k564NGArOkbNekewDQPQfE7i/BxfmyQH//CTfYvr
	2B+bt37+AI0O7qCaFVWWbVJf1nFhMm0+GYY0gK8gXzTBeuP5idvzYzLP49Vjgc6Y
	uQAbU5XLo2spsBTVHA/X8EJWn1N+6VQsLT+8IhGeoLYe+UZN++Hn9HD3m1trvt5k
	tx0wN4TzhWCNYqlfMpr3wtzyzs4K5mzOlyg7rLdBJNeZaCAKY5784Pwxs5bb87a3
	Dv7I8g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjjpmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:15:33 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14371f7ba1eso411680c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790284533; x=1790889333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tdcekugkB66ivyH706zrRjgKb9wjBOeIcQvd77Bs0o=;
        b=Pbl7pmvHHwc8p64Jx36717p+1jwWjChwg/jOW3E/9YtrbmMmbwv/nYi7KfN8Ypkky7
         xmduFIQH4mS9kDyBaniT+l5ib1TMHFH/19A5HTerKV7J74RY7ryJYRU+zmbi/hXHyrQl
         F1bJB96+3o59FDiF6mCapmSq/o2j+mppmyDNSxki4LMmCfNcDjqqynaXRNCyWoTS+NOn
         wmT4MZ+XdGVF6O2Pmf6ctRk5EcDXdGcjA1H59vtOhdyIQKj9xPCddr9byZgqiX5SfnlW
         FEgfEfs+WnYPn3r5syTELCiPqzIGuKjULkdbp6hr8W9pakLeFmYswdKdRQsMa1fSu/ji
         /bYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284533; x=1790889333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tdcekugkB66ivyH706zrRjgKb9wjBOeIcQvd77Bs0o=;
        b=k67qVMRut6kvqVaGpz3Ks2lNSVZuJFli5B5k5nu7xdDpSU9SkyQlpcpwk/E77qpxC5
         kVY2PYNgd3NaACa7+ad6D6cDnzz5coIa0XRlbN+jYOvFNV3qjmaz059jy3OwdltaW8OO
         aSIG175Fe3gzZmoriqTF8m4Wd2eYmqJWd+MobNlITGcJQqamz0KVhtwS3HGCzfl+550v
         fAL3gAgbuSNWLo+AbNeS88bsKlrPS8KCHeQZC3cBRwUO3DgXs/I8qqp6agshwC/SViYs
         ZDw3a+5aVOPQCstshg+d7ANb09d+KmWeb+JY9iHaUuEbUaOzsAqsrkwJwwOQgtCYbC7f
         aaEg==
X-Forwarded-Encrypted: i=1; AKwUvBx8GqX7ggOBAVlalMEbip/ioamExKnyDAJraQi8WvBgwT7Vo50HDgRGzqYgddRB6ohw99OD8AsM+Q7a2NM=@vger.kernel.org
X-Gm-Message-State: AFuF++kFkug4SxQuavgXUhpbxSM/amhYlbGiIhsVNUnYQxq/y+ppyh0P
	hbP5nnVewbfR9q7hbSJQO2mnOR+s0KjAkjy3/Dfe/rAPGF/4K/KrSBNxxbKGVWUrjeVLfdxuOsC
	Eiowd0BDX09OxqgXnNv1CSNQVYBn0YiFrz5Y4ZzByxKhzl/WDhopaqLXicDAaB+Uuv6w=
X-Gm-Gg: AYBFou05wf5SBOn5qGbChySjwHGlGIkCKJ151Ayd29Zg5ovEHY91AYXywmfWoSR0AqC
	ZbCYjb5tonXaT233RWLpla35jck8Zl0XlmP9l6n5OK/rbhR03PF8D6uafe7sxtl2ojSq2t9Ko0R
	djR81pfqxao3CO4+N4ikubtaL5HoBxD/aydW0oG/ZqepDN5cTwKPeojg7t5wWbR4UVb+LfKIwMJ
	sW/doll0eodRkKdb/RzfkK3/25MazreY2zAuYZMIWyZriI0WYSwY5Dm/egTYyDYuXMyzpcYCWk8
	XM3ruGa2WRWfN8Mg++8zhoX5R/U+U09xbBl/ib5lR9tjvAnBNypesjgGiboDhBsBfP933nDWEtJ
	rBKaibiRmAQUH753K4mhtLos=
X-Received: by 2002:a05:7022:3f8b:b0:143:50a0:56d1 with SMTP id a92af1059eb24-145ee902dc9mr57119c88.17.1790284532678;
        Thu, 24 Sep 2026 14:15:32 -0700 (PDT)
X-Received: by 2002:a05:7022:3f8b:b0:143:50a0:56d1 with SMTP id a92af1059eb24-145ee902dc9mr57096c88.17.1790284531715;
        Thu, 24 Sep 2026 14:15:31 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm1323776c88.6.2026.09.24.14.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:15:31 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 02:44:35 +0530
Subject: [PATCH 4/5] dt-bindings: display/msm: gpu: Document Mahua GPU/GMU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mahua-gpu-v1-4-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790284491; l=1718;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wFWuC08EWZRz11+MVbDa+H+VKqlWAF1+MEP53XMoALE=;
 b=k+Zpqxr+yNVuWSBKTLezYW3OVVU34ewiwjumOVOdyNbZ/VJePl2XAynAMxxfbm/xhPbHYjeDB
 z8R2UG9USMACf0QCKKlrU+RZeBDQVbQpTOfSVYPS4Xm7ALM0l7K/y+n
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: vqtwkEVfr-nLR4oEvgJsUHlIGawqe6IF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfXyXdB4VzpYJsQ
 ftOAr7yDCisYyR1O93rxmB1b3bxt28re3QO+w+E9QaVHTl+16JpGi10fNiwI+wf48G5ZZjxgeES
 YLNkpdxbC/S2GeVrsbAEmY5tiWwqXaMBOdvoBeWmLm6jh6bKPYI+uNaT4H5EzD6ch/buYDPWvXb
 z5whwB90P8kYSPVoiJ73Zy9yYOjYK6jJBdRukDKzn9OsMKj5cPHx0mXRXE+ZOlcMFrx9MfxjOIH
 LdhgPYcBi0CTXmBTym0Hb2fFdDEQuiE7jBfh9nke/oOe+VQN9xbJoQOw8rIDnjNMx8Xu2quU6Dy
 Zw+Wujjbt/DA5RXsleMkBAo+hQ5R6EvWqSuQo81tzF+7Bg9wuqyhqaxfBP4IqUvQqMz3mP+Uuo9
 h1WPo8+daMTljNHorwTdOvxnqS1ew2t1YniLf5kI+Fy8geECMtu2i20hiZQlkTyPncbCgprREwK
 PvUgmzqKP2OUVXhNL7A==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab592f5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=I0ZAm1zAenetWGxY4hkA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: vqtwkEVfr-nLR4oEvgJsUHlIGawqe6IF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX79acDP/kJtjz
 cdykUKlr2Qo23VCNhAlZWbtI0QQk4m35gKZtBkq4KUuwKYoJJXQ7UaS1F+oTE38cqqxQf6NEdyS
 FfH6YsIu0Zj2Jcy641bR0eiOWw9xViY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240086

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Adreno X2-85 GPU found in mahua SoC belongs to the A8x family and
is a smaller variant of X2-90 with fewer slices and smaller internal
memories. Update the dt bindings documentation to describe this GPU
along with it's GMU.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 4 +++-
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index f22661447e7c..d10d6147358e 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -363,7 +363,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-gmu-x290.1
+            enum:
+              - qcom,adreno-gmu-x285.0
+              - qcom,adreno-gmu-x290.1
     then:
       properties:
         reg:
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index e5efe2d35ddc..8a103f998dd8 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -452,6 +452,7 @@ allOf:
               - qcom,adreno-43051401
               - qcom,adreno-44010000
               - qcom,adreno-44050a01
+              - qcom,adreno-44060000
               - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node

-- 
2.55.0

