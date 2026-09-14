Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D743AFD19
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369266; cv=none; b=hyuSvQ6FNY/nvvF285+hdLNivVPALUdqYwvDxFLu5mj/cqPcHrmKlqdMUMyQ7kEhZ4yNUEuNukNu3gmhnoZ8FQnAmNroBppNHt4uCufwe6Xs7pdtzsl9fKZ7dr/QI3iMq6wu7utuPsJWWw/VN+RyMNe++1jcTJT4oNasg+45EQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369266; c=relaxed/simple;
	bh=K5l62XdMWnRy0q5fKR/rOgkLSu12k+HELp7Xu8abHi0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jHep2Se3ACVusbadDZHkm2risr6LH1GxeAQm1R2fHqjJi1JI6xi4uXTXkRYYfQn1s2OtuExzpQrHD7KBCn52nBKnBIws0/ZGfHwIKD8ktyOXpo7HCe/dC3HOXR9OnOhbhMPvm+sZbwe804AtQ1ipDrwkHoWEq/OI0URYMxLzoBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gn3JssHi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YItDg9lE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gn3JssHi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YItDg9lE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5isWJ3901319
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T88OVQ89MrHgKnM7cXfNL4oaePaLGF7m0GMkc+7rX6I=; b=Gn3JssHizGij43aa
	b4/x6iiks2x0WHqqHBhrasnQqQOAvWRpXs1iCavFYSku+iYx+et3LY9r0apDJf87
	8lSyc6whxA+5tfHnt18ZfZoGbss25bl4e9KQw7EtEysL2aa7JyO/kr9n6Vl/9pXo
	CIlWMAGN4244o3u3rNqlt7t1KxHsWXSj+NRJBcckDad6sm5+Op7orPv5bvf/cd0R
	suk7BGHb2GvJjlPiM2YQmN/VzeXR0LLV+Rb1W2WvnViZ+1p4LxxWKcEQisQl1mty
	9iVVANIcfjcPCgWrz169SJ7+xPcMc+1VZy4HGEDJHbrVZb3VKefChHA3H0Z8vQrx
	6IONUQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5d4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:03 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f4fa572ba2so1562952a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369262; x=1789974062; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T88OVQ89MrHgKnM7cXfNL4oaePaLGF7m0GMkc+7rX6I=;
        b=YItDg9lE2OJ3XZGvdPx91oY2nv6QPZqPmIAvZx3C+E+NUaYaGExtwi4oMgzeLulMoM
         UaGi1PV9ABSEKKvqaP7vwAu7G0osf8FKHmTJP5BwL6aOH4GkKkJc9okshNZe8AYg7POs
         pjdvC8K35dxRnTSP9Vcf/+BhulAEANYEm3Wo9A1usnxGGQD831QuxavQH0TteKPnsRf7
         TDnhQ5uUP4D3tKX0gsn6P7O3SMAvyWihtY6O0RXWXMWx5wBFYYkckaVynzOjJDzTk8ia
         NK4DNS1jEQkS96D/2jg7dXbGHod8EZ6BNzYAtMJKfzlIuXe5oeL1zXHzFLB4Sg7Wqd9D
         B8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369262; x=1789974062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T88OVQ89MrHgKnM7cXfNL4oaePaLGF7m0GMkc+7rX6I=;
        b=df/+jBqoRhUPeWqdbsNAJnUMucPjHh1kr5kuvW2RIXwibxAWP4j3Ina3MjbwhUmP/B
         MJQ5pFCIZ5uG+BAxRNYIr/d4o0XoADxbnk2HXXCa6m/R/NfondlGIjJ90WoeUyZheDfS
         INpzCtBBsxfYHFJ2G+QwmW+ZS+zl5hRYXBHR9/rK9YswJxIZdEGz+Asp17ABgTuGWWeZ
         VrcaVTXEGihCN+GvprgLeRFfc3n9gNmMjMqANeQ7xb0Cl7n2FDjok4neHxwCXxxte+Zs
         pzhE0KOu03O07EN7RY6Ujk3NvPfEJ2VztYMy9erxnUwYahgfRyaPTbQ8X99XXDECxaIE
         T5/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzEAfv0F9UMcqguCbe10HBdX8CaaS92r5n98ly2Y/8F5i0a4NoT6QcqFpXWbAXD2b2VUerNY1SbnfC/yA8=@vger.kernel.org
X-Gm-Message-State: AFuF++lhoIhWVGOv7BAkd45kXYK/6nPXJXcLDnxyQ3kw7zcdAd0yAnut
	Y37U3Ka9a09eBBlkVY56TEMkG6Iw13l8+bzvjIvewi2+bWqTL15nNlBFQ+O4ZqyqlqXdQGtt068
	QfnPe5HBegGNV4H6Twd2gwIlN43pFIisfs5LD+009ALdpuNXy4Zkuq13jEkJh1dZlS2jOBONabt
	4=
X-Gm-Gg: AYBFou3QelLqSQX3NFzmGegau+rhQWRVDgQFI1mhvCcO+eeITmR3FHjKPUEx3wy7P9J
	ooi+c/G+WY0lvo/HsMhjKODzDrCkIAiD5hoDkv7L4tJLyisc4eqG+4jjhj0vNxkmp4GzuLIrX3R
	hyogzrb3W2rdeeJ9Op9LAU6xzgCUsFVRJq8JjX2aZRJMR+KT9X7OpiNIsSC/KjBpBuIsAKidVTY
	0cNf9/nR0VOjBsvDXQyP3YHLZN+8DXedO8N4fJOO3KDM8gbADYDfLzSsJTRVLiAeVDQu2Bkk5MX
	8KaFoU73KUe9tshsXii6kxMdNJYKsEAmKekYaN13gWfX3O3N3kE9Sf9jQzjKwemmeiJERgk1kXo
	/HRxfvLShS6ODwBroR9w3GTMiDtu6
X-Received: by 2002:a05:6830:438e:b0:7fa:5c68:d04e with SMTP id 46e09a7af769-80899e58bbbmr438577a34.24.1789369262353;
        Mon, 14 Sep 2026 00:01:02 -0700 (PDT)
X-Received: by 2002:a05:6830:438e:b0:7fa:5c68:d04e with SMTP id 46e09a7af769-80899e58bbbmr438541a34.24.1789369261893;
        Mon, 14 Sep 2026 00:01:01 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:01 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:47 +0530
Subject: [PATCH 15/31] arm64: dts: qcom: sm8350: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-15-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1913;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=K5l62XdMWnRy0q5fKR/rOgkLSu12k+HELp7Xu8abHi0=;
 b=9SOIRB1aAH4OtB7ANH/JKuxIxKZwx9YKwgJuiDwZdUbX+QV9m4090eqkQ+rcGn9S6djnMHN/V
 0MrI3acu+Z1BfT/MA9FDvaJyhryqhC+24SkpJZso+EoJKEVihB10A38
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX0pyAEZz4w+Nk
 1UrK9szJDJlznI6UINLEj1rnkWpeJEAs8/iXW5bAO9qeAW9RBPHoyt16gH5lU16+cqbpz8wpg/b
 8BEayBHQYx8C5YyeW+aW5yevxvH7u0M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX4sHpM7kFsBWb
 ghs1hbrkmOYM6DW50fzyzP4zsexvxc+c3X8EvPTGyCn9+R8ZO6tuY5IwYQtCtHhrcm6gXML0/a/
 9k4eTR9lzxKTsM6fbkw8cNJzZPM1kRh7PCQ9qhoxbq0CV7A8vLSjzPuDe8V6r20WknuHNTXoD2S
 mTMEOHfm4siJcNOCyiirG7zgRe45STICOUgY8buoUTI4Zan9tVlBT9o42uEKTMt1oG3Cta0UJ3m
 nXGyu4k7S75va/ZaFqhoppeWLsVAVu42mAQsU5G3/yDDHTeqKuawI5erzOj3uvqadkXekfqtzEo
 bji3DBdNS2NR5Ds9t1SFvSZ1fyJPbX/j7HG9s/owVQpsrPr/guJNp1M4NqH73cjCWhFFKCX9GM4
 MN36KsxJtxIxnwrDuiYd+TIZl5uuB1ScbIFpdP6HNEpYRv/rEK721o01lZc92ztelCbqqoMKVAO
 8eyvkAqGyba+RFSy6fQ==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa79baf cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JPxaeZxcs0fqC_IBZ4gA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: j09ra0_YSb--l9b4cZdZjznrRHoCsJGr
X-Proofpoint-GUID: j09ra0_YSb--l9b4cZdZjznrRHoCsJGr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 100faea925a3..6cb694be6fe7 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -252,7 +252,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <360>;
 				exit-latency-us = <531>;
@@ -262,7 +262,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-pll-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <702>;
 				exit-latency-us = <1061>;
@@ -274,6 +274,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_apss_off: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2752>;
 				exit-latency-us = <3048>;
@@ -282,6 +283,7 @@ cluster_sleep_apss_off: cluster-sleep-0 {
 
 			cluster_sleep_aoss_sleep: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;

-- 
2.43.0

