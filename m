Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDD2347520
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032376; cv=none; b=R7eT/DzmEhoNo/vAxxqSycshFItHEXG8QA+jsScUkLJNsa/3OgQ5A1MNXOSvakD+aEDZ4S4s56YGGe4zzl8XUnGDq1R5CKGl/FieEfqpEPj5fvUT8hp69VN6HVH95IbpgvCzyag0uhTsbiypMxJjCGaiIlKxBy2Iw5GA3wwSFQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032376; c=relaxed/simple;
	bh=14pRJOGIwo8TIL8RG0pEdAy+MzQHM/WiTwyzY8WivNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nldbHCq1WnKZQSKl2Qa26KLyM/m/y8wsoj4GK8IyyY4380D8eStmhZBynVD5aHpS0jBKMo+nB9kYAf5pcc9l+75L4qtKC/vCyDQweupvf8LV+HoJWilTrrtswFP7SAfWYEZiY6JSYLnRyDMgiuVyrysGLCxBjB3STy5eTZViWTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3OTTFGL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d65HR05l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3OTTFGL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d65HR05l"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGxpf41743620
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=h5cBOIsChMmPawiSGTVi4rNoB1oms5Ev8/b
	y4am/czc=; b=B3OTTFGLjUM5oiZW76GyfdwahNT2ejkXDMFV1SBtzmeSX3luCOE
	zWd761NRiFXAinvrOh/E9OLTHTgYV/ncqTJ2J9q+o/pkyozeSR3JMxl6uBmxnSyO
	xz+y1Rfrfr9+B7yC3WCEtEliErhUpGjw/9v1axtsEBqVUq5VE4aWBIBIjyAVJX0f
	VWnq7hsnzyJ1FICHNkTqizTUvhnYkvdLRRBZRJCw6FdR7sl+8rsBPQ8/IX0uRAra
	wdiewlEV+3RbXTj4A1e0xjdpA9cwdOjqN1fFHylzh/YrZRT7PUMhNMw8O5Ob81RR
	/zGIpqDJJj8+4Wezt/8lKcdDIrH1JIQpHuw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq81g29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:39:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52f64c48bf2so44120191cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032374; x=1788637174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h5cBOIsChMmPawiSGTVi4rNoB1oms5Ev8/by4am/czc=;
        b=d65HR05lsx+7pteZATEDHWtclsEnmStuPtk1VOMAs0GbM7KNk6YLhGWdAx5bTKFAfR
         mSmDawsSJBx1kSQrbzzRtTyi+F7W7DqNgUAVJgN+6opzW56MsWpAXr/HsRHrcwFpmiRj
         Ld6ZAuXcvg+c9bovVt3pvjswF5z3JqqVT4JQe2nVYviOUC9DPI7PQys3rncFrt/UjGkV
         BkKRIG5ct+0qd7w4hLm0lCAzbPX/MkX0/wU8Etcv4nKKETY5JgJFUyMBwVd4CgQgrY+Z
         gWwFEgFh+s9Z/OpLavi2+GrX4AWIrCgM2Qm6za7S3redX0NKsTCwLrCZQb09KTJ41v6P
         Tpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032374; x=1788637174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5cBOIsChMmPawiSGTVi4rNoB1oms5Ev8/by4am/czc=;
        b=cYPIP8yjilZojtgRGce8qYVdG66sx5yKcmvo2wEjkiRiqo/I3uHyGwjyE6vaYxW2e/
         07FGY40Kv6Hn/lO3CHtzC1Bp4mxTfbgn7AJhAwXY2AJ7ckT0VgV54QjSsn0TxFva6mjN
         qH1wqYSmKvgjLotJhmrsfMLggUTTBllIQr8oz46CmWEgQ1YamQdtELjFv4q4daQG+Kgs
         Jq62cy3zaQxLectKI8FgmxMuCpgzqDzH7eymXXjrS14+NI/RmNncaledIqSUszElA9FU
         Bi8BH5q41l9ITlFr8ge1jvUcZh8mDRhVtGRD8pnhuhdnd1jkT8M5eizRRdgdGgRc2vIt
         OhMw==
X-Forwarded-Encrypted: i=1; AHgh+RqUeZLOSGZ0n0GeFh0MjJMFFztHe2I4mbT1Ydvb4Y+RWAsVW+upkZhCFccJ8iUidcbj6OnBheoRc4Yd81s=@vger.kernel.org
X-Gm-Message-State: AFuF++navuEExs8dGYd+hdNmyCyizjFBnybb9hWv8dteG/oRUgXTDt8+
	pXIKq15zynsdnSzhZvhqE112wyBecslg19NKfQmA53JpSA87isbxJCE5tq5c29sziPso/PwwN27
	mMWQgHUeqDCGOsoELyYbr12qJjsUylaETMg4x/LWnD76i2JYh6E4hl0HlmQPhl0x0xmo=
X-Gm-Gg: AR+sD12mCVGy29iMdaC84gByWUm0GVclG8ZQcopA018w5z37rA7P/RtO9v7t2Bw1FJ5
	xlcztPHcdXBDUo9M7zhMq7NRUoUa4czw6iXwXbQXvTwdD/80Hv1tViVFDVS5QOiapL7qXU34yUO
	cooqavHZdvCvgO8EwQ7FRf5w6TVCFo5fBULURPJrf9r81+mPzhzEnwaLvKynS8+YDXrnMcO5t6L
	MNEV+IzwLnR0U+w8vvHzUt0pW4JeHyIZbPrlCAyDQ4B93SJzvcxH8Bq2YOmt/WFCYUsv/BswYSG
	sPys7hKzZCcqlGkV1DbbcNrh0FyFAtKvS8P1Q4mJEhMO6ixXvi1si6Bjxgf3htvmUILuPcsOqNi
	WNTJVxIz0s5dDZWQ=
X-Received: by 2002:ac8:5a06:0:b0:52b:4e1f:941d with SMTP id d75a77b69052e-52fb9374694mr181764361cf.6.1788032373630;
        Sat, 29 Aug 2026 12:39:33 -0700 (PDT)
X-Received: by 2002:ac8:5a06:0:b0:52b:4e1f:941d with SMTP id d75a77b69052e-52fb9374694mr181764151cf.6.1788032373197;
        Sat, 29 Aug 2026 12:39:33 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dd2517sm154693495e9.7.2026.08.29.12.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:39:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: cavium: thunder-88xx: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:39:21 +0200
Message-ID: <20260829193920.107498-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=14pRJOGIwo8TIL8RG0pEdAy+MzQHM/WiTwyzY8WivNU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzVoxPOml1vE/yuOv0eAhHblZMtoGJFKV0EkP
 xFtDSAc7LeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1aAAKCRDBN2bmhouD
 15aJD/9qhJl3/ZsR8uunBq6+wTUMT9AHYxXHR4gARHCULuGGI19VQCU7ajqYWhhWKK5BJlvoukT
 dopzJCTJsbi0d2vKCEBcqK5V3b8ioyDb/IQBdkrSawlJr+MvNOn/ykYaJkDIE/Dtuavebhs6SEB
 YI42n31CpaQzjL9Hj1NGHIZrQIeXemtXE+L6eM3GSQevcZFjeLZe3yl98jRa3qWuCYG3LMVj2Op
 PUc9UHEx+/zhaYJqT7OdGnmpa+l6S7HFB38ggqX8vh+bfnR0mbKuqfHVIUZrktTCBYwH3V0brKI
 z6ZQoxSpV9YONnSB2MnHvTYV6E9nmfkyibCKu+sGAxms1spdbXTGTzPiMIKYtFVIyCwtny4mmeM
 y5vX2qFGk8cGAcOS/ZiiKHyEmIAk+HwsADnQe73hixgpbwml7OjfgXdOmSdRWB73OqHNJ61+v4b
 p7k5uf9AqIn2HNLBzSp0xOPMfo0zgnpO9I1YgeP8uA9NKmvSjnzqyJp3OUratTxA7A/EoY5dzt1
 Gz1mmy9GEoZLmT4WGe+4lhThsRqZfL8FKTNQ+rk97rCF3ndUxuQuL7x80FRfBAkgJirqpKu5qvt
 NiDvMMLzcQBqZ0QAUXKTS9Ea6FQkr05c0Zjc1LUwF63qQ2LNTJI/wk1PgaSUw72LkZ/rnAb5b07 DwXaOoyChslcB4Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1e6HoM20pC_hU8E1_Yt9Tg8akncNWtvE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfXxKCtR2psXTca
 Sr4lbl2j531w+/RI1+rxzupLWawwfyD7sfWeTU+NH/ElSP54wQUshK/Qk5dI6kko7UfE9kxfWB+
 /h4h1YqpYmTG5rL/X11BSmOXDjL1rbo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfXzVMtMZ4PWnD+
 lOBh3+BJUhQ+pmx9LWh7czuT2p32z+WCTHw3KwNhUHXu9eC5Q5i0C+16Dn96X+XnkajxUT14gzx
 kcN16uEDN2GxLqNYogVoWmLdFZ8wdTE3mQHjPbdVi7RqiSiTffBDsxf+zVJvdpQbd533JocBfRD
 zosStTunhjpW+RxQjE5vRctQIvKXiuEVayb54bUHY/R3NQKZk+CQ/W5ZP7eucvBzNP0UhB/ft8C
 GONa1GrAisskndL5errOGT3ZUpdSZanAzlaPIG9EGHFgj2RHT76R9KJ4gXTQB54yKu5/8HE6+MG
 MKXAEVHCCAe4cYTZWT/2FNvKfND0sg1mfNX4BIbpbGs4IyNnmuj5vUEMWoSbkVxjR3PuatppMj+
 EW3sPlqq0W+CfZf65PNTTg/tsi85Gb0QrMQQBcZzEXu5OmlO/c81+R55w+GNuD+UgPeybKM+Whi
 hXBFc0uOOWRf9dRg2Rg==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a933576 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=JjGN2f0IYHD0VWcqIQwA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 1e6HoM20pC_hU8E1_Yt9Tg8akncNWtvE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290170

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/cavium/thunder-88xx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi b/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
index 70430cb2b053..5bcc220e3d38 100644
--- a/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
+++ b/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
@@ -355,9 +355,9 @@ cpu@20f {
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <1 13 4>,
-		             <1 14 4>,
-		             <1 11 4>,
-		             <1 10 4>;
+			     <1 14 4>,
+			     <1 11 4>,
+			     <1 10 4>;
 	};
 
 	pmu {
-- 
2.53.0

