Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC77F395AD1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369291; cv=none; b=en2dIkIutzE5VY4d+8pqN2R7BVf1MMk8rT6ZoBcLa8NriFTibZQIysiEPwRB6v0uMiE6vxLGwWUx8z0nLAUEZNfve6tfDwaxrgkdTeAOj/V2nxr1EwzCqwa/BzBEn6rcsj1Exv445XLs/+ZzEWh4iEPQeC+QPZjtRg81EGfMcog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369291; c=relaxed/simple;
	bh=OWFye6SIF+UnzHlpj/NXxpFD9oJT6W2y+uiXFKJFwuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JtRXdVr0d+goeosFHDhh++z0nk7ZbK34nHwGC3xM6bJ/YLqPY7Oagcy7ndgc8/Rg5EcJ+0aImeD1X7elR820Hp3kbRLZ9SlyEfnyfIn7XX+hdrvrJnzyI2nNFzDJViD2h49u2pfhaJz3hPqNfVMlyDRG7lpD8bVzyE//VNce+QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0qVs0Cj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbqpJDdf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0qVs0Cj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbqpJDdf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j4wp2628351
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWm9FpdxhsiSeiVC9YPwc5/oMB/0t7X6Bgxd//+LRoY=; b=j0qVs0Cjf4aGmZbn
	vsdBtVdWy0K520OiGIuqkdvBZSeC+RIU9MSrg0b9rbXONTw3qUXjWb266NitMa62
	ctHJZ51Kx9CJjv+Savjvg6AnPUHSg0PrS39ewt5E+ijQB8E9458s9SYthGoYIrOe
	YTyDMLGcozjAqkcHJtpgTMfFi5n4AzXKbKMfYEpZkeT8KwR5M1S/ZtWXLwZ527GC
	Qm6P4+oixxkIhgY/FcvbYtofoKerGkivxg9CJRhSFomPMfGMpAwP3hqunh+JFd6l
	yBZMPP5fkMVc0jTKOKgkSyXH50DzuU87QKfQYK3pEP7+unrxWdv4kzk6cn6NC9Hd
	yna2SQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh59me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d959904658so51437735ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369288; x=1789974088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWm9FpdxhsiSeiVC9YPwc5/oMB/0t7X6Bgxd//+LRoY=;
        b=YbqpJDdfysoFPqYyYGnAp7AZjXs6uNHc/Rw4hFeAMlmPlO7pFU7nXzQ30AokJcA0wl
         b59d0/jpntH15eoHtILR8d4B745Cd/HDtkwu8OWZBiXG0b8sMEg/g+OzDMC1m6nyAYhZ
         lHvx8jVB7M4eii07sygq1JMfIrDwlBus9JTQh31F8CcSdkBsyHGnT2xuG4qiWRP4TWzZ
         RF1BAm+J4Yi61//GLALf6MzSSHl5c4GR27IIJiPisGWdZsIvteindItqRJgOhBVFlWjf
         AqOgoZAQyNfR/idrByASFN6wN6bzOCnEe5OjIw6vIDp1GDJYA/WzsRNZ28dx2Ie/3eSc
         hsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369288; x=1789974088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWm9FpdxhsiSeiVC9YPwc5/oMB/0t7X6Bgxd//+LRoY=;
        b=AC+U6H7ai3z1PYHfnhWdinHF802VZyQVgMmY/dXBDd+QPw9f+3l4KrC6BCyukwjDeG
         s8pp5ux60fvqMDn83iaYTYgmdlljchcxaRQsXcZXy1VpgJziq1Oo7bplpru3i4q/iaFK
         1guit7wWI+X4N0Hq7r83r7FvSNvEuE2cI/PHDVbHGZ87U5l6kxsz96auLUpdNFR1m0d5
         TtvNNBd+UiliuPr3FzKKG8g/Q/cjuKgAfT/k1sxLGBGTksgpQN4e4V/TYwoprd6hZ1yQ
         pF4iaQRpLnKm1HzEtqM/2TVFbuFfHkl9DwKTy+wJDAXn7VW16E+59Sj54DTF0Gw/hzwt
         zEZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVg133C2MB4yr7vwV4YSlhdXH0MkwzujultdqfbjUGoUJloesgOuJLnfoTyY4wziGWpAHE0lzVKtwTw4I=@vger.kernel.org
X-Gm-Message-State: AFuF++kOKpfLfF9QtN7mW3nARRPmpUQg5micckdQhS9cmKiI22pM3B4O
	siNX07EDu89QnT3J9hO5IERKQXe96Vg4unBUI/5VRcT2dCI9+FBMDWn+e7xh123alwIiO7NaOIx
	Qt3c8/n9JEUZFCE8BQLT+aiFMRCQk1SeQW4Yz4T509ZDhTmrMHaOd89H7LFu/ZfOCrFY=
X-Gm-Gg: AYBFou32YnuNimR8S5k6R3leGvPvCJWxitshKs47sNKX5hw18rJqoEqMsDovFnJFNre
	vrzWwHCsC9eDfkqsa97Y6/TQk6lleDYxqfIoqFYncRXJrw15vl9liqaW3GLkI8qdDthQ5GjU+M3
	3SqvE1JVl3QkUkSkR5/RPyEACO7QWl7egj8A+IPINJ5rz7ILVmnUpwRM5nIveRP+4vEXwBc3Fc9
	pEWB3M8i2WOvHC2h5oADH/59daPDrQ/buwNzd/RuAEZwksCofg+qPYN9KfYLzKmpQP1r1E+cONs
	1YME4WDO+e2rj4NIMAjfNJ5LiRWDKYU3I49/iRXuNTPNtvobhQmI56AJKfeGM3bBMy0xHDv4Z5s
	IEba5wEGy0gOcGZjj/3Ab9PX98J7O
X-Received: by 2002:a17:903:3805:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2dd6c5bfba0mr28468185ad.2.1789369288210;
        Mon, 14 Sep 2026 00:01:28 -0700 (PDT)
X-Received: by 2002:a17:903:3805:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2dd6c5bfba0mr28467285ad.2.1789369287726;
        Mon, 14 Sep 2026 00:01:27 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:27 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:52 +0530
Subject: [PATCH 20/31] arm64: dts: qcom: agatti: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-20-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=807;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=OWFye6SIF+UnzHlpj/NXxpFD9oJT6W2y+uiXFKJFwuk=;
 b=BOarSMTg6QUkU349Yjl+X1Y3q5uv/2wneJx9e8bqYEs+glbAHqcuxRu8FAf5DArXz58skz9TJ
 BoxiT+jvzUsDnF96I/MX3ewKud6PMVLftLp8faH8iDzk031L4y+6nD8
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: CyoGyva7E-c6IoM29Tgt7dZbdwWMYOs4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX/YMaN8BxlHME
 15NsNDGZnLI++XQ5zftayG5hkbtxfNTZ8m5ZieHLMdgxR3FgVj83RmYFGETqth0cSwtuxrqBUPk
 OXgF0ZjdsqQy5cpiGMagyvoRfQEqNlH1Vk+PcGw8cfC0C5m42NYqBF3leYjolRICu66ObcvQA+o
 L9+0JXfmKz1nMBEHcIZUP0KEXpOaD9Y3GdKYJi23aEgQiBRGaW2BOknocGnCLpxVQDVmFoHzc6E
 zvyhMORxXvc3fCQdRsqUZppTNBsHHH5I2a2xQspZ8VaFF3OPkG7Qey+6XbwBvGdpjRnJwVsr0Zn
 Co6V9ZULfXCkuS0HfZ/kcWOM3FhFHXqwtoZD1SZ+Njbes9gB7yCsa/t7WQSL35K6eJybDg+nbep
 UqKB+XFXFzVFeWs2nA7TaVJOu8D+8A2jiPO6ogu4/gkN74DYFtVivZkynA8tzQh9qwzt7oD93ps
 i7nkP6fTkomJ1krwGWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX+1iXTFS2D/A9
 xC/4kVMlzx20zCydh8p3VPyqLNKzQDxrZMURc80Hpemwr+LUMVXxNFCdaeBdfWx247NAFHdobxs
 V+IA7jK8F1hy2QSGOIvpYkLh+QcoV9M=
X-Proofpoint-ORIG-GUID: CyoGyva7E-c6IoM29Tgt7dZbdwWMYOs4
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa79bc9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rGjSKMGomevJ4fbcliYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index e7fed60a59d9..c226ef4aeed7 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -130,6 +130,7 @@ core3 {
 		domain-idle-states {
 			cluster_sleep: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l2-pc";
 				arm,psci-suspend-param = <0x41000043>;
 				entry-latency-us = <800>;
 				exit-latency-us = <2118>;

-- 
2.43.0

