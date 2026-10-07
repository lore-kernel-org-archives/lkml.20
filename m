Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2B0497B87
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363845; cv=none; b=B1NJ2b9GKDyUMoGtNKMMgdAeErvilv8XTw2+zo3/4Ra+b330ZcLlw4YHIT3thkXfHx1Z2+0VFrMfyN5jN1wS0dDr0shmFeB1HFuYUQE5PAcy9b+Az0mwEwG3PkidH/XTtS3so4OXtlNWdm0j7B4FcgXmiEwmJYt4zPl0JQq2kx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363845; c=relaxed/simple;
	bh=Gi+0SxuObWSnypm60XIzwS6sBewS3GWrLl3c8ovucW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hnG8XlFIcHnNesre4PaaMV76II5nWN7a+0zuX22WhF11x0bpnniBBA3FO7oDoMZISfuehGhwIg/kNOi08qizH+r9ZFfIgvwhQV4igisEJ9w8bd8WA2Gn1WTXU4grDIHRdSXpt8ur94ZMmUyMEcye696uCW0Mf9XfR9eb93fHz5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOmRH/to reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOmRH/to"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jffU119499
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dlWq6Ov7H3Z
	qTYXe03p4byFmP3iR8MTu4occ91czj84=; b=XOmRH/toX8dbOpqKi+tJy0eUIgx
	txR6mJGJY12YA+kiskNqv0gDFgTQMQCdyPmz/rCp7Oscv/BVmLq72CSkqccQIOov
	I00NVHEy9b2LA/7vzk5nPz58ASsujhZxnrmJRrZT5KcY4ngkY0RvO512EScACt9v
	pofvLfI8XTaPoT4NkCr/lLr47w1FBhMpYdfExKoRPB0Li4Wu01Xye9UZqxYAvYe5
	9CHAVhpWmtcwQho97pMcj0NEoO16Dn/8Agd/TAKIQlNct3I7Km7m8E+yqJuYpXwN
	Q19mMTgAalFuLKM60Vll4W7kAPTIOB5Q29wlbJFFaLbsU+e3IuZjkwc8RZw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc58ran-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:03:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ce7a85f04so701352585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363798; x=1791968598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dlWq6Ov7H3ZqTYXe03p4byFmP3iR8MTu4occ91czj84=;
        b=2tLkYMiNaBNnyJv41dKB08v6lZigaxKd9FO3+Fw3hOXSVN9sHbdsTmSc8Ej0HeTSrf
         SHa4kEWlMgBLU1p8K1xUltrxwV1wj32rqNHmOHlRvpFajkTCnWSGxj9FbS31vsHqtOaE
         BZVA8w42O9niOxIrH0Kbgljo54lE8NnUIpN/1r16FLMDAfFt/9TkVgaXJabBijOqjZDR
         Qd7SOPzt0PT/QFWxtoiaPBVhgKLebJmxXJkuFY+hNFvuwAH1FJDf3wu37VQ95lKMhqNv
         g8BsD7a0Xgb6u0RZDu1BJIjLlwFZzOVoFpojb0W12VeuIvr/qbv99opsgEq+S4xKbaGH
         frsw==
X-Forwarded-Encrypted: i=1; AKwUvBxzdqsDESx/6O/a0xQpnXtXLZu0g/gsDwtipzbM0DpSF/z84a2fMeVTjBFlI+MZ7x3ZXUr7HWqLZpq0EWY=@vger.kernel.org
X-Gm-Message-State: AFuF++mFmgCMIFTddzVsHi1hkQI+3C6ZRZWQSR1c9pIALfzGo0bHAQtu
	++292TXL55Jrg/p13bjLAXgOuillruTvH6YGcRW158D923xNi4nY2Cca5xAqfsXcwxh1KnW+oYj
	eGIFAamzR6On8/e0AtCEVllyHbxiYXQBzuAubitlP3rq8s9TKGrmyAHhq7P+zHMXbl/A=
X-Gm-Gg: AYBFou0MCmXSPunfb+kUHh553W35zPqJNCxOoPDI5C/u58GWXeLhBhecNAGbQeKOLGb
	b7AqF2HbsuJUAGlCuYOLy+yUi+Uci/MMYQAuPltTndf90NcLz+ZZfWSqEYPMHe623MypZSDmZiP
	S+WOa1MqnyTDZnYFmwVvdKAxFq/k00uerwfGGvFcBrTx4Vvjm5vphMA2+zFmWkcAzM3CIkYrBWM
	jSAUymBcSsFoviQ1eWrsPgEcI9yo7w8qYQ4I5mzSSabwb0/AQWxdUQtKZ6l0HN1OWAdLGLRMIfn
	KN255nkYA7p1K5QFod5XyV5BmEgP0LJUusRNAMTftyPWg1v+Y2lUJemfqd8=
X-Received: by 2002:a05:620a:4544:b0:93e:5055:875c with SMTP id af79cd13be357-93e9b77d3e8mr311436885a.31.1791363797600;
        Wed, 07 Oct 2026 02:03:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4544:b0:93e:5055:875c with SMTP id af79cd13be357-93e9b77d3e8mr311428585a.31.1791363796962;
        Wed, 07 Oct 2026 02:03:16 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:03:16 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 44/45] dt-bindings: media: qcom,qcs8300-camss: add pixel path variant
Date: Wed,  7 Oct 2026 12:00:40 +0300
Message-Id: <20261007090041.3732717-45-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX8K+EWJrHSW8W
 UQPjWPhO8xs08YsfXJhZBrigVQ47A6lFmgB5o/2LtJrQ4huftDlr6HlALsWcbeIPrnWGqQWqmZh
 2AVfeWjBEeZx3cGSAPTeqYYiyVGOPDQ=
X-Proofpoint-GUID: FQ5ss_PiYMYZ9mIKdop9bK_AmeTDSJig
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX3kXH7Pu+SGE7
 SK5YuZAb+U0WJ+biGedVuzgun9yAyqpWaOItOS8ktcrTiZjrsqB7bDO2NlxPkZHknrHZ5cgQxo9
 8+FcxRsQsWbieBRb+XWHsugTbRS1civ1h8WP1YQdzAk1SjfZ+8FlVYkqElIJf6qJMjZ+LJvx2Hw
 wHHDwuLnTVib1qFWKvi57CQeXUlxdhr5cS89FUXjM2VJSwtwYhFqU4RH13k38k7yx8SL9eElshg
 qEc3Z61WzSxF/38sqzHOP2GGtbZLnhcQeYYh4If+G2S8oZ+ffeTWc5ytQsfgNUpId+2cYmU8MqD
 AwHk7YUaeGRwVtmuXYz2eqwdCRn+CpJYhmU+YYmfb5UluFRyR0sgm0oAKKM/Nb9Tri0CaEctYC6
 ePxbPwWCHcUndXcmVTPb6HTnEdLQ5XFwMo3VdbcakCSmiQBKVo8tTq+GIrxhEbH/bTshdjmVQ/7
 FUuQvjR/e/LPArLJnSw==
X-Proofpoint-ORIG-GUID: FQ5ss_PiYMYZ9mIKdop9bK_AmeTDSJig
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac60ad6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=TLHcO4L7ZdRFNAOTDMcA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

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

