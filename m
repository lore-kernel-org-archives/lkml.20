Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4478C364058
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931677; cv=none; b=oflC3kOeCxZWaqr2qXyxXJNGEwAe9elMchqgIXlTBrswlFCuyfUqamHDRnc5OWV1YBMTOpb6VGAN98ov+B8eibHsHw+YLW5LAXvBEYUHfFewda6XWdOaTPFYCtJhnHyCSZkg5lDOSj/IVW1KH69Pa2ZsOVfMOcrMlxmXoCmtHP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931677; c=relaxed/simple;
	bh=VkZbjXeNxSt5oZpSD6SfLMeOquHToVqWskiDwdeRjxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+vTZOa9OR4XxayH7aTCXCnu/+ldhKB6rEVeZZ2qhYzJNgJ/ZPSgDzbCHbVDdd4KS5H+YkLmcD2T/e2johLcLS6LWfYrc3d3p/j+0pozmGrglHhs0AMS8YIHrnvEwQCPn4W+FMhaRT45uJs+rFirYWEuu1sNrH6s0o3bfWJ1K1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=GuVnUXy8; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="GuVnUXy8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1787931237;
	bh=Wi5zWpvsXSQP3flQPE51y11BL6wE16BItDUgzsf8CHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GuVnUXy8ppPMwyFVWKz4IYWO0cqWdQxtlBQIWe8ec5a4+Wq/lSrb68rSge132WDiC
	 UJPue3uMXqesjHCqWmtZ/lYgfzFZ2+wW0cqHnmyAnVudJIx79cCFVjNG0IhMBZh6M8
	 XjdtD7cT1xbf2ZtQOvT9nzGyjMTioxUeMn9uTewJo4IkTv2WKWS05ALeWo32VV/BS4
	 yCA6I/1F4kx2BJI07btPi0mu2iOUaACvOMLMsxHvvT1jJWoSkfocFUAkxb5KpBeu9J
	 gu3rDiUpkxC/PtMHatS45tMyCIxIQakSxaQQe7ofmPChfjcU2Q2W6VMaPMekGm9bCu
	 VRI8HSrJ4s3VA==
Received: from laura.localdomain (199-193-172-8.cpe.axion.ca [199.193.172.8])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4hWj910PR3zTCY;
	Fri, 28 Aug 2026 11:33:57 -0400 (EDT)
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
Subject: [RFC PATCH 1/5] rseq: uapi: add rseq operation definitions
Date: Fri, 28 Aug 2026 11:33:39 -0400
Message-ID: <20260828153349.8061-2-odion@efficios.com>
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

Introduce userspace ABI for rseq operations: a per-thread list of
operations the kernel applies on return to user space.

The main motivation for this work is to encourage TCMalloc to migrate to
RSEQ v2 [0] and use the glibc RSEQ region.

Indeed, TCMalloc relies on the behavior of RSEQ v1, that reset the
cpu_id bits in the RSEQ shared region, to invalidate a per-cpu pointer
cached in a TLS. This hack requires TCMalloc users to use a glibc
tunable to disable RSEQ registration for threads so that TCMalloc can
register its own region, overlapping the TLS cache.

Overall, this puts the users in a situation of choosing between a fast
sched_getcpu() and TCMalloc, plus some downsides such as requiring a
initial-exec model for the cache TLS in a shared-library and not being
compatible with the glibc

RSEQ operations aim at solving this by offering operations that are
executed by the kernel, on behalf of a task after it is scheduled,
before returning to userspace. Operations are per-task and registered
throught prctl. They are opt-in and only introduce overhead on tasks
that register them.

Add enum rseq_op_type and the rseq_op_node / rseq_op_reset /
rseq_op_reset_with_stride structures, the RSEQ_CS_FLAG_RSEQ_OP_*
availability/enabled flags, the RSEQ_OP_LIST_LIMIT walk bound, and the
PR_RSEQ_OP prctl with its REGISTER/UNREGISTER sub-commands.

The operation list is a circular doubly-linked list anchored by a
kernel-owned sentinel embedded in struct rseq.

[0] Documentation/userspace-api/rseq.rst (Optimized RSEQ v2)

Link: https://lore.kernel.org/lkml/20260428221058.149538293@kernel.org
Signed-off-by: Olivier Dion <odion@efficios.com>
---
 include/uapi/linux/prctl.h |  12 +++++
 include/uapi/linux/rseq.h  | 104 ++++++++++++++++++++++++++++++++++---
 2 files changed, 108 insertions(+), 8 deletions(-)

diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index b6ec6f693719..4cb6356a271a 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -396,6 +396,18 @@ struct prctl_mm_map {
  */
 # define PR_RSEQ_SLICE_EXT_ENABLE		0x01
 
+/*
+ * RSEQ operation registration.
+ *
+ * arg3 is the user address of a struct rseq_op_node embedded in one of the
+ * rseq operation structures (see uapi/linux/rseq.h). Registering the first
+ * operation enables rseq operation processing for the thread; unregistering
+ * the last one disables it.
+ */
+#define PR_RSEQ_OP				82
+# define PR_RSEQ_OP_REGISTER			1
+# define PR_RSEQ_OP_UNREGISTER			2
+
 /*
  * Get or set the control flow integrity (CFI) configuration for the
  * current thread.
diff --git a/include/uapi/linux/rseq.h b/include/uapi/linux/rseq.h
index ca6fe1f9d05e..b664d1991c48 100644
--- a/include/uapi/linux/rseq.h
+++ b/include/uapi/linux/rseq.h
@@ -13,6 +13,11 @@
 #include <linux/types.h>
 #include <asm/byteorder.h>
 
+/*
+ * Maximum number of nodes walked in the rseq operation list.
+ */
+#define RSEQ_OP_LIST_LIMIT	2048
+
 enum rseq_cpu_id_state {
 	RSEQ_CPU_ID_UNINITIALIZED		= -1,
 	RSEQ_CPU_ID_REGISTRATION_FAILED		= -2,
@@ -33,6 +38,8 @@ enum rseq_cs_flags_bit {
 	/* User read only feature flags */
 	RSEQ_CS_FLAG_SLICE_EXT_AVAILABLE_BIT	= 4,
 	RSEQ_CS_FLAG_SLICE_EXT_ENABLED_BIT	= 5,
+	RSEQ_CS_FLAG_RSEQ_OP_AVAILABLE_BIT	= 6,
+	RSEQ_CS_FLAG_RSEQ_OP_ENABLED_BIT	= 7,
 };
 
 enum rseq_cs_flags {
@@ -47,6 +54,10 @@ enum rseq_cs_flags {
 		(1U << RSEQ_CS_FLAG_SLICE_EXT_AVAILABLE_BIT),
 	RSEQ_CS_FLAG_SLICE_EXT_ENABLED		=
 		(1U << RSEQ_CS_FLAG_SLICE_EXT_ENABLED_BIT),
+	RSEQ_CS_FLAG_RSEQ_OP_AVAILABLE		=
+		(1U << RSEQ_CS_FLAG_RSEQ_OP_AVAILABLE_BIT),
+	RSEQ_CS_FLAG_RSEQ_OP_ENABLED		=
+		(1U << RSEQ_CS_FLAG_RSEQ_OP_ENABLED_BIT),
 };
 
 /*
@@ -86,6 +97,77 @@ struct rseq_slice_ctrl {
 	};
 };
 
+/*
+ * enum rseq_op_type - Type of an rseq operation
+ * @RSEQ_OP_RESET:			Plain reset. Uses struct rseq_op_reset.
+ * @RSEQ_OP_RESET_WITH_STRIDE_CPUID:	Reset indexed by the current CPU ID.
+ *					Uses struct rseq_op_reset_with_stride.
+ * @RSEQ_OP_RESET_WITH_STRIDE_MMCID:	Reset indexed by the current MM CID.
+ *					Uses struct rseq_op_reset_with_stride.
+ */
+enum rseq_op_type {
+	RSEQ_OP_RESET,
+	RSEQ_OP_RESET_WITH_STRIDE_CPUID,
+	RSEQ_OP_RESET_WITH_STRIDE_MMCID,
+	RSEQ_OP_NR,
+};
+
+/*
+ * struct rseq_op_node - Common header linking an rseq operation into the list
+ * @next:	Address of the next node. Owned by the kernel.
+ * @prev:	Address of the previous node. Owned by the kernel.
+ * @type:	Operation type. See enum rseq_op_type.
+ * @reserved:	Must be zero on registration.
+ *
+ * User space allocates the node, sets @type and zeroes @next, @prev and
+ * @reserved before passing it to prctl(PR_RSEQ_OP, PR_RSEQ_OP_REGISTER, node).
+ * The kernel owns @next and @prev for the lifetime of the registration and
+ * links the node into a circular doubly-linked list anchored by an internal
+ * sentinel in struct rseq. User space must not touch @next or @prev while the
+ * node is registered.
+ */
+struct rseq_op_node {
+	__u64 next;
+	__u64 prev;
+	struct {
+		__u8  type; /* enum rseq_op_type */
+		__u8  reserved[7];
+	};
+};
+
+/*
+ * struct rseq_op_reset - Reset one word to a value on return to user space
+ * @node:	Operation list node.
+ * @src:	Address of the source word, or 0 to reset @dst to zero.
+ * @dst:	Address of the destination word.
+ * @len:	Word length in bytes. Must be 4 or 8 (8 is 64-bit only).
+ */
+struct rseq_op_reset {
+	struct rseq_op_node	node;
+	__u64			src;
+	__u64			dst;
+	__u32			len;
+};
+
+/*
+ * struct rseq_op_reset_with_stride - Reset one word in a strided array
+ * @node:	Operation list node.
+ * @src:	Address of the source word, or 0 to reset the slot to zero.
+ * @dst:	Base address of the strided destination array.
+ * @dst_stride:	Stride in bytes between consecutive array slots.
+ * @len:	Word length in bytes. Must be 4 or 8 (8 is 64-bit only).
+ *
+ * The destination slot is @dst + @dst_stride * index, where index is the
+ * current CPU ID or MM CID depending on the operation type.
+ */
+struct rseq_op_reset_with_stride {
+	struct rseq_op_node	node;
+	__u64			src;
+	__u64			dst;
+	__u64			dst_stride;
+	__u32			len;
+};
+
 /*
  * The original size and alignment of the allocation for struct rseq is
  * 32 bytes.
@@ -191,15 +273,21 @@ struct rseq {
 	struct rseq_slice_ctrl slice_ctrl;
 
 	/*
-	 * Before rseq became extensible, its original size was 32 bytes even
-	 * though the active rseq area was only 20 bytes.
-	 * Exposing a 32 bytes feature size would make life needlessly painful
-	 * for userspace. Therefore, add a reserved byte after byte 32
-	 * to bump the rseq feature size from 32 to 33.
-	 * The next field to be added to the rseq area will be larger
-	 * than one byte, and will replace this reserved byte.
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
+		struct rseq_op_node rseq_op_list;
+		struct {
+			__u64	op_used[2];
+			__u64	reserved;
+		};
+	};
 
 	/*
 	 * Flexible array member at end of structure, after last feature field.
-- 
2.54.0

