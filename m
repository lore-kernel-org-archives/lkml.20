Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D2543B483
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382729; cv=none; b=XnoK3IJ96RiXt2VzreXES/JKayff9BAZkoNJ3cdx6wPEoyqJw2yzC67/klXZAflgrT2inVomdbl8klrJHSKf7J9RCQoYAKTw0SClNUAnCQREZqHsWh5z2ne/zMGc5s3xEPEFmMaIxKfHuihXdU6Iu59cwn4GDpYyNlavhC6TM3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382729; c=relaxed/simple;
	bh=H8qj6Qv+bnXPrhPCj5pyVAPUDk3e9rvb1GKUg5xaUxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TrDHrMk6Aoj0Snz3kKFLNGCYhrgNM94adw97Ip+/r+hJnmoxQ9aM+dR8cDNmsORThiRjDPw1db9uR1qzFkdXGUslU1tl4eKugWj8daLUizn5UrfpPtBz4NrOQeBr6oKL7v13ASKUH6moXdBs4qvEo63KX/Uq+h6+Xj7zKuVrabI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HwZ5bDrO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXCgX+jn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HwZ5bDrO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXCgX+jn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9ndSs184536
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aq3yWQYcCqBeEbzhBi/xTHGVgJq3hkEV9rUYj7g4tnI=; b=HwZ5bDrOx3Wa7EJR
	dvFSIoudbYU4rwA2LWOoszEGMTac7aYSIDBrS0bcd2gsWcdAsQGzinKwmMt6Bbr6
	EVFKXIxeKzQXW6c0qy/CWgDQqsc7uZyyCfB08Fnjoxq22ibBzTThRAVkl6eOUTH0
	PLueLyggmcBNXCSvrjkhe/RmPWzFsUUbjv7Jt/x3hoJRx6GJ0qUS+QLi//M5s+sb
	NHJuwLaIshoBHs8LW2Iznj58h+bVBk7vYhvR4EHxkP410j9DWT+ShmYsKKPs7Bma
	7dgJpPt8wLCpaNQxzVmH9E35p8uCWmq2CvYqx9cODvm4zW5McN+eVBErc0Ai6Veu
	YwACJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c66td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0050a554so507100385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382717; x=1789987517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aq3yWQYcCqBeEbzhBi/xTHGVgJq3hkEV9rUYj7g4tnI=;
        b=BXCgX+jnucy8yOLfH1PrVkYppwORWvlJn5VaVQLoinoHjVezAWHAPp8K1GSf8MVbqh
         fshE/bTce1TrFRI7z0UYHaqmFMU8zIpsxzZ/whAscydYOrvcyNDUa9wcpQL5/uqU8X0p
         9QSqqEwLrIIyo8cR2Tw/6oLGoyvqCSLGiu4KxkQ9C2I8ZWQ0/HYDoi0afdSyDBM6mCnT
         P0hT+cmQIbfGL1X/McC4MuOUivQ/i7BKfazZrBzF1goMeNaVNw6V0U5Kb9Az3yFoaE3o
         UTiNIeKkHN2wJuSH7NlQQDjn0klz1T5lRHnP4NICb18kg9igqO/oamOaXthZUiij2iVm
         kO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382717; x=1789987517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aq3yWQYcCqBeEbzhBi/xTHGVgJq3hkEV9rUYj7g4tnI=;
        b=Ld4LkhKE/J260nc7MrovY7evmA4mHY/w3q1j86QLUi+Y6Lr54Zfj2ooWkshwRQytFo
         7dA0JolSumHNq8VnFfO6aRr1txg8ER/FvxoPCZMLu5KDc5FrLmSX+/41ULnbEzuBeU/l
         3K9JTuM5BP7pX+8PAncJp41bUTjnvq1Xo0a0Jq/uW1pUVeBH+iUgadLwamiJy7qSs7so
         exM7G9DC7DecLINvqyYLiM0v74wS3YImzfQmUAax5IXn1PPEBqjlVdkHIeODf6cskRW6
         BX0bnPVK9h+HIBKAxpkH53HFFhcYSvcGQcBA5xwoGf+uJGoEWSoggsWtrpTjm/nQNls6
         BI3g==
X-Forwarded-Encrypted: i=1; AKwUvBzudlkLQ7DR8kfLWS84AEG+PxBKtlB2itIJ1HJS2Z4+1p4TTMtjzrdDINunavcfoDhFGah6dKyOfD88Ii4=@vger.kernel.org
X-Gm-Message-State: AFuF++kRGXQvOoE1tF+gQenflzCPrLbWNE9t/viAyJRsoDtOdJ7yW0ct
	Ppmt7sA9T55mO/n8CGs5B8g0tNzMGSDZVvoq9433gDZZqjY59cUBZCsRsxaKSmYIbiAQQ9hY4kZ
	IA6vhNp9Nk/yCKWSdQ+6yElJbMYPqQixO3iSYiy7/Rq6VJtZe7ua6stkFPEnonFUKnls=
X-Gm-Gg: AYBFou10ygfECTU4XoUXjubQtx2OQVYrcDBa4arOPdOPXgs5DqzNWdiLQsdiBqsOWCx
	uadgj45KRb90T1cmupe6X4lfbMF0YImOrC6BsNYNJrQRUXq6ZxmNbxDu0LtsZDaS5IDK4xxHSVb
	+6GgQYbvi8mXuQedaJzsUhBDFoVS3w2ChKQqyPULzwqPC1R7DlfJkc68d/MDYlJGhNd94FIHz6v
	GX8s+0nhuozvmP9uvFySLJn2yiOfjvKTudJp4Hb4RVVGDGOa3cGGhE5CU7G7xUE6bK24qyiqSuB
	EhMXdMiaqAOGM84aFSNvodhhSZJui6Y3/jTKsFbg4CpesbrTotvdXYgpcaaYKJuml2TxT1vC72y
	ifAl4kk2p
X-Received: by 2002:a05:620a:6cc8:b0:92e:cf8e:67b9 with SMTP id af79cd13be357-93a2987c980mr264414985a.21.1789382711992;
        Mon, 14 Sep 2026 03:45:11 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc8:b0:92e:cf8e:67b9 with SMTP id af79cd13be357-93a2987c980mr264408285a.21.1789382711360;
        Mon, 14 Sep 2026 03:45:11 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm26335926f8f.15.2026.09.14.03.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:45:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:44:50 +0300
Subject: [PATCH 3/5] arm64: dts: qcom: eliza: Rename existing EVK to
 suggest eMMC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-dts-qcom-eliza-add-ufs-variant-v1-3-78b3249eae61@oss.qualcomm.com>
References: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
In-Reply-To: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2481;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=H8qj6Qv+bnXPrhPCj5pyVAPUDk3e9rvb1GKUg5xaUxU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp9As/2IVZ0emYUoJnnFDrf1rFTZNJU4wBnPxu
 Cxa7r+K7nKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfQLAAKCRAbX0TJAJUV
 VorIEAClvqJlRWQ+JdLcqT/nmxvw2izdlqCVcQaHiBS4wUn3+C95LJHQgRqRcL+bsadx5kbJ5a3
 eK9GHR084viRA7rjkzuQd6ZdGIiUvVDWBFoo4QNXhGfoyb94b/JgS8DK2sR0k3ecAw4fTplLYum
 /dIPHpGVfwZ0yx4k0zDeSDEq/zvuOcbVXGA7ikBzvt+DKaSm3BEy/+lSfJCKPXyhfoX1hUPXn4Y
 KpUlA/lclqwrqXSNPY2zHj89Ee4MzPjojSoOa3Ws8r1zEbJd35XjMPHyp3KMoo8QS4G4PZwrmyV
 f+1TefL4IrqDmWbnY7GKjNPrHxaao1GBShY1Xy2j4C8Pffj2uTNUJwKYcxR5snBt+TYzFD5czap
 tNbenkkG9yg8s7CphO9MP+XwgrZxPGufyya2Dw3MPgmS9khqOASvoj/5fjLvUcj+Wz5gwx5ZlED
 XO8sttrJ3saMP6wS/C0DpKBGG/I9LuuYe2d9zPvTTnQDsFGMNdpGSwpR3LBKgl/4oaEUOGGJ9nZ
 lQC9bWHPFxw2fCK6QRz9giNZTQ7Cyd9ACuKmdlwyUIXDYq2B5I2ONhQxqgoKWLj+xN/Z4S8PboX
 gUK7F//gcyPpYdk7wabfY05Q58va4cO7KUgSPRQn5/45V7c/xwhRMeNdZE9sS9tzAXxg4DKYKjQ
 swqR+9yFYn89ieQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: CMjs97aRf5O3usGsFZQF8r6tr7__oap3
X-Proofpoint-GUID: CMjs97aRf5O3usGsFZQF8r6tr7__oap3
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7d03d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=X0h4bKi3nu2RV8rheDEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX/DZ24oQ+KwXi
 GAyWbEdZGcIWukQvr9dubJBKhohs/ms/Xnr25x+dPCnNetLqMc/knbcUyZ1FZ4OPhriOXSUN3Mr
 AYvjHvHJTks5AHO5oejvW2+qgWUF+85URSToxHz/CluaeePDjnoJn208q6kaJZ/VDYBqJno+h3n
 RUEBE7tP8+jau0TT0BilkpMiYefXtQb379VLk27biiI9puUbXby2VpsTQYMhUFv6yAeOag52ZYr
 cx0oaQ0jxE5tOtU5yjxBW7vKjWh4yssAC8wzP/7H9Bb+VuMS0KJhPAuX91mDpnL/hNCK7qnd9Mj
 Z+pLZcnsdrqbcooi3DCwZDsKizPj/LsXdFU88u4f6JhY70iufB/v0vlVofSDP5Ri0gtWseLT0qV
 ewVxM4iyPkcECF4jTraMe5lvMlmDB4z1ecBDbfcElJK+MRmeXQa1ycWi3IhaethaDY5wJVq744/
 BISVZXoELzVftOXFt2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX/VReNA4fyuUg
 agPN2+1Z2UHGxeqaqhXgC5GTodljezx69hgz3q/12iqPmRSDjfifYwdLJLl8ABIHoNahWDV/dQ0
 QWqvUPaBWSfdyW+XbGiV3bSRENSJihQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140154

It turns out that there is a variant of the Eliza SoM EVK that comes
with UFS instead of eMMC.

So let's rename the current Eliza SoM EVK to suggest that it supports eMMC,
and then rename the Eliza CQS EVK to suggest it is also eMMC based.

Also update the compatible for the Eliza CQS EVK to include the eMMC
string, in order to differentiate from UFS variant.

Neither the CQS SoM nor the CQS EVK has been made publicly available, so
renaming the DTB will not affect any users.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                      |  2 +-
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts        | 18 ++++++++++++++++++
 .../{eliza-cqs-som.dtsi => eliza-cqs-som-emmc.dtsi}    |  0
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d6547fb18edf..ccaca98ad4c8 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,7 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts
new file mode 100644
index 000000000000..36f63dd1637f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som-emmc.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK (eMMC)";
+	compatible = "qcom,eliza-cqs-evk-emmc",
+		     "qcom,eliza-cqs-evk",
+		     "qcom,eliza-cqs-som-emmc",
+		     "qcom,eliza-cqs-som",
+		     "qcom,eliza";
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
rename to arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi

-- 
2.54.0

