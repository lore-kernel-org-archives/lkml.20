Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F95497B6C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246524; cv=none; b=gqnSw+LgBKN1cXEDvwIGv4pOEFs/0MSIQp84TcWX4TaVyoRf2s5C19YCM/UnZtI8Q4xlIeOthFOuNoO7q+QxtQtnZwFIOVQqkPYc//9lJoSWksH148p1mvVtVvLfHS1jSMi0cCNxTvQHrDNtAFZAD2bmnhy/2WLpSjzUJPgeICM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246524; c=relaxed/simple;
	bh=gDMpFJWapcnhBZHow5tYWj4u0/ni4AXCm1hEuPmwG5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vf9dD+g3t4NJT8Ia55J79YhcJ0NkmKpSjRoX8G5lUbMNJKdSPR7CYw9WAzYpuLWrTXJOE/4eqg2QfGiYW6m31qUr/Q1DPKF3Nk6Zfouhex5Tql692WBwomX5jeNTjxADCUQfRusiYBFPeH4MyfjY/zRdGLGJQlcutnjaR19g2G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JqURI278; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WnpqbqNl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JqURI278";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WnpqbqNl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PDRR2025623
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBk697OcXRYhQ5p1XM5h8Xcl5jMkWBXjU8/ArCjrsWQ=; b=JqURI278bv/0uBT9
	p59UyQFKziy9ZMF7XbQjTr7hTnfbJLzDD7VQsI+W8hdmP4Fl5fao4t+rX7fS4n2O
	zrRWEuwXCxMT7pEFcCex1zLI3HBJt+f5kxcrit9nsjIg5WSdCRLSY0x0nnmsu2gM
	n4HSxij9cL+VL7Wj5M5WjWPx10XRyLjALVgUjbm3TwqUF8yUDVqV2mdv2ASegDFz
	Aaoz/Q48zAGWQ7tCtYuNOM6sq9T2sf2qzDPqrdIWUHhH/Yv0/r8VjqHZKMxiHVLz
	9mfW7CNQdz39ewV0HJA47t8xENs271WLK1hl8LrKyiGd+0Ykaaqi4k659xyzBWoP
	7OWi8A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgt2c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:42:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9394ad7f64aso265308185a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246521; x=1790851321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBk697OcXRYhQ5p1XM5h8Xcl5jMkWBXjU8/ArCjrsWQ=;
        b=WnpqbqNlamKLxbHJ3DDNe+U991r5B4Afd9OXDCwBsk1X2tO+nQv3zSlkQbe6dpJI1f
         W/jkmc6USkwiwUYAHVmubfYrEYTWElITE55JydXiT+3deaAzaunoiIRo7j6nIW79NnZC
         b9uhs+GX5UQXAUBXQpoWPTuIeCw9tm+WM6KVxXl17i094PAoUE+sZMMoywo6hIxi8Rib
         BjtOg2s1cn2DeiE6bnapWaRZQkqtkfDjMy6Bstk7eB6WF0DqfCYJICami7KJGZWlHiua
         VIzzDQgcf6rzNOrBCqvd6U+QVaOabP8u2mjxCd3nYVIR5mxPb3I3F5pJm48WEXa4QC2b
         0BLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246521; x=1790851321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBk697OcXRYhQ5p1XM5h8Xcl5jMkWBXjU8/ArCjrsWQ=;
        b=gEX4uXJO0Ay5lN1slSW2g1RxWDL1vWgwbOIJBiI3NZiADzQC3c0deLlNhkELUr2jJQ
         GNzJGtZ90xr0qF/3sJ8wEa1AapOM/taw6iTLPbszOPSozuVXIUK6z7BM+IJOtuYC09ac
         cnBv7VZAhMTWgyb+cgiUqvyCXztfEfezdusHMSXgGVQB/8Tmvg6UOpEYDe8W65nmGl9k
         kT9h0mseKDpECsHuArjySsRO8btpKXlwJcsBFoOSjv+9R5utJgNzyG7wgVXckFRVTSXg
         la9Dg44rvtyc1q8iX/bFV1ucP0sO0uZ+zCCJA0FkU0r6NOX8wbaXTev7LrUHrb7DRvLC
         Bcog==
X-Forwarded-Encrypted: i=1; AKwUvBwIILyOYIl2BAkJ1peIm/VjxlTGKy3AhAiLfNtqLKecxI1nKT0vXgCcZiVF8udhB8C91EFd/s2ivgwW02A=@vger.kernel.org
X-Gm-Message-State: AFuF++kP4wIclKIL5L7t3LuZilcbjkX1RAzX4oUAnQrgGxw/yDcPxk/Q
	2V+dRk8p5u7HAquoZXVicYQMMODfGFdRrl7sd9xCZ/HbVEJen0Hm8+hlU35CBpy5MvUexb+nLnj
	PFyXp6vJiCoX1viWBstQqpQXnOEbP5CWh1yhxJezdZPh/6FQFPg7TeNR9ykj4CqKhE7Q=
X-Gm-Gg: AYBFou3B9Au6DXaQ2nnoGkg4Jkwq4rqj2Q5f/Y3UTPF4jonJ6vVqrP9kr1pIXT/kGab
	xi4fRcP3GJIjvhIAlyYPQX/USY5AmMHy9tM9gPHbIDU1wnA+6eCRS6hY4UAnDlyKjV6kC27Zkn6
	ujDV2puucpJtj97iOZuMHSCx36ntASmq5SbcxozBtMLb+9INpV8eZYHIx3IPB5IWL7RPv1ds7kQ
	Pr8gq5RFIRS52zIhFZk8Kp2eopMgKu94uUyaEMyBzxXpuAH2tjps8uYpyaWZ0wGwcxzqn8Us7dN
	tLQMDtutMXV7GSEiK6aj16TKCOFogyWxUGkwI1DFmsimCgtiVo97/Gv/QzBTDrGDKatqwLy0plj
	a+dTCuxCU
X-Received: by 2002:a05:620a:4150:b0:93b:d79b:9a54 with SMTP id af79cd13be357-93c363fbec3mr221543185a.53.1790246520932;
        Thu, 24 Sep 2026 03:42:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:93b:d79b:9a54 with SMTP id af79cd13be357-93c363fbec3mr221538385a.53.1790246520281;
        Thu, 24 Sep 2026 03:42:00 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:57 +0300
Subject: [PATCH v5 41/42] arm64: dts: qcom: sm8750: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-41-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=gDMpFJWapcnhBZHow5tYWj4u0/ni4AXCm1hEuPmwG5w=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP4B70YCj+GEb+sbfFfcdVeUcqszN8HuMKxxu
 0yOJbqeEnKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT+AQAKCRAbX0TJAJUV
 VrnFD/0fKWKKs6Gd4KZiW39ygsxEMondlD6DHPk584actBuROJe0aPaX5qXnFmd0TqR7L7I34oD
 IJeE2tNyse+AcZxucaAXW/IJGXA+yT9qoOD8vV+x+Ikfx7uVyWw0JAlVQY+xj5VDLpvlYIOJbz1
 7No9+ntqAJ9cldmBw3ON2xyu4BigYwScZo+XhtPMntWp1wA9gfFFLgT6oJa8QRwTr+XsWBPUXUZ
 hYe4LDQO/cQSN7xtm7u29v3fzZV9J7FKpkY7KNrJIJrJJXdn+XBW3DBZgKUa0MRcJbNJ0/Tn6Lh
 w1CFG40cZ0lLPZV1M8oNyQdfKW9yOcETl3NoQ7t4JL1uyvjBKrfWaWyzNIhKljQ87Z7YDQHhdKg
 FLMcFHfJR63sfNE+DSf7L3uHcsEIIfMPOURXXMatvtqPxF6I9EFvPGp0eKVUQ7RWOMS6m1oeRSz
 st/BjYDdBB7jG1nmy0MucP3a8wYPjGdMowcuubFQrjKGYXXhzyKaqF0JcEixUnGo+KpxuzPsLZJ
 AfPEYeuzUqfhVP7AZYYgvn+zB9nIWi2ksxrWwBRTT6WOaQeajcxsTsKdyMI4Okk71NBj33nRYvQ
 6G7DGItf+rlhiURJTapVAHcxDr8lXWUcupQ1cNDd81Lv6xdhppWMJs53idskvaO3ovSjXXbqRKt
 OR5kl+ZeyHLt6Qw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab4fe79 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: KE1nYq0JbspIKBo8iXnR7fbZe5L9lRIY
X-Proofpoint-GUID: KE1nYq0JbspIKBo8iXnR7fbZe5L9lRIY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX3GD8F8vCIuZr
 utajmG0rXDvDpnm6Tjk4ThVA3C1yMRy8JayUvjslFaGJnxltn0RKCfMg4x/Tt8AmHHTwkYfmY1/
 OVCAZANBmTTmju9Lc1GPzS99NhOCzkU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX3rt4A4cIe+C6
 dn8mejSz1RdcwicgAqLfphQMZyR6esoIWck3FBfaouA/8x9Md6etmHAXy1s3P4E+PP5jRAt66lG
 srLf4grQaWUDrZCgI3ySZI7IICi5eqRx7Yi1Y9NxlQyOYXDNfVwdKG4rI5QVlJCeCLvYXKXVSdr
 qDMjSvmgP/uuaqW0DDjYahfsLtwjYCZxiUZE/jCJk+LpYa7UJY5+n/idTkHgUMe+KoWl1vLZOf8
 NrGN3ql2cyFjSTJm5hhDDTqHEF1FAAgMWBNWoUjM37GZ5Fc1RqT0GjRkWf6pl/hTMVU7OcNSLw3
 hZ1d04hxQjthGgGeuOo7/r0iIu7WDKkgnRRnileGh5ahBOzmolq0kloDjAWNp19W+FEd2bxgvGs
 iwgdbOd3On5gVc2jWKzW19x/7A5IRRl4EgC2kTTruWLdc9+I6z7jJauOVsAsYtsx3zesyQeEi5l
 JYT+4Ufbgsxx7Ujq9TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GCC GDSCs on SM8750 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 28cf22da854d..b9e943afc510 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -677,6 +677,8 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

