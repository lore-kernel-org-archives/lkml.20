Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029B037E5D7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369242; cv=none; b=lNcLw0hVgU1KpIC0SQQjU4AWEWh+jJWKDHbrWGINRYKjyyq4b6OrMdFA3HT95xYoXblx03FkQMXxJQwKJ+SSNGC8dDjmZogrMtQySW97sFFabY5LIunDDxeJjnD+YKXwESFhibz1xFK8dMQmJYIwE/OSJAkVeuirFVqNcneQnH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369242; c=relaxed/simple;
	bh=GLka7GcVE6RBS400scitvlbiRMjZgwnnJ4v6VFdq9FU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5s0pOYEz84WmIwUlcNLEGrIcyTi7Uc6we4IIpPIGHt/2bx6s27H/oyDxo3sT/Euc8/VH+Fx2gaTQk96HMXo/3fa8jqsvwuG4NTF0zBsK6DwKKBYsYYljMmIpm8Ve4cLJMY+5dgzD4zQTkvQZBs5XzghsZPFGaHzeHSWhQxzLOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bPi9ZkXT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGOhxEII; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPi9ZkXT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TGOhxEII"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5inNd4057536
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QUD5eH4UI3ASYO4AhQ8fRl58MTKoG81MecnLqAS7CVc=; b=bPi9ZkXTbZQMfsv1
	F8fMb78IMSZAB3KngjDVhuxhNQprRcwWkt3Fld3XB1f6/P9Ugrs/7BI9eZHXjsRj
	Qi6LL7MSv/uCZhrQRMzNWYAl0IiiFJU0oT8Vr1L83DR70hFIk854dRieN2LNLHIQ
	QvJ2DTL+Hk/KUvNfmfYnOdwGQCacHcJX9YW+jt2XdrUL6arxPFLXms7thXdzOvTx
	UYBewbL8kW18f68j+K3s4ztFuOjqRkFJoDMPPyIcaWvQGrpz8YbzJ1KnywjviVhQ
	olgXo6PAou6v720BHMDRcQThcLGkFcG2JFKBzCohq+AzEBPS+ao22r+n7c1tLLaY
	NraxEA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hss7wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so2570497a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369236; x=1789974036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QUD5eH4UI3ASYO4AhQ8fRl58MTKoG81MecnLqAS7CVc=;
        b=TGOhxEIIsf3iYm+qnxoSaDJi/6PiFERsHAW2nI9UJJ8wmhUn0JMQTUUWqrZtTLWj6o
         oBT+TM9Ot7yw4p+CuuVT7WrWDvdbJqXbNRoZ6ItOkc7qoZcf8XtuRBcgNHs0jQuf2mAG
         t8Klsn+QgIdGStFK4qjxefl2RJA76I2PqhDi3PWKPIY3Wifv5GiADqphVOI2kG+NkE2E
         AQfsli+TGDPmOdxMiRizRDks5iWaCfDgBDKRT66X4rijrxkWpburSUFtqNv56vdcPMbB
         WAwnHFeUr6fH/u4Zxq30Wasg0kcfEpRxpk4r1Pf7cwFfkvVOsXfKJqqJZHPCOcPzBDbY
         7wRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369236; x=1789974036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUD5eH4UI3ASYO4AhQ8fRl58MTKoG81MecnLqAS7CVc=;
        b=ZDQfiuElQcnm1GNpcmuAWvs4iJdAv+blK9QbhrGpYxOMEpO+vrnqbjNNj8/zVvUwAf
         uP0/Y5m4Fxb6sTUVUdzWc5uN0R05StEotSEd9EO97xNjcRy15VP3BlvXIfC5doLlD4uW
         voa3CvxXdIs14uSyqU4sIeicZlf4qxpQ5EZxmVhGZmgN0rKXVbdd9MYJuO2feACZhXtu
         IEL/C/XJkUtlfRrjSxxBzgQ7tPqhq+d12ZX7LEZ/SC1Ab+eGE2U/TYAjIV+uDBJ5rMOf
         AlhfX9KrVG2wTDQbJt75E0kLIPP5C45BFkFUTwUngg8Al+e+Wqd2EaWRO7wH9glIR+1I
         2wNw==
X-Forwarded-Encrypted: i=1; AKwUvByB4Q5aUAjU3mLYeRIWGdX/7RyP6iFtU3u7weWvboQ7cadMrligrw0GTHuaNN9PHw1tQ/KK1TvQFkjcMJU=@vger.kernel.org
X-Gm-Message-State: AFuF++m5LwirnTxVxCI2/NMoOyo2VVBtxQd1LtyqaQYpgZBh7gkHQPrg
	p95a2e2P9KvhlaX8WuJyfMptgZxU9PTB3QQ/AK/ApHg4q7SyF/i2D0O7gv+al5TRd/li/zVXCMx
	SS/CCmYFmboh5lQMCkTmX/ECMZhjpPB5NrW4JRmUmq1Pa7AhjOpEChsLcgutfkP5z6ts=
X-Gm-Gg: AYBFou0AQ9s11TAG0/uaW33fHs8xO/SdbtiNc3Zkod1e0hD/gGl1ZBZql3FRwJa9orB
	ONKq5E/mY08ZUSsqPrfgff68URQ3KLec5ZmUDhEK6rBTBMYeq9m2pueKOBMdb3myjGb9GeDOHiU
	vWPRG1uBmLHn0rhxGUH2JMOUaGPe6DrYrwjp7+pWCTDQG0NfH1jDubjPkEPxkT41ER3DPmFSk9S
	h6N30e03E6T96giTE2ndmkNhX3IpbbGt3roNV5mJUbuvQ8+xY7qt7bl+dYrZWBA/sr0G1oU8ngx
	xURK+Nn1Q1UlhEOMsZQ4BK4dzBOvu/2mzEiMxZ7laoItpp2cpaYqWQlxVlwm73h/T0Tf2aIxDMt
	0+aIbfuKwlp2AWgkfojpdJPhuJeGD
X-Received: by 2002:a05:6a20:548c:b0:3db:4bf:53fc with SMTP id adf61e73a8af0-3db26cf32eamr7080830637.9.1789369235947;
        Mon, 14 Sep 2026 00:00:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:548c:b0:3db:4bf:53fc with SMTP id adf61e73a8af0-3db26cf32eamr7080767637.9.1789369235498;
        Mon, 14 Sep 2026 00:00:35 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:35 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:42 +0530
Subject: [PATCH 10/31] arm64: dts: qcom: sm6350: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-10-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1396;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=GLka7GcVE6RBS400scitvlbiRMjZgwnnJ4v6VFdq9FU=;
 b=ZJ6fWhuXdkgUN8OV0Qkwk1HhkVVSrZb0O25IiEPraYoLQL3CnTp+XY1R8ViaDMwPlYoUMkR6N
 f6/Fu1JBD5UCPF/KiDxioHBQ1G7ov7VBzq2oPLK81oWY28aeo0DXgTd
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX1+j2OLt/mbxk
 H1ztk5b0SoY1l/bFWP84V98pK8xGqQhEu02OYJSoQRkW9Ukbw9b2p9hYPLcl5qfpJ7j8Nq2WO98
 MCVyx8K9882kCt/BeZ5/++eFdf1Ea7F7Y44Svq1OvqaYFE/BAxpLN1L6mxN1+4edfBZUxfjvDy2
 ZFw3V49bcvB5pazTzM2v4D0fERCEFyOWD8er1D+gfjElqb7sZTmQ3Q8RMAwQrI3NojhBokWSHcB
 L7ykpEabUd/Qz+8MPY1/4g3uwzQEW3GOToiNDxFGovfwwn4o2BTp3SQuNrSIrZS8ZHcGDK0O7zZ
 3DpMUCb7dqbo5p9keDEqv3zo/GHQApJE44NqIa52+remq+j4usNjLvu5xeK9Ter4HR9p9YqsUuo
 LId3G/KedvN1FE89VMzTu4k9CuDdgifMNmCzhUBDRRGNwM206RyXcUExF800sE+RSXVNycp2Pmx
 THPr7le9+hLRsSLI9Wg==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa79b94 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8fg_tvuPYJi1a8Ph9hQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 3iPqbQLRQuadk8rvVCKY221BAPFh04pt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXwFjO0qgv2hsB
 ydag4nJNdlqcWzDZVImu7GtOn3QcArRxA/LhG7wiYGq9kvAs0SGFXuUtpjMuIZfWKCGgOMzazV4
 ZzofvD+oZfFt95UlF1hBgCEsqUZqAHg=
X-Proofpoint-ORIG-GUID: 3iPqbQLRQuadk8rvVCKY221BAPFh04pt
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

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 15d38b7e803c..379e0b48f94a 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -292,6 +292,7 @@ core7 {
 		domain-idle-states {
 			cluster_sleep_pc: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2752>;
 				exit-latency-us = <3048>;
@@ -300,6 +301,7 @@ cluster_sleep_pc: cluster-sleep-0 {
 
 			cluster_sleep_cx_ret: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cx-ret";
 				arm,psci-suspend-param = <0x41001244>;
 				entry-latency-us = <3638>;
 				exit-latency-us = <4562>;
@@ -308,6 +310,7 @@ cluster_sleep_cx_ret: cluster-sleep-1 {
 
 			cluster_aoss_sleep: cluster-sleep-2 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100b244>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;

-- 
2.43.0

