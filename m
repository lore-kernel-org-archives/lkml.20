Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A89463B94
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786068; cv=none; b=LVxmD7LxQLkLRAqAVNkjFIs4hpoSUSOf8Xtd+3D0FJF+G0YWDKj1jMn9cGFlyBBD3jrlM6Hs1UE+yY8McjUdoEX3Fik9rekBtyzAyOqyDfsynShNeo/v+uLS78Hkp7Ee8B8bBxl3DUKspN3Yp7ISY3FzuNnXQTBArF0fU+C+HiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786068; c=relaxed/simple;
	bh=dxt0nRLMlCSOHXCt5GgWA+SbZAKlsIeSxAesz/KABiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oTRYZA3UH1szX87GJ4D0EA5LcYYGNHf7eP31yIvZojm/Au0+htmixyyGEeRH6ekzkHGgtMM8caytkXhgRftzQPP1CEp+1IQV1qJpNTD9ZUGXpfxcenjfQtoWHed81FBJxDn3efPMMPNCnu3lstPXyp/ZgQmTV04iTsfAxw+SQLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JeyDuyqh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VK9jB/4i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JeyDuyqh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VK9jB/4i"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnGtO3863138
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 13:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Zxd143ASUomJNNgHPeOAeQIGghuC3wI/sji5Dtl2sM=; b=JeyDuyqhPyOJhQNo
	dwaVgIkG+yKlIXzw44icOX4UHs5HZFBeWgQVQ8b9S6rXB1dym/fL15+FLHl+hm+e
	Ch9MzwqSRQNVphWaHMvcHlaynYiW3wIPsMCtbMQcbmxP2aah+G2U41aAqxvOT/e7
	fVzOZ8RIFHpyL1o3FopcWrr70Szpg7np8EL9VE2w3zp24ZC7Vtgy+/iF2+QO8/9V
	9Z92mipyt65jv3eRdkbY84hQFN9mfZHPYaBcQAi4o9/Qishd2kdIjAwcvsWpjfc/
	PLVqCPtqGqo7amL5/WBHZjmBCS+D28FJiYMAlis2L9oIwk+3FqXEWtIlAsRJSyMU
	6AV9UA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66hwe6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:00:50 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97bf8f3a38bso198540241.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786049; x=1789390849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Zxd143ASUomJNNgHPeOAeQIGghuC3wI/sji5Dtl2sM=;
        b=VK9jB/4i/B6LRZLWV8LG5PD/jJBQd1eZsMjCJ4WON33XL6XuA8c8JI25gyGf2h6pPb
         MwwfbogZe1KlVERJBwy4yQdsZmFqLcaXHTL38TAkBWL7R8ruoFHxtNMTEIKTqqK4TqVi
         ryKsO07sbAZ0gC6Mrqup/NiEDTf2WDHXFqvosJo8dMJqDLkZaa55KU1drFE0XiBZTDa0
         /Sc3Va+of/2qUFG6hsXLnYMnG8iHeex3iCspM5t1vnz132p6ecru+Lc2kVwJapw14PQo
         HsQHhXoBNWWiPeRucHT0ryciRUSkFdWPr/a8FqUTz5/0yOS6/vC2oEwTC6MaSQLsAz3D
         ekZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786049; x=1789390849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Zxd143ASUomJNNgHPeOAeQIGghuC3wI/sji5Dtl2sM=;
        b=CEFecOfzE/2fq9/a8iYVfyIlA7mwkDoe9Wxkzh535ax9Wm62KwV8aAd8Fzgl6aVY2D
         2Ay4X3AerWMQngKsxa3GkoetBvTfmpDtCnosGMZnwa1yLzfxNXxo/pXiMlPDdsbHBV9T
         VT/HUcdzNHcnc50dkOW2STtVp65MthgN+xFx1thIqdV9Yo8w1rd6rlwZCe3mlwFaNmpN
         zqP4h+vWmPxtTXnY4dlIM3iWTga5aZAX/0MGlUhuI3BMn8TTp9403b4hAKxmSeu/QH0K
         o750CwsQakjzR3wX3XmKLYTk2enNDre89CO6h1e6qqyP7z6/gYmXmlJp31Qst1QL3coi
         wFrA==
X-Forwarded-Encrypted: i=1; AKwUvBxgzy0kjCyTDTZCYMDVLgoIOG6B1hjqaYc8JH5FIeooGvQkyUhY93M1MW2m0mHDgpBQ48vVnZJV3Wkcnls=@vger.kernel.org
X-Gm-Message-State: AFuF++k3c/p96vmcUmJfbUl27Bvgvz+ZpuRpiNlUfadDreNsLNXWvrfJ
	rybxRBPcZyXlELbRKx+8FZWhyMrfjunusnRgYdHUqJzQsiz0Tsl+WR+ENPQpg0QmvPPgFtC1f3Z
	NZNdFH5Wm/mTrOpI16K0oCJqyQmfc9np5NswKa3/01fQTx8IQta6MFzZ9MMxErse4pqc=
X-Gm-Gg: AYBFou2imvAVB2IwAwy3HQ3teOGTKvC8L8hRls02A/w0j3oyx/D1NF2fImjlytGBCJc
	tuv5hyrDusj/m4krEbzxXBUKXRMqgQQx2AD7qjdogLzzbW/hIf0eg+wMYX2OyziGAFk0m4V0o9L
	ODZ6jmMSmFEEswgiYRcDhJIkdvPhIaFls6pVJ4jgImJx62hd9mh+prVapsHPFP4fEGNiYKh9y/Q
	d30Qhzi4B06A+XCcyr1SNgO8oeSjZT5ATKwxVtSahOCQ1OSmapA0Orq1a5g7T7TD4ZGKZBgfIkv
	Fz9ExPRORvfQFQKwYIyE3YsCFH6eydozz2TvspsICJmfHVEVidC/4/pEWL0uHdajZ671zeolZcd
	FSdwT8x/MBD/cx2Km9GmsMMs=
X-Received: by 2002:a05:6102:8099:b0:76f:eaa2:6fa7 with SMTP id ada2fe7eead31-78a4a6d4adfmr7328434137.2.1788786049292;
        Mon, 07 Sep 2026 06:00:49 -0700 (PDT)
X-Received: by 2002:a05:6102:8099:b0:76f:eaa2:6fa7 with SMTP id ada2fe7eead31-78a4a6d4adfmr7328410137.2.1788786048792;
        Mon, 07 Sep 2026 06:00:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff81c9b5sm198751205e9.4.2026.09.07.06.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:00:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:00:21 +0200
Subject: [PATCH v2 7/7] dt-bindings: display/msm: hdmi: Correct name of
 disallowed supplies
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-7-b097cf1eac77@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dxt0nRLMlCSOHXCt5GgWA+SbZAKlsIeSxAesz/KABiI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqnrVp5cFMmNVGYy9ANhImIAHyKD5dGnRPUBeVP
 O1DuCsl5oaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap61aQAKCRDBN2bmhouD
 16++D/0bbkHFrM/DSB17DsFeQob3v757v8onIfgsK4xIpUIPtiULuD/AG8t0JcY8swQx5ckcrCm
 raqmFRD4zTdXnygkjlS+0MUr9+5zVTDvB1N58YdxWso47cdyTrA9XES4yWIHADmk4Yu/EobsWA8
 +Kg0jWeqjDVoifxxk2ra9XUq9p42HzDHADKOitroD3WMzx2hGpBsIpJdPWIWf66/k13GlWRCAhg
 eVThPzf9myJWdnmeODBJ+vJQrl4rpCMsKOBWcpa0HBQXCfw/hhRcIl7aayrAKJuefX01wDYuYvi
 ZbZxGOPIsbcoZKpgeLFOOtxOKal0cFCn+p+ikNF9GKmxjGENd6Q8MWgTaHVH+l6sMaq4FI/6FhT
 vpvhxZFAeE/sOAvCQnkJqHhCYtaF6fXFkuSRTO4eMyq1dMHWXxTQ9Lo1/UBINsi/YvHrniMsdv7
 fi3TFc/mxIm68i8ahUny1DvLamzdcNHpOUiCBpFVe50QKnT3nUEZt+Vwx6Qwsid+BfaSkY/X84e
 3s2cQSFrXlc5/sjrmlNb/vbnvS3JM06B6+6e5/Ac0Z8zQuTIXdjZO6wuodgUGzrrOAksYJIoATo
 Ea4/8xYhjDsnO1tUaqOt+DmnKYLA/MIwvBs/N2t+ybpJZM0ZHumq1j0MzkiIpDokDx5UdGWrxUS
 /1ynteKFLOmJsyQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9eb582 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LSMMCDwwRte7x3nqQVUA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: tSPf_XzcguKGAQsH6XreJf-A4lxmSHJJ
X-Proofpoint-ORIG-GUID: tSPf_XzcguKGAQsH6XreJf-A4lxmSHJJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX3Gj8CVSNmu3K
 TLsxSEyWMkjHNoGSiBs7nwQlv42esoa2Xi02jDslp+2r8htDLBsUf7iDxIhdzQEd/ZV3ihZstoB
 AfTxpwFGOSLUIPw1XDGZjcvrP9/8Rew=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX6yn5UexT+cDU
 S7NQJhRoBcl2VLP5GyFABd21a9PlqbU/DNjaxSwgWKVtUt1SqVC0Py1BYOpHUuahawJGxBAqs4x
 Dp4kjG/J2SnfCfXIDjsmuUtGcHgfVhumTmQ9GR8R696Lv2NcXIc1/sX/HOCjXpaFVuTwV36SKXJ
 zC2bqfrUiGiTjkhy+YuVLxbi67tAdz1LjKU4RxFCJh3aaql1sV9D1sKnSbjtq+ToBXlzuLgdA4z
 5BJrESG4zrShH38uRCIs1AjCdrLq2N2na/JorloNCoUuGxNOTbUNkH9bci+cddmdlYxKeqWHP0W
 3fYiLOo7Z8FAyAKEo0bMLyb8KV6g5hel6OAKePEvY5RzH+TKG1JXZM/tQh+xXgCS8fqBxAEf8Aq
 hrAHkR5dBifAaEsKUSNIyT6BwX4BzgKSiuSmG5tv47rdmn5UFkfy4vA3j/oKzX5ZKx8IOaqwjuv
 DvAqZO1T4SOP3FbepBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070143

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

