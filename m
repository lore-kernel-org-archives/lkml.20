Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188086;
	b=NmWMZstu39Gi9s3ruSfiOeEMZsuib1xeNRfeqn0lCqaqP+oj+i4Ukkxe8mIu6uZ46ylF
	 AtSKV+i/uGpHpyohw82wKk7OLWdJJCQkWGAf3AfSsFfenHeOAcDeB7aLOQ9nCiMAj3fX9
	 eAF1KbgEwr9JYaixZ+VCqxYc8U5yHEpOc9d0yQWRs/KvQomfDIs5b9FOVnQwsfFMPWi42
	 b827BRHIrZ0CqRe8mxlUjkxWPYB1ArhyHp7FUCdqpm0c7x1i4INaSW/kpdAXOkSMKstk3
	 /QWpdoOKQpofajPL45PUUNUIJLLNCkwhlq0AmwoR+8lRZlfJikrmslie/xSNTbJe2sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188086;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=;
	b=a45mdOoM41yv5SscAAEiG+zAuL664cCtn1j0pC0Z0jwqYhvCMv+C6hdrrmqozZVrVP2X
	 KPooV6UagzI7s12cqqTVatd8KA0vy57FDuopuN9hpvJNT70eyCo3NohfKCI/1fzPoeeRe
	 Q94v9iNoz7aZxoRbhcOcKkp+xpoytTy2b2r28O561YsdU/x03lXv24tljYSUQyYcz07ad
	 6zWu3gD7Ofn0o2NVQ5fc3Pwy9irHguMv0LLGdXTzlNVKUpUCaYtC5VXb/M1v8DNRxzHc3
	 F6t53ZbcKKeYeee0B14Ykx9uw1sqAlXIIaV3jDK6SC1UoLpZgtEbue2rSC+tdeZKiAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G9EIYHDe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TWG11hyQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF42606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EF42606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G9EIYHDe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TWG11hyQ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeBLr1539086
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=; b=G9EIYHDewyZC9pXP
	3ju6CGwJZw7Ujww1sHYT+7aynqaUpNLbRZGPsv8Tvphc+FWzrHLfL2hTrN2KckI3
	Oszeg5JA/y98c7nOsW3wXj7f6I+CFMreOCcM8TaPc/lg8vF7HO8WrzxPgdc7bve4
	AiwMrBA6PCatm4XTdvgsmU0e/NJCFU4yA9k6D+7gbtzTSPTsl3KMoIG5Z++jQC80
	Rdp/2OBbHcZvKxBmx2y74+SWfwPvAJVW6zYX7ny3q0Shr8cvTOA/8UuYPjjQ9GqW
	FHsT0qT5Atlr9KEjg0Yq0Cb4J6Zr4z83MwZIE0nZKKFplvzyBA0UsxBPXL6kdAUV
	fPOT1Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7rqnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:48:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eabb908860so8030155ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188083; x=1793792883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=;
        b=TWG11hyQqJ+dqQ/KriL4q3jDUW//QNGJx7hVk/jOcBD9DjVNKrfH6pU9ptjmTTedUj
         x8pmAIFZD5hyIZuEUVTjtALxAjqgD1OxqIWuVA12ZvBVt0AYlFWHpssOqzl9c+pNnnMy
         vAxMmQ5OA4zvbsdTEFLkCkPZl+83WxRSzegxHip2QRNWE6fBhBR2LLV2wakCjPQjilEf
         FfhhRFVcJQGEdRw8yaAtZXcqtfnCFhRWjZvw/ms3BvKOu7aUfFhfpBSsRkTh96n1frFj
         qIUS/DkcK1Bt6vjuZONpZ7ROB5s35dm0GHM0v6LrB21jx1aXTHufRY7hFEbk22S04VqE
         41dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188083; x=1793792883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=;
        b=zCjl5NZJTHocREfC964bkEr6HpzGLaTsP4jllD6aBCdh3x9uQYJb8z/NpWT/CM4QG8
         Q4wruWS+ZZhHG56oveLG6/6xVfqT/WRvpsLaOc+FJkG+6jUACbyhEc642pfnsz/6Uzn0
         50y33XnIWMAK91ISM0ZjjN64hFOxi4tyBownLwg0VxxeQPypi5O0nVBH8L5zo19WpTNw
         72rUk2ZigF/FZfRgHYVsCzorftuwSI3EWdi+dmctHg/3KfA8cAlhzezu2Cprr1uygDFj
         8fqq9rkvkHHVnEnJc3LYpiapKwBuGmB1DOSYdWROt+Q8hmQNYZ25zuO9RF0EsBsnS0xC
         6wdA==
X-Forwarded-Encrypted: i=1; AKwUvBzh4eg69T0RGbmW14XBAmkaEMhAlHKBIrMB4KOKrK4M163cAg9kJxak4PA1UlYgOe8owAI7GiyT9YF3SzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxjcZGejWJHnfFiUliP+W7eSYMew5CNzzNT66ckX55A5V++nZi
	5zjwkgksg/zUcJ96bGInORrR2F2Dr2cfyQIZY8nY8t8FLaDEkaFzN8XACG2zu3y6+6xCvKddub5
	YqbMEsF6lNmNtnz7LD80ITVWl904etsVWucGsSVbxRGoHZYjPZgIxoZEUm0REfGj5GAw=
X-Gm-Gg: AYBFou10C94UPRXJ37nHWf4PEBGwTxJ9MlvP0lTvyUYNp0avEMSSS7AisUNKw+MZRZ3
	tNpSjeHKrXJbetgj616apec951AWJLSACdXMwM7MWNjC+2sXv1z1eoE8oduitMqjLF8Zn1uGP2q
	/zZ7zkWbk/FCSLJDstpQVZmgVcW+4jkBGCiDKP+Oc3aWaiPAIrpAvdeymaRP5aXML8/OWlMHOX1
	70vm+DPIKOUIlweu500BvO+QJxoHEuuYIo8JsSBND7ejDCeMuRRk62/oVy0LDaYAbInQvXK83lC
	byX7tVZBDnWy0juq+q82sWLKGhl/Fmd1/FrPTJQC+LVqKoIPU4AKtCXFHoEGXv96zW4wAf2eYqi
	6wmdkAUyqdZlNmcRRelz6ucp9jtwq5Fr9W7BAUYRUct8OOrKjn7mWZ+bbZ6v1qTYFw11kpBVh6z
	wuIDkS17f+1DdtsxgyibdegPlftWSM
X-Received: by 2002:a17:902:d4d1:b0:2e9:6645:e9a6 with SMTP id d9443c01a7336-2eb005a650emr19174855ad.59.1793188083560;
        Wed, 28 Oct 2026 04:48:03 -0700 (PDT)
X-Received: by 2002:a17:902:d4d1:b0:2e9:6645:e9a6 with SMTP id d9443c01a7336-2eb005a650emr19174475ad.59.1793188082951;
        Wed, 28 Oct 2026 04:48:02 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:48:02 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:43 +0800
Subject: [PATCH v4 3/6] dt-bindings: arm: Add MPAM MSC binding
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
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-3-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188046; l=3009;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=8PN3jSMZ/mskk1bxkWM3cKZzjFP8ZqH1EBcyaOMTbg0=;
 b=QWyVLshjnniVm9WIuAHK9RFKC1Ym/nBG3lrXTz4mbtssrfXDgAXVJPOmpEbKpFuCoaLZgBk2I
 SFDmSOAvOcGBmxG5nLAbhKzjZmoTp9mAxYBABXBUI5GwlvpR6riun1H
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1e0f4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Iyi0AkbGYOnUpVGOj9oA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: hKBwKxtCe8s-0OEslLuwGT4rv-Pv2mPe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX+08MeR6nZ+2g
 RrkdYchL7Qj73dLglkpMzj72DXbIGHLfoZA+Jti4UVfVw+VFkkvdl4qjeRZ/oSwbpkUFLeCdaao
 WdGknnu3Gad7PCQCFBYW9AR0Kgsnn6w=
X-Proofpoint-ORIG-GUID: hKBwKxtCe8s-0OEslLuwGT4rv-Pv2mPe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX91McQblMgM6w
 TN7ngh5jhNfP4qqCVvJ0g6QcOMNorhGeyGZNTzSAqTHp9VGdUnDWuS4CsU4Bvq2FYYun6t8B3Ka
 TuMre2ZHXky55t4IzjQJJf+QMX2MVGzA8Ud3H4in6fKEImQddV48lsH0rcbsKtzTRVBcDs/rXr5
 BBYp0/iICxP2i/PdCSCp1+b6cdVapjylC2lOM3NC5QFW/fLqWQwfuPVPiJ0T30NHr7Sj3kr3Rci
 tghM3NjpLssBl9OqbDTR/cRRvNLqEoTvMwbABPEyH1OGbySGp4mUEW+oBYWzMTH7I0Bfax9tI6G
 86RRzl5l0Pzpe+y2HfsDNX1oP3+rkkREtyw9DK0RcD1gF+3q3v4B3KTURRIq6z5kc7uRDV0DR80
 kpwF1iD8kp2vmo81T4xGjIXGXb1LPOEbpdugDs3v6FmDz35zgaIK84H8VHCTMxwSLbXXdoSr3sl
 PbYYhIFgLMOBzpoknjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046

From: Rob Herring <robh@kernel.org>

The binding is designed around the assumption that an MSC will be a
sub-block of something else such as a memory controller or cache
controller.

A key part of MPAM is we need to know about all of the MSCs in the system
before it can be enabled. This drives the need for the genericish
'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
until a h/w specific driver potentially enables the h/w.

This binding covers only the properties currently used in practice; it
can be extended as additional features are needed.

Cc: James Morse <james.morse@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li and Huang Yiwei: fix schema field order and yamllint spacing;
  fix example reg addresses; reduce to minimal binding covering only
  properties in current use, dropping RIS child nodes, memory controller
  support, arm,mpam-device, cpus and interrupt-names ]
Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
new file mode 100644
index 000000000000..523978900d3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description: |
+  The Arm MPAM specification can be found here:
+
+  https://developer.arm.com/documentation/ddi0598/latest
+
+properties:
+  compatible:
+    const: arm,mpam-msc
+
+  reg:
+    maxItems: 1
+    description: A memory region containing registers as defined in the MPAM
+      specification.
+
+  arm,not-ready-us:
+    description: The maximum time in microseconds for monitoring data to be
+      accurate after a settings change. For more information, see the
+      Not-Ready (NRDY) bit description in the MPAM specification.
+
+additionalProperties: false
+
+examples:
+  - |
+    L3: cache-controller@30000000 {
+        compatible = "foo,a-l3-cache", "cache";
+        cache-level = <3>;
+        cache-unified;
+        reg = <0x0 0x30000000 0x0 0x2000>;
+        ranges = <0x0 0x30000000 0x2000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@0 {
+            compatible = "arm,mpam-msc";
+            reg = <0x0 0x2000>;
+            arm,not-ready-us = <1>;
+            /* CPU affinity implied by parent cache node  */
+        };
+    };
+
+...

-- 
2.34.1

