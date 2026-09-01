Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49C5442FB2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234836; cv=none; b=iAf5FHlb+RDPtYHei4aCr2vvyKGG2d4D7bOgHKZQbVGq+Nt9SJ6qsV0dS3LPCbQA2Xj3lExnah7rq6YR7EMgjP/5ktq0bfV01pz/dGZQA6l43HrJTj8SDnV+LwjXDO80cduWPU1hjp/utxOB9GWKVgWehRRx2oEl0KSj+BXy4fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234836; c=relaxed/simple;
	bh=z6QOkPEEW2VqJl/BxnYoJKy9RWl1ZftVpqTBFPlvc90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ejD6/bt/HbkX3fparPvlIdH9nKgo0r0/nAK5wVIn8lKun3WOfDjk4oqRxp+QdsRlLrZyHU7DWiuEqpgHGr9SHoO+K3vnepJUIhV7fs6T5pMhpLrTSQVDe3y6ye7KDtAOh9lH7KULuPmRiVhDYk3Gb25269vKjP8W2u5lufWejAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JeugFHhW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RwP9iTlV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JeugFHhW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RwP9iTlV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810oIqp1724712
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 03:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sEidbp3LInp+kcRkoYIO1e
	4AQoXMCezVjMJ+ZmN1gko=; b=JeugFHhWyvJaS1ip5UVvWmJ3bVt0xFlhA4Xklx
	pbg2SLSHR4OYVio7+McX7+PzOx/1wtUOqbBjkozU+XCT2UXCQvdGdI9un6C7GtYz
	5DGst44VZbFMeY7WSJCQr+fucSUlONH2W+HPJb0ghQIOXEMUhBnN8epiM9BwBBsA
	VwU/iesFjo8hYlLIi8yM1nQ76qcQq4+jQZy/4DsWhJfrfD52itFmAWlcg41i5Nih
	j/J9su5hhcMR5emLtMGpqVPhfLuMC/oeQE6HscGvepi4g8B4uSgeipeTRDKIf5nV
	R8W0ZI1u/VEVqmkea7o07JXdtHyxZ4nrM1HVqiYaqI4U+mqw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdeg3a726-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 03:53:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7443e0f0bso14798065ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788234833; x=1788839633; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sEidbp3LInp+kcRkoYIO1e4AQoXMCezVjMJ+ZmN1gko=;
        b=RwP9iTlVHMQtAXn2hC21fNnlN/DFi/fSHFD0QPmCC/ntg7D2rewEDnY+uB2It6ditb
         CF4+BXhWPbXeNhxy8XIT1aVPEFByMccDvbhJdk1se7HrIIZdh1hnRiBuCrMEg9RcQ16/
         2ceuaiMeopZtPDe8yTaTIrPGs3K98Yf/OUJrZPN5OOq4radCMBEzRjhwY7GksCdCJNuq
         VgY4n1pszIJ8Vz6LDto/Yf8mSuycy6sNhB+cFd/yEH/GfHznkg+0+E3MaspqOtJmR6Rz
         6ar/xXMzyvzjMd0AdsdMmEEKHtRqqgytLkWA1UdxHoJZKF58bm0HJYRmKJ0cNXnOmQR1
         z62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788234833; x=1788839633;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sEidbp3LInp+kcRkoYIO1e4AQoXMCezVjMJ+ZmN1gko=;
        b=BX0hZ7mE+Puu9vFyVvX8fnVkQHpLJj10/584EGNd3zFbZyDdpjlCFjfAJppaOCoTnE
         z/W9aptIVJYkuaBSmE0Q99thntiBMJJHBg+JFN5SSdOFRAITYzqYEYrP/jXUwwieHVfd
         kiallHi6h5kJEh4bO1LauK9dawNpuJIwbkTK0C5BTPWKQ0H+coPA9BHl8pa0279aLwEx
         sWUwnZx7HkCmMwRtqywrp/8haFbNV2xCevgmbv1JUcoogK41TP9LHcNGJY2b5SocYRAL
         IW4KyLwOwMiZ6kuE1X7XY5mI/VfyLZFaOzAyxeA8vuXNV4l4TgHXDUVI61BUhvuKb+DC
         QduQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVzeWv5dlLQRP/onCZHjdjbZJkkjt94QwGt1cVGjEQrN1L6BVfgPrrlw7eWYKb4vhq+16aoGXxng1J7aU=@vger.kernel.org
X-Gm-Message-State: AFuF++luncazoeb86LycvTg6ykAlvghpsR/L3+1iLyne9wJvs9dSbdpH
	/eEAETdPMtK9SepluAh5wuMm2FWZ4E5/fnlJnvXe4GJGEW0URZZueQwtAuMTJDBqFGMdSAF/Ta4
	U+C4BjoCeSvj4T+nE3ShlepAZIWqSGt0auzOmIMVQqzAi2ElJJZKC3aVjci0YQ13lUD0=
X-Gm-Gg: AYBFou3glOGSA3H114VI6Q4wV7vmmzQe8PrVsr3j8zi6iJC8pG05gXrbe4STW1WxNH1
	gPVwfmYwoPv+krqmb/ZGBFyIvsHEqYIVRTZb8vJ+OlTPv4db90Yy9hrK704bfyye2Gz39gCZCV6
	HeLxSKK0viXOQOeOLtjP5vM3fcTc4cgmye72g0j2tq++sjoxAMNZGCltpe2ITCr9PJJhegOuIdE
	O+AzMV16XOKci47yD7qhnRaMsFMCzCecTgbKo1lZzQvQVBbUpzBSAWeih2do5zrAcuMqDymRj6a
	KPRnEem7Nbb4OUy4hDGcQG4n88KyXPPljEnUJMkIdWcWz427cCNW7+q1NnMyYsSPT1U1070y5sq
	NE0KvbW7CMot5Pcet8pYAo1OnYSMsp1dRsLTVLZBkUvKRVyEW+my4
X-Received: by 2002:a17:902:da8a:b0:2d8:d4d1:313a with SMTP id d9443c01a7336-2d94a935f88mr61552645ad.17.1788234833260;
        Mon, 31 Aug 2026 20:53:53 -0700 (PDT)
X-Received: by 2002:a17:902:da8a:b0:2d8:d4d1:313a with SMTP id d9443c01a7336-2d94a935f88mr61552105ad.17.1788234832741;
        Mon, 31 Aug 2026 20:53:52 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f959575sm34455046eec.15.2026.08.31.20.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:53:52 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 20:53:44 -0700
Subject: [PATCH v2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible
 for Qualcomm Maili SoC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEdMlmoC/32NTQqDMBCFryKzbiSKBO2q9yguTBx1ikk0o9Ii3
 r3R7rt5vA/ezw6MgZDhnuwQcCMm7yLktwTM0LgeBbWRIZe5kkpWwjY0kuDJktDkWnK9aDWaTkl
 dVCVCLE4BO3pfo8/6x7zqF5rlXDoTA/Hiw+d63bIz9/dgy0QmStmZQiuto3l45nRem9F4a9MoU
 B/H8QVmzlLKzQAAAA==
X-Change-ID: 20260609-maili-spmi-binding-dbecf60b498e
To: linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788234831; l=1490;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=z6QOkPEEW2VqJl/BxnYoJKy9RWl1ZftVpqTBFPlvc90=;
 b=4EkZhL45WkF++wJ0J8I77VVrNvB0B2YSeYA4I/MMC55aZiHHomM2pHQ5Xx1vvpsRpRKgHMZzM
 YkgDyG233IFD5CGqFkBBlKDEIsXsoBvHmTmbWhVYqydN8Tsr+0iDu74
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAzMSBTYWx0ZWRfX/vZLBtWrK6RO
 VA9YBDdruM8Mmyg0623uFb+NKqloMoOyLj1roZPflK8NpMKVtDE6524zCI961taZ3K26sCh40Y6
 AL9cV5zPH5U8KSNK61tZbsMLxKdeTOrux96bTrfjyMi629SZFylwxaBeGmXyEYwHTpMd3NDoCih
 19qKKwbSRelLivX00v6ro8Z0bTPE42uqIH6RDtS7bBSES1P9t26SRuvnHIUlehZPpKQqRtcT+Fx
 In6/WpGZGOlHU8irtOwSn6bnobxesn/jxMnwZtFOVWG1UglIcifISL7fyrSiqY+xrNtbMCNrxLz
 MmbVoUNk6Kwzr19GXc2iGrMkYAHLpCghM1OwZCwUsaF3ixzjC6lUE6Au/TOT6bw4pvLi/NCUFow
 DdoNm8Mjm6m+KgRD42ORJ7TY85i8rj2Dv9AM7euSblKlm2dcp+q7GyWb5LKqRtLGLmxeQUWRevK
 oWujYkgDAgEmoq6//Iw==
X-Proofpoint-GUID: ucn8bH_gAookuQxXHsOTeZlF613eTwQw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAzMSBTYWx0ZWRfXx0RGkiDsy/RB
 hCjoaP+stYJZ1xgZbMc5GnZwe1/45kGm3N/jSMaFF875sth2xqddLG0+godRP+RgY8ymyOdfO0l
 9xzhnhBY6uHlowF59WeJz475+95LVZs=
X-Authority-Analysis: v=2.4 cv=NZnWEWD4 c=1 sm=1 tr=0 ts=6a964c51 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=jG6XORycvXjLwl3TrW0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: ucn8bH_gAookuQxXHsOTeZlF613eTwQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010031

The PMIC arbiter in the Qualcomm Maili SoC is version v8.5, which
is the same with Hawi and compatible with Glymur. Hence, add a string
for "qcom,maili-spmi-pmic-arb" as a compatible entry for
"qcom,glymur-spmi-pmic-arb".

Reviewed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v2:
- Added trailers
- Link to v1: https://patch.msgid.link/20260609-maili-spmi-binding-v1-1-80fc4b6bb80f@oss.qualcomm.com
---
 Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
index 1593a1183a36..44c864fd5fc7 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
@@ -27,6 +27,7 @@ properties:
           - enum:
               - qcom,hawi-spmi-pmic-arb
               - qcom,kaanapali-spmi-pmic-arb
+              - qcom,maili-spmi-pmic-arb
           - const: qcom,glymur-spmi-pmic-arb
       - enum:
           - qcom,glymur-spmi-pmic-arb

---
base-commit: 3443eec9c55d128064c83225a9111f1a1a37277a
change-id: 20260609-maili-spmi-binding-dbecf60b498e

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

