Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F138B3D75D7
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318366; cv=none; b=EZ6fhMVcBh3LJNGoVImjFVQe1YY78ePKODFIBoD+yuCg8gDh/g/caQw5B/80oSYCPpv0CEmCkHM2RPpyd+SA+56srhn5aZvdEUvaAiv9HktPDnQlRRQ1ydqaXbDe1HNE2Y891kptC7wIFD17tMGF/mQUp8PIEhWHcCilpmFold0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318366; c=relaxed/simple;
	bh=t8t+oCArNUgnYsguOFQLjpuyIMq1oh/1NvoKXTHx6Po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KHGE1GzUkS6ZU+9sf/hiRPmCvGJFtcRacAFggHu1v9d7t1WWY3TlS7RdFcoD9ZVLI/0GF1ood2esCjHztop1UJ+owzaj19cUnXid4U+XxTcjBtUPi+0MMgHL3waUqAyMSCpskjO7rW6WnZtN1rJVuGdCHm0IZhcbn/PZ68xj7Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCINSYEB; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCINSYEB"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30b6dad2382so3378277eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792318362; x=1792923162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJhiojZMZo3FDdG9do9CSIRs8BCf0GaFQU4aBV5co5Y=;
        b=HCINSYEBgiR2wnx7as+x8njBvby2jTdFsywmUppcVGve8q3sOFLpOaJ9RCqsOo6ttZ
         MUNjlVCKWRnpOKg+xy7htpzyKoxcqYCM70Z1uwuHGA7rBd+pr/ZYsenJ3bo61c3+h2+j
         YIN+BNFFzCYNEBbmmtQGPLu0CFwdd2o17va/kjyW6By6H8uxvSfwIIUvoc6A5H6EbC13
         vNTiNfTQDME446e+8dHj8NrBuW4xSTjmhpm86DNXjJBFOqFsiGSp0pkNm0ykYetSAkhb
         +Gfu2CiVbh/SNYNPdqUUiExW0lgtAH9PTy6lZdv5Zyusmg6eSGHnRKRaS2CakdZ9aYy+
         YgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318362; x=1792923162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aJhiojZMZo3FDdG9do9CSIRs8BCf0GaFQU4aBV5co5Y=;
        b=OJC2GGAQAOxtKhsb6HRnazJIt9cSwrBUY0IhTJ9WrwMnj2XWyH3dORHHX3DPpT0RwJ
         eOJziKAPeMoJYiolI+7OWs9+UJWwUF9S7rTX4nU+MIYdlZFwJxycOBBy2y10m+aqs0ec
         q430/2g9L9DNTu8dbe/w9X+VkciBglMojAKx/1QjZ9kH0AJSQXnFT35DfSvVTWPtH6dS
         O6bKZZCpTPwQm38OhiC6glt+mtqL3pUki9CaMDKsGcCS4ljakCwuVJOghS3Jt9yyOw2x
         EADxtmMsez452l44ilTn7EguY18s5qevCq5YfqgAn+RHtLngEGMa/5yZUHrBiKwxSlYQ
         Ky/w==
X-Gm-Message-State: AFq9FYJOVSjfuLexy4uafo3MeB9Q/OekPdUeZzaLCFkzdtCb2o+a9aXs
	HxaIQV4DanfGK90/a/8YsHw3H4vkAu1epoTzBuliNTNIR8YAxsVy2SivUcxdOVtO
X-Gm-Gg: AYBFou3DXnNuV+/NF+qdFoqsVQoviR6tAOvGfCXzVN9DyFv72k7h0DJokq/gmj7IM3I
	mKbGzvnBLo5xP8PFqBQ7xnLaFAzPd/ZK5RUZOuhx/D2hyEFHo/3Ssq/W21WxVzrkPdscv6xa3Q0
	5P9KmsL67//Cmyvvo+oSoO5sqYlZbfyzDH+7W4RDyR8Bz9yGnrJnyygzX7tD8d+i0DRaMgD4JzV
	ElkCYGTW7ZwshxAm69YAHjdamB9fuOFsIasFY2BC9oJoIedc9I2lhJgJw/leJO4w6l9CI6T3eOE
	rljghzozlmcZ985a767sE0CSkUDeK2xDYZDMOrpFGtqWWg5LVyYfvpFWwgQJu3UCiTA+p16eAJI
	NIeyKAPw6HpLkUrOhmGifR8H5H9y4S0ECRz7+j0jmkn/+OaMf57aYyPrCQZVsUgiSaU7Nb8iO7Y
	b77W5Rc17ee+bChqMLHRCwRcGl1Li1mWapMl+sEMsIxm1ltRRb3hlmmc4XH80FInp85vSb3OZlv
	l/7SvVhrweA1xzdzmRBsh+u/PRN+syC1FbFStQAX9gHRiwgrwQ7
X-Received: by 2002:a05:701b:2902:b0:16a:c6f2:60c2 with SMTP id a92af1059eb24-18512c381bdmr5545543c88.12.1792318361829;
        Sun, 18 Oct 2026 03:12:41 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm17967876c88.14.2026.10.18.03.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:12:41 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 2/4] scripts: convert checkincludes.pl to Python
Date: Sun, 18 Oct 2026 07:12:25 -0300
Message-ID: <20261018101227.7680-3-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018101227.7680-1-breno3011alves@gmail.com>
References: <20261018101227.7680-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Faithful re-implementation of checkincludes.pl in Python 3
(stdlib only). Same -r behavior, same duplicate detection,
same error messages.

Tested with a C file containing a duplicate stdio.h include;
output is byte-for-byte identical to the Perl version.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/checkincludes.py | 101 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100755 scripts/checkincludes.py

diff --git a/scripts/checkincludes.py b/scripts/checkincludes.py
new file mode 100755
index 000000000..7e85e4bda
--- /dev/null
+++ b/scripts/checkincludes.py
@@ -0,0 +1,101 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# checkincludes: find/remove files included more than once
+#
+# Copyright abandoned, 2000, Niels Kristian Bech Jensen <nkbj@image.dk>.
+# Copyright 2009 Luis R. Rodriguez <mcgrof@gmail.com>
+#
+# Checks for duplicate #include directives. With -r, removes duplicates
+# in place. Does not account for macros or #ifdef branches; run only when
+# you know the duplicates are real.
+
+import re
+import sys
+
+RE_INCLUDE = re.compile(r'^\s*#\s*include\s*[<"](\S*)[>"]')
+
+
+def usage():
+    print("Usage: checkincludes.py [-r]", file=sys.stderr)
+    print("By default we just warn of duplicates", file=sys.stderr)
+    print("To remove duplicated includes in place use -r", file=sys.stderr)
+    sys.exit(1)
+
+
+def process_file(path, remove):
+    """Return (dup_count, error_msg). error_msg is None on success."""
+    try:
+        with open(path, 'r') as f:
+            lines = f.readlines()
+    except OSError as e:
+        return 0, f"Cannot open {path}: {e}"
+
+    included = {}
+    for line in lines:
+        m = RE_INCLUDE.match(line)
+        if m:
+            included[m.group(1)] = included.get(m.group(1), 0) + 1
+
+    if not remove:
+        dups = 0
+        for filename, n in included.items():
+            if n > 1:
+                print(f"{path}: {filename} is included more than once.")
+                dups += 1
+        return dups, None
+
+    # Removal mode: keep the last occurrence, remove earlier duplicates.
+    # Same semantics as the Perl original (first N-1 occurrences removed).
+    dups = 0
+    out_lines = []
+    for line in lines:
+        m = RE_INCLUDE.match(line)
+        if m and included.get(m.group(1), 0) > 1:
+            included[m.group(1)] -= 1
+            dups += 1
+        else:
+            out_lines.append(line)
+
+    # Match original: always rewrite, even when nothing was removed.
+    try:
+        with open(path, 'w') as f:
+            f.writelines(out_lines)
+    except OSError as e:
+        return 0, f"Cannot write to {path}: {e}"
+
+    if dups > 0:
+        print(f"{path}: removed {dups} duplicate includes")
+    return dups, None
+
+
+def main(argv):
+    remove = False
+    args = list(argv)
+
+    if not args:
+        usage()
+
+    # Original only parses "-r" when there are >= 2 args.
+    if len(args) >= 2 and args[0].startswith('-'):
+        if args[0] == '-r':
+            remove = True
+            args.pop(0)
+        else:
+            usage()
+
+    dup_counter = 0
+    for path in args:
+        n, err = process_file(path, remove)
+        if err:
+            print(err, file=sys.stderr)
+            sys.exit(1)
+        dup_counter += n
+
+    if dup_counter == 0:
+        print("No duplicate includes found.")
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main(sys.argv[1:]))
\ No newline at end of file
-- 
2.43.0

