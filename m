Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720518;
	b=bRI96UHO9+RevAeH4R0r3gbz6KoM+04ywFooPOFrrvWTGQkMHMNRxU+ZfKArTtJK1ym7
	 s7HX1wJTYwfwy8bNvFS60nW0BVkQvV9VPvpvhVgkyjnjajtPmZHuRcFy3K4yfENxcbt2l
	 X23dAMKII78CkrBW8Q4LkgMbhRFB7imTfornDDvYy6l8bZfuOet5xDG3VKY9BWawHTk07
	 e0xs/xmm546LK/83gH4yJNvE2g7LWve7xMB7fjyT5BAojJHuLdOruD94wK3m7XRrDsjKN
	 FbsuPX7MoCmi+xZnvEbzpYeVRSsPABr3pyjp9kfzX17435QukU7t1ycsZ1QQr+slkvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720518;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k3X9eeAdKob44cdHpLXAXBh8F4GxpwEfqQORJq9Lp+8=;
	b=kgsfvXSQ6MTcQChsgsOL5CD9/YnisdIQxjoMyppztUXmRgc6iZRtoClyY7CZdG51RaZ1
	 Of1pj45voex7aPm333xF2N5W6loclAUg98NR96IZCg4w+QEKOLtXqYY+0rBI5/hMhtdId
	 3WiKgwyWz2ap1nTrZMRT999uUQkbolHznH/3k9oIOlMfUu7wKKzNi9/Y6hFgvmbM0Md2p
	 o/DVQcFtdYPaUHO2k+F+74wdamveK7hLNUy1eydxa0oUOd5x55n9MePqoL0sv8Vzha31p
	 sQ7ysJWVZu0JZPzmIGSepckS8JWiMYLH21kpljd5+Dg1jP6SoGNqPN6chVvesEWHMYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PP4yn+Iy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLbl6FV+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4DE606EE83
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB4DE606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PP4yn+Iy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLbl6FV+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9vlS2526831
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 15:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k3X9eeAdKob44cdHpLXAXBh8F4GxpwEfqQORJq9Lp+8=; b=PP4yn+IyWNUhiZBS
	EkcYrcvChqkIum28aXYKBtA3fnCeLz17wSJ8X7ZGJlGGo8vsfq8/glhAsyUao4Ro
	oXnpt+mCcMZMkc5Gy05I6ui9fZlA0vnRrHVGrYewOc6pexhBoqyLKot9tElFnM28
	cQSSeiLDZ7TVR6ipygfnWKgg88vZ/oiQUgLGiZT5LGKZGJjVdm0e2n8bpaL0r4JI
	I0LRhGCRztK28FAaKXqzdbo0fvt3NxWre+Zb8JNDE1M0A8WisvOo+apIYfPw2RUA
	DLFSJEoAlzUOr5SOjI7a5TJqWuj3s9ijpgePKWihbfIwHKPVLg/cgmz7o/wmgjf2
	Q1CFag==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycts8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:41:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c3c370b17so7055153eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720516; x=1794325316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3X9eeAdKob44cdHpLXAXBh8F4GxpwEfqQORJq9Lp+8=;
        b=KLbl6FV+4OXjRQ06s8x/LgymFaMHOHim79rBhmEF1QF2rqalGfu4qFW8z/msCZf0Pg
         ZJ8cgnYFlJq/Rehfp5RsJlRloXR5SKFIh8OhtWIl1nkTFwRdIDWFF2ekdlw/y3t5gUi2
         Scm0B9r7/A2WIJfsUTPN26UZ9Ldfwn8IVjhjNMV3L0qcdBTslutzEVnNxwvengrK3BMQ
         kJZqrIfnNrqaKeLWqbz0lKDDM0qlZHtwnzgvKSoj/hiuoYIdxONB3O3gByLdKJ6ahlLN
         2tS1IbQGVmq+L2Y6MzuN1U4WEWmq9hNbjodQOYLKhS7X/6HfRLJxSx9jBF7p0mgCCcDP
         8rcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720516; x=1794325316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3X9eeAdKob44cdHpLXAXBh8F4GxpwEfqQORJq9Lp+8=;
        b=FbPu6xjNRjh22rV86htb38Kj1VOtBZ0JyWFF/T/8MKjXcEv+JtVF4+M5lld01M2ZKE
         tPnWkF0OBIgWqaszVSprmmSbuxaKvKNszD0XSw77FXE9FP9VWPTm7xlsE8XPllfF9p+A
         DeZq/c+bJKup/UvfZwbYZQtAQxPPbPRpxoln6G0FOHNI/3765rNADNdy54Xd0bXN//4j
         tUNceOSshBp3gzAfBN7tI6GoqICd3YGLutKhdmhl0TRdpExaB745zg0e75XrZSfy7mKb
         9jpsHyC9qP2UILvaJ8Y2LfyUBkadtqq2Cd/Sptt/TLUpaq/MBHTH77FmqER9plrWPTSg
         kCzA==
X-Forwarded-Encrypted: i=1; AKwUvBxlxHpIRWyOU8xzBwQqafdZxBsh6jAe1/bv6j1KHdtwaMQORPA7Hb+Ee5BNagtuRSD/7mAzDy6DcG8pYkY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WFG0rlxWZjnTj5IaYlg1RID25qsOy2WvJlKfh22MNrtyPkyae
	D2hpcT8/qZiljPYkHgUiqYoM+DK1TC2eWOyLxRXVmYrKdhcxDXBWvevebN473RSoFGCUmiR3e1h
	NAVQQRNH35kTW1Ct/tTq7xuTqCZxB7iTHLmr+o/quil1gLxaBTDlnvVuK/A1g6SuQUgUOnGMwqz
	A=
X-Gm-Gg: AYBFou1osnf3sWIfLZzbVZXR8fZsAyoZLJN8MG2/vyY2WZ6nM+KzLjVvDn8k2umR8vU
	arz+DAbWVTtIoO7RIz6o4+rv4y1zEIQ0ktKup45iqRfdoEgTniKp5w1kQZEgFEl2aTcStqdt9WZ
	7B1g8ppAJ0EfRwUJBcZ8Z2d3wqx3puZU1C0aYv//umeZqJMF4WTSbp+xGqN7eye3Pjtuin1n2+0
	z+nq16kcuxmFJHH2NbfyOVHwBA2aAD3a76RnXjHvKoUeh7KyryS/Ixr/zfKktiSdZB+DsqQu6Yo
	Sy5Bqgi+rv6UIxXkmUfd2m8z+1WirEP8D6fWljY0peunoW844qQUwpleRY6sz5NyEdn6H67X4gE
	khHvFdjk88ccRjhq9lM9tDQoX6xZLvkC0xGbr5wSx4plcgHGALd8cXisK085pXEPChoaBdYpkma
	7v3Ckd5CAy
X-Received: by 2002:a05:701b:4248:20b0:1a1:c1e3:1ec with SMTP id a92af1059eb24-1ac5ecb684emr20655666c88.46.1793720516126;
        Tue, 03 Nov 2026 07:41:56 -0800 (PST)
X-Received: by 2002:a05:701b:4248:20b0:1a1:c1e3:1ec with SMTP id a92af1059eb24-1ac5ecb684emr20655626c88.46.1793720515529;
        Tue, 03 Nov 2026 07:41:55 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:41:54 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:38 +0530
Subject: [PATCH v6 07/12] arm64: dts: qcom: hamoa: Add Iris context bank
 subnodes
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
Message-Id: <20261103-vpu_iommu_iova_handling-v6-7-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=3527;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=Kx1Spp6KJHM/XWRn83wWXOQAWtlHL2BRvZW9xTyFHwc=;
 b=b7Mkz0Y+9Q+XFK0lXWY9VZ6ZzJKG2BoMZeEBJcKIimMrV5c25MIp6UMDBpzCyiYufhPa5nguF
 f7sBJEQPSmuA6SrcXaLBAIKE0QyL/moIKroHjLf7fPf1WEVPHdjt/rM
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6aea00c4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 9RtF0kygD8xHLErrB-nNg9rSejcRtmuW
X-Proofpoint-GUID: 9RtF0kygD8xHLErrB-nNg9rSejcRtmuW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfXy0FwgVbpz7q6
 3iI3h+hFZJKeAmZg5N9jkEp8aLLS9nWeuuhD7miNa3pJ+Dg+kkcl08JVbAVa4fH4bRwWhEwBM2N
 94NcS+pk8bqXYidRQVmNbj6AFpXhjdFSiF/SVM2DRSIp6ydATjPhMKcmSWr9ydYDtIV/sBEKXgH
 hEZJ4rbNB3Gu70HI8DpJF5rMmC+j5LWoWpFL//rZQUjG6nicGLpYYYTbjnR9SrVYvbMiRs5o2RV
 Ka/8U7Zjnhdg4eZtSLBkxqocKTkfyykvQR/gMkKHPZutDAPliTPGvgGokvpnfBNd62neqEk9veh
 HuAmYYN8czNgSQwmEBY+1YnUb6Ejk+wqiSaFqjIWjkAlHFn2O3neSzm/wN1WPwKroCn7CNmudwj
 /rY9NcVCoGDZDCk570Mq7FOVFd22KMojsd0LKdcIJysF/+X+vc1uIDiW1WzqCqYuoS6f+vqUCaP
 Fgl1U3CKoeEjQDkcITA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX1an8XlaY4uKh
 QOgfj/bOu107ef63HpsyONL1+lc2XSBMe3Vw86dg1IiPAVexE7OH7hNkyELLf60bEXjkynJvuea
 E6M3LQ8E1GeicCWavOT0Eqo7HihloYw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030062

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 48f47aa6ba3c7a86b9746ccef05724529ea2cd02..c6bfaaeb2247037ad524d2f848851cfeae24b7c6 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5468,10 +5468,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5479,6 +5481,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

