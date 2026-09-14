Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF44392C3D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369241; cv=none; b=GriAV4bjNVhW4xNUSMiwhNjMmkEPYKdATlSOCa2vWFWdkGdZQiDqsCLZAi8Oov2abEHK8SjJFUXvQwODN97/zlkzltIoGYihgVzIVjr4FhDBQSp9n/JAv7gJMtiLojD25F/RnkKG7P+rvS3a4/NLMstK8Dhx+U9RJSBh7UnMo6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369241; c=relaxed/simple;
	bh=pOpkcJXJFl6Fh/+JLEA+pVmC+EXfTn+h51loP9+XOPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ka527svkquHO9KYhCxOFHiIL3v7mA5eMD2xlFc/qnHSwNXMr3ecqWtVDe5PLwfGjwStvamOuKckekna6RdPqmWeexPvDabxebS7PllbcGeHozxJacXo82FkO2XtP8gqlMqi6UYU9Kq9SAn7ytxvDdLleWNhBVNjTeMoMLKlsHYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c2+qyDYL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Edr5M5gE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2+qyDYL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Edr5M5gE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ifhG3368748
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vgqfN7e2K3Ed1VO+TXhWmlnFQbJnqDdFUTDcZJR7DVQ=; b=c2+qyDYL1A0bW6q3
	vkMrlxA4+k97TzBvq62TeAxkNgN479ete4cCp8PXaLtjoCu77y202cdBarXq+9cT
	jqRSZcNyCzw6U9pVemZm05fy5LodaHFVEOULSiWkWYnHCeliiAkhhuiqzsro6s8n
	R0onbmA/2NPt54b7gi8lTxHqu5W61FnUkHKCI4BuwbkaWcoH4o0HAxOVFZn3pBo0
	FQIjH5jIUbYPfH2kQ/Qo+S5wIKLJPpYVAWqZxruGCYfhOPRZ8qPuzP1oyvxL8c4x
	UmMJiYz5Jvt7HS9DtxDiXk/ShJRkHmCUKI4Px3d2Szm6wB2a1wJmkNnw9loxUY2I
	Tacd9g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5e9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso3490425a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369233; x=1789974033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vgqfN7e2K3Ed1VO+TXhWmlnFQbJnqDdFUTDcZJR7DVQ=;
        b=Edr5M5gE5EtBlf2HnskNyMq/TBKDtM+LefIIGeBopean5ehHDRrV89qL4mZ0Th/oKw
         10HL8dtzVu/r08XhYlGy8pw6Dr0UeJJVNIxH2pH17Co4003ZB+Q2pcZO5aJd6mQaDf/G
         mdabF10l/v0rDSX6ClthB0nE01ZczU2e/NgOoDZHxeXeDQFDob5w4Z3p7Hru6XIkAz8J
         J6to7ue/pvl482AMKaDtQbvq+yD3L+VWTokYKquN3otblSCaUQhWIWAXb4+DHLRC1ZQx
         vNMFTpwZWn5nhxjgZYgu5RVp3dUmFlZHkwd9EB3C1qgstKO0gXBZkVl4hZJSwbbut1Xw
         9t8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369233; x=1789974033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vgqfN7e2K3Ed1VO+TXhWmlnFQbJnqDdFUTDcZJR7DVQ=;
        b=cQhjpbGXpg/C9q08wYfVAJ06twBRGJeMjt7u+TEYDTi2/OhfrrHHqh268Icc19N7v6
         +sMKoGz0CW8SOjRfqMFs4a/Be7TtjNnNeuCSiwKY/vxjA1u7ZA/lKwJp0gakSEi2Nyd+
         up8GRXTVr/NOT4AWFdF0mXXq7PYcUSO/QzeQYz05waFNZC2Ih3KLU7aUiEokFaq7si04
         vYmIa6nAFaLjvssnNkTp+wz+aP9/svu3HkKnJalKZ3AxSgkwk1w4SIFu3Yb5mdp3JLs1
         mV7EBgWTmCzblIgTAYxvbR4NgDWvWCME+/AayCztNpA3nJWHOg+VTqgSnJcQTAuWnvAL
         44Iw==
X-Forwarded-Encrypted: i=1; AKwUvBxSyG76XE1wavmLn5u2FOVUqKOl66X4t0eS+cy8kwFA47VOvevXx3+rOmf072Sf63vVWRonodhJNbttDpE=@vger.kernel.org
X-Gm-Message-State: AFuF++kHwtGV6kA1934Mrkczcc3BA7mok0MrJZAV9NzGm7+25oQ5NCzk
	xV1YlIsS/njpj9wurQK6NORSX1aQS+4hdexN2sZdFo4rC27qzt5RTPfgUVX1pjsPOQAdYtTZsbQ
	0I2DV5KREqcSXs9ShRujRJF7AQTQJpJy3uLN8La5nC/1JzpNyWlz6repQmJX2+VymWlg=
X-Gm-Gg: AYBFou3q3zYFdkrxwkTz/INaM9HuxpmWCby2tRIf/+o2WVQwTJphsBmNKrviE2j4N0g
	mpQdXt/twTS07P+2VBq0xZHp4330X1hk9q4Az66C/MKtDi1d6AAKnmQ1GWYEbzfrQWqSGXV1Dg0
	OgN6usmM18eNHeC2MeFgqqn0rbatmn/kqPQWOd61oWNk822wagm7WGARh2M2Hp+V3CFHypwEQeQ
	mSj2d7DhtL/KxvPS7awjLNajLSQgg/kuVJ2Rq1Vip21qLbsK1ALIPNkStBmJUsJjHUKctCFtGrx
	4Ky6LIeOMoMCyOxYukP0UG866pp2riltFsEvXx4ekQo7pqISLKldPMAKHwEKLneud3n1DRuHblD
	ItinveeZ9UYfyKVoYTVPKc7zjauOA
X-Received: by 2002:a17:90b:164f:b0:39d:b1bd:b384 with SMTP id 98e67ed59e1d1-39dec0b6344mr2990953a91.17.1789369222680;
        Mon, 14 Sep 2026 00:00:22 -0700 (PDT)
X-Received: by 2002:a17:90b:164f:b0:39d:b1bd:b384 with SMTP id 98e67ed59e1d1-39dec0b6344mr2989763a91.17.1789369215574;
        Mon, 14 Sep 2026 00:00:15 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:14 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:38 +0530
Subject: [PATCH 06/31] arm64: dts: qcom: sdm845: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-6-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1618;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=pOpkcJXJFl6Fh/+JLEA+pVmC+EXfTn+h51loP9+XOPA=;
 b=l3rOe/mmoMDkkS10ViVeh6M6Z1ybGVclo+yj7g7zXFeL6+tvggJmajX24/u29RCdzVBw4QkFm
 AmBFG02gyM7CXAgwLsnxYSvkzq6YZ4K8vvSWFyHN2N4zaPgEoRRsZpT
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa79b91 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=N-3nubrmD5AHxcc_kpcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX0HqHqknF0YBL
 CgqajbXVC6lssGK9FmLvjnG9kTQCZoyDpbSIcv5H6r9N90AOGY8WkuVdxB61VHoGv6PokXY3evE
 mUWTOxngn54eRzF8h7bTk+xGUbME6aTZB4hACmNL9f26srm+n0b9uKycTy7CC1xWeB2jSY+S3Ge
 xCwOUuoRjGiOVLIiimtkUtkD8IbSGEfUKTrsW6ItC4CsBkYASFjUObBvLu++HKZMeIDpCq406dA
 9UINpZsuhZumYi4jfJ1thMImcKTAaHv5vujIBBxdjdygdHnOIlTfcLFaUbRr/FT7M5XQGaPcx28
 yzf8gktFgOFNF021fPvHZC72DQf1Zu7F8QNEZCSQ5NXCPmIB471KsdMqUYsESDB9UA7JI5dx/5L
 THICcDnz5Ak1ruyxws/R3dOUrFU0ia86VdPBDGY8kzwwe90I/zR3c4gdll4HxPLChMard6TrnQX
 ROMg3aaBUAdITk9iShQ==
X-Proofpoint-ORIG-GUID: _LmP0Tvdt-k0egpxr9bzLzruDg47Tm4i
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX7LUca43g9M6b
 mvrJQPPHH5OE0exZCZlZoV6cxxUXGawvn3tfi1jZs39kn1NrOghuJjSsVKc1J0xxsdcyVp+Rs3N
 wWrCCAz7ChFn5NgkxS43+HylAWpYbGE=
X-Proofpoint-GUID: _LmP0Tvdt-k0egpxr9bzLzruDg47Tm4i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b1f6782a3ad9..a5693bc72636 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -330,7 +330,7 @@ cpu_idle_states: idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "little-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <350>;
 				exit-latency-us = <461>;
@@ -340,7 +340,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "big-rail-power-collapse";
+				idle-state-name = "gold-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <264>;
 				exit-latency-us = <621>;
@@ -352,6 +352,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c244>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;

-- 
2.43.0

