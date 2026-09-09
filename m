Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A87470EA7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942964; cv=none; b=buAqpOjCJ6S48xurqAGR2V6s04VL5NAjE/hAQKOk4uuQzswi8yAz7Kp9GcMdVbf7tUpOKnGV2LnkSteQv4DlUBIXe3mbeeTOmXcmEG14QVCsLtqFsSBA+VtDcBJIF9fGTJsIBmfMfvmWUotgWKfnXftkeAPBeiIOYva/O78NJWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942964; c=relaxed/simple;
	bh=Ixb/AmdAstOcn9FVhgNt2Xll/IdUyQ44GvDHEBU3aaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jnVjtVD3sAdEgS2kvbeJYPVNILitPgSSE58LTv2SP5XzAYKZgdli5t45awfj4wysgnJExubWZ3U8un/98HotRx7tkDAEK7DvgpaBgSv9i2OM27aUE2eF+ytL5VN9FT8xG6Vm1p8rkOaj3rdx6JdXsvV2QbLvDcCQikT6apEOCRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cv1Fsawx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z798z6cs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cv1Fsawx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z798z6cs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896kmQG045553
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 08:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AiS2pGqIFKAf7u+eYdTRDO4CKrAlgaifUWeuWMxg02s=; b=cv1FsawxeQWpdU4Y
	D+lSX54Vr5x4l3lGX07jzFcZwWG96q+xzO2vZ5Vu8wtoI/aV1CJWh26bV3u1p/l7
	r0zQBBpJ0YgcqiqS0MXsAkSxHl2vcIE2QrLeR9R4ZO6BPzShqxjZVO1+6enAjkm9
	0Ei79MxsJ3PWUFWCwqtgN3H/L3HbNFpiDnyf7fPq3l4Zz9eKASWowR6JOEF0Kfep
	4dzd/msllYmFZAJi7mH7ONbA8sXB6DJqF0z44YihjK2c6eC2kEo62AyJ5gO3zLc9
	kRw8Vspi7+Rf/p3KyRyYz1pRXoe1tilH3WtaPiC1TmzAxIfFPfxZDZqPVsrQw7ld
	lZ+9Rw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqewk0nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:36:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so1059768985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788942961; x=1789547761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AiS2pGqIFKAf7u+eYdTRDO4CKrAlgaifUWeuWMxg02s=;
        b=Z798z6csB38LmTROa0f8HDfG0Muo5xndwvQbefRkB/OiNns3JZqApJocURl2kMiAsH
         RCaZyHz4HHxarcJQqYG36WSEeNxvPcJTpeG0fNGg0SLUnSf+ez06NZR6VhuKljVcETie
         6zT8i4/cPUeY8lLxynPcNvAedy5+7iLgZyIZIu3XWMrERmji4m5TfRybW+9kFp189v5j
         SHQDtq5pOOoQ4JpCDQ7zY81HRBgeAR6v9u8NjSuK/q+44qPLjaGXXD5ZZrsTHPs4mMIU
         jaYaOjBxZL4eg7yOwOzz0r57Ih9A6rZd76oeKN8rlfNB3dVbKkTp52sZu+y5mmSKLNKd
         vmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942961; x=1789547761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AiS2pGqIFKAf7u+eYdTRDO4CKrAlgaifUWeuWMxg02s=;
        b=pTEL+khGkxYogbG6Miqf+d10r52CZnijzxLQttBxnKflVlD6XK/S1O1cpiMbBen4wQ
         an6tR7EDYGxbypRCSCw94SGAvDW6pIqBOfjTZ+8ja2Ozs667TIL9NGJW97oQkvugcVkW
         l7l+ColiWERTFtvzQvHhzxZFDSHSd8Nf1YFXzMFUSlfatWvfW/COxwEAtoT56yTqE0z9
         furT4slBoQ2UTF2owlTk+1PC7Q1bm7sL/J5wcSrC/zWRnQ/lwmvFfEw+XVsigrpZz++D
         dfoCqAb+jJ7Ya0HUBHW+QQleCf2SlK71fxrrjr0qKMDfelM/doi4F3cEKVrhEw2hDWNY
         WyEw==
X-Forwarded-Encrypted: i=1; AKwUvByd1ubBNIhMT6h1ZPYDPrK9PvpQY5zS6QoJ7j2hfRFE7xkYUMP6JO1KI8hAGTK7Ll867vKp2OrIrU89gTg=@vger.kernel.org
X-Gm-Message-State: AFuF++n1kbzKCLv0GNZN+s1731RFcFZ0p30+WFiMPZcbqRpUmpQR0JQq
	CvyUOqUQL6b4Dg6L3EalI5mol1+rog2dweM8AOS+LdDVnkWnkfCBtCjzsp4PyTPwJSuRWZD8YRG
	LLPbwwnypoflbdFgfuu4hmnKxCeJ9Fagi0pDJnuIjzHHa7PxFYRKDzrN3toHrdZQg65Y=
X-Gm-Gg: AYBFou0In6dH+wBNOerh+eTYtCQZk4+8fzyPUWea7rTHyuW9aV3U2tVjORSUoHoOXQs
	w5wclTqKhp5iV7da5Md+vQqn2mmctEvMZuKcE95K3/RHdmJ0TUWGSKJGdbuWvUiNteK/2JOUbBe
	YGqWh9UUxy5kY5HaEzYPmKLYQ+jHh1qaTKHiWIT60u7lWHqqSeSrLWp/uOg9WJRlM2MVAALl4gQ
	NKqsg3N+3W0M2LwDXi4UWfXx7mKWlE8+iNqHMJpJEjCl+5+xl0O7qnxtVLhx+0PyVk12ERFZzwy
	6MhaI9lAVDpGSOorxcXSjjBBO+xJnEMFlsEnyGR7B6WY3aNIbEzk46gic7bx+SouwM3YN9a1Rnc
	61oDIunQmSIqGRXQwL3igsp4=
X-Received: by 2002:a05:620a:444e:b0:939:7f14:ebc6 with SMTP id af79cd13be357-939c939ca65mr620922385a.3.1788942961538;
        Wed, 09 Sep 2026 01:36:01 -0700 (PDT)
X-Received: by 2002:a05:620a:444e:b0:939:7f14:ebc6 with SMTP id af79cd13be357-939c939ca65mr620917885a.3.1788942961126;
        Wed, 09 Sep 2026 01:36:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm43210269f8f.34.2026.09.09.01.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:36:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:35:45 +0200
Subject: [PATCH v2 2/6] dtc: dt-check-style: Handle continued lines in
 check_line_length()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v2-2-c5cb4c9d9b66@oss.qualcomm.com>
References: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
In-Reply-To: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4091;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ixb/AmdAstOcn9FVhgNt2Xll/IdUyQ44GvDHEBU3aaE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoRpmFJBDZVgsyLOBlQRK8YpH0ZX5GdlnTEl8T
 HgoD1a4DuyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqEaZgAKCRDBN2bmhouD
 11p7D/9W4VKbJoa2jXlqYU7w3aFluGaZ7hpnbR6fLnYrBB1QhEo1jjTy1qnhWkMUhVeSLFN/GL7
 8hV0ZiXVvlY8o4BQDIgQqvxCFrHDQNuyKvwAQovYSstSh61lXBZgb7uL8q8yp2YI0B3De3pzU8W
 Q+CNRwZ9qf2VY371JxBMHEyjytaUYZdi3whDqlDJjYRyIeySTpUqxO5nJn+5hRWmUIM62W3Ht1D
 cAZ4cFIvZbb9pSKI8uyMdvHC3mhCnTtDErTqkfMURIU8gg6jPzQzMhBNTPDK8DoF83FepjkEafe
 toE4YEKdD4qmQklkYbKEtpeg2O1F2Sd7EOnWujWnzWchuJ199Z0u7Pnf52HC9TyuMzGXcH4zp/Q
 3qWkuqxxhh2ZWb6HUnL5kaa0f3KnkO53q0I8MROLOHUB3RiLLGZv1w/nC2KUwn42XsABQgM9kQ0
 WUQfKpcC71FX5s8h64T/68LccYGmOL4aJAwxs3jTpg8w3AFbswqHJgk8v/q7RkahEFkvYI5nZYM
 puG7GUl/nZusN/QiIVDC5z4LoyPqBGqzrvd8kfZ+2+/7YPjLZkPn/OFUnHdTSFj5d1O0Ihh/a2z
 gSg5bLGX+i2T+idYuBCgXcB/YPWWwgUC074ZEUaUx3EIwd7g9XmWTXurcVXhz5igJuKKnP1cjg+
 QlFSS89ABJ1e+1g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=cpirVV4i c=1 sm=1 tr=0 ts=6aa11a72 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jHdmtohXv_5nRK-EuSoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: zmVEs5IFwJoQ6R6TZjXfr4WpM8roMnEI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX3IewC9sFQTlg
 tIaZzBwH169tcd0zLyic5SOX+aFxGcgZOwA+4QRS7AGc8W4ljmdLk/GgfrUi4w6QoNDFij9/S7k
 QmYByMJQu3UEwZmmi/lnKnt+hB597KiqEOHDZd9VRvYJbUytHfSqFZxZVhduauKpM2r9nivv4Dw
 wN8r03sRSbtxPPCI/y2M/w+lFu8fAB6uWWrE0LiI4TKu9XUu0C8+HBY+6veN3Z19avn8n/DepCk
 creW6jTOIe08FprvghTgGWFS2n1NXT1mc8uN0TMPmna0XxR4KvhENwSuFcfeyQvry1DUNGwz/IR
 fbW1PNXpbekTaHJ1aBRiY1WgH2xQXJVgMfZ6ZPG+daoQUAoQh7ksqheuK0FjrbPKM6JdHQsTdS/
 jqYJ0i7JbI1ZMyCwvoOEifjgrLxuk+6fgsyQZnCcwgvC/AFNvtiDJmvd2d18yZOvF8bV0hxc6f5
 CjsgOqqxvzGVo6f2Xdg==
X-Proofpoint-ORIG-GUID: zmVEs5IFwJoQ6R6TZjXfr4WpM8roMnEI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX0l6IyxBh0LeL
 OzrDGoFpbeM5C9bc65tOYmf6bLcyf3KxJ58pu/mSb3K8FFQ3WyO0kqfxpgRX44uy3Rsa3hoDCJN
 Y/AAhl3Jv3AmOGdF6NVDbKL5QakW8Bc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090094

Continued lines are not separate DtsLine items in ctx.lines, so they
need own iteration.  Rule for length of line is applicable to continued
values as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                             | 18 ++++++++++++------
 scripts/dtc/dt-style-selftest/bad/dts-line-length.dts  |  3 ++-
 .../dtc/dt-style-selftest/bad/yaml-line-length.yaml    |  3 ++-
 .../dt-style-selftest/expected/dts-line-length.dts.txt |  1 +
 .../expected/yaml-line-length.yaml.txt                 |  1 +
 5 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 6d978c4d9832..ff5e715593df 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -627,16 +627,22 @@ def check_indent_unit_strict(ctx):
                    'got %r' % unit)
 
 
+def _check_line_length(dl):
+    if dl.linetype == LineType.BLANK:
+        return
+    cols = _display_col(dl.raw)
+    if cols > 80:
+        yield (dl.lineno,
+                'line exceeds 80 columns (%d)' % cols)
+
+
 def check_line_length(ctx):
     """Lines must not exceed 80 columns; tabs count as 8 (see
     _display_col)."""
     for dl in ctx.lines:
-        if dl.linetype == LineType.BLANK:
-            continue
-        cols = _display_col(dl.raw)
-        if cols > 80:
-            yield (dl.lineno,
-                   'line exceeds 80 columns (%d)' % cols)
+        yield from _check_line_length(dl)
+        for cont in dl.continuations:
+            yield from _check_line_length(cont)
 
 
 def check_mixed_indent_chars(ctx):
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-line-length.dts b/scripts/dtc/dt-style-selftest/bad/dts-line-length.dts
index bde91a922477..adf40e3c95f7 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-line-length.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-line-length.dts
@@ -14,7 +14,8 @@ soc@0 {
 		#size-cells = <1>;
 
 		foo@1000 {
-			compatible = "example,test-line-length-this-is-a-very-long-name-indeed-yeah";
+			compatible = "example,test-line-length-this-is-a-very-long-name-indeed-yeah",
+				     "example,test-line-length-this-is-a-very-long-name-indeed-yeah-second";
 			reg = <0x1000 0x100>;
 		};
 	};
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
index 6e4140e500b5..6b1209ee4f26 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
@@ -24,6 +24,7 @@ additionalProperties: false
 examples:
   - |
     foo@1000 {
-        compatible = "example,test-line-length-this-is-a-very-long-name-indeed-yeah";
+        compatible = "example,test-line-length-this-is-a-very-long-name-indeed-yeah",
+                     "example,test-line-length-this-is-a-very-long-name-indeed-yeah-second";
         reg = <0x1000 0x100>;
     };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-line-length.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-line-length.dts.txt
index 8ed08c309632..9cdb7550b56c 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-line-length.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-line-length.dts.txt
@@ -1,2 +1,3 @@
 # mode=stricter
 bad/dts-line-length.dts:17: [line-length-dts] line exceeds 80 columns (101)
+bad/dts-line-length.dts:18: [line-length-dts] line exceeds 80 columns (108)
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt
index 89b36360caa4..f21b823c6136 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt
@@ -1,2 +1,3 @@
 # mode=strict
 bad/yaml-line-length.yaml:27: example 0 [line-length] line exceeds 80 columns (81)
+bad/yaml-line-length.yaml:28: example 0 [line-length] line exceeds 80 columns (88)

-- 
2.53.0

