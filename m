Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794630512;
	b=FjlxL/c4OkIjgp3v4RNB/99Sj5YV6sXpcUxjVlPw3uJTmNWJDV6dZRbRqa92lIJA1rI+
	 9pu+SzhOwP9IPP6t11HqdvyGIaOf6sA387IqklMlX0DtzFtIrKcwnY75HxytXrINaTQ9X
	 +ldNoLcJdKXHXjxDUAeb2AlYroEaPEmR5MIf0UVFbCaGm+ic6+QnNCEum1q9hUuD8Rqi8
	 BQ8H5mem2AZtc9aicybCuh7OUDvOCT1HpWXJEF8ITBu8XwD2QsgDEuxP92Tu3QY69n0a6
	 IFFTAj4IiH5zoJPPcYvKVIHVKtVEkJPJA1Q7fEpQlXVpIVgYTCT59tCeQNbq5bkoQeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794630512;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OLf1pkZ1wiJ20Rs6pMacxktk9K6drlv7pkb9kjyp/Nc=;
	b=l8PvOHijkt07MnOSkStF7bXe6wIfsXPFvLRo62fD/Rs9FhxV9nKH62LVZB37E3u+HBiK
	 9YUz8+N2Y2AyyFt0uzKktnR4oQbZsdpnk1Km+1OvaSC11JJZD3pmSQi5wjcMNie6UbE2Z
	 bK+ajgyKX9ERwtM+98kN5R/vtpEkLO2ZwkG6yE6rrXoC43ScgjkEw3y3lBHy1NCIvc3C6
	 /2pvf7N4rYPqh0ckM1S0OCsc3jLSTV9t/dsBBW2B/rzKIZ6Vb1xn0RW6i95oYDWW2QKRP
	 J4QjmqYfiSklmOwDh+q4KbBusY2/WFU6nDn5mS39I+Abd52GS7bDmJ3YnmFJqMN6jpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ioDHB81B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oi01JzR5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEF3606A336
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AEF3606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ioDHB81B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oi01JzR5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE20Ehf1040065
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OLf1pkZ1wiJ20Rs6pMacxktk9K6drlv7pkb9kjyp/Nc=; b=ioDHB81BfXceHfv4
	iMY5wYQ068QYisiNVD4e6i3prUmrxrz7G4q76TTkYWwOY51JCRyp3KD92A+Uae+3
	lAsnfLcFYU1z2Pw5b7d4XgVPS74JAjZe/dxDGHmzAnVMuDAGf6bxpqU2W3zLiVdk
	mWkOjtVCi4uGUjeg5SkYUbnZomQxJRCXMHnHBXWsVibRTaobt8lHeOPag1h40eRL
	MXEF3jIOXZHs1pFCjddUO9n7406HaRajkh0GJQR05D4S8IK/J1/A2s+fiBDbtf5O
	6cUdb6VDaCiXb4rYkOyPxe3GP05hnrKpeUq8Vmg1tA1nc/dNmL91GrboX/8WbIEf
	xMaUFw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx6maa190-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:28:31 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-71aca016fdcso954763eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794630511; x=1795235311; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLf1pkZ1wiJ20Rs6pMacxktk9K6drlv7pkb9kjyp/Nc=;
        b=Oi01JzR5vWottlb3A/EUDav8MePPlBsZb0E8z/xnUnshFTWg+WN0SFpaXawSlCpDxn
         k6PtveGu1Wu90+Slgl5lqgPq9oHXFO/qnoLxofTkiVFeEWLpgevjhYXEX4ZcV71KfzX0
         6zPlhRktFz3OjR4MKqr0Umby7PZXd0PbNkzAA/5KLGVR0+Sg28R0T+KGuRFH0oqmMMcZ
         l2ZnvFKIkzyTo56+8MWmcb3DQd/wkIxqwHm5GG773bhGo19sbFXI0roQ2DnU0z6oh8YV
         cIZsZyVA8RBORhJQWDd7WMCfVXL1oTl6Ca5xgefo6SckYBlBjzE/CaHaDFN/bAf5mT2I
         8j7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794630511; x=1795235311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLf1pkZ1wiJ20Rs6pMacxktk9K6drlv7pkb9kjyp/Nc=;
        b=iOirJnBPEhdmD88yhKhKRNrVI+1OnsANjgj+IHjeOGfilRzuTi9y/ive6/QSVXFC/W
         dUwDda5A2FGNjfhksNNPlFlWDTuRI07zp75EK6sW5db7VuLqFm8pYXCdj6ItPHpLeq30
         8CkRo+fCThx4M2Z/kqBe0FAyVGdpWJubTXMW0Mc8+DYoCrBu7Om++wT3VEKPSPyl/tEz
         gRBQtGGHQlEmqfKR10xwaXtTwNr7z0nOH2rrskUzdL7qIdqGZSzvBBBohVFs+iUyztKZ
         P2zKpm92UCrzykMZIFHnEEQJVyMfQtuLK8ySeCqZJmQdO0ZdsxH4h9g+tbMikrIUyfuW
         9lIg==
X-Forwarded-Encrypted: i=1; AL+hErHi53ai4idbPNhCtPtswYynA2AmT8xOeyUPHIauGGKsMr1vw+dXHHXqqJUgAvKb4ZiN9RFNqWhSCwismeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jv+/H1od0z9QJbrliVITuuF4gn6hOgEKnVdnzOO6UmCjUnzGn
	lXzMDZrPZBtuKFv/QLowtamvE3DeN4LxAd1rTyHjfdHpna5nrUvwHYZIgmIlyIGpJ1OXFWUWgGp
	bIC+tXsh66qavDet1bdFFkyXL5VFmYn3kLLtm89koy7lD64UQd4KqplzhdVhZ6ml/+W0=
X-Gm-Gg: AYBFou12KjBXl6QdM16z6ujawMaBL4ccFqPkCNHVJ/UYBsPswjPZI8L/WKS6OP0+6BN
	IGAU8XlAF/+Ge4hqehCIjyu/70HuI2OzsZ9xUWUoGbz4AjNl0DLKsjB+pp/W/9fHfztJa89JP2f
	HlxsT3q05oWBfOexV9XJ11F3p0xFvEW98Ay8aIH8tPcV3MzuHHr8WgDdQSbcmiiijrcnRPmxYGh
	cAuPOMxx8H3vwuQMhHudcEQjT5GJuyvnMyI9ahhhBqVQme8qMVERiyCYnSeEu39uRld3YdjAm1+
	2YqSZ8jkbuOzIBCuJuSJNcHMjzTryScm2QTdz0LxQQF1GIKmzrBvUOqYJorJ1DJ1IGBGaohpQOp
	3AA8oTdVg4bHJsYah+jezanLeKTqxbqgr/BbZltwSS8vrQFwvgClzrz3W+Y1yg3kmPQA=
X-Received: by 2002:a05:6820:c3d8:b0:713:e433:f41a with SMTP id 006d021491bc7-71ab4f90849mr2009252eaf.25.1794630510612;
        Fri, 13 Nov 2026 20:28:30 -0800 (PST)
X-Received: by 2002:a05:6820:c3d8:b0:713:e433:f41a with SMTP id 006d021491bc7-71ab4f90849mr2009242eaf.25.1794630510169;
        Fri, 13 Nov 2026 20:28:30 -0800 (PST)
Received: from [172.17.0.1] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab3f44dc4sm3292269eaf.0.2026.11.13.20.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:28:29 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 22:28:25 -0600
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add ASUS Ascent QN10
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
Message-Id: <20261113-qn10-v1-1-e09b2aa7ccbe@oss.qualcomm.com>
References: <20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com>
In-Reply-To: <20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=S6c+yjHeZx/zmv15ipToxQXjhTE2iJLWHtMISivi76A=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBq9+NrkGbtaQM40xsXsB493yUVs9ZNBFhOl+mSp
 UZUGWk9LaWJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCavfjaxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUDpxAAm9Hl9MpWhIv4CbKN1nXpIVyQbzrzB7bdMbTpbIA
 eCAEK2QDL9wTQoMup1lo2DdjIYRauXdODw1x28dcWxj/J8ZWXX+nEE/X94Gv/v0yNdeYThqHsHe
 MvpHYbmcVnWhqTixkzznQeUXPV3lr1UVMiXi6qQ/Re/lbyiWKv4iOsEQTdtnyf44SJatkleT9Uu
 gLQVhm7J9lmXLm7iKDEVEOeNiebyUvgxzYlgw08J6KIZALtm0gCRZipWRyehfW6sMJWzp8Brcvn
 EQwrOME4C3dPfWCz9qSMlDYhMrbFwICU1iTL/3DCgHGxliACkXv2oXh7v9EpnABUYHskQ82GPDG
 5NdFLlald2+JYz9dGAoN0X9JpY4UpEm/W6/93yfuGARjUKjqSpyhzTdsPudBwKxl8h7QK4VBk7F
 1yoAWDOZ9jCIZEot6dnsxkJDsqwYqd1F5QAyrJS+jsCHMLtOWADYHyhQpJVUVYUELVN3CaczPve
 WGdIbFOJLjaQ1v1FqnpnkOJhUHbBQSmSjoPpwti+2YeKuza0797mGu0Egonf+hYZXMOkUdq1Zc6
 xhl4XWznkYOYkVMB+rIpsQ6WR8rl6KFPSgH3JSsFy6198xvEyq4EM8tye7a0FereRo386p7RNWq
 6C4kt1jS/QO5skSm33HhM1r+7a/C/IfpBV97alV6NLsk=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: 2MTqqmUW-agR7_z2awoNfTe-LYNQkwaX
X-Authority-Analysis: v=2.4 cv=RbcFmFtv c=1 sm=1 tr=0 ts=6af7e36f cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VllWacnbf50EjFFOaB8A:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfX1JKxGrm9mr+g
 K3+X60mhDQGnbisuvFfwb2ifVQIxODmPWLxrSo4/LpELZNr9tXF/i8VCm2OjF1jE1l2UusBtF7N
 HvjY/hRhFGqzUaS+3GIQ9UYErcAOn4PcdjPLumTmQmTlZItUKEQteDHrs7i9n8xha2+0Lw31/55
 j59vUTipz8y6Qxfsw75LlT3zfbNu9OtFGc55/PBdyug0CQhnYEUaOimuvj+Y42z71YusAA6T2Io
 0SoE9piae1CJF+HuspsXlDdjhjY5jIK/bLjxZhDlqnF4FWuVSV3J6kaMKrkIObWtvS1bjpmlb8O
 gx8BZJAJKW7x8V+v9r7gLzAdyrjP71Ax3VnnB5QPJFVY06W5jLxfMhMFrIiPz71a2sweEVCq2jL
 TfJAA69l0TG4NmNb0u6Fi6QBR9hYzJIQuQ6ExehxrP1fUTBV+csLOjVozyslGdvjlm0FrHKZj1A
 MDlF3/vknJa24JdjVtg==
X-Proofpoint-ORIG-GUID: 2MTqqmUW-agR7_z2awoNfTe-LYNQkwaX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfX30G7Jms2OcmC
 yLS0I/n0TsuMEtqy/+VnUDIsn6nAHnevPIEXzIq1u01msbIFpqdKpjOjbNi7IlsaEhtsyRKQFnw
 RzkghOsXqhRfCF3cicrlnG74BDMXND4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140017

The ASUS Ascent QN10 is a compact desktop computer based on the Qualcomm
Snapdragon X2 Elite (Glymur) platform, featuring an 18-core Oryon
CPU, Adreno X2-90 GPU, and Hexagon NPU. The system comes with 16 or 32GB
of LPDDR5x memory, two M.2 NVMe SSDs slots, Wi-Fi 7, Bluetooth 6.0, 2.5Gb
Ethernet, three USB Type-C ports, four USB Type-A port, and HDMI output.

Add a compatible for the device.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..a7157795870c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -96,6 +96,7 @@ properties:
 
       - items:
           - enum:
+              - asus,ascent-qn10
               - asus,zenbook-a14-ux3407na
               - asus,zenbook-a16-ux3607oa
               - hp,elitebook-x-g2q

-- 
2.55.0

