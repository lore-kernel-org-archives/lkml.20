Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9575342BE95
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491847; cv=none; b=snAGEU5xSecsHt/1SuBXHB1oy6GqRN1fc9QkswED8dqEVCi3M42nT8aD/xmLWEdAJzO/965bK144phT70b+mye4sUvDR8fXvjeu9uw9HNZyicqrNEo235nifwT/571Wmr+23G4k9jgf12aPHXc5sYeAQezeszqiXtHHNa5l4gUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491847; c=relaxed/simple;
	bh=xtfVDB+vdhX1n/Ql0XY2Hca90HSlWDNnO9Ce7AFybtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RIEqqEXGBXZdjgJfMbvaBzrVHyrAEw2nfYUQUX67oPoYI+oB/SQTcrSeffMUdW07H+soPhR7+xklrJ93F247TRwW9WDg2MDZWyy35pDWBuQW4KCHn5IKjlWueAWVO4Gvw8WLFxOzVsLB7pthBvoKL+fd8BA+OatN8CbhfTtguKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZwvQsEOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMH6ZgCU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZwvQsEOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cMH6ZgCU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAqrZ125509
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2wC/0i74abjzvudGIqaEmY6ilpuMA0d+d0ZW+7rV6F4=; b=ZwvQsEOHzwYeG2Cn
	lle1HZnmoEThf5v0c2UAt/1va8mBbmaQc8HOZRX2LLzIxTDMxshQLAfWi+flewm+
	vyL8wviiUhbu6+WS+bQpajpcveB1dIp0Mx/gmbfOGdsItK/38Agonuon6odWoIIY
	VJg9vBj39xsUHh98N4msm6ag00Kicie1X8x8wjArbeJQeAjljFpMS8e3pyqMbsTq
	hLt7qXJguRWz9hyrAVcjjFeTO5VvY0EX1KyI+RyjNIxIjlsJdBgOi8uFuOgt2fxh
	sC4QxiOqTqtfScXNI7xl8TWJoLUEppJLbDqav9XhsUW65If09mzF6qj3rJF2N5I7
	v10mzg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3xttd1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:03 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9806756ea40so3866193241.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491842; x=1790096642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wC/0i74abjzvudGIqaEmY6ilpuMA0d+d0ZW+7rV6F4=;
        b=cMH6ZgCUmczow/MXveRdW9+WvITtUIZTJs17XAUpafLMCjamHzTpY2yoi7gzJX6uDo
         VZFF+dB9mM6F+Mzd9Gvei+q0otdzJAK67TAwH9BJsh7dxQKJrN6z23GkhSpRxqX7jwxE
         8U37vJMK+AiB8gSyMWdGsB9pvK5UCGj3YtGrimVFLgpI9EHsR6OT33lcOW0icu2weMhs
         RhFKTe/KbfrIzvUHnd/7cq4iAJxdYxUqNlANvEyplhGp16zXTdlDtNfxTliTtB34audw
         l5D7nPkf06bxeJtM88nqc3FjKDMqtjNu1CW7UNS03YPzBgWodVfFXVmIkpGiJ8xERXuA
         i8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491842; x=1790096642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2wC/0i74abjzvudGIqaEmY6ilpuMA0d+d0ZW+7rV6F4=;
        b=SugeDzjKG0hEjYAt5WiL7rnwrK2HNljtY42hWuNmXYI6Igont+kJc91VYX+7ayTtql
         xWix1gu7f/DTlL0K2jxF9gYv/pHDkMSTCk1WMM4qD4EzykL5bNGerqhtSDanB8HJipBX
         IhvWw2IygEhUFrvAyKbgJwNjf1xIxvr4bVTuVrLIa1JKDeYvp1XFhjxqZIQj0aQ64Xme
         Z1Lffaw2ZtGd9DelBVzXeSZMTlwGfecP7olK8Jrd8VL2AhJiafgs0LVwBEcB3qNgmzMU
         +BTAZ6BTMqyrVCUZ4aUBfhdEV3N+Z7uY7obpZXzRZ6wr6iLC+Hbhd8tJEH9SH0k5rtnd
         f2lQ==
X-Forwarded-Encrypted: i=1; AKwUvByg40R0MKUaxW2b8wmfXPc/9EV1Bkh7RLHy9J8z8DznuPjJ9+FnN/3b/u0JSrWjKwhE4YIOFGiS1HRDh6c=@vger.kernel.org
X-Gm-Message-State: AFuF++mtMq/O8nJgjRssMELIfUdMlpuByDoFHOOFgdSLI508Ha7JWwmh
	WGnMjtDFt+dj3QtFKN7VZmM5v920D8vdb3fijgcPFXsKfKXFpkzC+piKV+Bxft/kj6hBonABkAH
	pvwy7ZmQSLvL7vrrZd8wx1ij/W9nH3obZSefDyUX8calzGJyOdkguX1Eo5myrrzSDA3w=
X-Gm-Gg: AYBFou3h4MI4SU2OR3QTu5YrFOj5kLE1+xHXFpo5MMIZt6cp4Ly4kNOS1sLr4z+laqB
	afsoMSVZUYD4X0DQ6XrNH2FoUuQGkymLKF4eC7CgnGSCVbcPRKWwhSZ93ydrI6wuKXcat67JjT2
	U3qfIFqMYUIIm8pvD8W1nrTBVL3m+Q/tQ+5vkZFtXHN8qocCByN7x8y1gg8ks7SIqxCRQwDlYuw
	89Ex4pWOebDHmAWhavf5CaZ03lWCqnw6mooG0tPDqzVD7hN2EZREf/CLZpZ7dTd4xrbZe/DFBrI
	Ss8IZetHHywMFmQB6LiuGc5/ZbW1eHhsMz3k+0erdtdyC6vi5BZ3UTWJpRGfMOYKyRA/DOYQ8K7
	tNMOoWGUx8oPEkeKjlE48iaw=
X-Received: by 2002:a05:6122:6401:b0:5c9:983e:79e4 with SMTP id 71dfb90a1353d-5c9983e93a8mr666717e0c.7.1789491842606;
        Tue, 15 Sep 2026 10:04:02 -0700 (PDT)
X-Received: by 2002:a05:6122:6401:b0:5c9:983e:79e4 with SMTP id 71dfb90a1353d-5c9983e93a8mr666649e0c.7.1789491842255;
        Tue, 15 Sep 2026 10:04:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27df9sm391286f8f.19.2026.09.15.10.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:04:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:03:46 +0200
Subject: [PATCH v4 2/7] dtc: dt-check-style: Handle continued lines in
 check_line_length()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-dts-style-checker-continued-lines-v4-2-5b8e09b11ef2@oss.qualcomm.com>
References: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
In-Reply-To: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4091;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xtfVDB+vdhX1n/Ql0XY2Hca90HSlWDNnO9Ce7AFybtU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqXp2WM4JJQNSH2RzIJ1h7dfV7/iAkRFBCSmSp
 JUFM3w2OciJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaql6dgAKCRDBN2bmhouD
 14JSEACSyZyTkfL3i8/MxfguupqRACcSnvAuKAZ6A+xtnLpjaKpLB8F8PZ8zSfbCIev73FZ5Urk
 73ieD7+CpwndVKx/D7yvLg0iJGq+PR9Bl4TdCH1Nf6+ZyOaL6gsD1nFd5lBpY4vLAhVF2SVIG1x
 RPwSzJoUk3xKVY5LxbDJWh8EYqaZru7WnO/hkbRGt7qgJQRF2HuMZaE5y8XSL8c2gyriyWhe/BA
 7eJN8eGOVeB7Du6Ti4uGWRGq3jPYcIbgkwme7iMQmWpNQ5rCKixZp3i1yPlOmKw24qkw+vrmMkE
 fgodacVTzrf5d0SRJeSYLleR887bDzJU7HhpiI5SpPMEM9MZpVVgtW0VncAXwQx2ETt2nu1MOrR
 uN/VTRxbp61KXk78NSc/rdLgMSBwD4Q0tVJVPsePs2v/XMATxC9gDNLYLbxH9rGODKixZAFzHVU
 RsVF5ZwkFiKYQe1xLSxmB1qbpuSvNjr6rMrZwKzMxBaxokY7Rd3g4qrVTyedzsF7C0hUauM5Jk8
 mBXBs8aOKGz884t/dTIIBajcBgXqJS5i8I3Vv7VZzHqX8aENsrQ01/qdBvKOASpaDp46+kS/1nW
 lTYLDU3kuJmG+3gP2Ja8ZaFEtKakdG750vrcon1rRm6s+dn2WXe22toluwPNYjr5ajO6fzVqYva
 ykArcjKADr9kHwA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: tVW_ui2SEbRicZxzZs-eIrfoePC0xEl3
X-Proofpoint-GUID: tVW_ui2SEbRicZxzZs-eIrfoePC0xEl3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfX39eA3SGffr9P
 z60FHI/EAQDDQTrEXT9oflYv8jzy/zK34wVP2hxf2e+d0UQeMTQ9IOBWHu6hNPXzXklGpFBBdSN
 E43WAhYm5FCMWuL3bMPwXvnAOMCYaGg=
X-Authority-Analysis: v=2.4 cv=As97T+9P c=1 sm=1 tr=0 ts=6aa97a83 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jHdmtohXv_5nRK-EuSoA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfXxrs8YoXPwifA
 XBmNXI1XPoSPlm4Qxv+p1a3gXgIFNkDbj/vHeXZphszw+Fz4vYnmG6zewL//wazchU11pPHgPJp
 oJ3Iwu7h+dhk2oc5U9aRvwZJMBwa8cFSdtJ4D9vpaT3pZdKHCj/7i4Fy6AjCS9t8EwjBbRjaJC4
 liNX55IAzojENh4Bc9Cz90dLwQjcN9VsuuihMfqwI2jvTYo6VK2PAp1ytFOnsILmTBq5ryDI5sK
 zPBEP3vrijuPigRxI8+0n+w5nlyNX46/P/a8RpW2Nzk77AW2EYD0aYZFDm2TA76RzQ0/EFRAcl+
 eIqkCrOBaZ7VI8vKL5nIFsEyWtPD3Z3AJ+oWVzK6ky+Tc1Vk+BiEt2ZjF7333/l2jyfRoU6tdGm
 n4yeCUkY/G284iBxj8Df7cb/RQxBeJIllzD/pADyRv3ZTnAOHbudnFyvemy1tU1kuihRBpdZQyf
 In5VhBFeBEmpgRpMzew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150249

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
index 2d0463c626e5..525d9df6c11b 100755
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

