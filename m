Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569353;
	b=gqA3UjM+KvUvScC1bUtgReA0oZJO0vQbaqUfsYn1y6k2nI1AWDhK4G/pJr0rzvbm15Vc
	 YtG/oVTMhPUv7nolgo0VSLl88JghmOdkamK6ze7X7mJETpa50f2edyt8XO47YP1XaXf2g
	 lrCJEIiH7HlrxCo9s3X+6q+HR5QHUdjjN9GFjv2IPjs0DD/J7a+rxVJqn9KBGenRPtrGX
	 4BA0SeWxIh0cIbT+raExVT2Vfl6ntpt8IF8JnIjT97ACxTqMdPjt1TiDkH8wylxzKAxk9
	 +SYHOo1PRhUw0maMPQqH4Z4Mo5tYcSYeZMOLaXp1oCx/IDWvXeGqU4vcdhu7sSNepCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569353;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sPacS5uKz5JBbuz3gbxJw12erSXij4kzMnxn038/KzM=;
	b=2SFR+6XJC/rVhzidMsb1hmCjs0lLSd1DYUYPZO1qwha3ptM9/f/u8ERg6tf5IhU2eLlB
	 aM8X6DYRowlICwLTd0zMaujaSo5FPf92Uy87XDYOnclBDjpD7nIF2smYsAJlu9qRszMIH
	 CVXZzzlI3uPzaOHB2nJrj5ftvZieIffnj5LTu5Vx1VDDVFgld+pzlBJsASr5kqoeL0JQ/
	 iIb4FlSn0WAd5WytmbNUxfQsyJLKAlxJ4yS3Am2S5WdPqewjcB4rEIxfuBM+65MSHZzfC
	 ZKRRIUj+/ittTrupfhKAQlMrx70s8ebZFM8LNNDTETyVl3MVosmM5a7xrn/1jOs6aSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Of89bIrr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RQWqqHYs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FEA606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47FEA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Of89bIrr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RQWqqHYs
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V0AP4101625
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPacS5uKz5JBbuz3gbxJw12erSXij4kzMnxn038/KzM=; b=Of89bIrrlsR8brhi
	xNAe+TFPRCIQIYnNTaUaweKZ8zsj8nfy3lyhWatEEdhd1Txt9wikq3jq8Yh+nD64
	oR2Oi4GVJzcrecjUkPo9HpDCngNQpNkqtwwUuVsSgaF9ioJMELgDR+N8VGRe0JiA
	iNUTjE2D4GMI+J5mcN6Rwd4vkESaRYnlzfCZylKUgkOOKSw8MA3GOJGeqv4Dfhlb
	CBEGHaG7UklB/SfqoYUzdpsHtTUQX1E5Wyz+fQngc6paUgNxe5jy8d4iMCGC4MOW
	+pp35vv+4IUZKV2eqSSBIEGmrqPqfZY4tO9Ef7ucAf1xheVk85l32vGqdc+2NpH+
	9Vk55g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdjw71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:29:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37549877380so1120978eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794569352; x=1795174152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPacS5uKz5JBbuz3gbxJw12erSXij4kzMnxn038/KzM=;
        b=RQWqqHYsKoMt8SOPgGKvCGr4tHTrvsZ8DqcI7/1P+/QzKkGhvm9Yp0RuMfp/tYB5Ih
         VAonQcWrsd7EmzHJbiRb3PY/ZyrjImVts8zjOILb07sfmfjNqbKHT7EO7nKh+nLaEwJK
         ViS/uCdJbpjaFMY6tWasvXd/O534fUqqVjHySh+p8+aXQ8u2nw82mEMLtgqqVD0bRHh0
         o6gQH3wkO1cmEzFqUiHCj/+BLNEiAYEdmvvCyrkfvoPoi5EgFZuGhTYhtKyIP1BzTlwJ
         /jgaDrb78E0NLan2+Pbrlk5Ho3Hr/vZeJC5pAOsWW8q2Yb5KvjjZ/ovf9V5sGmZJVJHM
         vIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569352; x=1795174152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPacS5uKz5JBbuz3gbxJw12erSXij4kzMnxn038/KzM=;
        b=a+eWje7dIBMWkCBuaUuq/eNsrF5AixDGZxVo7dIrMHsyMHsqth7XtXQSggNeUD8jP3
         1mIMWpcmBAA+S1KM5Rta84dfNpmtcvhefgpOwATBNXTwRi7U5SUbh84qnxA76kGQU1WM
         NbOYCbwX7yv0dRXMQhU5UkErutbNQ0pmva/ylmyPnaXd9uVRA7eIECL5ns4bAD07xgRG
         uOdpFiEoTG8qGItagHOsNddNoPOjGSc3UVZ4qy2RcgB5el0mqYDLDZ1xA2nja/8EF/gw
         6dBVxp+t06Co4A6TRvaFWdQkEW+QBY9rw6I9XOfuny5ptJcI7hDP8ZdiKkpX2QonUDvj
         XOsg==
X-Forwarded-Encrypted: i=1; AL+hErHwpyxvOkwnQc1wsYHbV/BRN6CSDiVBKiiTuNAnqy2M2eso4UD36F4ntEMcDoXSg6AP8o3gU8uNUXbP4Yg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8OKtw7Gl/uTjA317XzmSuJB41rhgUwBYH5mGN/FUvu7MD6wsl
	WoRIXlUwQJUv9XnvQM5hEdBdH3zvzYQ8CqVmViBhIDZXxDgSwkwl8foUXBr9aBOdZ6vKdgu17fp
	GKLhUXrYgllPBshLcT/9MT6pgLaRK2bPNhsAGoiDHuxI8zjrWoKL+9qHXbIHQX8ZmR50=
X-Gm-Gg: AYBFou2iQ3tPhy601Qvkz9XE4f2qNz6oGTrhpQG4zvX3p8VwAIqpBPcvvKEvSH2Uoca
	HPfMXBUOa4sEOoQEQ8AmSZWueIOAFginhQL+kOd6EyKT+U22DR9YBoW08OR/YR2+6iEWzhtsrYx
	DRHiXemzgXQUabQGi5Ltsf3MuTjuKgBmGst/q1LWMBc4JbsUcaA5DkdsTByWSc5yqUC3btNAuTB
	dFzEuOJw3ZkDI+TiTvGZcEl1z4BxWYVxAFEwDUolJy6C7STlo5Y3K6MSSGcAMhhAp8++rw6MTbf
	+RQYMuKqD2jTcPM8KQ3KPTP1MXNJnpZTe+5I52C6m6ajUXPnL6dWWdgEEMzRIF3lrKBKcLHuELX
	U5MSMPtbREzvRLfnrn3UTjOWKZ4JAPrTvL2rNK6n18U1HdpWL0owO2MybBpkv4kzH7JW8Sy/7a7
	nEm/ied2GVog==
X-Received: by 2002:a05:7300:c386:b0:36d:e4c8:8f04 with SMTP id 5a478bee46e88-37967506f25mr2157617eec.17.1794569351726;
        Fri, 13 Nov 2026 03:29:11 -0800 (PST)
X-Received: by 2002:a05:7300:c386:b0:36d:e4c8:8f04 with SMTP id 5a478bee46e88-37967506f25mr2157604eec.17.1794569351198;
        Fri, 13 Nov 2026 03:29:11 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d73dsm7342924eec.2.2026.11.13.03.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:29:10 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:58:57 +0530
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add LeMans Draco EVK board
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
Message-Id: <20261113-lemans-draco-final-changes-bringup-v2-1-3ae8cd1c9932@oss.qualcomm.com>
References: <20261113-lemans-draco-final-changes-bringup-v2-0-3ae8cd1c9932@oss.qualcomm.com>
In-Reply-To: <20261113-lemans-draco-final-changes-bringup-v2-0-3ae8cd1c9932@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794569340; l=1436;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=7rKXgq1NKJQpUYaFuu5Z+2iP4kdS+cscX2k+ha48s8Q=;
 b=m+NC7zNqcRvbwVTdgWAyA9AI+iJ7VY1OaPtEx2KM3BqndbnV8kJ9tLtyyN9MUG54CA8GMfvPa
 BYiL7Xgn6vUB/beXsS12D/P4SrBbSQVEp1AeSmlhBfv7lS3YFaBMbXB
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfX9pmMlmdcQMfi
 z3g2pmng5vFFZ3Fyxe5LFug8KJymR0wcGMYQSS/JUA92TSNaumVJvvPw/5M6OfM9JPyrXL4DMUs
 LQzk4xzDpf8bwmoJ3QkHi6rIx7SeKpU=
X-Proofpoint-ORIG-GUID: Rxz-XzH5Ne4HQICzQa7rsytD9Q4lreUH
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af6f488 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1iP3MDFSonxPIfbD6BcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfXyg6lZJ4scYj4
 UG3qhJ7cM05/QncJ4o6beC7cqn+RmYdwhRh/riV80pTxwMj+umvYjj8AdPBFbJxMZgGVwyfmLU+
 17pYIFYpJt8vgw0Mc9TI2nmjjrniZZiuzGsiHtzP9bbWE2TI1h8QBZoYQjzyh+g8MXcXEvR4LGP
 MFYmIdDwLJPeTxoicUsQ3Rrnn7yXEF0VjqCD7pHiLXpfJzcTKjMa6qV/Bt0C5j5Q3hnWzJ2LaoM
 tgU5WMIhHeC1ebPS25RKoiTdBFwHdt5wsamazPplMUvWcV+haR2BH4PEvUsrpHW22A8QuBFsnws
 mPJSsRV2mxAa+ydrUlPtqJPcf+xRKZRepq4TYcbmyIE/xr9dQBP7tDOWkua7/Nu8e+kTRwCjboP
 444pHzEmosQsFHOiICTp7S9o5T8UlGZlnNWME9xmROtbOQKZupwV+acQ4yIOS6ZVFwVf/fozOFQ
 0CUTRoL8SoKCUPsWXvw==
X-Proofpoint-GUID: Rxz-XzH5Ne4HQICzQa7rsytD9Q4lreUH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130045

Add compatible strings for the LeMans Draco EVK, an evaluation board
based on the SA8775P/QCS9100 SoC family.

The platform uses a two-board design: the LeMans Draco SoM carrying
the SA8775P/QCS9100 SoC and core connectivity, paired with the Draco
carrier board providing application-specific peripherals.

Add two compatibles to model this hierarchy:
  - qcom,lemans-draco-som: identifies the SoM layer, allowing the
    SoM device tree to be shared with a common carrier board.
  - qcom,lemans-draco-evk: identifies the complete board (SoM + Draco
    carrier), used in the board DTS.

Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 07ef7988b068..86edf4df2d96 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -503,6 +503,13 @@ properties:
           - const: qcom,qcs9100
           - const: qcom,sa8775p
 
+      - items:
+          - enum:
+              - qcom,lemans-draco-evk
+          - const: qcom,lemans-draco-som
+          - const: qcom,qcs9100
+          - const: qcom,sa8775p
+
       - description: Qualcomm AR2 Gen1 platform
         items:
           - enum:

-- 
2.43.0

