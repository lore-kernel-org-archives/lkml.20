Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9562B3C3F76
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719136; cv=none; b=BwBAZD0ZlKH4lGSXkI1e81QTBLZzwc4FmrnIaOOwreeWhLWdkGNo4e5cHYwBLxU2znl6umCxGIKq9DiET5DvZ09pwbWxl2lChHgXm0yJIUJVzU+/Ef9cVFelvCRq5uLffBw+3jDxZAb8CQWg2Wnw6SbzSVUww1fpF7WG2Wh1jvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719136; c=relaxed/simple;
	bh=hvh7Fm/j3aBL/wBpwy/HKc/4RjZNtLWRXqjw4OYPCZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SWnpylDxnQCp4kFl12Deg6MhUM8OfiDx/RbTrxfttjIM0ii+UTxnGm+6dE7dzjcySnyOzS557L4GHcM7KHp1kJVs9gSAqeQaqqb81sqtJFTnMx4NxpvqRvp5QCYIiZMwKjoVtng9qwws2WA2LJji7XJrLfveFi6hJNFQM22GOdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=l71f0IUv; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="l71f0IUv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=HG
	O/EJNlhwEgKvNl0pFOLbWwNg/SsXvmoRzHr86FwAY=; b=l71f0IUvljqiMCHUmS
	KwagzAd8hxC6oQ4U0PAyrIgib+dEnViQY6kbVoiQzx8dJ9xwiiVv8+DTT1tAxUBp
	6QvgU02HvI6UknPHHnFW9Q+kCC/xzNaC0yAGRUKPx9GZ5Rd7WYSca23nlmYO1SLA
	F4VUskhHcbtQ1t/arAk+N66VQ=
Received: from deepin (unknown [])
	by gzsmtp3 (Coremail) with UTF8SMTPA id M88vCgD3P5cQ8qxqHkUlAA--.61508S2;
	Fri, 18 Sep 2026 16:10:57 +0800 (CST)
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
Subject: [PATCH v3 0/2] list: add missing empty list check to list_cut_before()
Date: Fri, 18 Sep 2026 16:10:24 +0800
Message-ID: <20260918081026.8050-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD3P5cQ8qxqHkUlAA--.61508S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr4DKr4DGFWUWr18Cr48Zwb_yoW3KFg_W3
	40k3s5Cr4kZa1UtayxJF9ayFZ5uay7Xrn5ZF1xWr13Cry29w1UGFykCrnxX3Z5Wr9YqFyx
	W34kA3Z5ZrnYvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiNBGGR2qs8hES+gAA3p

v3:
- Elaborate the rationale in the commit message, as requested
  by Andy Shevchenko.
- Add Reviewed-by from Andy Shevchenko to patch 2/2.

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

