Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1EC3290DB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848262; cv=none; b=P044ZUiVZJIGLSyhPn92sSBmFYhrbEQEkwcldKhLmv9KVQaRaJdO88fqgibq0SglVaM4cS5D7i1Bum6zg7eZETl6/doQYXRSaux8+4J7yy1lOML9lMtU8Lgz2gD/0USBIQZiF1R9BQs/z3f2ikl9gLlz25wibtOm5TWaMZwH3+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848262; c=relaxed/simple;
	bh=0nrwRxMPqomQls4VE61GPGtxI43WqCSFoGdjRgLxyvI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XBEkOjb8PSW1gub0pZpHOHGgnxXzHUviyQvomTzbzFknQdlnY9VlkV4DHX/cl1URnIFVYnw7zztqPVsO9bIy2d+b+WRU3CXAPOgxbhR0Ulisr9cI68dR0SM16SffyGScVwzr2QXrldNCtVx+J/isJ4KTqjRh3gfcolUI8PSdnaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=y1904iom; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6iwQmMMP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y1904iom";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6iwQmMMP"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788848258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0I7kn7g619vstyuleehnj1qRCND5+t2xV3S4CRhIAeY=;
	b=y1904iomJwO9cmQIMSFeEMn7qXuf2SjPPEXLQ3AK8/wWqxNyLU6/oIA+GlTWwBslxiEsLV
	atV6+ORAHf607tHIPqqIKrLUN+pxxiYLjg2q9VU9Tw9lkTP80hChrtNO+0bhxs7ODlS2Ae
	B7B5cV1fASccui7X1THUWMlRx567o24lJPp4NJVZ91Xwjpq09VW8ROmjSdgN7J/vAxxqeh
	DYa0jHzuvveVpQ/AEXJ9ZhcMC6gzBrWuJQfnb6mUGJvPEARn5464xC70f/omXy1RJGefFO
	U3jtCKpeHh/mBJzBcDXH3MVH25vrWyQM9CrP8x1W0/KiwTeRCFgA6KTOYUi9VA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788848258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0I7kn7g619vstyuleehnj1qRCND5+t2xV3S4CRhIAeY=;
	b=6iwQmMMP9wleVwQWrOy6MSFMExF/L0ztFIpdd2KY78iWxFmjdbRJbNf7zPpR6aR0jiA+ei
	suzHH/wb/V8DTgAg==
Subject: [PATCH v2 0/4] timekeeping: Avoid some runtime conditionals around
 auxiliary clocks
Date: Tue, 08 Sep 2026 08:17:30 +0200
Message-Id: <20260908-timekeeping-conditionals-v2-0-5ebc3e7e1da0@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0JmbU1bpUVX3sOwQGaEidiSthIM4
 e5WXLt8P3nvLxApMEU4FwsEmjiydxn0roC2b1xHgjEzaKmNtFKJxE96EI3sOtF6h5yy0QxR6JI
 0HkusDJ4g62OgO89b+lpn7jkmH97b06S+6y9aKf0/OikhhS3pRgdjjLV4Gdi9UvCO5z0S1Ou6f
 gD8tGJ4xAAAAA==
X-Change-ID: 20260701-timekeeping-conditionals-25e2d45d86d9
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788848252; l=1065;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=0nrwRxMPqomQls4VE61GPGtxI43WqCSFoGdjRgLxyvI=;
 b=6Y8/eEpusz/C+XuqAgheO5tbN2i0WOy+BpljJiob9Tba8Krr5cskCKtefEGj14mbcTe+8B2Cr
 Blaw6qoE0roAFvgUwLrfsHM60JBVpXgcHuXd/v1RC+lBGyOWFTspkuE
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Some of the conditionals around auxiliary timekeepers are known at
compile time but are currently checked at runtime.
Introduce and use some helpers to avoid the runtime overhead.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Rebase on v7.3-rc1.
- Link to v1: https://patch.msgid.link/20260812-timekeeping-conditionals-v1-0-75ebe366677d@linutronix.de

---
Thomas Weißschuh (Schneider Electric) (4):
      timekeeping: Move timekeeper_is_core_tk() up in the file
      timekeeping: Use timekeeper_is_core_tk() in timekeeping_update_on_shadow()
      timekeeping: Remove tk_is_aux() and its usage
      timekeeping: Introduce and use timekeeper_is_clock_valid()

 kernel/time/timekeeping.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260701-timekeeping-conditionals-25e2d45d86d9

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

