Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023C251596E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919610; cv=pass; b=Db3YGEgVEUcw9N3TdZJDbf6H6BZIOuDxQdciPguKMOh8vsW3Fac6SnB9z6E7AIVdhscesl45nEYHxT1MXK3AhRkO9QcBym5AcJnWZmByY8RDZ9r0btxFpuEV1zddkZyf04X3iiB+VKmBdcyibNiCtkvtDH+mDjIeYzL5u3En4KQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919610; c=relaxed/simple;
	bh=8ka4q1KK0fW/BGTp7rl53tFGJzuhjINRBDv+MXNJkdI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=E3qdV0X5lJvCZgHsxVgJx0qsqjPFXGLoQGxJn0xYQoRJAZlAy1VzZnBq01pcrTVUgLpYqmAppVMpInkF1cl4TYbJ9ZsuAsC0H12ZQm4YaU1ipTYn1FuDT70mlzqraUgGeshGzevmvmP7+qC4tFU5SYgLM/NzkSxeu3ltzsGMaLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USHKady8; arc=pass smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USHKady8"
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2e60e97f158so19776645ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791919608; cv=none;
        d=google.com; s=arc-20260327;
        b=By0a19EvgueBQVVAKj0EsQBqUfEbUS84JVKPVJr4YxbbgmXy75kJ5kazNyJXGq/WYv
         MBFDXXOw7kOQK6u5yQuWAqvM9qonc8HQigwZXVc/z0cxwjwN0o146gT9x/CgKU1cObpW
         oEBiRGG35jc6bN7fREgk0ZoBI+xt3WZFU0GUIf2mb9Vp1zQd9iCFuh+bGy+L3LCyMYdL
         Go1fjxthwvHg3FD7Hk5kS2Zshrq/yAW7cgBmlNKWX4+ELrUSoEErRx/8oLk1Tp50JL83
         JaXHqHJV6dyM/3zJC+hslTGj5OzsyUVeVUZFsnJbZgW8AiK01J3pyKiTLMbNkSZscZpK
         dhpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=yGO2CkNY642DwHHU7AtKwsaD6YR1oevFy+Ta3M7wXgU=;
        fh=MDB0MLVnOButcnai7O0LQr7QmLI5oy547WdOF5KcduY=;
        b=Z0hacZ1KW3dY0yU5m3z5zTWudc8RZNv6tFJvLefNt7IsoDq9sSMO8sOQ7AH/hd4204
         bCjJlPjkgnbKk1aaYy3YMj+uJZYMedhEBUojZ1sV9XvgyzQ10GmrxAt9hW3UNd/js4SF
         Ni1hOB2nF/ahC0ZOannrMriU1J45CamN+qtLUuiSnIAIC5T2Q40tIXhwu2Y6FRGjFVra
         7bi+Uj5vByHNJz2ljE7ZagShdBkdlymkVjCd5RfUPzoyNgejFROmWlBiqd+LMY9JHxoA
         EKW8OYVg49r+hqLH5lL4rC+D4Sq2PDaLkWn9EYhRkn19hAo8xrxYzWnqo3ySQA1frE6R
         41qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791919608; x=1792524408; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yGO2CkNY642DwHHU7AtKwsaD6YR1oevFy+Ta3M7wXgU=;
        b=USHKady84enV074drcCnQDqZ+csD0M302pGSSLlH0fd+9bfIN1gWcAxIwDiGMr+GIo
         0pi/j6SoLVPxfRWwabXcoJUUjK950N3EMu/HKYBK2GcmqEzMyxc4rATrc3pfOiCmoQeF
         211GkOAKKkOiIdKUnDKIzKwqqvcJdSh968TsxLMryjDwueTduwXTaWQy0aGrtsBZ6cBW
         QPMX0/ng5nKpTeZWiiWrUPr/1fiJCy4WTPN+PrMUZWk5xn4hRNEmcI8fioaLDAmlTdcn
         0WMPZqxYq5il6hZDYjqF6bP22l5tsYt+gDGX2U834PPAR2Qr4byR4MSWenZQiyxEr0Dc
         PHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791919608; x=1792524408;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yGO2CkNY642DwHHU7AtKwsaD6YR1oevFy+Ta3M7wXgU=;
        b=OMP/RmvzViC4gMLuvpW1Z2AHRKvhJ20h6z9UX/hP00Fi+nRIs6/GmfAZCIRoc7Bo8/
         5lwN4XwTONv3zyNHGtmSXMt6gwdJwXnXSQ+lWRvpgYjClIbAv+4zJlkSpOGNOcWsqz8w
         yQd2ck4rDzrzMf+g0F8G2+XWfTA+jEb5uvwQMQmbphHEtHmouQu7dSvqcpYnQ2Qp6btC
         vrO9zHQbMwEOiI3wK1DaOpqvzyGHjY51y398C00HAQBM61IKwT4Ofm+/cxZG6msy2fS4
         UtGNTf5tfcxWexX6NOW0xHX8jqXJ7zMt8/iOELtb4titC0a5S9DrU28KnqLg+IHGzaKs
         eTlg==
X-Forwarded-Encrypted: i=1; AKwUvBx8nfEHyeollF9SHd5xEBjOh9zABJpflHE8jTSNQUwjLKlE100N95r3BSy34RhY1xcMTCKBkYRQw60mul8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/n/vYkQ3A8S16PR2Ij+LD4n3X+Vm1cmgPSmEPeMX+2Mll1h1Z
	Y9CTlmm9rNqe07TNky27M4nI25ha5ssMIgLuW5pz6LpQXjx5CF/7n/KEOSXOyJvnAqEKG7koeBB
	cnHYozL32Cqf4inLT7nBcCZlpeHpTm6miPi79EHjHh9ZM
X-Gm-Gg: AYBFou27jnJYrP9iTQGnxzXni5X9jga9QEs3W4O9gi5ppjybQhqnz5/tsvtr5LdZE+N
	ANAltd1ZXWBeLQ1l587TF/dDQl1Gnge7sM3iVuuSLP6jQi+wq2onQSCBf9ewDIDK5S3Zzg3nxrL
	UAZWswHwyYIKiHFMseXSKQGKjzzkMo11Whs5MSR0SRBWrJVF3bxFul5EmqVmu3ZZ08hvijQRxd2
	3gUM6XvEs4zkvIp9G1FKRuGGtoUkQPBkWu2hxlJmw1QLK2c6lsBet66eLEyJBI00/0f0S1Lvz3h
	Qdk00mPqI9r59YezBpLLGsZaqJPF7zA0JTnht+UB2/XHMBM2gjpo
X-Received: by 2002:a05:6a21:3b8d:b0:3e0:ca2a:f9e with SMTP id
 adf61e73a8af0-3e1d25889b8mr863599637.39.1791919608114; Tue, 13 Oct 2026
 12:26:48 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 13 Oct 2026 12:26:47 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 13 Oct 2026 12:26:47 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rowan Vale <i46475812@gmail.com>
Date: Tue, 13 Oct 2026 12:26:47 -0700
X-Gm-Features: AclHuK8z0f5f-xNogq-tJPITNRjWjPlgjKDkJ5DRXZAhxM0OyQGM9LJKmluhxb0
Message-ID: <CA+yQJ6mTGC-e8O1g-wtz1Gvb1+dHG0apkatg9Bzp6wPetYfuuw@mail.gmail.com>
Subject: [PATCH] kunit: tool: Treat all-skipped results as success when parsing
To: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>
Cc: Rae Moar <raemoar63@gmail.com>, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Parsing a log where every test is skipped exits with status 1, even
though the summary reports no failures. This can cause a CI job that
parses results collected separately to fail solely because all tests
were skipped. The run and exec commands already treat this outcome as
success.

Reuse _map_to_overall_status() in parse_tests() so the parse command
handles skipped results consistently with exec_tests(). Keep failures,
crashes and missing test results unsuccessful.

Add command-line regression coverage using the existing log fixtures.

Fixes: 5acaf6031f53 ("kunit: tool: Support skipped tests in kunit_tool")
Signed-off-by: Rowan Vale <i46475812@gmail.com>
---
Validation: all 94 kunit_tool_test.py tests pass on Python 3.12.14.
The added all-skipped regression fails before the fix. CLI checks keep
failed, crashed and missing-test logs unsuccessful, and preserve skipped
counts in JSON and JUnit exports. Only the Python tool was tested; no
full kernel build or hardware run was performed.

 tools/testing/kunit/kunit.py           |  6 ++----
 tools/testing/kunit/kunit_tool_test.py | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index 91d234ac3..eb660b46c 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -277,10 +277,8 @@ def parse_tests(request: KunitParseRequest,
metadata: kunit_json.Metadata, input
 			kunit_junit.write_junit_result(test=test,filename=request.junit)
 			stdout.print_with_timestamp(f"Test results stored in
{os.path.abspath(request.junit)}")

-	if test.status != kunit_parser.TestStatus.SUCCESS:
-		return KunitResult(KunitStatus.TEST_FAILURE, parse_time), test
-
-	return KunitResult(KunitStatus.SUCCESS, parse_time), test
+	kunit_status = _map_to_overall_status(test.status)
+	return KunitResult(kunit_status, parse_time), test

 def run_tests(linux: kunit_kernel.LinuxSourceTree,
 	      request: KunitRequest) -> KunitResult:
diff --git a/tools/testing/kunit/kunit_tool_test.py
b/tools/testing/kunit/kunit_tool_test.py
index 85ae21754..1e65b36d4 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -747,6 +747,26 @@ class KUnitMainTest(unittest.TestCase):
 		self.assertEqual(self.linux_source_mock.build_reconfig.call_count, 1)
 		self.assertEqual(self.linux_source_mock.run_kernel.call_count, 0)

+	def test_parse_skipped_all_tests(self):
+		kunit.main(['parse', _test_data_path('test_skip_all_tests.log')])
+		self.print_mock.assert_any_call(StrContains('skipped: 5'))
+
+	def test_parse_passed_tests(self):
+		for log in ('test_is_test_passed-all_passed.log',
+			    'test_skip_tests.log'):
+			with self.subTest(log=log):
+				kunit.main(['parse', _test_data_path(log)])
+
+	def test_parse_failed_tests(self):
+		for log in ('test_is_test_passed-failure.log',
+			    'test_kernel_panic_interrupt.log',
+			    'test_is_test_passed-no_tests_run_with_header.log',
+			    'test_is_test_passed-no_tests_run_no_header.log'):
+			with self.subTest(log=log):
+				with self.assertRaises(SystemExit) as e:
+					kunit.main(['parse', _test_data_path(log)])
+				self.assertEqual(e.exception.code, 1)
+
 	def test_build_passes_args_pass(self):
 		kunit.main(['build'])
 		self.assertEqual(self.linux_source_mock.build_reconfig.call_count, 1)

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.51.1
