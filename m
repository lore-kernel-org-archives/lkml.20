Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9FF4BD355
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886959; cv=none; b=s2BGjW3+oArUsU8Yk+eYViNGWxLGWMneM7zPwOsTfdW9Tu7y5/IvFGlKj8ERfIu4xbrFHYrit+V65t9bh9mEJRJp78RWYonSeSz7vVBO0nfOLYglQRK3vlaH/bHBy6fDoewinfssNWg9MCI7XWgGZJXasP1xwpLVVxt+xowej8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886959; c=relaxed/simple;
	bh=aXw1L7g/upf/F3tnOXBS/dAE7Az9MAaw8sM83XMWJFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iKXP++IySTVS6VJ1h2nU8KEJ4rh1zqZCzjuoUSw34ioDDMpblkV9zmKn6gpZmQO4qviHw0B6HMgMuRCPLCKWIJ64S/zAemiAK3+CxQSPau08KCTrugsrfHx8pvx66lEacbRXfF79MTTv1QFRrCQzsGXGSINC+sVPjN1x26ZK9BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbaTtQFQ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbaTtQFQ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so3074262a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791886956; x=1792491756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNO0S4V3NLwBUeXdjMEGGTCuH76HrYE6Qlz+uekWGHI=;
        b=XbaTtQFQpmJeNKVahdkVQpkwCQt8mF9fF2MisEpwkYSWbeeXxYJjCIIe9iJ7NzcP2r
         F8hmSHiBT7NI5yqhaRMXio83I7th11+8Z/IjyVYpzYLO+BL6A3N309/YsTD08UO/jg/k
         LyYLWGDQ4z+MXuAujoYfzBCRFrCH+Rq9ZeiCJkmIaocky64U0OSQBElarD1EdGfj8e3h
         qI3uC8jyrPbneUf95gJmz1bF9JmplE8miSTAFZqCcIVt+ZQlc+aMB0ZB6FUJ6DQmIZNx
         byiEZzYgEdootKWbC3yie6ScWhEMcONLSXJIeWYu6VCv9I9IXUBtsKjdqvP0+gb4jTYM
         p1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886956; x=1792491756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNO0S4V3NLwBUeXdjMEGGTCuH76HrYE6Qlz+uekWGHI=;
        b=OMnHZwYAMWTBkZrH/FOeexLJby+U2hDRgHHJYF+7B2Dn1uEVMteXcCeO0uqaF+NFFw
         tPoIrBiX6bQcr3aslMvIaSpEKvc2YCu0BW1jIHa/dPptqzBjtdDYg/yZwNtT4vyhSPrS
         OfVLpcnz0GQdr4BN4CaBpqf3PDkgBIiX8CnnNjGyZ5iYWnN1FTiIhCn70Qbbuqt0j6uH
         7o3d88pAxzj6CNaBjzYdnzHk3+VHVRBbHYeAfuF+h48OdVQXUPa4J4JXoHVRyss1x3iM
         T6Uc1JIco6aADRXzK9mo/Mtp9rKslhVJrSIbUM1CvB98owuiwZySHUVduKffHaZGRqJg
         F78Q==
X-Forwarded-Encrypted: i=1; AKwUvBynXqwVUeWAp/dOYzKa1fDTrb5ijfWR3Hg0UcwE0lyxUwlyBzGPEJSZK/i3IEI+4c0mELX13mj61kDso1M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRYGhWQ2TjV5iZPD1nM6b7djROuX0B0/gC86ONY2jK5thML3by
	0kyRAVmw9QlOwv2jOZkgr8PHfA+eh7oqymMl9neHXFTI/yW8v5ho/jUu
X-Gm-Gg: AYBFou1Cp7VQySrNIwQfZQ7xCrLvstD5doEH17vt+cDfClr6EbQB0N7Jhue4uqfeL1y
	Gfqy5sX1cnUZmubtvbW8JmgKaBJHd/NWYl7FiDGatm8tYSg1HgMMmv7Z63Bm4V3Ot/C/Anb3cxG
	4mj/RgcivMNATGxS74cnBgtZwhM3DNubRAF5rhF8AOdS8i1eehFTqIrc+C83jhAcTq2ww+ZfMWY
	prFxSTS557s4y9U1Pt0Dng8jqlwo7JYB1uc5e4FYyrVo2ld82mChas6LdjDoSoWZ0y3n1iwx4Gh
	zEi0XcXf8zoLE3/l0L51KDu1phSYy8hjkvDoRjYiZEM1gW6U7Jsn927OzKmW7qUEmWLzZgknWq1
	8kMw9ZGMvObUbyyRYQb87gpggJkkOkM04tW/PJ+ruocElx61/T8DDs25yifTuLEqTuM3Z7tXEsU
	bM+ZKMRg1Pxb2ic7KEE6u4CNV/kXIUx033xgCmEWMMooZo0qpbnJu8sZXQF3GPiH8vFAxWGbm4R
	wRfnb7cxhKjTn1/qhCy3S6aq7vrFyN/Tw==
X-Received: by 2002:a05:6402:2348:b0:6ae:a675:62dd with SMTP id 4fb4d7f45d1cf-6b17c2bfb46mr10924005a12.42.1791886955466;
        Tue, 13 Oct 2026 03:22:35 -0700 (PDT)
Received: from [127.0.0.2] ([2a05:f6c4:d34b:0:eb4c:5610:e9e4:9d1e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34d011dfccsm230739766b.42.2026.10.13.03.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:22:34 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Date: Tue, 13 Oct 2026 12:22:24 +0200
Subject: [PATCH v3 4/4] Documentation: kunit: add documentation and
 examples to kunit documentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-lockdep-kunit-v3-4-cdb8ff720c1f@gmail.com>
References: <20261013-lockdep-kunit-v3-0-cdb8ff720c1f@gmail.com>
In-Reply-To: <20261013-lockdep-kunit-v3-0-cdb8ff720c1f@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 Malte Wechter <maltewechter@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886944; l=4664;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=aXw1L7g/upf/F3tnOXBS/dAE7Az9MAaw8sM83XMWJFM=;
 b=197PL5sRImc434TSktPNDLm91sYqlCMcYaOqmobuwHoZ5KhTY6cLKelkof6ky+vRYJbqrT+m1
 xtS9GuurHSRCR2QUeq6SU8ntr6qrQ23Suo3a5TjE/CC+RL85z9iqllK
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

add documentation section to Documentation/dev-tools/kunit
named "Failing Tests on Lockdep Reports and Kernel Warnings", which
explains the additional configurations namely:
CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP and CONFIG_KUNIT_FAIL_TEST_ON_WARN,
when and how they are useful as well as an example of an invocation.

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
 .../dev-tools/kunit/failing_on_warnings.rst        | 78 ++++++++++++++++++++++
 Documentation/dev-tools/kunit/index.rst            |  1 +
 2 files changed, 79 insertions(+)

diff --git a/Documentation/dev-tools/kunit/failing_on_warnings.rst b/Documentation/dev-tools/kunit/failing_on_warnings.rst
new file mode 100644
index 000000000000..cf502995368b
--- /dev/null
+++ b/Documentation/dev-tools/kunit/failing_on_warnings.rst
@@ -0,0 +1,78 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================================================
+Failing Tests on Lockdep Reports and Kernel Warnings
+====================================================
+
+By default, a KUnit test only fails if one of its own expectations or
+assertions fails. If the code under test triggers a lockdep report or a
+``WARN()``, the problem is printed to the kernel log, but the test still
+passes and a bug is easily missed.
+
+KUnit provides two optional config options that turn these problems into
+test failures.
+
+Config options
+==============
+
+``CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP``
+	Fail a test case if lockdep reports a problem (and turns off
+	``debug_locks``) while the test runs, which is useful for any test
+	that takes locks. Locking bugs are reported by the test that
+	triggered them. Requires lockdep, e.g. ``CONFIG_PROVE_LOCKING=y``.
+
+``CONFIG_KUNIT_FAIL_TEST_ON_WARN``
+	Fail a test case if the kernel becomes tainted with ``TAINT_WARN``
+	while the test runs, i.e. if the test triggered a ``WARN()``. Since
+	a warning usually indicates a bug, this is useful for any test that
+	does not intentionally trigger a ``WARN()``. If you trigger a ``WARN()``
+	on purpose use ``kunit_warning_suppress(test)`` otherwise your test
+	will be marked as a failure.
+
+Forcefully skipped tests
+========================
+
+Once lockdep has reported a problem, ``debug_locks`` stays off, and the
+``TAINT_WARN`` taint cannot be cleared. The kernel is therefore considered
+unreliable for the rest of the run, so after the failing test, all
+remaining test cases are *forcefully skipped* instead of being run.
+
+A forcefully skipped test case is reported as a skip with a
+``force skip:`` reason, for example:
+
+.. code-block:: none
+
+	ok 2 foo_test # SKIP force skip: debug_locks are off
+
+Unlike an ordinary skip, a forced skip does not mean the test does not
+apply; it means the test could not be trusted to run. A suite in which
+at least one test case was forcefully skipped is reported as follows:
+
+- **Failed**, if a test case failed, and the remaining test cases were
+  forcefully skipped as a result. This is the common case.
+- **Passed**, if the forcefully skipped test cases only follow passing
+  ones. This is rare, and implies that something other than the test
+  cases themselves triggered the lockdep report or ``TAINT_WARN``.
+- **Forced skipped**, if all test cases in the suite were forcefully
+  skipped, typically because an earlier suite already left the kernel
+  unreliable. In the KTAP output, such a suite is reported as
+  ``not ok``.
+
+The suite statistics count forced skips separately as ``forced_skip``,
+and ``kunit.py`` shows such test cases as ``[FORCE SKIPPED]``.
+
+Running tests with the options enabled
+======================================
+
+The options can be added to a ``kunit.py`` run with ``--kconfig_add``,
+options CONFIG_KUNIT_FAIL_TEST_ON_WARN and CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP
+are independent of each other. Here is an example of running kunit tests with both configs:
+
+.. code-block:: bash
+
+	./tools/testing/kunit/kunit.py run \
+		--kconfig_add CONFIG_DEBUG_KERNEL=y \
+		--kconfig_add CONFIG_PROVE_LOCKING=y \
+		--kconfig_add CONFIG_KUNIT_FAIL_TEST_ON_WARN=y \
+		--kconfig_add CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP=y
+
diff --git a/Documentation/dev-tools/kunit/index.rst b/Documentation/dev-tools/kunit/index.rst
index b3593ae29ace..bdef2913da36 100644
--- a/Documentation/dev-tools/kunit/index.rst
+++ b/Documentation/dev-tools/kunit/index.rst
@@ -17,6 +17,7 @@ KUnit - Linux Kernel Unit Testing
 	style
 	faq
 	running_tips
+	failing_on_warnings
 
 This section details the kernel unit testing framework.
 

-- 
2.54.0

