Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587233;
	b=0GFfJnG7MEtSdhNrmD+GS/YwnSaogqj2gJ0XttScaSFwpOdigk4L08NxKMG6JQzLxd/4
	 zyyeqiEDN83Vo0rNSUI5wnWsfPbFfOuSPk9bg6Cw3u+RsvRQCvf8om5fG4kW6UPB4/zYR
	 g/BIrZpqZfNzFbsoSlmcHG+FzGHP+RjxxBy2SyNt2wv5Nfst3rvDgoRpjsMpVk9/G1cYP
	 cdI5XN+1dNvZl+aU+xI2UXMp1kiA6Ht5xmm7s0JzYYOHsNQ8LUG0oo5oYANH9SrGNlZLI
	 glZ6iGx/KABWMFPh0NPX1zQt/LNi0SwD4vo2KBBHGXiFeKkHenNAp7fhbHpWVTZJlHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587233;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=HGsFz4zZ3/p+LhQ7JAluRZ7bOB4uT+eabyLqtC6YNSg=;
	b=o4Oklkshx78iue5j+VbgqUOJNdNdBQrJhiR6Sn0jIpzqj9V87FpyMhHXzcq8swsEJg7D
	 4GQAVNVNq0BL1UEbObv2ZhrFTFM2k/+gmiBfJuCvo7Ejb5Gr6k3RPh4ZcdhzfzowQapV8
	 RnvLf5Bn/fodxBG1Rwpwfb2wgU11eAqyAP+HCL/PgG1muWap6NyjYvivXlqYKAj1TpDye
	 +2j0oUib1g/RYzqAYvmQEfGH9YEdGE4CQ//sf/G2b6xnxpooHTlaSJbg3x02x6Dp6qxQZ
	 pU7zey47AegMhugMUhvKQXrk0c0s2GE4QstYfOCBMXDqTDagZPQ5WjAo/AdAZ8D2gLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=g12QDnXl;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A132A606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A132A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=g12QDnXl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1793587230;
	bh=fFtKa3rFywgfbzlyqWZ01yKhITtyO96VbxSyO2fGcKk=;
	h=From:Date:Subject:To:Cc:From;
	b=g12QDnXlsQF89yOs8vxdAeOjQDDpKa76FtBIxr6FUXYunzUMwbVmRhSQc4Ktmfn5E
	 84vfk1SvyYLEYbUpqW2NS2TjZMgFQgPqMyb0cT22VaxvUUm1fFNy+6DThbS9aBfE7F
	 fra17N3b66idwKFTC93ABOebx8mdYJEbOyF6Z/aM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Nov 2026 02:40:24 +0000
Subject: [PATCH] vdso/gettimeofday: Replace the clock_data array with
 regular members
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261102-vdso-cleanup-v1-1-f878c03881e8@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrBtIIibQq5QuxmTUEYmSqSKId
 zfW5Vv8f4BQZhJ4Vwdk2lh4TgXmVUEYMPWkOBaD1dYZbZzaoswqTIRpXVQbUTeE3nqsoSRLpo7
 3/+7zfSxrO1L43Q84zwuSrJyVcAAAAA==
X-Change-ID: 20261016-vdso-cleanup-bda05ea727a3
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793587225; l=10918;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=fFtKa3rFywgfbzlyqWZ01yKhITtyO96VbxSyO2fGcKk=;
 b=2MzgzJsO02r36dhf3c23i8KdyIvyPuUY6FrDRxajHIZazRm4VfP35c+7FoLC7fvesTscCOyCF
 ryXE6c6aIsaDLMWFExVKu1iWhr9H3+3mlwTi7hPuuZ3DapdUbaY/hQw
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The clock_data array is not used as such. The two entries have different
semantics and nearly all users only work on one of them.
The fact that they are kept in an array makes accesses to the
clocksource data clunky and non-obvious to understand.

Replace the array with two regular fields.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/vdso/datapage.h      | 10 ++++------
 include/vdso/helpers.h       | 12 ++++--------
 kernel/time/namespace_vdso.c |  6 ++----
 kernel/time/vsyscall.c       | 28 +++++++++++++---------------
 lib/vdso/gettimeofday.c      | 23 +++++++++++------------
 5 files changed, 34 insertions(+), 45 deletions(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 09897f76ae07..5c4dac5bdda9 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -41,10 +41,6 @@ struct vdso_arch_data {
 #define VDSO_RAW	(BIT(CLOCK_MONOTONIC_RAW))
 #define VDSO_AUX	__GENMASK(CLOCK_AUX_LAST, CLOCK_AUX)
 
-#define CS_HRES_COARSE	0
-#define CS_RAW		1
-#define CS_BASES	(CS_RAW + 1)
-
 /**
  * struct vdso_timestamp - basetime per clock_id
  * @sec:	seconds
@@ -111,7 +107,8 @@ struct vdso_clock {
  * struct vdso_time_data - vdso datapage representation
  * @arch_data:		architecture specific data (optional, defaults
  *			to an empty struct)
- * @clock_data:		clocksource related data (array)
+ * @hres_coarse:	high and coarse resolution clocksource related data
+ * @raw:		raw clocksource related data
  * @aux_clock_data:	auxiliary clocksource related data (array)
  * @tz_minuteswest:	minutes west of Greenwich
  * @tz_dsttime:		type of DST correction
@@ -128,7 +125,8 @@ struct vdso_clock {
 struct vdso_time_data {
 	struct arch_vdso_time_data	arch_data;
 
-	struct vdso_clock		clock_data[CS_BASES];
+	struct vdso_clock		hres_coarse;
+	struct vdso_clock		raw;
 	struct vdso_clock		aux_clock_data[MAX_AUX_CLOCKS];
 
 	s32				tz_minuteswest;
diff --git a/include/vdso/helpers.h b/include/vdso/helpers.h
index 65151b681c4f..135a9c417151 100644
--- a/include/vdso/helpers.h
+++ b/include/vdso/helpers.h
@@ -93,22 +93,18 @@ static __always_inline void vdso_write_end_clock(struct vdso_clock *vc)
 
 static __always_inline void vdso_write_begin(struct vdso_time_data *vd)
 {
-	struct vdso_clock *vc = vd->clock_data;
-
-	vdso_write_seq_begin(&vc[CS_HRES_COARSE]);
-	vdso_write_seq_begin(&vc[CS_RAW]);
+	vdso_write_seq_begin(&vd->hres_coarse);
+	vdso_write_seq_begin(&vd->raw);
 	/* Ensure the sequence invalidation is visible before data is modified */
 	smp_wmb();
 }
 
 static __always_inline void vdso_write_end(struct vdso_time_data *vd)
 {
-	struct vdso_clock *vc = vd->clock_data;
-
 	/* Ensure the data update is visible before the sequence is set valid again */
 	smp_wmb();
-	vdso_write_seq_end(&vc[CS_HRES_COARSE]);
-	vdso_write_seq_end(&vc[CS_RAW]);
+	vdso_write_seq_end(&vd->hres_coarse);
+	vdso_write_seq_end(&vd->raw);
 }
 
 #endif /* !__ASSEMBLER__ */
diff --git a/kernel/time/namespace_vdso.c b/kernel/time/namespace_vdso.c
index 5ac7b6a6d3a8..42faeace6c0f 100644
--- a/kernel/time/namespace_vdso.c
+++ b/kernel/time/namespace_vdso.c
@@ -87,7 +87,6 @@ static void timens_set_vvar_page(struct task_struct *task,
 				struct time_namespace *ns)
 {
 	struct vdso_time_data *vdata;
-	struct vdso_clock *vc;
 	unsigned int i;
 
 	if (ns == &init_time_ns)
@@ -104,10 +103,9 @@ static void timens_set_vvar_page(struct task_struct *task,
 
 	ns->frozen_offsets = true;
 	vdata = page_address(ns->vvar_page);
-	vc = vdata->clock_data;
 
-	for (i = 0; i < CS_BASES; i++)
-		timens_setup_vdso_clock_data(&vc[i], ns);
+	timens_setup_vdso_clock_data(&vdata->hres_coarse, ns);
+	timens_setup_vdso_clock_data(&vdata->raw, ns);
 
 	if (IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS)) {
 		for (i = 0; i < ARRAY_SIZE(vdata->aux_clock_data); i++)
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index 658553fd910b..12d3518306e4 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -41,15 +41,14 @@ static inline void fill_clock_configuration(struct vdso_clock *vc, const struct
 
 static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct timekeeper *tk)
 {
-	struct vdso_clock *vc = vdata->clock_data;
 	struct vdso_timestamp *vdso_ts;
 	u64 nsec, sec;
 
-	fill_clock_configuration(&vc[CS_HRES_COARSE],	&tk->tkr_mono);
-	fill_clock_configuration(&vc[CS_RAW],		&tk->tkr_raw);
+	fill_clock_configuration(&vdata->hres_coarse,	&tk->tkr_mono);
+	fill_clock_configuration(&vdata->raw,		&tk->tkr_raw);
 
 	/* CLOCK_MONOTONIC */
-	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_MONOTONIC];
+	vdso_ts		= &vdata->hres_coarse.basetime[CLOCK_MONOTONIC];
 	vdso_ts->sec	= tk->xtime_sec + tk->wall_to_monotonic.tv_sec;
 
 	nsec = tk->tkr_mono.xtime_nsec;
@@ -65,18 +64,18 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
 	nsec	+= (u64)tk->monotonic_to_boot.tv_nsec << tk->tkr_mono.shift;
 
 	/* CLOCK_BOOTTIME */
-	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_BOOTTIME];
+	vdso_ts		= &vdata->hres_coarse.basetime[CLOCK_BOOTTIME];
 	vdso_ts->sec	= sec;
 	vdso_ts->sec	+= __iter_div64_u64_rem(nsec, (u64)NSEC_PER_SEC << tk->tkr_mono.shift,
 						&vdso_ts->nsec);
 
 	/* CLOCK_MONOTONIC_RAW */
-	vdso_ts		= &vc[CS_RAW].basetime[CLOCK_MONOTONIC_RAW];
+	vdso_ts		= &vdata->raw.basetime[CLOCK_MONOTONIC_RAW];
 	vdso_ts->sec	= tk->raw_sec;
 	vdso_ts->nsec	= tk->tkr_raw.xtime_nsec;
 
 	/* CLOCK_TAI */
-	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_TAI];
+	vdso_ts		= &vdata->hres_coarse.basetime[CLOCK_TAI];
 	vdso_ts->sec	= tk->xtime_sec + (s64)tk->tai_offset;
 	vdso_ts->nsec	= tk->tkr_mono.xtime_nsec;
 }
@@ -84,7 +83,6 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
 void update_vsyscall(struct timekeeper *tk)
 {
 	struct vdso_time_data *vdata = vdso_k_time_data;
-	struct vdso_clock *vc = vdata->clock_data;
 	struct vdso_timestamp *vdso_ts;
 	s32 clock_mode;
 	u64 nsec;
@@ -93,21 +91,21 @@ void update_vsyscall(struct timekeeper *tk)
 	vdso_write_begin(vdata);
 
 	clock_mode = tk->tkr_mono.clock->vdso_clock_mode;
-	vc[CS_HRES_COARSE].clock_mode	= clock_mode;
-	vc[CS_RAW].clock_mode		= clock_mode;
+	vdata->hres_coarse.clock_mode	= clock_mode;
+	vdata->raw.clock_mode		= clock_mode;
 
 	/* CLOCK_REALTIME also required for time() */
-	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME];
+	vdso_ts		= &vdata->hres_coarse.basetime[CLOCK_REALTIME];
 	vdso_ts->sec	= tk->xtime_sec;
 	vdso_ts->nsec	= tk->tkr_mono.xtime_nsec;
 
 	/* CLOCK_REALTIME_COARSE */
-	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME_COARSE];
+	vdso_ts		= &vdata->hres_coarse.basetime[CLOCK_REALTIME_COARSE];
 	vdso_ts->sec	= tk->xtime_sec;
 	vdso_ts->nsec	= tk->coarse_nsec;
 
 	/* CLOCK_MONOTONIC_COARSE */
-	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_MONOTONIC_COARSE];
+	vdso_ts		= &vdata->hres_coarse.basetime[CLOCK_MONOTONIC_COARSE];
 	vdso_ts->sec	= tk->xtime_sec + tk->wall_to_monotonic.tv_sec;
 	nsec		= tk->coarse_nsec;
 	nsec		= nsec + tk->wall_to_monotonic.tv_nsec;
@@ -125,8 +123,8 @@ void update_vsyscall(struct timekeeper *tk)
 	if (clock_mode != VDSO_CLOCKMODE_NONE)
 		update_vdso_time_data(vdata, tk);
 
-	__arch_update_vdso_clock(&vc[CS_HRES_COARSE]);
-	__arch_update_vdso_clock(&vc[CS_RAW]);
+	__arch_update_vdso_clock(&vdata->hres_coarse);
+	__arch_update_vdso_clock(&vdata->raw);
 
 	vdso_write_end(vdata);
 
diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index a324b2f2ec6c..4c844bc6eb5f 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -202,7 +202,7 @@ bool do_coarse_timens(const struct vdso_time_data *vdns, const struct vdso_clock
 {
 	const struct vdso_time_data *vd = vdso_timens_data(vdns);
 	const struct timens_offset *offs = &vcns->offset[clk];
-	const struct vdso_clock *vc = vd->clock_data;
+	const struct vdso_clock *vc = &vd->hres_coarse;
 	const struct vdso_timestamp *vdso_ts;
 	u64 nsec;
 	s64 sec;
@@ -280,7 +280,7 @@ static __always_inline bool
 __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
 			     struct __kernel_timespec *ts)
 {
-	const struct vdso_clock *vc = vd->clock_data;
+	const struct vdso_clock *vc;
 	u32 msk;
 
 	if (!vdso_clockid_valid(clock))
@@ -292,11 +292,11 @@ __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
 	 */
 	msk = 1U << clock;
 	if (likely(msk & VDSO_HRES))
-		vc = &vc[CS_HRES_COARSE];
+		vc = &vd->hres_coarse;
 	else if (msk & VDSO_COARSE)
-		return do_coarse(vd, &vc[CS_HRES_COARSE], clock, ts);
+		return do_coarse(vd, &vd->hres_coarse, clock, ts);
 	else if (msk & VDSO_RAW)
-		vc = &vc[CS_RAW];
+		vc = &vd->raw;
 	else if (msk & VDSO_AUX)
 		return do_aux(vd, clock, ts);
 	else
@@ -357,7 +357,7 @@ static int
 __cvdso_gettimeofday_data(const struct vdso_time_data *vd,
 			  struct __kernel_old_timeval *tv, struct timezone *tz)
 {
-	const struct vdso_clock *vc = vd->clock_data;
+	const struct vdso_clock *vc = &vd->hres_coarse;
 
 #ifndef __NR_gettimeofday
 	BUILD_BUG();
@@ -368,7 +368,7 @@ __cvdso_gettimeofday_data(const struct vdso_time_data *vd,
 	if (likely(tv != NULL)) {
 		struct __kernel_timespec ts;
 
-		if (!do_hres(vd, &vc[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
+		if (!do_hres(vd, vc, CLOCK_REALTIME, &ts))
 			return gettimeofday_fallback(tv, tz);
 
 		tv->tv_sec = ts.tv_sec;
@@ -396,7 +396,7 @@ __cvdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
 static __kernel_old_time_t
 __cvdso_time_data(const struct vdso_time_data *vd, __kernel_old_time_t *time)
 {
-	const struct vdso_clock *vc = vd->clock_data;
+	const struct vdso_clock *vc = &vd->hres_coarse;
 	__kernel_old_time_t t;
 
 #ifndef __NR_time
@@ -407,10 +407,10 @@ __cvdso_time_data(const struct vdso_time_data *vd, __kernel_old_time_t *time)
 
 	if (vdso_is_timens_clock(vc)) {
 		vd = vdso_timens_data(vd);
-		vc = vd->clock_data;
+		vc = &vd->hres_coarse;
 	}
 
-	t = READ_ONCE(vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
+	t = READ_ONCE(vc->basetime[CLOCK_REALTIME].sec);
 
 	if (time)
 		*time = t;
@@ -429,14 +429,13 @@ static __always_inline
 bool __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t clock,
 				 struct __kernel_timespec *res)
 {
-	const struct vdso_clock *vc = vd->clock_data;
 	u32 msk;
 	u64 ns;
 
 	if (!vdso_clockid_valid(clock))
 		return false;
 
-	if (vdso_is_timens_clock(vc))
+	if (vdso_is_timens_clock(&vd->hres_coarse))
 		vd = vdso_timens_data(vd);
 
 	/*

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261016-vdso-cleanup-bda05ea727a3

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

