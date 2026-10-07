Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216ED4734C9
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377505; cv=none; b=qEYBwYycrFsGsC6EWWaLHfUiktITn1x5MXWwhEfpEXzR1Fh1bMPRdSZRog8T7w8DV/WqP++MNLY2VkOHmDqqX+HIPWyXT/riatA3NZeTtBjJSK3GUB3rXf/oumYF8wCj82TsY2uIbRHlLXKu2EP+jg0JtwRsrzJjofm9Bw6hb8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377505; c=relaxed/simple;
	bh=wtguUlcw0GtiL0z35uyyAK5blBD7fMvV9mBxhqKMXEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gwkyYKfZOcfn0B0wKIQjmOhQPPh/jzUfKEO+rC8FnWwoQo0TEZlZyO1ButxvIMlRJ/TDt2bCTtVDIhmB1msogP/NlZYdKlYORr5928pWis07rYi2LQa50gQpkd4zTqqeOwTvK3b/MAOcxbxnAwYrwrfldE4iM3fCobpjt1+fSdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZB5KAB4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QoE0f7Hc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZB5KAB4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QoE0f7Hc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVCP73198253
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 12:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4iOU4Nw6gbPDpDYyyYvhCrTJzp3FNRBXEt2PfX5HLqU=; b=eZB5KAB4mgfBa9wQ
	T8wFHlwZC+eeG/bWh78cicxdArDzgCEIm1zauFeJ7Kj9zaL9bdB2mjrKgZ4QSrik
	0+PR678KnG7nnERTzMRKgT/yNS8tkBybMdvF6vDaabd+fupl0W+aWLJDoeXewgO5
	hXCVzHz3XLw7n47J1bPp6nu+bFRuFBpFqqyWmFDexW9xS56bcdjQm13Yuk9BDMbA
	7Whgh1Q2LgkLc6NR5PGWqyu1j4qDe8iURpRlZ5Vv3GsYec0riGZ8xqlPcTfKB4h0
	5ypnE2qzkDWnak+55pVgT5ixoPJkLL6BbMyVJ8+G7J6MuXUU3/ZLReh1fnL23Is2
	c9TfTA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s25kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:51:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so5339896a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791377486; x=1791982286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iOU4Nw6gbPDpDYyyYvhCrTJzp3FNRBXEt2PfX5HLqU=;
        b=QoE0f7HcnffZjiZkk64FabqpfwjOJw9Ji/TDdUDOSuaxd9JRx6JKVTFGb6PqozB+Li
         kqN6Q8CJFJsXpLjRzsxtzbri9JZIXy24AB0GE58/OQEjfGfo/HTJbRp33NJtk955PYDp
         zdc2Y3zHHPVu9E5sfHnt76AsDodRvs+FNegSD1somUOTjVh94Z94u2ubElEM+nmUrbwO
         gzbjiRLkTRYdfOA2ZwO2kRyM0Ojdvik1wy1Z5W8upVCzbaYHbPzurhH1wHVT/U1rq+8X
         0uufmqMwF+Nzu7tDkXbVyOqpsxWTFx2KRw3iQcLa8PAp3kMtWRJ/Sh24JIPn6125VgtU
         NePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377486; x=1791982286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4iOU4Nw6gbPDpDYyyYvhCrTJzp3FNRBXEt2PfX5HLqU=;
        b=lKoA+NsQEapxsGVY6ld+eeRC/bmg5TlY7Yw21zYHfPlmIn4Ps1z4CzgjTb0E4PUnu2
         L7pjVksEBKl0+WPulZowvo37EMEk1540BEBp1TzgKR+SK/I/Je10l/UzGEb4t/OnR0u0
         2N+q5Jha8aTmVpuSxfZV+grwAH9Plx4GHzRafAGW21Bszllykco7dcauHH0XsE1RmJnW
         vd1zueCA3ZInF/Va6OeEA52iZ5xyr7mfDDPItHBASuqfZLXYobODNGCiwhsgCOYJJvH2
         Xm0Pj/H2h4sxYb/hUUgh/FOSuUHnZ3T63hZzY++WCiJIELbWOy3N5VNngDpv+ztVxOIU
         PC/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwJmC9qG93KLIK7VXPYf0dpl0hraZS408t7BpmMoq0nD3jXgRsxsBPhPq/A5DJNIA9VdCsw8zKSjz6QOvI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuxPN/rV3g3AGXBq1vhcq8HQ8meea3r+cB+ZV707Y1ZU1/Q1hD
	LeiD6Kg3YLhc4XI1TYwGdKeMdUA6JRFZoSyA+ja0oDuytcT9OBeIVeZwFd2tMpc9WjbPmJlKlZE
	6j26C+Y3Sl+ndgF+3iWaT1EudD+8SWvdeHbh9r9U16yoMbe/iwSaEyBu4Sb1NNReR5NQ=
X-Gm-Gg: AYBFou0jEq04eK1v9Mp7Gjr+d2ubGllU1aXW+EpqGwGR8tvjtB/AowIjYSP83j2bWz3
	oCiwyxlclW6tjYIZkZVWMbpn8sfv32sxrgSz9/Q7trn/xoVSVxtsTXNSmw5kuk3rhaKiFZfurQp
	OQxFaSaU6wZBnc7q7sVEBTBgyzp4MexNcCrK730UaVfLrHPNIr6UPnwzxVaKbK2WtdC/WSsomTA
	P7K+H7cUIph76+Ug47BojVtC2KZnb0k8H7b2SMFiezWywWeT7mejKZCUXmUbFsCIEm7/8CVySqh
	zhnpKjWKFRem8vDHj5F4giiOAperO/xHBkDrpdwMQGIDIrCFvrQv0b+tdBjO6K2s6aHVyNZ/2tZ
	DpHjbMFPQumcWlM50slLIoyBzlQ==
X-Received: by 2002:a17:90b:2884:b0:3a5:364:dfd with SMTP id 98e67ed59e1d1-3a8a0cd1a2dmr2054757a91.31.1791377485621;
        Wed, 07 Oct 2026 05:51:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2884:b0:3a5:364:dfd with SMTP id 98e67ed59e1d1-3a8a0cd1a2dmr2054745a91.31.1791377485208;
        Wed, 07 Oct 2026 05:51:25 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89d718333sm1884954a91.1.2026.10.07.05.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:51:23 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 18:21:07 +0530
Subject: [PATCH v4 2/2] arm64: defconfig: Enable LT9611C bridge driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-master_lt9611uxd-v4-2-9986704e2a7b@oss.qualcomm.com>
References: <20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com>
In-Reply-To: <20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791377468; l=791;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=wtguUlcw0GtiL0z35uyyAK5blBD7fMvV9mBxhqKMXEA=;
 b=VBXEK/8aItkX1UCekr/1dylQJ4b/NJGEzi9LFC4LrAGrBbEEu+KOqUZoWl2D6bywGrQW8Ag/s
 0BX8PSZrEl3BQL8LpsJOcSGhf/dk27sKT4JPKB7s7LT6IVys8j1swSt
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-ORIG-GUID: Z6cDZ9i7emj-q98I25jp1n0noAb4NSC_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MSBTYWx0ZWRfX+cYbNABtiUfx
 2Cjkx38I88rZVwOD73l2Hm5+b13KIckIrvPyNKxDkFcgughYyyosiw/03T6bdqNhVcTNOV2TmRM
 DWxoTkaP9cKXUMb/47xlgap78d/ns7vCYbAOQRJ7WeIdnKjqfeI2rI4a5MOqQv1gBXoxQqfj/SQ
 v/1y1oBnTa4E7e/tOxRfO3OiYqO5R9Q2X93+hhQ6qvuiXI4FMoihPOYzmHNSS4N0z2DhMF1occk
 QTMWRVv4IdFUBxs6Rafd5WAbTTS8oDG1yhCFwAZQ+dLI3ZZEtla96cV1XWlfGcSWOW05zxgr2fF
 NqfD9Wo1D4f6i9FKJBA3LpwCR3GwFPy0qmDP7dd6N2ybEsxhR/YVd4plSajcxGUZCDHi37RhmfG
 F4YguIgHpMBY5V7NjaolHLquQdUSne+9Fq9GHF0DcMi5tTY+RCL26mpiEI3fQTysgVDCvizAUQY
 9ikpNswbmJbEM3ZKyUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MSBTYWx0ZWRfX1H/cgFsktsiA
 otlXxGkArzSFyNOGK1YOdO2dIwD++Gv5mlGs05rBw3Ftoyf1XcANEZAYmcbvGql1LlNHYqWXAPN
 HcISiV0OrfoUK/oYfTOsyYXfcpkbIUQ=
X-Proofpoint-GUID: Z6cDZ9i7emj-q98I25jp1n0noAb4NSC_
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac6404e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JLjO1t5ekhtB3RsVtqAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070051

Enable the Lontium LT9611C DSI-to-HDMI bridge driver as a module.
This driver supports the LT9611UXD chip used on the Shikra IQS EVK
board to provide HDMI output via the MDSS DSI interface.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 65fcbbfc1601..d18f72e55330 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -977,6 +977,7 @@ CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
+CONFIG_DRM_LONTIUM_LT9611C=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
 CONFIG_DRM_LONTIUM_LT8713SX=m
 CONFIG_DRM_ITE_IT66121=m

-- 
2.34.1

