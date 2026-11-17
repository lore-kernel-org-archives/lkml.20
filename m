Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927278;
	b=zLHCEL3Y3EqVAkhsXLrYcSrCKFmuPdHJWG1RLzRpWRrJKKLqsQH1H9SfzJrhA7sNL61e
	 0hX/OSBq2RT7UU+fq/Eu3oS1a753jIg6/RWrvPEeciixJ1YpmKd1PAvWUvOC92ro+3uC8
	 Q5+sUw3nIxWc0gcoRs/ZGslAh1eXCHmWIB3UqZ2t6sJ3Je9K02ffFA/VnSrxCbIS+dnMs
	 0HbgJ4DBn6kiol+9Hsvh/NUfSppb5jdsVSFv0cZ6AKkUMbKq8hJvHLkjWY0MXbHbiYj4F
	 uvQXkVzP4UfbDKWSn6F1cBW5N8yFJVFpayXeOSgxN5/iNYf8t0rnlOblPSzYkroil8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IP0GW2wit1DG5jrtVXntkzGkK3XObCmCGO6fI5J3Kv0=;
	b=Ae6HeyUMlembCYu8ahdeXU8xKU1vZSq1/+STkIcZdjrimXbSQS5M9KpQ1/EJbFGuL3wM
	 ZuAqGxLN96cCOhogG4W8OFZJygYS4rds36yAAtzPc+X6SMd+/mcv8oyIdzeUWm6f5GTC1
	 xpVlf1ZuDX37Mvaf7rSg1vRV7gks1MiXhvprVnQyKJg5iPRkyRA6paAYXX2hi7Uz4NmZ4
	 E48um6qHZNiAanQUefa7u/Nb9VdBb9A3bO3tXm3Vz+NlyJkxwejOuuMwmDolhKJgbgT53
	 nk1QgwbfzeWMLyh7EosKaxKwBHRnz7mCllHpff05v/Vwr1KSc0GRs0JIfT2dQO148fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hRQwcyj2;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A8E606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2A8E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hRQwcyj2
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06e79e152so2405374b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794927277; x=1795532077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IP0GW2wit1DG5jrtVXntkzGkK3XObCmCGO6fI5J3Kv0=;
        b=hRQwcyj2v1rQpVKBYfY/y/BWv/PI6B8tEiCv1+Wjf2Z1fWLdQmPwXREO6K3AaoYMLu
         drOxsG6bVfatEdY+WL6yX+tUPvawfhoPyGkELPNGE623C/i6W6h5T1tBF3W6sKzrc/jN
         SvXZasm/pJBI6kzZu11rHTxVVrrDAnkxo0ipYXragZVr9WjUHaYItZ9/z4ngE8zr1pKT
         z/PEqeowdcTicOJkuEA3Xq0sp1CnVgNwfOWQaOgP2tpp94/jB4id+GaiSqN7j6a1TIVe
         TepTCzMpt7DoIq2B5ck5f9S/xxjvlAV+b/ItqD1Me1wZdtZgquWf4bB6pWpFnKG7efcD
         r7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927277; x=1795532077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IP0GW2wit1DG5jrtVXntkzGkK3XObCmCGO6fI5J3Kv0=;
        b=M2xwGHe4vy4vlimcxprlCRlDBzCXoGGLMTbGe7xuOqPtq6f6ow6rNUKxt2ch6YY1iA
         vijDQaPE2xntElrM0vBuf6vKoHAICaPphpBKSny74vzuESPp1dXvy+duSPX9+9JxU0rE
         TsxHYmymwPzQUWhhfJ790LggreiMEYPknJ8605+WieB0Bk7mXs0/CdkGXLtQf3uiJUjn
         INqUwQTTTfT7medjaf4xJH83OSHg8nWqKwyfxlOm38zYPKk25bJ1DEHqsHPPS1VpFTGT
         gxciroBYOnd3vNoXR5crzoRbrTDhsEDMIKgGOA/FZdmOWH7aNlajD57hjAWFk29JOkFi
         eMyQ==
X-Forwarded-Encrypted: i=1; AL+hErFewsbEThaf7FXi+YRWKqr3x6uHX9+arx9PMN6EUivHw8iW/VCZxgKfhQJJELsA2fPz2nPnO64mNzBDEiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fbQqXvZ3b/THH7spEwqwD/PKpx7Itc7oa8xIVkN129y3vXj2d
	YMM5RqYQglUzfXmbRzwy49Sxa5qgdfDTKD7uA9q+2LZ9FMj40YPc40YE
X-Gm-Gg: AYBFou1oTbfQTcJ3Vlw6l0uU7euDk+hGSA7kOL9SWsIAAxt6EgdlwKY+VZT+3ROow2t
	IY3tpAysCowwfnJk9EDUU80I3B2sJsuN4IBWtT9tMFao5ePDtUjTASuxzfSqZhCtBLiYEe8pls8
	YPTXDDnsDLAfPpGrMd1/yj3h7FYFqFAcQMyoEMWiwep1JIIbFLuy/AoRUCKG6pprhE4u3/eCEcr
	sqGcOXkEqHUTCOoDqtKIHgI1k4BBz9wFUmwiznWKO6jxmk4VU//hzSEN0iIfQotKVOY8fWW53ny
	PuJcxkW/noV51XpZr32fAFZfJE8ULhlFnmFRQo8mmOqlP3aDVzGidGONZ0zPQs6+h1KjO33XyVB
	oq1UgEG8XSCme81zJ9XaLyGVoWFxMkSF6Bfn60IHGcJrfwkNcTghV9O44udXgap/b6nSeU0jjLJ
	J5VpBGD8J0yIfythfGDPCD9FNgj1p5lu9zCY1GtnIs97/JSbAMHBgtiT0iLSoEigpsy3tQoKNrr
	GexLGd7Id4Wl6kp5GNfIji6kh95uudKkNrBVHZ0zkfufRj5M9+Yjnd2A+kqrWXtuJ3NcJv7Jlma
	QH9WMHF952z2bwcptFQGVL9oN3V5akfctZdO6sZICjqDeXKOCcLV1NqF1Kd87cGyVjpuauZOqhI
	IeLs0Na7NJKb9qIfW9M0gWcXnXtdhDnMm1WQe/BSehw==
X-Received: by 2002:a05:6a20:4127:b0:3f9:357c:bb82 with SMTP id adf61e73a8af0-3f9357cf962mr5712893637.52.1794927277048;
        Tue, 17 Nov 2026 06:54:37 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm5270513b3a.13.2026.11.17.06.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:54:36 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath12k: hold dp_lock when updating monitor user stats
Date: Tue, 17 Nov 2026 22:54:31 +0800
Message-Id: <20261117145431.1092736-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

ath12k_dp_mon_rx_update_user_stats() looks the peer up with
ath12k_dp_link_peer_find_by_ast(), which walks dp->peers and asserts
dp->dp_lock, but the monitor NAPI path only holds rcu_read_lock().

Peers are not RCU freed.  ath12k_dp_link_peer_unmap_event() takes
dp->dp_lock and calls ath12k_dp_link_peer_free(), which does list_del()
followed by kfree(peer->peer_stats.rx_stats) and kfree(peer), so an
unmap arriving between the lookup and the use of peer or rx_stats frees
the objects the monitor path is still writing to.  The lookup itself
walks a list that the same path can be unlinking from.

Take dp_lock around the lookup and the statistics update.  The update
only performs arithmetic on the peer, so nothing that can sleep ends up
under the lock.

The affected code is present in v7.0 and later trees.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Prepared against v7.4-rc1-1969-g666539eecdf4.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.

Testing: compile tested only (x86_64, gcc 11.4).  No ath12k hardware
was available.  The affected code is present in v7.0 and later
trees; v6.18 and earlier do not have dp_peer.c.

Locking: the monitor call chain holds no other lock at this point
(ath12k_dp_mon_rx_process_ulofdma() and the rate-table helper take
none, and the monitor paths never take ab->base_lock), and dp_lock is
not held by any caller, so the added lock introduces no inversion.

No Fixes: tag is given because the introducing commit lies outside the
fetched history of this tree; the code has been present since v7.0.
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index ae14e118fe36..edf7a8142998 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -955,9 +955,12 @@ ath12k_dp_mon_rx_update_user_stats(struct ath12k_base *ab,
 	if (user_stats->ast_index == 0 || user_stats->ast_index == 0xFFFF)
 		return;
 
+	spin_lock_bh(&dp->dp_lock);
+
 	peer = ath12k_dp_link_peer_find_by_ast(dp, user_stats->ast_index);
 
 	if (!peer) {
+		spin_unlock_bh(&dp->dp_lock);
 		ath12k_warn(ab, "peer ast idx %d can't be found\n",
 			    user_stats->ast_index);
 		return;
@@ -966,8 +969,10 @@ ath12k_dp_mon_rx_update_user_stats(struct ath12k_base *ab,
 	peer->rssi_comb = ppdu_info->rssi_comb;
 	ewma_avg_rssi_add(&peer->avg_rssi, ppdu_info->rssi_comb);
 	rx_stats = peer->peer_stats.rx_stats;
-	if (!rx_stats)
+	if (!rx_stats) {
+		spin_unlock_bh(&dp->dp_lock);
 		return;
+	}
 
 	num_msdu = user_stats->tcp_msdu_count + user_stats->tcp_ack_msdu_count +
 		   user_stats->udp_msdu_count + user_stats->other_msdu_count;
@@ -1038,6 +1043,8 @@ ath12k_dp_mon_rx_update_user_stats(struct ath12k_base *ab,
 
 	ath12k_dp_mon_rx_update_peer_rate_table_stats(rx_stats, ppdu_info,
 						      user_stats, num_msdu);
+
+	spin_unlock_bh(&dp->dp_lock);
 }
 
 void
-- 
2.34.1

