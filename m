Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738908;
	b=AQwNoccdsh9DCJpqtJnPlwqhMAH0HoZhQRszZyFPk/NNuNjGgkaLD+ZCZyUXc85/kX7h
	 0IIwMI75n1W3CxnGeOHIghLN2J+mJ2TpiUwlZFGT8UwHQyjOIxgC62yDI2/iLv0+RDVS6
	 EI4XtjrNesvQVZ78F8OodKL598pO8I3dfT043JMOSvmQOj/ohzJ0AiHuhgsvQj7v9N9dd
	 h/1UsWVmC9HXrsoBQbtShiEETVHCb2+p5OE5joPw7gFHO4+fKdPapNnRCGyLK+DTJoieL
	 i+wDcL9jYCOTpJHXQB9vXJ8GK9FsP33nU9Fpvd1er518Mvx4qYWyq46EgIf8RepNvpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JPK8TpslLB70Y0ZK7uSlOz+BfsMVxoZ5QXzjmcBIqTA=;
	b=vtjTu6F34vjIya7RsG6QcHKyUZroCIt8TSfr4pdNgBZ9Lwco3u+KNbtepKs89++1mGUl
	 GWYVH0ndvPeTP7OhNK5pqaWKbDM+57rOv2sPV8vhpaZ+3ntcBNdcrxehlSSIiromtmqE/
	 jo5doYPBKJTzutK/Q3TzZmGvv3pDL4JbWE5ECAZh0DQSBr54xK4ZJkmKxb0akwihnXfhL
	 3ZCVAy9EopXWwbvtfOnptpIbRyM3UJtTMKtm1etl9lYyzWrCgfEQ+pjNO5qy5mafqcViu
	 Un3tWPDZqnXQGgxCz08C9dAlTUYe6W0HMcfkFu4yh7JIMMb3oY3T3JuCZoQ5hP12mHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gIx07uIp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBmvrCJs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678F9606A331
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 678F9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gIx07uIp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBmvrCJs
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1EtpB2389426
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPK8TpslLB70Y0ZK7uSlOz+BfsMVxoZ5QXzjmcBIqTA=; b=gIx07uIpAk0MAa3y
	XfM9O9xdl/hoqcBEf02hqOhSPN2l5cf0wK0tzBPEPz7dRf1Mpk51Nf1hzornWqf6
	cDubKLQnk6/lTEUdG0rISQYZwQSp++p47xTmMCTgdUFIUjkhW1SuD+Ur8EFMjPUU
	IX7zzrHmilfv4vAViXxwnrdXi2dD5wK6rdhtvZvPk926BpjDURWJMeGq82Vgfv7s
	Jp2z67p16pl59Wm1UNBhrSyuIxQDUR8W35OrNEOoeU8x4j9WDQ2jMfZR7aU13p7l
	U8o6BYT8DnwPErGf2cK7RueV8qzIOWfKuacki28+v2VgV7Bc+Qyhbms858KZiGNB
	0h3fpA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpac1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:01:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd65285537aso245214a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738907; x=1793343707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JPK8TpslLB70Y0ZK7uSlOz+BfsMVxoZ5QXzjmcBIqTA=;
        b=WBmvrCJsUoKHvIJTNxRzS4puxpfFQ19u601rHpaTH+pOeCkd0Hl6KwufVnUf3sQ+84
         Fv6N7FnWuhte804w37uhuNMH3+7EgzLOxYKBOdMH/glTpAP9oj+TxrzpEErVE4Xj4/78
         fiisZfeIHyufwbi5w/cd28i0/p3+tcK9Foi9XY81QYaVOMBNlK97P2yAUdBT7HkLy+Ul
         ViANqZkqOpp0E27BZvd5loyMiR1GLystpG3Ux+5JqwIFB+/8TW2vMIudJGu6O4USUD25
         sc4QE6/e46k0ytQk0KhU0uvFTnXF+hhIrkDOOmuiJRgDKs0hNI+8lFZRmUlxubXPoHz9
         PpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738907; x=1793343707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPK8TpslLB70Y0ZK7uSlOz+BfsMVxoZ5QXzjmcBIqTA=;
        b=T/tZZhRzOJC32UVHyOfpUK+NAVx3LBftRMKn17Tpnj4+IJvxtqb9Nj/iadeF7H07rS
         a048+d5k50C8J0BkZc5UWYx7Hvl4V71+C6qgbv8wtltOFK6MKX8FnqOBz7ktpgaz+MgK
         kynBpDsXj03N54NLYASva7t3RD2y3xeviq5KQgZg/+hVO++xVIoDZrHBYleizh/pi7Q3
         ph24FZYY+FqhMYjogSIXQJFh/ll1M/CPMSu/siIO1J0wakV0sJ4oXMxyRPo5J/ptRI1J
         uwq2koqVJ6dWNFJ85+Q28b1NlRqMbXQeCFPfZezBzdqC7sUWCWfXPZu6k5HKXdvlol7P
         j0BQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0ub8+sT+qhoOr3O2ZFNsegqstrNCMDNOMiGZoLZGXSSRJSnTHLBLpybnEsKsL4q0Vacx4Bt4TyKk1cm8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLi7Fv8fvPCPTLSB3KHgcJvttmOu/HxM6rm5mtnetQQvDrpt9w8
	k2UHB/Bjb5CSOZDi/x3G8fa4Ju7yyddS/gFKcZMykqQG7DwtvQ6R5PK4+kT8zbfyPMcUu7fbMCe
	SxcrFJyWQgTfIElBou6mIbB7Or0qTbh1rcVBWhjqWUKxGABOMIxaWpXa0VS447xZblSE=
X-Gm-Gg: AYBFou1Ktu5OKqnJQZqNC3JoMzKQ/cmEaRjW8rkVhAo+PCXF/yokK/ilQtbWi7lAM8w
	iFBUWYi86W4jc3Hdi5FuBZsyM1Hoj+izC+p5SLrVkcGVjk5JrM84GxfBgeeJoQA3PuvF8FD701a
	m3uQ6O4r5epH4UgeUd0bkenSW/Bld+5eb/1kPa/78ZK91hz15LMMavBVRMKp8MXuEbibCzOeI9r
	0ZJp8B0V4AcDcaovaElmp414wjltWeDNo+T0sd/LMsRK9Y1dpmpTU/m+vWXW4FM4aTHnwa3nX5t
	92CDaR/bCAOtZzzrngTZ47c9U7AFV/b/Jtj3DCNI6ELGWe4facljdNrGa+QZjZ+CBXtarQuaEry
	Z1ulzP6lBIzVmTEYtpXWg6HD4d1IIYvjc6zCDkLLJVnzp1PICP2BXQKR5sBb8dHSKc3O4d3MpdU
	ksPuosC30uQBK6hcPU2Q93eQ==
X-Received: by 2002:a05:6a21:7704:b0:3e2:a935:8bc4 with SMTP id adf61e73a8af0-3e369227495mr1035879637.13.1792738904464;
        Fri, 23 Oct 2026 00:01:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:7704:b0:3e2:a935:8bc4 with SMTP id adf61e73a8af0-3e369227495mr1035854637.13.1792738903977;
        Fri, 23 Oct 2026 00:01:43 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:43 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:10 +0530
Subject: [PATCH ath-next v3 07/17] wifi: ath12k: Add hybrid_bus_type in
 ath12k_hw_params
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
Message-Id: <20261023-mpp-bringup-v3-7-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX7dmAilv1ZpX8
 um64Cs6afhvaph4MtKGwJyZpZXFMK+INIUIJ8HlELnt4YHFQXLPocbzbdwsC5mMyU3Nu63jPOns
 IIsGoP0Yn6bUwNC2uFAQB+yyIH4hzq0=
X-Proofpoint-GUID: zVQZK0qnkJCIAHl0ES8qEYMc82LFi-f0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX4hVlW6p1gUiE
 C+/4f3PGrrSW3hwCVJWa0HEQhKDdo2MDocguQpdHDx+N8ZkJi7pC7TXR+Y9d7P5LJuAR/3ozGFl
 zMQBjNlKKSRKp7QgjZH33mxkr71igpC8FN3E/82y+qeYq9PAYTVpPAPkVxtXBDD1pYozQuxNhF2
 KzXv/Cb8NjGUct+cwSlDAkJRnMqbjbFx8bZbDcVHqh8RiSP4DVvv2aXYKoViTcsXmLFcyGtq6jH
 esJkHPdtAHgIAFQY9SqjZr010O96jjNcrVr6tHC44IPiCD4dC1o+GifQo0GarJxNjwWBAf30VTZ
 xu6l1r3RMo4hGIGOY+sAeTvSn87C37jLhCPNjjZY1hoG8Lf4/hYEKwHMua0M0UtMQZIKq8vDc/d
 DS04K8y6z/48BCS9dXyJrhsAB3XH+xGZ4WWNqAx5vWMCjNn31Zjudmbs8gxTwh36fjpyZ4eg7F+
 3HTsiGA3buYWTG4gtgQ==
X-Proofpoint-ORIG-GUID: zVQZK0qnkJCIAHl0ES8qEYMc82LFi-f0
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb065b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZOe4Ua_9D0VdX46zIBUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

QCN6432 is a PCIe-based device attached to the WCSS Q6 processor,
but it is registered as a platform (AHB) device. It uses AHB APIs
for probe and boot. Because of this hybrid nature, it is called as
a hybrid bus device.

Introduce a hybrid_bus_type field in ath12k_hw_params to indicate the
hybrid nature of the device.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h       | 6 ++++++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 833aa6d43ce4..fb807d5a6ae4 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -240,6 +240,12 @@ struct ath12k_hw_params {
 
 	bool host_alloc_ml_id;
 	bool advertise_iface_mac_pool;
+	/*
+	 * True for devices with PCIe hardware registered as AHB platform devices.
+	 * Such devices use AHB APIs for probe/boot but PCIe APIs for operation.
+	 * Example: QCN6432 (PCIe device attached to Q6, registered as AHB).
+	 */
+	bool hybrid_bus_type;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index acc4eabcf2bc..f7992f8c917f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -498,6 +498,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -594,6 +595,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = false,
 		.advertise_iface_mac_pool = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -686,6 +688,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -772,6 +775,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcc2072 hw1.0",
@@ -869,6 +873,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = false,
 		.advertise_iface_mac_pool = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "ipq5424 hw1.0",
@@ -958,6 +963,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcn6432 hw1.0",
@@ -1044,6 +1050,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = true,
 	},
 };
 

-- 
2.34.1

