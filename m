Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8432446EC6C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318378; cv=none; b=E/yybV95pU3+0INC4QTSU70xujmxPOLxHq697cbGEbfok9dDzTjGfTOuiipsknF9s4tz4Tu7J9NjETnq5Yuxfl/XOLAcyNB3Byz5U+XpFh1y+cdgGn+LAuiXBjoBotyHDJFLgAaIuPQHGAGMtqF44rzKDwG5J6PRY7Pu3DZ77p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318378; c=relaxed/simple;
	bh=/VYEc8gkNALcdZgL/1KEvhWGQeHvvl8rf0RCaWmfrFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p2jDZj8vYauUKHR63ckzNAc7raN7CK2O+TUMoPMlPxIlISjROl5qu4TOl3uUGBSlkd+UJNqGHbjc5UJ+m9IgqBEyZyS4zfD5gQ3L/j+0xAtGJ+YjtRERFx17ZMPQM/ErDtIJj3syoqWkYoHYzAOnQH+pAuLbymG6CBKeRHB+fqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHjqD6fE; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHjqD6fE"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2477877eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792318369; x=1792923169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GdUjitgEhYNl3Qq2feMD3k7PCCM1FoGiD4c0f2GSyh8=;
        b=hHjqD6fEQm9XxM5Affnt9l/2aWzAsGLm+MLqgNhvGUw4oXJPD58pvVKbw5bt1nLsr7
         2n60wVXjONiuOiAnIvouKroYkZXhtB2G2Xx3S3TekjlCvlZiLNiIuIM5T16BqGqNYr1q
         tyJkyW5yAlAm9ZqLPXWMWKVWVu8b4StrZTzMd/0z9yC7PdFmsQpQ6tHSG1VWRUR6znDE
         cdohTE35oSaMNJGh0LGPnbAKvj9tY5cWEd2rrEmcqWMlwbLgWhFaY9asQGekx+UVquqm
         hGTjsJh5/qHGdZ0owwm1Pdirx+xNZo8O3gsrvmJGxyxxEff9qMbht6ns5nxSJe5uM6z6
         7k9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318369; x=1792923169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GdUjitgEhYNl3Qq2feMD3k7PCCM1FoGiD4c0f2GSyh8=;
        b=cit7+cSWuqz+JAJFJTTtj4zillaeM6C40TbOusVzJGZNq1vij3J66gMgTiuHT80c4n
         cNLWrxJ36Y3msdLmsaeSdNIkwNjRyWELo+T/CZx+ilP4eDcM24rqMyKJJPLfAbf9SjLt
         D12yMBawZ+RaQU9z93WgsfVwvbOJQBKw8wo/1CEAno+Y+UKV7Du9rs/Y74LBb3NPl8zg
         QCWT9G/a7d/ihziP6T2zimdzoo/oiVNfW56xSrECRZbTCmg90gjAaoUMi3lMy4JmoEFb
         Umn5hsyApyLaJc3jyp/183y7gSADfmp3JGsFabjGa0oPDIBeelOcOK3Uhwullu6PiJ0i
         4ubA==
X-Gm-Message-State: AFq9FYIvLulaffXl9YHnHjxPI7x8h72R8nXX1dKZifs3qkWTL0t5uAep
	eXUN73H0/vKHCYc3b6keOi9jTP25E10WkJlwxIDTSMD6f4to5K3l2+ST6EDcTZ8l
X-Gm-Gg: AYBFou3OQiYvVdwG+EsBymTeX9Oo7efvb7/OXYZxlfQnS7HWJfIY7jt0xrTuMEy/fhE
	mzvi9kSYPp/vSueqmNOBGxxqVMx6xuiy7qYi9zBSUJYF2UdgVnQ+alFS2NkFmYvXLioAOuc/KvN
	RGIFyKutkbbJqFBlJdhav6PLfzfB3I8JzO6Q/Mu2Johgx9UU3EB/w1fcJ/9pqT9wTqhDdKX3kSv
	gfzka0t2CNUetUe2+w2lIgY3RLIWibhi0dCQE/LVSAMltUFqopLKf4ihUcr0qPMnfY1zzYPxmNe
	WIJL3yIMET8Ob3iZm+hAExihRnoSGhRezNjwF/PA6KibJ1Z1izAIVSsWrW+oSWdEQQ6Ex812VgD
	IcTPnCwJ3i/LyNiCimQnSCJyEwPiQQPqthTe5nFi0jyjqg2lql+vV6+D124vyH2AwW9aSiXCUHm
	l0DF2CduoBB1jzFrDyfPWh8SR1Z3LTbD0AagDHdL3MyF4zQ98eyUqwiYr/ZB1LA+1EIr8l6GqFM
	4vAXtkG6Z6ixbI8NhOHpzrBYj0vjPQDWWh5MnFCCZhDDyzVj3j6
X-Received: by 2002:a05:7023:a4d:20b0:144:fb42:52 with SMTP id a92af1059eb24-18512f1ed6amr6354963c88.28.1792318368436;
        Sun, 18 Oct 2026 03:12:48 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm17967876c88.14.2026.10.18.03.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:12:47 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 4/4] scripts: convert profile2linkerlist.pl to Python
Date: Sun, 18 Oct 2026 07:12:27 -0300
Message-ID: <20261018101227.7680-5-breno3011alves@gmail.com>
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

Faithful re-implementation of profile2linkerlist.pl in Python 3
(stdlib only).

Note: the original Perl script has a regex that expects the
historical readprofile format '<num> <name> <num>'. Modern
readprofile outputs '<num>\t<name>', so the script produces
incorrect output for modern input (e.g. '*(.text.3)' instead
of '*(.text.foo)'). This behavior is preserved faithfully;
a follow-up patch can fix the regex separately.

Tested with the same input on both versions; output is
byte-for-byte identical.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/profile2linkerlist.py | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100755 scripts/profile2linkerlist.py

diff --git a/scripts/profile2linkerlist.py b/scripts/profile2linkerlist.py
new file mode 100755
index 000000000..fb7a6def3
--- /dev/null
+++ b/scripts/profile2linkerlist.py
@@ -0,0 +1,27 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# Takes a (sorted) output of readprofile and turns it into a list suitable
+# for linker scripts.
+#
+# usage:
+#     readprofile | sort -rn | python3 profile2linkerlist.py > functionlist
+
+import re
+import sys
+
+RE_PROFILE = re.compile(r'\W*[0-9]+\W*([a-zA-Z_0-9]+)\W*[0-9]+')
+
+
+def main():
+    for line in sys.stdin:
+        if 'unknown' in line or 'total' in line:
+            continue
+        m = RE_PROFILE.search(line)
+        if m:
+            print(f'*(.text.{m.group(1)})')
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main())
\ No newline at end of file
-- 
2.43.0

