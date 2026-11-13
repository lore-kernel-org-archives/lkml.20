Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545746;
	b=iJRaA89dYgMBK7EOZmEyfD/AwAA9tyvgAwBV+eciJ0r2K1KG1v2wcxKkUyaKlBgYS5AB
	 D8/RDp179oyKyuswlfHetl8YC31coJrd4Hsypml0csw0sCR609cRkyo0WhTV2soaQJSpF
	 BvgFOUZBzqCZlEbclLx1zx4RrT6OeJTFj7mQdk9cmL3GdcD3DroN9VpeNWWJZh0sO3dpz
	 nRncLvMYUJ3VysPMAl8OtXJbI38geAKkii/ZWUMVX/fU8UQzB+94k7PILHZs5mJdznN/s
	 mFQZh1lyFb8tIkp1O9NemTyNsIXvOLZU8WXiRtib7A4TmnPyu/Gk2HUFoEsqdy1mbkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545746;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=B0xt8hWG1/WYmcd9Rnv9SnmFXfN8wIMxECEAa2dy0yo=;
	b=JrkxKN/ain2Qq1+tPa/6+EH+jB3xFRf9XA6IAUUHry+q5nM1J6TInEhdLjdnQZygpC4t
	 TrUJsU7KmgvFw9UH55DNt5lwCEW1R1bPBxd+cdnxefM0cxJo12Qu9PA41FPL7S7/3vyfv
	 6acbzjcYpSnlihIZsCpFVVJH/5bwoXIj2BTFy6y50wx0GJ3P7fJfhGg0m8bzTFX24NQwv
	 WQ5KYOrTVNPeo4JKoeLoVDFtLsCMkaejOCSNCjCbTyfYNyvM9+ItFmneZIxDRSNvgkk93
	 0AetAS5JYbEgudcokWidDgXsk5ChCIIJE6uLv/Wlmf5IS5yxOSOfB2NZHPh/gggkX+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBWHKYjR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESXWgKiX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB721606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB721606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBWHKYjR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESXWgKiX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K08t3273472
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B0xt8hWG1/WYmcd9Rnv9SnmFXfN8wIMxECEAa2dy0yo=; b=IBWHKYjR26/n0iWp
	tUtKanhNaxhdmiSuxM1CmeOgi8Jl0GWfQ2YsQm+/cThGLSJnrU1jm0MZSwVh3Qz6
	ReL4E+lqlQXpt+109sqtSKKRJQfC2QRwlqk2kTSOsfcA73gAVVONHQyzyfGmu45N
	W1KpNILC3s/+8+0iTfOqxHdWoGWKQK/R6c/7l7WqSmzIHCYHLRKy5MNhjjdymodx
	ZoBIiU5kSX1PjQm2MOpAC1TvSMzEz3CEPX0jTuuD3M0FTda8rUI7N29XZhw6JcRI
	HVWnEwZVthcBxy2flsuliM+O8gdedgRpw6qPsgItANPv3jKalNgnJSDGJu2k1pBf
	NSSXLg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufgrur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:55:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b1a6447f1fso457297a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794545744; x=1795150544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B0xt8hWG1/WYmcd9Rnv9SnmFXfN8wIMxECEAa2dy0yo=;
        b=ESXWgKiXZ3kImN35leqHplE5cVOanwt18FYUQ3LcGpIYE3y4xEvRrtiMsisuFdOvc5
         gmkN8GeYKjhQKdD6ni8I7nq7DAlaG0d7ddLxVD3jbWRqboUMHSEsgInWf3M4+TxwXUH8
         FWXqTyIUerNWmkL//zLWKfVCf5F5SdSnZGUUyRAg0bA2CmjOoHWOz7wkIAn51aWEc8gs
         m2U1qFamHDVFqGUTmEomsXj35BnK4kFtZzqShA6UlL6Dgz01YfDgwqG/UNkc+D5ANeqz
         J229P/52P4a2WzIo7k0xGCoIUSOM8OrXNhGDAgt9xr+8p1shrnD2AmzrW84KVcbmgfBw
         v56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794545744; x=1795150544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0xt8hWG1/WYmcd9Rnv9SnmFXfN8wIMxECEAa2dy0yo=;
        b=TeTA26I3w10AuunvWJLM3rc8gDAsvzncK23IdefazAHkOJusSpX4d6uyD0kCAUvf2c
         nDjb8bPs8urPmvu5sGcdhm0OaSUjnhp9zjj/s0/E1GWo2zm40BqFzmwSbAJgqHBh2wjg
         57KjoBrxjJBpMBOlvldwDWrnsWRbcmPYOardiySzOKQZe48a0FGNZKrqK4p0E1J2HwPA
         P7LYSI8GZ2/sJj3Iil24tSenRdHm/aI55WWbpPJTMPhxcsFbMFrhd5SYDGJU4vI7nL+Q
         Gw1CxgF+Yqv929orh2QMELoGzNeMTt1ExDfkCRDNTvT/28UtI5tGd2VxK+WPilW9ioW/
         o8lg==
X-Forwarded-Encrypted: i=1; AL+hErG9wOBeuVR69+peBZZ5Y1/oMg5E5LAQAc3/YhC/5xG24CviLtsZSP9ZcZ4Wfp39MPw7DWmWFRDDN4f1IN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z888hdHtLM6+/KEbC15XlnrWk/hbT4JdEwrxOE7WDLhIzsP1Yor
	m9VLeuc8S3hHK+PdjfkjPC4mE3iKy0aecdbI/OsaIjCl+/nx7FSoqgQu1LuTrA93vX3Jgh1sXBO
	1A0nZ+dWNQAXt8yHjcFMVZCh4AHazDLDoiOxcSxoLh0SqTbxPbACX4Q2FmAEsDQEjg2Y=
X-Gm-Gg: AYBFou1h8c3wF3ALLiQQoQHayGh6N3EjwQ4ZG8nxomym2uOz7ddNJCbKmF0omqCF5mL
	gfyLHlYWmkYxmqxX2h+ASDkhw6F7GCWTp/47IgqIOvG+jei5FJrRtsUIv4AQlE6OaMF6juQvDcK
	vcbdLu82QHzZYjEwh8KckfY5akX5MOnNo3kSWVuj/P9xDj1E4wCG/RVp1BbpqT5dJCbjg3Rmo6c
	md4Kfcku5UtvdSkEjvdl7QunMfb/0c3ObAcuMI7MyliwJJYx0b3x3bvrzTWa6Va4R/3soqbLzv5
	//4Roin7YDPSnbbkOXqMbzbcGgWqapAm627WVD+JyZe1jhPfdaiC/6PfNbXB5EQ1o0kfYJpL467
	8ZrkwKH9p+tLOTBtNtuldvCHXkq1L0cxOzijG39wqazVUC2764gQX6cBXEQNIGO8k3oamsaxXnR
	m8
X-Received: by 2002:a17:90b:528c:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b1b0a5030emr956408a91.40.1794545744298;
        Thu, 12 Nov 2026 20:55:44 -0800 (PST)
X-Received: by 2002:a17:90b:528c:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b1b0a5030emr956389a91.40.1794545743834;
        Thu, 12 Nov 2026 20:55:43 -0800 (PST)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm7739875a91.10.2026.11.12.20.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:55:43 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:25:25 +0530
Subject: [PATCH v2 1/3] dt-bindings: power: domain-idle-state: Add
 system-state
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
Message-Id: <20261113-s2idle_state-v2-1-ad604182e7e7@oss.qualcomm.com>
References: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
In-Reply-To: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794545733; l=1611;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=wdxVHUH6U/hkNef6ynp8u9yaYLzY92vvK6sKGzYVMG0=;
 b=odxJJpkblgPN0yYCR12PMj2iwhNkYi37D9oCcYCwazdfDbcoy1eTNIooJOFotBYEF2GlzuR55
 5iWFxUUu3+TDIuQpo7JlBqKpQ4LHHcXj4XfRvdf7HLdU0NS1MIZnilp
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: ojFVUC20hTcrep99cCdOPUaaPaY-pkpA
X-Proofpoint-ORIG-GUID: ojFVUC20hTcrep99cCdOPUaaPaY-pkpA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfXxHEsPPgpEaMT
 4SPMHa8CqyOL0Opq19x1kWEDjKv6dPWG04iBaOGfu8XFVYNkLfK3LvzVfZdhXctVo2b0Cpc6mIu
 Y9K5MZ0wTqifUVgcuvWpWE5Ra32mxz4chWOv9izIP2Qov2BmoYrfNRUrgQso2ri0feAn9NozoVR
 pe73kvHLFW5GNWF0Ccc1ZVMrh+P0tDPVHqCTfqPM4bGvTYIrVdVBSesbZBNUZu7GGwWJ4MnDe71
 AaIVLXLdlOYZv4CZC1AZng3QJ0Wsv6EHgJ7vl0e4Xz+t9Nfu/gty/rV/Uz0UThNGkqEBQVP8vSO
 /5X9jPgAu1LEFFsg3NvKwP3cj3E2Vh+UZ1+js2hlXznnp0CcemBVbroMZqjbg6f1NatM4diFsnm
 He3YHdKXf2sv3bnv5kRW5aPz67YWVkrnylbMlatPPGS0BAwMlWY/od95nPiwdmsUwEqD6+IPNWk
 xxnh35GJYvIdPDu8a5A==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af69850 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=Qyttz2GgRPmjqTwtHG8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX6IiqnMkLKhEv
 ManQ9y8/JOuHeejZ+Z62dC3XEfzApiOHOYq+sgjpUWrAsZDfCPfXgmUZEf0DkswH08RCV6ujlo/
 R8Zt2L1IkJHS8AFRhC9nTi0wPlIZJ3o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130019

Some domain idle states require system-wide coordination and are not
applicable while the platform is up and running.

Add a boolean system-state property to describe these states.

Acked-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 .../devicetree/bindings/power/domain-idle-state.yaml       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/domain-idle-state.yaml b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
index 4dd4f59bbbec..b19952f6225d 100644
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
+        entry-latency-us = <706562>;
+        exit-latency-us = <706562>;
+        min-residency-us = <1414124>;
+        system-state;
+      };
     };
 ...

-- 
2.43.0

