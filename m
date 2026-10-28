Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197409;
	b=uBDAT22bNYvVXik0UYISZtdktRmq0VplAs3HN8o4cM1AoxbB/E/5jbCdSSZUftU5fatr
	 4RDi09STZf6qQ63msEoUY8XOgSXSz0HAnxNk64MSdETpqKlV7z4JXupNGQ+a/Wx5Tp7GX
	 OIxf9X/mWKv3CLj1ENyZq/jW2oyF7tZlUAnv3dGaJlrdALeFGIAPPqoiUGnVpx4DWjjtf
	 R+ndSPBKRKKXy0FsBZ9bB3CGe3MzVOiN8lH+aVLBVTxlmDrxZq6o9gFUFSzbLEwSeuGEW
	 QOG/Y/SfDvyPo6Yn61/3fTRZ11HWo04YSJ5afLhMj4i1TKBMtbyZK5sy4eVi5/dygFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cVhL/LPEqcpTbY6iiAqPg/sDis35bxi9SXGTVRzvJJk=;
	b=i0Xx0Nk3JRP0e6z9fmJlRoxqQz5RDl4T581MqVUxe7PmzdcAOcjnFr+KG5xQCiR4Cfaa
	 C9sdU7dPkCLX8buTQ/18TV6bl5iQu7Zp9akS+Awa11I9Wu25XMyZpI70Q2shgkbKlX5hY
	 kBts39ANGUCKeTJxlgfAp81E8MRZwYSqitk0/QbAyxs4r9EhJPb+EhOXGQ9jzPasRLnGN
	 yERJelw1WqT2blbJlBjn/Pg9IjjN7QTBo9KLSmgcH+JdVf1v+hLCxn/py8GmLQH8Yd+17
	 ky54G6xU6B66cqppzMZxCU2D4BxCLctT1abukEid/vAc0Awkc2nE7YvMz9OwSqDM7fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlgguaRG;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7A660A263B
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE7A660A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlgguaRG
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso524048a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197408; x=1793802208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVhL/LPEqcpTbY6iiAqPg/sDis35bxi9SXGTVRzvJJk=;
        b=HlgguaRGlWLQNo6tLyekEGWSTluQr4x8+lI5jUjOszfi6sp3Bogma9wO0oDsxUl5Qe
         pJm6GHL/WVae3wBHsJcHzE7zYgm2mbzlizZGl2vOYtguDKiaBaijMWfA2MYDN02wuYxT
         2GHBF1uHpMIKqY6Xg0Lz2LBnpoB9+4HE37L3IjhBilBI0gjTiye3+KWBWK5TugbWmiwA
         QgAyWyxFw9tIib33N8IuRV9hpZpmdyT/X12C6vhTWPqB0DWG7S8qMhszehxjMSqdnltq
         f0yU3FLsPGGBjZuNzzja7Qeew+KeUkp47iAW2oxwv62nhRXDm/gZKnO01U/FOMegNYdj
         w6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197408; x=1793802208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVhL/LPEqcpTbY6iiAqPg/sDis35bxi9SXGTVRzvJJk=;
        b=QWQDfOITFN+XeTCZN0pTsfF4F0+2zyfWg/yOTwmeyhxYCy18FPcFgw3Z2VpK+jSNmY
         n73tibOLz0IB3isnSl8pyqFswQcIZC9292euKyLLyBpd+Y5RWLtWxZl2R+QvHqB0jtH/
         oB51MTSWucTjizsWm4B7ugWap1yYeVRR8czLTXQtlFZXUcawiDb720LmpeEW1JuvIRDI
         nGVznGdCpiEJ7ai5OV1kPCDFRG6JkVIs3DAQq3oq5AIbLwYp68TQdrFST56LqAJE2BmF
         7TZImqL5jHOO/oMEY8iL4rEmcqIZKiZnr7gdG3ozWI0anJligABazG9f01LOr2wKV/uT
         +Asw==
X-Forwarded-Encrypted: i=1; AKwUvBz+8Qh2qKue7V7UK2WFCoV+FrQ/fOxn6kG7nPN9G/wLxJKVjmgZ8m7/t9gK9Q1W12ajjv1/xToqzQDiexs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFx0YjKAW2JPXtQdEESV7ePzkw5zHpWuZDN4HW47wyfOXJzPUE
	KAMRtE69xnl5M6NlWuEsqmWhVEw2eyvjjK4YlRgtG8pFMQGFzZgGhMMQuqcLCplqtRY=
X-Gm-Gg: AYBFou1rQTVU4oCVRacVUuX1h6dqkdGIvGfWUlj8TuCHUldhNxFw3Cs1Ga0kzOkFjTN
	eKhKfqag8c07Aix39bhQ6gIeNPAQ3U7UIYgUK09M353kIOTO0JjmoQrilMMZyPxamSE6SMZwdbj
	vaScRz0qC02KjLYUc2LD1rerkPmxOV1iGenN1qTfOJFxl7lZwvsjMEpKG/TxTkoQLvEqYk0txRg
	DJ8U1lDnfr9giZ3jQ7U9ej1ZcqLKzdx+GO0gL6oG3oRQKnMdZ4za1Bk69LhSdbPT49wKL5yCIA4
	O3wLKwhgbA96nmdJvVhVCeJu820bT3HXovRKoHuGlNFT9TEwmjuxf3XGDdULjElguzzNIftgxcv
	2c3kxznBV+NAP+HQznVEqW7+uCwI3MjozlkbbGr3ofCbUbkc8QXoAcCAwjp9IF+8Q+I7LwjLurR
	eyZtSrgwSXgfZHvhL/C4470IfM1djf0yXWM6b9C0g4KDNuffF1SMm5aP+tkK5gTywgi84cDFMO0
	LjBGOjeyAn3lwgzZUkPJ1v7e92wqJhsuslpai6bYI4k8CU9fP7irjlDFrSsGn+rAcBsk9M5TRn4
	KftK9Mwr8DxdGY89BB821ZKX9+5rOTTxgnMnm451c/jAkWNr3sa7GfpuChdPK7IdAfAh
X-Received: by 2002:a17:90b:2891:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3ae581b45demr1855722a91.21.1793197407822;
        Wed, 28 Oct 2026 07:23:27 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a501083sm3773918a91.8.2026.10.28.07.23.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:23:27 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Rostislav Lisovy <lisovy@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] wifi: mac80211: bound pending OCB station allocations
Date: Wed, 28 Oct 2026 22:23:02 +0800
Message-ID: <20261028142302.16634-3-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028142302.16634-1-enderaoelyther@gmail.com>
References: <20261028142302.16634-1-enderaoelyther@gmail.com>
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

Delaying the OCB station worker while frames arrive from new peers can
retain an unbounded number of station allocations.

The receive-side limit counts installed stations, while new allocations
wait on incomplete_stations until process context inserts them. The list
lock does not cover the interval between allocation and list insertion.

Reserve one of 128 pending slots per interface before allocation. Release
the reservation on allocation failure, after the worker inserts or frees
the station, and when leave frees the pending list.

LLM assistance was used to find the bug and review.

Fixes: 239281f803e2 ("mac80211: 802.11p OCB mode support")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: A W=1 module build with MODPOST passed. In a QEMU
hwsim guest, a 2048-address flood left 2048 OCB stations before the series
and 128 after it, with no KASAN report. This is a resource bound, not a
memory-safety result. A reproducer is available on request.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.

 net/mac80211/ieee80211_i.h |  2 ++
 net/mac80211/ocb.c         | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 9374c2942489..52bc69774ea6 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -696,6 +696,7 @@ struct ieee80211_if_ibss {
  * @wrkq_flags: OCB deferred task action
  * @incomplete_lock: delayed STA insertion lock
  * @incomplete_stations: list of STAs waiting for delayed insertion
+ * @incomplete_sta_count: pending entries and reserved allocations
  * @joined: indication if the interface is connected to an OCB network
  */
 struct ieee80211_if_ocb {
@@ -704,6 +705,7 @@ struct ieee80211_if_ocb {
 
 	spinlock_t incomplete_lock;
 	struct list_head incomplete_stations;
+	atomic_t incomplete_sta_count;
 
 	bool joined;
 };
diff --git a/net/mac80211/ocb.c b/net/mac80211/ocb.c
index a8dd4f4dbf70..90c43eec61e3 100644
--- a/net/mac80211/ocb.c
+++ b/net/mac80211/ocb.c
@@ -70,9 +70,18 @@ void ieee80211_ocb_rx_no_sta(struct ieee80211_sub_if_data *sdata,
 	band = chanctx_conf->def.chan->band;
 	rcu_read_unlock();
 
+	if (!atomic_add_unless(&ifocb->incomplete_sta_count, 1,
+			       IEEE80211_OCB_MAX_STA_ENTRIES)) {
+		net_info_ratelimited("%s: No room for a new OCB STA entry %pM\n",
+				     sdata->name, addr);
+		return;
+	}
+
 	sta = sta_info_alloc(sdata, addr, GFP_ATOMIC);
-	if (!sta)
+	if (!sta) {
+		atomic_dec(&ifocb->incomplete_sta_count);
 		return;
+	}
 
 	/* Add only mandatory rates for now */
 	sband = local->hw.wiphy->bands[band];
@@ -145,6 +154,7 @@ void ieee80211_ocb_work(struct ieee80211_sub_if_data *sdata)
 			ieee80211_ocb_finish_sta(sta);
 			rcu_read_unlock();
 		}
+		atomic_dec(&ifocb->incomplete_sta_count);
 		spin_lock_bh(&ifocb->incomplete_lock);
 	}
 	spin_unlock_bh(&ifocb->incomplete_lock);
@@ -228,6 +238,7 @@ int ieee80211_ocb_leave(struct ieee80211_sub_if_data *sdata)
 		spin_unlock_bh(&ifocb->incomplete_lock);
 
 		sta_info_free(local, sta);
+		atomic_dec(&ifocb->incomplete_sta_count);
 		spin_lock_bh(&ifocb->incomplete_lock);
 	}
 	spin_unlock_bh(&ifocb->incomplete_lock);
-- 
2.56.0

