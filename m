Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BA251DE02
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066753; cv=none; b=A2QKNmvAAr3pKM5HQQu65NL/9D5l/ZSXBLO9lwO+/wb3LK6HhoVEpYqE0EDxeL/fh6ClOPJyp6IdO5gXHiDmpyAE2PYqcpFjuMCKDPpS4Hvst37HXWe3KPav8KWoRJZ4ftotQYKQonrcUR+NAHqR9a3b8yhu/bmheK+Owu1/xO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066753; c=relaxed/simple;
	bh=j4e5CMHH6Qy3yGv7hPDaN6nbYX4fg3B648nSU610qaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TSfLY+5r7ecqSeH0aP357Dr9Pzj476QPvg/Ahd2JBIanAdkbXX/aWdmJEbKnRP1VKf4sse9SCchmffOMG3bi8PKXajJaNXu6RhV1Io3xkWRE53Dh2CYDitv+UJaJBXEr5/waeCyZ5D0leAf6zhqy8dPMhuPfEmCTpzcn/swDXDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=InWddhV1; arc=none smtp.client-ip=209.85.215.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="InWddhV1"
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso2146803a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066750; x=1792671550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pAA3M36W1ZDabCba0TYx3EwBtZTYKmGhEXj5INi2E/M=;
        b=Abj0sUggoJEFcEIxM7EMPlX/Cua9TVPGXQ2Dv3Q+rC5uRoRmcpAz6Ntn/hzAqB/Avo
         yWlIsBEfdCYjbb9GfF7cUBAsT4uwBHLH8aK0/RSlDoJjBwDnK7ujtgvC7GWSETAHRAyQ
         nQbicveMGv5WxCu8RmDMc1xiWU8AKVBmA3lAEp1SPRu6HicBDCGUakzwissUeR2N0U02
         MvO3ToZ8gILs/4cBBW0PzY7+SVN2UZbN0pmuw61N2hNCU5xvgSnCGKqVCxheXIrCvdwl
         xhUr5ZO0OEoCK/dBfCv+5g+5A3BN+Pynx2ujLnp9XwtvsrupiV+zD+dRa1HRXM1uMBvw
         GewQ==
X-Forwarded-Encrypted: i=1; AKwUvBwr7qyYHAhl+M1kZNBT/ZGZ0ZW8zHLcpliLN6lk89HAJTOl71kXl+YLRntSRTDab10vr40kGhqZiTGZAhI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6TnTtxRBlgOat8+2W3il6S7Emg8e0hHh6uc7cPA/pz8PEyPPg
	miC+WPSaVFDvsSxNkOrt+kxoLqm+hVblnjZJb5OPTEB3bqzK9WUdALc+ig3i6Mf0rU/J4eqpELP
	pRqj89EzFA3x2jxb3bhse0Wtcl9U26pUmJ6FOYkBq0rwlPf+tbIcJoIVKqgXRXO+JkW37ZlyFzy
	L7l8CigsANWFErCV4m+thDKQ7by8HUdz8Q5kbdi3Knfo/VeDaMHqeHT5FQNsYpp29bNJvQFyVwq
	UBN8+2GtgCxrHYGEw==
X-Gm-Gg: AYBFou3sf69KWj6kvte8vUYFWx7wuUMN6yEfRtlGbxes4idoooFhWjfYLoSJPHo2MJD
	udk2FLsDAS93ztzFnO6x+XTEWOiBv+tzxwum7ScoowqYSPuMe3HY138q6q0zKAp24usq8a7vwT/
	rBOpGpCnfsS01js8D0c/fRoV+TkOqrhF4XX7R4tCQ+nA7FOdjI9rXH2gWPlVSwfnQzUT8bQs9s2
	5D/zqPzUW/+aGfCYQcSG3B4dlC3NcHVZALflJEMDW2V4dsjhUKTHKUHtfRoN6v30SIbiXvKP4LO
	3YCT/IGnCdzl+Sp63AsOWetx5IAhOJwxksbCkX3WpCOXh6kgWsKjvFflMJZZB2JyexM0l7G3xu8
	cp2ZSmzBiZcYezAMCUOs7ljpnGgDg0F2gDrePj/baOf5iwYUEHqm7Il8Jh6FG7cTgikjP5+P27k
	hz7CuF6/A080E8r26vhcXMmo8B+5eCsvhXxzd3
X-Received: by 2002:a17:90b:582b:b0:3ac:b3e5:426c with SMTP id 98e67ed59e1d1-3acb3e54553mr335976a91.26.1792066750404;
        Thu, 15 Oct 2026 05:19:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ac947badeasm1606025a91.8.2026.10.15.05.19.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:19:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3580c07911eso13589941eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792066749; x=1792671549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAA3M36W1ZDabCba0TYx3EwBtZTYKmGhEXj5INi2E/M=;
        b=InWddhV1C8z5DLvPa2rmamw/G7qCSjor05YgJ0fr6ij9cNzc2IsRd+9M8lYsYlxUNB
         l+pvFuJgkymWtEwpmD7ta3aZ8TB0zrhStqmRcO++8tCfpZxJlpfMRor8BIVbbfhPgXZq
         tnsamN5kvqXCCkFgH717WM7bQQSUBTlmxVtjk=
X-Forwarded-Encrypted: i=1; AKwUvBziCZLY7NrLi6eCmszLNvrKFMOtv3+bY6Ys0jK1ru6kJvJMACjK3akYTWO/XclNIECjg9aXw6fyPV9ju3c=@vger.kernel.org
X-Received: by 2002:a05:693c:4145:20b0:342:810b:9554 with SMTP id 5a478bee46e88-3537e0f5bb2mr27900510eec.32.1792066748789;
        Thu, 15 Oct 2026 05:19:08 -0700 (PDT)
X-Received: by 2002:a05:693c:4145:20b0:342:810b:9554 with SMTP id 5a478bee46e88-3537e0f5bb2mr27900463eec.32.1792066747974;
        Thu, 15 Oct 2026 05:19:07 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2954bsm64496032eec.26.2026.10.15.05.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:19:07 -0700 (PDT)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net v2 2/2] bnge: fix RSS table sizing for large RX ring counts
Date: Thu, 15 Oct 2026 17:48:47 +0530
Message-ID: <20261015121847.1933308-3-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261015121847.1933308-1-vikas.gupta@broadcom.com>
References: <20261015121847.1933308-1-vikas.gupta@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Dharmender Garg <dharmender.garg@broadcom.com>

bnge_adjust_pow_two() adds one block before rounding up to a power of
two only when the quotient is 0 or 1. A larger quotient that is
already a power of two is returned unchanged, so 129-192 RX rings
get a 128-entry RSS indirection table and 257-320 rings a 256-entry
one. The rings above the table size never receive default RSS traffic.
bnxt_calc_nr_ring_pages() always adds one, which is correct.

Make bnge_adjust_pow_two() always add one block before rounding up.
The same helper also sized the ring pages; to keep the ring size
calculation unchanged, move that to a separate bnge_calc_nr_ring_pages()
helper that retains the original rounding.

Fixes: 627c67f038d2 ("bng_en: Add resource management support")
Signed-off-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Vikas Gupta <vikas.gupta@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge_netdev.c | 10 +++++-----
 drivers/net/ethernet/broadcom/bnge/bnge_resc.h   | 11 +++++++++++
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index a4288f0258f8..ecba8aff3052 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -3339,8 +3339,8 @@ void bnge_set_ring_params(struct bnge_dev *bd)
 		}
 		agg_ring_size = ring_size * agg_factor;
 
-		bn->rx_agg_nr_pages = bnge_adjust_pow_two(agg_ring_size,
-							  RX_DESC_CNT);
+		bn->rx_agg_nr_pages = bnge_calc_nr_ring_pages(agg_ring_size,
+							      RX_DESC_CNT);
 		if (bn->rx_agg_nr_pages > MAX_RX_AGG_PAGES) {
 			u32 tmp = agg_ring_size;
 
@@ -3363,11 +3363,11 @@ void bnge_set_ring_params(struct bnge_dev *bd)
 	bn->rx_buf_use_size = rx_size;
 	bn->rx_buf_size = rx_space;
 
-	bn->rx_nr_pages = bnge_adjust_pow_two(ring_size, RX_DESC_CNT);
+	bn->rx_nr_pages = bnge_calc_nr_ring_pages(ring_size, RX_DESC_CNT);
 	bn->rx_ring_mask = (bn->rx_nr_pages * RX_DESC_CNT) - 1;
 
 	ring_size = bn->tx_ring_size;
-	bn->tx_nr_pages = bnge_adjust_pow_two(ring_size, TX_DESC_CNT);
+	bn->tx_nr_pages = bnge_calc_nr_ring_pages(ring_size, TX_DESC_CNT);
 	bn->tx_ring_mask = (bn->tx_nr_pages * TX_DESC_CNT) - 1;
 
 	max_rx_cmpl = bn->rx_ring_size;
@@ -3377,7 +3377,7 @@ void bnge_set_ring_params(struct bnge_dev *bd)
 	ring_size = max_rx_cmpl * 2 + agg_ring_size + bn->tx_ring_size;
 	bn->cp_ring_size = ring_size;
 
-	bn->cp_nr_pages = bnge_adjust_pow_two(ring_size, CP_DESC_CNT);
+	bn->cp_nr_pages = bnge_calc_nr_ring_pages(ring_size, CP_DESC_CNT);
 	if (bn->cp_nr_pages > MAX_CP_PAGES) {
 		bn->cp_nr_pages = MAX_CP_PAGES;
 		bn->cp_ring_size = MAX_CP_PAGES * CP_DESC_CNT - 1;
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
index b62a634669f6..58462524939f 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
@@ -81,6 +81,17 @@ bnge_adjust_pow_two(u32 total_ent, u16 ent_per_blk)
 {
 	u32 blks = total_ent / ent_per_blk;
 
+	if (!blks)
+		return 1;
+
+	return roundup_pow_of_two(blks + 1);
+}
+
+static inline u32
+bnge_calc_nr_ring_pages(u32 total_ent, u16 ent_per_blk)
+{
+	u32 blks = total_ent / ent_per_blk;
+
 	if (blks == 0 || blks == 1)
 		return ++blks;
 
-- 
2.52.0

