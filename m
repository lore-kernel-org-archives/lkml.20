Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6AF4A0F10
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792328223; cv=none; b=aGWlxar5lDmNP+pUaabFAzBg36ocWcg/tKh3lMA82LDkgwT8pzYs3kJaEIHZdcYHVjdwRK8PMKvK/QvJXtYZHUYXl2QeoNyMW5FCOemDTDAL6NSHJJv1q+0PakmPSglPJycpN/L71CoAwiB9C7pqrno8cmZuCsJtKX+lFCZ0y9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792328223; c=relaxed/simple;
	bh=3NqF9oFx556ARlbLAjVMnfvI/bYH2vz25WwpKD5JYVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqSg0LzwEhAgFXmYD45AZZ5GYGZPfcdDeJwuQOOOd83PWrSMf3VBoMa0POxId3dOjeBv82B9yUMXehh7tK6okOfRtiJ9LtMd7EZOeewK3rQlizDLbVl0sR/HizcIUbgBYUtL4kxR1AqCFBlPf7zvKmetDEWlVo/cQmOvhXJe3WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6ylTl7I; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6ylTl7I"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2619869eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792328221; x=1792933021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vpCU0lBJpwjrApwyscimeM9CzakmAtWJtSfSGNyY77w=;
        b=d6ylTl7I2Dctsnab5bO0cSr2/qh8TBPcuLl+T/UPSkkeB89cojFkHP5NUmkQHnJdle
         jbEGtfBJJvfbP3FVYYl0pV2rfR03bVopn6BFYCSdLhIr7XyO2ItX44lbHUblFtcfV6Bc
         0ui4+JaD3ZZvacfP83ymmz2m5Ozc03kbXzuGL2C3XcsRBhioxB3M/SI/1p0d6rG+GflT
         pNVU31NJXacvSJ/GVAAUzJen51TlNWqdr2JiaRX51wPqw3T3wVLpKyKC5vo4RFedguNT
         CGPRlkd7VV539tz6lVC4E6vOQKCn+hmL6mr0ZGraINEMEFAEX26mUiuwD9gLaPAqHZp0
         oXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792328221; x=1792933021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vpCU0lBJpwjrApwyscimeM9CzakmAtWJtSfSGNyY77w=;
        b=n0szAVznSmgCWmEqg0TDe3yrVVh33r1c5OWwRgPaO3g2NS/+iJdzbqgQq5gHa9bB++
         JESuuYBpBly+dB3tRL16RXEhTGM/Ggvgz3/N08QmhsJQfECj0OP3iQVLKzLkHObunJDH
         3y8c92geYwpO8M0LOwB8/ZNF+XScJjDUVZKqXznGifitu4kDuK8zYJtyjSou5ctiEvdc
         32S+Ey/usFyvplK+pAO6Bh+1n3C4oz3iGO9/ydWBakPACn3FcCo/WCFJbWZENkBaFJSp
         b4OUGiawCMt2zZjFqxQsuHPUaxCbKOGhB6784n6vmc1mFSjE2kdri2V+4VIWrUoerQEC
         xrQA==
X-Gm-Message-State: AFq9FYJpUgxds6sdO1ThyzOTPZ4LWCO8p+Wieog7RPTIPxdqNxubLTqS
	HdPdI+XTZgJgXXgpEpDxybURXHF/YRQdhhcAdJg3Q5lDYgQaiS15RztxPc58elrP
X-Gm-Gg: AYBFou33DIkeFixU4/nJ+TJHkSG20+B1m8HdJtxxgkqxeJom58HmmFJujEdQmmRJNgF
	6CFu8GS54CcjKGPE4gtqNL5Rjn9rgWQwM86qzGq02dYn8LX6eEg2v3cqSXgLRHOmWpe2fJ5lLpb
	LPXzV1iQHO2Yi5PKtIHeHEYr04JLwIs3y/3i643BDZgCYCWQ58HNF/h1kguxnG/hpPmON33p3VI
	QHI+I/NFNSJyXLOqOKLTT2ACxlUZ6wjR3ooqLnopdk6bssdOLXgmEZBmQ/h5V/fbozsjQ9Wet/p
	gQOWK9nzBY+qt0fN+Dgsle//23a8wmfjGF0JhY4aEQr1KNlwFZY2tmR74nZqU1uZz+hhD3sWJfl
	c+uj+FDBBYBOIVEXPWAIhLRc4nVwVIWvTdTTSpD0ZykZOLHHA1WGzspzE7pIsxISSelUUdG6zXD
	JvBKDsCo8K6AwmKmRHkJg0Uetzzznil86UXFYY4BCD30lhsXTepj5sQDm5PI/fJ2OJw9HZvABrK
	NgFbAaqkfSRt8LBbiFdXmUHGQZSXblgYMoN4vznFKuIqHRdh+gSJmXhPpF4nGOj9LCQJoV4Y2Fr
	BCl6BsrAuNgD0VSHMP1Tvpo=
X-Received: by 2002:a05:7022:1709:b0:144:fc5b:2121 with SMTP id a92af1059eb24-1851257915bmr5595386c88.17.1792328220803;
        Sun, 18 Oct 2026 05:57:00 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm20404082c88.21.2026.10.18.05.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:57:00 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 4/5] perf/tests: convert check_all_lines_matched.pl to Python
Date: Sun, 18 Oct 2026 09:56:40 -0300
Message-ID: <20261018125641.23064-5-breno3011alves@gmail.com>
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
check_all_lines_matched.pl in Python 3 (stdlib only). Same
regex matching, same environment handling, same exit codes.

Verified byte-for-byte identical to the Perl version.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 .../shell/common/check_all_lines_matched.py   | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100755 tools/perf/tests/shell/common/check_all_lines_matched.py

diff --git a/tools/perf/tests/shell/common/check_all_lines_matched.py b/tools/perf/tests/shell/common/check_all_lines_matched.py
new file mode 100755
index 000000000..352a56d8b
--- /dev/null
+++ b/tools/perf/tests/shell/common/check_all_lines_matched.py
@@ -0,0 +1,45 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+import os
+import re
+import sys
+
+
+def main(argv):
+    max_printed = 20
+    if "TESTLOG_ERR_MSG_MAX_LINES" in os.environ:
+        try:
+            max_printed = int(os.environ["TESTLOG_ERR_MSG_MAX_LINES"])
+        except ValueError:
+            pass
+
+    quiet = True
+    try:
+        if int(os.environ.get("TESTLOG_VERBOSITY", "0")) >= 2:
+            quiet = False
+    except ValueError:
+        pass
+
+    passed = True
+    lines_printed = 0
+
+    for line in sys.stdin:
+        line = line.rstrip("\n")
+        matched = False
+        for r in argv:
+            if re.search(r, line):
+                matched = True
+                break
+        if not matched:
+            show = lines_printed < max_printed
+            lines_printed += 1
+            if show and not quiet:
+                print(f'Line did not match any pattern: "{line}"')
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

