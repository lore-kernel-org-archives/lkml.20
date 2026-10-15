Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52F33DC4C8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031884; cv=none; b=YbLSD0BH2ZSCrPRXf3RWEP/u70cxJvb1OZbTKq89JQjMk0tBHuBin9K2f4OFKry4LiM/8bOdZGFyWwSgVd0chuxUl7fsB3BB/eYHS+TIilfQP3z6bJt8b4jbuvyMehE1yutveCyxaMC6waEplACshtjFhOEN3QEJymm2wFkHv0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031884; c=relaxed/simple;
	bh=oi9/on91d449GBYTbEf2yNhdCy70ROE/FhkTuGYATnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bh0jWu50XdrWUsOA9Ktvh5ldH65GdWuf7XEkNRXb6IJt4bUTuCIX840p1gIUBx75osy2pYQJndHDnNipuIVAy+H77e8RLgYFOExsPHbIXKvf+S/3hQRXjWZ3F43o8ybm7MJcBu9Zavmi74eDSI3aimtTmMMDjtrQe881IiivBLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ey/EWuNH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iafZEPYr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ey/EWuNH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iafZEPYr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F2AXQV841678
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nuw13GmJWWJ
	/fBXgiSVGJlvBByWQxl2GyouAKaNRy1E=; b=ey/EWuNHd+L6SyedsOI0NPbBap6
	+KqKJP2UGJhuvf4ZTpqEd1w+GDoHzgb33Et5JNN6KdhjJKm8J8aOS5ZjFzKXvGs1
	4e+qMfjkhAUL1qnhEBUQgPHPGy+kSLHrqARAPKDzOpS8l/twN2Uk4NQ96T5/Cj9o
	geYfz3TIyTMBQilh4rNcPJQooyz5M2p+nFZEh3lQ2rr6o4aQbHLT/irnmd9fuYO5
	qGvgjFKWYf4uPjmQPxBBsL3xXTxwklzOFnpN4LzdUePQNgQ1kJ9iQBgHFzCd62sH
	M2v1dF62m62Ezd/M9hxepRNdNgn4fNNxyYTJQcB/B0XesH445o6tZ3Up/uQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wsqgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:38:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso8739396eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792031880; x=1792636680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nuw13GmJWWJ/fBXgiSVGJlvBByWQxl2GyouAKaNRy1E=;
        b=iafZEPYrk4eLtxuKu8oBQ7n8j96JDqqXmc4t/GqksXfD2HWcrO2vAdIyEndB57jiKG
         MbIq7GU8gPaElzO2f/zgJuZzCc1dfvkL/Hi1rjVfiE9vBKyBIqvTvo3lxorVhimlYtVg
         VG7Akmj3lJYHe4Yxp0T+FQ4wO7ZlS+Y2vGVqf136CsupvrVg1WA8zPVek458d8dXldgc
         BKNQ/x/h6WGG5PzsWdixkFRDFXu4DFc6FQh22lWiFHCs431MW4D4it8T+v6PY+If/Klc
         HZ6gQanIVavidBlgI+m/0Nt2CavFccm7REID3tWHHTH2ATHLEVxQfC8c9dfdMHXN6N3z
         ZqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031880; x=1792636680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nuw13GmJWWJ/fBXgiSVGJlvBByWQxl2GyouAKaNRy1E=;
        b=EM7MCgv9J4MJYdop3T1Et/S4rKawIt1NiqdtausozN3761XKQ7t1TE2RVtlZNQFN6K
         SAPhwi5Pq716wLkmHB26uL+iwXCmnt7WUUlPiAIpU2dyIzSPqIgEHp1Hp2bc+w0/ZgxG
         S1iwQqtUgN8jdO0Z0oMcAnhqhlrM3fZf++nwIaoyZ3BPw2nPL+LHioPDZQ46/7mnhb9z
         RKaxYV7n4XqMOfudP+8Nnvmrl1LWZH33ZaY7WC7e0VG9bWPrZmk3GO3DJm6TQDJ0rQUq
         9Pv9f2fcJQLbyxZNpWNpkshR/ApeIe3kSA0gfc0GmjEPNp8svpiBm0auMXlgbASVvXSD
         xhRw==
X-Forwarded-Encrypted: i=1; AKwUvBzWWFC+klgp9fZSOeCSX2N6iqAd+r0CdqeN4tKd4xeLyewgt2JNUqMvTWSRsPaX3IPFRtt6NdTtFsOBc6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+zVj99m9CUpN6VJPJK4dAMHb04IV0M8FmyTM66XQm5+qLXl4A
	9fY31n1xhIcu3S2oDflLc87tZgbsJKYvqJd51UGyrDtfVbfBHwAbHpY1Zij+6UlQgxqgsbL0ozv
	1Gv1t8gs45ikpZcZ25i/Plq8SmmSTTQ3hI6Go37PM11uTpYAtAD27K5wENecx/jMZ16s=
X-Gm-Gg: AYBFou23RKT1XMGn/3euOCQnIXURmvqi7iJgV2R0GIK2n5W6qKls23iN4CUnSqiy4jp
	3yXvTk/ng0qqqjCzFxzVPs+ai3MdH0LcXsOgNw3zpPZoiMvHUwRBm8abY0ztnTj7kOxXZEa20at
	K0o7/Jtq4M9uFGW6aIhTRNi1WFSSUx4gHEr+Y564xSLC9J4LyRJGW1NrS0F59ol36AOvKYl95oc
	GhUcWReDxDg1Jy1t+mTX92GCTsuKpC7fzc6tBYb+pInKNAlNhpIiRiuOZ10uh3TFX/Ld0/eGiCe
	TIkuDahuOSRvDqTbYZn5MILdhUCCzRHz7RcEAlH5nD4lOFOA+yPdG5FWEeC4+nSYD4Ben5LsLyO
	BYGZ75p3oH1lAfdomOHeEvP5Zd8SbHIMU/4bVCYXPSQc7DPuSp2msQJcBGRs=
X-Received: by 2002:a05:701b:4212:20b0:168:e942:4e62 with SMTP id a92af1059eb24-16a61789c56mr24356359c88.40.1792031879492;
        Wed, 14 Oct 2026 19:37:59 -0700 (PDT)
X-Received: by 2002:a05:701b:4212:20b0:168:e942:4e62 with SMTP id a92af1059eb24-16a61789c56mr24356325c88.40.1792031878876;
        Wed, 14 Oct 2026 19:37:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm51217017c88.15.2026.10.14.19.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:37:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 1/7] arm64: dts: qcom: Introduce lemans-embedded.dtsi as a placeholder
Date: Thu, 15 Oct 2026 10:37:05 +0800
Message-ID: <20261015023711.721837-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX4XJeNKS8WQ2x
 fP4T7JQIks20PerUtg7dYGMDnc9NlNpNw4hEFxPzXbnbcXgONghHCbDWwf2LrXFmazBTaZhmlCU
 dlp69aSU7DcPTSEPSrG4P4IMiJdj4dE=
X-Proofpoint-ORIG-GUID: eTAnH6GR0K8evFJN6VSPYKqum27uYy7t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfXym/WwkCenoKm
 m33eqLukot64EdzcDlq5yxrj1sThIh3ujdGCgHHox3TDd+XCZYlA7KCVQs9WQUzzxXb9xnVYBOa
 F1xtAMnjbXaLG7PBu6dAPQ3SD/5X26XrpIHNY7p54KD9f2tReFyvVP+1Plxe1NKA4xs7SnmWYZC
 nfEKtKq166tmRStcVDd/Rk2kZenyTF2Q/ZV5ce6lbspuvfKLrERTflYEszDuvfR8MD9rnrlZ89Z
 ZUuhaYUsY7EvYRLDdaf02Wrj3wa667ARYjJvab9DhwpSOZAPv8A58Csz4dUGolSYdBrdUc0Sexj
 oGpeEI00ztctKDWYcEUyN2IQF9WKPUP/lrajBjkDQQ92LqYJXit0dIcqxknwHpAe4qFGQfFaYr5
 t8U1KDC4fRqyVG1kdUTNs5AGSjlPzGIGwUoXV8RQP1kGCQ07523SZI2ufCA4dMWQcA4B4lk9LRR
 GrFpPNMJDXCm8nXWJww==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad03c88 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=5r3D8o42p4VsMVMPxZsA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: eTAnH6GR0K8evFJN6VSPYKqum27uYy7t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150010

Lemans is a Qualcomm SoC family that includes not only the Embedded
variant (IQ9/SA8775P) where platform resources are managed by HLOS, but
also the GearVM variant (SA8255P) where resources are managed by a VM
as SCMI server. The current lemans.dtsi covers the former variant only.
Introduce lemans-embedded.dtsi as a placeholder for now, while later
changes will move Embedded variant settings in there and introduce
GearVM variant support.

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

