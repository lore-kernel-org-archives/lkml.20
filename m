Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45C345041A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789983982; cv=none; b=Yq1/G3A15Qcg/K0TaPkeGon6MqRkgwJ1iUa+TzogNS1sZN+W7/pi2Hcl3M4pdPuwB1XZWYcvwP9QMM36RD9mdAmemtBjav/hkqYMpJ+OtdTfuq18PT7o9U7jzt9jnOZ3i8UqMHqwxjPsp0ACYY81P6TsAp8wTjXSM508mM4BiKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789983982; c=relaxed/simple;
	bh=fV1xaPY+sRwMZtpSIN6wrhucPsEUOR/9HpRNSALmywA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nismkvf/bAjJM9XxCyFzam+TScmp1U7pKQxSe8X+2ZtKCLAIPd3bh2DRe9eM0S1P9fOA8nTDq/4jw0q+N1mPvuuDYDTnYYLuzqcC1FwyMrXclqoaWbZuspLW2ai3EX3H0TqNT9viIBHmTO5eqFAkfpmXBjjDoc7HQ1hKwpFxzGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=XKaP0q21; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="XKaP0q21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1789983972;
	bh=fV1xaPY+sRwMZtpSIN6wrhucPsEUOR/9HpRNSALmywA=;
	h=From:Date:Subject:To:Cc:From;
	b=XKaP0q21QkS0+SvJmja3JvWBJdYkmDmFsF3v8SFJXxbRFGZ4jaMsO1YPonoZ4qaRK
	 vOlGCInKEvJghi2UBQLa4Y+JvAZEfIihcXK81CqJpbzjS9IyNV+ZwCxItxZob7sV5T
	 WmNbq5b6W/TJt49OTSsmrvrQDcwevc8ACBjIW+yw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 21 Sep 2026 11:45:58 +0200
Subject: [PATCH] vdso/gettimeofday: Avoid runtime conditional in
 do_hres_timens()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260921-vdso-timens-conditional-v1-1-eac173f8bd92@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1gaMotJepbiwk9imtDNlMkpBv
 LtjXb7F/yuYRBWDa7FClEVNg8+gsgD3HP1DUDkb6qruqgv1uLAFTPoRb+iCZ025GN/Ydkx905L
 jhiDX3yiT/v7n23Da5vtLXDp2sG07qGfbynsAAAA=
X-Change-ID: 20260917-vdso-timens-conditional-56d17351cd31
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789983970; l=1905;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=fV1xaPY+sRwMZtpSIN6wrhucPsEUOR/9HpRNSALmywA=;
 b=/3O3DMN+q+RGzIYa7hK4NmOG2O+IE84wOfADtFD3iEeQsER/UwhBDOqhT3GSeBPladk9Suk3z
 DMMHp90Sh9WB986jA1cC+BGGqhLSF7YKLZndbFvD9shtHNhmFWVWRHn
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Currently the derivation of the non-namespaced clock from its namespaced
sibling uses a runtime conditional. This conditional mirrors the
VDSO_RAW check in __cvdso_clock_gettime_common(), in a non-obvious way.

Replace the runtime conditional with unconditional pointer arithmetic,
which removes the duplication of logic and also is smaller and faster.
Also get rid of the weird double use of the 'vc' variable, pointing both
to the array of clocks and later to one specific one.

This saves 31 bytes of .text on x86_64.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 lib/vdso/gettimeofday.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index f7a591aba59f..7c45a8be9185 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -135,22 +135,23 @@ const struct vdso_time_data *vdso_timens_data(const struct vdso_time_data *vd)
 	return (void *)vd + PAGE_SIZE;
 }
 
+static __always_inline
+const struct vdso_clock *vdso_timens_clock(const struct vdso_clock *vc)
+{
+	return (void *)vc + PAGE_SIZE;
+}
+
 static __always_inline
 bool do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
 		    clockid_t clk, struct __kernel_timespec *ts)
 {
 	const struct vdso_time_data *vd = vdso_timens_data(vdns);
+	const struct vdso_clock *vc = vdso_timens_clock(vcns);
 	const struct timens_offset *offs = &vcns->offset[clk];
-	const struct vdso_clock *vc = vd->clock_data;
 	u32 seq;
 	s64 sec;
 	u64 ns;
 
-	if (clk != CLOCK_MONOTONIC_RAW)
-		vc = &vc[CS_HRES_COARSE];
-	else
-		vc = &vc[CS_RAW];
-
 	do {
 		seq = vdso_read_begin(vc);
 

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260917-vdso-timens-conditional-56d17351cd31

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

