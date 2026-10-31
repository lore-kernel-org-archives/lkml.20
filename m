Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793452256;
	b=STOsxJT4s1g3/uzbDZpUcL1ahJKO7CCZMwy3Uxu5DYBnO1Vf9JdLR7Z+EeM/fRQzhOIu
	 uaSfTYPB61BgSHPkkUyTKZ5URLONV9tuYrmX+rw4ed/bsZXkjDHxwSZtZ8gFn5ZpnAIVb
	 BeE8NA963dIqMGpxHAs3gj/KEYtWhxjF28EnkyEK0lzbqX4x8+3Qt8nCLRZqgHwXnS8Z9
	 T8JnTCZ7fkaYg0iK+egS/jHzs5YBSiRE0DN8Ppb3x+VFQ/LFC/1Xdx85VxQYPCyjAlX1e
	 5BQwWryM5jENR2D7AV6Lhj/T7P4iQVAtHWIjUeZQB6en9CeVAR52A5EdyPExZqrP1RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793452256;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9plYplCg+Zpar9zdm7dgG/Bqo3Nf+7WuF43gMc92jn4=;
	b=PLe+1j0A8GXk54++WUOFYQVAnltnd/S6GLbPnt3iJBBZgBlYpaOV2+CRzC/Tleq5fhq9
	 zZC99H1CysMJs/DrFrfIAYfp03OBqfcW5RzWK0v2f+ol9VdrMGqJ/KIiK7FHSmVRBzdJ6
	 HMlvExd2/Bnqiynyn4Ku7RgrlBbtT1Ig5uaCXDs9/GWvMRmk/FdWi25Lkl149GQ3kJcb+
	 0g0CcUHCnqWsKWlLcgo0WCGdxLJ21+r1JRPs3Zr5VMk8Oo14tp02nLM7CVgNlwhUohyjw
	 68yEwGa2JImt1l7JhTkwV+oKoAA8keZB1sbs8USM3d8fEQf6UNpWwynWx9NS4/n7hfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aKOljNQ2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XzlS/wF9";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A26606A324
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A26606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aKOljNQ2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XzlS/wF9
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0CuO2196380
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9plYplCg+Zp
	ar9zdm7dgG/Bqo3Nf+7WuF43gMc92jn4=; b=aKOljNQ22x0O9QQY1lMM3nMFPpx
	kg9uOzvtYtjhpu5fKZws7vF+0AlmvqMyqMeW9wTHjtRDbpgCKGOxoSbY1lWvRyOx
	Td+s1mONSn0xySqERBXMFrRLVhwCzbx+F933hXfxT+1Q9LEwUjf16X18yYzB4O5Q
	TE9IDB5VWUTDYYouZKWPPiW4h7uBlYz9wUeNjPgAcWjMvzDQkACCN4fRIC2hnjml
	DdBlhuNGydzENvla9ZLYcJAnbOaLX7TqnQJh1BGYFogjlZS4HC+2VYJylUcnkZJ8
	0kb65MHXBnVrY63lwUzM6jp6W64xRnuo5j/Fx7FSi+DKdDGWPkgwiuBFKEA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8du94cr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:10:54 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1663fb7e005so1862915c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793452254; x=1794057054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9plYplCg+Zpar9zdm7dgG/Bqo3Nf+7WuF43gMc92jn4=;
        b=XzlS/wF9Wl5Rv+/c2jytnzE366iKeIsQJKtZPEfKNLdCPi9qYGWIdgqR4Ni43nzxSm
         U/t8CXqjbNhuFtij2nU/0LpdNlvGa8kQLxfO/xf3pNw6By1x4mtUgjY6KUEyu+YjagHU
         EcWd0t6yII+8d64eUghHGjSDvt6gUy4HfqRYfTlf8RPH5jUWFIqjPUaQvgIV4YroqlRn
         C5s9rhf0yug6P3zWIJQ1k1T6rH+WZCej9xxe5FB6NCTH76fFlY3OGM9aa/MvmUUiU+3j
         Qm6wxmXsIthwwitr5zZG1ezSJlGoIMOd8GVr1nq3oId7FiyCoUCcZni2jQEaBSbTF75Z
         6U8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793452254; x=1794057054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9plYplCg+Zpar9zdm7dgG/Bqo3Nf+7WuF43gMc92jn4=;
        b=m4qGsO12f63g/xQnsuEqSuljcxHcH5aCIUN+byLtU7b1TgzWATSkNyR3NZyeSeS4LN
         nwMBvMmBhePa8B7V3QPICPXPJFYAAJ+ufSRs1QrrifJmTKMi0mzZyWfM54yjPHwog5F9
         EHB0114rxvjmRWY2Thp07IsF2TLO8NcqZmh7nmhecnMNDZzVOOzPlpZomZ5/2h9rfunX
         jJuql1W1OguM4aCK6kbFDBNVBRM2Mgzwy4nX2ILMkqWJpar5arEqmDTc/+rbetRlXRms
         NnupKB78Q05t3IZjW6Uv7ijOxC3y857wj8ExK4n8vGePzzWOH8bM9B4q7Fn3XyWuSf3u
         qKxw==
X-Forwarded-Encrypted: i=1; AKwUvByfYMwtbj3YjJ0HiNQlAoVJiYvznbuJ5elnDXcMBbBLoYRwVPdNl2ZS3pUv4I+OEc9FL7pMjFdzFj0Sh0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbh7IWj2BYsPtQ8TDVTXISE6AYb6K+CgxHSGSkMFMQPiHY8XG0
	+Ks/S3HONgbt/CuSsAOiPvwRjmWndIsHKD/Aj7ldGhuB9KE9xnlikONN5cUhO1ufS2kCUbnnQmT
	Lrap7lW9TUZljpU/cpHVc8ZRhm1w9atuMk79amumJ0T6icP3xjp5KbwTPkrO/PmKz45o=
X-Gm-Gg: AYBFou2BMzrZfaf0t4E7OFmcmyXlnDePEG0BpyKiLLBa8kgqj/yqAcuYAgsf3G973FO
	2aZmiLfAU+wwu9iTFxblwzKpasKTzfqSCq7xM6tIUxklRHn4aOtavjJBs93HOdQ2ZazxUqkXJ2T
	lhreqV9Rw6i30nf6Ts8qiUrDdmuVuBDQO/jLvc+HCGhrqNrnXb9nyJx9x1C63VvWB/JDhc4o+Sy
	hp4m72mwjRcNpp1CEn+ZDjsN8N7yB+MZC+5Y/W5VbwXI7ghGgbVMZfEbZjO5H3PrUXoOizAy/hL
	NBJNwC1Hg+NsBhF7YYpACZ36vjybrpbBPT7ycWxFQjM1RccEUUQ3R8aCqXhKK6m/u51/fT4BYpa
	Rc4g0Y3eRt/m8Ihhriyh/cjzcTRyRDmtMOTcQoYfAIyJQE45TNfjl5zMOXvWl0ys3eI2bijvx0b
	p4Zn91y433JMj8d7wjO+uNvvxQutRxU7hz
X-Received: by 2002:a05:7022:1112:b0:190:596:4071 with SMTP id a92af1059eb24-1ac5cb1c1ebmr7854199c88.11.1793452253478;
        Sat, 31 Oct 2026 06:10:53 -0700 (PDT)
X-Received: by 2002:a05:7022:1112:b0:190:596:4071 with SMTP id a92af1059eb24-1ac5cb1c1ebmr7854147c88.11.1793452252732;
        Sat, 31 Oct 2026 06:10:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm15717872c88.5.2026.10.31.06.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:10:52 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 1/6] arm64: dts: qcom: Introduce lemans-embedded.dtsi as a placeholder
Date: Sat, 31 Oct 2026 21:10:37 +0800
Message-ID: <20261031131042.1200862-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae5e8de cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=5r3D8o42p4VsMVMPxZsA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: -Hk-Jhx62pvURb9E2K2C-iG6COAnqyub
X-Proofpoint-GUID: -Hk-Jhx62pvURb9E2K2C-iG6COAnqyub
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX7lnLs6HAu2dK
 RxIAC4cNlGsh7TT4idDHGI0dEw9SD/9j06oRejwZQ+4xmf7woO+TLlkUVg89EcTTaxbA0Fz4tu9
 VkSFeDtb7A/yWcYSGe52pNyGSp+lMhvnC9etm41UFGUwK9wirJ96VY5M6PTn9luHWqAx1CvxVpE
 UEKSa63SdRRSGzpB6hKGAzDQ6mfgGOqDqxZTRkhlZ4UyXomBbqLw9coEr9c509J6dqc1l5cTuO8
 65t/gGRPY0chQPdpTM3FB9dSwUfKUKkW0FdKvIQSyJ8sQEBeBV4xsygw8aqX32+In2Lwa1wTlXN
 f4A/E2nam9HQ8YWjnP54ZrMPl2w10vO/Wl82hHEuQLij+TxBIkraEhoeVa9RlPjwvMvRildGHhy
 /W1iJ81apI2vPCg/1PMD4VMDtRioBiVBtB+RTTM6lGE/ea73mBE7D9TzBy6hvP/xhdzjvphF8zM
 S5CSEyT2fUiPj0R6dqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX8BjOJEYeGZeM
 bDabcJtyrfc4MxCi8sNibo+ZiOrbTmDDhhMCOb4RkKTA9AozLGSd+ayDxB5vPc9/hr8NsVg97Aj
 aM2zXs521B5p7aSw1UBpd4CYxoJw5xw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310052

Lemans is a Qualcomm SoC family that includes not only the Embedded
variant (IQ9/SA8775P) where platform resources are managed by HLOS, but
also the GearVM variant (SA8255P) where resources are managed by a VM
as SCMI server. The current lemans.dtsi covers the former variant only.
Introduce lemans-embedded.dtsi as a placeholder for now, while later
changes will move Embedded variant settings in there and introduce
GearVM variant support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 6 ++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts  | 2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts     | 2 +-
 4 files changed, 9 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
new file mode 100644
index 000000000000..80d8c75e4895
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "lemans.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 23cf20f9a178..603a3fa18994 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -10,7 +10,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
-#include "lemans.dtsi"
+#include "lemans-embedded.dtsi"
 #include "lemans-pmics.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
index 7fc2de0d3d5e..a2c70018e571 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
@@ -4,7 +4,7 @@
  */
 /dts-v1/;
 
-#include "lemans.dtsi"
+#include "lemans-embedded.dtsi"
 #include "lemans-pmics.dtsi"
 
 #include "lemans-ride-common.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
index b0c5fdde56ae..7597b4f27e78 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
@@ -4,7 +4,7 @@
  */
 /dts-v1/;
 
-#include "lemans.dtsi"
+#include "lemans-embedded.dtsi"
 #include "lemans-pmics.dtsi"
 
 #include "lemans-ride-common.dtsi"
-- 
2.43.0

