Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977334;
	b=Vcm+ZYI//aolPDRKwKRJ7cCkR6Oiyuy5CSO2bunPAE1Su08YA8mLXrPEtGrehEGhC6E6
	 4f5TEoQYf9IAxRIdIKpvRiVs2xzRfJD1SCVKvAIk+aDEbW7YtFyzYPfmC2NCNMOloLIXp
	 jURWSbg2/gB4U0kGyhfMzhPqWpMa1MBNBy+swiMKz5yc5dHpOxQCGJoWtFEFLbSQJAQhL
	 qZqZwHUGqZjFiYl59SFLox8SSDGqZA0bmeOrPuFC0mHnZRZU0ddYW7mgp8cOGAPak0kf4
	 5FxY4s+S3Pq52mLA03MoqNI41xZjW5PX/2Egz2/zsaPhIm7oaz/XO7/G/ISVli4+9vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x3QLozfCyQOXqamzqmwUwQlpNil8HpltlRmIUwTug6E=;
	b=ODqvsOsB/UBlV0Ebf4uHYtAPcbRYvAPD0x/Kz9SdIh+qoQO2JOdi+ST1QkWLcnaLkLjI
	 F6kv7eSNAiActdvExVAs95mVFQ/mxBJO730DLH7gOkVu9rxkyPzCbsHIFPTprhSI83lyO
	 s/K2TtaQSv/zrO28qnmUJf2/1VP4Euh95Zfn/+cDQkFOzp39JrZnlJNlhcT1Iru7Uznne
	 6QUZ0hAYvXU+56iDnofCvkkD0oVKjdg9qOQpJqB+rj43cx16WCrpI+O8FZC7sRkmDraIx
	 2VN/T/Up7k67Rvtp5zQjVaG6p24n1ja3pcqoqAIScxmdJcMMLrOp8we4n7hvFd8ZVGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xbh7m8ur;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fXfz2Dig;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B75606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02B75606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xbh7m8ur;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fXfz2Dig
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F08Ux1122073
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 15:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x3QLozfCyQOXqamzqmwUwQlpNil8HpltlRmIUwTug6E=; b=Xbh7m8urGrHgjcfH
	C9Jj0JDKyF6sex7I0ecYyn8uOXYx+Mq+2o+q4OVZsIrRVYm8lvV+6wjoFJ8ZO0Hw
	gnGiNk4ZEi/a1e04is8cN7Wd5Dq7bSLwQXAebb3nxwvttQ8QGHPeJxH7uKPdolIL
	j75jc2Y+SxwndaEORzmN6/SDKfTvbIf9cXwHSqTpZILgpvqnrL6bOFD6xRBK1YjL
	ZJtMTjD6SPQhm5L7U5qKKpnW2qn/gGNOFk1t+CYjPRvvn4N3XMDlwu5BkoTZmY+7
	RtcHSR9+2givifm7yIsvFpecrhf/4J0GOmDpOVnlCeN5OavnN/fzVN+XSII0GZix
	Hmhsug==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u8y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:02:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a3ee64bbso1488156a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977333; x=1794582133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3QLozfCyQOXqamzqmwUwQlpNil8HpltlRmIUwTug6E=;
        b=fXfz2DigYC9W6AZStwUIvED5E3+G9TM3hT/6b/mXMa3Fw5VUM4LqVETnXJAFTvuPXw
         iXwUURsT7GlR3NnH1ifiH2e+mh5qnA3R8LuNXAW9zORo5vExAx82UFfIY2ZoxrViSRU4
         UTCb7nOOi5MWhXfJ23EnaJj+04+QHVMvRnd5oK9hhar2/Mn7Zt3uUSjcgOmrBVkhbVjz
         DU97ehRMM80KqWdEx6aXURIDeWJh2DpWH1P9c8H2UcCq5ygG0sTNkhdUdLxmqMpVPs6q
         MrqZmdpr5aQD5gx8ftw1JfVHE5iadgBg3N4+1Lt8bvqM0T7Tan95yP2ON2aJPq5MFgW5
         jKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977333; x=1794582133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3QLozfCyQOXqamzqmwUwQlpNil8HpltlRmIUwTug6E=;
        b=vINtoqSvu99H621o/yJXWPTvC2ekFVudJ0ZbBtaEg9Q+7bCywQNmpO/yv+7RYM++Qc
         nAd8G8Oo9PLbcx6wSyq++DKutiQbYN51ZhiQ3GvZyq7EpbOi3FR4xouVV1OYZoyqIMY/
         Np0+JU/6jswlBXtC6r6VkztnjFTA5zAkoMM1bsUGYKhIOd9vJEl918gNXpaMWqogWyln
         FAjVhum4LIt8Y8XM78PePn+1z46aQcR3j/dUIXDddf75KPRMo43jJw0Isl1dHXggKMNq
         NbVCD2T89yNMKiuJz8QWExrHtkmM9frLG8ACr8vlOflLJjiGaRo1aC4dsVvsmcsoeVsR
         Mxyw==
X-Forwarded-Encrypted: i=1; AL+hErGcFdqTf3ZwsaBBZbKfOftjAUoIBetZf0t8iFWjp3aY9nUM8b+eC/usQw5eKpzGzTL7n75HP/3q0/Kd9sQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z87LVXRlP6R4Z6hzaCecTZIC8NP5r4imCmf41zznaSkeg93ydxM
	naQVjqqGI6PeWdrsHWmxQKdAH24TZfAgSPcCc6qxu/AW+WLbpSvl24VI1GAszt+hhilRDl1W8XO
	SgAz3C1ElaS5enLhc39xbEIXNLmnbKdtNBp9EQk6hGKXzjutgSdbPWQXzvpJk62pTmUI=
X-Gm-Gg: AYBFou2aDsIzq0cj65NKkVYJp6QuFq4VzKKlMbYQwd/JEO36K9bO5VK6aJ38lg8hyl4
	m4VA1nufYn7XePTTmlBGE62WHX32bebleDuzqa4uVnh9AgC0wxuWZGV4ik0aUvXxeAwKr6DRnUE
	gRdJXHJj/asqKgn/w1fHYG9m4Bems0qqbEpJRwuu7j7wp/XTyTWYWJQBUlcYzwCyKcpCrXZOBno
	3CvAE1QZvO3WAKIDd9vW1Ga5v5N1zYqI2MsGLVUuEKNXeHbTsM4uJrKWpWKsJR/SBjHqda4nuGt
	O7umCVsamV3hW5ug2tfyjVIb+91qnpODO/QUjOKku1Q/iOefhmlVgLh4eahACde/bXKoEQxfv/z
	J+sYZiqJ4rpcy6ZaEJ26LMMa5nSsYRpZRyHrhwLFLzAO/bCxQ72rjItCDLdMJVlkdQLapPMVzvJ
	Vr+FyZppBC
X-Received: by 2002:a17:90b:580b:b0:3a4:b418:94ce with SMTP id 98e67ed59e1d1-3b0db5f6fc2mr2667444a91.1.1793977332427;
        Fri, 06 Nov 2026 07:02:12 -0800 (PST)
X-Received: by 2002:a17:90b:580b:b0:3a4:b418:94ce with SMTP id 98e67ed59e1d1-3b0db5f6fc2mr2667408a91.1.1793977331926;
        Fri, 06 Nov 2026 07:02:11 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:11 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 20:31:21 +0530
Subject: [PATCH 3/6] dt-bindings: spi: qcom,spi-geni-qcom: Document QSPI
 support
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
Message-Id: <20261106-qspi_upstream_series-v1-3-21f43042dd60@oss.qualcomm.com>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
In-Reply-To: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=1658;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=C58xMketS0t+z7bSIzaXbo2bSN49O8Fa6mvoWIRxlbM=;
 b=f9X8SstJaOTh1ZHqgsSboJwCtiukraMhFpa6kFNyRXhI0Nml5kv+MfcVpiY6beP6mpMSe9ePB
 g5MiXbB63ooDtkpJneWzUOrCzhZm/9MSz6TsCXjt2M5nAG0m68MBcuW
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX6u35Awpnxvql
 8prc2YcA+kDh/JmONuLRwONgPasA+8kHExxE0Nu+Ce865AURPUGIMnygCF+9XoQxdF6Dtr6e9aa
 q/ndqfApo9QeL3lVNTG9yjtvhAZa5JU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfXzVDQ8NxOhR7e
 jgV/LQWBx9RkixJ+pCAHolvaZSBEg3igFiuTn5458ZlyVnXoKJeA6Y89103YlErg5nT3CDavTfH
 0XejZq7dIqheShoBJCKqM/Nvh2eLJDG/70RWgxgtu8hvuii+7R7MQi7P76tYq6mP4LZfllEpmU0
 lESyhnmbRmERAteuF87AqppliookOU0mLqmOqpdm5o7kMK217QntmBfIxIuUzWfYLQqGDVTjO1T
 do4eTuW1vjjbK08IZeRPyKb1TZdIHOxevtnmBeb3diB8a2kOb3IA4chhri1Na5QgyqOg7Prz0+v
 dGNetD0Z8MKhWODEsgYxXySSNT058LioS6pxnISDcEaF5nZdnf2ut8MlbazhQa0/109/uI3wLWg
 ZshX3lz1Sn9wlnQ81eDIlMJSl0EkHb1OGpHO66B91ujsrxGs8yop3h8dr04G0vgEnYbDpqicXxP
 g8JY5wqaj1+BFyvG1Ng==
X-Proofpoint-ORIG-GUID: GzEeBPWgZQ7hvqYKPstrnkn682TdqKb_
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aedebf5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KUikZgbwDMKjgD0mul4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: GzEeBPWgZQ7hvqYKPstrnkn682TdqKb_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

Add the "qcom,geni-qspi" compatible to identify GENI Serial Engine
instances configured for QSPI operation.

The compatible also allows the driver to select the appropriate protocol
firmware when the Serial Engine is unconfigured (GENI_SE_INVALID_PROTO),
distinguishing between SPI and QSPI firmware.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
index edf399681d7a..e568b67d077e 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
@@ -19,6 +19,10 @@ description:
   SPI in master mode supports up to 50MHz, up to four chip selects,
   programmable data path from 4 bits to 32 bits and numerous protocol variants.
 
+  The "qcom,geni-qspi" compatible string identifies GENI serial engine
+  instances configured for QSPI operation. QSPI supports transfers over
+  multiple data lines for higher throughput than standard SPI.
+
   SPI Controller nodes must be child of GENI based Qualcomm Universal
   Peripharal. Please refer GENI based QUP wrapper controller node bindings
   described in Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
@@ -29,7 +33,9 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,geni-spi
+    enum:
+      - qcom,geni-spi
+      - qcom,geni-qspi
 
   clocks:
     maxItems: 1

-- 
2.34.1

