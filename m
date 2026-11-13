Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556368;
	b=z4+D1iLMNMAdetsFf/9gcFsYW+oLxBJHGs3yOabhCsLiO61nqjn2xLUr89p7EgGAcoAI
	 OoQocpmx+aQKXTgQ1NPKHJKqhX+2/i9Ehvpc+c3pu2pH9kiI/siARHSMUI1in7rmJ80Jr
	 DPE1We/X+ItDA6Pul2dT5IZCQnl/VX2E0APqX7wJ4MJbtNQv1idNWT2qTwQMx3KfELQcT
	 9G4yIaYWGSS/xZczBbrdDS+vniYdfx3FEWIki1JDJXWKqcviy2JiylP8Fj6S1EXwHbUe7
	 TKPV/ZlNdW9E4tJ3CrfXrHcP1c1Gc/GSS6p3/ziOoX8yvONC/gJc9pgSQrcuUzUOxsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556368;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pacv1Ui890QsD4XuE07ii/tqMr8qbFIfMymWdjbtLL0=;
	b=0nvgKYeMg1iGpOwuCsAARwmro9AgsZYHEyRj2j9OC7vWxhf6R4QJhCT0IFToTgYnjSK/
	 MUmXeKu4ozN7kp43c8C5NU+ii7teAuxMHqSB54LstkrqXWAk8i0u1XOcbezPj+gd77Y1k
	 5/ZXPj/t9iyi49jh7A0RUzNrwzv5k+WlAm3/bv7KVKRf9eLEdBMftAy3lkP3zv8M+kMxn
	 KP/jXag6sU8ZAvFQN6qDP6ui0or271vISNCszq9IjRPMQKVkH2nbpSVz1XRC38ogqB0An
	 ltbOgjrC+WcJvOWW/VUj1+hq3o2TbNIeAhM2JrK7hg1r+GlBWXs3yKscGbkwGaofoeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jvhwUJ4F;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXeZL63W;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FA9606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2FA9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jvhwUJ4F;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXeZL63W
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57F3F3120089
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pacv1Ui890QsD4XuE07ii/tqMr8qbFIfMymWdjbtLL0=; b=jvhwUJ4FGqgHGOB6
	MfYFKL26eAhXmFnpVSElUTz1rvEn+/4kKFaFcNwmQMhHzsoW02sCkeTM8Dwliyp4
	BzMs9xplO+z1HALGkb+4JtIkxeB0iyKEl0OCP9Hoa7hsJvP4WYSwYZZxn7q4bMFx
	CiXuvDT9rDyO1rdn8E/1W9LpcsZDpGJuT3SQZQEK7rYiWyp8lIVHPML5j05RezSm
	sEg6g8p4C8g/b0iLHFHIYKqxeiwkajeUj1DEI7zBDtOCbYZyfI1e9QrBT8KIO6aG
	fr7PXVVTvvD2HkpJZXLlhdN+WO4vAR59rZdDtyReFiQEcmnoAm4KXmRfpczfIsij
	VcFPAw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwa2nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:52:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso583105a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794556366; x=1795161166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pacv1Ui890QsD4XuE07ii/tqMr8qbFIfMymWdjbtLL0=;
        b=EXeZL63WF38UeMgqixgWv1pZ4lQD5OZd9+BBhAOcIZTQjG5P2HmrHdOKcIVrkS1mJV
         IyjPEkj3JYFJXdh6BEvh764Ntb67iJPTAwijnwPrxSSNPrKKdOBiucDDa7QsWfkcSM5s
         vJq7o5PyaUp3iXERgkWfVJGQof2wVfOtGVb0X28hTEsW1HVvm/D1Y6HZlSSwiEMNvcw3
         0m+ahwTZ/EvA0cFG0Kx/PwMS7kfZPqVQpYvqhjmXQYhCO10dzklFONdy5/hOBAGDawcm
         SOgY3hZ46qaYPSN1DX3Ie/Ot14QaokFdtbyGJIEnDzKtUPEv75sYt67TCqaMuvQaB/nC
         vmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556366; x=1795161166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pacv1Ui890QsD4XuE07ii/tqMr8qbFIfMymWdjbtLL0=;
        b=ZsWzfToIucDf0/IZnOWxN8/YgYVtNcYUhQkOueMHvk7wzFG5QotLrbEA1dALdjOa7/
         hztJAUzPnn0+jW8qfSLU5/68/yI3JY39HDaBP0JvryvqwYAkTnXSTYtjBtxhTTogp43A
         UA72bxM/XynogwG1nN6wRlY6JGYbywaLH43rzRqA4AMLej8MMbMQpHEoGawnvMWIMKOX
         H3j5NJ0jqVXI9ViAtnljre8xnQ2Wb+3WCiBfy52x49wEOByyvT9gCLUbT1EVvjuHwzIR
         78VOy7L3z0DIkpxTQ6lGQ7x8I1rKB9HlXLKK1MkbRCBzIXACXUcYNGdGSywAmEjgN58n
         cQKw==
X-Forwarded-Encrypted: i=1; AL+hErEjbGKsiNBQ0cxE7qPjWFAmMuPlh25i5YcLGaVY82Vklw75HhM3XTCDomRCbfNtkDDUWU1FGyKYeYt46Kw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5ZQI2Zi4ht7oBVOlH/mKXr/R/w4VtdxyZgbdf+VwaAbb61Gf5
	fJknHqHtEhk0VYHdYFj+T0N+vqw9jWX+inlwOmgv0bI+zl+Mqn+BHcAKuReUhFa8RsMf7Plu0NF
	vrV0v7rI8GIx+94rgsCOxqp/qrKyOyZ/Sznnkg3lOh4PuEO0ichQI6CJeRUyMsfpWMYM=
X-Gm-Gg: AYBFou1Jsc1JtF9/yQRQc9MUU0WdL8Csm4vSj+NzvXwvjFIwsIBgBLby1XpwFHevyDL
	LaXZ6KdiSa9mgrCXCwb8cRrcK6KiMsVNQYScv2N2gg/SEWio3UiNdAwKdN56S0dah2B5ffS+a02
	PVyCIkJDqm1j+GdEzkcuLJV0hjYH7wlQGWWXSDH0NWJAFuhY8R6uogNcLHLt831T2Faq8dHeqP8
	9i1fMV3JDLXzU+msIa4sBkP9cfwIEFpjf2h2Q4yQz3crXRtkxeShgL8OUv6WtG3/pKXgpLnO7hF
	RneJkAtUrro3usWbEJPleO4SopcgbqZqiQjzrqCu6U6WdbIT5R2Pv8ptNkxJOWUdqj2xD78x/eV
	MfyFh6RQ/QEpIAyeWOYlfMnt5Dt28lUFmIeV0qormhQbK6eQHYcPCv+lOskG7tL0WZkayyNRtXq
	f7tiyUFBuMXB51Do8eE89z1N1V2Uxu25PS
X-Received: by 2002:a17:90b:3f46:b0:3b1:8301:95c0 with SMTP id 98e67ed59e1d1-3b1b0b95db4mr1261849a91.61.1794556365595;
        Thu, 12 Nov 2026 23:52:45 -0800 (PST)
X-Received: by 2002:a17:90b:3f46:b0:3b1:8301:95c0 with SMTP id 98e67ed59e1d1-3b1b0b95db4mr1261832a91.61.1794556365084;
        Thu, 12 Nov 2026 23:52:45 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b24938bdsm1277107a91.1.2026.11.12.23.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:52:44 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 15:52:36 +0800
Subject: [PATCH 1/2] dt-bindings: nvmem: add byte-mask property for
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
Message-Id: <20261113-nvmem-byte-mask-for-split-macaddr-v1-1-138f715f18c1@oss.qualcomm.com>
References: <20261113-nvmem-byte-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com>
In-Reply-To: <20261113-nvmem-byte-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794556359; l=2395;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=+A1MvkMweMbrZQuRjcv/xz8vo7SmPDeELb+4dzgq6Mk=;
 b=ODNNgjLLfwI99LX2ZaYn6W4GPYs7y2ExV9iAvV3HcG4OQZBjRLXpmXuy3Dzc4JGY2QAjLv/n7
 d1GLyH69jxuC/CZypFss3OQl3nsyyGvv3tT0w/1zXbQ9o0T17a8QCpH
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6c1ce cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=3jlLlykhy1_UzDSnmkEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: VxwQ1XXrGYBkBjSVnpOE1vG1Swkxwa8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX+wtTwaa/KwBn
 DcV30U7bBQETkRp3zHaDPy3UaQQ9EVFpV5AguSPCwO/FgMbXrdVbIT3fmr+9be6mXtFuhHlh7Sg
 Mj5SqCUlUWXjLXIvWpdAZyHItBlTauz51f+94dtRjiVukVH2ZoovIpruC+uUiX3vtZVbD/TnqAl
 nmupp+tbimIlkJ7d9s8D4GmDg9hz+XBmjSUMED5ZvCFK2YVzZhv265xRgOokkI1Q08FrVBtJWte
 4IAGLXM9rFeQ5mneu/J5l1Z2TJh/NjbRyyjkLLI3aAslbo5QBU8hzHJRBaLyjnMbFXysHBBWBDP
 iNHpW3JMir7jM1tq3sub2eiyK9znq1hyB4UIuDXZc9c6i76hxcLRtlBD6hw6rJ1KLm2uyadgdw9
 4lPk9sfQ0Z5m22zQ1eBRLdDFUl4vHx+JZNe/E13GvIQ+EwsetOAQCKixcUF3VCQ4E2W9Sylf5sP
 V5zTbXvWU/AFG0sjlsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfXzKjRSzdOZJl4
 8dRyYscO+c10PEgg8jdVaCKnju8tffDl14stRNlFQ9NTBJU0ZphJ/6dYiPyRXZUWJj+UOvCha07
 TB6EtC1SRa/Ju2coq/ab+hYTAWuec28=
X-Proofpoint-GUID: VxwQ1XXrGYBkBjSVnpOE1vG1Swkxwa8W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130031

Add the byte-mask property to the fixed-cell binding. This allows
selecting non-contiguous physical bytes from an NVMEM region to form
a logical cell value.

Bit N set in byte-mask means physical byte N relative to the cell's
base offset is included in the output; selected bytes are packed into
the output buffer in ascending byte order. If fewer bytes are selected
than the cell's logical size given by reg, the remaining output bytes
are zero-filled. The number of set bits must not exceed the cell's
logical size given by reg. byte-mask and bits are mutually exclusive.

Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
 .../bindings/nvmem/layouts/fixed-cell.yaml         | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
index 38e3ad50ff4f..cddda3f70691 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
@@ -34,6 +34,21 @@ properties:
         description:
           Size in bit within the address range specified by reg.
 
+  byte-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    description: >
+      Bitmask selecting which physical bytes within the NVMEM device region
+      contribute to this cell's output. Bit N set means physical byte N
+      relative to the cell's base offset is included; selected bytes are
+      packed into the output buffer in ascending byte order. If fewer bytes
+      are selected than the cell's logical size given by reg, the remaining
+      output bytes are zero-filled. Byte positions are relative to the cell's
+      base offset and limited to a 32-byte window. The highest set bit must
+      not reference a byte beyond the device size. The number of set bits must
+      not exceed the cell's logical size given by reg. Cannot be used
+      together with bits.
+
 allOf:
   - if:
       properties:
@@ -48,6 +63,13 @@ allOf:
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

