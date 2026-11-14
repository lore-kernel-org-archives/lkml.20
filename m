Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794630514;
	b=k51XpHBHxNt/5CaSl9QNDOsIbl2JyPeMrcLODy0UwM7tcQhwZ1sv+1DPbNesFLZAFtXV
	 8264RTUqkuJ7vRaaZorpOPC6V4Im6L9rJZk/m37K3TZKggw6N7e0oZ8iMsanMx7WvDIXc
	 A4EmMM/lMGZWImL4MdyC43oeA1dVSHuYKXRGPasmpNwFMTX/fozWnFHPvOaVNRkXnGISh
	 VWKvoFdaLYtq5HAhySDBpr+HI5RWTsKErndUz1K3682i2EOVPM+WkfLatIfTqlaiTFUe4
	 L07+LcYmJ/lp0Kiyojb0ILk+Ri84dxzcKpPk/6k8/sxFG+boxTKqZ3flKmxGXVH2C4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794630514;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p6UUqjxAfn4bf4gBTkTHGj67r5kXbDs6SO3uUgOuNyM=;
	b=TYo7Qok1xIeWBdQA+6UrhblitZou+mWLbeiuC536VPI7HrRFJFZYy9Mo5Yi0+2BMm6gi
	 WbPbKbKyropDJPfhn53prvErUMf/tuxq1BAOxgSRYgefqoiblBz7RcPmfB1KMAMYXHqDs
	 ZRTpCVFySxXSUtou6TwEfs2EFJp3tXlDdVw85J88BChTiRmRJ7mIQGQbvhcSs3FfIbH9E
	 PwtymOon3soWoDeAsmcp1G5P3EHrcfkgJhfqXMFvZv2VGMVfKxoeTMXNuilsENd7xYH2L
	 b5VhHV3aEnIGfn03idlLbOw8hAuRdq2mgIDrhVbbsbOL3WfCPYRs5npcQnUmkf6OIkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=idd894Ql;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H27iu8Oz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387CD606A333
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 387CD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=idd894Ql;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H27iu8Oz
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE2XbwE2439614
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p6UUqjxAfn4bf4gBTkTHGj67r5kXbDs6SO3uUgOuNyM=; b=idd894Qlou0Omneb
	N83x8VwS5B/xNrjFqM0ytoiZbGEkuEzkHI5DBhC+EvCXbHPRxdzjIjWx/OWiqkCG
	b99f9AOXhcX0XeRkOosDvgIDcWfUVmnLqRV6IB34eucP6/nmDBLGKwpBpNO+e+Tz
	qkMv4VMbl1i46ho6oyw/+y66a8n3lOvRRp5zJmcngFOQ0pNjAjJY0hafUVZvRfQa
	Mj0HmOmeMEsbVF38N95xelJVvv+kXGReq57VPBrgn1GqFMkZ8wI0GiGpkPq5eeai
	Jtj8hwI1Kt95pon2PBvY2cUMzRL9nfgtxM0GLPh7BvYOyJjE7nwJXRo7sLix7gor
	9Ijizw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxeyfr7s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:28:33 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6dd1142710fso2934795eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794630512; x=1795235312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6UUqjxAfn4bf4gBTkTHGj67r5kXbDs6SO3uUgOuNyM=;
        b=H27iu8Ozxjb8kKB39rAHiCPpKHbvCu+s56tec0BhYsPNBS9qxO6SSfHG+1G1oHCQ0j
         DtJZpw+Aggd4D6BW/etegfaX3f/gTIlLHMXlkefqoZNbUPrehJOHiKUxadkyJxzIwPF5
         zceyYmxwDUb3r3dBhw6/CchsNq3xvr6r3SPJrsPXRZ2N5qPBasFKVUzRAqJB+vUih5f5
         VVzPwQxxJYKgvU1c8aHLc/Gaa1tlZAf6eRHTUHbjEsGh2BvYYepUdXi1UEqso1/P4R4S
         9+d0L2rSvUwpDIh6cGYTY/4uKjS8r5uA3CEmj4f/ucyG4QETvv6iT9L4+KrJi3mE0KbF
         XcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794630512; x=1795235312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6UUqjxAfn4bf4gBTkTHGj67r5kXbDs6SO3uUgOuNyM=;
        b=BrGlqTs/Oen33T6D2Ff7mY5BEEIe1ub4vafRj93QCZF6cvxvBnlIphN+6d3ONTl5k/
         YPEC2JuGQr9tj7D5ghvSr0vmPXsTk3H/NvZfJQwqzHPBIHOQxZLVGT96P/ZpfOGkGICs
         YSko8UeD56jptHKOm0rBFlG3103MS7OPY6gczcFaXhL6o8cxOPcMK3Y4k2V2AZMFgIGE
         DwACby0c6kh6Bj7/LQ1UWPjGbZtHHWy4NgfLIMxKJnineygsTOewa47+6xMVY67F2qqb
         udN4YPP3nF0YcwINcDaqiAXZGFthpJhgaVVWPxBYr8TMV7T6AfHx73f3wT8J6lqe1MO1
         Pv4w==
X-Forwarded-Encrypted: i=1; AL+hErFu3XxkHmd3JHGf52T3WsqJEbvrp8si3/lFwvHJjhPLjyWwIu2Boh3tarqVCkZEjLWr+AetVsRSKTivbOE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EqTG09orUGQ3MUAPEh9MXt1pyLJltoVYdo5CWHw7WKu9u5Mgz
	PKDkewY7xTQTcvEkPDWX5OVAsoQDMF725PCK+BzlHuuYJKDlzUBoHsR8m8DqV/7A7t6+HX/EB2W
	i1pxy6DzbgTEnK/g5Pgq65FLLViM06dJMhYVUYrH1UM29dxJRQOPjbFRoN7ViPj1wRUA=
X-Gm-Gg: AYBFou0xX7++xbXhxqFdy1X581LWUeeJSpRU34ce0fRIvaUm8+R8dbpBfmF0eYkp63C
	tRd8uo9fycNBK6e3FPPAQhKSoFwWqH4ePDHUpUa5XyM7uc8qzjcBVma0fUxiar1Tt52So97ACWH
	ZbFfCVB2xCVtUZsbThIlYXRYgTLryMlTQxF+EBw+ro/loEp9EuRSiKA8EWMWtGwoEXltRQ/TW2m
	Nl0CcYnZ7zZ8NVZYY2ulJMqpEXPWe+AoZ6ECvOFA/N1HBJfkhcb+f0Q7FBBt4Axle25D2vv4Zrf
	JX0WoSgAAsbEPlKwDiYkVJyB6Sf6LY0I0rrXabINJIxxDfygfGyySlHqsBE0fclGf5v0dYOoq+4
	8D7+vMb1DCvJpk8CvLhCx0YjNhDC9cbhoMCWF8SAoPAUhYlsKLLWHsQkDbKxhSIVNa+c=
X-Received: by 2002:a05:6820:1342:b0:6e0:edfa:9b48 with SMTP id 006d021491bc7-71ab51fbad8mr2861241eaf.77.1794630512117;
        Fri, 13 Nov 2026 20:28:32 -0800 (PST)
X-Received: by 2002:a05:6820:1342:b0:6e0:edfa:9b48 with SMTP id 006d021491bc7-71ab51fbad8mr2861214eaf.77.1794630511464;
        Fri, 13 Nov 2026 20:28:31 -0800 (PST)
Received: from [172.17.0.1] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab3f44dc4sm3292269eaf.0.2026.11.13.20.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:28:30 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 22:28:26 -0600
Subject: [PATCH 2/3] arm64: dts: qcom: glymur: Add ASUS Ascent QN10
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
Message-Id: <20261113-qn10-v1-2-e09b2aa7ccbe@oss.qualcomm.com>
References: <20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com>
In-Reply-To: <20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13864;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=aWBeKiFGEiWKlJzDUO+xMibHpqJgJRzcHMVSbMH7/xU=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBq9+NrnzNG9gh1E6/a81xFHQ2qFKfBryCXj4Fq7
 TsrZQAP4hmJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCavfjaxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVVfhAA1VJhqjC9swZQmWLVTLWl5RM/xuLfg7Q0h98AgsP
 0hidgcCV9r5l4QucheomFyqPnCiEWMWa9Y5ZOPMD8IH+eLbfYwMEnr+IJIJyDoky/cmrew0wh3a
 dVDMxaEP6m1tdvnz2DlXt+lP+9RBeL7nUBPCBMGm78KG+h2c6YZgSYjEeSp5KGYULwzLBk9PUbz
 WRGkidkR8Gi0cEy05DHyOxOtwUGTLVAi5gVDL588SmMRK/tWrj5qUII5rQn4TGjuwGsuVTnV09D
 YZKmFRv/DJY1/252jG0oL29wD5fcwe1xhr9fGMqp2QATUvOgoQreYfio6tuTwsmOp9MRGVFQkwj
 riMPp/LNOfAOMHmymjNYgXX8vCjPJsQmoYzkS6f0uMO0ejYJVphyulk/bO8aefeQzA/lKAErsxJ
 jIqck9mHNLzW6onXla32Jhozez0tTI+WioIDBCinQsPMsI7umwQ/UxaH+pgJM+KPF1Zj8SC+uM4
 Pm9mgXzcfN6Bsk301u8DSj5IEuRGKuI09tAXhabNvL5410XCafcBsgrcaKIMN0WnroHcVh7x+w+
 Un5F4HSGPJQkJRc1fLgQ2haNFh862fTdunfRCy+nrg6XD0uzw9gPxNBge5uEjiUcNRYmd9j+YGe
 Q1SJ/OW32W2fsxGD5g0Ry+FFqceKtYaA/66W4I9WEjmo=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfX08n+pBqh80Ec
 DMic/ezak5rvda5aSgVZtXXM8NdJutxAPx+Kt9D5Bp5Ri8uzUrpIybr5QVBoSKP239HKdOY5kyJ
 z/UiGxqgMVYsyS4x6jHgEZAXgfyFMg4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfX0YMNE9c9dPYL
 5tlhmdLRqveGf2SYx3NCpUl8LfF5Z0IuouuBP0vddAyxvEQQMKC6uUfWj6yCNi7DkPzXpSFBw2k
 nT4cpLVQDZvsNc5XAUtGE1A8iult1C8v3C763nbEfSx7uFQNlgzzlijSAtgq+3Lnnx/Ib1T39T4
 1MZpQkvEjJU5FFQGbj4I45qr+ES9yKCL30x3dml6BRZf4K+4EJ2bvFRM7bkXulYShM48RjfEZpK
 7zE7MVfk/Q4UM4rjI0R6MCRJU/u/xQ1fXwhLuB4kQ3wMJFtAOJXYBbPhwSxOnewhZ6Qagu1Tom7
 LSl+ZKv4COgImar5KKt/uFL3U2xdFKNnp05kfmun5J2onIePukih8IJZTe2Lv2VXTC7pIGHhqm8
 5CQWRmB9vTks6HJoy1FQ+TrNxw0a2YFSnLXy0I+Mu8vSNzg+Di+DhTOyvXJFLYNUZj6sSuf7KRO
 06RJ2k8+m5jFBEG5oEw==
X-Proofpoint-GUID: 53eWZOCJAsuBGtA7TofnO5y9VLBXX9ux
X-Authority-Analysis: v=2.4 cv=SLPXx+vH c=1 sm=1 tr=0 ts=6af7e371 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XfUM7NhkCCvRT9LeXq8A:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: 53eWZOCJAsuBGtA7TofnO5y9VLBXX9ux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140017

The ASUS Ascent QN10 is a compact desktop computer based on the Qualcomm
Snapdragon X2 Elite (Glymur) platform, featuring an 18-core Oryon
CPU, Adreno X2-90 GPU, and Hexagon NPU. The system comes with 16 or 32GB
of LPDDR5x memory, two M.2 NVMe SSDs slots, Wi-Fi 7, Bluetooth 6.0,
2.5Gb Ethernet, three USB Type-C ports, four USB Type-A ports, and HDMI
output.

The HDMI output is driven by the eDP output through a PS195 HDMI
converter. The four USB Type-A ports are connected to a GL3590 USB Hub,
on one of the USB MP ports. The Ethernet controller is attached on PCIe.

Introduce the DeviceTree for this board.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/glymur-asus-ascent-qn10.dts      | 670 +++++++++++++++++++++
 2 files changed, 671 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8329c06b60a3..ff38c562f78d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-ascent-qn10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a14-ux3407na.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-ascent-qn10.dts b/arch/arm64/boot/dts/qcom/glymur-asus-ascent-qn10.dts
new file mode 100644
index 000000000000..d61caa2b5022
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-ascent-qn10.dts
@@ -0,0 +1,670 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+
+#include "glymur-cob.dtsi"
+
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+/ {
+	compatible = "asus,ascent-qn10", "qcom,glymur";
+	chassis-type = "desktop";
+	model = "ASUS Ascent QN10";
+
+	aliases {
+		i2c0 = &i2c0;
+		i2c5 = &i2c5;
+		i2c10 = &i2c10;
+		serial0 = &uart14;
+	};
+
+	clocks {
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	/* PS195 on eDP0 for HDMI connector. */
+	hdmi-bridge {
+		compatible = "parade,ps185hdm";
+
+		pinctrl-0 = <&edp0_hot_plug_default>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,glymur-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Rear Type-C port */
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in0: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		/* Front left Type-C port */
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in1: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in1: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		/* Front right Type-C port */
+		connector@2 {
+			compatible = "usb-c-connector";
+			reg = <2>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in2: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in2: endpoint {
+						remote-endpoint = <&usb_2_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wcn_sw_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	wlan-connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
+		vpcie1v8-supply = <&vreg_l15b0>;
+
+		w-disable1-gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 116 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie4_port0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart14_ep>;
+				};
+			};
+		};
+	};
+};
+
+&rpmh_vregs_b_e0 {
+	vreg_l8b0: ldo8 {
+		regulator-name = "vreg_l8b0";
+		regulator-min-microvolt = <3304000>;
+		regulator-max-microvolt = <3304000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+	};
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gmu {
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	hid@3a {
+		compatible = "hid-over-i2c";
+		reg = <0x3a>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&kybd_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* PTN3222 on eUSB3, between USB MP0 and the GL3590 hub. */
+	hub_eusb_repeater: redriver@47 {
+		compatible = "nxp,ptn3222";
+		reg = <0x47>;
+		vdd3v3-supply = <&vreg_l8b0>;
+		vdd1v8-supply = <&vreg_l15b0>;
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+		#phy-cells = <0>;
+	};
+};
+
+&i2c10 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp3 {
+	status = "okay";
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&hdmi_bridge_in>;
+};
+
+&mdss_dp3_phy {
+	status = "okay";
+};
+
+&pcie3_phy {
+	status = "okay";
+};
+
+&pcie3b {
+	pinctrl-0 = <&pcie3b_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie3b_port0 {
+	reset-gpios = <&tlmm 155 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 157 GPIO_ACTIVE_LOW>;
+};
+
+&pcie4 {
+	pinctrl-0 = <&pcie4_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie4_phy {
+	status = "okay";
+};
+
+&pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcie4_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
+};
+
+&pcie5 {
+	pinctrl-0 = <&pcie5_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie5_phy {
+	status = "okay";
+};
+
+&pcie5_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+};
+
+/* PCIe6 is wired to the RTL8125BP 2.5GbE controller. */
+&pcie6 {
+	pinctrl-0 = <&pcie6_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie6_phy {
+	status = "okay";
+};
+
+&pcie6_port0 {
+	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/glymur/ASUSTeK/QN10/qcadsp8480.mbn",
+			"qcom/glymur/ASUSTeK/QN10/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/glymur/ASUSTeK/QN10/qccdsp8480.mbn",
+			"qcom/glymur/ASUSTeK/QN10/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_soccp {
+	status = "okay";
+};
+
+&pmk8850_rtc {
+	status = "disabled";
+};
+
+&smb2370_l_e2 {
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <4 4>, /* EC Secure */
+			       <10 2>, /* OOB UART */
+			       <44 4>, /* TPM */
+			       <65 1>, /* EC reset */
+			       <100 1>; /* Board ID */
+
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-disable;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio94";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	edp0_hot_plug_default: edp0-hot-plug-default-state {
+		pins = "gpio119";
+		function = "edp0_hot";
+		bias-disable;
+	};
+
+	pcie4_default: pcie4-default-state {
+		clkreq-n-pins {
+			pins = "gpio147";
+			function = "pcie4_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio146";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio148";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie6_default: pcie6-default-state {
+		clkreq-n-pins {
+			pins = "gpio150";
+			function = "pcie6_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio149";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio151";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie5_default: pcie5-default-state {
+		clkreq-n-pins {
+			pins = "gpio153";
+			function = "pcie5_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio152";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio154";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie3b_default: pcie3b-default-state {
+		clkreq-n-pins {
+			pins = "gpio156";
+			function = "pcie3b_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio155";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio157";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	port {
+		uart14_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
+&uart21 {
+	status = "disabled";
+};
+
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_0_hsphy {
+	phys = <&smb2370_j_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	status = "okay";
+};
+
+&usb_0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in0>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in1>;
+};
+
+&usb_1_hsphy {
+	phys = <&smb2370_k_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+};
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in1>;
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in2>;
+};
+
+&usb_2_hsphy {
+	phys = <&smb2370_l_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_2_qmpphy {
+	status = "okay";
+};
+
+&usb_2_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in2>;
+};
+
+&usb_mp {
+	status = "okay";
+};
+
+/* MP0 (eUSB3 + USBSS3) -> GL3590 */
+&usb_mp_hsphy0 {
+	phys = <&hub_eusb_repeater>;
+
+	status = "okay";
+};
+
+/* MP1 (eUSB6 + USBSS4) -> not connected */
+&usb_mp_hsphy1 {
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	status = "okay";
+};

-- 
2.55.0

