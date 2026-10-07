Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086264AF165
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791388616; cv=none; b=jaYwDR+11AueYBYSuN+FSHd4CpefIFiCRZLz+NXvMMVZP1RZXy60NOq0dtp9ejC23c6LDvm45TajaP1FRi2d8z6sl6kIBpRCV4qKvjwoz2mvtVlgkmnKBWyubEnsxmyCcxAhkmBut/o1v/ksciySd72cxMqvSQqFMJHZsmQpQH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791388616; c=relaxed/simple;
	bh=mQpcXGi6W0R5kfqzYup4R1patFpyBQf4cTe6pZfPMgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IywzVaNC9HahCYfngScjD1JzaDAre6nzet3WWMrkcWV/WtRKxSQTRkFPfDONoCrYhqUhuiIS9meJezXNKioeV2cAyAVbYu5fwCCS6V27k3YV7xKA7aqnWzw2KOZZQlpap/jfJyP6GwVENJCp3QaULW8Wi4RgNBR13JQx2vC9Wcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kPK8t3Sx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bH7usqy1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kPK8t3Sx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bH7usqy1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtaIs436184
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 15:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NsUl3Havz/JIP4I1LoQMq0DuwUH1IupZVrtJEHCx2ms=; b=kPK8t3SxxMgrDjqj
	F4qlLLamNWJET6Es4HBxsLGcYqQGwTLCmqwegtw23fUm1nu7id7aHtzj0yCvw5Wb
	cV21L7baIe5BsUF3PKXFDOVuuIpy1kbqrrByb+L5uVhsw2j0fpL2ztB09Mm0Oxj8
	BsrdWfcinl0BUlKAln6ehzGb3/A+GiaiVT/5vhwhlhgBpC8rZFuANiyMTwL8Ol+x
	ZGjcftc66H+0GMHwF1wZN738TlOxPWp03n6ql/RBgXb8FWd3rz1lpotpMK4a+9pw
	dPkEI60CkmhiOPkZGvIQxrJx6UsH/baJsXbn9xcTOiWxymbVUU0GeHO15KXPp1f2
	+zMWLg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c60ayky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 15:56:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e2d4a8623bso41042065ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791388613; x=1791993413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsUl3Havz/JIP4I1LoQMq0DuwUH1IupZVrtJEHCx2ms=;
        b=bH7usqy121IESuyrTbh08D268chtpQYsvZVwTJUAUu6sEaoCllTUYOS+LYOBn1jinM
         86uYm3oKk89woA+lvEvPIXFtTBz2BcIDNpszOFywk482spxFxazY0aLNmm9Wn1zRR91E
         c/G2lymZAlykLxR17FLtatpICYtHVFoIc44bZoA+pl+32JwmlsgT+4b23tgaT9DsCdRV
         8806W0Dw5ANBiS9SdXiPbHnXQKkI9X8hXQnGaGTsvIDjhgU4yM5UpJbw0QJXYAZVEpUw
         yXsRDa7dQWQJ8J0OgMceSJZoVSg4zJVWLVOUY3ErhBj1VmABhTuMOgMV84a5gtLp5QoZ
         ho6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791388613; x=1791993413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsUl3Havz/JIP4I1LoQMq0DuwUH1IupZVrtJEHCx2ms=;
        b=iXNSD2ubSX4ayT4++piE9zoIGhr1GnqB4w9BiMMDKX4FT7cGFKFOtwcZlWHWVoRQWu
         EENOAkE41+xzdRt1GyyTr+fP9582MkB+tiMo87WnrW2m/1Cfw+cORW2ovfUJsQS1Acjq
         lGGRQPp0KX9MlrxUq8CyfXsanFD7PXhBCgpX7eKwzsGjTppLm2IzxghqIr05I5U3Sb4k
         6RuQ5NniLBX2Bb+tf0DlLsL3DxH+MLb2NjrnjKAvWOvqwcfWTPykwX+CJINnHQ2lOv8n
         kZucNWrHHA8nyxf3YPPiYsRbg3IIS2JeTk9ZNMOIt91TYMraAeCnlET3tzapoKlv/JC2
         mP0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxVgxfqqAvm45TzSOKnDUa8ORXQHrmWbvvwq5GWGH/JfeOQdbPi8uwOl4p8s4VH6o9BArb0vf/DM/3eem0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLi0aDwaMtOjpbl3bvrU9l3lbEy2pzGlmIe/D1Ue7a0cVWftQel
	GzKAH8LQ462uMTtWvTVN9pZ6411eRYFBf8SmHrtfSQj0lzIUf7VWfkksT4ZLu3HfEznGrgUTzXy
	Stt74mdLqE/PUh/XKQYl7N1O/U7Arj9DfhFeMspnhQ7ZJt70CogVhokmE5UIoyDaCGEw=
X-Gm-Gg: AYBFou2QHLiCcFTO8drGpNQxtGZsPiXjnPHkMojCMg332oxpWMjr+a2fFTcV+JBqma5
	GjgfMynPd6t5NOaWqK+Fk3hVWYRUJ1Y+qzcd14sfK3Xz5IoOUjT8RTXIlHGJP5FPTn6zpVcRx5e
	CJl4mrPfzYmIIMXQPRb+J8wXE9y9AFGYC34oDgToh/dNw25lRIS0DNNW1+ckOn3787r4whIF8eH
	FMSpVpEpD/lR3hzzQ7LXEOULB5dzbv5PdOx06sRmhb6QADvrG29UqjtsInHq3ElanZadnoJhLuX
	zI8V7wWJRVuXlQUpH4SqrEDwJr4lxGP5HC7+nYP+NbkxfMLEKm8hmu1qAZBZsSEUT0f8faUTXqo
	FZhwK7LqP5zqfBXGblUesAgcn86dPbkhk
X-Received: by 2002:a17:903:40cf:b0:2e7:12d5:cc3a with SMTP id d9443c01a7336-2e712d5cf3cmr2351285ad.36.1791388612824;
        Wed, 07 Oct 2026 08:56:52 -0700 (PDT)
X-Received: by 2002:a17:903:40cf:b0:2e7:12d5:cc3a with SMTP id d9443c01a7336-2e712d5cf3cmr2351115ad.36.1791388612342;
        Wed, 07 Oct 2026 08:56:52 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60f6626afsm11000655ad.44.2026.10.07.08.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 08:56:51 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 21:24:55 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: glymur: add CDSP FastRPC extended
 context bank
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-extended-mapping-dts-v1-2-b52eb8c3613d@oss.qualcomm.com>
References: <20261007-extended-mapping-dts-v1-0-b52eb8c3613d@oss.qualcomm.com>
In-Reply-To: <20261007-extended-mapping-dts-v1-0-b52eb8c3613d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791388595; l=4403;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=mQpcXGi6W0R5kfqzYup4R1patFpyBQf4cTe6pZfPMgE=;
 b=0xA07eP7q1ErGmV49qrZXrJufxPpvxa48e0NtuJNQ2ZAJOjbJAePGXtDdZezEDpfJN0MP3a+o
 gN+xeF7EeZ6DBm4miD9hczfgmOoMCCPpWYFkfkHxVO6muDkouDKlxAo
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: TvKp9elkUTjdsKSnAIjSBc5e1AKzJLoN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2MyBTYWx0ZWRfX16QbbOAF9i5t
 T/NLG7BaCVOHfUdB3j4I2rQpbnX5S1wF4O026C5WqyOJQqaJgHJD009gLldvjIzxLXPsdMExFA6
 CpuD1nOPVfbsfJsjAPk6Jd3FpA9N3lo=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac66bc5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Eg_51P1V4iClgTwtoi0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: TvKp9elkUTjdsKSnAIjSBc5e1AKzJLoN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2MyBTYWx0ZWRfXyyRLsgbryM5R
 B8nk4C7qfKSzIOdCNNe1rkbMRv9O8sZk6eT16dwrcCHCfWA50sg4XprbJLPZtRse3x0RWixsAdG
 TthMQl4+/qPDWK0qjNN+ubgcabvkwGeqkPdm87rK98cWMr6z3bK1Yrh9iF9i786rNgEnEDXWB0W
 eJ24g05SOoTzmtwxqVvmYlB3UAIwyttxhvf0Jczt9Zz9pG6E9zM+7mjLgRH723zIihbY5Q7ztoS
 GtOfRIsq2M6X6xXlSywHmprgz4ktVw4ATok1Z8pEeXMjuUQNas13SrtT2yp1jehDO7H/nc074gD
 N6YVL2YsdfFPS2XHGquo1Ewl1ayJ7cMo4kDcVwUL5QTduoggVhbovfnrsNVvx5VtGc5y7+noaV8
 luh+Kx2W5PF0tJC1rJgjG2k4e3ArGspXHmzjqfSqKi5bN6+qkidpOO9f1vsIvK5QVYqCqIOZ4s/
 2DyyNdIO5hJkUokIygw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070063

Wire up compute-cb@12 as the dedicated extended IOVA context bank by
adding iommu-ranges = <0x4 0x0 0xfc 0x0>, restricting allocations to
the [16 GiB, ~1 TiB) window. This allows large CDSP buffers to be
mapped beyond the standard 34-bit limit.

Bump #address-cells and #size-cells to <2> on the fastrpc and glink
ancestor nodes to accommodate 64-bit iommu-ranges values, and update
all compute-cb reg entries to the four-cell format accordingly.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..556867fbf197 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -8462,6 +8462,8 @@ remoteproc_cdsp: remoteproc@32300000 {
 			qcom,qmp = <&aoss_qmp>;
 			qcom,smem-states = <&smp2p_cdsp_out 0>;
 			qcom,smem-state-names = "stop";
+			#address-cells = <2>;
+			#size-cells = <2>;
 
 			status = "disabled";
 
@@ -8473,17 +8475,19 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 						IPCC_MPROC_SIGNAL_GLINK_QMP>;
 				qcom,remote-pid = <5>;
 				label = "cdsp";
+				#address-cells = <2>;
+				#size-cells = <2>;
 
 				fastrpc {
 					compatible = "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
-					#address-cells = <1>;
-					#size-cells = <0>;
+					#address-cells = <2>;
+					#size-cells = <2>;
 
 					compute-cb@1 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <1>;
+						reg = <0x0 0x1 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2401 0x440>,
 							 <&apps_smmu 0x1961 0x0>,
@@ -8493,7 +8497,7 @@ compute-cb@1 {
 
 					compute-cb@2 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <2>;
+						reg = <0x0 0x2 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2402 0x440>,
 							 <&apps_smmu 0x1962 0x0>,
@@ -8503,7 +8507,7 @@ compute-cb@2 {
 
 					compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
+						reg = <0x0 0x3 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2403 0x440>,
 							 <&apps_smmu 0x1963 0x0>,
@@ -8513,7 +8517,7 @@ compute-cb@3 {
 
 					compute-cb@4 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <4>;
+						reg = <0x0 0x4 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2404 0x440>,
 							 <&apps_smmu 0x1964 0x0>,
@@ -8523,7 +8527,7 @@ compute-cb@4 {
 
 					compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <5>;
+						reg = <0x0 0x5 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2405 0x440>,
 							 <&apps_smmu 0x1965 0x0>,
@@ -8533,7 +8537,7 @@ compute-cb@5 {
 
 					compute-cb@6 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <6>;
+						reg = <0x0 0x6 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2406 0x440>,
 							 <&apps_smmu 0x1966 0x0>,
@@ -8543,7 +8547,7 @@ compute-cb@6 {
 
 					compute-cb@7 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <7>;
+						reg = <0x0 0x7 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2407 0x440>,
 							 <&apps_smmu 0x1967 0x0>,
@@ -8553,7 +8557,7 @@ compute-cb@7 {
 
 					compute-cb@8 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <8>;
+						reg = <0x0 0x8 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2408 0x440>,
 							 <&apps_smmu 0x1968 0x0>,
@@ -8565,7 +8569,7 @@ compute-cb@8 {
 
 					compute-cb@10 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <10>;
+						reg = <0x0 0xa 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x240c 0x440>,
 							 <&apps_smmu 0x196c 0x0>,
@@ -8575,7 +8579,7 @@ compute-cb@10 {
 
 					compute-cb@11 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <11>;
+						reg = <0x0 0xb 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x240d 0x440>,
 							 <&apps_smmu 0x196d 0x0>,
@@ -8585,11 +8589,12 @@ compute-cb@11 {
 
 					compute-cb@12 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <12>;
+						reg = <0x0 0xc 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x240e 0x440>,
 							 <&apps_smmu 0x196e 0x0>,
 							 <&apps_smmu 0x19ce 0x0>;
+						iommu-ranges = <0x4 0x0 0xfc 0x0>;
 						dma-coherent;
 					};
 				};

-- 
2.34.1

