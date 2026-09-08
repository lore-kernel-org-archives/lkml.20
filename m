Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344D93D4125;
	Tue,  8 Sep 2026 20:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900715; cv=none; b=qyElRp+5E+QYSxPVQGChvh5j9hXkRIxnxfRwAA5d7Ae0GYq//1di+YGgvEPK+VuSijChjTmbMsXxGriw5XYl3RMhY2LuOAWMrUWILukVtGtEUSSs3HpxCwfJdEcrv710BugFBb73CplGbNj8ggKt5G3O0ORefielb+dU2rf6P3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900715; c=relaxed/simple;
	bh=NCl4nAobggo56Ncoht2HFv/cr/lK6c9q8ycxhMxmcQc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=NhVUhacYxxIRgVGsgL+ZCbvJ7TYbkj61SHLHarMhIu1ao+ESJUEGozu1DkfOXBTlQ4eoffEHaH859tmCNYfMOaw3b8HnQ2iG4IjXbmJSo95K/3cWCr2mwJjQgpaip/IZRXIaATnmcVORrqjgB3LvwLCycPDrNqA+2/LUyP74w9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=15IqvpoF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ru6BBNAv; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="15IqvpoF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ru6BBNAv"
Date: Tue, 08 Sep 2026 20:51:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900711;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U1/E6UzoliBvr5mHywUUmKvV0mkO+PXccFYGo0G4mHw=;
	b=15IqvpoFabJ5zrF9li2ISdUBtaQEN5UjfTEbMkqqNicOB+RGonYGZ8BkQPONuKprZHXs14
	mSBqMsNhsHmLPivLUMkTtGSy4iEjYFhfTQ5nnUitTxLXQs3zRTsHukGNZehJix+9dOAziG
	rmRZGVLDxJlOGIe0WhyeshxsyJ1M2Xs/PmkuaSPoSGZXCQXrxgFPeDi4ArkAe6oP6ewscc
	pouqPjwHf5FaBRixYtIIgS5sF9vIOy65NoOM6o2r7xSk+O0yKZqeKkcLaK12ljTJGghN1n
	UBmm7I3bWsPRH4DlnolAHBXWnDKczyZhuzhsjv1cq+sWUKYNKmuL0SNiRMq9sg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900711;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U1/E6UzoliBvr5mHywUUmKvV0mkO+PXccFYGo0G4mHw=;
	b=ru6BBNAvFXpN9kMWN42hvyMTj75nXIFQvzmo+CTQ1oSJU8L2bpogj+yh55QT4/LgJpRwOW
	XMjUivBqsvhqKUCw==
From: "tip-bot2 for Kan Liang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf: Move and enhance has_extended_regs() for
 arch-specific use
Cc: Kan Liang <kan.liang@linux.intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-9-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-9-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890070949.623050.588597472422390535.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     05fe8825796e6b5557656c6c984486f0e66154fe
Gitweb:        https://git.kernel.org/tip/05fe8825796e6b5557656c6c984486f0e66=
154fe
Author:        Kan Liang <kan.liang@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:16 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:42 +02:00

perf: Move and enhance has_extended_regs() for arch-specific use

Move has_extended_regs() to include/linux/perf_event.h so it can be used
by arch-specific code.

While moving it, enhance the check logic and rename it to
event_has_extended_regs() to match existing perf event helper naming.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-9-dapeng1.mi@linux.inte=
l.com
---
 include/linux/perf_event.h | 10 ++++++++++
 kernel/events/core.c       |  8 +-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 5842552..264785a 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1534,6 +1534,16 @@ perf_event__output_id_sample(struct perf_event *event,
 extern void
 perf_log_lost_samples(struct perf_event *event, u64 lost);
=20
+static inline bool event_has_extended_regs(struct perf_event *event)
+{
+	struct perf_event_attr *attr =3D &event->attr;
+
+	return ((attr->sample_type & PERF_SAMPLE_REGS_USER) &&
+		(attr->sample_regs_user & PERF_REG_EXTENDED_MASK)) ||
+	       ((attr->sample_type & PERF_SAMPLE_REGS_INTR) &&
+		(attr->sample_regs_intr & PERF_REG_EXTENDED_MASK));
+}
+
 static inline bool event_has_any_exclude_flag(struct perf_event *event)
 {
 	struct perf_event_attr *attr =3D &event->attr;
diff --git a/kernel/events/core.c b/kernel/events/core.c
index c84340e..5a0ae02 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -13127,12 +13127,6 @@ int perf_pmu_unregister(struct pmu *pmu)
 }
 EXPORT_SYMBOL_GPL(perf_pmu_unregister);
=20
-static inline bool has_extended_regs(struct perf_event *event)
-{
-	return (event->attr.sample_regs_user & PERF_REG_EXTENDED_MASK) ||
-	       (event->attr.sample_regs_intr & PERF_REG_EXTENDED_MASK);
-}
-
 static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
 {
 	struct perf_event_context *ctx =3D NULL;
@@ -13167,7 +13161,7 @@ static int perf_try_init_event(struct pmu *pmu, struc=
t perf_event *event)
 		goto err_pmu;
=20
 	if (!(pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS) &&
-	    has_extended_regs(event)) {
+	    event_has_extended_regs(event)) {
 		ret =3D -EOPNOTSUPP;
 		goto err_destroy;
 	}
