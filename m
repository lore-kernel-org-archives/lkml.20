Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC4943BDBD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109440; cv=none; b=hHUM9LUA2vwyN4IrBu6CwDjZzxoikAsyllwgHKShlYNyAxWGjYjVaU6lnocJgFcM9EHbukUZ+gAx/5aApkZ21kDAP7g1HALSdD4Tf18z6JCxg1akyHkLtt44McyJP4tG6GwylKQkCtpfm1gg4qj8e/BeE6QC61z+LpsxvqFeSWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109440; c=relaxed/simple;
	bh=9H5g3Swcwg3dlkgYOPFBquTx6iyt1DX+wBg5cLvnukQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LmVTL7nynTWFR24LMS6c1IEFbrkLRDcyTklUmmJANLgXhQ+oWsJgToYSezOeOZyc+RGDGkYJJ9nfglVFY1nrJiepC4k1pmNTa2UeFRn5ebyFBxryx+mCcE/thlZ/M30CkXdYFbHDIrG0RMQAyDECvtdI5PrZCk7qycnZUyGA0fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2UwpS9D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T72uueO/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2UwpS9D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T72uueO/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6l3L93710442
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NRnVSGfwXFEcZBjwNKcSaOhcqJwxLrIrpC0MQG1jT6E=; b=V2UwpS9DhJLx/3WR
	W/Sb5SWrQGA3SM3CutT2TqE8zisz9lUxhp2jlOaVmnuGy0rGuNEBvIB9ZpLkcWKO
	ch22tc2EJEcd1AbDDta8efr1iXw9RXncVhp7CXI9WQo3CvXyBAeJ9T5GAdX+IZis
	GwEnVjzK4qgdyw6AWxflcefM6yHS1Zo6GoaW91Xxs8ilyPnkGZefRnIUbsiAlkh/
	m5jLODXwC2VOF/tsY+hkbC6MnbOcRxKEebIIvFbbmltw/oY7CyjwHkaWiNb5mRmx
	zD1QTuKEtQsQ6mrHhQbmK7QydoWiSo81nMUtjwrMDxC0Cv3ux9J+dz7ltXbKpym8
	jie/bw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q41hem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so1041567a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109429; x=1789714229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRnVSGfwXFEcZBjwNKcSaOhcqJwxLrIrpC0MQG1jT6E=;
        b=T72uueO/CPHEZEARMzMrq0QiEaGV12fToJvgrzvhqc0yFc8HTVYIsQg3fd5oH8121S
         zVWuXZEBuQhuw9mz5//6ml6On5W3M6NK8lbpICKq9lre6m43sNPZwqFjX4ZzIhT0WRI0
         GDpuF6GEJcajrDuq0YWdsgM+JwetRCTJHGZS4ZUK8FuXBwz0r6+uJHSdqw1LDb+XBy5N
         /6RxD7qUhr0t+d7xvBz1vPvgJ6d5YIaVxFOuBFY0YQZz7b2El3qcrepO4G2mURkgdtbn
         yoFju4lHszDHJjlOdwBIoywcCeZFJU/KuvWajgarQhdL0hTLIw/6dEeul50d/Lwy8Or4
         YCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109429; x=1789714229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRnVSGfwXFEcZBjwNKcSaOhcqJwxLrIrpC0MQG1jT6E=;
        b=TXHS5i88vJ+Q6FlqcLRypdYSZ10MBOqDConR7BB3Xo8YCYIhnGc47vOa3FAweh6rci
         SFZdTixZbQnnLnF0FFhjjMKcQLSLw82WnKqDHL/F8dGmOriU+lzORklUOB0wJtcu4NI+
         RhTMYvfTeWfziniUXLvFFdI9cIGVzdhoID3Gwmv+67EMdXzMsWy4ZJ+pFcciEweqM634
         yZcDLdtqe+a/3fIJS9GX3cZVYoYYBHeXIWm/ALfNLJF+1T4nanYE9FyLiat2W+g5I9Gl
         w1cDxiPQhijcfox/gtGW5DBhHEvct24kYJyk6a5C+qnGudJz2qbb8DVcQP7jxgS7OBqY
         pbSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjZX05eMuPsXFa/Q0K1MFZ+S+WGoAP5tbi+pHFHo1m31hTfk50369ZjBIH+Ik22Weptnf9lcdOwPiunTE=@vger.kernel.org
X-Gm-Message-State: AFuF++mmCQ+uh1t+kyZCMG7IArKZ3wremkfZvcwYNGM8OGJ3CvzoXow6
	/U2vZxG3OfLy82JK57dUL0B25+hy92G4SZg2HoVUx57bvByyU+UAsTU5D7wE7UNC1t5u2a+TsGB
	penAfHpseqVqRikn3lXsIX2RHMuMJwHuARj/6fYufW8MMUuYqJoRi4QlKtRWBQ0aiw50=
X-Gm-Gg: AYBFou18f1R2856tGsvVp9zp7vSBzCEDQdrwkSWBL2Kk2USmxr7GarjVPB4M/9rFQPT
	lBOW2cVwdVtlTEv6uSjD2pbFYYAwkG/m9Vw7WomsJRXOjYmkYXQUfaUCFXbIZvVUTRRCpGtSZyf
	bQFDDdol12zpoPeFUs/0O3Hs1QxsxkXRcTZPtZniNSxQkd7WFl+H3QzLAUXKxPar/2jAMa7oRJW
	1472nx55hcAhGWVSsfrOKicfMO7ubEVzOhizh3aoDL7oJ6SmMTdXHSCpJ1rL1EhhUXr8VSaE6JX
	70Gbhkrzu7xdxPb1yjcpioG/fvUKibn/X9RtDIO3en+LEoMCMbTKhVW12YqoDJCKVqE2qeSSx4h
	ENrKVuwYPN6GlulcR3V93b90p1440Vtg6FtY=
X-Received: by 2002:a17:90b:3906:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-39d9c3727b3mr4406697a91.17.1789109429593;
        Thu, 10 Sep 2026 23:50:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3906:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-39d9c3727b3mr4406651a91.17.1789109429116;
        Thu, 10 Sep 2026 23:50:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:28 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:06 +0530
Subject: [PATCH 5/8] arm64: dts: qcom: glymur: Add t-power-on-us property
 for PCIe root ports
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-5-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=1357;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=9H5g3Swcwg3dlkgYOPFBquTx6iyt1DX+wBg5cLvnukQ=;
 b=mSB9uw/D0MgRIWHxm/4QFHI1sl2GWegxaL2m6H125jfyr1DttoYv7dTiOPsUg0nNgWDoRoOJe
 Nnh7lVDbkxQDSOBHyAFLkQkn3pBPankTCA+3FMwII8vAJzNOp6O6gGR
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 5MQUbwwu2xXSzQei0HqROM4litUM4IKA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfXxa846KTyrzfT
 qZKVDqY9jjfdqt2vc/ffWQgp76zOvvYmMykqCZVLbTaL/YaQ8WUBJJnXA++1aYsSDgQMObvC/wu
 /S1Xz3OxTkGfrOJGQh/NeOODu9w2tFA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX6rNziI1XG8vb
 vu+ERu4AEWq9CG0sYL6Fs/YkvpxxJjXbWe7zHYFO3qXdXLXJytehu08Nnx8n8iIsxbIsRUacxzC
 4UYuCMEqBwL7ogbxam99FumZL2YFxLRBzAXioCoyvIThjIuMMd+IQJhF7uLtVymNbvrBuYJ47nj
 fSDg08Sik7b+aoeMdyj1/J3y9Zqvlp2+7vs4Xz4TqIuolblF+ZDgvV5jYac5VFHVZodJX6XgacA
 r2WOlttyfGaFJ+idkQrkPSbmkQreSPEOZ/XHvzoV+lRxzwlj2PHg3S3eZlCvAJcq6O4qXdAHbUy
 vDA5MtD/R0ESQbH0+8PVgqUur9YqCIjNl1mkhihUdpRu+IbbD/Tu1asakqQJM7AsCh6YXFG99Ke
 cF/iSOilsEH0pGnOmRavpQL62OdbP7NH/yBGqwormuQ8JBwgqf9wzJk49Va8XG7Aw2rdgRuUOTQ
 28s6GTpP6/Zd/zEQwPg==
X-Proofpoint-ORIG-GUID: 5MQUbwwu2xXSzQei0HqROM4litUM4IKA
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa3a4b6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root ports so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f04058d2e089..f7d7d76830b3 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3001,6 +3001,8 @@ pcie4_port0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 
+				t-power-on-us = <80>;
+
 				port {
 					pcie4_port0_ep: endpoint {
 					};
@@ -3273,6 +3275,8 @@ pcie5_port0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 
+				t-power-on-us = <80>;
+
 				port {
 					pcie5_port0_ep: endpoint {
 					};
@@ -3489,6 +3493,8 @@ pcie6_port0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 
+				t-power-on-us = <80>;
+
 				port {
 					pcie6_port0_ep: endpoint {
 					};
@@ -3759,6 +3765,8 @@ pcie3b_port0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 
+				t-power-on-us = <80>;
+
 				port {
 					pcie3b_port0_ep: endpoint {
 					};

-- 
2.34.1

