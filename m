Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280986;
	b=UPUMHpCC+YuATAw/loIoCxAZM7jwDbRCJ+Zxu2vnn+J/v5G60W8KKV0l/qQUxoJCTx7c
	 gqhgRR7OsX7d2+66zzqA7v4h3DfOWM/ildJusC85BV6iCyGuzBHu2zSgRigta9ETGnYlg
	 se49EEqFrlhJMEfj2KzMyGTGFiFsJmiiTPZjTTRgW/vSPPrZ8RhB2Nbz4H3bw5c4u68BC
	 UOYVipGl3JclwS//rlR9HilpjMwbgXc8o8gFQByBJT9qEvL5aG+9kKU/JBW5av0m+/JGW
	 /LoAm0GWjYUT/FUMjxMiSCbJzJljFnq2GGPM+MDCFquHVHAtq5Z0SaNkGU02TCpNuyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280986;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
	b=oBMaMBVLPvppHRhdVcdnZ4ED5whEzr1MGqwXPwWpfODrzBgWbtNj9uRvyr9siwM49L3F
	 UFYzPm2JVF+Fko3vOx92b+T1Utq3Yc05DcjwDo6PihNdos2eDS+RE7Ck0IwCRjJYw8y95
	 yIghE7bQI38ETr8vlStJ9pOPIIXzp/10opqU7Sy7ypXGcn3CKM+CK3YqTYDaDUoA40ZS3
	 HrYyTX/vBxLap895kc1MPInZL/LwJWF1XRgKrMNoKOFLGMsB/9LTyMxZbaif5yWMc/YiH
	 vd5J/oblgosz6iT6nnquRZD1LVZhvD0NHwmwW0YygxHdSIfOXPWbxeMnJasK5idL9Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gH/pCXsw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MGUDEu+y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563CE60A2601
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 563CE60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gH/pCXsw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MGUDEu+y
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j0we1322628
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=gH/pCXswSSJ3EuSh
	KQA7b3xmVoM3LnWBCO0vxhLXjren049L0iqemNc18vZnERv0nDAzk/c7vfuOTguD
	7qXtvMAotyfyVzUOM1mtvSsjI7FaUVUGfMP2IxvNdtdiJkZFCH3ljJkiJeD2g+CG
	4DPsidwZi8sY+l6/gEpO5ZKJlnNrnKM2DogtMtdzS7nKtMhAXnA+M6bwU9Jf2csF
	bmH/yjuxJyZ6G0tQfB5B+4DT3rtzUp5l693QmxdGtbBdudVa7DPfusELcFKNd2vt
	t9XSQMNkv7HYJ/svN5owesKOu+fevgq57XWteGgiBDU5nlWb2udEM8xDhy/nW57Y
	aSgDwg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua58bxfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:23:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb9036421aso1479117a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280985; x=1794885785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=MGUDEu+yHmx7Z9Ep4Wj6oh4YeyQYoRR/eG2C3IJxu9+TzxPtyyg/VfOTpEOR3rhAzl
         xMcyKo/8VGn5gg5qcMPy0lhCMU6Q3QKbIA3xwGPD0IcpWFsVOv1oqp6IkrBpAbgxRcrZ
         mGwy8zCA07XI3D/jzMRMEyiLU+YY1lbHdz5EyQ/1pez6sfZMhbjwguY9xuHfJbslPwTz
         6xJ88L8TgMpmt4l2cZMSPaxLD5e8yTQEW54+V4/4YEoIPIc7mBl+3M7saqHy4AiG/8eA
         JdZN2Fn0sA46djv3uUCaL+RhEKgY9wdu20AA46H6pApERdUklQ/VJ09oEkEVH7y1jp2A
         r57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280985; x=1794885785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=VC1MtZFWXxU7+esqEB6YmIMitptraB2I01/iM9BBi1sCly0ODef83pFzZ4052PUZ+s
         SjnZvnvM62P7fExKh6XGUbtbs5+yVQmxdLRJXxkyXf/S7B185g8V4SjFrZkqFIXlUjBV
         PjU+S5X5/bLHHnzB/FrxfTs/Lg3I++DR0emNExAD17tfZmOddsH4IZsyTpTrWToymTSh
         j6PEyRZfwM9z15Rl/mVdZFD6l06qIOSk0F/Y4mfAYeUJXVv9/gBfUIX2Pz/lsN3v+J/j
         3oRKnWm3vURas7c+SJ5IS0bR9trJuRd01OVAfLN8nFHaLgaD+yefYcSoJZIY21p6ftfa
         fxAQ==
X-Forwarded-Encrypted: i=1; AL+hErEKMQvcW2Y8h25gTdTzjseRWesjk28kwfzqHyBrxg9YzJ19HrsrtI3peC1Gt2dmNDnLI8xAU6Fv6D4dzXE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+76jN5fzVNaxoVDUNX50gdM6WJnE5KhjaqYvMDbyZEMoccyCzs
	c3Xln8JpcccDOiMFk+pmNJt6K+VlpMN1PMxzFavLqllO8JotRdD2RyctvmmlpSoURsWXAUoO6Lk
	ksU3pk5VFBhPJc0KyEaktZIr+oAQygvJdAqbG96RTHk7WwcxV+kcG8MZBFUjaP3EP9oY=
X-Gm-Gg: AYBFou2nyFVWriss25tfJFN3fInGtZ3H2AWmhBemZF+ffXmd42bZooqluJUTfmhxT50
	g+FhipLkv2q7drB/jZ3POCt2psGvTY2JvYosg/eCjRebzZfX1IDZhkPmw8o3fMhEEwFnJXwr/VG
	ueOX8Ufwu1lc71BxAQmSp9U9d0g1/K8s2CAlAFBnYH3voYefHvZrqRN2wHA635jb5xmb3mdZHQg
	+u5RcKuIC44JddjIh31M8hHoqkTZQgkQpd1n5g4QI8EhofY4YMGsU04EA9qWAXeBIn4hvpTCSwI
	1pCO7yj3CUizb038wQQk6fJkyL4BFOykpIibpQ2PGKtV8MHuJZEYkW9j9vhdcdkbTuFIGTJnoJ7
	iAH3ATtmrFXVYeNtSzwqVPNsiT8XZ7B0MioxrRLZkUi564doRiNM9N1dtB+MA4jXYIyQVbVNtKL
	4soe5ZgqdEqywpf1dzo/rxP9IyTJq2B578xyMF
X-Received: by 2002:a17:90a:e7d0:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b166fdcc2cmr1493516a91.61.1794280985136;
        Mon, 09 Nov 2026 19:23:05 -0800 (PST)
X-Received: by 2002:a17:90a:e7d0:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b166fdcc2cmr1493498a91.61.1794280984677;
        Mon, 09 Nov 2026 19:23:04 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:23:03 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:30 +0800
Subject: [PATCH v22 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
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
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-8-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280922; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=AMiBCcVxGxfSjuuyQmf1WPtk0fETzfBhVgaDOfLDfYDsgz+Dw9fHYx+UHgz5+Z8gvv0CsjGGt
 t6hZrFaPbTdCOSKabsn+yIYX+kMPuUhaAAxVzjIfw3rqbrmcJPjBdQW
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX3jQUj1ybgA1G
 yhPSTO4XR7IcZfeHCVLQwbaFl8+wslBIZYUIQLBy4j/sCBGjkMdTh6+WxI8I4wPqW395DAT6o9d
 S0tGA7Zi6I2IO5hI9bRAdhnFk5luh7LlJFXEQ4b52YmshyqJR43+hXjEgIhagOtqok2U/f9zZQL
 9FXXFJBaGd3JBnFu/9WTvTCF0agLYZRa4nXqy5S3BKyqmMVsmRuViZ/dUPFU32SvinM2XqyqSsD
 jB7DIDz8Tc6nx4jsNUZUYphu8voCgnkmzi5iVmfk401dPzmQGLYv6EFANE8lQa5JaYYlqazmCUQ
 eQX+5I0GcpOJKqiWvwVwrx4bGx2pR0L3+Yf7d6EmkLZ+r91xhw1Xt4IaB/IId6gvOpmv6xnSL8b
 5facFFvzwfCsLkd7lsvJ33I8zFOurZLr7P3iS3QYolRebOv8DLiBlmj5V3iI/aQxKq/J3gOFAs9
 XG6BPmehsQuvRpL1Xmg==
X-Proofpoint-ORIG-GUID: ADKuIkHjPsUPbKM1cWC1AxX7ssdrVaMo
X-Proofpoint-GUID: ADKuIkHjPsUPbKM1cWC1AxX7ssdrVaMo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX0hXD/5nqBy+K
 RBXjtk7r0VpmWj7+/R69o3mfzCJyjO/CnhP3YGLqFmYt9op9T4dLUA7XUb+Vdu8T9sY46k8KEzS
 t3odOO7TEGHRQHKNE5NFcuxvKgQP/tA=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af28e19 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100013

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..852a1142100f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3132,6 +3132,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1

