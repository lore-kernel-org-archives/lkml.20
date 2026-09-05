Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5815C346A11
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 12:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611571; cv=none; b=Nq0R39R24QrCvGgJTSjL3RDFk65OiTKnfa0AM9Iwu85JfhN4tLz7Cc2Z9QSINxtMdhuhD82KjHk5LRq4V1Gj/uX34l5uVHK0ZRrK0rnVYzNW6WFX+f4nIJAKUmmx09EETuJF9VpryeYOrAv78uxGQcbvUfT20POBJEEh9igvo0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611571; c=relaxed/simple;
	bh=pnRQy5qwBoV4WQmMNMWjMe3Gqr1TWajXwvWn035yQwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YPqE4VZZkvVarW0+Pe8jDq/QZTu8XMg+Y/BmFVDfz1MQCDWBEmU+FYqKaMZo8fc7Mvn9otBZxbf0KPln4CHedWoy3Tli5JNZRo7BcLsQu6Xuz2ljPqSsn7HmPF+rfWYSMTd7kfPIUcYkxs7CB9McuJu95g1xmTSOFiyho7GEtRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7/WIqY/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7/WIqY/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so14913755e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 05:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611567; x=1789216367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGOdDZVPcGy/cumUvidrcivm9rU85LBlhYiMsnrxU3s=;
        b=p7/WIqY/BCh3PubjRg+WqNxXFwiTcMWk7teOcE5gufhaLJsfr3s1gxStwDRTEmiFlh
         n7S632oU1Tlq4gfr5hosFAsZrhQSDaa/wS+a1UV7/jPE5K0BCwFpdrfdaOAk78QqBEIU
         iAZyefAYuqoXOQLIodm7DiJ+/9uUZe5xetjAhG+BBGENFe7f8yTvMulrWmFUDn06yGTh
         aDskg/mZzTIeRJK0GB8EaXweplkjvdgVRHpRQyzTpmDglxdBh9XFbbCil3/RnCqzFzF5
         jYbVxqmNla1m0P11Ov1qrj6MCiC1EArDWtDKn4IGWpTzwksptOvjj7SlOFVgWpoulFpp
         teAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611567; x=1789216367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FGOdDZVPcGy/cumUvidrcivm9rU85LBlhYiMsnrxU3s=;
        b=WZo9ImUnKTg5Q/yt/N49ds3AtGvGvM2iXI8gKEYn309bKiIJih96E1TEfHs8tVcrPm
         JivF8Br9wsiXA23zXg+9cCBD2j+FLdYWhGBPNTVZytjm15sBqkcXZXAydDtonhg4EOPK
         Nw1l2+Whk3CbggJJLsbdwx6+7cOKcRZdph4yWXbfsaLQ7HUcNfscubYY4w1LNRseW/NS
         wWac1WVpzSWmMQnStdTzoJE1L5z5C/QBrLNgUN5/WFCYAojGeANoGtbHVOFIfE4mL/7f
         QRMHyiAyIs6C7SdfM9SElijvod2T0SqPOExPBdR0G4sylz/IWQRDH/rJCStydOsMeAsY
         E3WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVUyoiMV+zwcNHYLEtE6W687VWTzztNppj9VuuCvQVIJCqsBu3zGPJ5CTDsLruLDgQ4+d1yv8JcdHm8Sk=@vger.kernel.org
X-Gm-Message-State: AFuF++kXDDkVMGc+41iS2JiVpRe9yNEQmhjEteYQIEhIBRTpYFXSLDYz
	6ufjBKA06+Yqb02CRlxprSXY98pHiEehdqPj1G3j10/bBFUvqnKKXdzE
X-Gm-Gg: AYBFou0fK6X9sAupIdIOLO/55XW1D+bKWERf6KgWpaSg6xU/WkLYebHdEQNx9uS54n2
	kWmhukbkeMz3ZPGSdYRDfESsBLqCjckMqQJoPr4RmPYFD6tSshUvuGqh7u8ZTX0Ye1/lk49VeBj
	Q54t9+sRzqqzVPniImjzJLAmr4KQoZnPAML8FQ/NtUEbqmWb/4XwYwB6XJxWfWWUVijpl/6SwWR
	ceowW8oTzAFFoY5kqeSUCarXvJCCNN9nVmTzuwoBhPn/1GDG9a2YqnmPapArzfbJ8xg3KoKTvRL
	4pui54CxjkKcfe/TaVLU8ObE9xrziAl6oO/+k69f7og1wdPnADDHIZH4vZTEEEpXQPmLmSXnrtt
	aJVwvpuuOPvcUHR/Z6WituwKi4m13rTKo2/F2YnZQ7MWOlbOjCnXQU5kXtC/WvT219ZjrkMC6sl
	Kwasi9oB2scPwg2GtygsEpsmvgBcPjMFzWE8X3xEx18Cjfkz8t7B6pfvpd9fdrMICkMoA4bmgbm
	bK60lI41GODn/Lbi6E4MIfaBq5WqZLgeCq7Y8xFEV0KFvZCEBEwtYqbMNdZDg==
X-Received: by 2002:a05:600c:3f19:b0:49c:fc6c:be13 with SMTP id 5b1f17b1804b1-49cfc6cc0f4mr92008045e9.25.1788611567187;
        Sat, 05 Sep 2026 05:32:47 -0700 (PDT)
Received: from localhost.localdomain ([95.3.12.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce831af89sm171800535e9.1.2026.09.05.05.32.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 05:32:46 -0700 (PDT)
From: Erkan Erdem <hexvalid@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Erkan Erdem <hexvalid@gmail.com>,
	Julian Braha <julianbraha@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] checkkconfigsymbols: resolve revisions before resetting the tree
Date: Sat,  5 Sep 2026 15:32:22 +0300
Message-ID: <20260905123237.40670-2-hexvalid@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260905123237.40670-1-hexvalid@gmail.com>
References: <20260905123237.40670-1-hexvalid@gmail.com>
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

An AI coding assistant found the issue, prepared the fix and changelog,
and ran the verification below after a request to find reproducible
functional bugs in Linux development tools.

Validation:
- Ran the actual CLI against disposable Git repositories, comparing the
  original script with the patched source. All 15 patched cases pass.
- Covered HEAD-relative ranges, branch names, hashes, tags, annotated
  tags, ambiguous branch/tag names, identical revisions, --commit,
  --find, ORIG_HEAD and invalid or non-commit endpoints.
- Checked HEAD, current branch, index and tracked file contents after
  every invocation. The patched cases preserve these values, including
  when the second revision is invalid.

 scripts/checkkconfigsymbols.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
index 36c920e7..e0a1a631 100755
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
-- 
2.50.1 (Apple Git-155)

