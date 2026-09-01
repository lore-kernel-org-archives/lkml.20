Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A503C4174;
	Tue,  1 Sep 2026 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270251; cv=none; b=ipItpzhH/3NN/lAApCIrwmrZ8HnbO+zl9La/66HkkHtXz6KjZ3QzQlzHxYROWVXD10U9expDQEpPcNRft/1MaUrhoFs3mRLS8wbC3kugCWSc62bAJj+46Xm3f+wvxsd2Doo1GhXvwvo9yOastAnfmn3TeisTzxs+EUYJucATVoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270251; c=relaxed/simple;
	bh=+PUpjXcAVom34VoZyQLdaCnD7wW5DJtEEF1116IsZrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eIZUj1edBut82RcUUaPzqE6NSfZXZZ7dNYPxrlcvf+vPsJU6FlJv522mjnNMLhFbUivZtfRY97tWjd/tOBPYCS/Vm3t6W5nXJz5WktJjMdPkhEqKICh1Nt+6a/XwrqHHhKNWf7zST8Jhevubid8TiF+i+AHfvZfHBAqpX8uVd8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HDvgsPAy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HDvgsPAy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681DWehA3176245;
	Tue, 1 Sep 2026 13:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZjXq5Qdnp+wBoer5wMEl8ivpS7QZl0w2vKeTtjoX9+4=; b=HDvgsPAyqnwuUdVM
	Xmx/tCAdAkJGFaCXCHvOXyiKerIVClxeUZSNRjGPJf4aANXg5ZRkOn1JfNqx9h04
	YkfgCxDsEcPwZZIlkIWEaUj6WefuGyqrnpt2TLhz1vqQH+JopzCdEjgn9DCgvrTG
	nHzyZTuryCVRJWlSdkH0hPqBu8zj+htyM8MXbiESyy6fvXBvcoffQKFRkGv4bWba
	fmtT+E+2mvJdZ+5rWRA1NRpeXz5NBE6+nCNxNOqquvv+7xGs9Qrl88M6Xo10GKSs
	ZOGJHl6+iuSHG0b0qIWifIQrmTGoF9r2mWXy4oWVURQPAUBXYdZRm7S6rLl+oRf+
	S1qkFg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdynt01r9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 13:44:06 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 681Di4xt800721;
	Tue, 1 Sep 2026 13:44:04 GMT
Received: from hu-akdwived-hyd.qualcomm.com (hu-akdwived-hyd.qualcomm.com [10.213.97.219])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 681Di3h0800644;
	Tue, 01 Sep 2026 13:44:04 +0000 (GMT)
From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 19:14:01 +0530
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-lyra_upstreaming-v1-1-e3a76dc9e21c@oss.qualcomm.com>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
In-Reply-To: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyMiBTYWx0ZWRfX+uxxSYbrusjP
 rpts9XhgiUman4zXTfJe0yzG6zHcfoe3cBCbeT/CFiGjZCOC9+eQ1H1vAevUTRXZS8S0z1sPoyV
 R3zFbVvTyGShxJPceMtJXvp8sFC+g7Y+F4Q8d9C5NJGBSmmzU8cF46pee/EXSpdjRUaaRB9Are7
 aN0rf8MpjNZsiWPGH76eJ/SQKcP3296w6N8bM3tpjr3NdDYFtmnXCzmOwJ9OX49DNiU8x4zvkfa
 g0kcSvF1skehqKz2VxMUSGFoQL3hTXfZ7nG6zNORWfMBMukVRBI2U7wcKmcgjXBK6HlkI8DcyFZ
 hxECltUygVQ5Ax5wGkR8lbJtc/Dpvx/j64D2srnTPws+2qYHT0ifrTb3h0rCsMucAo60cYIrXzl
 Q/c9FyAi6ZkKzf70UdRGYEJlIseAf9wbdI5ofNQ57Jiw3N4O250Gka8NOG+nkEKdvm7B0gsjZkG
 uUjm92nOw262s5ziILg==
X-Proofpoint-ORIG-GUID: XjX1mxczB6jUraU_LdeEevdwcYmtl8lA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyMiBTYWx0ZWRfXzQBsOrqxtMan
 Z4WZRpvaTtMGCOqpDL9cWGW6/t9jkUxB11RXe93EmHgoyCDgSx08VyLsqn+TkdMG7DWqkCwZPuh
 tv6G2kTCK4KBGeWsYqBYXG670Ug/bPY=
X-Authority-Analysis: v=2.4 cv=LfkMLDfi c=1 sm=1 tr=0 ts=6a96d6a7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=AlJ4mZ8uyzwF5_TLCyIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: XjX1mxczB6jUraU_LdeEevdwcYmtl8lA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010122

Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
board, which pairs the Talos Lyra EVK SoM with a common carrier board.

Signed-off-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..ff7775dcb954 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1056,6 +1056,13 @@ properties:
           - const: qcom,qcs615
           - const: qcom,sm6150
 
+      - items:
+          - enum:
+              - qcom,talos-lyra-evk
+          - const: qcom,talos-lyra-evk-som
+          - const: qcom,qcs615
+          - const: qcom,sm6150
+
       - items:
           - enum:
               - sony,pdx213

-- 
2.34.1

