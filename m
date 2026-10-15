Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013695427F8;
	Thu, 15 Oct 2026 15:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078674; cv=none; b=pagepYw2RhnzND0tuI35CR4TALiuan1krnHA5X5r3yjlbUCI+KHojdMuolPXWLAzjR7nJLpDtNGja8dCyuqJ4YuQEeblg7Vhkrt8iwLHIcBUBj80O/CeUgdKCMzVXyaYtTAYwGHtTMeO41wxNCpwmBT6Zr+p2Hn2nTSngLwLVTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078674; c=relaxed/simple;
	bh=HbHZ0zSpalzu+/HhWb954NW9EWD07nZTu9sRufO+qpc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=WKWdyMgcos7E1ELdYdc6Y4N4/ztR1UNUyw0koyOc4+jbyT7UAlODtB/RTjhZiCG43btbA6E3yu47jOFB81n2fcHysCrJDw4NQz/v4fzrYAYkC2cD5oapLr+08zi3/ZngkNyVV96NfV8aU7uAnDrLwlq84EfSWEM5Xlxud20+mrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tifu50Hq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1m2Uh3yt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tifu50Hq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1m2Uh3yt"
Date: Thu, 15 Oct 2026 15:37:32 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792078654;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jYuspvsZSw9tm528DIsLvOJUfwxFNalrYwlZ4oycf1E=;
	b=tifu50Hqe/33FSeF2oKv1w51FxOviQKnEzVc5Qg8SxdN2kTU8LPZ3rGTM4UpbWHLUb1ySh
	AbcyKNJ/EDaPNI58zn+BuAYvpMzrFTcHZv9od2zt1DlgIQbwIdGNSALPD4ka2scP1URUHa
	qJn+SuIQOHD54iq3BLbBXksJ8+bz1zvAEWBpv1Hqea6+ReTNUVrdTgvRpkZxlUmB4EFIez
	Q84FGD2p9EEjK9HeRRh0WeghzMEzXPaJYgbEU0fn5rli2Ch7W5HrE2m6VLJkouWwbu5Zn1
	ZoNbhTO8PpPYVGNier3be2kMWCQLGNSZCyAA5lg3SX3mS5xrw5egKwkDMcpXfA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792078654;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jYuspvsZSw9tm528DIsLvOJUfwxFNalrYwlZ4oycf1E=;
	b=1m2Uh3ytwsIFXXHkkzDjMRTe5MuppexdPUE+Cj7vQaxoQgCiE44OH5JHzeJ6epOoaliwCG
	7sj9ExIrhsNZ2uBQ==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] vdso/gettimeofday: Avoid runtime conditional in
 do_hres_timens()
Cc: linux@weissschuh.net, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To:
 <20260921-vdso-timens-conditional-v1-1-eac173f8bd92@weissschuh.net>
References:
 <20260921-vdso-timens-conditional-v1-1-eac173f8bd92@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179207865256.2666988.1072658713710550460.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     50628893711fd5dc3fdbe8cb95e685f2fe75b662
Gitweb:        https://git.kernel.org/tip/50628893711fd5dc3fdbe8cb95e685f2fe7=
5b662
Author:        Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
AuthorDate:    Mon, 21 Sep 2026 11:45:58 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 17:33:20 +02:00

vdso/gettimeofday: Avoid runtime conditional in do_hres_timens()

Currently the derivation of the non-namespaced clock from its namespaced
sibling uses a runtime conditional. This conditional mirrors the
VDSO_RAW check in __cvdso_clock_gettime_common(), in a non-obvious way.

Replace the runtime conditional with unconditional pointer arithmetic,
which removes the duplication of logic and also is smaller and faster.
Also get rid of the weird double use of the 'vc' variable, pointing both
to the array of clocks and later to one specific one.

This saves 31 bytes of .text on x86_64.

Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260921-vdso-timens-conditional-v1-1-eac173f8=
bd92@weissschuh.net
---
 lib/vdso/gettimeofday.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 728fed1..c0e8199 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -140,21 +140,22 @@ const struct vdso_time_data *vdso_timens_data(const str=
uct vdso_time_data *vd)
 }
=20
 static __always_inline
+const struct vdso_clock *vdso_timens_clock(const struct vdso_clock *vc)
+{
+	return (void *)vc + PAGE_SIZE;
+}
+
+static __always_inline
 bool do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clo=
ck *vcns,
 		    clockid_t clk, struct __kernel_timespec *ts)
 {
 	const struct vdso_time_data *vd =3D vdso_timens_data(vdns);
+	const struct vdso_clock *vc =3D vdso_timens_clock(vcns);
 	const struct timens_offset *offs =3D &vcns->offset[clk];
-	const struct vdso_clock *vc =3D vd->clock_data;
 	u32 seq;
 	s64 sec;
 	u64 ns;
=20
-	if (clk !=3D CLOCK_MONOTONIC_RAW)
-		vc =3D &vc[CS_HRES_COARSE];
-	else
-		vc =3D &vc[CS_RAW];
-
 	do {
 		seq =3D vdso_read_begin(vc);
=20
