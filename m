Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA3A37F010;
	Wed, 23 Sep 2026 09:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157169; cv=none; b=Tap5tNANTUm2736EhVW3NnBRdENTXnZrkK68FRkr7VYEmRTh6N/HpDP+DeI9vumW4X7iNc8MA6pZ03pYKuZx0J2/PSwkBXJPjCi7rXUoU6FXVUKnIzq/OG9eyrtfDgHCcut8avLA2tBGeEEaFbxHuKsOHpSceotL/gf/QHQ2nhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157169; c=relaxed/simple;
	bh=YMFstsB0ypFOj9XS4c+lLIJKbbY5bFltMo6tsyTzQ3U=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Un9d6h1DWuqkQSKfhfo0zLihXiXianR+Ir52r5ProR+D9mMWL4NC3NEgmImvh80gbUSJijmrbqNxDcRALdFUxydgMHCXNISQglMSt4kIHkAr5FnWjHRks425QuiFaadp/zoibw/pvN/ty+gXQTab0h9csV4rgek2NYDH+vxOfKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Tw29bqu2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FBx/MRoD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Tw29bqu2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FBx/MRoD"
Date: Wed, 23 Sep 2026 09:52:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790157165;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uLzwOQlMdK5x6x8Mnx84R7zNUCvUw3YnhHwQf2au4G4=;
	b=Tw29bqu2Yra1pWDiLVel9wRjdGOpvHAjEabHlBp/Ledel70xzYRrAEBe+LI3+PDt6bKC+K
	NVUwcXs4ODFxrnqpYqfAX29ZRX6P8oGvbt2qNO/sFKCxRgDUurIKtlZ+IEXyIb0kkGgsWX
	cFjygT48b+xTH1g5vMhPyMU5biEibca7pGMdAgUPT6YgDRcWdq2kC5oOMDno6Qg2jdk5eZ
	JXawhCxX7VdUztaF/Kk9niz5e29jPnU7dAcD0nRPv5Jf7X85Scf3LHXNwbtA9iqGLl74L+
	5GiFityDVR7gBCBmLYEzUOipMqohqeSza0qShmoE/yv3KTc9ekmdgXjhFCbv/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790157165;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uLzwOQlMdK5x6x8Mnx84R7zNUCvUw3YnhHwQf2au4G4=;
	b=FBx/MRoDdnuj4M3Jh76RiQXv5wWI26OX+0gq9MqwFjYSEPC5TzJiibeJWRIhQIeW/WHz7F
	i36r2YxDZ2nu6tDg==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/urgent] perf/core: Fill branch entries with a single assignment
Cc: Peter Zijlstra <peterz@infradead.org>,
 Puranjay Mohan <puranjay@kernel.org>, Yifan Wu <wuyifan50@huawei.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260810133540.1947118-4-puranjay@kernel.org>
References: <20260810133540.1947118-4-puranjay@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179015716349.2819794.11352257885001205138.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     24b620729e53d978b3e425f55bc66efd3bab1f59
Gitweb:        https://git.kernel.org/tip/24b620729e53d978b3e425f55bc66efd3ba=
b1f59
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Mon, 10 Aug 2026 06:35:36 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 23 Sep 2026 11:48:36 +02:00

perf/core: Fill branch entries with a single assignment

perf_clear_branch_entry_bitfields() clears the bitfields of struct
perf_branch_entry one by one and leaves from/to alone, since callers
overwrite those straight away. The list has to be kept in sync with the
struct by hand and has already fallen behind: new_type and priv were
added to perf_branch_entry and never added here.

Only BRBE writes those two, and neither for every record.
brbe_set_perf_entry_type() leaves new_type alone for a branch type it
does not recognise, and priv is not set for source-only records.
arm_pmuv3.c allocates the per-CPU branch stack with kmalloc(), so such a
record reaches userspace with whatever the slot held: uninitialised
kmalloc() data on the first pass over the buffer, the previous record's
values after that. Nothing under arch/x86/events/ writes either field,
so only arm64 is affected.

Assign the whole entry at each site instead. Everything not named is
then zero, and there is no list to keep in sync. The bitfields add up to
exactly 64 bits, so the struct has no padding to leave undefined.

perf_clear_branch_entry_bitfields() has no callers left, so remove it.
perf_entry_from_brbe_regset() assigns an empty literal instead, since it
fills from/to conditionally. PERF_BR_SPEC_NA is 0, so dropping the
explicit spec assignment changes nothing.

Fixes: b190bc4ac9e6 ("perf: Extend branch type classification")
Fixes: 5402d25aa571 ("perf: Capture branch privilege information")
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Tested-by: Yifan Wu <wuyifan50@huawei.com>
Link: https://patch.msgid.link/20260810133540.1947118-4-puranjay@kernel.org
---
 arch/x86/events/amd/brs.c   |  9 ++---
 arch/x86/events/amd/lbr.c   | 16 ++++-----
 arch/x86/events/intel/lbr.c | 65 +++++++++++++++++++-----------------
 drivers/perf/arm_brbe.c     |  2 +-
 include/linux/perf_event.h  | 17 +---------
 5 files changed, 48 insertions(+), 61 deletions(-)

diff --git a/arch/x86/events/amd/brs.c b/arch/x86/events/amd/brs.c
index dc56468..54b13fa 100644
--- a/arch/x86/events/amd/brs.c
+++ b/arch/x86/events/amd/brs.c
@@ -343,11 +343,10 @@ void amd_brs_drain(void)
 		if (!amd_brs_match_plm(event, from, to))
 			continue;
=20
-		perf_clear_branch_entry_bitfields(br+nr);
-
-		br[nr].from =3D from;
-		br[nr].to   =3D to;
-
+		br[nr] =3D (struct perf_branch_entry){
+			.from	=3D from,
+			.to	=3D to,
+		};
 		nr++;
 	}
 empty:
diff --git a/arch/x86/events/amd/lbr.c b/arch/x86/events/amd/lbr.c
index 9d9c961..a55646f 100644
--- a/arch/x86/events/amd/lbr.c
+++ b/arch/x86/events/amd/lbr.c
@@ -184,13 +184,6 @@ void amd_pmu_lbr_read(void)
 		    entry.to.split.reserved)
 			continue;
=20
-		perf_clear_branch_entry_bitfields(br + out);
-
-		br[out].from	=3D sign_ext_branch_ip(entry.from.split.ip);
-		br[out].to	=3D sign_ext_branch_ip(entry.to.split.ip);
-		br[out].mispred	=3D entry.from.split.mispredict;
-		br[out].predicted =3D !br[out].mispred;
-
 		/*
 		 * Set branch speculation information using the status of
 		 * the valid and spec bits.
@@ -208,7 +201,14 @@ void amd_pmu_lbr_read(void)
 		 * speculative and took the correct path
 		 */
 		idx =3D (entry.to.split.valid << 1) | entry.to.split.spec;
-		br[out].spec =3D lbr_spec_map[idx];
+
+		br[out] =3D (struct perf_branch_entry){
+			.from		=3D sign_ext_branch_ip(entry.from.split.ip),
+			.to		=3D sign_ext_branch_ip(entry.to.split.ip),
+			.mispred	=3D entry.from.split.mispredict,
+			.predicted	=3D !entry.from.split.mispredict,
+			.spec		=3D lbr_spec_map[idx],
+		};
 		out++;
 	}
=20
diff --git a/arch/x86/events/intel/lbr.c b/arch/x86/events/intel/lbr.c
index cbe5c76..22e2a06 100644
--- a/arch/x86/events/intel/lbr.c
+++ b/arch/x86/events/intel/lbr.c
@@ -756,10 +756,10 @@ void intel_pmu_lbr_read_32(struct cpu_hw_events *cpuc)
=20
 		rdmsrq(x86_pmu.lbr_from + lbr_idx, msr_lastbranch.lbr);
=20
-		perf_clear_branch_entry_bitfields(br);
-
-		br->from	=3D msr_lastbranch.from;
-		br->to		=3D msr_lastbranch.to;
+		*br =3D (struct perf_branch_entry){
+			.from	=3D msr_lastbranch.from,
+			.to	=3D msr_lastbranch.to,
+		};
 		br++;
 	}
 	cpuc->lbr_stack.nr =3D i;
@@ -847,14 +847,15 @@ void intel_pmu_lbr_read_64(struct cpu_hw_events *cpuc)
 		if (abort && x86_pmu.lbr_double_abort && out > 0)
 			out--;
=20
-		perf_clear_branch_entry_bitfields(br+out);
-		br[out].from	 =3D from;
-		br[out].to	 =3D to;
-		br[out].mispred	 =3D mis;
-		br[out].predicted =3D pred;
-		br[out].in_tx	 =3D in_tx;
-		br[out].abort	 =3D abort;
-		br[out].cycles	 =3D cycles;
+		br[out] =3D (struct perf_branch_entry){
+			.from		=3D from,
+			.to		=3D to,
+			.mispred	=3D mis,
+			.predicted	=3D pred,
+			.in_tx		=3D in_tx,
+			.abort		=3D abort,
+			.cycles		=3D cycles,
+		};
 		out++;
 	}
 	cpuc->lbr_stack.nr =3D out;
@@ -905,6 +906,7 @@ static void intel_pmu_store_lbr(struct cpu_hw_events *cpu=
c,
 	struct perf_branch_entry *e;
 	struct lbr_entry *lbr;
 	u64 from, to, info;
+	bool mispred;
 	int i;
=20
 	for (i =3D 0; i < x86_pmu.lbr_nr; i++) {
@@ -921,24 +923,27 @@ static void intel_pmu_store_lbr(struct cpu_hw_events *c=
puc,
 		to =3D rdlbr_to(i, lbr);
 		info =3D rdlbr_info(i, lbr);
=20
-		perf_clear_branch_entry_bitfields(e);
-
-		e->from		=3D from;
-		e->to		=3D to;
-		e->mispred	=3D get_lbr_mispred(info);
-		e->predicted	=3D !e->mispred;
-		e->in_tx	=3D !!(info & LBR_INFO_IN_TX);
-		e->abort	=3D !!(info & LBR_INFO_ABORT);
-		e->cycles	=3D get_lbr_cycles(info);
-		e->type		=3D get_lbr_br_type(info);
-
-		/*
-		 * Leverage the reserved field of cpuc->lbr_entries[i] to
-		 * temporarily store the branch counters information.
-		 * The later code will decide what content can be disclosed
-		 * to the perf tool. Pleae see intel_pmu_lbr_counters_reorder().
-		 */
-		e->reserved	=3D (info >> LBR_INFO_BR_CNTR_OFFSET) & LBR_INFO_BR_CNTR_FULL_=
MASK;
+		mispred =3D get_lbr_mispred(info);
+
+		*e =3D (struct perf_branch_entry){
+			.from		=3D from,
+			.to		=3D to,
+			.mispred	=3D mispred,
+			.predicted	=3D !mispred,
+			.in_tx		=3D !!(info & LBR_INFO_IN_TX),
+			.abort		=3D !!(info & LBR_INFO_ABORT),
+			.cycles		=3D get_lbr_cycles(info),
+			.type		=3D get_lbr_br_type(info),
+			/*
+			 * Leverage the reserved field of
+			 * cpuc->lbr_entries[i] to temporarily store the
+			 * branch counters information. The later code will
+			 * decide what content can be disclosed to the perf
+			 * tool. Pleae see intel_pmu_lbr_counters_reorder().
+			 */
+			.reserved	=3D (info >> LBR_INFO_BR_CNTR_OFFSET) &
+					  LBR_INFO_BR_CNTR_FULL_MASK,
+		};
 	}
=20
 	cpuc->lbr_stack.nr =3D i;
diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
index ba554e0..254be4d 100644
--- a/drivers/perf/arm_brbe.c
+++ b/drivers/perf/arm_brbe.c
@@ -604,7 +604,7 @@ static bool perf_entry_from_brbe_regset(int index, struct=
 perf_branch_entry *ent
 		return false;
=20
 	brbinf =3D bregs.brbinf;
-	perf_clear_branch_entry_bitfields(entry);
+	*entry =3D (struct perf_branch_entry){ };
 	if (brbe_record_is_complete(brbinf)) {
 		entry->from =3D bregs.brbsrc;
 		entry->to =3D bregs.brbtgt;
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 5842552..915c6fd 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1467,23 +1467,6 @@ static inline u32 perf_sample_data_size(struct perf_sa=
mple_data *data,
 	return size;
 }
=20
-/*
- * Clear all bitfields in the perf_branch_entry.
- * The to and from fields are not cleared because they are
- * systematically modified by caller.
- */
-static inline void perf_clear_branch_entry_bitfields(struct perf_branch_entr=
y *br)
-{
-	br->mispred	=3D 0;
-	br->predicted	=3D 0;
-	br->in_tx	=3D 0;
-	br->abort	=3D 0;
-	br->cycles	=3D 0;
-	br->type	=3D 0;
-	br->spec	=3D PERF_BR_SPEC_NA;
-	br->reserved	=3D 0;
-}
-
 extern void perf_output_sample(struct perf_output_handle *handle,
 			       struct perf_event_header *header,
 			       struct perf_sample_data *data,
