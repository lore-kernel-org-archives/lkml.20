Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17EC3346A8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848263; cv=none; b=olqQm4QXuGpxRLsQ4NiRkOtCY310U4GkNZ3gWkTmOYbVfhzLdEKpbXgrIMkTvO3A96J7l58bus3m2dtNjX3s6EhXTMLMUqAA6MP7AfTJvCzD6RTyGLv5MdogFLvwdos5MUzj4SnH6yk6OeGMJqErZwiq+SCFLII36cW436OfWF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848263; c=relaxed/simple;
	bh=Cm91XuXYWfNnvS/8fx/3tsiF7VRLMNJTj+Jt+78NjxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ktIo/pF1Bv4JKrPYjsqGkwKZImSZriAJPlfcR63AuAodP4BPR8QHt2RkNfYpa42Hhi2r2eouJpnTnfshq2Un9Kzn9jGVYhc5wNyET9SrR9nMbMRfu7bGTLvxPxXhk6e6H5Bv8SUlf7o9p8MiAvcsVEAbg7Yb+xOiIWgny8OU9nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RQIFS2Md; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7JKDRwPh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RQIFS2Md";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7JKDRwPh"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788848259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CgRIzYoWduk04DnK+ru3ecoCYccONvLtK/rvWyN3WV0=;
	b=RQIFS2MdbkrHVw14+0OHwKI5ja50xivud9i2k0BSE4KJBfJsNeOgWvzHCgotNAipLnrH52
	BfKLOEd9/m76X+93cSH4dwzdOEDAV1daUN/fzjZtENJv+ZMW1B0MCheC2wwFj3aND86cA7
	kWyP/7+5ARHyMg5uArluZZttS+Pvn0FzAjMh++NjQo4AP196vTVuWGSqGZ67AmmJevS9z3
	6g/WJTd5sk/1FNZK5YRBju1NF9ARqEKrQ7sWoZjE0gM5IRpOg5OL1ZDyoRqJMuM78Nzsdd
	l16XSUYNAQy58M9ULekLZGXjlArECWgEfpRiv2ZKj5+AFU2PYhbtv10Hc3gZKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788848259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CgRIzYoWduk04DnK+ru3ecoCYccONvLtK/rvWyN3WV0=;
	b=7JKDRwPhDhlPQx/ZOx+RMf98H6fhO9FJloU1bC1yX0OJFe0aiQsEIJscgSn0wPIdwMOUbg
	D2mq+35SRQzRzJAQ==
Date: Tue, 08 Sep 2026 08:17:31 +0200
Subject: [PATCH v2 1/4] timekeeping: Move timekeeper_is_core_tk() up in the
 file
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-timekeeping-conditionals-v2-1-5ebc3e7e1da0@linutronix.de>
References: <20260908-timekeeping-conditionals-v2-0-5ebc3e7e1da0@linutronix.de>
In-Reply-To: <20260908-timekeeping-conditionals-v2-0-5ebc3e7e1da0@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788848252; l=1284;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Cm91XuXYWfNnvS/8fx/3tsiF7VRLMNJTj+Jt+78NjxM=;
 b=F9blxA1C250gvcz+wYh+AYtWPVIcmQDvcaF1NB9AVn/Jlb2EO0D5rFfIAQgTRvgVIrdMoyBlY
 6DkTNs86DI8C+IDgWHzFikwNtzemLpgomdCIiVPB80NgnwUl1ZWLf2D
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

New users are about to be introduced which require the definition
earlier in the file.

Move it.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 kernel/time/timekeeping.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index ea2e6e55f37b..2249d7fb3cb6 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -90,6 +90,11 @@ static inline void tk_update_aux_offs(struct timekeeper *tk, ktime_t offs)
 	tk->monotonic_to_aux = ktime_to_timespec64(offs);
 }
 
+static inline bool timekeeper_is_core_tk(struct timekeeper *tk)
+{
+	return !IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS) || tk->id == TIMEKEEPER_CORE;
+}
+
 /* flag for if timekeeping is suspended */
 int __read_mostly timekeeping_suspended;
 
@@ -1735,11 +1740,6 @@ int do_settimeofday64(const struct timespec64 *ts)
 }
 EXPORT_SYMBOL(do_settimeofday64);
 
-static inline bool timekeeper_is_core_tk(struct timekeeper *tk)
-{
-	return !IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS) || tk->id == TIMEKEEPER_CORE;
-}
-
 /**
  * __timekeeping_inject_offset - Adds or subtracts from the current time.
  * @tkd:	Pointer to the timekeeper to modify

-- 
2.55.0

