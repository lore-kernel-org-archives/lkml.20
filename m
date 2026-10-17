Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968EF3A6418
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792252531; cv=none; b=TxoM+XBljaWGvShFnszKKnVuzxUUmRqpdjRi/0WE9iqTuaMFroicCEUo63nLBou6Ob/tFBQ4IXDeegTySqwZXnlWh180wX+s192jMA7/pNAmnd8uaH9NQco1PoYQTeU90mAJ2IqbTldjX8PP5jCekPXttVzAVjLWY7l52tGpsKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792252531; c=relaxed/simple;
	bh=mAAQ60pPc+jfdJv8rP6ue7YB+HgmNSwW32B7IxcsMz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hcG3YweXGGqbDqjOH+kvyNOdnQmakBW/xUlP1W6A+jdVUd/ie/xD+DNMuDIaSB2Su6sHUzVU23R3E48ShLDc7UYgFdnji8tQxERdLayywAqwjmIy/4+gtWWDBwPOoSrkhBv7RsHnU7MFdySq4e+EB27W1f2GW+cyquT3rYDMctg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6evmcoc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6evmcoc"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1dfd49514so841755e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792252523; x=1792857323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+gAvbFcPWzZc+jGGj9PIkXWG7hyRgIBYDY75NCMqGA=;
        b=k6evmcocALxCGrZ94saGHs3/duRGcpkDOUGN7AV4xrLfDsMoZB7eRCsYqpJqYcTLgv
         XxE1cwViytwTwCQ8Aoff1zADh8DOL7+VYSzpiLSzyj6P60LT9W3kd7+A0aKsSL+5HsVr
         hxsMeDvwW8ZbmuzCNQ6gBHHObXmXTg4J3lNrzmTv1E4s1ajR2S5crOTRz5QTr5IXulyZ
         WpHBTeMSFpQ00MDSV0sLq5RZDHK3XhyRyf6cDMGPzvBFoCG3Wy4wzduhR+K1cfImQv52
         yQF1GyJiKMGMgcAKAICJn/64wksreVCzepwEJT44EwW/yhbNL3uKdkMl0O2XbONurSHz
         8ucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792252523; x=1792857323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s+gAvbFcPWzZc+jGGj9PIkXWG7hyRgIBYDY75NCMqGA=;
        b=c2IezsG79L+pVSIBw/U+ka9dBMGqJizP7t+JT6DWhx5ppINjmcTECso79YgFl2qptP
         ACBhu9WOPQcqR3ux7i8RIdQAHG7OwQ9QtwGNmAeBca2TxrSL8YPPZP9/5RzNkVK2+x82
         Ep65lzUs8s3+efJTwmQZT7+xsk0vD7IKHz4LbHKj4ATQ/6RJFzYSmoPXuejKiXvYACkD
         prWRKNkGa1UuMIYvyp2aidNfQRkxyTzxs9Ko5LzjBiX65nGlqw8L48d/rlGDk9aWwfoZ
         cFgiFDrGwJBv030fJP+zVffmtDVZgkKvO9mEX9Og70RvUyh3nbfrwynmdFuaqV06bj2v
         kCng==
X-Forwarded-Encrypted: i=1; AKwUvBy9LY6u97343O8/vUymxtigRZwh+NMeVxBeDl2IH7TxWPVUOv+7ZyiZDuhmn82JQ2ynG1NutAnRN4QTtTY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzWpgKZiG54niNbp7erZsNAOdwIiGaEUhSZqgFDCnDvOfYSctf
	RMrRYJZjEEzwoHLiFtT7Ds7kdDnOMmp7B5zp8Dvkt5fA60DMgFx0j/gq
X-Gm-Gg: AYBFou1QpEs7AI/PoWk6SV1w7FXGLAkM5zlW3hu4OsyYTvw2/X6tFGmDIdIkYS7hehW
	lflpx7dhs61Z0fnLytGehl93c4hb5OxyNQPPGNsqjsJ4Y9qzNde3ZSth2WyoPMi3nungZazGcXU
	FyjmhgoE4C0FHY+Mff3RD6O+8ZRE5mTN6pWc7kg7aAYVD9NBN9669XMdsqfYYJBr9IpLk4CLQng
	ZvTls8puYIvI50o0oL9y2gv94JCO+nx51H2ZwapgxQxPVvAjWSaICUKhWzlvKl5WHzW6Pr3zIyb
	uVLPzg72tmacsEVja8slyXauuR3WBvYQZ3PEZ527T2inKCKcCvkJEkRuQrX7LyO2dOOT6/YHQbl
	Kcth97e8Ihb/WT9McsqUpA3HJ/va9JEgFUeCIeiPUo275yPkDMvVegrs7MD2y4ONeEwdfzAxt5u
	zEuzpAKt9Qvk8PzKEF8wPKiM9n9d4QvcYG0rIcuC66kERzTDnnjDxH9ZrnaRqFMD4d++5+SiAGm
	TjuFcGqUjrRzUwEhlY=
X-Received: by 2002:a05:600c:870b:b0:4a1:d487:2dc8 with SMTP id 5b1f17b1804b1-4a1d760518amr63631815e9.18.1792252523373;
        Sat, 17 Oct 2026 08:55:23 -0700 (PDT)
Received: from potato ([31.176.162.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dea678cdsm42335505e9.1.2026.10.17.08.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 08:55:22 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH 2/2] mac80211: hide drv_get_stats tracepoint with ifdef guard
Date: Sat, 17 Oct 2026 17:55:09 +0200
Message-ID: <20261017155509.128114-3-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017155509.128114-1-omer.e.idrissi@gmail.com>
References: <20261017155509.128114-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hide drv_get_stats tracepoint definition with CONFIG_MAC80211_DEBUGFS
which is the same config that enables net/mac80211/debugfs.c, where
the tracepoint is used in order to remove unused tracepoint warning
from UT=1.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 net/mac80211/trace.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/mac80211/trace.h b/net/mac80211/trace.h
index 562a4964afa3..6d80d23b7c4b 100644
--- a/net/mac80211/trace.h
+++ b/net/mac80211/trace.h
@@ -756,6 +756,8 @@ DEFINE_EVENT(local_sdata_evt, drv_sw_scan_complete,
 	TP_ARGS(local, sdata)
 );
 
+#ifdef CONFIG_MAC80211_DEBUGFS
+
 TRACE_EVENT(drv_get_stats,
 	TP_PROTO(struct ieee80211_local *local,
 		 struct ieee80211_low_level_stats *stats,
@@ -787,6 +789,8 @@ TRACE_EVENT(drv_get_stats,
 	)
 );
 
+#endif /* CONFIG_MAC80211_DEBUGFS */
+
 TRACE_EVENT(drv_get_key_seq,
 	TP_PROTO(struct ieee80211_local *local,
 		 struct ieee80211_key_conf *key),
-- 
2.53.0

