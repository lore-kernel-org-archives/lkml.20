Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E200503BC6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536573; cv=none; b=qvdJFuWoWh/5jw5TEzLSudRcGX2AID+a2gfRyiAhflUM/xPmA1J8PHs/AJ48xmRp5N0yHrciLgjwce5BZVOjJ178BVY7AS+CQNnQTStYrsJMH8vRC2iILnmZmw8i025ZhTpNIG+Tw9tHshcvDZUnNoVcrjC3g0O+Fm3nqdqi9h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536573; c=relaxed/simple;
	bh=xbR26F+2IK0SwAaQUmAO2+Xe1VwKVtt+NKXks4bobiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r4GobrI/ZAijeaUiBgwP2RuiA8IYXpg+Tw5ZaaA5tLhMdjoHJy6DfAV7b/BvV/3cbHKBsNdkp/kzmPd4gLq4ojrpXvRlUBwZblL0rwaooievmTcDwmkdJHWEZZY4AyTF2kpKfIigSMBNMTgf0OZ6ZFXvJr3KmG76/MPsS5Zsw8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BmEHQOFp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C78XCQ05; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BmEHQOFp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C78XCQ05"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684DglS93719486
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 15:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=; b=BmEHQOFpvXB48fJ4
	P1WQHuWfNgNBcd48t263ya3ZJ3FjhhfBm4wN2SuGwdL1U261fXC64ttaIDYxEqmW
	1oUwVFtMAx5KKiJ63MSHVAfIIC5dNLddFLwAAKvvd7/dM68VDCUGOYJvbrMoCPtQ
	VQvXNTvIcP+CALYLBm6YOhSrWbzs3krdf8wFvIfz5KzB+yKtvZVgwDLF6Lqqc6jB
	7yPUDMc1gl7psTUCFJW1mOXNw9irpd9wH5OpCx7l5LMO1rWtb/G9mTnVB3ZdH3Ce
	+wqdtKMygx87w72zbuR2KGWYJ/2ngYaqJXH7WKzPcKQadp8lYbhcppfN+yytyocL
	s1D+og==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqd2p2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:42:41 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9806e283b0eso866786241.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788536561; x=1789141361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
        b=C78XCQ051C/5zkLm85zxYNCBpzTL6jT/I7Cfftz4GuGn6Uuudg/0AMGWPdXIhRgATv
         FDYluS66mNea4TfdCjsfxSejf2xE/nJ6nH14oIvTRmtiD93fAnA9TNKS1Hxh4O5UC3KB
         VDryFl1e1PuEGC4ZO1ATwQoU8tdMuDyRcCAT4FUcmHJCK2/Wm7sVmHMvPmnW7J9D/3F0
         N4WRujgQ6q4fd+Du26J8oqxF3XRVTJtvhQ8gvgy/oivbfbe5HeAYX/+xejPFsxSb96ta
         Wcy1ZvCY5RRJg0p1I4QQPTLVzAPSmNwqQ9NyfNXW64h+vE+zlS50ztbTZqueXsu/EXUX
         QYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536561; x=1789141361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
        b=npiZVqiVQGtOnqWqyWAyxrlkjXx+g2/QNtsNKhvZ+8oXCkUtiZTdrNxYdO1cQu1/Eu
         mlJWYeadDVJSji3GLjgjlZ+pDvMVqnyKfZzxOErB+HuaTo+PLgIz2FB1NkPHw82msWP6
         t2UDDOnjI8XiW5qUmKVfxmM4rMowhISpzykg8yluLyM8JjhGSXmK5+Pfg7L7zFIHXncD
         J37QUqOozTvxu73AZuuh0hMwO/m56b8kPy5l4Zx4jh6fRv2SUfoAgUNwi4qUoOs29p3h
         7eQSRL76t212doL94eDduoz3/Ae3gSxdkp8h1p7tAC/8qbZ3OUkTeJEizQugLIHTJ8jR
         8rkA==
X-Forwarded-Encrypted: i=1; AKwUvBzj250Tf6GPIDVoNNh2IyN9laGSCBNvNgv/Zpgls44hDLPQlqR1floi6mcA7wvf0RhpUqJM891BSp0sYZA=@vger.kernel.org
X-Gm-Message-State: AFuF++mqVNi68/NYlYqi1jOQMCYioXuPA1TCfqXcoBCrcNzj9Gf6Ogva
	+gw6Hdzw8vVDEEOld0C8tM3W6GT/1cU12Yv25XxcTaIvGGbDsQBwKR/28Z1Dxfi5Cp67Bofq5Cz
	nrOTpwpW1Mudbf9P6HJcuS+jj0nADA2nzujjqvwbIXcN0POfJ5cdhEnFjmg1a74TGPw4=
X-Gm-Gg: AYBFou3p8l2xIeWahkElDM8ezXlmeE8TYyDvxkI9aHghscrsPkqfF24FOmQqQ+5vP4a
	Nsj/bPJKLu+euOsuALzPUerDQKgPbVkCjH/dRc3h988tgdlhtDKLRfz+vJUOawf5jVwjoRHyLdr
	VRYzhAS7nhurqHK8ESbJ1NozbYZ5xiM3lGLuUXkWnouatBQkxC8F1HaiuZPyM6jAu702uQypij+
	IqfV+rOdc5657oPpTQA1ksSZ0/dNAl0psZsOmGQqT/gYg0MalsHn8xrwpQ7s1S8gAMEsUvV5uMY
	8h0mWjIchgJ+viOCl5PrJjS+QwyXPR52rnH+g3nP0qSs9nvEa92kFbb6DetQ6DHS2U1YOWKALsM
	jaAaAeOdIPEuWrwnU75TbH4+KlFkgMQkW4Bsd9RLOY5G3ACKqhTAjsgbFtY4rDfBMfxdrK/+O/B
	ey90nnzonFl6ejoi+ci0qhVeiHCM1Xa6frUnScON3qdM44W6KMGHQ=
X-Received: by 2002:a05:6102:570f:b0:785:e444:15de with SMTP id ada2fe7eead31-78a4a8b86c6mr2764704137.6.1788536561261;
        Fri, 04 Sep 2026 08:42:41 -0700 (PDT)
X-Received: by 2002:a05:6102:570f:b0:785:e444:15de with SMTP id ada2fe7eead31-78a4a8b86c6mr2764676137.6.1788536560793;
        Fri, 04 Sep 2026 08:42:40 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm160668505e9.3.2026.09.04.08.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:42:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 17:42:25 +0200
Subject: [PATCH v6 10/11] dt-bindings: connector: pcie-m2-e: Add vendor LGA
 connector compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-monza-wireless-v6-10-d8c5042b3efd@oss.qualcomm.com>
References: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
In-Reply-To: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 4pxL-JU7YSG16bXPpzJl_qBcAYkTdWy9
X-Proofpoint-ORIG-GUID: 4pxL-JU7YSG16bXPpzJl_qBcAYkTdWy9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfX+CTo1vZBYFbv
 bhn+dIUUQuc3XJMmFTD9a3sZ4WZBoldcCjWvORIfLXKXap2mRYCpOXEyYpweNTXgJhNefnj7PUv
 yeBgnnj+UJ/M83+mvkzDtvdh8wlnkEw=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=6a9ae6f2 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfX1PhP9DXJlAoS
 JQgjEmS0xDbjd4DizdI4qOWWcOhzVcF7qdYCK4ookkDQmPU1IsxLYXn2FFVdlnaX7btquiU0hBy
 9c9QpJON5Zww/IBhFa621Q3iGE6zEqOLaLPReAUovz4wN83J8ckoJiyMGYPEKvAkqae7tvx9noQ
 rqAEmgVs4DsTLJGxy01XC9l5NVbhvhsNzKkk9W926JEW4m6hYGFxD9VJQ6e8l2OGbxsVHFuz+lz
 GJ6BP6AqSDdwvB2oDLHvtG4GKlm1E1DT9o06VF8MK6MKQzs1MAW4D4hqSF1rxJpAHs33vta0BeM
 fwae85a5BKT6bf10rBwmObE2aNQ4Ey/rWoUnZxOfiH/6xq2lr6ZkVEncbL9Ws7emTYZrHs2htVU
 pUCfhWLI++NlAl75LoQiNoNW8gxZhWG1e1XlCk2OBoAEAME6v1PoyN32raeigSxHKcvJ4L1hz2M
 FHf1g5McmSgpTm07FEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040143

Some modules (e.g. the Qualcomm QCA2066/QCNFA765) expose the same M.2
Key E interface signals but are physically soldered as an LGA package
rather than plugged into a real M.2 Key E connector socket. Such designs
are not actual M.2 Key E connectors, so describe them with a dedicated
vendor-specific compatible while keeping "pcie-m2-e-connector" as a
fallback for the shared signal semantics.

Add "qcom,pcie-m2-1418-lga-connector" for the M.2 LGA 1418 found on
Arduino Ventuno Q (Monaco Monza).

Add "qcom,pcie-m2-1620-lga-connector" for the M.2 LGA 1620 found on
The Lenovo Thinkpad T14s.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/connector/pcie-m2-e-connector.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
index f7859aa9b63469cb43919c0b5719c18694c5364d..ce6173a0ec41cfe8ab4a5780940999c18674ab7e 100644
--- a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
@@ -17,7 +17,13 @@ description:
 
 properties:
   compatible:
-    const: pcie-m2-e-connector
+    oneOf:
+      - const: pcie-m2-e-connector
+      - items:
+          - enum:
+              - qcom,pcie-m2-1418-lga-connector
+              - qcom,pcie-m2-1620-lga-connector
+          - const: pcie-m2-e-connector
 
   vpcie3v3-supply:
     description: A phandle to the regulator for 3.3v supply.

-- 
2.34.1

