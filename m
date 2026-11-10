Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301403;
	b=QkGje+RySVYG0zXOfzVOdGVbAdr5xGXxNS5zoKrAjH9pw/6OnQBMud1dS2FPgWlRWBXD
	 aeJgQvSQpbWmry3JHdQPCckyJlGZbZzUQnj/00leTT2sEFvpQ7mNePUYxOfzc8KZ6ecYM
	 8nXZMaQPWH1KBDFL759QUXc34Zk8NaJ9o6WNpG9gtOtEE6NTBhsefVZNep5DvjpuO7uzE
	 10ANH4EIIfaZhge4zg1SysafhZQpHlaCGzv5vzvVMza7ZKAPIU+3u7tR/Vw4yT8vipgf1
	 uDzh+7rqsvLQG/UCpOwfaqS0aRsigaqOs9xLuu6X0erL+C/FUATiOgnQZy0hXwU60dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8pKo1oEO3VP8nUxaxFU+sFTw1naND9wtU7Tr0haxUyM=;
	b=sP817ChxJMqX/FDu+t7hcx5kCCecOlB7hdfN/hPshLjR+Xp+RXO7HJmQG7/tzU2mVZjv
	 HBfb83m7SklWqJS0zJGX9sTnUFhetwIwqIm9km6SEvaD0soSIhDydf3hu8M7wS4TmeqAQ
	 TFWM/GyFFqg5jtoFNtnKJSmtzuhxBKmW37lt9rChXlKMk97wjdZviF/yhkrxg9AvKoDzv
	 IE3pCvjEBisytbSzjApVVwIA5/xyZ5uKfd0nTJh8OFUqedM8mKOtKPAkFW8OH3y7NQJ2w
	 WJ8inbziLpubk3Dq/DfS/Z1Jycg9z8jrCU5pgd0K928V8uUNIMUTquJC4+OXhCeBCkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aQa8NbCI;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4CB606A336
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A4CB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aQa8NbCI
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b244fb7fffso2223292c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794301401; x=1794906201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8pKo1oEO3VP8nUxaxFU+sFTw1naND9wtU7Tr0haxUyM=;
        b=aQa8NbCIL5iROR1xv9a893vuA9VKs+H4UP3noZWQVQc6eHiZUFmGQ19+107lwy8Hp2
         e9ypF7OCdmIIc25iDGMH7Xw1pnCfj/8fyNFIEb2WGQLkgvCdjP8MBZwconVQJlUXYoi1
         yDAtJErHd09SKjykRmQNmGs9Vu1Rmqu1U2+ba+1noReQUUo0c/9G9afr8Te1Yuw+iFne
         vfgEoWL045JiXncdLEqUhBzR/5xH0eTNb/e/w+EXdu/LQK1Lxo6Bxv4avKBJJd4vdbVw
         XGT0uQrgoTRt7PHMwafIP/Ur8zqyYCDaQo37i50bQO1NU1wGdFiO42y/dJp/nqvvSiit
         9ZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794301402; x=1794906202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8pKo1oEO3VP8nUxaxFU+sFTw1naND9wtU7Tr0haxUyM=;
        b=z1ZKKnN9KmGb6xWv8+y3WKygWsTg32fIsLY/lRQ7/26tCX0IKNOO/0Q3ybPJq9KzEa
         QcI8OUakuCxyxBXYzW41QfSmwoibYzyr77tgfoK/FW+YgyGa0Gfi0JJrZe1RhTSHyX4O
         YsnitpA7gLX9wjRjbLQRx6jpTrfxpOrJdUP2kSh1K2oemeoSAO4X1ZqQCOyzT7tca+1X
         TsVozCt6andkzTb8eG08rLjNDOM4H+ttCW/4+dsl3OpHl47V9KdwWWzQLX2nlWIAQlkN
         RVcAD/caATk8Up6w2LHZkuPHejXQsNigyqeTvex8xgiS+cx5DAnxAkFTLe4mRBU4cwkA
         KXVg==
X-Forwarded-Encrypted: i=1; AL+hErErwUvHNRF8z1r4yT9qm1uEy1GqbqCkOWsYSdU4XMnFyMBZp0MJCkf2UFUrZ8BaCu57o9RpvitT430AtHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TBvlJko5gpGFbiPWLSZ59zXH2AH6MiTpZES7Sf8LNStAR10j9
	fzlXpy3/lJ2oT+39IOxtnwuWrdCrhqipCpT7mwL82hZOmqpAcWI0VAZbiieFudEX
X-Gm-Gg: AYBFou0fbpR0G/J+RtskfEwY8LNMOjE0lpDmXI7SEvoQFX3By3wPd0ENMht2cG2++On
	fDwVGtCy+pCroRNDWyR3vOv9hVEIsjTiKq61Eo3viKuNKG4SoRNQzPZMOMAll/HP8mytzA4kyg7
	t/gOVhjQ33RanxvUnDcHtEUVA59hsQ6zu/G1081dc1GrQLomUck2h+quwpkP4t6ouR4yTsOk100
	x2GnyFf02oNaYE+4BI8+GgWYp3zUrrCg4tHHtDCrFsH1vr66cF2IQcZk+U6K1cToXjyj2F6wopf
	FRBtfKeL7XW096MD+a7yr6+RU/uw3WFvavwPcJVxJn9pFBE8tOhwn53ATIwtUaIXUzVlNEKM/YE
	hT8lpsiEgEK/E0nHX7Gj/38KyZ9SnrlM34b5czIaRyPgf+nXPT5QDbH0QroyAqxSnhGc5WGwOC0
	2RcT9ms2Vo/zWAfugIC9kIU19oMPJaqVBoWHOMHG6qLpbSAE2hqZKHzU5CZHgZnkfAUJnXvgoxu
	XdxuC1oPHCtuEK9Gji/muyrGbci0Lh6m6qA/AWS/dQ9h/E50QCEDr1UI61vGozunvrtSSiLWb/P
	HT0SHA1BQuWnEvm4blOLJFAfdewAlTwcDnbRKWY0vv69sXV7rAMyCefzY+rSmSylvie48g==
X-Received: by 2002:a05:701b:2704:b0:16c:3408:760b with SMTP id a92af1059eb24-1b3b60097bemr2296116c88.32.1794301401116;
        Tue, 10 Nov 2026 01:03:21 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm5762557eec.7.2026.11.10.01.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:03:20 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Niklas Cassel <cassel@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v3] ata: libahci: delete the SW activity blink timer on port stop
Date: Tue, 10 Nov 2026 18:03:03 +0900
Message-ID: <20261110090303.2415681-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The software activity LED support arms a per-EM-port timer (emp->timer,
ahci_sw_activity_blink) from ahci_sw_activity() on I/O, and the timer
callback re-arms itself while the LED is blinking. The timer lives in
struct ahci_em_priv inside the port's ahci_port_priv, which is allocated
with devm_kzalloc() and freed when the port is torn down.

ahci_port_stop() never deletes this timer - nothing in libahci does - so
when the SW activity LED is in use and the AHCI port is stopped (driver
unbind / module unload) while the blink timer is still pending,
ahci_sw_activity_blink() runs after ahci_port_priv has been freed and
dereferences the freed ahci_em_priv (use-after-free).

Shut the timers down in ahci_port_stop() before the port private data is
released, only when ATA_FLAG_SW_ACTIVITY is set and skipping em_priv slots
that ahci_init_sw_activity() never set up. Because the callback re-arms
itself, use timer_shutdown_sync() so a concurrent re-arm cannot resurrect
it.

Not tested on real hardware (needs an AHCI controller with SGPIO
enclosure management and the software activity LED enabled).

Fixes: 365cfa1ed5a3 ("ahci: Move generic code into libahci")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
Changes in v3:
- Shorten the code comment (Niklas Cassel).

Changes in v2:
- Gate the shutdown loop on ATA_FLAG_SW_ACTIVITY and skip em_priv slots
  whose timer was never set up (emp->timer.function unset), so
  timer_shutdown_sync() is not called on an uninitialised timer
  (Sashiko AI review).

v2: https://lore.kernel.org/linux-ide/20261109060709.1231946-1-hj351016@gmail.com/

 drivers/ata/libahci.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
index 001a6f5..873645c 100644
--- a/drivers/ata/libahci.c
+++ b/drivers/ata/libahci.c
@@ -2605,9 +2605,24 @@ static void ahci_port_stop(struct ata_port *ap)
 {
 	const char *emsg = NULL;
 	struct ahci_host_priv *hpriv = ap->host->private_data;
+	struct ahci_port_priv *pp = ap->private_data;
 	void __iomem *host_mmio = hpriv->mmio;
+	struct ata_link *link;
+	struct ahci_em_priv *emp;
 	int rc;

+	/*
+	 * Stop the SW activity blink timers before devres frees pp, skipping
+	 * the slots that ahci_init_sw_activity() never set up.
+	 */
+	if (ap->flags & ATA_FLAG_SW_ACTIVITY) {
+		ata_for_each_link(link, ap, EDGE) {
+			emp = &pp->em_priv[link->pmp];
+			if (emp->timer.function)
+				timer_shutdown_sync(&emp->timer);
+		}
+	}
+
 	/* de-initialize port */
 	rc = ahci_deinit_port(ap, &emsg);
 	if (rc)
--
2.43.0
