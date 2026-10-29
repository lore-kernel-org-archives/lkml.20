Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254183;
	b=CmcLNqW3+JliXlFaw1Yeb8mrM7YmAETOPRnHUyfQM0GT8G1u0pCl90PHYovEhha7LRe0
	 hCgwiYsq9Rn6PUpgb9YA7p8Pp/esOAgg/1zNOA+3WJ1pryv8J3KL027aRlP1ySWeYE8Nb
	 fONuEarW8ZnjQBLNRf7NgvF7TiG5NktjEWD02Mr+QI8uAivZfoXGSbbH7xvlALwBvudLq
	 ziVcHjWqyCrMKOkRev64cqHleLWPHcjcUkV5WhQYStx16ZhuklxgUhWztFmrfEgoJnil6
	 TMpkJaui/sUACHYcFP49P2rz/M4Gs94Ef7d6v/X/+Muzra4rjEIaNkc3Nxbbhiv2VEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SC2elIiktzsRzzpw5C8r5H1plfOjFayKw+uoorWLiSE=;
	b=ce9Vpi9T7e5ysuhDGNNh3M3mbivqqTpjPZblposfXrc70yeXV0Edq07sCEH2+6xOl6NR
	 VAOIIXKHHN5sG19NAXYkoFmMdjArMNMReX1pZ/1GV/5j5BG87j91184gUy85TZ+K8vuby
	 dYX+iSUO2TuLh/PmCsR1FiOptDkBaQcz049lxIlOSOBQwiS4/YI1q914DjTgl7mfAKPsd
	 wRT27tz7/w9K/xoUNEw7IgYMKBuNCBxnclLSTa42wFoHLv//45BYnhpDAeqNWdWdhVSgP
	 QCuKPloTJGT3yWTgblLuZlUfMKCWrL683MmWJVNa68v+bD8ZYiVm3nRKeyOw5+ABGvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hbZQqtjN;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4294606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4294606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hbZQqtjN
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1223427a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793254182; x=1793858982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SC2elIiktzsRzzpw5C8r5H1plfOjFayKw+uoorWLiSE=;
        b=hbZQqtjNZVYgBXUF1R8HJT3A3EkYa/ox376lTYm6M/PNw2gguubk3ryfXH61ujtAFJ
         AZdN/2AuM24jjJxytffigJT0gTSi8pokLE0ocj4nUIESWhSviYmhh/WxZHCiBFA0veFB
         Z/pO9r083JbNm/9M1ZCw+V6ZTAUDgcbbqrlV4khoPMLHaglwM4hvmihyIKJYnIBE8vrw
         20oHgkdVw5PtOnTPkmR/6F6PbarHlNVFj6gW9flCyV8NkKy4YPCbNY6fqnRjsqgguykY
         JVdwZaZvzeY9+0ZrYkyOUmCq/n872PdS3RAFym7ZUveNv8GuLK7+b6NsdgvNJQ14VRmw
         UFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254182; x=1793858982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SC2elIiktzsRzzpw5C8r5H1plfOjFayKw+uoorWLiSE=;
        b=i85jrmWHmjMXrwusT70UGboAcyJ17FxwMFsW2EvHThYubD3fKRl0/QwLj+Sz88Mzld
         v9LGeay3efSl/4GBeKAJovcaC7xCyKShIjlVU0mxqPVMZFvEwdM6tZBOGyg3f2KWdDEN
         n3VsqINVofs4H+O1Z0kg3D1fBgOko0M5wJBeXsN7NPXVMOXzj6tsNAqn2C4SAfrxjKcX
         GwzdRlcWg47KoOiSFqTtW3NnBPPPgqqLven3U1k0UTv4oAV2PCM2f+E4iH8W+jI2Kxvf
         0m/9KK8/N++fFH5XQlOmvHqoSuRYxxI60SWIZYVCixKS+AddzTebBULCnKhbzH8OfNq/
         wO3w==
X-Forwarded-Encrypted: i=1; AKwUvByzGN8cCJz2QcvsNHUq4TLNhxNcVrN/ZnQ+HLZY39/n7qtcQJxoiAZpo9kCon8B1aGn6+Vrv17hVw/bVFQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5NdWV71+fg/J1EDGvbKWHwZluI/DmLwAkH6FxgsGlqDWpzNfj
	SEYVFMabSkfDnZqhodgtX2/4VRWQ1uuOMHfhyuu/ldn5N/1iT7cgrJR8qdzz/upl
X-Gm-Gg: AYBFou3syFtx0mmKTf7DjiyWUFhBjTm68bsQHtb1XyUnsaRR7v/kxuRPZFmPJwddZTl
	k6v1Mh8s4dmf9gdDvd5cP4RoiRsobXV1v3WnYhk4nJwgtlQwnEUkCBbcDM+54YiJOlz/LpzrGEg
	WKkxf8Chq3Za8v1nVYKfBFMw+3GEvkZN6yQ/WXmlyK0Upw+BTnDWSWQ443faxjEd2ZaFVIamhap
	EAlMvLLlvh3ZhuOlbP4+Rg2O/tir3wlwZNyjTZEsrCXe1Y2wvgPBc6aAwpuhjEFYqqjZqDS8zCf
	AXahtxeI7Yi0rY7ENMzmrCGhvhPMZE5Oei5ejh67i60qZjlP5MJfgMfij5ZQb7vy+vhhMamU9vq
	3iv1G8Q2kfh5tHfBoU4puuOF+DIfXPgHzVD5F1OGa1vqyyjExbE2RlbYZkVZx5RT72Ujl55T6G8
	V354BQuu8oycnriaULU5jmZtrwWvexAs0Idjk2tVngJFeEcV/1il/Chi7pLQ0+w2u0G0UcmUq27
	FdFwJAtvlzuT24QlDYT0u/dVIe871xQFlHlwmIAxWEUJOqbj9wit2S4faQV3geTUeFQeIoCzJxZ
	UNjx0bz2WUSHV8txW92VUtQ0qDv41iwmY0Pdak6yt4oaBXcsbaaeHUmzTdLwNkgcGrhCTGUIzxP
	mGGCx
X-Received: by 2002:a17:90b:5903:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3ae57e2b52amr3368886a91.6.1793254182033;
        Wed, 28 Oct 2026 23:09:42 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:65cc:625f:9c43:1e88])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83a4f1sm2697459a91.12.2026.10.28.23.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:09:41 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	neo_jou <neo_jou@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Hans Ulli Kroll <linux@ulli-kroll.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] wifi: rtw88: usb: don't report the aggregation buffer as a frame
Date: Thu, 29 Oct 2026 14:08:57 +0800
Message-ID: <20261029060859.90002-3-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029060859.90002-1-hjf3108@gmail.com>
References: <20261029060859.90002-1-hjf3108@gmail.com>
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

When rtw_usb_tx_agg_skb() has more than one frame queued, it copies them
into a new buffer. That buffer was also handed to mac80211, as one
additional TX completion.

Mark it as a driver frame, so that only the copied frames are reported.

Fixes: a82dfd33d123 ("wifi: rtw88: Add common USB chip support")
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/usb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/usb.c b/drivers/net/wireless/realtek/rtw88/usb.c
index f03b00e517576..34379dddf7c71 100644
--- a/drivers/net/wireless/realtek/rtw88/usb.c
+++ b/drivers/net/wireless/realtek/rtw88/usb.c
@@ -436,6 +436,9 @@ static bool rtw_usb_tx_agg_skb(struct rtw_usb *rtwusb, struct sk_buff_head *list
 		goto queue;
 	}
 
+	/* report TX status only for the original frames */
+	rtw_usb_get_tx_data(skb_head)->drv_frame = true;
+
 	while (skb_iter) {
 		unsigned long flags;
 
-- 
2.55.0

