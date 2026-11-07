Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794028724;
	b=Ix50UuakOkz8+RS1LWP7ZVgPbAKhdNpxrBUYERQU1RmJNWMfn39xj8blvKFb/Kmyxnn6
	 Nq/E4KgPTrDnB/9++CeeiDvWT5EKyLmRWcVa/OXjaHbktVX92tKA+3rhlw78erqTXrrQz
	 TBv/miUwYSkiLH0DiLOs/8A/Y1K+4yCvwIbu/Vf2XLggHNdwJYgRc/yL+89ktC4iPChuX
	 y7pk5Au/Jm5M3vSP5jtCEOcOkVERJLdzDkd0kyTxAW/cXTYRolOMoEIh+IQxP/6jT+Ivv
	 GDAoGwy8KWfKxV2EpsrbLWk8L2uI+eRzmGDJS7Q9PsxAS3ATOZUj1+CSW53BL2/WY1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794028724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=69iwLbdEo82R3C2faWyiFypCoPu1ycnBrcOnH1bGBkg=;
	b=e8WmszxlWH8nX4w79iaoBsRPm7VZoPjJleopWyKWJfktOim+fE98zMTZEqYNJgJfRbFG
	 GbniZ7db8Y+7/NPMulLh4ZfJcwIDADIKyk+Nd6vnMcuUgUEaCDuRw1NREs2tqidq4W2jr
	 1LDjRC86uVZT5XUBgcGtz+99Cg1qpcMyws0XWyPeGCj33iyitZkjWQ1hy7bFLKcCapn2B
	 tLF0fIHQ7CzvccLjBddgszVWCK4sBqlEzozlwXkv901G72UodWRcIx27wJCOPBcQmNM9q
	 h9PrFAMit4N85YvaE+zGX98FxP66xMXn47YoCp4a7p2Fo1UF985sFa6edLrdivR8aoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5v5llPK;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15A2606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F15A2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5v5llPK
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so730776a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 21:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794028723; x=1794633523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=69iwLbdEo82R3C2faWyiFypCoPu1ycnBrcOnH1bGBkg=;
        b=h5v5llPKaFu3fMlhcSWhfngsLZGQd1TsUbhsX3QVDmc9B0roRkq/BB1xhC+cbZGT71
         gsoeU7oTfZsWAi4FaTjTShYUrrfBzMX2KNC8ZJG07iUr4Fc2Q7R8TiPEUchyrNx19LrB
         sqwcarkOC6aKMXpV/Cp0Cw1B2HWHmiFYt4rtur/gJiliNQXYcZSfKXqT4G8HJvCRHVwy
         ZFFKVW3bcubzPMKQD1u3aaLOPHRNoiN8P/lUJC5+aikahIHxco7AzjfW8tPNWgXcsfvq
         MOFVqI4ZGCxigpeA26DC4+gyp1BBT5m4egxv23UMlbSeskvfXVY06IrKv6VgBQ+vd8UA
         +lZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794028723; x=1794633523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69iwLbdEo82R3C2faWyiFypCoPu1ycnBrcOnH1bGBkg=;
        b=crvaqQt9lMbr7afTas1TlXWVBV206kAGQr1ivWPDk11DJ/fjsqifORaH2v1WLqwDpB
         s2A7E7q0p4V2Ms635tILOzf3SOtfln2KLwCn1PwPNNtd3bVaR/x64U/+gC3s3DfuyRJ7
         JK/GWHM/R3N6HAvoTxMYmlCsJA7XyR2n1R1Yiw0y2HBkonQuahVWCyDAxSatusK2O8tS
         85gAjtShP+2kji9XLgfmfegmT3cEEK3V0vo3ToEQgIXCzWole4jWxEXiF0c2kCJCrHAS
         XkDZpSoVgS3gu4oIgz11HpHePa1jnStm4lAzlPp46GKA69xTNOQVuIZ82mrpm3Rwp+qi
         Hkhw==
X-Forwarded-Encrypted: i=1; AL+hErF02mk7pHc9voltB5ih16ljzykSSTdNhSbA7PGhDFTLNy2lpNt3owyVkcUyhCO6bkeKtQPDHeCUppJobpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Isw8OEjc6RzbErvmlIz6DJfPL4X9Ryh7R9+bf7BnFgts5raUz
	14TY/8JpdxpSdzLvo414ZmBi3mxgqBB29DZ+HIxob3yhNgT3VuEm8e5W
X-Gm-Gg: AYBFou3oWpGZsgIGy+CSvk56u5YvTSO0Qm25RLZCY1qBo/kRv3cV0at0Rjgl3NqST8q
	iCvN+sXFyQLliGau7AEm/6zWLc5MhjzCTMRS9YQQJvjXE7EAkXjBkUsdGK5GBflKjSfgKc+6ZAw
	roExRfDEDhGW3I+wedOtDfl4BBcCdsPr458mD6SLD5p3BUmAMgCdDfQN7BdFB6RQpsuVDHGTXAZ
	FV8BiGCPTynxlclbUfWxovvs94/9Q0BU1I55YoGZQxl+MFXnwjU2Iih009kkGGZFlyVY/TgpBLI
	p8S1oxle7hj3ynceDSVORIWcrcBdmhby8Sre4nLZ669yGbjbcXYlqKheGtTpPTT7tuMd6XTgbrH
	LsTspUYYNt5EnWhVTdLfoKQKIqVDAAqzJ+DX5vPXIsEp6C/GAtB8sleLZek9082No+EbRSTlJPH
	st5LmIpmCu1VdLP0Ylxt13MN2jwohMRE28zV0nG52fiXu8Sr6kFOoZcSqkYcO4LsjfftPpsLDG4
	vzyTi6EOmfJH+Hi4uj+f7mb5cvFCwXVpgM+BM9CAeRw6dWOdZGCjH+2Fvq1NwE/VRKFf3hr9uQ9
	7iknCBFLoOYlBRzlji1LRokP8RX6jYa2nxBSGbzaCAwd0RE/
X-Received: by 2002:a17:90b:4d85:b0:3ab:884b:659e with SMTP id 98e67ed59e1d1-3b0db6d7bb6mr4232399a91.9.1794028723184;
        Fri, 06 Nov 2026 21:18:43 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057c1c2csm1785860a91.2.2026.11.06.21.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:18:42 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	Paul Fertser <fercerpav@gmail.com>,
	netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] net/ncsi: disable the ncsi work before freeing channels and packages
Date: Sat,  7 Nov 2026 14:18:25 +0900
Message-ID: <20261107051825.3313019-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

ncsi_unregister_dev() frees all channels and packages via
ncsi_remove_package() and only afterwards calls
disable_work_sync(&ndp->work):

	list_for_each_entry_safe(np, tmp, &ndp->packages, node)
		ncsi_remove_package(np);	/* kfree(nc), kfree(np) */
	...
	disable_work_sync(&ndp->work);
	kfree(ndp);

The state-machine work, ncsi_dev_work(), dereferences channels and
packages (it walks ndp->channel_queue with list_for_each_entry_rcu()
and operates on the per-package channel lists).  ncsi_remove_channel()
and ncsi_remove_package() free those objects with a bare kfree() right
after list_del_rcu(), without waiting for a grace period or for the
work to stop.  If ncsi_dev_work() is pending or running when
ncsi_unregister_dev() executes, it can therefore dereference a channel
or package that has already been freed -> use-after-free.

Commit a0ffa68c70b3 ("net/ncsi: Disable the ncsi work before freeing
the associated structure") added disable_work_sync() to fix the
use-after-free of the ncsi_dev_priv itself, but placed it immediately
before kfree(ndp) -- that is, after the channels and packages have
already been freed -- so the channel/package use-after-free window
remains.

Move disable_work_sync() ahead of the ncsi_remove_package() loop, so
the work is quiesced before any channel or package it may still be
touching is freed.

Found by code review; not runtime-reproduced (requires NC-SI capable
hardware and the state-machine work racing device unregister).

Fixes: a0ffa68c70b3 ("net/ncsi: Disable the ncsi work before freeing the associated structure")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 net/ncsi/ncsi-manage.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 1d63958..1c2dadf 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -1960,6 +1960,15 @@ void ncsi_unregister_dev(struct ncsi_dev *nd)
 
 	dev_remove_pack(&ndp->ptype);
 
+	/*
+	 * Quiesce the state-machine work before freeing any channel or
+	 * package it may still be dereferencing (via the channel_queue /
+	 * package lists).  Commit a0ffa68c70b3 added this disable only
+	 * ahead of kfree(ndp), i.e. after the channels and packages had
+	 * already been freed below, leaving that use-after-free window.
+	 */
+	disable_work_sync(&ndp->work);
+
 	list_for_each_entry_safe(np, tmp, &ndp->packages, node)
 		ncsi_remove_package(np);
 
@@ -1967,8 +1976,6 @@ void ncsi_unregister_dev(struct ncsi_dev *nd)
 	list_del_rcu(&ndp->node);
 	spin_unlock_irqrestore(&ncsi_dev_lock, flags);
 
-	disable_work_sync(&ndp->work);
-
 	kfree(ndp);
 }
 EXPORT_SYMBOL_GPL(ncsi_unregister_dev);
-- 
2.43.0

