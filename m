Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC623F6601
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354613; cv=none; b=u3N7EtDlIegvfvzS79eohtbCu/DgJPnHAaF3E/l02+YfiloA0IA+UKoX15/CwSZpg/vih3Wi8CRu7qd6yvV9hdw5qmj6fY4Favxrbkx6dU+QEhR+DLgi+DP23gvQXtobYzMgvblTluPtu+jGb483ZZz0XHVYx1eJ+tC3+/fk+ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354613; c=relaxed/simple;
	bh=r5vfQeN+w2+rs5PzLPqAbbwdW38watpgr2ZY3QnCi1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RROZthdnHfBorLwCCNrYPdg+hhOiNVnOYcEzxUADV7ed5asWgGpM+Uep/nXpj6tNKg2d/mlsrNuo4vabYoxTjxDFp17m70s9Z6eO8qkNpGsyQPvzaRNw/A30u8r3Ya/F7Pnud4Qs0v/15pQCPSWRTTJ0Vs7fb9ceK2w4ZLrIx98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIet/CON; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/lTjfTB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIet/CON";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F/lTjfTB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6975Nu0I1567054
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 06:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zoubIOEEzv1B19ts4zQ87qyfocZpDaFj8gRYk/9R1wE=; b=TIet/CONig7AtF/B
	2v7PGAl0tECSvmiuV/+ovSoz3rdEARorNEBFitEDjTckJzpIl3dvDw7V+De3Tgzc
	4BRqFxvEQvh01VuzIElGWfpqeij4KyYIjLo3VOh9d0IrHrrymYj6hNyzzz0HyeCD
	SrJEXyCyTC/CA4tKv8v+hLyCUiXG/XsHeAXHzVk5t9F0zX7O1PwtBtlTKTylAU3E
	ki9u270KwHPHffXGpjY6Ka4/wJwgU4U5On0nbUT3cYFwML7OHto0dBXDkfC/Oka0
	S9ygVopEYPn5NZZbJwhKAJDY0O+FIRaHtrIM3BKVayikQz3sfm8/Z/CUjTnVLbxB
	A1FjIw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8r69q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:30:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so2539138a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 23:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791354611; x=1791959411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zoubIOEEzv1B19ts4zQ87qyfocZpDaFj8gRYk/9R1wE=;
        b=F/lTjfTBP0N9OmsN6UrYQXbIyFV9ZRaCwekdto88/WUxpxuzrbIwLGeK6QcfF55FGv
         KWUHkUUNY44YQT59EfSdP5zg38ExjmSdtO1g000ciIH1d1tctbMCmTi1s2Pwg2TIzO0w
         4Bbl1PS7VqxoWieq3+MdaXNynzOi4dJuGALf9ZLSRUzNqwHcz2R5FBLMFpere+olbx4Y
         qoVBlYGrNJ9UvurGflH4iEzD4xoXaDYjk4FUYnv7HZwGA4WF4TeMwi/KC3OwP5lPghPL
         qQ67KBLTW70ldKonpRnJEo+iKjEa2zHkc12KbV8QCw4P+Li+7iqK5p3vknIjlKYZCT5X
         A8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791354611; x=1791959411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zoubIOEEzv1B19ts4zQ87qyfocZpDaFj8gRYk/9R1wE=;
        b=iRTf0FO9+sMaGzpDZgi9duP9pRWsZd4yMcLRgSbPDNZ2fNNPFCPVkQtiVjcKenHSoi
         Jgyua4KBlUJV6YuUkU8dyR8YtgFE6wTQXYkCB/+5KhiGPBbCydgN/GnofRdS8HJA5C6p
         Xq1PuvDJLxpjeoMFr3fB/ecqwbkB4PY9fKdsE6g1Zt/MQ8zE+PW1txONSV1lk0bh/9sl
         pV30584lgmqoGSoqySsk62gbcieUArSYCwQBQWMFCpTBosLvngswCCRMdDCkWwr9Sf7U
         Bn+8naD6+z5Dvfr8xIye1Fm0WeTBUEGHIWR4NX8HCKgeRXeKVWPWj0yMJ/iA+7Bba4JB
         CFHg==
X-Forwarded-Encrypted: i=1; AKwUvBzHb98g5i49aSUxqIZG6FApmdUxpnvcy4N7+BySO3fXjoIASCBV14CHLzYy35JlzS0xh0KCEU4KDLhG3Gs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzS6s/VH9ULUU4O3lAGS/xvwia9ZX8ls81qdfflt6jMhpIB42b
	YxWeerN176Oldhh+NplP6zSGhrQT0WpceUF2N61zZJh9zrrEPTaVkMSLBv6r1POqB/l8Tu1Zjfp
	hym2/f4xjwM6lSnszwaCf1LRrRUjM0B9pjMzgjrAciAuOur3vCIs8E3QTimsrEmC4phw=
X-Gm-Gg: AYBFou2czPicEMvhsbEzo4Xt3ASUjdvX6TYg0sSuDgeglD6xouOkT3Oj1+1iCemkwjY
	2DsG4O0YLrbcKljr896Hm2mgkvQBLuhA01Uzs1jtkMhOEkp5x46vhPb2XBTE2bBu6JQy4/myqTN
	E699s3Teu03BuDwrAGnavN3AXcu4UO25nn4/iZXlpo/jM2TxZL9dZQm5DTD6GsZbxzG3bSdWT3t
	pavIIne++TK0YhOKCo2sRTfZ97Y2/Q6bOre2Pnut4weEf9NZ7BHJm1eSFPbLHpVm34wODwczddb
	3S1PbTSjiaft39Rn45MLuAy+5AaxOnZBRVgc7dPTq1UjYhAhqzqUW+UX37yGDX5V2Xe2BPQXiZw
	zQpqlQXILB3UDB9ocp3FsFwrUvQ==
X-Received: by 2002:a17:90a:1581:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3a8c0dcd11bmr41613a91.25.1791354610755;
        Tue, 06 Oct 2026 23:30:10 -0700 (PDT)
X-Received: by 2002:a17:90a:1581:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3a8c0dcd11bmr41595a91.25.1791354610125;
        Tue, 06 Oct 2026 23:30:10 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89ab81bb0sm2972690a91.5.2026.10.06.23.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:30:09 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 11:59:35 +0530
Subject: [PATCH v3 2/5] scsi: ufs: qcom: dt-bindings: Document Glymur UFS
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-glymur_ufs_qcb_enablement-v3-2-84cf4f861415@oss.qualcomm.com>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
In-Reply-To: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        "Martin K. Petersen" <mkp@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791354585; l=1442;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=r5vfQeN+w2+rs5PzLPqAbbwdW38watpgr2ZY3QnCi1M=;
 b=LWAPfyUHD/4HNyS4Ef0pdT8IssM4Wdd2mxGj3c1zmeM2ln+uM6ccnhwYAbiH+jzUPDZxRz4J4
 assC3IcQZiNB8/ufVjAWX6ahPTHC586lyxSXcUS/fd7k3rL5zptEc2j
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNSBTYWx0ZWRfX53fFfSo1TY9e
 wBOA94de2ZTH9fpWHaBwEmfNPxTfsSuZFPMUpd3I+RW+yHN9I6m8IikmzMUUVckGoW7/dl4HHdx
 h1SR8o34sDr1QL9sN1aqg1j1/pvaH/Q=
X-Proofpoint-ORIG-GUID: XRwO0tbcyFLttY36SAe6-AR3Z_YdSyMK
X-Proofpoint-GUID: XRwO0tbcyFLttY36SAe6-AR3Z_YdSyMK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNSBTYWx0ZWRfXwQ0r+Czro+vl
 zkKAv5+PpVRgw73Xj5b+lmuedm4WsOTzEQyX9Tf84cgrUdV5jEsIAtO9MLXyMbal6WLURC8fUHO
 oAlcrpM/1OXOVnCUXppuJQlhLAHExoX/nnfDxM4ERoCPErt28D31AGyUmDpGB62YE/7m91M6YI8
 EAbjPZkkbEkB836VJymzSDvfCL+dXvQgF+zOvw/13ciR02y4IH2gDzmr32ok/wKKU8u9lyl81V2
 4rMFXYYc3R1RlFanl+hHhyGfJDWDaz3CMAN5Da4pCRrBMIPYT/byohgbGSBEiwu9iRplLH6rHS4
 yYwl0SiFcHYAEr8grr5tbPRUtXh3xfuS/X3gBCRjgC32gCfKhsE0MZESUKDhHDn69V7hATHKPAO
 IJO4Tn2I6g03SbrWxcNW0rOwo+ugpkqZbvQvGWhTNVAN8Hoch6nZyObQoWm5MwQE9vUrtHfeNOU
 lM6hpSmifVgPieqIuJA==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac5e6f3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M7MUb3q_Ox69Zn6kGXoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070025

Document UFS Host Controller on Glymur SoC. Glymur UFSHC has a
multi-queue command (MCQ) register range in addition to the standard
one. So, both reg entries are required.

Acked-by: Martin K. Petersen <mkp@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index d03295806657..f132b1a9ebc2 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -16,6 +16,7 @@ select:
       contains:
         enum:
           - qcom,eliza-ufshc
+          - qcom,glymur-ufshc
           - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,maili-ufshc
@@ -30,6 +31,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-ufshc
+          - qcom,glymur-ufshc
           - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,maili-ufshc
@@ -80,6 +82,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-ufshc
+              - qcom,glymur-ufshc
               - qcom,maili-ufshc
               - qcom,nord-ufshc
     then:

-- 
2.34.1

