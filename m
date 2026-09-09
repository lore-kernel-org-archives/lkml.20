Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1939447DFBD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942973; cv=none; b=ljP+I9m9x5G/Pq078HqjJUY1bNDpebSkqXmkPR2v1EjL2bfy3+rswR/+fX+7Eqi5jM2kAe4RxF4zKxRDALf48rhe3DGHTI4GJHBPnPtO2dEaPWMwbdq9G5GRBfsGfad56wY23B2rlqlJgVwubz1JBsfsrTt9othe/1msUgPe1No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942973; c=relaxed/simple;
	bh=a5Ll65DQL/M59r5nNeLh7x1BtJXBfuJyRxs44gn+Yao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YU4579AlHKEnN+yCuWR0NhU4EQ8kJRUQCaZJrYsgsl0/4A/Dns9IoE/wQ1OdZOqxoLdEqSI5vgQt84WMvQnrr/sc+ZOx9gpA/V1djsgb+pnpTVq3qycrgdFc+PMrCIesiUABDZRj+Gd4NEHBho1iaE0yPleQ7AXos5CDs+tS/Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nU8W+t1M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfAJbNvJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nU8W+t1M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PfAJbNvJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896edZq131192
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 08:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hk1PTahrJKUV4aq/e/3rFwDxJr+19SkoWjJe/cVir0c=; b=nU8W+t1Mvv+j6DYx
	N6K+JUpSstSm2WXtxqGVlCct1XQuk+bcrOdHViz1V+9fVsS+yFyWZyMNpuYODZ83
	yStkpVxoIMlNSelnEX21khdhwLgCm74OoTIb7ZdAN+PZzegVKxCLVxpDOKbRqC5m
	sIoSek7l2hJVWpTaHpwuIHunR8N5115MSitWI5SStlxUgE2U51K24pz5JimJTGKk
	H/RTOXF3EbaFcwtdwQHZJQvsxrmX9UyeM3I+K0NkG3/48hRH7u70Ovgg/UI8Izye
	Xf2Sl0JOwr3hoFDxB71tJ5nKJvmrq4BVe0Z2MPaHdpoS1Xes68djsslvpTrcIRGC
	87FKRw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntpkk8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:36:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9394ad7f64aso867883585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788942969; x=1789547769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hk1PTahrJKUV4aq/e/3rFwDxJr+19SkoWjJe/cVir0c=;
        b=PfAJbNvJkzVpgR9gOfxUNTLrHs2zYs0tDj253wyDIUac+HArrv22UVfCVtsbzwKigf
         oLyaji/GVqVvLLQ9ZAcCBXjWzmVkWgw7rhcI8wpDtk9mQzyQBjk7N3cjmpooOHUVrh3g
         /edGtcohAVOZUpzcbM9ber41iNk8mwwlL79fwRQrvXYj8vEbep2IKIjRK+khXPbgSfhw
         My4CdOlK/Z4r86KL6GPj7YLiJyf2Q8M04bb1fwFcIOQgXmGrTzNzc9uPEizPKFEdWB1c
         +3jUlCn0QRBgPCuk1J0B7X2dXqaIpCTwWAh4aORJjP1WrVSlmJo7d1qcHZR90ZEEqpyY
         KqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942969; x=1789547769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hk1PTahrJKUV4aq/e/3rFwDxJr+19SkoWjJe/cVir0c=;
        b=J+l5J0lfQ1HY03AW73G+cPrMdJmg0WUAa5pxQDXehD7XSvGuax8ddGVXvyizah+woZ
         vhlVvDjv+E83TrrAUteuyQHLFkFJ89KlTbw0UlSuLHgKO0KdltMrT8/8ozbMQNQSqOCa
         DmWvFNHVb8TYFmCg526ShxxaXNFciNpGTvw7NuXx9UCEqVEc0I21h/75ZsLZEu9WDNjA
         3eOQhUtlsVsl12VpX9v/gBLIbQ0aknyzIWg/anZU3r/5Lj4w5SDvM2BsP0cokfXX7PtR
         3JaVV3XVblpp0cjxIzk2gEToAaHGBydJfkY8vCaU6c8cCPW8jT2CWyT6ScKKu5tvJcJI
         +C+A==
X-Forwarded-Encrypted: i=1; AKwUvBxvuLFTbKjJW0vVsU0pTJUCSYWJzNJlAvBEFka4lNZ+lxF1TVbXA8bsaafg4PRSvg2P1kVVxdbiPpaowIk=@vger.kernel.org
X-Gm-Message-State: AFuF++lSXfaEIxws5XUysI/L6buZ9RUl3akPd+4U37yecDJ8vwQdkPg7
	fc6JMuj00wg4JLXir8kuewSrY1OY/JU7QMv1hm0lwAYR8sEUesywGyKHDUobe4VczVa2J/ifA7q
	INSCDu70kohW0oHz7KmkkzXckw/ZRvhfYh4mVybpOHIbIX3Hgq9UwSxppToSzWBvmtIM=
X-Gm-Gg: AYBFou2wwkWtuheWkQa8eC3hbLb+GzglIEVx8UdETRbrsduf91QrGcp5xZDLl7NMZsM
	TSM3AE/RLtFNZgTSkslVjnHjeYbQdQCqyaRAJClaiDdxhIUn5xIVE3ZrHjYaebI9YVAfVl9Kj4H
	WQjwqPMu0tj6kjL4PcIvTvWUN9Gm+lOSVhfTMr/e4+X9YM+cpJsrDTl5vMpTPgEA/TCdIgQJwB6
	o+/Z6WOno0Sjek0vv0v3FDnJ83dHsUtCkx6vipzWM97RqacIA+rJTXcyQ56dP8dux+EQRdvz/bI
	V8grmdciIfR8jpFxX1suwXNYwE3R7BXd8QE4su+GHab/ix9yBfEvd8REDlxxoaBYJtXwF+ubq0/
	oFFCY5al0fhB6rq0IDWU5Ogs=
X-Received: by 2002:a05:620a:2d85:b0:939:6de6:9516 with SMTP id af79cd13be357-93980485f20mr2838183185a.45.1788942968995;
        Wed, 09 Sep 2026 01:36:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2d85:b0:939:6de6:9516 with SMTP id af79cd13be357-93980485f20mr2838179185a.45.1788942968417;
        Wed, 09 Sep 2026 01:36:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm43210269f8f.34.2026.09.09.01.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:36:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:35:49 +0200
Subject: [PATCH v2 6/6] dtc: dt-check-style: Properly detect comments in
 multi-line properties
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v2-6-c5cb4c9d9b66@oss.qualcomm.com>
References: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
In-Reply-To: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8587;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a5Ll65DQL/M59r5nNeLh7x1BtJXBfuJyRxs44gn+Yao=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoRpqTl+v2/Op7V2CKTCHexcHj7Nbn+grxaq7+
 XrvJaQRfz+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqEaagAKCRDBN2bmhouD
 13VWD/4vtUQ4eKPAA5NZ1M5vBgU0Mgc4nmKvH1Vhc7kBWWXYh2yssO4Tu/OmRrRjatwpD51AxB8
 yWyx6Yjb/Zo3iOez9pbYAIJv5Ua4SMZtKf1hPJQGGhyT0kwzwjhKuyrSP/t+DwOZ/LDbiPbAdQe
 pAAQQ2/TThCQlx+tT01oW1Uoi9dVfTGsPoRCrZm3xXAfLTfcgHYUkwhcLGd4Xa+0XEjjLSquWwY
 QUKhE0AU96D4GZAzIfHcE/BJChanxJQM8sESGaBCEbaZtR0aTqiG1DhiYt3VuQSBmrReP0Iyuft
 dJhVMH2N0rUvtcgSggSInb6Uithb0emF6lRg1mTuRxyY9z6iuI5VtvEeoYvx/S4JWkcu6EN46sA
 rYdTKag16swwGN1/L4I7y1qngAzHBMEEiaZs4YHgF3Kogmapd7FLl1QOU3k+tNxiocyNaqtdMZ6
 4jdOWmWGF2dAF5B+jJJzdqbN4ukXc2IarhlqsVdECu3Y2ohzkuEBLBBRxcHcJadrrnEsWYEhTwk
 A+X1o8CfKeeosRUvimATcpg3LYyCewRjpgvahNTuC4+uLwC4/7P8C3WDQGM08JbC9rb4J16tkjQ
 GNSuY4Y9kCxx5oUqN6Z6EgFx4VSCYazoSvYSJUrS262NvVyeDPH1IKRHC90qF49NkLXOyVrne81
 /vXTGnIZQXzwzOQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX/kygOGr0DJgm
 SAmcPwlQqrUypmBMWBMktpscef+u6DysR86il/HTF/z6XtqDTzPrJ9eAkoGl2dcw5ZHaVtPNcx6
 KSljYRHvVeU/L4lI16NVnZeeBEFqPKENwlumfvOw2zM8knrdmPvyOB4VD6E2AoxsXiIVuVIEHUk
 /YEZwmsIkaWmlxA20AU9RxuE+VB2XQ3Px+x3ScbJXw4Le1Zgq+QHO1lcNnUcZA/Py6j11xR+bYq
 ZnVkVF3u7olA+/wtmZCgX/78v4drTov+VohVuWw4+XYgKkp8fbfIlb0UJOh39Mu8yoPVpagTYRI
 OCU1+gzGp4i+b6uC8XBHMrCgw9AfnESoRHaprWfzL05WSmlpiHvgtKG4dPpi1tONdovxktMMBcG
 czeiGRPmhcLV6hyovEwgCkk5zoxDdc+UQb+ERWfqtiu9qpK9OBWXCr5YukBOtJrL4mfYrw6jmSq
 zyt42kewysO2+QaKtrg==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa11a79 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Y8AG2edEbfE3NdgbFfYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ke3ZP5VYYuNTSybXwWjkK_N17QUuuTrO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX09sNdF3sgseL
 kkmQmx5dxHnu2H8nH99fQUmESd1BTuIHIYHpc5EEmIF280QYJhq8vbg+CkD0S9xvFSVkGKaDTG7
 dbf7E2tdfuLsvaKRMIGl6e6TDyfls5E=
X-Proofpoint-GUID: ke3ZP5VYYuNTSybXwWjkK_N17QUuuTrO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090094

Code classifying given line exits on first condition match, thus a line
consisting only of a comment in a continued (multi-line) property, like:

  interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
               /* Performance counter interrupts */
                <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;

was treated as a comment-line line, not as continuation, leading to
false positive warnings of invalid indentation:

  arch/arm64/boot/dts/tesla/fsd.dtsi:456: [indent-consistent] indent mismatch (expected depth 3 * '\t')

This needs two related fixes:

1. Move the judgment as a LineType.CONTINUATION earlier  before one
   classifying as a comment

2. Check the comment-stripped DtsLine.code, not DtsLine.stripped, to
   verify if it is a continuation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                            | 19 ++++++++++---------
 scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts  |  1 +
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml    |  1 +
 .../dt-style-selftest/expected/dts-cont-align.dts.txt | 11 ++++++-----
 .../expected/yaml-cont-align.yaml.txt                 |  3 ++-
 scripts/dtc/dt-style-selftest/good/dts-cont-align.dts |  1 +
 .../dtc/dt-style-selftest/good/yaml-cont-align.yaml   |  1 +
 7 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index b10e30f9d5b9..9fcb2eeaf7fe 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -202,6 +202,14 @@ def classify_lines(text):
         if opens_block:
             in_block_comment = True
 
+        if not prev_complete:
+            dl = DtsLine(i, raw, LineType.CONTINUATION, depth, indent_str, code)
+            out.append(dl)
+            prev_complete = (code.endswith(';') or
+                             code.endswith('{') or
+                             code.endswith('};'))
+            continue
+
         # Pure-comment line: nothing left after stripping. Classify as
         # COMMENT_START (carries to next line) or COMMENT, and skip the
         # structural classification entirely.
@@ -211,14 +219,6 @@ def classify_lines(text):
             out.append(dl)
             continue
 
-        if not prev_complete:
-            dl = DtsLine(i, raw, LineType.CONTINUATION, depth, indent_str, code)
-            out.append(dl)
-            prev_complete = (code.endswith(';') or
-                             code.endswith('{') or
-                             code.endswith('};'))
-            continue
-
         # NODE_CLOSE: the canonical form is "}" or "};" alone. A line
         # that is nothing but closures (e.g. "}; };") is still treated
         # as NODE_CLOSE for depth tracking, but the multi-closure case
@@ -545,7 +545,8 @@ def check_continuation_alignment(ctx):
                        'continuation should align to column %d '
                        '(%s)' % (target_col + target_offset + 1, err_msg_explanation))
             # Align to the value within <> or "" of continuation (so the previous line)
-            dl_value_complete = cont.stripped.endswith('",') or cont.stripped.endswith('>,')
+            if len(cont.code):
+                dl_value_complete = cont.code.endswith('",') or cont.code.endswith('>,')
 
 
 def _check_hex_case(dl):
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts b/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts
index 5390ebbf4059..91a74887c774 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts
@@ -11,6 +11,7 @@ interrupt-controller@10000 {
 		reg = <0x10000 0x1000>;
 		clocks = <1 2 3>, /* comments with " < , should not matter */
 						     <4 5 6>,
+				/* but comments should be placed properly */
 				<7 8 9>;
 		interrupts = <1 2 3>, /* comments with " < , should not ... */
 				<4 5 6>,
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
index a5a9eb17fc17..0189b654a5b0 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
@@ -27,6 +27,7 @@ examples:
         compatible = "example,test-cont-align";
         reg = <0x1000 0x100>, /* comments with " < , should not matter */
             <0x2000 0x100>, /* comments with " < , should not matter */
+            /* but comments should be placed properly */
               <0x3000
               0x100>;
     };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt
index a7ed62677a2b..fd7f389d6cce 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt
@@ -1,10 +1,11 @@
 # mode=strict
 bad/dts-cont-align.dts:13: [continuation-alignment] continuation should align to column 26 (to < or ")
 bad/dts-cont-align.dts:14: [continuation-alignment] continuation should align to column 26 (to < or ")
-bad/dts-cont-align.dts:16: [continuation-alignment] continuation should align to column 30 (to < or ")
+bad/dts-cont-align.dts:15: [continuation-alignment] continuation should align to column 26 (to < or ")
 bad/dts-cont-align.dts:17: [continuation-alignment] continuation should align to column 30 (to < or ")
-bad/dts-cont-align.dts:19: [continuation-alignment] continuation should align to column 27 (to the value under <)
-bad/dts-cont-align.dts:20: [continuation-alignment] continuation should align to column 26 (to < or ")
-bad/dts-cont-align.dts:21: [continuation-alignment] continuation should align to column 27 (to the value under <)
-bad/dts-cont-align.dts:23: [continuation-alignment] continuation should align to column 38 (to < or ")
+bad/dts-cont-align.dts:18: [continuation-alignment] continuation should align to column 30 (to < or ")
+bad/dts-cont-align.dts:20: [continuation-alignment] continuation should align to column 27 (to the value under <)
+bad/dts-cont-align.dts:21: [continuation-alignment] continuation should align to column 26 (to < or ")
+bad/dts-cont-align.dts:22: [continuation-alignment] continuation should align to column 27 (to the value under <)
 bad/dts-cont-align.dts:24: [continuation-alignment] continuation should align to column 38 (to < or ")
+bad/dts-cont-align.dts:25: [continuation-alignment] continuation should align to column 38 (to < or ")
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
index eb9a84d5c222..9e98c28867aa 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
@@ -1,3 +1,4 @@
 # mode=strict
 bad/yaml-cont-align.yaml:29: example 0 [continuation-alignment] continuation should align to column 11 (to < or ")
-bad/yaml-cont-align.yaml:31: example 0 [continuation-alignment] continuation should align to column 12 (to the value under <)
+bad/yaml-cont-align.yaml:30: example 0 [continuation-alignment] continuation should align to column 11 (to < or ")
+bad/yaml-cont-align.yaml:32: example 0 [continuation-alignment] continuation should align to column 12 (to the value under <)
diff --git a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
index b52ee6cccd8c..e6450a1d8209 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
@@ -17,6 +17,7 @@ interrupt-controller@10000 {
 		reg = <0x10000 0x1000>;
 		interrupts = <1 2 3>, /* comments with " < , should not ... */
 			     <4 5 6>,
+			     /* but comments should be placed properly */
 			     <7 8 9>;
 		pinmux = <0x01
 			  0x02>,
diff --git a/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
index 8463075f9f4c..4a5b5ad43ee8 100644
--- a/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
+++ b/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
@@ -27,6 +27,7 @@ examples:
         compatible = "example,test-cont-align";
         reg = <0x1000 0x100>,
               <0x2000 0x100>,
+              /* but comments should be placed properly */
               <0x3000
                0x100>;
     };

-- 
2.53.0

