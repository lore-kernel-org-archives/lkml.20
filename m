Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773982;
	b=eGdCmZi0MKvHZo1LpI9drMu048KHyhX0KAGMXAyElgNOHiy+T61W/lE2tD8yCnOiZrxI
	 5gfs8qdbf9xEDbq7hCBdTVg4pu5p+Y0DoK/Og5Su6GXMv2IzZ+63ngCd0eqx1yrAQBFR1
	 YXariu6SBLxbicLbnjU8JixcrwwG0C7TG6S2aTH4TkoTGZFUvtXk6YSuUwrCYZJhzpVYf
	 xXz8rBfj22Kwt6VhCTfzqJBf2+TQkDtB/25aU/0CvcBB6Os4MF3U0vTS3i+m3voVwFiAr
	 3U4dj9xBqi1mpsi63SLGaEWjj8bzOFdm/4UNLOa06Lj9UmTileP42fhUZcxENjrS4ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3aaNxA+Y80f5W2oIEWGHyfzyjcTvu4C9UEPW1tV6LQE=;
	b=JWlAQZEAE6CtCVj+jx3nKiA19qrjofonpNDNwC3KVZDTHkFVBnchBMeV6jxoVkCcwStP
	 N5ALrcHPIT5aFfzx1QGxPsMtc3Appk5LtgHRSNUGJ0at8EU9tWOqNQ9f+z99qXbLEg2WN
	 2QkNIDugAqinVcdzQyebdN5cQvXWvTCG0nwMpcS3UFgxqR/he6Hic4dFlmfZeGj1mGbSn
	 nq7ZCnvejDPc9S6Btmlqm8lJe4qWL4hKtxOS8oDFjqsmoD8qRb4Z0tGoJ7ACBEW/WFnyu
	 BxzPtkFWztq3QxDFad2uoOgpvsa21lcbpPPWboUXY809tDn3ELGc6WX8v1/SuYX+E7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ox44oH8m;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA45E606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA45E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ox44oH8m
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso298416a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793773976; x=1794378776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3aaNxA+Y80f5W2oIEWGHyfzyjcTvu4C9UEPW1tV6LQE=;
        b=ox44oH8mr058i0miWerj3EmnZjHQtouQjtG/I2FLwO27N5lEpBV2MNi850DLMHzvoh
         Ln0uwPXCoEHhGW/db4tWmAa4FhQUaMg7WLyM0JzW11IfELPrvxa5gg81vYXHNSw93ZuV
         3NmrD5TyL/i1ptZ5Jc3/4eBx4Y7szq+jeDndIMTkhdwMn6OYVdc76+U8N6d35QOMgRqW
         ZgF8lZGyb3ObO/eMf91JRd/9b6Dlmxx2Mqc1A9I+Xy9qeVSrSYYlZduxkeX0WckNrOYu
         DwS0bTgNbjNcRJWONoT089aJcBL414fGZOwTwncYVr6MDVyj3FooJGV82E++YrV57lHM
         a3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773976; x=1794378776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3aaNxA+Y80f5W2oIEWGHyfzyjcTvu4C9UEPW1tV6LQE=;
        b=G9JYO27sBCz9vJYKGh2PtBWRT0d6aMv7TIJpUCiHTKDyAJXXdTfNxPpG5Lm+abzsvt
         3Ug+zm5p6ik2CkitrH9s4EBpzGE20lBZoGWa7zx5CNMqTR/pK7jMHzaOdKcTTijNxQoP
         YfvcpDwSDmzhczKiG86YMkLT3ewPR6yTV/cqdsgYpSrZouY1WVxLcVVcu4AVMooYu0Zm
         E3o6/dgcnGOBmqmEOO7ZO05qpYGxbuTQ88ybQpiU56eXfCdFqOvaN+tbSK3CyJMSPZ0h
         w4vJPLRFTKbYs+ESBl12VMmu+OE/5P3NtYc/k/aIH+AgQBt+HvLAjyXBt28h4tnpMNo0
         +0hA==
X-Forwarded-Encrypted: i=1; AKwUvBxV5Ywgy4G9Ug9vBsR/8gcavRRwNlmri6/3u+gZEcDwt7P/MpYb0bId+0/dy3cYMpXiB14xSS+l3WuzJ48=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8NNGww8Hg7wnxCb30q8IDNUs/DV82Yrfaul5dI37IJi3bs0sD
	55WQwPQABEqOxXhYDsisSNF7dlnGcQlG/+lzV1xPBxWGtaqRfueMubbt
X-Gm-Gg: AYBFou3icijlmZtlPO0vlvWqL2PacMwNEFfsQtTyJKO6LoD4AoNbWSHd09Tc3yU6i2C
	zyZ8y2g29s1ZaHzc8q/OuC7bzTWdi2CvzKqbRE4NTEBv+AXDS3V54HF2q13l291mWW1ga7bJuQU
	u6H7NqN1QZecM7NKz9Ht9CbSIxNvy1J5VzuSxU3riKPg88gXvhbXtrfKbMP693QcJXZlenFL/kg
	RAeh03UoD5EamypukZmsvhjXiJCcHP6HQEE4HqU2eO0w1WKfojrN0jFJxYZ772+8UhpGhidRpqy
	dJL/G57UoqO3S2x9cLTf/DU4RJkfVrqH0kCOajqGP1ZBGwsxGILWjqP8jlpOFBAfaNSiTLfs5DI
	/Vq/tsnscTRK3ANM5Ti1eKfdNe8mMxDXuW6ljmB6nwQizR/IPJ85hUNNyjMTji5G2nsVBu76cM+
	qYe0JQCJzkJ0JV2LAGL124Iw0340aFHy8fDDUKcBX0ajiKiPyEBgSzCjWlcJ6WzK9pllhpQa971
	zWSXH2XmnqwAw20ZRojVMavo02uaWgj8DV5OVRBuwRo9pRiiEIMjjSLTUIQVf94TK6oHfYpNM5P
	w0DtFzGWQe9tI/b6J24V0tMD5ktV7uZKLN+9ZNsqWFlOAtG9oW1l+xwc
X-Received: by 2002:a17:90b:1b08:b0:3ab:884b:65ab with SMTP id 98e67ed59e1d1-3ae89857dadmr12874069a91.55.1793773976084;
        Tue, 03 Nov 2026 22:32:56 -0800 (PST)
Received: from ubuntu24.localdomain ([124.77.157.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0945104dasm2583207a91.17.2026.11.03.22.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:32:55 -0800 (PST)
From: BeaCox <0xbeac@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Snook <chris.snook@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net 1/3] net: atl1: disable work before freeing the netdev
Date: Wed,  4 Nov 2026 14:32:43 +0800
Message-ID: <20261104063245.23402-2-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104063245.23402-1-0xbeac@gmail.com>
References: <20261104063245.23402-1-0xbeac@gmail.com>
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

atl1_remove() frees the netdev without disabling reset_dev_task or
link_chg_task.  reset_dev_task is queued from the interrupt handler for
link-down and DMA errors and from atlx_tx_timeout(); link_chg_task is
queued from the interrupt handler when ISR_GPHY reports a link event.
Both callbacks dereference the adapter and the netdev, so a work that is
still pending or running after free_netdev() touches freed memory.

The original driver never cancelled these works, and the current
reset_dev_task was introduced when the two reset tasks were merged in
03662e41c7cf ("atl1: fix kernel panic in case of DMA errors").

Disable both works synchronously before unregistering the interface,
then delete the PHY configuration timer.  disable_work_sync() drains a
queued or running instance and rejects a later queue_work(), which a
plain cancel_work_sync() would not.  Deleting the timer after the works
have stopped also prevents a running link work from rearming it.
atl2_remove() cancels both works and deletes the timer before
unregistering for the same reason.

Fixes: f3cc28c79760 ("Add Attansic L1 ethernet driver.")
Cc: Chris Snook <chris.snook@gmail.com>
Cc: stable@vger.kernel.org # 6.10+
Signed-off-by: BeaCox <0xbeac@gmail.com>
---
 drivers/net/ethernet/atheros/atlx/atl1.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/net/ethernet/atheros/atlx/atl1.c
index 2883e9462f..2bd35c3cfc 100644
--- a/drivers/net/ethernet/atheros/atlx/atl1.c
+++ b/drivers/net/ethernet/atheros/atlx/atl1.c
@@ -3132,6 +3132,18 @@ static void atl1_remove(struct pci_dev *pdev)
 
 	adapter = netdev_priv(netdev);
 
+	/*
+	 * reset_dev_task is queued from the interrupt handler and from the
+	 * tx watchdog; link_chg_task is queued from the interrupt handler
+	 * when ISR_GPHY reports a link event.  Disable both before
+	 * unregistering the interface so that neither a pending nor a late
+	 * queue attempt can run after free_netdev().
+	 */
+	disable_work_sync(&adapter->reset_dev_task);
+	disable_work_sync(&adapter->link_chg_task);
+	timer_delete_sync(&adapter->phy_config_timer);
+	adapter->phy_timer_pending = false;
+
 	/*
 	 * Some atl1 boards lack persistent storage for their MAC, and get it
 	 * from the BIOS during POST.  If we've been messing with the MAC
-- 
2.43.0

