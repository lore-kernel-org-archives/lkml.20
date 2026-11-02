Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657797;
	b=qVYhjqG8GZ2Hq6UNmXHE1Z5QC0nI/3hyMKRF6j1OEl0TKlhJaptnPrAIDPLe6s8NfOhW
	 mWjSn4TafE8+sytZ05/miyOWv7uLzExHKysOIsxpbNcT4mx1zl66kvk9ADKTpWN05rmzr
	 2vqrMM9fdFpYd6cbWEpjr3D6NLcNqLxUOyZBIsXl8z3IjQemxqqlsG2gAii13LqcAvWk1
	 rQKV9HBXExnQlrizK+NLxhw2B3LQoVO5wFA0LrbsiNGI+ZLW82QGboPIGk5FD/P/XzmrX
	 g/XiIhDiz/ZcJ/zw05g607Sd4/OjHSysJjnBmU7PjeZzz9uKv5pJU0FxfFc1dk9VqTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7RbsrJbC+78XvE/Jv08a1o71KMq3rArHAmE6ml/65NA=;
	b=L7vsqvlwEEJQABw2mPt8xg8HFT0/ltFKNCA9MAiZf7NcdutMRm10FrRZhl/PAbOPAN80
	 Ph+po3FSmBm1VoJy5Wdij7O3kUI7lrZUwSjVmG+xTSDDdmtKK0452tcx81dFbMK3bg3FB
	 +O1AL77TbbrFNA7uWxbJOt5DnZ8LiNaUiIJqv0zommMpbpy8HNowj2VTd3afk+/HKWUq2
	 vbPvyG5f08aMSV1TC6vLGyJ+JYE8pP5M4zDhAKWGMl8cvs4RGR/mNgAp3RusakaQXiIQs
	 NJJ5JFGPpsDw51A14+WcdAHuYnn24IWwS9HRZNthwRLuLrVvcQhemzRBXbp2ONJ7ELg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I5Cs8nr7;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52813606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52813606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I5Cs8nr7
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e20edd106so2729829f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657795; x=1794262595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7RbsrJbC+78XvE/Jv08a1o71KMq3rArHAmE6ml/65NA=;
        b=I5Cs8nr7qtS5Gn4X5tF2GZWTgK0D00M6Sny6nh1ntLNXKZaQ9j4gG38aI7jVPk9l6A
         TT37nNYREAzpwOTqf2xgcB8w9slpGhfDQNhQzWFHt7CwNqMBsAkttf7wrcJIcs+nB4Fz
         MapwBIupvOlJ4atQBMYC/BrGDfpHVVjKmjJt9q2Qabz6dUC9JLvtvcDhC57+0BSVfsNL
         i4ifp14dOU98shscDtw9/LL0Hpalhx0FN0itaBQUalqYeAobdy39dRSBJRpTUp5Pl6R8
         W4SSU6Ua/ciYxrEd8WNp90hxChsEH3Qb2ytlchYf8m4bqohNdjGabk87E1cW02DS6qcD
         e7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657795; x=1794262595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RbsrJbC+78XvE/Jv08a1o71KMq3rArHAmE6ml/65NA=;
        b=T6kotF5yzH1QEQLAxVNgAjV/g3I6yCsRUrx516drvxXoqQ/LhqO/0i4E9a0s4fxFLO
         +0/6Om0gFP3BtytL1o4Vm958rEOB8h//0AaFiBl0uAJF3sdfuz6xg0qEcULKFEGzEPE4
         oyHwge0GvoBd0Nm/fEORJueF9nT7j7cwvrqB2BXM1J0CqxpLfSwYMYEbt0lUx5vLL+kQ
         v3A+BkXiUE18K96XIq1qsol41TM3y8G+kC7e44lE4ZVAEpFobXweUENO7Bl89Lqt+t8B
         gTDKBa8YPCad9BmFpywcPI8h2JCWQSrArsFmzoj+JZMuMTb6e1aEtwmPJaOrjAkC+vF1
         fhgQ==
X-Gm-Message-State: APuU4Z85EmlSoNgzrLuUdhxY7FWzWBkkvuoQO+9gzcHCQi3xyg+/XhgN
	/ADN9k8I8cEHKe4JmphedMdEiP4duZK+fdyqouEWFUoONKhwA/ZEOyLUKurr
X-Gm-Gg: AYBFou1VOFRM8J0zP6cyJF/TwRSrv0HJhvcTnN2RoE3OUL20wDxSB++7KmNYPJDchpo
	adcOEmiu/Dzqjha+Hu06pmfulNLeb7CMwrJBtZ12X5DAAMhWg0sqCA2Z1Ti+bIYABbgr4igMEER
	srzi2kyABJap63RDU19gAOnhWc7bVSYOn6SUaGee2L2QBgmWXEYF+KSAMMNqICISGKBbC4Ao73E
	bCqam3ls5OzJwuNDiwL02tAgm+uzgWKmSvYT5RePlQtoXEuEM86QnBnuH3Xku5XCrgNW9cf6aEN
	5FIQe4dZxXXEkYTHQ2lAjkzfdz8dI+5COMyyI/ZfI5/LkZi0r87YsckCYyZ4ehVpnM9BMkCmPKI
	OXZqprjqj7wbDphwq4idPkEARay2nsWRv2Q8E3ZexcC1KpBPlaQPAtL7Kc+g5h4ctBXq2SDAw77
	NjkFh3pLYgGAdzTBNPlspR84xf5GIW+wRzxDBe/xxKQnKtADVfyWp1TrhWhzYoZvugH2j9y9W/s
	TiIDjn881tZixhc/uQ8t9MD7Oi8Upu49h2467KoFWNO9YqN2Q6FVqpXvzlVkT6uQvoNL0fQl0KG
	kwh5RuIlQdM=
X-Received: by 2002:a5d:64c4:0:b0:48b:9ed:b81f with SMTP id ffacd0b85a97d-48e6e2e768fmr26733322f8f.10.1793657794653;
        Mon, 02 Nov 2026 14:16:34 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e77409821sm17917202f8f.0.2026.11.02.14.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:16:34 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH wireless] wifi: libertas_tf: use timer_delete_sync() in lbtf_remove_card()
Date: Mon,  2 Nov 2026 22:16:33 +0000
Message-ID: <20261102221633.3483437-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

lbtf_remove_card() uses timer_delete() for the command_timer.
timer_delete() only dequeues a pending timer without waiting for a
currently executing callback to finish.  If command_timer_fn() is
running on another CPU during card removal, it accesses priv->cur_cmd
and queues work on lbtf_wq while lbtf_remove_card() proceeds to free
the adapter, leading to a stale reference.

A prior fix addressed the same timer access issue in
lbtf_free_adapter() but missed the call in lbtf_remove_card().
Use timer_delete_sync() here
as well to ensure any in-progress timer callback completes before
proceeding with device teardown.

Fixes: 06b16ae53192 ("libertas_tf: main.c, data paths and mac80211 handlers")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/marvell/libertas_tf/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/libertas_tf/main.c b/drivers/net/wireless/marvell/libertas_tf/main.c
index 411f075b6186a..f518ed48523e7 100644
--- a/drivers/net/wireless/marvell/libertas_tf/main.c
+++ b/drivers/net/wireless/marvell/libertas_tf/main.c
@@ -642,7 +642,7 @@ int lbtf_remove_card(struct lbtf_private *priv)
 	lbtf_deb_enter(LBTF_DEB_MAIN);
 
 	priv->surpriseremoved = 1;
-	timer_delete(&priv->command_timer);
+	timer_delete_sync(&priv->command_timer);
 	lbtf_free_adapter(priv);
 	priv->hw = NULL;
 	ieee80211_unregister_hw(hw);
-- 
2.47.3

