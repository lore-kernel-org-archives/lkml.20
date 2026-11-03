Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705826;
	b=2QhUEKKHor4NR5yZHqqGBW59jUUWMxDrwrBEEW65D98EJxJ4pYJuEjMgsC0jB8Pkch5a
	 Sb+cIT4ZWadUMsVbUn/C9Iu/z1wOA0rq5M8JqLjLe+LqgHOwlWBfc75Mpre3YciyDtxos
	 0evYFUNtQPZYboJJimjJII/FgYFORuiJcK56DLV4Hb/jRuJgi+yONRWzTh4VVg1xeMnsW
	 qkrKAqJ8ODesZkxj83p5KurwJPI4+0goBLjyYQsO9F/b7N7zteZN+bICrTm7Gh30QXEW6
	 dFxHa261RPaveFcplg6zN+wkW3MJMkl2ak+avN40doFhyo5y8M3F/b/uzYlhjiRc4Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705826;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=NBs9C++pRilgEs9nqQDItlpupLh9JPq0Ys7igAdV7mM=;
	b=ayeSr8cvsmsyc7jRk7omJQp0530mpj6nBOJAZLVMMPp+UIcP4zSmtdOuItJexvdP3z1U
	 RcYqTVVDljcuKU11EeKnGGOSH7KbrWS+Y7ahTc4Hkj4Hzghq7VQz/j+GsGooz5WwmZBAa
	 N2RUz+8Anv+pdYocYi2W/bUMSbqkhlTHHd5wuKY7hVM381TaiSHKumTFloDrXT5qM3T5H
	 Boa4zzTK9ehr90Sfp7v+ON8I2L/xyBBv1oMgg5+5SE8d49SqXmUsoqgWr6SQ1Cic+dcEa
	 SiiuBfNhZhpBJKQZj8sk7u3H9IGetS2ERtYvfSqH7YMGtGfSXg7Sgl9k+juhpaN0Mfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=CaYnp+WV;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03E6606D83E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B03E6606D83E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=CaYnp+WV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=CaYnp+WVuIaGoVFFfmIZbyKAbvc8a/laHLHDD5MllhNhkj9uPTIDJcBtKRjjCeKsj0tibHVJJljSO
	 4As8gO6lefc6nZeqFDu3CnTBsmgPNPN5QRPwID/5QBg3TNPV7cA+SBJrX4aAGtI//1DlGlQc/hhRoS
	 roDQJC0khv9K0oRc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26ae9c756cdc-d0614;
	Tue, 03 Nov 2026 19:36:54 +0800 (CST)
X-RM-TRANSID:2ee26ae9c756cdc-d0614
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from dsh.local (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96ae9c754042-f8069;
	Tue, 03 Nov 2026 19:36:54 +0800 (CST)
X-RM-TRANSID:2ee96ae9c754042-f8069
From: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, richard120310@gmail.com, handyhandyman.adam@gmail.com, tglx@kernel.org
Subject: [PATCH] lib/tests: add KUnit tests for the priority sorted list (plist)
Date: Tue, 03 Nov 2026 19:36:52 +0800
Message-ID: <20261103-plist-kunit-1-yuehongwu@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.43.0

lib/plist.c has no KUnit coverage; its only test is the in-module
plist_test() under CONFIG_DEBUG_PLIST, which BUG_ON()s on the first
violation and does not report results in KTAP format.  The code has seen
three regression-class changes since mid-2024:

  commit c8dab79f9eef ("lib/plist.c: avoid worst case scenario in plist_add")
  commit 95d4b3450ebe ("lib/plist.c: add shortcut for plist_requeue()")
  commit 43c91b152243 ("lib/plist: fix plist_requeue() corrupting order in the last bucket")

The last one has no regression test: plist_kunit_requeue_last_bucket()
covers exactly that wrap-around, and the other cases pin down the ordering
invariants the previous two changes rely on.  KUnit coverage makes such
ordering regressions visible in CI, where CONFIG_DEBUG_PLIST is not
normally enabled.

Add lib/tests/plist_kunit.c, a KUnit suite that exercises plist_add(),
plist_del() and plist_requeue() and validates the invariants documented
in include/linux/plist.h after every operation:

  - node_list stays sorted by ascending numeric priority (descending
    priority order) with FIFO order inside a priority bucket;

  - exactly the first node of each bucket is linked on prio_list, and
    the headless prio_list ring visits the bucket heads in node_list
    order before wrapping back to the first bucket (a single bucket
    degenerates to a self loop on the first node).

The fixed cases cover bucket head handover on delete (first, middle and
last bucket), the plist_requeue() shortcut with and without a following
bucket, requeueing the head of the first and of the last bucket where the
ring wraps around, the INT_MIN/INT_MAX extremes, and plist_first_entry()/
plist_last_entry().  A deterministic pseudo-random add/del/requeue churn
test mirrors the in-module test but draws priorities from a small range
so that multi-node buckets actually occur, and every requeue in the loop
moves a node (a requeue without a same-priority successor is a no-op).

The suite is wired up as CONFIG_PLIST_KUNIT_TEST next to the other
library KUnit tests and is enabled by default with KUNIT_ALL_TESTS.

The tests were built into an x86_64 kernel and run under QEMU/KVM with
kunit.enable=1 kunit.filter_glob=plist*: 17 of 17 tests pass.

Signed-off-by: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
---
 lib/Kconfig.debug       |  19 ++
 lib/tests/Makefile      |   1 +
 lib/tests/plist_kunit.c | 650 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 670 insertions(+)
 create mode 100644 lib/tests/plist_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2d22638..cbf7ab2 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3065,6 +3065,25 @@ config MIN_HEAP_KUNIT_TEST
 
 	  If unsure, say N
 
+config PLIST_KUNIT_TEST
+	tristate "KUnit test for priority sorted list (plist)" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds the priority sorted list (plist) KUnit test suite.
+	  It checks that plist_add(), plist_del() and plist_requeue()
+	  maintain the ordering invariants of the two-level list, including
+	  the priority bucket boundary cases.
+
+	  KUnit tests run during boot and print their results in KTAP format.
+	  Only useful for kernel developers running the KUnit test harness,
+	  not for production builds.
+
+	  For more information on KUnit and unit tests in general please refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
+
 config IS_SIGNED_TYPE_KUNIT_TEST
 	tristate "Test is_signed_type() macro" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index df0537e..84569a1 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -43,6 +43,7 @@ obj-$(CONFIG_MEMCPY_KUNIT_TEST) += memcpy_kunit.o
 obj-$(CONFIG_MIN_HEAP_KUNIT_TEST) += min_heap_kunit.o
 CFLAGS_overflow_kunit.o = $(call cc-disable-warning, tautological-constant-out-of-range-compare)
 obj-$(CONFIG_OVERFLOW_KUNIT_TEST) += overflow_kunit.o
+obj-$(CONFIG_PLIST_KUNIT_TEST) += plist_kunit.o
 obj-$(CONFIG_PRANDOM_KUNIT_TEST) += random32_kunit.o
 obj-$(CONFIG_PRINTF_KUNIT_TEST) += printf_kunit.o
 obj-$(CONFIG_RANDSTRUCT_KUNIT_TEST) += randstruct_kunit.o
diff --git a/lib/tests/plist_kunit.c b/lib/tests/plist_kunit.c
new file mode 100644
index 0000000..c108363
--- /dev/null
+++ b/lib/tests/plist_kunit.c
@@ -0,0 +1,650 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * KUnit tests for the priority sorted list (plist) structures.
+ *
+ * Checks that plist_add(), plist_del() and plist_requeue() maintain the
+ * ordering invariants documented in include/linux/plist.h, with extra
+ * attention to the priority bucket boundary cases of the prio_list ring.
+ */
+
+#include <kunit/test.h>
+
+#include <linux/limits.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/plist.h>
+
+/* Upper bound for the node_list walk, so a corrupted list fails instead
+ * of hanging the boot.
+ */
+#define PLIST_KUNIT_MAX_NODES	4096
+
+struct plist_kunit_item {
+	int			id;
+	struct plist_node	node;
+};
+
+/*
+ * Walk both the node_list and the prio_list ring and check the invariants
+ * of a plist:
+ *
+ *  - node_list is sorted by ascending numeric priority (i.e. descending
+ *    priority order), with same-priority nodes in FIFO order;
+ *  - exactly the first node of every priority bucket is linked on the
+ *    prio_list ring, and the headless ring visits the bucket heads in
+ *    node_list order before wrapping back to the first bucket;
+ *  - when the list holds a single bucket the ring degenerates to a self
+ *    loop on the first node, which list_empty() reports as empty.
+ *
+ * Returns the number of nodes on the list.
+ */
+static int plist_kunit_verify(struct kunit *test, struct plist_head *head)
+{
+	struct plist_node *pos, *prev = NULL, *first, *ring, *next;
+	int nr_nodes = 0, nr_heads = 0, nr_ring = 0;
+
+	if (plist_head_empty(head)) {
+		/* Same predicate on the other half of the head node. */
+		KUNIT_EXPECT_PTR_EQ(test, head->node_list.prev,
+				    &head->node_list);
+		return 0;
+	}
+
+	first = plist_first(head);
+
+	plist_for_each(pos, head) {
+		if (++nr_nodes > PLIST_KUNIT_MAX_NODES) {
+			KUNIT_FAIL(test, "node_list does not terminate");
+			return nr_nodes;
+		}
+
+		if (prev) {
+			KUNIT_EXPECT_LE(test, prev->prio, pos->prio);
+			/*
+			 * A node sharing its predecessor's priority is a
+			 * bucket follower and must not be linked on the
+			 * prio_list ring; a node starting a new bucket must.
+			 */
+			if (prev->prio == pos->prio) {
+				KUNIT_EXPECT_TRUE(test,
+						  list_empty(&pos->prio_list));
+			} else {
+				KUNIT_EXPECT_FALSE(test,
+						   list_empty(&pos->prio_list));
+				nr_heads++;
+			}
+		} else {
+			nr_heads++;
+		}
+		prev = pos;
+	}
+
+	KUNIT_EXPECT_PTR_EQ(test, prev, plist_last(head));
+
+	if (nr_heads == 1) {
+		/* Single bucket: the ring is a self loop on the first node. */
+		KUNIT_EXPECT_TRUE(test, list_empty(&first->prio_list));
+		return nr_nodes;
+	}
+
+	KUNIT_EXPECT_FALSE(test, list_empty(&first->prio_list));
+
+	ring = first;
+	do {
+		if (++nr_ring > nr_heads) {
+			KUNIT_FAIL(test, "prio_list ring does not close");
+			return nr_nodes;
+		}
+		KUNIT_EXPECT_FALSE(test, list_empty(&ring->prio_list));
+		next = list_entry(ring->prio_list.next, struct plist_node,
+				  prio_list);
+		if (next != first)
+			KUNIT_EXPECT_LT(test, ring->prio, next->prio);
+		ring = next;
+	} while (ring != first);
+
+	KUNIT_EXPECT_EQ(test, nr_ring, nr_heads);
+
+	return nr_nodes;
+}
+
+static void plist_kunit_add_empty(struct kunit *test)
+{
+	PLIST_HEAD(head);
+	struct plist_node a;
+
+	plist_node_init(&a, 10);
+
+	KUNIT_EXPECT_TRUE(test, plist_head_empty(&head));
+	KUNIT_EXPECT_TRUE(test, plist_node_empty(&a));
+
+	plist_add(&a, &head);
+
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 1);
+	KUNIT_EXPECT_FALSE(test, plist_head_empty(&head));
+	KUNIT_EXPECT_FALSE(test, plist_node_empty(&a));
+	KUNIT_EXPECT_PTR_EQ(test, plist_first(&head), &a);
+	KUNIT_EXPECT_PTR_EQ(test, plist_last(&head), &a);
+}
+
+static void plist_kunit_add_order(struct kunit *test)
+{
+	PLIST_HEAD(head);
+	struct plist_node n[4];
+	int i;
+
+	plist_node_init(&n[0], 30);
+	plist_node_init(&n[1], 10);
+	plist_node_init(&n[2], 40);
+	plist_node_init(&n[3], 20);
+
+	/* Insert the nodes out of order. */
+	for (i = 0; i < ARRAY_SIZE(n); i++)
+		plist_add(&n[i], &head);
+
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 4);
+	KUNIT_EXPECT_PTR_EQ(test, plist_first(&head), &n[1]);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&n[1]), &n[3]);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&n[3]), &n[0]);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&n[0]), &n[2]);
+	KUNIT_EXPECT_PTR_EQ(test, plist_last(&head), &n[2]);
+}
+
+static void plist_kunit_add_duplicates(struct kunit *test)
+{
+	PLIST_HEAD(head);
+	struct plist_node a, b, c, d, e;
+
+	plist_node_init(&a, 5);
+	plist_node_init(&b, 5);
+	plist_node_init(&c, 9);
+	plist_node_init(&d, 5);
+	plist_node_init(&e, 7);
+
+	plist_add(&a, &head);
+	plist_add(&b, &head);
+	plist_add(&c, &head);
+	plist_add(&d, &head);
+	plist_add(&e, &head);
+
+	/* node_list: a(5), b(5), d(5), e(7), c(9) -- FIFO in a bucket. */
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 5);
+	KUNIT_EXPECT_PTR_EQ(test, plist_first(&head), &a);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&a), &b);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&b), &d);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&d), &e);
+	KUNIT_EXPECT_PTR_EQ(test, plist_last(&head), &c);
+
+	/* Only the first node of each bucket leads the prio_list ring. */
+	KUNIT_EXPECT_FALSE(test, list_empty(&a.prio_list));
+	KUNIT_EXPECT_TRUE(test, list_empty(&b.prio_list));
+	KUNIT_EXPECT_TRUE(test, list_empty(&d.prio_list));
+	KUNIT_EXPECT_FALSE(test, list_empty(&e.prio_list));
+	KUNIT_EXPECT_FALSE(test, list_empty(&c.prio_list));
+
+	KUNIT_EXPECT_PTR_EQ(test, a.prio_list.next, &e.prio_list);
+	KUNIT_EXPECT_PTR_EQ(test, e.prio_list.next, &c.prio_list);
+	KUNIT_EXPECT_PTR_EQ(test, c.prio_list.next, &a.prio_list);
+}
+
+/*
+ * Adding ascending priorities makes every node the new last bucket, the
+ * case the reverse walk in plist_add() is meant to short-circuit.
+ */
+static void plist_kunit_add_ascending(struct kunit *test)
+{
+	PLIST_HEAD(head);
+	struct plist_node n[16];
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(n); i++) {
+		plist_node_init(&n[i], i);
+		plist_add(&n[i], &head);
+		KUNIT_ASSERT_EQ(test, plist_kunit_verify(test, &head), i + 1);
+	}
+
+	KUNIT_EXPECT_PTR_EQ(test, plist_first(&head), &n[0]);
+	KUNIT_EXPECT_PTR_EQ(test, plist_last(&head), &n[15]);
+}
+
+/* Adding descending priorities makes every node the new first bucket. */
+static void plist_kunit_add_descending(struct kunit *test)
+{
+	PLIST_HEAD(head);
+	struct plist_node n[16];
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(n); i++) {
+		plist_node_init(&n[i], ARRAY_SIZE(n) - i);
+		plist_add(&n[i], &head);
+		KUNIT_ASSERT_EQ(test, plist_kunit_verify(test, &head), i + 1);
+	}
+
+	KUNIT_EXPECT_PTR_EQ(test, plist_first(&head), &n[15]);
+	KUNIT_EXPECT_PTR_EQ(test, plist_last(&head), &n[0]);
+}
+
+static void plist_kunit_add_extremes(struct kunit *test)
+{
+	PLIST_HEAD(head);
+	struct plist_node a, b, c;
+
+	plist_node_init(&a, 0);
+	plist_node_init(&b, INT_MAX);
+	plist_node_init(&c, INT_MIN);
+
+	plist_add(&a, &head);
+	plist_add(&b, &head);
+	plist_add(&c, &head);
+
+	/* INT_MIN is the highest priority, INT_MAX the lowest. */
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 3);
+	KUNIT_EXPECT_PTR_EQ(test, plist_first(&head), &c);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&c), &a);
+	KUNIT_EXPECT_PTR_EQ(test, plist_last(&head), &b);
+}
+
+static void plist_kunit_del_bucket_head(struct kunit *test)
+{
+	PLIST_HEAD(head);
+	struct plist_node a, b, c;
+
+	plist_node_init(&a, 1);
+	plist_node_init(&b, 1);
+	plist_node_init(&c, 2);
+
+	plist_add(&a, &head);
+	plist_add(&b, &head);
+	plist_add(&c, &head);
+
+	/* Removing the bucket head hands prio_list over to the successor. */
+	plist_del(&a, &head);
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 2);
+	KUNIT_EXPECT_TRUE(test, plist_node_empty(&a));
+	KUNIT_EXPECT_FALSE(test, list_empty(&b.prio_list));
+	KUNIT_EXPECT_PTR_EQ(test, plist_first(&head), &b);
+
+	/* Removing the last node of the last bucket empties the list. */
+	plist_del(&c, &head);
+	plist_del(&b, &head);
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 0);
+	KUNIT_EXPECT_TRUE(test, plist_head_empty(&head));
+
+	/* A removed node can be added back. */
+	plist_add(&a, &head);
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 1);
+	KUNIT_EXPECT_PTR_EQ(test, plist_first(&head), &a);
+}
+
+static void plist_kunit_del_bucket_follower(struct kunit *test)
+{
+	PLIST_HEAD(head);
+	struct plist_node a, b, c;
+
+	plist_node_init(&a, 1);
+	plist_node_init(&b, 1);
+	plist_node_init(&c, 2);
+
+	plist_add(&a, &head);
+	plist_add(&b, &head);
+	plist_add(&c, &head);
+
+	/* Removing a bucket follower must not disturb the prio_list ring. */
+	plist_del(&b, &head);
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 2);
+	KUNIT_EXPECT_FALSE(test, list_empty(&a.prio_list));
+	KUNIT_EXPECT_FALSE(test, list_empty(&c.prio_list));
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&a), &c);
+	KUNIT_EXPECT_PTR_EQ(test, a.prio_list.next, &c.prio_list);
+	KUNIT_EXPECT_PTR_EQ(test, c.prio_list.next, &a.prio_list);
+}
+
+static void plist_kunit_del_middle_bucket(struct kunit *test)
+{
+	PLIST_HEAD(head);
+	struct plist_node a, b, c;
+
+	plist_node_init(&a, 1);
+	plist_node_init(&b, 2);
+	plist_node_init(&c, 3);
+
+	plist_add(&a, &head);
+	plist_add(&b, &head);
+	plist_add(&c, &head);
+
+	/* Removing the only node of a middle bucket splices the ring. */
+	plist_del(&b, &head);
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 2);
+	KUNIT_EXPECT_TRUE(test, plist_node_empty(&b));
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&a), &c);
+	KUNIT_EXPECT_PTR_EQ(test, a.prio_list.next, &c.prio_list);
+	KUNIT_EXPECT_PTR_EQ(test, c.prio_list.next, &a.prio_list);
+}
+
+/*
+ * Deleting the head of the last priority bucket: its follower takes over
+ * the prio_list entry, and the ring of bucket heads has to wrap round to
+ * the first bucket.
+ */
+static void plist_kunit_del_last_bucket_head(struct kunit *test)
+{
+	PLIST_HEAD(head);
+	struct plist_node a, b, c;
+
+	plist_node_init(&a, 1);
+	plist_node_init(&b, 2);
+	plist_node_init(&c, 2);
+
+	plist_add(&a, &head);
+	plist_add(&b, &head);
+	plist_add(&c, &head);
+
+	plist_del(&b, &head);
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 2);
+	KUNIT_EXPECT_TRUE(test, plist_node_empty(&b));
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&a), &c);
+	KUNIT_EXPECT_FALSE(test, list_empty(&c.prio_list));
+	KUNIT_EXPECT_PTR_EQ(test, a.prio_list.next, &c.prio_list);
+	KUNIT_EXPECT_PTR_EQ(test, c.prio_list.next, &a.prio_list);
+}
+
+static void plist_kunit_requeue_basic(struct kunit *test)
+{
+	PLIST_HEAD(head);
+	struct plist_node a, b, c;
+
+	plist_node_init(&a, 1);
+	plist_node_init(&b, 2);
+	plist_node_init(&c, 2);
+
+	plist_add(&a, &head);
+	plist_add(&b, &head);
+	plist_add(&c, &head);
+
+	/* A node whose successor has a different priority is left alone. */
+	plist_requeue(&a, &head);
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 3);
+	KUNIT_EXPECT_PTR_EQ(test, plist_first(&head), &a);
+
+	/* Requeueing moves a node after its same-priority peers. */
+	plist_requeue(&b, &head);
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 3);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&a), &c);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&c), &b);
+
+	/* Requeueing the last node of the list is a no-op. */
+	plist_requeue(&b, &head);
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 3);
+	KUNIT_EXPECT_PTR_EQ(test, plist_last(&head), &b);
+
+	/* ...and the peers rotate back. */
+	plist_requeue(&c, &head);
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 3);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&a), &b);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&b), &c);
+}
+
+/*
+ * The plist_requeue() shortcut: after plist_del() the node's same-priority
+ * successor took over the prio_list entry, so the node can be inserted
+ * directly before the next bucket instead of walking the node_list.
+ */
+static void plist_kunit_requeue_shortcut(struct kunit *test)
+{
+	PLIST_HEAD(head);
+	struct plist_node a, b, c, d;
+
+	plist_node_init(&a, 1);
+	plist_node_init(&b, 2);
+	plist_node_init(&c, 2);
+	plist_node_init(&d, 3);
+
+	plist_add(&a, &head);
+	plist_add(&b, &head);
+	plist_add(&c, &head);
+	plist_add(&d, &head);
+
+	plist_requeue(&b, &head);
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 4);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&a), &c);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&c), &b);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&b), &d);
+
+	/* The tail of its bucket has a different priority: no-op. */
+	plist_requeue(&b, &head);
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 4);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&c), &b);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&b), &d);
+}
+
+/*
+ * Regression test for commit 43c91b152243 ("lib/plist: fix
+ * plist_requeue() corrupting order in the last bucket"): when the
+ * requeued node heads the last priority bucket, the prio_list ring of the
+ * bucket heads wraps round to the first bucket, and the node must end up
+ * at the very end of the list instead of jumping to its front.
+ */
+static void plist_kunit_requeue_last_bucket(struct kunit *test)
+{
+	PLIST_HEAD(head);
+	struct plist_node a, b, c, d, e;
+
+	plist_node_init(&a, 0);
+	plist_node_init(&b, 1);
+	plist_node_init(&c, 1);
+
+	plist_add(&a, &head);
+	plist_add(&b, &head);
+	plist_add(&c, &head);
+
+	plist_requeue(&b, &head);
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 3);
+	KUNIT_EXPECT_PTR_EQ(test, plist_first(&head), &a);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&a), &c);
+	KUNIT_EXPECT_PTR_EQ(test, plist_last(&head), &b);
+
+	/* The same wrap with an intermediate bucket before the last one. */
+	plist_node_init(&d, 2);
+	plist_node_init(&e, 2);
+	plist_add(&d, &head);
+	plist_add(&e, &head);
+
+	plist_requeue(&d, &head);
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 5);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&b), &e);
+	KUNIT_EXPECT_PTR_EQ(test, plist_last(&head), &d);
+}
+
+/*
+ * Requeueing the head of the first priority bucket: its follower takes
+ * over the bucket, so the node moves behind it and the new first bucket
+ * has to be linked in the prio_list ring instead.
+ */
+static void plist_kunit_requeue_first_bucket_head(struct kunit *test)
+{
+	PLIST_HEAD(head);
+	struct plist_node a, b, c;
+
+	plist_node_init(&a, 1);
+	plist_node_init(&b, 1);
+	plist_node_init(&c, 2);
+
+	plist_add(&a, &head);
+	plist_add(&b, &head);
+	plist_add(&c, &head);
+
+	plist_requeue(&a, &head);
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 3);
+	KUNIT_EXPECT_PTR_EQ(test, plist_first(&head), &b);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&b), &a);
+	KUNIT_EXPECT_PTR_EQ(test, plist_next(&a), &c);
+	KUNIT_EXPECT_TRUE(test, list_empty(&a.prio_list));
+	KUNIT_EXPECT_FALSE(test, list_empty(&b.prio_list));
+	KUNIT_EXPECT_PTR_EQ(test, b.prio_list.next, &c.prio_list);
+	KUNIT_EXPECT_PTR_EQ(test, c.prio_list.next, &b.prio_list);
+}
+
+static void plist_kunit_first_last_entry(struct kunit *test)
+{
+	PLIST_HEAD(head);
+	struct plist_kunit_item items[3];
+	struct plist_kunit_item *first, *last;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(items); i++) {
+		items[i].id = i;
+		plist_node_init(&items[i].node, i + 1);
+		plist_add(&items[i].node, &head);
+	}
+
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 3);
+
+	first = plist_first_entry(&head, struct plist_kunit_item, node);
+	last = plist_last_entry(&head, struct plist_kunit_item, node);
+	KUNIT_EXPECT_EQ(test, first->id, 0);
+	KUNIT_EXPECT_EQ(test, last->id, 2);
+
+	KUNIT_EXPECT_EQ(test, plist_next(&items[0].node)->prio, 2);
+	KUNIT_EXPECT_EQ(test, plist_prev(&items[2].node)->prio, 2);
+}
+
+/*
+ * Deleting and requeueing the priority extremes, including handing the
+ * prio_list ring over when the INT_MIN bucket head goes away.
+ */
+static void plist_kunit_extremes_ops(struct kunit *test)
+{
+	PLIST_HEAD(head);
+	struct plist_node a, b, c;
+
+	plist_node_init(&a, 0);
+	plist_node_init(&b, INT_MAX);
+	plist_node_init(&c, INT_MIN);
+
+	plist_add(&c, &head);
+	plist_add(&a, &head);
+	plist_add(&b, &head);
+
+	/* Deleting the INT_MIN head hands the ring over to the next bucket. */
+	plist_del(&c, &head);
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 2);
+	KUNIT_EXPECT_TRUE(test, plist_node_empty(&c));
+	KUNIT_EXPECT_PTR_EQ(test, plist_first(&head), &a);
+
+	/* Requeueing the INT_MAX tail node is a no-op. */
+	plist_requeue(&b, &head);
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 2);
+	KUNIT_EXPECT_PTR_EQ(test, plist_last(&head), &b);
+
+	/* Deleting the last bucket leaves a single-bucket list. */
+	plist_del(&b, &head);
+	KUNIT_EXPECT_EQ(test, plist_kunit_verify(test, &head), 1);
+	KUNIT_EXPECT_PTR_EQ(test, plist_first(&head), &a);
+	KUNIT_EXPECT_TRUE(test, list_empty(&a.prio_list));
+}
+
+/*
+ * Deterministic pseudo-random add/del/requeue churn, mirroring the
+ * in-module test under CONFIG_DEBUG_PLIST but checking the invariants
+ * after every operation with KUnit assertions instead of BUG_ON().
+ *
+ * Priorities are drawn from a small range so that the list actually
+ * contains multi-node priority buckets, and the requeue step picks a node
+ * that has a same-priority successor -- only such a node moves, so every
+ * requeue in the loop is a real move and its result is checked.
+ */
+static void plist_kunit_random(struct kunit *test)
+{
+	struct plist_node nodes[24];
+	PLIST_HEAD(head);
+	unsigned int r = 12345;
+	int i, loop, nr_expect = 0, nr_requeued = 0;
+
+	for (i = 0; i < ARRAY_SIZE(nodes); i++)
+		plist_node_init(&nodes[i], 0);
+
+	for (loop = 0; loop < 1000; loop++) {
+		r = r * 193939u % 47629u;
+		i = r % ARRAY_SIZE(nodes);
+		if (plist_node_empty(&nodes[i])) {
+			r = r * 193939u % 47629u;
+			plist_node_init(&nodes[i], r % 8);
+			plist_add(&nodes[i], &head);
+			nr_expect++;
+		} else {
+			plist_del(&nodes[i], &head);
+			nr_expect--;
+		}
+
+		KUNIT_ASSERT_EQ(test, plist_kunit_verify(test, &head),
+				nr_expect);
+
+		for (i = 0; i < ARRAY_SIZE(nodes); i++) {
+			struct plist_node *next;
+
+			if (plist_node_empty(&nodes[i]) ||
+			    &nodes[i] == plist_last(&head))
+				continue;
+			next = plist_next(&nodes[i]);
+			if (next->prio != nodes[i].prio)
+				continue;
+
+			plist_requeue(&nodes[i], &head);
+			nr_requeued++;
+
+			KUNIT_ASSERT_EQ(test,
+					plist_kunit_verify(test, &head),
+					nr_expect);
+			/* A requeued node is now the tail of its bucket. */
+			if (&nodes[i] != plist_last(&head))
+				KUNIT_EXPECT_NE(test, nodes[i].prio,
+						plist_next(&nodes[i])->prio);
+			break;
+		}
+	}
+
+	/* The requeue part of the churn must actually have run. */
+	KUNIT_EXPECT_GT(test, nr_requeued, 0);
+
+	for (i = 0; i < ARRAY_SIZE(nodes); i++) {
+		if (plist_node_empty(&nodes[i]))
+			continue;
+		plist_del(&nodes[i], &head);
+		nr_expect--;
+		KUNIT_ASSERT_EQ(test, plist_kunit_verify(test, &head),
+				nr_expect);
+	}
+
+	KUNIT_EXPECT_TRUE(test, plist_head_empty(&head));
+}
+
+static struct kunit_case plist_kunit_test_cases[] = {
+	KUNIT_CASE(plist_kunit_add_empty),
+	KUNIT_CASE(plist_kunit_add_order),
+	KUNIT_CASE(plist_kunit_add_duplicates),
+	KUNIT_CASE(plist_kunit_add_ascending),
+	KUNIT_CASE(plist_kunit_add_descending),
+	KUNIT_CASE(plist_kunit_add_extremes),
+	KUNIT_CASE(plist_kunit_del_bucket_head),
+	KUNIT_CASE(plist_kunit_del_bucket_follower),
+	KUNIT_CASE(plist_kunit_del_middle_bucket),
+	KUNIT_CASE(plist_kunit_del_last_bucket_head),
+	KUNIT_CASE(plist_kunit_requeue_basic),
+	KUNIT_CASE(plist_kunit_requeue_shortcut),
+	KUNIT_CASE(plist_kunit_requeue_last_bucket),
+	KUNIT_CASE(plist_kunit_requeue_first_bucket_head),
+	KUNIT_CASE(plist_kunit_first_last_entry),
+	KUNIT_CASE(plist_kunit_extremes_ops),
+	KUNIT_CASE(plist_kunit_random),
+	{}
+};
+
+static struct kunit_suite plist_kunit_test_suite = {
+	.name = "plist",
+	.test_cases = plist_kunit_test_cases,
+};
+
+kunit_test_suite(plist_kunit_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests for the priority sorted list (plist)");
+MODULE_LICENSE("GPL");
-- 
2.43.0



