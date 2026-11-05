Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793902483;
	b=LS8+gCg7tjooJdS8+Co44wm9gbYPdisCEWfjCOYq/Z4M7gsmHDED//jOw39kMAtdCFOl
	 u5dNbbQTo/uRSboMAC1ac/VYTWqU4FKyW1N5xqKyi1dARlUsbcrvJSq8jfRYhdPjiAA91
	 4TX5DU7XQLCunWgCXuBbaFKqHymVN3L4ar/KdJZ0LbqM1r7y5OCoUF4XmaFH/nM9B/Ok+
	 EHGV3d4PX70HEa9jmuHRqASWV1pEzQgddTZVj+MdJ/o5tQmBSaqTK5Y/JF6S7JKVi/dZj
	 3Iu0V18M8Qj/OlegIMSOnHnXCnqkERAApReITDsjToxi1bI2Hh2CHGuRPDAZB6nv2VA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=k69fxDmtmmF6Y3dZct9TP630KoCBBlkteFGCi7Y2r6o=;
	b=DY6xMhz4TGkfZI0XzEndhh9t1SYZCU5LX3PxBNPNW3+SiiCvXFV/TwjRibmdtLpA/cz3
	 WEbvsEGEdrNs9TLrDM9ABAmoXczjrGSn5DSqKyVm18fczvhnIeww3lcBX92v54OdZxmP+
	 HqjV4/dr2cpfx/vOyJoadf9G787ccNYYC9WPr75MvMy0SBgfBmCd7cZbX9w7/IVyYQ6jh
	 Z9cTSszNiDtD0TZ2R/nBk55MKu0RjG4DsOI3lrPW/ayUdTsDgqey/8524Q/Rxlb7JQAcd
	 UVs617WdlNnT9pJov6C3bHEUKzDjBJ/GFye9hzzj/N0pFRaG5Nk8+gTEmrGT7TouOBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.oaklandcc.edu;
	spf=pass smtp.mailfrom=student.oaklandcc.edu;
	dkim=pass header.d=student.oaklandcc.edu header.i=@student.oaklandcc.edu header.a=rsa-sha256 header.s=google header.b=Kvwr0N3w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE111606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE111606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=student.oaklandcc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.oaklandcc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=student.oaklandcc.edu header.i=@student.oaklandcc.edu header.a=rsa-sha256 header.s=google header.b=Kvwr0N3w
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0d91601bdso8031697b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:14:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793902482; cv=none;
        d=google.com; s=arc-20260327;
        b=fadbDxagUqEYrNGYK7+Umj5AvS87/+5qhSURzClqtJre5vTRvyEfTvI9fzIkSudHFA
         Zxl02ywFVzhLhsPv/zjfuArmpXUeHajK+hciwxZ2ydr6kg3qxzSidl8Lrt+9olzvYvkz
         SJkuvFyCiPUK0YoC4IyndWELgikVrt4zaJ4/4mzXcaTK7URKCiDZgb+JzMnufdVHhXVF
         cmBxV0zwT16S2GhFMKZFqjJxJgOIOWggX7HkR4279Yqs+OXUQNij8rcpHadp8OSkacfR
         NpEUCs0EocvA2Gj7hYTjGSpatrQBrjycXfUKLRFtWuzYKS5cVtZPylKV4sqg7ysGJp8e
         A1tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=k69fxDmtmmF6Y3dZct9TP630KoCBBlkteFGCi7Y2r6o=;
        fh=2gDyYQIHb9aJ1cX0t3L/sNveasn0qmWja5InutxCMGs=;
        b=JtHc1vwmLTgSQebGaRT55cgD3vus4MS02YGUCL6DWHXwgyr3nCXRN0NcCRaazan+l7
         BOg63mz5RR5M1axJGbT5Yd0Kqm4zQ3oar8R5QQo7YcyD2DTat1OGzNybJbFrKtgKF1qF
         /EAcDUp/8DFNaMEQjSJJRreUCukTTTElQTpFOias5ajdR1o2v+GId1pw7xtttv2Fw3ms
         DWV9v34YNbKYS9NFzrm6R3vnxajr5LQFTT0Prt27lJVH7Rbp6/u6dCSeL9Ru5xmXjk3+
         BukYvEBB2xNOdOBQW1TKTPfi24Ek7M3bEqu/JtVArnMQ5JDzF/Euj6S3wMETUc0hSXoX
         7RkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=student.oaklandcc.edu; s=google; t=1793902482; x=1794507282; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k69fxDmtmmF6Y3dZct9TP630KoCBBlkteFGCi7Y2r6o=;
        b=Kvwr0N3wJcuMs7cGXUZBxJtEaOzeSX2XPoDoVeZS8hq++Ke6HbWvywy2wThr+XW+P8
         U1AMiClyMZPXUgzBUARJ7EBZnsm75rovNxs1CNIC+GVfF+nfrOqT5jCVAMsITy7aCxmS
         Kk8Qb4p4wwzx0xZP9rVj8MtBvc1O89NlNWoGHdI5YHasV0y3Z0TIzPVC/4H5LJ6ic0B9
         h4I6X5Num32/yzBi6uWSoiHPXc+4wMsZ5jYcxnTQPjUGfTeSrO3j/owjROA9XpeFbhMc
         VYe+x7L+PvSn3SvjABWpIXpoI1DOQk9B0EC32AXeZ7FC0G4zizNJkwTgS19VYJ2Rxr0V
         EcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902482; x=1794507282;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k69fxDmtmmF6Y3dZct9TP630KoCBBlkteFGCi7Y2r6o=;
        b=MDtJEQvszrbarAO0t+B3tt9EjYWCstkm+GTPi2c3wTWJGZ3JUP5qldMbQn318S/VWp
         JGjA33d+/wamDoJLNH46i+Dy4PKmZNzd//BG5t7Pjx5dVNTwzsvXurMDb92CcunAT4MQ
         WaC9FfwMOmfMU+blzyUqOgNQDSZ3o+09qmOVk2uAgOWFPC56XyJ5Z32A2F/eBKaLlPxi
         u7ApiRc4UORITsU33agSmWBixxSUaFmACbE+awzyfMlbnexRh1CI/pfiy5TkBhUBSTPV
         iHN+BL0Bu4Lzys3zUrCrrnJ5Wis+hFLMJ2aO+jqJLrEwTujuNVlN/2eZ9GJloe/uzyeh
         F7Tw==
X-Forwarded-Encrypted: i=1; AL+hErHNyN1JVQX6QIUtQV+QJGJgN3q7O7lClBp7jPLMoqc+TKhcr0fdE/0enFpIyhTp4kywN8T8zaRA2cVyAf4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9S4Btc1UFjjztzRJAcmVsBvj3dLzoKQaQylPDbT7GjdWykENG
	E7dY1Y+wTyRPA3oMHoQrRZ/P/EWUY+2C0B2Io7kGJ+tHw2gJxTmQ8VcotQ7g/pXEN4boYIoWHSo
	vjKV+z1Gz09cG5YVbi/qIhOjh64PKOezhosG9Di4l6w==
X-Gm-Gg: AYBFou0YNlMOAjRk3Ln70ltefA22EnZyNFPwGHLZjOi/HAwn5xF+us+/Lx9Mlk7ZybN
	mGV+IH3Cs8aEq+8y4Y/5Xmkz+JPiHC+9+Kvb8NO2EBukAgUCtHU+KHAoNRplrY1EXp/qTa+NC9Z
	rBZKUhqzqLZV9zK5FkddZyY3cQoaC9a96WzcqebL+n91DaWd7ffIwiDo0Z9jSqHISwydUtoHhD8
	Id+MbxsmXsoqDULfYRlj3qJOK6P8aV5/aNYOVV8f6AXdNXFJxwUZZe+p2ot1YUxBtg9jjHkemG1
	6jlKV+tDFMEfffGRX6i2DWuJifjRiczA0qjlkQYyLD99eokLrWkrSf/29kBhbiXNYSg47FB4IYa
	Kc1A2E2Rp/CfI8EE59u1gopuPftQzZeIKow==
X-Received: by 2002:a05:690c:a012:b0:8b0:e13c:2852 with SMTP id
 00721157ae682-8b328db53bfmr18059617b3.7.1793902481851; Thu, 05 Nov 2026
 10:14:41 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 10:14:40 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 12:14:22 -0600
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
 Thu, 5 Nov 2026 12:13:40 -0600
From: "Louis H. Poulin II" <poulin.louis@student.oaklandcc.edu>
In-Reply-To: <CAGQButum4PYb4A+hmqg-bJZbf4L3KkH6rT9tn-0_NTs3xLhGYw@mail.gmail.com>
References: <CAGQButum4PYb4A+hmqg-bJZbf4L3KkH6rT9tn-0_NTs3xLhGYw@mail.gmail.com>
Date: Thu, 5 Nov 2026 10:14:40 -0800
X-Gm-Features: AclHuK-pWE1BEpdoomXA8eGheOMWNCk027wBT3itki_9ei4qUXSDyfyqr1wzuzc
Message-ID: <CAGQButurzJT6fQqqxO9xD0GABME=AtGeYS0kQf-jDFSqKH6GaA@mail.gmail.com>
Subject: [PATCH 1/2] kunit: tool: Count failed suites with only skipped tests
To: brendan.higgins@linux.dev, david@davidgow.net
Cc: raemoar63@gmail.com, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A suite can report not ok while all its child cases are skipped.
The parser retains the suite status as FAILURE but counts only the
skipped children. The run status is then derived from those counts and
incorrectly reports SKIPPED.

When a suite reports failure and the child aggregate is SKIPPED, add
a failed count for the suite, as is already done when child aggregate
is SUCCESS. Cover a correctly numbered failing suite with a skipped
child.

Fixes: d65d07cb5b01 ("kunit: tool: improve compatibility of
kunit_parser with KTAP specification")

Signed-off-by: Louis H. Poulin II <poulin.louis@student.oaklandcc.edu>
---
 tools/testing/kunit/kunit_parser.py    |  4 +++-
 tools/testing/kunit/kunit_tool_test.py | 13 +++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/tools/testing/kunit/kunit_parser.py
b/tools/testing/kunit/kunit_parser.py
index d722874b..dce365d1 100644
--- a/tools/testing/kunit/kunit_parser.py
+++ b/tools/testing/kunit/kunit_parser.py
@@ -694,7 +694,9 @@ def bubble_up_test_results(test: Test) -> None:
 	elif test.counts.get_status() == TestStatus.TEST_CRASHED:
 		test.status = TestStatus.TEST_CRASHED

-	if status == TestStatus.FAILURE and test.counts.get_status() ==
TestStatus.SUCCESS:
+	# Preserve a failing suite result when its children all pass or skip.
+	if (status == TestStatus.FAILURE and
+			test.counts.get_status() in (TestStatus.SUCCESS, TestStatus.SKIPPED)):
 		counts.add_status(status)

 def parse_test(lines: LineStream, expected_num: int, log: List[str],
is_subtest: bool, printer: Printer) -> Test:
diff --git a/tools/testing/kunit/kunit_tool_test.py
b/tools/testing/kunit/kunit_tool_test.py
index 85ae2175..5fd386d0 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -265,6 +265,19 @@ class KUnitParserTest(unittest.TestCase):
 		self.assertEqual(kunit_parser.TestStatus.SKIPPED, result.status)
 		self.assertEqual(result.counts, kunit_parser.TestCounts(skipped=5))

+	def test_failed_suite_with_skipped_child_fails(self):
+		output = ['KTAP version 1', '1..1',
+			'    KTAP version 1', '    # Subtest: suite', '    1..1',
+			'    ok 1 - case # SKIP reason', 'not ok 1 - suite']
+		result = kunit_parser.parse_run_tests(output, stdout)
+		suite = result.subtests[0]
+		self.assertEqual(kunit_parser.TestStatus.SKIPPED, suite.subtests[0].status)
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, suite.status)
+		self.assertEqual(suite.counts,
+			kunit_parser.TestCounts(failed=1, skipped=1))
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
+		self.assertEqual(result.counts, suite.counts)
+
 	def test_ignores_hyphen(self):
 		hyphen_log = _test_data_path('test_strip_hyphen.log')
 		with open(hyphen_log) as file:
-- 
2.53.0
