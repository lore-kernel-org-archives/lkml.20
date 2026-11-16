Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794800957;
	b=piBTmbMyipmfTn19PjlmQdHFhu5lUSjjGs81hLyaBEkkvnFvHZ3X4kGUySQ4h3/bG+x5
	 DoEMZRBm+YazTV++b+z7qYV/Vch2xrqORdWWtbdhvtPAIydq6tXEnA0gK+CiGp0e3ej1h
	 wRSaoORP9ME+0ahcq7M/d0oe9a8uqM4vddhJOHHqcRenWfnSpz4+6+Jpy8FpwK1F/8vmU
	 4+CHRQH+cVHxyeClz+R9UaT0oz1ebHsNkrRWK3JmcZMn3dDqC5tl2xZxqXIhoWW6P74P9
	 sbmSAqvgkd5gbdBToQ9Adavn2t3PeaXNe+E2a4sb9IdjqFrZQ5NdtPoYBEHC+cV4rBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800957;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zkuxJ7Ek0jz+hH0doCTwXpjuvAQdZaVXy6u9bcRzVk4=;
	b=bsgB+nGnXbRmX8gE7OY/ej6+YmWlHh+f+sfDe+MMeXPR1KgiKM8NvmLs0geGUmKtHaQJ
	 4jPC/pEqPig6J+sRy8ABi/rbca0fGLpkeKWXiYlWq9beIB2s/4G5v2RfgG/E1ykJEyMHA
	 JArmk68xq+sZQjUgKsX6XItQtAm1KA5w0iRHDBD/HDwSjaAe9ocw/ZDi4a5dRwH08Cilh
	 /vOS22jSGQEYkYmxpKkEmb23gb+DzDUlzSjJP/ffRI/YO+ow3fQM0ujxo3Lr8yKtt+6ev
	 +rjK6CSDMpOpgJnaxDLUcP6EYzsHnFrmR4ZH5vebMoh4tLpE7Usa0Ezv1FlHXKN2QbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="g4C/Lfvu";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CiEGVFfO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AD5606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71AD5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g4C/Lfvu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CiEGVFfO
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1LAuv3321736
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zkuxJ7Ek0jz+hH0doCTwXpjuvAQdZaVXy6u9bcRzVk4=; b=g4C/LfvupYYBTE/T
	YwBMptco/HT67nH2N55QHQoXiWK1tqB7vHKt+Za5eIS1st+7/HnKRqxNt6+d3VGB
	Uqzj0gDRZ47QuSGQxM3ZgPeOETSBFnsXSNrQDmMeZOrUSSXv1CCNDEwXAEJTRvf9
	AYjlsI/3sLAo9A41kRRzuyvdVGMcLpPV+ZmXriP9iBfsUwV99ZKGebVMY/2TXEJB
	8oauJVDzMDWqm59Vu764hN+A7V2Zbke3mI9kqtbPhJZP8vbOBYnRgvF4s8RPsPbn
	FV56M26y4zLdx0xWby23QLNf6rtzRuTLKIT+5yfBO8IiV3W+Kg/r+LlZS9jFNICg
	9FvDiA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhmhxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:49:10 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-54dbbf252cdso3905296b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794800950; x=1795405750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zkuxJ7Ek0jz+hH0doCTwXpjuvAQdZaVXy6u9bcRzVk4=;
        b=CiEGVFfOOMPdJts9tBHXG/GpTeFJL1rmkGUSxGPCy3bw8uFYtGmV4QAIKuIKzCQkU6
         PxbPDWExSX/qtV279fYzuAY4Jx87j9+g4SjpAjvrvUgXQkxtjWF48aI4EaamnBKXOOUD
         0PdLzda+69BNd9CnCwoFCVzbCedHkdO/bbYCbqpRUxiuGg9kBaaW3ciOABpGiBlMDvig
         6aKtfCT7udq3sRIkffRdN85hdl8KFtAtpYgXfTOcMY4KHqUyUv3K8UjFU6TOurNnAc8C
         3du16rMhelu8Rt2splWgnUvoaIHDDy8qyGqlONIO7/BZ8SM1KAevMDHHKaF9XXfbT3zd
         gkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794800950; x=1795405750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zkuxJ7Ek0jz+hH0doCTwXpjuvAQdZaVXy6u9bcRzVk4=;
        b=iQfUnARbnXlrAG/froCz64mIagQ2XVFI5mVt3oyKDd/pA8z0O6hjsclG0fSMbpafdQ
         aLu6HCel9wLRauxnbiXbhG3WVcEdxyLG9Xn/PU1PPXmWC1TsX9KRs97ZoGe8iKzH3jGK
         18G66oXO5iyVT1E2pbE6nKMJpV4pCZaPpa69n/AjzMkps4Nx8pFdAHmhXHBkV8RkAkki
         IUMWlee/WYcn359UwzAC4pXiHfgtpQtiM3uaelKuSQ8v2XGJ6gCqKxmU8v1PMSZjuBJq
         5Ku7FyoMoM5BsAwos99Rkbid9mctTj5btC6hQhrCWeNPxp0srj/I6BrRKtC2wGnf7WkI
         9R4Q==
X-Forwarded-Encrypted: i=1; AL+hErE8RPxJZSE2Cv6bivwQvcNDnWij5BeOD77CLVZUF81XvO7nmvMjQ/PDPoK4ZWTx/1f+KKUbxtzoIZTIFfM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sVZW7aDDMVizXF0VF3NnKCgtW+tl1ce8gsUHRCFkWIgMnfFpV
	ydnWNGIwbBOOFR09+TFu+gX7X5fpujAaB3ffemqLsSNxKpgSxUgt395W1XQQbyKLVNwsQkp1kbV
	0g/rqGzOg+HkhdxoZUkDJ8rYdX6BRe0MwR9GexdwluaB2iKOu1BhTKq3byJ0iRWrbdLg=
X-Gm-Gg: AYBFou2vK5aQsfCrx+vmBVVjfAkTympXWpepkiZzu82XICONpZr0sJ/RTv/SJ1Lespx
	uRpeia9fYiTkkRgy+JfMR7DNgD9MqvAIbfn8AlqYr+o0D+RN5MzGy+kS2pmBmJ1rampLtxlsNzd
	ZN3KDHmiY4N4Y4NwOAaSCNismffrKvHJOi5ddOpM7xgtx102JftWnN9pVAuM7Ik06JzFsx9QIa+
	BibqH1QENzeugpO6VaLNhGb/uKeaINmbg/U0EuZLze/V9YcPYEYj6jCdxyDwI7RC30PgK+PdeyK
	zW9RPuDqeFBA5K9BAi4/gYyd+teAK1PaScJJ9Z40+vuncn4HuYYWacabHzAZS3AggLOSQp7mmZ+
	+CEKKdqVa6hqzPLSNmA8NaTwDeB2Uvgw4TCobn0k6Ju096tw+BIrRNSTLrk+zBfhxero=
X-Received: by 2002:a05:6808:19a7:b0:573:d802:fc9 with SMTP id 5614622812f47-573d8021beamr2820992b6e.59.1794800949533;
        Sun, 15 Nov 2026 19:49:09 -0800 (PST)
X-Received: by 2002:a05:6808:19a7:b0:573:d802:fc9 with SMTP id 5614622812f47-573d8021beamr2820958b6e.59.1794800948956;
        Sun, 15 Nov 2026 19:49:08 -0800 (PST)
Received: from [172.17.0.1] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7024673csm8903234b6e.8.2026.11.15.19.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:49:08 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:49:00 -0600
Subject: [PATCH v2 2/3] arm64: dts: qcom: glymur: Add ASUS Ascent QN10
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
Message-Id: <20261115-qn10-v2-2-19b11603e776@oss.qualcomm.com>
References: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
In-Reply-To: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13808;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=WoSPCC3rEz5SicewZGTaEni68KFdkrKaxFCCna7iTnk=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBq+n0xtaHT8rEL0P4W2Q2K/kjcP0/pArWg6vl1w
 SKHb8O/KxeJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCavp9MRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUkQQ//W1TGFoqOakYgXfpxsjuBcC1dKitFVvVmGPRYBau
 HWYHIWY0tJaHRssWzRFrL/odc+UEd768gTzMYfFAMlFma33Mr853y6uNcvQvlTvVMvy9hqInmIl
 PC+AxIocjDaXkTMtY6wndLmDfQI5esuELdn4SmNEQ+piV2NnFrN3NGiU+U5dcECzNhkPtcXztWh
 qDTVbsdGKUakTb9AKnpY9Gqw+V2BAGSZBibs6Bz5o56Bt3N0/ArvCRRlJW1KC2DxW8ju/3T6pcB
 1QeCiFCfW+uUQQ0R2SEKSMAJQ+RLXMkl+Zw/iyyDGd+Cqi+GgbKt2MjxwwQBUX2jpnGO0vS7prW
 GKoVy7HyA6WazRaQJYuYqdjm8Rj3MZm4yMoZ7bF1pzywnbH5SWBdEQCs9x22CinIoSDv45mIGuL
 LqwlyTBx9aBzqM4XFHBMaaKeY4WLxVJiT4oFyAxYdB6tiAcv1fPAlIik6/sWmwreQ87vNZ8joWt
 iKxXb820lMqp/oVuPmzGpSdfa1athwN0ZclmNUhDqUPC16/8UqhM6Lpr7DzyF9rn755rXWWwqYO
 RvPg5VAy/in5bdjdgK2j2mLj84AKbqOrCN6N3Rp6w+g765Kv9Fjly8Y9u1uwcJXamTXWvAx2Ky/
 VTAWd7VwEeKA5t6Rnfl1jsKiMV+UB9FSwzP+NOYbR60g=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: O_tEE-Ay0k-y9-2SHUTYwHco45r75jD0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxNCBTYWx0ZWRfXxIYk2BYzKE6n
 WE8jC0nYrRjYLLKY4hm89nzaelBqCThojM1w4AEgXuiAxNDwJy+HUngbtAvS1+0APqO6beK8Vps
 L4ORPsm5hAQrrK3x1XCfyXXCYEYnr8k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxNCBTYWx0ZWRfX5LnmJCc8xJEr
 ViqmYdcQmEDc/3AeYSPFI9O0bS2JUC/lXb1znuqap4mgnkW/coZ+PpfWLhq0gucA2XW08da+rsz
 GaI7JSZ6fbnEg5P7GVHgO9SVj14NQ58wb1Gij+49dUDHIHAU/IYXbmdfbFdd8nBa9uetY48Sety
 jVvmAbwVzns0DhqKR24m5HUemkih8FbyEWm8Ld9uzsKMR8n+CiaNJ++QnW628ftsIqhVJRB3tft
 AEKUq+scx3wPFhP9lLCo6IFAPMYCKPdpIThdem1uXTbk1sCaNtD2IyAt3Mf5tTMesEcxGbxRd6y
 sE9EASuRAkHQ336B/4FrbuA6pglpHnmKPdCj0Rx4bfmYv4beNfKoRIqNitZLeq6dsYe0vnuGvi6
 tJKCc2tMR252y0f6aEw2hZivU7dDlT8UiOmWmqYKa2ZH+HGrkzUlJIFz+J/jGAbrv0vCKJZHmdd
 0rVWcvbyJoyNE4nASnA==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6afa7d36 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XfUM7NhkCCvRT9LeXq8A:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: O_tEE-Ay0k-y9-2SHUTYwHco45r75jD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160014

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

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/glymur-asus-ascent-qn10.dts      | 664 +++++++++++++++++++++
 2 files changed, 665 insertions(+)

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
index 000000000000..d2989f65dfe8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-ascent-qn10.dts
@@ -0,0 +1,664 @@
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
+&gmu {
+	status = "okay";
+};
+
+&gpu {
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
+&pmk8850_rtc {
+	status = "disabled";
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
+&rpmh_vregs_b_e0 {
+	vreg_l8b0: ldo8 {
+		regulator-name = "vreg_l8b0";
+		regulator-min-microvolt = <3304000>;
+		regulator-max-microvolt = <3304000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+	};
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

