Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793902511;
	b=JCQmLvI7amS1j4oZoKIZ56tWOKxyiY8agpQsvcRPw8/S1AHis5EWTJoIUhqBE5Fjs7J+
	 WxSCl5Wl7lKyoD90EpzwhsqAZEQ+efEqCCZPXxuXFBKi2OYpkNAGwydHtRn4IbzPrQsoR
	 6+zQL+vifNxClQG9FvTzT1jP3sf2wLFLfp32+jGt7oTSW8cJDmvPVhU6J4uHRqYhsQpKj
	 k2nUG0dlCNnKPx4ztupEf5kd8+Crjw498BsrwwYiyTjzzg+lLrSlesXLi8/8qyTZM+2Y2
	 195Mcc/nD7NB2ZvzFYoFkmWGuiOlYVfGtVPcZXmpSPW6sqWf04+DSZVTqDlF60G2e/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=OIeDdEexw13ZpIihlOv1PeLZQLPa0fMafsQGzYNzVzU=;
	b=mxxmjK5wGi5uvTog2CLf0KIZSH4ikPRydJLFgSzA2k4feb8x1ZgAN1xeBOi2Th20SCMg
	 OKVmWDc1YwaZ9CidmtNVBm3bYR/EXrpXFC+iUqKoRcprwFxaixzxli13kGKy8eR3p/rZe
	 8pjFsL2ZBY5eR3TcqQ9+MuGm3MDt4gctcp6ykflUfs0iJjFG6R9AG/6GyaJx9uBf2HbIL
	 ihs/2DclUQGQ3OIuglBDEEhlJL8Iyb6Z/Cj4IbjCx1J+HvWBO7ytL/VX+LaTSOV4RJy2Y
	 o0BkPxRL1gtTu0bsxSrBWogGGKN/Tfstpu9RbgPywE/lKvn6srcETMvQEt4NSjY9oUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.oaklandcc.edu;
	spf=pass smtp.mailfrom=student.oaklandcc.edu;
	dkim=pass header.d=student.oaklandcc.edu header.i=@student.oaklandcc.edu header.a=rsa-sha256 header.s=google header.b=fJt89TRB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BC1606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96BC1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=student.oaklandcc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.oaklandcc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=student.oaklandcc.edu header.i=@student.oaklandcc.edu header.a=rsa-sha256 header.s=google header.b=fJt89TRB
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b32bbd39d5so8874497b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:15:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793902509; cv=none;
        d=google.com; s=arc-20260327;
        b=hNz0MjM3ojETntZglwc8/V+LaQWDJLdNMVCnTCPkERCMeGCO/TGmU8bApbfXxNoAsI
         DymrnXK4IKkqSCMElmn0dFltiLHqiwYC4mLipst+K0YhoIEYxESvZiyZat5ZJ5YtkPUN
         3ccu/8X6lZ4bvqSoZvNr5YUSdAFltiqLHl26OlvbZq4N8n03yj1OeNhCi5EF4PwmU7e7
         ov24BObFpFJJMzDGxGrZvEbwAi19k/SyyAJVV5cY8Yn2k7GQMi3LPUzCNhBgIW0+lmdT
         zfgUkBCu1aDWwM/ru8m3Ru9SszEBU6ppVBbOVe51utghq/m4jlHmT4pM5nsPle3R8GB1
         JDqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=OIeDdEexw13ZpIihlOv1PeLZQLPa0fMafsQGzYNzVzU=;
        fh=0maRrjrSxZpGBt4D6vqQJImLVzSbTOH9nFnKVqg/SZo=;
        b=nwUAd+L+2oYECYx2d2Vusi7iUif4fKawqH1igWtkJXivfpwYIsdBi/875qQHV9maMf
         xo1pkz2E4twhCgUJoDhTwnnRHR+7PU4RZqfogFw4XDiAb1p2QedIWyIsoVYS9eczja2U
         Wu2t3igC8RrtoIWBOJ6rRCFVLwuRTPQo5AJZ3bnFCdi7QMjBye5V578FZFGDZ/cV7GGv
         PlrUzBrMPXLutFkSdDhThSKtxqtU9OXkjOBohrWhS76oNYvQ4Hxuu+ECnTsJLCa3l5rE
         1rW+owtD8Ff4WgefTrwta65S0LrugKrv1lqTZW4umYlyHMm4h42UHh7Ldctb0VA/fJRx
         I0MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=student.oaklandcc.edu; s=google; t=1793902509; x=1794507309; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OIeDdEexw13ZpIihlOv1PeLZQLPa0fMafsQGzYNzVzU=;
        b=fJt89TRBlMTogaHG80iNjELjafkYPbztK2xby+29lafEcwpFQgneAHsjuZX2CQDMyl
         EFo3UDd/pxOLMlZMmyKh9rHWpJqBazdmWPss8p7/qrQukGXj5EQDFTT647nBQLo/+MUf
         DWYGtH6yGmrdi9q3ObLftKEuWwTmy0mlVhDPACYvTtNlPDLv5aFHZBTYHvsxY8HCcwWb
         4RbeaGnV742BF7FO7cYI7w1GCFU8Xv70Qey9z994NzW9vS7isKcP/oC2DwTyDgM0lCrp
         Ii1LrddcwYW4r6xJ17/yDFirDFopTP7f1IR4jxzStazf7k73P/5e+mh5g5niu9+SlZY6
         ZzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902509; x=1794507309;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OIeDdEexw13ZpIihlOv1PeLZQLPa0fMafsQGzYNzVzU=;
        b=lIgTpq/ry0Wt+VDRgxkfwIGmlma0pabadWIbtoi5qQ3isCWolzJYHFLFcmfEnv2Ccw
         buZ+dgqjtaqSBx5yecJh6/m/OHaqDZfg52cLobI72xkw2y8INOHZ9eeOaN6eoEAYDgyn
         QSHeuoFiAY3KxF1uCtNaD/rhkzKbc2RjExWene6zFmLFl3yTmGf+hpNd+xfVWL5PA/p7
         yA3jWLvDCQp0XY128bb7EtejKf5pjiOacvoeY5QGzYumTrIlU2cxZ8zpk0pec+2IGedG
         M92glbVMMwONGchjUK3EyM3toUTcGG4y/hbOTb6IGCfROF4B6R/4L6mfipjZT29x3TGM
         mksA==
X-Forwarded-Encrypted: i=1; AL+hErGjxBoU2Hnf2ffgp5n9Joh6b4X/FPU6LLDZ8gufcz1G95XI3JTXocNA958Ei2qvxAgs9NWCav+H6nKwSaI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WiRWensjm2fs/iAlLPs9DYbywhGiJ4rUiuhTIAOAin6GwxjWo
	8yov1FIZxcoE5DBtNi1O+4LTsLj85AtUTSDN5hIqRad0JC8fl+GndCK8XiT4oTd5ZUPnm/gennE
	xlpxq4PYJqyglr/s0lBCL1iTGbToWVx0e+ZPASRMkNw==
X-Gm-Gg: AYBFou1OwGgxJ+vTYtWPXvrlUl4lf2AUdkbEIm39GM3RfVdC6+MWv96c/Rk0tQbqqDL
	HmShPqoRodELZVjtQhjAjKKA7qyjqRcbSa3+gCy0n4AUkIzXNDFXE5fE6Ffm34OXoWMycoyioev
	DBdviooIQ3BmPk1kn7w/q0uUzrTJChX6aXUlblmmFMjOOPF/LwbavVphM80T0UovlW+chn1VC7E
	w516Zd4mYAXY3eMXyOX4bRndtUTux1OOkGd8UumCL9D2lOtNCdMYwayfrujDzNEHQ8vspgQu8Wv
	cd5laSZOnd9XpNYWyb882giqzovPUj7MOFIFluBjfe57Yx7sLjlNaU1ZFrqIqFComcv8KWJAwIc
	byaqlr6c7kV3QT60K4AL1ElMRULhfGALZcA==
X-Received: by 2002:a05:690c:c50d:b0:8ab:4f41:c97f with SMTP id
 00721157ae682-8b2b6719327mr123192277b3.30.1793902509478; Thu, 05 Nov 2026
 10:15:09 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 10:15:08 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 10:15:03 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 5 Nov 2026 12:14:59 -0600
From: "Louis H. Poulin II" <poulin.louis@student.oaklandcc.edu>
In-Reply-To: <CAGQButum4PYb4A+hmqg-bJZbf4L3KkH6rT9tn-0_NTs3xLhGYw@mail.gmail.com>
References: <CAGQButum4PYb4A+hmqg-bJZbf4L3KkH6rT9tn-0_NTs3xLhGYw@mail.gmail.com>
Date: Thu, 5 Nov 2026 10:15:08 -0800
X-Gm-Features: AclHuK89qADI7pFkx0obg9IOMh8ymHTkC28ZGT0qB3IpQmXXy_-ySHjIDHs7acU
Message-ID: <CAGQButv8FgH0HhDmg6PTG=6S22NdjomUTjd+xyNSmQ09zuXjuA@mail.gmail.com>
Subject: [PATCH 2/2] kunit: tool: Fail on out-of-sequence test numbers
To: brendan.higgins@linux.dev, david@davidgow.net
Cc: raemoar63@gmail.com, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

KTAP requires numbering to start at 1 and increase by one at each
nesting level. The parser notes a mismatch as an error but can still
mark an ok or skipped result as successful. A saved log with duplicate
numbers can make kunit.py parse exit 0.

After decoding ok or SKIP, mark a wrongly numbered result as FAILURE.
The result record is malformed even if the test assertion printed ok.
It then contributes to both failed and error counts. This avoids a
broader policy of failing on every parse error, which would also
change late-plan handling. The preceding patch preserves this failure
when a parent suite has only skipped children.

This change covers numbering mismatches only. A missing numbered line
can flag subsequent results whose numbers differ from their expected
positions. Other malformed or truncated logs retain their existing
status policy.

Commit 14e594a1fc8b ("kunit: tool: fix count of tests if late test
plan") deliberately kept a parsed pass despite missing results after
a late plan. Its fixture also had an unrelated ok 4 result. Number
that result as ok 1 to keep the plan test focused, and cover a wrong
first number separately. Add duplicate, SKIP, nested-suite, missing
number and CLI exit-code tests.

Signed-off-by: Louis H. Poulin II <poulin.louis@student.oaklandcc.edu>
---
 tools/testing/kunit/kunit_parser.py    | 11 ++--
 tools/testing/kunit/kunit_tool_test.py | 79 +++++++++++++++++++++++++-
 2 files changed, 82 insertions(+), 8 deletions(-)

diff --git a/tools/testing/kunit/kunit_parser.py
b/tools/testing/kunit/kunit_parser.py
index dce365d1..38547312 100644
--- a/tools/testing/kunit/kunit_parser.py
+++ b/tools/testing/kunit/kunit_parser.py
@@ -423,11 +423,6 @@ def parse_test_result(lines: LineStream, test: Test,
 	else:
 		test.name = match.group(4)

-	# Check test num
-	num = int(match.group(2))
-	if num != expected_num:
-		test.add_error(printer, f'Expected test number {expected_num} but
found {num}')
-
 	# Set status of test object
 	status = match.group(1)
 	if skip_match:
@@ -437,6 +432,12 @@ def parse_test_result(lines: LineStream, test: Test,
 		test.status = TestStatus.SUCCESS
 	else:
 		test.status = TestStatus.FAILURE
+
+	# A malformed result must not make the run successful.
+	num = int(match.group(2))
+	if num != expected_num:
+		test.add_error(printer, f'Expected test number {expected_num} but
found {num}')
+		test.status = TestStatus.FAILURE
 	return True

 def parse_diagnostic(lines: LineStream) -> List[str]:
diff --git a/tools/testing/kunit/kunit_tool_test.py
b/tools/testing/kunit/kunit_tool_test.py
index 5fd386d0..6a3011de 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -410,13 +410,78 @@ class KUnitParserTest(unittest.TestCase):
 	def test_parse_late_test_plan(self):
 		output = """
 		TAP version 13
-		ok 4 test4
+		ok 1 test1
 		1..4
 		"""
 		result = kunit_parser.parse_run_tests(output.splitlines(), stdout)
-		# Missing test results after test plan should alert a suspected test crash.
+		# Keep this test focused on a late plan, not result numbering.
 		self.assertEqual(kunit_parser.TestStatus.SUCCESS, result.status)
-		self.assertEqual(result.counts, kunit_parser.TestCounts(passed=1, errors=2))
+		self.assertEqual(result.counts, kunit_parser.TestCounts(passed=1, errors=1))
+
+	def test_wrong_first_number_fails(self):
+		output = ['KTAP version 1', '1..1', 'ok 4 - fourth']
+		result = kunit_parser.parse_run_tests(output, stdout)
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
+		self.assertEqual(result.counts, kunit_parser.TestCounts(failed=1, errors=1))
+
+	def test_repeated_test_number_fails(self):
+		output = ['KTAP version 1', '1..2', 'ok 1 - first', 'ok 1 - second']
+		result = kunit_parser.parse_run_tests(output, stdout)
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
+		self.assertEqual(result.counts,
+			kunit_parser.TestCounts(passed=1, failed=1, errors=1))
+
+	def test_missing_number_fails_later_results(self):
+		output = ['KTAP version 1', '1..3',
+			'ok 1 - first', 'ok 3 - third', 'ok 4 - fourth']
+		result = kunit_parser.parse_run_tests(output, stdout)
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
+		self.assertEqual(result.counts,
+			kunit_parser.TestCounts(passed=1, failed=2, errors=2))
+
+	def test_wrong_numbered_skip_fails(self):
+		output = ['KTAP version 1', '1..1', 'ok 2 - skipped # SKIP reason']
+		result = kunit_parser.parse_run_tests(output, stdout)
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
+		self.assertEqual(result.counts, kunit_parser.TestCounts(failed=1, errors=1))
+
+	def test_wrong_numbered_suite_result_fails(self):
+		output = ['KTAP version 1', '1..1',
+			'    KTAP version 1', '    # Subtest: suite', '    1..1',
+			'    ok 1 - case', 'ok 2 - suite']
+		result = kunit_parser.parse_run_tests(output, stdout)
+		suite = result.subtests[0]
+		self.assertEqual(kunit_parser.TestStatus.SUCCESS, suite.subtests[0].status)
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, suite.status)
+		self.assertEqual(suite.counts,
+			kunit_parser.TestCounts(passed=1, failed=1, errors=1))
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
+		self.assertEqual(result.counts, suite.counts)
+
+	def test_wrong_numbered_nested_case_fails(self):
+		output = ['KTAP version 1', '1..1',
+			'    KTAP version 1', '    # Subtest: suite', '    1..1',
+			'    ok 2 - case', 'ok 1 - suite']
+		result = kunit_parser.parse_run_tests(output, stdout)
+		suite = result.subtests[0]
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, suite.subtests[0].status)
+		self.assertEqual(suite.counts,
+			kunit_parser.TestCounts(failed=1, errors=1))
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
+		self.assertEqual(result.counts, suite.counts)
+
+	def test_wrong_numbered_suite_with_skipped_child_fails(self):
+		output = ['KTAP version 1', '1..1',
+			'    KTAP version 1', '    # Subtest: suite', '    1..1',
+			'    ok 1 - case # SKIP reason', 'ok 2 - suite']
+		result = kunit_parser.parse_run_tests(output, stdout)
+		suite = result.subtests[0]
+		self.assertEqual(kunit_parser.TestStatus.SKIPPED, suite.subtests[0].status)
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, suite.status)
+		self.assertEqual(suite.counts,
+			kunit_parser.TestCounts(failed=1, skipped=1, errors=1))
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
+		self.assertEqual(result.counts, suite.counts)

 def line_stream_from_strs(strs: Iterable[str]) -> kunit_parser.LineStream:
 	return kunit_parser.LineStream(enumerate(strs, start=1))
@@ -797,6 +862,14 @@ class KUnitMainTest(unittest.TestCase):
 		self.assertEqual(self.linux_source_mock.run_kernel.call_count, 1)
 		self.print_mock.assert_any_call(StrContains('Could not find any
KTAP output.'))

+	def test_parse_duplicate_number_exits_failure(self):
+		with tempfile.NamedTemporaryFile(mode='w+', delete=True) as log:
+			log.write('KTAP version 1\n1..2\nok 1 - first\nok 1 - second\n')
+			log.flush()
+			with self.assertRaises(SystemExit) as result:
+				kunit.main(['parse', log.name])
+		self.assertEqual(result.exception.code, 1)
+
 	def test_exec_no_tests(self):
 		self.linux_source_mock.run_kernel = mock.Mock(return_value=['TAP
version 14', '1..0'])
 		with self.assertRaises(SystemExit) as e:
-- 
2.53.0
