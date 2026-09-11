Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF4146AA95
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126941; cv=none; b=rrL9kDFDEG94P/JkRE+GtLjm9p7sx6Y0HLjpNC4B0SfqgS1Wor48RLIJD8kIXMbfyAs49HmNqtYUhitMa3JPhJM9uiFDQrwDc6P+s69XovYlUoolcN3XqOD+v6H/6aYgjckDyfyflXRlPhTmyAfKSA2cDH07q1cNur/JBErGpoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126941; c=relaxed/simple;
	bh=JtqoWAh0Zg9+ND0y7QMxPVQunmz6Fs5ddvkEb8RR51k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Peu9gwNcYf/LETLoqR/zcQzqzCExEWS4N4IFpDDCp6jqcsY6tRuMifzrGOUHkhlnrZzwrlGPjey6fEvtffwkxGIFEslm+4OkwgKwbh6zwah23heGWSag+d2NOsGUjiqH2az7UYwpzBLcyMdJmY25I6+gtl0isPmTKFMhm+AM/nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmKRu9vm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeSKr4bZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmKRu9vm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LeSKr4bZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BAqCKg560657
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SBLLE33CBXhJ0UrOTnAm23LNHgKdPCZxMEIjtLRg6zw=; b=AmKRu9vmcsbz3b0r
	OY8J6MzNQTPJ+ldEQ2pTSGmaXFCtfz/ZKXh4iGPaPmk310o/Xhg+ZZhfveToCCmw
	NkbDftggrWllnqwj9rhgWeiFqy99Y0he8yfv8J5VTWhfcgxRsPXucJPIJ626pnw7
	Ri73hUcTlTK6YG2WT2oDScjAT5k1aMYxzsDNqyGntL7AOmxfuZ0elXa7uoghhwEY
	PR2VHL1+kYuqgZlCqSQeso54TvIACPNl6fhuReYaffcT+3PgRkzYmAM2VY1+Ciel
	vQli7ytwIKQNj1+ijKshZePrWtVq7KQ9cAXe3U26f1ArUqn4DNiYGHcbV5n/SWYf
	Lv07AQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd39hkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:42:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9382f9430deso149629085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789126938; x=1789731738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBLLE33CBXhJ0UrOTnAm23LNHgKdPCZxMEIjtLRg6zw=;
        b=LeSKr4bZsZF7pUz+1ZIMhwO08L8TEUuCcL0GrnOwqUTRqgd1p3BVioPk6+WPzVadeA
         3SlxIJFmUWAosEaPO+97HG1egQiclz/BExsAC2iVvNvlh5f+EG4hn0oIbFBGTppegLt7
         6sCrsCY0avKtaZotlZwthPsirBzyt8a7MN/lFVjZpJ3pxBE0TqPpS9xS0NLlgpwg1Bc3
         FpJ9MYNmtwZOctH8kQJXS109SxApvSBruNPMm8V7Fmu5NeF80r4fw3+Sj977CQkCh5DZ
         y3uEd20oP1pd42aes0zfRSbaUnDdoNCjMt+YRgJZbeqnCZE0g0maFnooCcBDMJvbdQA8
         zEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789126938; x=1789731738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBLLE33CBXhJ0UrOTnAm23LNHgKdPCZxMEIjtLRg6zw=;
        b=CcIYvO0nNnD/ildYPbn29pXJ3SyYad0vK/NLXG9/I3TmZrT5Pul3Jkgscb3NVYtZ5W
         AEKX4mUxgWZ3Asm5wd1DefJOjtJxtVdd+iwBjgTSwTxtFvLquEoU0OEkCWckvC1FBSuI
         ngCJoOwwQKZD2/7X/tHqLEVf7z/s1C8z4jgzYKxjDNEdv/3dwg4uzle6F6Yq5PBAVaZ2
         vUATXuCyU+wXFq37Gjzq182q1v0vxY5+Z23VWbJCadgHR3AtEVMjloqJRDKHC+hoWcbM
         bkdmKNZftAB1J/8qe17u9fUQ6Zzqh1CEoYg/iT/uXilIhU1lCkYk8G6jZrXFeM+VcTg9
         popA==
X-Forwarded-Encrypted: i=1; AKwUvBx48agrXXAmqePZ/LImQWz+/3VWvn1BqDY6jUjiuidNv232MnorlH87bDJ3XR3mRsJjK85vtfIlvV5hi/o=@vger.kernel.org
X-Gm-Message-State: AFuF++kOiuja4stcqgEbqZ0dz4eUcDD4q+awJygSLbrXsgks5Vol9gQl
	57OyP05rV186ydBrJN1ufo8dnnDXTIWvZcxpgS0Jc5M5L35vUOPe+FS109qhItNr/ZiHKJMrh1C
	ZN1A7fP1a6kVXbVT3X85UmiKSSHhAgosI9hr85OdkQYTbYnyPMIKlIfizdQZJvNomfnQ=
X-Gm-Gg: AYBFou0QUFyccwxrZs1EeVidaIV48iXxvIfRbDZMdCmn5jDV/dksSbnOKOd0U0kzbib
	L0+Yu6qeT2edMNQDjIVTsWQyi99+FSZE0NKSSvvt1nRYz03J5ZRGr5fv4Jeag4AjZ0IyddY7E5d
	FWDMFfxxm2QDOMGWsSVJVWDGBvG/SbQC/9Zhm0eCtwTLFgZD0SW9uFLerfCUZFr4kPXz5NyJaZG
	fqo5DU1jwIY24Sv6+32CO6T6lIydHOU8fQKvsf+Qv8RxYoH4RXmtQatoyJi90P80adRkjp9dStv
	svmjCeuE8725rCB+QArxfjEEUJfXMaG1fi/8NNLrrsmS2wC7z5IQ3Vk4qUUkwfzmfOoUzUEY6/b
	aS3MXFssJVCLKh9rdD0Qw1mk=
X-Received: by 2002:a05:620a:371c:b0:937:11c9:37f1 with SMTP id af79cd13be357-939ea0a4b10mr500842285a.16.1789126938441;
        Fri, 11 Sep 2026 04:42:18 -0700 (PDT)
X-Received: by 2002:a05:620a:371c:b0:937:11c9:37f1 with SMTP id af79cd13be357-939ea0a4b10mr500790985a.16.1789126933196;
        Fri, 11 Sep 2026 04:42:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bd1esm5501948f8f.31.2026.09.11.04.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:42:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 13:42:05 +0200
Subject: [PATCH 2/2] dtc: dt-check-style: Handle multiple blank lines in
 continued properties
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-dts-style-checker-blank-lines-v1-2-85e779600d98@oss.qualcomm.com>
References: <20260911-dts-style-checker-blank-lines-v1-0-85e779600d98@oss.qualcomm.com>
In-Reply-To: <20260911-dts-style-checker-blank-lines-v1-0-85e779600d98@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5066;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JtqoWAh0Zg9+ND0y7QMxPVQunmz6Fs5ddvkEb8RR51k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo+kORqeSnk/dBxdMu25kUs+Wk55ZhIaQXZh36
 sOnD9FvpRaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPpDgAKCRDBN2bmhouD
 11XuD/9E46OmGtUnAFKWRN3Fi7XHeN3UOxuVyt25pbnkltfXVdrqYoEGwwn1yvQpNStHYivAjED
 Rs6c++OxSRU6+kcbuOfS0xXF6sMUnrJDYszzmhqtEQ102D9UXVnjDS3W3SdGIbMazo9c6bB3C9u
 eYTgWSFgOZXroS6rlogrPYVM6oNkUsyqxzBu7EHH2T70HirxQWeIrYfkWZ1weSLhrCXksiReixC
 WRvcG7Fal6celPm+TwV2UMQdysSrvxnue+MZmgatY8bOXt7rQUaHDb0d0GAU2LkfTHJ0UBIFczn
 9lygomzg5xP+0COHJNYKECDJiIvxLXW9TSVHbaBLkNt29EVa4oZ09BAnoWb2EEGDFSg+zWdR4DW
 eahLjDayZEZPCDypOf0IctOYFRrI+3vypbdofZUA3oN5X25W9Vwnke4hU4r3UgA0Fdleat0Ekv0
 eiHQf7CjGLUxLT7BF4HGsQMMK1tCBc8bY8nc0sP2jJ2r9ImAKDwYOE66GBPt3Dd0KgNbJQtg7T2
 cEeATqPTe22qoULDuFrN3qrIQm1Rn0NgizPWGA8RfaU0yAxsrSFvCJHQzBLbJ4wqs22/oLXVqJ0
 5cNdYrPg3V4T6A6fLh1KrgeoCuBebMO03S0jUsqI4fqw79EG2kWGJ7FYbvJsCz6ts9g2oi2oiwa
 SKJlri62OONQeiw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa3e91b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=A1X0JdhQAAAA:8 a=Xe_wEYWaqU9zfd8rzdgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: jDPjCxMtgkyxtbZd0vcidSUdQIBPQzLJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE2NCBTYWx0ZWRfX0Vc4982mnYkW
 kVY4MxmPmsjxrtfLemm3f0pjLx5oK/4/KWicALPtlqPm+lMSpYPh5zGuoSpkeNHBn7JUAaLE+4a
 yNoMZnKgKtVXg7G35pIKfJVchDH1Mps=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE2NCBTYWx0ZWRfX2qD+7WURIB/y
 pvlEfoaRSAyDkT+CUh4JzjXaU9iiA6OaaCzAKa65yrNxbbB1Zc7AvVaRCnjHGGz3euvZRPV2yXP
 shW7dDeNtwmbyXdzooZxisihuUnjIAXSTQbsaQOFyy5YqJZ/9ebsP8bolke370wqLdJ2IOCvJ6q
 WilMdsDEO7a5+cWhFhsa3IHRd2sDAatMpPXmO72AWZ/8o5Hyw2CkC/0NiyRnw+/D3RcnDIXHl3z
 QP/fQJ8GhnL2fy79KHgKUrbYNX/ewASi9HsVai+BMOnUlx00Fn9pLWXwISO5AGZ8UHRd+/2aE3Y
 CZoDDgH8Rg7KeKVO3FqSyFbW3tFPKjWOpcs3N0p/kjTp7Q/aapzlzBXll0622ATbhs92a3zRuo4
 UVxu7PQwVWFJMai1zY+tJqtQ+66itXBIDwFuKXUtfGePLMtumJkXZmE5isbB2xkiBt2F2/uX49e
 u/DPypN3t84RWdpuGEQ==
X-Proofpoint-ORIG-GUID: jDPjCxMtgkyxtbZd0vcidSUdQIBPQzLJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110164

Properly ignore comments and report duplicated blank lines in multi-line
properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         |  6 +++
 .../dtc/dt-style-selftest/bad/dts-blank-lines.dts  | 37 +++++++++++++++
 .../dt-style-selftest/bad/yaml-blank-lines.yaml    | 54 ++++++++++++++++++++++
 .../expected/dts-blank-lines.dts.txt               |  6 +++
 .../expected/yaml-blank-lines.yaml.txt             |  6 +++
 5 files changed, 109 insertions(+)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 0dca31a0dddb..52597c266904 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -440,6 +440,12 @@ def check_blank_lines(ctx):
         if lines[i].linetype == LineType.BLANK and \
                 lines[i - 1].linetype == LineType.BLANK:
             yield (lines[i].lineno, 'consecutive blank lines')
+        prev_is_blank = lines[i].linetype == LineType.BLANK
+        for cont in lines[i].continuations:
+            if cont.linetype == LineType.BLANK and prev_is_blank:
+                yield (cont.lineno, 'consecutive blank lines')
+            prev_is_blank = cont.linetype == LineType.BLANK
+
     # Blank right after { or right before }
     for i, dl in enumerate(lines):
         if dl.linetype != LineType.BLANK:
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-blank-lines.dts b/scripts/dtc/dt-style-selftest/bad/dts-blank-lines.dts
new file mode 100644
index 000000000000..f2e99fb7bb29
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-blank-lines.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+/ {
+	compatible = "example,test-board";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	interrupt-controller@10000 {
+		compatible = "example,intc";
+
+		reg = <0x10000 0x1000>;
+
+		clocks = <1 2 3>,
+
+
+			 /* Comment is not a blank line */
+			 <4 5 6>,
+
+			 /* Comment is not a blank line */
+			 <7 8 9>;
+
+
+		interrupts = <1>;
+
+		/* Comment is not a blank line */
+		qcom,calibration-variant = "foo";
+	};
+
+
+	interrupt-controller@20000 {
+
+		compatible = "example,intc";
+		reg = <0x20000 0x1000>;
+
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-blank-lines.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-blank-lines.yaml
new file mode 100644
index 000000000000..a58cd534a003
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-blank-lines.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-blank-lines.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with too many blank lines
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-blank-lines
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    foo@1000 {
+        compatible = "example,test-blank-lines";
+
+        reg = <0x1000 0x100>;
+
+        clocks = <1 2 3>,
+
+
+                 /* Comment is not a blank line */
+                 <4 5 6>,
+
+                 /* Comment is not a blank line */
+                 <7 8 9>;
+
+
+        interrupts = <1>;
+
+        /* Comment is not a blank line */
+        qcom,calibration-variant = "foo";
+    };
+
+
+    foo@2000 {
+
+        compatible = "example,test-blank-lines";
+
+        reg = <0x2000 0x100>;
+
+    };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-blank-lines.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-blank-lines.dts.txt
new file mode 100644
index 000000000000..97617bc42a17
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-blank-lines.dts.txt
@@ -0,0 +1,6 @@
+# mode=strict
+bad/dts-blank-lines.dts:16: [blank-lines] consecutive blank lines
+bad/dts-blank-lines.dts:23: [blank-lines] consecutive blank lines
+bad/dts-blank-lines.dts:30: [blank-lines] consecutive blank lines
+bad/dts-blank-lines.dts:32: [blank-lines] blank line at start of node body
+bad/dts-blank-lines.dts:35: [blank-lines] blank line at end of node body
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-blank-lines.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-blank-lines.yaml.txt
new file mode 100644
index 000000000000..8a8db8d35b1e
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-blank-lines.yaml.txt
@@ -0,0 +1,6 @@
+# mode=strict
+bad/yaml-blank-lines.yaml:33: example 0 [blank-lines] consecutive blank lines
+bad/yaml-blank-lines.yaml:40: example 0 [blank-lines] consecutive blank lines
+bad/yaml-blank-lines.yaml:47: example 0 [blank-lines] consecutive blank lines
+bad/yaml-blank-lines.yaml:49: example 0 [blank-lines] blank line at start of node body
+bad/yaml-blank-lines.yaml:53: example 0 [blank-lines] blank line at end of node body

-- 
2.53.0

