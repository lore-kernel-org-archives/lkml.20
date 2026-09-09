Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A8055C1C5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959455; cv=none; b=h5R49W0qgWX6YRuNUWjPZIgEbxZ0eKGfaMbvaos8WfL97w1DbrgjX0/IOv3Pn3N9VZQ2ac9qx2ZnwA35tR7plCzUf+DlqZtgvSP3ueJCo8wW8okNCyUkxTw7XIOF16jvZD84M8YE23ahUWuF0M3A67R+72o219qWtKkMB3brOdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959455; c=relaxed/simple;
	bh=RpsFWGOJ/fmrFBjXtNLPVOkO7viH6czPpMx9xQdFNUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CjEtPFXnzXw3g05cbbBs8m15rDvmk8ewaZW0MGM0JDnSGQ1V8XZU6ShKYt5F7JfdD9IVd4pkCNqVHIvlpDEpEbIe6bY8PcdBQlF1qOnG046S9VHKLoPdsxuI7+JL+ssyuKPw8ZHk2OxAy5r2YIyGFrqrRp0ejxFWVjr1/uatY8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsX90+vQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTh8gmmH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsX90+vQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTh8gmmH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU6tO599819
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 13:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOiYjCn1nD7fLf7vrzvPOq3oVs5fH9mikkYiajsOtfs=; b=GsX90+vQgNeqZyYT
	+9SmXGdRPw1ydqlxMOA11/b9kXzdBwqWjeDuKpkBDgfPJIkANLJeS/0QzwttE6v8
	fFRZyQCQdueriBqQpHcGv+7C3/vHxFdszhU1Nw5nISpT7auHui7algIavcZD18Bk
	sSozE7RC3QV2mFhfb+fNMzidMsP3inx2u6QqNck1rMPVAv5e3RR9KH4GGFV/EhS9
	WrAdaGy2w/8takYnb9r/2RUBpNvUaKhGvj7INx3VW3T2Utcpagck0hcmImMbFNwV
	JInyh/JM0PmhnHMwA2ZMfY4jgFPUKt7veFVACCKzD2WeHmDuzI923uXZnIeq0TBF
	3UiczQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr22pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:10:52 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97cc09260a3so4996451241.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959452; x=1789564252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOiYjCn1nD7fLf7vrzvPOq3oVs5fH9mikkYiajsOtfs=;
        b=jTh8gmmHJtxwS5xJxJ5nZHBOnaEYT4nlgwoF4hycQQbOWwbjEvXGZb75dG6GADcYhx
         d6FqGy8FHJlXAawnnskI8fV9hzqgPxAquq4jGwhZWWWo7Uodx3MiOYfSF71cYScfThbX
         BaEVMb/7EqaEfyIF0Ov0gtzYkGJcjXSH2yQL3rey9mxNlNy6xdkZlA2C8rhI96+MVHw/
         DT2iJcOAKJGfX3+C+Ms13frW9vKQPI3gVj4oGWQ/7Y5dgPdVYA0D9JTCVH/EPUjLyRiy
         F6tDQzHnQmDxrNCapumpAzn9P1wE6ACWi2yDFDhwPqLyovrkh8B32U6vbXHaK0KWKKaI
         +Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959452; x=1789564252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOiYjCn1nD7fLf7vrzvPOq3oVs5fH9mikkYiajsOtfs=;
        b=DtFzDgJlijfe+jzIJdc3xeLehAPOVUl2ad0YGnnDlKuue3mkrZTJBN8qV42Y1ydtCi
         DFRGSsaRUWFc1m3X5GGVB81Xl1z1UVA8aqOe7kKSkC1xuIP0GhZWzOUoz8dZ1J1L/+wg
         vfdtoFc/hr5WiNt0KttQbqLFZoLIR4vz3JrJWMH/yRdKpkQNMKi7kRP27tfCuwMPP4kX
         MJPvf/FbYxTgJxPzqQ+hW79KP5rP5tJ7PEPAyMWxifsR9WY/HRsPL3ypDTHl7P9CHjBj
         5eQoXfV+dyCX4nCLuxGiOvqn6YbegSVHjHcHBsP1WbQCO/EGLHtjZNRogbEPOISU53yz
         uqrQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7FjnQhAeSd3SJw43B7IskhKcfaGLftjf60muVRZMZz5Gea6Nyzir/RadEthaqXV8VhRnBeCrb4HWx96I=@vger.kernel.org
X-Gm-Message-State: AFuF++mpzA6KZnm3HiCPJvqich30bwNGU9N2t40sRUl2B7bj6czjcvjS
	BXcuV68hBYxap76OAmjOnUhKooC72xsR95wE+SvMD5z5IALnxFQi8I2Bw9dJlYKnAUXfssvfeMZ
	AruGNTS8abiW5sWfe6dm2X5v1vgTiCJD4y3OADBGnff8PBD3ljSzBof1HMlTsG24uDRo=
X-Gm-Gg: AYBFou3+flmBlsHByiXv4MHsjVP2HxoxgQ0Epvnqkuszzkrer91M8jGvxsSzFMiH3lp
	NHWY7s/atnWMiOs+q6kKtCQ5/2fvCAMoM1OUEfwLFD2V/YwdExHElbMRjgcOoZbSfP2CLv9Lpjn
	fNWE6DJ0IPPtBge1FjR96b0wPHY+A4f+d0T7t/eq7M0MuIJ9vhWIVISHfSZTeQZLfAkgkrIeM84
	NjlJOk8iIGaksB0NYX3fxLZDaDvTDaZnd4NXhzm5mzBRiLI7fByzprZ0ssvfHIPCHtYjwD4vaDl
	X+cdivGLhYnhSjG3hS0Cwa793ItXNkLkjbuoZaybsd9cpOhSX/S2hpGN6DYx7A99jhn9nwbB0Ap
	VQkRGHZI5oCWwBWCQlsDIsp4=
X-Received: by 2002:a05:6102:8345:20b0:777:2e1b:1e2e with SMTP id ada2fe7eead31-78a2ed7ca4fmr9287147137.3.1788959451828;
        Wed, 09 Sep 2026 06:10:51 -0700 (PDT)
X-Received: by 2002:a05:6102:8345:20b0:777:2e1b:1e2e with SMTP id ada2fe7eead31-78a2ed7ca4fmr9287124137.3.1788959451336;
        Wed, 09 Sep 2026 06:10:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8993253b3sm114594e87.52.2026.09.09.06.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:10:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 15:10:35 +0200
Subject: [PATCH v3 1/7] dtc: dt-check-style: Handle continued lines in
 check_hex_case()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v3-1-474bb324ae53@oss.qualcomm.com>
References: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
In-Reply-To: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3317;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RpsFWGOJ/fmrFBjXtNLPVOkO7viH6czPpMx9xQdFNUs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoVrPGXfUuPtdBIpfItRIq/8faBDqEUXCSWvZT
 LWnktbR13+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFazwAKCRDBN2bmhouD
 12NRD/9skTUTazeBJO2H3VYgfmwxCp94eur2xV3GMbMDIbzjQE73Rc4AUHme8Nn0ezdmJTDhBaN
 zjGaq0lVyiQn6HQhVWcM+90hM11q+aAMk75Nx1ClAN5S2uWvh5REBaXSDh9EXxYBTgiVhdr/Xv5
 pn8HTez7B0SlhZU0mDIlDPBvTyuUjwOfLO2HAZIu2lBD+isXl5Ue6GBIQz5pFW60zT011bxVbVs
 qEkGcEJMcMuEAgvXSYOzgWcxBZfgLvcwEfnekmzhuD25LQZJH+HZzFLQsezR15pSy7Cngz8g9+M
 HINbPYV6cJtFhvXv/LydWlLtnQEdYQ4L1odQMoUmW4sUGC6nMPb1ZpwuHHOkCr3mjX8TSp95n24
 9KVN6Gxpob9egTuuRM4HZ0MqTDEKUW1fn8HxKm73RlX1C0zNNPnr+91ET8LKixDYXeXYbMumnQt
 KoEwVt2vMoIMDc9yrBKrv6OGdczRWzDS8DWsymp1C2Dbk/yhpjQ3pyYR/poTPsMzE0RGWQoqQcZ
 pk5SLFElXykoaHT4wsjGRwai14CiONt76lUYzDrUfMULlJYMzTgXx1j4k5XhHUNsIMDmbqdclIO
 UPqtGpDC572VE9e0MxD9/2i0twXlDLFUSR8AX4LPK3VI04JvUYzD8B2wnVj29hKsy9maisL9vTh
 9ohGlbXM0UhUHxw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa15adc cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SU40fdrgiSb2mxkwluUA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NyBTYWx0ZWRfX04eIBcsG7cWh
 48eZIK+WTKanwMZQWCqCIVQH0QSJbjUySYC0+O5c7Iu5lKIrBYPc6uDXVFG8+pvV4sVwXZeoy/p
 X8Xef0/zST9WP2Gqxadj/QnRbGz/8BFynV8XuaRulsPD27kdMKkt0l36M5mLrHxjT44R21VZHlv
 E/lrSUCo9bJKvDrlgwKrikznGfwTrm8LW6iGSmLlNcMAFnhCuNdhwbyNzoLy6bPvLjWOuU60iNP
 6G/RZKBBeOg2H7b+zKG5w97E36/lHle3lED/VQy9M9C8TEQNPL/+un1InPlQde/pvMblgvDrGZm
 34d3frzZsPIOl2dX4wEfjVMxtMJ6XlcdBrTVNODyxKo91FTA48qXvT9w+v5h7Vhns9qPdAeyQj7
 4VrWXf51VORC89yv5lHFrqUH1nGm16BGzLrSochqOxqHi454dCVdsJ5YITCoB4EPSBmZ1TWBHoY
 Ub6QWqCk3a8vFJIpcVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NyBTYWx0ZWRfX0gsOLzCQ8ldp
 8qvNMvQZtqFumq3p14CeHTNmpD4B8Zd6v7xT80DebiFbpJxFk/6awhw7fQqb6knjCFqCXu8Uo70
 RFu3sNMUcAepyBkL3Rb9bwolKqLeaZQ=
X-Proofpoint-ORIG-GUID: ioV-MtIRtp-zRBKhBaXU7RmWodkGY0KF
X-Proofpoint-GUID: ioV-MtIRtp-zRBKhBaXU7RmWodkGY0KF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090147

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

