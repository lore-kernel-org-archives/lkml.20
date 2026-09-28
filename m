Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39B94EFFDD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613450; cv=none; b=CX0FQ373dQ+NAozo5Fe2r/4UNvfuz+VRysMMjw96hgq/5lsB6iFGXemeK29prsskBEnFtG+sPGxEQzCsXp5QdwUWETj6nqCGI4L76Mvv0FBXBaj7igEjQn/zopyorZOu6Wq1U9nFrrEDG2sQ3LlASz9dM2Yio1WGDn7kO140ieI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613450; c=relaxed/simple;
	bh=2j3L38B9bVW4xmB1fQnAjzLeIRp/do902mCL+cFPQn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=odgFLQW0q5CgPGmNVBpAW5OD2VxNK7O8HrfZgvywpGGbgrlN/wuMPixcU2jj22QbXdIPGtc5Ok4iuPCWztzenLmQR0yMPqLLz17O3FP/5CTargi9HW4SNxUYQYew7CowHtmfc07FZ3CL4mS+jORGDgSaHGgMTj2VDannpZP4PBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJE3V6Pc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2mEwh2q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJE3V6Pc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2mEwh2q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe2Nj1498429
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lz5SxMHcV3mEG3tF/NrmVjwM3bUT5s1HvTWeTrC5Idc=; b=KJE3V6PcxhxQEUkG
	dKmJfjfPNkyZK2Aw4Zn1HTvWUkAADewHTou/5mOOZWknQpAb8rMnPM77MYikG32E
	yxAviDBSt46XEEhSZMLoA2DXd020lER+Ib7yBAhGBRVd5lGy7cdJS+sUWkT1RVI3
	XetJSGaG3XWc46BDFPr7G5nAYWbuxKWj23AA6ZNagCie1GkQhrzpFIvFhCfAoWDO
	ItHrmUX3tRntZOtOeoOe21qHzOCQIddWoF06niDZKEkEc0tTc52Y7EVkS35n1hDA
	8pRXWyYH/KeezVnsCbOiHUvuCoYJnnAMz5jQ+GV9SNBq2QngkL62J4a3Y9q3kvFE
	RxhiPQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mtabc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:37:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c599e3d3bso469596985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790613447; x=1791218247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lz5SxMHcV3mEG3tF/NrmVjwM3bUT5s1HvTWeTrC5Idc=;
        b=K2mEwh2qz/ghLzEY76TasdaoZM6rqUylGRWbBOMD+mYTSksDj0l+2MpaL/V8KxgFvG
         ato9xD0TfWwIsbX57lQlNlPbE5tpIASuLqP7wOjFOEBqTVqdvijKPXjPAmran80gtcEC
         fAtsnqVWMj9QRwwbEjIexSjn4O/gB9r8xCTd5ecngL5o5pzb4s1+datm2dwOQo5xchxu
         wSsQSF39Gk1H4Ceao+tJXXvW7kffG8vrQ4kSEBAO7S09jHbm5yLkbGNlz58cD3hae09g
         V/B+w4+Frq0oE5/hNrlamtp+xjva6I8BrOoNXKsrQPKZpoOgy9PKe2AoULPKDcyYoLyM
         +K6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613447; x=1791218247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lz5SxMHcV3mEG3tF/NrmVjwM3bUT5s1HvTWeTrC5Idc=;
        b=2IQdRg0Y0KJllV5GFQN6eOSpdcP2Tl/v0AIC2fRWRZ4f3c3X7a8TrOvfK2Jcz+yGb8
         1Ue/+au3/cLSb5PrV7+ihg37BAyjP2Gz2gxAC2BmxUwrZIhJIrpKiVM5KCXn4WWgp1Qc
         uy4F/n8AofWqgPoD4DkfUkmV4ur5EIGZZCxoVsV1ex05klyFVyIPBVXsEQ9fwJOR+J8d
         mTZC15mXIOMf6K+MyvHIHruABVVl4fKNbPdxrEp9mkIoBFxjSIqovhp/0Em5FpcKLmT5
         IKLWGVJ2HVaEKVlCobt6hX9+RrTh/mBl6fA6GMtoCd+J+emsuz4zi3YYqvGWxdPLF5dl
         1AZw==
X-Forwarded-Encrypted: i=1; AKwUvBw/E0o6beqm+0OGwXjPoij1V2Mxiqj9MMJ+tgaXN35YLpHm/SJKFsUZnbd2KiUR4/dyhpcxy+SioUQL/u0=@vger.kernel.org
X-Gm-Message-State: AFuF++kz2W/7+BtHhboFS7dWhcAv4Fig2sbj8Q0vyIpge9oEMdtZIyJr
	MSMcIwklV4DerZc+gpsbKWf67QnXwmflSXTYSymPE/GwIwuEw5Rjgdb8nDETs4vtLKPxsBLzIuk
	RCaurtrjGcWmeX8fnbdpb4NV86+tB+e0+9mHtVMOBOBjQm+chvVzpE7Y6VogT5UEAYHE=
X-Gm-Gg: AYBFou0bXvFOioRYyFSa3UDsSCWj6wIRrT/030srZZjo1xaffmeAYi/Ak7VIEyhLT7z
	E2piKWnfo3ddHe+2ue5ck5xzu+jGHk8DiP5NcEHDwUdJxofovTk9RXj54dIZxTBHsQMTa/Vz6Dk
	iXU4J7Ai9GsY7h3VqtRUoCkGCl7YoB2FgUe0uLC7ffHTqwQa55Jzz24JlrSgn+insV2LXtIZMGW
	+6fSceIdOdW9K3fGPUYaoji5qqYFey+8H/uhVlO160QoHn4OgP3BWWwkrc8uSKKZcWCA+Mlnv/r
	TwG8kR7rwKxxXtaGdzXhsnXzML2cqZsb68bYZansfRy8ssW3fNgm8Fec1e6P6OTnsqe+sZbs74T
	nowGguYi7
X-Received: by 2002:a05:620a:1a1c:b0:93c:7e56:92ac with SMTP id af79cd13be357-93c7e5695f6mr519457585a.12.1790613446983;
        Mon, 28 Sep 2026 09:37:26 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1c:b0:93c:7e56:92ac with SMTP id af79cd13be357-93c7e5695f6mr519450285a.12.1790613446347;
        Mon, 28 Sep 2026 09:37:26 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6456f8sm28442084f8f.26.2026.09.28.09.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:37:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 19:36:54 +0300
Subject: [PATCH v3 5/5] arm64: dts: qcom: eliza: Add CQS EVK UFS variant
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-dts-qcom-eliza-add-ufs-variant-v3-5-9a2fdbf6baf2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=2j3L38B9bVW4xmB1fQnAjzLeIRp/do902mCL+cFPQn8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqupepfSxPs48wFQxURcelCaqeD+3jr2uPZKySy
 XhjcVsPDV2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarqXqQAKCRAbX0TJAJUV
 Vn2UEACy/d46e2EPltwpX88m+MSHFRw8M/4ojVJzI5q8HJjT1kcYYWpU7KYsmRHtENBfX/Z19pl
 BbuLBuNCLi0kpLhjZvFm1k8OC6p+h2wGA7vEuyAPiBkNAaBfy/fygc3Ln0+31q8CjIdFMAVayBI
 Ekl6QKW69LsDcQ4c2XkJHB5CjkKsudLRkVQWS6dyHCCXlplPuBtP4DwZFEsMsoeu9iAkoJaYoA9
 6flL5ZB1lYbNCe7Z/kg6y3D7U2psn8M806h+JW7IEyQE6GuntPrYgSvOodZkgi489AA2zEMJOzI
 /CpOQ9GULC/3DM3FPDhjh9hMPFIMwuLU1Ii96izuA3sL1lotoKblsD8faeMXQqBV99U4xBiSfUP
 SKIatlhQjIBK2i6XyrTLCCIUD4VrRdPVYbpf7GskZs55EJYElJFLzhBMdXizqvdapuSOnXXKzmh
 ovl67LOsWq6SVu94pLK6ckC+tZwWvuliaDAYZk1o7ftTGFbF4C8SXM/ZvIrc7BCPJl0sCyL7f2Z
 cWNRCslzbxI62lAjSJJIA431o/UewqiCrPcPqVIk7oYAtBRmMJIZNWFdHo/Mf9jyL1Do5GVtQHa
 uvuvfpJetvTx14Mw3Xnt5lGEmIxoHjPFmn6/YIAWuFuPReSagNCpMEM9oKPcDDyLvtShfFKHTpk
 ouUYvmHllQ+W4eA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: mPVl0csj63HN5mKsB__nBHUTBv7j5eeZ
X-Proofpoint-GUID: mPVl0csj63HN5mKsB__nBHUTBv7j5eeZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX3ej4xxZu558i
 c8TXppSzEYfkOcRoRnWOxPRXiUrvWdM1ZZ1xyE4fFMizgSALWOuXBTTJgX2mcii00mrek+gowzD
 yWjNEe/5kBb4BNLAioQfNsBi5L+ndeEvDkvGAjpmoa5ImkuGqdpJrME4XUU55XkeGXSrgLyGhm7
 8bfaVpKxUdPzQeaeUb2mXpCxod/tjJRjEGgAdP4330koneY8exx2wLiff2s0jUemd5v1SiXDQkO
 CbCwC2VsK2hn03pitaG0PFvtz4u+RgJbcXafpJw803f3xNAwkHi7n2DrrFSJN/EFjLTKGbwBwYu
 bRVp7V3yJeqxwYhHDkOMM9Zev8Z1YTDFSM22UvPCL6PmDf/nBTxCIiJd76Z16luPDCf2NunT3OK
 qnNI2lMNXXuxWokq9Zv9cs+q6eaMQ0SMNJ7CgFpwO0qnHSqBMdrnn+nqKtXSlEBrrqfRpuSNHYA
 wldabbYd3q02F3i1rrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX6i0Z0YGC5dEM
 4JlX+Yr2kqOekzbdWQi21r2MJ9X0eUd4sWH7wwRJcckVWiuWEXG3lr8pMS5IQr31Stb//GR+AoE
 MWTDEm+vp2VfU+9W1M4BzCEsiyGcd54=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba97c7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=LXAihBi0aqfjOys30EYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280066

The Eliza EVK carrier can be populated with the UFS-equipped CQS SoM,
but the existing EVK DTS describes only the eMMC-equipped assembly.
The carrier board itself is the same for both storage variants.

Describe the UFS-equipped assembly by combining the UFS SoM include
with the shared Eliza EVK carrier description. Give it a separate DTB
and the UFS-specific compatible strings so it can be selected for the
corresponding SoM.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile              |  1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 3b3ee21999fd..a1fb4e7862ff 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a14-ux3407na.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts
new file mode 100644
index 000000000000..41239874ee82
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
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK (UFS)";
+	compatible = "qcom,eliza-cqs-evk-ufs",
+		     "qcom,eliza-cqs-evk",
+		     "qcom,eliza-cqs-som-ufs",
+		     "qcom,eliza-cqs-som",
+		     "qcom,eliza";
+};

-- 
2.54.0

