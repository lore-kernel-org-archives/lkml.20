Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D365D49A3C5
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373121; cv=none; b=lP5VYl8J+fHERMjPrpwdFqoyi7/vGuv8JeMSyY7QxY0U0Jys3vheiC/HL+FGY+tIh38zorHWxvpcII95MrwGE+v4p09K6ZhwWdvzYLxMp5qI88xrcaLAqGa7r5lDaPFHVZzXjqsS/1jLZVGSo1H7yvqbRm1TfBsE0wTsPDSVblA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373121; c=relaxed/simple;
	bh=DQ9EWfGPZKBvqgp9iN4lMDE2hFQ8EQVewPUivJN4wLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GB1NMZ/GSRbqevenJ/xuQ2V39fxASb4ACSKMc/iazEjIBjpxi2Ij+nDGWM6S8fFMGJspVYPk890VvNseuAwjhFZqgsBsuX74/LDrPNaorxxHPVzOgIQNFW4ux5fWgt1+w4zT9t4iZaClwzgqRa9FSAdw/wKel4RgQfvo+cg8bhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8y/tst5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4L1gWSZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8y/tst5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q4L1gWSZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVCQ33198234
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 11:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cbMzmwWaBO70zBSqQ/eHNfR6dBbEZw3DRlvo6abDoF0=; b=R8y/tst5xDAb7+uN
	5evKUt2hHCiP/Ez2SOi4tvh9TOw8DmBEsJVy7sdJ8PSHkPY+Dd3DQMOhJ8h3FHE+
	gxhwM/FesRSOv8crZsJuyvPoe9QSj8O1j8YOVsFrc5dV9HQv+QzaFGKG8oxgHTmn
	/6TUDOG0cZiLB76XVslpNDeUy7uMv1KDkuUgXPmuIXTTOAS3WlPgRqwbeXe4/Zay
	YuqayptvA/zBdXhkLmp/8oRa8o0bES259p4f6l9rK1/hl0vqhui5anu5Xg6gwpDN
	dM+PktZ/tkztt00XkMeKQMyrNA0f4zcf94wINDoTvrFrloN9rIjPHp9OgsmKvuPQ
	xKDmCQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s1w9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:38:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a8a16d84eeso553383a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791373092; x=1791977892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cbMzmwWaBO70zBSqQ/eHNfR6dBbEZw3DRlvo6abDoF0=;
        b=Q4L1gWSZ+1Vj6u4q+7D42xHnNGh4BfjbGYuXqmm7gGkgBzJ0S0IKS4a+eN3gb+zLcD
         CC+h15yIKT5RP3gLOFd9F9cfSZQmtKrgRLEqte3zKnNBb7Zmq1jMfUccJndliAXxaNY/
         Mujwsoh5DzJzOhHzuSadHMPAknJIgXtUFA24/bchTDU1jhWzqhaH8Xyh1FWlSJjb73mt
         74PxY2Szrm78SgGBWqXULpVJemN5w7pqmt+jbGa3qxdc0KWqIjuwLfRWrvrvROtvWoqD
         KUQ0QAxg/7yfyVbbJTUil0/H3ywjTUrD9xZVfNaKLyqHqKxGmn3xVkuj/41ZRFtOsTBm
         T6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373092; x=1791977892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cbMzmwWaBO70zBSqQ/eHNfR6dBbEZw3DRlvo6abDoF0=;
        b=Qcqe8B9d5ha9YAVNhduV2msgmc4MTkUpEb8RM67y/NL02+R9ffIFPazIlf4sQxba1r
         EVIHAdReiJXqfnXT8VkbU0plEg4sZJxK8E9F3+rveRfyIC9RYtMmENTr9yocpBDKROSW
         4UYN1j1w6FW2vJCeN47T4HYOlPUjniViz5MitmCMUXInj1NzVb/ZX5cJHeAs4Su1Xr9Q
         eqjKkiISe9Z/KmP9ZTS4nTfJEQ3/p7DYy7hdBu+EgIv9PdpgQmu/QwoCV1myPXMaKz3k
         ltX3G/Ag3XTcG605vIha79TtE+ndwQc1FD1vkja/RTPjFq2HOsBT40xJwkBRFQ3dIXtA
         +HxA==
X-Forwarded-Encrypted: i=1; AKwUvBw1Pqq7pDCFa3TOzOfOf0mO27cDxvdm6T64y6Mb7Y1g6LKtDKN9MlzIG+co3wmtLxNtVLubCxbgRWBqFVg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXdjNc+OCof37euJl8vsHXZTFjlYPGWdghLHLTqj6F9kVG64XS
	6W5spkKgZdfF/u/paGFSzRHDKUWp3dB+Sp4yyySgSXfnp5qCJGVdb0oTzvnPmll/tElOFwLITNk
	HtGafrt3G369uaF5TbL+bAZicDBqoKamtMu+rEVX+EcLCZO2XhZU4pM1Ddy/9EHGzJEtSJ4tpD/
	k=
X-Gm-Gg: AYBFou3p+VR7oVr4p16L2JBfm65Ut5CH3GKkEwQzqvHyWtGUoYls5b5vDEZ4l8f80jP
	vKJu9Jkx5hmkX/eRvlTZ7Ge9ghCaNdzun4/f5F3LjgEkmmi93KplP03RrMY7/WCMc2nw55tYjRo
	4SfJ0OhY+exofbS0mpaDH8KOK63vBtlbhkZ/srbkTBm0e11FBRhGHIdIRVVg2hgcAsFlA0KVmTN
	YHWlA3s5ws6RocAdeuTDRTwD/00+hQWatEqYEbVqaqD9van9nBRwHdhYqUudPnPSWWFEPIHmIwj
	5z6fSPOysuuhEtgRPAN4ilQuOF661zoogm9ITEd2dRmmtE1KfckTFweV4c+/wmWuicrKoZy7DeK
	n+yxTE8Fe6xwmdpsy+ta6vihBppDyVwHu
X-Received: by 2002:a17:90b:3810:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3a8a1ac0576mr1503974a91.27.1791373092296;
        Wed, 07 Oct 2026 04:38:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3810:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3a8a1ac0576mr1503945a91.27.1791373091681;
        Wed, 07 Oct 2026 04:38:11 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5e0eeb6sm1454001a91.2.2026.10.07.04.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:38:11 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 17:07:48 +0530
Subject: [PATCH v2 1/4] dt-bindings: misc: qcom,fastrpc: add iommu-ranges
 support for context bank
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-extended-mapping-v2-1-5dca3aa2c2d3@oss.qualcomm.com>
References: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
In-Reply-To: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791373080; l=1504;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=DQ9EWfGPZKBvqgp9iN4lMDE2hFQ8EQVewPUivJN4wLE=;
 b=GV1ceQclqogtYmo10/6T4mCwskpqqXIPQeE7GCWzFuSg+BY3H8rik8OVHxlOofeI7rsa4U/aG
 ZaNYfBp253+CdVa99pZaoaV18JjUpdyY9D4enQFCBlmwss+njwFv6UG
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: Ikz_uygyKxcJn0HMpokAzltSQDXHLD0J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfX/i/LrfggYFnn
 CvGZtWDw/CBPlN7folclvR/RMF3u7N1Mdg1Anq6G6j4IvumL3hFFbSdTJrLEHGC3DKXqtJA8Kfz
 IcGQn5O3d619jDa1K3CEb4sS9Yz9wrO3ew5eoj0mtOTj9VhiiXT1RgkWk/blsCZ08saQzWh4tau
 Kxs79QFC8YHNEqTOMX+EXlrbwonmSpbQa7vZUBCq0Bte+MWTBUyXUpuHYvqi6SEkTsk9TAJyaQi
 vYfQjWIzDL8K7wy4SUcbbnrkpCViHpPFzMgvT3yacdUOita4NRdo9rTN95Py2DgixEpO/MzZpvf
 PpfXaAdhBDTcFAd+GTj2ooOGVWUOfF6Ptz58VrwWEPPe9tUdpXwIen9OQguYosIycOgW/zJ5MDB
 CKaIp5P69Ei91ifZLq5Rt/mqw47ZgSAnOS+qUGeiisf7BtzORHv1hh9bQTumq28veyFMQImYKuF
 UgP4aLDH/RQPMS19BXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfXzKOMLr9fc6KA
 QMClnZE3gyZi1OVzdXQPrs9a0i1kdt9sv+KanqQ/YKnA+p7h/7JYVhTfgDq6tq3+2neXdyDCAFG
 LflFEmjt/zlDsVe9K2YZfemuP/IVEh4=
X-Proofpoint-GUID: Ikz_uygyKxcJn0HMpokAzltSQDXHLD0J
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac62f25 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OJl0ziJC5c_Yx6648RIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070046

The driver uses the presence of iommu-ranges on a context bank node to
identify it as dedicated for extended IOVA mapping. iommu-ranges lists
the IOVA ranges the IOMMU allocator may use for that device; any range
not listed is left unused.

Add iommu-ranges to the compute-cb subnode properties so the DT
validator accepts it on context bank nodes.

Relax #address-cells to enum: [1, 2] and #size-cells to enum: [0, 2] to
allow platforms that require 64-bit values in iommu-ranges to pass
binding validation.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index e945c8ba75e3..f4ca9a767255 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -73,10 +73,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
   "#address-cells":
-    const: 1
+    enum: [1, 2]
 
   "#size-cells":
-    const: 0
+    enum: [0, 2]
 
 patternProperties:
   "(compute-)?cb@[0-9]*$":
@@ -98,6 +98,8 @@ patternProperties:
         minItems: 1
         maxItems: 10
 
+      iommu-ranges: true
+
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1

-- 
2.34.1

