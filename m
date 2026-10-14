Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A2A46EF79
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960085; cv=none; b=F6c6u/W4S0XOXRUUXhpfpOTDq2GFKRMh0Ky/wrKpnFCFEqZ7O2yttgp0sbP0mbH0hw+l904QdtMTMb/e97YfoyDSJSxDyh8YgVbPTj77hn/NqCJzZqGPjUsl5E0bBInPF/RWAW5vrY20obpk7ZqekW5pVEq4m5Szp3ZJXdmeR70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960085; c=relaxed/simple;
	bh=IUYtuubMhhcN1ZF6PNMCch5PozFrAL2XyBYbmMT89QE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IyL3c/PYk7Gn9lYPuyukRgGxaESjcYjYLiWpd1dXZyWbaY2+PbjA4nQIAwN3GumjJvMq61k8VkFrqcNypQHtDUM1GFhwBR8I9j+C/utS+SPyN9bxZR0MtqcBXPF0OjnhtEhMvMW7EtBu3WoG4q5kXQVcVyiltLcXZUmmYFHsZmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pU71pD2R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EF4BMVtB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pU71pD2R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EF4BMVtB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E4ebsM806699
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6Ps/u3Sf1Zs
	xovH3oOjCRJifXEv1rKPvAC83aBceATE=; b=pU71pD2R9FOq/dDRpkIqCJeMP3R
	I//bh7lZbQPLm/JjKt832au5NJ1einmbZSxO3/P0nNc5oVQU185ktQXmTgLQR+fU
	j670BJ5Oh50aH7MOxXVPeMKmFV7AJ+fm/+yVPOLyK89e6Livrta7DdLhEL35UYQo
	gYRTOXuEQr8RHWaXqqygm87m+yqJPlBRlN5VUKZDeg0QPkeszztdskIq2lr4sIQZ
	nYKEH/5tkyl4296j3Q4YQG4jg8te0uleZRcZNJ9XvrOIUlOgfQQyEPDgPKImd2fz
	KdDy9bx4sW1YWcTRNCllEg3P2xQGCbiA+cLy+SS0mP6wJun+fWlAb989AOQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6a1d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:41:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-887faaedb46so220452b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791960082; x=1792564882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Ps/u3Sf1ZsxovH3oOjCRJifXEv1rKPvAC83aBceATE=;
        b=EF4BMVtB+8we2SMOw7NEpO1e27fLdJLt/uZx/V59eTvmgm7Xpg/5CLulUzV+uTRg/9
         KT9ANrQwWQRgMm9Fn1p2+M5sv1YnwFIjqWAlwWU0NuN3V6XSqMkMKykFBws7ORjbYfhn
         Zp1iSKMrjG8jCA20XuLShQ6wI7BWMGbGxmyvJ5jfUmWqHLedoA8ttQ4XXMujD2IaNNc3
         yOulBuGz54eqHZMOq1iz+6ncv/QwqwuZyWJbXNores0gVZZC9Dw3IUYl8u60KE60eq4P
         4twfixJBJxmL1YsDkOQQb8V3kLRflmM7sc/eIrht+pPcKgKnS9EXh9rUeht3J8ZPjWPs
         m8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960082; x=1792564882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Ps/u3Sf1ZsxovH3oOjCRJifXEv1rKPvAC83aBceATE=;
        b=ehU//p/ZWf1qoQ3lEhV+R8l7F7WaiFAsImI6ZAB2u4zMn8fUB12yKttmaLxw2RJ7W0
         QzdN1o6z0EG3quLEnTMP24scvjyLMVbFrQnLby325s9vn6I3MAcTzmmyhPfKUIiYzxgx
         iFKbu5Y95Z6YClqMC7H/FukQQexlgbj5+Xvsnn3SvJwI4lnCJ/vfXo9V4wmN2yOgApnm
         ePRwY6hAiFUsUdhmh2tRu3gUXH/voA2uWdGBjFptTF7aFoOuTybjm13dDR10epLZoMCu
         ZPxFHpHA72015z+SJ3RulpKOTuSYWM7oaA2o07IDzIr51uXeNxzT8MNSrD//3XyXmOq3
         YX9g==
X-Forwarded-Encrypted: i=1; AKwUvBxq4wqn0VnkvJvPB6AXRezTylnQK5JyeJMqvQlY61DOBT5xszwNfrubGtUUSv+BCKkBfgkdLFYsnKu0PPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfAY4x8AHfJjfa1YiZ9CpG0I/Dd5RvXNNBiWi+Xx3ymfXKEN5D
	ElZQjlkzkk0sRwWJ17UJ2b/33bI0ZmLk/EXDaAr+jJHoUYlq9aG4dfhgZnr2IrCZLGjvk2xpIHz
	Teh5QhYKYlXpiqBd05xpcDZmyVkE0IOOk1mQ6rjwE4axEugsIzDRQwqWcMle20aba40Q=
X-Gm-Gg: AYBFou33JDhI/2iHKm6Sy4x2VjcqaiCLHgoJ00XRQxVu8pGFl7d0FepGUhcN22HDTDb
	g1UPv3ZHuaa48GySQDM3atKdeCHCaum6KfR9eDPC6CB909Fh8dhjOrgh7G+FrKGPdAikqb1Y2Y4
	CBCaJTRf5dyP1cDkcw7t4ezfogn8zguKBmXjqNPf8HSbqtmoX8rvsjPFCGcaFuoJ5UnCRAmcbCX
	tgeT5tsNq1jOG24YhH/CFVHwlxKGCmR4hWSoQ+VwbTdvexYNWjQtoKBnqCZiXL9KJf7seoLJsce
	hNUkdL4MS5RGHwf5QPtfEfKOyGDNzg4tSCl1r78ocaYh9+wtyGE1gplsElI3Ul5om8ErViDQUt6
	5Lkemwrrv7ZOdaSOWmLXsJ1vA6widS5eZUuks1AY8njK+8iuoVlXkyaklRac=
X-Received: by 2002:a05:6a00:2283:b0:887:3fca:835d with SMTP id d2e1a72fcca58-897c78ddeecmr13638254b3a.29.1791960081471;
        Tue, 13 Oct 2026 23:41:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:2283:b0:887:3fca:835d with SMTP id d2e1a72fcca58-897c78ddeecmr13638234b3a.29.1791960081073;
        Tue, 13 Oct 2026 23:41:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f518b8asm733221b3a.2.2026.10.13.23.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:41:20 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 4/7] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
Date: Wed, 14 Oct 2026 14:39:49 +0800
Message-ID: <20261014063953.549379-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
References: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 31vCbcLtqdrSNcgti95DMu0LP_T5M-lV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfXyYqRQknfIs03
 mgUToKy0pV6oAMQShl3KPP1rt2RitQvsVPeHH09mAl4FUuPtJdBAGKb0rfB2v06AE+PUd4AcAwc
 DldSXzy86lf5tGfeCFnSYiBbR+x7LEs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfX8aRiIjQ1puiF
 Hzl+uOMCUg5StGNyoxdNhFUjRBEGHa4i4Fep5ogWK+cl+ggPQmQ3K+HCUgm1tgk3cOWfbjyPOhf
 q9L79ywDBr6s3BNpuFPFtWhk3ITHaguRR5UL5Jw2Btuzv7Xd+sDA0WYwWe4ZfkTAi6iihwELLTc
 imK5pkbgHlklD5a26ig95mUObXhYWK/VQlqiCJ4kQDjMv5C5KmCbfUl/FhSfegfI1+9UhSbQScs
 eweV0fzl9DpRhHw63Ex0NSLB/j+yodh7ai49XxwRHcrLkiyrnoP5xWi/9AYOmL2jcYS0NfuINTf
 unPa8WXA+938Yxf+IIli2eBBLy5VnVu9m3lL2O0/sDYquHcY+1Hf5aFWx4MCBVdfjOcy6BRjbwG
 titjOFlikTcCHFVX8dPL1y5CZ4b6mxznZbba2Rs8hMz0qF0+8xbB8ktZI/eVvKwkEzvk/Bvz9Lk
 YheHvfV2S5VmAvvIaYg==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf2412 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=pTKKwl7rlpcWqDfdxRsA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 31vCbcLtqdrSNcgti95DMu0LP_T5M-lV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140026

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the SPMI PMIC Arbiter node for the Nord platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 1fb276e498c5..dfbbaf94a7ae 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1874,6 +1874,28 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			#clock-cells = <0>;
 		};
 
+		spmi_bus: spmi@c400000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c500000 0x0 0x400000>,
+			      <0x0 0x0c440000 0x0 0x80000>,
+			      <0x0 0x0c4c0000 0x0 0x10000>,
+			      <0x0 0x0c42d000 0x0 0x4000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,nord-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xc0000>;
-- 
2.43.0

