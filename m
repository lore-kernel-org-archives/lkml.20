Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAFD39B4A5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719186; cv=none; b=M5qLFOKYFb22g7zeCbi8PoOhvAe3vZ5LxP1Js6Efd3+q3Ew6ZPOK8hgVgAHybd33wRO1aKJcH0plunZqg/wR69OMk4EqcXBYWrnnHMEgY1OcYRib+3z5vOpskLKB7MbYj4j+bCm6e2XLtPzjJLsKQtsMOE/Rv6S8Ok34ppyopWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719186; c=relaxed/simple;
	bh=AA7Woc91+PRuZ1C/psObSUA6bs8HRfLq850FynxWm1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z63Bqa33eiHNUb0QkuCEmRXF2/vqsBiQp+aTowOPU1TIV0iTiW6ioeMEzc/sbjfDJ9B4jdn8SI4RTV2bImz52vNH4/QH+ZbKeLNGIEcRB93H+J5DEFL5b+ocshzlLIQ8qzegV36ppXH1Stv7LciwENS/yuY+cKyAXzmmwNLSt9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=KgsLg1gy; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="KgsLg1gy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=UI
	55jaVKKZuklPx4MeKfm/62j3yFw1VnDSH+x//D7TU=; b=KgsLg1gybvfQA+g5FM
	XA1GND1UI+NXb6PDn1Ffmsl8a7JukW3zeI6Vdl2yUByNMi3YB7Ij20vbHVfxhKLD
	XK3syTNVgt8onpLctA4O6HLEiUccml9FI3XYpjk9ER3DhWHpSXqj9zmrMGqj40fF
	X3kwgZCJDw7fcudF1K6zl7Fa0=
Received: from deepin (unknown [])
	by gzsmtp3 (Coremail) with UTF8SMTPA id M88vCgD3P5cQ8qxqHkUlAA--.61508S4;
	Fri, 18 Sep 2026 16:11:05 +0800 (CST)
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
Subject: [PATCH v3 2/2] list: add KUnit test for list_cut_before() empty list case
Date: Fri, 18 Sep 2026 16:10:26 +0800
Message-ID: <20260918081026.8050-3-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260918081026.8050-1-zhangcoder@yeah.net>
References: <20260918081026.8050-1-zhangcoder@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD3P5cQ8qxqHkUlAA--.61508S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1UXw13GFWkGr18Zr13Arb_yoW8WrW5pr
	98Kr1vgFW8JF1Igw1xXFyxKrZavF4kJryj9ryxC397ZryUAa1UArnrGrWUArn3XrW8ZFZ8
	Za1UtF47Gw4DJFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiIhmISWqs8hkEeAAA3r

Add a test case covering list_cut_before() with an empty head
and an entry not on the list.  Without the empty list guard,
the call would corrupt the head list.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

