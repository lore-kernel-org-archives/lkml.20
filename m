Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2A647C0E9
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792322943; cv=none; b=ORbKfLdpWy0Gq6EXNOLYxmtaJ+lNNA3zHT3hjeL0/2WzO626nqdTeE3Vgr5XSHepYuqDCUqGayGmnlM+3JAwrJtQKZTN9pa96L7/pGNLLwLiheByMoXrqEvsmbzMJ7mo1UDnfwLIXNWqR5Y8RTa2OscOyknj8l2LDug+98d3S6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792322943; c=relaxed/simple;
	bh=IawjRmv3AMIErK1y9uxfC2plS/472oz4PcrnLIzZtB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nBreGYLCIJ+6D7EsOze44EXNoNw474JZ6kVYkz2cVLOEp/qHcIvoaMtcoB6nZ46/9CtBIETRWN+k5T5B8qwSlY2tSDHmVgT3GsEwH/Gh8NnEpH8xQUjbp8NKCF4MHW2OpETxI+TAVabx87hfc1W4bgZ6uIXLUvpOHuJpG72Kh24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJ5qiVyr; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJ5qiVyr"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3514b90bb89so3154369eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792322939; x=1792927739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gfU32GixhTO6jDGXVYG5kFE1u97nKqN/0WesGHqMWQ=;
        b=BJ5qiVyry2y8sLvk2W+o3OrBKaE8fCu62PKGL1c/PgvVKVv3EdVO4cfSssf1Djo2NP
         ND7Vylt+77bnD2PTgAtq+4QtghVC/toAjvB2nMiXCoSkNJmWoJlKLiSr55nXeJMIQies
         d1/0IDZp6SJWQC0i5fYhtH2BPDnnfTGdSoQ9RVnFqXGj/90TrtMpdD5Dmwnx3xZ0xJmh
         o3JkLAlqPty6kQaRtrxNQ8366Zb74S9n39gbSkrVGkYIHY1gC6hYgSAQXOBiUkHqOS93
         4EnozSCsvYnFS0xVNJHmFvpuQ7izeMG9PcSZvKSfL7PK1z6J8PCR/WzDPi2CyAR8NUgS
         xgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792322939; x=1792927739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gfU32GixhTO6jDGXVYG5kFE1u97nKqN/0WesGHqMWQ=;
        b=SgGqMRRX6qGPaHm+0yYPPl3cXzNHmcZzIav4cnGe/Xq8unG/jE7u3xQPdwSnpB+2zD
         yXeIFBQsyJjxoE+P/xB/xuM/sdos7U4PrHnqeaXpHs61UD+8cp3XUxNGkBav91/YykC8
         POI4dcmUavcp49XI7fE3slBcuQzOW9TJNpohTQOehZInairxiKr9WbhWtqERv8cfWJnZ
         LkKnu4CZQVdVSrrXYIxVbymKz1A5TATFMJ9ggrMcE3IJJaXv2qsqVvmXVWETYxIhY6kf
         +U1FXbv2ydM0TR8wBo4pX/LMJEhguksYpwdwJj4L427+TcNv38/llv8IZKVLvsR9ypkm
         q2bg==
X-Gm-Message-State: AFq9FYLK8klbf7WaSVCr5MAvm+vGtJGoNTSGSNSTqOuT0BWXJIaT9kSL
	4C+hPJS6ex2Gn/Ke1FLwdqA+7fVTLQutSBzaOsm7Dg0brr/KKCnMhQu6o+0nWXvu
X-Gm-Gg: AYBFou0EgP5D0hfV8ETjncqdfLG80+stY6IpqWS5BDgTNIeiFWzDnfGRtlBotoREWpv
	0eWDFx75FjCjDTO481uMMoOTcxqSzAwv8cGhEkVEgbV/i9SYFR2pyhKIfsIA3iSaIgmIKCNFTKO
	MXrQ20s6kxPObNoJvBGH6JkWeqzVkuDZaKdb9MFGbrITqcuZRg0TXlKk5ZxSAfw8bCmE8m/i0Is
	FNezrMUcM0zn03mbCYS8E1rMIbLrKrKZB+2c+OntAXVAfNpdclAsU4ukJqq76BsJvnep2oKnXDu
	BaVH9F84D7Tb4qoWaMEE84qyeqTACHILQHgiWCnjep9R9/LJbuhl/7meCDn572VGDnfXdIYZ3xk
	mvJ2JFp6Qi9czN3ntoN/bUAbxnCIgYChyh2BudazQPiq2Fy1x+8q4msz3nar4cvALruGQAAsKcg
	omJL+NuSzSp158EYa+IascZYPnZbRYmF5ZkLF/lNPM15uDcF+88fxYMLF1SlQfrRJ1E0jQ/HrIP
	FG9zow2/FYjuis/BM5e9/5ZPSfIVF4MYVIzUp84SGzpMqB0swMP
X-Received: by 2002:a05:7301:da84:b0:34d:755b:d60b with SMTP id 5a478bee46e88-361a2d369eamr7555777eec.34.1792322938649;
        Sun, 18 Oct 2026 04:28:58 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm42560779eec.24.2026.10.18.04.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:28:58 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 6/7] scripts: convert parse-maintainers.pl to Python
Date: Sun, 18 Oct 2026 08:28:37 -0300
Message-ID: <20261018112838.16355-7-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018112838.16355-1-breno3011alves@gmail.com>
References: <20261018112838.16355-1-breno3011alves@gmail.com>
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

