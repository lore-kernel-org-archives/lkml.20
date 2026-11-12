Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470596;
	b=nv1bH5bcLCz8dI1M78LejMecmKNsOzwx6MbaxHW6Ltvlc4FDW6iuxteCdamLS4bBSW8b
	 bU4vQRh9l2ef6ZGdtzVf93ptLneZh11MX2VvO6VYuarpO9dVAgCTZsfR4DWN0RqZST1u7
	 9mo0SqKwrItLLvcQRikKxll0eRd9mT4M97Yo7OVu/j15YFFriqHjWcF5ZB/C1de9Sjdmm
	 9MrqtkHBhByPSyCJfL8keIMiLKB94xoMGHXVekqESbe3Y1uBAsBDVvNBcqdD0PLsmQpNS
	 00sk1dtNORu/MylYGtiPRqF9EYlS/f6dPR1XI62wPXeNJOjlPlhDWagSzl2eNawy/yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470596;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NrcMGnTSkR8PHs++ZQALj/9Q2KCRTDyjUGF1gzNkIKc=;
	b=sBFZfS8abi12jhve9/McfEQg+B2mP8NHN5FTlC5noobwDI7am/jPMjd/ZVUVfvVIMHO6
	 yTeGyAnYqftTuWUYUPi+Vr16gjSmNdpyNB+OryInsIbuClc2MLzwNy/ep4ZXisom8e2e0
	 1VtlBjkkA3AUzXeRI48+0LPLRfe9NT3c20gxU75MFMJ1PZzjYyv+H6RscRvIy/hnaBaaq
	 Kj+mY+/m1C54CdyxmPlDVAwpFGdUW1oO+f6l4y+TyzUSdlD6eKZo9L2HcipYE63i2QyfT
	 kUJuI2eBcYnAEC9oAbg11vHynRrYZgfrr+wFQ6namVN9wVYjNQQ1Wa06DvvBXLSTJtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CuusEMxk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HXTQ6VwA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3651C606A8AE
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3651C606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CuusEMxk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HXTQ6VwA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZgY63812936
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NrcMGnTSkR8PHs++ZQALj/9Q2KCRTDyjUGF1gzNkIKc=; b=CuusEMxksXfXgyIn
	WoPG2hxf7/JBQTeFx2ErNE2OXdZDIwHphHilagmUVI6TvF4z+erw1EbBOu2CxRsE
	Q5P1T6Op/69dDhss5SsjBXSMk68N1vXZRfBedF3A6wO9S2tHH5kYMs14cJsTUTGN
	yNNseM7E6jN8RmgsUWvxUfmIJhFKZb8nLe3mGAcyY7wsmmzdV4QMpaT7ZliR5RRw
	zhIRgTAzhFIe4ucbINfEKnlmugh6an8H494YR11uz/8Z7GM7UJtnxfUaKhl0OmFq
	dTxv9rTvILtKBynQpLsNMq5Wx63thd2NzZUJU65Hqlb4RY17faMQ/eBuaM6y0oWp
	LBS1zg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvvw0jufm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:03:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so1902553a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794470594; x=1795075394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NrcMGnTSkR8PHs++ZQALj/9Q2KCRTDyjUGF1gzNkIKc=;
        b=HXTQ6VwAStXGWEngsBtifzHRE12djrgYbeX4GBCWKRebb+slSAtXJmzRUkSzEQC3bV
         MOq1RsC4KSWcWHCk+6iIq9j1nrcH+rjYHNGzncYs1sGkIjB297APUhwzDjAO2Asahl13
         lJSZOrceAEMx7eKzMoPxFANib64+rxepq7oDq2kBUf7283PPXD/p1faFdP8U7vQXlmqp
         veNwwDOZP4rN234XuzJf6Pq/e/tvmT2+K8B9d66v2ByhU+ttkYYpeykdmqO0qPoTb0i4
         asAJ6MBt1+ewlQQO30gWIyWNg/OT/85yWiCUin/qy604VBaspihNvCCg8Vh8N/9l8lLp
         enhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470594; x=1795075394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NrcMGnTSkR8PHs++ZQALj/9Q2KCRTDyjUGF1gzNkIKc=;
        b=0MOmWdTTdh9X3hxR84HJ69JcPy/x3GZIv7ThfkE7H0xiZ6VHaPxQ/lg2+970Wnj74s
         yxV/H54txsSuv+JBO2csIjqWIUg6+mT2hKkCEGLX9H0jeLd7JheAOaqlBj/NHQLjlKt3
         Q8Flr8bgLcMAAZxNcd4v4WMb2qHuwN7fqByXXiEYRHG1dCbLXL0zTc6Tv4Jw9WTKFueK
         6sHbs4j+NooaGFn8JStss+3yXi+Y2uxrm+zskfbMqYeH1RpqTuEuqgPRpfcJ/X/c3CaS
         BXXaTfW6oNylKSeMnMSi6QXNlnv4eFrzifTdM5jUgsLQj039I5/yLab25Nu4l408mub9
         UaIQ==
X-Forwarded-Encrypted: i=1; AL+hErGvec4r5/BAhcjoaRaQDEqVK7D3eDDelcwiwaCoiYmzYSxyI84j1nfm/RAiClMqXlm8hhRAnpKCKULxa6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SCyS/vWninVCV7uDuxhTyXTf69URAsS++R7d1qbW/4mvIFhSF
	1CWsNiEoRpKQTnkn3Y042LwE6ekKByETqZyCaTjvBIGQPp0xvcO5UJrvmqaVn4csvKiqS0PLsHF
	wKlE3jblQ+v2uZRqcgFJZB1hTYvYkODI3L+/fLOoeHwf3yJtXgwSf2i7dUNCB/92jkCl5mAzXUQ
	LfOQ==
X-Gm-Gg: AYBFou30DPZIzYuFraBPPnPbGm4koF3F78SVAnZFMvr+jDFj/2jXmyXNnorSIhvZ28j
	MHR5EsewLXK37GWHgOr4GdrxbW5bKf0pB8+z0O6N3zZLOKPyYlWosPyhlsaeoGhLoOT9BeqoqXH
	DIB8AJgQycFDWRGXMZc/LTKiU3Xmj1c178w+rCzCqkx2LFmEdh0LAKMTqvLNf6cxZGKQ7FhCc+d
	uR+J3BaqJn+KfIei7FCxD9tQRYECmLj2/NITEBgVRteSZUVx5hBxIa1HwQ4TErfQ7csIQ7VUwnr
	LYnF3DTMZ0/bvM4fHnESxHYYSAxAnFQ9K3CoNUL4X0W+7Py19MHGvBmKX6kz+9VrnTd6J9Xn+Xo
	PQ0iep2ky20TGL3X5g8ggPcjC2HGZrJnZ9e/HM4lN6turri5IE05YVKm5lNyfYP1PE9A1eB1EnB
	97pYBiLOV4
X-Received: by 2002:a17:90b:1fcc:b0:3b0:a7da:d244 with SMTP id 98e67ed59e1d1-3b182eec07amr4432259a91.30.1794470594055;
        Thu, 12 Nov 2026 00:03:14 -0800 (PST)
X-Received: by 2002:a17:90b:1fcc:b0:3b0:a7da:d244 with SMTP id 98e67ed59e1d1-3b182eec07amr4432241a91.30.1794470593636;
        Thu, 12 Nov 2026 00:03:13 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182e3a74asm3722251a91.4.2026.11.12.00.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:03:13 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 13:32:52 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: nord: Add SoCCP on Ride-Embedded
 board
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
Message-Id: <20261112-nord-soccp-dt-v4-3-af6e44e9f397@oss.qualcomm.com>
References: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
In-Reply-To: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: d3Ne_CYe1ewtXPmsNdCRfwoNwEyGKm0m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfX7qTOd7rLLOxo
 CwAltfsGmEW7L/jn1M0IyFsf4o2BXRAqTl5Ntn4sLyJ4MvFa+OE9KDAFBzqrfb5GmMoWhYNf436
 G+GuwLigUzRP0estGNiZ5kAqFf9NvdAsxNwF3ImQnXBH/K6DPLyszVY8kQaBq5OYIcbO/z+hT1n
 k+JOExiqKYDeHR0yYzL9BllOYetF+JJS88BjZNpu88R+Qsp6U2GHXoRn/e0gGzIPxNZzMcFLPiv
 jSZaZnKTuPMimFOqV/yMgUes4a7Rws1sTsqqKZj39Vpb0hKqXkgC5kMbOZuCZTrB3qIyy0Rm8wy
 C7JDcJ8ZTglmE+8J0U6slrktqqI6XTvcp3VDA2xjNAslMcgrPjixPlg2QLRmlWQ4k6FCnFQH/SE
 OHloEgPkY1XsKNpppIs2VeqRoEoIOcE1Fs3v7t8vWu+xZhS6Vk0o/fM/wfebjhHXUJ7UxL9O1Wk
 +BTrN7ReV+d50BILZEQ==
X-Proofpoint-ORIG-GUID: d3Ne_CYe1ewtXPmsNdCRfwoNwEyGKm0m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfX6oi3zK1gHR3l
 ai0/HJdXBmOm350xevlQ/0RnU3pxCZGV7erFtx1Mu9XpDyUeSzPv63ZQX/r0aN2pjlrNEtqDxal
 ilmxnB0HD5wdXjl8SsT53UmONFwcaog=
X-Authority-Analysis: v=2.4 cv=ct8OAF4i c=1 sm=1 tr=0 ts=6af572c3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XGSE3OjeN7eXtsT-Ms4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120031

Add the SoCCP remoteproc node with its firmware path on the Nord
Ride Embedded board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..1aa3ed4c1e45 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -419,6 +419,10 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+};
+
 &uart15 {
 	status = "okay";
 };

-- 
2.43.0

