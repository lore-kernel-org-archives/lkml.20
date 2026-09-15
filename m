Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93C94302E6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491864; cv=none; b=Y08T1sNVEX2dDaS86kKPPr/bmHMZODSHyTOTZdOGM/D/x0cQlHVOTbPvhFFBc3KXZl3ukS7oog09/JvQg5K2INxuhMtLHY2toan0E9nHx7wQOlIgRlSUjDp6P1VmirfNQq16jF5oeaW1glcYUQD8qNYsEMCNcjQak1mTTbvtStg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491864; c=relaxed/simple;
	bh=laSAp1YXGXDB0JNefD12jAWtTX1atEc/Z6Li1ZTRn+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W8nRsZ9VaCIeb+wcWJ+Q+CRAh5i1C0J5nNrsjHrEPGHpH04VRbTEbiFZWZUp7vFt8WnnY3wvTG4ruRWGSfiNVO6yjjikmL61uZRffJzvYYV+Lj5kWTp05lhRjtvNruyQdYn9jtfFDn6GaDiqG8s/gUX88766luU4lR7XD8beUHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVhyBYw4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C4ssbL/7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVhyBYw4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C4ssbL/7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAQXu1014185
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3wLYPADb7IYlvunm2zhGRsvnaxF2Q1CLllsL+hIEt2M=; b=AVhyBYw4SQum1JL+
	ByS31KMxr5TdjoCrk5fLWV6vCsjaK3wkQmDYaupE2G3UkcLxUnK+xAtECTR9K7/q
	k3RuiVlmjzAsmsyxhOoWzeXTYQKd/uXWVi9WeAbPnKqZi3kq1YVfbdhqYWO1z0df
	m5VTV0o9IOkg5/5GCCvx/C4FErwHtp1MnjKT+0exlL6AxTCGB5cxoY/EiWgUKkMq
	bHhYCoG80EavMU8jbDd3H25hzdsnvVHA/DKADsyqDdtMG0nqke58K6Gq2KGDhtaB
	+8KzqMoOqEtgDwrT33sFGoMWX0TsUuZVPAqoMkA/Hv0sVuq5okqjyg7F1D69UvdU
	25v9BQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea343d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:13 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c846dd12ccso1850742e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491852; x=1790096652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wLYPADb7IYlvunm2zhGRsvnaxF2Q1CLllsL+hIEt2M=;
        b=C4ssbL/7fDGgJ+ohsjLoGPYg0Ho5fGTw/TBNRv4cUPZkMF19BCFgUSKUZWOurNeY4E
         my2KoKC5IRTjc8CKCGZRxt0hteAtp0qmFy1C0/oTYAoLzqSQmGMBSTnrvNl7jbOeZt06
         RUFS7JZ/AdNkY7FXIyBXCCFoSijU/sP8CcGiSsyZ1ATAkV44rDUKRTOk96Et1AP9/w+k
         gtymVLrLImqXU6JQdNKzXcio5ahKgik7dXfUj1NKTNZyJJVs85OfI0MphxfCV9aB4ZEH
         ZU+UABHandGxYFTGknbPQrxf0mp1RO/rnLBKUMm0JvTX0qQTKOEFtydUT/VRaFn5u5He
         JOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491852; x=1790096652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wLYPADb7IYlvunm2zhGRsvnaxF2Q1CLllsL+hIEt2M=;
        b=nIZB8TQz3Zvg4ke5+46Nw8kUmOKs2l+ZL/5bf3mfUp4D/wzFp+cZG2A38t8NnVfUMU
         tjvXXE9oZa8f4fvu+00fzwvhbdMYf4xC9CYOZMuOSwKQFgKUDBbCrdYxnFrcw1B8ucyP
         5YJ/fwk+TO4nt+iunfoaH1K3Mt7mQ6yU/Gv/QNfAOgtpNBdD3fxiPEkSw+O1Eq6B2xLx
         lo5L7X+QhA1beuecuigjqVHEd/kq1qlUhEZP/m2bHfRllHGT0hPnYZj9qi2j0xbUHZMc
         QSYsOwLe74LuQAPWTH+9SVP2fUhKoo96YG7wrg8QnYUOk7y1oaq7k1CNVCxB7/f5aNzP
         ehMg==
X-Forwarded-Encrypted: i=1; AKwUvBwYY/8alS+DlBCJaK6jeKBvkhVu1UM25m4kS9XwECp49W+dxGjLMvaUB/WfleFOyU7IB1wC4nvMAShvpKs=@vger.kernel.org
X-Gm-Message-State: AFuF++n2bGVSVnAAvX39J1HuP8zhhDG2vs1J/GCDkGwCJS+va2pZH0Jf
	at0gx9osPtWUYUnIr//Y+2zirrYDRf/aEVJNU0TOJT7Unee59wueRgsoX/M7HcTkgCpJ9I08xwJ
	n4nURNiSMsjenYTIueGiMRP9amt8P5wat3rMOjFZNWRu/6T29ACC2Qej1qCKN77xTywLLHuToer
	Y=
X-Gm-Gg: AYBFou3WSC5Z75uTz7qYmpiSlPgOMnQ5CGQQ7PfsIS91aO7Y+pMcrOqscBTgYetGpgo
	WuRBfAwh9ZYvgy8rm7tSuxbPshZzrhqSC4pRplaYtNdtyvr0ls+UBxJ2ocPqfVPT/l9dh9mX/wa
	8W66HdXNgHTMl/YL3Zdhf6cSQU8eiSjr7avDbwJhzblvI7TuP1y7p7TC6TYCIfz5OEJ2jZsjkgS
	pBzv+Zi4zvJItc5Emc0jZUEEV8r1R4Mpd6RPeD8ga6sPhQZR6//BH5meEa1UJa2zStMc+mbR4kL
	guIWbN1o8mmEs5VlB2R06XuHNXq6uT57zugwJc3ZHgrhtYxqX2UUOSGzkeLxWMeaVFj5ESiZufx
	KJ4NC4ytWi28dIKaxAuoXbCA=
X-Received: by 2002:a05:6122:5312:b0:5c9:8bbb:3f13 with SMTP id 71dfb90a1353d-5c98bbb3fb6mr6243059e0c.7.1789491851874;
        Tue, 15 Sep 2026 10:04:11 -0700 (PDT)
X-Received: by 2002:a05:6122:5312:b0:5c9:8bbb:3f13 with SMTP id 71dfb90a1353d-5c98bbb3fb6mr6242958e0c.7.1789491851294;
        Tue, 15 Sep 2026 10:04:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27df9sm391286f8f.19.2026.09.15.10.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:04:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:03:51 +0200
Subject: [PATCH v4 7/7] dtc: dt-check-style: Relax property ordering rules
 (drop alphabetical)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-dts-style-checker-continued-lines-v4-7-5b8e09b11ef2@oss.qualcomm.com>
References: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
In-Reply-To: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=18273;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=laSAp1YXGXDB0JNefD12jAWtTX1atEc/Z6Li1ZTRn+I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqXp7vLmwbclfFzmk8lNPaXDeOMwsdToV/85i3
 4zbSJcDj6eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaql6ewAKCRDBN2bmhouD
 1wuiEACZ7zQF+XsT1zw70+RqC+g4F8YXqjLWEZe7bqnv1XcHUWGXxm9k4Ytt+x6yItbYzlpYBOY
 T9mlGKgPaL1UprvYwyvJY92u2+NbS20ZYiwoR8/kuiMA6+o4GdqGXFwMFRSIYROV9ZM8eUDCY6P
 yQf4pERSPewQVNv4f97PrTbqrQDBYjfW2KbRtH15OH+K6C0Y55/HKJl59gn4CiXufSCEeBZzJ9I
 TnQEwUhptbPt7EBHHGWSQ5RlqDw+Pn0/8+w0Sg5bKU7Q7pNykVRKI4SJiDa6fkWt+Qqw2XdGOI4
 +b1oe1fwLl2xIY7PeEVGAKuZkVBA4SQneUmgGylGleOXoD9spH+rAE4naM6L9a9U1z7eQOwmKTs
 aCppNDjNVixWHqn1KtEPkhpXcWDtiCXhdGMyeyAJIJqeZHf64xzL0q66OLHY+BKOhAYQuNAfIJN
 9FAVZbwcV2NKSUUi1utT3hXnL/drnGQAl5DiDCOxr9Wcc7JwHgqeYs3HcPwk54GQH3lQPVy4af1
 yCGZqorwQr934U8oYTk1lcMqxvu8t6xH2Nl8SWaXvIbt8dPbUMNQ2VlNyr6KuI0w8t9MS0itkR1
 YXYS4YQXK7jqPOrKpc5PZZwuRj+IwpOmArAXeLEMoq1C/V4DIMrRzN8rgVVTS+H4dyePu3Dysw5
 x7ly3X0rOrg445Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 2vlXO8KBve3AyEmYow1WjhLWO8sx3Rvb
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa97a8d cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hObz84sP8V3v96Jng0MA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: 2vlXO8KBve3AyEmYow1WjhLWO8sx3Rvb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfX+0xSJK6mKYft
 ns9uKG90ZL5Rpo4niW+sB2PQpLJCeDMlAK4WJtIBVqReDiNc0+ti1XxJvk+oLKybLRgbxnOLmlJ
 iZfWLrARM4f2vmMp81V8KdhLmJqr2oc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfX0VMvmGEngkHt
 +4eeAb26htceEu2pUV6UlIfyOZaS54F/BjUXzWWVAZesu1tc5fHlYbaIiGkDU4nKQy1h4kob5us
 MKgH2Tdj6wM3oz35wITxTVsSjtlF1yVSsDVXPdCGJvsNrsbCFub3neq1vm/JLjow2cfkWCCaVf5
 yHLPaT7bKSscQ1BmvlmcnCTPFauS9QfG/lqCEFGMBlGDU4HrpJqMA13Tdk9BhDTdtSiqFfXaNFE
 iw1GmPOQtJv/1PtY6m8V18AqfrCAWqbT6fXmOW+7CJ2wFlfCimMweHfuf3gXVvvOxl07a7kF9cB
 XGF/gIlvdssXGIRM6H4FoKXRIvuUhxvDyUD+kNCF/qFElwCLvVnMlZ3vFCSULuiEMhZwO2Mpm6J
 Jk/ROgfcVsktBZOZTgFy9eGzOoCL47VmIXZrgax2IFCb04eX5rTxxOqM275WClv7HSPPm3RQjjM
 zC2w9J8xDhMKVdzTF9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150249

Existing rules checked whether properties follow DTS Coding Style
guidelines in respect of common properties and standard vs vendor
properties, plus additionally it enforced alphabetical order within each
of such group.

The in-tree DTS does not follow such style at all, so this lead to many
warnings.  There is little value in fixing these warnings, because DTS
with non-alphabetical order of properties is exactly the same readable,
even though DTS Coding Style mentions natural order.  Actually groupping
properties logically, e.g. all supplies together regardless of their
name, is more readable than pure natural sort.

Relax the property order rules to the most important aspects
(device_type, reg/reg-names, ranges, standard properties, vendor
properties, status) and skip the alphabetical sorting completely.

Assisted-by: LLM
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/dts-coding-style.rst       |   5 +-
 scripts/dtc/dt-check-style                         | 137 +++++++++------------
 .../dt-style-selftest/bad/dts-property-order.dts   |   3 +
 .../dt-style-selftest/bad/dts-property-order.dtso  |   3 +
 .../dtc/dt-style-selftest/bad/yaml-prop-order.yaml |   5 +
 .../expected/dts-property-order.dts.txt            |   7 +-
 .../expected/dts-property-order.dtso.txt           |   7 +-
 .../expected/yaml-prop-order.yaml.txt              |   1 +
 .../expected/yaml-prop-pairing.yaml.txt            |   4 +-
 .../dt-style-selftest/good/dts-property-order.dts  |   3 +
 .../dt-style-selftest/good/dts-property-order.dtso |   3 +
 11 files changed, 89 insertions(+), 89 deletions(-)

diff --git a/Documentation/devicetree/bindings/dts-coding-style.rst b/Documentation/devicetree/bindings/dts-coding-style.rst
index 63648db377e1..441436b7fa80 100644
--- a/Documentation/devicetree/bindings/dts-coding-style.rst
+++ b/Documentation/devicetree/bindings/dts-coding-style.rst
@@ -135,8 +135,9 @@ The above-described ordering follows this approach:
 3. Status is the last information to annotate that device node is or is not
    finished (board resources are needed).
 
-The individual properties inside each group shall use natural sort order by
-the property name.
+The individual properties inside each group shall use usually natural sort
+order by the property name, with exceptions of logical grouping of properties,
+e.g. supplies.
 
 Example::
 
diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index cbbb8d384aca..b8c40873905c 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -714,65 +714,40 @@ def check_property_name(ctx):
                 yield (dl.lineno, f'property name "{dl.prop_name}" is using discouraged style')
 
 
-def _property_bucket(name):
-    """Return the canonical bucket index for a property:
-       0 device_type
+def _property_bucket(name, is_root=False):
+    """Return the canonical bucket (group) index for a property:
+       0 device_type ('model' in the root node)
        1 compatible
-       2 reg / reg-names
+       2 reg, reg-names
        3 ranges
        4 standard properties (no vendor comma in #-stripped name)
        5 vendor-specific properties
        6 status
-    Plus a sub-key inside the bucket for fixed slots (device_type, compatible,
-    reg, reg-names, ranges, status). 'standard' and 'vendor' return None for
-    the sub-key, signalling that the within-bucket key is computed by
-    the pairing rules."""
+    Properties sharing a bucket compare equal: their relative order
+    within the group is not checked, only the pairing rules below
+    apply."""
     stripped = name.lstrip('#')
-    if name == 'device_type':
-        return (0, 0)
+    if is_root:
+        if name == 'model':
+            return 0
+    elif name == 'device_type':
+        return 0
     if name == 'compatible':
-        return (1, 0)
-    if name == 'reg':
-        return (2, 0)
-    if name == 'reg-names':
-        return (2, 1)
+        return 1
+    if name in ('reg', 'reg-names'):
+        return 2
     if name == 'ranges':
-        return (3, 0)
+        return 3
     if name == 'status':
-        return (6, 0)
-    return (5 if ',' in stripped else 4, None)
-
-
-def _property_bucket_root(name):
-    """Return the canonical bucket index for a property:
-       0 model (for root nodes only)
-       1 compatible
-    Plus a sub-key inside the bucket for fixed slots (device_type, compatible,
-    reg, reg-names, ranges, status). 'standard' and 'vendor' return None for
-    the sub-key, signalling that the within-bucket key is computed by
-    the pairing rules."""
-    stripped = name.lstrip('#')
-    if name == 'model':
-        return (0, 0)
-    if name == 'compatible':
-        return (1, 0)
-    if name == 'reg':
-        return (2, 0)
-    if name == 'reg-names':
-        return (2, 1)
-    if name == 'ranges':
-        return (3, 0)
-    if name == 'status':
-        return (6, 0)
-    return (5 if ',' in stripped else 4, None)
+        return 6
+    return 5 if ',' in stripped else 4
 
 
 # Declarative pairing rules: each is a callable
 #   (name, all_names) -> anchor_name_or_None
-# If a rule returns an anchor, the property sorts immediately after the
+# If a rule returns an anchor, the property must be placed after the
 # anchor. Rules are tried in order; the first match wins. If none
-# matches, the within-bucket key falls back to natural sort by the
-# #-stripped name.
+# matches, the property can be placed anywhere within its bucket.
 
 def _pair_pinctrl_names(name, all_names):
     """pinctrl-names follows the highest pinctrl-N in the same node."""
@@ -787,8 +762,7 @@ def _pair_pinctrl_names(name, all_names):
 def _pair_x_names(name, all_names):
     """Generic <x>-names follows its owning property. The owner is
     usually plural (clocks/clock-names, dmas/dma-names,
-    resets/reset-names) but occasionally singular (reg/reg-names is
-    handled by the fixed slot above; this rule catches anything else)."""
+    resets/reset-names) but occasionally singular (reg/reg-names)."""
     if not name.endswith('-names'):
         return None
     base = name[:-len('-names')]
@@ -803,33 +777,27 @@ def _pair_x_names(name, all_names):
 PAIRING_RULES = (_pair_pinctrl_names, _pair_x_names)
 
 
-def _property_sort_key(dl, name, all_names):
-    """Sort key for a property among its node-body siblings.
-
-    Format: (bucket, within_key, tiebreak). 'within_key' for
-    standard/vendor buckets follows pairing rules: a property paired
-    with anchor X sorts as if it were X with a higher tiebreak."""
-    if dl.is_root:
-        bucket, fixed_sub = _property_bucket_root(name)
-    else:
-        bucket, fixed_sub = _property_bucket(name)
-    if fixed_sub is not None:
-        return (bucket, (), fixed_sub)
-
+def _property_anchor(name, all_names):
+    """Return the property this one must be placed after, or None."""
     for rule in PAIRING_RULES:
         anchor = rule(name, all_names)
         if anchor is not None:
-            return (bucket, _natural_sort_key(anchor.lstrip('#')), 1)
-
-    return (bucket, _natural_sort_key(name.lstrip('#')), 0)
+            return anchor
+    return None
 
 
 def check_property_order(ctx):
-    """Properties within a node body must appear in canonical order:
-    compatible, reg(/reg-names), ranges, then the standard group, then
-    the vendor-specific group, then status. Inside the standard and
-    vendor groups, pairing rules apply (e.g. <x>-names follows <x>);
-    everything else falls back to natural sort by the #-stripped name."""
+    """Properties within a node body must be grouped in canonical
+    order: device_type ('model' for the root node), compatible,
+    reg(/reg-names), ranges, then the standard group, then the
+    vendor-specific group, then status.
+
+    The order of properties within one group is free, e.g. it does not
+    matter whether '#address-cells' comes before or after 'clocks'.
+    Paired properties still keep their relative order: <x>-names
+    follows <x> (clocks/clock-names, reg/reg-names, ...), pinctrl-names
+    follows the pinctrl-N states and #size-cells follows
+    #address-cells."""
     lines = ctx.lines
     for i, dl in enumerate(lines):
         if dl.linetype != LineType.NODE_OPEN:
@@ -847,16 +815,26 @@ def check_property_order(ctx):
         if len(props) < 2:
             continue
         all_names = [p.prop_name for p in props]
-        keyed = [(p, _property_sort_key(dl, p.prop_name, all_names))
-                 for p in props]
-        for k in range(1, len(keyed)):
-            if keyed[k][1] < keyed[k - 1][1]:
-                p = keyed[k][0]
-                prev = keyed[k - 1][0]
-                yield (p.lineno,
-                       'property %r out of canonical order '
-                       '(should sort before %r)' %
-                       (p.prop_name, prev.prop_name))
+        buckets = [_property_bucket(p.prop_name, dl.is_root) for p in props]
+        findings = []
+        # Group (bucket) order
+        for k in range(1, len(props)):
+            if buckets[k] < buckets[k - 1]:
+                findings.append((props[k].lineno,
+                                 'property %r out of canonical order '
+                                 '(should sort before %r)' %
+                                 (props[k].prop_name,
+                                  props[k - 1].prop_name)))
+        # Pairing within a group: the anchor must come first
+        seen = set()
+        for p in props:
+            anchor = _property_anchor(p.prop_name, all_names)
+            if anchor is not None and anchor not in seen:
+                findings.append((p.lineno,
+                                 'property %r must be placed after %r' %
+                                 (p.prop_name, anchor)))
+            seen.add(p.prop_name)
+        yield from sorted(findings)
 
 
 def _check_redundant_whitespace(dl):
@@ -1152,7 +1130,8 @@ RULES = [
          'property names use only recommended characters (see DTS Coding Style)',
          check_property_name),
     Rule('property-order', 'strict',
-         'canonical bucket + pairing + natural-sort order of properties',
+         'canonical group + pairing order of properties (order within '
+         'a group is not checked)',
          check_property_order),
     # See also check_redundant_whitespace() and check_value_whitespace()
     Rule('redundant-whitespace-strict', 'strict',
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
index ebe561e38766..eb36daa4fe72 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
@@ -43,6 +43,9 @@ interrupt-controller@10000 {
 				     <4 5 6>,
 				     <7 8 9>;
 			compatible = "example,intc";
+			qcom,calibration-variant = "foo";
+			clocks = <6>;
+			qcom,opp-fuse-level = <1>;
 		};
 	};
 };
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dtso b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dtso
index 64604fa6b8c3..b2e564f2af2b 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dtso
+++ b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dtso
@@ -44,6 +44,9 @@ interrupt-controller@10000 {
 				     <4 5 6>,
 				     <7 8 9>;
 			compatible = "example,intc";
+			qcom,calibration-variant = "foo";
+			clocks = <6>;
+			qcom,opp-fuse-level = <1>;
 		};
 	};
 };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
index bf1480e97209..4d8a50d0e35a 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
@@ -26,4 +26,9 @@ examples:
     device@1000 {
         reg = <0x1000 0x100>;
         compatible = "example,test-prop-order";
+
+        interrupts = <1>;
+        qcom,calibration-variant = "foo";
+        clocks = <6>;
+        qcom,opp-fuse-level = <1>;
     };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
index 0ab832ccf07a..155b072f0ac2 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
@@ -6,6 +6,7 @@ bad/dts-property-order.dts:21: [property-order] property 'device_type' out of ca
 bad/dts-property-order.dts:30: [property-order] property 'dma-coherent' out of canonical order (should sort before 'status')
 bad/dts-property-order.dts:35: [property-order] property 'compatible' out of canonical order (should sort before 'ranges')
 bad/dts-property-order.dts:45: [property-order] property 'compatible' out of canonical order (should sort before 'interrupts')
-bad/dts-property-order.dts:50: [redundant-whitespace] extra whitespace before {
-bad/dts-property-order.dts:52: [property-order] property 'model' out of canonical order (should sort before 'compatible')
-bad/dts-property-order.dts:57: [property-order] property 'model' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dts:47: [property-order] property 'clocks' out of canonical order (should sort before 'qcom,calibration-variant')
+bad/dts-property-order.dts:53: [redundant-whitespace] extra whitespace before {
+bad/dts-property-order.dts:55: [property-order] property 'model' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dts:60: [property-order] property 'model' out of canonical order (should sort before 'compatible')
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt
index 9f2a00916329..48c020d21b64 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt
@@ -6,6 +6,7 @@ bad/dts-property-order.dtso:22: [property-order] property 'device_type' out of c
 bad/dts-property-order.dtso:31: [property-order] property 'dma-coherent' out of canonical order (should sort before 'status')
 bad/dts-property-order.dtso:36: [property-order] property 'compatible' out of canonical order (should sort before 'ranges')
 bad/dts-property-order.dtso:46: [property-order] property 'compatible' out of canonical order (should sort before 'interrupts')
-bad/dts-property-order.dtso:51: [redundant-whitespace] extra whitespace before {
-bad/dts-property-order.dtso:53: [property-order] property 'model' out of canonical order (should sort before 'compatible')
-bad/dts-property-order.dtso:58: [property-order] property 'model' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dtso:48: [property-order] property 'clocks' out of canonical order (should sort before 'qcom,calibration-variant')
+bad/dts-property-order.dtso:54: [redundant-whitespace] extra whitespace before {
+bad/dts-property-order.dtso:56: [property-order] property 'model' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dtso:61: [property-order] property 'model' out of canonical order (should sort before 'compatible')
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt
index 578df7209170..bb0dd5db5135 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt
@@ -1,2 +1,3 @@
 # mode=strict
 bad/yaml-prop-order.yaml:28: example 0 [property-order] property 'compatible' out of canonical order (should sort before 'reg')
+bad/yaml-prop-order.yaml:32: example 0 [property-order] property 'clocks' out of canonical order (should sort before 'qcom,calibration-variant')
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt
index e6e21349a939..ee666559424a 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt
@@ -1,3 +1,3 @@
 # mode=strict
-bad/yaml-prop-pairing.yaml:30: example 0 [property-order] property 'clocks' out of canonical order (should sort before 'clock-names')
-bad/yaml-prop-pairing.yaml:32: example 0 [property-order] property 'pinctrl-0' out of canonical order (should sort before 'pinctrl-names')
+bad/yaml-prop-pairing.yaml:29: example 0 [property-order] property 'clock-names' must be placed after 'clocks'
+bad/yaml-prop-pairing.yaml:31: example 0 [property-order] property 'pinctrl-names' must be placed after 'pinctrl-0'
diff --git a/scripts/dtc/dt-style-selftest/good/dts-property-order.dts b/scripts/dtc/dt-style-selftest/good/dts-property-order.dts
index 3d847cc9fa3e..288fcfb9888f 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-property-order.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-property-order.dts
@@ -40,7 +40,10 @@ soc@0 {
 		interrupt-controller@10000 {
 			compatible = "example,intc";
 			reg = <0x10000 0x1000>;
+			clocks = <6>;
 			interrupts = <1 2 3>;
+			qcom,calibration-variant = "foo";
+			qcom,opp-fuse-level = <1>;
 		};
 	};
 };
diff --git a/scripts/dtc/dt-style-selftest/good/dts-property-order.dtso b/scripts/dtc/dt-style-selftest/good/dts-property-order.dtso
index 5ae78541f68b..60c68b3f908a 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-property-order.dtso
+++ b/scripts/dtc/dt-style-selftest/good/dts-property-order.dtso
@@ -41,7 +41,10 @@ soc@0 {
 		interrupt-controller@10000 {
 			compatible = "example,intc";
 			reg = <0x10000 0x1000>;
+			clocks = <6>;
 			interrupts = <1 2 3>;
+			qcom,calibration-variant = "foo";
+			qcom,opp-fuse-level = <1>;
 		};
 	};
 };

-- 
2.53.0

