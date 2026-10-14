Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222D650B8C8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982988; cv=none; b=l/6x1PFN5cIYUX7R1LDIl91Ak2PH8p28Q2wI6zSuocOnRdb2MRxLhanMzHIGhakTMyqMTkwn7yFWWdQehIKb/0igXPqgltEpnMK05q4JozrSeC19LBdu52bC3uMrMXE21GqVnM0K00ANygtWmCVuTUaR19+lFyNxNN+3YREO6gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982988; c=relaxed/simple;
	bh=ASWIqLah/uFWvhZywA6+lXlXr9BhgVdBiskjUcy96bM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DIWudXzVmx1OtSSfUF6r1g2rbMsOvc/zfk48W0+mT9OUtNqzn5tVHyG5JWPphM85xrhl6FeVYBNXneVQLyG1lMahwlI1NRh/GwR3sFEK1V+kJ57XqELDmXlNI+K/mwhHYwxpHsDyS8ouUJqyGV/STN465wHQNwdMnojUJFHAJFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kFx36s33; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWP3o/cW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kFx36s33";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWP3o/cW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9iNio2222175
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HDwwf2nnDOaoIDpnBdokHTTm2gc9B8Cwgq888y5WJ0A=; b=kFx36s338qO6e7pE
	GKWQhHpV1WwW2PUWaVNWiJaGszUnYv+PPw/btR4wbwwT27k69Kgwkdug5rAvNmmo
	3UOyrAzi3y6bKwBwhx9g5uFUAgCKrK/77od0sfSCfyCAtgUHWSxyC3F/8kLAZNfH
	LRoNdQdrHzV+dXEZ9LVdHT7U/lsJq0RFTLvEN6/Uv7uvwzj+IXMGTbGdZzmse36f
	LHWPNrL4VpShSh6KGv14ME5G78fcCOV6mMRBggg0PT++ZWjd1c/UP1A/Jdwl8ZUj
	E1hcEP/Wis/DybvzUYPq7SPauE6elkG3K2GGh+K06+ih9S962pD1mFufkkld6zyh
	pMoqhA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsbqm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:03:06 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e95ef10aeaso358277e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791982985; x=1792587785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDwwf2nnDOaoIDpnBdokHTTm2gc9B8Cwgq888y5WJ0A=;
        b=NWP3o/cWmgvbNYcE60HvpzgTw/47YVg2RSBno9Q/mJ3ibrO0gp6NSzGk4XUWmYxcJK
         UJtEbZz5a98YyWOf39dJfdKN8h8TIFxxUznXkQvTJSf6XNHiANsiIfqk/3ynrCAroH3+
         K4k+fO8kuuwOW2b5Ij8MfcfDyrFJa3aXzcaHavPdbyBEZ3CpkyKBroHrBeqQi4WAkpi1
         QYNMt35Pk5rQ7EXrg43OqRBAfJ6keQUv/ucZLN/fseie4m8flLYwCCV7mEb7mNVPBoAH
         lytSqF5aqlAe8edoy6Y29IhY/Y2A1plGN5qPepynQucdkeaNepArHY3TkTLf8tPl4kqg
         RfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982985; x=1792587785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HDwwf2nnDOaoIDpnBdokHTTm2gc9B8Cwgq888y5WJ0A=;
        b=AvBQYs2647uX00hGdLNdJYBgcPW74ZepW2GccuSodG/J5umDsaUlyaaqeMg2+MXJaK
         rU9qkOHxa2MdTWvnBc/rfiWFqsOboi7FwTjjrjYBxeybjVxJWBF7q0dXEL6fciqoGGbc
         Fh9cp+33y9Y58BzQfQzwi00Bb8vtDA39eQLv0YykvmtdT8+wVW5GQiJDrnwPTpgwG+pG
         QEsCE4GyRE4DMxucxJ6faPwZUhi8UVS6+BqeD2puJQNj8myD2hCUm9NR4+pffmMSUwfb
         lN7UbZVBHLePON5ZpG+Vgkf1scgN6PBuXsrX33jeSHVjh/rR9zt8t0zoAOPhrqOaSe2w
         OYaQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3DyEEjdTuxEqVGrHmaLBO3xYNYqkqcxghNvWUUL1JiW2AUJXZrTK0eMs2w/o2xCCi6BQbQBtGhwbd5b8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnTfuW1eHqClmNwgpahsx9thKujVItFpXfhxQ1MiIm/meCIsjY
	cDaPFqMZinDxPq/Q9Y+Q2Ul+1HKIYWuJ+u5Fs4BDLP+vEh2LMs1XQct5gWWhSXtArXAatkizIKV
	YpGmq/Oo0lvmUvDu7sMfrQZHYycVUTb+bVAmNYrkErcLfIwpWNgIFD029grcExhYmT7CwX6frXu
	0=
X-Gm-Gg: AYBFou01w55g/6P1UDXSYDdMkZzLpSfgUaGqODKlZYlV7LhnhPQy0HPm7h8/Nr024Gf
	x4B4GaiwwvBbbn+iA0BnspgavbHgaWfweKNlIBZE0g0Y+Ux2eCSqcaMk6mTrvqnasTsN2AFL0M5
	Frvvhf3oDxaSEG4Q1/x/oV4vx9J+BBBHDema6KE0Rb7rxg6z4Rnu+hMyOiihxxpTLrpuxqeY7I/
	8FCT80kK1Hu7dNabpu46N0b5zo+QNQSIKQa0BCq7zViAslkoBRg/j5df+O0X5kMyDQBv4n0iLpS
	fVdGlSfwXdWjcHTW9q4zF3aTkY4kYY18hgEjAgiWp9NdhhZ+3nVFyArSQs6Jx81emAan6WrYlTf
	5wsVv1UYU9Q==
X-Received: by 2002:a05:6122:3c4e:b0:5d3:9fc0:7885 with SMTP id 71dfb90a1353d-5e91efb3a55mr5467817e0c.0.1791982983569;
        Wed, 14 Oct 2026 06:03:03 -0700 (PDT)
X-Received: by 2002:a05:6122:3c4e:b0:5d3:9fc0:7885 with SMTP id 71dfb90a1353d-5e91efb3a55mr5467671e0c.0.1791982981490;
        Wed, 14 Oct 2026 06:03:01 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcece106sm567795e9.9.2026.10.14.06.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:03:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:39 +0300
Subject: [PATCH RFC 1/5] dt-bindings: nvmem: Add UEFI variable NVMEM
 provider
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-b4-nvmem-efivar-v1-1-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2957;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ASWIqLah/uFWvhZywA6+lXlXr9BhgVdBiskjUcy96bM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqz315K2FLP6WGMZnegKPCWuqzDd6D0ByEMRQej
 ElIqj4tpuGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas99eQAKCRAbX0TJAJUV
 VnNREACdYf4Y+MuvkYiPeu9661Rm1nFDv4WC9VsnQ2JyiHsKSkNFgewOd29zaZAI+oGnufkrwux
 4q20TvzLeLe/3ozRF/ewkO1jTitV+irbQiLIWhFWxwgxr8N9w3aOgS6GGhTms/7K8HaILwEzDUH
 J51l2sflhfQN7E+Rr0ag/mkF1MH6j5TJ7vgT1lPQyiJr/p0xkKhVwdPA6bxituaJ3yvuIod4Sav
 oEhYmLeM1NoO9XyIqM52YqVC5BOhjphdMUnKrAcmdwEmG0eghPzp9DmlJ/wm+N/7lzmWxwABcYN
 Y1fGMYkMBh0ocx1JgAFsXwzxeThIyQWecP6O6tbuMQLx1LJOJDEjNT0OdmDMqWORWNbDzG/CW+8
 0/iKIXL/1+K95KzogmOLoZN4M70UC+IrceawLhmvBCPf6QMQRueJColiSzpwN3M+wPSkeIokodg
 5Um34B2se0rms/Zi+cqCHDyPX7c3wtXkgA1dl0DcKyR+M4J1pJAWYg2a0KlYXUaT5fsLR5DX2sT
 U1WSvL3ZUPGVL98WQWAIltw90CLW0nkJErc/4YWg9vwlOmo/nmgECdOjlcvVsNyw6PAL1wtr/9x
 8++nDWbqmg8oM7ymG/zp+Fbjgawn5hW7lHwor2LUfNf6N624O84hSOvFqgNkxaAly3BpgO6rmHw
 jv+lYCtivt/cgLg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX3dzA/n/6Gdnn
 I153yiWjv/Pn6ntmMCISXXNbCAzW9aUePjxKbeS0KMLpqRfWl5mcJrWVHpS/IanxoPGRUXSjoJg
 CbjaoLv4xP7wODcrsHKclMeudBPl4lMNLeF51FB8WjGLIHQ+qog40oK/LH2ivJKKxyxLj2qEjx6
 r90CmdJYZwlWLqtuGJ+Bb8Iq0wDO55QEShj2BIKu+Cpl+DOAVMwizjDyRsWBNth+xYke/VR3FiX
 8qsyxC6zlFN+i5/dKRQPbpsNmbmVSiEJ8NYISNnWAhNNsug2ZDsTevQmc8DaVrjAPdvAIxJc7sG
 d1zki2PHBc6M4kgrUyWNMCbM+54Y5xarTP+J85e06SbbRQ1MBgLYyP3Tsq6wv7drft59tP9MmND
 QuBMl6xX9UuQg7mHy80CWCUdpnkUMjrz3h3PT+z2QoMFFNKsldAvumWsRZSN1Qzed/Zyq7NyyPF
 GQcXhSKdea+iLzpbBtg==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf7d8a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=t4Q5Td2Vxm9WVIIx0qwA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX6XKPqTBGyJyk
 GdJRfm+BTY6FZkIo3xBflqZjITO1pbam8Nje2GgZc/mVTjzYsqakTPt++XASHS1YEyKguhMGLbx
 x8O08qguIEQyzhqk1y9plTUivQst2F8=
X-Proofpoint-ORIG-GUID: kzkibSrwv9olamNYwwL1786-RAGYrMWc
X-Proofpoint-GUID: kzkibSrwv9olamNYwwL1786-RAGYrMWc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140051

Describe a provider that exposes the contents of a UEFI variable as an
NVMEM device, so data provisioned in a UEFI variable can be consumed
through the standard nvmem-cells bindings. The vendor GUID is optional;
when omitted the variable is looked up by name across the whole variable
store. If the variable has not been provisioned, the cells read as
zeroes.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/nvmem/nvmem-efivar.yaml    | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/nvmem-efivar.yaml b/Documentation/devicetree/bindings/nvmem/nvmem-efivar.yaml
new file mode 100644
index 000000000000..cdc10bee3c6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/nvmem-efivar.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/nvmem-efivar.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UEFI Variable Based nvmem Device
+
+maintainers:
+  - Abel Vesa <abel.vesa@oss.qualcomm.com>
+
+description: |
+  Exposes the contents of a UEFI variable as an NVMEM device, so that data
+  provisioned in a UEFI variable can be consumed through the standard
+  "nvmem-cells" / "nvmem-cell-names" bindings.
+
+  The variable is read via the EFI runtime GetVariable service, which keeps
+  working even on platforms where that service is emulated by firmware (for
+  example the Qualcomm uefisecapp backend) and where direct flash access is not
+  available to the non-secure world. If the variable has not been provisioned,
+  the cells read as zeroes.
+
+allOf:
+  - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
+
+properties:
+  compatible:
+    const: nvmem-efivar
+
+  efivar-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Name of the UEFI variable to read.
+
+  efivar-guid:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Vendor GUID of the UEFI variable, in the canonical
+      "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" form. Optional; when omitted
+      the variable is looked up by name across the whole variable store.
+
+required:
+  - compatible
+  - efivar-name
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nvmem-efivar {
+        compatible = "nvmem-efivar";
+        efivar-name = "ConfigData";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        cell_a: cell@0 {
+            reg = <0x0 0x6>;
+        };
+
+        cell_b: cell@6 {
+            reg = <0x6 0x6>;
+        };
+    };
+
+    /* A consumer references a cell through the standard nvmem bindings:
+     *
+     * &some_device {
+     *     nvmem-cells = <&cell_a>;
+     *     nvmem-cell-names = "some-value";
+     * };
+     */
+...

-- 
2.54.0

