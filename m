Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CE651A14F;
	Tue, 29 Sep 2026 13:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689023; cv=none; b=SyuNwreO10LeldhsbKXYTaJSXESD2xrEB1TE/xhSLQTN7g5o7JpML/K3GOOVC6xlFRvjaItLJeAY8ZHQiyiX4XYNLTsv4q/lvl8ulG+PoJxlE/pb+eaesP3gcizOEw52ub5LBCbnXsuDDQLB8F5UwVNc/2Ig1n/cdWZidpRZMJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689023; c=relaxed/simple;
	bh=NymeSRCGc3epSd3a3DMl4aJo+57fIwHhOT0VpOhz3VY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aVUDTHb8qc1OiK2Tg4Tlw/ihoUsW9wvndT1CScx2VO6jKA0jES3LsO+yBtvGSyL6TTXmZ6D8Z8mkOF2XbFXW/cqgq1LJYXxcIfNwDQEOIIGSrLbEHjttEyePBbGa3aFzcLSCxCCwpbPtUmz/hQLCmpSyGI/O9vokC055+QNdhg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYktaFd1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYktaFd1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FDD1C2BCF6;
	Tue, 29 Sep 2026 13:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790689021;
	bh=NymeSRCGc3epSd3a3DMl4aJo+57fIwHhOT0VpOhz3VY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=eYktaFd1akJddvRPR703VoTzLEKeMEYukiB5HWc9Wta2+bXunOlnSMHPgpet+ZNGr
	 sSUxr0J4rqkxVzsw7SGAlIFmq+73k7HKvm/mCZKPpjj7NZZSXUx40tum9ADM6eg933
	 a/unkxof/firm/nonA8ePgvGA2K/bSVBPPDEpg2mTE00ZFcyKRm9KcCSzB16Xrn/Yx
	 exFdqbW72+JvEDDfSBvNWBSrF/ypwNBGe1vHQQtLcMBDJogDCz6jOdXp9eHM98M9U1
	 RxJCBuKzpq0g467azhTQxdh5qii2vsD4fOUpp+wQmNFPsxOg1QWnSgAtJvE2P3xdR6
	 jZfuTzJNLF7Sw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68905C9832A;
	Tue, 29 Sep 2026 13:37:01 +0000 (UTC)
From: Simon Sudarushkin via B4 Relay <devnull+simonsudarushkin.gmail.com@kernel.org>
Date: Tue, 29 Sep 2026 18:36:05 +0500
Subject: [PATCH] docs: kdoc_output: don't add a man page tail for
 filtered-out symbols
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-kdoc-man-filter-v1-1-5f70268885d1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNL3eyU/GTd3MQ83bTMnJLUIt3UpETDtDQLU/OUxBQloK6CotS0zAq
 widGxEH5xaVJWanIJyBil2loADW3KxXMAAAA=
X-Change-ID: 20260929-kdoc-man-filter-eba1ff857dad
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Simon Sudarushkin <simonsudarushkin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790689020; l=4424;
 i=simonsudarushkin@gmail.com; s=20260929; h=from:subject:message-id;
 bh=7qfTgo6duH0WRWjeeHKXDb3grkC/ilrK0Zp16EaWK3o=;
 b=OwMup/W3ZTK+Nrxuzs6i2M+/WE3A5E283qymGds/Gbugm35cpCGuv8YnxXIB4VlgiYJ/Mhy+C
 JHhkYL3A5+zASmOJnonLFThrbjx2Ea8GH0wGZIIDGGDD36BLYuzx/Lq
X-Developer-Key: i=simonsudarushkin@gmail.com; a=ed25519;
 pk=yr+Zf16IVZZq8kE1LwDB48Z/iOOIAkvBRA07CDmvH2M=
X-Endpoint-Received: by B4 Relay for simonsudarushkin@gmail.com/20260929
 with auth_id=1081
X-Original-From: Simon Sudarushkin <simonsudarushkin@gmail.com>
Reply-To: simonsudarushkin@gmail.com

From: Simon Sudarushkin <simonsudarushkin@gmail.com>

ManFormat.msg() appends the "SEE ALSO" tail after every call to the base
class msg(), even when the -e, -i, -s or --nosymbol filters dropped the
symbol and nothing was written for it. With -s, every other symbol in
the file leaves a stray "SEE ALSO" block behind the requested page. With
-e on a file that exports nothing, the output is only such blocks, with
no .TH header at all:

  $ tools/docs/kernel-doc -man -s string_get_size lib/string_helpers.c \
      | grep -c 'SEE ALSO'
  13
  $ tools/docs/kernel-doc -man -e include/rdma/ib_mad.h | grep -c '^\.TH'
  0

Only add the tail when the base class produced a page, and add unit
tests for both cases.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/all/fc7978bb-a71f-456d-84bb-670c8f0426ed@infradead.org/
Fixes: 104e0a682e12 ("tools: kernel-doc: add a see also section at man pages")
Assisted-by: LLM
Signed-off-by: Simon Sudarushkin <simonsudarushkin@gmail.com>
---
Randy, this takes a different route from your patch in August [1]: the
out_tail() call stays in ManFormat.msg() and is skipped when the base
class produced no page, so OutputFormat does not need to know about it.
DOC blocks that are shown keep their tail, since they get their own .TH.

[1] https://lore.kernel.org/all/20260816054826.3988516-1-rdunlap@infradead.org/
---
 tools/lib/python/kdoc/kdoc_output.py |  5 +++-
 tools/unittests/test_kdoc_parser.py  | 52 ++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 618b0d765ef5..659a2c6fb6be 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -763,7 +763,10 @@ class ManFormat(OutputFormat):
         Add a tail at the end of man pages output.
         """
         super().msg(fname, name, args)
-        self.out_tail(fname, name, args)
+
+        # Symbols dropped by the output filters produce no page
+        if self.data:
+            self.out_tail(fname, name, args)
 
         return self.data
 
diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
index c4a76ed13dbc..bcb1b1a5ccc6 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -301,6 +301,58 @@ class CToMan(unittest.TestCase):
         self.assertEqual(result, expected)
 
 
+class ManFilterTail(unittest.TestCase):
+    """
+    Symbols dropped by the output filters must not leave a man page tail.
+    """
+
+    source = dedent("""
+        /**
+         * foo - First function
+         * @a: an argument
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
+        config = MockKdocConfig()
+        kernel_doc = KernelDoc(config, "mock.c", CTransforms())
+
+        with patch('builtins.open', new_callable=mock_open,
+                   read_data=self.source):
+            _, self.entries = kernel_doc.parse_kdoc()
+
+        self.out_style = ManFormat()
+        self.out_style.set_config(config)
+
+    def run_filter(self, **kwargs):
+        args = {"export": False, "internal": False, "symbol": None,
+                "nosymbol": None, "function_table": set(),
+                "enable_lineno": False, "no_doc_sections": False}
+        args.update(kwargs)
+
+        self.out_style.set_filter(**args)
+
+        return self.out_style.output_symbols("mock.c", self.entries)
+
+    def test_symbol_filter(self):
+        """Only the selected symbol gets a page, with a single tail."""
+        result = self.run_filter(symbol=["foo"], function_table={"foo"})
+
+        self.assertEqual(result.count(".TH "), 1)
+        self.assertEqual(result.count('.SH "SEE ALSO"'), 1)
+
+    def test_all_filtered_out(self):
+        """No exported symbols: no output at all."""
+        self.assertEqual(self.run_filter(export=True), "")
+
+
 class CToRest(unittest.TestCase):
     out_style = RestFormat()
     config = MockKdocConfig()

---
base-commit: 4f041d7b65b8007403cce30ecf69ad42d48ec315
change-id: 20260929-kdoc-man-filter-eba1ff857dad

Best regards,
--  
Simon Sudarushkin <simonsudarushkin@gmail.com>


