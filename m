Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD063D9058
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789442443; cv=none; b=NNvgKx6aTvXtMDGS1HevsRtI6YQ4gQxsd+f83Vr5tGFt/7wtd67joIqseb6bLYcrFAuwd5Ujuwf/kDuZzW7LAN2FiveR5uOIC1+bu0NQVIf5ic64fLbipTn+rfr5lI9SDrlL+72hJ6Er38QPuQj/pZYfwuGLes6/p6D7yEm8dOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789442443; c=relaxed/simple;
	bh=yxXtP6UckxLv5x3EVT70BovJg6XWgH1u4N7iOnnLp0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jrdlzl5QmQtS09K0S2uStw1qfBc/VQVdPHrNfHjCrZT/448pim2YT0bNqLaKhrgobPPTsaelz3kpnJD1y2Yf2vXjeOAUACPAlZubf0TPK7RcMT+I2ndshiENukfoMO3Da4/5H99s66JmdLSpSqDaJG+uhCMxWBUbRbVDhb9LeXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMpLYxKA; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMpLYxKA"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8692a856865so3196420b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789442441; x=1790047241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xuEusvWCpqoTP9YielagDsw/aIOrA0JH7ZF59XWCaiw=;
        b=CMpLYxKAfxa5PRV+uIsgyPb0yDTnTEN/E6xnf9XmlC56v0XV93CsG36wUvGk6YTXrL
         YlDbmKKRBY9h3ivRbCvEOb2MSi+2iuvr3REEhs0P6VfKV7THiuB0Jfbvt/jOceZ6RcSo
         WXq041SazIcbkaJpZpxgsZy6NmUIP2r6cWjgFUdB91bBncGIIFtpHz6oTN7e9fCI8Wl8
         90Xle9KTIW7GQ4zxoDa/dIXJllD9BjxMUfNVLaF5YvWvFyubwOclk3jxx4SCAQ0ZjG3W
         RNS4v3acH4riXVHRX35jNfyiAmJR/YX7EgDdTLJqlfFWOgCWHNkud95L4NVgslq2IcIg
         /ztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789442441; x=1790047241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xuEusvWCpqoTP9YielagDsw/aIOrA0JH7ZF59XWCaiw=;
        b=D6D2d2jNXhZ6HGtygo4tGtUPiV8dqhxOIm7diXsjrOaO8mwL3gJBLbuen6ZhYYfMjn
         B7eqPwAk5fuLkS90Vbew3yAgwdLJnqpcyLN3k25T0iS17JYQD6xyF6v0p1hXYGn5kjkI
         cOr7unyqkTaep4SAoRvPBS027+9vVFBuHSotlZXxUNN68kNR8H3mPRtlvlOQKUhA27EF
         AqcC+Ru4Jwcx0Z4cctn+r+dWcB6v8wCovFuQxzCO4Nd91PGMGQBWNWXSZJ2IVW1K5qpB
         M0arYXZlo3Qdt3PGCxE0Yppv5PVv1lzlCJJXQq/f6MGbgat1BPYtDh2khttbNVUFZKin
         cjPA==
X-Forwarded-Encrypted: i=1; AKwUvBzdU894HLKu7JeIr8Xzyk58KLmnLmSlaoGTh2Cs8PqH4pS+sBLo5rtXxWQvgozidqn9X0dj3CQWC0V0nWs=@vger.kernel.org
X-Gm-Message-State: AFuF++kgk7pag5weFmwyR9VaK4ZrFAlvlNuaAtpyuEBqxfOm7HVljJIJ
	1zsmI9RBr+E4kKqm5BMs4bbij0xKTLXVIhyEein3yCtn/THCX2gdSU5l
X-Gm-Gg: AYBFou1ZbUfPd6NawbnIWWVPSH0COwzhFujSbj1L7zyp867AopcHfR7goet9W9lERya
	dcsHnGCGOyQ2Ong5A4xlp1ZQH6IiK4AZiCQz4i6sTbdmeJ8lj6pUg2Uleh76J4PK+fKb9bUBNNC
	bQZEPLKxwBsE5qZhDvrxeSCAbjTdwIOJklR49NeV0YhSga8cQIJapl3zQR/eoRvsQRCZjFVp2ms
	9Q0LF9SJQCY/3zcEETLSxcRDV9+ssoJC/Tv+/PwW+6r9lO/LlSVX09mZIqC2kRldIbIdMZrlKyE
	ww3p3nTGZwOWFD8BTfZTowPSitrArBcKMNA/9d7+J1VdCDsq+gai9rQDz6eRwvKwh6GQncmL1iu
	QNKCV+vlEwEQgaqASBX++SsnZnFf9ua2HoJGPaXl6e3Gpv9N/ebe0knpiYc59yJEyPZtK8YzQm/
	2HLUtvjZJnf3gtjy5ZYjrv18Q7TH7nJqNSHM1seGsOscqsj5GDSebq3et+f5cJgBAP
X-Received: by 2002:a05:6a00:950b:b0:86a:b3:fc50 with SMTP id d2e1a72fcca58-86f82e5bd35mr12406951b3a.3.1789442441185;
        Mon, 14 Sep 2026 20:20:41 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::c570])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b291c06e0sm5393699b3a.28.2026.09.14.20.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 20:20:40 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: xingyu.wu@starfivetech.com,
	ziv.xu@starfivetech.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH v2] watchdog: starfive-wdt: fix PM reference leak in probe error path
Date: Mon, 14 Sep 2026 21:20:32 -0600
Message-ID: <20260915032032.222665-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914165022.169877-1-skunkolee@gmail.com>
References: <20260914165022.169877-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_resume_and_get() increments the runtime PM usage counter
and, via starfive_wdt_runtime_resume(), enables the clocks. If a
later step in probe() fails (reset_init, clock rate check,
watchdog_start, or watchdog_register_device), control reaches
err_exit, which calls pm_runtime_disable() but never balances the
earlier get, leaking the PM usage count.

Track whether a PM reference is currently held (pm_ref_held) and
whether the clocks are currently enabled (clocks_on), and use them
in err_exit to release exactly what was acquired:

 - if a PM reference is held, put it via pm_runtime_put_sync();
   only fall back to a manual clock disable if the resulting
   suspend transition did not actually run (put failure), since
   the runtime_suspend callback already disables the clocks on a
   successful put and a redundant call would double-disable them
   and underflow the clock enable count.
 - if no PM reference is held but the clocks were enabled directly
   (runtime PM disabled case), disable them manually.

Also propagate this accounting to the existing pm_runtime_put_sync()
call at the end of a successful probe: its usage-count decrement
happens regardless of the call's return value, so pm_ref_held must
be cleared immediately after calling it to avoid a second,
unbalanced put_sync() call if a later step in that path fails and
falls through to err_exit.

Fixes: db728ea9c7be ("drivers: watchdog: Add StarFive Watchdog driver")
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
v2:
 - Fix double clock-disable / clock-enable-count underflow when a
   PM reference was already released via a successful
   pm_runtime_put_sync() in err_exit
 - Fix double pm_runtime_put_sync() / usage-count underflow when
   falling through from the tail put failure to err_unregister_wdt

 drivers/watchdog/starfive-wdt.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-wdt.c
index af55adc4a3c6..4ad587732bda 100644
--- a/drivers/watchdog/starfive-wdt.c
+++ b/drivers/watchdog/starfive-wdt.c
@@ -429,6 +429,8 @@ static int starfive_wdt_probe(struct platform_device *pdev)
 {
 	struct starfive_wdt *wdt;
 	int ret;
+	bool pm_ref_held = false;
+	bool clocks_on = false;
 
 	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
 	if (!wdt)
@@ -449,11 +451,14 @@ static int starfive_wdt_probe(struct platform_device *pdev)
 		ret = pm_runtime_resume_and_get(&pdev->dev);
 		if (ret < 0)
 			return ret;
+		pm_ref_held = true;
+		clocks_on = true;
 	} else {
 		/* runtime PM is disabled but clocks need to be enabled */
 		ret = starfive_wdt_enable_clock(wdt);
 		if (ret)
 			return ret;
+		clocks_on = true;
 	}
 
 	ret = starfive_wdt_reset_init(&pdev->dev);
@@ -499,6 +504,9 @@ static int starfive_wdt_probe(struct platform_device *pdev)
 	if (!early_enable) {
 		if (pm_runtime_enabled(&pdev->dev)) {
 			ret = pm_runtime_put_sync(&pdev->dev);
+			pm_ref_held = false;
+			if (ret == 0)
+				clocks_on = false;
 			if (ret)
 				goto err_unregister_wdt;
 		}
@@ -509,7 +517,12 @@ static int starfive_wdt_probe(struct platform_device *pdev)
 err_unregister_wdt:
 	watchdog_unregister_device(&wdt->wdd);
 err_exit:
-	starfive_wdt_disable_clock(wdt);
+	if (pm_ref_held) {
+		if (pm_runtime_put_sync(&pdev->dev))
+			starfive_wdt_disable_clock(wdt);
+	} else if (clocks_on) {
+		starfive_wdt_disable_clock(wdt);
+	}
 	pm_runtime_disable(&pdev->dev);
 
 	return ret;
-- 
2.55.0

