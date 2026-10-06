Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C8F3D333B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326532; cv=none; b=HZLNwTxvIFFDY2NzGcrBv8fS36VxuNFS/iyUvvH9gei2S7a0XZ8CMj+QJS+TJjq9uFPx6wB79ynlYdwhCXA3Qt/dfw29QIfFvg1FX6ik2E36SHON3se5ZvTFk0mYmoouLWJ2hvRTGIB8JadJVIb3TWa9YAk8QWOF19Z7ZoSpQ6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326532; c=relaxed/simple;
	bh=Gi+0SxuObWSnypm60XIzwS6sBewS3GWrLl3c8ovucW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HLif/CkVyAGf3We1q6jzsMIori6i684Fp8ortbBGYZVxa9U9ro51LdDn/lQtJeiXNNpdBq0uxizjmZloZXe0SPE2WoThCgSrBdIHkyGu14mWO+Ax/7qupTTA6RlOMed5e7f6rMG/IsJ9cdDLBlyqYqQwoDUcMovOYtsmnNsN+J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4YkFYEW reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4YkFYEW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeWR62514042
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dlWq6Ov7H3Z
	qTYXe03p4byFmP3iR8MTu4occ91czj84=; b=b4YkFYEWHpZSLx5mRyl9ORf6ShS
	teX+9yrJGcDWurg2YjymA2+FQ8bJO6HqkZMXxLeH7m4fPSgnAT0cTZhSDrgq+/vY
	gpjzWxry9JawYaJdmPH70I5XURsx29Smj0GiBTJdGeXDh2ugeBHfShzT5N6iDE+5
	ev094OKImxaMSQLJItgEO07U2bOy9oaqdO3vdrnjLZT8+RFq11XTZI6DfTQ6kVtQ
	RncxQvbOXXU2ILHz554rldn4vfIgrUI4cdXP9QDgcmWo2KSCfNxBIMSgKcguHAGE
	vD2MTRdMWOi3v8UH5djLFarxDnyDRnXs+fdN6axYAxhJJerJRWWPrUbiPJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xwwtwfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93dea1b6c89so555254985a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326515; x=1791931315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dlWq6Ov7H3ZqTYXe03p4byFmP3iR8MTu4occ91czj84=;
        b=Amngk24m+lgA54AN1Vje+cX9KPcwviXP2LIw1YkMTGc/0rTOEYXzyClNWIrfWrQap1
         5UEnzuNZi1xZdG2V5tcJeqMe4ebYPzla1o2al1hbEO51YNuAWfr5rFO+S314dv9Rjkly
         /jvduvfklG7YUAM22DUlsASmXSZ2ID93nBP+D9c2wcrv+vlAnIrmuUrR+zKVeIyalms2
         KS7KrhBUX+nLUs9kOl/b59Q73/8uR5R1GIXZ7h8KGyp2RGbckHGQGSinf9DTxCOzhXuP
         5KvkS6oOp4wkz78r53jekrhA3SxmRWzW/d1wkX/jSuD820AmvyOvnjlrhsxrr7SflF72
         LjSw==
X-Forwarded-Encrypted: i=1; AKwUvBxyjnQguQb4dSexzz9o3T47RtyWI/vYgFM19FYrk7gfolHs+mCxW5jGhN+irG8ZasUewJqwZ8CTasEG9vA=@vger.kernel.org
X-Gm-Message-State: AFuF++n9dFC3DFEqgpgM3pSgwNpLWL1OYJiS2JuNzDkMwCIl8rLiZnZR
	UxYQcZs9v6PXauexPDrr8FrZcSmVja6Fst6vjdCsVWUNwzsx13eMVQ2AV1b4c+yZ8xqDZYhO6cI
	4bw5DeOrElYxnvqhBp1/TdOhdRZKVn6zGZDgxZKWGPTV4X+BVSXE3siTLLE/X6xCCNCc=
X-Gm-Gg: AYBFou2DT/QFZN0f9La7VlgmWszAKL0XComSk6ERKgX7f+P9vHfHanvPCVct+wSGUPM
	YIY/1q6k1f+r/XOzEm4niZzgRTB0DD+1JRv61ZF1ShS0XBQUzqdEoHQ6pzGMsA0M9MdzyVMR8ZY
	PDHsgckBOPXh3wEbkWNjN2roaBg+GR+ypbM3bBF4E8wX72EG6+UpXzvLbKvuxIAchil2NmAqBVC
	KnyWa6mElISg2P4zmG5JNf7fp+vV+Yeh9/qZhLKBvCPTVoUUsscJoSmIhR4yq1oRAAyp/in/a2i
	92PXYPyM3Ei9dZMozzowcLx7hOzPssozocz6NkcdLdi926JwzO0f5O862CQ=
X-Received: by 2002:a05:620a:40d0:b0:939:7683:33d5 with SMTP id af79cd13be357-93e9b71bf00mr86274685a.19.1791326515468;
        Tue, 06 Oct 2026 15:41:55 -0700 (PDT)
X-Received: by 2002:a05:620a:40d0:b0:939:7683:33d5 with SMTP id af79cd13be357-93e9b71bf00mr86270285a.19.1791326514991;
        Tue, 06 Oct 2026 15:41:54 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:54 -0700 (PDT)
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
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH 44/45] dt-bindings: media: qcom,qcs8300-camss: add pixel path variant
Date: Wed,  7 Oct 2026 01:39:52 +0300
Message-Id: <20261006223953.3382273-45-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX0MyLgxyUvFsz
 6jTwp6nRajKN/DVwi7iVEtH4jOUYXnumTVf4DAJSdjlkxtSv2KF4VIqe/Yk9oSXBMg77gB+IA5I
 17tKF6SWnLp78j3qnCtaha2a5k8GYBLn2XsmTR1KiaBgS1noceli1qyBBxYV4qV7Nmj0D+DE8jy
 U7J+5zzQYAC/3oGMHYrpzOCf1pOxy7/htuZbUgIui25ojLiAyNLUqU8quT0z9ykFX3UNjqhshlb
 LjTMhX89ePn87i2mo5Gjt7syPxteOJlkBNwmqbzLiUlW5OHwo7DtgX28Ey202rpI+T4uh+AiMr9
 7BG0+httxmmVMvgi0eKLRULhZsGvCqY7p6M2ZzXeicLZgkzpvd6L20htczj+pwMRf3PafEZY5b7
 sMyMayq6mGIhmdGzu1vtSeAGdGC+BQPloRsXixm91KhC7nhylVO8eOSBjGiY0bouWAztXhRVAG0
 3Y7QqnIwnRrKHKsog7A==
X-Proofpoint-ORIG-GUID: YzmvUbKxu7gUnaCFcPrKtoiACbMwjv6z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX8OPV/ZhPndOv
 gXSRtKBm7SZUA+TFQx1W6nOjEnOFfBQMKKjKvSk6Gy7bn8nD7XU/dou/OfONSY4jmWcbxdOEGnN
 x+a+ARmcnE3m3+glPGZsQ9FmCW7eLyo=
X-Proofpoint-GUID: YzmvUbKxu7gUnaCFcPrKtoiACbMwjv6z
X-Authority-Analysis: v=2.4 cv=SJXXx+vH c=1 sm=1 tr=0 ts=6ac57934 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=TLHcO4L7ZdRFNAOTDMcA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060090

From: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>

Document qcom,qcs8300-camss-pix for CAMSS configurations that use IFE
pixel paths. Keep qcom,qcs8300-camss for the legacy VFE resources.

Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcs8300-camss.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
index e5f170aa4d9e..f85104682e52 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcs8300-camss
+    enum:
+      - qcom,qcs8300-camss
+      - qcom,qcs8300-camss-pix
 
   reg:
     maxItems: 21
-- 
2.34.1

