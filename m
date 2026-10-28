Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189931;
	b=V6U4kE7hxz3KE5bSbhCDV8Njkkm+HWfWvVgAhuWEf4fJBD9PLZnmKi3fceeIIM5FSk2b
	 hxk0hylkp4yWatRJPMj8FXBow3pNtxCbVq+7p5fF9tn1WB7uL5tiaWDlEVgo8DEHAYWsm
	 fIO+gGKr7HrGPfQGZm7BM9kVQ3/H7IkIWpQC8x8ujxKV4rduRsQzHnqMTtfUBFX7bKDPL
	 cLRQ0pk9+cIoCuoozgUWdqxVfs4qX3hQK7l86dRDGD1cXvLtjGHCNot5s8IWjSw2BNbtC
	 HWj0Ove2vdxfzs+oPtYHrOqIw+hZBEdKFPlQe30Yqdy8+9Qr4ZZ9eudKZULkAg0jQug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189931;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7CyZ7nH+G643rjUlHyDDF4wo1yuv8Eoj67PnRsw31kY=;
	b=TTuBIndXPiFglk0124sGqkpKwRk2lXxNSi9/VUN8gK34RB9pDWxelkWi+zdG+2sJJQyC
	 qcnTNjaPrIkh3Xg6sYLaahLWVvzniGHIBgZ1S+ULbtsoLEeo+fMyEIRKubey7nb4RaV3Z
	 1tvgBEEprswJxG4zS6iSzn0xGZLnpGrtoSqX4J0Ocup3TKaxxUhpwO9YI+Rm8FNPv7yfk
	 zpcZbPecoS+PSBwyrHi3hUcK98uIPu9D94RszYnjcdaouwl5ynbNBjq1Cqcnl7Kusa5vA
	 9cbavtltdc0kyS3ktWKbmMgKdq+4OMjpGAmOLX+2cfRaoqD3O8OLZYl69/XZdn+u1qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fCtHKZ4y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SypPVcm3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0794D606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0794D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fCtHKZ4y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SypPVcm3
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe8Wp994806
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7CyZ7nH+G643rjUlHyDDF4wo1yuv8Eoj67P
	nRsw31kY=; b=fCtHKZ4yGP77HrI1JydrJ30UEdt2FHwHOSUoAO7WCKAce6jnEeD
	T6EW1tD64Aa/Vg8abM1N3W3IfcVia79nr7R1k0Qmtsu3FIwRK8FTlgvy3xtgeBUZ
	Vxs6ROlBWJ2ePn9x/DAsZW20ifFWtcBMHMu/KsYHSV+J99J4AhJIvTnAOpe4n3ye
	a7sZtyKkNibMoJF1dsyB/1YF9q86dCjfXGbHPohEZveFlO2IqmushpCrrguxdkER
	nm9F38BoCsLU8kLRoL8zR6fwxxVueqUi8cF0Tz3YYYAt5Wox9UL4HZKcC6zlpSRm
	EH/q4t9niLeKFh1/Ty3WQsYUMqkEC4cKqQQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tt017-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:18:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36637676140so1408160eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793189929; x=1793794729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7CyZ7nH+G643rjUlHyDDF4wo1yuv8Eoj67PnRsw31kY=;
        b=SypPVcm36JsNJNqEv+rxhxGd0bz9NGX96Jejuz+qBDx3KUDwcObyJ4H8W6uqUaIN+i
         mysfu9zxocVL9NvEV+fBCGX1VNN9eBqjA3YUzJkWWYp3PXfRASPhMZEPEyMGBeKKenAJ
         Wu8sekMnWW9GusYm1mgfK4rEi51VrfaV37EzjwwMvpM3jDmHiMONu/MAFfta+77oQXzu
         sISXZ8vlJeGBvaplhCZY2R34aQ11pyq+OYm+XYxXye5jcG23CkEjEgaqQJUVhW4mDQDp
         EfTmyUneyl63Ksh8Z5N9HuZnB6s+SNGl9TghwsaVdMnEkbYXWQBRS/PqfPDPpOXSXu4p
         LgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793189929; x=1793794729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CyZ7nH+G643rjUlHyDDF4wo1yuv8Eoj67PnRsw31kY=;
        b=G6gN+WOAQjP+yPehJUCkIm05lXIIqY/B/95mPKHsQLLM18pZdme4TkSENgkWoSSnzu
         LTzdvaPL1//YRaRZVIzbU0m8+8iQx7CDbohcFJ5tdKui4ftZxiaah6+znxVdR6Ed5z4l
         wKxdsd9JNgFeD2wV+Wb/BddE2gqHKAPHQnJmbsa9neqJWQJbiVZlwC8tyGspqI/E78iD
         S1oGWtf6IrNaCwIKZbGDporaVvFyK0ZZ+qG+hN/NHN/Y17ya7D6A9RIrcLdtUm2qweEj
         LGRMjOHiUKFtlr9VJZjxjavBTQONo+dm7Wd6+ESYzq8ioDldbOhbew9YoTi1yRr/EEj3
         phoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTMXdQZ7on7FL7O5fiTRX/kKZnb70EX28eSD9vVso0RpunOlnRC1fqVN1T7VzalF6Dg3Sn6tisSju0tAg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgFgdHxlmU2YuDhe4evhECfr24+0YBwd0shNatubZbXB9ChT4Q
	PJkjC4o/yb5NX6kJHA4HfR4VwMKF3yf2AfGkg6r4OsqVlLPPC+lg4iWu14T6BTVPh8+8MgVm6Gu
	baZGKX8AJl70KyAmPLeAWhC7ReevP6Dd2lEf6LbZ57dadNK5GmN+ps4sfe2cGj7XlfX8=
X-Gm-Gg: AYBFou3FL253r5VfGmkuhBfXFFOxQ289V96svzNSGFv38cpzw44lT4JFBRK9qQVEsQ6
	0/UO4JwdHS/kn1ok3efsA0GY4yRPYc4rGdfREMcvScuJPZZXw15VA0AhNp1a15GoOCn6iiq7wea
	0kHCX5KFQylWdEn/7wpWjd3X9MMnQVIUaTx3s06EvNxZNhsJ8yIIUdo931rLUopl3urUrD5Ibq2
	HbCuJvZUEoP7qbWrxuB+cJuKMacBHq4qdC8AGV6CyDfMGEXBuocQCnH5B4NSyJ58rLACey9jGvR
	uZmSlc0mzwwyWs3W36LsBWv3/IA3k61hJz2bfAuVXE6OTkSH5HRLzXouOhRb86fLF53p4sjpT6x
	zQHjjZ8tpW88RYHOP5x9lP6RROc9FRWkXoBBFcAYh+WyKp9aKU3QKzqdNWKNFwNTpqkOMrRKAZ9
	AzgTCB2OWS
X-Received: by 2002:a05:7022:f50f:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1a6c9cda82bmr3203062c88.2.1793189928616;
        Wed, 28 Oct 2026 05:18:48 -0700 (PDT)
X-Received: by 2002:a05:7022:f50f:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1a6c9cda82bmr3203036c88.2.1793189928006;
        Wed, 28 Oct 2026 05:18:48 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a7549528ebsm5056143c88.0.2026.10.28.05.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:18:47 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: talos-lyra-evk: fix sdhc_2 vqmmc-supply for UHS-I mode
Date: Wed, 28 Oct 2026 17:48:40 +0530
Message-Id: <20261028121840.3111281-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: 5Skg7N9kfyVIcBH90GvomNN9olDiKI7C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0OCBTYWx0ZWRfXymA3jqgSr6zm
 t29fUYviNhTV7ywkqT6yP033m9GIlTVvMpZ9z4/zRnJLR2gMn8biuii3J/CKsB6x7NwsdXrFieI
 zZasNoln6TSCnBmZCSbwJfuFszjQL0I=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1e829 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GflR9JRM7eMrpslxb7IA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 5Skg7N9kfyVIcBH90GvomNN9olDiKI7C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0OCBTYWx0ZWRfX/oYzl9X8nq2F
 eNu8N6JCwywyS8TUHpbEYz+UIvdOfdftwSn+7pkXer+zUdCEbvqTw42Svfuh4GihIeC/vB95PvF
 175oLSvU6LYELEJAOjhxTXEWn8k/DNT1raXWjM91SdID31CRBuV7X9FmRZ7Vs2dRGOfttIpBH/4
 6kWQaRDP7EO28pLQh8NvrkMob4bQAEiaAWVg5D7Z6s6tLQIa8/dSmMWKF7kgxwaBk+vw3V2Ji9w
 NaMQQymTf5EE8Racn8EGJdusKo5KXNrCpKLezh0T8S01/rlyRLO6DPgqFuMC9bS5aMBjt5krqcg
 JWvBhY51+ZMftxFGDEeMjsbfFsZaKuPTYSygmPOUM8lLxrtCu2S2wwd8ItopWjOH0nlzLViHIKa
 Gidl40PIpgufLIMqyRD/GQgaJM3/GBKoa3OLA0HZ8gr/FF9fb+NLnhaD9CQJJCveGWhwNdNTzjc
 6WSsN62u/BrHuBlWWHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280048

SD card is detected as SDHS instead of UHS-I because sdhc_2 was
configured with vreg_s4a as vqmmc-supply, which cannot switch between
1.8V and 3.3V.

Switch vqmmc-supply to vreg_l2a and update its voltage range to
1800000-2960000 uV to enable proper UHS-I signaling.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

This patch depends on base series -
https://lore.kernel.org/all/20261027-talos-lyra-evk-v2-v3-2-658fd5a7ec99@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
index 7d9a08471906..65a2ca78106d 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
@@ -57,8 +57,8 @@ vreg_l1a: ldo1 {
 
 		vreg_l2a: ldo2 {
 			regulator-name = "vreg_l2a";
-			regulator-min-microvolt = <1650000>;
-			regulator-max-microvolt = <3100000>;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
 			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
@@ -224,7 +224,7 @@ &sdhc_2 {
 	bus-width = <4>;
 	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&vreg_l10a>;
-	vqmmc-supply = <&vreg_s4a>;
+	vqmmc-supply = <&vreg_l2a>;
 
 	status = "okay";
 };
-- 
2.34.1

