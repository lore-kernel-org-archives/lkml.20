Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794797926;
	b=vMGjquFb6JXxdNWc7vypDVADW8fcdaVrgdms8mOg5wKrzIY+7Scw3sunHk5ejvRkGdZJ
	 VxkOClFH8ZsEO8EtRaw2EkG3wxbuIgf1oDAXCMswfYJc/CApmyrVMT51XmSqxWXyXR3bc
	 1wPbUZpNcuKQ+fYhIdm8mnq1v1hgb7nHr4rrmfRgdyPdiI0mLiFeoeMvyIeBhhG7Qd+IJ
	 ULc3Uks0PVwQPSRM4HgAYqZkm37HFrFeNixOnNHcClzgGfKHwF2NNVB7VshKjWhfAXy/X
	 wCaLUk+olwKk62bjz8FOqZ7+Rs9rQxAhDLRDIRbC1IDJlGJs6stG7ydY/gc1RASobBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6SqwctOnSSNvEfqA9gmQV0BvERnVjb8klYQk/ww33+k=;
	b=EYbBBhMGXqG6aIRK3CPoFv7WBTT+LlEVjXkbHAvQoYF5La6E6b3Tac61XDxjulcUOm6i
	 6AHamlmwNd/n1roWPMB5a/ON9iD2g0JrcUwOjJRZ8en2JU64uuMwraNBS+lHyM72d8T2+
	 uHw91yA4N3DfzwuZC56QZ483u2wZb+OEfoqlTfQxfNFoY7J23CARKY+UWgM07Q+pMNcES
	 prx1l6so2fI5fQzMzG1cnlK3w3t03Az7x4lpudwvVmm2RLg3zCFiv8ReFmLwJsYD8Yg+Y
	 cNXaf4to+5YdKD0YizF+lt0wK6RTzbXkyycuYuw4IOEPf/oOIcKx4CV7w+wQI3884Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RAJ+bPph;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U8x57Oe8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5E6606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B5E6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RAJ+bPph;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U8x57Oe8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1L2pu136928
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6SqwctOnSSNvEfqA9gmQV0BvERnVjb8klYQk/ww33+k=; b=RAJ+bPphriG+rexH
	g3XFp+rVroxJQBi8DBML6dl82ieHdEYUnt/PHzP59UkTl4N7GRUwlGXmSqwlz/ge
	UkVAOdwWTdZFDfsJ8M4hzvmI8Y6ye2K2BTv0N9kglyys7Z6GZzlkFBBzqfYwFWGg
	/C9MVMeENhKFKKCg/m7CsC7N0kczhu+1IojylcnNicguzlSKTI7zDyJ/dmCRYqr/
	oOJz3VUsIyIt3ITtZiQkaPidcK0yZL4faPbYGJgVONMWnWL+UscOgNnbYeQjzXpZ
	RdrVsnY0z4boxnQ9yiXWyzuX0g7L18PwTol73ERK6mIjK9Hl5CJxIQk2tPxUxqRt
	572XRg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk24fmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:58:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37628596fc9so8123860eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794797923; x=1795402723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SqwctOnSSNvEfqA9gmQV0BvERnVjb8klYQk/ww33+k=;
        b=U8x57Oe8jCEJuMjnDYiDcZevmYJG8VbAEzcvOo6NGnlTX2eXaPolkOtWnP0vlD+kz0
         N1GCD4DvdDSNLfX90UcsMnEXPnRaEcoeTco6PQ60d2H8x2xy76n/IdDkAhW7ZeIgKcHQ
         fH9De20WRjGIadxUrAtCigvf7h1U4ZoTZegzN2s7ptQQA+Pz0Hw/2eZIm2bBcm2lfKE0
         EvSc8In0Kl5IcRfWTLiQREhXpkVDs3JxzWES3yTthJk+s0VJjDAQ1cC7J75c3JxL49q/
         d1QWrpZxhQ2eHwsE5+7T+85cltnXvkBGZaFu3lq11+soCzZ3RAn/1DhkXtF7rUJyZZ4R
         HMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794797923; x=1795402723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SqwctOnSSNvEfqA9gmQV0BvERnVjb8klYQk/ww33+k=;
        b=xm7mBaxYrDEM3nAL0roJ4hb5qTH0rIOz1uumCicmgU0GUpC9Ckpq5IIAQQ1FUFHMhT
         9iJws5HAOIW43qUr/mmS4WCoJk/QyFJdRn74rsQFmsJl1f3VDtR44hIMzAwm+JpLqSd1
         x7mmGJfSHUjKYN2WRgM2/ogik5LZ6n0h55YXYFpj6Z/Mz5GorrXjwcIjAUsjhh+nL85q
         hDgSEh97tRW6mkjKB6GH/I96isLDZScN18SrIQkRywNx3491VD4+lzib9Z3ZOxlYhZ+5
         cGnNNd8qK0ZC1p1FfbpsdcVXW8WY1Q8CuCUGph5kAN4z5gWnXCiWHC0/X8D2QDr1GXmU
         bDqA==
X-Forwarded-Encrypted: i=1; AL+hErHP/yIdeomz3QKueGN8hc5vPvABCPZZ2lOaKO9Q9XSVMKpetauJpBOERVLouUV1+d1fFK5Ah/G2LSztAbQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3K0HIDDkOG6VYmoFO5FqU3Qf3El3U/WZ1UAftBpPK1XneEDpf
	+Ly7gJYzSlNHbpvsSHkkUXWsopKUeSvDLrR/E6ZmXIqwKsx7DTTPCDzg19bw4TFan+VaPcF8DkJ
	yQnqFr88r1rQOhR9ZeB/hMqMFMQhBkhEL64fWl+oTKhLtpRcns77np95j1JkOILqn/Ig=
X-Gm-Gg: AYBFou1YBmZvMgLs3535ukgJyOuDzzYteSxMcOcwZVLFeJiKOTbN0zw3H0r9LBPPIhf
	35Nu1ash4P83BmAka0pETkznE3Ycpk4//IKC6OtkY5qmkta0XyO/6uakaUOLpCom9SlOCrmovTJ
	GvqB3Yg4QI/L65CwCKDqiJDAtQpCGDtVAKsNzvhaHMb0XNJjp0kKLZ5F8MFwk2sdpswp5OJERcf
	cRPY47OiYWTBHAj/KEhMUsjzoPDQiZSCWEvbdA01ghjGrzcpAO0oFf/s6Su9vcJ8A8PRCDZzgH7
	/zM/AE5WiUf7N3TnhAdE00qZNqcUMCyy4e8gnkMGUWV6ThubTQsvryMKqO+CRFd9EZ1wRxkGlmV
	oxcwbZZj3arLE0HCotMtjKnF2AdqYWVeypj2DLmGf/Z+wEx3QSHNDq/mkcxzQG3nOBRanWAIfPA
	E0Qi+k02uR+gR5jdSv7eGxdV89QY7OJhaX
X-Received: by 2002:a05:7300:3b04:b0:369:fb01:2eb7 with SMTP id 5a478bee46e88-37965daabf3mr13725272eec.13.1794797923067;
        Sun, 15 Nov 2026 18:58:43 -0800 (PST)
X-Received: by 2002:a05:7300:3b04:b0:369:fb01:2eb7 with SMTP id 5a478bee46e88-37965daabf3mr13725234eec.13.1794797922573;
        Sun, 15 Nov 2026 18:58:42 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm30469991eec.14.2026.11.15.18.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:58:42 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:58:34 +0800
Subject: [PATCH v2 1/2] dt-bindings: nvmem: add byte-mask property for
 non-contiguous byte selection
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
Message-Id: <20261116-nvmem-byte-mask-for-split-macaddr-v2-1-96f4a0c08264@oss.qualcomm.com>
References: <20261116-nvmem-byte-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com>
In-Reply-To: <20261116-nvmem-byte-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794797917; l=2693;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=D4avuuAjw64GqM9nsZUeIgyvIRyNJuNZYgwm1HEqghA=;
 b=XW33uU/Rce1+Jd+3sM0vjC3v5rVitqY4TntHxbSV1qMv4NYc2xInvWugdvaEpF/rfucMMkP+T
 bzo4POyzvooBGnths3mEXKKuLrzkeVSFOkkTbll+ew6JvpkBu052a/W
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-ORIG-GUID: dZgl-IBxIPuRqkBz9SztpS0Hz9iBNfXk
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6afa7164 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SdM8xRJxjg0OYcpbQgEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxMSBTYWx0ZWRfXwiHLV7y4Cc7y
 4+ouCSdz6y3AYkn8vsM2W1VqlW4vODGNm5t820dqfNfaWgQ45HGJuIAcM/2JZKKEyaNHvtnLznj
 dxepuseS6J78VfnPrp7Bgqvl00zeFZymAUPxGVp2ejdDlpQ/4bgknDKm4oTvvs5w3t0jo/RnQDR
 Bvm0LcpTmv4rRHze6DsfADf+DN9TUQKH2ieI2ptBW/bkDDVqOt2hdhCfjffpNKotfwvVVatG+QC
 TsIjoG4ryGMnuvMQuamOhVULEHGKQ/AIwIX4goHEBy1PcX70U1Yny+AkH+JEztI0vqc1Ea7g9fw
 R/vADY9Tsz5EXMB8Ibrevc4juzFgCXvlTWUXbPh9Vz9YRFdfurJzDnTkI5VNrY57ogjto6wLttx
 l60fdm6K2HqZ/zOKOfNTdIPo7aUVe8l74e3ERWFvVakfIyEgAlqN76gZzfI1IzSD/YaU/o+BC4q
 +KC7EzLqxrl+uRB5nJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxMSBTYWx0ZWRfX8WytqJJ8hG1n
 BqoNBpr/cSHVOo9t1ocH06V2+b7FbSk+ot0b248WVGOKEpC9bgWN9+N3XwZ5AzvcZpzmULpbmO+
 ZJwzWVKq/fVlXYGlvY2Kn74tKg9gLoE=
X-Proofpoint-GUID: dZgl-IBxIPuRqkBz9SztpS0Hz9iBNfXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160011

Add the byte-mask property to the fixed-cell binding. This allows
selecting non-contiguous physical bytes from an NVMEM region to form
a logical cell value.

Some SoCs (e.g. Qualcomm efuse controllers) store a logical value such
as a MAC address across non-contiguous physical bytes, with one or more
bytes in between reserved or unused. Multiple reg entries would require
the consumer to assemble the value from separate cells; a device-specific
layout would need a custom provider for a common pattern. byte-mask lets
the DT describe this directly in the fixed-cell binding.

Bit N set in byte-mask means physical byte N relative to the cell's
base offset is included in the output; selected bytes are packed into
the output buffer in ascending byte order. The number of set bits must
not exceed the cell's logical size given by reg. byte-mask and bits are
mutually exclusive. Cells using byte-mask are read-only.

Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
 .../bindings/nvmem/layouts/fixed-cell.yaml          | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
index 38e3ad50ff4f..46e1101ee98a 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
@@ -34,6 +34,20 @@ properties:
         description:
           Size in bit within the address range specified by reg.
 
+  byte-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    description: >
+      Bitmask selecting which physical bytes within the NVMEM device region
+      contribute to this cell's output. Bit N set means physical byte N
+      relative to the cell's base offset is included; selected bytes are
+      packed into the output buffer in ascending byte order. Byte positions
+      are relative to the cell's base offset and limited to a 32-byte window.
+      The highest set bit must not reference a byte beyond the device size.
+      The number of set bits must not exceed the cell's logical size given by
+      reg. Cannot be used together with bits. Cells using byte-mask are
+      read-only; write operations are not supported.
+
 allOf:
   - if:
       properties:
@@ -48,6 +62,13 @@ allOf:
           const: 1
       required:
         - "#nvmem-cell-cells"
+  - if:
+      required: [ byte-mask ]
+    then:
+      properties:
+        bits: false
+      description:
+        byte-mask and bits are mutually exclusive.
 
 required:
   - reg

-- 
2.34.1

