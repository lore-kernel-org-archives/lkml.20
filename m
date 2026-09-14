Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EB23E3D86
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369311; cv=none; b=btAWNa5GCrs7phq9TE4JsXc5jXCE/P6UUZA7vNrUINwgqvYdOd1gxAhlZKsZZHB1n4raJSui2qKLv74oP0FT2YUsS0mA2kLbnFyBc9rvSbqrmUvhNYJsCH26Ut5Bv7CBuiYPBOBb4gGolLmvGe07YL3jhpsXl5KSt38hawMBrD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369311; c=relaxed/simple;
	bh=sPo7S0YBGGUWx/tPJNacZpaKi6ZAXl4m+zTdSQEAPHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZTeK+qm5Lse70mro+CzXip3rWkiwue8oLml017Y1oOkQfCY9x+Qm4HtWrPG3vcR1mEDbTvvv1OjlSEw3Kfz0UeICfbKnCRve6Oakc/A9DB6PgTxB+yh3zi5AG9qkpzLJMyX/6SOU3xIKjirgBaQqY+JR6r3G7E3QOzTu4R7AkxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LEY9Bf3j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBVGITvw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LEY9Bf3j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBVGITvw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jS2j237673
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oe6Q+d4qd5woQ6lNUno9ozVZsOZH23epjbmHlD6/cZ0=; b=LEY9Bf3j+++RrSG6
	M365qIbRkGCQn23yiKYfIZoRnpZ7pTQdEFcC2FPOoH9xMxqK+eUsT/RRVNOdMSjF
	PcbaTUaYhecfudW0d7WJHA1E+jGdD29cHSIO/CjHPOwzHjhnSKF0dYjcUIWZtpL9
	tdcOMlprb4IcKRdGTArm2ihdcnsdeZFfmcny2RK7+hdGMnNQGkUN3qFOshAzjPM7
	+rlPBJHBYiuU91msIZFd+D3btFF8/W1jls/3O8cMh092AmHch6zbEBWbN1R24UMo
	11g+WkaFJPmE2NtdOTglQo6j6sCsdBP2tBKkrKfRHqKhF1exO3PUa2lFG3EjZL89
	Euq49g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnetb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so4261549a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369308; x=1789974108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oe6Q+d4qd5woQ6lNUno9ozVZsOZH23epjbmHlD6/cZ0=;
        b=MBVGITvwPn/z02juaF61KwSp49raw2cagBL3c04Ctgq2jph6qI1fqxuR88RCP9cFM0
         brtNyCqwEjxWPp2hDFyIVRrAy9aFwUtbtBjKjwWy+t8l0iOUqTtxBGpYguDRxVRZsSt5
         il0YpFS2fiNtMQ3BeJcgS5iEx4ZE/sdtKT+tU7uivHUpkiOo/m+tOZ2MfY27FIoEOGX7
         GKy2OHN1qyQsbFbjjHj4bhA3dpAqdW626zsm7XyuNGny3ChMQ3Tg3D7oP0PMNvoHXLxg
         2ZghHVLCwWgvd0++Ad7E1eJE8faVupoDItvplsqBE5OgMZ9VupBGN7tqCxoW8KQz5Z8U
         oRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369308; x=1789974108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oe6Q+d4qd5woQ6lNUno9ozVZsOZH23epjbmHlD6/cZ0=;
        b=KLIXJl3J5CL7HsvylNwb/zZ253Wuamf043x6JAb6w/Nd1VJQ4oURqn7cajcuc4DS5F
         gT3sCftTeAwSeis+5tt+hOt2UsDmvcupU5t5QlXJ4Pu141TUJzYlL9b1dpIp8oI3YVEa
         iwUFgozeQtnE+T/11eW9kZ+NQABndh97WCn6DpJ7ghDQh77OtDmXCmDDqdan2I1SUK/T
         Rw/rKwj++/obbYGNxiWKNafegTOlLyntkQjdJk1Y3O5HN390kwEqlUEJAZZC7hdQj98/
         umXqpW4q6DrujKeUoFJz/e/ivzJOo/cq6bIRaTgVdsBmex1Z3YRKKkFTn7tpcIdmLOrB
         lvBQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0YlDhGqlg5E1e4N49AY+0lOcpBskqNpGes0qNsJyC/JBP5gFUiINHvQAL12t2z/aWYhbmzrnYiN52BTQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lEBIxGVne5elcwX57kowvWvwF134YFP9aLaRgqgBYKEm0AHsQ4
	ZBlysw0lur58CNi47mGS0oYDH5UM6W0vgn57uHY6n1UF2rzTpf2UdKhixVAFvaGZ3XdkZzi9XbC
	rvt+y5U+a+0JXvGNJ2sXSjAJmj7V9l5YdUukJdOhLsV0b+mfBYpdIp2zojM/Lgil6e+Q=
X-Gm-Gg: AYBFou2Pk7JoU2EdFxMDQvq691slmnsJYafSBMqSDaZQAzRKL5qF5jR5otD3HKxUjP/
	qhLSFhRkkHyLn9P2ioRsjUF98WbMhezHmMWXnI+4uifbA0MfoQYVT+RZavoIT3/aG7Dv4zELart
	AT9rEDuiPngYJ4BgejHeuR7VIDCmIdGJ1x6dH6lzW8PGCd7IOX8c0pk0ENMi/Nd8CbCfMw2p6Ru
	LbWfCmu9ar0dlkwtEboilGUDJfsfeJdC2UlD6uZ4naKeh5ESCHSMTUpSFPlAaWQeePN28yN3LjI
	ColwJKV+dGoxfZHd9kawu8XjSHJJopazwJNLJMq8xQ0bTFPNZoxWhWHXS1lCPPmuiV/FlMwJ1VA
	N86M1V4HR6o0DBDVaRyVpIHXHZY8H
X-Received: by 2002:a17:90b:1b01:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39dd5726af1mr6747463a91.32.1789369308298;
        Mon, 14 Sep 2026 00:01:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1b01:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39dd5726af1mr6747404a91.32.1789369307780;
        Mon, 14 Sep 2026 00:01:47 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:47 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:56 +0530
Subject: [PATCH 24/31] arm64: dts: qcom: msm8917: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-24-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1224;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=sPo7S0YBGGUWx/tPJNacZpaKi6ZAXl4m+zTdSQEAPHY=;
 b=yMApHYK6VkoZu07zGWWV0jiePt/XaJDSrAFBBIwxW+uXmE/m0WpSjz7XjrrZrbAEn5yiQ2d24
 47bWCHQ3LTlDUB9tRqEdQXyJYTKlX/FHmrhgEAJ8kXVyCaC0C5jg+dm
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: MBBnykNt5ogCwLTqdKauEVPgUYyXBPc6
X-Proofpoint-ORIG-GUID: MBBnykNt5ogCwLTqdKauEVPgUYyXBPc6
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa79bdd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8YB88QTy4cyOp-Bv1CoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX6n+CKtU2If1n
 hhS66hENFUkLu400sB88CYOkjv2UkWSRMe+2IDya3xTs9EBUUVGZHjpbrMMFjcLK2YSKjnznC3L
 EvfhKRVZllfoCM7I8RcetFhVSMaterg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX6uXxEXQ3Svmu
 mFB5CGSMU2TMhN2dk7u5/Dchy9F26jNMRtHsaljdlwiN7HYwkBnmYJd/FHfF/X6sf1EeyENFnRO
 O+ro7/ZaIPGromRXVndqxUyZ9zx+dAlBzlmtw0WISDJmn3eH6lBRijLFJBazJ/CK5ni2g6e2HbV
 UE4hW6DZy+CdSU5lqRltVCHFzr0rMVoOMIxqbWpcD3JAUa1PfByEqF2vKptmHYOBweKIx0K4ioW
 UIFWmvXSye1qDVjVD4eD3l9VgCLmoA4SRXUfLuqDsC1SdLKlQOeuEqSF3Q19y/+X7KBbnvqYMQn
 CicVOkpcW6Ny4z2rd08OA+gb4g/368r4mWYqA7VyN+2QtABxkgHShM499NKPVLD2XThq2evUdnh
 gbiVhT0vpZcAfU6q24z9a5jVsOZiszL0niAfqrrSi3mRde7yTRctYP3g01E7i0+YC7Okxeb3pNQ
 p8iSjto5l3BfW4LfVgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update the CPU idle state name to match the low power mode
it describes.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index a2907f8a6376..0bd60f6bd636 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -112,6 +112,7 @@ core3 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l2-pc";
 				arm,psci-suspend-param = <0x41000053>;
 				entry-latency-us = <700>;
 				exit-latency-us = <1000>;
@@ -124,7 +125,7 @@ idle-states {
 
 			cpu_sleep_0: cpu-sleep-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "standalone-power-collapse";
+				idle-state-name = "cpu-pc";
 				arm,psci-suspend-param = <0x40000003>;
 				entry-latency-us = <125>;
 				exit-latency-us = <180>;

-- 
2.43.0

