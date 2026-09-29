Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AF846D543
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651878; cv=none; b=OcXW45MkKPUt1PyPjrz6NdikgW5ko2mHYMTusvyfC+WymRMaJ/VLXT8BmpdnA9b31JdhflKn7mLSCJJaiP9HjHfCejMBJ17AU2MvXG6j/M8eIeVPSapvtUjQG9WSMTqZS4jMjw7mOuFshHI3w5fXKBpVaPvAmFmWGr4zZVsEkak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651878; c=relaxed/simple;
	bh=uFKjlolwn1ciafhDBmMwI2akc2BNZltPTKgmRmWckzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=biXsNP9S2THhXDuwgiiTwKbQRqlT+KC/b1PsyTyxdy6BLmYMZ7CfDWZnahb//VU3+bx2V3+5w+5wIJFxnesjAp2Q8gWJbbmiReshqpAFCil2haSPcMXy4LU2HadagKkJQrld4OdXJcGbMIFCJ+xaUp7DS+hPEhVKteajqa73ThY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBYjQyfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aRHSdKNg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBYjQyfQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aRHSdKNg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0ipS62252523
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dASJnt3k+iJPNvbft15iYvw/242GHxpDWKpgPsBPFKM=; b=RBYjQyfQIm0ZW0Mv
	9bx+8E+EwcRxCBq0N4hspGuNB4YGuxsej+iq4FDqh+o/F9nCFvq6w0rJPK2QVJGV
	ui/0zYqKJIBWorO+gAPf9Tnoa7aeyP12imF+MqWLFJnd1PfutZKgwLFl9UVm5f3S
	vFEjp48hpL3uubhkjYYa2HETFdhrlVOiS9oF9B6YRqAMllOJPI7Tt8glf1qIsyLm
	pWM32xlNb8rsq4ajsjzeHb4N4u4+K9pEj1Mdq76hJLOEdvUWz/DJCIhGwsTl2bxm
	slbiNmIu2kW0nyhd0pTxkKBhIvqVrDtnj+V/+HDbj23L7AfzK7U3VGdsaAwF86hJ
	EdaNkw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mjggrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:51 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1466ab2bc8dso1024182c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651870; x=1791256670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dASJnt3k+iJPNvbft15iYvw/242GHxpDWKpgPsBPFKM=;
        b=aRHSdKNgGFQBrHtWUTA1iQ9WUSf/ipoI+/heW87EMQ+OezCN+wu8rcxl9Co+3gZecm
         c0MVb5uGO5mhFHFEHuVq2NwNhksNGGYZZIzFEZd0kgFVQk5eNLP7wBhb/QgFAqqbT27q
         0Qb4VZes3JhxHG+HO3BmQh61ApGP8D+KR0sfuwN31XXtg6xXcqzktOl7x/f2t5W4hzmG
         vFjVGgQHbnQOv9KaLXi1ejk8w/e9VzarwjqeReKJsAxcPmMfkK1FwPSOfeIH7jv/tzpf
         DNaB5B6XZAZ5Fs/uSulwACO5r6LgeoPZiyv3AKUYAnckgCufo9GlYyq59Veeq1P+rfU6
         Hirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651870; x=1791256670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dASJnt3k+iJPNvbft15iYvw/242GHxpDWKpgPsBPFKM=;
        b=Fdbhj4W5izFIiew6fsQJJ/qN++l2AkNgzO53m/mGAnDFSZHeJlmBz8HRj9fEOjfC45
         nhCPIQkCJQ5pB2K/4UqZfDQDE7xCrGKYzQK7WZHIEDOaVTBZ7wA6yNNNahYzRJ5Tb3Ia
         xatVebQDRqmy5eUrjf+suH2LevjzRsILYHnnnM+LeAWeDyryQA1JCRyCaOKLzEOc9+Gk
         cDPQWj0DlsUDdWfMxcByFx1/Jns30SRyCc4DUo7roTS1tvMOkwQTHfNGAOYKTlWVQ9GR
         RAVfhi1Td8ixpPUIG+HfMoYb/IaT4Gr5S5iTJOWBsjy4bB1TfFGeQf7icb/xD9k0dO2s
         TgqQ==
X-Forwarded-Encrypted: i=1; AKwUvByJ6CIkomoJ53fi38+YXgS+WGPuEYZtwlP/gmCjhix46UOyy9Yue15uuauMOURdcKHiphZJHAYcoGLCJhk=@vger.kernel.org
X-Gm-Message-State: AFuF++mKiGRnWLUfaBjdzApJjNmFnRJgS6bPulq7qhLA5bt7KlrTm4G+
	66UgF1EbB0Ozx9QjjQIm+nsOkii2rG8QeQ45kPZcilB8HgikH1PDT1xCbMluvfVYYEHUhMbhUTI
	uJpFkOI3ag/lDZ5OyqMi0emTkjIY9sEPHg/ej3kZ4EQbauaIPGxZs7ge3kJ/3UDwtFQ==
X-Gm-Gg: AYBFou3/G7tf8Pv6TRdaU6BfcgENph1o6rc/uinr8MH7wow1dhcTzYbbOD7L8FY7QbC
	8nj16Jurv1aL0Aju/Ig89Eww+I7H4B0G0w2epj/YZT5p7wOUn6nOuqtG76WzghjHviXzAmJ+oKR
	C+aVbzDpN/G6gcNAQ2gKjK+6ce2XmQcuHgbNwhdmeJ9R2cIAnCUiORvuAfJtmYcydjP+8lRjMs7
	+fwTGDp/MWTP0y+fsGsE6agFcmjRvhIU2WBOgD+vtfef6Xi3mOczFYfc296Z0G0brypt/EWFmkH
	rpI7G3iBRNdtgNDEdb4kWx/x1puNiPajdQLu51/ak9ZVweqZZk0KxzYq/GdAqcw6zXdn8gmDSOD
	XSI1vkkv2rUUobc3MtU73n0ZD2a+IyO5aiS0N9XdJj9trScR1DYEU5xcq/zw=
X-Received: by 2002:a05:7023:881:b0:143:2984:6516 with SMTP id a92af1059eb24-146d096b3damr13332461c88.37.1790651869977;
        Mon, 28 Sep 2026 20:17:49 -0700 (PDT)
X-Received: by 2002:a05:7023:881:b0:143:2984:6516 with SMTP id a92af1059eb24-146d096b3damr13332436c88.37.1790651869421;
        Mon, 28 Sep 2026 20:17:49 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:49 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 20:16:55 -0700
Subject: [PATCH RFC 04/10] dt-bindings: firmware: add RISC-V RPMI TEE
 transport
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-4-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX2w89FHKM1gz0
 qK3tMxq0WHbiTvIrM1/oiirDxnWoXb1FCSt/L2NtjCaEctDScGZlIkF8V4AmU3lzRxq3Mpc/OiO
 cD6VL51AsyPixFzHeHWs2pCSHBKkU6Nfa3lNmSZiZLpshqdq3wR79u5wxkTFDULmK9G87yyW64y
 cN882cH8W30g3jyTCqcp7VrHLUnqbMUHUKxnQrGM39/XPx5pDErzzgMb4BSOWYlGNMRhsepaM1a
 CZtyyEBiuAXQ1N2Imdk/pHPTxg1ng7s2t69y0HDxEwcHNy8FFR7tB5P8DJJ+1IUtA0W6DnPJrsf
 jXsxY3Ft6nW1Tduwy7mtrXRipvsR1Baz1l60TSktyLJzVuL11dpby1VXgqe8S0bcTs0l30gxj/E
 kPIoXqW8rlAOtWYfOKY/U9Z5XjZ/GsieT01V23QMwFUQixBY4mSxWh25mhfdISBS87uB6yPFvWi
 B5jtmYdjNsc2PVKrxbA==
X-Authority-Analysis: v=2.4 cv=OdgNnRTY c=1 sm=1 tr=0 ts=6abb2ddf cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=X9k_jdDNchH65YliorYA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX/snOF9xLs3i6
 orRNBDh624zUU22jvLvZnMzghaOpMQmooL73Ud7t4WSO+KcFs05fcqC+zyLOXJp/vpq2Yvh06d0
 sNs2SAoS+iuwldFMf0R2QDnkiZBmdOE=
X-Proofpoint-ORIG-GUID: UAvaTd71B494omPzp0De4Uown1aHDocO
X-Proofpoint-GUID: UAvaTd71B494omPzp0De4Uown1aHDocO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290012

Document the platform device that carries the RISC-V RPMI TEE
service group over a single SBI MPXY mailbox channel.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 .../bindings/firmware/riscv,rpmi-tee.yaml          | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml b/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml
new file mode 100644
index 000000000000..32287f27a625
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/riscv,rpmi-tee.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI TEE service group transport
+
+maintainers:
+  - Amirreza Zarrabi <amrzar@gmail.com>
+
+description: |
+  The RISC-V Platform Management Interface TEE service group is carried over
+  an SBI MPXY RPMI mailbox channel. The transport discovers TEE services and
+  creates child devices for their endpoint and UUID pairs.
+
+properties:
+  compatible:
+    const: riscv,rpmi-tee
+
+  mboxes:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+
+additionalProperties: false
+
+examples:
+  - |
+    rpmi-tee {
+        compatible = "riscv,rpmi-tee";
+        mboxes = <&mpxy_mbox 0x3000 0x0>;
+    };

-- 
2.34.1

