Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BE13909B8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369223; cv=none; b=C003/ls6zaDGjClCOn65tQdukmRKQ5M7TH6KIGwafIN/8TA1kFo8ePiht5ip/YYlFVaazXI8U7mHPno1R4ZP+HyYMEedleHMZ6XB92b9gu9tpSoOsktvnQ77X8R4InytYfch67NtUS+JleS2UnKv7QXUdzFEL/3a7X7Pd0uci4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369223; c=relaxed/simple;
	bh=LPPvKcrZVf6V1b9tZTV3wLC8uA2hTSPQxi3N8BiqiS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HwvLnBbI3dTDigg1No0A0H4d2eyz7P7RvmgHAmWE24H7J0d+ZinUlX33fx1jlowqDh3UaSJDTxpr5la0SyNZ0+H/5si3W08n7CRL9XphvlM2cEkHQfO52T1pXuNcYQJ6BBuPO+hEoB0e8UktuPksxB2b+/KLGNLXHNYIamFlbhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hcNzPEMj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZAZNhTx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hcNzPEMj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZAZNhTx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iptT3901209
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kd9NLJEZ3QWME+sDupDpN5Ruz9isBnmZ31KtXVG/7co=; b=hcNzPEMja0guthTW
	bPdxXJWnkoGV2nGbEPWr7knTjiYDDtA5h9AqjsLxC8eqhpl+XQD0Q8ReBpkVrLGg
	wCqlGESe6gcC703NAL0IkN5w2FFqLM9IDrxJ3Ng4fsFRqWFD/eHSmHWry62XKx7D
	oCrb/zzhAts+zoD82dUo8DpcMHkpPX+2SXJ1RSsvvkueftw+KNhF9+vKwfRPSHy+
	oP+ybfBP71+UYpJ4/ptJSynYDVcz+xUqeUuWK3yapwEzUSM//lVuWauIbdXNRjje
	Aa4SNh4TEmnfyLg/IQsweuvlUQ25HugeZtWm9PUPZahezFtFNr6GXUYbERS7rs6D
	iyPMlg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5d06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4e0dd08f4so1744303a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369211; x=1789974011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kd9NLJEZ3QWME+sDupDpN5Ruz9isBnmZ31KtXVG/7co=;
        b=YZAZNhTxQ/asQ8hC38EE2DJ9L/5h5b7kDMJDt5GKudCplEBPGAy0rpUhXsEtKWqnvo
         1fBC5FFWggpqpMfjQP+37yL7fHO+rdruwTLti75SYDKGH+Lg11Z5/G8nj+G//XGTyMpx
         XbbN9BbI3Hqc/omuMmQlSA1525PlpxnB2h3aBG0YsXaMMADzjQ5Ls3YDNoDQ489TZmM9
         +bz6xbs63gypq4yk6o/mrp9UaHy0vUFN8oer7zgfRqwSw7hOL4mVt7pBc2SvqjaDpPJh
         w+ATLmK114rzU6IeRHbCR9l0Fs7lKFwnacduiNhSBCV0oHrUoKDo6CHePur7jaRKd4rg
         9XuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369211; x=1789974011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kd9NLJEZ3QWME+sDupDpN5Ruz9isBnmZ31KtXVG/7co=;
        b=MJ/DAkyJcyqRr+tKlfozbXhVIlXtvCwTxug3eGVoS2ENQE7j9cueXYC3xUBh6APj7Y
         veHFT6TCv/AiAir2mTvRUWhpeF5u0cBgXZGRcaFYmBW5rIhs9BizIzHJstEu2WI2eM56
         sKZO/YAj++UqK5HxQoF9gZtUj3FJHMBPt2LHpIdm4BJWjV/MUc0c+gv2xYK9g2tbIs7V
         L4mRo5ul8SzC7QYkcmWiZbFxktohbpZHp9SpCk5vPw6Gu6wGDpaIi4JogIKSh6Lj2qvw
         TcmioBJ8CKqiBOlFmsGb51E117Sd/nIpuIzrAnyB9jr1LxA8qHn4Hvl/5aeekCbJyZx5
         gYsw==
X-Forwarded-Encrypted: i=1; AKwUvBxeVKiskQM3OqmCcYVoL/6sc5+pdY4fY33CfRDkJCpktWux+64tIIEJ2DTpDSXPm9a/epqTBbWwnMbN32k=@vger.kernel.org
X-Gm-Message-State: AFuF++n0oLVghXUH7+d8LzyYSorJCxQkkjH9ASY5wMueGhr3E7DLH5MN
	WZuGKtBw2mAcKgHAstGP13APtppBsOMIFMPz9BZ6Z0EepPPcSq86M6mIFuVzBrPeKD9Z+HWb6yw
	bzWJPk11fLsMbdBluNUq+ZFeXfv9LLwLLGkru0pWmGtYPZnsLKjx39T0Jr9pB7xoXsWA=
X-Gm-Gg: AYBFou3P/C42Jrm2JzAWJ+HqjY7cyYC3vbR/pkZiz+KZZNCLs69H8IK1LaqbX1YBJgn
	eaD24M94gVyrlhHULGDFvBw40oE/oe/rX7pXmT0oc1IRSMAc8JyUQYCQwWYvwFUiu3aCt+nexyA
	8T1n4hlXhkXe0TuoqizcsaUDgpmDwgcnqH/bGExhjWiTdr0yeC5K6d41Es4QornX2y32Gle/ha7
	8sWpum077WiqhQb/rTv9X7/qN86XClT63RzRoMxp0elrEPYGN5Xse+l6DEaIl+AVSjr9PLGHTrj
	n5v1cJs7Lcnb/8mKpu1FX43jTkSla4Cza0qDOHasvXjVTRsCQzSM0GSy1nHu9+wSBO9CU28SBDB
	nJ+pEj8Ds3mPuICdNRdO3cnRb5OKY
X-Received: by 2002:a17:903:198b:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2dd6c78fc01mr29404875ad.22.1789369210837;
        Mon, 14 Sep 2026 00:00:10 -0700 (PDT)
X-Received: by 2002:a17:903:198b:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2dd6c78fc01mr29403925ad.22.1789369210321;
        Mon, 14 Sep 2026 00:00:10 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:09 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:37 +0530
Subject: [PATCH 05/31] arm64: dts: qcom: glymur: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-5-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1106;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=LPPvKcrZVf6V1b9tZTV3wLC8uA2hTSPQxi3N8BiqiS8=;
 b=r/5QFOmiZarwnV8piFgE8vq40uBxz83uxjbp/ILTsQ4yBCbfeHHcUCcRKiC0n7tTlJZrBlgIF
 pmLT8COwNSiBpuw1UE4lEGOhENwYDlxDNWF1OANDndXqgU3Wir7kUT2
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX/EMkmlffCWK0
 jIWqmMHlSrJypQkH2s5yT6Af3zF3TPhoaN1RJ4iOY9nBcAjF0KVqEXLcfc8S1KPYlzrv/8Bgey4
 pGVpf3PnAUOpWDMu7n9661vfrc6qPiY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXz/hFb+FeLDE3
 EDu52iW3d0dnV33A16/IvPkv8UgGrPJLLMMzPG1S+aujd5I/w+sVWKQ/cQyKmr0mjn0hl6wjKkd
 NwhYKdTGOJnpp9U9si/INGmMVtNfc+gab8Ke1/kgYUveWnZDMNun6gVARqFhGVkux4KRf39O+7U
 UqtHvd18EguslDRyJa0uvypgJXNyUJhm24H1/0TzH/R9EF8cMexFW5ZobC20bHFb1BF38GtXTLO
 NcElD3z8xyf82eJcBozkVwlqNzFJEbm1fMV7x10gVrzn+UyLGn0jUgiM+n4PcHvxoTxZvBq9w07
 1W0qSmNAIOnPqeRJ1qycWm9QUlj5UTl4nCAJCaNZMhnQ7aPBeseMQT+2KZvqIvdtMvIWB0qEgX1
 hGpgz31fb+vHM3Vfth/STpKOxzxFlHwfpdZ/K3wLf4ytIdGdXUKi+yPgYRihknrs/8jMNsk5jai
 da95MuHqPwSmYSTzMoA==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa79b7b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=a6KFA2mGowSrcUvabvcA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: yyYcuVDbHIVcAP5Sdl5s0GPVbYhffnkN
X-Proofpoint-GUID: yyYcuVDbHIVcAP5Sdl5s0GPVbYhffnkN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 7dedace8c3c4..68e06443e91c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -369,6 +369,7 @@ cpu_c4: cpu-sleep-0 {
 		domain-idle-states {
 			cluster_cl5: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cluster-cl5";
 				arm,psci-suspend-param = <0x01000054>;
 				entry-latency-us = <2000>;
 				exit-latency-us = <2000>;
@@ -377,6 +378,7 @@ cluster_cl5: cluster-sleep-0 {
 
 			domain_ss3: domain-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cluster-ss3";
 				arm,psci-suspend-param = <0x0200c354>;
 				entry-latency-us = <2800>;
 				exit-latency-us = <4400>;

-- 
2.43.0

