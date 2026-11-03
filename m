Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742071;
	b=TsmCSw4TkYJ9V88NYkQ++w9PcEeysWrDJuk7nGHegNLWpSLXDX9jHNN5/YAWhDGuJuVx
	 eKqsQlRBC3TyqTZMST4fZWiPBj7zMZaO2gZF5NA14bWWLJ254d4lTZgvuSMRgBSmuKuOZ
	 zjhlSjqkFwdoIYAxo2x28H2E2O9Jc/q0Wjg3+P1uE7+Z8o5HIb5pX5ThTLQhvPU51q7/I
	 NNuje9iJ7cnIokYXgww+hA8fJfVTBtBIZQgD6v7X7RkzGFgLFFdUeNvT5TTIknmLy7Xig
	 sY7RsfPqI1z6VUWVJGowtrN18wamEmcoCes3RN+zosXSol/r94gLvd2kSCr+nV9oA2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FBZe0kZye2FXhpOkWuZpIAh05njeUm5k9vLsl92K79M=;
	b=4xEnSajb9268YN9qAjmpIkFtMtXw/uYChy7rHnCcYKFWVbX0mq9XaSdtENmSL8bZ/FtO
	 sU/i2OqshcGR1wWKsVF4g151NMQ7yLxsYH4h52j4LXtm55iidTbrupVoyBxAUw6fJwwzd
	 VWS2dtsD4sZOq0zuE4kjFcwH5Hb3bccw0HIqfPVRHZ9VtO6z2GjuhclzF6lwtA6bHsS7a
	 hO0bpx9O6GsUy/nXBx+Lg2rKhFPUJSXJFqIZd4fitM9uA0r3yAwDp8Es4Uag4Hvx68mJf
	 LAcu8Nm5DhNGsa51CtoJbwVVomYoI2Ua9b4o4AgXb8D0Bd9XqFY8ZbIdzDnnyMIMJ2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="QuEa/dm7";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mr301V3+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C036B606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C036B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QuEa/dm7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mr301V3+
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LL05g445707
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 21:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FBZe0kZye2FXhpOkWuZpIAh05njeUm5k9vL
	sl92K79M=; b=QuEa/dm7P5SVoukhhECuZxEztHcz1PtGiUEOvQWJz8s8Z4B3D8i
	TjSdaLDvK1iDJrOM0wdQ4Lcx6JeL/qqYtyDdopwrX1jw5o3gBM8GrjSw48SQ/Qd/
	oaRstve1u3THBK1yfMYK3PwkRyLXzGIful4xI1MF5tfOy1IUCtnalgstYRVewUKA
	B1Ls/7ji7bFM1Pek5i2QixfjGlZpZarA8hLBFqyWWx/M9g9SayTLASRs7tuweym1
	1YoYoW4Yw8ts1faneLP7TdsvMUW2zTX5NoiwEemesekJ4xXDRawGOuRyNuEVFiK9
	mmVCl8sOR7ZuTEhntwn6VJg4MiRY03DVAmA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mrjxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:41:08 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1acbaf81bebso106114c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793742067; x=1794346867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FBZe0kZye2FXhpOkWuZpIAh05njeUm5k9vLsl92K79M=;
        b=Mr301V3++3Msw59IN81TQwRi3pRbFjCDxHLzJA2jR8+7VgJZpBpU+mIPCS+VIzQAaU
         EN8Qhl2w+UV4Ow5ah2ktvoZjdehhI2C/cz9yCxRZWNTI+0Y5F6Ou5WKy7/JQh+ozvT1F
         OClHz56ZGFqz1SD+2KeRH9NFOpEbRR59uG+G8ExHCM9iCFaQZGg/FwzQOJWJ65r51vfr
         OHq88MyxLrQrwgqqm7RMI8wdeydsGaszUSePb/7kL0UCHp+c6ty+QgsLC8VqqrbXH2U0
         +ZaKRQnsBr9RI3mcEQjtMQCtAUwI6ns82Vh0HYVdw8r/K19/WY24b6RYhzBOpMn457S7
         0A1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742067; x=1794346867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FBZe0kZye2FXhpOkWuZpIAh05njeUm5k9vLsl92K79M=;
        b=Yg1DV4+6Iig70/PusTQGTsetFTbNHMygTKILgcpre2jpGT6SymO8f6NXy81dgQtv5I
         K42Kcw6h10HKG3+kjJ84zk40oJhs+qa3eo60pyBukGmUKKq5epWBZKTX6FsHoPqg1TQm
         q0B7OkEPBB03uXJRK9xcPjmC1aCQBFYCi+++wIs1leu4FlSpp9fSC/yitN2UXk59PSGm
         QRsO4QUGbhBKwiYGlwjtP3IjSbjRIrl1sBGL3qp3uVhRrzp/DFGGa1GQrPDMSLEi1DSj
         TvM/5QEkZO/AqCY0oisWFYJxCA00vF9gLIhBOdkPXtlqPh9Bjru5CQ5PKa4aKSOEM5xg
         4wSQ==
X-Forwarded-Encrypted: i=1; AKwUvBybS90ibzad+eFcvDiknbzSbiKWbWhUgsvvLpAvUq1oTaM5s6c4ArkkN9by4GFY5DpsP4unxSs1qR76qDU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n+A3QOYrZxhryDX1Sn6f3J175jNVeeCBh2c3Muhk0CjjHdy2L
	8l5Os9kCa1OZjSgYd2TldjD7TjTAQRAwzgYyiBVHvje//M/nLnYIDfd8SuHTjq2t3m7hoxoyE4D
	55a/ujDZb7fQu+HicEFBbo3WaQboBO27RSdO7rJOzA3eQf3RXpD0S3jV/iFZ+zzEaI/M=
X-Gm-Gg: AYBFou0kgOMokexVw4s2ph19UopKpsWNaadYUBiJ55D8vD1tOQYAZV9xYFrB0OxBcNA
	MUAQ0Q2AAihCFzsi7wMeSnq16W2+9161tCqXPd4EZrM6CzAtVW3/+CMcPpz4QS42RoKzFiab9tL
	uz5lQQXNawWPh/RFrVEswdfE8EhQvnzY3mTeamY/AAWqv6KRIJY27c3mE8fCrsGL+LTrIL2YfuA
	Gcj03YqMZz1IVEeTSMdUTC0ZpeXuhyHs1+1der7zRoEK0hcHGmF4HP9bYC6KLCEgYLi0a6+YPWl
	nYjdBP+by6BnYp6FvbpOfRxA/IZQ17XhnPEL6Cftzh8kswUSHGMSsSJCO67Wq9R3mBm1ht2iPUU
	2WH13sZG2/xThXX8FxA4uS1v2/O/bQH7HFEXzkiaROWnGfdk12qN+mti+pi7fy+GibagLzvEtnl
	d2MfJCmir/eZMs6S/hnH670r+/b9U=
X-Received: by 2002:a05:701b:2302:b0:1ae:e7c4:9a15 with SMTP id a92af1059eb24-1aee7c49a44mr14830782c88.3.1793742067465;
        Tue, 03 Nov 2026 13:41:07 -0800 (PST)
X-Received: by 2002:a05:701b:2302:b0:1ae:e7c4:9a15 with SMTP id a92af1059eb24-1aee7c49a44mr14830738c88.3.1793742066789;
        Tue, 03 Nov 2026 13:41:06 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm1537440c88.8.2026.11.03.13.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:41:06 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] phy: qcom-mipi-csi2: Add D-PHY support for sa8775p, qcs8300 and sc7280
Date: Tue,  3 Nov 2026 13:41:00 -0800
Message-Id: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GLBRS-3Sl1xGc1beiGmrGwSOvv9WPcfD
X-Proofpoint-ORIG-GUID: GLBRS-3Sl1xGc1beiGmrGwSOvv9WPcfD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX0Gj+YxatmMKT
 bxH14sqnsyDcFBmnsZ+DBj3KpptkcqizOxi+jh54Wwv+rpPNGmOY9gkAv5kXMfpLev7rW+SOgyn
 q/hlII2Ca/YNuGSPWgIJZArXjPdvLYfQCkvOfjDeD7nMYMtRnNkdYnj2b0RNp4OeShJDkJBQU8J
 ypkz05VeWPV/M/7eSAYz1CJoSIccjtpHjrwO6HLBxkzeV9Xf4SGOThE3AQQFlgB/RxI3JhPO+qn
 Nmam8AR7gn6ro7I0ZzP+7xf+TOl7kqzwcyNlNoD0p/JY/YKUHZdmiojjLalNTWsX9Zmnr8YoRBC
 nl83SunJpYwHj+ymzpAn/rhlTkF/Yr7Cpm8orcKe7ajXevTYVGs+oSg5/LWHCNur/3a4ufrVbKv
 B5exqbWIVpzEIiDTjd7Ql/i7aQvVoDwXXm7bRCWQvGHzmOxtY+3gmmPP3X8bIXl4cE4gpU2Q1bj
 kmy6nlnt600mqBSB1kQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX2QGhg3YLnOqO
 c4nxZci4RsffEYvhshMjyarzCrzbFgZo0mOHwo+ogh4KkIffS/lnXSSV19uahHBTAJP5S8Owbqj
 RHkYy4rKVfjzwNSmdw1ybA0amGp6ZHI=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aea54f4 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=d2CT3yyNdH9avgRve_MA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030086

This series extends the generic Qualcomm MIPI CSI2 PHY driver
(drivers/phy/qualcomm/phy-qcom-mipi-csi2-*) with three additional
CSIPHY variants: SA8775P, QCS8300 and SC7280. The driver currently
only supports x1e80100; these SoCs let CAMSS consume the CSIPHY through
the common PHY framework instead of the CSIPHY logic embedded in the
legacy in-tree CAMSS driver.

QCS8300 shares the same CSIPHY D-PHY hardware as SA8775P, so it does
not need its own of_device_id entry: the qcom,csi2-phy.yaml binding
declares "qcom,sa8775p-csi2-phy" as QCS8300's fallback compatible, and
QCS8300 CSIPHY nodes bind through patch 4's existing
"qcom,sa8775p-csi2-phy" match entry.

Tested on sa8775p, qcs8300 and sc7280.

Anusha Arun Nandi (5):
  dt-bindings: phy: qcom: Add common qcom,csi2-phy
  phy: qcom-mipi-csi2: Make timer and OPP clock names configurable
  phy: qcom-mipi-csi2: Make OPP table optional
  phy: qcom-mipi-csi2: Add sa8775p D-PHY support
  phy: qcom-mipi-csi2: Add sc7280 D-PHY provider

 .../bindings/phy/qcom,csi2-phy.yaml           | 176 +++++++++++++
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 233 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |  76 +++---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   5 +
 4 files changed, 455 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
--
Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
2.34.1

