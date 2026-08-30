Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECB63A5E8F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788084636; cv=none; b=aKc0Y7VOmTlHd5czQo911TUveEv4P0WFibbpH6y6LraZrwRPC/vEyifAobyhxpZ9zI+zie7P7ovKp4IEIVhhOPdRb9uYrEtGlGEcp3IANcRETRet5J+PaoubEo5hR5XQL4WDRUnSNp+Nj2eHp5FDnzsuzHstHEmXITtlG8JZMjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788084636; c=relaxed/simple;
	bh=j5xquh3YmyWbm6HinwSL5zCuhiJDnGPgbOGMgZZ0rMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iZYm8QxdBVTYfNZv1CTHicwoJZxVX//WbCj4qfsQiQ2ok9SOdsyZ/gRE+kaRaKDS4wrkkQW0RS0OcTlw3xpAk5TOSfXNAGDQw/F4bn8X2v93zyZ4IohnWOr5Uv7TmwLxyFrU0r5MIyARRnhWJUM+PtuM+dB8ISvlaiSIYaavsBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PgprtML1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLJxuC6n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PgprtML1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLJxuC6n"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UA7NL91342638
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tsnnJ/6NpmZ4Kbv6OZKO9KkoG7EvkwFyG/j
	YSMybLiM=; b=PgprtML1Of3Mrfz+/Vg6qVghym1G7jiEme2994tYitEWpsew6FS
	+40XKqY+85rJclL/shx6d8B7P+VvEd2DPvCJmHtt8BZf6pLkRJoS0mTeV5cH51I5
	i3PJD0MdEzpAqXuqWAl7Xn2ZUdiFglr1I2KowgWOFgIPJgHBd3kz8g6d/fJtFp8e
	jU0QzzKNFS+dTlGsoPLI9WeiML9fPVGcSabpBHRx/eXu41lBPsEzG9my0KJ7In75
	mP9Bigp5Rp0pLtSuZAS2OFATr5VDBcsAUUiDZbcfMuJRWpYw0V+Sw4DmKDp0A5EI
	2LyNz7o+CtxGh2ToSQFHZeiIn5ATXzo9Lww==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhmtrt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:10:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d52734fc41so52679585ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788084633; x=1788689433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tsnnJ/6NpmZ4Kbv6OZKO9KkoG7EvkwFyG/jYSMybLiM=;
        b=DLJxuC6nTd11mg18vuDKvYjjxN8UGsqOTjqRl7y4Z8WIlgpB/8w7rXt6Wx09jdisyL
         zV36lNAjQmNIDxA6PEgT0LlDl4M+TA2P2718Fx+9Qnw435fDLnVVe6WnpFUUNqCqsVCr
         lnmlqnZG0kMxXNwQpL7V+OsA6mdyVuV/ZvlR9r5ABCPIaQZvDzR2aswtPjdSlfaO4QZp
         wGOh/LcvZ5z6Eq3nS3e57T9gegQdCGcZqukhTX/uy9vnrT7n84YAcn7mQe+DJlEJD3Kv
         JfMl5oWBOq2HrwruV2naa7Hd2eY3vLVL0c4O+1z6g6naSHdHDJqD2VI1COqKNyp8h70q
         YmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788084633; x=1788689433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsnnJ/6NpmZ4Kbv6OZKO9KkoG7EvkwFyG/jYSMybLiM=;
        b=mcmzGF3DjoZLbm825Nlk3XWFTrZF7JuuvGExibDIIQhF6uBUOJrOA6jxObeZOJ8jCx
         cX/TBP83g7bj7awQrARSy1b/VNZW5aL1Q52/L+qndz0ZhrJYsjZRgXQ7R2KWbATUU2De
         PMV8MXFgdkZtMN8QNAX73zK6kDKv4nw8IZUPahyDeZ7kE33wGR2jj971OoTlKZTwjdhn
         iAAtP1sodvbBHkGvORkbuQQJCioz8+msd48Jv7n2fzmm7KMXHB7+VgDdVWNBgnpyLP6w
         wAaGgdheyVBj1qU5zAgjtCOxFDwiB5PbOJYOdcMZ2ONdJNv9c73UDAbLLKKmplft7W/A
         CAmw==
X-Forwarded-Encrypted: i=1; AKwUvBzvcfdQJ3G0rtUZI+v7y0h+DqGPU611mUUtd5NCLctUkKXrdaPZXSfaVL8FPGZ3snqvtoXcbEdHVP1ZJPw=@vger.kernel.org
X-Gm-Message-State: AFuF++nSfJwFBqCDi4z1hNAMrct31PWi7sevjDnBYEFybd3Va0SPzdOW
	XLca1CxdAqMgpMPckWFFO4VmborBFUSPWE4pD3i2IfXDECfBAlBEJfCfwjSLL4J+ML5b74dv6+V
	VC5uXkLvvQsni3elTQdJBjKZBkkjH1+e+X4qh8yEKGc8E7s7mAzVTLgaZVEzaiZsP534=
X-Gm-Gg: AYBFou3XSO1yKsjBUsdnujOteiJ6z1dvRfkRgzfxrzcDJzQsSG22VPCTxMrIpnF9dfm
	ARxyA9mzIA6Q3QtzkqokvrI6MH5HBcLmyhh/FryKoI1XpvD7ut9TvzqEpxQbM8qPdZ3mmTXFfz1
	96rY/wT6R8BHtwZecK/SYA6cp3/SSCwPreqvjRzJm2Zn3Ngdo1vGayiexSIKKdyUI1nGZsQGTPz
	tp9d5ioW91t+t+wCSJMNRZZWM916CKocSsYtAp1BJmslFSaK/nvdfOG5ytj39Wv7frsfA+pLNou
	/iOuod4LrPfOr3NJsLhdtUozokPRrNTcp8DcPC2abqmCDy6Q8deyY93pzlYHHBKFTi67pxAGMQ3
	6lyRrITQrSB+QHV5Hll3dHvL0aJ4zouCRXT2gq8GuRJrDSxhgxbxXNLnFJqs6
X-Received: by 2002:a17:902:f78b:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d74dc78debmr313679755ad.4.1788084633426;
        Sun, 30 Aug 2026 03:10:33 -0700 (PDT)
X-Received: by 2002:a17:902:f78b:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d74dc78debmr313679155ad.4.1788084633005;
        Sun, 30 Aug 2026 03:10:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be440sm25312274eec.7.2026.08.30.03.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:10:32 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: thermal: qcom,pm8775-mbg-tm: Document PMAU0102
Date: Sun, 30 Aug 2026 18:10:25 +0800
Message-ID: <20260830101025.191697-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4NSBTYWx0ZWRfXwdd9hc8FWVdN
 u+Rb3yRjghGWyPCXs+xyt6U7L+Oz1DY/v4osJcmS6nl3fRJ19r/G2R54ltTvAFUaswkUCFGHVbr
 3Hc1ygQ9bGY6LQV1bi2xZUpXXRFsKQnXKgjuJaLYzKqiDmx3l1ZPVP9Xsg4fxBnvGSyXPIIX5eF
 +9RKpgYJ5Bo8QSDG3Gy7ks4D646h/s9cG8x2UgT0FOeCpF7d4SWGakatAdntFOWlf4G8/AXD12S
 CZXS2eBTTUGOprkTPOFKMe66FNvtfeAytYLH0pxHSpN8dPzg74bN0Cv+mTf2ZI4nNrgrPuSTZjD
 5Rh2HKJBMMsLZ2ok2icqAU5ShP2X7Thro7AVqrC1JLYrsB22DMk4JMM92HlY4G/Yc8I+AGSzBiu
 rROnv1JsYca/ADhQwC2YPwCnfNJeY8dMBxbiCSsiyuoiZL/mozIltWm0mSKlDk7FKEdkXx/Y9ru
 QwI4UscbmtXCagNT3lA==
X-Proofpoint-ORIG-GUID: 2VSjlRvdGeysqtaSKQVUePZpai_A4djn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4NSBTYWx0ZWRfXxJ9ilr2hCNs4
 3zZTq+bdLwb7GBJPwTceGXkaCxtmi5JBkCR7/90wset2EfvRl2mvqzBDr1mnIMi2wx+Y/s3UDvZ
 YJ07VcjTYBpqq4Ya3NuXlNh8KPt/Kvo=
X-Proofpoint-GUID: 2VSjlRvdGeysqtaSKQVUePZpai_A4djn
X-Authority-Analysis: v=2.4 cv=bpl8wkai c=1 sm=1 tr=0 ts=6a94019a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=DV00hUf6onYBliZHTqcA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300085

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Document MBG temperature monitor on PMAU0102 which is programming-model
compatible with the one on PM8775.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml b/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml
index 2e084d040625..ef8361a55389 100644
--- a/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml
@@ -21,7 +21,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,pm8775-mbg-tm
+    oneOf:
+      - const: qcom,pm8775-mbg-tm
+      - items:
+          - enum:
+              - qcom,pmau0102-mbg-tm
+          - const: qcom,pm8775-mbg-tm
 
   reg:
     maxItems: 1
-- 
2.43.0

