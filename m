Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468039;
	b=wzyTLLDfE/3w/7A0pmL1rgGU066BFAYu94aSsQO4QkkQSouW2B10sBU2CHWk74FfV2I/
	 nOTuuXrPS/iP8ZnW8N5nLS+KKrT6QT/iAtdPUEI2Fj1mfi5grNMjGZr5mMTM0088xmGZv
	 gDWMLn6Ucb2Xa8flqOELihc1AhNnXmqo6U30Fl43uDGFIbT1Ue5Aq69lPKBnqCDB6DWes
	 7GsFUMrH0gjRpUs0rT1nYHsMlA5J3+oB+LEsv9n6+cbqajlQi9vdf1Va+VOutBvFrOexN
	 +CD2w8yBM4Rk1d8I+ubKUc0lGCIzeVCRQjY3Ak8YqpovJzZqLYdJ0xRuaGX/danJ1vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rwNiXWlFQ2u5PDZW9/aSnB5LCp1bhEw06E4ToHfhjDE=;
	b=VFMurF2uErTWs/iC0dvjYVRLp9zCkoVkzCRBOZzxVfiOZQLO23coC0wRowpl35hbx6pD
	 fT1evvtcPJxYKPHja3iLJPvBxTrhAPkfTfdfoHjASVEsLSKIUlXXu0QsFEEgoGxmcM1+0
	 /fuoFjVB7GvMp8swL1Nt6OqepJdzzsquU8GaglDx9daKD2qLvi+CwLn3FFJrtrOMmXuhI
	 UyAPRvF5w+55N4dkATFkThG38uW7EHX+RgzZsEYBxzJXH+uUeUHkW8ZRhzS7uFYKrUss6
	 DSVq78lLWLUaZd5aSaf6GGBZ1a1Y4xVD61xs5FzZfCVw/ECMaGMeDnMvVFsfeWgRGNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nx8cIear;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QATD8S4t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF273606A88D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF273606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nx8cIear;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QATD8S4t
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC70P0l022539
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rwNiXWlFQ2u
	5PDZW9/aSnB5LCp1bhEw06E4ToHfhjDE=; b=nx8cIearCKz2M7jUwCP0l6hGYyq
	nNQR4T7934+K0oNS1sC9kAfxW+5MP6Y/jsIGXdZ39lIsKIEEoG9Vpi3KbVT+PmMP
	xoR++p/dg4Nb130XSwcTiKIJceUdKsOG99f6lASdWzXjpa5IImcf5I8rMnIK+Cf+
	hxUOCBm+OIPGacas9l/+N5x+hPz/WmsZCorYKUFLxH8DKfuGuCio84OX5Qbgf95t
	v0HV2NJNJbCkn0YSIOOc7QtH5KHhGo/8qxLyCaPqWnj1eTopghiwtsAl0oYrw4P+
	vjV/QkXtxi6iqWZM2EzbjlDE845H3JG8JymJ/slwv0RwaJqOVg55T5ksAHQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw8m7039y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:20:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0e9b6717aso456245a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794468037; x=1795072837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwNiXWlFQ2u5PDZW9/aSnB5LCp1bhEw06E4ToHfhjDE=;
        b=QATD8S4tJeA0mmBBT74w5H1ea6PH4eVxGnt9euzkrkca9iPfMRCX58BCzf0V6Xy0sd
         bQ/ckFwp/TpbHFJKC0JvzHaiqVVL4tgE9ZOL0NzCK3eXpnZRQLKMyYEkTV5W8cdoR+5A
         Wk1u/ZKlAwEB0ChWSuoQlRPDaeDFDMSpTsBpsH0kdiNCyig8Cley+4SZaN6/UkGrSTew
         2q5MWfeqJU48BghtIb+OgmWrs8DqvxOaRbpoi/bQhQhqSUn/NXuye6kTHFCdkht71Fnx
         bcpFg539N02bVnog+cbbPsnDxLVZwtZGZF2OTKnwRMm1ifWPu837J5USQ18x1v5l7HHZ
         qyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468037; x=1795072837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwNiXWlFQ2u5PDZW9/aSnB5LCp1bhEw06E4ToHfhjDE=;
        b=LXuV93e8UlZ9nlfMghLgaibeduVMA2ROV6B23C7Td0uffBnCfvsfX4DDGX+CUSyPlR
         21bMdZxCXoURzCwPenXHOpQWT4vJfaW0DI9YSP46qyzCiKhRk0MZN1vA0wLsA9SBAE/K
         tKsPHeu1R31TeTML3tkVNquhjDPl2qqFZ/VDfs19N2uLd58Orqqz8k+xbecolOdH1DUw
         V1UCbJWKaueZsnP1O4MA8pvHdRpyStyOzM/uStlmiU6jH9AHDTUMRFvw/y2KUBOW2frx
         pARn95aD5oyFspd8JXHUKw7XCFaYPFL1weNlyo5ymqUmtzzOLRI2f5UZLVvOll+RAWwY
         f9yw==
X-Forwarded-Encrypted: i=1; AL+hErHzYtfOxaV3nOyhP3sI0imqHKBEzIK8ZWLGFDmJDrY9sGmb934AOtGxzI2bVRt4W43ylCSRtIoGG8Vkh/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mngqHgSR28oUwG8d6oUJgC+RDyF/VwZvUR/EzRrXLvghV9iLO
	Mb8JCSRRMtdmY6ahV5pWXp6HlcxjAJoiqoUqJlyEF+ObsyWs6IDJTEIi1xYlV5Yt20XiZEuexKL
	asbCQqe+UseLlDE8H0VfFerO28aBYukY83MJ43c/1b1zP9fBDDEjpYAyoXa6Npik8VVA=
X-Gm-Gg: AYBFou01AutPwu+dnQt7yN3yiG5M/QMIQILVKCZhDDeaMsOcUtN1nI8kfgb75pFBJI7
	VKav8vjX+Hi3uC+Bzbk/39A6eRgWADvctVvGaey8ushI59hJzOwUysrUaUsBg6jqKnCrWTsYqqT
	Fz9D5wf3M26pjx0NCM1duVoz+tSEDRqKBdxNCD+7DAjKJvjEuL4QCBfNpHQfs8yriM+oJVmfzPc
	CcK5hhCy2Cai8SFqBFWnd/GIT/Iv8eXMMzY3I3LVamO6bx5c7LeLtFjatdM/1B8UEkG05S+M65i
	4imo60EX2pw8SKKguaj+nUK5/hRb5S2Zqg9610eJA9poPqGuVp8fx4YtPMiqGE6tLv4/cARlqVr
	LRE1vGXBj/qjwYobpZEPOs5og7xwpvIDCElPq1OoBvKeDfGYhQp+Tba3Xkk+xKX6gTZKQYFx5Bc
	RBxg==
X-Received: by 2002:a17:90b:134e:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3b182d6a766mr7549731a91.0.1794468036596;
        Wed, 11 Nov 2026 23:20:36 -0800 (PST)
X-Received: by 2002:a17:90b:134e:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3b182d6a766mr7549707a91.0.1794468036206;
        Wed, 11 Nov 2026 23:20:36 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c73e27sm3149185a91.9.2026.11.11.23.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:20:35 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v4 3/3] arm64: dts: qcom: shikra: enable WCN SW_CTRL wakeup
Date: Thu, 12 Nov 2026 15:20:09 +0800
Message-ID: <20261112072009.3815276-4-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
References: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
 <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfX4lyUG1oQtuLF
 UwKwLmRqeZ83H/5p9eZnPEtt4mtdR1mu0a3dLG/To+a7LpEA2ZFn4iPwoTavE4dd8JAuS4PU0RY
 UTbbDJ0zgCEMPVoHF9K1g9t9rmja6qaRWYV6KQJxcKQQ4HOEhDopa0nXCyC0FrCsrAmI6Y15GG4
 WEJxRITLYcA8iQW76GC2RISyEoONoahP3IbiieP8dpVi7jlxNKVTYCzMzieRDci10l2TCVZxoZh
 2F/F5AAz6hOqfMii/0j49Mx6+B5UyqMQRJutluvl4eaYE2pizi5vsawnbtTc+YmwXH6YlZfjo3X
 uFHC4ySpPuUQfK8dhZ4YuwRVEvGKI2emC0EsgBtavaVi5s06Z2uQ3uv70I/mdhTB5APxekLZb0i
 qTDveGtoPFr74l4EMs0udKiLd1Kk9y+gLwe8Pj5G9CYpDq4amegAEcsj9EUs+wzLzy/NpsL6N1q
 BqDdag6O+Niu20oGKmg==
X-Authority-Analysis: v=2.4 cv=WYiZ+EhX c=1 sm=1 tr=0 ts=6af568c5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=GJxj0BfhqkdqIuq2HFIA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: _ZYNjGV-Y_qRhh3dlAShW2OGZw2D74Ra
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfXw52+jEBVoRbI
 kuFSRvWXxExwlPoFp49rIUROFABd1ZBtIYClbJ8KlE4BrHc3EpWqERInKDzYNZulLKfJ7TYN8Wi
 flq1U5etc2vk/3k1eqsWvCMOus/DqiY=
X-Proofpoint-GUID: _ZYNjGV-Y_qRhh3dlAShW2OGZw2D74Ra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120029

The WCN3988 SW_CTRL signal can wake the application processor on the
Shikra CQM, CQS and IQS EVKs.

Mark the WCN power sequencer as a wakeup source so the driver uses the
existing SW_CTRL GPIO as a dedicated wake IRQ.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 1 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 95eb7255fb22..c7b894b6126c 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -102,6 +102,7 @@ wcn3988-pmu {
 		pinctrl-names = "default";
 
 		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		wakeup-source;
 
 		vddio-supply = <&pm4125_l7>;
 		vddxo-supply = <&pm4125_l13>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 99e974f6ca7e..321bc6423728 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -85,6 +85,7 @@ wcn3988-pmu {
 		pinctrl-names = "default";
 
 		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		wakeup-source;
 
 		vddio-supply = <&pm8150_s4>;
 		vddxo-supply = <&pm8150_l12>;
-- 
2.43.0

