Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC873AFD1E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315350; cv=none; b=Vb9Qx5I8yYXuMTF+bHh5VtR2rLQEKS0F9ic+gleBEIqKnexaLuMOXMLquiASgVN3Cj0qJf6BrO1VjOT60nNzZcLAA8B7VUkBQNOoPSLc/4QEef5CKgMA8aXycjOMem/YwoQtrXkBYMdEC+9dn76iUIfdEizxXCrfGxoi2Lk/a2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315350; c=relaxed/simple;
	bh=JDFgCYWtc+oUI6m4QlfCAkKEA7BRMEd/DU1CuWueAqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sf6lbu9A3lsVTha9n2qCl5nCQ3FHN7gg/lnXgT2ukeI+9Lqt11cyDf/nEZkQUlJybMc9ozHS4UJNVzoewcmc94QlBdzRVSKPcLdq6Qsza0fF/mijP8+JJmy8sSNL5Vi4+9Lo7M/R1XPgZC+1CeEQFGBkUMv5CneOZT2RMCSr1Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXwCeuCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ju/ur+32; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXwCeuCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ju/ur+32"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YWhu039598
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngYHv8t1q8xCQbnExaa+q1yobNhD2HUJWqMbAGat/VM=; b=eXwCeuClcwVrUfdF
	S0nc5Skriu2MiiHEAwlysFZLXobiLR3CEGgvCuhzexgGzgUT3wR+hOwFzOupyspl
	h5z+yyOsWmsZaJgWVT+8KbkF2m+IwEk6NPBJS6UOXDqJIJbqIEiszlMZ4ObmcDPa
	ztBnzc3SMhhci2C7hn3fMeWzu/P4dpoNbCRFspLTNNogo0ysHuwP1CXnJohCCRr+
	UUu4s3kTe8BcJoktM8HQdyCV33do1f9o7hK7TakaD2/JLlt7OdszjCS9ZwuuS1D3
	XGvkMKi5r1ezt1OkhCnsuzvwi2nPOTbkr+Q8Rz7qGj2p2KSq6N4MnGzHkXLBaf3T
	4+kqsA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw4653dpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:49:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so316550eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790315346; x=1790920146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngYHv8t1q8xCQbnExaa+q1yobNhD2HUJWqMbAGat/VM=;
        b=Ju/ur+32MXHFUCIXWou6WyzwtdwzTfk85oaIAj7WtibZjuv3BmecMuyh7uLzHWfHge
         AThq1bC53ZPw4zJkTOmfMj8V4jE8ClEtAQD9JkdMsuXm2sS6SdKfVu0+bfpoza9JS5h4
         x+S9COg7j5qFd5mfpSNb0O9Xp5vh74oqRzL2O956wWUiQRmWIHNXOm9XQ4t6Itd0AG1Z
         DXdPHTqfRNRWtRnJSSwT4GTpZgZwlgLc+RaG/gLED3TIyD/RA/6jSIakvX+VxCSStM4I
         dlxc1M8xZNDnRte6YQMsREqspJWQbEyMNaCdOSMQzaSLLpdkd4o2n0jSJNBgkcbMs0bG
         L5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790315346; x=1790920146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngYHv8t1q8xCQbnExaa+q1yobNhD2HUJWqMbAGat/VM=;
        b=gJzkHMouJuNBizsC/l7h6vEGsIC/jjap37RpR8qvVfX/XJqC6rtgYvqGbn99IDMGpl
         WEBhrKxWwIIzstu9F3PqgKlUQB/Z5Cui9QYImSbzHPWj3FVXYBiUqgGcprYibI8tkBQ2
         lrqDM3P7dgqBc343PpvJskUb9VBULZKHigtQfEnJuDaRaViQ8a4TVADzHpzKOLus2WXZ
         MYH3HsLXq4FKH1XEZwbQerBgnrUhBVzmpxc6lWrOHC7VxFrdBDO4sMxHU/+JcaDOGA0i
         D6aJqIYhaWgxCsBsWEBmGgQAv8XSNM+gNqcdPteatjtbTpLxkC/rtQHt7/009b6g3Hfe
         RaWQ==
X-Forwarded-Encrypted: i=1; AKwUvBx907xZFfdXgVp/iCoP4tjOb91yFJNnfA4g2CsvKIJxZulygLb+RXA1ty4mwtvrevvSqeGGCDAL4t8L/Zw=@vger.kernel.org
X-Gm-Message-State: AFuF++nnqGhQIreU2vQv3D6DRqD86iVKYMd0QETdl61q08H3FiWG3e7X
	IJppjEtu4YUf484VIqzvvG4TuyJnw2r67KTe5fIPDbcNv6FQKp720myk8WiOQbcaECufnMcren6
	20rOGLdV597uASYul6y+saAXF7TOGsXaZN4ecAkNftqBn9+WQJxDcuK/6qxizex2tLXWKEoMHvX
	A=
X-Gm-Gg: AYBFou0CNu9i+xqU+RwoldISZ3Vi4oU6C5SS5Muor8vfHP5pwQrtlLQN6mIw7omTjp2
	RTJG4yhNYhMlt7+LlSCa8U17R/WUh/TqghYxHktZnWRU3xKObDzFsUUh4lZstrBgs8rTuPeP1a1
	ZHsuLXUvDits7WN9Jzw0l/PP9DVXj5C8RdV22KhkYSmlrVhRoRHaalaP2uIz5aedVFh2mCwATTp
	OA/oaRDxIUn0h/iKTPl2LnHqpdcZvAnMRZoMBaZfxg2XMS6gbYfyXnvYrG7P12CUx80iRYox978
	az8+MPHzVU8LjOiYP4nayE0mWHqWnV84pjCeX1H7/OmGevxLFFxegk8CvB4cseO34Mge/Eb5/NX
	Usf9tU2X9hUQ6+BYI2COBH343Gl65xEY=
X-Received: by 2002:a05:7300:8196:b0:33b:c23b:f5a7 with SMTP id 5a478bee46e88-341994340b1mr1375324eec.21.1790315345844;
        Thu, 24 Sep 2026 22:49:05 -0700 (PDT)
X-Received: by 2002:a05:7300:8196:b0:33b:c23b:f5a7 with SMTP id 5a478bee46e88-341994340b1mr1375266eec.21.1790315345128;
        Thu, 24 Sep 2026 22:49:05 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757747sm4033640eec.13.2026.09.24.22.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:49:04 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:18:45 +0530
Subject: [PATCH v4 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
In-Reply-To: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790315331; l=1088;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=JDFgCYWtc+oUI6m4QlfCAkKEA7BRMEd/DU1CuWueAqM=;
 b=A5DUX7u+2gUNyMDWLrtc3eW8cxxncvqp/ZA2Ckcf7cb75bVTMAhx22/8ERa731bcbDqVnUqxF
 Y943m3d4OA8AzY5sZylsjF7ITkYLMRmu1NaHifyQ/JQISuSXYIFmgej
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab60b53 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=GarM_vGPpaxcprxHJuEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: SPSUZy43Tp1hX6JSHTcTc98Sk_h6XKry
X-Proofpoint-GUID: SPSUZy43Tp1hX6JSHTcTc98Sk_h6XKry
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyMyBTYWx0ZWRfX5qsU+Er0ym+6
 tGNbhESvyPH12uEcLM+uyrsrcjwYauy9i0ny5NSnzQ4xf6jWbJ+X3XZx/pso3C5VT4WIiewJvoE
 YAxtev99FOTwEgPW6GU1UizIP7//m7LMYclzCySCOuUi72PKpYpnKQ9vZK6ktG/Ov7Y+AbMawYe
 3muq9KncIdiuq0wfnhnY62l0VPGt7tuYIOkuD2DGn+2tJhnI56NCjfgJ64VwgC44op3Umlzxq4Z
 whrCx+cceAqFtfLAcd6M2F1plkF9rcVPlaIsU/QDn/7uvwzqtcGLYhZ3Mltxk34PHkv/orvx4A9
 r1DetI5f7OtrYpX/RadtWLEYritTl83emxlsyX3wZcWF41DSPQxKi0B6nENNq7lqFeXYsqdQaZC
 7cuCQKAltiohA8qRQyeDNCjHkk71WKtCCb+YgzIEikOC3T+R5rYvP80X2GUd5w7avcz7Sh2daKF
 4rD+8oIbyDa5KSPon6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyMyBTYWx0ZWRfXwjEiTq96JhrK
 sH4lpFDE5UsJ3ng/Bp/7IQouX+XaW83RvlRr1nPGpYApUNI2pu9JSIS/GRIZ+FsFYfukjU698R4
 f2le7iK5V1xpyAAGfdcxc4kB2mYhFno=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250023

Glymur integrates the same CSI2 PHY IP as X1E80100. Add
qcom,glymur-csi2-phy falling back to qcom,x1e80100-csi2-phy.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index dc64af97da6c659628729a758316353798aa98db..1f1e2a4993b2aff9a1519640bc4e04ca98fa4baa 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -16,7 +16,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,x1e80100-csi2-phy
+    oneOf:
+      - const: qcom,x1e80100-csi2-phy
+      - items:
+          - const: qcom,glymur-csi2-phy
+          - const: qcom,x1e80100-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

