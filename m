Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594894;
	b=ywrxkId1fy9Yx0Sfhn8zJDRnImv8XCWItivluMBNBWRRZXKsp9sU0ed9DPEf4bXpVuv1
	 c6OSN1Ud+mQVaGDxGX2L8KIs/kxOlmihVVNUKEdhMKHiztZW4F5ZnrqDh+gM0Uucz1ziy
	 kzcYhH7J7qlvzgsTE9oPXyXZQD088/GqIIequRkEuyM6FKVxUpemo7UtPLno6Mp8ujf1x
	 HnCqtHuKbCz4drm0IX3NQ1hQ8mrtz4nZoj02MMnsQ6ZTggUUdmK/XXsyd6FNeo2CGPNk9
	 Z3eBEwpR/9b0eUGM1PoXoBECVRtGdKbMdX8UeIAwIRXMbDV7Rcp3BZNlKY1QbOFGiSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594894;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=E6zYprypSazoSQu9lRCpCIibv6TncNhgzhguOa6HKIY=;
	b=SrRp/HfCbiEM9Mtr6sQDbs6fXwytHHT9nvfsDKYyy/mvUaLppjsNxY9PakjtZ8BJpFqc
	 Ik1rxWWkX5UNp8K72K/qJ5F84mqK1IBWYWZ53w6qVWX1NOayk4vYC0DaViEq7tuE5+9A5
	 VLZGqBug4MVP9tszzmtRfQKKiGFj1LEZ5G+WjOsKJFkhZDDG9BDd+iZuVlYf9XfVkci1K
	 GjywdwlZkCGfehJsKZV/eDjcvo0TZFaTWiB1n9IBxT/jO6vCkEBiRzwvaEh3OLTtnnBoZ
	 dzJj4DhCLU33kVZ2DEdFuqwmn8DVVIr+pzDOupONCPDL3irJLKg5kuz6Y1KmzUEz48Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=StzFNBwj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B2p1nO+M;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC48260A380E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC48260A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=StzFNBwj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B2p1nO+M
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRZgl533510
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=E6zYprypSazoSQu9lRCpCIibv6TncNhgzhg
	uOa6HKIY=; b=StzFNBwjo8AL6idEpiOklJFUIvETLKd7GThInFqFrmVG0Ouky0+
	SRc4zJzJZP0JlEoV2AzTf3u/OQO4a/KgIJawuXTrDsi8K7HdADIy099+plU2crNn
	WmJooo/fv3vnHwskAARlVOutbAPQeNODVculUrxkKny+hgr5+4u7uzloa5xkYJkt
	KPvW0vsNz0Y0bCEKsySdEXvBXvD8tsKiC3T2ByZFp/JiuGfiAwGuQYThtICfeaGN
	Zifu4b4+MYDMr4QPwwbTr2xXsyvDgiiTxG9gcY69c1FhUiaeveRm4+BtV1ko1fwb
	bj0qCL6VS0FcZh6i9V82SurC5vvu/IbfzSw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvjaapqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:34:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso268154985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794594892; x=1795199692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E6zYprypSazoSQu9lRCpCIibv6TncNhgzhguOa6HKIY=;
        b=B2p1nO+ME8s8fmr3N6C/hc26Am7tQ4BcfkcPuRdlCmcpD9sd2yLrr72tBK2fZ7l5ew
         eyyEZAb0r8QBTUEJsWz9Msh0D7k4aviaTjj1Ch9qNW9QLa7meEZQpYI84npFrjJVbOw6
         5Qiqz/ghB0rhwE5NQQgZSOBHgKmLiYb8qahrVSv/fWomwfC2NlDTma6xJB3MyeoEImpQ
         51St0zlh7Y4PDxuYeSRtLFreYx7JbTaB1DkreoavlO5cqvweBbbZx4xmFZI7Da5F3K/B
         YUZ3XsbBs16WmdtSKibX5yWZf0NvC6evbTtYRzTPI19pgSonlQ5JqHPP6QVD2NirVdWE
         nr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594892; x=1795199692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E6zYprypSazoSQu9lRCpCIibv6TncNhgzhguOa6HKIY=;
        b=fwry7ABLb6DgPO+lpk7XXGCwdvdNneHOSX0/b/vDuxvhIEuU+aDUkSRAFYv5EN549H
         Z2anOr4btCl8WtnexWPoliHPOaVmQL9egvkrkMnU/xIBWbmYV6vWesRe+NLSFrYIhPwi
         UocaNwCjR4moy9zl3PE84VpqO4/NW1yVsYucvnMKrLe6wwqW3rMgfjT8ceHu7mFUdmCc
         WkL5HkGnYkR5OEmPBI7MU6VQgmtN16a6BzLn09TPZ4o12h7eYHy0mapGN03XkrqFOTAj
         kpLEuIXwtROXlrA8Q6nEto6Kj7Pq4Aj9BIHoxVKmUyT/15TKulQ7OrFspWo85gMqQJci
         SArQ==
X-Forwarded-Encrypted: i=1; AL+hErEJ/6+AF8IUvaMYoBIfugQMfz1ixQdwBjcGFccHV3BUSZV3KHtn5NxtiQMcKOGm0yc3QAm/mwF73Qutnn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9TPZfbAQF365GQYf5fmFTH4h1X1fCEUFCbQ9YRga9Fa0jT72Z
	X3cyQlw2Qoo8s79TqYfxQ4BP7G9Nje+T+91HADL1axh/3LpQjjalP7+e1wiaGCl10nenO/RAc+a
	v7i/QdWMj5X8G1/4JkoEA0MPgVeBbMxYLnuWDmqyD28O4CjCIYPCX04NzMCIF348DhRQ=
X-Gm-Gg: AYBFou1cmrljNx2E19jvWD9+lZFIms8lXeWSGy+DcLzLh22MTl5QThj/01wiA7mnwYc
	4wj/DGGwb029nuAlYEGRSPD2dy10mKvEtOtkbcuOtZeHbEjS74VSTzGViscGkE4aVyhdVUVVLDW
	UHHjQYvBjFVKAY+5SCL65nM4qtpwcDVlrqyaX1rYIEzZeeyvOyX1hHLiRdaUt+taf41ZwNDbQgk
	zta0nQj43eYXehqbWBruR2X8uxAarIDVUjZfKlCotBXg4tnEylPwHyrtAhUNIWnB2xmgzgz5Njd
	IvaQjkwZQbUsUiTRRgvfXVcZEbPTDrEBfHzyY4IW2FQDDg3ArjvoUfsPYkTG8nXQJzsj7wlpSGR
	QQangOpmGgKp+/jFddzrR2oYxKne8H9TADmzOGvZV1JmJEdy2OD+1VXZOzm+LqA==
X-Received: by 2002:a05:620a:6606:b0:93f:3cb0:4639 with SMTP id af79cd13be357-9494bcc695dmr519055185a.72.1794594891947;
        Fri, 13 Nov 2026 10:34:51 -0800 (PST)
X-Received: by 2002:a05:620a:6606:b0:93f:3cb0:4639 with SMTP id af79cd13be357-9494bcc695dmr519049885a.72.1794594891341;
        Fri, 13 Nov 2026 10:34:51 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm6871268f8f.40.2026.11.13.10.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:34:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dtc: dt-check-style: Check for closing bracket also on continued lines
Date: Fri, 13 Nov 2026 19:34:45 +0100
Message-ID: <20261113183444.175773-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3622; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=egqTvW9kWgGoW05fClXQCkErszewSsxAWqh6tyTRgzA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91hEWLILURS0qUmOOeTiWhHmDnQ3YyoiN/Vtk
 dwZ8Sj0J5SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdYRAAKCRDBN2bmhouD
 16v3EACMjTOkalsZT++v/jmcqzFc7y7SVVpM0DQ1zOKUjyTTUVa44QjUhFc0+H2k84QhfcUgj8C
 qtgo0N6M7ZVSZsD35EcBB3TmlB2Qk7QE1VumOrELymVOMYSSUMDPDeSsaR1OAbvWlBhYUR0nXGj
 gQ68DSApTokfyPDqRtFpKkQKY09uI0yxLj0mQkymhldchmUHTSZDyGZRH3D4Dqp5vNF7MxKNmgw
 QX/hixA3kBYb1y0N/4zYbFQ+HcZIUtIHAxGNG+wtcl70FMn0jIH0iqNA5JAyn1nyWcZ9mMZCoUq
 ND5mg064AvtFg7U3NogIy4coq0e3/tzhZP+T5tT7oqZTEm+tZDEjdp+13Zf/7laDbWTVtz/bhgD
 +GizDJhTM2b768/0Q8eYIrAoXUaRf7JOJF0dQ20itvDsN9n9iJ9UX4grEnrD7h/K2zf5tMyj1Ap
 Te0CdjU7Bzq6ufzFJ+oGGC3hks42Hevs2qSX4ZcE76QEnd9YBzMRFNntX4uILVnUPI5Yb0LGCUS
 kHpykaJBu9kdlFn1Y6X3kN5TWHEkE+P6Baox9HUtxxvqlg4aGQJ3VlfDm0AXxYwvLfFPwjgudJe
 OTyWGzcLqq/LBm+gH6kkZDRE6ATd3ONG1pk/EMyeJ3ziifbkNG1bORAT0ddI+fs6ZAQOhxQUOH6 FjExBHU7LzykEBg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rI9wVlQJoCV0omGL4VjtjC9sa7uX7M9r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MyBTYWx0ZWRfX166liCY0tvAe
 o77vahBM5ZoXxYW1y6XYlz/u2fB8rTnUaSlsfAo7VzAlFB4NS5eq4xZAKsRx/pe3g2Ei3Y5KLOr
 eJYDxQj7ZJFteqNmyzNFwHgUnxXLWGs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MyBTYWx0ZWRfX4nvKRvyfjXzn
 f9o7/vPqW8ZdkLgT+cePySF2Cr85qvX5D9YSkO/DPWSqM/Q9ZcMeHS5MQqpNr7EPziZiAbi9++C
 Ri0nvG+ALoACNcrHS3pv6vvIQN7aAI2e/sZ60xr6zdnq7+0q6h+j/bGgPIGKjc/tzZG5WdlzGex
 4aFu3erYx47DzolEbAc76qxxDCbULywX2GakqrdDLRpCLWFxVvQDFeoIGwWXAbIJV+kV3xSBRJ3
 /qBa5yvb1g3daJKqBosmXMgz4Cx1zHCfqGA/FgWO9JEVsoHckK0noobIay4GIwAioq+yOuo1CzE
 YtbvtzWSdrk3q+LMPyHTaSBPtHfdRnfA3F1McJecJgWaXFFmCYQ/RBwggcy64SxPfm17/3WBgAK
 JZw+kKJejF4x5EVVdDV7fWEdgCOkRaTLH13DgZgrcYNGGU2DDvZcAJjUX++B0nvMMW0jviifbRN
 Qza1VOanZsnPnD/CoSQ==
X-Proofpoint-ORIG-GUID: rI9wVlQJoCV0omGL4VjtjC9sa7uX7M9r
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af7584d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=SugtBgs6HSOQlyXiFc4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130073

Fix incomplete check for closing brackets also for continued lines to
flag code like:
        reg = <0x100 0x10>,
              <0x200 0x10>; }

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                    | 19 +++++++++++--------
 .../bad/yaml-multi-close.yaml                 | 13 +++++++++++++
 .../expected/yaml-multi-close.yaml.txt        |  1 +
 3 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 6bbd12b308a1..65d76f506518 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -675,20 +675,23 @@ def check_node_close_alone(ctx):
     that is all closures (e.g. "}; };") is still NODE_CLOSE for depth
     tracking but is flagged here via dl.closures. Any other line that
     still contains '};' (in code, not in strings or comments) is
-    mixing a node close with something else."""
+    mixing a node close with something else. Continuation lines of
+    multi-line properties are not part of ctx.lines, so check them
+    as well."""
     for dl in ctx.lines:
         if dl.linetype == LineType.NODE_CLOSE:
             if dl.closures > 1:
                 yield (dl.lineno,
                        'closing brace must be on its own line')
             continue
-        if dl.linetype in (LineType.BLANK, LineType.COMMENT,
-                           LineType.COMMENT_START, LineType.COMMENT_BODY,
-                           LineType.COMMENT_END, LineType.PREPROCESSOR):
-            continue
-        if '};' in dl.code:
-            yield (dl.lineno,
-                   'closing brace must be on its own line')
+        for d in [dl] + dl.continuations:
+            if d.linetype in (LineType.BLANK, LineType.COMMENT,
+                              LineType.COMMENT_START, LineType.COMMENT_BODY,
+                              LineType.COMMENT_END, LineType.PREPROCESSOR):
+                continue
+            if '};' in d.code:
+                yield (d.lineno,
+                       'closing brace must be on its own line')
 
 
 def check_node_name(ctx):
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
index afc202a698eb..80cf44340e4e 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
@@ -33,3 +33,16 @@ examples:
             compatible = "example,test-multi-close";
             reg = <0x100 0x10>;
         }; };
+
+  - |
+    bus@20000 {
+        compatible = "simple-bus";
+        reg = <0x20000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        device@100 {
+            compatible = "example,test-multi-close";
+            reg = <0x100 0x10>,
+                  <0x200 0x10>; };
+    };
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-multi-close.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-multi-close.yaml.txt
index 637d0f8ea103..ea38befa1bc3 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-multi-close.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-multi-close.yaml.txt
@@ -1,3 +1,4 @@
 # mode=strict
 bad/yaml-multi-close.yaml:35: example 0 [indent-consistent] indent mismatch (expected depth 0 * '    ')
 bad/yaml-multi-close.yaml:35: example 0 [node-close-alone] closing brace must be on its own line
+bad/yaml-multi-close.yaml:47: example 1 [node-close-alone] closing brace must be on its own line
-- 
2.53.0

