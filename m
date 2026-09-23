Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635C337F301
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131307; cv=none; b=ohgBFCkAGQFp1syW9hURNkL3nLpJ+vdCBfwfv6yvDqDv3jOL4RtZkqwyKMZi13pAGTpc5eN7HGNegd8r6QOBhE1Y5gW8i1qZ8t4wTRPOJll+ZbML5VD27MoB5zU9wkSkOfbTXOsxoeLnPhxr+JZmH25hs04uPdP4iSuNUglM0cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131307; c=relaxed/simple;
	bh=3zxlA9C9JDSmEjes1CWNauY2jFOEDhJh1YydLUT1UMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hnugSixSNIsXvMCziH2aeW/tkDUYqT5l9UVq3jFrgipgwgysrLXBNHjWFiEZMwg097useu7PKieJmX5014RZeAb6rLI8YYj/mJfQ1nILUQELpwCUG+E2oPc630Tp3q2w3XyLNxIJlpWghL5qTNaR+MqGS6ednb5GkNidxRh6/6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bA2pmQqU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UaHmaysT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bA2pmQqU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UaHmaysT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI731D1509147
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cVu70ieuUFEGlNRXy7mMCfRjrDkk5y9s41r6Xx2+eZM=; b=bA2pmQqUc2avg4UN
	xCfbCNscMs/GPA8JCNyLaWKYI1FwNHK9xQLB1A4D8ZKQMQ8EhjnfpeEDOguQGh+P
	MkAiRXzRdfKd+X7gTI0ctlCeHcnjmKaekrbwT5nmHWmaRjffoSTpD2r+ySnoBdqh
	tfT8eGrSc8TlYEPqDkp6OcL3u0IFCzEpSJUxiS1iKWeLbqndgaxw50PmIlEs9RIJ
	ckEfdjGZGoCSFzuPONBFAnZzlxDvb6pQSP7dE0hsFaPLlz75RQMM7AfxWBf6fLgi
	LGemtbLKlatt7sUFwMdPgdgydgfy04Ou8rQIrW6FXDW7JxmrDHyrhWvVUBQuMZ7U
	3vV9GA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xt4fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:41:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39af92138f9so501430a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790131303; x=1790736103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVu70ieuUFEGlNRXy7mMCfRjrDkk5y9s41r6Xx2+eZM=;
        b=UaHmaysTmVwj2fTqQWiYL3/luOA9fjLvISXAbOCTiWI23iTxA1AHv/ddnOhwuewu2f
         X7BVPMXhd1RQvshINFct/zLYBo8I1Y1dmPy56LFpIhnn9Ftrpo+vAvZBDB5UpWQrfllN
         roxWYwryHo1SwctJc0cqjGa6/i+PgJbR0xI2CUOjrqqMB/xg9KOlvqfXkOvgLib5zeBN
         h9dRxWm9QvU/McXvzl6Yb1hD7Zk37GFv7I37RvV5bmFoyer/EIndOO2DWFRLXkl06GEl
         96nZ8mawMzTqmT434J/6dnFgjmZ0/dp0fEQBsj8TYBc6p0vXiAg2jXVCE7QEEAyfPAyX
         yjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790131303; x=1790736103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVu70ieuUFEGlNRXy7mMCfRjrDkk5y9s41r6Xx2+eZM=;
        b=wYtbMjnvc8vx0UTAQA9I/T/IZS62/jzM/L8JxdnrLRJXNc7/P1unLfch2CPvbCYlkG
         F1CUTDtyQChGGdME+6piS7xWshHF5nKzgvwOclucVOsY8KO1Uv30xrlIHNLmRLb90LQ6
         co2LXDcfOiK1Q+RETh0Gi1e9rCWli5RhwrXwlVqNMQjr+bDU98HINzbUX5Ld4fR3XIYg
         Mi076qS1rPklCFWR01ZK3GcppXLY62KedLDjNjNao/70IMxBC/rvCQbmTvXPTgp/+/pb
         Ad22k4rJIZJtQQgwUZOpoCNuYES/ITdk0rfNNPVNrATrZ76cwKidieBZjqkLPo3d3v2O
         1mvw==
X-Forwarded-Encrypted: i=1; AKwUvBwxZNbYMjs9/JS6veKq2JAfPvbip1w3z1KsoTopNQf7G5/OieBE9/lKgEZGRAHwlRD2spMrFVXKXRuRUvk=@vger.kernel.org
X-Gm-Message-State: AFuF++mNYZ6RnSaBKVWTnUBCexCskViLm0N9a8dGA59MMYhJJ8+QLHpQ
	Q0IhIUR7XishOOkztNf8PXX3XQpycUhraq91HsUuE6JtNwYciT04fVpPUP0Ht7dnTwni6oN42N0
	LUnSba/JlOrwxB8o/6yVYOBv8AmTTKF9neNXeupwMy/uvBbZ4a8paFc0TCNLH6SbWyOE=
X-Gm-Gg: AYBFou3HAvBvta9hcohqjf8ZO+yhKtdOiZDolCRidHKJ37sL6QAYZ6tUGM04cSiaDsL
	OeJHhQ6v05KlSGvZEoEcS62TkJpgtiLOulueyF4/t6DcCfBSD83ywkbRCwaFI5r1dZ4LL4v+r/f
	qR52YnOUNN2fCza63/bdaCw+qGt3EI4ztKkJReL74UvvsWPK9k2eu29ukuqs69mhbltBa+PGHq/
	UTCTtOSdwNTnwvO2KqKO9Igg2CkkSx2uaZopDeFrKuO/PDaBZVI5useNUhoxWxUYzmT5e0/37Wr
	/nx1t36IsmyAEL8Q2PKRrfNb+dM6kJh07z8IFG/KK8iFfTErmdxtpegJPuBjHAjzV2hi+/zGqtA
	ijc/F5Oh8WrQhrSYqFFXgNdGWHydX9/zkKJ4GkG4jBWX4BoWlhYHeLanVeiGle9U1eYMJfrJghw
	==
X-Received: by 2002:a17:90b:35c6:b0:39e:888:3841 with SMTP id 98e67ed59e1d1-3a0730cc209mr2331109a91.16.1790131303243;
        Tue, 22 Sep 2026 19:41:43 -0700 (PDT)
X-Received: by 2002:a17:90b:35c6:b0:39e:888:3841 with SMTP id 98e67ed59e1d1-3a0730cc209mr2331103a91.16.1790131302713;
        Tue, 22 Sep 2026 19:41:42 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4f5sm2102026a91.4.2026.09.22.19.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:41:42 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:41:11 +0800
Subject: [PATCH v2 1/6] dt-bindings: media: venus,common: relax
 clock/power-domain/iommu limits
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-add_iris_for_maili-v2-1-7223738e330d@oss.qualcomm.com>
References: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790131292; l=1484;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=3zxlA9C9JDSmEjes1CWNauY2jFOEDhJh1YydLUT1UMI=;
 b=xC/oZzacAZKTxllMGctJ2NM9Ibdy/kdxR+CmqgGSv0DFgAVOikavTSjoDW6M/PW1ipIa1OeHS
 ZFY2oVh/LGpBn1HKE2Nj23jmmjch15//pD0neGeVB51x+aawwrinMWj
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: qk-6LLyfQX0mAKs9_iEgigozPffSQqM7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX/RzD0xKNvH7/
 FS4Yd8pw9Y7iTttzYUuunETzOYh/5/ug//3F/sBrQfl9zi58gNp/qEjK1wZP/yZPEixbQDlxnMV
 IgwmfA5cuTWkaBRL2mvMvBHvPiei5HkKr/H9t1EMdjqW4lrDipCuFCpEKYJtHL+RIeTaoCttDP+
 6MUxaGEoCR7JcB5ozyrLrqgTjFrdVJ4HR40ONhzuVT0W66ILcrFaQxfDbUehLGrNIM2BcwTJkgQ
 lOK01M+WTvSIbf4x9k9Lwd4pGwpnVnY4lwYV/Mq+ObDr/p0PoT5XPxPcExpolZV6vQW7VNJICbU
 uwTIf3hiIUiM5FjQbu3g+eCHJiCy/LVjqxxFOvspeXSZYaHugZsDxIFxEhRAE7dayJNU167LkU+
 DjrdXxB1A+EsBYaOUlGgX6I+hwhpuuFUzSeHrkTveeISFU+lgBtxUqyXyJ6lKOKJ7j1WTmD3pfM
 dsFIwMtk3hNdZl/eHPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX+5vD8r7N6a8p
 mNvHzXkz23lY9lDhXhPaempPChpOpGXWI56erGASSsfUGOWOtqLlkhLYDnTxMdtuLrb4yAWZgEt
 DngfvMwN26xsU5qCT9mHbbRuLlx0ve4=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab33c68 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HhAAYa2kYXLYgDpgJ-QA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: qk-6LLyfQX0mAKs9_iEgigozPffSQqM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230010

Upcoming Soc's Iris4/5 video codec requires more clocks, power domain
entries and IOMMU mappings than the current limits allow. Relax the
common schema constraints to accommodate it.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,venus-common.yaml        | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 68d5e592a028c5eecde04ce72cd5ae6815ba5c82..18891f0859eef7e8e3739a4b94e3abcdcb9d6009 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 13
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 13
 
   firmware-name:
     maxItems: 1
@@ -41,11 +41,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 9
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 9
 
   '#address-cells':
     const: 1
@@ -64,9 +64,10 @@ properties:
 
     properties:
       iommus:
-        maxItems: 1
+        minItems: 1
+        maxItems: 3
       iommu-ranges:
-        maxItems: 1
+        maxItems: 2
     required:
       - iommus
       - iommu-ranges

-- 
2.43.0

