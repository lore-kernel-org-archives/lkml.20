Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CED3E49F5;
	Tue, 29 Sep 2026 13:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687571; cv=none; b=Y4b8N3UJUzY09BM9DAQwdaop/e/NJAUZjVv+TS31qcCe1iAINLeF/LTTAds1+hY8fEHpq6GVW1yqLKz5tVTlXpsKvUXK82efynuVDaz/KlLX08fw+IwqzOk1xeQXQAhQ7fhmLsGg7qtk8mFAO8lkARUAz4YWLpB2FWDGw5nfboA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687571; c=relaxed/simple;
	bh=R4b9DtX7waPRqKh9q1bm2j/SHpznlkCOncbRZG/d2hA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GZE73Hdcyjf6hlQxe2e/YBXQPrvnuCEvf9hEA+Q7yIhhYWaHSSOJA+emiqo40bu2mH8yYdKCCS5bdnEPhghi19+nO+B2mMjL6avRXjaxS/lBga4ysMaEnpxXS8HxACTV8CjByyHXtyKjicVdrHgFgWuqc74VYpmLGQS48bd2WTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuB+12h4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuB+12h4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqikp611688;
	Tue, 29 Sep 2026 13:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	trc521X7AqKLwMpBtOnSxyyMEicsUcO5BlhjCTqmsrY=; b=FuB+12h42KRr5F4p
	TcnLWVkUQqFFilD3zrcz3obu2k7SyfPicVNhgv+/3Gnv8s+rUwUh1ZutZTXXFmT6
	RBPk7ul2BwP/lPP5kqU55u8blo+2kQV5AsS2HlIQu950zlnJkGB+q4dZ4y9xeBTr
	b//1wtBrwAphIHFdh7DLzXrMLQHAZK/jkKBLSejUPAcBNeoKQEl4hfg29H2natV9
	5qPit9eH5SJels+H7+W7sBlqJoqX6u25k97LhehQpsvnJaRcZIDpmjacKuRr8cu8
	EYTn/s2lnpr5heRlPk80MsX6H1D2VZl1bK0UKwljmaljNsuv7hw9rd6AjGo5rEbT
	BgGx7Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4u74n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 13:12:33 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68TDCUJT3989975;
	Tue, 29 Sep 2026 13:12:30 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-arpisain-hyd.qualcomm.com [10.147.248.17])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68TDCUTT3989947
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 13:12:30 +0000 (GMT)
Received: from hu-arpisain-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id 240B2647;
	Tue, 29 Sep 2026 18:42:29 +0530 (+0530)
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:42:20 +0530
Subject: [PATCH 1/2] dt-bindings: display: panel: add optional wled-supply
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-wled-supply-series-v1-1-75d0a83b4b00@oss.qualcomm.com>
References: <20260929-wled-supply-series-v1-0-75d0a83b4b00@oss.qualcomm.com>
In-Reply-To: <20260929-wled-supply-series-v1-0-75d0a83b4b00@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        devicetree@vger.kernel.org, rajeevny@qti.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687549; l=2017;
 i=arpit.saini@oss.qualcomm.com; s=20260929; h=from:subject:message-id;
 bh=R4b9DtX7waPRqKh9q1bm2j/SHpznlkCOncbRZG/d2hA=;
 b=GxbOhx5fkDtWb/N8MujvhLbNpFuV+FKonNQBbNgNli/otHjiMaYwyVUOwNhfXhBc5MajMT8CX
 kLSYA/eNE5SAmBUEYlz8T9QSedfUqO4O9C2kE1eEguvkeMm7mdEM8zr
X-Developer-Key: i=arpit.saini@oss.qualcomm.com; a=ed25519;
 pk=hAgg8uNgzV2UIXcMolGFuWsdQLeg5F/siao+So2kbBc=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXwehkKbLM2hCc
 pJj5fEywkT7yTTyHjOHINXp0k25Uk1STxXIbb3n2O8xFGiEGek1zV+bBsIGL5inCSeT409T2MmY
 w22rT5kU2l9wCg59Sz8szxhtqmd+NA4=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbb942 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Z6GXYWUfbs2jT0iEs0sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX6p8aOLoBgjb5
 zYoXht/et/iNFQ265YqC0MlG1xyL2VDWZDdT5wYDLHHC22om5d/SnLrRVAbEOsIre59MyoGt9M7
 a4/CBYOhHpMi4hHK7PMBplqFLA4H+zSMIjuHjNUX/tOlZWGazLXZbrDNH+8Sx9vSgqRUWOSgzED
 KXDsO0ORWjngcqcgJsWt28XKJ4z3HOreJpTkldqupnnJZiqua/2LYR3U80kPRk9ISdtvJz7BAbs
 DIgff/lp1QhRGyNp3Afs6IBF/RKcHBO1UTsgVjUxItyQQ8JMd0srie3ZtV23utB+qalqiyvWyrA
 P+2UecmOC4M04zUWzUz3GSLuEBh1WxD8BM30F59JDLeDlph/mRMxt964hwsP7dJxX43ifHL/Ksv
 LDufdnsuqVu+g6kw6Uc7ibwwhgsSq8s1y38OhmQDQYg05mwOaa7GDCCr//FUpjZbRWiZxJyd/uU
 wy7pwLpY6p1ONpp8ZSg==
X-Proofpoint-GUID: 71k6SpmfjRGrsLzGZa9b0MyrNkLlnCLl
X-Proofpoint-ORIG-GUID: 71k6SpmfjRGrsLzGZa9b0MyrNkLlnCLl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

Some boards drive the ILI7807S panel's backlight from an external
WLED driver whose enable input is wired to a GPIO, typically modeled
as a fixed regulator (e.g. vreg_wled).

Document the optional wled-supply property for the ILI7807S panel
binding. When present, the supply can be used to control the enable
input of the external WLED driver.

Platforms without an external WLED enable supply can omit this
property and continue to use the existing backlight handling.

Fixes: 447a76a99e24 ("dt-bindings: display: panel: add Ilitek ILI7807S panel controller")
Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili7807s.yaml   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
index ba8c5bbf8ffc..8d56b74a962a 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
@@ -34,6 +34,10 @@ properties:
     description: Negative LCD bias supply (AVEE), typically -5.5V
       (range -6.3V to -4.5V)
 
+  wled-supply:
+    description: Optional Supply for the WLED driver that provides the
+      panel backlight
+
 required:
   - compatible
   - reg
@@ -49,6 +53,13 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
+    vreg_wled: regulator-wled {
+        compatible = "regulator-fixed";
+        regulator-name = "vreg_wled";
+        gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
+        enable-active-high;
+    };
+
     dsi {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -61,6 +72,7 @@ examples:
             vddi-supply = <&pm4125_l15>;
             avdd-supply = <&avdd>;
             avee-supply = <&avee>;
+            wled-supply = <&vreg_wled>;
 
             port {
                 panel_in: endpoint {

-- 
2.34.1

