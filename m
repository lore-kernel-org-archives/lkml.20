Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFBB4A4F0C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009258; cv=none; b=nGyp3fJ/eFkCdCmXtNzm6p1oYyhTpLloj4+I6ucUFaI4Wbxk6mQuN3xn/oVQllKoCIx98OPHb8We/ut/j0YONijLxGDYt4pR2Ep3t5rVbhK9Uffs7C+vItH5rGLfhUpOgNMbA2eR6bZcJinCckhyb4JEWq8B4Lg3CF2AxNtv0oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009258; c=relaxed/simple;
	bh=IVtkAg/JoBv/qhJ971d3FB98Rqixe5t68Epg+kMtHug=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ToX3CLS40wxRtKbV8j7oAYM17wq5F4seDVWyHq2jMQEN+Hsu2zmDEmiwwLDtL9517u6TebSonTE8ZqVEIP/Q3LPQuH/MpMPJuJZqWBeg94UFnarv7+gAl+n7kZ1SPIRwwL1csp5Ib+RfdB7TlEtOT219QkDAQ3qHp8YFMiqCbyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ETjRJd3L; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3wJIcGjt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ETjRJd3L";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3wJIcGjt"
Date: Wed, 14 Oct 2026 20:20:53 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792009255;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5z5yLI/gQbpGiMVaJ7BGZCZj0zdehxbM40KSumYTGzQ=;
	b=ETjRJd3LBoL723b5QF8Ibg5YjapcxORsvYfgVnkmPHwxUjIGJpy/sGS0JYuLYBIBioSm5+
	gYykN+O1so44I5xomNEBzIFhwQrwf8fT03LspSXCy1pLY30aBVerrHykmKn5QNcNB3xAdE
	omuCbgtyZwvLOfI3/fWN7UKDICNICs5OB51B58Be6XJe047IBcud/HHVnE2FsPzHmNxAU2
	YIMX8QgQc8mrp2anS5eyAOiVKj2gz1bVk6m8EqW+kbnmeCoGwz2fB5WyZ5G06okwhNoFGf
	Ndpj3L72sO8Oh61TPIxvyd0sJggdcXlmKeHg3ilTUrMrw1Y2fM/uM/8BXHARrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792009255;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5z5yLI/gQbpGiMVaJ7BGZCZj0zdehxbM40KSumYTGzQ=;
	b=3wJIcGjtXYKA8SFrFlFG/X97H/BeBaa+JDbj9T7KNTi2y1yMSGT+t03XUR4E2R63q7Sl9G
	hvnkXwdan+USW2Dg==
From:
 clocksource-bot for =?utf-8?q?Beno=C3=AEt?= Monin <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next]
 clocksource/drivers/mips-gic-timer: Use local counter on synced multi-cluster
 systems
Cc: benoit.monin@bootlin.com, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 daniel.lezcano@oss.qualcomm.com
In-Reply-To: <20260929-sync-gic-counters-v4-5-ec70c4b60434@bootlin.com>
References: <20260929-sync-gic-counters-v4-5-ec70c4b60434@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179200925357.2666337.12975540625207144510.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     a2cab84d6601d92f8b67b9dbdae568f5276bf841
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//a2cab84d6601d92f8b67b9dbdae568f5276bf841
Author:        Beno=C3=AEt Monin <benoit.monin@bootlin.com>
AuthorDate:    Tue, 29 Sep 2026 14:14:12 +02:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Fri, 02 Oct 2026 12:01:11 +02:00

clocksource/drivers/mips-gic-timer: Use local counter on synced multi-cluster=
 systems

In a multi-cluster MIPS system there is one GIC per cluster, each with
its own independent counter. These counters are not synchronized in
hardware and can drift relative to one another, which is why multi-
cluster systems currently fall back to gic_hpt_read_multicluster():
every clocksource read is redirected to cluster 0's counter via a
cross-cluster register access.

Instead, actively synchronize the counter of each secondary cluster
to cluster 0's counter as its CPUs come online. When the first CPU of
a cluster starts and the GIC counter is stopped, gic_sync_counter_64()
is used to align the local counter with cluster 0 on systems using 64-bit
CM accesses:

  - the local counter is stopped, loaded with cluster 0's counter value
    plus an accumulated offset, and restarted;
  - the alignment is checked by reading the local counter, cluster 0's
    counter and the local counter again (t0, t1, t2). If t1 lies between
    t0 and t2 the two counters are considered in sync;
  - otherwise the offset is refined by half of the measured error to
    compensate for the cross-cluster access latency, and the process is
    retried.

After a short delay the alignment is re-checked to confirm the counters
have not drifted apart, and only then is the cluster recorded as
synchronized in gic_synced_cl_map. Clusters with no cores and cluster
0 itself are marked synchronized up-front.

Once every cluster is synchronized, gic_clocksource_promote() sets
gic_use_local_counter so that gic_hpt_read() stops redirecting reads to
cluster 0 and uses the local counter instead. It also re-enables the GIC
VDSO clock mode and registers the GIC counter as the sched_clock. Systems
where synchronization cannot be achieved keep using the safe cross-cluster
read path.

The promotion is deferred to a workqueue because it is triggered from the
CPU hotplug STARTING callback, which runs with interrupts disabled, while
registering the sched_clock and switching the VDSO clock mode should be
done from process context.

Note that the clocksource is only promoted once when all clusters are
first online and all GIC counters are in sync. It is assumed that
even if a cluster is fully powered off and later powered on again,
gic_sync_counter_64() will be able to re-synchronize it. Said differently:
there is no support to "demote" the clocksource.

On the dual-cluster Mobileye EyeQ6H SoC, this allows four times faster
clock_gettime(CLOCK_MONOTONIC) and a much higher precision sched_clock
instead of jiffies.

Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Link: https://patch.msgid.link/20260929-sync-gic-counters-v4-5-ec70c4b60434@b=
ootlin.com
---
 drivers/clocksource/mips-gic-timer.c | 128 +++++++++++++++++++++++---
 1 file changed, 117 insertions(+), 11 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-=
gic-timer.c
index cdaf4ba..fc97b31 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
+#include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/notifier.h>
@@ -21,6 +22,9 @@ static int gic_timer_irq;
 static unsigned int gic_frequency;
 static unsigned int gic_count_width;
 static bool __read_mostly gic_clock_unstable;
+static bool __read_mostly gic_use_local_counter =3D true;
+static unsigned long *gic_synced_cl_map;
+static struct work_struct gic_promote_work;
=20
 static void gic_clocksource_unstable(char *reason);
=20
@@ -102,10 +106,71 @@ static void gic_update_frequency(void *data)
 	clockevents_update_freq(this_cpu_ptr(&gic_clockevent_device), rate);
 }
=20
+/* Number of iterations to synchronize the local GIC counter */
+#define GIC_SYNC_ITERATIONS 4
+
+/* Delay in us to check if the local GIC counter is still in sync with clust=
er 0 */
+#define GIC_SYNC_CHECK_DELAY 100
+
+static void gic_sync_counter_64(unsigned int cluster)
+{
+	unsigned int config =3D read_gic_config();
+	u64 t0, t1, t2;
+	s64 offset =3D 0;
+
+	mips_cm_lock_other(0, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+
+	for (int i =3D 0; i < GIC_SYNC_ITERATIONS; i++) {
+		write_gic_config(config | GIC_CONFIG_COUNTSTOP);
+		write_gic_counter(read_gic_redir_counter() + offset);
+		write_gic_config(config & ~GIC_CONFIG_COUNTSTOP);
+
+		t0 =3D read_gic_counter();
+		t1 =3D read_gic_redir_counter();
+		t2 =3D read_gic_counter();
+
+		if (time_in_range64(t1, t0, t2))
+			break;
+
+		/*
+		 * Compute the offset to apply to the local counter
+		 * so that (t1 - t0) equals (t2 - t1).
+		 */
+		offset +=3D (s64)(2 * t1 - t0 - t2) / 2;
+	}
+
+	mips_cm_unlock_other();
+
+	if (!time_in_range64(t1, t0, t2))
+		return;
+
+	udelay(GIC_SYNC_CHECK_DELAY);
+
+	mips_cm_lock_other(0, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+	t0 =3D read_gic_counter();
+	t1 =3D read_gic_redir_counter();
+	t2 =3D read_gic_counter();
+	mips_cm_unlock_other();
+
+	/* If so, mark the cluster as synchronized */
+	if (time_in_range64(t1, t0, t2) && gic_synced_cl_map)
+		bitmap_set(gic_synced_cl_map, cluster, 1);
+}
+
 static int gic_starting_cpu(unsigned int cpu)
 {
-	/* Ensure the GIC counter is running */
-	clear_gic_config(GIC_CONFIG_COUNTSTOP);
+	unsigned int cluster =3D cpu_cluster(&cpu_data[cpu]);
+
+	if (read_gic_config() & GIC_CONFIG_COUNTSTOP) {
+		clear_gic_config(GIC_CONFIG_COUNTSTOP);
+
+		if (cluster && mips_cm_is64 && !gic_clock_unstable)
+			gic_sync_counter_64(cluster);
+
+		if (gic_synced_cl_map &&
+		    bitmap_full(gic_synced_cl_map, mips_cps_numclusters()))
+			schedule_work(&gic_promote_work);
+	}
=20
 	gic_clockevent_cpu_init(cpu, this_cpu_ptr(&gic_clockevent_device));
 	return 0;
@@ -154,11 +219,6 @@ static int gic_clockevent_init(void)
 	return 0;
 }
=20
-static u64 gic_hpt_read(struct clocksource *cs)
-{
-	return gic_read_count();
-}
-
 static u64 gic_hpt_read_multicluster(struct clocksource *cs)
 {
 	unsigned int hi, hi2, lo;
@@ -190,6 +250,14 @@ out:
 	return count;
 }
=20
+static u64 gic_hpt_read(struct clocksource *cs)
+{
+	if (unlikely(!READ_ONCE(gic_use_local_counter)))
+		return gic_hpt_read_multicluster(cs);
+
+	return gic_read_count();
+}
+
 static struct clocksource gic_clocksource =3D {
 	.name			=3D "GIC",
 	.read			=3D gic_hpt_read,
@@ -209,8 +277,28 @@ static void gic_clocksource_unstable(char *reason)
 	clocksource_mark_unstable(&gic_clocksource);
 }
=20
+static void gic_clocksource_promote(struct work_struct *work)
+{
+	if (gic_clock_unstable || READ_ONCE(gic_use_local_counter))
+		return;
+
+	WRITE_ONCE(gic_use_local_counter, true);
+
+#ifdef CONFIG_GENERIC_GETTIMEOFDAY
+	gic_clocksource.vdso_clock_mode =3D VDSO_CLOCKMODE_GIC;
+#endif
+
+	if (mips_cm_revision() >=3D CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ)) {
+		sched_clock_register(mips_cm_is64 ?
+				     gic_read_count_64 : gic_read_count_2x32,
+				     gic_count_width, gic_frequency);
+	}
+}
+
 static int __init __gic_clocksource_init(void)
 {
+	unsigned int numclusters;
+	bool synced =3D false;
 	int ret;
=20
 	/* Set clocksource mask. */
@@ -222,14 +310,32 @@ static int __init __gic_clocksource_init(void)
=20
 	/* Calculate a somewhat reasonable rating value. */
 	if (mips_cm_revision() >=3D CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ))
-		gic_clocksource.rating =3D 300; /* Good when frequecy is stable */
+		gic_clocksource.rating =3D 300; /* Good when frequency is stable */
 	else
 		gic_clocksource.rating =3D 200;
 	gic_clocksource.rating +=3D clamp(gic_frequency / 10000000, 0, 99);
=20
-	if (mips_cps_multicluster_cpus()) {
-		gic_clocksource.read =3D &gic_hpt_read_multicluster;
+	numclusters =3D mips_cps_numclusters();
+	if (numclusters > 1)
+		gic_synced_cl_map =3D bitmap_zalloc(numclusters, GFP_KERNEL);
+
+	/*
+	 * Mark cluster 0 as synchronized (with itself), and all clusters
+	 * without cores since there is no local GIC counter access on those.
+	 */
+	if (gic_synced_cl_map) {
+		bitmap_set(gic_synced_cl_map, 0, 1);
+		for (unsigned int cl =3D 0; cl < numclusters; cl++) {
+			if (!mips_cps_numcores(cl))
+				bitmap_set(gic_synced_cl_map, cl, 1);
+		}
+		synced =3D bitmap_full(gic_synced_cl_map, numclusters);
+	}
+
+	if (numclusters > 1 && !synced) {
+		WRITE_ONCE(gic_use_local_counter, false);
 		gic_clocksource.vdso_clock_mode =3D VDSO_CLOCKMODE_NONE;
+		INIT_WORK(&gic_promote_work, gic_clocksource_promote);
 	}
=20
 	ret =3D clocksource_register_hz(&gic_clocksource, gic_frequency);
@@ -288,7 +394,7 @@ static int __init gic_clocksource_of_init(struct device_n=
ode *node)
 	 * change performed by the CPC core clocks divider.
 	 */
 	if ((mips_cm_revision() >=3D CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ)) &&
-	     !mips_cps_multicluster_cpus()) {
+	     READ_ONCE(gic_use_local_counter)) {
 		sched_clock_register(mips_cm_is64 ?
 				     gic_read_count_64 : gic_read_count_2x32,
 				     gic_count_width, gic_frequency);
