Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D124466B5D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777488; cv=none; b=LCIPXXlbj0h5jyhVVjocBeztxZsqECw1/4RTMllPcHAxMrejXN3OOfMYOpjGUmD5Az3g0dU0L6WxT1/8JCjfrCiYSrnux2H8tRtKS/ucpCiUKD7UcvQRJFysm0AbQF0wzU+U8dVOH/1o0DvmhSY2+r+cJz3P9R8QnnhaKjItIIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777488; c=relaxed/simple;
	bh=EXwlhkDOlgB8hEwY0nwbSEzsp6JcpizZji2VCQUb/6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=doHzIU+pEY1N/EP4eIdbETNBtz75Fuigtx0A8XZN0k/KwfawHx6oJLrsFyzbydtc+EJaAFJqxDcQ8Oy8kjQG9u8GZ8BMBFqfvgT2o3Lqj5GuXTCqWcetWar8jrkuhSMKUYHipIUDK5C63hcjtrRUlkzkJT3Nd2rhYJczPsXSEe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWUi49/S; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWUi49/S"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so33333535e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788777485; x=1789382285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WVAzxcdWiFmNG9B2ynD1XwXk5KOxa+JBkIusJfeUZEU=;
        b=UWUi49/SAEX49+5UoKqFSgY31G2KXcWF+XowkcHjnL6eDqBFoWbomTaUrYwT0JOQMd
         5cxjjVoOF49A6F1vIdWpq+EXTuQv6XcvlLthdfGaTQUzxL7Vkkzn7UNfs5gG+zVF85pT
         p4FjJL9fLFY/sBu1XfhKkYV8o5wAeYXeOBerEWZuHUmvrscekMWeLAt/oXFXRltZyuOZ
         WhoXelUr68rXmkSonAm21WumfhgCMahLNy13b+hBuiiaKCNBArppZE0oU5jBOSZEdAa3
         iGYVPutuiCaxHrZbkaikmEChJPvNF0Kl0VJYXld+RKSzynsVfTGa+ccUh0LzycVx7NZC
         yQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777485; x=1789382285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVAzxcdWiFmNG9B2ynD1XwXk5KOxa+JBkIusJfeUZEU=;
        b=R8XexSl207t7kCfIcb8OEA8gibHeZf+2zvxYeIm4rLyNDlG4a3IdRPga2BgSaBOzZj
         8OiXndI7p38m9no0def2HWeeGebSvgnMPTx/PVYTEmZAestbH74JaxT81ATkwbb+MxL8
         949I18ku/Y2m4kUuZ///bvH6WQsPzGdVcMefS03KuqIwq3mxr4Wv9sRF14G9/UMYoI6J
         5gPaHwR5o5QRcX9B+Gx4GVjyHKjNd3c/RC4FvEeYf5waSh6vQpKvd1VGyz0/MYoyfacX
         H925mtPtW0pPPooSvNAiwKNZYXvqvC8s0YlBV9V7meJqpOLhwLvdpP4iv0VVfLSApFiN
         NvJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMxmjI8AMP15T7y0pF2fFEZycU3UAowj0e67nsyFPJ4pBVy08exQ/GKCeftX+eY57ou93pWBuCthReRAM=@vger.kernel.org
X-Gm-Message-State: AFuF++k1MwGzoAfGsR/QvZsknI//HQO3O2MUoyW6UloOTUwwxmmNymqe
	8lKhrqrM+QISQ+W5ERtAQDtBCtNN7w10nzEmf3DMBQ1zwm+7eY7HNI8s
X-Gm-Gg: AYBFou0i6vBHQveIieZ+mdQmrzddMrZMIKhgxpS3rPq9sSCI+6e5PgCnYNIKfXnKJuN
	jU1uvWmwBKweAzZ3BYkCiZt/nNHyT//u94sGry8YXO9jhoHIf8PA1/4amX7217xZG8dHPBkbsgk
	LYLhUpyKmY9Ia8aq7Of2FO+wxeByCyKPXPt/KmxrO9TNr0FLu2hWKJPw/buVX6Wdlt9Ebhau4SK
	AMSs02OlBlEtQ9nL4+ooGBGIDo9h3+K45rrBhLTLYs2JgiYN+4aNdefeUMdvwYz1J2gFLZrdbH/
	sNy2Hb2LTa+WLVcq427yLdHhMu5McYJX1wb3pkUd0UeqqLgpWjypPxl3J9sQfyuSeHdoFjNIs3I
	evmRq2wvT6tkb+A6o2bF7gR4I+kWcRzoYMdJRQmo8M39VLIq8lVDKkXZ19rroGzMFAKFylu+bqY
	myvuU2TR1SpG+yQFa4Jqkrfc80WOYbu3y2ejb1I5vlQST0unrnKet+Lqavd6rQBxgx3euwMldsq
	5OMP7T7mK2N1snazRnu1DD2E//5TZEU97eEbFgiNA8q6Ww3+RWfIwP/79ffiA==
X-Received: by 2002:a05:600c:3d92:b0:49d:726:cc9f with SMTP id 5b1f17b1804b1-49d0726cd2emr249448785e9.5.1788777485104;
        Mon, 07 Sep 2026 03:38:05 -0700 (PDT)
Received: from localhost.localdomain ([95.3.12.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm311944285e9.3.2026.09.07.03.38.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 03:38:03 -0700 (PDT)
From: Erkan Erdem <hexvalid@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Erkan Erdem <hexvalid@gmail.com>,
	Julian Braha <julianbraha@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ariel Marcovitch <arielmarcovitch@gmail.com>,
	Valentin Rothberg <valentinrothberg@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] checkkconfigsymbols: resolve revisions before resetting the tree
Date: Mon,  7 Sep 2026 13:37:39 +0300
Message-ID: <20260907103739.23212-3-hexvalid@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit comparison resets the current branch to commit_a before
resolving commit_b. If the second revision is HEAD or the current branch
name, it then resolves to the first revision. For example, --diff
HEAD^..HEAD compares the parent with itself and silently misses newly
undefined symbols. The same problem affects --commit with the current
branch name.

Resolve and verify both revisions as commits before the first reset.
This keeps their meaning stable throughout the comparison and rejects
invalid endpoints before changing the working tree.

Keep lookup diagnostics separate from the resolved hashes. Use the
resolved range for --find too, since resetting also updates ORIG_HEAD.

Fixes: b1a3f243485f ("checkkconfigsymbols.py: make it Git aware")
Link: https://lore.kernel.org/20210901145212.478066-1-arielmarcovitch@gmail.com/
Assisted-by: LLM
Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
---

Changes in v2, addressing Julian Braha's review:
- Submit this fix independently of the unrelated Kconfig input fix.
- No code changes from v1.
- Include the original Git-awareness author and contributors to the
  previous HEAD-reference fix in Cc.

v1: https://lore.kernel.org/all/20260905123237.40670-2-hexvalid@gmail.com/

An AI coding assistant found the issue, prepared the fix and changelog,
and ran the original verification. The same assistant prepared this
standalone v2 submission.

Validation:
- The code is unchanged from v1, which passed 15 actual-CLI cases in
  disposable Git repositories, including HEAD-relative ranges, branch
  names, hashes, tags, annotated tags, ambiguous names, --commit,
  --find, ORIG_HEAD and invalid or non-commit endpoints.
- Those checks verified HEAD, current branch, index and tracked file
  contents after every invocation.
- The script in mainline df2908090cda368b01ff43709f51890076c56157 still
  matches the original pre-fix file; this patch applies independently.

 scripts/checkkconfigsymbols.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
index 36c920e71..e0a1a631b 100755
--- a/scripts/checkkconfigsymbols.py
+++ b/scripts/checkkconfigsymbols.py
@@ -150,6 +150,13 @@ def print_undefined_symbols():
             undefined_a = {}
             undefined_b = {}
 
+        commit_a = execute(["git", "rev-parse", "--verify", commit_a + "^{commit}"],
+                           stderr=None).strip()
+        commit_b = execute(["git", "rev-parse", "--verify", commit_b + "^{commit}"],
+                           stderr=None).strip()
+        if args.diff:
+            args.diff = commit_a + ".." + commit_b
+
         # get undefined items before the commit
         reset(commit_a)
         undefined_a, _ = check_symbols(args.ignore)
@@ -223,10 +230,10 @@ def red(string):
     return "\033[31m%s\033[0m" % string if COLOR else string
 
 
-def execute(cmd):
+def execute(cmd, stderr=subprocess.STDOUT):
     """Execute %cmd and return stdout.  Exit in case of error."""
     try:
-        stdout = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=False)
+        stdout = subprocess.check_output(cmd, stderr=stderr, shell=False)
         stdout = stdout.decode(errors='replace')
     except subprocess.CalledProcessError as fail:
         exit(fail)

base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
-- 
2.50.1 (Apple Git-155)

