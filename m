Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD2F2931C0
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790487290; cv=none; b=EO1v7lj2Z2VKl1XToGrA3mrjGw9zHjoYA0267eSVDTUS422YDXu5MOz6ndDEmF4Kuk9N0pzM/tWB07Jb7hz02c+VzbyrP3nD4V3SNTlb5hfJhQoWOnKj3kOxbrc6X6zaNrFpK+h80c8xvlFkzMAkxfXheYtsX26p0ycanmYo0eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790487290; c=relaxed/simple;
	bh=jGx1aq1ao1wxDQdo668bBknXmcYUST6wEznxRjXsHCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CzQ5R/E/bOP3h8ysDztgvgqvaWNnaX82g+AdDybhyW/PYicauk8qAVHRsuHH+iZDGW6UvSlOxbLt0GFfyBErqiuhM9/uxmMoa3CkSD+1hBBaqpRWkcyJcDgWRn3y8bWzjJjUPtiXggZnzBY50daQUm0o28lnl/ZF3/MB7Jp7m5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnNJP0xc; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnNJP0xc"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso1173221f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790487287; x=1791092087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vCDRVzFyLeSOqQzwKkeDORCNxt82kLrMJAQmbzM1qY=;
        b=mnNJP0xcBgvrLrmmfX3MDhQzavsJz8r5b3lUSjkRWVyZdnr6/y/cqI0o6Cpz1N8VXK
         JJkOLdF92Bkt8aCNjHEw2jA4uFfRwGbOKmGLmiCotcRQMfpnRl7wDCg8Qvldxe7pqsA4
         /gBWkkCpOX2bdEwSG0lg4DmYDmls2h2mKLNKkXDqwjeCcRUWX4M6TluMAK34ckymYL2X
         WrHr5jTmVACiKjdI+4+2LjtDWSqUEtvCz27XJ5pPFAxIJkKNe0bNUEC6S/B6MdIDQIzp
         p/YsCu09M+a6DCdtcLIhH4+du3p9naT2um6kM1kLJaQivYkchJjzMiU+pyHizJoURkAL
         cW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790487287; x=1791092087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vCDRVzFyLeSOqQzwKkeDORCNxt82kLrMJAQmbzM1qY=;
        b=XTqCZuEbe5KyfutDww9mtVniIi2HSrj//EmxQliJS5cM6bR93HSM+uFjgYuAFspf/B
         IVLumhmUxRIkdaWb9+IcGwI9i/hXj6AXSkykIivdFsIkhSp9TFiiXVe5zW3m+Rini0fU
         11S7eBSKNXTXu50LhsASG3ks7Uk3cXfH/CaBQvQnSuKMfh3Pc/GMXTTCBQmJMcDXPq98
         XwpKybkLbc5QklRmLWd2H05Bs9noa9Jr0Nb3EEUMrzl+KtZTTiLsugeQ0j4P1DdkGrcQ
         Ocb1caD/U1b9RXQnBW5wRaB9liGxailyR2vt9LvDOBcRG2exm/2jevnCqxBpvYXf/NmX
         5jsA==
X-Gm-Message-State: AFq9FYK/OrNk2MyeVogc6STTjsMV0ekkRl2cFr+lPfCyWWRvqWA2JyxJ
	JMiXnZGKgRqWcuJF7TLdPNqnifVTRxXS7vEiDKM8tSHQM9ri0ZgZkhI6xhlndaOuvmFTDA==
X-Gm-Gg: AYBFou2xGg/3MspiFueiZZ5hp2G0W+fZAcQbhbWncueYANxYO4pI/uVG53xBs9HsbT6
	QT7XgVXqwoPLNb56UHCFUy7MgcaHcRqaosfFda3cmDgmLTnmxQOzBZvoBrhsJfZ6+hxl6X3cgRT
	J8im5hCYpb/jyz0C3e99qQJrIG3uCdhmutEt05ZnpzF/kHYf8mf3O1NkQJ55+sPzO1ubqIhM0n5
	SOHPkgBXaQDQ6qIL75/2aE8o9QpajExWlQfeUD/o9E8pXndvh2PNhxAvpEG1P9D2iBiCOLbxyjq
	Gr3Ho2eHZHyeZcdgGru9gwOYZQiNg8XfrRKqbg/JpjVl/EDgjfkTixg/q/s7AGhzAFZI7o1opIV
	+MFMiCMlEpso/I1DxLyn2KKy3lTCftnmyyc/PrAzaCJFeGKGUsnv1e6utsmBudAm+AsbeUICbxB
	zcJAPk3ulrD5UtTVP6WVzZ9tyB2WW7A2IvI9z63r5Nf8j1+qa0vjfQk57Sez7RPfqcyVcJBrbc4
	ka+l4k57W61LlQxQDFzxrAs4mOO2B9FWKJ+2LNbvGePF40l+S1MCd5zJ1n0cbrZgHnRvN/brhuE
	pIIocBcgp2I8xCdqQQ==
X-Received: by 2002:a05:6000:41cc:b0:488:83fc:a7d1 with SMTP id ffacd0b85a97d-48883fca9cemr8513009f8f.9.1790487287207;
        Sat, 26 Sep 2026 22:34:47 -0700 (PDT)
Received: from localhost.localdomain ([2400:adc7:184:4b00:4460:4ffa:ebc1:c21b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm17487129f8f.13.2026.09.26.22.34.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 26 Sep 2026 22:34:46 -0700 (PDT)
From: iamzayn19 <iamzayn19@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: iamzayn19 <iamzayn19@gmail.com>
Subject: [PATCH] scripts: bloat-o-meter: avoid shell for nm invocation
Date: Sun, 27 Sep 2026 10:34:41 +0500
Message-ID: <20260927053441.86594-1-iamzayn19@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bloat-o-meter builds the nm command with string formatting and then
executes it through the shell. Object file paths containing spaces are
split before nm sees them, so the comparison silently reports empty
results for those files.

Invoke nm with subprocess argv instead. This preserves paths as single
arguments and avoids shell interpretation of filenames and tool prefixes.

Assisted-by: LLM
Signed-off-by: iamzayn19 <iamzayn19@gmail.com>
---
 scripts/bloat-o-meter | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/bloat-o-meter b/scripts/bloat-o-meter
index 5868a8b..72edbb7 100755
--- a/scripts/bloat-o-meter
+++ b/scripts/bloat-o-meter
@@ -7,7 +7,7 @@
 # This software may be used and distributed according to the terms
 # of the GNU General Public License, incorporated herein by reference.
 
-import sys, os, re, argparse
+import argparse, re, subprocess
 from signal import signal, SIGPIPE, SIG_DFL
 
 signal(SIGPIPE, SIG_DFL)
@@ -31,8 +31,11 @@ def getsizes(file, format):
     if args.prefix:
         nm = "{}nm".format(args.prefix)
 
-    with os.popen("{} --size-sort {}".format(nm, file)) as f:
-        for line in f:
+    with subprocess.Popen([nm, "--size-sort", file], stdout=subprocess.PIPE,
+                          text=True) as f:
+        if f.stdout is None:
+            return sym
+        for line in f.stdout:
             if line.startswith("\n") or ":" in line:
                 continue
             size, type, name = line.split()
@@ -49,6 +52,7 @@ def getsizes(file, format):
                 # statics and some other optimizations adds random .NUMBER
                 name = re_NUMBER.sub('', name)
                 sym[name] = sym.get(name, 0) + int(size, 16)
+        f.wait()
     return sym
 
 def calc(oldfile, newfile, format):
-- 
2.44.0

