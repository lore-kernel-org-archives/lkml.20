Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E230F3A961B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855204; cv=none; b=dArK7SuoylRTGThVrpAZqNjCuKY9B707Ku0Nh3tgQdB3AWxcBKzIpFmPuCj3d9o6335Zn6BK9kCitnKLm/wpmHONyBXFaFjrTrQ47p3//ozp42tRfWJ4eg87Ht1aXLi7i6Q10m7qWn2XWnN+ziBCufvc8EWmJqxtd1/p0WDc8PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855204; c=relaxed/simple;
	bh=VMGWdrA8xlkqQ7sZxGrmVOQ6YHsBW0knpDk5U9KU4SQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JkYWrGdEbtGnUcRLMRO7wZ9v3w+/gx0l/6XcvUExYET1znm+mT3LfqPzoB3iwGBM0fDUNarfkLmr0qYXAhBYcgC3fFsLx4IkBziZA7qFe/37i9jbl4cdokWZeWTX4WsePYtrormAvP5E66TcMTrt5auTS2bDBPI/aGnGwDHIXsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fuQXjMUI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OlLZldzf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fuQXjMUI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OlLZldzf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Lo2T2502343
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 08:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CMyFQ4CJKUx0aYyi7EHbas
	259H+D4TOmft4ws/+qPU4=; b=fuQXjMUI737/YIjiKQ8qMPAbgREhjkoYS04zE1
	sbdf7RkDgLzTXOQW3lWo0aUbc+3iquCsn5acWBXI3dhgVOqkYJncadViVZh+YIHo
	7qeVx59794285MZKPa1HF6mcYJCXJe6YmkUEqWx5YyR9H1qrH5E4Xno0js5Io16R
	Y9X8KEcAm91Ymeh61FnJ0mogyJL2Ht5QuVcBdXocNDVR88yRYEzgIKOzV0YI5q5S
	5yOiVZhoLxWsFkSm16hZ/5odu2nC2i5fhqcSMUpep1tJNPNRp4ZqCVp28erNn41y
	3I+NJCh6wJHvVbjglHvYuxiIAr7bXJHosP9vs0rp22to2HKw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7ggfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:13:21 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-455ad408573so6841620fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788855201; x=1789460001; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CMyFQ4CJKUx0aYyi7EHbas259H+D4TOmft4ws/+qPU4=;
        b=OlLZldzfMvCGLDmXPD7mt1IQ4Y97Aikek5VXe1EYIH/bR1CPFk8D2H3FYJgJOoLs+x
         Wor28R7Dwyg39zKtVY9tFFX+Klfrnndw9Bm8yp40yrPkGPA2jERKm1YLLxAq+CsLy1cQ
         Vyj3sj0zy8tAXXieyfOLMrkRjnsuwmYTO7Hut/NVDk9L2PxSY1cGPMQ0xA8/XLWDuqWa
         BuCSExbEMWCFGcELn8w4tzkJU/hQW9YgaIqZzbu6po+Rcjx8DKo20iVG/5eglrUFbwbI
         ZE66okOzRLcByaQfYtSrBqLzhL+3H6mC4Pm0c1dwPzmJEJt0M0Cen8irpUvgzacYmJW5
         /6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788855201; x=1789460001;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CMyFQ4CJKUx0aYyi7EHbas259H+D4TOmft4ws/+qPU4=;
        b=M/svEdAj1Tg8fLDKRgRJwkUaA/OonxeRHay5gA+vawz6JihxruktsxLKfTpoDMLT5L
         RTPgYG5bDVlRWNBNrS/zko9EGY57unPUXTlLafwc91xfZml+4zyrRHLp44bXQpqB4oJl
         3KmsGceqHr0xV7R5nxl9NQdGtGJnNe5nQ6aU+A25IilKXH3fTmBgrLrOpqkUhBWZZGGq
         TgJFru8pymTq/vrFTTmKDBbdOmHh8Y6I4EJDTP+UsHZ2Lc8U5d9Unv2lOV36/mCpqovT
         mpy7zWE1lS2UDakLLbfV0J14HELEaK/SuBYIZro/IgRa4z2Iwn3gaPpC+w+kFtd4FW8H
         /79g==
X-Forwarded-Encrypted: i=1; AKwUvBwybfyhpW1m3Kq6fUjyQFpCRDB98TFYEx8Y6znW/JOqoz3GCl81T+v6MTf+4JWv+fOCp5xUSDqCmy3euUQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kJQ+SLDSPo9GRTTakr2usUwBQjDMenpRF4gL+14L9fISx6E3E5
	Y/Jo1nK9e1qVdrfbWZ40oVSjO/yo5oDp7RmT2pZuzO0VspCj9nttUbwDMFUuHRDdTxAo9OZEmXo
	LH/6C3jfU4OKam9AgChW9+o5nPX2VuS630SJ4N++11GmVH44Wb1YYClc+4DUJtjGzkaU=
X-Gm-Gg: AYBFou2089UnM55DGUEun+gyCgygWDbW7Oahf//nbPPApt3U3nvi8ihocnj3d6OQdNP
	wFHY6OFQc/ze2OxgT3+iSBOYb+QiE9K6EtBvmnUo6jvelnz2OmVjSAp1qRv53f0PoZ9J2FwxJ/L
	aIQKp6aU/HICR+XNKVwy36D2B2feeK2++gwfbHdUDsfmJbvko1Gogv1K9WMgrfx2BhsuzAFhuvN
	boU0Dy4tVPOaVpjGdg1WfaLw6fyUyo8MH4Xjxackw2w3cQqDNkDVNo+ksiYoOz6ESBfDtt+uSi6
	j59e/KuHNM+OjNYburgDVE6dJrFHQ3yV6cy+2oYRLHJwiXbtbC7fn+w2heDb4uAWnNvTBpIfogO
	2Z4AzZv8vRy6aaKsvB4dhwor/cxfqANVYheP6
X-Received: by 2002:a05:6820:603:b0:6b7:46fc:1c4 with SMTP id 006d021491bc7-6b746fc02c4mr15280606eaf.35.1788855200962;
        Tue, 08 Sep 2026 01:13:20 -0700 (PDT)
X-Received: by 2002:a05:6820:603:b0:6b7:46fc:1c4 with SMTP id 006d021491bc7-6b746fc02c4mr15280596eaf.35.1788855200594;
        Tue, 08 Sep 2026 01:13:20 -0700 (PDT)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm31465982c88.14.2026.09.08.01.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:13:20 -0700 (PDT)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 13:43:08 +0530
Subject: [PATCH] soc: qcom: qcom_stats: Add support for NSP subsystem stats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJPDn2oC/yXMTQ5AMBBA4avIrDWp+gtXEZHSwViUdEok4u6K5
 bd47wJGR8hQRxc4PIhptQFJHMEwazuhIBMMSqpCVrIUdnWmY689C9RJkRqpcpOlEILN4UjnN2v
 a37z3Cw7+PcB9Pyc13oZuAAAA
X-Change-ID: 20260907-nord_stats-ea163d025d43
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788855198; l=1105;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=VMGWdrA8xlkqQ7sZxGrmVOQ6YHsBW0knpDk5U9KU4SQ=;
 b=8L/cd7SrSkBJgMal4roe/f4M1BojIX0Jsl1PEdD+ceTBFuYYyFVrKi+X2vmvZp/GnzIxg9CM1
 6AzYcFhNYe1DX1cbwFeHbCeiCJJa980Gu9nHJk2kenErQc1kpc86K3L
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a9fc3a1 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JoL_3e-GhyZJABErYZ4A:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4NSBTYWx0ZWRfX0JNR8AEd6qJO
 snxjRTGnpIF2h/yhzTY6zGUqVuSRYiHvMTG+qZLKNxFjXHLtL7EX+mStCI4WBw8zRpzX5ehgoJx
 OyWKZjBVO7hsgqtU4WmE5WIUe71wlMo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4NSBTYWx0ZWRfX+5GkYc7O4Ayg
 S7Wt85nHs0tMRwdJ2mTBF/QEuRK0od3R4i5PyiNcjanu7ejzCTy4kAuK8SP3iJv889NW4J3yXAF
 BARWuoywt2wzGAn3Ca38pjbeieQS1GThISf9hs1YtIwNIFJZ3RqhIg3E0izgJElUBVSqeCOloAM
 qMx6EeDJM5nYklJp8PrVP7EzFuxjLeIuejUTF1EafXYSDi3quNQD1ViEZT5UrsxpCOnNPObudsw
 rpfJmSh742vqHZZl5ut9yzVCrZKtHR1Wvv3U7ZJs4Hb4k+qc4hesDUVbWL7H0Z1j5yIxsIZ9BRn
 ErpPN6Xk6qYYOHj3kNTiDsDcPPegc6om0FtPE9z30EUSc7saWsDkIcfTC60v+9C4ULqMx6nfxGC
 V8F5dgORfl5xXmuMEQKTa1OtJctVJ+5CHjDLmPZ26HspHu2sOK7qqfTCRHpzevr006Ljblk4jEU
 nm/USULRWgsS3qIqMog==
X-Proofpoint-ORIG-GUID: QYI8PQ0TLnVT5-TAgB6F7QQZ1nJL5J3A
X-Proofpoint-GUID: QYI8PQ0TLnVT5-TAgB6F7QQZ1nJL5J3A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080085

Add SMEM items for four NSP subsystems stats which are present in Nord
SoC. Rename CDSP stats as CDSP_NSP as both use same PID and SMEM item
id. Add new entries for NSP1/2/3.

Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 06923408bfce..91f2d1293124 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -43,8 +43,11 @@ static const struct subsystem_data subsystems[] = {
 	{ "modem", 605, 1 },
 	{ "wpss", 605, 13 },
 	{ "adsp", 606, 2 },
-	{ "cdsp", 607, 5 },
+	{ "cdsp_nsp", 607, 5 },
 	{ "cdsp1", 607, 12 },
+	{ "cdsp_nsp_1", 607, 69 },
+	{ "cdsp_nsp_2", 607, 133 },
+	{ "cdsp_nsp_3", 607, 197 },
 	{ "gpdsp0", 607, 17 },
 	{ "gpdsp1", 607, 18 },
 	{ "soccp", 607, 19 },

---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260907-nord_stats-ea163d025d43

Best regards,
--  
Navya Malempati <navya.malempati@oss.qualcomm.com>

