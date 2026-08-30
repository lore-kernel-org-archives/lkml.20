Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF620346ADB
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788092808; cv=none; b=RPIdTo+eiP+yD+wbHVJ7+PD7h6UYUxDUDipdBfqP7+7Bu63z96EsNGW+JMXAl7e93gx8xVVLPwAUOPWmB/sXyp5uysGizrAlhEqaWoSNh46IN+ANW7k17I+q9kQky1u6vrXVgmdoQ29nR0fMPeVdWtmTeuu9sxNQ2zas+/FuG1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788092808; c=relaxed/simple;
	bh=FDD28pgo2JR4sT9/+8byaMMdSzuMbW3Opug55Aujvms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hZTRU9zD2v7xhPZ0NJCOMyChjVKM+h2/UcD31IiXBq9tCyqp12JQiTOxoGpAofzQss0ipW8zB2y69s+NASzjWDldB8eNo/w/+LW9JqA1U0mRjQE/KBv74JTgNeMcXyW+beCz0MuFD9CDNVG/+uDM2QXj7xXfgOAsQ84PGBf034k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJGH2/ZV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fx8OqTxH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJGH2/ZV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fx8OqTxH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UA7VU2086631
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9DliY8gQHUFIBwhqS/ZScFsxNq5PlVgKAaQ
	wEQEQs/A=; b=NJGH2/ZVFSboq/hK1aP8CGOC487HK85Lb0Hs+x8eR1FZiWKxL2A
	PMd2ZUoI3OnxmsYnvRgQii//xLC3z6VGr2liGTpvCJKypbDkRNinFt7zx8FOwM7Z
	ZPDh0E6XtKHhSK5lLYAyozt8/JNA57WaKj7n12Q62D1HePLLpenpJtAaWxfraN2D
	kAMCSGq9+No81KcwZzflo2x9x7G0b4X2wbUxrNabvQ86onMrmeRBCFLctJpx+o+J
	ZVDZ6mzPUs2TyNg1afPlxNmCEIJNSYDERiZe6VyXvbQCAdsPQgXTBzKcg5mP5KQJ
	81BOg69fKFcHrpncHYc8ffUFdqtsile8hyA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqe2ayy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:26:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so534682a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788092804; x=1788697604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9DliY8gQHUFIBwhqS/ZScFsxNq5PlVgKAaQwEQEQs/A=;
        b=Fx8OqTxHWMyCwQkKns/Ec2Yv/H2Q9pBZRvKhEiCvVF3kvf7PfR79TSwBnqGi/6TJi4
         KrFnwkhGTqj1mvcQXT6vmKCt8oEUDQ23beyhy+MdxHZWLxpkp3ORvVojwaeu+zqhTa99
         2gyZkF8l29VCh5qKwid4jO9ScuOh1EFtQJwES/goyjiwmbeRvulo5bofMZ/6hFa+LzE5
         Vut+Dz+84lZNQnF/q3IypJTLe+LfHaBAo0/Q+FbJJ9FGi6i1OF/7f92FBqCwmJJBax07
         8lNoDOdy2bibXjoBpBLpaIB9YsqeFDLNHqCTS8jmxZleu8bjaPMO11qyckLYXIo4iZnd
         TLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788092804; x=1788697604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9DliY8gQHUFIBwhqS/ZScFsxNq5PlVgKAaQwEQEQs/A=;
        b=PqdBX3c3Qq+ACfu2R+KuD3Z1585svHzXIvw4VeV/3eEzIr1yFAeYgy1LqPkWBEgI/W
         7ZtKorcc0dcl4PjroiSnEo6/0C5GG9alQYjtcwhBjcsOifJhajNSVfNwpO+gD4nKNdMq
         dZQcq1S/AS8krIxKENTfreqK0dfQ+F8WYfYBH/2+hv+xRNY9o5rmr/6kLHSms8dP1gk0
         GzfgroKRenSnhmxyMBf9esxxkacyhMeSbFam8JixU3cSG6AkVLlYMTVs76Y8qBW3J3hK
         ohV3/lX/QCgsnEGm+pV6/WO2go4liYOIgp6t0OAESyzCpRAcXLx5oNwimcUyRP5oIbft
         pyag==
X-Forwarded-Encrypted: i=1; AKwUvBzjgJxnYeLqm+xwr7hOXyCC1clA1SAGmt6/SqBIMBt27vzlTWB/Z3/TFVhxEPhwACiSaoBuBTJkmudzTaQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mJSisp+AEeI/yMZHxvO5iTi7kerjrxhTzsuBMu8Ivfnq3h+d3O
	0TV9xUXkNOYyKsn8yAFcuMZyo4l7FDg4t692398MJhh3UqpH6JtstifuXhzrOd10v0LMAzuAclY
	bnUZiZ5DPHHlwCgUwgp2XwF+AwUMXsFhNyib8E/uw01JnJFTegsxdbyjfAGOBqDtxehE=
X-Gm-Gg: AYBFou1rHS9Ku0tdIYR8HS2clXa1/daF9Zk/XqiWKWZm4UCCm5peEHJs6Y9ZfMI5b9q
	r7Ms2U4oPDBY0Bnlbi4qqlXdXy8SU657dBpjqCjSwiEMhoVBTCerL3TLTInR/6ozzJMHFjT1n10
	5BI8OdenwzUaUXI4Ca9EuontkFIeNHW2Ok65prYECsLQff0BI5E68Vr635hfF3MZ4heceNXRITE
	ULKEd54j9hMtTGM3oryYYc5lxUpGdDRLh4hqYd9ZqmdFAX+xoSr95vSXQZYGXvTdwVGI5Y2aBdN
	92O4i8q4X2eOC4c+rnwCAe3iL2F+kaolzwCHOT+WVX7ytZ1z0etPXi+n6k42bD2j2eatUJ5JDnt
	KVQb5CvcAzaUpWcHNH6vfvJCkZTGXeHBUoZa5w8OlAlxoyPJppJLN0dKVgJrM
X-Received: by 2002:a17:90b:2ec7:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-396d0c0af4bmr34255040a91.0.1788092804577;
        Sun, 30 Aug 2026 05:26:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2ec7:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-396d0c0af4bmr34254990a91.0.1788092804156;
        Sun, 30 Aug 2026 05:26:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b58c057bbsm7982339eec.19.2026.08.30.05.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 05:26:43 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: Drop deprecated qcom,bus-id from SPMI nodes
Date: Sun, 30 Aug 2026 20:26:33 +0800
Message-ID: <20260830122633.203250-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Iskutr/g c=1 sm=1 tr=0 ts=6a942185 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ChgJcJ5zdyUGKRC5B0oA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: O6AHu9jpP6yA2bu74tHx_iC4cSCuu-DQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDEwNiBTYWx0ZWRfX3QvdQa1I0eJj
 KJVvPAh4rpzL3Gp/GpqZ9lvD/O6uq7EIDlVNotp8+nuJdi7yLhhHuSv9YuZVRU9XphUsqcrp0wO
 PUuZhZDD9nADRb8/Zku64Yn5E5f03rwwtUUpcwDI/eOMY//ifWqUW0bLcWPUYXOUIgNGL9zF0ZP
 BHygisDWsU459AuZbZat9hn3/9mf0rIK970rFYngu862yTwo3B5sjsSCvAYq8J9Aj8f2SsUl2h2
 9LFopZFWk4SUX2XPtLJq7rrZrCl6DVjpVP3lFWX50hHCUZHwTK2s/0lEDPnVo7Rlujt4WJ4//Pr
 T3y6vgHQo7sUrfTXIvjERIQur1f4tKaDsyslLCJzvP2cti5SP5tMTsoD5DrJyfPzmg/Uz19C5gC
 MMh5XwIDh/BcMvZ8FsVwLhnsWUW8UlGC36FnhiJdWvSsWZAGNURo6Pbh52FJFEeNPxIV5s3XzpJ
 MGQlvCAaI35W2PqVHtQ==
X-Proofpoint-ORIG-GUID: O6AHu9jpP6yA2bu74tHx_iC4cSCuu-DQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDEwNiBTYWx0ZWRfX/7w+kWMFk5WN
 6pWKOdIsiZrk/rPoV+iS7x+Ss3niwTsX9C5IPr+fQtaIj2oqiwG7f+gdBF/MIApWeecDOMX6kUo
 91i7RuUW3n2FqQVLBqgdpt1KiaJH6nc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300106

The qcom,bus-id property was deprecated by commit 345fbbca3f76
("dt-bindings: spmi: Deprecate qcom,bus-id"). The property is not
referenced anywhere in the spmi-pmic-arb driver, so the value has
no effect at all.

Drop it from the remaining users to avoid spreading.  No functional
change intended.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi  | 1 -
 arch/arm64/boot/dts/qcom/sdx75.dtsi  | 1 -
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 -
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 -
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index aad8bf678916..3773c3413305 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2340,7 +2340,6 @@ spmi_bus: spmi@c400000 {
 
 			qcom,ee = <0>;
 			qcom,channel = <0>;
-			qcom,bus-id = <0>;
 
 			interrupt-controller;
 			#interrupt-cells = <4>;
diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 85cc9c6e6f83..2762529611ab 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1137,7 +1137,6 @@ spmi_bus: spmi@c400000 {
 			interrupt-names = "periph_irq";
 			qcom,ee = <0>;
 			qcom,channel = <0>;
-			qcom,bus-id = <0>;
 			#address-cells = <2>;
 			#size-cells = <0>;
 			interrupt-controller;
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 0e701e709235..9eea5198f1cf 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -4692,7 +4692,6 @@ spmi_bus: spmi@c400000 {
 			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
 			qcom,ee = <0>;
 			qcom,channel = <0>;
-			qcom,bus-id = <0>;
 			#address-cells = <2>;
 			#size-cells = <0>;
 			interrupt-controller;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d..15ba8c0567f9 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -6154,7 +6154,6 @@ spmi_bus: spmi@c400000 {
 
 			qcom,ee = <0>;
 			qcom,channel = <0>;
-			qcom,bus-id = <0>;
 
 			interrupt-controller;
 			#interrupt-cells = <4>;
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index dd738d13df8e..70555a426307 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3609,7 +3609,6 @@ spmi_bus: spmi@c400000 {
 
 			qcom,ee = <0>;
 			qcom,channel = <0>;
-			qcom,bus-id = <0>;
 
 			interrupt-controller;
 			#interrupt-cells = <4>;
-- 
2.43.0

