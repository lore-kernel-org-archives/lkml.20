Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C3E3F8250
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788033224; cv=none; b=Gg2xwNKSduhhWU3Ubeddaah0YgQywHG98Q2pcewMN+0c/wgNrRSfEBavyC4UvgUSc6sbWHkRcWVV7RvzsIwYj+LYwUB/lfbW/gso+kqdgq9FdEHZa2v1JOn3+/bCXhCvKlDpRJ0RPB/uOf/pclIqW/3k8Y3QTzXI+cF+SBPgnzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788033224; c=relaxed/simple;
	bh=3D23pkruwVdjlWXcvI4IbBb/R1IKkVVvnVyarpPlI+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PW0S7pcj7DQiwT5EiwQi3MW5o/mrSRHEBU+feer8peeYTGKY3KqLHEQLexxQpbVtc9XfBOebyUJUD/jQze1Ugy4cmSI2cLk1AHkCttc3Q6rxQDqeWTEvaRCu/DTUanrHJ7fr6a7aZmtaE6Zz6NWS/O36Q/ER4dvtzj7r0IPDgBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mv/+Wr2C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VIt7DBfM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mv/+Wr2C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VIt7DBfM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TJkcaL2196479
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OBfa2YKDANgkRg0aGIM/I1Kyr4RJbFdYeKfNGHAAmpQ=; b=mv/+Wr2Cljb2KFAR
	RjzDTi6mlPrH68U7ejmX0gm2q91i20P7HEcF45lzwOZcOjVwo8pCYTWWiboDAwfu
	pEp1UWIsJN4E3tKmckblEVvi/CahItJ7BJvCDYUiA1nTpcsgXrqANsfiEQDDxXch
	xsPlzcRIwOnfH2NnPrChrr3baPYTkT41fDqjlrhnwnxoseYmZbgjl2kiBHwCoev/
	Y0Y2nehfxK2XB7LNOgUcCoJNqnkfo7yndaP8IlJypzGSpagQSeor2bH4Lgv2tHRp
	RNdQGWmUNIfiOVVbS0UIz1nUf3ZZIeMlt6i8joNJYY+ffoqEUiAcL8UvM2KVCHMa
	l7HeOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dsjsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:53:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fa5c5a4a6so50086661cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788033220; x=1788638020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBfa2YKDANgkRg0aGIM/I1Kyr4RJbFdYeKfNGHAAmpQ=;
        b=VIt7DBfMS/GBNmHeBlxtR5CFmUKNliG0T4J2PRHLceCyZKrnCTFWFXJHyUEBslEAbb
         sull0ISuwigSKQtRjlRKBdv0+KUDRS8rs4Dx115bT5adCZAVvpaThyoY2EsvwzxiUcra
         m8QTBSjOMwhTdv16nlFQPNRzHvzbi/ooSmynZ8jgxkZy2IbiELj71NVtt5o/PWNFuAku
         DiAepkPewbWIQBTD2+5y1oTWUx2aKdCHsmXPRzvRb8uZdy3/TNtAVLyLFAR3Uio7Nx45
         RzrGLAll0Oz8WnhFOVpRnrcrhQUt8C7D5ddDWFvg7wnrh9zH+Q6kbisHEO6fVCjLEvZs
         eiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788033220; x=1788638020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBfa2YKDANgkRg0aGIM/I1Kyr4RJbFdYeKfNGHAAmpQ=;
        b=X2orG3wn8rLg4NjwmbcbRk8TYdrx/NaDsjwzhGSGRdkPW1YdCrWgti/3XqphsJC6hI
         GdswSJX6XT5PYL3gHZVqYinDqYSJmXCPtUzux7pWE43Fon8mRttTXYJvFpeKhRw0U5/9
         zY44hbjnPh2qJOf6uYicFy5Vuodyh2czMu8VCKF9thwrM75vwKZf8RRAZosuMotOaKc4
         yNMz1xZjJKQmyrXHXaacd6c3bDLifhJzqAaC2wjjUTc7CSFE2CXH2uFxsvN9o2hnIez6
         r8FxVTP03FkdMONK1ZQeNzLlBAWfWMzx+l/kaqJ6Z4b11XKbqLXuUMus1OI8l2TGAfjU
         ZpcA==
X-Forwarded-Encrypted: i=1; AHgh+Ros9h3YxyVdewrXjVg+CEDeLz2aW1liMPupyAhAFoOIygiuQdZNJgv6ExPILSzoh4yTTV74ZXwVwV06d7c=@vger.kernel.org
X-Gm-Message-State: AFuF++lzMgs6m79EriTDNgYgH94qUyZ+7xDubhcHC9fErGUyoLn51I1z
	wp7CODx7PyRXXigYQ1pdurX29YaZh/XJXenNhMsb3njmwq1+8zKnD2s93Fy87g8piynGQwmEw4z
	sA5WmwzPAjiz1Pmy3NYGzlnidQZx6d4NO23Vja+1ullID8YlOW3RC9m12NaMpLxFiP87uYH9IzV
	8=
X-Gm-Gg: AR+sD10nWEfidib+cdiDp7Bv9ice7qCIGv8j98bg/3+xbJTUaXKB+vRV0WHksrEmkh+
	aDkq9cLG4gGGnLmuuMfVMIisUaK4TBJnU9LXXY0IB9lcWWM6VMB0iXj/TpFgtMcuZ7JxfRceqTE
	UtC13R3iE2tkEszNGS2pKrMvBOz3i213sF1CnGfe12Ta1u5BijucyHzVtHZuD7OqRkbbArpUOhc
	9LFU5goKOmc+9mnPqVshG4rle2j3OKEA9sQzR9xncup8Aef5c53ecY6HG4mc7XrD697xMsKlE2r
	XL48McmzYu9D02G3YQXvWrvcgpZgfB96BejiKYIvZSmSzaYnDNxbU/BKXIOqSrrDk6QgWCTiWfM
	+BlVaz6f7MiksrYfDIlXlSZQ=
X-Received: by 2002:a05:622a:e3d0:10b0:52f:fd65:d939 with SMTP id d75a77b69052e-52ffd65dcf0mr33364751cf.22.1788033219514;
        Sat, 29 Aug 2026 12:53:39 -0700 (PDT)
X-Received: by 2002:a05:622a:e3d0:10b0:52f:fd65:d939 with SMTP id d75a77b69052e-52ffd65dcf0mr33364391cf.22.1788033218834;
        Sat, 29 Aug 2026 12:53:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb32d30sm12446343f8f.34.2026.08.29.12.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:53:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 21:53:18 +0200
Subject: [PATCH 2/6] dtc: dt-check-style: Sort rule functions by name
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-dts-style-checker-sort-v1-2-6693a37d7ae1@oss.qualcomm.com>
References: <20260829-dts-style-checker-sort-v1-0-6693a37d7ae1@oss.qualcomm.com>
In-Reply-To: <20260829-dts-style-checker-sort-v1-0-6693a37d7ae1@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=28485;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3D23pkruwVdjlWXcvI4IbBb/R1IKkVVvnVyarpPlI+M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzi0a59a889rpZkJp5cnFoxlST+fE1GujDmhN
 xsp62BksSuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM4tAAKCRDBN2bmhouD
 17Y8D/wMCfl5dOLSYHAsdgx71Tfxgd1svmgEnFoAnLEMHe2Mc6VR6yBpI2LjCprzU4cdofSwkpk
 4is3DMscUzUvzGTph/b0TjB1+P7LA6fnEMXids/tTVhcakmD7vru9Rm1gQXY44+UC2Avmq47UPb
 aVYqL4EcCJDGfWzMfjbf/GSfJXOrdE6+tkyGFPzIwJrrDtiSTdPR2XhL0dzVYiJ1onQPOiXdh7F
 LiRL3qmEtWFNnItO5n18FyYx6+ytSkFeduOMePIGjCj4rVcjUrnYFB7FrAFGrB5rtR3J9kSm/Bl
 V+6jWi4HiyggBpjW/nil8eR+C7lUpzE5d3v1sS5Xun+Vh09Khb6J3ghumc22FxcuTbscNp64BxZ
 2FNBDNwgAQB6O8Q2X602NZMDamt6ipZVBEbB5zxj6vGvly7j/3MLNcXBGDM1aS2Vot+UxB4aDNZ
 J6DzGOy0agFf4DC0Qdj8c6KG2VyC7PRpvVSMfx5ovsEBmdeunktj96KS3b0po8zExr5CznboQsM
 DWjwUP0NjRJswWYjzvskAd88vpDzPGTuGFPRfw4aJh8CZphG5tX3tzcjPN1iWltHPQY/17eXrQy
 DHKx2qpIQ/RNkahvxPQNCjSMPfdxYro38gUi2wxQTolqTD8ErEuwXzO/VcsABfeqoQa1GbwL3UD
 mXFsI0ttcowJs+g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MiBTYWx0ZWRfX8j4+z/bm82IZ
 ahiqL3HJ+TjHaEnGZMPzj3nneaXW0oB4gZB3hsftamlgX1rt7gvy7H8BdTaEmOGgywqaHWNCPmn
 p7ogj1SCXFiK6J6cjjHmcDLt5DsEgtCaaziQ7dHYHHZwB6QgNuyMC0x1zEJ/K0Ubz0050/kirYs
 xblM4B9W5ItQB/nSQa1BF8jQry6Bpcn5tS8HWsOmuXCY8d3qXma0GnSYJMXcqoRz3/yp1MX+UNw
 O3fz/6XQavLkBGvOtJ2Fd+eBiwK7aNR5Ie3LK5gotvR4zXkzhDhXDFA+B/PiMe/MWZXM7tF6Dye
 j4TESHve1ybGBvTGCMMzDCL5XWPAO+mPBlvWh4y2TwW0BpKR4w703irq9NHI34ugMabE1QF2QuY
 i3KEhLwldydmdm90exSbQcpfHnNpIvbsDcYB53e0YXAKYp1ypeV4Kgp7z2/UQ6s1SdDgv+ZKpaB
 o68i8TZgQrkAsARRuog==
X-Proofpoint-GUID: GLIySzdJssZy-IWU-jj_AGwJ8MSkivWl
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a9338c5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Z9rIwXeQ7yUTy2gfAJsA:9 a=ib9xVW6GgGiRPqfr:21
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MiBTYWx0ZWRfX7MSdIOm4KLXw
 mUH1j+/IHARFO9SxhYfSCVI+gyypcVvM9byCuk+yC9M85JWrxiQmYJItCrKAgpLrH01XwwECa7N
 0lXH1+SvB9XGJwcvLEaZ6ejbcUcClHg=
X-Proofpoint-ORIG-GUID: GLIySzdJssZy-IWU-jj_AGwJ8MSkivWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290172

Sort all the functions implementing style rules by name, so managing
this will be at bit easier and simultaneous addons of new rules less
conflict-prone.  No functional changes, except adding underscore to
_detect_indent_unit() to match other helpers used by the rules.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 607 +++++++++++++++++++++++----------------------
 1 file changed, 304 insertions(+), 303 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 49b5c28563eb..5385a03f377e 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -343,88 +343,8 @@ class Rule:
 
 # --- individual rule check functions --------------------------------------
 
-def check_trailing_whitespace(ctx):
-    for dl in ctx.lines:
-        if dl.raw != dl.raw.rstrip():
-            yield (dl.lineno, 'trailing whitespace')
 
-
-def _check_redundant_whitespace(dl):
-    if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
-                        LineType.COMMENT_END, LineType.COMMENT_START,
-                        LineType.PREPROCESSOR):
-        return
-    if re.search(r'(\s\s+|\t)\{', dl.code):
-        yield (dl.lineno, 'extra whitespace before {')
-    if re.search(r':(\s\s+|\t)', dl.code):
-        yield (dl.lineno, 'extra whitespace after :')
-    if re.search(r'\s+;', dl.code):
-        yield (dl.lineno, 'extra whitespace before ;')
-
-
-def check_redundant_whitespace(ctx):
-    """No whitespace between brackets or other code elements.
-    See also check_value_whitespace() for more checks."""
-    for dl in ctx.lines:
-        yield from _check_redundant_whitespace(dl)
-        for cont in dl.continuations:
-            yield from _check_redundant_whitespace(cont)
-
-
-def check_redundant_whitespace_strict(ctx):
-    """No whitespace between brackets or other code elements.
-    See also check_value_whitespace() for more checks."""
-    for dl in ctx.lines:
-        if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
-                           LineType.COMMENT_END, LineType.COMMENT_START,
-                           LineType.PREPROCESSOR):
-            continue
-        if re.search(r'(\s\s+|\t)=', dl.code):
-            yield (dl.lineno, 'extra whitespace before =')
-        if re.search(r'=(\s\s+|\t)', dl.code):
-            yield (dl.lineno, 'extra whitespace after =')
-
-
-def check_tab_in_yaml_example(ctx):
-    """Reject literal tabs in DTS lines when input is YAML.
-
-    For YAML examples, indent and content must use spaces. Tabs inside
-    a #define value are tolerated (those are CPP macros, not DTS).
-    For .dts files, this rule does not apply -- tabs are required.
-    """
-    if ctx.file_type != 'yaml':
-        return
-    for dl in ctx.lines:
-        if dl.linetype == LineType.PREPROCESSOR:
-            continue
-        if dl.linetype == LineType.BLANK:
-            continue
-        if '\t' in dl.raw:
-            yield (dl.lineno, 'tab character not allowed in DTS example')
-
-
-def check_mixed_indent_chars(ctx):
-    """Indent must be all-tabs, except for aligning indentation (comments
-    or continued lines)."""
-    for dl in ctx.lines:
-        if not dl.indent_str:
-            continue
-        if dl.linetype == LineType.PREPROCESSOR:
-            continue
-        if re.search(r' \t', dl.indent_str):
-            yield (dl.lineno, 'mixed tabs and spaces in indent')
-        if dl.indent_str.count(' ') > 7:
-            yield (dl.lineno, 'too many space characters in indent (more than 7)')
-        for cont in dl.continuations:
-            if not cont.indent_str:
-                continue
-            if cont.linetype == LineType.PREPROCESSOR:
-                continue
-            if re.search(r' \t', cont.indent_str):
-                yield (cont.lineno, 'mixed tabs and spaces in indent')
-
-
-def detect_indent_unit(ctx):
+def _detect_indent_unit(ctx):
     """Find the indent unit used at depth 1 in this block.
 
     Returns tuple of string (one of: '  ' (2 spaces), '    ' (4 spaces),
@@ -450,85 +370,42 @@ def detect_indent_unit(ctx):
     return (None, None)
 
 
-def check_indent_unit_relaxed(ctx):
-    """YAML examples: 2 or 4 spaces. Never tabs or other widths."""
-    (unit, lineno) = detect_indent_unit(ctx)
-    if unit is None:
-        return
-    if unit not in ('  ', '    '):
-        yield (lineno, 'indent unit must be 2 or 4 spaces, got %r' % unit)
+def _display_col(text):
+    """Visual column width of text, with tabs expanded to the next
+    8-column stop, matching how printf and most editors render a
+    line and the kernel-wide line length convention."""
+    col = 0
+    for ch in text:
+        if ch == '\t':
+            col = (col // 8 + 1) * 8
+        else:
+            col += 1
+    return col
 
 
-def check_indent_unit_dts(ctx):
-    """DTS files: 1 tab per level. Always required."""
-    (unit, lineno) = detect_indent_unit(ctx)
-    if unit is None:
-        return
-    if unit != '\t':
-        yield (lineno, 'indent unit must be 1 tab in DTS, got %r' % unit)
+def _natural_sort_key(s):
+    """Split a string into a tuple of (kind, value) pairs that compares
+    numeric runs as ints, so 'foo10' sorts after 'foo2'."""
+    parts = []
+    for part in re.split(r'(\d+)', s):
+        if part.isdigit():
+            parts.append((0, int(part)))
+        else:
+            parts.append((1, part))
+    return tuple(parts)
 
 
-def check_indent_unit_strict(ctx):
-    """YAML: must be exactly 4 spaces. DTS: 1 tab (same as relaxed)."""
-    (unit, lineno) = detect_indent_unit(ctx)
-    if unit is None:
-        return
-    if ctx.file_type == 'yaml':
-        if unit != '    ':
-            yield (lineno, 'indent unit must be 4 spaces in strict mode, '
-                   'got %r' % unit)
-
-
-def check_indent_consistent(ctx):
-    """All indented lines must be a multiple of the detected unit."""
-    (unit, lineno) = detect_indent_unit(ctx)
-    if unit is None:
-        return
-    if ctx.file_type == 'yaml':
-        if unit not in ('  ', '    '):
-            return  # let check_indent_unit_* report this
-    else:
-        if unit != '\t':
-            return
-
-    for dl in ctx.lines:
-        if dl.linetype in (LineType.BLANK, LineType.PREPROCESSOR):
-            continue
-        if dl.linetype == LineType.CONTINUATION:
-            continue   # continuations align to <, not to indent unit
-        if dl.linetype in (LineType.COMMENT_BODY, LineType.COMMENT_END):
-            continue
-        if not dl.indent_str:
-            continue
-        # The indent must be 'unit' repeated dl.depth times, exactly.
-        # NODE_CLOSE lines have depth equal to the post-decrement value,
-        # which matches the indent expected.
-        expected = unit * dl.depth
-        if dl.indent_str != expected:
-            yield (dl.lineno,
-                   'indent mismatch (expected depth %d * %r)' %
-                   (dl.depth, unit))
-
-
-def check_blank_lines(ctx):
-    """No two consecutive blank lines, no leading/trailing blank lines
-    in any node body."""
-    lines = ctx.lines
-    # Consecutive blanks
-    for i in range(1, len(lines)):
-        if lines[i].linetype == LineType.BLANK and \
-                lines[i - 1].linetype == LineType.BLANK:
-            yield (lines[i].lineno, 'consecutive blank lines')
-    # Blank right after { or right before }
-    for i, dl in enumerate(lines):
-        if dl.linetype != LineType.BLANK:
-            continue
-        prev = lines[i - 1] if i > 0 else None
-        nxt = lines[i + 1] if i + 1 < len(lines) else None
-        if prev is not None and prev.linetype == LineType.NODE_OPEN:
-            yield (dl.lineno, 'blank line at start of node body')
-        if nxt is not None and nxt.linetype == LineType.NODE_CLOSE:
-            yield (dl.lineno, 'blank line at end of node body')
+def _strip_strings_and_comments(text):
+    """Remove string literals and /* */ + // comments from a single
+    line, replacing them with empty strings. Used so syntactic checks
+    (whitespace, hex case, etc.) don't false-positive on contents of
+    quoted strings or comments. An unclosed /* on the line is treated
+    as a comment running to end of line."""
+    text = re.sub(r'"(?:[^"\\]|\\.)*"', '""', text)
+    text = re.sub(r'/\*.*?\*/', '', text)
+    text = re.sub(r'/\*.*$', '', text)
+    text = re.sub(r'//.*$', '', text)
+    return text
 
 
 def _walk_bodies(lines):
@@ -559,16 +436,25 @@ def _walk_bodies(lines):
         yield body_stack.pop()
 
 
-def _natural_sort_key(s):
-    """Split a string into a tuple of (kind, value) pairs that compares
-    numeric runs as ints, so 'foo10' sorts after 'foo2'."""
-    parts = []
-    for part in re.split(r'(\d+)', s):
-        if part.isdigit():
-            parts.append((0, int(part)))
-        else:
-            parts.append((1, part))
-    return tuple(parts)
+def check_blank_lines(ctx):
+    """No two consecutive blank lines, no leading/trailing blank lines
+    in any node body."""
+    lines = ctx.lines
+    # Consecutive blanks
+    for i in range(1, len(lines)):
+        if lines[i].linetype == LineType.BLANK and \
+                lines[i - 1].linetype == LineType.BLANK:
+            yield (lines[i].lineno, 'consecutive blank lines')
+    # Blank right after { or right before }
+    for i, dl in enumerate(lines):
+        if dl.linetype != LineType.BLANK:
+            continue
+        prev = lines[i - 1] if i > 0 else None
+        nxt = lines[i + 1] if i + 1 < len(lines) else None
+        if prev is not None and prev.linetype == LineType.NODE_OPEN:
+            yield (dl.lineno, 'blank line at start of node body')
+        if nxt is not None and nxt.linetype == LineType.NODE_CLOSE:
+            yield (dl.lineno, 'blank line at end of node body')
 
 
 def check_child_address_order(ctx):
@@ -624,6 +510,172 @@ def check_child_name_order(ctx):
                        'child node %r out of name order' % dl.node_name)
 
 
+def check_continuation_alignment(ctx):
+    """A multi-line property's continuation lines must align their
+    first non-whitespace character to the display column of:
+    1. the first '<' or '"' after the '=' in the leading line, if continuation is with '<' or '"'
+    2. the first value, if the continuation is still the same phandle.
+    Display columns are used so tab-indented .dts files (where a continuation
+    aligns with tabs plus spaces) are compared correctly."""
+    for dl in ctx.lines:
+        if dl.linetype != LineType.PROPERTY:
+            continue
+        if not dl.continuations:
+            continue
+        eq = dl.raw.find('=')
+        if eq < 0:
+            continue
+        # First '<' or '"' after '=', but ignore comments and strip trailing
+        # whitespace (e.g. remaining after removing the comment)
+        rest = _strip_strings_and_comments(dl.raw[eq + 1:]).rstrip()
+        m = re.search(r'\s*([<"])', rest)
+        if not m:
+            continue
+        dl_value_complete = rest.endswith('",') or rest.endswith('>,')
+        target_col = _display_col(_strip_strings_and_comments(dl.raw[:eq + 1 + m.start(1)]))
+        for cont in dl.continuations:
+            target_offset = 0
+            err_msg_explanation = 'to < or "'
+            if not dl_value_complete:
+                target_offset = 1
+                err_msg_explanation = 'to the value under <'
+            if _display_col(cont.indent_str) != target_col + target_offset:
+                yield (cont.lineno,
+                       'continuation should align to column %d '
+                       '(%s)' % (target_col + target_offset + 1, err_msg_explanation))
+            # Align to the value within <> or "" of continuation (so the previous line)
+            dl_value_complete = cont.stripped.endswith('",') or cont.stripped.endswith('>,')
+
+
+def check_hex_case(ctx):
+    """Hex literals (0xN) must use lowercase digits and prefix."""
+    for dl in ctx.lines:
+        if dl.linetype in (LineType.BLANK, LineType.COMMENT,
+                           LineType.COMMENT_START, LineType.COMMENT_BODY,
+                           LineType.COMMENT_END, LineType.PREPROCESSOR):
+            continue
+        for m in re.finditer(r'\b0[xX][0-9a-fA-F]+\b', dl.code):
+            lit = m.group(0)
+            if any(c.isupper() for c in lit[2:]) or lit[1] == 'X':
+                yield (dl.lineno,
+                       'hex literal %r must be lowercase' % lit)
+
+
+def check_indent_consistent(ctx):
+    """All indented lines must be a multiple of the detected unit."""
+    (unit, lineno) = _detect_indent_unit(ctx)
+    if unit is None:
+        return
+    if ctx.file_type == 'yaml':
+        if unit not in ('  ', '    '):
+            return  # let check_indent_unit_* report this
+    else:
+        if unit != '\t':
+            return
+
+    for dl in ctx.lines:
+        if dl.linetype in (LineType.BLANK, LineType.PREPROCESSOR):
+            continue
+        if dl.linetype == LineType.CONTINUATION:
+            continue   # continuations align to <, not to indent unit
+        if dl.linetype in (LineType.COMMENT_BODY, LineType.COMMENT_END):
+            continue
+        if not dl.indent_str:
+            continue
+        # The indent must be 'unit' repeated dl.depth times, exactly.
+        # NODE_CLOSE lines have depth equal to the post-decrement value,
+        # which matches the indent expected.
+        expected = unit * dl.depth
+        if dl.indent_str != expected:
+            yield (dl.lineno,
+                   'indent mismatch (expected depth %d * %r)' %
+                   (dl.depth, unit))
+
+
+def check_indent_unit_dts(ctx):
+    """DTS files: 1 tab per level. Always required."""
+    (unit, lineno) = _detect_indent_unit(ctx)
+    if unit is None:
+        return
+    if unit != '\t':
+        yield (lineno, 'indent unit must be 1 tab in DTS, got %r' % unit)
+
+
+def check_indent_unit_relaxed(ctx):
+    """YAML examples: 2 or 4 spaces. Never tabs or other widths."""
+    (unit, lineno) = _detect_indent_unit(ctx)
+    if unit is None:
+        return
+    if unit not in ('  ', '    '):
+        yield (lineno, 'indent unit must be 2 or 4 spaces, got %r' % unit)
+
+
+def check_indent_unit_strict(ctx):
+    """YAML: must be exactly 4 spaces. DTS: 1 tab (same as relaxed)."""
+    (unit, lineno) = _detect_indent_unit(ctx)
+    if unit is None:
+        return
+    if ctx.file_type == 'yaml':
+        if unit != '    ':
+            yield (lineno, 'indent unit must be 4 spaces in strict mode, '
+                   'got %r' % unit)
+
+
+def check_line_length(ctx):
+    """Lines must not exceed 80 columns; tabs count as 8 (see
+    _display_col)."""
+    for dl in ctx.lines:
+        if dl.linetype == LineType.BLANK:
+            continue
+        cols = _display_col(dl.raw)
+        if cols > 80:
+            yield (dl.lineno,
+                   'line exceeds 80 columns (%d)' % cols)
+
+
+def check_mixed_indent_chars(ctx):
+    """Indent must be all-tabs, except for aligning indentation (comments
+    or continued lines)."""
+    for dl in ctx.lines:
+        if not dl.indent_str:
+            continue
+        if dl.linetype == LineType.PREPROCESSOR:
+            continue
+        if re.search(r' \t', dl.indent_str):
+            yield (dl.lineno, 'mixed tabs and spaces in indent')
+        if dl.indent_str.count(' ') > 7:
+            yield (dl.lineno, 'too many space characters in indent (more than 7)')
+        for cont in dl.continuations:
+            if not cont.indent_str:
+                continue
+            if cont.linetype == LineType.PREPROCESSOR:
+                continue
+            if re.search(r' \t', cont.indent_str):
+                yield (cont.lineno, 'mixed tabs and spaces in indent')
+
+
+def check_node_close_alone(ctx):
+    """The closing '};' of a node must be on its own line. The
+    classifier accepts a canonical "}" or "};" as NODE_CLOSE; a line
+    that is all closures (e.g. "}; };") is still NODE_CLOSE for depth
+    tracking but is flagged here via dl.closures. Any other line that
+    still contains '};' (in code, not in strings or comments) is
+    mixing a node close with something else."""
+    for dl in ctx.lines:
+        if dl.linetype == LineType.NODE_CLOSE:
+            if dl.closures > 1:
+                yield (dl.lineno,
+                       'closing brace must be on its own line')
+            continue
+        if dl.linetype in (LineType.BLANK, LineType.COMMENT,
+                           LineType.COMMENT_START, LineType.COMMENT_BODY,
+                           LineType.COMMENT_END, LineType.PREPROCESSOR):
+            continue
+        if '};' in dl.code:
+            yield (dl.lineno,
+                   'closing brace must be on its own line')
+
+
 def _property_bucket(name):
     """Return the canonical bucket index for a property:
        0 device_type
@@ -769,17 +821,40 @@ def check_property_order(ctx):
                        (p.prop_name, prev.prop_name))
 
 
-def _strip_strings_and_comments(text):
-    """Remove string literals and /* */ + // comments from a single
-    line, replacing them with empty strings. Used so syntactic checks
-    (whitespace, hex case, etc.) don't false-positive on contents of
-    quoted strings or comments. An unclosed /* on the line is treated
-    as a comment running to end of line."""
-    text = re.sub(r'"(?:[^"\\]|\\.)*"', '""', text)
-    text = re.sub(r'/\*.*?\*/', '', text)
-    text = re.sub(r'/\*.*$', '', text)
-    text = re.sub(r'//.*$', '', text)
-    return text
+def _check_redundant_whitespace(dl):
+    if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
+                        LineType.COMMENT_END, LineType.COMMENT_START,
+                        LineType.PREPROCESSOR):
+        return
+    if re.search(r'(\s\s+|\t)\{', dl.code):
+        yield (dl.lineno, 'extra whitespace before {')
+    if re.search(r':(\s\s+|\t)', dl.code):
+        yield (dl.lineno, 'extra whitespace after :')
+    if re.search(r'\s+;', dl.code):
+        yield (dl.lineno, 'extra whitespace before ;')
+
+
+def check_redundant_whitespace(ctx):
+    """No whitespace between brackets or other code elements.
+    See also check_value_whitespace() for more checks."""
+    for dl in ctx.lines:
+        yield from _check_redundant_whitespace(dl)
+        for cont in dl.continuations:
+            yield from _check_redundant_whitespace(cont)
+
+
+def check_redundant_whitespace_strict(ctx):
+    """No whitespace between brackets or other code elements.
+    See also check_value_whitespace() for more checks."""
+    for dl in ctx.lines:
+        if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
+                           LineType.COMMENT_END, LineType.COMMENT_START,
+                           LineType.PREPROCESSOR):
+            continue
+        if re.search(r'(\s\s+|\t)=', dl.code):
+            yield (dl.lineno, 'extra whitespace before =')
+        if re.search(r'=(\s\s+|\t)', dl.code):
+            yield (dl.lineno, 'extra whitespace after =')
 
 
 def check_required_blank_lines(ctx):
@@ -841,18 +916,49 @@ def check_required_blank_lines(ctx):
             between_blanks = 0
 
 
-def check_hex_case(ctx):
-    """Hex literals (0xN) must use lowercase digits and prefix."""
+def check_tab_in_yaml_example(ctx):
+    """Reject literal tabs in DTS lines when input is YAML.
+
+    For YAML examples, indent and content must use spaces. Tabs inside
+    a #define value are tolerated (those are CPP macros, not DTS).
+    For .dts files, this rule does not apply -- tabs are required.
+    """
+    if ctx.file_type != 'yaml':
+        return
     for dl in ctx.lines:
-        if dl.linetype in (LineType.BLANK, LineType.COMMENT,
-                           LineType.COMMENT_START, LineType.COMMENT_BODY,
-                           LineType.COMMENT_END, LineType.PREPROCESSOR):
+        if dl.linetype == LineType.PREPROCESSOR:
             continue
-        for m in re.finditer(r'\b0[xX][0-9a-fA-F]+\b', dl.code):
-            lit = m.group(0)
-            if any(c.isupper() for c in lit[2:]) or lit[1] == 'X':
-                yield (dl.lineno,
-                       'hex literal %r must be lowercase' % lit)
+        if dl.linetype == LineType.BLANK:
+            continue
+        if '\t' in dl.raw:
+            yield (dl.lineno, 'tab character not allowed in DTS example')
+
+
+def check_trailing_whitespace(ctx):
+    for dl in ctx.lines:
+        if dl.raw != dl.raw.rstrip():
+            yield (dl.lineno, 'trailing whitespace')
+
+
+def check_unclosed_block_comment(ctx):
+    """Every /* must have a matching */ in the same block. Catches both
+    a comment opened on its own line (COMMENT_START) and a tail comment
+    opened on a PROPERTY or other code line (where in_block_comment is
+    set by _split_code so the next line becomes COMMENT_BODY without a
+    preceding COMMENT_START)."""
+    open_lineno = None
+    for dl in ctx.lines:
+        if dl.linetype == LineType.COMMENT_START:
+            open_lineno = dl.lineno
+        elif dl.linetype == LineType.COMMENT_END:
+            open_lineno = None
+        elif dl.linetype == LineType.COMMENT_BODY and open_lineno is None:
+            # Block was opened by a /* tail on a code line; report at
+            # the first orphan body line since the originating line is
+            # already classified as something else.
+            open_lineno = dl.lineno
+    if open_lineno is not None:
+        yield (open_lineno, 'unclosed /* block comment')
 
 
 def check_unit_address_format(ctx):
@@ -886,6 +992,17 @@ def check_unit_address_format(ctx):
                 break
 
 
+def check_unused_labels(ctx):
+    """Labels defined but never referenced are clutter."""
+    defined, referenced = collect_labels_and_refs(ctx.text)
+    for label in sorted(defined - referenced):
+        # Find the line where this label is defined for line-number
+        # reporting.
+        m = re.search(r'(?m)^.*\b' + re.escape(label) + r'\s*:', ctx.text)
+        lineno = ctx.text[:m.start()].count('\n') + 1 if m else 1
+        yield (lineno, 'label %r defined but never &-referenced' % label)
+
+
 def check_value_whitespace(ctx):
     """A <...> cell list must have no whitespace directly after '<'
     or directly before '>'. Continuation lines are joined onto the
@@ -914,122 +1031,6 @@ def check_value_whitespace(ctx):
                 break
 
 
-def check_node_close_alone(ctx):
-    """The closing '};' of a node must be on its own line. The
-    classifier accepts a canonical "}" or "};" as NODE_CLOSE; a line
-    that is all closures (e.g. "}; };") is still NODE_CLOSE for depth
-    tracking but is flagged here via dl.closures. Any other line that
-    still contains '};' (in code, not in strings or comments) is
-    mixing a node close with something else."""
-    for dl in ctx.lines:
-        if dl.linetype == LineType.NODE_CLOSE:
-            if dl.closures > 1:
-                yield (dl.lineno,
-                       'closing brace must be on its own line')
-            continue
-        if dl.linetype in (LineType.BLANK, LineType.COMMENT,
-                           LineType.COMMENT_START, LineType.COMMENT_BODY,
-                           LineType.COMMENT_END, LineType.PREPROCESSOR):
-            continue
-        if '};' in dl.code:
-            yield (dl.lineno,
-                   'closing brace must be on its own line')
-
-
-def _display_col(text):
-    """Visual column width of text, with tabs expanded to the next
-    8-column stop, matching how printf and most editors render a
-    line and the kernel-wide line length convention."""
-    col = 0
-    for ch in text:
-        if ch == '\t':
-            col = (col // 8 + 1) * 8
-        else:
-            col += 1
-    return col
-
-
-def check_line_length(ctx):
-    """Lines must not exceed 80 columns; tabs count as 8 (see
-    _display_col)."""
-    for dl in ctx.lines:
-        if dl.linetype == LineType.BLANK:
-            continue
-        cols = _display_col(dl.raw)
-        if cols > 80:
-            yield (dl.lineno,
-                   'line exceeds 80 columns (%d)' % cols)
-
-
-def check_continuation_alignment(ctx):
-    """A multi-line property's continuation lines must align their
-    first non-whitespace character to the display column of:
-    1. the first '<' or '"' after the '=' in the leading line, if continuation is with '<' or '"'
-    2. the first value, if the continuation is still the same phandle.
-    Display columns are used so tab-indented .dts files (where a continuation
-    aligns with tabs plus spaces) are compared correctly."""
-    for dl in ctx.lines:
-        if dl.linetype != LineType.PROPERTY:
-            continue
-        if not dl.continuations:
-            continue
-        eq = dl.raw.find('=')
-        if eq < 0:
-            continue
-        # First '<' or '"' after '=', but ignore comments and strip trailing
-        # whitespace (e.g. remaining after removing the comment)
-        rest = _strip_strings_and_comments(dl.raw[eq + 1:]).rstrip()
-        m = re.search(r'\s*([<"])', rest)
-        if not m:
-            continue
-        dl_value_complete = rest.endswith('",') or rest.endswith('>,')
-        target_col = _display_col(_strip_strings_and_comments(dl.raw[:eq + 1 + m.start(1)]))
-        for cont in dl.continuations:
-            target_offset = 0
-            err_msg_explanation = 'to < or "'
-            if not dl_value_complete:
-                target_offset = 1
-                err_msg_explanation = 'to the value under <'
-            if _display_col(cont.indent_str) != target_col + target_offset:
-                yield (cont.lineno,
-                       'continuation should align to column %d '
-                       '(%s)' % (target_col + target_offset + 1, err_msg_explanation))
-            # Align to the value within <> or "" of continuation (so the previous line)
-            dl_value_complete = cont.stripped.endswith('",') or cont.stripped.endswith('>,')
-
-
-def check_unclosed_block_comment(ctx):
-    """Every /* must have a matching */ in the same block. Catches both
-    a comment opened on its own line (COMMENT_START) and a tail comment
-    opened on a PROPERTY or other code line (where in_block_comment is
-    set by _split_code so the next line becomes COMMENT_BODY without a
-    preceding COMMENT_START)."""
-    open_lineno = None
-    for dl in ctx.lines:
-        if dl.linetype == LineType.COMMENT_START:
-            open_lineno = dl.lineno
-        elif dl.linetype == LineType.COMMENT_END:
-            open_lineno = None
-        elif dl.linetype == LineType.COMMENT_BODY and open_lineno is None:
-            # Block was opened by a /* tail on a code line; report at
-            # the first orphan body line since the originating line is
-            # already classified as something else.
-            open_lineno = dl.lineno
-    if open_lineno is not None:
-        yield (open_lineno, 'unclosed /* block comment')
-
-
-def check_unused_labels(ctx):
-    """Labels defined but never referenced are clutter."""
-    defined, referenced = collect_labels_and_refs(ctx.text)
-    for label in sorted(defined - referenced):
-        # Find the line where this label is defined for line-number
-        # reporting.
-        m = re.search(r'(?m)^.*\b' + re.escape(label) + r'\s*:', ctx.text)
-        lineno = ctx.text[:m.start()].count('\n') + 1 if m else 1
-        yield (lineno, 'label %r defined but never &-referenced' % label)
-
-
 # --- registry --------------------------------------------------------------
 
 RULES = [

-- 
2.53.0

