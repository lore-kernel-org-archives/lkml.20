Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1485187E6;
	Tue, 29 Sep 2026 13:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687572; cv=none; b=f5Y3QbrP4VMajgJW7QhAFBdeiu7PCkzHf8XaETi9Kdi4u4QN6CMfglD/50R9qAeQGaQEsQsuF7qe3W3RmhrNZO4uO7UxN9AqXESerzB9PUg0N8fMmRYhMVB5FXgEbWvFdBRgWJ90sPhrIiflO7+PsF52sYj8epmI4fMMppnqMdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687572; c=relaxed/simple;
	bh=ki0VNP27r8CCeuRZhBWQNEEGg18y8R+TXPLR4JPvapo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=akeuAt0BNQ1IX8pm83D+c6guibidqkjSz5AUhDgjHWE+rk2ocfdCclYpowzE2r+87p5LdOjWqLAfmvGbeDSPFJj/sGL42y/rKEBpTD5zT5ZAi4q7UDNpxwj6a2CCHDe4qD+8Sc9U4MKgmS+I580oZGe6JHloLBFO79G+btJ+0jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ctp0D9ol; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ctp0D9ol"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqjh33842845;
	Tue, 29 Sep 2026 13:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7mTcqg5DtiRYaUvs277apgafMvtCbaDdaoMSgwqVxSI=; b=Ctp0D9olRyK4beFb
	maABt5BW7qluozPv/YAzYckXlj6lBKjf1vl72SYMFLJSaK1lqxNs7QpPKYelLBC6
	MQwqSUVZMpZ+5QpnVV4qnpy/aiaGpILq7X2D1+WpzrXRL8HdQ3Uv7iz6RESZjNm+
	ZB838+CIb26eKa6WbjIQ+RoR/AxwcjnUZVqY5eD0YG+FpYPgjvG164dE+G2HuNv4
	JfiUbpML8VFYXnp3KCTL/H/0Xwli150t6PF0wIjD4wmLbrGZH8YFXNmBhBu8236j
	KNxqX+I9V9H6qnPsrNSkLtgunUYvy6ybXamQiOEhWesd7yaeTwQV6082lbV6ChR/
	dLDngQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0v8u3w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 13:12:33 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68TDCUJU3989975;
	Tue, 29 Sep 2026 13:12:30 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-arpisain-hyd.qualcomm.com [10.147.248.17])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68TDCURF3989948
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 13:12:30 +0000 (GMT)
Received: from hu-arpisain-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id 25AC164C;
	Tue, 29 Sep 2026 18:42:29 +0530 (+0530)
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:42:21 +0530
Subject: [PATCH 2/2] drm/panel: ili7807s: Add WLED supply
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-wled-supply-series-v1-2-75d0a83b4b00@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687549; l=1056;
 i=arpit.saini@oss.qualcomm.com; s=20260929; h=from:subject:message-id;
 bh=ki0VNP27r8CCeuRZhBWQNEEGg18y8R+TXPLR4JPvapo=;
 b=27z2a6+57rhxI7s8P4ry4OF2YlfdkBqh772taYGZjIOI3GIXm+QA6A8Uj+GdQIiIT2ukK8k+b
 vCaLpVEq481Bq8+jutYKjbqLkUv/hVm7TXdrXA3/cqHDsly2KX1jKqu
X-Developer-Key: i=arpit.saini@oss.qualcomm.com; a=ed25519;
 pk=hAgg8uNgzV2UIXcMolGFuWsdQLeg5F/siao+So2kbBc=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: zWtRD5UKFuUxtXoHJIz1FF_AZcEls1MR
X-Proofpoint-GUID: zWtRD5UKFuUxtXoHJIz1FF_AZcEls1MR
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abbb941 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=jW55Y3fE0F-X_bk4AQ8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX9JUdkbhIjX9S
 JMKZUrb3c4YykeKYhHkHiLlkxphKbPxjw0igPjVa+duBWRYoNExMVgSGKm+Kcsr/oTWzS5F67qC
 ogTGApi2HWwiC+/PzE56qP3EDRLU7ltj65HHuCgr6HvbvmqrxMBHLApcSA0MFdyNyr8K24Xva6q
 rKZ0aIuOOZxpKnV7oCCygbDIc4pnFHyaxqAKZDEruhhrXtl5MbO4lGMif9h6HWzXZEraAKR535z
 ABtIM54QbbbDlvpi6vPp1hQpHCOT2V0QKyxRKUdSBEPToMQhqTLKxJRSkH4RHsTK4z7+rgrdpnU
 FTPd326AZtlRhZ/GuMBv1AziuxdRTStM0t8WLj4olqM/rJqu3XfjjM56e5kCCt/qltvDS2/Erqj
 FARZKHlSEStGkr9bkT7Sfk5t3SRJuhgh5mY0i/8xw639ofU0Nof387cwG406hsQZyM0PI3+rNaH
 sJZCTkb/b5NleDivOXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX0H7hHeOj+88z
 +VUco6v6Axp430qtGZHRFtt06Z9SZh2IY1KQ9VaIQ+WWPIbffZ7KgnC1aptv1afXk7NINbeCMGP
 hJuqzBwa8JfdNyKBs5Ho5nr9NpAIwMc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Some boards drive the panel's backlight from an external WLED driver
whose enable input is wired through a supply, typically modeled as a
fixed regulator (e.g. vreg_wled).

Add the WLED supply to the panel's bulk regulator list so it can be
enabled/disabled along with the other panel supplies.

Fixes: dd7ec83f4567 ("drm/panel: add Ilitek ILI7807S panel driver")
Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili7807s.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c b/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
index 12b491b0bca4..eba74f2677ed 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
@@ -38,6 +38,7 @@ static const struct regulator_bulk_data ili7807s_supplies[] = {
 	{ .supply = "vddi" },
 	{ .supply = "avdd" },
 	{ .supply = "avee" },
+	{ .supply = "wled" },
 };
 
 static inline struct ili7807s *to_ili7807s(struct drm_panel *panel)

-- 
2.34.1

