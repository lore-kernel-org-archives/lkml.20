Received: from mail-pj2-f19.google.com (mail-pj2-f19.google.com [74.125.227.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020D2443A8E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558690; cv=none; b=ezxfmsfpUWT0YEze/3rlxGJ8eldKbLgeJIZVJo0Trh3m7Ye8DTN4DjR6fOqbbrit26Lw8OnHzOlHk04+LJBoR71zIRlAvFi1ySiLVehGipr42XEI5nxDQUmT5t/GhjmhMjbGj2/YRzKdgtzHBRTYQDVAHRAmk2p2NLSS/zDjfJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558690; c=relaxed/simple;
	bh=csUfOndJDz7EZEfMA2frijyrNrVz9OUmpEKxWFv+B0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mmwmWI/tIXaGrzocWtmaMPB4JswakKVtKMVqi8JvAmCzD4Y3nh2L7p0yBmHqRXp6Y4PsGgfG8P2d7oBhQEI9Q52y6RUFDNrenkbN7Z+hhJzFvYjcSDNBU8PONiKl8/2XhfHRDukyHbMpaW/h04/u99OGzbJZ5wcb8YInH8A3p14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fqq9nzJo; arc=none smtp.client-ip=74.125.227.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fqq9nzJo"
Received: by mail-pj2-f19.google.com with SMTP id d9443c01a7336-2db18fe433fso6905585ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789558675; x=1790163475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T34qbeg9BZiIizWsJRPiGsD94KV01+5BcoUdEM3GmQ0=;
        b=Fqq9nzJos2eu4inH0JHbUgSMQtF+zKO8I5pVv1pv80Ooi+2NKXQ5GpiuluhftHdL0t
         u3+2xipl/DnmJJBIH4ObXC6pNi+U4S6br6dsh/1qWsGUi04Trua84p/2NKL2ZktJXwO7
         laFeumLsNsFC9mG++zbzmDNZaXmIAMJVfJCvXnS3nF0FZVCUdTEu+snR7Vfi6tk1PtRA
         i2RNI5LaqzE9tXRcbzq37XpxhqHqXzqDcGviJ2l0aXvBm5m6R5nWdfjD8e2TZyYE1EdG
         sBanqUY2i5/NUR5Dm9VTzzjZ3D/Mr1E6gxsXc5weuQQUi0VMXoOCWKwTcB2haVdxK00m
         5MDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789558675; x=1790163475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T34qbeg9BZiIizWsJRPiGsD94KV01+5BcoUdEM3GmQ0=;
        b=GzB7LpEd0XxR4mTyu5fse3MrJYSbS3UD2iU+bqiLs7hY8ophG0+qBe4BoGqtHtANkT
         /3vYh3/unQacLRTWFUH42yqL+Rvaj1bmdUTdLSwvofTAvxB5cAInDEAhMzVR6Zt6AF1U
         zQBkkKnm8exXCm2OVbbPZ7HC5hJOcq+kS97LWbP1jGoOT7dyO926zzLYhBJDtBOwlxpE
         gvDOVjA1dIG2dz93W0FlMUKzvektExWQ+rbpF4h2qbRmYIvz6dSM4lcwLUGNbgPYP9xN
         UoEyGf6Z68ze4m4+fRIobJNhgHyBbLKnXMP7z4EzYBTkYbzKWLSQdhgwT7yhQP9zWe+K
         zwDw==
X-Forwarded-Encrypted: i=1; AKwUvBx19YIoolxUi3jmimEnP8UQ4VtIh3YRqk0mmV5w26D+LGf5hPPJW6CD4awqG27duAbAZ6tIbgaLkO6V9qk=@vger.kernel.org
X-Gm-Message-State: AFuF++ksp1fnFOOXoRRgNBJFHdcchzsnJE+sDPWSaPN+Ns8cCpdwQKBu
	Ca2NIyhqU849KPzPTmBm+4qDGATM5C5iHaG4Id2EGJU8U0jWABn/FJVl
X-Gm-Gg: AYBFou2Qv+iAB0glXiMlJbuFMgYrP55WQtJ7BP2sMqUhhYa+a1lOWvepxUig4e3wFg3
	IxvzyylTA0glYJMqeK4krFt4nX1aDHgGHVD86Y69OsB0sN7afkJJw54DBm9yGzrPaQ9G/99PPvq
	ZRiYw95dhW01t+Bwrz2XlPrO9HAKY+O0VxwtDirr2j5JEjb2JWh9pGD8ynQ6JKV+TSsyZRrCMTP
	OiG4cfKD3ooQ6rQs35Km/dPMiOc4I0goNnYmggfiVvcOCgFuiZ4pPcbr7QtMZW5kb2uQDL4mZXJ
	vqFlTmGIvnr2LEZXpbEHc4p90kUkwCLwfwXrFmJ1QudBeqNPMjrb4qsJupSz9yT+NwN6kkUJpMx
	NPnEiHPQ/XK6DDcXxvSmouzgW/d+H5n5JXOCadCPZvC/kHVSFTxr29FDggYsrx00WobmQUq1hRg
	6tJqtKmffFJ4KgDGE1nWe1qpWqn+VQwrOk4Sy3qqOX0bbb/WKK9PsbuhvenCRCNJjDRNRIPmBZX
	498ABF1UHYkHpjHm49HN8cLJtKnjMwN8EH86n0=
X-Received: by 2002:a17:903:1a0b:b0:2d8:d4d0:792b with SMTP id d9443c01a7336-2dd8e7546c1mr49020405ad.15.1789558675144;
        Wed, 16 Sep 2026 04:37:55 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f02fc2sm9936495ad.59.2026.09.16.04.37.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Sep 2026 04:37:54 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mac80211: drain PS delivery work during station teardown
Date: Wed, 16 Sep 2026 19:37:35 +0800
Message-ID: <20260916113735.31029-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing an AP or mesh station can notify the driver and wake TXQs after
the station has already been removed from the driver, and can update
num_sta_ps and the power-save queues after station cleanup has purged
them.

sta_deliver_ps_frames() tests sta->dead only before it starts delivery. A
worker that passes that test can be delayed while teardown sets sta->dead
and removes the station from the driver; when it resumes it still runs the
full delivery.

The existing cancel_work_sync() sits near the end of
__cleanup_single_sta(), after the final driver state transition and after
PS accounting and queue purging, so it drains the worker only once the
state it has to protect has already changed. Before commit d34ba2168a3c
("mac80211: don't delay station destruction") cleanup was deferred
through the same ordered workqueue as the delivery work, which kept the
two ordered.

Cancel the work after setting sta->dead and before moving the driver
state, and move the existing cancellation to the start of
__cleanup_single_sta(). The first drain closes the driver-lifetime window;
driver callbacks during the remaining state transitions can still queue
drv_deliver_wk through ieee80211_sta_block_awake(), so retain the second
drain at the start of __cleanup_single_sta(). That drain also covers
insertion failures, which reach cleanup without setting sta->dead.

Fixes: d34ba2168a3c ("mac80211: don't delay station destruction")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse smatch coccinelle kasan
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation:
- GCC W=1, Sparse C=2, Smatch, and five targeted Coccinelle rules produced
  no diagnostics.
- A controlled in-driver AP teardown filled ps_tx_buf and tx_filtered
  through ieee80211_xmit() and ieee80211_tx_status_ni(). Before the fix,
  cleanup purged both queues while the worker was held; the worker then ran
  after NOTEXIST and left num_sta_ps at -1. With the fix, the worker
  delivered both queues before NOTEXIST and num_sta_ps ended at 0.
- No KASAN or list-corruption report occurred. Each arm has the same three
  disclosed harness warnings. No physical-device test was run.

 net/mac80211/sta_info.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index fdf00cbf49d8..e81cd155197b 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -137,6 +137,8 @@ static void __cleanup_single_sta(struct sta_info *sta)
 	struct ieee80211_local *local = sdata->local;
 	struct ps_data *ps;
 
+	cancel_work_sync(&sta->drv_deliver_wk);
+
 	if (test_sta_flag(sta, WLAN_STA_PS_STA) ||
 	    test_sta_flag(sta, WLAN_STA_PS_DRIVER) ||
 	    test_sta_flag(sta, WLAN_STA_PS_DELIVER)) {
@@ -166,8 +168,6 @@ static void __cleanup_single_sta(struct sta_info *sta)
 	if (ieee80211_vif_is_mesh(&sdata->vif))
 		mesh_sta_cleanup(sta);
 
-	cancel_work_sync(&sta->drv_deliver_wk);
-
 	/*
 	 * Destroy aggregation state here. It would be nice to wait for the
 	 * driver to finish aggregation stop and then clean up, but for now
@@ -1582,6 +1582,8 @@ static void __sta_info_destroy_part2(struct sta_info *sta, bool recalc)
 
 	sta->dead = true;
 
+	cancel_work_sync(&sta->drv_deliver_wk);
+
 	local->num_sta--;
 	local->sta_generation++;
 

base-commit: 50d3d79dc0743b616afb00d01a626c76758721f7
-- 
2.55.0
