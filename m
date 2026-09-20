Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CFB3E8C78
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789895478; cv=none; b=J/yqsTvDwt01ltNiO34b7m3cObVKVjrx3HSZrDtQuufv7ilXXB82ZC9HoUuausSqZziMmRVK+ZRRxEklSjnFoOAktz5hzlvHa2d0Afwoux6OqGeHr0HhnQ8Xv8UdbfYQEw1WvRaUF3ADDR9VuWrsELW6+ULDdsoxsd/rAI4eZ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789895478; c=relaxed/simple;
	bh=vPB+IKWkyYLVK/HIwA8GBqyA/TjQ4UguCmaAsumcsGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pBfjMNbTKBbvSKo3bnJeSC+xkdFyyHZUY3ufTB3S7O+oDjH/T40mIl6sBtXVVU2RuZnNeg6k/NyPPtsg0TtgYliZGouI35vyBU6m5tt8LNaW7LpYKm34wTbftGIGae/Z1OyGwzVzHz0Z4QcN6DI2O4fA9USTN3wG/rpMWHrkIHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RgqB9WbN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UPhgNOpZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RgqB9WbN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UPhgNOpZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8Ve1U1242595
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JM/TzULn9Zo
	9jMZeBxqgPBCbcsnVao1kQaEPNgl/ZaE=; b=RgqB9WbNwWq3xcmeXkdwDuGw7jW
	HU0o8ozXTexpd+kvEiqjI12oUcyRF5bsgdQmLz7OzCR/c+pFj3bU/nAiykNcW63g
	Eznn6dx3I7tBiRGwGYfRqLUVm8aKnHOsd4mR98aVWXwxnnzQXjrr0rnx5XxepJ44
	oBYXGSgFOCSRY38tckRIw7pOIdGwX5bhHEMk+/C5y9CnuN6+KqMoDd8THcVKPsFi
	JELJVoT5UAQS58Bnz+/VUWHfp0StkjYHNy1Ilt9Gw3ro6XK/A7H2KGuW72K5TEIJ
	3Bh2CyCsHBU1ixG3Yk333UOMeD6EQa8ZdpOtjB0kZW4+g1FJxDMMl0hyVRg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs82kgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:11:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc73ab90ae7so377089a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789895475; x=1790500275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JM/TzULn9Zo9jMZeBxqgPBCbcsnVao1kQaEPNgl/ZaE=;
        b=UPhgNOpZpYJCv/iPwcGFWMowHcA+PJetBUzMMpJ4SeuHASDZGb/Xuawd7ck5BhR8SY
         4q/RIcEoXPFTH1yKbRn3JCPi3zkwu3jrtgmr1eRTR0K1lumTlaAXXJiZGAbbKY6NlK9j
         g1kZ8oFEBMPUbEy0lKLi/A/rZploTDVqcakIQZ3gJHBKrGAFqqBBSvzrTQVU2AZK0ujn
         XyqTLi4l0BznBzR5HOMvnby1WcqvV947akLmfEh14u1M6OFjoUwTirAASSgrB+sTuZjU
         DJIqUIp5HXUNenuJTuIlwIkkhSiYGcWanU2ZrmcrAINGtGmQNtml7wa5zVPFjcpnfqpP
         9W1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789895475; x=1790500275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JM/TzULn9Zo9jMZeBxqgPBCbcsnVao1kQaEPNgl/ZaE=;
        b=srrj6UTl0+vkGigpFJr9h9XaoK1swWJmpipGzYZWD5Ny7ZYZzqf49mMnlo9htF2j0+
         fwHLp6BZys98ji5fsN2fB638fw0+dHgMHpwTid7xnuRQcH9PVzHAKKiFeR7bASrA63lZ
         auYkGr+as/uamEnjVk/w7TX1TCbpMHxHDqTLSNOmIPCL0D09hud+zuzW9ckOV9yeauET
         uQhl8sEdRBTFvjFb7HIar1sAVyc/NrdRILJjywQdM8XaNH14r1uTt3BNHGbwTmZKkJGQ
         WIXiqRy1NgEFTM1h8SGzmd8BKHXKM6Tt8rVPP5q2/1rgycoXCNTN+WppNGLsysOXXeDE
         5W8A==
X-Forwarded-Encrypted: i=1; AKwUvByzpRUhVnVLecEc54ecxmc5XvTTX52URyxD3ruLOs0shU5gqKAuKgy/s3iMf/yQCrjQ1JO2TfJaSVZDJL4=@vger.kernel.org
X-Gm-Message-State: AFuF++ns82jGqTOPTjUOQKO7IGi3X+dsc9EuZ5zm5uc4PbExC7u8ai0y
	SQbDGTLET7f8tZi/qd8iY/W8h7lwqZAX1wY/MwYgGm6kYk5Ymxd23Xqo0M7nb6BJJjPg+DfshwG
	Ju3BnGfJqZ6k/n0BL1uzT5Xl1paqdUIpMy96zrSGF/Z3Koq+N+gcs8JCx7KsJxuc0qgc=
X-Gm-Gg: AYBFou365wYBB6oP2HmFcVdT6nrWVEI+fh2JO0AdWSZyDwxmKjLsatyeHGOU0aeS6r/
	vrAj0X7ZxGRMCnOD3/PTY+CGnE/r7HJVwDgCiM73ZAFFHoeptsODw+5cPBfQQYpXDcoxj/rHSqu
	x7aMdE1uqKGuR4lQ42OZfG3rvpiTE393bAUFsZ4Nq5e6CJyYqoIfd11wIXWyAOvUfusmlYzGkFE
	uxccfWH5VahJ9ddpOmeYVc8ZX3IxteHtfuHFqyAe4uHUVzOAn8U1E8L70WE9BVBMBlVhzs8aYyj
	qsGPExR5XfddZcVMDaX1HbEQ56dm7iqTTaP8M/jN/E2MEjkWtdLkvxdcACds+aotf1cVUmRLhp1
	sTRKqPofBoGFwPwKh9A2sBb+8eYAvmbPQSlWEKRWOxk8puiTIrM0xogR7nLg=
X-Received: by 2002:a05:6a21:398d:b0:3dd:a006:ed92 with SMTP id adf61e73a8af0-3dda006ee1bmr6587590637.40.1789895475196;
        Sun, 20 Sep 2026 02:11:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:398d:b0:3dd:a006:ed92 with SMTP id adf61e73a8af0-3dda006ee1bmr6587570637.40.1789895474805;
        Sun, 20 Sep 2026 02:11:14 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3313d96esm10730242eec.12.2026.09.20.02.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:11:14 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: qcom: nord-rrd: Enable camss support
Date: Sun, 20 Sep 2026 17:10:52 +0800
Message-ID: <20260920091053.2214965-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920091053.2214965-1-shengchao.guo@oss.qualcomm.com>
References: <20260920091053.2214965-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rcRvLeRmFW6kFGEmp1GyFtJ6koP3Llcm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEzMSBTYWx0ZWRfX01PKwQeo3jux
 vFOYgxY2cN789RRiizofxn3MsPhs744yinhwmThiTNbQ9bH+R4WSru0wktfcquZFGoKj3bSdXOv
 ic7vBL4bp4e56iEBsFEUZF0MN+o4AZ0=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aafa334 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=9JaSISndomsK3UERfiwA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEzMSBTYWx0ZWRfX+BFOH58jFZ/3
 v0I97a66FYswof4K3EplaQfTuMar/M8hzghUWcJ7kgeyQG81bpXWE+rPjXLUB0lqW+zhjgiz3bm
 APDvXPp2o2t9MZ6BJxF/avRaKFef/JDRAdKmmey6JpoYqCLLycWeeBX9uKJRXHrX/27fXrhr8On
 FrnlQPfy4UbgaeuFdINkKO+/Jyswg/wqlg8yMpml24bONfis3zENGXzDPpxLZcefju0T50qopZI
 hTMFKfLofzQBTf9Sm1vvYRZDzFVRjZfkkjmZrIQrT64fptZixUxjxKfIt6ELQbl8+5Sa+LhOukm
 yi4dECRc+RYjp7vcnmtBoB1vL+DIlA7wo5kX/wUlAfmTrD3fGpIN7BdASvTS0jT4DlJ3F28p3/o
 zR6YYDitrlTBY+9L6iTJnoGg1jzG782v45GhZbCys4STVlEddX47Uc+tiCQGaTaDrhzGjDc36Ik
 I0TzuVKNCfTTH7UASMw==
X-Proofpoint-GUID: rcRvLeRmFW6kFGEmp1GyFtJ6koP3Llcm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200131

From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Enable camss support on the Nord RRD board.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index c547963371b4..aa126505a7d7 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -366,6 +366,10 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&camss {
+	status = "okay";
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 
-- 
2.43.0

