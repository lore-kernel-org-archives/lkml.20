Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264516;
	b=j2y0WZIlq1NXVItdGn49I5fif0yZNVWQUtc6g8B96HOIAh02Hjx23EURXNeRVXnnx6sA
	 C+CXqizB+aSOq7OK5l6ljWtyecqXfCUSAd/zOQgKtHhda29ORoQjCVpEneV1ckN3MB8K8
	 Z85vOPzXV70+XfqO84Peskkr+WYe+aGBF7iRWVkrPlB8b4AOP7WtI5hG4HwZ8VYCfrXtm
	 2XJNtJbT3TJqnzoybEin2Nsi/ztiOVU+LGtjeOl14cbEVijdWWekUClcx4ErjNzEzcQNl
	 xQDIqR+gjpRVzlag0SY5iR93k3pIXKtroYTrUtBfkUezyyhIk4zXoYXmpykuf3DtbYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264516;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2kBlEpqb4298ZaAXVIm+yCKXW0IOM/ZbG3nDCrsCD1w=;
	b=RfEY+sJ/X9TIQTUeC5tQBDcbw6WOlf7k/97W8aLmxLBM3ZJbzls5FSzTerNo+1wieSuc
	 h8xhh1ImYxqkIsF5/JVkGPSmjyG2qSMy7okISK0dZnpzvkNCYJzYUrYv5MM7fd7KntnKP
	 dyBvuV3Ak4HEekejHj4cNWvEwywArGD6ZH1crOJ7Z2VcE/jqw6nv4qQxv++/qcKWvAOiI
	 atsavzB1udtPsAodfQaUeY0qZBCxxPtpRqqfibHEKiLCga42cbnk3VngPWNmFb8olYtIa
	 UoAO1ViOuAp4bIN9R5S56+NKStVeEhUh5k2dDFx+lZ2dlawlyYhFFLPcgYKmJ8Sjokg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dAfA0IJO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+BXkinO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA12160A2603
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA12160A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dAfA0IJO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+BXkinO
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vFrk3775313
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2kBlEpqb4298ZaAXVIm+yCKXW0IOM/ZbG3nDCrsCD1w=; b=dAfA0IJOtmxa8cL0
	jJfBGIQrUa7hAzd673sari/0Rdu2fny7YOFLoaKT6PJDOqhPvyXp3IsZs7nsqk8k
	ZZHSr4m4NBe3y9ID8ZwfSVBKMGwLOXe0HdHJyLgwdxlftJyWCNNNaQqLuWOHUBLE
	AKYrcjmQkxU7AjGFhhhnL8QKTndZQs59NPiFuQV7tES1RJfBlOPqPWbhWlwGi5yn
	/m1jP3fuRjfkb7yLCHTA8iZW0w782rUr43svcO/0kAqA1k75ABGcAzPBLyzUedzx
	IXImZ0/jKClrmBw1JQRhGIIfie8P34F2b8P5cvVaRVcPBpcTwGbalJEczMjVlw37
	0kPzww==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshryse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:01:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so682641a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264514; x=1793869314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kBlEpqb4298ZaAXVIm+yCKXW0IOM/ZbG3nDCrsCD1w=;
        b=H+BXkinOpl1c9nw8aNQb62/VUew5rZzZWKXQlqFRNH9yuPhcfezyPVKP4tUvRaPe4g
         VEWiVlo/X8zEthAWHI8sxJrOwxPjR8+dDgp6vafGhubrFK9IT99rrNgG0w5BxCi9WvqW
         N1Nh98F+YUDzyAOil3c9Rlt74Sfxt4OQ1jkdBvHeNbF4GCGXYvwGy/DL3x44DV+OfhuT
         +9EzUaNvJreeqlJBL0VPHMps4PGIIDLon7Y7t4Wwksm8fWeHkZd8YOnIMmbEhZFv9K6h
         LPgL7+o+sYCUsIc2u9M7hSk3mWXOA3WCQ1ga1hv+g/gbPBx+7TLytsKWDvRoywPNwNRS
         2dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264514; x=1793869314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2kBlEpqb4298ZaAXVIm+yCKXW0IOM/ZbG3nDCrsCD1w=;
        b=r373Df4Ty15JRkPM+lTJHdjoQz4fgoyIRubNHs/vF6jb2X1xtI50OBBTrl+3rWEbZq
         VMUc0al7VwJXDRzw2epCLWIeyTWQNC1vRRFMUG28C8QNaSdBU40Eya4wO+udXl6za2nU
         M5VueQw164jG4obPCEZEgvRT7IrPw4FnDoUX0k+iBuI4W6iAB9oe2aCLwvbctwk7OgXd
         L0sr53UTV+gksJj0z4yTzOGVsApVZiF/7myOd1QZjU4FUIH076l2zb4lUWorM1DxF61y
         0N8od7cmvpnYEvqFO91SvMmwb7QtBO76psuC+18Oe6WqgF0NsQZYXAu6yyTRVXe4Tp5r
         d6YA==
X-Forwarded-Encrypted: i=1; AKwUvBzEaF0luCdRJ7pJnQKkfAPXGkecvlMIijnxvDSWsB02upr+4355i2IHf4dHDhb1PfBdj3ZiJ4pCzuxlwVY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbTEIEAYrMsWmz9FcBvicl5zu7aYFDvtO1+dWf1w2zzLdpFZNT
	Xlc6BSqcSyAo4NYnBK+9ybZXIY1QIroGx+kd+Ny1OvpN0vO3C0s7FvS55uhmb5/6n9/DoHTiBmm
	N7izv0QdQL7bz17tNFyONYwWxPTm0FtjpBp6U+QN9Tifye4lIyUYfZjNwUZVG/XXHrvw=
X-Gm-Gg: AYBFou2NfFcDjGY/6XlT7ZnvY4ox6dSM1VLJ0oOsZVjMrppFjuPxxBbKR22cxoZAyIg
	IuhC+joKciWvASokISZKSoKV6pFHWxKQgu2SnBpWL0mAeDRrNO5mgyE4gjPxCIGPZdLkDmmmNef
	OeJL7N/q2otXSTwUvAObhnWuexBFJ93aimYGBLrLGPWJQNQdKWVFiRRUE0nXSQGmL67kR6H71wJ
	D/aXjlrnvRJLfMLl9sj52vl6NLPXOQEDM+AkBs0j9UDm3Wzo0EgimyMZ1fNRrPeMnuS0NKvTvYk
	/9eWXsDPjMqg1mtvV1fkN+cq/1yYzo834EeMivihPyXEX+apCGhYGh29YIYUt9I/tmMcGKCo1F8
	XIrlCuxKLr5cWFhKhyAV423ySneWBYK6Ob3peXqx8+V1f0ZkRnDCrvL/tC/sP2CdGHkuTcrbMCu
	fj4aZ3WYhd
X-Received: by 2002:a17:90a:df0e:b0:3ae:6fda:78ab with SMTP id 98e67ed59e1d1-3ae6fda7b60mr1043986a91.25.1793264513434;
        Thu, 29 Oct 2026 02:01:53 -0700 (PDT)
X-Received: by 2002:a17:90a:df0e:b0:3ae:6fda:78ab with SMTP id 98e67ed59e1d1-3ae6fda7b60mr1043968a91.25.1793264512939;
        Thu, 29 Oct 2026 02:01:52 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:01:52 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:30:58 +0530
Subject: [PATCH v27 04/10] firmware: psci: Add support for PSCI auxiliary
 devices
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-4-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264458; l=8138;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Ib56eKlgfTo2emfE4TrGojWHoU6gIBxqywouiLLf34Q=;
 b=Fa/SIj96KiD+PCqdqymGbr7hQ9cTbYCLFeI+oY+dCVEEocHbPaMXSzaPnnxyzsqozh8ZL92Wc
 J9SakeG469rADkSBwp1SqDDNBsbhM6AWcytuIy3MIikwE+5vSIsxM2w
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-GUID: YvHz88o-sChKyIlUnJeKqMfrRsZiJgvG
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae30b82 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pkOq05zB4EqCiNOTdIkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX+LGwSGVZcdEK
 Q6B4HKBZm8TryR9kFFW6h8ukS8wSwUMIljVOpzpDWB9RLe+wnFojuFH25jHU7g1VvBy9yoBDZTR
 mFrRkhCxxraJOHkeVrdduunWhUYRhyA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXxZQkgphnV3qr
 Xkt0lqEd+yLV8ii3kRxMxUf+wts5Z9kSquErdUhJMd0PZItesF2natLQ0q/kWtQ2P2QdCXXB3Ve
 Z+pOxu8F2sxW9AiP9/qOF62c24q/mvioXbMXgdurrRM6/HXorb3iwAELGDI9h8RH+L7vGd7BpfN
 FJjOxI6Rr7Wx3ixhDGlrw3QhCkAzJz1wkz+PA6RRhwCNbmnmq1Pz5s5P9Lu+k8JYfprBjB5FsVE
 WVnYZj1NLvqfhxvYGvnfAk2P/P89QMOKi4CNyDcs4Vm7wY2IMvZhZxsxSdqJ1oNHKcXLz5aHdcN
 FryuYZpv9rK7HwhyKd6CTND1X2agsvVHlORMlod0/4sK7gpvCA1y3kl0MsBmuOVpZfdRvaaovVc
 4NG5u/X73NST6T4tByXb7YZTPUqHNdwfx36XC5xE3DXR9O568kQjviuD4Sf1CRzWVZjuCzr2kx0
 oRw/CLyO5VY4CfGRqTQ==
X-Proofpoint-ORIG-GUID: YvHz88o-sChKyIlUnJeKqMfrRsZiJgvG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290034

PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
Currently, both the PSCI core driver and cpuidle-psci-domain bind
directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
introduced, would also need to bind in the same way, leading to multiple
drivers attached to a single device node.

Introduce a PSCI auxiliary-device provider that binds to "arm,psci-1.0"
and registers PSCI child devices on the auxiliary bus. As the first
user, register cpuidle-psci-domain as an auxiliary device.

Update cpuidle-psci-domain to probe as an auxiliary driver and use
the PSCI device node for power-domain traversal. Allow the probe to
succeed if at least one auxiliary device is created.

Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Suggested-by: Lee Jones <lee@kernel.org>
Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/cpuidle/Kconfig.arm           |   1 +
 drivers/cpuidle/cpuidle-psci-domain.c |  33 ++++++----
 drivers/firmware/psci/Kconfig         |  14 ++++
 drivers/firmware/psci/Makefile        |   1 +
 drivers/firmware/psci/psci-devices.c  | 116 ++++++++++++++++++++++++++++++++++
 5 files changed, 151 insertions(+), 14 deletions(-)

diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
index b88b01aa5829..f22e18b05053 100644
--- a/drivers/cpuidle/Kconfig.arm
+++ b/drivers/cpuidle/Kconfig.arm
@@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
 	bool "PSCI CPU idle Domain"
 	depends on ARM_PSCI_CPUIDLE
 	depends on PM_GENERIC_DOMAINS_OF
+	depends on ARM_PSCI_DEVICES
 	select DT_IDLE_GENPD
 	default y
 	help
diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index 5722365b943e..199c1494c566 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -9,10 +9,11 @@
 
 #define pr_fmt(fmt) "CPUidle PSCI: " fmt
 
+#include <linux/auxiliary_bus.h>
 #include <linux/cpu.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
-#include <linux/platform_device.h>
+#include <linux/module.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/psci.h>
@@ -121,14 +122,10 @@ static void psci_pd_remove(void)
 	}
 }
 
-static const struct of_device_id psci_of_match[] = {
-	{ .compatible = "arm,psci-1.0" },
-	{}
-};
-
-static int psci_cpuidle_domain_probe(struct platform_device *pdev)
+static int psci_cpuidle_domain_probe(struct auxiliary_device *auxdev,
+				     const struct auxiliary_device_id *id)
 {
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = auxdev->dev.of_node;
 	bool use_osi = psci_has_osi_support();
 	int ret = 0, pd_count = 0;
 
@@ -176,16 +173,24 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static struct platform_driver psci_cpuidle_domain_driver = {
-	.probe  = psci_cpuidle_domain_probe,
+static const struct auxiliary_device_id psci_cpuidle_domain_id_table[] = {
+	{ .name = "arm-psci.psci-cpuidle-domain" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, psci_cpuidle_domain_id_table);
+
+static struct auxiliary_driver psci_cpuidle_domain_driver = {
+	.probe = psci_cpuidle_domain_probe,
 	.driver = {
-		.name = "psci-cpuidle-domain",
-		.of_match_table = psci_of_match,
+		.suppress_bind_attrs = true,
 	},
+	.id_table = psci_cpuidle_domain_id_table,
 };
 
 static int __init psci_idle_init_domains(void)
 {
-	return platform_driver_register(&psci_cpuidle_domain_driver);
+	return __auxiliary_driver_register(&psci_cpuidle_domain_driver,
+					   THIS_MODULE,
+					   "psci-cpuidle-domain");
 }
-core_initcall(psci_idle_init_domains);
+arch_initcall(psci_idle_init_domains);
diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfig
index 97944168b5e6..68e381f1a618 100644
--- a/drivers/firmware/psci/Kconfig
+++ b/drivers/firmware/psci/Kconfig
@@ -2,6 +2,20 @@
 config ARM_PSCI_FW
 	bool
 
+config ARM_PSCI_DEVICES
+	bool "PSCI auxiliary device support"
+	depends on ARM_PSCI_FW
+	depends on OF
+	select AUXILIARY_BUS
+	default y
+	help
+	  Say Y here to enable auxiliary device support for PSCI.
+
+	  This creates auxiliary devices for PSCI functionality implemented
+	  outside the core PSCI firmware driver. These devices allow PSCI
+	  child drivers to bind through the auxiliary bus while sharing the
+	  PSCI firmware device as their parent.
+
 config ARM_PSCI_CHECKER
 	bool "ARM PSCI checker"
 	depends on ARM_PSCI_FW && HOTPLUG_CPU && CPU_IDLE && !TORTURE_TEST
diff --git a/drivers/firmware/psci/Makefile b/drivers/firmware/psci/Makefile
index 1956b882470f..8e75a0ed6f74 100644
--- a/drivers/firmware/psci/Makefile
+++ b/drivers/firmware/psci/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 obj-$(CONFIG_ARM_PSCI_FW)	+= psci.o
+obj-$(CONFIG_ARM_PSCI_DEVICES)	+= psci-devices.o
 obj-$(CONFIG_ARM_PSCI_CHECKER)	+= psci_checker.o
diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci/psci-devices.c
new file mode 100644
index 000000000000..d23befc490ed
--- /dev/null
+++ b/drivers/firmware/psci/psci-devices.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+struct arm_psci_device_info {
+	const char *name;
+	const char *of_node_name;
+};
+
+static const struct arm_psci_device_info arm_psci_devices[] = {
+	{
+		.name = "psci-cpuidle-domain",
+	},
+};
+
+static void arm_psci_auxiliary_device_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+
+	of_node_put(dev->of_node);
+	kfree(auxdev);
+}
+
+static int arm_psci_auxiliary_device_create(struct device *dev,
+					    const struct arm_psci_device_info *info)
+{
+	struct auxiliary_device *auxdev;
+	struct device_node *np;
+	int ret;
+
+	auxdev = kzalloc_obj(*auxdev);
+	if (!auxdev)
+		return -ENOMEM;
+
+	if (info->of_node_name)
+		np = of_get_child_by_name(dev->of_node, info->of_node_name);
+	else
+		np = dev->of_node;
+
+	auxdev->id = 0;
+	auxdev->name = info->name;
+	auxdev->dev.parent = dev;
+	auxdev->dev.release = arm_psci_auxiliary_device_release;
+
+	if (np)
+		device_set_node(&auxdev->dev, of_fwnode_handle(of_node_get(np)));
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret) {
+		of_node_put(auxdev->dev.of_node);
+		kfree(auxdev);
+		goto out_put_node;
+	}
+
+	ret = __auxiliary_device_add(auxdev, "arm-psci");
+	if (ret) {
+		auxiliary_device_uninit(auxdev);
+		goto out_put_node;
+	}
+
+	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy, auxdev);
+
+out_put_node:
+	if (info->of_node_name)
+		of_node_put(np);
+
+	return ret;
+}
+
+static int arm_psci_probe(struct platform_device *pdev)
+{
+	const struct arm_psci_device_info *info;
+	int auxdev_count = 0;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(arm_psci_devices); i++) {
+		info = &arm_psci_devices[i];
+		ret = arm_psci_auxiliary_device_create(&pdev->dev, info);
+		if (ret)
+			dev_warn(&pdev->dev, "failed to create %s aux device: %d\n",
+				 info->name, ret);
+		else
+			auxdev_count++;
+	}
+
+	return auxdev_count ? 0 : -ENODEV;
+}
+
+static const struct of_device_id arm_psci_of_match[] = {
+	{ .compatible = "arm,psci-1.0" },
+	{ }
+};
+
+static struct platform_driver arm_psci_driver = {
+	.probe = arm_psci_probe,
+	.driver = {
+		.name = "arm-psci",
+		.of_match_table = arm_psci_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init arm_psci_init(void)
+{
+	return platform_driver_register(&arm_psci_driver);
+}
+arch_initcall(arm_psci_init);

-- 
2.34.1

