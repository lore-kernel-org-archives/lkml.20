Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505555326C6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176295; cv=none; b=eCQ71/rJsR71ndRPCAmv5W9gxaUSybTRqzO0cEjpDLt1BDynOToN3pr2ZssIqM8t4xF44IL+RwVcX76k+5cuzO7539YHKRs2i037NFOxxcUwq9sR6vBcTq1owJhHQpKIoz3l4PK7SKoOlEdX/CHWTOopThavrLTyYwiEmmQzIRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176295; c=relaxed/simple;
	bh=C9qn60KBUlNxQRCS8x3xK66DGDOtLcw0xXbt5/UHVvg=;
	h=From:Date:Subject:To:Cc:Message-ID:MIME-Version:Content-Type; b=URWyFHKbQ8JQYEebjgULNaAjrrPmpWEaBl3JdEIM+cbg38ASygJnZjWw2vrm5oZZCh4f06FGosPq+8xo2Jy0UmVYCVDLNSN8uOcFOJqIwpQ/ZJbJ3Rh48Wo9GAxTlcQfS22b0Mla5KuzVNA63LNaGTUeTsBFlY4y+l4ibmK4Gc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oaVldOTY; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oaVldOTY"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so635566a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790176292; x=1790781092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:cc
         :to:subject:date:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GEtPIsJ5V/EJrCtn9VfRrKZ0RKdts5k/dzxQR2ZKwFU=;
        b=oaVldOTYIzVNeGOOed61P92e47GgRaD2JOfCazR/7cPGMSEbbEYeIx1ooF0Ip22gDN
         wruhKjlDBdJN0Qn/EBgsOJiUAQnr/18eno3v7q3GgTSuPkU7Tn2vik3YzkOJfy6AeB2u
         RPk8xE+O4A6SRx9zreoTTpGbGgteQQv93MaH/86d29m5tSUWQe0vPmIkfLhdvQkuReI7
         XQmI7MlILoL6+7tvv2RLHQCcYGtp4Do4yqinXiyMz9gEauzggyJfeEcvSRMQO6pC5zuJ
         wik3cyzURF8xywe/TXCQKMXd7icqNoGcpiqc5g7zuGETBC0j3rmTmBPYB0nYllWdPN9k
         mp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176292; x=1790781092;
        h=content-transfer-encoding:content-type:mime-version:message-id:cc
         :to:subject:date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GEtPIsJ5V/EJrCtn9VfRrKZ0RKdts5k/dzxQR2ZKwFU=;
        b=Mn5of1CTqaREC5MfGlsJJkWb6HpmnnHiyPc2gusPJJp50LtHe7BApKty+RzR0RvBvF
         aOpaqW22pVMAGYnVMp4uobzO3syS8uHXT0eFN89uJ5j1VVIwwKjxwU0z5XxQUoXICGvD
         NOJmFYQ4JcfIsgvp7hnQM4YLVYerkOpSLkvl9/zJqYnmk5Kqp2/1YggIxEv1rxS9eGbT
         5MQZxq+PRpwbIsZDUPJHRfSqgyWSc1wjCwOIJctH6jBIr/6gWH4fOM3Gv2hacMi+dDhR
         ByxJvcT734IHNd6cIGH0eT7vLzJYnOO6ev3+AM3G2YSApoVmCjlEw28Qt5pgPqHNbKeW
         ZTIA==
X-Forwarded-Encrypted: i=1; AKwUvBx+B4bSJegFXpBrYEDz6PY6vSh4xzgtf2NOg//CNXLaeNgtNYmoND0lmkqE5uA3td85LdR5qg3CIiTVDak=@vger.kernel.org
X-Gm-Message-State: AFuF++lWa8CXG/9Z/nbeNOqKjTA6LKDN9t6Xp63sHgucUmtOBKuIz+CX
	mid5/f5X9ZyFwjupRQvaWIp/yuqq1gt1AcGevvHIrsCqbiMR1oDsr6Qzg+uB223YYnc=
X-Gm-Gg: AYBFou0xkAtFRm/gAHWOWTWZdLzVW/Jq8ca8tDV6ccHHrGNbxHUv8ko/LRxdkDPgBI2
	47fJfSiY3OYqXgDIvl27saDv4NP+NCL6nVmL4+AJWnEa3dxEV3NSW2lK8q92rp+UZrwHNAQU7a6
	Jkzw/JRsI7a9n2UYh8unbH1Q8Pu+Xvse1yaqs6ClttA1SQ7jRWWtrKeeGY81zUude5xZAL5wNXp
	mNpOoWRad3/gc1AkhNmH4h4GiY6fiK9WHmU6y4WhLrM1a3Cb9m1xIY6Ew2E0CPFQg6yhWVCJheT
	zSiNLpMr8BP/QoCZ7n/cj8y7ky+XtjlxGLtEhtiP24brcHZGw+a6HErg9S9sP6EWPPYwx+n4B5U
	Mie5QDozxO6WMtqJOmoujKEbIwv2VkQfIQV3jUXrH7F/ukpGmbFmaemMnuO8w5ZZrQsXQhM4Edn
	OOIYR7fFwiOoUD7mbQebDBLAOHTl6z/If27gxJRntePeZucZrQrozrFPwpFjjiIVCql1rN3ZxRC
	V2mLqao0IHvoDlFAedxef4hLx7ytcK1dgWwTsmQVSqhO2cTKBBlyqOH+8hkWRa+85pPDmD3og6K
	jXNTBMOaWxTYgT2c8hfqqVtl3B45UAClkhg=
X-Received: by 2002:a17:90b:4d0f:b0:39e:6a81:c922 with SMTP id 98e67ed59e1d1-3a07e641099mr2688756a91.21.1790176292422;
        Wed, 23 Sep 2026 08:11:32 -0700 (PDT)
Received: from [172.16.0.2] ([2a09:bac5:d58e:323::50:1d4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3d6954sm1280260a12.16.2026.09.23.08.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:11:32 -0700 (PDT)
From: houtinghang <ue081723@gmail.com>
Date: Wed, 23 Sep 2026 23:10:55 +0800
Subject: [PATCH] clang-tools: Decode dollar escaping in compile commands
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Message-ID: <179017625539.54044.4066773916071097354@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Kbuild doubles dollar signs when saving commands in .cmd files, but
process_line() only decodes $(pound). Consequently, the compilation
database retains doubled dollar signs in compiler arguments. It also
corrupts a literal $(pound), saved as $$(pound), into $#.

Decode $$ and $(pound) in a single pass, matching how Make reads the
saved command. A single pass avoids interpreting a decoded dollar sign
as the start of another escape.

Add CLI regression coverage for ordinary text, dollar signs, hash signs
and adjacent escapes. Four of the six cases fail before this change;
all six pass after it. The expected values were also checked against
GNU Make using scripts/Kbuild.include.

Fixes: b30204640192 ("scripts: add a tool to produce a compile_commands.json file")
Assisted-by: LLM
Signed-off-by: houtinghang <ue081723@gmail.com>
---
Testing on Ubuntu with GCC 13.3.0, Clang/clangd 18.1.3 and Make 4.3:
- x86-64 GCC, x86-64 Clang and ARM64 Clang defconfig builds of the kernel
  image and configured modules passed without compiler warnings.
- All three native make compile_commands.json targets passed.
- 17,084 ordinary compilation database entries match the original tool.
- 432 Kbuild/CLI/shell/compiler cases produced identical objects.
- 259 mixed escape cases agree with Make for each compiler test run.
- 22 clangd macro checks and real x86/ARM64 kernel checks passed.
- The original tool fails the integration and clangd negative controls.
- Six CLI cases pass on Linux/Python 3.12.3 and Windows/Python 3.13.

AI disclosure: Codex identified the issue, wrote the fix and regression
test, verified CLI output and Make semantics, reviewed the diff, and
drafted this patch after a request to find another Linux kernel bug.

 scripts/clang-tools/gen_compile_commands.py   | 10 ++--
 .../clang-tools/gen_compile_commands_test.py  | 47 +++++++++++++++++++
 2 files changed, 52 insertions(+), 5 deletions(-)
 create mode 100644 scripts/clang-tools/gen_compile_commands_test.py

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 8d14b81..d11d15b 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -166,11 +166,11 @@ def process_line(root_directory, command_prefix, file_path):
         ValueError: Could not find the extracted file based on file_path and
             root_directory or file_directory.
     """
-    # The .cmd files are intended to be included directly by Make, so they
-    # escape the pound sign '#' as '$(pound)'. The compile_commands.json file
-    # is not interepreted by Make, so this code replaces the escaped version
-    # with '#'.
-    prefix = command_prefix.replace('$(pound)', '#')
+    # Undo the escaping performed by make-cmd in scripts/Kbuild.include.
+    # Decode both escapes in one pass to preserve a literal '$(pound)'.
+    prefix = re.sub(r'\$\$|\$\(pound\)',
+                    lambda match: '$' if match.group() == '$$' else '#',
+                    command_prefix)
 
     # Return the canonical path, eliminating any symbolic links encountered in the path.
     abs_path = os.path.realpath(os.path.join(root_directory, file_path))
diff --git a/scripts/clang-tools/gen_compile_commands_test.py b/scripts/clang-tools/gen_compile_commands_test.py
new file mode 100644
index 0000000..fe259af
--- /dev/null
+++ b/scripts/clang-tools/gen_compile_commands_test.py
@@ -0,0 +1,47 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Command-line regression tests for gen_compile_commands.py."""
+
+import json
+from pathlib import Path
+import subprocess
+import sys
+import tempfile
+import unittest
+
+
+SCRIPT = Path(__file__).with_name("gen_compile_commands.py")
+
+
+class TestCompileCommands(unittest.TestCase):
+    def test_make_escaping(self):
+        cases = [
+            ("plain", "plain"),
+            ("$$value", "$value"),
+            ("$$$$", "$$"),
+            ("$(pound)value", "#value"),
+            ("$$(pound)", "$(pound)"),
+            ("$$$(pound)", "$#"),
+        ]
+        with tempfile.TemporaryDirectory() as directory:
+            root = Path(directory)
+            (root / "test.c").write_text("int test;\n", encoding="utf-8")
+            for escaped, original in cases:
+                with self.subTest(escaped=escaped):
+                    prefix = "gcc -DVALUE='\"{}\"' -c -o test.o "
+                    (root / ".test.o.cmd").write_text(
+                        "savedcmd_test.o := " + prefix.format(escaped)
+                        + "test.c\n", encoding="utf-8")
+                    output = root / "compile_commands.json"
+                    subprocess.run(
+                        [sys.executable, str(SCRIPT), "-d", str(root),
+                         "-o", str(output)], check=True, capture_output=True)
+                    entries = json.loads(output.read_text(encoding="utf-8"))
+                    self.assertEqual(len(entries), 1)
+                    self.assertEqual(entries[0]["command"],
+                                     prefix.format(original) + "test.c")
+
+
+if __name__ == "__main__":
+    unittest.main()

base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.52.0.windows.1

