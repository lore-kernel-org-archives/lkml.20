Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655822;
	b=ohhD0zUfK6FZszCkc2C/BSFitPcA1gXh7IVKgzQ1QdHEMLHR53bb9Boci2bET1P5qkJ8
	 60D3sghqahp6kESBnZNnSuDxusfegzC38PrddPhOHkIUzLWrjkOJxDfAUwD4gI+b/frBC
	 Z2EewkVy5SF1kq+g+odtxOieib42v/9GIzdoGl0iyX4iLwKK78E7r8yj/PibfVgxdT0tT
	 v0f3lXRyEL64idfDD2Ss5mOWPMyFjdGdeaNkPgB/lphL2P40mIF5gApdCBJdM44Qy7DeR
	 NqPlyceof/GPyRgenPXUn7WcE/8lYCrxrB+kxceEy2Tol4ixZy6QHRfwAyNHAtgZJBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0VLhsygCS1Olo/ZViAlUiziD8BIUpbLiKISOnmtdtZc=;
	b=FJ/e0wpnoaW2yIGXzjfEY44OnqVVS7EkoGH2HAfjyfdTSuT8nqD5OQKJbTVS4baOGjgy
	 XJWPu7GHOs0LW6IOkaDwvXAuBNLUmPY3rKWJnbFcayNWgVo03m15xzFJ7jzdz0QLH8rV+
	 QojOUiUey2rZykE0kUpCQFxWHvKP0O45OMTHrCV38gsz5HHuiZZfgiKO+wtH6IMDaNcZv
	 1um6wGnJUVuJAYt8fa7GIJwmH1vIgaDw6/rescDbS4sgdMLu4JiARug/RI7VhIJVc39JT
	 cxPzpB52kKwEHFcZflluXiXwyOHxhZah+nNxEBkddSsVlbuPGxk0+x8U4cE/zaviC8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hrUqSBNx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jPrzJt6l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05930606A895
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05930606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hrUqSBNx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jPrzJt6l
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9w5A23716021
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0VLhsygCS1Olo/ZViAlUiziD8BIUpbLiKISOnmtdtZc=; b=hrUqSBNxl0OhVcVu
	ZMUuKtyuuc+Nz3/z3hx1n77m1AdqYrwqK0IjQwnWQ6NUOAmw40/8PGIPozFJjdWU
	AsimbXLs/4kWwEB1F3VaMxVIKAzLH/3cq55/oOkHQaZN87DIKZuQoIHPabEPlUpt
	u+sP84SyodFOzrBe9HeKiRSSlHtU0jAMe8o10IiW8JZtGOq+elhhAH5klKovUCC9
	aAXxVaafS5D+n6Xo1NuAapGrL4EpXqQy9s6LthQj2xauLw/k13RwHm9IxKVpsm16
	oFUWL0nzwAbaSqtYnIeaNILIbR9j1i+QCrf3VNmee/S9eheSq07XUPrd+E/u6fFd
	FYgSwQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk20m02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:30:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91eaad6eaeaso39725916d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655820; x=1795260620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0VLhsygCS1Olo/ZViAlUiziD8BIUpbLiKISOnmtdtZc=;
        b=jPrzJt6l/s5UHbGb8s71B2xr74KxJeaAKfqj4xLklQ3uCC73SEnCVfUlEv1cWhoZJo
         vnrMXMd5enTAOM6PkTADcAStPZEoyG/+8f3P7ZzsYreCDSzl7OpdNFjRLA5Ea/75yX96
         XxWR6Nf49nmwGH5MoBr4uYu+F4GDhiIcpgh1GHYhUy9ZYPgJo/l4DKC+2Gcvbudhkm6/
         hgJ5mUlgsjGkXo9cM4QSYq7jvGwp222wzwMhuO0ccUcoaIJ6ow7x1FwSKHFpEZGdM6uO
         69q+2YP9x4b4UUc+fwQQG9pO4aLlYJWcJabSJxeQcsKacyjRisCWbKLc4NmTkRqPICyY
         gvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655820; x=1795260620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VLhsygCS1Olo/ZViAlUiziD8BIUpbLiKISOnmtdtZc=;
        b=gSrXmgx/YXufDOPS2afoHbFGJMM4GchAacniarYHdWRGU63jj4NIC6XyLzclYzHXFd
         OkOpqsb2aXUWyRY/SWgyakReJebKIK+iHRQec7N4iGYkVtLY1Kh9WS3ACF9wXw2bHJYt
         FOU4Ocr1aTPlXxXCu807ATrC749qhdS8S/X+uSHG3ih2PKhNVenTTh7RUczDByqWjgfN
         vPnRA8LRcnQCedRTML3wbrCs0DwCFx+kbhlYmYpEnVvdGGHGMDsLtf3MVH3Dp2C7hqra
         uZi477geswLdoa/K2IrrpEn63CBVdw0AA7QxZGSamZgC7Kf5Qy6NeC/mhZnc5ApfXGwc
         NH0g==
X-Forwarded-Encrypted: i=1; AL+hErGxqZVGg51Ret2BIucGxQzo4ANfF9HP+yc0h9d/SOWtVWwvJiotzQtQ6njqvwKPp1QkNGWTJOajOcqalKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AkfSBKvIwDxvUENzSE8vhLTMziHPBbLRjSfTy4cUhGlVf6DNz
	ZDihM85GEBIKwtpITPFizLY8tZAZXDEaKY9Bo+9Gaj5NmAxZZNeQ4jStZ8Aqk564HlPzkNnjVvu
	ziQRAYQ3y3Kw3pHk6/b/nNkVOvJik9/M9fZcCuo6iwZOgao1viHedV+voF53QIyGugFI=
X-Gm-Gg: AYBFou3w2YmQ2qARmFTcs5iFv231u1whGvFSY+tHGF/6GC4Nbu7b0BBo0uVLdBXm+Pp
	gOMhrtVdB3fHGyF2m6oE8OM9l0xUc8VCfrY3Bm1c7hsfzly86zmav4IV3gPv4LZxvYUDK72ccAp
	l/Tah2jkewbS2m8LVbyMt4PSSK0nhx6+eYCNekf/4we9DjzW1maH6UiZLYiaAQFk9lQiRW9ddpQ
	OACL00oSHdx1BPcbg1ps0V+xFkgWtPdmTRtxLAk0xmWUQXRa4m8wOWXLWiuevWW1YxHHqs7DPjE
	JW7FCZDaRB6WuimqhnWHqKkcO6DOTfGENYbhus92jqLXyWG8rRK5jqNbtwTwZRTUL1VrgE/AiMQ
	cwTQrAFWbQyv5UbWWSYkzrkS1tf1+yX9kqP3tjTMwxCw+dWyRt3c3SCkC2yW/U47WDSCQVLwPr7
	kS+ySfenbm6cVoak87lfmGjPpEFA==
X-Received: by 2002:ad4:5def:0:b0:91f:1de9:97c9 with SMTP id 6a1803df08f44-91f24213187mr87460776d6.44.1794655819849;
        Sat, 14 Nov 2026 03:30:19 -0800 (PST)
X-Received: by 2002:ad4:5def:0:b0:91f:1de9:97c9 with SMTP id 6a1803df08f44-91f24213187mr87460236d6.44.1794655819313;
        Sat, 14 Nov 2026 03:30:19 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:30:18 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:21 +0800
Subject: [PATCH v7 04/23] dt-bindings: media: qcom,eliza-camss: Add Eliza
 CAMSS
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-4-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=10168;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=cF6VOsiourzLT1KEbZyHYZ5zkrOhPR4Jmv9rF5Vw16Q=;
 b=dFHopXgu5lBP1B3akNl/HEjkhcgLP0KmbXNe8F5mooo9axzeq4RpdiNQXbjEXcJ1anGCvD/f8
 vyLIfuTJ2yCC46WaIyEVe+omLkkiR4GuXOWknzXd/W3UdXs1L7veEoT
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: 4TmR0QYxEGCM3j_0tuVc7sblHUMxo0sS
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6af8464c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=nzTIdK0Ps9Aro55Xt-wA:9
 a=CwEh93l9g52l-ZXh:21 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX8uyoJAeLztC7
 vk2ZHp5tZoZFC2Ktgkd9P8AImBNucJ0sgyu4xLugA73Kyt2j0r5lyOFHmAEKX9xrsXmIbkielxi
 glFg6Ihxc/oCjU1tLQ2AXsFWvOChQejd297ceCa/1RGzUBubCEMDXoq3LcLXqsRcX4ZNRzS/dLy
 KttQLTUWFQIdpDw30gp/58vXiR/rPlMNl0YuTZQT/A4JquUa4RzJvExfvGcxvj2pQiP4TgNcPtg
 oP1SiXYFLOxMT0j/8LqxmHW5qnFDzv30rCgxk6sr/J6k5tg8Y6XHOcnMyNo7IcIi9wlOTLUFEeb
 KKhTineJb4Dxmv9fXGE7iYM1EOSZcNi2WDyF9CKbljuSsAJbIa7Nrs8fhmpAkhkJdaSG8krhyTu
 xFkwwMwoi68loC7P9sLPR3DGjQ5Xw0k4JBAT/EWknx4OmK9tpdoFoWqmO6SU2yiuuBM1L2IHAG3
 z3q4n5BxY1gWrZ2gyeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX2OppvpMbHKxK
 6RSQbuDPxuuWM5qfMKQX+wqnam0AEUDewCl5WnbnvKAYdyvXpu/HGUFSFPhWBtsSyaV2Gk6TADT
 7C85P3/V58J0cal4LcNknnLUf+s/d0c=
X-Proofpoint-GUID: 4TmR0QYxEGCM3j_0tuVc7sblHUMxo0sS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Eliza platform.

The Eliza platform provides:
- 3 x CSID (CSI Decoder, version 970)
- 1 x CSID Lite
- 3 x VFE (Video Front End, version 970), 4 RDI per VFE
- 1 x VFE Lite, 4 RDI per VFE Lite
- 2 x TPG (Test Pattern Generator, version 2.3.0)

The CSIPHYs are standalone PHY devices connected to CAMSS through the OF
graph, so they are not described here.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../bindings/media/qcom,eliza-camss.yaml           | 282 +++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,eliza-camss.yaml b/Documentation/devicetree/bindings/media/qcom,eliza-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8775ec6a2f69bad38bbc3e91c6fe285ede98c219
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,eliza-camss.yaml
@@ -0,0 +1,282 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,eliza-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Eliza Camera Subsystem (CAMSS)
+
+maintainers:
+  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,eliza-camss
+
+  reg:
+    maxItems: 11
+
+  reg-names:
+    items:
+      - const: top
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: tpg0
+      - const: tpg1
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+
+  clocks:
+    maxItems: 21
+
+  clock-names:
+    items:
+      - const: camnoc_rt_axi
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: cpas_vfe2
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csiphy_rx
+      - const: gcc_axi_hf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: qdss_debug_xo
+
+  interrupts:
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+
+  iommus:
+    items:
+      - description: S1 HLOS IFE and IFE_LITE non-protected stream
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Global Distributed Switch Controller for IFE0.
+      - description: IFE1 GDSC - Global Distributed Switch Controller for IFE1.
+      - description: IFE2 GDSC - Global Distributed Switch Controller for IFE2.
+      - description: Titan GDSC - Global Distributed Switch Controller for the entire camss.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-3]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input ports for receiving CSI data on CSIPHY 0-3.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,eliza-gcc.h>
+    #include <dt-bindings/clock/qcom,eliza-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@ac04000 {
+            compatible = "qcom,eliza-camss";
+
+            reg = <0x0 0x0ac04000 0x0 0x1000>,
+                  <0x0 0x0ad27000 0x0 0x2b00>,
+                  <0x0 0x0ad2a000 0x0 0x2b00>,
+                  <0x0 0x0ad2d000 0x0 0x2b00>,
+                  <0x0 0x0ad6d000 0x0 0xa00>,
+                  <0x0 0x0ad8b000 0x0 0x400>,
+                  <0x0 0x0ad8c000 0x0 0x400>,
+                  <0x0 0x0ac86000 0x0 0x10000>,
+                  <0x0 0x0ac96000 0x0 0x10000>,
+                  <0x0 0x0aca6000 0x0 0x10000>,
+                  <0x0 0x0ad6e000 0x0 0x3000>;
+            reg-names = "top",
+                        "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "tpg0",
+                        "tpg1",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0";
+
+            clocks = <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+            clock-names = "camnoc_rt_axi",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "cpas_vfe2",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csiphy_rx",
+                          "gcc_axi_hf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe2",
+                          "vfe2_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid",
+                          "qdss_debug_xo";
+
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc";
+
+            iommus = <&apps_smmu 0x1c00 0x00>;
+
+            power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+                            <&camcc CAM_CC_TFE_1_GDSC>,
+                            <&camcc CAM_CC_TFE_2_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "ife2",
+                                 "top";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    camss_csiphy0_ep: endpoint {
+                        data-lanes = <0 1 2 3>;
+                        remote-endpoint = <&csiphy0_out>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

