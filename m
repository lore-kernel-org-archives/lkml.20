Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C2348FF7F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214203; cv=none; b=f59ysaPUQYrhBrgkYcS8SU/YTc6XUTI8qcha82kqUjMAAFFvG3rF4r5xydbsr/QbPS2rk2jCXWF1iotrT/EHeYPwjr5VqimflN71kLxym6YdijHEzyOel90Q5V7TzrgyMbi5gQ3I/kFTWEDVtZCWSM0eZ5KdU0ZH8jc3wVHBzQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214203; c=relaxed/simple;
	bh=BwUtXltowY4TnBr1GJcGDAHCU9wz3VnoxRYwPd5575k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SxIJhNwDu7P9e2BCdRr2Gc/+C7ncReOclcKWRpEKpu8CWEdTUR7bJSGDRYBmTo/+YSfirLIe1vHJXq1tCsFyjtkWrbFrmG9R9wOYOibWQZDicqnhJhi+YUblik1NTC2mRMD++mwFxTT6PJ2ql1ofB3+A/vl30hEn8fb/KB3h1BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dH51bmpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfhQA6aG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dH51bmpx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfhQA6aG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EP13m2178843
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 15:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zN/XtAkfbnykHQBloZ5iJjv7Y+cRd4ccRdiM3rECfa4=; b=dH51bmpxdQowCa6a
	xq0HA1fLvbghJjXHjsLb+F0PUUM1Gde0wYCl1sz9E6SWbzVFkXjgPaDOHoY9hpDG
	lCLmyxDQ+brTadj/B0e78SAym/Vr85dIcEpQHLZUrPlQ3uTzWfAeKIr3iFOpzUIQ
	K3VQrbHjmHxLrneHbcPMdd3UmaZOLxCbZfHEz/7pmTs8T+x7mQ372yTttJDmco4k
	WP9FYbbKuDxcG4EdHGUE1wXR/tVoNawx+uYChb3w7aooBasanUsJq6U05DkuKx/5
	ChJ1h3KsARHcjpxa+uSR7Dpv9q7Tz5pcbR3iNeN8cqhCfMCRVc7PCqIxCHBI6SyB
	sqzOiQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cj60k84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:30:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88bbc27f85cso2349157b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791214199; x=1791818999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zN/XtAkfbnykHQBloZ5iJjv7Y+cRd4ccRdiM3rECfa4=;
        b=KfhQA6aGbUnYalfYwkvbShyeMNcKBexvFDglEaEo8HzsMT1ny3LDFosymaHgF9INzo
         lHD1eoOGpGtL4xZ3ISjFYX9+VkGjjSYdB3QbqeUhEEfPEC0bzLBbbtFu1aSYuTIqiQ2w
         JZiISso0NaDXWVTvuXZWfDa1PjmaCxTjAboqve1rPakPnltLTT0OVQsZBe3PKL8h0RgT
         uWxXL65Dx73SeVVWyewqpxO3c/gjSGnyp6Oix/4rfGtg1FulKU67JRVS8Mv+ZVOG6zkC
         VEmmXzrw5RTXbBqPyqCyHYXLf6gkzPxhBLFD9lyFzX9AXTMMUfFM46C/iyaajfhpzt07
         4NDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214199; x=1791818999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zN/XtAkfbnykHQBloZ5iJjv7Y+cRd4ccRdiM3rECfa4=;
        b=uW4pFmpG2Hb9f2XL5PIh46lrRiajI5fQr6koRoS92XdRTxyBjlnCuuO04ipUf1hztM
         9UyBdhj824NDAI67ZUlB5I0n5+JFyhnz1XZ/98Szd7T+wVD5x2D1dm/2x7D3PWZGG1dy
         iugM7XVKRTjOSbPr6cUVqK1KnXzIdnI4PrFfcO/4yAf+tdg8f3jrOw3+MfDOpMwTASSV
         UYyKzeFSSv4KjHYEeh/LpUw0sgd+YZfK0zcekgS+PcXn0w1Uvo1a/LgQwsA2HUtIPd9i
         qntpYBfuHiwbH0SWA8atF90yzJ1fCEVlYQ02CvunjHLclepWHbXXhW4ye2qFIa0nvQFS
         1KYw==
X-Forwarded-Encrypted: i=1; AKwUvBx6nAOOg/l9i1dWkpoPt3onWpgHGAAwUJi5TBsALZm9ZEwNufVocxOOZarsE08AGafYb7QG7LBKiqv3QIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lPkxmSDYZtBxqfGh6DkD5Y0dwqU9FdMPjgTcda88LozYWkT8tJ
	QkYz793/lp8KYGZcj1S9eethwzftY18ebyd5Cg+Hm/izSWTj7sIinXGp0wSxgXDAaksS3d/F+a7
	2RXalzV3IyynJTvtm7wanCvYLeipBgVs1qwYHaeBPMwpj3aJjSXAPJ1U8vIG7ZJ7zN/g=
X-Gm-Gg: AYBFou0zRbIUjDIiAvnzw4IMLgGK2icrYXddDnOf4PKqR/2nJfgv+5O9PGugtDEg2yl
	UR6evW8Z0iHY/X6XpnvMMuDfqwUNqWGvbhRy833OuDwf7b82BhPSvw7zRNqXauwPaRbnzIlowB9
	p7s0rzCUnK5lUdd1w57Oi8h2mJ85gkn3Ko/YBIqUemGIXMVo/dz3/OO4VEd49S9Pg09DFtGwUz8
	gkLnxnaY+fbCyHMnNxrmLcguObhJCYU5EEkcun5Y9Uxdd+zqBV9viSBnv343SWPuGTqv0T/PXIm
	FZJ4U7niOyJGsKfFlP2qrsp5E7l2kRKfEaMCNvcxp0jBLnwMbfngjMRc241EOgudUwefXlx2IQT
	RY5qA+SgwJRK7caYGdMz4JFnhghbI
X-Received: by 2002:a05:6a00:238b:b0:889:c4e5:687e with SMTP id d2e1a72fcca58-88af3cc9286mr10276676b3a.8.1791214199121;
        Mon, 05 Oct 2026 08:29:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:238b:b0:889:c4e5:687e with SMTP id d2e1a72fcca58-88af3cc9286mr10276657b3a.8.1791214198669;
        Mon, 05 Oct 2026 08:29:58 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c792ce7sm3681528b3a.41.2026.10.05.08.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:29:58 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 20:59:42 +0530
Subject: [PATCH 1/3] dt-bindings: power: domain-idle-state: Add
 system-state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-s2idle_state-v1-1-3c402c66f388@oss.qualcomm.com>
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
In-Reply-To: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791214188; l=1581;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=BwUtXltowY4TnBr1GJcGDAHCU9wz3VnoxRYwPd5575k=;
 b=T256eb3yOc43IOM2WW9e4sYZwSd1iCVH6K4pVsVCqIOMCxxivcG67YBymLdUfsNQvKcZD4OKS
 Cw7wIfJPAr5A8JORGIcWWQRa92/RdtZP5PDmjPbTCq4baSUMp5F45zX
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfXy07CkaLzPtrf
 4dSth6GcaaKuxLd1inQMxDObA6s5/3AQoG2YQhVjdk30urkbODytknVx6sqnJojAO9CMVM2zmUW
 JluYLhTV7Gx6Ir/ExIiNspgoKNjuZjzckpOIIIfp25x/DBbUlO6y1egZeZUmVuWxFqgo/hzFkKU
 +HR07BvZmbj000aDgR7GAuJCSjQRyp3tDQrzoChvjRwLGyuDOZeVK+tDYW482MLVfVfKZjf3oEe
 ImCtGHkrBCN9kQS7czrm3AqJfuHpLJLeZMbIktM9mDhwY7F0xGC8OEOhfEYpHjGDDnMwDVeUmea
 Hc+QpxxJs9zgJtbNVVcdn3b7hDM5qxEJHR4wFi9wzPQl310ziRbQev88oLaRRPd7cn7uzWaKeg9
 tD9jUgyG6v19NiFlYMBszpMEzXZJt3alPnlAb7og0xs9yBYtX6+xOOlFuYCEzFEGjlNEawL+WVo
 PKRzMs8s2Jh7tWzvcGw==
X-Proofpoint-GUID: oEP2wGR937rsBIq7L_xTJaRZsxDqKpp6
X-Proofpoint-ORIG-GUID: oEP2wGR937rsBIq7L_xTJaRZsxDqKpp6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfX3Q7EdbWp6rB/
 +BDTD45dctyp6FtEPG8XFw3wk6tpFw/60nv5JlsKXqgYGOJ48GlNBgVkvJsYzK/cZYjV0N7nwrE
 DeI8WEUFPrvM9mEkKK/YMjVK6ZbctHw=
X-Authority-Analysis: v=2.4 cv=bpTZl0ai c=1 sm=1 tr=0 ts=6ac3c278 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Yot2Wvv7GsybDEU2oFAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050060

Some domain idle states require system-wide coordination and are not
applicable while the platform is up and running.

Add a boolean system-state property to describe these states.

Assisted-by: Codex:GPT-6
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 .../devicetree/bindings/power/domain-idle-state.yaml       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/domain-idle-state.yaml b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
index 4dd4f59bbbec..35dab3cd6aed 100644
--- a/Documentation/devicetree/bindings/power/domain-idle-state.yaml
+++ b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
@@ -45,6 +45,12 @@ patternProperties:
           state will yield power benefits, after overcoming the overhead while
           entering the idle state.
 
+      system-state:
+        description:
+          When present, this state requires system-wide coordination and is
+          not applicable while the platform is up and running.
+        type: boolean
+
       arm,psci-suspend-param:
         $ref: /schemas/types.yaml#/definitions/uint32
         description: |
@@ -77,5 +83,13 @@ examples:
         exit-latency-us = <40>;
         min-residency-us = <80>;
       };
+
+      domain_power_off: domain-power-off {
+        compatible = "domain-idle-state";
+        entry-latency-us = <100>;
+        exit-latency-us = <200>;
+        min-residency-us = <1000>;
+        system-state;
+      };
     };
 ...

-- 
2.43.0

