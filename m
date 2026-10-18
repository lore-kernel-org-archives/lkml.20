Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDE64C753A
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331869; cv=none; b=lwa/N8iovF31axoAnRVmedZBT5KgHdf8PcNYe5to4MuYNBGpNJFm827m3sELH0dzb3UKKQ1wqN32LPOJvCR/UzijEsxmPrekZhwgQYwrIL8qrGJaI3OQZ8wPYwglD/V6b1lxL5jLnGY7XMqrkiQ0jLaDfHmDN1B20lgdoNCZK8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331869; c=relaxed/simple;
	bh=IawjRmv3AMIErK1y9uxfC2plS/472oz4PcrnLIzZtB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQkYXwMuiyl5BCQsxqUrdg9JTht9BeybluwqsqL3GyQxBJ5ooMYtMlAhzwuA7N3A7M8gsmpkUrlIlCbXHrDHVILUMb3BsLgo2UQsho5Ns16XCZLe9HBxyVVYipy30hHZP2vEHbtVm2vri35DmBA/q0HQXYnJpafV83U5/tzYuHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfGoGs5d; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfGoGs5d"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35943f55c06so1881111eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792331867; x=1792936667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gfU32GixhTO6jDGXVYG5kFE1u97nKqN/0WesGHqMWQ=;
        b=kfGoGs5dg3v2dxx2Q/GzOXjQoVLA0X+NkhSsUBj75oeVYyMXTVkC1fCn/TrDbCpbai
         o2lVzyCQyjVekCl13pUJyDCbG7AwLwTHixvLjVimMHgxTaZHfT49fMf/xfIfXUGpGTAB
         Sjkdx+coJT6HKEHUCD1JvTg3i2na+dGY/n1ewr6Loq0hpV2+7Ebqmi8wPK4T4X9VWOqn
         t0N91mlTk1NtM2Yh/YHmwHk459x/CMLLK3gQSVjSH7udssPg9hqjfEI8fOv8KkbnekhS
         cG+JL0nVYFbIR4Bu8yL8RsGi6gx6lLr7ASy6+u9h36e7W8kinuIoRmlBsQ4i0NALbz1H
         AvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792331867; x=1792936667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gfU32GixhTO6jDGXVYG5kFE1u97nKqN/0WesGHqMWQ=;
        b=jVwQ+wuUWLkdvylJp6/cI12YulMt2wD84whlh5VS88ApCVXC8RQGIL+sBXTG6vtZ17
         SfZRaBuDt8Am8CM3yX92//A1UlXb0dklI4beVNnN/wh309Qyt5jJVttN64AjBBndKs1J
         fpM5mwa325pWukz3jBuFXPhx57K4uAHJRm22oyvbuF86wlyX7qz8PR2BzjZYV47xdXAR
         cmYx/UX0/YtLdmEIIArBl2rTgHb0n816YJdZEKnmoYIfwXbgIemYwj4v/xaFvnGN8Ajs
         FPzQEv9ecym3uCZ/YCGKo+I6Zk00Dvch6Jc0CRZoYlwYqwnQ8q4soYCGP7VZE1aSb0JD
         uS1w==
X-Gm-Message-State: AFq9FYLeL2NEumT91TuRHc14SLpKGtYS+1/EBZEo3DKu8KmfHH+FC766
	DKHfMJVzb1DNoCwJj5okIWx53921iRka/CnWKEuMy34G5kruKa0VCpH93+0u9MqW
X-Gm-Gg: AYBFou1Tu9fbzerE4EyhlNhUlH18fVHHTKQQI9lXGF4YE5pey0KGC9DXWfqP7QbA7qT
	XAodCh9U0IkGvzztjDetOPiWJifij5PEhqamvv3zaaoZDprY8VM7Q/W+Lx3qtY+N7YSq1HPXlcV
	5d3PQdnh0A1qJpXd7RzlzHWJqL0whEu0S5DmSKRUNvU5xPCMZ3luqVXaexR74k5hjfvVbDtylfd
	7SKIRktSAgeupvMULJfv+iMDboNMtDEAd4EJa6pIkmP48kSxPhPh7110fPmVMUmkIKXZ10zyokk
	PXB3xw5S8+pARJ1S55XMyUhteByvsqVBkYeZp/hRms8rBCxhF7XRa0JhABkUD+2wE7McRI//tGk
	xM6qLPAxIz5rXsVC3vHr25TIT/z431JoYJYcoROJP1S11d/MEij3I2aEpwn1Xyub6CxVV6WvzZJ
	tOejkcfRE/FUMcAApsgML38sb8Fx9OxLCG00tW7COu0F+U1LQ/WnhikLMwmVHROe5i5X7shPW4F
	V70WvBHy/sleytqZ3qBFTQOXR+RzJ1WmnagJjICIYI=
X-Received: by 2002:a05:7301:2503:b0:359:fb64:11d7 with SMTP id 5a478bee46e88-361a2b3bfdbmr6528147eec.11.1792331867196;
        Sun, 18 Oct 2026 06:57:47 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm27653533eec.6.2026.10.18.06.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:57:46 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH v2 6/7] scripts: convert parse-maintainers.pl to Python
Date: Sun, 18 Oct 2026 10:57:21 -0300
Message-ID: <20261018135722.27410-7-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018135722.27410-1-breno3011alves@gmail.com>
References: <20261018112838.16355-1-breno3011alves@gmail.com>
 <20261018135722.27410-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Faithful re-implementation of parse-maintainers.pl in Python 3
(stdlib only). Same section parsing, same --order preferred
ordering, same --input/--output/--section behavior.

Verified byte-for-byte identical to the Perl version on the
kernel MAINTAINERS file (30,222 lines).

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/parse-maintainers.py | 136 +++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100755 scripts/parse-maintainers.py

diff --git a/scripts/parse-maintainers.py b/scripts/parse-maintainers.py
new file mode 100755
index 000000000..520f66ab8
--- /dev/null
+++ b/scripts/parse-maintainers.py
@@ -0,0 +1,136 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# Sort MAINTAINERS file sections alphabetically.
+
+import argparse
+import re
+import sys
+from functools import cmp_to_key
+
+PREFERRED_ORDER = 'MRLSWQBCPTFXNK'
+
+
+def by_category_cmp(a, b):
+    aa = a.upper().replace('THE REST', 'ZZZZZZ')
+    bb = b.upper().replace('THE REST', 'ZZZZZZ')
+    return (aa > bb) - (aa < bb)
+
+
+def by_pattern_cmp(a, b):
+    a1 = a[0].upper() if a else ''
+    b1 = b[0].upper() if b else ''
+    ai = PREFERRED_ORDER.find(a1)
+    bi = PREFERRED_ORDER.find(b1)
+    if ai < 0:
+        ai = 1000
+    if bi < 0:
+        bi = 1000
+    if (a1 == 'F' and b1 == 'F') or (a1 == 'X' and b1 == 'X'):
+        return (a > b) - (a < b)
+    if ai < bi:
+        return -1
+    if ai == bi:
+        return 0
+    return 1
+
+
+def trim(s):
+    return s.strip()
+
+
+def alpha_output(ref, filename, order):
+    if not ref:
+        return
+    with open(filename, 'w') as f:
+        sep = None
+        for key in sorted(ref.keys(), key=cmp_to_key(by_category_cmp)):
+            if key == ' ':
+                f.write(ref[key])
+            else:
+                if sep is None:
+                    sep = '\n'
+                else:
+                    f.write(sep)
+                f.write(key + '\n')
+                patterns = ref[key].split('\n')
+                if order:
+                    patterns = sorted(patterns, key=cmp_to_key(by_pattern_cmp))
+                for p in patterns:
+                    if p:
+                        f.write(p + '\n')
+
+
+def file_input(ref, filename):
+    lastline = ''
+    case = ' '
+    ref[case] = ''
+
+    with open(filename) as f:
+        lines = f.readlines()
+
+    for line in lines:
+        m = re.match(r'^([A-Z]):\s*(.*)', line)
+        if m:
+            line = m.group(1) + ':\t' + trim(m.group(2)) + '\n'
+            if lastline == '':
+                ref[case] += line
+                continue
+            case = trim(lastline)
+            if case in ref:
+                sys.exit(f"Header '{case}' already exists")
+            ref[case] = line
+            lastline = ''
+            continue
+
+        if case == ' ':
+            ref[case] += lastline
+            lastline = line
+            continue
+        if trim(lastline) != '':
+            sys.exit(f"Odd non-pattern line '{lastline}' for '{case}'")
+        lastline = line
+
+    ref[case] += lastline
+
+
+def main(argv):
+    p = argparse.ArgumentParser(add_help=False)
+    p.add_argument('--input', default='MAINTAINERS')
+    p.add_argument('--output', default='MAINTAINERS.new')
+    p.add_argument('--section', default='SECTION.new')
+    p.add_argument('--order', action='store_true', default=False)
+    p.add_argument('-h', '--help', '--usage', action='store_true')
+    p.add_argument('patterns', nargs='*')
+    args = p.parse_args(argv)
+
+    if args.help:
+        print_usage()
+        return 0
+
+    hash_ = {}
+    file_input(hash_, args.input)
+
+    new_hash = {}
+    for pattern in args.patterns:
+        for key in list(hash_.keys()):
+            if re.search(pattern, key) or re.search(pattern, hash_[key]):
+                new_hash[key] = hash_[key]
+                del hash_[key]
+
+    alpha_output(hash_, args.output, args.order)
+    alpha_output(new_hash, args.section, args.order)
+    return 0
+
+
+def print_usage():
+    print(f'''usage: {sys.argv[0]} [options] <pattern matching regexes>
+
+  --input => MAINTAINERS file to read (default: MAINTAINERS)
+  --output => sorted MAINTAINERS file to write (default: MAINTAINERS.new)
+  --section => new sorted MAINTAINERS file to write (default: SECTION.new)
+  --order => Use the preferred section content output ordering (default: 0)''')
+
+
+if __name__ == '__main__':
+    sys.exit(main(sys.argv[1:]))
\ No newline at end of file
-- 
2.43.0

