Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2633BCD21;
	Sun, 30 Aug 2026 18:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788114305; cv=none; b=ZuSy7VIoqkD2G7fNjxlG2C7xeGaOyNByySzDThldzDAyLv65ylpWeEg3R+WNVtdnzviV7f63IS2V8HCiKrevhkzCR3ALtHQo15Ho8ib32qwDkJ6yZP70l0c7rbMYktVXI9gib79GjuD/NxOtO197B0JKunUG5vlJOmRN5wKPHZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788114305; c=relaxed/simple;
	bh=uNyo1KeB0l/zhhOV3ClmH6VMvBYFLbaYjk2fSTkapm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OWc7/EvY088pr+DDFwR0f0drkbKCLpnxE3+RtauS0Z4t9DvzhdunMlL3xf2B9HVTPxzoeQFKNM9qe/vRa3hdoyu+k5AY3tH4RfjmM4tlIZsy2mIbqanO0EXyUQzAcN0xxi8MqcIZCAIkBFiIhYUL6YXJcS++muOhrPi8EieVGKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZ5PM82T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZ5PM82T"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CC2FC2BCFA;
	Sun, 30 Aug 2026 18:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788114304;
	bh=uNyo1KeB0l/zhhOV3ClmH6VMvBYFLbaYjk2fSTkapm0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EZ5PM82TJTLunItbJ9HF1c5eRJoQpTfZFj3cT7c4MEMQF2Lb5kT2BLCUuccyV/zPU
	 CpoR98uEr/aEO7lqAa/j9SskOo8ErHLD9OBFu8Tr9gYk2Qvgv4nkbQwa7tSCEueryb
	 19/KP3v9wUCf0pghsyeeEeIfeMMjJDfeZbHD4SKqbHErxmvSlJYc1YtfTGcwUubBsI
	 SfB83mC1mO8VqG78krnM9h+OfM48xWb+RUI+MNno5VUiaEfKYPpVKzXj0HgjCf+TUT
	 fHD5pW14ASrW2Tezc7QWlwouG170b/uB3OCyl0FX+EcH9aAdzh0ZM+bgAYFpGUm3vA
	 uB9dU4cssiI+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66360C61DE1;
	Sun, 30 Aug 2026 18:25:04 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 20:24:54 +0200
Subject: [PATCH 1/2] dt-check-style: Handle indented fragments in
 indent-unit-dts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-dts-check-fix-v1-1-e7c1b2774730@kernel.org>
References: <20260830-b4-dts-check-fix-v1-0-e7c1b2774730@kernel.org>
In-Reply-To: <20260830-b4-dts-check-fix-v1-0-e7c1b2774730@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, asahi@lists.linux.dev, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7155; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=uNyo1KeB0l/zhhOV3ClmH6VMvBYFLbaYjk2fSTkapm0=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aU0lr7E7usmuy7rj/S8ZC30JctVtx6P0XOLKrqxAXLW
 XkPpi3vKGVhEONikBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAEzkw1uGP/xvN81wb07aL3ft
 /qvbv/bfyl+Q1/30bPXZzGtM8QsO59kxMtx9vvDyP2t+ra3l4vsW7f9Yzah/OED5S931mxsXi8U
 winEAAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

The multi-die Apple SoCs contain most of their nodes in a file that is
included to instantiate the same nodes across both dies. These included
fragments all have a tabs-only prefix that is correct in the final
composed file. dt-check-style however finds the first line starting with
two (or more) tabs and then indent-unit-dts rejects those correctly
indented files.

Fix that by detecing a tabs-only prefix shared by rootless files and
treat that as a constant offset. Also add fixtures to test this.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 scripts/dtc/dt-check-style                         | 69 +++++++++++++++++-----
 .../bad/dts-fragment-missing-prefix.dtsi           |  6 ++
 .../bad/dts-indented-ref-node.dtsi                 |  6 ++
 .../expected/dts-fragment-missing-prefix.dtsi.txt  |  2 +
 .../expected/dts-indented-ref-node.dtsi.txt        |  2 +
 5 files changed, 70 insertions(+), 15 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 96deffc0d8a7..2afc05fa6602 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -380,12 +380,43 @@ def check_mixed_indent_chars(ctx):
                 yield (cont.lineno, 'mixed tabs and spaces in indent')
 
 
+def detect_fragment_offset(ctx):
+    """Return the indentation inherited from an include context.
+
+    A fragment has neither a root nor top-level reference nodes and all
+    its top-level lines share the same tabs-only indentation.
+    """
+    if ctx.file_type != 'dts':
+        return ''
+    offset = None
+    for dl in ctx.lines:
+        if dl.depth != 0:
+            continue
+        if dl.linetype not in (LineType.NODE_OPEN, LineType.NODE_CLOSE,
+                               LineType.PROPERTY):
+            continue
+        if dl.linetype == LineType.NODE_OPEN and \
+                (dl.node_name == '/' or dl.ref_name is not None):
+            return ''
+        if offset is None:
+            offset = dl.indent_str
+        elif dl.indent_str != offset:
+            return ''
+    if not offset:
+        return ''
+    if any(char != '\t' for char in offset):
+        return ''
+    return offset
+
+
 def detect_indent_unit(ctx):
     """Find the indent unit used at depth 1 in this block.
 
     Returns tuple of string (one of: '  ' (2 spaces), '    ' (4 spaces),
-    '\\t' (tab), or None if depth-1 is empty or ambiguous) and line number when
-    detection was made)."""
+    '\\t' (tab), or None if depth-1 is empty or ambiguous), line number when
+    detection was made, and whether the detected fragment prefix is valid.
+    """
+    prefix = detect_fragment_offset(ctx)
     for dl in ctx.lines:
         if dl.depth != 1:
             continue
@@ -395,20 +426,25 @@ def detect_indent_unit(ctx):
             continue
         if not dl.indent_str:
             continue
-        if dl.indent_str == '\t':
-            return ('\t', dl.lineno)
-        if dl.indent_str == '    ':
-            return ('    ', dl.lineno)
-        if dl.indent_str == '  ':
-            return ('  ', dl.lineno)
+        indent = dl.indent_str
+        if prefix and not indent.startswith(prefix):
+            return (indent, dl.lineno, False)
+        if prefix:
+            indent = indent[len(prefix):]
+        if indent == '\t':
+            return ('\t', dl.lineno, True)
+        if indent == '    ':
+            return ('    ', dl.lineno, True)
+        if indent == '  ':
+            return ('  ', dl.lineno, True)
         # Anything else at depth 1 is non-canonical; flag elsewhere.
-        return (dl.indent_str, dl.lineno)
-    return (None, None)
+        return (indent, dl.lineno, True)
+    return (None, None, True)
 
 
 def check_indent_unit_relaxed(ctx):
     """YAML examples: 2 or 4 spaces. Never tabs or other widths."""
-    (unit, lineno) = detect_indent_unit(ctx)
+    (unit, lineno, _) = detect_indent_unit(ctx)
     if unit is None:
         return
     if unit not in ('  ', '    '):
@@ -417,7 +453,10 @@ def check_indent_unit_relaxed(ctx):
 
 def check_indent_unit_dts(ctx):
     """DTS files: 1 tab per level. Always required."""
-    (unit, lineno) = detect_indent_unit(ctx)
+    (unit, lineno, prefix_valid) = detect_indent_unit(ctx)
+    if not prefix_valid:
+        yield (lineno, 'indent does not start with fragment offset')
+        return
     if unit is None:
         return
     if unit != '\t':
@@ -426,7 +465,7 @@ def check_indent_unit_dts(ctx):
 
 def check_indent_unit_strict(ctx):
     """YAML: must be exactly 4 spaces. DTS: 1 tab (same as relaxed)."""
-    (unit, lineno) = detect_indent_unit(ctx)
+    (unit, lineno, _) = detect_indent_unit(ctx)
     if unit is None:
         return
     if ctx.file_type == 'yaml':
@@ -437,8 +476,8 @@ def check_indent_unit_strict(ctx):
 
 def check_indent_consistent(ctx):
     """All indented lines must be a multiple of the detected unit."""
-    (unit, lineno) = detect_indent_unit(ctx)
-    if unit is None:
+    (unit, lineno, prefix_valid) = detect_indent_unit(ctx)
+    if unit is None or not prefix_valid:
         return
     if ctx.file_type == 'yaml':
         if unit not in ('  ', '    '):
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-fragment-missing-prefix.dtsi b/scripts/dtc/dt-style-selftest/bad/dts-fragment-missing-prefix.dtsi
new file mode 100644
index 000000000000..a72735e0884b
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-fragment-missing-prefix.dtsi
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/* Include fragment whose child does not contain the inherited indentation. */
+
+		bus@10000 {
+	compatible = "simple-bus";
+		};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-indented-ref-node.dtsi b/scripts/dtc/dt-style-selftest/bad/dts-indented-ref-node.dtsi
new file mode 100644
index 000000000000..cabe4ee96d10
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-indented-ref-node.dtsi
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/* Reference nodes must remain at column zero. */
+
+	&example {
+		status = "okay";
+	};
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-fragment-missing-prefix.dtsi.txt b/scripts/dtc/dt-style-selftest/expected/dts-fragment-missing-prefix.dtsi.txt
new file mode 100644
index 000000000000..eb525dddd904
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-fragment-missing-prefix.dtsi.txt
@@ -0,0 +1,2 @@
+# mode=relaxed
+bad/dts-fragment-missing-prefix.dtsi:5: [indent-unit-dts] indent does not start with fragment offset
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-indented-ref-node.dtsi.txt b/scripts/dtc/dt-style-selftest/expected/dts-indented-ref-node.dtsi.txt
new file mode 100644
index 000000000000..ed86cc9b36c6
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-indented-ref-node.dtsi.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/dts-indented-ref-node.dtsi:5: [indent-unit-dts] indent unit must be 1 tab in DTS, got '\t\t'

-- 
2.55.0


