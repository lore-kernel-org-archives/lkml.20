Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45504078CE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649843; cv=none; b=aU9+trSflkdgPHJYt+JSQKkMZ7DipTBquAgS1VInpbAvDbi0OZy8glufBYmgWirzYqyY3hZD/uEXBd8r7JRP+A5Key2mLOAlHWvYe/EZjrQuXlA/75Gt9Ky9M6fIVDB2gxu28lpNZJ7alzdHOnPCLqRiF430hoXQmMOnQVzw80s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649843; c=relaxed/simple;
	bh=M2ZZ19PlWxkgQmDhKpvRmx7Qw5KFrYNlF5amEtCurM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HIcKA64r4u3kwmA9x26YhAljSntJtRakD4kdpmhz36XG7lCHFULySaS5TfNEkDLH6dgjkQU4We9n/JSBYtkkLSnUq5UIMn6swcIbJrycOT95wE98Uv2AWczBtM+Aw2zyX/RIk5rNBd4dOpEXP2EEy3g/A7lS9z/wDhD/y/jLJIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=JAWvd3Bh; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="JAWvd3Bh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=cm
	TtdDTXxHY73xmx+ock/xF/s1fMYLbpV9qVemOyTWg=; b=JAWvd3Bh/dqzSYBJkZ
	oHjCXa+swiQZRZtU8CgAs/jFXHlDwdzEcOgGR0nUfL04zr7hb3jlaQxhLrXvyd4t
	+f2JPXaN+UicQ0J4e5XETofsAHYzziC1M3eyKhdp49NfYhNgjkSKS8pSdIFCiCh7
	hTwWQgbKjSc6rv1ikbkGGf/tU=
Received: from deepin (unknown [])
	by gzsmtp3 (Coremail) with UTF8SMTPA id M88vCgD3r5dQ46tqBSYYAA--.16246S2;
	Thu, 17 Sep 2026 20:55:45 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jordan R Abrahams-Whitehead <ajordanr@google.com>,
	Marco Elver <elver@google.com>,
	Nilay Shroff <nilay@linux.ibm.com>,
	Edward Cree <ecree@solarflare.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Ziran Zhang <zhangcoder@yeah.net>
Subject: [PATCH v2 0/2] list: add missing empty list check to list_cut_before()
Date: Thu, 17 Sep 2026 20:55:03 +0800
Message-ID: <20260917125505.50897-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD3r5dQ46tqBSYYAA--.16246S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr1kWrWxXFWDKrykWw45ZFb_yoWxtrb_W3
	40k3s5Jr1DZF4UtayIyFn3tFZ8u3y7Jrn5XF1xWry7Cr9Fkw1UAF1kGr1DJ3Z5Wr9Ygryx
	G34kA3Z5Xrn0yjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiNBGSU2qr41HrAgAA3+

v2:
- Add a KUnit test case as requested by Andy Shevchenko.
- Patch 1 adds the missing list_empty() guard, patch 2 adds the
  test case.

v1:
- https://lore.kernel.org/all/20260916100001.10634-1-zhangcoder@yeah.net/

Tested with:
  tools/testing/kunit/kunit.py run --kernel_args=kunit.filter_glob='list-kunit-test'

Test result:
  [PASSED] list_test_list_cut_before_empty
  Testing complete. Ran 40 tests: passed: 40

Ziran Zhang (2):
  list: add missing empty list check to list_cut_before()
  list: add KUnit test for list_cut_before() empty list case

 include/linux/list.h  |  5 +++++
 lib/tests/list-test.c | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

-- 
2.51.0

