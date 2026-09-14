Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C5338F651
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369212; cv=none; b=oRdX4Ksi6cugupYaHDtjJIPIaEMVfveWQgkvPm8gSo+63082oao9bm0t1OBkXHvFBV+TkuZpHmkt4Oxx8BUv2CT4gnUPVwMWn5OIg0wbTzNOhjV2mOvtiH7UVwfKPqZs4sFyK1YkLIOPXqBS9vEyGcz2mKSdOiV+xdBIL7CsCbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369212; c=relaxed/simple;
	bh=svU8BbuuVAwoiLBm72RoIvI+zGYMCwAVkppqiMN+IGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c2UrvV2h3VauXUyW+Oz5UZ1YBCPJcSM2KKoKscKU36aNAzsIJZ6AKAxopnTBFqy8+kKEmRrMr6pJYertRVbmZFDFbyB5cQ9o9d3doI9sjG7geuhLsJ/N165VFarRQzrgrKbIOJfHvjHRMU039/dA0rsSK7GaaLzNOqzKaZY7pK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFfdKSFq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=feX5vz91; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFfdKSFq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="feX5vz91"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iwF24058525
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXP5o4xDPARrAChZDBOrze9y825V2kzS2pVQZPTOtJw=; b=NFfdKSFq789FRglg
	NSf8vZb6hsiSxLY2xmo+LDaTRSksnIJUDS0+kJiu7NakYduMaARkgMtEHPoQ2vSz
	zSmyf6wrTpOhdDKR1hiwbptTt6TkJPqYfTJuPbVNbPepQeahWXffWrRLtQQwMvIW
	NXxq3Qpeedo3w6fRgduWRtcybJHrGTWeemhNm3Uc01DB4aE2iemi9trHo4Fh5M7G
	rghku7jlNla1+MdIjP2XgTzFpl+qLTomjAQ0ql95Hvnn1L9eUn+8HUhAoDQ8ebcG
	BpXceLv20JrLfBSpgS8TBFAPfv35qvoMPgXQELRSUWrCErAWUPKX1afvagkxYExy
	OE2pXw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hss7tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d94a158dc8so44269985ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369201; x=1789974001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXP5o4xDPARrAChZDBOrze9y825V2kzS2pVQZPTOtJw=;
        b=feX5vz91P9gADKhMb8R5bQeiEuxRa+/yDMjj/9nm/meSk3puXM5yhSeL/BJrWC2zeK
         tZGx49FQCK11ZhNUWKvcWtRBC4z7Y3h94XwX4mLvO4s4uuY0e0hReEkkidCycTSGufst
         Uh5v8ADq0UBmLE8N/OdngcUvjXm9O6a6edcrK04fEiCTw8yCya2HfZV3ZCjMRhljGVvl
         BN9sgHTqBPIXAQGj2/ZJysQ3OXFtsIy1HVcfvEdB8fkZUDLgtUjwSSrPHjQqRPYxrVt/
         Dj3zcWppHZHXZA3xLxA5q8dClusQsZhXPblXIoolLpzn5b0SIOueoCwG0i7AGuBF9Fi9
         /6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369201; x=1789974001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXP5o4xDPARrAChZDBOrze9y825V2kzS2pVQZPTOtJw=;
        b=oP4Vz3DLGxykaJCwejOmugaPhoVClG8WlGm7uTRwo67vXDjSH/Vw0psq8Pw655A4HZ
         jdxl0MWk42PfPwGTVcK77zBvIOZNtvHTFhKPTck0EBH9Y55sX6btp9J/XRE2PCHuxBoQ
         UhWs51dnb3KUJ8Tzre6734rMg56hOiibOi++6AgC3XJNmVtvtSwHfw3p3zpzyVdwpJWI
         4su5wZKA1daOjL40EPKxkc1iFHVaJ1nA+8pbwA2HcsZs16XrE6Cit2GU1Nu6bmqll9SA
         CfOAclOLHO5tw/0xU+WFkVzam0UWgXTnBk9ioK5XFiPUZtXy1OuPPxe3dDZMxdllK1+6
         z3EA==
X-Forwarded-Encrypted: i=1; AKwUvBwOQmVG25laYPQ4MGkb5V3Euds5PthJHjVFSrfH7BPJlrSX+MnvYjfZJFDNlic3xoSyh9bQ/4rFj6NvYxc=@vger.kernel.org
X-Gm-Message-State: AFuF++nntKmKGVFIVPuA2x5k7LDO0Z52u8AuSLvOCu1PQmBlhU65iS8t
	45dNhbxehlWrCb9TY2QPWfWDIZZv62TG4bAZiVED+fzPZ5fXQJVmuBKLQ1e45MfYYQlCrT45WdH
	JUrT4s2Jcg+v0kM4HUhaRu05gLLMqsVl0g+bjMRx33+pGoFMuIlvf6ZidY3jt10VkDFU=
X-Gm-Gg: AYBFou3xxU+qgDqSVgOJvuExXotjh3Ocd3vV44TJfGVIRgZc+3X78zPDO5h2k6VD6Xd
	rhZ+2w+Nke6FdhEzHgSKPGuqwl+aUpXE+XVKyJ0k+6J8HDpAQxUphVKuOPMJWgctO8MVgmOQ6RQ
	lJHLpiYYavySvKceuK2rWMFkVzjIcfihOCd1fsC8NpNQhkrSB5gbXleCb5OhCewfKT+HLlRwW0P
	driLLtfRA4CRNhOpZkalSSq0321XEep10emJbWon4qIcEehxSsm1XGKlNCwn0dLmOt/JqofhDi5
	H6a1Xk0yOoR3gFu6c0oA66+DTmLEt6b2YTR7IzYk3jNpXJ7CFmUxMKC7CrwuYhRYLEDGLRBWDrH
	ZWPpK30E7rlmnHmzHRnu+j2DsLxR7
X-Received: by 2002:a17:902:d547:b0:2d9:54:fc69 with SMTP id d9443c01a7336-2dd6c5f35a2mr28083995ad.7.1789369200876;
        Mon, 14 Sep 2026 00:00:00 -0700 (PDT)
X-Received: by 2002:a17:902:d547:b0:2d9:54:fc69 with SMTP id d9443c01a7336-2dd6c5f35a2mr28083545ad.7.1789369200466;
        Mon, 14 Sep 2026 00:00:00 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.13.23.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:00 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:35 +0530
Subject: [PATCH 03/31] arm64: dts: qcom: kaanapali: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-3-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1813;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=svU8BbuuVAwoiLBm72RoIvI+zGYMCwAVkppqiMN+IGE=;
 b=7uO3CYmgsiSVauaEEyQ1KPpU/lnEf7k4jpr5txmig0v4OrWYUthNtoxauoej+UnzIP5rU6JrB
 aGOp8IVnY58A+bQQJAvNZiHEBIHyvX4B1WsNDs6cElEKUAHWqZQ9NDH
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX4/T/00HNSZBl
 iXUgGcPCoo5un9qsqo085sXX/XqO5IlCfy7DHSwGfi1QHu2EiGkASHoSBsdAilQGnZ5AqZzq/JR
 I+LdGIzmjLDKGcD/72dF0OvtEoEyYE8nOHu2Y5yK5fgvwjM1zTY8o+MNWlYdCY9gycGMtEsCgRw
 Dbnf9ZUmubhrz137Rhz8USW3ga9qSbp36R1icphDRS2BDVGKnzfTbtL2DevTJ8nbMlXaws0S62c
 des4t5/vpf0Ce639wp7b7Sfm+kPQRwTNSvQkZ7Af0r3NNeoviZAl8tCVttdvTYVSTipCHr/8xTy
 QsCycFXs7HWl/rfVTgCSFrtJtErRY7i9nk2xWAuqHA/fQ1LC2Vl4BlBXRgjZYI8PwQvCFCCwZth
 HMmfVRR3ARwBvuBHdORtw7bAIG9Q/TY1H7UUKIf941cu9zxWvPnRRjjRhWDXg5AsS1sjRKM5v6g
 TsMVbajoxSfWj1E2Cag==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa79b71 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=t7VSQ9Gu52Vdn1m2SL0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: lFFPM0mCIyLxyuWRRjR4JaZPraNqP9s_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX0XytifQqDVIR
 8g4AgekthvSDp1zRRJV3AhOyahNA9TCzJ0e+36ju77HXBoQ85ZgniwQBo7xj72NPFk+rs88JdD3
 /Jrrb1t3lsFsdObd9KsrGIHoFMH5O90=
X-Proofpoint-ORIG-GUID: lFFPM0mCIyLxyuWRRjR4JaZPraNqP9s_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..5eaa563b6b02 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -182,7 +182,7 @@ idle-states {
 
 			cluster0_c4: cpu-sleep-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "retention";
+				idle-state-name = "ret";
 				arm,psci-suspend-param = <0x00000004>;
 				entry-latency-us = <93>;
 				exit-latency-us = <129>;
@@ -191,7 +191,7 @@ cluster0_c4: cpu-sleep-0 {
 
 			cluster1_c4: cpu-sleep-1 {
 				compatible = "arm,idle-state";
-				idle-state-name = "retention";
+				idle-state-name = "ret";
 				arm,psci-suspend-param = <0x00000004>;
 				entry-latency-us = <172>;
 				exit-latency-us = <130>;
@@ -202,6 +202,7 @@ cluster1_c4: cpu-sleep-1 {
 		domain-idle-states {
 			cluster_cl5: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cluster-cl5";
 				arm,psci-suspend-param = <0x01000054>;
 				entry-latency-us = <2150>;
 				exit-latency-us = <1983>;
@@ -210,6 +211,7 @@ cluster_cl5: cluster-sleep-0 {
 
 			domain_ss3: domain-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cluster-ss3";
 				arm,psci-suspend-param = <0x0200c354>;
 				entry-latency-us = <2800>;
 				exit-latency-us = <4400>;

-- 
2.43.0

