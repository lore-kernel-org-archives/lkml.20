Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6DC46EF61
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321609; cv=none; b=Wecud7Q1k2zjzFHqXs46bkC1IqEHlARIOrXj6Olw54AiJRqjg1VPjFB0xDdzE0WmMZyYOgYGzt+Fn+6BTARAo4EK9hg8ySGCCCf0/bTca/pcCwk7niSWB1kkMhB20UnInsYGtaaf8gKHMrECCPEkM/kVEdWYlw1I6wFKIpJ9XAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321609; c=relaxed/simple;
	bh=rIBfix0b3dF0ycKQjA6Ym6QJTSoB2ktnb0nPAcT+DMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=by4ngirNzb4G2qoxEQaLlXy3BC9KhWw05Ag8hGY0bNVUBdi2J600IMhlA8Y4ARoZ9/jesLOyaj+A0Eh/gYuQpFYhYCQVt4VitKRbU0OfZsU8zbOElfK7n2SwHLkhgZLz5HULciIixnoSAGuehpUyiSLLx5azlBCqFVqki+cHIzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4nRRjMr; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4nRRjMr"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35c76e9614aso2253229eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792321607; x=1792926407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzjZYWl/Kozn7jVMuZoo3jmNv4flOMdcbNDMFBKzxEY=;
        b=e4nRRjMrYnYr+TJgzYiGgrXzNrSm83kNXN7nryeU+kWDTC8WztUmeE1D+UXj30QrrG
         m0KqCRKTciwG4KxPKai6crkj08sQSkRsOgumuI/sXJbEm1u/DQ8JzIE2GXPtxXys4BC2
         K16gozdDtc+BzyzwJ+iCtiGB82Kl0opEXrCC0YOW+LFdtn74tspDdoi0kUiYY9uV9eEE
         lykYBPFQ1TtKt+czkm9f6i/FVIsloYCF+Xz3E9aLaHPlqYIlQKCfXeaekqGb09ewHaiS
         TT81juB4s18Msc2PYh/1MsZnaZXUk3GjubldqxdtLAXc5GPqgL6iqZiWXtt151AcxK2m
         lfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792321607; x=1792926407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gzjZYWl/Kozn7jVMuZoo3jmNv4flOMdcbNDMFBKzxEY=;
        b=AcKAXjR9M+nNbgm3bDILDwjipQ/QwpNL39eOI+VA615W3ibdbNjjDaI8OoH3L1Uxf1
         46hb+bWPk2czwyeMoYdjjSd0dzMR779vxTQywzJX1FPigovHDY3MIxtQpKZpiIMljtK2
         0REE9lSMjguE0W5J+6Ev0Xxsz+6fjl60yZ8wopEGjsjtMuOLAKz9nIUfE77aTsx3SNLu
         UJDHMLqlDFZb1ho6KUYx7AVUFAoUbDzyDw4FuHm1S/fc3jTpQ57roHqIb6B0meFffflF
         yWnW7WGDhOZT21dWTxQm0g91/pSKttQdBhikTEAFdqzSyZdq2douVIU/LrQPUvhWjD/0
         n90g==
X-Gm-Message-State: AFq9FYK6u2Cfmp+kGsm650l1Vfg54DZiACLmUxrycM2O4liuOh85jdvN
	btjKeSDwsOCN9aZ6tgxIHvqfRqtg1AxcB1TjGuCHIA5OSzpL7CCzj3adg6IJp2DI
X-Gm-Gg: AYBFou1hEzH0TNsPDpdxWSbQ1tuTv6A0L+VUexWTfZt30TjrFba8zUcxcK3HEBelZvx
	lHnC3kSWZSED2eMlBeDN6QUKLvWAVFh++tmzENiIqmpLMOuu1GiaWmxYWyoRbpbxsR1Fr33VGVZ
	J3xra6jkmdua6j+KMikuTY1iJVEPtmDnxmbWWrbqe6f1JbWtcHZMTfy7CKrfZfLVZblKhLRhs5T
	mEWELVKiFq0IeSS4D1RzPWbRzp4qdhr2eYpVrjvuhhj5pFJOD5GP42XkFcJMHsdF8wWYCN7bUw6
	87ymWv3I5g75rBRlMrCTYJSLV/xV8Hu/OecsQrvCmJdfHlUpW7KkuVUvVvZsAf9cVh7sMgJE331
	ARp+vCed0J35xZVJ0keHAXrKREAGDn9AsEBvAsOfhnIZQdZBrvrDJE+ETy/7YViTNjNVbEubIiR
	48bQrXkeNWvMN9iGTl32gNL3nyG0GlDVSXPcbPDRC8CAwV4/tMDvWglOodpC5fUt3HLmePUGXVO
	eCfHyeEwxhn1ZPhn81eC82PH9OvHSi5MUKAY7L9MNxSZ7ZoAoDn
X-Received: by 2002:a05:7300:ae22:b0:359:2a1f:520 with SMTP id 5a478bee46e88-361a2052f01mr7138379eec.24.1792321607250;
        Sun, 18 Oct 2026 04:06:47 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm28647706eec.3.2026.10.18.04.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:06:46 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 1/7] scripts: convert checkdeclares.pl to Python
Date: Sun, 18 Oct 2026 08:06:32 -0300
Message-ID: <20261018110638.9947-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018110638.9947-1-breno3011alves@gmail.com>
References: <20261018110638.9947-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Faithful re-implementation of checkdeclares.pl in Python 3
(stdlib only). Same output, same detection logic.

Tested byte-for-byte against the Perl version.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/checkdeclares.py | 64 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100755 scripts/checkdeclares.py

diff --git a/scripts/checkdeclares.py b/scripts/checkdeclares.py
new file mode 100755
index 000000000..32c826ac8
--- /dev/null
+++ b/scripts/checkdeclares.py
@@ -0,0 +1,64 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# checkdeclares: find struct declared more than once
+#
+# Copyright 2021 Wan Jiabing <wanjiabing@vivo.com>
+# Inspired by checkincludes.pl
+#
+# This script checks for duplicate struct declares.
+# Note that this will not take into consideration macros so
+# you should run this only if you know you do have real dups
+# and do not have them under #ifdef's.
+
+import re
+import sys
+
+RE_STRUCT_DECL = re.compile(r'^\s*struct\s*(\w*);$')
+
+
+def usage():
+    print('Usage: checkdeclares.py file1.h ...', file=sys.stderr)
+    print('Warns of struct declaration duplicates', file=sys.stderr)
+    sys.exit(1)
+
+
+def process_file(path):
+    """Return (dup_count, error_msg)."""
+    try:
+        with open(path, 'r') as f:
+            lines = f.readlines()
+    except OSError as e:
+        return 0, f"Cannot open {path}: {e}."
+
+    declared = {}
+    for line in lines:
+        m = RE_STRUCT_DECL.match(line)
+        if m:
+            declared[m.group(1)] = declared.get(m.group(1), 0) + 1
+
+    dups = 0
+    for name, n in declared.items():
+        if n > 1:
+            print(f"{path}: struct {name} is declared more than once.")
+            dups += 1
+    return dups, None
+
+
+def main(argv):
+    if not argv:
+        usage()
+    dup_counter = 0
+    for path in argv:
+        n, err = process_file(path)
+        if err:
+            print(err, file=sys.stderr)
+            sys.exit(1)
+        dup_counter += n
+    if dup_counter == 0:
+        print('No duplicate struct declares found.')
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main(sys.argv[1:]))
\ No newline at end of file
-- 
2.43.0

