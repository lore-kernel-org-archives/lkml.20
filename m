Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F80048AE06
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246501; cv=none; b=OdLXSvTcyb8UEDTiBDJMiqeRDQtzQAE2xp2asMWVJDssIXxasvcihaCxbYbDkym/IaoGhbkbgoSq1s3FtLa+r8tlq2gIdIoIX5myGDWPEKP/EGk2CJKiH2uHkMwpnLAjzQ+ysft7L5zbympiS2nf9hjhZGHZFyorwd+66k+c/NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246501; c=relaxed/simple;
	bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dtxCLMitOo0woJ3RKQoj9RhHPIDzOsRZeSNQ6rAZMONVqcLqp0RsUYZZmUGAVKOhMVd8ym6OcJWbcu57pkS7S8hrofSQ1rC1MKfn2QhNP4mMszYCl6+cvX5izGZvUyYbwDd+g4Gl3Hbd1a/cF7hkXZvuJ/pBljHVJxzvO/byNiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Et6B9Fh/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vj15Oztf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Et6B9Fh/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vj15Oztf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1PXF2857958
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=; b=Et6B9Fh/ZgyWgkdl
	btIIeXweDR2nqhOJrByvH90i2JVQqa162MY1Q45Js10d3rrCTIrEIJYJ0kaGzFbn
	n+MyF/ldGjw2gikYItqvHolYqD5VcR3sjEre7KvsQIgjHEBGgIeQJz98tXZS9f3n
	37yuT42E65YhWNaPRpAChVFzX90YPZBdeu6jQpcUOFuz0KcFvg36es9LdioCb5d+
	u5MoCTX1omEu8izo2y9yirwtLw+aD44IZ+zWp1yngBvZNNwye9XU8ihJZ7+ZVZsK
	66SHBY8sqDDC1K3aT1BL1LIaYkRKtTqOC+Izi1KcM31yOxUg8zKDNP0WfPvT/vqa
	DYNGOQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rag5aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939d6c515deso374164085a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246497; x=1790851297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=Vj15OztfflFwlecQsQ0AbNnyhxZe8hJQP1JuA98e8Z7yULu8Wq/6sF4+l4RP47KLv8
         4fol1IdpqlzT0bdhOe5DcjHocdwpuyQKSy74bRlIWGVyxs9TFFg/8MPy7RXndIgS0Kiq
         YIklUzwbTQI5VHVo/p8NkpSwD5qtPBhdetD5Sf/ObUAgH6nvhUyGVo9FFcHTPfZyRzPq
         jxOO1ZC4LvlqvPaiL8KpW2lbCKZZSj+xeUxQFsA5SDEhp6oHqbRx6Q9owYI0HQMH7wL6
         5RPJ15nrfMnamcSN6rBSSqmP2nAZ2Mxiz5Vrr0Jke+WW8BI07vesVyOAAj8zEmh8QESn
         Wu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246497; x=1790851297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=C5vLUU7GVl17IDPLOioFIn8sat2vqo+iyW1k+hQm7Mq3P0Xn4bveFHjy+6OE+UcTHj
         6lbOGtvZEdj77wYhoeVSx3FPdzlrGoRPFdJnzuCRdYcYN8NMuxWoBa6MQPEYCj++w1vv
         KWw29Gex7A66TMl8hxeDukYgJoeaM4Zp2st/slO8ItEw1dbIk7DJKsFY4N0Oo+0r8ByT
         OZCjhHf7Sq859Bzcetr986kQKc+isV5t3GfWtvmuftNS2VW9XRZi0wrONbVaKLK72gF3
         JxVm4kMnmJb7GEUs20TUGJ1y0Nu3qtruyJ8bECyFbCDTT+Eq9kCFDYM5tdON6Q5xcQg+
         7qRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwM6wRT3/CRppXCXBOdhsVfXx9O72M7V92cX77JeH4c8dChz3qA9wf+hfdKDoyBYXeW+TKjSnxNtAxtsww=@vger.kernel.org
X-Gm-Message-State: AFuF++mCL6dcyu+fctX4BjABZU7kCHcJLX62qXfNJQT3KlPzvsvmA/Lg
	ERzNzPiuG3mtnC+Rr8d4GaxZIk7nj5wlQ9q0+i1DOanqzIAAyoxjG/lk+mq6RMRtN6ktmxjRiej
	C27/h3N8GAMXvMiNIvgn3y/e5iluAx++XUhYCPZIZokCLE1O8c/N5iC4WsPqvSHR/7dY=
X-Gm-Gg: AYBFou1wJEyUeytazupcYJWt0cBGipW4/rAk//4W6iuCxma3DXhPzj4mYstcqRJ1xnj
	l7G3qD8QbqswV5uyw9SrF9JnWY7oClhVWds60ibfmfl+MVWoCEaMFxKITwz/M5tBKDDOzB/2Pnu
	4sqSrartarbDeJwLGVias35a01vZWRSUYeSkuhhBJDOv9cmY71WXDG83We9/LxEDjKI4EThHUML
	Z+fwZFi8YI5B1ZBMm5DwDIVx2SGpuIaKRkCsO7IGLZWD7kKrqthrRTJLYWnEpP7FS4xnA3AiuBF
	rV3422QzjlSR1o86qHbVLKuii1+x6DIQaA7k3OIuC7Nblrjab8UmmqKnEd3JHDf2ByvdopTdkej
	K1b7ed9Bj
X-Received: by 2002:a05:620a:2951:b0:939:a6eb:735d with SMTP id af79cd13be357-93c3624c7acmr229121485a.10.1790246497425;
        Thu, 24 Sep 2026 03:41:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2951:b0:939:a6eb:735d with SMTP id af79cd13be357-93c3624c7acmr229116585a.10.1790246496699;
        Thu, 24 Sep 2026 03:41:36 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:47 +0300
Subject: [PATCH v5 31/42] arm64: dts: qcom: sdm670: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-31-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP34ajY1tA0w98yS3hw0XA27huw6oCAxRCgr6
 rsOJnKD34uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9+AAKCRAbX0TJAJUV
 VneKEACELGI47loMvflyG4FFK/wZKy5oxDtS9aF+vm2ffCwbL9oyfYKp7vnIYFcOUuwHyvdi34/
 2iZ9wDdWPtsnj68YN0/qhjx7tr6DcCSzkl40v8R3L6zqBg0SS53WZ+JTv0uFekXx0lA7D6UYdBY
 JdEuOZQFXTPCZifDVrFIZ7iJNY57nhdi7bVJ5rCMcEBz0M3SWr8gyD4om68++E5DcJE3pULIiin
 A6cBNT4V5xZ7lHSaRH8lQUTIZegUEP08dwkDt4eB5YnlCk9beE/lzGMpDBbdIaVVgRV64VM3+ot
 DmTBr1A/e6ezp3zgfVt8jZ3iIJibVNnpiuSOj2VMWHkyLsdDoIr5cwuo8GdPuFyqWwt7i73+ghj
 ajjjSquI+nhK8MQ198kfthWRAEm2fjDaC40l0J6wFpwrhvDJl/TfON7X1odUqZFsZ5YFGRLAKQ1
 H0I8/Ed3Rp3kJosw8gNE/xdu7dGRbCHaKkUjgszKNmIGvCF8ys+UdwkcFALmgWajhHUFpJ42F7p
 ft4xMOupM8jT1IaNpMqt97XnQdX9fD64MCZKYgHEtMgtFuIW95d83GLdSj+H7aLNkRvAYK83v42
 v+44wI/MAQpDxG/8LzEtWr9LOGYcJQCFznwt9UrPaRP5saWhfLMoYPhUOoPf0v2pdJlbF6HYtZT
 Ep8BaWr9+VzghbQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX8zzx1vOQ+E+K
 ULVKjNKxRKy8EuynW32OFfTO83SjrnYOYRf4m2fJ8HLpxdzt2G6rRmom+ET/N3D+c4h+1Q1tKKt
 VKjNPld7NOJXkoEEOKP6J3UxybXJcDo0s91Ly2zpoKC5OyBiu0Va01K9sIf3ktePG1pf2CI4QNb
 CaSN9Tg7m4h8CPxeZ075XJCOd5c+D3/f7XasKyVHeqh/dL1p0E6shmHwYlJVe3eH1HwdjG3j2w3
 SvIoBYJOcgUBKk/hzBUzkG6cGuLO2RkpWULq5IjCHSbuhC5u7FwqpOjuM5TXY5ybed60NOl4R35
 cGBIkTOG/cpPIRq9lJQsZCFaww3p1Y0coN+i6e0ROtJMJftVmcTJSUMd0TuA1k7gcShZVbX2VOz
 diSqZT7hcPhO/BgXK3IXlF5vQoMqMlE+mtur2oneJxS95J8v9C1ydNFuyJ04+ntOSer0oTghb1q
 VBPO89V4LnBaWFyX4IQ==
X-Proofpoint-ORIG-GUID: bpzL5cTMxDcC0PVpW_Lx4oVjTTPBkKSC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX9L+7B5+jVGjv
 bLS/JiHekWgslc0pO26BA/qL8Dfbii0B4yAE6QE/V5nvgu00RHm1PaXALi6XNYq1SEnSPRk/R1M
 u2mXlbdKcM9r/01ufrTPGmeFnb+oYbQ=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab4fe62 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=82sHzFGN3NSTCjlL1roA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: bpzL5cTMxDcC0PVpW_Lx4oVjTTPBkKSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GCC GDSCs on SDM670 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 5c60ea36f04a..1978a54db23b 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -626,6 +626,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd SDM670_CX>;
 		};
 
 		qfprom: qfprom@784000 {

-- 
2.54.0

