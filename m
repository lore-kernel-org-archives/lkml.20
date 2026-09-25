Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60583AFD1E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315343; cv=none; b=FYc3jinFvKrwSW8BNyMbPadKIvtVAREAEKPxoKrMLn7YG/ud3h6jSSTHHtdZ6i+u9NUvNp9pULI/01GqamMgFolVtGRrGJcHdg5hybQwPSj8isDNq4OzqZ6wXIrngFWBIRzL1uTsbkSD85f+/4D/RqUAoRKz6PgG5fGkw8bXLlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315343; c=relaxed/simple;
	bh=2VQKFd9S+is1roxFQ2w3VjF1z5t1br3J1sxIby+fveE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W3uh7k4Eq/YQmjN6Bx3s/+Gjn+QhPEbqYK3JPBDGKmAYzmRWHthCueUeP1h0+4wxhK7QSp7G+4lu7+zNFS30fmO0E7Q68tVbH4dPgbj8GDxg2WIe+mtI2DgyKYYKVYZWGMuBuOc7L7ecfhfODJkyTxTz5ZfKxD+vMlzgtXTd1vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EORTa+fU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WlztXSY7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EORTa+fU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WlztXSY7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YWhs039598
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EnZrBCS4to+L5xHvaUhf/5
	MW/QcwVf0mDlQuJ/K0HTs=; b=EORTa+fUyEMsb3cxYwtNXsD+DW17DTaXQAYZTG
	TtFBRrjF1/hOgRp3X9XkwESqdzNQcvtOA7M7XX/QBWgF2RolxL7/zpfgTthOnsA5
	l5EMXXSCRwiq1pUgpwc0umjFm6wv9RyXQ8VOMVzS6JaCalzRIy3E3bxnmw9Y0wJ1
	LgSXZXbsqII1Rb2HhLMBvu8QEr/9VEmQ8VduSstfFer4hR9+Of8GcUfl08bM4UPu
	d/1Jvb5kRHXoQQuifGPdN67PUlEJndrSa0N5HY/az/s47F4PJcbb6RvirMLLaJ5M
	8RZWMmG4ljWJXveQel63tnk1pR9jmGOLdeCHyKcrTANNGtdw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw4653dp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:49:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-342138eeff2so28552eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790315339; x=1790920139; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EnZrBCS4to+L5xHvaUhf/5MW/QcwVf0mDlQuJ/K0HTs=;
        b=WlztXSY7X9G4UhSHN3eZwF0oiwSS586wqcx7IqhB2ljBk8hqtkMdnrW0AodKBYOtgs
         9T+mYRoW6MgmLKCJSWdyjmSz+NzUzzlKU0Y5E/BlTzk4+RsjyMqiiEfcUMyT0kuK4H/d
         UUH5UfOMKr2z+toNGU10IBuePdMhkS9vX/4LlwmiQDdC5ZE20nXIDQs4a6qLhMYT+fsL
         YCSwI0i7549nuTTeYe1FB2bZQAb0gaiNR5zHd9zT3Z6YzgYBrtfpPew8Wx9jGRtVuK50
         09Qt7WBJniSRUPUZG2eRVmiwO3tP+JuiLyHuqpE25RtGV07qZ+QVbdhJBvBWU8yYl2ib
         Jg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790315339; x=1790920139;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EnZrBCS4to+L5xHvaUhf/5MW/QcwVf0mDlQuJ/K0HTs=;
        b=lIpEjQh0LkRvgib1mSP4jAYJlrIf1m20Y0MKRjy03VLESTX4N7XUKUjSNe8RNztmBO
         is3FItKUO2ne836E9YHy7c64pBT1GpDkasdyIRWV+CPtz9GCHOeDdl42mmcR0OPwY7C9
         U1poKALH9LVC//90grSg0ccw+0cYbyoLfbaFH0AN9/vxZV2L94rHjIPqouzYe5swBjj4
         dLJlIIBg6wO++4cqY7yt5N6+DrhfuFpSDN+7SvoVGeXkvQpqgIcllCLWGYCj/4h3Z/vs
         7POB7Iw2xL+ZMBdQBRYITPh10mQFggnhrU+hsW6/zCzBGSltFrxkYvkhcdnq3g7sgmfj
         Jhdg==
X-Forwarded-Encrypted: i=1; AKwUvBzCZ+Yhz45ih444ox+/T7qmbS2sXAM05fQcF6c53rXAYzc74A1I+06Dn4tdBoQXwkqedmfo9nRFil/UTM0=@vger.kernel.org
X-Gm-Message-State: AFuF++mvF9aJL48/pPPZC9c1G6wSb5K4Q8ABUqjEMBCfZNnWQ7zSZbyN
	caatM56Fo8TBKrA0YAyocGfiXZF95oJdbBNNHO7WNBsOQ1rWBsQy0EIPh4SkH6HoPnwrIy5oVOh
	1vt+9L3CUWqHxkprmO7aA8rdTa8l5yOu5uYI527TmssZD/dKUENFo1TxGHo0ov+1dniQ=
X-Gm-Gg: AYBFou2igN5tLUJgnI1eu7g4th2Ae5KLUcMWVMW8ltDjXVJc6ZRuKoDVRbNcgj00/aY
	0atieAnQzyiB1Ud1R3/AHp4cmYXn/oOE5h4YHBz5SaAOhSUQRkBoaU1DyvTjdQ4Kt7hC0nNPJx4
	Lmh95HKQOT85xekPvyTHOtjLt6Bz0VgYGsRs9FHhFcPSUAAd69T0K7u8/k36LhXHFs9FqxFdhfL
	wkbsq4la8qDih6ZxqlmUa6B4rt3yq2zohCHHfaS4SBCwCaOSNirYAthH9zukQxzf5oh4dDQ2yYW
	kMTxbCTnYSxVlP1skFvi1Z/zQfA31XjRWjWL5BP4Go6iDIhoxJrvoUbkzZBrEwSfe0IFbuQmDbU
	B4zu6V9CymK6YqU1+okgy0HBEvTaA+ys=
X-Received: by 2002:a05:7300:169b:b0:340:dca6:f34e with SMTP id 5a478bee46e88-340dca6f75fmr2322393eec.40.1790315339131;
        Thu, 24 Sep 2026 22:48:59 -0700 (PDT)
X-Received: by 2002:a05:7300:169b:b0:340:dca6:f34e with SMTP id 5a478bee46e88-340dca6f75fmr2322352eec.40.1790315338423;
        Thu, 24 Sep 2026 22:48:58 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757747sm4033640eec.13.2026.09.24.22.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:48:58 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add CAMSS support for Qualcomm Glymur
Date: Fri, 25 Sep 2026 11:18:44 +0530
Message-Id: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADwLtmoC/32Qy2rDMBBFfyVoXQd5JOvRVf+jlCKNRokgjhvLN
 g3B/17ZXpS2ppuBO3DOXOnBMvWJMns+PFhPU8qpu5Ygnw4Mz+56oiqFkhlwULwBW50u93bs39G
 1OVegXdS1r4MIghXko6eYPlfd69uWe7qNxTpsS+Zdpgq7tk1DuYLQCIfSg/UGFaKKgaKJFoKMD
 gMpICW8ZYvrnPLQ9fe16QSrbC1luPpZaoKKV5EQCAklqfqly/l4G91luXssY6m6sbDHSoPeqFo
 aG/5hLdc7rG6itgYCWiP+sss7JvHd3da/HaI46sCp/IB2AWjHMc/zF2Pau7i3AQAA
X-Change-ID: 20260529-glymur_camss-27af71b1d3d3
To: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790315331; l=2996;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=2VQKFd9S+is1roxFQ2w3VjF1z5t1br3J1sxIby+fveE=;
 b=m0Wwg465FszVHMiIt0GbOcmtk+4RQ3vKtD9RDrgPA3MFHtnlK3JdD5ggPD7tf3PHBHKHiMlFq
 XWQ9oEemIcyDOAUQrafQNFbdRbp+63O/Z02hAqB88wMqt8XUUr0R4e0
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab60b4c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=u22DmsK4ZUPFP8xnqCcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: c32NeyzJVBJI6ZqM484Fiy00a3Ynzy3Z
X-Proofpoint-GUID: c32NeyzJVBJI6ZqM484Fiy00a3Ynzy3Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyMiBTYWx0ZWRfX+jxMwccnOtLU
 7jLUzAq4m0au0JMZKNtT00GQVwlwOx7256IBZGoy1liLWCPZnbBydr0tB7ly/HrNc0wF+uaC/7U
 N4ZjcOjxShjPmzG+sIcuEFN+AE3UhB/A91ph+YLavKWOlCt0Xm02sR0z107Xn+IBICyRYXVxV++
 DnfuOQBnU+YWpAgj+d9Uf80bxNd69mr4+dGGmEi4krmMzM7AHiPD2PlW28E7HnjaJdUTvQqmi7w
 t+N0PqIGMJcMIsdESHY7WF2ICUkQYN0iwQjTpkX4I2UGPzy8PxLqY4TV/PiyMZN6EsZaeOCxQOp
 qk2XEjB/UtXmVyE190E42FovPldTe4zJeDsKGxYkSteM/dY+SHeZTU8jseu1oaDIek5UPy3zfkL
 ymaojaajHTphiN+pWt4doPOdfz+h45sRv+ZvGHcR55OOBGKQ2UoP9PQSUDXH/qFe2jZCSYLJbQL
 t2GPQy82Ksm5vbwcZ8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyMiBTYWx0ZWRfX2cDrieWC944/
 UzwDGdP4wW+Sh46o66NbJOZCGpUzGFC/zEooO2DNzmTkR08UTlBWqMcdePThoKCgfiF01l3a5DL
 D42XiMNqWvBMl5dlisw+lLlAo+jVB30=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250022

This series adds Camera Subsystem (CAMSS) support for the Qualcomm
Glymur SoC.

Glymur's camera hardware topology:
- 3x CSIPHY (CSI Physical Layer)
- 3x CSID + 2x CSID Lite (CSI Decoder)
- 3x TPG (Test Pattern Generator)
- 2x VFE + 2x VFE Lite (Video Front End)

The CSIPHY block is the same hardware version as x1e80100 (3ph-1-0),
differing only in instance count (3 vs 4). TPG, CSID, VFE, CSID wrapper,
and ICC resources are fully shared with x1e80100.

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,glymur-camss.yaml dt_binding_check W=1

---
Changes in v4:
- Rebase on top of linux-next (20260924)
- Drop dependency merged in linux-next
- Collected Krzysztof Reviewed-By
- Link to v3: https://lore.kernel.org/r/20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com

Changes in v3:
- Dropped PMIC changes; will be submitted as a separate series
- Dropped Hamoa from commit log - Bryan
- Collected Bryan Reviewed-By
- Link to v2: https://lore.kernel.org/r/20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com

Changes in v2:
- Glymur is now defined exclusively with the new PHY API architecture.
  CSIPHYs are standalone qcom,glymur-csi2-phy nodes falling back to
  qcom,x1e80100-csi2-phy. The CSIPHY supplies and register regions are
  removed from the CAMSS binding; they live in the PHY nodes.
- CAMSS_GLYMUR enum is dropped. Glymur wires directly to
  x1e80100_resources in the OF match table. The CSIPHY instance
  difference (3 vs 4) is expressed entirely in DT - Bryan
- The incomplete compatible + resource enumeration from v1 are collapsed
  into a single self-contained patch. The pointless VFE enum patch is
  dropped - Krzysztof, Bryan
- Add dt-bindings, MFD and regulator support for PM8010 I2C PMIC with
  qcom,pm8010-i2c compatible; qcom,pm8008 is not equivalent - Konrad
- Drop dt-bindings: i2c: qcom-cci: Document Glymur compatible; already picked
  by Andi Shyti into her i2c tree (now in linux-next as 7c9474bd4a8d)
- Link to v1: https://lore.kernel.org/all/20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com/

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

---
Nihal Kumar Gupta (3):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Glymur compatible
      dt-bindings: media: qcom,glymur-camss: Add Glymur CAMSS
      media: qcom: camss: Add Glymur compatible

 .../bindings/media/qcom,glymur-camss.yaml          | 300 +++++++++++++++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   6 +-
 drivers/media/platform/qcom/camss/camss.c          |   1 +
 3 files changed, 306 insertions(+), 1 deletion(-)
---
base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
change-id: 20260529-glymur_camss-27af71b1d3d3

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

