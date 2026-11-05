Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877092;
	b=rcYmCaXludn5sdTI/Wb3X8K/8CNgWuPudYkXqk7xDM0wNP2ozXFXH/HwGsgUuXJYig+7
	 IDQCmRKzFU+nmObsT+2pvvJcaUyQ/ZHm93c9CVICv0qRvJkP4dRQ6E1WOmR2HlfZSB4IF
	 InC1CZukE6rcSpliiPPKymRYG+vFYeMlrEWEW7PwovhupJP/H8a/p+gAoGrELv2o2voFy
	 vT7Z7gUPhczCMEiaXf+rvzRLVHVVVrzGwUYJZQ5J/CXB6nusJRIveunedCXIzdklPfNTj
	 V6bi5FZLu0viOLlEqhh6WPU9yBhagrjPjvwj6Sdefur2ROI0D97J6j5ClJKzznvS/aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877092;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Tx4N7P1fRkn5Ta3AZs9XVGYEyxqCt48WpsxBKXnWKvg=;
	b=GoeDLDZNqGYEskst8PbOesIbgQAlWQjeDo6Kr/OTN8fCqXzcLP+v2fyyn+wri/bIhR+G
	 CDZZNus9oI1ILlbDCRfb5aKsjApSi5Z4lCMANwX8psWwJLX/42d9sdk1RpIalusooy/6Z
	 kWds3a0NCqHcQ/Qus7p6ibjYXnq3t8JQjgglXa8HsOdeDEnf0BaGUJ/AB8Mu619gOGFek
	 V4A18yfDYqVhFONl4mni0p1BrJGQw5EjXjELiYyWA+AqdXBG0VlqVTLnQV8z3MeGQoOcT
	 F2UP0x04+xyOan7jbzEgvAeJq3uf4dyLn9N9y2yzISiSXr4EBwmk+v2s2WTRdPrGNjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LYU1q7hb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Pu5/zBxq";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA523606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA523606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LYU1q7hb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pu5/zBxq
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tBUQ3684325
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 11:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tx4N7P1fRkn5Ta3AZs9XVGYEyxqCt48WpsxBKXnWKvg=; b=LYU1q7hbol6nweMa
	Ih+LCLM9IifmB1k2NsdvECh0fURO1VTVJjDP5AK+c/gK7HEJ4yiJTAaAPN/plh2P
	QrPOsRrcJe9COmdca/D1hIKYGd3Z079lJ3OiUY+cYfj959SoHzONhU5sVOh+0dJp
	xsoTXxAxUrNpj8vvidFcdztPuNz+WiG5spcfmI9ZAe3pHUhdcIsI56g+gYpaESUv
	26IkDz84sZKCTvDHBaq3Ew6rcr98fYIokAuI8QgRIKFZBN6n0XK/7GUpyT8b+lEr
	FTzDDb3UcuFNAz3kLe6t75xhBMM6LcX1tR5p5pu33AQkJx0EOtp/QjyYo+z0xOzr
	KT75GQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43hq9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:11:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f13c143c8so331761185a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877090; x=1794481890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tx4N7P1fRkn5Ta3AZs9XVGYEyxqCt48WpsxBKXnWKvg=;
        b=Pu5/zBxqOnIOalaVvNSMdbrbDaydtUbiKphzoTewxLHsbhIHb8ad8e21d3sCVLWKk5
         1HUkaNYw3QARi9X3GJDRFLVLQrpWAmDlPc738RHVEG/2nHJDm7SdTpn971d9RG7GkpqQ
         iO9sIDCplNt1ZU1cTFdI5sOxamkJm83p2K6gm2RTDXqWrUuHHi9ZrEMaeIz+zbxpO6ZD
         OYDiPjT5zjp/+rkC0pqntOgwl8fsOfxg/Yl2ki9PBvO/wVOzBjEtaVefJXIWY8XxDrlf
         OHdv4lgZIRMe3kCmyVC3ZvRVokNlv79YTxscEtzKOvgL5f6dcMy84XXzqM9jvFaon6AQ
         NJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877090; x=1794481890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tx4N7P1fRkn5Ta3AZs9XVGYEyxqCt48WpsxBKXnWKvg=;
        b=Lrb5yxV0CY4fMAEKhBu7uBqvxjdeqwG5SXu3SaZsD2Sdfr8oV1dJFUjHt6EdR+J+4L
         fbqL8/4YBZw7HKSBYQc8gW3ABoTwl6k6mJ3c09fpKECtusey8ELzaXgZphT6OK+cwjMQ
         ucFENkrZSBcNYxb1htpyetDNTzBpssEOUjr4HsQFPu2txfFrNBbyzcYOP6GfaexPFGNi
         +ZPJxYSy/ot6OclkLcmMLPHZgDlrp0kDa5eF4rzuUs6ZpuRJNAduoAp7uRy7OCReEwUc
         zZ2K+XW5pJ/fehpFGFZRR3UiRObcbuUGFOgX9RLUrjRfkaQU8WPzKaEGFErPh7VZ64tn
         U+Nw==
X-Forwarded-Encrypted: i=1; AKwUvBxx324Mav5GwyDlURicsZ6W4O9Ov0FKkHmJhGX4/Z0o7zentqmjJBR4EReSHKjzbFT37It1T3m5+vaQLvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6LsSLvZpOenS+wai2QSb5Zg2id/0QfkjchUO2E+NUmcDFN5gj
	w8u/gb+mBbqSCfap9Kti3gI1OhW3d5CNFjA+rwiJ6XzckCeKgR9oQOUaO7GXhTR5aJegcv091+c
	j7Yc8iCjnjC1XuW0zMb3ng/2emv2Gf0+dnwoFJJjsL4BnSPU1PebKe6zDAC1xi3eEPtI=
X-Gm-Gg: AYBFou2BHWJHDDQpI+LxF23XKRzIfb49Ts7BBslXLYbUZnFRcoKI2M6ATMFDT08F7ot
	jk/BSANIgFhmAQGgsdUxqsyOxkslnd0TcbaIphGFWr3HPRqRq3xIoVqqKKeTGGNK0Ar26Yfesme
	B7EqQwgZ9GXV/Nm1teHZkg8dn/s6G8O0ZxxMD4XXlejHDCIxLPZ4zIOqHgsK3JPAKemC32z5IL8
	5mAgk4PV6lsRUPqPKiKjoLstNqGiKqmGnfcLGmVvzpRXUW7a7Ujf8iwiC9USpuuvLCVuwJSlHou
	pEBl1jja9KFMMJGHubqJsPaK0sI+8uGwfRVwukL6ZsKYk2HpicQVJWiGeBSI6NaNoo4SbeakJvw
	vEo27Ly5z4z6mj9LkZ1kE8QUofZvP8FvRoFd9wjfOWqTr5dtw4JJfGN8hiszsMf0iQ8JzKzs4V1
	3NVIg7JcvtmEBP2k3KEIFD17QFiJ6TU26QJwcxheiU
X-Received: by 2002:a05:620a:8806:b0:93e:4d74:68fd with SMTP id af79cd13be357-944217b2aeamr3041638885a.65.1793877090337;
        Thu, 05 Nov 2026 03:11:30 -0800 (PST)
X-Received: by 2002:a05:620a:8806:b0:93e:4d74:68fd with SMTP id af79cd13be357-944217b2aeamr3041633985a.65.1793877089727;
        Thu, 05 Nov 2026 03:11:29 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488f183sm438320685a.39.2026.11.05.03.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:11:26 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 19:10:59 +0800
Subject: [PATCH RFC 1/3] dt-bindings: mfd: syscon: Add Qualcomm Nord Titan
 CAM_TOP
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
Message-Id: <20261105-ccu-v1-1-3accc4b901de@oss.qualcomm.com>
References: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
In-Reply-To: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, vikram.sharma@oss.qualcomm.com,
        nihal.gupta@oss.qualcomm.com, vtumati@quicinc.com,
        bryan.odonoghue@linaro.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877074; l=1095;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=Q3m2L70QHVhNFssz0d5iHd//KrXi34EuQb4Z/fjKNc0=;
 b=tJUyjpuxFIMXk3yVPv7pWbYsQQMLXi4d1roL6jwFr09gpB77pcSfkPDrM+jz0MMUgdXX+mAHI
 GAZHn2d/ZbYCRjZPtKEwPdztrnqtMsEyEjk98aw5f7HWCUbeyTDslPo
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: m0A9YlZWt6KbdbI8KtfvVsykyQ5PNkIM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfXwkl1KBnsbPKG
 dmVV5qKzAzKIUEGhiI0S++NaDVwQ6W35txEpb8DLIuTQv+MT9KAx+dAsTkTNfDeZYuWyJigL1xR
 pUmplG+ZtGRxP8nBSqJbzAP31ts1wd4Qu8zK5dVsVbG+HoP2ygIpeYmSTSPyUmxTS949KJGcCO9
 +a4UUY6x/zf4t6YrgJmTjOyJp4yOqYd2/NspAkeq8yIXu4y/HGAM8hwTJXdh+sT5rtt+Cp7EK/a
 /PWQm9MYZze7AsjOgHi07q6xrvSXVCPkl8AzUaNNGjClB5Ywtd/SIphHNsAfwDhsoEFGsP7kTxg
 f/L+QLEgFW40jk3G4yLbnIv7/H9LbhC30Z+vx/fZHPZGTEe3MvkKRKMzChajmdyJ9oA+ycne+sC
 D3/voLKmdLOiRlKj/f/kxLzyDK+1lSuAZIddEjLLeOM0B8Zjhr9h4g7gMuVt8bq8duDYmhNFdj2
 txYUysLY9udUDTR8lwA==
X-Proofpoint-GUID: m0A9YlZWt6KbdbI8KtfvVsykyQ5PNkIM
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aec6463 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eQjVoD_657R47FWD1NwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfXxot0bPUwAxNf
 gpq2PojQPE12wf2+xsJoeG2+16REo/pq4uP6XsJKcXYbMveY7Guutl6bs5pHsLEnyR5xTu/HP77
 Yrf7tYbRJs+FWczJHXZHNayHBUqQScs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050044

The CAM_TOP block in the Nord Titan camera subsystem contains
registers shared by several camera blocks, including the CCU output
mux used to route the CCI I2C ports.

The block is outside of the CCI and CAMSS register ranges, so describe
it as a syscon for its users to reference.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 80ff0e1caca224d8dc7d8a0243acc49c253cccea..077c4037fa0ce4f1b93927579c2c326e7bed73d4 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -109,6 +109,7 @@ properties:
               - qcom,apq8064-mmss-sfpb
               - qcom,apq8064-sps-sic
               - qcom,msm8960-sps-sic
+              - qcom,nord-titan-cam-top
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos

-- 
2.34.1

