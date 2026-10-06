Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E573D9026
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328776; cv=none; b=G4VTHo3KTxi4r9AfsA2TZuTA5UwVucKnX6ceu90KbxjSxbIsHZrH/VNciwy+bwA2LvhRVaiR+NNYjt8O9v/64TJpgahh1+2rjDi/od3sCDz5VsJhqxHHxo9wBqm5BhQsiJJmymduARFSTPEHLducdNcP7wAtENpsbs5OB5uDjJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328776; c=relaxed/simple;
	bh=T6NGPeImLPospjxS8/pCO+W9TSe73t4Y6Lz+PI/W/L4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G7yQ7t9li6eRtx8N5MxGNBZMgITzn0q8qavfFTdgU4c1/WSKXlb2mskZ8Ufeiwu/ChF11bQ7K/zFAKz3YKIcDeU9xzwRDFFX/KLvKZmV+42eHW407Gnyu1BnVkD/mKvkEPwHyOGyX7QChMeT1OsRQdKwiaUOLaWL23bVUsBT3NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pWqnxPLy reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pWqnxPLy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LexsY2389962
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DrnF+WzDhjC
	ZA+grZoIKVvpbcMd8nTjpbf5IDdeQS9M=; b=pWqnxPLyDwc60BTeVl9q4UfcwE3
	1ViwjEiWDGenyjOvk6jTy3G7j5WAZ16Cj6BJl1N1AhKST5mSqwYYPN9gbHnigqW5
	yiljH/cEwHa+qP1hcmqSVtG92J2W4VnjrPHlglG0p18Erv4ymPDpb4qsCCbLrAbr
	77QpKSgJgz9+SNy2+1fa1eh0NE8nsQUchQs6ZX/+xY4/1Ga035DckVYl5op8dGFJ
	C74pLjGEjfkjqyQ2DH0IdSI6yV17VEGAD/XcT3yoITErWrVHM6XuyQIVd1B+fdYf
	XhP3At8b+zCsmBrO3k8coajRvUdc8L7VJL/+dzTOhf+5jtroEn7mkJ2xjtA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xfbk0vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93be1861d2dso555947285a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326477; x=1791931277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DrnF+WzDhjCZA+grZoIKVvpbcMd8nTjpbf5IDdeQS9M=;
        b=F5P953XhLf4oMvN7M/IOLlXg4Xe6oB4R4TJIVNu+uQ5SZjrHXeTt27umHocwqpAnsW
         PuMT2WQlzxterHrEClMUgqp/Tt+/0GMznvMorONqnW9zsoFhD4KRp1rr6FBU4DZ8BPbZ
         t9G1cyu+rgby1MrfIPhaP8AOjDufy03UWV7nPV7pPHEUNZqySPRuQG6IvDLkuNa7+9h4
         VjHmaoCNVywyIK24dRnjCczybeUKSpRVszj98wZ8qk//sgS7dOxIDMxatAjT0k9YKDWJ
         3SQunIqU3mF5pRXuwlkLCo9Zs88B7qGdjFMRDBc3Q0iPoInUwEEibkszBpDgVS/FibkR
         QC/A==
X-Forwarded-Encrypted: i=1; AKwUvBzvLi910vuI297F0TG8COaYxvzPeFNlqMwvBDFKydY1TVrVBog3Zic2m+Vm8cOICfA0EbnNgoTXKZNSqE8=@vger.kernel.org
X-Gm-Message-State: AFuF++kqxsfD/LzIN0MWuVLvrgiQCGa5MJBc8hQB/5LjPfbtkeb+eqc7
	/cN02j+4lTwXPF4irqp9Gecwws++ZljA0tFqqYD4kGY1nOboOQCc5gmFjjf/OqTs/y+/3rwGl7M
	7QQhelEm6kwqtHypKnX/1Uz4XHRthsTASm7Or9cjTNnSh33EOKX05ozTecOf3vJYeYtk=
X-Gm-Gg: AYBFou3K8GUir/skqQ0gXA39S37P6w9yUa8WPt5XiekllEzeSNALe0C1dwMPZXzQvDG
	f97B3LAfVYlvjaWrEx8NR/l5WAtI0eLxiWzGuJ5wG/d/nlI8/5iw1Z6b+zE4sk1mhOyh41M0iQv
	6qOJCkNZAsA09r/ESxz5T2LwcWaSvG4WquiJlHv+49gzkBLU4OAOWn90lK35nSbBnFNK/qn5kfa
	myIobY0pZCjgKN8VVAwy+O9pw2fWBrgG/+cfZOFv5THr3ZmZ4EMwFXTxunjoKB8BxhsVneAj7M7
	CVSamrBLxiMuiiPbPL9lpt2Kh821fbhCxN03KfYrWk1SoY4rrJVpcTv2JnA=
X-Received: by 2002:a05:620a:4486:b0:93c:5958:9de9 with SMTP id af79cd13be357-93e9b7c7f3dmr72919885a.33.1791326476812;
        Tue, 06 Oct 2026 15:41:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4486:b0:93c:5958:9de9 with SMTP id af79cd13be357-93e9b7c7f3dmr72915485a.33.1791326476290;
        Tue, 06 Oct 2026 15:41:16 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:15 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 26/45] dt-bindings: media: qcom,sa8775p-camss: add pixel path variant
Date: Wed,  7 Oct 2026 01:39:34 +0300
Message-Id: <20261006223953.3382273-27-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D8TSufRj c=1 sm=1 tr=0 ts=6ac5790d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=xOFzXCKjWWEJiKxN6jAA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ejD1zfN96wltUpFgvqgXGKCuwuRsj0ut
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX783id5p/xedZ
 /L/gV5E1/uGtfC2jxa8WcA2L+18hxdJgzpio5bhdRzSTM1Yn2KJMCWei9/D3XovlNDCxFU2ta+O
 Lats6O6/PtacvkY7tsCffxfcVx62D7s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXzZupIDI5s/tt
 /obnDY4PRNj6vF5i7VYAS93JnXop4UezVNd9eygXXSpMmoNdz8Kif6jGn29c1bk/T/ePeNykW/3
 DBxud1qRm1aQrWxX3+zkC8ID3kyks/BEpkV8mGunBjiIKwk4El3LoBvZB+KFQkNrlbzVn+YsKAI
 AbVtcAKL+IxqKGF+3UlIo14pT/lBuO21n3fhGcXWAGVfwYhheI45NxmKdHk62h5itfQZt1ZQj4a
 mf+1J4pBp0aQdPKtkHlohkererDUwTKm6XoCq5cVyywluRnUQSeEtktVJ9QZczTv7cNsHzIns2/
 AtK3G5OIjOcnoit9mAomUI6NgruY9wwnQxiam5Bq+05yKFu8ETxDyIKyAR3scl66Jpk2PGy96sZ
 6+7puObWGMG+oV3ps7ZAu/Id+S99qxJgdcBnCeCSNYX93XnnBxAIcp2ulMK/k8lZBCqZsurF+QV
 2qknKm8lUM6/IOrIKiw==
X-Proofpoint-ORIG-GUID: ejD1zfN96wltUpFgvqgXGKCuwuRsj0ut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Document qcom,sa8775p-camss-pix for CAMSS configurations that use IFE
pixel paths. Keep qcom,sa8775p-camss for the legacy VFE resources.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sa8775p-camss.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
index 48f280e99809..9206c7cfe197 100644
--- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,sa8775p-camss
+    enum:
+      - qcom,sa8775p-camss-pix
+      - qcom,sa8775p-camss
 
   reg:
     maxItems: 22
-- 
2.34.1

