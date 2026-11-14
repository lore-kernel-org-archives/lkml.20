Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794636852;
	b=jMjRXvr7d1Wel/IIHB921JsKeWZxsjbYwSUtW3JgNUrRHI+2MVkIW5iv+egs4VCS+HOD
	 W9dfJppmRcgT9VlJw8wAMXPCh9ejsGpyj9dfJ+904KVX1nXaYpJv3yKvYigfg/Ygp7ROO
	 2ERGAP01vOhJWAJ1JPEAtXTU/bQp6nuWiV3a7baV+N6pGCY35FRpJmT3THG85YZWqn5wx
	 SEXbRyR3+GOfjszk5WWvIylxDkyyWP1GPPpLPe/GRc8ymv92kUguSBs+wGdZHgZZaxzoF
	 xsMxX75N5MEtMKTuRNSiao/eIWZj5jvPfRDBirMMvFQHngTSlJSGM21XuQirtEbT9fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636852;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MqL5JDGm9CJljOfM3+SzM+gbg3+CYJB4dD6/nyZLqis=;
	b=xlmVFMHwdbaEKOJs7l9RR7N2emIhBnlRQ0X/IbBEWqVVrHkqfTrGHocAAJwy+V9SXSb1
	 IW8btEhBL+WA0MYKESSl3i3JnMxNZy78LtwMORptNbzt+b9kQHgwSEqfffyUjiUEUUyf6
	 9mo2LbZov6g3KpWB04BqodHUC5sXQYMnEBq5W7ozRo5IEz0oPWUXep/MXaaa4Go1EyWhU
	 oqrsULCToNTzoiTJDBA538jRbjOscYBJ2pd7idKFFr2v6CunuIZkGIkwYt3HFHNbujzKI
	 5aXvT5rtjDKw6WPhemYQdEj8ZTNy8xBy9wrCdadO3JERhBZ8Lx4oexBA5M86WLCjZdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JzfuN0B3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D761B606A331;
	Sat, 14 Nov 2026 06:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JzfuN0B3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794636852;
	b=aesuycTa0O0TjPFzxV15kGkfeeU0LmbNfZONmOAyerkebwemGvHqVD0FbpRSrJ4jPWTn
	 Sx3JLyM5CysNVy/CDo8LFG3NfWXLXGhd3yPY2K3/kD6l2qTfE1wjAL68YFYO90zz7q8vO
	 TJLsGKJt187dpF0HbVpWitH5Sd75mK2ZRddHfFLKjqQAMMbww7k9OmSXYHwoF6dCy9L71
	 LZHgZwh5Vp+aNcqZ/NPRPQZzvgIjxg5xwrh+5xspPtZj2a4PfG9CnuKlz5yIIRWE/EAAA
	 YPA1mXJT/M1eOnQ7CrLuRg6LFwA8BSckQrDHdT4Dg3BqJK0Ltq8hDVYIgdBc7ZMdnsQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794636852;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MqL5JDGm9CJljOfM3+SzM+gbg3+CYJB4dD6/nyZLqis=;
	b=IB5p1Y7VBC+E+DeQaNV5PbbAmi/4fQf0EG6XC+PO145SO22MchB0k/ogGQKQ15JWb1OT
	 24TQD7mtD8Kpbio1i5lfbZgpBATr8EMGXMkRo2mSTSGgdvm4aIjUhzkxud1GWZG4VQpoS
	 9VDVIbrxY8MeKyl91yrCItLNWngHVhbk9WzGw9PWqMd8fisRGF+HI44q6n29+f9NsYfqu
	 IziE8tdJKzJyeUhhwuOsVudXY3dey5DZUsAK2Jtxu2jQArfUhUF5qqlPgygmYUuHPB/gg
	 gZ3/iPZtX00C155HuJedj+UBS1CDmB/cA1WrnYKSs0uPRvb9+jZ0V9bk+TvO6/OTbYg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BFE4E1F000C6;
	Sat, 14 Nov 2026 06:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794636852;
	bh=MqL5JDGm9CJljOfM3+SzM+gbg3+CYJB4dD6/nyZLqis=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JzfuN0B3moSNt0o3Nm41bH36U8NPubKXec7aPylMWm6BJb1urJqS4KwJ4BEQ35gk9
	 4P3M71QFVU6OsPuVXWaCyWuojFwmx8vOq6V2ZHQ2yRtK0Nwt7d+SGjV2mTUzOlAfYU
	 EOq8B5jj/v3+x5kaPGQbjYDCJFcTdnoX9yaL0+OlN4sptwS5xBwEDrSZmjB5PQSkX3
	 70L9/qTuVw6EPbyENIVy2QmDTD/ZHDw0iDqS6LSU15g06ANzZzvzYuCY93H/iLFq5J
	 jxQ7faGzRQUEusAySdxSFQ4vDuJUhF63+SIHbpf5h1eUs8PA3hhWx0oDJGNCjJph9X
	 UrzGQ/Vtsd07A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4E1FE49CC1;
	Sat, 14 Nov 2026 06:14:11 +0000 (UTC)
From: Prateekshit Jaiswal via B4 Relay <devnull+prateekshitjaiswal73.gmail.com@kernel.org>
Date: Sat, 14 Nov 2026 11:44:09 +0530
Subject: [PATCH 2/2] docs: kdoc: don't print warnings of stored entries
 twice
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261114-kdoc-dup-warnings-v1-2-265f89bc3f9c@gmail.com>
References: <20261114-kdoc-dup-warnings-v1-0-265f89bc3f9c@gmail.com>
In-Reply-To: <20261114-kdoc-dup-warnings-v1-0-265f89bc3f9c@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794636849; l=5723;
 i=prateekshitjaiswal73@gmail.com; s=20261107; h=from:subject:message-id;
 bh=Dt4V+mOJct8QU5hxnTe0SDVaaxQ3Jn2Hrk2c1EC3JUE=;
 b=KKkXyMmi8Zg3mVNSXlBvv7/M48TKyQ4HyG7cCb7dh7mqo9Y1Otq9qmdDcP6o5EzXXAApJmAm+
 UCQbFyLZ70QAjds6PjfVo2aQZIE4DZdZCLjKG0CJ+lSEPqxWDIscbTf
X-Developer-Key: i=prateekshitjaiswal73@gmail.com; a=ed25519;
 pk=Z9QqjsqOUk3AvD5zQ8B+Kufufuvk9wEO7eT9m1nMJdo=
X-Endpoint-Received: by B4 Relay for
 prateekshitjaiswal73@gmail.com/20261107 with auth_id=1445
X-Original-From: Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>
Reply-To: prateekshitjaiswal73@gmail.com
Content-Transfer-Encoding: 7bit

From: Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>

Commit 469c1c9eb6c9 ("kernel-doc: Issue warnings that were silently
discarded") was meant to print warnings of entries that never reach
the output step. With no symbol filter, kernel-doc now prints the
warnings of every documented symbol twice:

  $ ./scripts/kernel-doc -none -Wall drivers/gpu/drm/i915/display/intel_dkl_phy.c
  Warning: drivers/gpu/drm/i915/display/intel_dkl_phy.c:47 No description found for return value of 'intel_dkl_phy_read'
  Warning: drivers/gpu/drm/i915/display/intel_dkl_phy.c:47 No description found for return value of 'intel_dkl_phy_read'

The flush uses "self.entry not in self.entries" to tell stored entries
from discarded ones. output_declaration() stores a new KdocItem built
from the entry, never the KernelEntry itself, so that test is always
true. Every stored entry then warns once in the parser and once in the
output plugin.

Those parser-side prints also ignore the later symbol filter, so
"-function intel_dkl_phy_write" still warns about intel_dkl_phy_read().
Commit 292eca316321 ("docs: kdoc: fix logic to handle unissued
warnings") routes the flush through config.warning(), which increments
the warning count. -Werror then reports "2 warnings as errors" for a
single warning, and a -function run fails because of a different
symbol.

Mark the entry as stored in output_declaration(), flush warnings only
for entries that were not stored, and add tests for both cases. This
needs the previous patch. Without it, symbols selected with -function
or -export would lose their warnings.

Running "kernel-doc -none -Wall" over the 10320 .c and .h files with
kernel-doc comments, the output shrinks from 87900 to 49625 lines,
while the set of distinct lines stays the same.

The problem was found, and the fix and tests drafted, with the help of
an AI coding assistant (Claude Code); I have reviewed and tested the
result.

Fixes: 469c1c9eb6c9 ("kernel-doc: Issue warnings that were silently discarded")
Signed-off-by: Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>
---
 tools/lib/python/kdoc/kdoc_parser.py |  4 ++-
 tools/unittests/test_kdoc_parser.py  | 55 ++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 80d4245acd17..ef5879b05308 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -135,6 +135,7 @@ class KernelEntry:
         self.prototype = ""
 
         self.warnings = []
+        self.stored = False
 
         self.parameterlist = []
         self.parameterdescs = {}
@@ -323,6 +324,7 @@ class KernelDoc:
                         self.entry.parametertypes,
                         self.entry.parameterdesc_start_lines)
         self.entries.append(item)
+        self.entry.stored = True
 
         self.config.log.debug("Output: %s:%s = %s", dtype, name, pformat(args))
 
@@ -346,7 +348,7 @@ class KernelDoc:
               during the output step of the code, depending on the
               selected symbols.
         """
-        if self.entry and self.entry not in self.entries:
+        if self.entry and not self.entry.stored:
             for log_msg in self.entry.warnings:
                 self.config.warning(log_msg)
 
diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
index 35f7a140942d..709455a4b39c 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -567,6 +567,61 @@ class TestContextLockStruct(GenerateKdocItem):
         self.assertEqual(entries[0].name, "debugfs_cancellation")
         self.assertEqual(entries[0].warnings, [])
 
+class TestUnusedWarnings(GenerateKdocItem):
+    """
+    Test that the parser itself only emits warnings of discarded entries.
+    """
+
+    def parse(self, source):
+        """
+        Parse source, returning the entries and the warnings emitted.
+        """
+        kernel_doc = KernelDoc(self.config, "test.c", self.xforms)
+
+        with patch('builtins.open', new_callable=mock_open,
+                   read_data=dedent(source)):
+            with patch.object(self.config, 'warning') as warning:
+                _, entries = kernel_doc.parse_kdoc()
+
+        return entries, [call.args[0] for call in warning.call_args_list]
+
+    def test_stored_entry(self):
+        """
+        Warnings of a stored entry are left for the output step, which
+        applies the symbol filters, so they must not be emitted here.
+        """
+        source = """
+            /**
+             * func - Do nothing
+             */
+            int func(int arg) { return 0; }
+        """
+
+        entries, emitted = self.parse(source)
+
+        self.assertEqual(len(entries), 1)
+        self.assertEqual(len(entries[0].warnings), 1)
+        self.assertIn("'arg' not described", entries[0].warnings[0])
+        self.assertEqual(emitted, [])
+
+    def test_discarded_entry(self):
+        """
+        Warnings of an entry that is never stored are emitted once.
+        """
+        source = """
+            /**
+             * to_user_ptr - cast a u64 to a user space pointer
+             * @x: the u64 to convert
+             */
+            #define u64_to_user_ptr(x) ((void __user *)(uintptr_t)(x))
+        """
+
+        entries, emitted = self.parse(source)
+
+        self.assertEqual(entries, [])
+        self.assertEqual(len(emitted), 1)
+        self.assertIn("expecting prototype for to_user_ptr()", emitted[0])
+
 #
 # Class and logic to create dynamic tests from YAML
 #

-- 
2.53.0


