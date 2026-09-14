Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813683246F4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789353628; cv=none; b=qdaFYC/6GUIghTlObzkv3dS1Sxi/2rUToLVv2eS4ijsvPIxwFVpRc23bjAY0p+flZkaX3CS0MYA2jYxuYMdfQgNEClGyHekiCQQIpxIHDZzYuiWKGOcXl+kku44Qm6m7bieascZhcXDpsjyHPy11yOgXu94HjdLGSZp/hi8oduo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789353628; c=relaxed/simple;
	bh=PcLHYQWm10d9bOBJWQj+s6HnmUSKdzIhXOC5vShv3ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZAavO2o8CjsPp/vAw8UH9QN5HByOKE5kuXsZgqkQW8dHHXs4WnJEdqJqwtg2NIlz3O8NcbuWj5Bw8i9IUyipQK9gATD23/dPb1En/cGI6Nr+GnLtXn5Uw6KakwS6OdBlQfA2EQiOylNKysPBVFnxojqUzk2J/1ZiVWHevBxBNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U96+lu5z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0ZbsTuw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U96+lu5z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0ZbsTuw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E07CwA3029224
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Iv7ebB4XS+4
	S5TjbX5z1MBy9DOYicifnuRSlLgc0kgQ=; b=U96+lu5zkJmxuaJBWOzZHpNILfW
	WDdQjhfj2mSLXI92kXmFg+Oe4bNXtWfFFoyb4CwWuPs9Wmiv9ZbO6Kd63Uenk5VD
	o5l3KU5k7QdhrmaWffkN/V4nw1W+9xQqEHsHVLOkwanF7RSMZP2vLLYKSCzkEL/Q
	jBO+K//M/99wQ5WhmDJgS6w9+qXZNvFQMBfU2F/LwFCC86/Qg9Rrny1S5nXRQmkq
	v07WBzNOqd+XzKuSYU+fmpNPWaoqEULld9iM2G1gcKjnWFgzkvuOSJJyLUejVu8o
	qTMUbZ7MQHo/146YmGmLLO+GNfvY5ocPH+rLaV7U6tLXQHOW3lJiBVrTwmg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dcpaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:40:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de1ee0073so549487a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789353624; x=1789958424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iv7ebB4XS+4S5TjbX5z1MBy9DOYicifnuRSlLgc0kgQ=;
        b=h0ZbsTuwxJNgMQnH26nyHLYkq/0sU6MWXe8lTLH7vBJemylMi5ZWWqo549NMoSUeQY
         9p2DbDuD8non2dDzpzTwDIu7zdqWr1ztrUhFzEQDn6k9b4AeIsIUt88elZLLSeeZDcIL
         746zVzApIg55JYvP90pnpnlk/5Qo7A7D4tG8gLBsynuXbRriViSKCUzgmHEgwhjOwQo0
         HMNBmDcOSYYH/PbBk1KwLL+Eb3kR333RLCP2keTYog1BdbXjoAlaPu29GXjTeNeBm1NK
         eyO4MnfR1ceMN2T4IyyPvztt3UlbrBE8dZOSRTCDwsxLBpYYh2HNHootLtNT8Kazoafw
         mZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789353624; x=1789958424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iv7ebB4XS+4S5TjbX5z1MBy9DOYicifnuRSlLgc0kgQ=;
        b=HZRuX34+740selBbBT97Vtw0zBT5/EwSVV7OZkpy+MvBzXI0Alh97JHfapWmAvqaiY
         eXsZFg9W8ip7UfvHCO0FRwRPvEkGCNEyj6Cyqd/LD32GZ4t/7Km+znzEhvDy9AKSsUja
         RscVESkni2bZoSx71U7/mSAyOdVjUClMB+tGYFVIn5hkedHSebEaN5zIN61hdIu7KENV
         v2PR4wEzoYbjRECVuXJ4b/PmzJGIYzdr8mo8aFusCUsFspSAlgMTL5ENy2i9qNi3q4a7
         ehiOTdNc7n4JSp7cvaw7aIcF0mzjwRnnvRQtYdkRRbzzC5TjLd2eWRaIEgSNJnlKegDa
         tLmg==
X-Forwarded-Encrypted: i=1; AKwUvBzkQdKW66IQQV6zmrHg7/KlN7rT2uWcmniHOmykrH7/5a9SqEUxX6gHnPvfA5gLm7ZKh8PkqDT9gnxowLE=@vger.kernel.org
X-Gm-Message-State: AFuF++nqZPWbd+Na/JQu0tMufszddV09ItcUdUlsTLjD4BeDWYyCqGoc
	wuGwNmVMOsMfcbIp2vU0v6yq4KhE1lE9p55Qlhs2RhwvFZdnJriJLBXGP5ozY6NzyCSyY6lN61i
	usXojeNaQFTsPz17NK1lQe2qS5pEKe5rGZRQHeFbp7+u1JjgV7/6JQ+3uDCrLvEFGG6c=
X-Gm-Gg: AYBFou0gnEMPa6zwgM6YN8uHTDobGVFtuThiKzW67ka+MgXQUVJD1DqJk0ScvED81tj
	rXb9ifvQU+r83hd06ir2+xo2W6gyDEL6Z4rf5oN+/eajpYrShyey7ahz1EFZLj4iwGyvcYIZ8Gl
	bsNZ8+foRhhQFILtM6zFhsIjma+pEgXaBkiqcizXEncj9K2eS4YMSF+Xb2IES/tWYA1MGHvXwoM
	rrtmhN/GdfGBUPpOd2DINz4tY9KbmoBp50jzK+AsrLRtJw3HflBa0VrBpLAxh073JZ7XysRuQ7r
	0e9uGMlva0JzlUFvLda8eDHpSJW/YZx7LRzQJoCN0Dad6boaZP0BAXCGPzJk+lI3UOvrOHnyfZh
	szzBpVOI6NiDvjlvBSB8htsDNdEEqkDMeJAsc9rtc/D+Olgi8VHn7B984Dzhz
X-Received: by 2002:a17:90b:1b01:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39dd5726af1mr5629619a91.32.1789353624078;
        Sun, 13 Sep 2026 19:40:24 -0700 (PDT)
X-Received: by 2002:a17:90b:1b01:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39dd5726af1mr5629580a91.32.1789353623649;
        Sun, 13 Sep 2026 19:40:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm25943953eec.17.2026.09.13.19.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:40:23 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/3] arm64: dts: qcom: nord: Add gpr node
Date: Mon, 14 Sep 2026 10:40:01 +0800
Message-ID: <20260914024003.120931-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
References: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfX5QoNYysRxp/w
 B9y5KvcXdDafxKxa6nonIVJjHQXP/Uhy5bnvUkWx8QZUcCdvoP+Eo1oU20Ifh8JXIWoBQkTMo/A
 nEQMVLgYqwQyxkvUHrtuiH9DdOt2U9xN9PqwEASShBMcOBd7jnH5vy/803t58tvPSQc04Sj5k5W
 NHl1GDiPtlFE4TVvyKLdB+J5lT1UpTzmfpQygJtFV3D/wy/LbjoOBnFy8re0G30Ne+UuLLQ+xMT
 sieOb3qGgPqeP/ZGLJ1eLpZyrd6JNWblbeVzDOmVmjKyXfg0XaTnpi9vFMFYQv/9Lku8X037nra
 OK/aoMeqoT2y+YrBn1cX0Kv2ds7xxxj2tOzuHEb16lkKEW18SM/Q/uBgsjCZT6Uqop7MepWB946
 C3IITuIYg5EhqHjKKogIJhf1l/ccrmG7RcEkE5Tuap7SqtYjHWpaChaHn3OR+WCK0d2LKr8UyQ3
 kewsKuVOoTDncT7GSkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfX7KpqSNMx2Tk4
 31VX2kRRcc0Tu8G4dfV+mCDX5W4G7dJNFVs3LStdhGJFmCudKU0XTa771fz5JP0kKw3+vdD5m6T
 IGxWwS7/dO3jczUKZZ6ZlB6cJh+Jy6o=
X-Proofpoint-GUID: x7dfvVdzNvariXPJ57NYPZIQ5IE4q7mn
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa75e99 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=kWXEwByHTSV9Wy5cQ7kA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: x7dfvVdzNvariXPJ57NYPZIQ5IE4q7mn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140035

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add the GPR (Generic Packet Router) node to the nord SoC DTSI along
with the APM (Audio Process Manager) and PRM (Proxy Resource Manager)
audio services. These nodes are required by the Q6APM audio stack to
route audio packets between the application processor and the DSP.

Assisted-by: LLM
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 36 ++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 98967478fc3a..4526b3bd608a 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 
 #include "nord-ipcc.h"
 
@@ -1723,6 +1724,41 @@ compute-cb@6 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu_0 0x09E1 0x0400>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 
-- 
2.43.0

