Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E0B5476EE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170437; cv=none; b=NEDdZk2k/xK8SiNGl/pOvQAEs5v6Rv4uNwTMohwA3wSezNXRiOBQARIM3lJZ5D1v6k9EwKlqmnC43pKpXaInd1+sT149C9ZVXnNdg63iu/k7HfomDJs36QZCUnIdg9B5kn7Ul2eC8Sc8BrYx57sCniYzLIfwITCvmUdkBwY6N2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170437; c=relaxed/simple;
	bh=zq/cUxJYLIyDMxWb6mWogb9O8VtVTaiQSVTSqKXOoZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tGFO1Qal1ozIAMgq4CRYHM3GYxp+k2IzdcKwNE9wmTioL/wzSJ4yViDNOJzOQrl4PalyCuRLOwLi1B5s3xmCjDVNRVEStqcRr+WwfKIe65Oa3wv5qXgfVLUNyjGkbsPsqmZ3HOMmXE+7x1gX+yjN+hVsLKpPYVsh38O+55326MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAOPSEVl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNpRnt9L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAOPSEVl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNpRnt9L"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5iET3506084
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1G9kS+BM1lo
	XoS2V/Vkp+eZL5rIIQukdHlC2YmVzn7k=; b=HAOPSEVlu3jP26sg4C98Q/qO8CA
	z/7sXkogztbByrAMeQ3RS9Pbw2ERmEJ46UTGO1ZnrhZnMKGfLNtszY13lokaA1G9
	Ln+IH0nV14NnY7ETLqGeWQXO9AwRSqaU2Kv9ZXp9d7yJdI4LtDDEW1NmWAXEtp7u
	/98P+uYpAvDq3t5XPhB8KiwPx+ZyKFcv+5AFmEDMXlNyBhVcW0uQJb7uLUwqQckE
	l4mgZTvJ7CEgpLmi9fo2DMkk2LJa55ho5TthHTRdcPmfiGQ2U1+IM0S/VG/CyAc3
	eWOmxg5bahOOsY45dE+WBlcOEhlNag+ABRsn+6i/gORYZ/SjtA1TYaAsWMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r13n2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:07:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb6391e89so35537285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792170434; x=1792775234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1G9kS+BM1loXoS2V/Vkp+eZL5rIIQukdHlC2YmVzn7k=;
        b=HNpRnt9LWULlQdMO9TfAo0VvcOZz11OyNyvfmxfTrO42rAAM/iTgQuCFwp/o9TYADE
         P+ssRpjRpL2VKfK9fSBp35h9kJ5IcymvmdIiPBGaZX8TubEON1DM3MRInEoq7AJyJuRI
         eAD6M+Lm9Uiyq1odj3n8RrPMVuQ3iLPTIWjL8jjHxZ7k7zmj57kYDDKFV8fb+SXDhOV3
         VjjEeVmfnhF3XNJop3bTGEDOufYDkmisYOhbHgdzLrD7DmTux6oI9JKlXHqGtuB/JSyA
         oMAE8Lu6HZHoKxGJvy9u5W0s/FtelJMnpa8cFIBBEy/ghHlYUKQvmm6vsZ7rZbLB2GrL
         hzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792170434; x=1792775234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1G9kS+BM1loXoS2V/Vkp+eZL5rIIQukdHlC2YmVzn7k=;
        b=mBq7yVwlrQ7NqOUBPR1cbNmEGJScVdeVwVK4usUh34NGxhnYWOtS+GAFzlf6hG8GXY
         y0t4VKpMqBOpq//WYaSXParaV/q0QvmHWrG/Y0HqJ9Q7zM6sA6/fk6d/ZOWTa7aBtMCn
         tL9YZlVyJia9nQZciVxxk+7oE/JD/vhrg5OHJtgGso1BZaHLZTQXtUr+Zh/aKc8X1NdD
         cw/y6Uut/DAxlqBRKSLEzdTGcsTiYt316WZW51NkHuk2bwgIhObMF1uLuetn7KXydHBc
         O/aQYyu9LSghD0RrXGo8KBrnaaAp+Bi7Pz2dANo0Kv3GZcu+AINAwg8SRc13Y/foAPG2
         xYfw==
X-Forwarded-Encrypted: i=1; AKwUvBxb54wzTuXNgvYM3kkSn5ccsdDP4OjGKIvJNBQhN4wXomdoa1RV2qwc4ILGLfoavE83CMGFLQjwASrEUgU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSZ2GrVxWU108i98GexNyab1LjLwnGU1wT+gHbWkU8nfrhuTIX
	SX2f5ZBSDlvYy4nUSPMmKZvkKvculyXzWu3QoNBaPIU61+iAXi2Ah7aTpMd2/qEBsnVFMTG4nfT
	WrVBlwz7vvB2pOBVo9FlS64tB/l5tzcM6vTxwDGQxqPKlHAGxuZyTx7N1fl2QdSzwHUc=
X-Gm-Gg: AYBFou2m5jobkwdFX30BchERtQIIp2WQaszyN6DBYECG1yWlU8MnZPKbsS108Vu1ktV
	prvVMxRxTqqzFPN/35jl8diRgam7yvxi3RL91flDCAE3DGDFNMPbOitLog3NiMIe64RZI20uebe
	j3KOMf0sljOmJGO1kl/5s0kZoT1gNG9QVkGWR7g21HtzvTc7t+cnI8zI4l4kAHfekyyuj33g4b4
	tT5Mj5r2XtCOPzgfRooZ11jH3TpzNDcrRH+ClGAgmm7fbSQN8H+BBg2JN252ISk65NjO1+7i6lL
	ZY6tvZn/gHByUSk8in5olKlo/37pKhg/YXGQDIj+0LeV6wlpBATkp7Q7Ddh9Gbu+vsAxCdQdJVi
	4TdwafqzkVAtHslHd2h+ZLUBF
X-Received: by 2002:a05:620a:29d5:b0:93e:5016:e3a6 with SMTP id af79cd13be357-93f29cf1578mr86164285a.26.1792170433855;
        Fri, 16 Oct 2026 10:07:13 -0700 (PDT)
X-Received: by 2002:a05:620a:29d5:b0:93e:5016:e3a6 with SMTP id af79cd13be357-93f29cf1578mr86156485a.26.1792170433268;
        Fri, 16 Oct 2026 10:07:13 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5b2dsm6630571f8f.31.2026.10.16.10.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:07:11 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v3 1/3] dt-bindings: clock: qcom,camcc-sm8250: add interconnect provider
Date: Fri, 16 Oct 2026 20:06:59 +0300
Message-Id: <20261016170701.1504338-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: x6nFhtMiNAPu3E4ZJ0vYzKpSKveQY_XR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA2OCBTYWx0ZWRfX1XrNHHEZD9ZR
 5f1L3SQhBG1ewmwP+t52w6QfjIpq2lFfxwsr6oArlkKBUQEGmOgqlUTAO3tkuC30wuxyCTr4v+k
 0NYGZI8t3uJL9IUrj/7fCaCcp3+EroQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA2OCBTYWx0ZWRfX8QvdKKDXkh4U
 Aq0Uiym/n0EWr7E3C0YCUZTlQ3vXrH5jS4dxYHHkVb1k8hvunRibijSihDEOJVCkQpsS9J/FpQn
 1nTlddC9Nis2h4NT9oAoi2D11k88iAqQLDJ1hgY33uOTF4IqszLy9gqXaNwUUtnDuEHu+12hTXV
 MzdzknW9V/JfkROzbR2j7MDKTxcZtwg6TFG9B7KeIzrwMjTq+LEyeHpxFzqxHpTdZYc8OhSYUVt
 tcJ5Za5iLL1vGZOxLZxUgAWECdLnTkmn2tECm0JmCJxI6550UXHqhHLuSHAy5greMHb3BoHoN7m
 16GZ6ZTJqqw18F0VGUfVJuL7cdMCxybpl5xeJZ0e+PBCbYRgloTX8cJFMCBmkwEvmFOmHyrZo+X
 pzmVt4cAhITLjUyfPaNGK4gwE62gyj4vs7FOklQ37i2cWCi1VXypnXp5yuhIjCyL9GQYjNOEIcl
 IuRx6rwolNS6TS9ZTQA==
X-Proofpoint-GUID: x6nFhtMiNAPu3E4ZJ0vYzKpSKveQY_XR
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad259c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=uGqkbxYduLRlOb2TP0gA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160068

CAM_CC_CAMNOC_AXI_CLK is shared by several camera blocks. Setting its
rate directly from each consumer means the last writer wins.

Add #interconnect-cells so the camera clock controller can act as an
icc-clk provider, and add the camera NoC AXI master/slave IDs.
Consumers request bandwidth on this path and the interconnect core
aggregates the requests.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,camcc-sm8250.yaml          | 4 ++++
 include/dt-bindings/interconnect/qcom,sm8250.h                | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
index 5c3ff37ec0d75..9cc7e77ec89ae 100644
--- a/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
@@ -36,6 +36,9 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
+  '#interconnect-cells':
+    const: 1
+
   power-domains:
     items:
       - description: MMCX power domain
@@ -70,5 +73,6 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
+      #interconnect-cells = <1>;
     };
 ...
diff --git a/include/dt-bindings/interconnect/qcom,sm8250.h b/include/dt-bindings/interconnect/qcom,sm8250.h
index 2a656c02df4b1..96dc43e063cf0 100644
--- a/include/dt-bindings/interconnect/qcom,sm8250.h
+++ b/include/dt-bindings/interconnect/qcom,sm8250.h
@@ -173,4 +173,7 @@
 #define SLAVE_QUP_CORE_1		4
 #define SLAVE_QUP_CORE_2		5
 
+#define MASTER_CAMCC_CAMNOC_AXI		0
+#define SLAVE_CAMCC_CAMNOC_AXI		1
+
 #endif
-- 
2.34.1

