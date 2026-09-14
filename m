Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2B2377560
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369239; cv=none; b=XuBaZfIOV+DMmZQVlHg7WvrjwqyT3LDoia9KrYIBR4vpQD+jhkvEyT6hSzkPojqXXMHP4k7u2kAb+E9thffGhoKUZPK5CKD+nFTw8cmLZYuYEf1gZ0ijTnzIzeswRGyibFXj6106zvZ5bbcyy1kybB1liv86lrjbI9rV6PvMu00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369239; c=relaxed/simple;
	bh=d+nxcZaJXyBiNmpgm/0+8neT46D9tfeM4KigVln2Cnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rzufHc/RWXQCDAG4+U40u3IqJGJE1y0fRGZUIYcoTsG0ipVCsFjvSVxAJAS0vUaZPx428Wj20AvCOVwr4uTaGm8GxxGmm4qTa8huUbxK+L1Ms4LamGLr7iMY0YRt0o2/Oz4iSPI7PsG1kx/+NBDy+KmIvj0TvKek2EGsu8PfjcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eb9MBawa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bYXj6bb6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eb9MBawa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bYXj6bb6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ikQD3196153
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cikvMWI5Z6bstJ9eTi7GFHzo1B5Z0fx94o90BusHGhk=; b=eb9MBawal/oSQo6h
	6hD0Kc8aARpbARfzkoRxyTR+mkKRzBuqES2HgBcqpou5TfEzjVYtbzexx2s1MbN+
	+Cl2l5Gb50SCZlVL9niPGgm0HCRJgd4LZUqL+EYYBKZMt55VtgcUK2K1hhM6VDgM
	mXLaEjefBS/Arj4mQw/qG5HjY3WAJshi9xhv+MlYYWzRADGy37szgpO3wELYR7pa
	/4eZOIguLyBx2/emgwamtFMYVRbwa3LApZQJ7Zz4pVr8H9DQ1B8mzYfvVPhjaKOC
	r2Th4i8qU+i7c63w5TDV8Z+Ath5Y0cNTwpw1W6pdNac7Ye3zubzdaBvw2EWXEUIp
	jVbBsQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cdd9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so4262359a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369226; x=1789974026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cikvMWI5Z6bstJ9eTi7GFHzo1B5Z0fx94o90BusHGhk=;
        b=bYXj6bb6YMX01EY077er9hU478ONRLfAEhkcRUhtNGyxkmMTOM9j0oe3D/fuYKGDhS
         z+/CgJ0Dj0mX9lktk64HQz47LmugziFxKpfDRNKP2HP0L25BvtzqewRH+OTiSoa5nl0U
         naBB1gfVhre4mSwrPDG5WRcW8YBpssyCTml0ZVUJu9eDrGBtMtuPrCUAsoR4unCjBDeK
         Rt5KuMFxBWcn4dIN0weMYMeJh7SJBid0LeyJJjFLNPDVq0Apw3aRVo7j3Jr6CLjL1575
         d52gPUkost9XeMfqUuIqGdQs5gikH0k462Kk1T0CY+dluJuq7wFgVFC2aHjm/h44a82z
         lGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369226; x=1789974026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cikvMWI5Z6bstJ9eTi7GFHzo1B5Z0fx94o90BusHGhk=;
        b=bIIgyQSNILwRoThC3yEvUSbDpKpfqMfmzLExVQcegt7PeHuRZJagdXy+MJ6Fwx5UqD
         DO4Ra8/BTRy0ijqgfO9HtA7JwJsWtl5gMoyHadVx08nnrQPKrPeSHU4NhTpBBN3EXjQD
         sXBpkuv9X9og4F4OxSwL6KZyZFagCVwskvybB8T2/4VRBGcVFJscu0i39tIt5cmVHfGV
         TuGbO8XBteq47X1Ph25BOIW8JP6CA4mIMxWIMArBTeTVhPOtGRa7qRdsdHxfHBfTRsaH
         zN90+1LnSAxYCCI5XtSa/jfU6OBNgMobKngASAUgWMI/5soyVjk+Ji+BgmoioLErfIIn
         3rOw==
X-Forwarded-Encrypted: i=1; AKwUvByX8RWUB1pOiv9cIOcW+iuKHXYyI5VGLB69n8KMREMOAOqZHNNpjalj/sonE9gZ3bDVYpi84Zxw+U2WtvU=@vger.kernel.org
X-Gm-Message-State: AFuF++naMimUIzCUYkjfvx1XJeLvM6/KqECMDr2oLn+2re7DmvGj91C3
	mljn6orXrsyNUtJ9+4+aQyDpKMRag50/iCmCvHqSXnH0aChnKKCvTrB9kDC1C2tIvCqGrVooIMw
	aVxMNiRcp46yDhtHljHALV6acI634Gl3FtC5zS5dm78E2JlJ6h/3TOjSU6TD+3KcwziA=
X-Gm-Gg: AYBFou00yfnBiARBXjCFC153nJiaRqcoCjD25fGxMUnCroubeQMulpPYSN65jX0/oBF
	uTZ1iqvqtBJ/9PimO7e9pTmOEXjkI7y5EODhVMkZ4xcbdn3Lmr15hd3DF6UC/AgjlR0oZVEfIzQ
	1rEULHkQckZo7/AaliOXBfxisSGYnWWRaUsWWXtOFSxZYI6+Z1uVZIotUmFVX3gScj/5ZFmF7nv
	+20IIfgn0+7HOe4diDm1RzwrU4xHki5sjJbOeftejt6mSrTD9ddzYGsvRHhnkh/TF6uc5BqiXKv
	MNwFQfbvesQ73mwtVTt1iAUoW9mdd+0D0BmgWbGvZ+eJ6DR+unJSwS+JnNmJtw50q1/D/AMHczD
	VQA0vmhNybQLuCrgkRl644pJZPKM2
X-Received: by 2002:a17:90b:2c88:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39dec0c97f1mr3106609a91.20.1789369226140;
        Mon, 14 Sep 2026 00:00:26 -0700 (PDT)
X-Received: by 2002:a17:90b:2c88:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39dec0c97f1mr3106460a91.20.1789369225409;
        Mon, 14 Sep 2026 00:00:25 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:25 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:40 +0530
Subject: [PATCH 08/31] arm64: dts: qcom: sdm670: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-8-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1602;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=d+nxcZaJXyBiNmpgm/0+8neT46D9tfeM4KigVln2Cnk=;
 b=/EmaEEwQzujOd2dfTdskvCSGmKK47barw+wLlotCaPd7lHDsMDZcmlf8qsE5RZLt2zHlix+7z
 DmjelfHWELsBSzBf+6z5UUb+xRYLRtAiSLSE/7MeHD0luSHCs6JTgFS
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: zxhvwoMZ3DYKSmVKHTSpE1ROih4kqaqv
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa79b8b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xA_MiKJNHriC2EwIB0QA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX5xibOfakgAGP
 Hu1WvnH25Wzg1UKX0fYSDxaO4Xw+6H+QqnVfHnGmHHA8tTlLaz5e6RamR1kr5z6etHUO/XNYqTy
 I9kS/pCunUcleMqmPzkhRJhmMYRbj+c=
X-Proofpoint-ORIG-GUID: zxhvwoMZ3DYKSmVKHTSpE1ROih4kqaqv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX+1Zh+c61tqcW
 jOu8mVOEZXsDLTvDCFJDXbQwh+v/oxn0OgEN8xzMyPsQF0c1t5htfjlAjRl8k+cW5KXrMe3eMSZ
 YAxXOwQWYUrI3z2guTaYy6gT9PqMKdGY6DZGcBvUbWRS52H9LGsQc9VtjNefRQGPL+KJLE/zhCj
 gEdKSpooUDAr3IzvAKXEi4fVR8+dyWjVKBMsLyMN8ktZwZ2oaqvkVjMlewdiSILTHAjbqCxonLb
 d6zAyN/4wd7zZPdXEd5FL6D3+hJH6MO7gxLS/tZeUq8+g6ktjfkC4BxIUx1AiLtAiAJWiD4Rm/p
 vHJFMmS9KP53lzxPlsTOVeWcfFMZvdOR55sWYLH1AUTxqHd0fQctQLwlvwd7FRs4EIBHkQbXrUx
 moKJt2ExpLoJKYQWBNGbAIIVG1NKjA/z/AZbFeRYQqTdOoAw7Sk7tXjX56WWBY4mUC5l7tcAMFF
 cgMsRpX3OHGySVxB+Lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 5c60ea36f04a..1fae9bf16120 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -271,7 +271,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "little-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <702>;
 				exit-latency-us = <915>;
@@ -281,7 +281,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "big-rail-power-collapse";
+				idle-state-name = "gold-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <526>;
 				exit-latency-us = <1854>;
@@ -293,6 +293,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c244>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;

-- 
2.43.0

