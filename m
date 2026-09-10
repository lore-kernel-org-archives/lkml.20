Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFD549AA4E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046999; cv=none; b=MtEn5RP45hm3EkjWCzqPKTm1fKM/gBsSG//SCs0b9mOYjpwn3YN/jvSBzJA2MwSjcGNKSDl8msmnckGUzsOOlOTz4+8KtZKBiMnsQA3P/6N8AjeigusTVv5+sS3QknieDvMTRc+4aLU4LpLk1/rgfYHoTQWiFOOe/M8+UWus3Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046999; c=relaxed/simple;
	bh=TvZ3UJw/XqPpqBoCMULDKlU4Aw/aUNZqlZm8Hc+4xlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ryhnofPoHumMHcwvVnlen9JUrW70FuZRY6KJZzkAko2G3lqUFQSp8fl4sStT4U0OlULoHEh0Qe/lJ8LRdDxEt/DWZPrTLIVrQuSG6Su6MerkXZzJbjfJXq9uV9pUKT4mAzNeqwCychzzQV5iWaM5J6YjW8Z/eOYmqSnSvd13+sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=avMNOv3Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZADWHvS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="avMNOv3Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gZADWHvS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7rZh2029909
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7evclX5UWEZnODhkzybq2sou9ss0Uk3K+XjUMQlwErc=; b=avMNOv3QorUxRU9p
	4TKrSXwHqiVd7Ww3oVCTfxGSCj1AKrw417ImlW+RukcQmXcuM2Cchj0aTNtPVMIy
	nlYUv3eEiQB6uT0HbB8+xtQQ17UcDBRK5KgCPCO0CxBo8MZveN0Ru9PFBQLfN6/Y
	0LPqxxchG5Y/WbSkfReBYGC4uL6NAfkrR3MnZ2gI6kA7Mg3fFhs2sRSKSM7UOsPD
	pXloE++ZabH7DUQ9ISHDixJQlOSkBNRBlJjQEfVS1hLKRIxJZjOjdmsEZgyGOqYJ
	TpVWwRvJutNwj0msoE+LgaX6ppggjd5+1lshVtnAggxJfmdFYfLL7XrEEHGir0Ni
	f9GEYQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyhc04e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1189027a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046996; x=1789651796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7evclX5UWEZnODhkzybq2sou9ss0Uk3K+XjUMQlwErc=;
        b=gZADWHvSct3EUsSI+rcW2+5mF8JY4PHpXwhIgafA6OKepLDJ/76yEIGKFb+V3GSZcU
         KiDwxNa6LTdM9H44bmuX1XxZUjHmurcZRI6iFTdMJXm6VlZlXg6XNyAysjU9QFRXAOr5
         wHqg+W+SFP0WhhwXCGyWJl9FXr5xF8+9AOx5c41BadaoldzucYQ0kXcCKhPiEdJG3GRn
         WFV/8atccViIeMWLWC8Eml0bHE7RyqG7pzXEn0VCcD96/KDsgrtqreoTGykqfLmuiSwL
         zBODJNjFv/lk6ZT5MuTkKChZp7h5PAMAyTdVliQM0nyQU0uzYF1EdVQPyq7EEfB6ZGR7
         QqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046996; x=1789651796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7evclX5UWEZnODhkzybq2sou9ss0Uk3K+XjUMQlwErc=;
        b=O8R88ApylRtjpWByQadF9oNXYMX1uImFJKpuwWasP4wzcn3bl7MPgy9664tMSuhFNv
         gjBhyX6YPW+tUcQ/DReZjh78Yx+qNKSMKxkNuyf920gqSER79pEVCoczM2juboOM+xPA
         N4Kb2yQ/weqVQ7CS5pPWphIPUBPkqBTy13lAhQSccZ+TqfnbSPSbZUsubeJXfvIdwXrO
         8pj1OLSySVX135BFlWeJAPjjtsBCwMKfmVJZjMC7QHwsMrkmpHepiMrr2hwR0XQm2V3A
         j5sYtp0o3o5/oBFFIhdAe2rAApnNyQGr8tuZlmqsCcWlO/Fn2YWQBJTe82StKRa7lSEN
         3wbQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9YpcM9dgAZBk9d+dD1ctFZekWbPugTbYPsfDuN0fdhTdx4NPldHLY8SQmtQLVr9eyYt1odIeZcDX6VGI=@vger.kernel.org
X-Gm-Message-State: AFuF++m89sBwQfWosj9eofMi6dkvYyNCH2mlGgWBevsxfY1kCWZaHb+U
	6lEMebd09Blp+ZQov8rb7Susao/rHBlipSmaPK5cnYuPREXcMwP+3WusYfbrmtKXdHgfgV+id+R
	h4harLLt2XhlkpZNlPkwCNCClNCtvfdySJQlYDS5WuC7dneszoMqWqPjHUThb/cOeLVQ=
X-Gm-Gg: AYBFou3/jqwIm0mYX5yUpe/+soIlPHo/Ak4nYBgYjc6CdBVwE6KlPn9GzYKk4jTj1b0
	E5SDR02vc0WHphvbmOCK37jee8cmeVaCKfliR/IgM1KMZYfpquZolYqUQN160bu7FUXm6wAm3z5
	KjBxxvFdd8mi6JKhJggF94iEfoptblt5Qo0J70LtOH0Jtcb2h9BQa0crocuElAyrfRoYEMEwyjG
	cSs7Jb7J2cGn+dA57fVIK6OyU5ttWW10syIlpbtQiGdrsCOkbVreb4n9V/VSZ3kleCkeFhl3VsP
	lSAlzFZM340gJJnUsxo8sk9cpHK1Efp80CewjIhgNJT2P2BW2ImEj93I7SmXqM0xGH8nNYUwFH3
	9OCK0wHW579Z5sfC2J3lNeoBX4mtDjOfX3wM=
X-Received: by 2002:a17:90b:5291:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39d77b1d014mr5553095a91.21.1789046996183;
        Thu, 10 Sep 2026 06:29:56 -0700 (PDT)
X-Received: by 2002:a17:90b:5291:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39d77b1d014mr5553049a91.21.1789046995636;
        Thu, 10 Sep 2026 06:29:55 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:55 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:00 +0530
Subject: [PATCH 11/34] arm64: dts: qcom: sm8650: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-11-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=3279;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=TvZ3UJw/XqPpqBoCMULDKlU4Aw/aUNZqlZm8Hc+4xlE=;
 b=6Zbhstb/nz9yptPgXtRkhmTk1axG8u7IW2EKy5ruLReDuJUfhyLKniHYB9MXUejFJXmK+rm6i
 u3sb2ApEDQ7DrCXXWFEB1IjzbLBtKgc3Y/MHj82DTpfsiD2h74a4ph8
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX9yysod4Q5eid
 Lr5p34j2hrrcH40Ud6XdgqDDBgz7JI476t8wxfYBE1QWRAAd84ayNMShGCRWizafU9EQYTzH1Mu
 kl10ehOzYYYJUtkEqjBuZxSHYBpOHwv64D5ItuaY2ItnNOcH1ee72QBcUheU+nurERB1j+c/gvJ
 A02E/pYxO8wFTlKok8jMr2yw/zwtkApDw8HweDUCTfTqUEcOeSLBx3VDASfStJtdfEY/YgANXDG
 M0C/ecaN7Ug0vdfs/etSydWS39ILhVoSnfS1FvAqvAylVOHEgh67YGUue8fM40+TVfL90n37n2K
 +AHozUfA4CnZoD6iEg3jk/9HXZreG8AfUMZLdxOM1e3uLfrNAKofLVpbtYDLUogX+QxxOt74C3Z
 qQj+Bw4Y4esqMICvfMhkgEXEAcdOjyCxJJLZGkihh/Mdxm2drJesXEtpFygjXwESZKGOSVbypxu
 MltPfwMOvj6WCgfUeBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX5V86Yby0x3Hj
 78gwdv27DdlNODLjCk+k4lvV7fMq9I72UP54TkDQ4wXZhRSLM7JKsxEFFcBgoC+5yAbRjcLrabi
 h13VYhb3lFrYZMvuMJu9EMlpRbHz7LQ=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa2b0d4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: mevzEB5GjsxsvEvRIhb0j7MwXL58vCE1
X-Proofpoint-GUID: mevzEB5GjsxsvEvRIhb0j7MwXL58vCE1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts              | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 6ddf30ecabfe..668c183bc177 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -1074,7 +1074,7 @@ &mdss_dp0_out {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -1108,7 +1108,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 41d0c7edc433..b73ad7861eb4 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -1027,7 +1027,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -1061,7 +1061,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 26045430d34a..1332c864801f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -642,7 +642,7 @@ &mdss_dsi0_phy {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -659,7 +659,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 1fb78588a504..2e874f046a0e 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -1021,7 +1021,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1

