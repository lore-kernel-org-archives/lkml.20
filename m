Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DEF42A14D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491865; cv=none; b=qhSajbsRmCv7d5tUbTtCbHtQedcjWDFkjUE8RS1VpjX7/RiHeLzEKx4uc8RVqzzB318m/6EAggwh+QAXSvI58zZ8ApSrxxJ4F8WglQKfJJWLkdFLzaSTsNdvG6n84TnNmxbUSt/kZgZi7kd9XjCosKN/JJBbR6B91Xk17x8vofo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491865; c=relaxed/simple;
	bh=741ERsL0tFk0OViomsB6cXeJKp3J33B9FRo8i0gUf/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sgLqPIfTymbtpXZPHea3hEqOe56ERAOJCywHB9g01m5KApEHXe5EEXzbrtSuu3tDuwZiFIZfbuULN2LZCp2+b2qgz1etk2MPVe9s9NSHvEvXUGHu7EteR2j9tYYWWzvdS+YXsEZlG9gMYIn8yMZhrH3+gA2YkAlTQe9syHeppeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F72TNFxi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FDkAJKKt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F72TNFxi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FDkAJKKt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAc4M460771
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a64CUPH5JJ0RgB3MbwcpzE0cQIAFKA9Mj5OWDwBTcZw=; b=F72TNFxiUCAhI2fk
	UIGHht88ct1y0zzL/4xEgYz2WWIqomHSNOPaRBWdqYrZqvGRzaX9O4xtUndjKNuz
	+C7asnt4B2kKSlSvqkTt2IxZUixf665MLLnBraEeZfUGsgiEG+a/VvPxftcequGp
	dd2dD/Jj7CeMtaJq85Lf4B8JJVdom43v9gzKTxrUgLyAwAMe74dt3viw1n7COxz2
	teuMvFBl8qos8IXHyRyLmw81dh/OYNnNIlXC1Jaj0YYSt2ObDpSWV9xA3AOFEVK9
	0IxEzzyI5FMrO3o3Z50ceZK2SRczDTzM/l6a8xuVKeWdzxqtEFnlNibEkr+4Xn7W
	U+SdEw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jetvyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:11 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c96449cc2aso1369602e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491850; x=1790096650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a64CUPH5JJ0RgB3MbwcpzE0cQIAFKA9Mj5OWDwBTcZw=;
        b=FDkAJKKtvl/Gfdx31FLa29+QIC9SkcDHkkoUSuVJAtqa/Q+jUNjiE8D0fxKOM/A2Ge
         F6BKN9klIYPeYtbrMx/DBgeWHqJybMuXjIoYbXSNwblsRoR9+XG0FcVaXEOEzvo2/KCP
         PBMyYLg440z8F9ANBwvx/1BMTA1jhRdjpDR0Kq3nO/gGQfJFtoVhPuVXkWHIY+3xQe7g
         BG/b5UjArfSrcVgILG1mdwo7W6wc29kKWCvgndX5On+fJkFyg4zeSpV1seZIJc1Hwcf3
         9zMRYi54c+zhHlpjd8EcNJVXYwYGptWXTL7CFfo7OSOyVNgLZaW3Gm/BEMSq23OxnA5e
         3eLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491850; x=1790096650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a64CUPH5JJ0RgB3MbwcpzE0cQIAFKA9Mj5OWDwBTcZw=;
        b=Yqvzjy8YgtUE/Y7Jgu3+Ca/2nLtfDa5kb1jqdG3UN72ANjZBljvWUvQCeeO67RyyMK
         iO9q1EOJLWroJV4+gSmwlZUrcDUQpTwghzYc3x1NmH+FPlv3MilQA/Maiy4e9hzWm96u
         DaTpuhj86MjnYQRTFouEiQXQ4nzjnDyYv1kIp7IOtjmD7u8vBnV1T1IZKJqQZEy6/eaG
         Lqvy/ylL9UazICksrsj5OiKTwoOu2w7ImPahXdDku9iKk/dxyMzCY7AyP786wh9MoxpL
         2Y0cF8Bc5CZ3TZ031cyuy+ELLVPak4a+88H305+/Ca5HeIEB8nD33ZS4KntLtvv2ZDWd
         xaJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYkQdPgbhxbkWD6xThFiUDCt/EimEo2TUtX0W8j7vHwhHoeVmO5CkVKSI8t3edhLF3qzc58PSmMCKDEJE=@vger.kernel.org
X-Gm-Message-State: AFuF++njmXVYj5agoQFjp2wPTsu6D3TkwBtt15z1/eiWYr59/7LQVn55
	I+pY/RhgI8Q/JAIgLQoql4MjJr0A0I0TL6CDW/nw+mTLo6oKcloRAiKBveG6ZemSbNI+jPONtdf
	YIFi2MwHeEf+S014Vi9TSdtJjXxj0SILRXgcnA7z5czjUf/05AHuYTY8F/tCPnF7i3TvOzH+5XS
	k=
X-Gm-Gg: AYBFou2nJlLGYhCx1plDaZ4cX4E0A5dp04/fHtM2iNPEuGtRISLEAWoZ6rvRMQid7Vp
	/dR5uWofkS8swqiGtfjSCZbVV/zgYbm19xDjoDxfxqSTdgUl7Ro2iX5dl7T8/Da7ntzJKWyXA0e
	m+mK6AfrPrCM72Mjun+/rASEBqmxcqM3cSWonBiljV9dS74a/kRj/xlqd/CYua2HUTwOpXxdX84
	EnEaz3Ao0v273k0PL8asePggEnnhI4kpv45dkd7geUuJWCh869zd/5MXiJd+aD/1j4mZ99tGCHr
	v5idoK2O+JnEQNuKuHofFxhJYO/zMnLT0gN8WJ920pcf4Z9gXT/JIQmsUDiLrAhh36+/f3/ZQHh
	zJb9Y6BmCbBIfxpUoTgMYEME=
X-Received: by 2002:a05:6122:d17:b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c98a4ff3b4mr3133288e0c.7.1789491850269;
        Tue, 15 Sep 2026 10:04:10 -0700 (PDT)
X-Received: by 2002:a05:6122:d17:b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c98a4ff3b4mr3133075e0c.7.1789491849495;
        Tue, 15 Sep 2026 10:04:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27df9sm391286f8f.19.2026.09.15.10.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:04:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:03:50 +0200
Subject: [PATCH v4 6/7] dtc: dt-check-style: Properly detect comments in
 multi-line properties
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-dts-style-checker-continued-lines-v4-6-5b8e09b11ef2@oss.qualcomm.com>
References: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
In-Reply-To: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8586;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=741ERsL0tFk0OViomsB6cXeJKp3J33B9FRo8i0gUf/Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqXp6Z10oOYuzUR/KSjMvmLKXL6UwPnrgZpcj4
 rZ+TO+sHoKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaql6egAKCRDBN2bmhouD
 11QID/0fA3EIkkIejX03IdxoEs8ukFgYIps20UGxVYbZAAlAUiAzS8TIP24ptYZ4caJXqvkMLHz
 IUsjOBSfpTEel60ddpjuTn7Q7t7T2jXreJ8ZWEZlRn6KDmmlU0KZSW6EOXUa3PoPt3V0bExUzIo
 V9I6jxnZhJddizI8ku4GbmeDNWU4o1gS8REELetNcWQvj4QjNPA8j1WjeyXM2yus0JCIKRBUyH3
 gq/HgRUw4ut3/AJaELhXKZqxmnikekVugp/hls3cVicZAYGXngxH4zvo8tMlLGWJUOdaUINY9Hu
 rwATWNzZfX27SQoYhHHEyM6/B8kgEMlTSO/oo1rN2gfsKldPQshkSMTUxwqLwzLjg3a6IsrlHpv
 6KCM8u5c9tNYHa2yq7gXWdu20Dqp3dDmb3KbOyRVoRukoR8ew0W4bbw/JfZQp4tLAs6NLYhEiiG
 8bA4RvNbRi5lJ4gcpP4PE6MphAcPBBtjxiTGUZN7l4cgzd390+kHDav9ZCnyq3F3MLSQXtibQe4
 mgqI07x6oanEnWv976EJLPdTU7RRzxKFswXYPa4gDMXqFK/IfBs9Gz0yzvt68+LfACuR/S5zjRn
 V9ttZCA0lTtoJ3R7yKbDjLjf20BSHwf2v26OtnbJJiqcnJOiM+yn37kPo6SYSyMOBHzeterYzEc
 GgWJO+GKsIqCn4Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfX/Yv5P846lgFs
 PicXHJ/Xqm7SVX38iuI6AOXCi2e1SvEDSEhXz6hdwujqK++ZB62BKq7Okf+iUzWwwKylWRFIYGZ
 nmUIXE5litgf3iJ0mnRtzPiqJX9CsvQ=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa97a8b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Y8AG2edEbfE3NdgbFfYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: ft609fxwm0GRup-R0fkG0mrjP_TULIDe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfX6b43DTcgB7Kt
 ZZVgfdfPpj2CAO16ZYznidrTtHSKdtFHHz92RuQsWj5GDKlUimxAJLSzo2gM2G1hnso+A3y9RaA
 2Xm3yHgctiYDpstAUO3nmtfIKRCeBswRCi34IGOgl8r69IurRhW0V0k1qrsx5ffc1Fw6Yx6ig1h
 LwWE1RQCKrZX3AScPFf4isF8v2jv050G3cDo3At3GBPZqVrxZnUllGl3ocYlkOa2mOvx5nGDGmM
 Gl1/lJNWq1QQGtJzSBE7ioYjjI7oW8020QTM7DobLdn7zgLx0TzdPsLdyclbHf9rc+GMYHv0wP+
 ouLcqgvgPwsW3qMxAmBMK6bZ+dV4EDCofNjSoUxv2EuOdduJTk9YnUKyFOVyckycm7mVP55PI/p
 1aJr591AYFeiywDeQvUiEABVV5lp7gFyeEMNfG6KzTJ3a0XmH+BwL/7NhVacre8kGW0FhCIL1Vt
 eLyFD824MsSuW4JXmvg==
X-Proofpoint-ORIG-GUID: ft609fxwm0GRup-R0fkG0mrjP_TULIDe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150249

Code classifying given line exits on first condition match, thus a line
consisting only of a comment in a continued (multi-line) property, like:

  interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
               /* Performance counter interrupts */
                <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;

was treated as a comment-line line, not as continuation, leading to
false positive warnings of invalid indentation:

  arch/arm64/boot/dts/tesla/fsd.dtsi:456: [indent-consistent] indent mismatch (expected depth 3 * '\t')

This needs two related fixes:

1. Move the judgment as a LineType.CONTINUATION earlier before one
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
index a36c45c29476..cbbb8d384aca 100755
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

