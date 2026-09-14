Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339A44252C9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378806; cv=none; b=udWAqePwrMnu33cpbwJ6v9pUz8ws1WQ5HmQpewRZzs99x2FJQvYHsuM6O1rQBvXE3/pF3do2H3ywUJvXDpR64u5fPfn6jaWWRo71FtaiQwxnfiohSTxZVBEl7WqjS/QtFoAQXPro5L8Ab8dLSutJxpQB47DYF27vJ6dNoxF4YyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378806; c=relaxed/simple;
	bh=Q1SO6EtCR75JXe3JpYCv7OaNJuuMIm0WdKd+5Zw+RCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z/uUftdKu0rpN07byVV7eD1+g23Cyx+h1uDYgnsDOMoz+Lptp2Lt7sdaecpODGmA7wTH7rg6rriojrdHXpKDE/h/kf+t3G2WqBXuFeuEtYrlgxQ8F4zBEcoavmF+dMNmiW7jD8TnEW45otpUufV+c8tDCf09yzteCC6szn4Udms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aHJFoUe0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pe0cetSX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aHJFoUe0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pe0cetSX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9ax4S1304931
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tcHuExv7ntKhJgMZFmAB7i1tSGwudIpTtAVbjxinbE8=; b=aHJFoUe0U4P6bmfz
	PX35JjrmmrCaMDJgrPYCM8t6MqWgKnVtZPZn+ElJXhrlO2zDuLHzlyv9JwvQtS9/
	DZJJHAFDfsDnOZhZHqdoiBd2GVHn2436wVZ72hME2o+Rc6q0la07TWZy3DXCQIQR
	Tnz03X0XVhws0gEWvgmHAB5wZZutMe+Raa1d25K5eHh7mMYrwFO9nv76rWfdOizH
	5t8LiOnQamEB9AePp5T/yUilh4s+s4nW8OW9AzfQ9RSzWJmijeL6r1KAuHLyeB4x
	Z41s5ONEZtJdHI9oxmVyYAMPYEQ+2Qur92p54RJ4GY6bMuGS4dvdBIOZvW0AMalj
	Wj70ew==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex80bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:40:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb92868263so2587060a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378802; x=1789983602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcHuExv7ntKhJgMZFmAB7i1tSGwudIpTtAVbjxinbE8=;
        b=Pe0cetSXygOLNUnzKciieksal/7hdCQUH40b6VE/gEIe91/qTYHeZtYw2cWk59bfpA
         f8pq04PTjgP9Yaj+P4FWlI0etz2Ar71WX4wmfqeQWlazcr40Pbuuz/x92b8ITKG9ZopJ
         CW+xZT4/HcnV4GKS8lUVXYqLrg/CgDOvhGR2HJiLVbiil4iSTjQRLXd25in5DHmjIisf
         H9xYsUcGEv5Z39yxFP3Ouw3WnT7l8vQzC0Hk/z3jQaX/ScPw/0iAyigMEcJsfWUAZ5zN
         o66tugTDo8IX/pfg0+tu26NCsUNLm5j/CwqfMYa7A1A4ha/1CNY6SaiHiHMqbbkqhUEF
         aZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378802; x=1789983602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tcHuExv7ntKhJgMZFmAB7i1tSGwudIpTtAVbjxinbE8=;
        b=CoRWRMxvgR0wBJwcPAi7eOd8DlTr8bGb2wXcQurWGd0FHfMbDT/bUhsBvg8WKCMjV8
         PJiGuWrQrJk0srIIDU9JL2qKUr10EpHBKOeUbCRLuru+zS+faOv6HHZAw/7C1x54MD+q
         kQ4ZxIHmFtdIFE9A9IiQeSxSIgUzvrLAOYgWCOx0DICWS55xVteED96W8E32EjhhHwla
         Q29wTMbGxkndZNIBtT729voBQaOyF4va3UiFcdE939+3EDPqcFpSD71DpMfUSU1DZXPD
         amQuoeEy9cpajTQBVvWmL7yn8yWB46stSaUbXqCoADnLrjNAYVps0GvN1P4DHlxDU+F+
         UJ3g==
X-Forwarded-Encrypted: i=1; AKwUvBwFhxSS25bkaRoSqPD9ptZ8EangYuDSnnZLaeK89AsMRdMO2uwiq3SYluoXL6DUlfRowlCmjmC4F33YHqE=@vger.kernel.org
X-Gm-Message-State: AFuF++lCpIT+mdjNHo2sKaWP6ovA/dl9aOKgPT6HqgvxjQZZo3/zFgdD
	j75MrgX+4AZb8sbXoF5LAtSIChVDK77lPf5Cdo5QFAiC9Ca6kEc8QZHRAijv89ROfRFF9RqrjpY
	blvgODugkwr/iAYnK1cAWI4/Jm2q90FaSJcJZ4DZnx3q+mVkd07zwzXiWtbmqpne7Cnk=
X-Gm-Gg: AYBFou1lv2NMXjYi0hKgXWWbXwfZN6uBuQrJRukgN1ROWTWiXwmZck0Tph5+HaUdqbh
	d4WPzwVKwc+1DaTwe1I7EaQF5te0QhUydNyitD945+XedxIUB/11vkuAkn5cEq8AN4HyXg2zMA+
	VNBXJrOUF2eFmj+cC+EocF7k18driNPs4gWLMildh3jqP191S3veBa+FAz0vT2QrG87xXW/HSBY
	RhtPUeKUPIWH8AfYfs3xHx9HXBVRYGlwLgPftVX3pQ10IvKExt7gNFlxuaI+tjF/V1lvStuJ1lv
	AKK7x90gYgDKPK+0C4Di7MI8s+UBcwlsTg2jBa/vlqHJ4S0VArwerq4LlJ+BHewWmB+ZIWfRvji
	rvNoXYULia9fE609MGbB17YNd7GZ4Jwsn63RkJSHhkuRsO8zNIHA38X4v
X-Received: by 2002:a17:90b:4d0d:b0:39d:efa9:cd25 with SMTP id 98e67ed59e1d1-39defa9dd52mr2252562a91.2.1789378801893;
        Mon, 14 Sep 2026 02:40:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0d:b0:39d:efa9:cd25 with SMTP id 98e67ed59e1d1-39defa9dd52mr2252522a91.2.1789378801416;
        Mon, 14 Sep 2026 02:40:01 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:01 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:51 +0800
Subject: [PATCH RFC v2 03/10] dt-bindings: arm: Add MPAM MSC binding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-3-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378760; l=6447;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Ow6nsjOKfT1BtZK/wCsIgEjpwtBp/p95hFXIvpOx3ZI=;
 b=x7FrWzfyQw20XZhZOBNhfYnWn2cwebvQR9HvUByeGHDRQbXH5+wbqauX7T56oAUlGWmLaBnLR
 7FCUZSHVECOBeI4oK7kfIhrK3ztCkPOMmNwOfkX+ArlwVuMcgKU+H3j
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNiBTYWx0ZWRfXzjaZIyxBmOrV
 vkkISrfREFGOJz1TsPAc/9RlDl8SyaeauqV8AaGsDed8JCFRSz68hrHyba6vp38VfI7/LRYFfJF
 a/yk3P/TCv/lwOf7HhTtpX+RLHRo9JCv0zJKlZ3wQQALFX5ovLnSh84QdPL2ruiyx27Y0Eep8x+
 FaL0qfuvgynOtU8fuXUTd1exxAU/2uZkL6pTBRnmYFu9RSATviCO+7KYGGbDXOAmgXRRQY38LmH
 HMxwAk0T9eogpNZo2Xd5U9Yi8BoRp1uLOiQvRJEFptqBrKVfwbmzFNJtAEQe9vTobyZMlo0Cmso
 /Hw4eGJipL+Za2XyZF0B2T15SMYmntGTlGuLJBUvzTRAYS2GiIyQ2cyNKgkHAT1BwPWhpygijxX
 rG+qatssCf01DRGYoC9CNilDpsBEfQNqTziqI6BI/KaSFXmNTqkRQHMum07S0W2OzJp/SHuxaPg
 1lklBThikj8TqCkWfTg==
X-Proofpoint-GUID: K_4RhArQ2WJMPKfKFFh1l0U2bS-AY5z1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNiBTYWx0ZWRfX02UN2hTuGSyU
 sQswIiPVlqtJz7TacGGOg+Pbdu4Z2STmdvUREfCLGGF4rkN/8ddqWLesHDqT//lIF1NyBAQxoB5
 McxhKnFUUNP0oGv1MPa03aXMP0li1FU=
X-Proofpoint-ORIG-GUID: K_4RhArQ2WJMPKfKFFh1l0U2bS-AY5z1
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7c0f2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FqHZ4tX-ONj_CKorFbsA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140136

From: Rob Herring <robh@kernel.org>

The binding is designed around the assumption that an MSC will be a
sub-block of something else such as a memory controller, cache controller,
or IOMMU. However, it's certainly possible a design does not have that
association or has a mixture of both, so the binding illustrates how we can
support that with RIS child nodes.

A key part of MPAM is we need to know about all of the MSCs in the system
before it can be enabled. This drives the need for the genericish
'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
until a h/w specific driver potentially enables the h/w.

Cc: James Morse <james.morse@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 199 +++++++++++++++++++++
 1 file changed, 199 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
new file mode 100644
index 000000000000..53a6fdbbf05f
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -0,0 +1,199 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
+
+description: |
+  The Arm MPAM specification can be found here:
+
+  https://developer.arm.com/documentation/ddi0598/latest
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  compatible:
+    items:
+      - const: arm,mpam-msc                   # Further details are discoverable
+      - const: arm,mpam-memory-controller-msc
+
+  reg:
+    maxItems: 1
+    description: A memory region containing registers as defined in the MPAM
+      specification.
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: error (optional)
+      - description: overflow (optional, only for monitoring)
+
+  interrupt-names:
+    oneOf:
+      - items:
+          - enum: [ error, overflow ]
+      - items:
+          - const: error
+          - const: overflow
+
+  arm,not-ready-us:
+    description: The maximum time in microseconds for monitoring data to be
+      accurate after a settings change. For more information, see the
+      Not-Ready (NRDY) bit description in the MPAM specification.
+
+  numa-node-id: true # see NUMA binding
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^ris@[0-9a-f]+$':
+    type: object
+    additionalProperties: false
+    description:
+      RIS nodes for each resource instance in an MSC. These nodes are required
+      for each resource instance implementing known MPAM controls
+
+    properties:
+      compatible:
+        enum:
+          - arm,mpam-cache
+          # Memory bandwidth
+          - arm,mpam-memory
+
+      reg:
+        minimum: 0
+        maximum: 0xf
+
+      cpus:
+        description:
+          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the parent
+          device's affinity is used.
+
+      arm,mpam-device:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          By default, the MPAM enabled device associated with a RIS is the MSC's
+          parent node. It is possible for each RIS to be associated with different
+          devices in which case 'arm,mpam-device' should be used.
+
+    required:
+      - compatible
+      - reg
+
+required:
+  - compatible
+  - reg
+
+dependencies:
+  interrupts: [ interrupt-names ]
+
+additionalProperties: false
+
+examples:
+  - |
+    L3: cache-controller@30000000 {
+        compatible = "arm,dsu-l3-cache", "cache";
+        cache-level = <3>;
+        cache-unified;
+
+        ranges = <0x0 0x30000000 0x800000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@10000 {
+            compatible = "arm,mpam-msc";
+
+            reg = <0x10000 0x2000>;
+            interrupts = <1>, <2>;
+            interrupt-names = "error", "overflow";
+            arm,not-ready-us = <1>;
+            /* CPU affinity implied by parent cache node  */
+        };
+    };
+
+    mem: memory-controller@20000 {
+        compatible = "foo,a-memory-controller";
+        reg = <0x20000 0x1000>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        msc@21000 {
+            compatible = "arm,mpam-memory-controller-msc", "arm,mpam-msc";
+            reg = <0x21000 0x1000>;
+            interrupts = <3>;
+            interrupt-names = "error";
+            arm,not-ready-us = <1>;
+            numa-node-id = <1>;
+        };
+    };
+
+    iommu@40000 {
+        reg = <0x40000 0x1000>;
+
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@41000 {
+            compatible = "arm,mpam-msc";
+            reg = <0 0x1000>;
+            interrupts = <5>, <6>;
+            interrupt-names = "error", "overflow";
+            arm,not-ready-us = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ris@2 {
+                compatible = "arm,mpam-cache";
+                reg = <0>;
+                // TODO: How to map to device(s)?
+            };
+        };
+    };
+
+    msc@80000 {
+        compatible = "foo,a-standalone-msc";
+        reg = <0x80000 0x1000>;
+
+        clocks = <&clks 123>;
+
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@10000 {
+            compatible = "arm,mpam-msc";
+
+            reg = <0x10000 0x2000>;
+            interrupts = <7>;
+            interrupt-names = "overflow";
+            arm,not-ready-us = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ris@0 {
+                compatible = "arm,mpam-cache";
+                reg = <0>;
+                arm,mpam-device = <&L2_0>;
+            };
+
+            ris@1 {
+                compatible = "arm,mpam-memory";
+                reg = <1>;
+                arm,mpam-device = <&mem>;
+            };
+        };
+    };
+
+...

-- 
2.34.1

