Received: from mail-pz2-f27.google.com (mail-pz2-f27.google.com [74.125.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC524A64CF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550897; cv=none; b=C23W1jR0drBXbc+Twq4vRaUI+bqqX3BJRAaM7KW8UYe5wRtyVXm09pxTbHiNt0prXV4nlcT9g8j6KKh4b5VMQo+U6gaVJJL908vS7gRkEq4Vk34qPTAFa1TJfCZP4LbdB8pJQStDT6LkQCs4JyLR9bAoNl9/4WrfdnxN/PPEckk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550897; c=relaxed/simple;
	bh=i8cb/65RfjdVKB1gNPZ0c4xcdU/dhNOfqYFalOWb0oA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C37gNFRfxd0/LkHxKJpT+UBdIiSj3lxhepwuKArdDIQLZw2bspg4Et4Q7fAw6zjoNEkRZPwELBojQDeNXPHmvTXfKhu5zVsqL55AQqq5JK8/E9GWXVFMi1hNReo/YlJLaTPgub61Rmhi+RSCTVR5l2w7uRLfmL9XjYIv4Y7GnQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQwWIRlZ; arc=none smtp.client-ip=74.125.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQwWIRlZ"
Received: by mail-pz2-f27.google.com with SMTP id 41be03b00d2f7-cc1cea50dc3so559161a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789550881; x=1790155681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xo7H/CC3TMNfFUOdZ9uePQypBhksHgJvu4rQrR1pwFA=;
        b=GQwWIRlZQYY3D8ju648c/49oU5qg+cp/0eCkGBvX/xO52Jkml8UCHuIh6p2auCJCY+
         r64/+GERFfW39KXobTnaxXb4PJuIrA6KvkkqQq2sQDMX/uGRmFMZza/eGRwKBpPZ/bKS
         TudLWL78xUrL+tbxfXFp1myjZt7t4UU08c8Msk8kfkIo30ubMWYHXPRCJc8imXNFBY76
         f9YUPR7cPvti0hm+GleB7vbTmhm91c2gOKqzUlXZMUen8j22hS3OhOHD6CpOSzsfrQmL
         UDxj7g45LgooajZVuFYJqxaNGxWo2Cr30yklMfDPvBKqH4w37vKUyQx26pnuurUBe3T6
         ceFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550881; x=1790155681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xo7H/CC3TMNfFUOdZ9uePQypBhksHgJvu4rQrR1pwFA=;
        b=U67gri9lrfuaGuQjMLtRpORnOoiR1OehspcPzzPoSv5dAvO22+xs4aXirGI/IPGEsf
         7GG8aG5FzwBuJ9G3wbcYBTCyUqn0OsZj2xrfIlPypxRuKp2rDLaIeMYwmwSrin0SW3U5
         aCcBbuHHJ+xqTBZJJIP6QrM+iATzb7AQdnOeL7TZ265uqfSHhhbijtDJ58zowTy0IPe0
         9ip35hBocuxwdnO+IRWZwJynFmWN8KlriS0LN+Duw5qZH53RegHuOE8Fb9k77aSGoXGZ
         f5jGJA1huLV+QrWhOV7Q12qXeMNbQEmWjCnB0FW53XkyXe8H0YGITQ6xLXXOsthSUzjN
         Fxrg==
X-Forwarded-Encrypted: i=1; AKwUvBy4sTrUaK0hb+lVLYATRE0u3MN/NauL94mX890IdScNQiI1wWfhZ8MfT11cCs8c/FQMJexAocumNoQNeyE=@vger.kernel.org
X-Gm-Message-State: AFuF++lYfTzbW/RGfuzMSh/Ux4Ds2Qefzn7l22TIhrTqBQk//CYxzvT7
	r8RIvKPttF0Ghy5FMCt2u3WTKW8n2KV07KYY1XdBSHyGFAzz7UXWu6c=
X-Gm-Gg: AYBFou0XeDh4vIEqJEJu7gYl+5AmYDyE2EiTW06c7tSlNcm5EG5c/FH0I33Rxo68n6E
	AtpSayGJi62uiD5rAGVY1Tjd3XZj6XbN0cvWZepQyYmG/7ycQkDMjxHtuC/pfKv8Kk3OU7kfFB4
	JnJ55lb6b4fG4xSkjcQVGPuPP9jHqCGELRzPB4Boba8xdWvI2MDSjZ9YnEepvhR8ITPXvD7yvxc
	p0WY0DRNodc12VRkUlJYVVjH2u+l85FuOEKESZsAAHMbVO+NPEIKX/w/7HWXqfhtRYs6JDfP5Dp
	HCdz71eaZk7qlf0JCvMBJYDGBhZUVpG97z+cBEmky6XowUmgzBlGAET0wFigDUI/KE06Cx74GhA
	V+6V/z6YJvyfPr1XiWSTNPmTSjiAZwG6woEdjVbw1VMi6lVnFI96FjkUwd+SB6itNaK8ze84ZB1
	0c052chfaB1e7nKubw5ylxH7297Z2GmtbXhmumtF0jm4NpLVEc499IR5fEfstT8IcnA1uXSt9GM
	2vUXeg6tUcb
X-Received: by 2002:a17:90b:2252:b0:39d:ec42:df69 with SMTP id 98e67ed59e1d1-39e1e4d3ff4mr4427894a91.20.1789550881491;
        Wed, 16 Sep 2026 02:28:01 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bb22ee5sm3784158a91.5.2026.09.16.02.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:28:01 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: andrew@codeconstruct.com.au,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] watchdog: npcm: Propagate errors from clock enable
Date: Wed, 16 Sep 2026 16:27:53 +0700
Message-ID: <20260916092753.187583-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check and propagate errors returned by clk_prepare_enable() when
starting or restarting the watchdog. Also propagate errors from
npcm_wdt_start() through npcm_wdt_set_timeout() and probe.

This prevents the driver from silently continuing when the watchdog
clock cannot be enabled.

Fixes: 975b7f0fe669 ("watchdog: Add Nuvoton NPCM watchdog driver")
Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/watchdog/npcm_wdt.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index 51348969bf49..0976a580b9f2 100644
--- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -149,8 +149,11 @@ static int npcm_wdt_start(struct watchdog_device *wdd)
 {
 	struct npcm_wdt *wdt = to_npcm_wdt(wdd);
 	u32 val;
+	int err;
 
-	clk_prepare_enable(wdt->clk);
+	err = clk_prepare_enable(wdt->clk);
+	if (err)
+		return err;
 
 	if (wdd->timeout < 2)
 		val = 0x800;
@@ -216,7 +219,7 @@ static int npcm_wdt_set_timeout(struct watchdog_device *wdd,
 		wdd->timeout = 2750;
 
 	if (watchdog_active(wdd))
-		npcm_wdt_start(wdd);
+		return npcm_wdt_start(wdd);
 
 	return 0;
 }
@@ -234,9 +237,12 @@ static int npcm_wdt_restart(struct watchdog_device *wdd,
 			    unsigned long action, void *data)
 {
 	struct npcm_wdt *wdt = to_npcm_wdt(wdd);
+	int err;
 
 	/* For reset, we start the WDT clock and leave it running. */
-	clk_prepare_enable(wdt->clk);
+	err = clk_prepare_enable(wdt->clk);
+	if (err)
+		return err;
 
 	writel(NPCM_WTR | NPCM_WTRE | NPCM_WTE, wdt->reg);
 	udelay(1000);
@@ -428,13 +434,18 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 	watchdog_init_timeout(&wdt->wdd, 0, dev);
 
 	/* Ensure timeout is able to be represented by the hardware */
-	npcm_wdt_set_timeout(&wdt->wdd, wdt->wdd.timeout);
+	ret = npcm_wdt_set_timeout(&wdt->wdd, wdt->wdd.timeout);
+	if (ret)
+		return ret;
 
 	npcm_get_reset_status(wdt, dev, data, start);
 
 	if (npcm_is_running(&wdt->wdd)) {
 		/* Restart with the default or device-tree specified timeout */
-		npcm_wdt_start(&wdt->wdd);
+		ret = npcm_wdt_start(&wdt->wdd);
+		if (ret)
+			return ret;
+
 		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
 	}
 
-- 
2.53.0

