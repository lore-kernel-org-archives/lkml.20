Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665314915AB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390208; cv=none; b=WH2moxku9EWY7rrOT1kU/T0frkfSK49parTwYkS7nahjcJi32h28XAItD3Z4k5nEEoxc6nMWCktDxvG2rRwpJmIoyh5V989WTE9m/RwzJTV8U33t5RQKeHwIzeEeBWYTVL7v2I1PuqF6amueM2axDjyHfP1O2ooIg+8MdGL2LZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390208; c=relaxed/simple;
	bh=vR3z4cHJik79scGWvFvoIkF5/TuWGh9nOZnOTSxAwWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lq1WqE3p7vuiqc1gzPBuzBjRtg9J4BBqw2q+hwf3JqLXTUAwfzG09gyqXXwe/7zyH22OH9hOaKzIhqlCctK1pnM4Hy8u2VERdAfavAcY6O1Pz4C38QNH4//gCiAF1IEyWSrk9TOOzHE0ZD2f9GuskiuKb0GAnzC1zUBG+ERCQFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4XcYK9x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zg3F07ts; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4XcYK9x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zg3F07ts"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRI3h406996
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=; b=m4XcYK9xP3ukjTFm
	POMa+hreh4kyn9JcRvfNfLgC4DxXBkgYTmCOtHXhCG8TbRPFxoAe04xqVBP09sd/
	8PpN+nzhVpxHUBb8+6k+H7CDfDYRYbLpRnMK0ja1c4Q3X/hZmpUzSfBw50rp5ZZ5
	/nDVbaHSy/OVBkPTRV+YwG0n17i10/APk+PxwSWhpwWSHZx3jSDq7+3+8yvgLeKM
	wA+dehsK+1degMzwCMVUU2cyn5fpp+aHTxSUhcNvJSIElaUCak7DhwLGqsAPvDHh
	EBtM0Y839F58MNuCjhZ2BowhyP0cD/R+xSTeQFFlZY0z78bbFNE8LV1aJvnJTJNy
	TJj+jw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr8gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-785b66a7017so559248137.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390205; x=1789995005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=;
        b=Zg3F07ts96IRWvGoHuDNh+em8EnE6RMMWr8WRo+/omjgqdFAYmOhFNXP6MzW/28QVa
         4yAG+CVp39LuUHXXrqqdRfooEirRAQ1jkeAmeFQOiNXlXcugCgzeugnf6Xy/+w5Eofkz
         xW4JOt/Swj3S/0FA0c0E76mm8AeIn/LN12ChDVmZYbt6XUUL7B3Be1W5u/tCL6VpTALo
         414sotKN34lHXI1ZEQqCdbH0FiLVi9wxLzaJ0FvcFGW3lYI+zNqYiwQwMSl3ha88ZhDE
         HPZQ3mKLGyjx/Xc6eSOii1vNZd8OsCZnxgfdkRF+ChW3g/e5gB5AW7smQPBG//VzHgDq
         jV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390205; x=1789995005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=;
        b=DWAJuDuNZ0wapvxwBNiWiQrJp1LdG7o3NnwkhInsplxdW4NDMyluxwxoCzzPU6EDS7
         +Ls7ooJuQ2OMrlgBki0iVsDUksslvQcgBdUIBYgOxNV4ZioCLTsnIm9Dz2Zlj+CJ+lrC
         cw+cDdtxVblm81fchqFPaeAjmIym+gyTQUBgBi/qyDNlEDjFruto/yvvMZqb9oim71bY
         TnQ/V6W2aD6KEv6iaDakLfgG2JEblEfxuEbypPoI3fFtfKKyYbTeHoy5lm123w3q3sl0
         s3DWwpWf7nBOtTReFokfhVNTZYl0hNog8Il7fVG/6L1HsxSMX92Yc4bpY8Edqj7M+DXZ
         2WXg==
X-Forwarded-Encrypted: i=1; AKwUvBzrzu2iqUN/wjCPF+5EyG5AuLbYTqpn408Q3ud5RS3aAfiJkxjcHYc0PoW6SJbcOQbTVdcxplBseMaKCv8=@vger.kernel.org
X-Gm-Message-State: AFuF++lCsVymi7DHGXZjibteXtzDs9SVN5qSt/YoILYevMKYfYUdvRlw
	9GoTDz30q00VWeA8ByVvgDbjpd2VUJbwUB8vre61FaH2vOUVB6qwCgUyxK04XQdt60161ksRvPP
	14O/QVRzeuMfjBI02vEwMWvvOknPofb0iQkTFgtYY/JPFY1Suk49vFAAPqKc75awtN9E=
X-Gm-Gg: AYBFou04zxhhMfjV6qwhYkhV4GcjvthpsTxSTCtZ/QwiKxPM/9Bd1TSxGOHp3G9fmOv
	TZ7tUexC2c/zJQNZHRPXavZHZy+uZdWsU5jNZqKChlr4qCcGCCPZxAhQxqvFwj03vGPkdOa+DZp
	WqtXr0VWRqcOsfYIb73ahsus5t3HYFaOoYIHBuwTiVDBR2Zr/9rMHiT2NhC0pVDISY75V10oGjx
	rK6dZlUEUJbBl5Qvx4mXsd9O7B1aMWiEy/cUOplctd7tZJ5RNPaPlNIsI2mk6TjhyScp3g9pepQ
	1ySIrjmZpAuRNTiuipK6gNf6iqI+chuMajwIzjvwpPlHIicHQKv2/3HIF17AsgfdyJ5GgYoC67U
	MVTF9miAU
X-Received: by 2002:a05:6102:5792:b0:782:de7b:eead with SMTP id ada2fe7eead31-79b573e386dmr1119998137.1.1789390204617;
        Mon, 14 Sep 2026 05:50:04 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:782:de7b:eead with SMTP id ada2fe7eead31-79b573e386dmr1119964137.1.1789390204121;
        Mon, 14 Sep 2026 05:50:04 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:45 +0300
Subject: [PATCH v4 46/52] arm64: dts: qcom: sm8250: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-46-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vR3z4cHJik79scGWvFvoIkF5/TuWGh9nOZnOTSxAwWM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z4diOa3IoZkiyf0cmd+cj1rtu79x5zmqTNM
 gJMyy0kJoOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs+AAKCRAbX0TJAJUV
 VrZrD/9BzSwkSmEv7n2TgG9ugoiSywAjRzsDS+Frozzin9bv6SP0MCeJSqd3Z6Q2PBx/g93HjxQ
 +cPD54HDSFIb/eoilRDkiXCN9F0QKK6Mx/pM6zMccxCaiIPrm46/ftDNaYh+JxF0gmR+rD+ffCZ
 M6HVX3wge/4arOXte5K+tARf3p6uzK64l1DGBDNnOJHaqiDKMUY8T7APXlNAHY5dcBNMS/T5L4P
 MeTDjsCGwzwvP87qIr1PUK4NIB1R8i6ny5ib1BmzDykddY8xCIWmVNyusvifVlLF3RwjCAnOulJ
 vye8ILMlHFK8yuOX8Uaq078gBEBiNBolbqLfFzl83cf4R+ZWDRZB8vdaMvCqbkp28BwbtZigaJN
 8EffCWAE1Q4aS03qBLYrMgHtyLaEiHM6uqc58G0SZGjfYsLNmYvNrVXkcFw5wQ9/VEMcfDdjkpb
 FtSaSJnFS38liimo2oFY0CaHcfeSrnMfOtcWmhp+E0F+lXC4/H1BJgqIbe7/PRtJQZLuet8s45k
 JqWzFlzTiwdNLM/0+S3cxiTObbfWBNtYYOHjiaySAuwVYaysoTga9eXXArOhdc+Mp8eJGFyEphx
 EqKsXrbh95SUdB7OgAjB+0yHCUF8aboB9+xuLjlhkP41hSkWAeWy3IRZegvMM1RruOtrCnvNws9
 xTT3fC8sWPlqliQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 7V3Ct-4J2z_bwecj91TMeJ0w8-_-81HC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX1OUaFymFZHHD
 iXqHQAro9uMWI9gQY/5i8mu2cMfW86qAY3VVr6OG+VQgyz5YVZUKuv4+1NrsopyzopMe9d6xLEA
 KDo5pXLtJSrC58rR9KD4ncE7uMwX4hgLnO4KSP73QrORnwGk8f0UxavjZ+JHMFOzRB6tUr59ur+
 pPHnnRUJPqhloEonGq05jxhNY5kuAhTR/D2Ieyd87Yfy7WSww+4+mOs4cym1qHdVFWrzGTi2ncz
 sSNGAvw/tg5qmL68PTXrM9B9ibtFQP5FHeNeCPz4IZ2hlZRKQEYZwmPn6c+biRym9/WRYM5Yfg6
 F9JaUxG7G9D7A6d6LZzwX0yxAmQtsb/lEv6LwLtfb+ehCRHCHY2pO+OAwgEhodty2pgO8GP7pti
 /lyZXCY71z5KYmVZDJSi28UEuf+ws6+EN9HUMn5dlYV+Pyci+GYuh8hgD7nsc3g8fBS4xgJ59+x
 MVJzxjrPMu8leNstskA==
X-Proofpoint-GUID: 7V3Ct-4J2z_bwecj91TMeJ0w8-_-81HC
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed7d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX5hAoUR7yzL5E
 umbZ7kBvqlW4z+SxMPwFq7pCtf9LE5bcf4DrJM5C1LV8ldti+EfX3P6hBzCnqcypNzRO4xGdzM0
 okUdr9Sze/zSdhEOXSJdVEq8ske2XwM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SM8250 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 8483a1bc56f4..a90e4f30d39a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -970,6 +970,7 @@ gcc: clock-controller@100000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

