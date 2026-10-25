Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898266;
	b=px+s64KDP+DYQh1/qIMRLxP8LO+WfrUGzXVQ8mmYmjoFUj/CUekuVYPVpLcEoa1UNzkI
	 YF7c0CLyb4nGxWzsJAqRU1DN2WSsR8isVRSCkn5R9lu8ySewdkV4FC/sB25wHR8jJL+af
	 EUAVYIlTJkuMPA5TKxUZspdrPk8LEKvF16o2sFqorpeFDadzLbbkd6YnL42epM9W7VrKx
	 kpITCMfCXm+Bg6BM+d8y0L8vUoYHDrGIF3ps+99KRg5oX6iJg6R9KoXWtcdqP0DCMRjLR
	 PRu+Ncr+n6f4ra6Ae2YQmujvuY22w5zF97VRJEFjw+KrRIQvQSRK8kCwl3sBv9GJHhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898266;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m/9ymwYLRuEiPenWIgoB1XidxNxPS22dZ2PmvmlaXa4=;
	b=JCDZq9v04gWx5mSFGtpJzViX0FGiKy9BoiSs614L9kiPOSPYGufs5+B/Eex9JhboMZCY
	 Xaa5Wt8Zw6XUUs6Vn4HVNjvhVnuHsgVn8tApWlZqj+Vd54dVywUwknblSaE6q1kn0GCME
	 TGyJxPfwn3pP9nEXK10/saJ3AS8ArRhupSJgm5eR+rrNvcvxvqQ5qFl9rcBF8gCuS0soB
	 MqNEfFa/0IPPjiKD2YfduM5RFO+iB0MaD3o6W0fzSzTc166TwE7C3fi3XBTg6Ffp1hqHM
	 Syr5dA0EaIXjikGHDIiM4+4RFXpqKD7slJVujD2RsUeI3gFtIZDxsA7HgPTYL+ItJBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QYyXW6bU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZ5MKTeg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9043760A2628
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9043760A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QYyXW6bU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZ5MKTeg
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P17JCX4169205
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m/9ymwYLRuEiPenWIgoB1XidxNxPS22dZ2PmvmlaXa4=; b=QYyXW6bUTbcrcDDy
	7ohIzlCQ6Vsbe0dQN8fgBCEoiWRLCwoeNXH0awws9PjgHDTAO1kXxU1ThUeTiHur
	Kojc5pY2dxAtxrnu+yS1Z0t+G2YRgJFYKVWnTM7RmukUcmpG9y2Alnfsq2PKFImm
	LoSqFcG/+niGmH/BcStLHvKwaWwmfyVq6TpAOqwvr4d+9fFnWZhiFkXLaH9DpS6f
	7fbIDdF6+MzC5tyDjM7uHtacGohUCVg/x60aPhvzM1ijL63IJ9PStXV6Qnv76Jeq
	XpXepZ6s4hMWPBJ64+OIfDygBA5tY1Y1wTeT2uHG9HICZl1JEnRfk5LWoZ1mQy3I
	4QNrzg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkmsae9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so10033633eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898259; x=1793503059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/9ymwYLRuEiPenWIgoB1XidxNxPS22dZ2PmvmlaXa4=;
        b=bZ5MKTegq6nR69TiNuP8efnQ6by831nRuoWGBDinzj/w/7kNE+LhAVMWKQraJ3Cjgi
         6aUeF2gSWmkofC3mbwRcKmaVJOIOR5Fv2pLE/KdeGUQL8cmZE1vOzv89DoRejf8c3N14
         B2hzMruIt1kz7MMqWE+VpztgePE4sfok6nlmpOht8xvZ0CC9NhjNEWZR9gCqMXqbL96N
         TaHBl2k/wDupQcv71zD32JjMTh4STh/A0uM8c5+9oKCJDt18v5yc4fcwV3yESgabEinK
         57FXaUH9WH7NVlB29A7mv3Y6FdToWlZaws8sUhHwtITNM+DblVzMbYsN38K9EMD8xmwJ
         yUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898259; x=1793503059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/9ymwYLRuEiPenWIgoB1XidxNxPS22dZ2PmvmlaXa4=;
        b=WxtHD+U1KmzjQUJOJSU/E9VEE3Ov5Ofm1/VPO+a8fz/8J3LifJgosEaENOHcupAKAU
         pfMhhJtAxqw4h9iB++YB4qQymzMCoRReUZMjUS5L+S6TuXXs4khb0BjnlJqX/FLMFXq3
         kzj1jhxDMwtDU7rjfzwIJkiFCEyrV5MtcmYsMqq727aqbGdcl1Xw5Ypkmm3G2qk2zjyN
         Lw/oavAlFD2GfiIRl77nKkVCVHkzJzRIap8Qamtia+ee72GNs2PFQgDZnVk0BOwmsiux
         SpnD5PYIvbVm9HoNTzW9k3nEjxJEs8z5MHWIKVPbpC3mWpwhUTlBWlP+fgz6HTa/+Bs5
         646A==
X-Forwarded-Encrypted: i=1; AKwUvBwSGqacib4Y8rbtgFkkWVz16dK22RGKE7mRI9Qeg74Bs2GnF7tmMzCiaqXQiKIcoS/CP37QXuxhLIMSYFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIt7NB6xufsNqb/2NHJWEHuP0h6jfTq1pI1tb5j6lJrQBT9X4zr
	zuBScDKPHZU2c7QSzKnwAs8xSWbuv8u/0yKOZLgJ9PRRNgQLQ0rVQa1ZjBvC9jk5FCuDg7HTCSb
	MgQO7RBKXfMFJ0dZgkcoiyCJqmJaJ+ike9FLq97KCKEOfhKr5KyY0SB4ayVh5v2FvhzU=
X-Gm-Gg: AYBFou2/iKqIsUH1B6JRgeVN2LzhkWQfUjXJ3ZItyT6cIPtf8Ylz6EL2zBsxXAGjAIA
	p2/GUzBRncocW9HwoVJcqvYWgYohR+HKz5E1ips19KSm9Hjt0gitTLg4MjE8LM02HHB732oj60Y
	wpkydVyV3Z+M/ybg45SKWJgUPtwfYjKW8pLNPaxrcOjkioIQzFayWcOzBTW7oaMvUWljjdEXJa6
	Ki5TtqPjIWs+pNEB2FuvuWiOB7i5EO69iG4tBuVWTtLkEs8w/NDobrkBBvLqmiKVD+NOd3TAh8s
	qPBJ24egQzuYlOK9AqrpGCPBChXacgzx6we3FCfCCvCwdJTCGaJu5CHNOf1mumCFfs4WEDqLtnM
	jKfx0FwIuCrZw3DXrQ5Gqy0dOfhOsJz/29RF6ijmFpXG2nqnuHYdXuTWdGWdoU1nQ8LHkzGAmBx
	XZo2HyRj7NdA==
X-Received: by 2002:a05:7301:2b06:b0:360:db68:3264 with SMTP id 5a478bee46e88-369e848b8a6mr7537523eec.6.1792898259157;
        Sat, 24 Oct 2026 20:17:39 -0700 (PDT)
X-Received: by 2002:a05:7301:2b06:b0:360:db68:3264 with SMTP id 5a478bee46e88-369e848b8a6mr7537473eec.6.1792898258482;
        Sat, 24 Oct 2026 20:17:38 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:38 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:32 -0700
Subject: [PATCH v22 13/14] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
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
Message-Id: <20261024-kaanapali-camss-v22-13-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: 37Z9_5YzSJZOmAz7b2x1FhS7qWbgiwfa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX275USuEDO3IX
 a95eid1dmenEaXgG/XhmogU7c3ruahfv9TLwJrsHEb0MJ6W6zBwfacp3vqwKOYCHeuOqNhD7Ex6
 W0IGAaW6OlklAkparGb0DarKUPHNyCYcSP1dcs2HLSg96ahlWqYICFyqsdme/VghRUTr4Eq/Tsz
 NExupib3goVjnXk8P5blhXeHHeu7PHPsV8ef68akUPPaLlNBkaZZP0hO0EL8Uf9q+xrqogbPXxA
 9JkB9mPDJ3yeXND+ZQvXdjTF2jkkBRiE6d1hN+JoGyFXw6efZv3gvClimC8pzf3EOgetYOya8wq
 8o3SeXMvqjPqzPLgwCKDYbZAfyLMxZ6Tq+Pgprw2xDtCp2fouFrzucWafogDM2MJjmpZ9BJxCHd
 F3wlSdNjKbFruRd5TPzxNkAMEXlrc6J04loRqxNIrrIJlxm/la0U9TyGNCaoaxvdWX4Rd3GAvO9
 3guPrqnVqQc5+NUUFqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX0ror0G17g55Z
 6Nyb6ePjG/i4t7etGsu45Rh+8wLK6q2CmDapuxs5Za1nQinAE77dvSytnhXpLfkfE9QlMUIL9uI
 44IRHU72q/R7az/BILJbNxF5lGP4iPw=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6add74d3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 37Z9_5YzSJZOmAz7b2x1FhS7qWbgiwfa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610250012

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 86dc1400a25e..e94fa2ba3dad 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4645,6 +4645,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_i2c0_default: cci0-i2c0-default-state {
 				scl-pins {
 					pins = "gpio110";

-- 
2.34.1

