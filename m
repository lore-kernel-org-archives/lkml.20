Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472350;
	b=Sjn0yQNxa3r4Ze6/w3gYXI86ScslD3I+tpWd38rBlwRbh5wa1PTc8ns2WOiMdWcZuzmr
	 RV/7Cz3hZc3kLPuFBoMeWOPd4laBiuTWCwjM3+4mtYMI/eDJAcML3etyKKy8mcHOIfzXU
	 VKKG2MUCY6gwsaoYguKsrQZwRAKkU2sQJWW3fyOKA2qZKml928Y6n5dnGLyzOh5dSVDpC
	 jgaICTfxK7mTYsZ5HW9SiJz0TbdHZihDfPjhJ6p7pPkPBLN44JsjobxOTu0fmCtXTpe3a
	 SromjiEUzAK5UWh2fCYOOiuUf5dfIC02J8YaT34cQTKrdlX/W+UrjttwzvZBZ21ch3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
	b=cfnXYNGYPatQdtfZdr0JXlI/Pg5vQz8XksqqUZKbBFWVEfPQuzSilXSdKPcg9rEaAqC3
	 5w0KpZDXQQ79sqoUdpLmUR+HXyV2FRAvuL7kErEJ05Z4NlDn/kjc69iS0NjdX+sWW59JO
	 9UTvrZv/7AAYTLB/3u1P3nZHChKzWpUTWqEB/aGcdG83+9pz4XKokzk8lzvAzAI3l1OVq
	 mbva1EE84vCblAYoRXB7rgwx8SXAot219DKk16+dNHPCQqtZRx3kMcyqAf+vw0voaV6ht
	 lqYk1OVq8/477nGfxXQk8iQVOpYcLwt9rMigUIr4BjTFCo6jALlnL/sng8iNLFnD0Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9Iftrr8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="HU09p/zQ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E407360A2612
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E407360A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9Iftrr8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HU09p/zQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC53tE93477246
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=; b=k9Iftrr8S/3KqYgm
	wmIq9ZLs3f7XOGvc5UgbHulW5ZWkPDV0byyDU+/QSnmBiJKElbdbJqVARzC4zcB3
	HOk/+fVqf4wMB0N5UpLlrbtojhgI1FveXZLeH5YucY/ZyzdzRK709zxm7JnsgTdY
	c9baOQMfRVkFPyfBFWQp3+HO6/4afvBjifCckxY1InLPiet421krTutcCvtVy7ms
	OQrtK8PRrDbjZn46oH+4cT6mHlmr2/5QMRhFcPxXKlXLFOgnm2uozC4aMGyrfQwy
	VlNR+u1F8rsg4Mr7nA4hVXYkQPM/CiH0KfzMFWZ+2KE2jo5iesPrpSb8w53NFaW9
	Qp+9iA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yugpsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so1927534a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472349; x=1795077149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=HU09p/zQl23M6uIGurpJDGHGrxqse//H3bCZee5kPTRnqT6ybpRVxJzWh6PtcRlicb
         9Dmo78NYkcEiHTS8CxL5p3aywTUKN+E3lIyRMERuWsH0i97ounCxO2C7ykkuy9e/dojf
         SLxOLw5GJdaxA/yVd129zb8+foVffps/G4Lw6RwppRDmPERKdRxzowjQsf7MrEH5G6Un
         mPIjjCXllNeqFGA1HyTOwTt8PO0QZmpT+QDXsPi3S6sQdub4aWhgv4XavNl7Otxlmn7y
         TiZa5lKEOB221UiubJlkeYnBPW78s0ZaqoYFr0R6LQ8uMbrqjOB/8QU2jSI2AZjP6u7N
         gidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472349; x=1795077149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=vXnGEGx6Y0OnVsBANv8Kze+PodQUNQ0RTuSuEm/P7rBzL8aBEvcJZXyrIqtHKMHowz
         KJNz+vK6w0bbxcCNvhQkasHKA/6KTv91+MmzMj+NSAivrUnssKQBFJL0M/effmwlxpPo
         LBAIWzFMXNYfb8KR7sikAsS+JDywEF+n8QCueXQeW+aGzA4ojVnypY7/LuC5Ce3FyQ1R
         hU58LjfnrfYQsGcrphpWpJONO8lAVh2JyZJSJW/BNdRLd4fDLkBeCXl4vZrx+nrM0I6a
         M0JEnZbJ+8S5UIBfusSDL26yhez+nN6MgSf9s5OHFGjihTYC/LMNpq98aXQc+KC+izE0
         W3cg==
X-Forwarded-Encrypted: i=1; AL+hErGVvhMUe7KITo2UCrapKP9XVkeLgjwWGE8UDo9NRA1GspioQQ3IhK+WRI9sTIxHJfwwPWbroinGr+wc8u8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XsZT/WlddCgo9cib7fbtfTE3dwRZCWO3VuWRcmsgXtoFQqrqp
	8WEzy4EwV0y5zErLi4xxp/9xc9RoTVUgvB26IXPR0hhonjwmhlxUBz3BpDCAPb+3FdoeYRIr9dV
	gXdArJsEY6Nr9Fa4nuFMgM+vWuWDDVfVipy40Uz7BT574eLTMuKrXToHD/xVpCe4DL28=
X-Gm-Gg: AYBFou2pTiq1zj0ErOFlsg8+VCklqETaOC1dwfE3X86cAwmJR8sZQIgYg12EZZmDMEH
	Qtm4EBiuH46YH5s1MguzUkSIeBbpHY9o3XCakFrNfr/7W5U29GnA2W0VrIjEZ5n33ODVu8mWihE
	dtY7ViMHQt8ugkcoxvMWlj1/mqUIEr3xq50upVvzhht4ykzyNbrwBYhyIrVFHvrWG2G0pEWxBPE
	pDZ6vemwCWEDh5HnoNSXe/x/AwNhYfuLx08aKMjQixyxX+H3KaQNtUZ+iNANJ3Ogjct6n0W9/pH
	Hlgwlv/DA2Tr37k6T0jOXKKUdusCzK2Gzfamch0tUVJ0wQf8sVQv9YcC2UDtao0PeW7B8BCcXMK
	pt3dmsXSjjkN4aVNpd3cThZXoW7+BpcXkqrwGRqdqA4UnhwsXDjmCR68helIq7TZ686cMgcKsMC
	nJHqEcJWLbwEPthWV2MCN4fSjtuHt1WKSOks7xT72LwjtwdJMnFWoGSYKgikzA85DJFRk6CZXuO
	A==
X-Received: by 2002:a17:90b:17c8:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3b182f8ba81mr4532449a91.65.1794472348631;
        Thu, 12 Nov 2026 00:32:28 -0800 (PST)
X-Received: by 2002:a17:90b:17c8:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3b182f8ba81mr4532415a91.65.1794472348126;
        Thu, 12 Nov 2026 00:32:28 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:27 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:15 +0530
Subject: [PATCH ath-next 01/15] dt-bindings: net: wireless: add ath12k wifi
 device QCN9575
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-1-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: xRm1vELQlds6-JyhoThlnE63zPB2Is_c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX98n56RwX1Vy/
 81Oejk5svigYnTIhh8oBfgWxbRTEzuEGsuQ9NIY0BPsXb2TLZ7e24L1fjPJ7SiAQ+ElTZSrqj4v
 g2F6c/E6G3/UU+UhFzOPiII0CZsVltU=
X-Proofpoint-ORIG-GUID: xRm1vELQlds6-JyhoThlnE63zPB2Is_c
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af5799d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cIo56A7EWjM9ht75lhUA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXzdFGpPRaUCyq
 9jQBNe9SjG+HXSNJgUVqWzCwVXPdZfBXsO7H4/xZ5B1OmVZvIg6GkhkezejdRspXVW8YXE0d4ev
 q1E616W+/Uo1Btt5RwZLNPVfJbQdeUv+/AE4M9zIVxRs9cisutABHcXoBBqydvXUUtu0ZcdJ10+
 ha4eVZA7KEtk0vHl/WmNBbcQcU5HOVFghI0aMCH3GIWVDTowREdnY2E7GkW+6G8F75SvHzFSNpm
 3VcxFInzggAzMOpQtS0bf03BmuHeFyp8pXdIdil1ej81TckhVKj4Sr2QwzfSzAHPI+lV8gGacrK
 mz1/eZfNhXs5uoVtimZzBaE1Iv1f1pDYRjwGWS30X7hpNQpUnLHMkyEjNHR5i/pjWjxRSsR9AmX
 fk9EyzQl+aGmzmSvxzNmF6KPItIS4rULAyGrumjMe8GceQyHUPU6aqnix0WvB2A1jhLXXctR4mB
 myVfB5m0ZwRPgbKxm4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

Add the device-tree bindings for the ATH12K IEEE 802.11bn wifi device
QCN9575.

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml        | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
index fa64c8aa56f5..dcb846258e47 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k-wsi.yaml#
@@ -11,10 +11,10 @@ maintainers:
   - Jeff Johnson <jjohnson@kernel.org>
 
 description: |
-  Qualcomm Technologies IEEE 802.11be PCIe devices with WSI interface.
+  Qualcomm Technologies IEEE 802.11 PCIe devices with WSI interface.
 
-  The ath12k devices (QCN9274) feature WSI support. WSI stands for
-  WLAN Serial Interface. It is used for the exchange of specific
+  Some ath12k devices (QCN9274 and QCN9575) feature WSI support. WSI stands
+  for WLAN Serial Interface. It is used for the exchange of specific
   control information across radios based on the doorbell mechanism.
   This WSI connection is essential to exchange control information
   among these devices.
@@ -48,6 +48,7 @@ properties:
   compatible:
     enum:
       - pci17cb,1109  # QCN9274
+      - pci17cb,1113  # QCN9575
 
   reg:
     maxItems: 1

-- 
2.34.1

