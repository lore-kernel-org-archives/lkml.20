Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A2A47ACEE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875406; cv=none; b=RTaG3UyLQlO8hk4RSusTOJNAPP7xqetw807TOBgOoDukoXEg4OmCsy7o52pt0TwoMa0/1YMzK+Uq1oD189vxJSF8okMenLHtIdmkattvg+hJ7C0EIJtRciVx33FYJjQL3vtnxwdzd5LizVgSuFgjZnd2W2NkhqrrobJILWLyMS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875406; c=relaxed/simple;
	bh=YXk1F50qxeCCVcBtXcFIz7gVKLmlgDjcOyk/TvM7adQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TE0OjYkF/Hn1ro/mJZtapC3jkxRv422nWpSyuHnKPawEYTkeU9CTRIdJLk4DsnoyddN+MMi5HCeDC0LKqlsN4ub+NHkT+0STJwzQXjW1BTvXCThb+JC1WiXDRG/hGykgTNS8o3gBxi4WHD01izctuYjIQxydXMrNONHsCMO6vBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+yFJz80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HxQehHeo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+yFJz80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxQehHeo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20mtA302832
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	er7IVFqOrQhE4gOGxRyz0iJFSCkVtseB/xDovrLGub4=; b=F+yFJz80pyWXdWD3
	jDhFvRiVOUyGZHNlHl1xQNyiIwiFbSyo6acUvRl7BqEm7yVSjOC58/UHa6F2kQBK
	kQRNg+02EkoVvU3pCW70Twc0KSxETEYvG6YieHOKEKGqzFAHRB/GS0RTjflVv7OT
	Tl5FyUK7FjHIT3rabBxGZEFuD8j0zw7wUBueWSkTQgwhJR8QF2AyddAskRbNfbnf
	ypnQmbyzr4YDnF6carzBYKxXmGMKjt5em2iWRCmU6BeJVObty5rCkBBYl/Xki6xy
	abAfTBv2z4Bnig7OVsKF545zaZYvWM1BlBZ5LDG04TAsh4CNk1ejLzy6s28LE+eM
	mritSA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sq9hj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:10:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5410428eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791875402; x=1792480202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=er7IVFqOrQhE4gOGxRyz0iJFSCkVtseB/xDovrLGub4=;
        b=HxQehHeoSWvUDtTilbFZvfTLvniDkUYASwU3JZCh8OnEtz3hBjVF5SdYG0aBtHqLy2
         okw+7GmVj9npXzTbSc0A9W+XqrBVJXU+HYIgIZXwW6WJ2kGgScGDu1mroFsAr3ipEVkH
         Q29aizHxZqkS88C8ynor5eVupKUPNcCojBbTPFrcm7OhcWfnB/6XfdSPhNKfMzYx6yUZ
         y7uNCMjjhBKpYbOrherAih3CcTdIZf6dfnX7VOkI+FfPS5C5J+dzXq4aWAWxOdq2aeTB
         kcru0/8PvDA/0CkzL+09AMjvG8X+Y8KQy/pv4Z2TY+XPOv3MbmG4WW+jQicqn8862tpE
         DSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875402; x=1792480202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=er7IVFqOrQhE4gOGxRyz0iJFSCkVtseB/xDovrLGub4=;
        b=0XjcKuJEIsNSqyTqbOPxsyWbJ0oNScfkaYpzFmCDBj/Z3WZw72FXxNafVMzi0vwmwu
         066HeXLRrPQ/iccE98c/qAVYLlhlgfQQWBVJUJemFTbCKFKvY7374RJzNpAQimOrxvMW
         OyU9KlSRgrso6SBlcvisfQQDMsW4AMB3XD58RDriGBZuoir8EnlPng/d1RoSsWq2waG8
         YRM4EKbyuO5e6KN2LVd3JJfflXQDy4QoT+C2hVJzItCHtQ8aQ0XzlDUpH16OCIw9t4YP
         KrLzRNn0BTatcPBZWltPcKRm1DzD5dwJ5APx73uia5Gj7A6Df+XjzGjw2zAX3+1XAvJ2
         kEJQ==
X-Gm-Message-State: AFq9FYLNTw8+HNqkANOgGjmdjzPJigpWf52c/87AbMKd7NQ1hR5hZdWi
	mfyjKUIQju2MXEMAM1I/lECaT7lJ6pOg3bojHGWSwUiBbSWGV0xDuhXnOpI6joPjBRabNU7Azex
	rDlx8qSBmZyLLlMXpkq5nvk+0e9fBZzSjRVxpj2LdaNhZm653yJb9ObY0hAIfCAxKK7I=
X-Gm-Gg: AYBFou3O+qfEhASSXA/evB1Ay7n+K3jwdMAnb08Wzow7t5WUD8tFfVGFKJYHCMsq2Sy
	mtL/0tKbikaIt/UJpzzEkuJVCzJ8SnyxEw6GXc+pmx1aku2olryQ3JhUFKHnGyQtxKp3P0JVxl8
	fa8pVHdK1cDwm6+iKpdZQgVj1Fz4OynBqsoF6ca0dngk3hj1X4TTMbkrrahwAUqyod8Bcpr1zoC
	pL910m1s1RZylQRSY8Z06I+x3S7h0idi27pHvKKOfp66YQ9SWEi9rRcs50FktDcL3ycnI47i1TW
	4hHiFqHdVsspn/eaIQcc56LjZUW50XwZk/smEG7VR+x33lErZcUUoqKjCqM9CuNnegeaRKwMHRV
	+ayESc9iOrhA9GAHAKbWtWv5OEPBRCC/zv3Q+NJttZ264ecEHl50chEt7ncZCqkR+UJSKIc0zI3
	7gGlZl/CXNNCclSOLvUVXuT1TjkszX7A==
X-Received: by 2002:a05:7300:e5c4:b0:353:5d9a:9971 with SMTP id 5a478bee46e88-3537e088be4mr16581442eec.18.1791875401561;
        Tue, 13 Oct 2026 00:10:01 -0700 (PDT)
X-Received: by 2002:a05:7300:e5c4:b0:353:5d9a:9971 with SMTP id 5a478bee46e88-3537e088be4mr16581415eec.18.1791875400974;
        Tue, 13 Oct 2026 00:10:00 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm46081248eec.17.2026.10.13.00.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:10:00 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:39:43 +0530
Subject: [PATCH v2 1/3] dt-bindings: interconnect: Add Qualcomm ipq5210
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-icc-v2-1-196b219e25c1@oss.qualcomm.com>
References: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
In-Reply-To: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfX2Hr23M6qiq5h
 szeMFLhBdW/r3L1mG5Tr/38KY1mHZ+ebCh/XlYpSVmvM9PBYzIvuEKxNrFpdUOfSnOhM+Qbogbi
 v37fIeDqioK0K26PfLyAObCWtNZPecxQ42lLYvt3OpYHagdQPwc457EaYQ8AhmrEhceDTmrf69I
 nRCFo0bZntUkzNUes8zr0kewdFr9OY3CA89+zERvnnlssQm3w5gRW1So/BX3TWakFZw7Qqp2bdk
 YCJos/wryd2adGkYu2e8IUYXOqEHJgCZTtdB7mHWfmjmFcakmZZ0cIO5imhimZvFSynwycDPnhQ
 ff1G02Lfwwa21nr+sP9lynITiEQcyvHPSvCV6q9N0ynHS8DkmnsYk15ANO8hE3MZW0JTKTG2FSG
 Zbi2WEuAbKRGVdtySr692EsNLc6t473wP6M/G1rVs/fHEqxgUTuc/b25IOFUCm+dEfBZV46bOxW
 413fssYoiJYiY+CJcXw==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6acdd94a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LXs94aH5GLyjx-_FEpEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfXwtqT+0cdgmMS
 6W0C+xbbgnXFZkGzZ2DQiPADTlzK1JWNoxskPWJm6qBDrwurDVM69pBdiacqZ/HGDHf76fG2cTM
 yDVvz6YRrjgx43Ai8bhtDcq6ygngsPA=
X-Proofpoint-ORIG-GUID: rTapwUOL2TgAFx68xXc5XVCstQSFOh_E
X-Proofpoint-GUID: rTapwUOL2TgAFx68xXc5XVCstQSFOh_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130028

Add master/slave ids for Qualcomm ipq5210 Network-On-Chip
interfaces. This will be used by the gcc-ipq5210 driver
for providing interconnect services using the icc-clk framework.

Acked-by: Georgi Djakov <djakov@kernel.org>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 include/dt-bindings/interconnect/qcom,ipq5210.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/dt-bindings/interconnect/qcom,ipq5210.h b/include/dt-bindings/interconnect/qcom,ipq5210.h
new file mode 100644
index 000000000000..90c0395e4596
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,ipq5210.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef INTERCONNECT_QCOM_IPQ5210_H
+#define INTERCONNECT_QCOM_IPQ5210_H
+
+#define MASTER_CNOC_PCIE0	0
+#define SLAVE_CNOC_PCIE0	1
+#define MASTER_CNOC_PCIE1	2
+#define SLAVE_CNOC_PCIE1	3
+#define MASTER_SNOC_PCIE0	4
+#define SLAVE_SNOC_PCIE0	5
+#define MASTER_SNOC_PCIE1	6
+#define SLAVE_SNOC_PCIE1	7
+#define MASTER_USB		8
+#define SLAVE_USB		9
+
+#endif /* INTERCONNECT_QCOM_IPQ5210_H */

-- 
2.34.1

