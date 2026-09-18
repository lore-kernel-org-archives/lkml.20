Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB693DD86B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789705749; cv=none; b=FlnhDAHEUkri8LexFUVK3rYby8V7qVMd9BKPX9pOLwnc5nDRf79bY9qx/F3kja8fnnjugckg70Htgjlx2spYuSfUnCGAncqloWIBz6sn8snx6yBfJF3TCAZp1zvJQ0gsr43op0Mzb1b3zPZNucoFcoQHaZEPGGspaVYtsy2oalg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789705749; c=relaxed/simple;
	bh=4j95AdScqCZUqe78NadBsPLDTCF86ubLqdl/5jQITZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hO//vXEtpUIbn305ZcLmn/y40zUA3Z5wy99Te9xO8fFXeIKlybTiKLbXZM648lMDlHmwMK1mdrYbMjfC4LwQA25LKuMAubK6LAzfLOji0GoUh7Xvyb04qPJN6tzy+Iz2nJ9qMJre+X9clx/JT1ZTJTIIfSnGbXWmuFSoGjuhArI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCiZK+C5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jv3kbSl0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCiZK+C5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jv3kbSl0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2UZv92851857
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vNSqr+Rk87YOsnTrOXZyhE/rjTTAgCWWWaJtccYCJRo=; b=MCiZK+C5xkpdMfCF
	pUhTzAW3gMPXzSoN1bNcB2CNWC+0CN3POeVCK2sGrjk80vVuP4l1NF9I2eEYghWy
	h2aeQcdq1Q5VWuFrOOa+5NP3fXP0Crm/7CYgSRYdasTJV0M1gP59uuvT7qDWtBzk
	BGAFVV8ayK+p9q6PvWUCbLS1OzuZ+J0XKVOkBgKAbma5bJQQ9fgtvob96/6ZIJ9z
	y2QuLDiHLbC5w4WK+MFxClYxz1tgLUGVzg0d7gj+iQfu1Rgj83Bsn1UqTdnxUKxZ
	Bw4VQdiOYjLtJxKBwGBTRXduGdJIr/QNs/YHs6uDvpjrCGiD1F/PaL6yKybF2Bt+
	RXCDmQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2ksqf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:29:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc2229450b4so283661a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789705746; x=1790310546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vNSqr+Rk87YOsnTrOXZyhE/rjTTAgCWWWaJtccYCJRo=;
        b=Jv3kbSl0QaY5d9aZl0A1p/vPC4oAMeuPtm0wlFQr0Tr+AYdBrWwcQ65g7ngCmEsK5V
         58ahdB8K0H69wptz6kaXXzszRXDxyCisv91Gc5VbBfTDZoHGBXbxpEhFTsodrs2r3mPk
         sH2myarg+z71+c1KfxujAyzen5gjZWPTpuX+MUBrgBJe6T+GS3d7H1EKgVOW0J4sM6TY
         Y4GSHLtKmdjuSsZovW87w/pQsNCtF5QgmxOpfeHcI7iUwq9HcgJ3ieCDubduXmeHtzPi
         64zisFDRLNEWs21M41xLxVXLdhcdTkDvvm5t9woZbCvZrXQhyP1tpd538XQKCtcfi601
         veHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789705746; x=1790310546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNSqr+Rk87YOsnTrOXZyhE/rjTTAgCWWWaJtccYCJRo=;
        b=rMJ4wQv2/Vy89yizjH4MU/GPOpBDw3Th005TGc7pY1QXZFsKtkS/rbg+WBD9SqMwh+
         3+5dq7PC2Xpj9f7ukfKjhsjHK8jRf+Nplbf3sw7Q1d6k8XTkS1zTlbmTILNISawcq/so
         4+INlAYMzt5HwkZy895qOCpqc/u6kh7bXfCSDoRiPqC6BnLJ+8OgLEowSmB50JCGEp3J
         VVPZaP45frV82hJi3DBea259FV/2/k9NeyqlxwVgk2/huNQW69QzAcpJUXltbZpP9Xfu
         zmyRpRnulJ1YnY2yVVN5LROVncOV0k0MQWib9GB+Zcj88a7hUWfFm0eIZMeIk0CMum4k
         O+Hg==
X-Forwarded-Encrypted: i=1; AKwUvByATEryyqGBIrMP9RJqH6s+8/1fEEAbwGe4l463Xd4aE/ySfy5WHBHVV9gEMZWR0vyZGN/uG1Plh2RxrqE=@vger.kernel.org
X-Gm-Message-State: AFuF++kGatNBw3VBcCw/d8Rpo1QdbF1As9K051l8DbiXzSht6Y4PlZQY
	qAqCbQaC+YrHWZliRwLTpTguxokZ1O0N07Fh9sufUA7RKROgAlFZF1oh6KJXD7xvpRYQHtHb2No
	YRSMusG9JW2Qfsz/MW90qRSyfRI3P76KxmDD83B7dHOxfNB6fDAUKfsLAZbTLl/VpbgA=
X-Gm-Gg: AYBFou2b6ZeRFjG8x0DN4Ef/qM0pZ3Wsin3EfDaVXOx6t12XcioRDHqXxly0sHBw3lt
	DCobOyeQPfCN7rGFpWrmXQjdSrRx75/bEzTzOrwImXq09Vz87A4TUgerxarHnSEvscWnIoh1v1I
	QY0OxKig00r94Kcjna6ng22x2L8EsJgxpOJV44+i5cybwKuVoOXGNu2VdOnQZzhVCbTp1A33RAE
	TLo9PviHNKkbikTvdD6FJMAt6RIPxhJnCQlbitpO2wKMB5Cf0WFRizWY2ppDNsmLm1TVUjeK76m
	YFYse93HUIZ+XNByevrueHUfZ46OMNXMoB6w6I6suRHtMTP/PuKdahdqGETOmTLSw5tkyH7uWZ/
	m8L2jqnJRg1MLfhMaoaEtIonnmlKgW0g=
X-Received: by 2002:a05:6a21:1690:b0:3da:7140:da35 with SMTP id adf61e73a8af0-3dd8c39ad61mr2809859637.15.1789705745803;
        Thu, 17 Sep 2026 21:29:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:1690:b0:3da:7140:da35 with SMTP id adf61e73a8af0-3dd8c39ad61mr2809814637.15.1789705745400;
        Thu, 17 Sep 2026 21:29:05 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c4dba322sm214595a12.10.2026.09.17.21.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:29:04 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:28:40 +0800
Subject: [PATCH 1/6] dt-bindings: media: venus,common: relax
 clock/power-domain/iommu limits for Hawi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-add_iris_for_hawi-v1-1-ac60fd15c98b@oss.qualcomm.com>
References: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
In-Reply-To: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789705735; l=1480;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=4j95AdScqCZUqe78NadBsPLDTCF86ubLqdl/5jQITZo=;
 b=UOByjBVunhomcKzMaDfypw9PHAHMVJ97wORuq+6SfPAfwq3ZcnGMRssw5XKGY9GbnrZJJitwi
 dHb46wPCYFyB9I6+6uk1TgO1HOkLJ8HUklft7dunsj1xj9os6Al9Ww2
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA1NiBTYWx0ZWRfXxR0X287TUpxW
 hoRQsWoHaPmOZV3zgU2GpD06OcnArZAS/0Rn2umHzIxnHWzBm7176lD7EAsmXsjetNc+DRezru/
 vToh+tWTDynrTUZwsabI4BXNw2qwo0AwWVDDzfrS3FH2uWlsgHW1N43bGK4JRNi8Wuq57wxMWa3
 TLkHBBTgyherSw9MI1B0Ah0R/16YqoLVZsfnYiYnnP4idj82ent+lWpG0lvuM1vibwrJ91APWOG
 z/VWuYrFHIwqoFtt7BK06YA3Xm1CJfDYPhmbA8EiL8dPEdil39oYKmDfsY03b2DCqerAIQBIX5r
 F5KTzk/VFBwBMSSsHNyVNOEtlenOA8+XzPKU0aBgy4RGct5ULxcp9pVbUrkdhCv2yuiqFSkv7tU
 5obc3u8pe0tj2lb14NldtHOvkS2bJYtloC/hOs7kttCo/RS0hsIXQzks+t1iUwoUhIA1eRXERHl
 xGZTgWdMKyEtUzUgCng==
X-Proofpoint-GUID: dXIP8M5YePTLbdNDBLCPV7qYGg7vfFhu
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aacbe12 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HhAAYa2kYXLYgDpgJ-QA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA1NiBTYWx0ZWRfX8eY6sVtmI5Ds
 2cDB4aC4pP7DbGcqcThDck1PDpX7k9fvns4MWnJY8vUJ3IEoYxbt3tTJ8d2344i2isuz6hAADd7
 FzxpfOlqc9xHexXn7x29wMeuYN4Uf44=
X-Proofpoint-ORIG-GUID: dXIP8M5YePTLbdNDBLCPV7qYGg7vfFhu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180056

The Hawi Soc Iris5 video codec requires more clocks, power domain
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

