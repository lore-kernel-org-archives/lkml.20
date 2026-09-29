Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3374250EBFD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677928; cv=none; b=BoMObMHf6Q0v5Vz/bZPokdh1Hh8dIkcTvM3nhWcJUYAivDvJeJktYswQoAl+EyGJslbtVFxDdaHrs5ro9ZEUap4c328OjQPxMK23fXclezX/HJdvdb/vXFapll9NmQfZZziQfTnqfzZ2F/pCKWK2SzKd7RUQq7ohF1DJ+kDu5Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677928; c=relaxed/simple;
	bh=BrnO3ltS6NV4yLZtRHYLLWfpk7ArO8G+eEJqckc1+jo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=krVh2zAA7KoqXmj0qpyf2SafRhsDyv74hX1ep9VG6mJ7Jjj/AVgys2DWFtJK5Imti8U23QxId4zrhwMzM+ur5P0u3bebDSkFKWM45qzw4NHgH7Pl8YAzdWStHSDijyTquSgquIauGIOpGgP+oobtsZ5FRiJkDSV/KpvsYIt74ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U3i2SMJs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJo+zuVD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3i2SMJs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJo+zuVD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7U53F3834177
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y5QaZCWfUf8xqRpLFDNwu8eJzJAbsRzrLuo3gbashtw=; b=U3i2SMJsAl7uJ+W+
	pt7ZhXzXjgbPcQSMJqBB1E9OZWeoQj91SLYBR915h50+cG8yzg9oXdE37OBdZmjS
	r/saB70hsbGJBO8Ad9+8m3tiVAlZpz6ELXQNzWVxkq0VMGtNu252Wz5CKpMqS15G
	uY0LTFe5v0zU2Hm08ifhKjbhrMvwACaJVnXz2ux48t0dG+Btdn/E8ytRO8l0/2+6
	Q5xy+LQuW1flJ6Nag3V/3zvADn0zwWEL47BintFK6FW4C5uwXTNLlyIwtlttJChU
	M5whmfI83Ogvfmn7nK2UQzjzv3G2iGxu4e96BiUYJuUfXuD2cVONb4pojrhThs69
	KFF5cQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkj9st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:31:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so3982049a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790677893; x=1791282693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5QaZCWfUf8xqRpLFDNwu8eJzJAbsRzrLuo3gbashtw=;
        b=BJo+zuVD6frneqN98in1ktjZzyt5Px/yng+gdPx6s5d3fF6fa9LC4XETdgozf2mM0B
         qhEIa7sfswCLzIF2/rtfSpnWtJumYOt3AWBXwgUVHuMRnMi0TcDpdhGAP5Y3IuQE7ai+
         mhfPG5h4XeCM+DVbBl9OqIZdahpht9bqoViPMP/cbYuw2qj3EMmr4jnxJYhC0UzYSDTs
         7JVAizMIJo9soLvg01+G8xZNFqRD+9fEvZlx6yaGjoy+RnGIcFISB1sP+eyLYhuIqMtf
         iHmZH1akclxUzsPOGkV3zjv9wgWO1dtbcJ/oSQoCf7bQONAO3XA9fE3l4tuFQaaXLLFC
         OkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677893; x=1791282693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5QaZCWfUf8xqRpLFDNwu8eJzJAbsRzrLuo3gbashtw=;
        b=CJ4Ip8tVRXLDGOxihaFhcxtJ9K3pKGIP+RGXHIsA+789SVJE7K1YkpOn9UHmeW2glr
         vY9T35ihY81tcWs12X53hFwh0MgSJPpgcm1bt+IbcrjoVRYr72NYva4FYjdoKk54oGpe
         i39j0YXpKpGBXa6johyMNVCwGHEACKx4ns0+ww+lKyeJZAtcYmnFkuDkcrPEW0AkJurB
         Ir6ssnotoL7ULT9jzNgS9JBL171PLAL8l4QNDT8MHmIQ2MCIJ9LC+ctBUIQlcpDz9fls
         Q0z7PPnpSFtRduC2iZof0fFSw+2wtsyRDGPwFZ4wcVHj1hO00YDL2V55BIlQy+2ieoGr
         CCDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTR9lcbNou7zI1bdugzVtw3k1tkMkeKhnpGq4Mc/bWZKgpp9JYIZgLOm2UIG6yIi8dieJ0MX8/SDN9RWE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRR94MMb6ltLW9FvuoR4iAr9dNa7F4bwAqGhXWI4K0hIqATPhr
	ltDmbwQdi7d5T/KG2Ie69mqciQQKArd9IRpYYC2l/isPVh0Rtv4z6tUZYQR919nAbr4m2UYC4Kd
	KWTyWqzIDMuYAi03my71QZjNwDjoS2uhRWtOrXA6qX/0JqHbdUh1jM7PygC2NdQL7/2I=
X-Gm-Gg: AYBFou2NqUZwMv0EClMr4ZxY/KEtax4XaMcbHZ1qbON44xFjKzgbhPC4P/06ei95pJO
	3sTVqo96uruegJqnWBW6PNigSws4S6wHyYYHeZzF3d1xAAk1ccup6+k7ZAFu8BZcLhBc8jkSKU/
	+2QhGZMF4+aV3PqWAQEzX7GskoghcJIqY2z4RBOG4Ze/NGf7anbcKxTxbFQnVrC4oi3CPv1ASOi
	VMjFV4EkKiEiTZkQFCep4AiLhVnU8JxtDGgxDoxkeJun6Rqr3qwtDQSuSrPy3TdesW/OGsAXHHA
	+4OwvfqLNfX5Xm9RrfI4zb7pGzAh4L85q1ZdLd0Boew9gx0nqANeLxYwhOYBeXM5BkFuYLRejCI
	HbM0SZ92vRrdzKA==
X-Received: by 2002:a17:90b:55cb:b0:3a2:a185:aad6 with SMTP id 98e67ed59e1d1-3a2a185b31bmr5704063a91.23.1790677892901;
        Tue, 29 Sep 2026 03:31:32 -0700 (PDT)
X-Received: by 2002:a17:90b:55cb:b0:3a2:a185:aad6 with SMTP id 98e67ed59e1d1-3a2a185b31bmr5704022a91.23.1790677892407;
        Tue, 29 Sep 2026 03:31:32 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a492dfc5absm2470791a91.3.2026.09.29.03.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:31:31 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 16:01:21 +0530
Subject: [PATCH 1/2] dt-bindings: watchdog: qcom-wdt: Document SM8750
 watchdog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-sm8750-watchdog-v1-1-ea06d5dc7e54@oss.qualcomm.com>
References: <20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com>
In-Reply-To: <20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790677883; l=838;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=BrnO3ltS6NV4yLZtRHYLLWfpk7ArO8G+eEJqckc1+jo=;
 b=QPEuGA8zylMoc499k6xXt9YD+6EwzvyphC/Sf5Zqh+M+hgR/vVrhTgYHlFi7Tkq+nUdFnFBAx
 TlhsUca1snSA1XIAusr3vWNDMV+hZHkGBaISw8m+Jo1Ic6EFN7PIaaF
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX8mmrb/+Lw9h8
 SJR3CPswKrTpNCk6uMlTwos2LIAfNcFJVgSXpFck4wkjZdpX0UYA1wQAMQRH216RU1wvxoUiUJ+
 A6Ka4eUiGLjn/qGQclGYucs6EGV9X0vE2NEu33bKB6ZJHSQiNHYSDWljI+nCc1gM76GKYQco/9y
 YjzriKaFrhRAW1umla6Xde8h13csRPnyS5tHWluBb2l8mu22YFURvypu44shedYW7a+fx0PNudQ
 AyXLNfH9ff9BPeV4p+YVjFm2IxFyH2V8xfw93Jt3BTJsN8+QLSjez8zwASywtQv2j1ySkAqu6jk
 ZPahmHLtuaEXn1STxgn5ltKD8f67uR3ctOxIsVM0VWw+Jud5G/nsdMdq/1nOztrcyCgEbiGrelL
 0yrqycifpl3f4OMn7Bffov+ORa0319+zc0GX5eB4zJR5GqXHVBx35rlPOBWBzJs6m4ASxPKO8Jf
 fNZMfI4hItWInShFWkQ==
X-Proofpoint-GUID: gqjcCNRMKg-jOihXEYoEP3pcyOuMWZAT
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abb9385 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-pL1Pet8fDdhfHljwFMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: gqjcCNRMKg-jOihXEYoEP3pcyOuMWZAT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfXwdN3RYHRlU1R
 jFoADenJaUEV2TIrd0MMy8arsDxl925iqrLto8kx8Krq6CJPmj8gZd53/Ou9P6XQD+T1jF4gvbh
 36tTZMmr11IPlNQc8vdEl5cQBA5j6s8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290041

Add the SM8750 compatible string to Qualcomm watchdog binding.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 4ff61102e407..8cd8331608ba 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -50,6 +50,7 @@ properties:
               - qcom,apss-wdt-sm6350
               - qcom,apss-wdt-sm8150
               - qcom,apss-wdt-sm8250
+              - qcom,apss-wdt-sm8750
               - qcom,apss-wdt-x1e80100
           - const: qcom,kpss-wdt
       - const: qcom,kpss-wdt

-- 
2.34.1

