Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E05A48F03D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946210; cv=none; b=hUxmct7R/CnuketQOe0y3LSor4+50E8W4KunFvnYDvk3wlgCXD5r+CaUsE6250UHrHGGKJ7M4UZDYbofRTufLeRebMf8mCu3rWqB1Yht0m4VivL0KFCfG1MAg1BWZGXDu8BOw3BeHJYasiONvYQ9PiCS/4aHrPH5ZSfGsk5BFdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946210; c=relaxed/simple;
	bh=/w0aJOH+xoiyalrUqU9wOK5XaE/NxE7TbLjMkHrYZPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KzOOR8AOUhLGOnRRL3AZ/dGeCLJvdL2SflgX/93BN2cPDLAxGdkkLYRu03KfFPhhuTlzzwREqXrznWh20WC5OCtFlUf5qtoi/7mjBPtdoPLbk2IoIoJtS0CurdDCO4sLt6UYQatILErkiruSG0X5LMxsbJJXxoZn7CxSdh6tBu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tjm1nM9N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyMymbCi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tjm1nM9N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyMymbCi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nipg755027
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 13:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PTzWQCCMyGuhdhfBCadmrc99Mjjl12xgtOGe4mlucRc=; b=Tjm1nM9Nix4buFrY
	zqDLpLqiHm/TvHkLYNjx4aRNMz/3Vv6r7wbe0p9YoqehkFfUcwh1v4ncX/guAvnV
	cNDo6RWkw2fqWv1tiOolR3FbWncymWxwTK+eGWPmr+pjBaw4xXph7KOOcld+vPQP
	y9tTm76RURgLTx49hDPebNyG3AYnvPULH5M+TlR2bTPFp2eK9L72V1Edn1z3/8Tl
	dCUTNPXibgdWyNPmOS0g+MxOoIPYDEmQW1UrbnZbDkC3b6EAGqoLgD+20jaGCtCK
	Kwrs4o5XtKGVpyszJhareqYD4FHn5oyrGMl367vDbef2hb59km7UP+0d8lkAs2AU
	X9DH+Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1t9ac4b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:03:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so170366eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790946202; x=1791551002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTzWQCCMyGuhdhfBCadmrc99Mjjl12xgtOGe4mlucRc=;
        b=MyMymbCiCtD6Xhjt3HpmL1FC3xqVVsjeppZ+Foid+9+K42lWzZF4h3ol6EVVJ5zN4m
         N/UdDjpAXrrBdSF5ziVNmZ6GaLFCFTFb+nzJBgDlI+zKptVcvPBbzIVPJymi6M+o1luC
         9cOm1BsertXTIrT8SzAWweUd9vHWHkSAPiXGzbU4etRW1bFhdOPsekvluW1VROWsTJij
         OlrvAQvbpJvjT/nPGT9Nx6aG26MyXXx2co2zSNmz17id7y/EmWkCFGEmFpDN3FJubRDW
         /FndYdNVmkdR+V2A3IhEAkYA58FoS5+x60ADiY2trnu1tqGhaljPL+Cn97M6kciTsqJW
         5sYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946202; x=1791551002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTzWQCCMyGuhdhfBCadmrc99Mjjl12xgtOGe4mlucRc=;
        b=Oie36fNUv4t5Eut1M/WKtNS91gRyRc4uHZGnP9FuqhiBRRTgWGDV5mgX7D8GuzpM7C
         OGnK9VPQ4Ebf6f9IRyyB82pI9wV4q7/V8Sx8pM4q8qu+WOhIyKiruOUcDtcTIWZTUQ0o
         idU4GcKV6+C/X+qhEDf8H9JvdpwdyJ/7hED3msuvMUsckyBX1/439prOIR/5jV/i48zd
         vrE+jodnc51rGsJCMpdx+pumsMHAWmfULzS1vO2tgZg/AdM7+jMPgFFcZYVKDS9dea7v
         uHvYM5Uq6nPL0m8YNSy8y0RdoBkNJCBU6JzTjDmXgtneZMIX64g7KruUxujTNl+VJCpm
         VuVw==
X-Forwarded-Encrypted: i=1; AKwUvByIt2rkRPXTCf5+eN1+9BH8GcHxmvbbidqd4oEGNnDYXjQUTkn37ffFbWnGTPsm8ETBXh/4rtpR5yF5Wz8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4waiBVNJYQohWKk5sVH5oTD1Zchbg8rR8XyHd/A+6FBQaIFC5
	eNx96DNKjDf0psveQk8JwqEVRpRvF95cX2z/cT4n8TSogHr6p6hgGD4qXilqu+LqMhvggNeMTrX
	bfZCCo+pv7K4xPedEmdaQTeFhH7oXwCFovATRNHAwRUh03zSTzeY5IN9raEYk5PuMT1E=
X-Gm-Gg: AYBFou075k3jMCGjYJsgNT6OICIgRo5t+V1TS0LhN+OJHfolxBNatN9z1LS9z9axzSI
	EVNiUvK4+VKDem2dBxzmRRFuKho4bZ1v198T/fGrufIOXH/oOB0w0oH1LAOe09vHihFxTztbIMY
	H3+Rh9VPc/OEUBLMFEvA678wgHHVa9As1dhTajkYhl7jCE+Rev00nVfyvKBCRP96Jo4OYHs/Aat
	gixwQPRLNT3eIUcDV4L19uoltIBHKtPQ8L2BJIGGSqK1ExZd9ufq2JYOnZXuAlkZinLKkJhRF6L
	ERwUv4tOWjTwIQWDF3fDmpEua9AKDh5MwTY167kUVrKk/D/datx8wYJ/VMYRtIe2vFKhK4VVBtO
	sqgOiujNw8mRNGkIddFgvQsVoURJRr2SyphZc74Xu3IkoPyOhYJ2gc3xWkOTI9llBOAI4AmOzTc
	5vREDSnBwcKKNOMjEr6nFYzkxePU9X7Iq7xw==
X-Received: by 2002:a05:7300:d10b:b0:33c:13a1:84ea with SMTP id 5a478bee46e88-34f2199d876mr2517941eec.39.1790946201731;
        Fri, 02 Oct 2026 06:03:21 -0700 (PDT)
X-Received: by 2002:a05:7300:d10b:b0:33c:13a1:84ea with SMTP id 5a478bee46e88-34f2199d876mr2517906eec.39.1790946201122;
        Fri, 02 Oct 2026 06:03:21 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm4217543eec.6.2026.10.02.06.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:03:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 18:33:04 +0530
Subject: [PATCH v2 3/5] arm64: dts: qcom: ipq5332: add the IMEM node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-imem_restart_reason-v2-3-61703c6362e3@oss.qualcomm.com>
References: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
In-Reply-To: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX4EGXd94BKn8+
 8l7AlmjdNp+ugfwSRpTYOw25BwqyshAgNCIi8Lpgs7QLA5C6Ve8PrsVLjgW+QC2ejENTrxr3qxY
 INE1E+rvXl5qlA/mNzXe16/TclXIjmk=
X-Authority-Analysis: v=2.4 cv=N++8hG9B c=1 sm=1 tr=0 ts=6abfab9a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1EpwE-knX81bZyav7xYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: -oiQsxr40ZK05E4RH1aZA8OoHNImfkmB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX3pX6YIVqxRaM
 ZyLfSw8jYUhS6cNFJvsRO2XVnsKJrDS87MBWGHpHyyBed9X3RxhC1BKoenuB61ajs/NIh/uw03N
 MLg63jz4h/9jVOrQxsBiVK6+8UYm9+fGZfncDfxGTPPmkIyIPuZSzXyWnr8tXenMHem2DqBj98m
 /evx7qJz/cSou9vgo0Jyed6caXBzwKlspKXmzblNJ1sX/ZlolJLNtU0o/YGxhw2KVqk8AFz4PN/
 FLFDyn2ya0yynE1ln8/OTTYKj+z9zj5d+7Tq1T8do+aoCh9s+BDkviZWe/jvlOonkT5Go8BYu+4
 UmlHFMp56t8fOFhQdW9CnD1S9pNMllP7Zn+SU826PVzm0U5I2DzoUEZc62IM9121DQY+xfWUZuG
 uhgnKxBK8TvT/ynbdsaH85eCRJ9MVBVGQ/ex0vmjX9hpPnpxv5J7Rn3K2OktZdyeXZiFo0up0rT
 fKgKJ0aHyICT0PPtT2w==
X-Proofpoint-GUID: -oiQsxr40ZK05E4RH1aZA8OoHNImfkmB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020051

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 80KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 74d9de8d7641..3e10f45e182e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -493,6 +493,13 @@ qpic_nand: spi@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5332-imem", "mmio-sram";
+			reg = <0x08600000 0x14000>;
+
+			no-memory-wc;
+		};
+
 		usb: usb@8af8800 {
 			compatible = "qcom,ipq5332-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1

