Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794647846;
	b=2bF6/Rcn0O2W2M+TKrqa4yx+MI4k+Xhho44tDabqHr+7CLIsoQIq5RkXi8sr27hqr61N
	 4TxzF+l3TuSqBHWXpFKUkqt9Za6SlgCVWO+vEw94Cg6IGFiXpGGSIeqljj4UeMjttX2R8
	 GBDPZCQBqTfI0A0BwiUfehNnY0F+CXRxrFGeC9QfNVjB5KMMWfBT/iUhv9Yt6wzo6Ufla
	 UfHiD9GDLkITIgVyH48tdA4ciG0C2d15F/wbmmxBaLXopLiiDusLisE5YbWcWS4trjbkr
	 lc4QNfPMREUPJ1YaVaDDsfVeQs78xdAROMOH0kDyJH0x9V41gq9tu+Vz21RRrCuXF0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=mkmjD2w6BuG3aRUNMDh6318/ifTepnivrtcxC2LrWG8=;
	b=4UlsOphlQG8X1ZmvYVzraZ90joAVh4Qz24eZ5/d0d5sl7D6chOFa0W03pbPQJkazhiNS
	 IyJv6xLMHUCOinMwilSLScCAP5o/qB8OYA9PdG1lVrnwYHI5coJMkCkj7AByIkbSFSqF6
	 jjcnKkNLnrjhuSTM8iGnSQ9bglQpQijAMOc7CKBWI+s/rqYonnLP0RiKKCtRcyd7NHxYc
	 HsOnDPYFkqUk/vu0Q5g9wK8YckVF/TtMC9yeiQWPvVbUQpJ0MrVUEPy1hmmnTRjkGhIhZ
	 9nbWp7Nn20b6PBa1pYUJfXzD5DKJURglRFHDGx1mYyEvn59E8Fic093YFzzuXKOif3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zuoHyeq2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA82E606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA82E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zuoHyeq2
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d28f75d62so404308066b.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:17:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794647844; cv=none;
        d=google.com; s=arc-20260327;
        b=aPCv5KxObeitpkINJM6OULyI8b8z7ERDfhpjzJjesrrnqAOmZe6N9Rv+aCNZxtPRLB
         HbShX1pJ82DK5LJQ1Bhjj0isVhmbek4bDg9INYu3qT+GX3BuL43IGlQVyd6+GcC1GKDb
         JVZnA5FgEX/he1YrG85W8+/QLshRD3PkyZUJld9hk7umqgCUvTdd+s9K0p27Wor9GA5D
         +BXjqHsXss1TWhsnp/kdW2wYe7uDGyXV/0y72J/olDx9xZBVdyCGmEDU3ELOl8RO4Wk2
         6hVMmcdonsiG0ilabinakQ+/X1f7N9mu2kEpQb+k98agqFhM3E3vKeB4DevKtFw0GDz0
         qJfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mkmjD2w6BuG3aRUNMDh6318/ifTepnivrtcxC2LrWG8=;
        fh=u0YFDexhe+U9NeVa/15J3LnLCNgB/QSCWVoy+C0b1rA=;
        b=miWBLD+LlgJ3S9U42PFR6d6lVzP5Udg2QYygtNJ63fI63tBAj7M/N9rXRHH3y9edOh
         o5I1tug/ex+rpGAkf1ICoR53KNUIH7w96wu+vtwG8jPPpq8i3Dqgull+/WAQulMpMdAx
         leZQpf56GnhBabmMPsi4mTAVX0NzcCnmgY4BOHYSj36wFqbH3TWMt7EvUrQaKfkPLl34
         22fUnR0ZnRG/B5YpPTGqOBFlFDFCq9tP0qdDxFt4mQSpGvrPXqM+PBBLSG5/eL8dvZuI
         5rET8E36YIUOjShML6JRUaOkw5YEkMRasQViAoKMs19j1ylxlvVmYPXsXVZA3GWWtf2l
         JeYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794647844; x=1795252644; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mkmjD2w6BuG3aRUNMDh6318/ifTepnivrtcxC2LrWG8=;
        b=zuoHyeq28xYk/LkSZzD8EwyUVkcS8Ed3zGazNJNNODS59hIqCO95aozy3R/cca1rSr
         t7B67SIGfsKYQ8EGX2QZSFsl0j5k9UMSvhMbNJWpZKPY/6ZXjR5/FIDlODuog6aT/jts
         w5CM8fxUhXLAksP5M9wLde2w3HHXBpLehV2feC86d+L0pE/jfMyGTO6yhgLnMfAmuAUv
         bqiZ1Qp79q3IC2yFoT5aXoDb2HUclPtmRJftexpcfkOLo/yMTUcLM2t2fRI5deqkEY97
         +pQrz6smxXxPda7/ZKT843Xc2KQmeFHK5sgAiIrknrFz9ThVFTWQZR5Gajy7QdRa5zG+
         9FJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794647844; x=1795252644;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mkmjD2w6BuG3aRUNMDh6318/ifTepnivrtcxC2LrWG8=;
        b=bWfE3VHsqAy0iQBDAKSukxqydBGMhBIiT2a3waNpTlhpZUh7Pj04X8RsU6KluA5KNE
         JjwIem7AEzT9kgLioVWr4K5c+GGJFksphUhPmZm157N4c6Ft54vQQKxg/NPrPSs5JEjx
         kwNLPVjEGXV4AUZeHddY9IOtiZ9mproFhL2v+qYi08f6FQ0lnT1KasRIVPgCx5koJrWN
         sYxRQ2Mi0AHbgYmOBt8ziz/+A8/oR+4UiGXOvxwIjvdo3sxXIoZooEN/JQayNMIFmeE2
         OvFWprnBWft7ySCV+yQIPaDUlGXE5ba/WQmoy2DwbhUua3zVB9eS6NdUJjd8u3oWu6xf
         hkuQ==
X-Forwarded-Encrypted: i=1; AL+hErG8kBoXVKxvuN0JolZs/H0sELHWBWlZxPfordU7Nk+z0i1BE//wWiaN3wircyFW0NfjqS8LbUn+3ekh33E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/qYB7A6bDlAgLGg2Am8mrfYJYD/OrkJhAgyE9cnKqsjJn5KzY
	qOXBHvOTjK2DviB/85jixXpljD/YjeUvSBTo3pJhpSHbdiZZrhwHoftVY7h6m2LKwbLC5rRZJdp
	O+T9zuEgtxdM49B4Entb7OrWShJI1IiaPZ8HK/c4=
X-Gm-Gg: AYBFou2Oq+Mc+Tjg2B+1lM3Hub5GD0qNjpSXYItl9RL5OdjgQFEy4ezDDWa44RAopHj
	3MZUHQ4QSPHfJMPjAuYjY9VNdHB+/iFMMXJUY9NUo7tXcxVzOJ/fe4userWaJjcUSEYT0cyrnSR
	Pc5NwqwpGwAytjFepES6JeWEKuj8VjZXnG2/ztrHsu+oeVZ/W0eVfg+gHiG9UhCssElVJmZ0NH+
	KAHxMOBxZleomas46WSdButimOZCRk3P1vdXlgNLimzFORzi0dc6zJwfEnKh2GVi4Q/DyPZzFdW
	JE8135rGyA/O6iBEXttIeLOg7Oyc4+/sWnpNTdsbaeUX0kY/xDhZjCsLISW9j9MogZQK6re3wm6
	qT1zuBVo7DMPU7D5gYjhp+NKwiXF83xyb3e1/vv+IQIPcLn9bIcmR4auNunssgpkT4JxraU5Fgp
	LAE6LhkBo4x2UFv4pylDG9yZFMcuKDQUNTBts2SGGb
X-Received: by 2002:a17:907:97cf:b0:c50:4d71:a855 with SMTP id
 a640c23a62f3a-c509636747cmr373247266b.19.1794647843950; Sat, 14 Nov 2026
 01:17:23 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 14 Nov 2026 03:17:22 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Matus Daniil <matus.daniil@gmail.com>
Date: Sat, 14 Nov 2026 03:17:22 -0600
X-Gm-Features: AclHuK_-xZ7mU1NTkodBroHEs2k2-ma0Wf43DuoTZk_clmWCABnU1f1w0Md0UBg
Message-ID: <CAJeAFep5wgtRpHwANoeqJkWE38y=9zQQ9e7moQw-3rE47b=wFw@mail.gmail.com>
Subject: [PATCH] kunit: tool: Preserve suite ancestry in JUnit test identities
To: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>
Cc: Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Daniil Matus <matus.daniil@mail.ru>

JUnit testcases currently carry only a name. A parameterized KUnit test
becomes a nested testsuite named after the test function. Reusing that
function in several outer suites therefore produces the same immediate
suite name and parameter name in each of them.

For example, cs_dsp_test_run_stop_callbacks is registered in four cs_dsp
callback suites with the same "all ops" parameter. GitLab identifies cases
by suite name, classname and testcase name. Without a classname, these
distinct cases have identical keys in the imported report.

Set classname to the dot-separated ancestor suite names, including the
parser's main root. Preserve the existing suite hierarchy, testcase names,
statuses and logs. Add a regression using the existing nested log fixture,
whose seven testcases otherwise have only five distinct identity tuples.

Validation: all 92 kunit_tool_test.py tests pass. The new regression fails
on the unmodified generator. Comparing all 24 log fixtures shows no XML
changes other than the added classname attributes.

Fixes: e9e05c72752f ("kunit: tool: Add (primitive) support for
outputting JUnit XML")
Signed-off-by: Daniil Matus <matus.daniil@mail.ru>
---
 tools/testing/kunit/kunit_junit.py     | 10 +++++++---
 tools/testing/kunit/kunit_tool_test.py | 14 ++++++++++++++
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/tools/testing/kunit/kunit_junit.py
b/tools/testing/kunit/kunit_junit.py
index 362207035..d5730aebe 100644
--- a/tools/testing/kunit/kunit_junit.py
+++ b/tools/testing/kunit/kunit_junit.py
@@ -10,7 +10,8 @@ from kunit_parser import Test, TestStatus
 from typing import Optional

 # Get a string representing a tes suite (including subtests) in JUnit XML
-def get_test_suite(test: Test, parent: Optional[ET.Element]) -> ET.Element:
+def get_test_suite(test: Test, parent: Optional[ET.Element],
name_prefix: str = '') -> ET.Element:
+	classname = f'{name_prefix}.{test.name}' if name_prefix else test.name
 	suite_attrs = {
 		'name': test.name,
 		'tests': str(test.counts.total()),
@@ -26,9 +27,12 @@ def get_test_suite(test: Test, parent:
Optional[ET.Element]) -> ET.Element:

 	for subtest in test.subtests:
 		if subtest.subtests:
-			get_test_suite(subtest, test_suite_element)
+			get_test_suite(subtest, test_suite_element, classname)
 			continue
-		test_case_element = ET.SubElement(test_suite_element, 'testcase',
{'name': subtest.name})
+		test_case_element = ET.SubElement(test_suite_element, 'testcase', {
+			'name': subtest.name,
+			'classname': classname,
+		})
 		if subtest.status == TestStatus.FAILURE:
 			ET.SubElement(test_case_element, 'failure', {}).text = 'Test Failed'
 		elif subtest.status == TestStatus.SKIPPED:
diff --git a/tools/testing/kunit/kunit_tool_test.py
b/tools/testing/kunit/kunit_tool_test.py
index 85ae21754..d37354c70 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -18,6 +18,7 @@ import os
 import signal
 import subprocess
 import sys
+import xml.etree.ElementTree as ET
 from typing import Iterable

 import kunit_config
@@ -725,6 +726,19 @@ class KUnitJUnitTest(unittest.TestCase):
 		self.assertTrue("tests=\"0\"" in result)
 		self.assertFalse("testcase" in result)

+	def test_nested_test_classnames_junit(self):
+		result = self._junit_string('test_is_test_passed-all_passed_nested.log')
+		testcases = ET.fromstring(result).iter('testcase')
+		self.assertEqual([
+			('main.sysctl_test', 'sysctl_test_dointvec_null_tbl_data'),
+			('main.sysctl_test.example', 'example_simple_test'),
+			('main.sysctl_test.example', 'example_mock_test'),
+			('main.sysctl_test', 'sysctl_test_dointvec_table_len_is_zero'),
+			('main.sysctl_test', 'sysctl_test_dointvec_table_read_but_position_set'),
+			('main.example', 'example_simple_test'),
+			('main.example', 'example_mock_test'),
+		], [(case.get('classname'), case.get('name')) for case in testcases])
+

 class KUnitMainTest(unittest.TestCase):
 	def setUp(self):

base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0
