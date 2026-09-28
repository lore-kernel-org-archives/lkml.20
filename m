Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F6D4EFFB4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613447; cv=none; b=g6KQY3zAEFNfSYtw7BlZq+WI7o7PWrHPTosrlNHVuSiQH3vMY1tAe3Tl2uor2HPGKtIDnmlKqI21RaMf8baEjEczjSp4O9enoidib2uyub/47/WfsZTK8jPfi6JosVZVL2SomLBwtQuOqFA+x0a3tds/yzcX9cybbXlCtQFiffI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613447; c=relaxed/simple;
	bh=8mPzzD2hnNyHm5q/BijcmSzzMQ1oNaUHkqeiDyYLXik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d5Eyrrc/Tq6RZtdWN8/oaRVYSf54nW83aNhgCLhsvzr2pomH9AYHY7+yA+i85PD/Blw4WHAAa8Tc5hY6WPXx0b3wH4cbo12SRIJ+b+w7mDWiDRJL/UbuKq5JYlwaPJmaIlpjCeKnGdP4xUtSSgceqZ7dq/Scne5d2iFJuaBuZ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4ilIpUk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JjzIhrwR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4ilIpUk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JjzIhrwR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe5KF1498560
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOyxc28yCeoKN8IIez4bm43LAy5QpdgvjEs3QWsuxMc=; b=m4ilIpUkUAr/fTU5
	ItdFkAy7RYJHX8AGBRJcQVxieTosoLN2pXn7qz8kmwZQlQ0oAhzFNreK/wsKTf9V
	v5zMi6tEaIHbHqxMFrLtbL9c3Qvz6CC9iQr+tm3XGvfKc/W2IihwbjqN+/+2zOXl
	5ckpnoqXX9cddlU1/ZJ/57FkGdK4g0JBjVorAVvOAEcwizlBTja6KSpgYjHrXLc/
	h3x0w7WbjhlU+hvmF+INQnpzmzniZODSNH78zIQlPRCxbqUXz1c59hpx4n2Ot3xm
	smL/LJuUNpScevcwbWCffI8/ywWZ+YSptmtk0Cx7KIgI02bUxch2gDn/5PbVVvNi
	offHjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mtab5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:37:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93be1861d2dso552674185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790613444; x=1791218244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOyxc28yCeoKN8IIez4bm43LAy5QpdgvjEs3QWsuxMc=;
        b=JjzIhrwRLJPK54yZubau6SgTxUXoIJ6Tc21vSpRA5l7SNiPv90Qc4nvQSKeYwTd2fY
         bbUJ10TqEGZZUesxjpGCJiM8nKhIPH6BPSuA+/dndGHy0Ap806wvNV6IruH45//0q3MC
         zHm0MkpfBC9LBL3VXF8CYHe3gRvCNt3glAZAIRo0eFRXS+Pxew4XSQ24P1WDontlgOzn
         p5SJLtg8sFuQZjHbF69exsZ9biuqoNVdoakzESaX2lYhsgdJdGy1dWA3aXDy9DGUuQil
         ynOlsAnxtF7BrbWbFmcR/BMCwcjZQDCkLZIaeecoUuV8awC6IEB19ZowZL1d2ZohksYZ
         WIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613444; x=1791218244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OOyxc28yCeoKN8IIez4bm43LAy5QpdgvjEs3QWsuxMc=;
        b=ziB4wywoEsyKbtotQwz2VVxDc/mUqz82ZptvdHTtoZ6Mj36jhJ5GY/0H3Zu24fuVq0
         qeSH96Mn4yydDU32EQHg6TKs0wR42hcm+1xvtcqwi8C7PTaM25VZ6P/cxcejrMgJLtf0
         uHh9Pp+/ZAHtDc72Gm3wTcJ9cnQ4GUKBWsqaYCKOw5fSSxZMZPINJD9jjmHXUt0I/UvI
         0M/srmJgKNTrjp6spEPwxZz9dFr89nvUEvUiBhtIPpQ5wq4yBlakWuEP9dp8VSjSqWhd
         8sKQRSQbghuSUUexRe6sRX6wEDy7y24lxW1BJF3UjtUoL/xmV2NtHKU0uSdt7SQPcYuz
         BD8A==
X-Forwarded-Encrypted: i=1; AKwUvByNT8GlV1AZ5SqbApglQpgw8WmAESJBU9r6pBO5/kk9zhStJkLAeiRbV2FLqQuoYNQwOfe1/CoW42gdnmA=@vger.kernel.org
X-Gm-Message-State: AFuF++lNlxErUzs6T02T/Wtsirh8lQIaQWP3zmKWX5j178Pd3oD6tR52
	ulsAqtIiNmrkiWAvVQf17rA/AQEqRQ11FYHGpClYibBISzW6mT1sZvDXnA97kn1+74f6jkPfj0G
	g18ceFwY2r/Gyb5wKQJvwnhNamMj3vKxfETQVxpolVPwzGbJzPJDeDTyMBjrdWvkWdRE=
X-Gm-Gg: AYBFou2iMuoeG8yhmksEpYnLl5v4rcVicvJyBBl0S0OlOrNtMEDN4hOuWpW++55luoM
	0uDJY9+OOVBET5VL741jMouUyb73D5v4sWYlHFh3WuOfu6hhq+dJX5LcJmWe4qHHpUPysJN+M9b
	2Qj0Dar6LEysv3cjaHJJhG8OLopvptxTUyLVE2JK7Oiyb/3xORJkP0ca2Eb1/viYqajpqD1rObx
	YKuiautTxT9DkYC5neml53tA7xuM15h4aPtr/T8bUuxwWsgmf/MNXDLZK7IvKTucVECMe6TLWgc
	G9x3bmzQEL4/yykibx+K1Wmb8bdIcuLDQaULp1iKl01AWGLtLKUUEhTwTH9EVo6s8k7wWE+Eniv
	akVUbGv8C
X-Received: by 2002:a05:620a:488f:b0:939:761c:4f59 with SMTP id af79cd13be357-93c43bbddddmr2195443385a.16.1790613443491;
        Mon, 28 Sep 2026 09:37:23 -0700 (PDT)
X-Received: by 2002:a05:620a:488f:b0:939:761c:4f59 with SMTP id af79cd13be357-93c43bbddddmr2195277485a.16.1790613427788;
        Mon, 28 Sep 2026 09:37:07 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6456f8sm28442084f8f.26.2026.09.28.09.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:37:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 19:36:52 +0300
Subject: [PATCH v3 3/5] arm64: dts: qcom: eliza: Separate common CQS SoM
 and eMMC configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-dts-qcom-eliza-add-ufs-variant-v3-3-9a2fdbf6baf2@oss.qualcomm.com>
References: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
In-Reply-To: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=5197;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8mPzzD2hnNyHm5q/BijcmSzzMQ1oNaUHkqeiDyYLXik=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqupenbMfIraHKeLFVebhRiEhrHPHFgNpP76kWj
 4FLqZjlYAaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarqXpwAKCRAbX0TJAJUV
 Vps7D/4hxB7xj2lD2rftsY046jldkVXksBqpxiZw0Ql+V8rrKesbqXYbCRbpysicCRZJAA8vG5l
 s+JFLkgM/6W6dKzwKc8H5SIQ4Hohn8DhUR7JRzwhDKMW8MKdPuYfO93LZCNge8K3Y7qboiwfzCu
 WecjJiJREun8+9oR3GCVmeO1kfqyCdG7At5jkZ3k+4CSjiLuUxKjmLRCjJ6jgMyZf6HzlZasYA4
 F69kPmBxASqa0Rv4HI6itBFIcR9SsKbT/6wGL5aIYj5NgGaQEulb9g3/ZjKDmxWEIWVRfFpPIXZ
 J5w70SIKo3gQg37RjMBl6top53FhuAsykED1oFGKRfRyX2LD8yUVxaxJnkGAd0j/+YeulyaFpUd
 0eZ+P+83XTpGIDhLJAch135VNy1IaycmPDCDcujrITSBGKNrkZF/4gjvg6GJHpM5GZ7NAF5mpHv
 QXwQA+5GKQQGBepc7CxrFeCI6Iw+nGSduXT3OZJMa6uhUBHekZdVqfhXHk/Pij9CT3hyjyDpT+6
 xnGniGav/XAqpVSWnfTfre/Z6l+bj8HkkUpKkaeNxxq6rEOJmwxauIzfBpxw45CyzsWrcWwfgR3
 mzNQrMwGA4b9aaVoIP1CnsKcg7zXKequZoHUiHa8U8H7Lb1psUMwq0ytt4YlNb1qRkwgRHt/f/D
 SGeitDbia141jTw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: YWo7aF9Lyu-jh16sFW0IcqBu1KL22lgE
X-Proofpoint-GUID: YWo7aF9Lyu-jh16sFW0IcqBu1KL22lgE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX9bbsONQZ8A6O
 9nDy/QnLib6UEIoguzso4eMjA9oDXvmN7kCF6DWoWl8VQrvtSfpX0dPbfJNS+EhVAQbF0IGG/Q7
 4rIheHzClC47TBAJjfZpjp31IJ8dUU82R1fbqZ78ivp8iFIVT7fJzqaBFgyLtaWFghfDFw+ITdN
 JFh0+3m3wptq7zW/2Hn/pFbHYhGXb5iMhlRLFtknSR38dZjdldJy1cw38G8OOpRI8RDmOZPB5nN
 GA+RtF/Mb1Pa9SCjGNsyqZVZjBlVRCvqhKGKFOOSCEH7bv4ELbCoBwF9j9jEvmHHh55iO4viyCV
 whR8o4ffxlRLrZl2ww5FtzCIsXgNnynVDPHL5k6wzyDI711rJmHqZ2Y8WG6mf7iYwjL2EG68HMy
 FWlV8WdDze3m8wPxQI9MKb7fTJ55fKzK8vsh7fre1Bt3SbzExAw0M/K/9lxp814S74mATy4Zfib
 02LWtT8PFmAdwgbcb1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX4B7wHo8LZv7Z
 +4AiRQI3+pUGazDQc/I1vv6+jiOtzYHr4dos0FO5j5i/RIrjr0ISC+vFepdPmCe5NWRqOfyXuDw
 deuXx/8lO9evdZQkDw1APMjqgYvcWPE=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba97c4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FfUMhDFI_infzSTnTwkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280066

The existing CQS SoM description includes its eMMC storage configuration,
while the SoM and EVK filenames and compatibles do not identify the
storage variant. The UFS-equipped CQS SoM uses the same EVK carrier and
shares the rest of the SoM hardware, so duplicating the existing SoM
description would leave two copies of that shared configuration.

Keep the common hardware in eliza-cqs-som.dtsi and move the eMMC
controller configuration and its 1.8 V I/O supply constraint into
eliza-cqs-som-emmc.dtsi. This lets the UFS variant include the common
hardware directly without inheriting and disabling eMMC configuration.

Rename the existing EVK DTS and its compatible strings to identify the
assembly using the eMMC-equipped SoM. The carrier hardware is unchanged.
Neither the CQS SoM nor the EVK assembly has been made publicly available,
so the DTB rename does not affect existing users.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                |  2 +-
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts  | 18 ++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts       | 14 ------------
 arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi | 27 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi      | 18 ----------------
 5 files changed, 46 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 7ee7b98994c2..3b3ee21999fd 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,7 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a14-ux3407na.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts
new file mode 100644
index 000000000000..36f63dd1637f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som-emmc.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK (eMMC)";
+	compatible = "qcom,eliza-cqs-evk-emmc",
+		     "qcom,eliza-cqs-evk",
+		     "qcom,eliza-cqs-som-emmc",
+		     "qcom,eliza-cqs-som",
+		     "qcom,eliza";
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
deleted file mode 100644
index 43d428a4ed2d..000000000000
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
+++ /dev/null
@@ -1,14 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
- */
-
-/dts-v1/;
-
-#include "eliza-cqs-som.dtsi"
-#include "eliza-evk.dtsi"
-
-/ {
-	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
-	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
-};
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi
new file mode 100644
index 000000000000..af4ade2d4e45
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "eliza-cqs-som.dtsi"
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l12b>;
+	vqmmc-supply = <&vreg_l1d>;
+	pinctrl-0 = <&sdc1_default>;
+	pinctrl-1 = <&sdc1_sleep>;
+	pinctrl-names = "default", "sleep";
+	mmc-hs400-1_8v;
+	mmc-hs200-1_8v;
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};
+
+&vreg_l1d {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 03f9192324c7..a378a500d9e0 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -278,8 +278,6 @@ regulators-1 {
 
 		vreg_l1d: ldo1 {
 			regulator-name = "vreg_l1d";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
@@ -396,22 +394,6 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
-&sdhc_1 {
-	vmmc-supply = <&vreg_l12b>;
-	vqmmc-supply = <&vreg_l1d>;
-	pinctrl-0 = <&sdc1_default>;
-	pinctrl-1 = <&sdc1_sleep>;
-	pinctrl-names = "default", "sleep";
-	mmc-hs400-1_8v;
-	mmc-hs200-1_8v;
-	non-removable;
-	supports-cqe;
-	no-sdio;
-	no-sd;
-
-	status = "okay";
-};
-
 &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */

-- 
2.54.0

