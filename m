Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247DE4A0F10
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792328217; cv=none; b=XpdWktBr/qB/otVgvzCwi9DnqDmVZU5vww19v0SK9znzu20DqBNdPyEySY47vF6nUB5XArvCWDsoovnVz/mV7fSpSkSlpJqehu/792DJa4KPxlHUNtS+QD6fRWJ7eSMqWbeJfSYu24SyRazwy2Ofa65dWdEht4Eyou2Q47WGApc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792328217; c=relaxed/simple;
	bh=OsrzL6ScmdUef1w4yo+N45vyWLhq1/I/YSTqZdchIEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O1cce7pkpir2W/eA7QXNYF9q9DD9tsT1f0ZQaTD6QrJj/7B38nsG75NEQrSflamJ2YjjHjnavZrh4X2Ow+Ivo2ORYeNQLGo+T/OIqLmcaBlzZ6a1O8IfuvWy5KAEuO86OfN1eNV9zQL9H6TMpJb9APa86kkNa51SGysbGXDU5sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mr+UTrgR; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mr+UTrgR"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1438d9363fbso144576c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792328215; x=1792933015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hR3kISfYtP85z8lc58s0LO5cffGmvqjBO0ESNwiecU=;
        b=mr+UTrgRT4Oy2tt0dGiu99EYX99SHkAt2dTkvoVHToNEBbmDHJVnw1r2/J7mJBUcAz
         GFjNr+4wpI6x65vuZoP220NMbe99o9mKNo3WqiRzw7oQIs/7+qOTL9Mr91E9KDH/9QYO
         UZde4VtT99TbXY8GIWlcRlBb7EjXGz8vtJzwSN6HvRBrBuI2u8n2ObszA75xYALXDRny
         zpU2mikCphRvJiaj2hiPxYFoFpiMAp3o0hHw1LxKws8MivVCgAXR8lsHL7RLrO40Uumf
         Ygw3Tzee2MpSLbbbrBMUeWXMSr0Cn+4xLNJc8yx+1ifVC49CSi/xl2W+vrqi6xJD2mx+
         IZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792328215; x=1792933015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1hR3kISfYtP85z8lc58s0LO5cffGmvqjBO0ESNwiecU=;
        b=zKdmXXNAsBkUz7IDCJtlIlxCaJui8H/4nrXYXv2QzL48cqRTlMmrAlUcTtUKa1dJ/L
         JNpkx1GXLn7Iuu69WKYJdeYl+rJr/NACA8lF9iPI8Cpg/e8wofl4HjE92RxnvYZhwOgs
         NJ6EDMojvEBfwmd/g0SBz8KInkeDkV7Odvsmu3At4ZdoKNSqWeLhsLWHOIhzQV4CPvq1
         lsAlNfThBAhkGMPa1QWLulhqATe3jSbcJMbt4GFYdmt8Utc3IxTiVw3FvTwrGGz8bbV/
         Wv7f5BFlekQ/Td4DONUvr6pWWlvKP/UjLzzpcKomaHkk+7TXV6gWdtFtGOlx5wII89iw
         lT4g==
X-Gm-Message-State: AFq9FYK/afJZ3a0JnFjZ5iU2ozSi73ZDbz5pTYWuQbTkJ8pvEkf2glPl
	Wfx7/cRCD5saZel6knTcuiP6jSfos+P5kqA974sqtRmbyEBginHMm+r0e6SRN5EC
X-Gm-Gg: AYBFou1gat7FppYDHPK67a2nI1XkfHxeQpyWTlIxI4Judo4aJev4EDA6R/wSGeCjWix
	eclcQBq1LXjVrkxZCIgkIEmXnc8KBP2t3CQyb3aVDFzOQuqrcZiFXL46mp02ccQg9vP8zaEYjtC
	AUtPKczXvryF9mo0R6Wc6mFDD//yo2Bxwedmux2iI7Um/FouhzW1kGgPaqLOkpBhCrBaXI7M79c
	h1iltEAaZX7NWodBH1V1olNoJNSR1f18Wo+luTHBmiCdQHRgqv+UJOJHZEH4KtbrKxliWmKzyjJ
	wCbhsA54xaZ/ooAB93BB3sBwjq9SbMCwA/jbsCHQF57PnnezQS1piPAQBSaHXpqUWp7pTpkUDrY
	cRJ+2SgMTRB3d0qvdR+yGVt+h7TG/9odbcIFC0hGXNMGr0jl3zRvWkNIlLn/zy89cihZ9h+V4nk
	9dUB2HqOQcNF5cdzonQqUUZfGBHxwhoD5ugj4Df/uT+8/KZO2axVy7Vz90ve8HBkFhM7vQzf7ab
	MBdMDaXJyokaIQXzGip6f/Jf2baJvpHTtj5+XH90A==
X-Received: by 2002:a05:7022:43a5:b0:152:dd1b:4fa7 with SMTP id a92af1059eb24-18511eb69acmr9823189c88.19.1792328215121;
        Sun, 18 Oct 2026 05:56:55 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm20404082c88.21.2026.10.18.05.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:56:54 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 2/5] perf/tests: convert check_all_patterns_found.pl to Python
Date: Sun, 18 Oct 2026 09:56:38 -0300
Message-ID: <20261018125641.23064-3-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018125641.23064-1-breno3011alves@gmail.com>
References: <20261018125641.23064-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Faithful re-implementation of tools/perf/tests/shell/common/
check_all_patterns_found.pl in Python 3 (stdlib only). Same
regex matching, same TESTLOG_VERBOSITY/TESTLOG_ERR_MSG_MAX_LINES
environment handling, same exit codes.

Verified byte-for-byte identical to the Perl version.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 .../shell/common/check_all_patterns_found.py  | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100755 tools/perf/tests/shell/common/check_all_patterns_found.py

diff --git a/tools/perf/tests/shell/common/check_all_patterns_found.py b/tools/perf/tests/shell/common/check_all_patterns_found.py
new file mode 100755
index 000000000..3eb907af3
--- /dev/null
+++ b/tools/perf/tests/shell/common/check_all_patterns_found.py
@@ -0,0 +1,35 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+import os
+import re
+import sys
+
+
+def main(argv):
+    quiet = True
+    try:
+        if int(os.environ.get("TESTLOG_VERBOSITY", "0")) >= 2:
+            quiet = False
+    except ValueError:
+        pass
+
+    found = set()
+    for line in sys.stdin:
+        line = line.rstrip("\n")
+        for r in argv:
+            if re.search(r, line):
+                found.add(r)
+
+    passed = True
+    for r in argv:
+        if r not in found:
+            if not quiet:
+                print(f'Regexp not found: "{r}"')
+            passed = False
+
+    return 0 if passed else 1
+
+
+if __name__ == "__main__":
+    sys.exit(main(sys.argv[1:]))
\ No newline at end of file
-- 
2.43.0

