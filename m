Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238917;
	b=rgwoET0T4H5XDEhVFvE5ZzLm/K/zZ/NxMuQaLA/1VEipnGC8+AVSxZYhAyQlrlDmotWx
	 mJV8rGPfzHyfDRDWJaLMxlrkaRQE1ISfpc5k6L8DffmGkyne4RTQ5oQrVCrl0LCXJZqoo
	 CsJ+VjgSYqYzV75a3NGWBR4zF6asb/hTErF4aVjiZpgG4/hf6xDajPQC1UF7pry3GqA8n
	 KFqOAagO4RJyesaylodY0kUPaU6fYJaBbHU0H6CKLUaJTrnWGDeVjXUyUzqophThymzbb
	 vAHg3zTklit7EDboxi71y9ExyMpZMt2TkG4SQ/EXfW1Xyb6OjmOeYVOLIg4dG3kJK3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238917;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=NP/X+9+fZhZ2Rv3Tr7J9fSnvRDkbBmUCrT9hjnk2v6U=;
	b=KzYZdrOf/VkqPwLoZ250raapz1AOw0tMnggmd9vNNyrn/RzHK9mQmWZ3atYxqd8OXnRg
	 Sm2bJ7spGGgcL4InRGWgG7w+Ao9/O+Lr4ly5HfvjtT+HmySeuf8pN1PgSpBVb3TiBD5m+
	 nsj+pUuF27X/ha0f5P1v+7+JD5FP6TRw36do6V5o+KBSLybXOgAXhAiyRMjNNV2peinCX
	 W4T327NTw7seZ2T6X56vf0vcE/i/86enV/wJ3eJA+xUFUnRe6R3QHqQ5Bh2ti1pm/+3Wh
	 IhX5h+vzNppn3lLXryHhBa2Jtj0RXrdtEmTv+JZhF76arvp4JQM/Bf/rCPaxFRSNnGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Mzo3Wz7v;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Rl5lZxuk;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01502606A31C;
	Mon,  9 Nov 2026 15:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01502606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Mzo3Wz7v;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Rl5lZxuk
Date: Mon, 09 Nov 2026 15:41:52 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794238914;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NP/X+9+fZhZ2Rv3Tr7J9fSnvRDkbBmUCrT9hjnk2v6U=;
	b=Mzo3Wz7v8BGIauxqMjdXF/XJzGoqfG0wCMnGaOHAz/U6W/g2e/CXZDQLxfzrvM1by5MkBu
	LWIRTigGWuxwLV1+O+Dbn3+m0YhnHkQXOJIDabv9+dhcGgigW1aUyGaiIZWOpMhK05wi4w
	qMU0ydNjMf9M2Vw3OqYcBy7n+lBv4U1/FXJPou4ACKIQdvqr0hVr9rY/lXcsTOjYvQLuKO
	89zAra0wfI/wx9tKC8UxN3XrqUvTpwVzBfHspWcBB+0ASyY21PJnn/fYJ8vII1Qxudxfci
	kuCDPu9exxFao+fhkCfqOL5cOBi6Kv5jd72OtwkJ24GaaY9SnFyalyMfypCMMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794238914;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NP/X+9+fZhZ2Rv3Tr7J9fSnvRDkbBmUCrT9hjnk2v6U=;
	b=Rl5lZxukQOyAyPVc7T+M3/fMtvtSQgD7UyKT9rWFw/VP6G0KZNF95mAFrS7aJTvWByvXwE
	geZIx2+Mx3XilVAA==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] vdso/gettimeofday: Replace the clock_data array
 with regular members
Cc: linux@weissschuh.net, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261102-vdso-cleanup-v1-1-f878c03881e8@weissschuh.net>
References: <20261102-vdso-cleanup-v1-1-f878c03881e8@weissschuh.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179423891291.2093942.12447834362956170527.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     689868cc2af9cae9a4eff90eadf5726bdc20cd82
Gitweb:        https://git.kernel.org/tip/689868cc2af9cae9a4eff90eadf5726bdc2=
0cd82
Author:        Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
AuthorDate:    Mon, 02 Nov 2026 02:40:24=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 16:36:03 +01:00

vdso/gettimeofday: Replace the clock_data array with regular members

The clock_data array is not used as such. The two entries have different
semantics and nearly all users only work on one of them.
The fact that they are kept in an array makes accesses to the
clocksource data clunky and non-obvious to understand.

Replace the array with two regular fields.

Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261102-vdso-cleanup-v1-1-f878c03881e8@weisss=
chuh.net
---
 include/vdso/datapage.h      | 10 ++++------
 include/vdso/helpers.h       | 12 ++++--------
 kernel/time/namespace_vdso.c |  6 ++----
 kernel/time/vsyscall.c       | 28 +++++++++++++---------------
 lib/vdso/gettimeofday.c      | 23 +++++++++++------------
 5 files changed, 34 insertions(+), 45 deletions(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 09897f7..5c4dac5 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -41,10 +41,6 @@ struct vdso_arch_data {
 #define VDSO_RAW	(BIT(CLOCK_MONOTONIC_RAW))
 #define VDSO_AUX	__GENMASK(CLOCK_AUX_LAST, CLOCK_AUX)
=20
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
=20
-	struct vdso_clock		clock_data[CS_BASES];
+	struct vdso_clock		hres_coarse;
+	struct vdso_clock		raw;
 	struct vdso_clock		aux_clock_data[MAX_AUX_CLOCKS];
=20
 	s32				tz_minuteswest;
diff --git a/include/vdso/helpers.h b/include/vdso/helpers.h
index 65151b6..135a9c4 100644
--- a/include/vdso/helpers.h
+++ b/include/vdso/helpers.h
@@ -93,22 +93,18 @@ static __always_inline void vdso_write_end_clock(struct v=
dso_clock *vc)
=20
 static __always_inline void vdso_write_begin(struct vdso_time_data *vd)
 {
-	struct vdso_clock *vc =3D vd->clock_data;
-
-	vdso_write_seq_begin(&vc[CS_HRES_COARSE]);
-	vdso_write_seq_begin(&vc[CS_RAW]);
+	vdso_write_seq_begin(&vd->hres_coarse);
+	vdso_write_seq_begin(&vd->raw);
 	/* Ensure the sequence invalidation is visible before data is modified */
 	smp_wmb();
 }
=20
 static __always_inline void vdso_write_end(struct vdso_time_data *vd)
 {
-	struct vdso_clock *vc =3D vd->clock_data;
-
 	/* Ensure the data update is visible before the sequence is set valid again=
 */
 	smp_wmb();
-	vdso_write_seq_end(&vc[CS_HRES_COARSE]);
-	vdso_write_seq_end(&vc[CS_RAW]);
+	vdso_write_seq_end(&vd->hres_coarse);
+	vdso_write_seq_end(&vd->raw);
 }
=20
 #endif /* !__ASSEMBLER__ */
diff --git a/kernel/time/namespace_vdso.c b/kernel/time/namespace_vdso.c
index 5ac7b6a..42faeac 100644
--- a/kernel/time/namespace_vdso.c
+++ b/kernel/time/namespace_vdso.c
@@ -87,7 +87,6 @@ static void timens_set_vvar_page(struct task_struct *task,
 				struct time_namespace *ns)
 {
 	struct vdso_time_data *vdata;
-	struct vdso_clock *vc;
 	unsigned int i;
=20
 	if (ns =3D=3D &init_time_ns)
@@ -104,10 +103,9 @@ static void timens_set_vvar_page(struct task_struct *tas=
k,
=20
 	ns->frozen_offsets =3D true;
 	vdata =3D page_address(ns->vvar_page);
-	vc =3D vdata->clock_data;
=20
-	for (i =3D 0; i < CS_BASES; i++)
-		timens_setup_vdso_clock_data(&vc[i], ns);
+	timens_setup_vdso_clock_data(&vdata->hres_coarse, ns);
+	timens_setup_vdso_clock_data(&vdata->raw, ns);
=20
 	if (IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS)) {
 		for (i =3D 0; i < ARRAY_SIZE(vdata->aux_clock_data); i++)
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index 658553f..12d3518 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -41,15 +41,14 @@ static inline void fill_clock_configuration(struct vdso_c=
lock *vc, const struct=20
=20
 static inline void update_vdso_time_data(struct vdso_time_data *vdata, struc=
t timekeeper *tk)
 {
-	struct vdso_clock *vc =3D vdata->clock_data;
 	struct vdso_timestamp *vdso_ts;
 	u64 nsec, sec;
=20
-	fill_clock_configuration(&vc[CS_HRES_COARSE],	&tk->tkr_mono);
-	fill_clock_configuration(&vc[CS_RAW],		&tk->tkr_raw);
+	fill_clock_configuration(&vdata->hres_coarse,	&tk->tkr_mono);
+	fill_clock_configuration(&vdata->raw,		&tk->tkr_raw);
=20
 	/* CLOCK_MONOTONIC */
-	vdso_ts		=3D &vc[CS_HRES_COARSE].basetime[CLOCK_MONOTONIC];
+	vdso_ts		=3D &vdata->hres_coarse.basetime[CLOCK_MONOTONIC];
 	vdso_ts->sec	=3D tk->xtime_sec + tk->wall_to_monotonic.tv_sec;
=20
 	nsec =3D tk->tkr_mono.xtime_nsec;
@@ -65,18 +64,18 @@ static inline void update_vdso_time_data(struct vdso_time=
_data *vdata, struct ti
 	nsec	+=3D (u64)tk->monotonic_to_boot.tv_nsec << tk->tkr_mono.shift;
=20
 	/* CLOCK_BOOTTIME */
-	vdso_ts		=3D &vc[CS_HRES_COARSE].basetime[CLOCK_BOOTTIME];
+	vdso_ts		=3D &vdata->hres_coarse.basetime[CLOCK_BOOTTIME];
 	vdso_ts->sec	=3D sec;
 	vdso_ts->sec	+=3D __iter_div64_u64_rem(nsec, (u64)NSEC_PER_SEC << tk->tkr_m=
ono.shift,
 						&vdso_ts->nsec);
=20
 	/* CLOCK_MONOTONIC_RAW */
-	vdso_ts		=3D &vc[CS_RAW].basetime[CLOCK_MONOTONIC_RAW];
+	vdso_ts		=3D &vdata->raw.basetime[CLOCK_MONOTONIC_RAW];
 	vdso_ts->sec	=3D tk->raw_sec;
 	vdso_ts->nsec	=3D tk->tkr_raw.xtime_nsec;
=20
 	/* CLOCK_TAI */
-	vdso_ts		=3D &vc[CS_HRES_COARSE].basetime[CLOCK_TAI];
+	vdso_ts		=3D &vdata->hres_coarse.basetime[CLOCK_TAI];
 	vdso_ts->sec	=3D tk->xtime_sec + (s64)tk->tai_offset;
 	vdso_ts->nsec	=3D tk->tkr_mono.xtime_nsec;
 }
@@ -84,7 +83,6 @@ static inline void update_vdso_time_data(struct vdso_time_d=
ata *vdata, struct ti
 void update_vsyscall(struct timekeeper *tk)
 {
 	struct vdso_time_data *vdata =3D vdso_k_time_data;
-	struct vdso_clock *vc =3D vdata->clock_data;
 	struct vdso_timestamp *vdso_ts;
 	s32 clock_mode;
 	u64 nsec;
@@ -93,21 +91,21 @@ void update_vsyscall(struct timekeeper *tk)
 	vdso_write_begin(vdata);
=20
 	clock_mode =3D tk->tkr_mono.clock->vdso_clock_mode;
-	vc[CS_HRES_COARSE].clock_mode	=3D clock_mode;
-	vc[CS_RAW].clock_mode		=3D clock_mode;
+	vdata->hres_coarse.clock_mode	=3D clock_mode;
+	vdata->raw.clock_mode		=3D clock_mode;
=20
 	/* CLOCK_REALTIME also required for time() */
-	vdso_ts		=3D &vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME];
+	vdso_ts		=3D &vdata->hres_coarse.basetime[CLOCK_REALTIME];
 	vdso_ts->sec	=3D tk->xtime_sec;
 	vdso_ts->nsec	=3D tk->tkr_mono.xtime_nsec;
=20
 	/* CLOCK_REALTIME_COARSE */
-	vdso_ts		=3D &vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME_COARSE];
+	vdso_ts		=3D &vdata->hres_coarse.basetime[CLOCK_REALTIME_COARSE];
 	vdso_ts->sec	=3D tk->xtime_sec;
 	vdso_ts->nsec	=3D tk->coarse_nsec;
=20
 	/* CLOCK_MONOTONIC_COARSE */
-	vdso_ts		=3D &vc[CS_HRES_COARSE].basetime[CLOCK_MONOTONIC_COARSE];
+	vdso_ts		=3D &vdata->hres_coarse.basetime[CLOCK_MONOTONIC_COARSE];
 	vdso_ts->sec	=3D tk->xtime_sec + tk->wall_to_monotonic.tv_sec;
 	nsec		=3D tk->coarse_nsec;
 	nsec		=3D nsec + tk->wall_to_monotonic.tv_nsec;
@@ -125,8 +123,8 @@ void update_vsyscall(struct timekeeper *tk)
 	if (clock_mode !=3D VDSO_CLOCKMODE_NONE)
 		update_vdso_time_data(vdata, tk);
=20
-	__arch_update_vdso_clock(&vc[CS_HRES_COARSE]);
-	__arch_update_vdso_clock(&vc[CS_RAW]);
+	__arch_update_vdso_clock(&vdata->hres_coarse);
+	__arch_update_vdso_clock(&vdata->raw);
=20
 	vdso_write_end(vdata);
=20
diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 67c9bcd..4d1d503 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -208,7 +208,7 @@ bool do_coarse_timens(const struct vdso_time_data *vdns, =
const struct vdso_clock
 {
 	const struct vdso_time_data *vd =3D vdso_timens_data(vdns);
 	const struct timens_offset *offs =3D &vcns->offset[clk];
-	const struct vdso_clock *vc =3D vd->clock_data;
+	const struct vdso_clock *vc =3D &vd->hres_coarse;
 	const struct vdso_timestamp *vdso_ts;
 	u64 nsec;
 	s64 sec;
@@ -286,7 +286,7 @@ static __always_inline bool
 __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t cloc=
k,
 			     struct __kernel_timespec *ts)
 {
-	const struct vdso_clock *vc =3D vd->clock_data;
+	const struct vdso_clock *vc;
 	u32 msk;
=20
 	if (!vdso_clockid_valid(clock))
@@ -298,11 +298,11 @@ __cvdso_clock_gettime_common(const struct vdso_time_dat=
a *vd, clockid_t clock,
 	 */
 	msk =3D 1U << clock;
 	if (likely(msk & VDSO_HRES))
-		vc =3D &vc[CS_HRES_COARSE];
+		vc =3D &vd->hres_coarse;
 	else if (msk & VDSO_COARSE)
-		return do_coarse(vd, &vc[CS_HRES_COARSE], clock, ts);
+		return do_coarse(vd, &vd->hres_coarse, clock, ts);
 	else if (msk & VDSO_RAW)
-		vc =3D &vc[CS_RAW];
+		vc =3D &vd->raw;
 	else if (msk & VDSO_AUX)
 		return do_aux(vd, clock, ts);
 	else
@@ -363,7 +363,7 @@ static int
 __cvdso_gettimeofday_data(const struct vdso_time_data *vd,
 			  struct __kernel_old_timeval *tv, struct timezone *tz)
 {
-	const struct vdso_clock *vc =3D vd->clock_data;
+	const struct vdso_clock *vc =3D &vd->hres_coarse;
=20
 #ifndef __NR_gettimeofday
 	BUILD_BUG();
@@ -374,7 +374,7 @@ __cvdso_gettimeofday_data(const struct vdso_time_data *vd,
 	if (likely(tv !=3D NULL)) {
 		struct __kernel_timespec ts;
=20
-		if (!do_hres(vd, &vc[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
+		if (!do_hres(vd, vc, CLOCK_REALTIME, &ts))
 			return gettimeofday_fallback(tv, tz);
=20
 		tv->tv_sec =3D ts.tv_sec;
@@ -402,7 +402,7 @@ __cvdso_gettimeofday(struct __kernel_old_timeval *tv, str=
uct timezone *tz)
 static __kernel_old_time_t
 __cvdso_time_data(const struct vdso_time_data *vd, __kernel_old_time_t *time)
 {
-	const struct vdso_clock *vc =3D vd->clock_data;
+	const struct vdso_clock *vc =3D &vd->hres_coarse;
 	__kernel_old_time_t t;
=20
 #ifndef __NR_time
@@ -413,10 +413,10 @@ __cvdso_time_data(const struct vdso_time_data *vd, __ke=
rnel_old_time_t *time)
=20
 	if (vdso_is_timens_clock(vc)) {
 		vd =3D vdso_timens_data(vd);
-		vc =3D vd->clock_data;
+		vc =3D &vd->hres_coarse;
 	}
=20
-	t =3D READ_ONCE(vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
+	t =3D READ_ONCE(vc->basetime[CLOCK_REALTIME].sec);
=20
 	if (time)
 		*time =3D t;
@@ -435,14 +435,13 @@ static __always_inline
 bool __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t =
clock,
 				 struct __kernel_timespec *res)
 {
-	const struct vdso_clock *vc =3D vd->clock_data;
 	u32 msk;
 	u64 ns;
=20
 	if (!vdso_clockid_valid(clock))
 		return false;
=20
-	if (vdso_is_timens_clock(vc))
+	if (vdso_is_timens_clock(&vd->hres_coarse))
 		vd =3D vdso_timens_data(vd);
=20
 	/*
