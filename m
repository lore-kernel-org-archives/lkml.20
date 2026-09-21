Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B6E373C1D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973535; cv=none; b=QOlORSsPRp8ux7A++lsGPjxRmPf4s9PLcb/nBWxWp0RH6QmTMdGydub1pciD4LKMEE0Z0D65xk1CQwdvY5un9BRNB7iHdcGngMYhsyxVnz73SCeWlFybl9C0VWKmzE+n7spIeSp1e8wjmUWVaFFVV4RP5oLxcpykJqNemOhZdK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973535; c=relaxed/simple;
	bh=M9wKcZRx+UctBcFXzOs619bBCYQFQfI4WYmoZUzWH7w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xtu6WqDmcKvDgI2A4GJ30jvkniljhmm0oPJ7KPrn2iAkVB4kdIJeW1ZG5D/ZHJtWSwOZz0/HXhUWEGx4iaFsXek8GqJBDa5H4Nq8YEaAK4O02ffh6kyl5gw+PRuY8+CCRQI2nZ8GkIR8OKh15nkpMen2CcWH2d3i3nCrzN11/aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zh3TgV8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QjUSD+x/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zh3TgV8s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QjUSD+x/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z268142981
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kmVizujLsrgmM/SgR/HB3+
	HMHu7OihCsv3vpcpmpjj0=; b=Zh3TgV8svLg+7k3rr1Yagf6gKX40efPetnaxg/
	UEx+BKM2jbV3Pm/Bn5HqV/hT0lbNS7tjimsLLLbNFubnRIPqhe1SD5f2c6VUk5ju
	/FyWiD/PGaWJ8wzHU9MQhOpJkcMY8jdjXvqYQBiaWJmqeXbZZlefGwKYoFTexiXR
	H0TrEDoyekoWypOg4G4ML4lGY8TfeGmAqbhMOFfd1Gfl2Y/y8eczl/vZ2mAmlhwA
	Not0NEEW3uJZtZ2on9SHXnOZn0SSCMwKVoesexEtf64pPdMZ+feAfY4T9Od9PVNP
	LID+O7riS/DgLifDINoTZTzlJkH2Ngcvl1RCHbHxSeJE8VyA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtu1egx6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:52:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so2686837a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789973533; x=1790578333; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kmVizujLsrgmM/SgR/HB3+HMHu7OihCsv3vpcpmpjj0=;
        b=QjUSD+x/57gv5Qm8SscdlJWZ0xy+J+AOAns6BVr+UZBFbKmPPkRLG8nHaORTfQ3uvF
         cR6JbK8rn/tJjRoIUxsje4DY4UnU+kRaaSlMDFbePI0X0q/JWhDk7+0ilwOOvduoM+yj
         6QgP/m1uTWXMb+gnOtPmwngP+FMDZtD/b6O+tc7gYXNXygfeva7qOJXlEbM1CIsVnDaV
         4GrkOdv7w9D4Hn0TIKkSi8OJx7OI82a7H7+719cG2MjrM6Mv7AbN816QrG2968u/roC1
         /PxB9bo/9BKILpHgHHxTMgrgutIy18nzrbGHxBMG9vekIOP59YF9qZvHyfehPZ8asg8X
         5wGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973533; x=1790578333;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kmVizujLsrgmM/SgR/HB3+HMHu7OihCsv3vpcpmpjj0=;
        b=j6tv5oXlElwsQYikbpFMsyi240YCbBgQQCqzFwj1mG0JKMBhygpevyJFJoH+afhknx
         BHgeflYZSKH+IS4vZ2PoYa8r2KJzb5H6z+lhimkacDFwz4w1PUnsAV3wfU9D7sIjZ3vF
         rtoEWPlYrWfy9SCRWb06zD6j0yPqYFAq9IRyqE8bGFkf9y3f57Qg5KkyK/6ab9wHF7lE
         9AhJrTP8U2isenZXfCyBf50cS7etMvEr7No/5xQ3ohryvIsjx18qxNEv5ZeXqXdYBb4x
         rar9A+3aLFSuSubirVzEW6Vp5ph9+fD7nEM4ok3BZZ6vgg1IOgUkDiUBWUC3uFZhu9PZ
         S0mQ==
X-Forwarded-Encrypted: i=1; AKwUvBx55e+tf97uqS//cBQ5IKjffEMZ9rYqZDJQo/+d0hW0LL19O3aTYEwBbuyqM/54sljbZWCXZ3hA7Gse9Uw=@vger.kernel.org
X-Gm-Message-State: AFuF++lwoATdfN+hTDqdMm7/2oHOi3d6G/Gd7/06wWp/P+TUaw6uIdqB
	XZ0sDhs2nLEvnPAOTLA1SI3oLBJabDiVir6cWSUhOls/N6ovuef1qeIHfv851+gYHF1uAyCaPD4
	kTZQ3whJy9sj8+QH7cm7KvpIbUicCVAycllCSriup/J6p2Fnj3Y/dj84dKlidEgPPHUo=
X-Gm-Gg: AYBFou3hgfZcgBfvHLD3LZA1GxN2JJvoX7Gjf2rTjYWwh9h1y5IO56wFdfwEMw9Rch3
	1naefpyhM1qlCeiaNbVESQ2rR22A2bsEqs2qxwAFIGmCNkH4F9P1wgoT+414Y2Yi9b5wmLiiKBR
	rrz4QV0I5Ik0K9xVq1fcPIhavtUdjOwUXwreDIpmZaWQPTxoe5IFEoNIUUv5dhlLGLWeMmtW4jD
	Es5oCvzX50AhQnZmk1FJYWz2zd4H2kq2twJX/XGlW7PdJpG8Gtsvrk5sT6uq4S9wUNC65xTsXpg
	wOVFfJSZvkHLQcRbNAMGuSt69LfFDLy4RmAgEmJ71ParuxBSiH7Ppui6t0vMapIgIxLvjparsvq
	ivPtJuRSyEmmf4gAlNTQ0hP30Lv1iTWLPYpgr+3hkhLMdo9s/2hbjoYtGN9U2uVjV8xwIOltDxE
	mwmd7wdhk8STunMOeIY0eOFdzGg2nk6z043A==
X-Received: by 2002:a05:6a20:5483:b0:3dd:a196:3090 with SMTP id adf61e73a8af0-3dda19633c6mr10931927637.64.1789973533049;
        Sun, 20 Sep 2026 23:52:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:5483:b0:3dd:a196:3090 with SMTP id adf61e73a8af0-3dda19633c6mr10931912637.64.1789973532638;
        Sun, 20 Sep 2026 23:52:12 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm31342975c88.15.2026.09.20.23.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:52:12 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add few more SOC IDs for IPQ5210 family
Date: Mon, 21 Sep 2026 12:21:51 +0530
Message-Id: <20260921-ipq52xx_new_ids-v1-0-63d68a11bbff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAfUsGoC/yXMTQqDMBBA4avIrA2YYPzpVUSkiaOOi2gz2gbEu
 zfq8lu8dwCjJ2R4JQd4/BLT4iJkmoCd3m5EQX00qEwVWS1LQetHqxA6h7+OehbS6Co3VuclVhC
 r1eNA4T427WPezYx2uzZwnn8c4gp6cwAAAA==
X-Change-ID: 20260917-ipq52xx_new_ids-1b584bc547e8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA5NyBTYWx0ZWRfX6fIHy5cpQ5bD
 P2qHPlP2wjhxvLxWV/x/4dMB/N5VrCExc3PBa+Xkr0ZmNNlDww0WVD33J5VnjNezmXBiEA960K5
 2K6zoXtVnquxZdlqTs1ZjDQB+TUMUcs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA5NyBTYWx0ZWRfX0kurgglphmb2
 YVvOrN/cUv1+VvGCtuZmuJFVXh7FGGP1+DFV+AOXS7t71O+9jsSRzlaV4Y4CxxbHhD99jgGK3IB
 101nRpnG2in5YuY/Ud0bhXvQVxZwTGxbFlVHEytd4xpJUT/YPMo8DsiRDElsWyd6/G7YqaLMVzQ
 B6ZmK59OP2Pb/aBNFskNe3dRxFMY37z5wpyOMiAhz6Sr91nGNgr7MqlURkq/Jlze6jGVlkDaRFe
 lmXXfwDizVp/wM7LYOM2I6wOYi0JCaTW9HKcRkjsbwrXQ1IGcpuvr1RYEjLyOuYv5I6IwlajYuQ
 OTgBLSKdbv8m3XkVFtZAAdPxIMxW/4ygEE3erHABTUQ0Rv9eQyCOIa9ck+lN3/tGw6CuT0cDFqJ
 XkmwU4mQxCoTaZcKNua2Gj9wcGTomsdT2JSj7ISsyZef5xRIizmLpIjp48p8Un2oZuKzOlgLiIO
 0luP1uJ3Pa4iOYuDP0w==
X-Proofpoint-ORIG-GUID: YfO5d4LU3MxJJzu7DlaZQTy6CWTBL1No
X-Proofpoint-GUID: YfO5d4LU3MxJJzu7DlaZQTy6CWTBL1No
X-Authority-Analysis: v=2.4 cv=A6r5rKWG c=1 sm=1 tr=0 ts=6ab0d41d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RD-zy9ve7f5AjEsD0N8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210097

QCF3211 and IPQ5211 are the new SoCs based on the IPQ5210 family. Add
the SoC IDs for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      dt-bindings: arm: qcom,ids: add few more SOC IDs for IPQ5210 family
      soc: qcom: socinfo: add few more SOC IDs for IPQ5210 family

 drivers/soc/qcom/socinfo.c         | 2 ++
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 2 files changed, 4 insertions(+)
---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260917-ipq52xx_new_ids-1b584bc547e8

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

