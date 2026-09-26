Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA935231842
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790446137; cv=none; b=d2zTzq6gcuXd5gFKIng7WbvfGWnmlApxboS7FULEFysS2ep2+hpUAI5zpTsLUjA62HJ5fBPD4mTlgyvEihGuKWHpN2uI61hXEA5XXoLkIw9p9jUGDhJ697hCEQQ60C3QAuZNmAy5bKTShDAHCgCJY4fRicbQBPv3/pq9ETs/OQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790446137; c=relaxed/simple;
	bh=zx6IWeUtdtp5Zm8hPLuz3hPyom47FJEXLCgqQ3wiXBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n7K9EaFo4ReZEYh8VhZl4HAYSnu/qXawLX9QYMdoaUt58SQEMP5eIDQo36wKPtqDfoagDt1TE48ruNcwTKAlQM1oRQSH63YuJj3qsHAZj+o82j7t2zmfa3u0n/VntFDRBhDNBtYZBXw0RIbfBr6c81oWBGr+k02sLTwJYzAkbPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMkTA89q; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMkTA89q"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so2536485e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790446134; x=1791050934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HoJYSm8uVeKQl6hyZ0pdb08729tIESncrp8CAI/z9f4=;
        b=DMkTA89qfasaCdYLk+GYqmLyCwOnLN0ppJV0IxcAmPiczWDZY42i15q/nT1pdFeXTN
         V6IzsEr1K98IKgR3gVKyk7g12e8bf6KPYra1iog9oL92HEqUUcwGkEs4U94Ux1N6cjBL
         Wc9Qr15qBfqvK3jbnYD5AM9qkRtBpDeTmRU+bFObPEShKeR09y1pvxW+bfAXGdMzlj1m
         ospGISwaLXOhb1qRvrIZra4ziJM+dmXZkEpvAy6Qx/ZG0QeFQK+7tEi6Y78FDEJXEqbc
         br4XHdJeLJP54bsXn3kYp5TVXwDtvCXg9oHQhK0m4gxdJp8JQ0TrGxNV3zXrzsB+xfiY
         NR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790446134; x=1791050934;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HoJYSm8uVeKQl6hyZ0pdb08729tIESncrp8CAI/z9f4=;
        b=ez5vvjj1oGzrahX2cEQOrqIxJ6jmEb0A2v93Zepy+QV7fU2QQMMHh9SIG1epUny0r8
         uqLneEnRQHXis33T34pIFScsDooYvvLExvBayDT61PTKtW19+C3+hZ1BzXSsTr5q2GZo
         +nY0bpKfjMSd1XAC5HpIv+sIfTYtsswK5Bft9Q1tKf65vmAz8eR9BaDmbOipftKJ/ejz
         Qrg52s2s5CZycefoAD6Kl+GD6r07qUkDQxeqAn41yapS7xyVeEn9SF+lDUmYN2asAm1n
         LbxXDLrwcdkZXed4mwtH+eZflSQ4u+UU+SSx3m7uO9x76Bvn3H2TJDBWK/6TYhlhfa/S
         azlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxf8TYqVmCCS40N3NGHQV24Mhv0MTTzrXD14rNb7QQI7shrlFtsY5lwnggQWcwQwhozOPo1HFV2yqmiKOQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mi7ILIo1vjeGbKf+7dcQpKq7YOZjoIBYBrz1fod6z5750X8vZP
	19y1fM+fZv1i6IZb+/b76awDGHglwH+HoqS356ASXhKDOF2W3b+45nc=
X-Gm-Gg: AYBFou2hGyEyobsbL+GhDU7hHBU2+DHr4WEawAB2yCyOdXOG5ZCYoX7101eGxJBO7+1
	8Y+CA5JYTNDgDklua+0pDd85wb7dPwpCpEAe09ers7S13VrpLMHsD1Za5u9jAjmhg7Ue1wE0riw
	itR12hHnmszstp5RepoDQKwgtLN13kHDmakBzL63dxc6AHl4dXanyLpjMBXXj1kIt/ygP2Tkr1i
	SenAQXO3yP5xx9oFfQ1xgOgCHX1J0HUYHMznzgmMkqbI6zFbW/C6CyyWSzFSLwAD+/b0Tt0/t0W
	5HlZuPpgmTS0oo7dnhxmzAJMU62QzS+TtiUTNSS48igvUnqaBhbjMPslQYg0jnVIvWsJsiOoCAL
	M4ktDp9mKRbb4ndIXpOJ18FG2fqVMM463BPaek0uyvo45kePKs2P2H/jZ4y4UuGIj6CV8iU3Uyv
	Jrl8QEpcwViVKZeJbZQHeQRuiXhQMavQOl7hDrKR91gwfyfuBlXlUGQqBkMlEEHpPGdDMCmpVs4
	95okfs5NWgHc4L6JplJt4/WnCsABY/G5TUg2WXT1RNUe20=
X-Received: by 2002:a05:600c:609a:b0:49c:dca2:ac47 with SMTP id 5b1f17b1804b1-49ff06b2db4mr105491785e9.2.1790446133934;
        Sat, 26 Sep 2026 11:08:53 -0700 (PDT)
Received: from localhost.localdomain ([31.223.3.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef5fc189sm111337785e9.3.2026.09.26.11.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 11:08:53 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: corbet@lwn.net,
	clemens@ladisch.de,
	tglx@kernel.org
Cc: skhan@linuxfoundation.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-doc@vger.kernel.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH v2 1/2] [PATCH v2 1/2] docs: timers: hpet: Modernize file references
Date: Sat, 26 Sep 2026 21:08:37 +0300
Message-ID: <20260926180838.8145-2-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260926180838.8145-1-habilerenturker@hotmail.com>
References: <87o72mg21g.fsf@moria.home.lwn.net>
 <20260926180838.8145-1-habilerenturker@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current HPET documentation contains outdated 'file:' prefixes for
source tree references, which breaks proper rendering and hyperlink
generation under the modern Sphinx-based documentation ecosystem.

Fix this by modernizing the paths using the standard literal backticks
formatting.

Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 Documentation/timers/hpet.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/timers/hpet.rst b/Documentation/timers/hpet.rst
index c9d05d3ca..fe02bfd5d 100644
--- a/Documentation/timers/hpet.rst
+++ b/Documentation/timers/hpet.rst
@@ -23,8 +23,8 @@ The driver supports detection of HPET driver allocation and initialization
 of the HPET before the driver module_init routine is called.  This enables
 platform code which uses timer 0 or 1 as the main timer to intercept HPET
 initialization.  An example of this initialization can be found in
-arch/x86/kernel/hpet.c.
+``arch/x86/kernel/hpet.c``.
 
 The driver provides a userspace API which resembles the API found in the
 RTC driver framework.  An example user space program is provided in
-file:samples/timers/hpet_example.c
+``samples/timers/hpet_example.c``
\ No newline at end of file
-- 
2.47.3

