Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E4D326939
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931247; cv=none; b=p0ZJeBE5xeLOKZ5RyrQTGY3GreQ+bNoMEriutRAU4NjuQ/gjdf9pZi7EHMf+8HXDSHw1mJ5zaNrosZG0NpQDE//q+Cl0+/WNzqryHwgaCXRBtw96m1AGScTt/lXZw1Ol86dR1SNrMUXJPW5DS0aaDhFfbnI/80R1MPE3y0N6E/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931247; c=relaxed/simple;
	bh=S2cYy7vhOT57cVqfL/vpOpekNqT+Eo0KcUG4NFUxEVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IXQqUG7wuwub9s1c9IcPjeRHJhH0pWp6rizd1u/m6L/Ctlzth3Y1T8oYdxhnLjlc/NdFxyz8GmEGrG0LcWqHUs+Lj1aHSSs2ICkVn2BCWxd2V3GBIDRovgHw24bKCK74LHk9J7iKBz1v8+6CN9oKDvGWHkz9p+iWuTrAXOLMOUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=LuVWlOwZ; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="LuVWlOwZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1787931238;
	bh=s3vazJV1gATKw5/G/0f4A7CGJjt06s+h9fsOEt1EOeM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LuVWlOwZYOBzGpIEYIu2HxTBVud85sC7dNkGPjtwGyCyvK4W1guXGGBmbZfbnloT+
	 BjRZESyNEQENyHyNSqOStD+udkW62O0Nkg7mXdUDl9pXSzEe5gUYGXghkNoUqLMKQ0
	 DvbB5P1zjgWhMIr1NwEcAUNocT91URrTSjrkA6/+70lyppZfw5mTPqIRaezIYKMuVl
	 1fTegKLCnq+vCkwbie6Mdmz/81H/By0/2Ug3CTy346txXJgmphxDYa56Oqjn4UVAMX
	 us3EltrPuCOKETGreYX8vZMREh7uVbM5R03MzJnwiD6/WUfK0qy54hK1ehg1WGT7Ys
	 n78rTlsryaQOA==
Received: from laura.localdomain (199-193-172-8.cpe.axion.ca [199.193.172.8])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4hWj92220FzTCc;
	Fri, 28 Aug 2026 11:33:58 -0400 (EDT)
From: odion@efficios.com
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	David Matlack <dmatlack@google.com>,
	Marco Elver <elver@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Wei Liu <wei.liu@kernel.org>,
	Florian Weimer <fweimer@redhat.com>,
	Mathias Stearn <mathias@mongodb.com>,
	Chris Kennelly <ckennelly@google.com>,
	Blake Oler <blake.oler@mongodb.com>,
	Rich Felker <dalias@libc.org>,
	Matthew Wilcox <willy@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Carlos O'Donell <codonell@redhat.com>,
	Olivier Dion <odion@efficios.com>
Subject: [RFC PATCH 5/5] selftests/rseq: add coverage for rseq operations
Date: Fri, 28 Aug 2026 11:33:43 -0400
Message-ID: <20260828153349.8061-6-odion@efficios.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260828153349.8061-1-odion@efficios.com>
References: <20260828153349.8061-1-odion@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Olivier Dion <odion@efficios.com>

Add selftest-side support for the rseq operation ABI and wire a new
rseq_op_test into the rseq selftest suite.

The new test covers:
- reset before entering a signal handler,
- reset on return to userspace after poll(),
- reset after scheduler-driven preemption,
- no-operation cases where nothing should be reset,
- register-time rejection of non-pristine nodes and unknown types,
- fatal cases for corrupted list links (self and transitive cycles),
- invalid destination and next pointers,
- unsupported lengths,
- unaligned destinations, and
- NULL-source clearing.

Also extend the selftest ABI/helpers with the rseq operation node
definitions and prctl-based register/unregister helpers, and add a
dedicated runner that disables glibc's implicit rseq registration.

Signed-off-by: Olivier Dion <odion@efficios.com>
---
 tools/testing/selftests/rseq/.gitignore |   4 +-
 tools/testing/selftests/rseq/Makefile   |   4 +-
 tools/testing/selftests/rseq/rseq-abi.h | 146 ++++++++++++++++++++----
 tools/testing/selftests/rseq/rseq.c     |  23 +++-
 tools/testing/selftests/rseq/rseq.h     |  75 ++++++++++++
 5 files changed, 223 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/rseq/.gitignore b/tools/testing/selftests/rseq/.gitignore
index ec01d164c1f0..8d5f02d79b98 100644
--- a/tools/testing/selftests/rseq/.gitignore
+++ b/tools/testing/selftests/rseq/.gitignore
@@ -2,7 +2,6 @@
 basic_percpu_ops_test
 basic_percpu_ops_mm_cid_test
 basic_test
-basic_rseq_op_test
 param_test
 param_test_benchmark
 param_test_compare_twice
@@ -11,3 +10,6 @@ param_test_mm_cid_benchmark
 param_test_mm_cid_compare_twice
 syscall_errors_test
 slice_test
+check_optimized
+legacy_check
+rseq_op_test
\ No newline at end of file
diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/rseq/Makefile
index 50d69e22ee7a..5e761df0e5aa 100644
--- a/tools/testing/selftests/rseq/Makefile
+++ b/tools/testing/selftests/rseq/Makefile
@@ -22,12 +22,14 @@ TEST_GEN_PROGS_EXTENDED = librseq.so \
 	param_test_compare_twice \
 	param_test_mm_cid \
 	param_test_mm_cid_compare_twice \
+	rseq_op_test \
 	syscall_errors_test \
 	legacy_check \
 	slice_test \
 	check_optimized
 
-TEST_PROGS = run_param_test.sh run_syscall_errors_test.sh run_legacy_check.sh run_timeslice_test.sh
+TEST_PROGS = run_param_test.sh run_syscall_errors_test.sh run_legacy_check.sh run_timeslice_test.sh \
+	run_rseq_op_test.sh
 
 TEST_FILES := settings
 
diff --git a/tools/testing/selftests/rseq/rseq-abi.h b/tools/testing/selftests/rseq/rseq-abi.h
index 5f4ea2152c2f..051636f84194 100644
--- a/tools/testing/selftests/rseq/rseq-abi.h
+++ b/tools/testing/selftests/rseq/rseq-abi.h
@@ -26,6 +26,10 @@ enum rseq_abi_cs_flags_bit {
 	RSEQ_ABI_CS_FLAG_NO_RESTART_ON_PREEMPT_BIT	= 0,
 	RSEQ_ABI_CS_FLAG_NO_RESTART_ON_SIGNAL_BIT	= 1,
 	RSEQ_ABI_CS_FLAG_NO_RESTART_ON_MIGRATE_BIT	= 2,
+	RSEQ_ABI_CS_FLAG_SLICE_EXT_AVAILABLE_BIT	= 4,
+	RSEQ_ABI_CS_FLAG_SLICE_EXT_ENABLED_BIT		= 5,
+	RSEQ_ABI_CS_FLAG_RSEQ_OP_AVAILABLE_BIT		= 6,
+	RSEQ_ABI_CS_FLAG_RSEQ_OP_ENABLED_BIT		= 7,
 };
 
 enum rseq_abi_cs_flags {
@@ -35,6 +39,14 @@ enum rseq_abi_cs_flags {
 		(1U << RSEQ_ABI_CS_FLAG_NO_RESTART_ON_SIGNAL_BIT),
 	RSEQ_ABI_CS_FLAG_NO_RESTART_ON_MIGRATE	=
 		(1U << RSEQ_ABI_CS_FLAG_NO_RESTART_ON_MIGRATE_BIT),
+	RSEQ_ABI_CS_FLAG_SLICE_EXT_AVAILABLE	=
+		(1U << RSEQ_ABI_CS_FLAG_SLICE_EXT_AVAILABLE_BIT),
+	RSEQ_ABI_CS_FLAG_SLICE_EXT_ENABLED	=
+		(1U << RSEQ_ABI_CS_FLAG_SLICE_EXT_ENABLED_BIT),
+	RSEQ_ABI_CS_FLAG_RSEQ_OP_AVAILABLE	=
+		(1U << RSEQ_ABI_CS_FLAG_RSEQ_OP_AVAILABLE_BIT),
+	RSEQ_ABI_CS_FLAG_RSEQ_OP_ENABLED	=
+		(1U << RSEQ_ABI_CS_FLAG_RSEQ_OP_ENABLED_BIT),
 };
 
 /*
@@ -74,6 +86,103 @@ struct rseq_abi_slice_ctrl {
 	};
 };
 
+union rseq_ptr {
+	__u64 ptr64;
+
+	/*
+	 * The "arch" field provides architecture accessor for
+	 * the ptr field based on architecture pointer size and
+	 * endianness.
+	 */
+	struct {
+#ifdef __LP64__
+		__u64 ptr;
+#elif defined(__BYTE_ORDER) ? (__BYTE_ORDER == __BIG_ENDIAN) : defined(__BIG_ENDIAN)
+		__u32 padding;		/* Initialized to zero. */
+		__u32 ptr;
+#else
+		__u32 ptr;
+		__u32 padding;		/* Initialized to zero. */
+#endif
+	} arch;
+};
+
+/*
+ * Maximum number of nodes walked in the rseq operation list.
+ */
+#define RSEQ_ABI_OP_LIST_LIMIT	2048
+
+/*
+ * enum rseq_abi_op_type - Type of an rseq operation
+ * @RSEQ_ABI_OP_RESET:			Plain reset. Uses struct rseq_abi_op_reset.
+ * @RSEQ_ABI_OP_RESET_WITH_STRIDE_CPUID:	Reset indexed by the current CPU ID.
+ *					Uses struct rseq_abi_op_reset_with_stride.
+ * @RSEQ_ABI_OP_RESET_WITH_STRIDE_MMCID:	Reset indexed by the current MM CID.
+ *					Uses struct rseq_abi_op_reset_with_stride.
+ */
+enum rseq_abi_op_type {
+	RSEQ_ABI_OP_RESET,
+	RSEQ_ABI_OP_RESET_WITH_STRIDE_CPUID,
+	RSEQ_ABI_OP_RESET_WITH_STRIDE_MMCID,
+	RSEQ_ABI_OP_NR,
+};
+
+/*
+ * struct rseq_abi_op_node - Common header linking an rseq operation into the list
+ * @next:	Address of the next node. Owned by the kernel.
+ * @prev:	Address of the previous node. Owned by the kernel.
+ * @type:	Operation type. See enum rseq_abi_op_type.
+ * @reserved:	Must be zero on registration.
+ *
+ * User space allocates the node, sets @type and zeroes @next, @prev and
+ * @reserved before passing it to prctl(PR_RSEQ_OP, PR_RSEQ_OP_REGISTER, node).
+ * The kernel owns @next and @prev for the lifetime of the registration and
+ * links the node into a circular doubly-linked list anchored by an internal
+ * sentinel in struct rseq_abi. User space must not touch @next or @prev while
+ * the node is registered.
+ */
+struct rseq_abi_op_node {
+	__u64 next;
+	__u64 prev;
+	struct {
+		__u8  type; /* enum rseq_abi_op_type */
+		__u8  reserved[7];
+	};
+};
+
+/*
+ * struct rseq_abi_op_reset - Reset one word to a value on return to user space
+ * @node:	Operation list node.
+ * @src:	Address of the source word, or 0 to reset @dst to zero.
+ * @dst:	Address of the destination word.
+ * @len:	Word length in bytes. Must be 4 or 8.
+ */
+struct rseq_abi_op_reset {
+	struct rseq_abi_op_node	node;
+	__u64			src;
+	__u64			dst;
+	__u32			len;
+};
+
+/*
+ * struct rseq_abi_op_reset_with_stride - Reset one word in a strided array
+ * @node:	Operation list node.
+ * @src:	Address of the source word, or 0 to reset the slot to zero.
+ * @dst:	Base address of the strided destination array.
+ * @dst_stride:	Stride in bytes between consecutive array slots.
+ * @len:	Word length in bytes. Must be 4 or 8.
+ *
+ * The destination slot is @dst + @dst_stride * index, where index is the
+ * current CPU ID or MM CID depending on the operation type.
+ */
+struct rseq_abi_op_reset_with_stride {
+	struct rseq_abi_op_node	node;
+	__u64			src;
+	__u64			dst;
+	__u64			dst_stride;
+	__u32			len;
+};
+
 /*
  * struct rseq_abi is aligned on 4 * 8 bytes to ensure it is always
  * contained within a single cache-line.
@@ -127,26 +236,7 @@ struct rseq_abi {
 	 * atomicity semantics. This field should only be updated by the
 	 * thread which registered this data structure. Aligned on 64-bit.
 	 */
-	union {
-		__u64 ptr64;
-
-		/*
-		 * The "arch" field provides architecture accessor for
-		 * the ptr field based on architecture pointer size and
-		 * endianness.
-		 */
-		struct {
-#ifdef __LP64__
-			__u64 ptr;
-#elif defined(__BYTE_ORDER) ? (__BYTE_ORDER == __BIG_ENDIAN) : defined(__BIG_ENDIAN)
-			__u32 padding;		/* Initialized to zero. */
-			__u32 ptr;
-#else
-			__u32 ptr;
-			__u32 padding;		/* Initialized to zero. */
-#endif
-		} arch;
-	} rseq_cs;
+	union rseq_ptr rseq_cs;
 
 	/*
 	 * Restartable sequences flags field.
@@ -192,9 +282,21 @@ struct rseq_abi {
 	struct rseq_abi_slice_ctrl slice_ctrl;
 
 	/*
-	 * Place holder to push the size above 32 bytes.
+	 * Sentinel of the circular doubly-linked list of rseq operations
+	 * registered via prctl(PR_RSEQ_OP, ...). Fully owned and maintained by
+	 * the kernel: it is initialized to point to itself on registration and
+	 * user space must never read or write it directly.
+	 *
+	 * The kernel only use next and prev from rseq_op_list.  The rest of the
+	 * bytes are reserved for later usage and should be zeroed.
 	 */
-	__u8 __reserved;
+	union {
+		struct rseq_abi_op_node rseq_op_list;
+		struct {
+			__u64	op_used[2];
+			__u64	reserved;
+		};
+	};
 
 	/*
 	 * Flexible array member at end of structure, after last feature field.
diff --git a/tools/testing/selftests/rseq/rseq.c b/tools/testing/selftests/rseq/rseq.c
index be0d0a97031e..6a5406f3353b 100644
--- a/tools/testing/selftests/rseq/rseq.c
+++ b/tools/testing/selftests/rseq/rseq.c
@@ -116,6 +116,17 @@ bool rseq_available(void)
 	}
 }
 
+/* The rseq areas need to be at least 32 bytes. */
+static
+unsigned int get_rseq_min_alloc_size(void)
+{
+	unsigned int alloc_size = rseq_size;
+
+	if ((int) alloc_size < ORIG_RSEQ_ALLOC_SIZE)
+		alloc_size = ORIG_RSEQ_ALLOC_SIZE;
+	return alloc_size;
+}
+
 /*
  * Return the feature size supported by the kernel.
  *
@@ -261,12 +272,14 @@ void rseq_init(void)
 
 	/* rseq flags are deprecated, always set to 0. */
 	rseq_flags = 0;
+	{
+		unsigned int rseq_kernel_feature_size = get_rseq_kernel_feature_size();
 
-	/*
-	 * Set the size to 0 until at least one thread registers to mimic the
-	 * libc behavior.
-	 */
-	rseq_size = 0;
+		if (rseq_kernel_feature_size <= RSEQ_THREAD_AREA_ALLOC_SIZE)
+			rseq_size = rseq_kernel_feature_size;
+		else
+			rseq_size = ORIG_RSEQ_ALLOC_SIZE;
+	}
 }
 
 static __attribute__((destructor))
diff --git a/tools/testing/selftests/rseq/rseq.h b/tools/testing/selftests/rseq/rseq.h
index c62ebb9290c0..8f65d272e7cf 100644
--- a/tools/testing/selftests/rseq/rseq.h
+++ b/tools/testing/selftests/rseq/rseq.h
@@ -18,6 +18,9 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <stddef.h>
+#include <string.h>
+#include <sys/prctl.h>
+#include <linux/kernel.h>
 #include "rseq-abi.h"
 #include "compiler.h"
 
@@ -395,4 +398,76 @@ int rseq_cmpeqv_trymemcpy_storev(enum rseq_mo rseq_mo, enum rseq_percpu_mode per
 	}
 }
 
+/*
+ * prctl commands for the rseq operation list. The kernel owns the list: the
+ * feature is enabled implicitly by registering the first operation and
+ * disabled by unregistering the last one. There is no explicit enable knob.
+ */
+#ifndef PR_RSEQ_OP
+#define PR_RSEQ_OP			82
+#define PR_RSEQ_OP_REGISTER		1
+#define PR_RSEQ_OP_UNREGISTER		2
+#endif
+
+/*
+ * Initialize a plain reset operation. Sets the operation type, the destination
+ * and source words, the word length, and leaves the node in a pristine state
+ * (next, prev and reserved bytes zeroed) as required by the kernel at
+ * registration time.
+ */
+static inline
+void rseq_op_reset_init(struct rseq_abi_op_reset *op,
+			void *dst, void *src, size_t len)
+{
+	op->node.next = 0;
+	op->node.prev = 0;
+	op->node.type = RSEQ_ABI_OP_RESET;
+	memset(op->node.reserved, 0, sizeof(op->node.reserved));
+	op->src = (__u64)(unsigned long)src;
+	op->dst = (__u64)(unsigned long)dst;
+	op->len = len;
+}
+
+/*
+ * Initialize a strided reset operation indexed by the current CPU ID or MM CID
+ * depending on @type.
+ */
+static inline
+void rseq_op_reset_with_stride_init(struct rseq_abi_op_reset_with_stride *op,
+				    enum rseq_abi_op_type type,
+				    void *dst, void *src,
+				    size_t dst_stride, size_t len)
+{
+	op->node.next = 0;
+	op->node.prev = 0;
+	op->node.type = type;
+	memset(op->node.reserved, 0, sizeof(op->node.reserved));
+	op->src = (__u64)(unsigned long)src;
+	op->dst = (__u64)(unsigned long)dst;
+	op->dst_stride = (__u64)dst_stride;
+	op->len = len;
+}
+
+/*
+ * Register an rseq operation node. The kernel links the pristine node into its
+ * internal list and enables operation processing when the first node is
+ * registered. Returns the prctl() return value (0 on success).
+ */
+static inline
+int rseq_op_register(struct rseq_abi_op_node *node)
+{
+	return prctl(PR_RSEQ_OP, PR_RSEQ_OP_REGISTER, (unsigned long)node, 0, 0);
+}
+
+/*
+ * Unregister an rseq operation node. The kernel unlinks the node, clears its
+ * next/prev links, and disables operation processing when the last node is
+ * unregistered. Returns the prctl() return value (0 on success).
+ */
+static inline
+int rseq_op_unregister(struct rseq_abi_op_node *node)
+{
+	return prctl(PR_RSEQ_OP, PR_RSEQ_OP_UNREGISTER, (unsigned long)node, 0, 0);
+}
+
 #endif  /* RSEQ_H_ */
-- 
2.54.0

