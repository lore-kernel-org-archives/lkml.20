Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D254FDE61
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649845; cv=none; b=swsur9Mx7fkBpRSKBW13ooPtD8k36dLTBHJkuAFyqSs9bDTne8rXJaX+7L1wwuz12jqgtmZEsMGVmEvbRf4Oypv2Rk+rXlyTCU+KuRi2pJGOCvlwFjETfhvcmUhFLHu97VzumfNrv0X8YW0lewDvB/i9XnFl8xx1i98a0fuaPcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649845; c=relaxed/simple;
	bh=MASPkbQOt8+v5DhrINNpRpBC5fcOe7PFfzzz+xzhTtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CWnSIFfWpZJhYXaDgz1s/r37vt3zXlYn2/U8YE83JqB6VG9LCsoRMJO9WjEfqiWiSX0wKSOjqPhnEUHMUrVoHDqKfHnZBK/TqV0gpBBaht8wiEzbdnlIRwNPuiXFnA+f32WWhsaOEHil5FDv9a0DpLLup4PEkdSOII+RGFBq8xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=qF61VdUJ; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="qF61VdUJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ah
	3giLfJuk/TXnUarY/+RjA5PWAFHKErjJXcXmYpHp0=; b=qF61VdUJy0aurE7fK9
	jXDAZfS8cf0tPORV5a/z9kRpoZg7joODLXvSzLPctxFao2vVrYfVZrDFoqYzG6jU
	Ll143KLBtlPC0bHrS/XVTdHAoK8nFRKgArsE5knJ7cF77RBDdT833gWDR/LHNlzm
	JfBoQ6NMSXQasbnKfstO2zz4k=
Received: from deepin (unknown [])
	by gzsmtp3 (Coremail) with UTF8SMTPA id M88vCgD3r5dQ46tqBSYYAA--.16246S4;
	Thu, 17 Sep 2026 20:55:48 +0800 (CST)
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
Subject: [PATCH v2 2/2] list: add KUnit test for list_cut_before() empty list case
Date: Thu, 17 Sep 2026 20:55:05 +0800
Message-ID: <20260917125505.50897-3-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260917125505.50897-1-zhangcoder@yeah.net>
References: <20260917125505.50897-1-zhangcoder@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD3r5dQ46tqBSYYAA--.16246S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1UXw13GFWkGr18Zr13Arb_yoW8XFW8pr
	98Kr1vgFWUJF1Igw1xWFyxKrZavF4kJryj9ryfC3ykZFyUAa1UArnrGrWUZrn3XrW8ZFZ8
	Za1DtF17Jw4DJFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiNxSTVGqr41Q3gAAA3l

Add a test case covering list_cut_before() with an empty head
and an entry not on the list.  Without the empty list guard,
the call would corrupt the head list.

Signed-off-by: Ziran Zhang <zhangcoder@yeah.net>
---
 lib/tests/list-test.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/lib/tests/list-test.c b/lib/tests/list-test.c
index 6d9227a2b..f54facdb7 100644
--- a/lib/tests/list-test.c
+++ b/lib/tests/list-test.c
@@ -446,6 +446,23 @@ static void list_test_list_cut_before(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, i, 3);
 }
 
+static void list_test_list_cut_before_empty(struct kunit *test)
+{
+	LIST_HEAD(entry);
+	LIST_HEAD(head);
+	LIST_HEAD(list);
+
+	/*
+	 * entry is initialized but not on head.  With an empty head
+	 * this used to corrupt the list.
+	 */
+	list_cut_before(&list, &head, &entry);
+
+	KUNIT_EXPECT_TRUE(test, list_empty(&head));
+	KUNIT_EXPECT_TRUE(test, list_empty(&list));
+	KUNIT_EXPECT_TRUE(test, list_empty(&entry));
+}
+
 static void list_test_list_splice(struct kunit *test)
 {
 	struct list_head entries[5], *cur;
@@ -788,6 +805,7 @@ static struct kunit_case list_test_cases[] = {
 	KUNIT_CASE(list_test_list_is_singular),
 	KUNIT_CASE(list_test_list_cut_position),
 	KUNIT_CASE(list_test_list_cut_before),
+	KUNIT_CASE(list_test_list_cut_before_empty),
 	KUNIT_CASE(list_test_list_splice),
 	KUNIT_CASE(list_test_list_splice_tail),
 	KUNIT_CASE(list_test_list_splice_init),
-- 
2.51.0

