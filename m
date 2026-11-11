Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382308;
	b=U18z0qLpXTe/5my98yEZpBmuPT146l+HfZ7iEW+2FAz71qANYhBgyj8UUuqMOZACPalj
	 xSUqxyC/imZXO5y2gve0JoontjTSD8tAS4jNd5kI4ZdXg1isPpOLH46vre3EDL/UlMWFj
	 8FOKQamFYl2lxypvUjyXrLuXi0Yhz6FTtU45FAuY/Wu1WOf7LODtw1EUnDrFl6+Z4twua
	 Tn5tHwZYJ/1kA9f7rhUoju1CH5KjUWIn8HyU9pXHbYvUiNuciO9ZkHm0NBKqAw6QpGnCc
	 cCcznvkKZg6J5AaAALSNglPlPaEUkRgPOnhLiCwhJqBkxJxejnXOl5LRX7s3j1pC+XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NcNvvo3woIB0oWQpL6j7la8H5u0j7QZwDyKdlDHI+3g=;
	b=kZw82671biRlKsL5xSgAt3BNwm9mN6zasmmVTwtvKVCEQPLK+7czBMSPU0/qb0o7Edvl
	 V+dRsdXgUXkk7dC/UGiHyt06ESHpRds2qN0Yq9fNTDZ0vlgNyCA272Hv7+KXRzbTukHyW
	 yLgfAgODV8r8y5lT45ryDhkWeCyRZzm/stvtiVbmmp2gl69JhMXreiyFhKUyVD54JAEeq
	 JRcwxmqHJKigpvl8eDtaSVKKGJpe56s8Nrwp3KbeXsABkVrEQ403H79FOSlri8XREOZ+k
	 f5EXpJWC+qhTtXmh0JHjkThG5BzKZR7Bb8WVVD2QI5p8vqIuyycsjbtjcleEtQQj5Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zn2bEpI4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CrfnqRwr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B6A60A2610
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B6A60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zn2bEpI4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CrfnqRwr
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB6ZAD1581178
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NcNvvo3woIB
	0oWQpL6j7la8H5u0j7QZwDyKdlDHI+3g=; b=Zn2bEpI4cWALr6LQdp3Thd+FyIg
	3kSdtDhN2872o9bSZR8npyUQ7pu2BpRIwiVsRELHSGHHin/yuC5xWk7br6wAGBuq
	YOwscxtgnnV1leLBCez48H9tsc5VMJb22MNPMeg1nphxenla64OLjzG/PfAkzLuj
	RNJ2JXEFpGOCRr1KQy3TU9gRY3OxiX4e7ltLWF1//Oz0nYYfZpPXHI7nTMAKGpFi
	CDb+bN+aT3K7FHStQyv6yS9dS7cvrcuaOcHOonjWza5BEeBQw+XaHAWYNC53M0kX
	ucwfJbB4IrQFsGCEbzVvvj0rZvFvaFKVZXxZhXAn5zwQ3UqxjkuEJV367kg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7pr6t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:31:47 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so5582374c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794382307; x=1794987107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NcNvvo3woIB0oWQpL6j7la8H5u0j7QZwDyKdlDHI+3g=;
        b=CrfnqRwr4WeietlPIRltHIYEfPDJ/MS9JSCyi+HONJ9inaT3rvWo7CYOFlRLReHb6v
         BonvyhiDjsSUJKcwPjUt+VSXeh3tJ2naDrSAxZx3FzXCs/tlkkLgTdjBktlyFFLGKd0l
         DvnzSpKgyYB6gu6rFhsJsy6/ONbcB3lb5FVX/+OkbXJZsvNp9vUErHdSxGrzy4XOemUm
         sQ43LeUiGrux4NafSN3Y5nPPydzKOVn/9NB8SWMAbwFc3GNwTitkVlDft378MG1ITvDM
         vi1P7uO88PMAKcU9FxGQWybeP/W5w3Lf5U2bYWQ6+lN6uAuJQgVU25FrEmsvK7dFSpAg
         SnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382307; x=1794987107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NcNvvo3woIB0oWQpL6j7la8H5u0j7QZwDyKdlDHI+3g=;
        b=NcOQnKBctJIs1eu2AUGrUfh7wnFbyd7yZAcxY6jSl3HV+s4H4mGHY2RomqsX7+0Tl/
         LFROb6khSBG5ODcPwTLvalmVktpoIoU0HfYsQm2eFNrdfHU0+qlNVplH3l4mmTJL8Qyp
         4pUdlFSG6cPfcMij7b0L0jBtBAgGQ/Tano/SJ4p8Qpe7fVPd0WqsRRV/wn+QCTSrEKRD
         90cnX1BkJ3ZeMwp0dD2Hj1RwhWMw5MGs6LXVpTi4iD7lrR+T9zqItMpIZucV1odvRXeR
         JR4luCtOzNs6hQvNg9MEe3zb4i1GMMCATuNqbOArhCa8GbTAotZ4MD86uKxCWFf4qCwq
         NwOg==
X-Forwarded-Encrypted: i=1; AL+hErGltM1At9E6gGYQSkNppAnakuCkD4Zmpn647viQGqf7y0a05f9n0mfI/HOICWr/eMIQg35o+JW+T3XZlAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N5oJUXtHilibvCp8O8FltYbz/hin1oulbGuq90Tfj0O7au2la
	39+2ktj6h7ucOmTTfXqO1A7efH8A7PQNFde1oXkIOKptatexm3lgUxEfpgXgEJxrrAn4b9VUjGf
	guML2mO7B2PSJdVl3WvXReYR0gY/fOlkNl0g6IBMNPC9V3vw4P3H+fjgrA5DSHgYFfHY=
X-Gm-Gg: AYBFou2DdEUBtaPaJn1CFU9c+Wf/0wf9MoCXP6oIvAaY66bT3vmoznEjXXVDbgkTEVZ
	u/ULERYYquhYmidIu0SMy5xpsTuyJV3PQROLiVqJ94Zx6lsU0XjqoBow3JcuFPgRD3RUnIUNjUn
	86oUwl31wP/rVz5oDsnOyp5wWnmDK7hEbTtjqs2Flzb1NiHlh/gLXYBoBsJWaEeckJ4GytyKTMT
	nKtlvxw5+WqejX/J65IpzmNmU8u6iIK4X5M1CAhQQylDjDkZiUsb2NfMczyRb0KNOBUr6SPWexZ
	wEHXNIwU5bP58ZaC/zSHQZY/GjDejAzwg2JI8nPQqAc/tvGEHon3Pi4+1+PMqqK+x/Y0O3vlVmD
	hxPemW05ZhVnMBFnBOyk65jW0T6KfuaWIx7H4eZ9/KwMNWXG799AdO3RKzKohILieuufdyj/p0Z
	iD1EJGi0nyAbi+MAHBlkfEGf5dVm/bK9oo
X-Received: by 2002:a05:7022:d99:b0:163:a197:722d with SMTP id a92af1059eb24-1b3c023c7e7mr1663358c88.4.1794382306245;
        Tue, 10 Nov 2026 23:31:46 -0800 (PST)
X-Received: by 2002:a05:7022:d99:b0:163:a197:722d with SMTP id a92af1059eb24-1b3c023c7e7mr1663332c88.4.1794382305578;
        Tue, 10 Nov 2026 23:31:45 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm27220027c88.10.2026.11.10.23.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:45 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 2/5] arm64: dts: qcom: nord: Add gpr node
Date: Wed, 11 Nov 2026 15:31:18 +0800
Message-ID: <20261111073121.3707030-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
References: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX8CIM7OoJDgWz
 sRtRlIIfzJdap17jlBW0kechHAAsgNrFA8lwsigcP2UVZMt4A6PQUJyMHgmkitWiRamd35sVuGV
 nIpGrCeOqIny0hExtSV8L4fn33L2J3o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfXxFaWedUlhm88
 iiDU6sWlnd8N7JZrOUi2biNxJFkrmK6y+x0boe1lMFF7APpcB5v/gGjyrIZhB0uTXu+8wVa4lOG
 biBzZztK5wL9exKcC75Ogsr6G0+Dj6OcxAm1qE+81ZPdbh48Py6CpwnnJn3J999fd8v5gz7fez4
 g9+6WMsnTSKR4KlYF03KRw6F4Luj5MJV+9Pg2g8AnvNmzFFgYu0Bib0l8pqDJlt6qStbvJwJ6wj
 hny6AhA7n0aj+3vz7osA2NLVYOO1Uz3zM6tdo9mBcegjd5bCQsFZoqCu+7CiGbHd67C+vqCSfdS
 PsXXAVDV4Zz4UMlokONc7uRFzjGC6L+086BLtBRlDm9H10+H17KV4aBaJK+fDDNsYjv2G9q78/d
 jNfrzeB2gF2uQ5guqQ/c7iackvuyduk94JyYV0ypjzPr0V+kxcUEHrwgT9p07zHqNcJv0x44/w/
 S5DHSduzL0azq9C6JpQ==
X-Proofpoint-GUID: f7jCqUWpbKOo6_5rOUeWJ2ZGaIbNWFBx
X-Proofpoint-ORIG-GUID: f7jCqUWpbKOo6_5rOUeWJ2ZGaIbNWFBx
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af419e3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=LQeRsTducJ9VbTWhBPQA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110029

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add the GPR (Generic Packet Router) node to the Nord SoC DTSI along
with the APM (Audio Process Manager) and PRM (Proxy Resource Manager)
audio services. These nodes are required by the Q6APM audio stack to
route audio packets between the application processor and the DSP.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 617e5312f4c4..c17a8a83e371 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 
 #include "nord-ipcc.h"
 
@@ -1799,6 +1800,45 @@ compute-cb@6 {
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
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu_0 0x09e1 0x0400>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
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

