Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273E84AEBC1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473840; cv=none; b=ZAnzSuh/4imRqtzXCik+LWraNl2bJbekqCQUe8HY4iAr+bzerVho8GnSXy1yLnJ/xkMG5hAfaRfyZkUAR+bIGXGamKkE5ZXj8hsLFtWSYSSzVJf7uFYKTPCU6QhQ5okGVcl20WiyJqmNTa92Ye3hQ30kQLZDJqnyatvOjZTXdT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473840; c=relaxed/simple;
	bh=E0xPp8WGq/6zxWJIIsZb9X9a831XpeM8ZX+0nCt0yEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iq/EKVsCb7ndvhNeQQSwhwgfwxLqQgrIJ1ofGlybczXgdcK3lwVSKcILlsgptNWggYawJzcOiHm6bW053fHWp6SR9GMcj6Qb6Cuxp91QdbvG+lvQB2S9M59NQ/sbeMe2J4glQaf0JRbuweT2BBdhe9ltxSCM4qfXo1Ryjqt0f8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8wIdKx0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PKVziCM4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8wIdKx0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PKVziCM4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hDxJ3317787
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qPh1SMiOMKo0W/ilqiPBH+vJik16ZZ29h2F4mujk8Qs=; b=i8wIdKx024r5m2Wn
	uvBiW96saVARSKX4g/+7mDXSq6t3YAap4DInCduHNF1+SollU/O2eSyKFddmHuF1
	Y4HQsWHYTcglYuCs2d9WdXPgUmKMx+3prub7NJVzjL4GqhiTLXT9s9k5/+xenyBR
	uQDjZauI5vd+XDgeFBumbZwl2BqsN6+WoThCc4yymyDUBaBHwYRYStSWEu9Wmjk9
	JxSCRYOdOrfOAIFrcWjf0FRJVv+iFSYPk5F4YFf/2ihDhpuUu56MdpLgb48La3aA
	nq0voiGbqkFiOI2azwrMO6R+AjoJBeRMDACRdAR9TUGZxf40UKT1PMOaTPvXe4Bf
	ZSSjfA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq38e0p13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:55 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c8487ce333so1475937e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789473835; x=1790078635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPh1SMiOMKo0W/ilqiPBH+vJik16ZZ29h2F4mujk8Qs=;
        b=PKVziCM4GA1D2J1+qBtKiZvL/92ghWoi/P6SSfsnIYpTnuGHl/S4Vt+EyJgw3FGC8O
         aCJZPpQVqCYx5vvPsCiTk2FiGKcaZRp4ChyiTGQKwwRmJYgWswoBYTeY4PFDStPqsfUq
         J4ThwU3YFzY1uFM29FX3SRYCGqmHrXeHfHG6qChvi5IxowCHN6MsgxMPnBoMzB1EVbJZ
         BISapUf/EbIbX1HzggjblctTZ5dIpJjqynVd1XsK1qsIS+CR71UYNxsgMvOUpRzHrwx1
         mBuY7+wkF6QaLJo49G5JnCS9j7DabySS8H2W7CehC54qw7TH+7plw4itnk8/VOdzQ3Pe
         8FAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473835; x=1790078635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPh1SMiOMKo0W/ilqiPBH+vJik16ZZ29h2F4mujk8Qs=;
        b=1sCAtuydGaiKtpntTbevp2mD14ajj7o32GophTYTVHxnaGkz52vxtdTP/5kXybq2zP
         O9r0YuLN3FpIl7yDWYp102XHRk8OkeqZb+S1EQV+BUJXv3G+qbkODGgjMWdzaYgUXnut
         AjFIy41tI/GmbSg5CSu3L1QqCXt2rwKD3HH9kv0xbBOIAxf5bpnsd2xJf+zew/8CboHD
         DlasZtJ61CaKTNWgizqCLblN/3/0fABApon5pLXl4yfLK2J4zgt2lUX7lso3xXOh3SX9
         lX/Ph7MjwkZ12TOk81Qy7FT0a54TwI+FHPhoa9xHPpoV4hNH0bWDz72mUtvA+OaYFILD
         271g==
X-Forwarded-Encrypted: i=1; AKwUvBz/mdM/OzOI3ZHM1jiRQPMhqDhk8dEttJjczJciG/KkKDc1M5NrhdQ9Cvep7My1FcsOAX0gZPZVo1hXHW0=@vger.kernel.org
X-Gm-Message-State: AFuF++mt6Vgt0lEJwXntMhiZqmVrVbD7W0Eal2vBzht15R5BcjBjkpJ6
	PdFocx15ovjov1G8sOIfMeMcbXmVKtTr8HIICukLzO4E5ERXYADCMt1ZFMWfnYa5eYZ+zE3IIDP
	7XKR22TyeRG5YDo+E4BTbt9WAHoHJYovkua7GCGcypTzTXegtmzVwo5Sa6VhdwGyYYyo=
X-Gm-Gg: AYBFou2EXt+7HoVaZA8PHiIecv8m0df7cp673CU7VFrNYywvRkWAyv6jBqWb7qPL7KU
	MH0WV7rhSm9YVLhfTeh0BDIru7Gli/G/6APCHiuMl+xiMQ+vNvQ06yhuHFxiWNq5u++Bpv+FK/F
	Xh2B7eP081ZJk7N2Bz33rbDjNmVatWI/exa1JLYfpIVEKTlH1cwWVmp0RWlza/u1GO94ywyo8q7
	PFkddPsOkQoPGQURRlUPKL0CpnbWEzGnk3XxkmJ08hbVJDZbEMI0I0om83nb2/rBdmghpm2cdi5
	Ht9FXDBlJuHbBvcOX90CBSHEbTIR700Kj2jiqTw1Zuz9lUjWeiDVp7YrUx3r9hNP+r8wH9MHFDl
	e98kJvw8=
X-Received: by 2002:a05:6122:547:b0:5c8:2ad8:1484 with SMTP id 71dfb90a1353d-5c981ad6d23mr7358773e0c.1.1789473835052;
        Tue, 15 Sep 2026 05:03:55 -0700 (PDT)
X-Received: by 2002:a05:6122:547:b0:5c8:2ad8:1484 with SMTP id 71dfb90a1353d-5c981ad6d23mr7358692e0c.1.1789473834386;
        Tue, 15 Sep 2026 05:03:54 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm34247401f8f.20.2026.09.15.05.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:03:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:03:31 +0300
Subject: [PATCH v2 5/5] arm64: dts: qcom: eliza: Add CQS EVK UFS variant
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-dts-qcom-eliza-add-ufs-variant-v2-5-86d72a2a8f47@oss.qualcomm.com>
References: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
In-Reply-To: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=E0xPp8WGq/6zxWJIIsZb9X9a831XpeM8ZX+0nCt0yEY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqTQavw5BnbRRkVDRDBWWffgVxkj9DVNJ/4gMo
 9K24DEnsGmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqk0GgAKCRAbX0TJAJUV
 Vg/vD/sHOywkVgPXUZSBOOsBBf7u0tIsNNiowAgV/MFFGAIRtSMCNkFn+AoGmKxcwrlA/qQ2xE4
 hwu8Ezb7h1dNzyUV1fhbTLWJlJdXaTd4sTAjKc/XMsiMrvmO1yVU88RKapBk9hRm6R62ZgcV0WN
 In8ZeXdBbyUOwxqXUNbgKecH84Bh2Exo9knge/sF9m6M36nBl9CKB2CPg0kG3HuD29g/R6ic0/P
 GnzRcvBrYPasFgsYD6WlQHZbWyPh9/w2ynMmhjV6g5Bc/cJv61XTNu0vqdCWCtiHxCV5g494tQq
 CGTULKG3+SMgRJ71YLpx5JzuJc6LAlv02UsSm7xbVzP++xLBJhFdxVmtW5+j/m2GCjM0UgKAV6M
 2SF9HlfNRSIDyCEjwKl1Iqif4lVbm0dBbUzLUu/SxAbyJe0WL6mblAUFVv1wJI3qahP9Bf6kMpj
 sFS9wRegFNRK+rWEDsszvSnognonOBZdhVJukxcFOl/azMqQkQsA2GDhjV42LKFgUAGdxW0cMiJ
 yLf9IRRre7jYwv52A8BktZzCsG1UxHzcDbkctX6NCkHPAW11MPngQ6ZrxlUAWDW9stBSSE80ql3
 KorViy3XlCebW2SM8maTaqiIg3oMs2GwQDkMxfgbQAvwqXpIh+sjcJNqIAv//L4HfSgExjCXm2j
 bfsbK4IxmneitJQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: LHeTHANQiqyMF6uksjHkwe9Zb6RtQtjf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3NCBTYWx0ZWRfX37F7GeXiGWVh
 4edQizA0rxuur+xe5C0Rcza6g1EdVTh2Rl3Dz5nDOnWAWr8TD/PFd6hsAeofyJBu1v7Ke7EdG0j
 50oUwTt1ohUQeqCXEiOhikyTACeKy+U=
X-Proofpoint-ORIG-GUID: LHeTHANQiqyMF6uksjHkwe9Zb6RtQtjf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3NCBTYWx0ZWRfX9O+lZLcrp6lZ
 YFUPbbid0JyTfsKPObxWPk5zOaW5UYA6lWw94QOPZHsn1cpH6hmyuWOukuDW2HTz8cPvp0a5jgL
 VPuEezX8NgJ7Pj9pebyVVvaHKVDM8Rqi6eHCr/lOopEb5/BrvoCW9+Be8nJ4s2E2uGZevDIWuKk
 S6qmTg0z3d5z0TMyNdvrXYA7IFPHyZRJnZYkStLVC6gHJIl9PQUgLVpb3r/oGahAaSHK+nvTv3p
 VMZ0vLuZJRWn8t80fEJSwdcpNKOjbWrEUZxD3eYAwqBhP+rPkteXDVRDuK0UN5LuGiCAVGqc+CT
 OpOuj0mF2OMW7sms8qMHLQFZppTMWP3Q39x+oZ0PlS4A9HMp3eAWftbAaZ1xuE4HmgYUQcIUhYE
 FfPurfwNRdtU9aDtKUyVHXNva7DAu2OavF064aafFIn8mAdgXsDa2jWDZPHtznufwPzSqx86KiA
 +EeN+NZrmvTwLnF2v8w==
X-Authority-Analysis: v=2.4 cv=BswIUoX5 c=1 sm=1 tr=0 ts=6aa9342b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XdqwL9Qi1ApNGgobcvAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150174

Add new board dts for the Eliza CQS EVK that uses the UFS SoM.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile              |  1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index ccaca98ad4c8..f44d7ec94216 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts
new file mode 100644
index 000000000000..f5bdb2526429
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som-ufs.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
+	compatible = "qcom,eliza-cqs-evk-ufs",
+		     "qcom,eliza-cqs-evk",
+		     "qcom,eliza-cqs-som-ufs",
+		     "qcom,eliza-cqs-som",
+		     "qcom,eliza";
+};

-- 
2.54.0

