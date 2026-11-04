Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771937;
	b=5NZB7dTOOgOIa+ao0Qgez6R91ihnjtLFfUn11bW2veFfdm7uaWZ4uAcEcJlfsyJJCs3d
	 TU1nGh0qv9lPESMqEyVJF/yeapz5x7VINxbUUsOVvnNz4BA5QaD9lw9g71v4TLiqfh/iH
	 Pto3bqCi8dCpRTEQsRR/7oc3w7oMsyixrSns2zDVwavy42MCeV7qC+GCayP55VU4mWMj6
	 UyLlRWRm8jGKSt4mD8A7PHbnOsRUdgBDIm9U2omvecWixKZPaFs49TVUGppS/h+IGAV6H
	 T2xU9BIePDcGa4uE7jt33Pq3h6j3i2ofoklkv7MFxtptgueVYQdp0h4fI1ehl0B0IEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KBXunWp616box3X7V9vV93MSQlhAq0/quw4oecuKOn4=;
	b=Ovs3Hxxtkfo4mEInZ/AHYUvSrB2NZ/iQj8wQK0VQrJRrxEiYTeIgBVXO8Ub65RH1nqe/
	 CjGfbXs6kcqudGM2CM23Lb45tSDtlye7i6XWoi4zk4+D4V2v4g3y7UktRkKTVnFZJF5HQ
	 DIa80TChxHZoHQN6P2ZiQPZLWPRGtojPJIJBxZZn+u80oQU6kfluZ9XevIuRLtBzm2Lqc
	 OJ1g7dXmKx6qUN/jpyPiqierm17eQBIoeJFWSduP1eG+Vt/7Gp6HoxiD7RqhxEtOXTDok
	 hrBB2XEhlGaDETRxzNjJOk17i3xSw073cocGUcHkoqn8eZroEk9G4ICjTgoQb4/MWZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxLqEAZc;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3894F606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3894F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxLqEAZc
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso214067a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771936; x=1794376736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBXunWp616box3X7V9vV93MSQlhAq0/quw4oecuKOn4=;
        b=qxLqEAZcJHUp/cY1NqTaJSKMpFvTnLBytBsofAopex9x+pMxlnZkcmmCCu5OrwRL1K
         CrAeHJhPbzRBfxVCYj7cdpfX2HWhDmadl2rp4oOxAtdBw+cGZyQuCi9Fs01WTSxGVJ7V
         8Nv/X7kIfY3JwNb/zsRuXaFlShZBoW7Jvjb8j9ngaktX9tQkPkNeE2cDHe7sr+grQk7w
         sOdXzKBkctZ8d6mUE3Lv9wjYkbBSndCH1pJ038t3kQx7AJUgCnA9LpQte8RjRzXTTZ/3
         CnHlg4EhxozVd8/RR0b3sZ3b1md4BBLJTqYxxNToKpSTFVu4HZ4C0TmRLSpz2ib7Y1X0
         QtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771936; x=1794376736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBXunWp616box3X7V9vV93MSQlhAq0/quw4oecuKOn4=;
        b=pH4LMmi5eTgIR1Ta+EBMwikJB5mae1Xb8IczpN2I1kWKphuA8/7t9FNV/x3MoaJylR
         MnxHz+GKWsY9lTeVazh44SNrGjFEwDXx6oX5aDsfg4mce6t9GOMH3B/48Fvn4s2m8SXv
         MkzhUNzf8blRqkOERvqubMMYGq4F5AojfGKDJystFr83nD9nXUsm/OT6aZU/25ANOemv
         mpbo80PdhFqXCNbEEjiMXD6J4FLo+hddf8cGTb5xrEbK8ki2lkWXuq+rmI4BffDL1Bg9
         dD0CfxklIcHZuueehP/8t5SC+EQov9+uJUhOb987+LIvcXjuahyVnr+VtFbyCD2BuLw8
         kwDw==
X-Forwarded-Encrypted: i=1; AKwUvBxjXSe3av2y0+EJEpBKmryiloCyhA9nIIa5VKgFHoa9JHYlNrLgastHhK4N7GTJcE2kCCXEFwjs3WUk0xI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7QdINhY4BTZB/viMTNx02EbuKyEUzzCB2fYr+tofwDxoJn3/5
	OqqaQvMtkQ6GkgaFgCL5GWgkyVrTHpGLU/kUVo3NSHShScuu4l3A8Ueu
X-Gm-Gg: AYBFou08gCJ+CLAGQjAmO7Cv9/KyH5fdMvkvNoKv3TcCVoD9QQ8kyQib2a0V5V3ekhY
	7sNBA/eHC0GqcZmzxYXI7F1pYgnWcAOako49N4Wv5uhB43/O69VNG+oEtntk75x57sspB/vB+Cj
	BHAqMEY7bi1YQmwmXC4KJH7iOpjXefJj90Hvjk3XWRQZ2hLMommyrbPHa2/N9AzuKc2ygbwJ7Jf
	/WryhWr+RJRwWzOKR/ggCn4HUHFdRiPyyQjrsaQABRsxxL9+IUh36TwXpjwGZrJWI9xFHwiNflH
	Anqs3lsNvDuVfBafB1v0GXDwESBFN50BAbj7/EkLkMJt39Tnst3o0kmlWsqHZSSh3cvkKKF2mmO
	nqGpkqvnME+mxoOd82hvf/Ql+m1l78EoGWEUaviiIZEat+PZlF2NFD7gbfhUUPLDxpRuwAEdxYQ
	T0vANYjSq/66qrgjSK+skE/8BFUYyqgBf/eHRnK2NgODrgSYk7GqtQ3IZhoUXyQJphuRUyC09GR
	T2pHy9Xio1W8rWe3GVo7aYvM9yEPnuEzARfdO0BQPd8sc+zMohxzO2ouZkhPyWjQQH1kJwQ/98f
	UKso8b3JU2Zvd/79RgA1ypgPJl6eqiimCuAtCiT78T/AnZhDEoq22o6cdghoHWph+NkPEkqMbVo
	HAYaNBDvCl3kIjbF8kEe92Gnen6SUN3Tozd6ZouQAaQGcMDWHM3m7Rkkcdr7NZkg44KLQD4LfPl
	JOpw==
X-Received: by 2002:a17:90b:4cc8:b0:3a0:c276:1ec0 with SMTP id 98e67ed59e1d1-3ae897f673emr11389663a91.28.1793771936338;
        Tue, 03 Nov 2026 21:58:56 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7840110a91.15.2026.11.03.21.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:58:55 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH 1/8] MIPS: ath79: apply the QCA956x timer workaround in setup
Date: Tue,  3 Nov 2026 21:58:45 -0800
Message-ID: <20261104055852.152340-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104055852.152340-1-rosenp@gmail.com>
References: <20261104055852.152340-1-rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qca956x_clocks_init() enables the MIPS timer interrupt in the misc
interrupt controller, which QCA956x needs before the clocks are set
up, or there are no jiffies. That has nothing to do with the clocks,
and it ties the clock code to ath79_reset_base.

Do it in plat_time_init() right before of_clk_init() instead, which
runs the clock setup. The order is the same. TP9343 boards use the
QCA956x PLL and took this path too, so check for both.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/clock.c | 10 ----------
 arch/mips/ath79/setup.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 050f6553f398..8c5eaa4ab6e0 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -523,16 +523,6 @@ static void __init qca956x_clocks_init(void __iomem *pll_base)
 	u32 cpu_pll, ddr_pll;
 	u32 bootstrap;
 
-	/*
-	 * QCA956x timer init workaround has to be applied right before setting
-	 * up the clock. Else, there will be no jiffies
-	 */
-	u32 misc;
-
-	misc = ath79_reset_rr(AR71XX_RESET_REG_MISC_INT_ENABLE);
-	misc |= MISC_INT_MIPS_SI_TIMERINT_MASK;
-	ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
-
 	bootstrap = ath79_reset_rr(QCA956X_RESET_REG_BOOTSTRAP);
 	if (bootstrap &	QCA956X_BOOTSTRAP_REF_CLK_40)
 		ref_rate = 40 * 1000 * 1000;
diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index 4e18cdcf65a0..d9e1cc77ad04 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -241,6 +241,19 @@ void __init plat_time_init(void)
 	struct clk *clk;
 	unsigned long cpu_clk_rate;
 
+	/*
+	 * QCA956x needs the MIPS timer interrupt enabled in the misc
+	 * interrupt controller before the clocks are set up, or there are
+	 * no jiffies.
+	 */
+	if (soc_is_qca956x() || soc_is_tp9343()) {
+		u32 misc;
+
+		misc = ath79_reset_rr(AR71XX_RESET_REG_MISC_INT_ENABLE);
+		misc |= MISC_INT_MIPS_SI_TIMERINT_MASK;
+		ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
+	}
+
 	of_clk_init(NULL);
 
 	np = of_get_cpu_node(0, NULL);
-- 
2.56.0

