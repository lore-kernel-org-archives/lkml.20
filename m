Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AFF513552
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875616; cv=none; b=saXcgJroPhWcrS263H4UEyy6RBOEj6cg4wRYM+txnUuwvJVENjTJvn0DZeWUcJh3PsZIbHDurqoyEHAyadFIYRfAKI+Zwci9wedg9Awyg6Ut/gIZ4LB4Z445DOqU64rfPTKXJfM1t3tNCgS4c/gDXtIKuq+rGH4pE333wykTkTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875616; c=relaxed/simple;
	bh=7wIfSA7jIgn+YuODqH1Zm4TLzhQihyQIWfos5qWU4Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eyt8+aAsrwnhZcBlPAw4lMKQ8XH4JtG5V4OsnUfYyMdwC6mLCjjLsHX3FdPPl6i/aq4flu95xrvRef6QgvvSq83eSauJRl1/P636b7X2DMxTyBN5wFQNaspZ0HmiW9jXiP8F0PkW4Pp8CiMqXaCy8mcRUY8aznsmg9ZuBYhKFEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=atY7zy2H; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="atY7zy2H"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2531f453eeso652532466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875606; x=1789480406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=onv4qoIcCtETFC209nIFagBVXouZZuhs1jFn7+5wWYM=;
        b=atY7zy2HI/b1aqOv0owoHGMS9WiEf9LpNAezUogtvunTG2lQ7Ww/KnS8ELzTU9dZan
         2Zx7LYbfFVNf4EKMkwVukEdAtSW8mlNM5+k2ybOyyGU+clO7vTejW52Z6V+3TkF8lXGx
         ErwisnjHG7ydflVWd2Wl+2WyXWReXRMq36klStLLQKVJIdpUxGLi72k4pgZzmjKpi/Gl
         uG2wRhO1z0u5xDSXJwx2fF2ZcAT74fHh63xetzNk+AfC0SpLEXfhi2DohdOP/y6XaCcE
         27iybP8HZtqKgpoPE/ItvlBg/tkZ7cNcOAAumfyu5Hvrh7FeXk7n5lRhyYy7WUZj/bDs
         +Q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875606; x=1789480406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=onv4qoIcCtETFC209nIFagBVXouZZuhs1jFn7+5wWYM=;
        b=b8a81O4H4do48TaSIdXM0krrn0AVvoM+KeocIldkt7exf43wrZgFva3g3XAcLg/jwy
         qk8PAXYAhJic3USILUYA1oBSDv2KmqU7nde0mkhOHuW80sy0w+6cqncckkm0/9JvG4nD
         ey9eCTtV7k0Nq2dqHNvxn1ayn6/ZKCRCesbxlMevub0ako+9LB+2aRX+FQ4GPQE6LU6N
         rlRLuP4HxNsP7grHWkeslmu/ZJvroi6KLFrNkRhdqVtx4grum6RgBVpMdhGe3WMlMhOX
         u1bQDUtCsbQcKchWhGD8oBXgFGJ6P8SozWeMmuW//o1d1WIn4nrfMRlkXCa8iHUjsS76
         RuBw==
X-Forwarded-Encrypted: i=1; AKwUvBwQqy47UR6jrsZad2SGf3iczHWIIWH6XZrr8W0aN7mypi8AhQ3Rnx3MsqQNlU3DPA2eYqqvURAjrTjfu1Y=@vger.kernel.org
X-Gm-Message-State: AFuF++krffEMdeaf2hBb56zSBYDLv65dKrfvcdc2QwecgHz7o56T16yK
	ML2CV06GMOI/ZzjqneKqZ/sSNzhoayY+BI28Fs2Qxc3KMUUrSJmfSI2N+QzwjS32TVfZwXmZNkr
	wtf9ZQCgmPT4=
X-Gm-Gg: AYBFou0/qzGjsND5TZRU0GRFKMJOK80PjNEN2xKl1nNDHBY6JlVaHp5GkzDfFi8Z8tV
	ku6P1UZb/Jb5nPFKGq5UFQHF0NgblDO9NTHRjhYZp0KlM54n768yTH9/O6DPWLS2wS1qE2R1yq1
	5GniauTtMB9nNMKR8imdsLHc8VEbG4Kq8sHI6zyeOeEFa2uEJI6XtaTjRBrcF4rFd+3+UMM5STP
	dZj+NmaW1/QigJT8GYV8PpZN+fL7vyGQ7f18BRWIijBTwO6HlIthlMCTiNcc9rLd9zJUvrpOZxd
	wYZDshTRi8aV/K5u1VJmeCXZvS2nvuTMXTg+QKYxfosb4Hv00AVYf0vKZA+aafjWKi6HBfMYPIw
	mbEFLAqRqQdzk6bw/GFZuRExVBmS5OJtJJzhJDY0w4iX2FLR8f8nbS90VDsxptpxYHT7F6utDbc
	HKgnxa+hs8xswnGrShqpknvX0moXDZm9AW+tuSt8L2rOX0z4axyftyzTOoeQVppqQPoWkD75xNL
	Smpu7l4+uoNn7p9cPe+0JsCv4gUQyLo0yJ2fW+KC1G4QW/9f33if6waR9RySIpte9+vW3h7jv8H
	z0Huy++jCu3WO+e2BsLcKmRPqNrJ+tJYkrubvXnnAI7C9sNzSOC8ioRp4vEmafPhaJkVkf+6NXc
	rGyQENLqSRw63K71HsVN3g5iDmMNg8X5L8CXhn7I2CDCHcWD7oQAt65nnojPfkkxMwuGFI3RmKN
	zVNyut5iAdanHm
X-Received: by 2002:a17:907:6ea2:b0:c25:8bcb:ea0b with SMTP id a640c23a62f3a-c260c6a0e93mr1982912066b.4.1788875605742;
        Tue, 08 Sep 2026 06:53:25 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm647602666b.58.2026.09.08.06.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:25 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk,
	sven@narfation.org,
	quic_vthiagar@quicinc.com,
	john@phrozen.org
Subject: [PATCH ath-next v4 7/9] wifi: ath11k: charge received airtime to the station deficit
Date: Tue,  8 Sep 2026 15:53:16 +0200
Message-ID: <20260908135319.754140-8-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908135319.754140-1-julius@bairaktaris.de>
References: <20260908135319.754140-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mac80211's airtime scheduler is configured to account both directions:
local->airtime_flags is AIRTIME_USE_TX | AIRTIME_USE_RX, and
ieee80211_sta_register_airtime() adds the received airtime to the same
deficit the transmit side subtracts from. ath11k passes zero for it, so
an access point serving a station that mostly uploads charges that
station nothing for the medium it occupies, and the deficit that decides
whose queue is served next describes half the traffic.

Register the duration the hardware reports for each received PPDU. It
arrives in the RXPCU PPDU end TLV on the monitor status ring, which is
subscribed for every radio, and ath11k already accumulates it as the
station's rx_duration. Charging it once per PPDU matches what the
transmit side registers, whereas an estimate rebuilt per MSDU counts the
preamble and the interframe space once for every subframe of an
aggregate.

The PPDU end user stats TLV that names the TID is not in the default
monitor status filter, so the airtime is charged to best effort, the
access category the deficit arbitrates the bulk of the traffic in. The
call is made after ab->base_lock is dropped, under the rcu read lock the
loop holds, as the tx completion path does; base_lock is contended by
every tx completion. A PPDU from a peer with no station entry is not
charged to anyone.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 68472e1e748a..a7b9bb295728 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5270,6 +5270,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 	struct sk_buff_head skb_list;
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
+	struct ieee80211_sta *sta;
 	int num_buffs_reaped = 0;
 	u32 rx_buf_sz;
 	u16 log_type;
@@ -5324,6 +5325,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 			continue;
 		}
 
+		sta = NULL;
 		rcu_read_lock();
 		spin_lock_bh(&ab->base_lock);
 		peer = ath11k_peer_find_by_id(ab, ppdu_info->peer_id);
@@ -5337,12 +5339,25 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 
 		arsta = ath11k_sta_to_arsta(peer->sta);
 		ath11k_dp_rx_update_peer_stats(arsta, ppdu_info);
+		sta = peer->sta;
 
 		if (ath11k_debugfs_is_pktlog_peer_valid(ar, peer->addr))
 			trace_ath11k_htt_rxdesc(ar, skb->data, log_type, rx_buf_sz);
 
 next_skb:
 		spin_unlock_bh(&ab->base_lock);
+
+		/* The airtime a station spends transmitting is taken from
+		 * the others, so its deficit is charged for it too, with the
+		 * duration the hardware measured for the whole PPDU, as on
+		 * the transmit side. The TLV that names the TID is not in
+		 * the default monitor status filter, so the charge goes to
+		 * BE. Outside base_lock, which tx completion contends for;
+		 * sta is held by the rcu read lock.
+		 */
+		if (sta && ppdu_info->rx_duration)
+			ieee80211_sta_register_airtime(sta, 0, 0,
+						       ppdu_info->rx_duration);
 		rcu_read_unlock();
 
 		dev_kfree_skb_any(skb);
-- 
2.53.0

