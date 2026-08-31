Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB86B3AEF2E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146497; cv=none; b=g9RGtbmZVfjnqBFjMtQHmB69cRte2N8YgETYgvdse6edt6XJdk4cKg6M/5uog+ftt32L9T8HpmIVr1AQGu5WaCrfSrzmpDv35WYHXFJc70D+eEbipZLRMYY36j8xhMmJYxQHIjOhTS1/Ui1yT8K8uP+9jKHmmUVnt4+9VR5iIQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146497; c=relaxed/simple;
	bh=+8FGxgaHMamhBs90vxaKPN7YkBzTW6Q4tm36P+LSuWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sf1RhHgTmqnmTYuVjUKoYNxhfw0EZfhnW4Pw4JQI3seQbGQHTH4YhMLZy/qsuiXcHBmIbqTDBTjYwlhOM6f7Zt6/9VwspO2ilMcMmdGTPmyP26X087L5of2iqAu6zHkRsE0nOzyPCe8GUrzozscCAgU+KN2jV1DwMYPsZZMIjs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILnf4b9Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LtgAeD6v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILnf4b9Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LtgAeD6v"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1boX62820805
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JAjjQ2CFRE8
	wAZAkPN2FEBSl92C1DE0+0SYWmYdAPjQ=; b=ILnf4b9YEp8NWNBuf71/NXcIC74
	8YunCH2R8FC4qJooYCeeiO5lTDy1ekb423hOwGHc4aHzUrvAFAEoHy56MR/8wcgq
	LSc6ESNiL8L9wQfswXLwKfGaJkaPKgDT7Rwgc6by8HW7nrbYGuDJkiXs5oyQDtYY
	ih5S7YuGhHKLDMXHjcyswFeKY8+jw2tAh+qFHlwISosDun40+rD1uCnfMWaoF73l
	o6hcVWr5JOHB9VM68vJCHgNN7AQbBMIg9h0VAFVlNcZoMmZ+eZhKeYHip3/y8Tsx
	JLvVsqBGY7hDym+8eSjP9dSyKVoreiQCXpZRGXAaRi8kjQfHWK/Z4dHUDug==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdfmbpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:21:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39533bb224cso4124915a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788146494; x=1788751294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JAjjQ2CFRE8wAZAkPN2FEBSl92C1DE0+0SYWmYdAPjQ=;
        b=LtgAeD6v12NZEP168RpDKrx8V3QYQUnt4nt/rGckYvY64yxfRBIMgJ2R1lrF30Tz6l
         q3gm+X7oSQ1bn4YIiRvEbaVlNouaZD+xIg7lJwhiTYsWVoz0ydQlxKcuqt5i6yDwIQ02
         HLyl/k8qHGI1ezlE7RZzsJQlM/wqZwpyyEjF2kobIq7OXOQzCHIvbYoveg1r7Q9GX40Z
         cjrjHWiFy4c+ulWPwn9nPzhZQBhWQG1L1vfBh+PqKt1CbtoA7vFnTL+E6p+0Sefi/j4r
         xMi+TpDxBdkAPYsjOgzX9DlsakTlHk8ELCZfOCDjxyt3H3TI7PHbxs4ZTw66CJ5DK4ib
         2uHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788146494; x=1788751294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JAjjQ2CFRE8wAZAkPN2FEBSl92C1DE0+0SYWmYdAPjQ=;
        b=oYtjKHA69Bhw8laTxYt7waVq0k7cfM64I5w1Nzi5afmtMrwVaJjYB8ZGaGjOgW2aSY
         ny8U2xFP1aHJSVPl/BI27uWKenrOGwPwQCfISd4OVsaUWYxloyYnOi9+22l+M8eS1ffk
         uM6fy9G3x4rw5cRyEwvXZgjwX6oirScasc/OA9yWHx7xelZ4XKywdZ55OyapBiTf+zx1
         AWAU52kargizttUSDUs0Hudur4E47+QAqxGwHDnPgqRKDKpJK9XWnyw7VnxJwooNdSMZ
         bw+V60qeSWKxa8gwFBHxkEWMhep60UxAEaq3z976QLc4oAIuhxAGYKjjZf3OLhvzDDpw
         DsiA==
X-Forwarded-Encrypted: i=1; AKwUvBxkPrJsUZdQt/xvLclN+472a+rJD4qIdXHNU8leEIhMyNBDYEKaUUFiJdXmNcpTOdHI4Pxg0xq16C3fkD4=@vger.kernel.org
X-Gm-Message-State: AFuF++kzTorn5M6c+3kLOMtZYQvvdvak7UGT64/AVwkVtPpnqI8CgLEj
	9aRm0X59ZM3+cfXoK6lvLhm7eoaLiu4DkJcg11aSh9lRfdB6r9V3dfVZiWtekfCzAfhMJZXo2f9
	5gfZNoMZSGY3LsJAjqK6d1CudJq7/T+kN2N3s2r7NdHAKOsZmAXfBO5CWa3iIIghajaY=
X-Gm-Gg: AYBFou3hsjqVTYyga/pW1j3O2/mSq7qmHh3bD6Vx5aRcOxlPcJV5x745SKEnCmbOPVs
	bIxcWU/DpHBfVB2ixm4esE6I5lV5ebN+MAiiex/zd087qQhmTqsLDAU5CTWTAWvz2MZlV8Yrc/h
	o1KDO+k9lT++UgwY9Sc7fTWUv+P9M91tO31vSJ7jkivS/dgFTMP9ZOPysykOeHCLds5cF14rm6n
	Uzc/zPnbTw/vSonGEq8JNhfGCcV6MRPz+3D0ttR6+fRFXbsORVFE8uCKkniYpv7RKbtsMnaWQpv
	Bw4/EerHUoBh0xcfmv8uhNYSQTzpLICzxOJFXQvFwEKhLYa6vZUOitX4ZzwsiG7iQoAzLxy6G2l
	vAxgCnIG5D5+lOOZ3gRJuL7F770XGkQES+m0GyVJ+nPtaMfpjtmi0A71yOiOm
X-Received: by 2002:a17:90b:50c6:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-396d1017316mr38123043a91.13.1788146494164;
        Sun, 30 Aug 2026 20:21:34 -0700 (PDT)
X-Received: by 2002:a17:90b:50c6:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-396d1017316mr38122959a91.13.1788146493541;
        Sun, 30 Aug 2026 20:21:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a160sm25599208eec.18.2026.08.30.20.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:21:33 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 5/6] dt-bindings: arm: qcom: Document Nord Ride Embedded board
Date: Mon, 31 Aug 2026 11:21:02 +0800
Message-ID: <20260831032103.341633-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfX/rUEsOWUcR6+
 NAHfm//8TwU4LhNwNlWiG8MYbFqGQrrrWQQfRN6bglHrjTAXtk8p6oX2AXCA/yA3ix8Y7DG1kpK
 8vlZbT8pnPC7PSxAMylUrLzCMgc80bngm5ukyT+orqAO/U6hrgYmFSZN1OMuQ1zXx/8QX/VeWhE
 LA+XRUbj+uNB9knzJgdntyfYXbaM+3EOCYwyWy+RWOh21BL1L4W9jvlFoc9HmQnzExVuwLt6K/H
 Led/PrEK+hKQANv2cXR+QY/CVMRL0L6zoODhhK476ITjAJKSmzkkpwTvxpXjPQvQ4nzNncBgvyL
 w0+xFzz4wzjXKTVgFr1blqQ5UfYev8u9rbNHrmrkH2G46qsGP7r/RjrvVt9drcnWHsukoDlpZYJ
 WVoPqD4iCEn5FUlHj/l0tMO2EIpmmCl0OuzJJFCEz4b6q+E9tr+a7B2BcQVV4CjK+Xoeta161CM
 dX9ugC56f8xMwcvy+1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfX1dnzzR4xw8EZ
 Qf2sV/mCvLkpkz03L8wGRuKKAtmoG/cNoTpMZmQL97dq4j9chhUWzBKawMRcwUwYKGivjWJkZNG
 XR7A4gcxDTJid18rkS+w4s3o11vQ7hU=
X-Authority-Analysis: v=2.4 cv=B7eJFutM c=1 sm=1 tr=0 ts=6a94f33e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=KHWqK9l8iW_yKk06KS0A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Vn5yZBwMDa-oTS6WnYgKM7PTAXkwJN4S
X-Proofpoint-ORIG-GUID: Vn5yZBwMDa-oTS6WnYgKM7PTAXkwJN4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310026

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add qcom,sa8797p-ride-embedded to the list of compatibles for boards
based on the Nord SoC. This is the Embedded variant of the automotive
SA8797P Ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 198314ddaa84..d2f17bc36f8a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -406,6 +406,7 @@ properties:
           - enum:
               - qcom,iq10-rrd
               - qcom,sa8797p-ride
+              - qcom,sa8797p-ride-embedded
           - const: qcom,nord
 
       - description: Qualcomm Technologies, Inc. Robotics RB1
-- 
2.43.0

