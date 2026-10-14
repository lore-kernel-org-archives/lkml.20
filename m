Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BCC46AA80
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960069; cv=none; b=ZGonuvMDQ/SPuWB+W4LWaRmP9dmpoIl96+DlaRo+lJZTdThQAfhXOoREcKJnp3kYcUQ92LCC0prS0s7MXMGo1AKhbfcxVywofG+37HujNaQqekziZmp/hl10uyvTVEchj9jCbM96qFYvMzwhdrtGdgWOidrpix2Wpb7eTTZL87U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960069; c=relaxed/simple;
	bh=PIcET5xqEH41jaQTsugiPmzhRMZw5XGTQcD6Jx0kGeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YV5l4xtHm41NsQ6IqWIaJxOGPwd98P+gFyCQIJEYgKBN/A5eWKOGJD5+SDvehb64BQS+jlu/btI+DiKqUpx8cI5k3nzRqvkvPNBSdexicKvIQSjZ7bm7Ov7DS6XSaOLJ3POMgeUzCOYR63rfWHK79fcNZ7pwOPsaqRd2sAcrJ8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzwIO4op; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkyzBN+S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzwIO4op";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkyzBN+S"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E2Tj2j3001160
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Sam4STI0YiI
	srJHISI1rbh8Msnb1m/tMNO6VpDJtQPg=; b=CzwIO4opk9xxtGALW6fxBkyyO+4
	Eiiqd/6isVcKcXtnAwfifuM/LKFx9K9JvU/QFQp0n8wb/7emfYGUUiH3YuP8kUOB
	pgiOa7Pd5yPG6381zhdG2FLe57lh3NMvVsZNaEdkqncbf8Pg70tyxl4PnCqm62y0
	cXub50VYWSLVJRttps0/jebxXOfpaWKqdb72atLUl8EsEKvPf5to2SBIKo4r7yhN
	+6uZCZiNkLWBz6f+52VdAosOg9WtKhlRp7A4mpz85AYe74QwGXhllkTVyDX9yQLf
	y4+ozAM4GkiiTWxS96MbQC3ZfL7P7uGtOIRh6hJCe1qTM+Od9LdKot8uWeA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbetjxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:41:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso1139135a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791960067; x=1792564867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sam4STI0YiIsrJHISI1rbh8Msnb1m/tMNO6VpDJtQPg=;
        b=hkyzBN+S5tgfvnGYpJNFWJnXDYvSPkO3vypVo6nfpcQRF+JqlhEsV8cY+H0FHqAM7T
         /F+j/uwZv0hqaY++ZShySaKra5rBND3FST/E8aBjY67iNbY8YQZDdEAixZdSR5/iNSdW
         mLF3EyPqtMhzcdFTlKLupJ5L78jAwMz8MHFnZC36KAimJK+lnNm21VJ1JCaJII7KsfBr
         ZOkQPJim7aSf3SdLNYokN95471Eka3PA7jcJypjCYZjd4C+cWEPnC6fZz7J5b0sOU1tN
         TqWwqsjD/zdu0vmBKNX1MlzC/z/NXH3dIb/zBq/guaUHDcVOhgFZjxqsu0b3sxUgNGzM
         r+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960067; x=1792564867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sam4STI0YiIsrJHISI1rbh8Msnb1m/tMNO6VpDJtQPg=;
        b=pkhJxYOoUuAVQM/HfgGRu2I1HUf9XQfQBHSSy6F82YJNgj9TJDAxAleT9exbD9RHJM
         rIkzhU3EzLn+wDESmcZqUMo9s4CBVTsfdNck5WDMLUkjxygoKEdG9nO6CcA8VGLTi3uO
         wssHGxOcW1XiQfXmezvFW02R08KZAkrMtpPq+0HcE0trI1eGcHAnXH9uuAMf9S7yrtYK
         quMZ11Z04MrnxEd4P6ulgCq/RGpuxN5zJyymHhllJkmf1+aJanuVv/LawGDq9Mga0Ss5
         KhGW0rvfd+9jksSSdAxdpC2WVAyNGgDsVlkR2enKNhKyGm5lbUIVI9UcKv9iMSP3jUmX
         kUrg==
X-Forwarded-Encrypted: i=1; AKwUvBzLTsXr97ZYUcYAC6vurbSBifi2uw3NnDN6i6hIa1Pn3sPOUK4aJPeU708H8MuAZ3MXhHNOvwe+xVhXUAM=@vger.kernel.org
X-Gm-Message-State: AFq9FYITWON/zY1Db3AeeHUxsbZrV4Wb43XnCt1sb34PmN5/Jqk/hhkv
	DJYtrOysl4OR32YyH+KDeUKMSGVKpF6VEw5TbGKBLezL7B9za6V5+h8/PvelurA0r3APLC1NeO4
	fbGtWWAIfDW4REwjj5uCimQziq+1QtuWN4GiQHe2/RI4mGNCN4+RMQ+7qSOPoSz9B+Og=
X-Gm-Gg: AYBFou37N/f8K4o91KOMMxrErs8cOG1O0v07PH99xb5WheUnSrjzgfq4Ty2DInr9Gy8
	k15q0F6WL7r5uiVz8DYkDnNne7QzNaeUl+T2U1eu+dnn1TRxLh6vPx1yJm474pgDlo2rTv56eg/
	tSmUeyLFceVXjgWPTZVXRmncy2bFdhBfVkQDia9fDA2X523fZ4PtrX1AIAi9j+3R4irnxAJv8vt
	BHiY+fxAfKStMVhEdUnJyyaOzhYDgxU2h4tjOLNfYz3qT6bYEx1W0TPhaMd9KpYj/w+je2K6yeB
	EucsmfQrrMEhWXsHpuhU4ojscaYH9JDLhr7SXSDmVE0GOR2REu/Qw3wCwQawYhIcTH0oHP6bHMz
	pp5AQQqDWi2tErjTl/IQqD13VDWmajTwFM9lxyLZuntvvAnPQ8pZS1By49q0=
X-Received: by 2002:a05:6a21:6b8c:b0:3e0:b778:d971 with SMTP id adf61e73a8af0-3e16bf02c5emr12926597637.58.1791960066980;
        Tue, 13 Oct 2026 23:41:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b8c:b0:3e0:b778:d971 with SMTP id adf61e73a8af0-3e16bf02c5emr12926583637.58.1791960066596;
        Tue, 13 Oct 2026 23:41:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f518b8asm733221b3a.2.2026.10.13.23.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:41:06 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v5 1/7] dt-bindings: rtc: qcom-pm8xxx: Document PMM8654AU RTC
Date: Wed, 14 Oct 2026 14:39:46 +0800
Message-ID: <20261014063953.549379-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
References: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yNG6YvzqtmbBPs53Z9g0uNN8F5l5ANmk
X-Proofpoint-GUID: yNG6YvzqtmbBPs53Z9g0uNN8F5l5ANmk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfX7pTYDeXxknvD
 f/CU40UOaJMkDwxUEeMlIHXAXAl3HnS0ZI3la0XRBn8IIXlUu8HeJqZDxclAMC9FYKdbjRZ89Js
 NU6urJy3CUwg3C5vZYAOwfSiPYi2aB51j1o6UoDhtqz01NDAIAsEU8idFuhkw7y93C4peONXcIn
 q3e9SUgCXh19AoGYoLZhYQyZqSGqeRLy+P1w626dvv3BDQgqe8uK5KcwOBJtZS3S19hfCSTXA3v
 vpiiv3ko0vhbpz7z1Sq28VnVj/ipUuKXVyEQ7k/lejb0d9EgXyeFz/TRQse2EyJZxxCRFZO++4g
 zXbowTnc9JR/3npM9zVEb1S6nFRSJ0gjA1OIXtRNKJUFXIuCn0b1WdkfznQ729eUhz5+GFPhSJw
 mKZ4yJWocQPCT3w79N63geGcImV37NfdRPzmXMgOREyJvYC4V7IY+1gamSN9HgFnxamKTfqN/lR
 5qtzS8gbJVRlED2Zi4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfXy0ieL0AYHtmp
 tcERGY4INCKyIc3B9g9X9oIZOJxQzgR7yMT4BTmTAWTy0gGGdTxNq2lOoPCQ+9XOPSBW75o4XJS
 ZwW8zXcB89vQpO2WAvpmuEnVXwZIYUs=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf2403 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=P-IC7800AAAA:8 a=CtEaffttSfkReBmhFdcA:9 a=bFCP_H2QrGi7Okbo017w:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140026

Document Qualcomm PMM8654AU PMIC RTC which is compatible with PMK8350
RTC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
index 7497dc3ac5b2..78fa1d5ed028 100644
--- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
@@ -17,6 +17,9 @@ properties:
           - qcom,pm8921-rtc
           - qcom,pm8941-rtc
           - qcom,pmk8350-rtc
+      - items:
+          - const: qcom,pmm8654au-rtc
+          - const: qcom,pmk8350-rtc
       - items:
           - enum:
               - qcom,pm8018-rtc
-- 
2.43.0

