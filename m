Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8062B4E2342
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788904; cv=none; b=TA3QElw3Wbt3LL19o3pwIbMfTzQ6Z13JRqAog2AmjQuUk4pk1Nb32C7MdX5g1UdTy1SQOY56kUgyJgwTuznnpj/NJ8ONahVTmhO2afmwgd1eqDdosh5fsCfWekAYZxSC2kZs6lJV8mfM/VUKfPr3PPJaDnva8hT0EkChiIoyo0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788904; c=relaxed/simple;
	bh=DnfQwTEmrf/W25KWsSddiMvJISba920uiYCjJKXhz30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mkTN4UHIaVvu0N/CwaDE/NsZAFJoF1ITghln0saQbN9k802XBMDUzLRn4HLfKafQ64LTcpZbkboWNQz5DPua8kaxnBaeKlGiau/nkPgNgFmz7NeQfEVx8Hz3EbprBWASP2N9MSdJZ9+56gGnFjUStLOXL59eyAZb180dXdb3puw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6o2uEnd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XE/A9AQQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6o2uEnd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XE/A9AQQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdTuK1183715
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 13:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f0l652JrPPCg/diYDrk7BWbIq5ryo01lcRlUUPNe6Rk=; b=p6o2uEndG3Toa3cb
	mF2HEKC4774B9wF7CbHGZjIxcE06jRJRq32GgLOkQZKy9tDbEL7fS3bfe9j0XcTb
	7JuZv527bWaIf+wiXhR5sEdc5EWI7eYLBwECXXGYEqPD+/ksDaa6kdqq2DwgDPZT
	1vWi5xQlI+kiyUVnb9onBY2FARyB3FqhhXb8VU+8ytJ/Ew/uNDBqrCqV5wbV5NAx
	juDfWmKDlnDWridjLrcgVETfM/XUWONa3NmdQJocQ0mLhWyKT3P9s47upXDAkSA/
	phOImfBoILWIznwbmxnDt0rTcv2xQnBcDVr2i0i/rl2/THft45n8FyIPiNobsQ/u
	GrucWA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua9nhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:48:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-395543dc382so4724619a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788895; x=1789393695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0l652JrPPCg/diYDrk7BWbIq5ryo01lcRlUUPNe6Rk=;
        b=XE/A9AQQsUmNmZ0pFeuSldfGBBnD4OxMJkzv4gLSMmpU8Njd3fiB88l2ygiJf5K2Dn
         /5gmbl7hrNkCc8sxw/HZlO5R/8NS0pJ59NMVKcpBTS8ZMKRJGg3rqT5tZzHZXaB4rD+1
         +DXEATKjFiBd6KbfJHBE5ivgTn+45ECNl6k5TObV1gbQP0pmUUOa0IhmWkI5KlmACu2d
         eRmBx9POU2c+n5UKstVgHbeLLyMEunQnfunsfk/nMKBvdxT4hHn5+D7osqf7NEWkqrlI
         Bqkkew9vsr2/X7C6FSLceMD8u0ZCrAshsbrtJ6jnSHKhBrcaWzc6mK9+1bgncaVquZey
         ZvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788895; x=1789393695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0l652JrPPCg/diYDrk7BWbIq5ryo01lcRlUUPNe6Rk=;
        b=qpXh7MzsUHwybapZtlYqvJgZnwEVJIW7kLNqAr9v1/PzNrSHmhKnj5sbO+D4van7tQ
         wYdIXOn+zZPWPSzzoqvIH/dZ+MriEvkAHW0jklyR9RMDReg/0Ql2nTl1vOOt47nNxRvO
         bto3krdmG4Qkly2GvcsKzLKjQOot0kgbZi6amLyvN66UY9FWBhUde+INM5ATIKySlgE0
         o5wO+MrO59ayFZIxTZD1VmPmqtnPmYcFgk99/rplUqarXv6TZKJR8VWUNY0YUH22DKlv
         Vvk9evQPVoUuNFnq7D/gytN5CFJI/79RGZvxuEznboWBee81STshVsYd/uweieVecjin
         hDkg==
X-Forwarded-Encrypted: i=1; AKwUvBz5xmWU17N9giRaDAblKBlC/K7aACCirzvF6iyNJeIIZVRmDyJiY6t6ZlloE58NVprbioEyMW5e97BkQY0=@vger.kernel.org
X-Gm-Message-State: AFuF++kxS3cB/RAq1Z84Ld2XSAadMEB16Y3lnR3P7q+FONAv7K2epfhD
	r9NnIXEcSNZDDoNuSQ0ATi6DgdvbDqx6slngVEeif9MIPovdwj6u+pABq/GKEEsfOQ4pt2y1nOi
	czyVmUOvrl0JMilMiUVgOwEPqwNoQ6SROw7p4eEZCHXkKG4iv6dEvhIIBJO3yV/X/Wbc=
X-Gm-Gg: AYBFou1wPqKT5Mi1W0/ttvDOrhtKHeIprnC+kX/Art09leqoTYAZZrTGg99zDoZ1ILW
	NPKFMxPawEg/UHODOlTQflVXhwkzRcaUlqtwrC+1MszOs1CizGddCzqOq5zEKqIqDQyzPrgwMoE
	JqxeX8oCqyz1FNQahyBOgfSU2zQpjkzuAONojVdLB9LShydGmPffymnr5dhsXFpGhtrKjUIzX/E
	UPW9p5X7Qteub+cSDwhcIykCohC/s6Pve9G2i7+jiBZSCICJV5FnILNeBl8o2b7CEMIS6+OlJhf
	H4G65xUOVW7O/8yLi492gxV6rNeMdfOO8lK1eIwuJyrrUXC7uDFANsqNLlczt2g9gO72mUY57SN
	/abZcatqpgbY9f39OLqg/UdMHKTFNVA==
X-Received: by 2002:a17:90b:510c:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39b262e27a9mr38200142a91.24.1788788894618;
        Mon, 07 Sep 2026 06:48:14 -0700 (PDT)
X-Received: by 2002:a17:90b:510c:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39b262e27a9mr38200089a91.24.1788788894130;
        Mon, 07 Sep 2026 06:48:14 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm20826354c88.8.2026.09.07.06.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:48:13 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 19:17:53 +0530
Subject: [PATCH v4 1/3] dt-bindings: soc: qcom: stats: Add compatible for
 Shikra
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-shikra_stats-v4-1-3825351f9740@oss.qualcomm.com>
References: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
In-Reply-To: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788788886; l=2134;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=DnfQwTEmrf/W25KWsSddiMvJISba920uiYCjJKXhz30=;
 b=svLLQoyardTL5+bd9UHuyiaIKiaacATqA1UXVL0d9vq5z8r2g36Ald4NfkbnaQY8FIyj9Dtdx
 4tk9nAUQ8FqDnX5ReQXwgf0h1KBRUHtQZ8+DQcUx1KcZ4GuqSK1QFoR
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: cRzYgaybPIbMc_YiZu2msXZRgnBamTDX
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9ec09f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=omfX-2x44LNwICN2mL0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: cRzYgaybPIbMc_YiZu2msXZRgnBamTDX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfX+VzGsL25Wubo
 JdvFBZTzjTIZ2sJtIJCyPDPF2ZHiqXZ5aMMidJTwO5ln/dl+GDUnUTq0mD6c/0lqML0YiEBaLEu
 XiNYRb0KUO+ZDyFUX38PIAywc1B/Lnw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfX1+hdvpKOMyGq
 pfRhWLguPhyLjFqtTjZErDygPcvDoqjG3Fok6ADZGC+42wc+QavvTVEiYu72o/5CHsCn7B0bGVS
 bjA0QfASVBfRCjpW0dILyBwB3k5M0GMtGMsDxi+XYajJ/PBm/3xMuqKg8MnVgQNjfbIMZDJ/zVJ
 1+HQEAnIW0NwH8XAwp9ngx/WX8vVrANxIUhUF7KU4FNUp0iQ9RryopfhumQtZG0gl7eAN4gwVp6
 v54AweKvPF0kRpf5K27AOiDue2+4V1hSW4S6/SPhZ9EUeT2eBzYMCQQhWdf/VafuKe1doyStMqj
 6MYiuOtWgDv9QAkkjjO/2rjsk4LVnoFb14QTZei3fWXtjaV8xZfKMfgsiKWRbL2ZuCM5hjqDI5R
 3J5A+pQmHS7G+wpTXhit1PXoT0phdlBUwSc59stdUheI8j1mLqWAEPRaOnxoddbSqQ0vUdKVMVV
 nTk8XVSDTjRznASUspg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070153

SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are present
in SMEM for Shikra.

A generic "qcom,rpm-stats" compatible only reads SoC LPM stats like vmin
and vlow.

Document shikra rpm compatible to read subsystem LPM stats too along with
SoC LPM stats.

Keep "qcom,rpm-stats" as a fallback for RPM targets, so that SoC level
stats are still shown even without subsystem level stats support. A plain
enum can't express that, since it caps compatible at one item. Add a oneOf
branch with items for this pattern.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom-stats.yaml   | 25 ++++++++++++++--------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
index 686a7ef2f48af11a0e63904ff979e40d7538de65..b384a5983d43358d9fceb6fa305f20d6a0c76504 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
@@ -18,15 +18,22 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,rpmh-stats
-      - qcom,sdm845-rpmh-stats
-      - qcom,rpm-stats
-      # For older RPM firmware versions with fixed offset for the sleep stats
-      - qcom,apq8084-rpm-stats
-      - qcom,msm8226-rpm-stats
-      - qcom,msm8916-rpm-stats
-      - qcom,msm8974-rpm-stats
+    oneOf:
+      - enum:
+          - qcom,rpmh-stats
+          - qcom,sdm845-rpmh-stats
+          - qcom,rpm-stats
+          # For older RPM firmware versions with fixed offset for the sleep stats
+          - qcom,apq8084-rpm-stats
+          - qcom,msm8226-rpm-stats
+          - qcom,msm8916-rpm-stats
+          - qcom,msm8974-rpm-stats
+      # SoC-specific compatibles that also read subsystem-level stats,
+      # falling back to "qcom,rpm-stats" for SoC-level stats only
+      - items:
+          - enum:
+              - qcom,shikra-rpm-stats
+          - const: qcom,rpm-stats
 
   reg:
     maxItems: 1

-- 
2.34.1

