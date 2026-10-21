Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590700;
	b=3xJn1fcSsaXQ2dRsSopMYRNkzBj/ApyzwKBEjM6KdKv2AYIZQjyCt0oTmdOz4z0Ca41f
	 X2C3I7ZcrtHAUAmBThAxEaJYgwZ08ttJeCJFaa2zd6lHwAm2ie5j7ViG/Uuy4AheWmU/j
	 fF/VO3I64XWIVg3Jik7laQVrwME00PJHgjgT8DbOAD3dgQOYSqVrsHeYNb1HGkXvqAjp1
	 Ck+qQP44CaK2Ddl+DX7oXwHuBS7oMAtmjRujKlOsLWuGR+UX9JdBKez/5yGnoSX0CIpbg
	 +l8xUQFfybT97NL6Eb+jBjgbhKE0UzPurnqAmWFC9R6sqJ2sAJzmr2zUcxsoCqz0phg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590700;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eqzxsVu9ygVnO09BxDlCxM52wOxdPkt+JaIEaVUrlbc=;
	b=vhjyckjqcAUQkAnIy5mozr0IxqM1win/1VjPipfGRQyT12R6QqgGwoPM8wOH7+wNYjeH
	 XEzOl7cV9kXOpO9Bzz+g39GSaOhuOzmoAwbnOLIEZSB2voGKekeDeHov/Q1+JSwdCX6dV
	 jDCZysw8G9dypYM1Cfe/wTiXxL+sbwrzbSD/12Fxz7ftJKjdE+F8gT9mJ94eXw14nn3Jg
	 FvgtbCjC8X9n19XDk5hE3wyOaFNkZK94DaJFT399zWli0MTBRc7OIX9uO0crIByqz8nEf
	 mFV/lUpGZJIwEhsBrCxO/OKPkM0EDXXfGrqLBqpBc17H9a0JH1A61SxU5i8LOCSlWiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m624ddMk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W5rXR1QQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC65606A331
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC65606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m624ddMk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W5rXR1QQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgPsh4168178
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eqzxsVu9ygVnO09BxDlCxM52wOxdPkt+JaIEaVUrlbc=; b=m624ddMk77lyR6LV
	Tr4BtUsxeTVQZZ7+weRwMyhScK7JyI6BY6JEQ6Z8dH3GDGSAq+a70ZzuvkB0lEwi
	bbM/eE4v2OTqCfLPVj7FZaxkJwpfA42aqO+cxinzaIuYprBZG6JNC9YWdRlRB7X1
	ybjOyObS5XiYeGVbijtbQsFbF5v+7AeBggp2W0RwFUVcTv55tSs2+jjvyw8bvURG
	GcOyT5OEarfrxjXl4CujBHv7wiRAhLmfa95YhSqnzde3Xc7smRJxcDk6N9gzpVX7
	4KaEbGkHtJic7ddYZ9rIZaPBWf6thpVBCRAGgRqdlSD63oAzn4gZx+UMQgD7b3T8
	/goIeA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0m7hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:51:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1332190eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590698; x=1793195498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqzxsVu9ygVnO09BxDlCxM52wOxdPkt+JaIEaVUrlbc=;
        b=W5rXR1QQ4P1brtJ5mPczVOt233PiA+qOpjx5BLiAEtMSv5AawrUkpf3A+0N5vFhxEB
         PfmOx/vDlrq7YjG/zAZKI7l62qQaILTOHb/trCPbqRr8WegLv0PvLQ3dpRHlWn3cuxNU
         ur8izxXZHvjjYnmOkn8Ekge7wp/pjWBHwYNedtFV40gnhxiZukhND6pjrph/+toDcIDb
         /EJ6wlYgOHGdd9GM/jwr9TYgtCekeuHkHHwLW2u3TPr9gWi2ghP3OVnrDMQFveizGyf4
         8aV7b+J7O5/Pa4dYxwV+F2M8VecGh7h8AkTvd0mHgyU/fjOITYOnPY2b5BHcfJnR3rwt
         LNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590698; x=1793195498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eqzxsVu9ygVnO09BxDlCxM52wOxdPkt+JaIEaVUrlbc=;
        b=wNE2WusV7QPO0myuZMbk70E0MI8AB6XeZ20xCMbo2uwRB63czChWKcbit6btwibDov
         LkM485elhp0rsp3TvFBqKUW0nNjHFoXyZ/JqdEwTSOm0dhSQiYJ8y2e82wZ5iMvtUU01
         9mSY0kA8qvu730Fiudn/rD97Gv8+L+dcH0y8KVeWNXS67H+204WewKtrevTT+jumHvEa
         QS9bS8OlpiEfO+iTkEYAL+xwRG+1hLFem98LF2+yuhGtnmMNSylMkDnPgx7F5Ei7fsVd
         OyE3mJAmlzueYO1ab7OKclt0vpRVCWTDYACUzQFWZTIXk0+/LGXAHiXcBD0CuB2mkfC4
         TQrA==
X-Forwarded-Encrypted: i=1; AKwUvBwNIaCLXQUHSjlo4Lh69NuCiPvx7p3hkkBfV3JsrJehvVFHcy+RBEoAqnd4WSC7mpGkEyTyJ5NNjTBNVrc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFplFpG95Gnxial+sI7WuDvlIlKhbO6V+LOsejUAfekV7PZVPi
	LzCLKgZ3QJQs1kKkcK1XNQWt8JQvnwnNyR3cqaA+5rt9Zlb0IbRpaZs9GnFYlu7TilZdVqiY++q
	W1TPsmN0q2DbGkWJUN8tZAN2Oeb34yxouCN5mFd7A3PvoMOlagwU4dl0Hv1ZsrNWoh/k=
X-Gm-Gg: AYBFou3fEv/uVlqE35eAusguzfocaYINt2NUl5AfpEC0+qiWENb/yZ8Lyye9agA+vOS
	QT36qv9NHOPh2Yv0yl2zF4FQ1noGHpko4bxYAcBqceLUwJCtGLpkZhzrdzU7U+AyVthbv9AlV8L
	qLGbY6KfsqGgu2oVr2YfAsLJas81DcKce5b3DiBVopIHMPiGrb5L1NRZNY4elTzq4eAOTZh09J1
	GAtcKDXRRWMGk+N/xLQbm6iGxybtXmdkLdFg9GoJ1EMm2VEd/d7TBhHjPxq6bxFBd8V7BUERz7f
	PpLOpX0Eod7RRL31itbSmhBIk5wN8rZXXT66ZVIPumNFJI1KL08hrYeiNBxBZDhQOU5BRd85Q/x
	psCf0fUaMxfN3QwBnJzu6OeaxqMRrAfvsZg==
X-Received: by 2002:a05:693c:20c3:20b0:35e:60ca:81e9 with SMTP id 5a478bee46e88-3674d047291mr3705160eec.21.1792590697522;
        Wed, 21 Oct 2026 06:51:37 -0700 (PDT)
X-Received: by 2002:a05:693c:20c3:20b0:35e:60ca:81e9 with SMTP id 5a478bee46e88-3674d047291mr3705116eec.21.1792590696844;
        Wed, 21 Oct 2026 06:51:36 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc848fsm7534332eec.13.2026.10.21.06.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:51:36 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 19:21:22 +0530
Subject: [PATCH 1/3] dt-bindings: connector: Add PCIe M.2 Mechanical Key B
 connector
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
Message-Id: <20261021-pcie6_fix-v1-1-ad37134c35a3@oss.qualcomm.com>
References: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com>
In-Reply-To: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792590686; l=6589;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Hcd8AhF5neUwdC/MlSlABuWRJC+I82zW/2oPCsLOsTo=;
 b=BDqVkQfSgirwVpNSh1XjiN+Moh+pk78Elv4J7qPXubw9pEpimWukRbglPMWE3LkhDGIvOex67
 9GsLG0RrSIzCM1br9Eask63qy/vFOezwJySTUIP9QdUriHMvnKxrlRa
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX3Ul+PIaQ5rxa
 Q4Ge8B0MFYXblr+vlfUZKZH8efXf5L729T0KGyKV2m9rKbjNTE5QEfkZjPyXHdx0hWNfa8NYz1Q
 XmUJQVoE4d3FPyIa9cBXpsQAji+1D8tgP+Vce/G3xMRR4aKqZ3ErHFwCT2Cgmtzy9RqkwCVSKeL
 VfKK5cIfaucS2wfLg0mMOyoal1MppQP3PuZ2gFKLaQO5n9afWXmlmPU0ww/r9qobyrFhs+8UKIE
 dUYxpyXPExpIteRduGy98IXrapGxKVtiPDz+E3O8yr6wLBFpuow3Hb2oqaHWQPRqBr0XKznvr/7
 3hTvWsE7Fsk7/XkVgPu0AXH6DeTz2Qa06rdefVDHY7qWhrqLc4zjPXEqqbPbvVtSdFER8sd2txb
 5xvH6xtggNTjvZaR/tcR94ZfpZPYm+V/DlQqqRrXRcR/XYkkmSQTri96cBsZDj55DO21xoMVApr
 Wn89HavHDZFaCuTO8Gg==
X-Proofpoint-ORIG-GUID: 9ARDJkAMk6XlFQH7n3v1klq4WVHy0KRi
X-Proofpoint-GUID: 9ARDJkAMk6XlFQH7n3v1klq4WVHy0KRi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX+cOciua0oug9
 r5CqDLYekUjoK4JwIh4EMLTk8V9O5X5cyvQ65Lz3MhMWOamijbLqrH8EaWWtX2PQlI9RXARbGfG
 yrVwHIN5fD0fzw/DLW4vnPpxiGBSGV4=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8c36a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=nzPhZw1G-5J1C4WXyrkA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210055

Add the devicetree binding for PCIe M.2 Mechanical Key B connector
defined in the PCI Express M.2 Specification, r4.2, sec 3.2.19.1. This
connector is used to attach WWAN Adapters to the host machine over
interfaces such as PCIe, USB3.1 Gen1, SSIC, or USB 2.0, selected by the
Adapter's configuration pins.

The connector provides a primary power supply of 3.3V/VBAT, along with
optional GPIO signals for WWAN-specific power/radio control:
FULL_CARD_POWER_OFF#, RESET#, W_DISABLE1#/2#, WAKE_ON_WWAN#, and DPR.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../bindings/connector/pcie-m2-b-connector.yaml    | 146 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 147 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-b-connector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-b-connector.yaml
new file mode 100644
index 000000000000..a7f4bcbc5119
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/pcie-m2-b-connector.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/connector/pcie-m2-b-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PCIe M.2 Mechanical Key B Connector
+
+maintainers:
+  - Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
+
+description:
+  A PCIe M.2 B connector node represents a physical PCIe M.2 Mechanical Key B
+  connector. Mechanical Key B connectors are used to connect WWAN devices to
+  the host machine over interfaces like PCIe, USB3.1 Gen1, SSIC, or USB 2.0,
+  selected by the Adapter's configuration pins.
+
+properties:
+  compatible:
+    const: pcie-m2-b-connector
+
+  vpcie3v3-supply:
+    description: A phandle to the regulator for the 3.3v/VBAT supply.
+
+  full-card-power-off-gpios:
+    description: GPIO output to FULL_CARD_POWER_OFF# signal. This signal is
+      used by the host system to turn off the entire Adapter. Refer, PCI
+      Express M.2 Specification r4.0, sec 3.2.13.1 for more details.
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO output to RESET# signal. This signal is used by the
+      host system to place the WWAN Adapter into a power-on reset condition.
+      Refer, PCI Express M.2 Specification r4.0, sec 3.2.13.2 for more
+      details.
+    maxItems: 1
+
+  w-disable1-gpios:
+    description: GPIO output to W_DISABLE1# signal. This signal is used by
+      the host system to disable the WWAN radio on the Adapter. Refer, PCI
+      Express M.2 Specification r4.0, sec 3.1.12.3 for more details.
+    maxItems: 1
+
+  w-disable2-gpios:
+    description: GPIO output to W_DISABLE2# signal (default function of
+      GPIO_10). This signal is used by the host system to disable a second
+      radio on the Adapter. Refer, PCI Express M.2 Specification r4.0,
+      sec 3.1.12.3 for more details.
+    maxItems: 1
+
+  wowwan-gpios:
+    description: GPIO input to WAKE_ON_WWAN# (WoWWAN#) signal. The Adapter
+      asserts this signal to wake up the host system. Refer, PCI Express M.2
+      Specification r4.0, sec 3.2.13.3.6 for more details.
+    maxItems: 1
+
+  dpr-gpios:
+    description: GPIO output to the Dynamic Power Reduction (DPR) signal.
+      This signal is provided by a host system proximity sensor to the
+      Adapter to trigger a reduction in the radio transmit output power to
+      meet regulatory SAR requirements. Refer, PCI Express M.2 Specification
+      r4.0, sec 3.2.13.4 for more details.
+    maxItems: 1
+
+  clocks:
+    description: 32.768 KHz Suspend Clock (SUSCLK) input from the host system to
+      the M.2 card. Refer, PCI Express M.2 Specification r4.0, sec 3.1.12.1 for
+      more details.
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: OF graph bindings modeling the interfaces exposed on the
+      connector. Since a single connector can have multiple interfaces, every
+      interface has an assigned OF graph port number as described below.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: PCIe interface for WWAN
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: SSIC interface for WWAN
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: USB 2.0 interface for WWAN
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: USB3.1 Gen1 interface for WWAN
+
+    anyOf:
+      - required:
+          - port@0
+      - required:
+          - port@1
+      - required:
+          - port@3
+
+required:
+  - compatible
+  - vpcie3v3-supply
+
+additionalProperties: false
+
+examples:
+  # PCI M.2 Key B connector for WWAN with PCIe interface
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    connector {
+        compatible = "pcie-m2-b-connector";
+        vpcie3v3-supply = <&vreg_wwan>;
+        full-card-power-off-gpios = <&tlmm 121 GPIO_ACTIVE_LOW>;
+        w-disable1-gpios = <&tlmm 122 GPIO_ACTIVE_LOW>;
+        wowwan-gpios = <&tlmm 123 GPIO_ACTIVE_LOW>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&pcie6_port0_ep>;
+                };
+            };
+
+            port@2 {
+                reg = <2>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&usb_hs_ep>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 7b5cab72d851..22cfd2b72e1a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21794,6 +21794,7 @@ PCIE M.2 POWER SEQUENCING
 M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-pci@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/connector/pcie-m2-b-connector.yaml
 F:	Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
 F:	Documentation/devicetree/bindings/connector/pcie-m2-m-connector.yaml
 F:	drivers/power/sequencing/pwrseq-pcie-m2.c

-- 
2.34.1

