Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952234E0B85
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553851; cv=none; b=lO3t8qItFpI1gBhLnt/VvesGu5hpF27ArjEJ4BM06QjiA+ZEQJLYwd69QV9xJPPnpweN0Fps/SlBeHYwLtoX+moBNXNHwSkUtbl4iIuM/qjdg0bB8AiGV1YUDlbNjfrGnOZjy7V36VGXnefoZOpFBIP8miS6sbrquBc3j1vZkgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553851; c=relaxed/simple;
	bh=jr8ZDL9Js04oomOhO0NZB0jV7LM0mrbtpIaO0j3ZEno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WEy8suU+1Tdce1G/ENFhCWvguo0SMpzaOom4Pb/pWelCIwq3n5xKcJgFE2ALlmQ7UqBo8kfTYnicmZwbejItdKDkWiUpVmdZorKtdhFs1UYkr+P7jt4uoN+wG/ePgLNiTYVEs8nMO5so7yPYM5qc6Pd0KPKxBkf+uxzWMvmhVmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ek3WM/0s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NjNYIRBt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ek3WM/0s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NjNYIRBt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKfFv887332
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 13:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EAM10LpmPnMFzHR+16VWEfcHy7X7Am5wp02E4jq/DiQ=; b=ek3WM/0smn6rhpRB
	jaTh5o1ZTkH+Ew8feJJMfm/t9q7zR2DieZyt0guYYIVADUXmCHi1bUorq7HLPOby
	kX487CWzFJnj/zeoQ7I7V/M06dL0qp78NkqOWx4FwnSnJAv0IH0auv/NbUeQFWZ9
	lVA3lELwfoKWc8WgEvg0YZL5n0TkwC+v9OErphtn3sGiginwRLeBGDl65+QLRX4d
	/6Vu1bkvh0pWZL7aPIeUV8vYvtazIAP15TCKWlDCjx3Zixb2DeJ37Y8oojaLrDIl
	DR0bMu7yMfPygO3pK3DXJFwBymjWpaYgGOaYF2Y5kCo3I2OXKAaDFEi/IT0eUlnr
	xdGGxQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu3s2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:50:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e85f74c21aso1098165ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791553848; x=1792158648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EAM10LpmPnMFzHR+16VWEfcHy7X7Am5wp02E4jq/DiQ=;
        b=NjNYIRBtzxljYBLckGt6HUflkEOUXe+3kqE4oivZi2zG1Zoj+wqgzf+6W/J7z1feOw
         MAbSRGyCcf3sRZANO7dP2ltx/TYgNKLzyaiMMt9iDp8NNM9Zy5Dj5yir1+ORIkv/1MHK
         8HKdT6t9iyJ+doKP6ZLQUtzHxTLNpzRnt+nwrmDt6/XVFolr3YoRThDZL6LtE26VECFq
         hncARAqAP/DCtRcmRYVb+BcO+zfNUuQ9RDjR8RtTRz9huSO869Qf6M+Nmjdj3EUkcwzR
         vQ0hJ4M36chW7ASqZXkKj2Zf+IhksuQxemnynhMZ3f2o+wMZB9bVBrdDwR44vvEnnYNk
         AQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553848; x=1792158648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAM10LpmPnMFzHR+16VWEfcHy7X7Am5wp02E4jq/DiQ=;
        b=o/Ap9JMM4YK8Z+0+C21cTvpv7lXMybtLfWk5QHZUILvjOFwtgpPeo4pXeB/3HqxT81
         IpSsedkF5+76oeS7nEoCi/8oRPSHr9RPEJa3bxYpQNwPROf8AsVEGHrhmZiyRriubLCH
         VxLOM5/1QLzVP+zIivE97eCY1afOLc9GaxyzhiTsboK/hcr8n3JtOoG9pYeBQQMdXnoO
         k2dO8HDrCSQWEivQF+/HpqUMBh0Q+zWm6ZGMFdKl08CDg6SVbfcExirJ+LU5faQAnMle
         JqBzT3xo2lJ5KN0ikqsfANy2DDNTFhVtPWVzYI38+SA+f21hq2ZV9OR1TcpjmkfJ5oSK
         3hvA==
X-Forwarded-Encrypted: i=1; AKwUvBynlLOcp31VuYXnUpXsKQ+XFbwmS/nQJLlC+3RCLuPztH/u9r4K3iFrHezSzWOsMGKTmrlkCPIVKEo+AoY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUJLMPtQbnuuyZCDQ03lcz839n7rLoKY0YPK/2F5BoYYgbJQvQ
	604LNN1ZBKlcDBwXLg/llTgz7NY6PhSqmw0GweTXZOLpUOunhNQTniaCk6a4RcUEChSai1w2g2t
	wfKmphCc+zzIo8kSEuhU9sQAwVHHkolN/3beP4IHmkgtVZdiFTKZE/iqYYaika916k6Y=
X-Gm-Gg: AYBFou0OcBY01Dvi9Nnoo2Isc+MZDGMwJrctYUocCt3M+LerSyDftJUV4fl6/h7b50X
	69u5bHVl7kiVaDY2uIniZWYAKGC1uCHw5ptnsf3d+coVjMeRfWGEyMq6gA8wJQ7ANeBVU7+xz3o
	YnCaQw9Wks4S6w59AalD9piKod+z/ts+7nwR9BKmRE6TtlTqF9RMhUVv40e3cnye+ExaXy+5uvX
	ZAs0+7mNOE7g1Drhi/RLNWQ8mLBpeNYLqVVJQEQoIPzGfONnyu6X1oIv05XrmbSZnkeqRq8WY9D
	ndBex/b7JHdx68XsKF+NaGZQ63LOqRKRiPaI4pHGETBts0WMQM8plRAHLj0q7+C7vnNr3EaynK7
	7xJZ4Cz34Dhw3KV/rBNbYWqz7JYbf5J1yDAIh4DvuDu6heXuiw8g4qRXmrRwBG1kgMdQvtDo817
	w1Irq8MAocGL0oTk4xBcf6D2HDiqxWsH/E01k=
X-Received: by 2002:a17:902:ea0a:b0:2e5:debe:cb50 with SMTP id d9443c01a7336-2e8403c47f5mr17143195ad.4.1791553848466;
        Fri, 09 Oct 2026 06:50:48 -0700 (PDT)
X-Received: by 2002:a17:902:ea0a:b0:2e5:debe:cb50 with SMTP id d9443c01a7336-2e8403c47f5mr17143025ad.4.1791553848012;
        Fri, 09 Oct 2026 06:50:48 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422c9944sm9574135ad.64.2026.10.09.06.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:50:47 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 19:20:31 +0530
Subject: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Add IPQ9650 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-ipq9650_llcc-v1-1-572e40b18522@oss.qualcomm.com>
References: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
In-Reply-To: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfXyfhJpglVJ9v4
 XeUK1WLamEvTV6EtvuIYNaS0RODdcUiglCz4ePKMPel3WM0WIF0BOsKkO3XYf7SFPNPxf4UkWFJ
 PXx7JnF0aBVxECjCToxKWHOAJ9ThghKJSJnmbXQlLoXP+c2Xhh1mHeHOGtplf4nESeI7NIuCPxc
 qmZqDODgQvrGgXpTTyI/yCmhW0PkPo+PNNWEcvmpv3IFhdpKDnxQOjMfQWgVjwtsO7jSWFawne9
 6h4DeUCg739xATfydainXVptPM0/Cd5qHCSkAhR9L+XLR4cAVoIuuHZ3aDLVjZ37cd1bUAVU3iC
 BPrqpCUQ9RDjFjJ3ox0D/5Mbn+RYDaIioPR2YHbZ08/ftLxsFIWkw/r56D+HuIh195GVr/FV5aq
 M911ZiAJ+A4j5PCaIpZiI5QwiA0q1hIgT1PgUlttoRAfhJZwB+iDKvUK5oBCYODlbJdQvEPNVT3
 V6zHcOttPxPmHVlF04Q==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8f139 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=OsHVNsnzEVu89lbPO3AA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 3A2tnHmB2HzeimUjWGnBetz7ADYtXh79
X-Proofpoint-ORIG-GUID: 3A2tnHmB2HzeimUjWGnBetz7ADYtXh79
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX5XYIkSTeriGb
 mczKLOv/U95p2+zY93ArhfB2kl0byl0bL+eYlrooBH6Gdi+S8GfadKQT7CvdXVWQAwJN8Jg/HQ9
 KQNpYKEhoInhyEDxq9F3oU+GjKq3muA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090055

Document the Last Level Cache Controller on IPQ9650. Similar to IPQ5424,
IPQ9650 does not have a broadcast region, since there is only one
instance of LLCC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 2141e5d4de63..3efe68b08d58 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,glymur-llcc
           - qcom,hawi-llcc
           - qcom,ipq5424-llcc
+          - qcom,ipq9650-llcc
           - qcom,kaanapali-llcc
           - qcom,nord-llcc
           - qcom,qcs615-llcc
@@ -91,6 +92,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq5424-llcc
+              - qcom,ipq9650-llcc
     then:
       properties:
         reg:

-- 
2.34.1

