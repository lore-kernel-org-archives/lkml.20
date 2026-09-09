Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5D4472526
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942963; cv=none; b=SySIGcVYHTvgEONMIkgthvaIwtQHhdKFA95JBr6j8qpyGNThVSo8gzT4WzqBeRDgaXQm26LEWLxF7+KwSdcK9EecYjdj8fLWWLmd7C8y7HqogbXawf6DOYcmzjZNs49eBdwFaZ2QTJC7bBYvZb/2C9aj+6ruRtw6yQ0HE5jWSgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942963; c=relaxed/simple;
	bh=RpsFWGOJ/fmrFBjXtNLPVOkO7viH6czPpMx9xQdFNUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cuEezlejQ7SM61c1ignvPrWrCtDdIsRl9JDXj7W3OKlEJb2B4hxi8KktgSh3y7VTu0i6Xsp1v5vomq3DKPkVYR/wRZUwONLZQha+K9LooDVwR+dssYeAmyULDIERyjPW5VdzyHN3nGJce4XnLRdWUN5OdBFn/07GXKkXqUDMEj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtwqYvGt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NsiIVbMA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtwqYvGt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NsiIVbMA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896W1gX045467
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 08:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOiYjCn1nD7fLf7vrzvPOq3oVs5fH9mikkYiajsOtfs=; b=JtwqYvGteBBlCoHd
	Q19JF+O2q0h0PUl1vXChPHh19lw5c0PC8rLBHal6gny4IgFcyZNxsGryBIpl7E0T
	oASjHV74BQLB+/ShHnOQk5/zOfKAp3VQ/YB9yhO9AoX5LzxeWaeUID5PGyNtGnCg
	Xna9mV7iReCoNs/SB0ABTkgWbWMZuGbH6b54E25p4FXRSN8MjUPVMmNbYN3w65P8
	F293h/m4uq/eyv06Fpw+0qlHdUeqpbvQ8OwtSFEGNIO2V0eURam7AzLvaT/wllYh
	fZESAEwo4gr2QWUnGdh9q6HV8pCZvG96jR/DrCG7fg9Zs76LfEqflrVLEYPeGp2n
	9ZICKQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqewk0nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:36:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so921591385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788942960; x=1789547760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOiYjCn1nD7fLf7vrzvPOq3oVs5fH9mikkYiajsOtfs=;
        b=NsiIVbMAeoFeSYA0GqBTyhQz6jVp1HoN3K6xTj5QuKMNP4mNHsfBigjfEn3JsejC2z
         3igLbJ2OjpTO4JRi2TIeRMkGtvIZEagWg8maDwHPXK5Fsj6EfDH7Pkpkig+R8sretU5Z
         F8Rmv+UvquDXyDDD1BVYiZieyqnowqWmanPVbk9Rh/YNgDwRV1tfphrM4vjGMti5WbgI
         ymR4hgup9181SwE+B50ATN4r9yLz/gbJmO5zN4BFtPrG08ngzZNG26ARhK4BQqqgs9QH
         3GXu2ztULOqpF4rAlS/6Bp1xjkhedvIJo1m+v+WbheagsEPf3obADCektVDWILcRoF4H
         MOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942960; x=1789547760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOiYjCn1nD7fLf7vrzvPOq3oVs5fH9mikkYiajsOtfs=;
        b=EhwuOSG1xKfHgwcKsEYhL22xTGRDoDFPKjkcYeXGDKZdtssNLUHYqCk28K1J/4/pag
         ih0LWTLy4vA2v2bAquwj9Cvwu6spGL4Z+jgbx1LwkV1VSjNXJeR0ogPp8cpgQ2mFlS51
         HBK9V5s1wseUgd3bXCWzwIWmXG7a4ZMJGLFL/YXPLSspAyFHC2ABBULdEkeOgzvwZxTw
         fOCYavkp0g9YR5l2xEW2GnNg8lXgspQqq1ugpl9jeVZDpVlcuFPy2oof/Dfg6JjSd4G2
         ovAm6hSAUSqzl8nviF7UNmbm/xRLz/uIoEf9tPvdllPoi7CY2nEFEUHEmHb6yeuYxz3Y
         38GA==
X-Forwarded-Encrypted: i=1; AKwUvByoD9Mjnxt5AhE9zNf5StKADJOdNACZ5twlU+S65zjw4Lk8Phs6UKuzDHIFphbep/pyQm8EpwPToW9ZS5U=@vger.kernel.org
X-Gm-Message-State: AFuF++luSElKhFctvJ06bml5oS51fd6T3CMte+SUWuBJDVJWbB+ei5ko
	DjIwO/Rs7qP8HnnTnG1Zvx79Kj296mAgkn0IfsH3q/p8b/MAJl2tdDNcoCS/svz6Eu31QZ/ul2B
	6Mq+w8WhMDeRFKVcs1YM4INZKI5ozKRe4tZwOlU9rvOzZV9zzxjmdWU8z4CUQwIxhFGU=
X-Gm-Gg: AYBFou19JkqcxWwkND93IZyXoiAvrhUCyTEzuXW7zYwDVQLFytY0HMXxLxvvX3tARrc
	6ZfYDr0shcRU8KLYdMpPWOsjBMqJEdt9nApb4YyTX6adbK+OeY7bNj38fuhSdBvvN64oqJ+mWa9
	PhwWHfWQqaXeclDaBu83+ULK2+nvcW0IVl79873II7nW75QyjwaN6SusvyaiOHVksdIQOvK3qru
	8OGlDlGs733wMjGcJY+IOYy7pGE2okeBIZyo2DrnMiAyEioopxvbklk+vd050t1vaf8MeINuKzf
	PD/t2x/Wb9Pqlq59vJT9fMZvaPIxkQgwa8rIkYAX/jDbn50Htm7vk22zDoqEIvUctzX/tS2IjB6
	dUo9TrWKEZk21AgLK55hKWjs=
X-Received: by 2002:a05:620a:6015:b0:939:7cca:ed30 with SMTP id af79cd13be357-9397ccafdd2mr2772141285a.45.1788942959634;
        Wed, 09 Sep 2026 01:35:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6015:b0:939:7cca:ed30 with SMTP id af79cd13be357-9397ccafdd2mr2772139685a.45.1788942959154;
        Wed, 09 Sep 2026 01:35:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm43210269f8f.34.2026.09.09.01.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:35:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:35:44 +0200
Subject: [PATCH v2 1/6] dtc: dt-check-style: Handle continued lines in
 check_hex_case()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v2-1-c5cb4c9d9b66@oss.qualcomm.com>
References: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
In-Reply-To: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3317;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RpsFWGOJ/fmrFBjXtNLPVOkO7viH6czPpMx9xQdFNUs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoRpmhPHdIrvukJy+Dz0gqu+ohDhxPjGperCVF
 J+WBZ4DL4SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqEaZgAKCRDBN2bmhouD
 1wztD/9Wq1/D0IBgCJdcFKWr3XtxZc2CQ3RtOQo4hJ8gVMh77TCCsBb/OmtP6j1OHbJR5Yzc1cl
 iLi+hLegBZESOt/yef8ksxAqkDi0ENqmOdw9iRaBtpDHR8FwZdAtliyrG2f+PGecUBe7rYk0ZsN
 QrDv95kiwD3KGgfHo4yhKy0pCWxY8FSb50zgRiLAyWhUUyiznsQEKPU1kEgovDC/rRNKpzIOvgO
 SUrSu7fdMhNavRJI9eH86HOzj/fJv98S6a2SI0RGK11+HLFkbTAzyGhqIagPspNGojlh0dNVrDD
 lHuKkVqmgI4Hoi57quPzZaIzpaWEsWQ4DcmYifX45RYE8fo6oR+3eRU/NwYzI+n3EvbxTF6qTqc
 /OoCtvEXJHi80DLRKtBm6QlljGdzxq7wH6CUzNPHJeVw60vYBhHjT+NIM+Im6/RRBfvqY09Fs2b
 BsYdI+XHKwS74YSu7rHoXqzQOQaijRnfLCHnKTMHXfNTH0yUelRdQrnE/4RcIxJX0pqilt7SG4X
 WeOtWoQCp9+ygj3nomvDZGg9KN7E7mHMHyK9TdfcLmunbXNVUTzuTcxOmQjV4adYWH7IiX32vdd
 NiKcGZDGYC0TG0yB8qG4bU86xaG+WnzEr7GEQm3p+PBejsMXWSEFlzX2TLkJxFU643lH4TI8j/y
 Du5KKQNVHtwhcxQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=cpirVV4i c=1 sm=1 tr=0 ts=6aa11a70 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SU40fdrgiSb2mxkwluUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: -OzjjpGRZGQCkbAQeoO1BCW2Sp0XHilY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX+X2Blpw6yLja
 xKTAUrEH83AORmtrshLik9givP9TsQRFW9yuqIWBQxA0IJl4V84iD05DMV6yQygcYLnK06RyiN7
 jWbvVXST8cL/Piv6S5SzNRrBgF4asKiV5CAWziBFYQy+2JaAwP7W8wEntci4Cl/Z5gsfNnPn5aq
 Cd+jZH34APu4W2RNbiLJU5anItUu9aL0S/IPxxBHpNVx7z23ADaY/lg8fXkfqwRoyOuwWJq5uCF
 UDRCu2n87McrgiRze42gZOimGDnA1T2IytJ2IvJfz/W2+V9j+dSojSCNB9haOneF+wjf5HegR+u
 FuIw6YrDCzOm3iBBJh4ovaBIb+AJym2ooKTid+IdidhK5KVXE1rc3YzEdsU20TBkGp/za3ml2Ah
 LIBHGEIaWpSZWh0LdygyRmO7WFWIBimOMghVKb7occrrY2cCN8ulecmynhDEayN63yuh6rCBSPY
 M7s5cR0pg/MCskjdKtQ==
X-Proofpoint-ORIG-GUID: -OzjjpGRZGQCkbAQeoO1BCW2Sp0XHilY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX8Q7/nsFPl7So
 hPT6bqpk2oLw9ruXnDyELH3EwPc38hp1SZAVvrehjzhBTM8doPK2PztqeztoCpGGz3ceqDU59sv
 FBhfTInT0Cm1w1UfOawUC5NpOrad4ns=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090094

Continued lines are not separate DtsLine items in ctx.lines, so they
need own iteration.  Rule for hex case is applicable to continued values
as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 24 ++++++++++++++--------
 .../dtc/dt-style-selftest/bad/yaml-hex-case.yaml   |  5 ++++-
 .../expected/yaml-hex-case.yaml.txt                |  2 ++
 3 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 15a3ba82fd5f..6d978c4d9832 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -547,18 +547,24 @@ def check_continuation_alignment(ctx):
             dl_value_complete = cont.stripped.endswith('",') or cont.stripped.endswith('>,')
 
 
+def _check_hex_case(dl):
+    if dl.linetype in (LineType.BLANK, LineType.COMMENT,
+                        LineType.COMMENT_START, LineType.COMMENT_BODY,
+                        LineType.COMMENT_END, LineType.PREPROCESSOR):
+        return
+    for m in re.finditer(r'\b0[xX][0-9a-fA-F]+\b', dl.code):
+        lit = m.group(0)
+        if any(c.isupper() for c in lit[2:]) or lit[1] == 'X':
+            yield (dl.lineno,
+                    'hex literal %r must be lowercase' % lit)
+
+
 def check_hex_case(ctx):
     """Hex literals (0xN) must use lowercase digits and prefix."""
     for dl in ctx.lines:
-        if dl.linetype in (LineType.BLANK, LineType.COMMENT,
-                           LineType.COMMENT_START, LineType.COMMENT_BODY,
-                           LineType.COMMENT_END, LineType.PREPROCESSOR):
-            continue
-        for m in re.finditer(r'\b0[xX][0-9a-fA-F]+\b', dl.code):
-            lit = m.group(0)
-            if any(c.isupper() for c in lit[2:]) or lit[1] == 'X':
-                yield (dl.lineno,
-                       'hex literal %r must be lowercase' % lit)
+        yield from _check_hex_case(dl)
+        for cont in dl.continuations:
+            yield from _check_hex_case(cont)
 
 
 def check_indent_consistent(ctx):
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
index c55359a4ca68..b0b8683b883a 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
@@ -25,5 +25,8 @@ examples:
   - |
     foo@1000 {
         compatible = "example,test-hex-case";
-        reg = <0xABCD 0x100>;
+        reg = <0xABCD 0x100>,
+              <0x2BCD 0x100>,
+              <0x3BCD
+               0x100>;
     };
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt
index 6600f7cd1ba5..f42490256939 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt
@@ -1,2 +1,4 @@
 # mode=strict
 bad/yaml-hex-case.yaml:28: example 0 [hex-case] hex literal '0xABCD' must be lowercase
+bad/yaml-hex-case.yaml:29: example 0 [hex-case] hex literal '0x2BCD' must be lowercase
+bad/yaml-hex-case.yaml:30: example 0 [hex-case] hex literal '0x3BCD' must be lowercase

-- 
2.53.0

