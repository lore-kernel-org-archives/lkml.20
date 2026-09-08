Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6813BF666;
	Tue,  8 Sep 2026 20:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900709; cv=none; b=Na+ugAAF4yR3kZo8snjpGV/oNuQ17QR8YR8/WjxUmF4lj9B0Gkjc6izwbpwLdzGjr/p2LcdBOE0KKSk0XqLqjpTqRfBmEF8zWWrl6QVxAZDgENSjjBboh7Uaj3GSLrqbfKAYGkJGDa0cWPqOlOCvX4cf0iwWcaakSVqxDoQWJ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900709; c=relaxed/simple;
	bh=3OY/yD56rjmJEdcWBkQF0OaDqgcM19zrehbY3m/s3oo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=XfNEcX6mJ+4ZgoecGedzd973b+hXv6ZYm+DnCJ4SsL7evUmtQA+m5hnb+VBuOJ3G70HeEMlwwP8TIUo//8Cc3QGf6WR2HW5W2gLDEU9CLGby1bLDrV8b3+zHuauDBJtvSlHraVKxGvSUyNRy3QWBNUAhzyUj3vN2t8uDwMoh+7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=j1iIcZgl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mpEJY0ok; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="j1iIcZgl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mpEJY0ok"
Date: Tue, 08 Sep 2026 20:51:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900705;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZfIviiqjNWlP0zgHY4WYAuHlTBcf9/8XUES8+3KFys=;
	b=j1iIcZgllbbSCEWSFuNmn6Go0blDUBYfXfZX5vb0lgJm1ur6ju8VDrjshshRTyjPHdCut8
	5j6ZtdePaguSb/jSMU5TCrgnO3RK+aB/sd6nISrrXUk2tooL6MQ3NRemGiFlmOuSGXKE3v
	Ziip4E5B8kiLGhhdchFHNlWXux2dwuN5sYobJFYHLO2tVYxuCBdZqE2aUqbgL7Qml/DovC
	Joqi7lAeuS41Uk4w0ZZtfJXdl/xw98YF/gtFIqPFPx24osmadIr8pVojVygpTVAwTDXg9x
	ZZLiFA5vy/DBxaaT8TQVqFCmcwlcugfvoStu2LE49BCrmLMxe+fz44yCZNj2oA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900705;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZfIviiqjNWlP0zgHY4WYAuHlTBcf9/8XUES8+3KFys=;
	b=mpEJY0ok1RpA0Q3eLUvMdNp74v9dspbRIcW3LFXyZ0E0vKlsog/7fZt+l+TCNSS/NSO3Hl
	sr7a8/ODYZFsDJCw==
From: "tip-bot2 for Kan Liang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf: Add sampling support for SIMD registers
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Kan Liang <kan.liang@linux.intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-13-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-13-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890070370.623050.8549467252134118707.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     918b7d6d1729952d51da4fa81db7b366a207de8f
Gitweb:        https://git.kernel.org/tip/918b7d6d1729952d51da4fa81db7b366a20=
7de8f
Author:        Kan Liang <kan.liang@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:20 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:43 +02:00

perf: Add sampling support for SIMD registers

Users may be interested in sampling SIMD registers during profiling.
The current sample_regs_* structure does not have sufficient space
for all SIMD registers.

To address this, new attribute fields sample_simd_{pred,vec}_reg_* are
added to struct perf_event_attr to represent the SIMD registers that are
expected to be sampled.

Currently, the perf/x86 code supports XMM registers in sample_regs_*.
To unify the configuration of SIMD registers and ensure a consistent
method for configuring XMM and other SIMD registers, a new event
attribute field, sample_simd_regs_enabled, is introduced. When
sample_simd_regs_enabled is set, it indicates that all SIMD registers,
including XMM, will be represented by the newly introduced
sample_simd_{pred|vec}_reg_* fields. The original XMM space in
sample_regs_* is reserved for future uses.

Since SIMD registers are wider than 64 bits, a new output format is
introduced. The number and width of SIMD registers are dumped first,
followed by the register values. The number and width are based on the
user's configuration.

A new ABI, PERF_SAMPLE_REGS_ABI_SIMD, is added to indicate the new format.
The enum perf_sample_regs_abi is now a bitmap. This change should not
impact existing tools, as the version and bitmap remain the same for
values 1 and 2.

Additionally, two new __weak functions are introduced:
- perf_simd_reg_value(): Retrieves the value of the requested SIMD
  register.
- perf_simd_reg_validate(): Validates the configuration of the SIMD
  registers.

A new flag, PERF_PMU_CAP_SIMD_REGS, is added to indicate that the PMU
supports SIMD register dumping. An error is generated if
sample_simd_{pred|vec}_reg_* is mistakenly set for a PMU that does not
support this capability.

Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Co-developed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-13-dapeng1.mi@linux.int=
el.com
---
 include/linux/perf_event.h      |  12 +++-
 include/linux/perf_regs.h       |   4 +-
 include/uapi/linux/perf_event.h |  49 ++++++++++-
 kernel/events/core.c            | 141 ++++++++++++++++++++++++++++---
 4 files changed, 192 insertions(+), 14 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 264785a..a2e7eae 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -306,6 +306,7 @@ struct perf_event_pmu_context;
 #define PERF_PMU_CAP_AUX_PAUSE		0x0200
 #define PERF_PMU_CAP_AUX_PREFER_LARGE	0x0400
 #define PERF_PMU_CAP_MEDIATED_VPMU	0x0800
+#define PERF_PMU_CAP_SIMD_REGS		0x1000
=20
 /**
  * pmu::scope
@@ -1534,6 +1535,17 @@ perf_event__output_id_sample(struct perf_event *event,
 extern void
 perf_log_lost_samples(struct perf_event *event, u64 lost);
=20
+static inline bool event_has_simd_regs(struct perf_event *event)
+{
+	struct perf_event_attr *attr =3D &event->attr;
+
+	if (!(event->attr.sample_type &
+	      (PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER)))
+		return false;
+
+	return attr->sample_simd_regs_enabled !=3D 0;
+}
+
 static inline bool event_has_extended_regs(struct perf_event *event)
 {
 	struct perf_event_attr *attr =3D &event->attr;
diff --git a/include/linux/perf_regs.h b/include/linux/perf_regs.h
index 144bcc3..518f28c 100644
--- a/include/linux/perf_regs.h
+++ b/include/linux/perf_regs.h
@@ -14,6 +14,10 @@ int perf_reg_validate(u64 mask);
 u64 perf_reg_abi(struct task_struct *task);
 void perf_get_regs_user(struct perf_regs *regs_user,
 			struct pt_regs *regs);
+int perf_simd_reg_validate(u16 vec_qwords, u64 vec_mask,
+			   u16 pred_qwords, u32 pred_mask);
+u64 perf_simd_reg_value(struct pt_regs *regs, int idx,
+			u16 qwords_idx, bool pred);
=20
 #ifdef CONFIG_HAVE_PERF_REGS
 #include <asm/perf_regs.h>
diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index fd10aa8..c49fc76 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -314,8 +314,9 @@ enum {
  */
 enum perf_sample_regs_abi {
 	PERF_SAMPLE_REGS_ABI_NONE		=3D 0,
-	PERF_SAMPLE_REGS_ABI_32			=3D 1,
-	PERF_SAMPLE_REGS_ABI_64			=3D 2,
+	PERF_SAMPLE_REGS_ABI_32			=3D (1 << 0),
+	PERF_SAMPLE_REGS_ABI_64			=3D (1 << 1),
+	PERF_SAMPLE_REGS_ABI_SIMD		=3D (1 << 2),
 };
=20
 /*
@@ -383,6 +384,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
 #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
 #define PERF_ATTR_SIZE_VER9			144	/* add: config4 */
+#define PERF_ATTR_SIZE_VER10			176	/* Add: sample_simd_{vec|pred}_reg_* */
=20
 /*
  * 'struct perf_event_attr' contains various attributes that define
@@ -547,6 +549,29 @@ struct perf_event_attr {
=20
 	__u64	config3; /* extension of config2 */
 	__u64	config4; /* extension of config3 */
+
+	/*
+	 * Defines the sampling SIMD/PRED(predicate) registers bitmap and
+	 * qwords (8 bytes) length.
+	 *
+	 * sample_simd_regs_enabled !=3D 0 indicates there are SIMD/PRED
+	 * registers to be sampled, the SIMD/PRED registers bitmap and
+	 * qwords length are represented in
+	 * sample_simd_{vec|pred}_reg_{intr|user} and
+	 * sample_simd_{vec|pred}_reg_qwords fields separately.
+	 *
+	 * sample_simd_regs_enabled =3D=3D 0 indicates no SIMD/PRED registers
+	 * are sampled.
+	 */
+	__u16	sample_simd_regs_enabled;
+	__u16	sample_simd_pred_reg_qwords;
+	__u16	sample_simd_vec_reg_qwords;
+	__u16	__reserved_4;
+
+	__u32	sample_simd_pred_reg_intr;
+	__u32	sample_simd_pred_reg_user;
+	__u64	sample_simd_vec_reg_intr;
+	__u64	sample_simd_vec_reg_user;
 };
=20
 /*
@@ -1020,7 +1045,15 @@ enum perf_event_type {
 	 *      } && PERF_SAMPLE_BRANCH_STACK
 	 *
 	 *	{ u64			abi; # enum perf_sample_regs_abi
-	 *	  u64			regs[weight(mask)]; } && PERF_SAMPLE_REGS_USER
+	 *	  u64			regs[weight(mask)];
+	 *	  struct {
+	 *		u64 nr_vectors;		# 0 ... weight(sample_simd_vec_reg_user)
+	 *		u64 vector_qwords;	# 0 ... sample_simd_vec_reg_qwords
+	 *		u64 nr_pred;		# 0 ... weight(sample_simd_pred_reg_user)
+	 *		u64 pred_qwords;	# 0 ... sample_simd_pred_reg_qwords
+	 *		u64 data[nr_vectors * vector_qwords + nr_pred * pred_qwords];
+	 *	  } && (abi & PERF_SAMPLE_REGS_ABI_SIMD)
+	 *	} && PERF_SAMPLE_REGS_USER
 	 *
 	 *	{ u64			size;
 	 *	  char			data[size];
@@ -1047,7 +1080,15 @@ enum perf_event_type {
 	 *	{ u64			data_src; } && PERF_SAMPLE_DATA_SRC
 	 *	{ u64			transaction; } && PERF_SAMPLE_TRANSACTION
 	 *	{ u64			abi; # enum perf_sample_regs_abi
-	 *	  u64			regs[weight(mask)]; } && PERF_SAMPLE_REGS_INTR
+	 *	  u64			regs[weight(mask)];
+	 *	  struct {
+	 *		u64 nr_vectors;		# 0 ... weight(sample_simd_vec_reg_intr)
+	 *		u64 vector_qwords;	# 0 ... sample_simd_vec_reg_qwords
+	 *		u64 nr_pred;		# 0 ... weight(sample_simd_pred_reg_intr)
+	 *		u64 pred_qwords;	# 0 ... sample_simd_pred_reg_qwords
+	 *		u64 data[nr_vectors * vector_qwords + nr_pred * pred_qwords];
+	 *	  } && (abi & PERF_SAMPLE_REGS_ABI_SIMD)
+	 *	} && PERF_SAMPLE_REGS_INTR
 	 *	{ u64			phys_addr;} && PERF_SAMPLE_PHYS_ADDR
 	 *	{ u64			cgroup;} && PERF_SAMPLE_CGROUP
 	 *	{ u64			data_page_size;} && PERF_SAMPLE_DATA_PAGE_SIZE
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 5a0ae02..3a87c6a 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7840,22 +7840,60 @@ void __weak perf_get_regs_user(struct perf_regs *regs=
_user,
 	regs_user->abi =3D perf_reg_abi(current);
 }
=20
+#define word_for_each_set_bit(bit, val)			\
+	for (unsigned long long __v =3D (val);		\
+	     __v && ((bit =3D __builtin_ctzll(__v)), 1);	\
+	     __v &=3D __v - 1)
+
 static void
 perf_output_sample_regs(struct perf_output_handle *handle,
 			struct pt_regs *regs, u64 mask)
 {
 	int bit;
-	DECLARE_BITMAP(_mask, 64);
-
-	bitmap_from_u64(_mask, mask);
-	for_each_set_bit(bit, _mask, sizeof(mask) * BITS_PER_BYTE) {
-		u64 val;
=20
-		val =3D perf_reg_value(regs, bit);
+	word_for_each_set_bit(bit, mask) {
+		u64 val =3D perf_reg_value(regs, bit);
 		perf_output_put(handle, val);
 	}
 }
=20
+static void
+perf_output_sample_simd_regs(struct perf_output_handle *handle,
+			     struct perf_event *event,
+			     struct pt_regs *regs,
+			     u64 mask, u32 pred_mask)
+{
+	u64 pred_qwords =3D event->attr.sample_simd_pred_reg_qwords;
+	u64 vec_qwords =3D event->attr.sample_simd_vec_reg_qwords;
+	u64 nr_vectors =3D hweight64(mask);
+	u64 nr_pred =3D hweight32(pred_mask);
+	int bit;
+
+	perf_output_put(handle, nr_vectors);
+	perf_output_put(handle, vec_qwords);
+	perf_output_put(handle, nr_pred);
+	perf_output_put(handle, pred_qwords);
+
+	if (nr_vectors) {
+		word_for_each_set_bit(bit, mask) {
+			for (int i =3D 0; i < vec_qwords; i++) {
+				u64 val =3D perf_simd_reg_value(regs, bit,
+							      i, false);
+				perf_output_put(handle, val);
+			}
+		}
+	}
+	if (nr_pred) {
+		word_for_each_set_bit(bit, pred_mask) {
+			for (int i =3D 0; i < pred_qwords; i++) {
+				u64 val =3D perf_simd_reg_value(regs, bit,
+							      i, true);
+				perf_output_put(handle, val);
+			}
+		}
+	}
+}
+
 static void perf_sample_regs_user(struct perf_regs *regs_user,
 				  struct pt_regs *regs)
 {
@@ -7889,6 +7927,17 @@ static void perf_sample_regs_intr(struct perf_regs *re=
gs_intr,
 	}
 }
=20
+int __weak perf_simd_reg_validate(u16 vec_qwords, u64 vec_mask,
+				  u16 pred_qwords, u32 pred_mask)
+{
+	return -EINVAL;
+}
+
+u64 __weak perf_simd_reg_value(struct pt_regs *regs, int idx,
+			       u16 qwords_idx, bool pred)
+{
+	return 0;
+}
=20
 /*
  * Get remaining task size from user stack pointer.
@@ -8419,10 +8468,17 @@ void perf_output_sample(struct perf_output_handle *ha=
ndle,
 		perf_output_put(handle, abi);
=20
 		if (abi) {
-			u64 mask =3D event->attr.sample_regs_user;
+			struct perf_event_attr *attr =3D &event->attr;
+			u64 mask =3D attr->sample_regs_user;
 			perf_output_sample_regs(handle,
 						data->regs_user.regs,
 						mask);
+			if (abi & PERF_SAMPLE_REGS_ABI_SIMD) {
+				perf_output_sample_simd_regs(handle, event,
+							     data->regs_user.regs,
+							     attr->sample_simd_vec_reg_user,
+							     attr->sample_simd_pred_reg_user);
+			}
 		}
 	}
=20
@@ -8450,11 +8506,18 @@ void perf_output_sample(struct perf_output_handle *ha=
ndle,
 		perf_output_put(handle, abi);
=20
 		if (abi) {
-			u64 mask =3D event->attr.sample_regs_intr;
+			struct perf_event_attr *attr =3D &event->attr;
+			u64 mask =3D attr->sample_regs_intr;
=20
 			perf_output_sample_regs(handle,
 						data->regs_intr.regs,
 						mask);
+			if (abi & PERF_SAMPLE_REGS_ABI_SIMD) {
+				perf_output_sample_simd_regs(handle, event,
+							     data->regs_intr.regs,
+							     attr->sample_simd_vec_reg_intr,
+							     attr->sample_simd_pred_reg_intr);
+			}
 		}
 	}
=20
@@ -8657,6 +8720,29 @@ static __always_inline u64 __cond_set(u64 flags, u64 s=
, u64 d)
 	return d * !!(flags & s);
 }
=20
+static u64 perf_update_xregs_size(struct perf_event *event, bool intr)
+{
+	u16 pred_qwords =3D event->attr.sample_simd_pred_reg_qwords;
+	u16 vec_qwords =3D event->attr.sample_simd_vec_reg_qwords;
+	u64 pred_mask;
+	u64 mask;
+	int size;
+
+	if (intr) {
+		mask =3D event->attr.sample_simd_vec_reg_intr;
+		pred_mask =3D event->attr.sample_simd_pred_reg_intr;
+	} else {
+		mask =3D event->attr.sample_simd_vec_reg_user;
+		pred_mask =3D event->attr.sample_simd_pred_reg_user;
+	}
+
+	size =3D sizeof(u64) * 4;
+	size +=3D (hweight64(mask) * vec_qwords +
+		 hweight64(pred_mask) * pred_qwords) * sizeof(u64);
+
+	return size;
+}
+
 void perf_prepare_sample(struct perf_sample_data *data,
 			 struct perf_event *event,
 			 struct pt_regs *regs)
@@ -8719,7 +8805,12 @@ void perf_prepare_sample(struct perf_sample_data *data,
=20
 		if (data->regs_user.regs) {
 			u64 mask =3D event->attr.sample_regs_user;
+
 			size +=3D hweight64(mask) * sizeof(u64);
+			if (event_has_simd_regs(event)) {
+				size +=3D perf_update_xregs_size(event, false);
+				data->regs_user.abi |=3D PERF_SAMPLE_REGS_ABI_SIMD;
+			}
 		}
=20
 		data->dyn_size +=3D size;
@@ -8784,6 +8875,10 @@ void perf_prepare_sample(struct perf_sample_data *data,
 			u64 mask =3D event->attr.sample_regs_intr;
=20
 			size +=3D hweight64(mask) * sizeof(u64);
+			if (event_has_simd_regs(event)) {
+				size +=3D perf_update_xregs_size(event, true);
+				data->regs_intr.abi |=3D PERF_SAMPLE_REGS_ABI_SIMD;
+			}
 		}
=20
 		data->dyn_size +=3D size;
@@ -13160,6 +13255,12 @@ static int perf_try_init_event(struct pmu *pmu, stru=
ct perf_event *event)
 	if (ret)
 		goto err_pmu;
=20
+	if (!(pmu->capabilities & PERF_PMU_CAP_SIMD_REGS) &&
+	    event_has_simd_regs(event)) {
+		ret =3D -EOPNOTSUPP;
+		goto err_destroy;
+	}
+
 	if (!(pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS) &&
 	    event_has_extended_regs(event)) {
 		ret =3D -EOPNOTSUPP;
@@ -13656,7 +13757,8 @@ static int perf_copy_attr(struct perf_event_attr __us=
er *uattr,
=20
 	attr->size =3D size;
=20
-	if (attr->__reserved_1 || attr->__reserved_2 || attr->__reserved_3)
+	if (attr->__reserved_1 || attr->__reserved_2 ||
+	    attr->__reserved_3 || attr->__reserved_4)
 		return -EINVAL;
=20
 	if (attr->sample_type & ~(PERF_SAMPLE_MAX-1))
@@ -13705,6 +13807,14 @@ static int perf_copy_attr(struct perf_event_attr __u=
ser *uattr,
 		ret =3D perf_reg_validate(attr->sample_regs_user);
 		if (ret)
 			return ret;
+		if (attr->sample_simd_regs_enabled) {
+			ret =3D perf_simd_reg_validate(attr->sample_simd_vec_reg_qwords,
+						     attr->sample_simd_vec_reg_user,
+						     attr->sample_simd_pred_reg_qwords,
+						     attr->sample_simd_pred_reg_user);
+			if (ret)
+				return ret;
+		}
 	}
=20
 	if (attr->sample_type & PERF_SAMPLE_STACK_USER) {
@@ -13725,8 +13835,19 @@ static int perf_copy_attr(struct perf_event_attr __u=
ser *uattr,
 	if (!attr->sample_max_stack)
 		attr->sample_max_stack =3D sysctl_perf_event_max_stack;
=20
-	if (attr->sample_type & PERF_SAMPLE_REGS_INTR)
+	if (attr->sample_type & PERF_SAMPLE_REGS_INTR) {
 		ret =3D perf_reg_validate(attr->sample_regs_intr);
+		if (ret)
+			return ret;
+		if (attr->sample_simd_regs_enabled) {
+			ret =3D perf_simd_reg_validate(attr->sample_simd_vec_reg_qwords,
+						     attr->sample_simd_vec_reg_intr,
+						     attr->sample_simd_pred_reg_qwords,
+						     attr->sample_simd_pred_reg_intr);
+			if (ret)
+				return ret;
+		}
+	}
=20
 #ifndef CONFIG_CGROUP_PERF
 	if (attr->sample_type & PERF_SAMPLE_CGROUP)
