Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794636852;
	b=G5LBbe44pWJymJa1cFv7EqOojJGNf6M7DJBBYtTURhWWkYS1KEntvVv3n6v5GrCwpLLf
	 JXdHd/oFkzzwhESwweOdeV0rCjmb40ED5/MsRcvd5xW0Qfg2kUV1SAAPkYdnX9iw6IZQQ
	 44vdc5BIESumvLrgQz6qRzhY+SwxBnTI+LrUutP9HdMV2lHAlLC0VYFqBfzEYMiBiN5p+
	 0Ox7QwzDBpMBoZO1DfT7IgQYP0l++x3TiWlMzJBo3aA6L4XFVuj97HwDDDnTjODEFNw+V
	 O5kO6SHCEW7Iaz57Wkwebc6wz0EJ175M03IRoKQ/pN/syOTEaArC0p2kuZe0SqdrLcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636852;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=s5IEyZm68G9NR8bpgwdmY24XO0ququwsPNEA8ruGL5o=;
	b=YcokCDprFSnjCP3TCI6fJEp0opUevW2nXN3DvneXEc/gxr/cjD/Sl4e6nXnx9dTKJDT4
	 DKbNGd72OQDl/unxQ8H1yT7SJLVQ8eNM88K0HnAGBOBfiQAjKVl0JU7+l+eYJpmh+6gHd
	 oLSe37ORBjWHFCRJw9tXA+6eVcfHjOv8B0w7S4bHl8CUAfkIcu/zIqf7yWZBZSKoqvIWF
	 Q5ieixDFMPrfJ7Mq9SC0kKX/V1FJ3h2srfxQyEzEdlKGiNXVhHXN7IdaEMzGfth0vA1hx
	 xJhmDxdT9prKpTmswsPBssBBVVWUkIqo9lg8/HV/uNMsUsrdU1K9RvSLckr69AjuK5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AJvW9rq5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC9E606A329;
	Sat, 14 Nov 2026 06:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AJvW9rq5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794636852;
	b=N2BYNvqz8eJjuuuaXFwSxn72D/YiRTj5jTLr7wjUQIYRQvUSBGGDrJ4qh34cqPyx6qwQ
	 Ja886bj8yN7H/ji5vvyuAno0/oc3EfCeVb6yq9jfE9wzQCsJsEY0ElqSmhXtg67JWegW9
	 6YDtUKC1pg6B2av+Vl4Scj2RPdm6Uw9+8oHCHtZG0UROeVhWt7kESHcnjPAuehVUBLCo1
	 bkFvsZCW6SfnrsQk+fnrx287lEbsuWB8qtrqO3enLojywnvChWXJ1sVqJ6Tgn3XYJKiXr
	 Xogq/lUP1LIAY58l6+QKvvR6V4gfndPxSjn8/hjy34f6JVYoPjqenPSfQHOCa5LcomA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794636852;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=s5IEyZm68G9NR8bpgwdmY24XO0ququwsPNEA8ruGL5o=;
	b=Z0jO8Qde3M6Qe+cMZAUVS5VuvjxuZd52y/yGdQA784zTH6qyGsK70e1or32lNUyR1nB5
	 g5gOyCvIQ/ReiA83kj16Fd7XCL+JPapFUpZd+T3mBz5ZIlDtN/BPERbfYmUqnVSamo0Bm
	 qzdpWVAsadvI0ogECcPRfGgxyi9jv4NJ94kZ8Z/FUm1eXJwmgYyxMasi8y0Psaz4rW5sJ
	 5qjl73gstz4zwFDam5+gg37WrrUgUhkVjE4c23tBKl3QCK7vEuldB6KwMuY4DRd86S5a5
	 kAThJobSK54RLiqUKWZeskXEHIGpIcsGdI+Gz6fYd7a9qLDnut4HCysuGboijbBNTGw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB8E21F000C4;
	Sat, 14 Nov 2026 06:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794636852;
	bh=s5IEyZm68G9NR8bpgwdmY24XO0ququwsPNEA8ruGL5o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AJvW9rq5gweNif2/5m9XO7Pxuqnx00m5/w5ijxjrYOkilFY5SU85LydgZzFCJFi6T
	 uZR72MwEyz18SrQyjlx2khknFGlH3+SPH7yARF5dHXhIprdssNp04GR6LzsQjAzYJ2
	 jv+0Gh2pZZpHfqgVdvYADXJfa6HMEubyxYr2ULBa1QRK1srVG7pKMwgNl/dWB2lP4F
	 oOng6kt18iBcbu439a55QNCYB1UsNaSwJeVfdhy0+EILSrmBiFdH+Ffs2HZtLTRXRB
	 41o5HhMnmIxKBC4UlBU/Y35HsLo3Z3ktAXhhf9zzTeddraHxHY9g98BSfacBRgFXY5
	 wXxDd2chS/Qxg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3745549CB5;
	Sat, 14 Nov 2026 06:14:11 +0000 (UTC)
From: Prateekshit Jaiswal via B4 Relay <devnull+prateekshitjaiswal73.gmail.com@kernel.org>
Date: Sat, 14 Nov 2026 11:44:08 +0530
Subject: [PATCH 1/2] docs: kdoc: emit warnings for symbols selected with
 -function/-export
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
Message-Id: <20261114-kdoc-dup-warnings-v1-1-265f89bc3f9c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794636849; l=5015;
 i=prateekshitjaiswal73@gmail.com; s=20261107; h=from:subject:message-id;
 bh=sMPzBKJW3ciyPVffUZVgGMn0wTa3lXZSu57g8NNQ69U=;
 b=u2V9+Y4Q8riBQTX7km53qzUFfjGn4e1TtYJuO/GGp7UcVc8yXysPzuN9+oA8FC8tBDVXAUv9M
 FLPX0sLYi17AMDTFuHciZETg1FzodcMn4VZvOd4mb7K9r8iUX+HXYRe
X-Developer-Key: i=prateekshitjaiswal73@gmail.com; a=ed25519;
 pk=Z9QqjsqOUk3AvD5zQ8B+Kufufuvk9wEO7eT9m1nMJdo=
X-Endpoint-Received: by B4 Relay for
 prateekshitjaiswal73@gmail.com/20261107 with auth_id=1445
X-Original-From: Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>
Reply-To: prateekshitjaiswal73@gmail.com
Content-Transfer-Encoding: 7bit

From: Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>

Commit 9cbc2d3b137b ("scripts/kernel-doc.py: postpone warnings to the
output plugin") moved warning output into
OutputFormat.check_declaration(), which is supposed to print the
warnings of each symbol it lets through. The OUTPUT_INCLUDE and
OUTPUT_EXPORTED branch returns without that call, so -function,
-export, and the Sphinx kernel-doc :identifiers: and :export: options
drop the warnings of the symbols they keep. On v6.18 the command below
prints nothing, even though intel_dkl_phy_read() does not describe its
return value:

  $ ./scripts/kernel-doc -none -Wall -function intel_dkl_phy_read drivers/gpu/drm/i915/display/intel_dkl_phy.c

From v6.19 the warning still appears, because the parser prints the
warnings of every entry itself. That is a separate bug, fixed in the
next patch. Fixing only that one would make this gap visible again.
Until then, this change prints the selected symbols' warnings twice in
these modes.

Call out_warnings() in that branch as well, as the other modes do, and
add tests for the warnings shown with each output filter.

The problem was found, and the fix and tests drafted, with the help of
an AI coding assistant (Claude Code); I have reviewed and tested the
result.

Fixes: 9cbc2d3b137b ("scripts/kernel-doc.py: postpone warnings to the output plugin")
Signed-off-by: Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>
---
 tools/lib/python/kdoc/kdoc_output.py |  1 +
 tools/unittests/test_kdoc_parser.py  | 71 ++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 659a2c6fb6be..e0f24302cbc4 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -167,6 +167,7 @@ class OutputFormat:
 
         if self.out_mode in [self.OUTPUT_INCLUDE, self.OUTPUT_EXPORTED]:
             if name in self.function_table:
+                self.out_warnings(args)
                 return True
 
         if self.out_mode == self.OUTPUT_INTERNAL:
diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
index 6e305988cb6d..35f7a140942d 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -353,6 +353,77 @@ class ManFilterTail(unittest.TestCase):
         self.assertEqual(self.run_filter(export=True), "")
 
 
+class OutputFilterWarnings(unittest.TestCase):
+    """
+    The output step shows the warnings of the symbols it outputs, once.
+    """
+
+    source = dedent("""
+        /**
+         * foo - First function
+         */
+        int foo(int a) { return 0; };
+
+        /**
+         * bar - Second function
+         * @b: an argument
+         */
+        int bar(int b) { return 0; };
+    """)
+
+    def setUp(self):
+        self.config = MockKdocConfig()
+        kernel_doc = KernelDoc(self.config, "mock.c", CTransforms())
+
+        with patch('builtins.open', new_callable=mock_open,
+                   read_data=self.source):
+            with patch.object(self.config, 'warning'):
+                _, self.entries = kernel_doc.parse_kdoc()
+
+        self.out_style = ManFormat()
+        self.out_style.set_config(self.config)
+
+    def run_filter(self, **kwargs):
+        args = {"export": False, "internal": False, "symbol": None,
+                "nosymbol": None, "function_table": set(),
+                "enable_lineno": False, "no_doc_sections": False}
+        args.update(kwargs)
+
+        self.out_style.set_filter(**args)
+
+        with patch.object(self.config, 'warning') as warning:
+            self.out_style.output_symbols("mock.c", self.entries)
+
+        return [call.args[0] for call in warning.call_args_list]
+
+    def test_all_symbols(self):
+        """Without a filter, the warning of foo is shown."""
+        warnings = self.run_filter()
+
+        self.assertEqual(len(warnings), 1)
+        self.assertIn("'a' not described in 'foo'", warnings[0])
+
+    def test_selected_symbol(self):
+        """The warning of a symbol selected by name is shown."""
+        warnings = self.run_filter(symbol=["foo"], function_table={"foo"})
+
+        self.assertEqual(len(warnings), 1)
+        self.assertIn("'a' not described in 'foo'", warnings[0])
+
+    def test_exported_symbol(self):
+        """The warning of an exported symbol is shown."""
+        warnings = self.run_filter(export=True, function_table={"foo"})
+
+        self.assertEqual(len(warnings), 1)
+        self.assertIn("'a' not described in 'foo'", warnings[0])
+
+    def test_other_symbol(self):
+        """The warning of a symbol that is not selected is not shown."""
+        warnings = self.run_filter(symbol=["bar"], function_table={"bar"})
+
+        self.assertEqual(warnings, [])
+
+
 class CToRest(unittest.TestCase):
     out_style = RestFormat()
     config = MockKdocConfig()

-- 
2.53.0


