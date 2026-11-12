Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509732;
	b=uvjygvorSGP4eMBZ84ZmCUMFRnDkK4i7ghvQBSbApohplcDhsKBRExmSzLSNduc414xj
	 NaAZIinP+zzTb2Em1n3Z281kvSE/QtC3o0Z8XpF+ONVyTIEW2FzJhbiZUAuRUVZmtUGFn
	 TB1pw5YyWCWNQl7UdPeYc4hJHcrJVnrW0O+Hx+Jm0tHLnhp7+uyxH7czg54YNcUrFitoL
	 WIjy7syKbyUATf0qJwFcU82h+GmELmthhw5PBIE1svec6Q0G6qFtszAxpDGuF77Xo70yn
	 vbGjWEhiAECQZa42uQ1BnD9EP+N7X5ai+nSuP/vTUnLvJKWLEiiCDAhn77kb/krR52Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=M8xbWLTM1tDLF8IdDJE0ybXERn0+Q9azTV5NEZXnfIQ=;
	b=ltQvyn2Wl8ivbduYEeNZL4rXmI2WV/V8v9wGMYsKX7RB0EtysGbm9lyij0Gh8BjFE3g1
	 CkdokRd/9H/1qMacVLa/K0R1TqAwqPJh3ysl6P3SaTWTgOCFb7JWOPxjoC+q0pZbF/deY
	 x1HQ+K85Ii0g7FueJEkBCgRry0b2GgOTkloiUjXlmmLM1/7KKajobcTQwbS0VLQEL/9+T
	 ZPCph9m98kezBNcTATTcjmMkrDy6QjFLVrv0VQgScF2Yp3quvmbFsWbI3ZPLzp8AoVI24
	 u9D7HJpmkB8BW9lCi6N93P8CnT8pKCYWv8NeWl7qNWGCxLOXhVP3QGE5a1pkNLOUwCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f5cFWKOG;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B8460A3835
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B8460A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f5cFWKOG
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso1062785e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509730; x=1795114530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8xbWLTM1tDLF8IdDJE0ybXERn0+Q9azTV5NEZXnfIQ=;
        b=f5cFWKOGepWa3WvmrdD3CHuMVtKIexzCjyq0VqHVOdSbgYxpEW0m3UUKSga3v8TXnn
         S9DSev9UxCgrZOwLN7bxu7MIZHTLBoSH5bOZo4wb1SrYCbHqs89f+LeQXrtFUgVRNLux
         C+cA2pYU1c/T13yM/vDCL24DqAU6H6UZzpOm5+dCP0uaBQvenuoxIIZkP1Af0ImL3q6e
         8BlrEMlFocZH+qxeQ7u3rQjqr8vLBTDdxKd8oCMhEHf5SzG8puq+ynegrBHlkV1AK1Aq
         PndDsVt2sEaAm/bfTpzzyeJkKgMuA5Ndq2uV0tkektUAPmH4mtJxlda4fc7IjOa7Nyal
         2SDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509730; x=1795114530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8xbWLTM1tDLF8IdDJE0ybXERn0+Q9azTV5NEZXnfIQ=;
        b=Gwh1ZCT0DO5sLLqnYi9ueKjwfJEBQDZYj2/cPu20mHBdmtkpWyEnNh4N5549CwdQZa
         /1mgKbRer4OmSG66Czand/EvHZUM2ZVZdvIrTo9yeRVsI0NFBGlqigjhs6rXDXXgIsEC
         SabXD+FHRXsdsrb2BdbD+NcTqrGdh6+4RRMX4DgUvQlIMR2ZXe9Sthr1fipEkLhIabxM
         IsDp7EFyLujSzoWYgMzNTnZVgTAxTVSvPFpVrkmDoSXmK1UkSDUakSTPsHWwOYyzbKSO
         PRmOEgLHich2J7Dlwc9jz6+rxUgzaQktKSR+LFDDOSGwwgm+2/TWtH4KCdW3f8BlT4+r
         3wgQ==
X-Forwarded-Encrypted: i=1; AL+hErGrZqhmWU5FyOxtEAZGTs3EUW6JQPJ67WfzvAJeRZeDVY2X/hOlob6uoxdtZMqeU0utin0aNRyeZMxuYDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/20e7NSFcAxaa2bM1zZCKX1WmxV6e0oeAOTb5tkiLBQ1bqMBkk
	bUgwlSy1qOtKiVC0RWrFg+mq4bRk8EAk/lHOw8M/a92Rc8p4pAp+e7dx
X-Gm-Gg: AYBFou2z5ie4C0q/N9bmTUm6pZCxXWHN3FSYuHLk3NAoHbPKPZsk9QW6NowZGIQ99Dr
	SvweT4+h7HxsSFizEUufsFrhbco4Ak0ab8wfrpmjJuMjADltpoXn4fNwObVfLxMpjte696sGXE5
	FQSM5UYRnjzwAVHzvR7nJ52FbecoUmGMSptPLS5sGmJzs+tyGT6oO1Ev4dX8+gRpXVy93zdGvJJ
	waWJtCDPV5G9iK9bc6DrtymrhB630hR9LyaNHd1M8uvDrq6yohPuwh19Y0xmOKAu9d2tE4h3if+
	LsEkLGw4jlCEwoG4yTxOeY3byTm6uwN1Il/sEbalccT2Ubwyz4u0sL2/YLe9sAqHOv2DV+IEtys
	boUuL4aJ6iK/y4NWdBYo+Bebmb69kSJwVIArNyYJBQi/hDJ/Q4eG/M8ns8Hrb4yxaNFPX+ZWw1V
	ccwdp8ypCR9CiaJnVaxTXnt2Dk3Xl4tl/HwDPE8Ujy9y71+hO71J2L+Zx7ULjtcepuLHZ0yregS
	bFuySxXyyK73yXVFLJSf1c4Lcg+suPRj7r3bkL3rIfUR3hjVmGUvi3Diw4wcu/WIkZSml1/hhj2
	u8NleC1/b4q8bUxWSLzVs87WDEPK7oqxcIJcNw/VvsQBjZJjobSti55TrNq/eT4UExMKqe3p26O
	IHCoY/rDX
X-Received: by 2002:a05:600c:6092:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb55a44be7mr2737975e9.8.1794509730281;
        Thu, 12 Nov 2026 10:55:30 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28d0b2sm71734755e9.7.2026.11.12.10.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:55:29 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 12 Nov 2026 22:55:11 +0400
Subject: [PATCH v6 4/4] watchdog: vt8500: Add a restart handler
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-vt8500-timer-updates-v6-4-fd1cea645d1f@gmail.com>
References: <20261112-vt8500-timer-updates-v6-0-fd1cea645d1f@gmail.com>
In-Reply-To: <20261112-vt8500-timer-updates-v6-0-fd1cea645d1f@gmail.com>
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2437; i=alchark@gmail.com;
 h=from:subject:message-id; bh=mhiGhVHaKTYXayUI3xItTRTmu/lVOn1Xybq1LOkaLfI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9457KJNYU8KBxuukRh1TepIj3vSFT2Y3K/HRezn62L
 ZPLXcmwYyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKne9Jbhf7bE/eTPHLPCjjzMiZf8bpdj4/j46HTVI4v+dUrFXHPf9ZiRYc2lfdM
 Klr9VNJebZHyI5YRmybOTQT9V3px7HCA7U0SllxMA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Reset the SoC through the watchdog when the machine's own restart hook
leaves it running: the PMSR write in vt8500_restart() has no effect on
WM8950, so a reboot there ends in "Reboot failed -- System halted"
unless a watchdog armed from userspace happens to fire.

Arm the match a millisecond ahead of the current count, which leaves
ample margin for the register writes to land.

Register at priority 128, the default for restart handlers and also the
priority of the ARM machine restart hook. That hook is registered first,
from setup_arch(), and handlers of equal priority run in registration
order, so this one runs right after it and only matters where the hook
fails to reset the SoC.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/watchdog/vt8500-wdt.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-wdt.c
index e0f838fd1d50..0ce1e2b06410 100644
--- a/drivers/watchdog/vt8500-wdt.c
+++ b/drivers/watchdog/vt8500-wdt.c
@@ -25,6 +25,9 @@
 
 #define VT8500_WDT_DEFAULT_TIMEOUT	30	/* seconds */
 
+/* How far ahead of the current count to arm the match for a restart */
+#define VT8500_WDT_RESTART_TICKS	(VT8500_TIMER_HZ / 1000)	/* 1 ms */
+
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
@@ -75,9 +78,18 @@ static int vt8500_watchdog_stop(struct watchdog_device *wdd)
 	return 0;
 }
 
+static int vt8500_watchdog_restart(struct watchdog_device *wdd,
+				   unsigned long action, void *data)
+{
+	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
+
+	return vt8500_watchdog_arm(info, VT8500_WDT_RESTART_TICKS);
+}
+
 static const struct watchdog_ops vt8500_watchdog_ops = {
 	.start			= vt8500_watchdog_start,
 	.stop			= vt8500_watchdog_stop,
+	.restart		= vt8500_watchdog_restart,
 };
 
 static const struct watchdog_info vt8500_watchdog_info = {
@@ -107,6 +119,7 @@ static int vt8500_wdt_probe(struct auxiliary_device *auxdev,
 	info = container_of(auxdev, struct vt8500_wdt_info, auxdev);
 	watchdog_set_drvdata(wdd, info);
 	watchdog_set_nowayout(wdd, nowayout);
+	watchdog_set_restart_priority(wdd, 128);
 
 	/* Let the core feed a watchdog left running, e.g. across kexec */
 	if (readl(info->regbase + VT8500_WDT_EN_REG) & VT8500_WDT_EN)

-- 
2.56.0

