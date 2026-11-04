Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793769914;
	b=YGWaD7fPOCmk/N0f/wQChrFJg59xhKs27RpYhmKwpML1ehiISo9eErGXkmmGQbQueWKx
	 53z8/cIOfj2DrN3RVDawye6GIaWuBrP0tubN/mkg8+xMnyH4bQbRwztq6BMgKQaCll8Qg
	 tocNn6Rg/RjoR1XkZpr6h2mZQ4qdSIfpi+yPtRCgBovcCYsNQBJ4Ge78SH2G2uDmxqErc
	 EZK8kZXPnZGOQUHq1dV3Hwo+i2QHTfu5LmhJXq6YOcw9oJRdEleuBIL7/9zBTjLlIbQgP
	 e4PNWVhkaRJm35hzHTtDXXnoOi0gktwkc5SuU1yk7BERO+AvqhfHIpdEXxX+6/EJYDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793769914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LOG7AOmS6IRRfgPKSJTi33/lfhAOaV7O3VJZu3BP5NY=;
	b=IRbGNXW27ai4dLmOklZ3LMdEdf0jbVRUo6RiOTIoRHVHA5MGs4YZjnTM29yWrldUuzyQ
	 2cNCcmmzFrWCF2V/cg3I1UN023RupCgplglEV+jSMj+Iy0Kp2RTsLsRc1DYzi78MimhHu
	 Kbu2L3BO1iF6u7CnIbG8sqN1eshgKo/5pNO/mlX7U3EfpbSpz8eS4TpCDUv/ZLzlovuqS
	 2tOtawmwbhQPLIGsfq6+cqGz1PE2VODVJUQaRhvGMBQxuSD08S5MvVksL9QbtuZVHRepk
	 nfQgUPKK3s8qsiOJ+JIcThyOgOIXt0JMbphzfgL88yLRrcJLrlG/Fssy6IW7TdbQJBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nitJ5qF+;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2EC606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E2EC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nitJ5qF+
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3514b90bb89so591504eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793769912; x=1794374712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LOG7AOmS6IRRfgPKSJTi33/lfhAOaV7O3VJZu3BP5NY=;
        b=nitJ5qF+g9pmuZqnfV6g0OB2usPhDHrYEncfSFTxZEDjIH1OwBIA3zox7IJFPp06xQ
         K40SE3iJq/v5lK77yc3wmc/H2K16h3UBaGoBS/BQR8tzXfNIu6//GCQHf1EnYCbZ+ywt
         miFb3XK1cclhKOn9uTeLPEpbQZQVmJ+Fgf10SMwBwim3ydvAujDiNXmmRufW9mEm5XZW
         SloOfOTgz8ZM3sfAxIDFP8cxjHM8mWCme4zti/cz7dAjWhAsxuYVrh9GFTU67ZFy0FHI
         ef/0aXDV7erBBR5vnomigRcB9xehqpQUKofRsctxlcIdPI88tpOPOcWYgtA96F3U/iER
         ivFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793769912; x=1794374712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOG7AOmS6IRRfgPKSJTi33/lfhAOaV7O3VJZu3BP5NY=;
        b=OPhV53YpoeOF5dgsP+S7YW2eMnfr7xSRW13+vRoSgMC23HEL78EgA7vl3Ns6yIvZ3G
         DOVHR6UoIbQA/xoSVw0moytEqykoPNcVA3NkCohaOTHpxlxOY6e0lEkPAgAQL+1LAzEF
         7zW921PRMea7Nuzi1l3hl8r4QzLelvQPmaDoXJyf0LR5xTqmRoRgPuYDCNjYOZZjuQ4d
         8Pw3jSwmZy3kTSqzkDV/WlrW266dyjq6O34LzpdtRErr9MVTKh0OKa3JXk5MINkYJeAC
         VqSgsyrDj+fEwCiTAPo1TSznkZG1MK+qwFtiwIiFZDOAr40Bo3pzY7yNK+ZPFWm0EbtN
         ZkLQ==
X-Forwarded-Encrypted: i=1; AKwUvByBmZEPx/tqCmXsJc5w5QA/m4NS/bYywPOS6ku+N2vnOL76DW7h9Wip3N/vEwLM8aDHLfgZyY87aJ47OVU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jOvR6ZS5a1zUXYhp+3oGaznI2pcYmZ/rBVOj+5VyBDjWuMyG1
	9PnHiMi1K/JaT2hUZ2GCZSrXZWLDn8Rw14DSZdkEmYo/1acccg6m81FYgenvkWzU4Q==
X-Gm-Gg: AYBFou0RdAUI/C0s9f/ByLmhVyQCOmaSPOU/qIGBSBHHQr9zYvprUzwKjRSbJ2WEVCj
	wHTchiOjTkT1TMSlAyta1+EIi65l26eLEzjVPKNu5f/i7/KxkUzjHxklBcKUxPil0g061L8Ic3s
	Yxw8LcIXcpcgjbLh/o9srWX+wU9PVBcFiw4GuaJCBrl9bUr79FKV5O4HAbbY4V3Y2j37oWbaPFQ
	UTYHKoEmO8CjLeJARmvmID47rCSxmKlOWzUnewfJchQwBpnqzw8KFSVyPRxJrgDsKGipBf1RZs8
	T5QagycpOjIynoONgmOHkD7H4LIEfK7kgsB43Lvn8+V9wEuziGURUu2Voy7u9TL+1GVWearYFju
	J+EBqXx+791TiM31WekyhrJhJgv6NF3uY0/qofeUeblIhRoce5JNSgoCqnXGRWAh2Pa/m5wmZnD
	WT1g/XxOedJ5TITPYICregHL8jJ8axTZmQs6NAIwOrbFvv/tVO/TZmvhZQBNcrPdgKPd5uo66Sc
	3OOJnvVjZjejv20PXdYEvxlsbZUOlGxfZV+Wc9bJC69aTMCfEdkmDdWW5FZg/xRRr+F+uqsxHgM
	pbMLtfTxi4yvDrE6y9w5u1czYlwu9shKb5Zv0B7B8tg0haxFp9mMgxb9pgBHYZO55qj7G9NbNpR
	thdYh6V8y9/TZ9A+z8w==
X-Received: by 2002:a05:7301:4242:b0:358:dfed:d0fe with SMTP id 5a478bee46e88-36a42219d4fmr21775375eec.5.1793769912239;
        Tue, 03 Nov 2026 21:25:12 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39c5f0csm3405176eec.29.2026.11.03.21.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:25:10 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: stmmac: ptp: fix support for PTP_EXTTS_REQUEST2 ioctl
Date: Wed,  4 Nov 2026 12:25:04 +0700
Message-ID: <20261104052504.1886335-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
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

Commit 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags to
ptp_clock_info") modified the PTP core to validate the supported flags
of external timestamp requests, rather than relying on each driver to
check them.

stmmac_enable() and dwmac1000_ptp_enable() ignore the flags, and
neither stmmac_ptp_clock_ops nor dwmac1000_ptp_clock_ops was given any
.supported_extts_flags. Since PTP_EXTTS_REQUEST2 always implies
PTP_STRICT_FLAGS, the core now rejects every PTP_EXTTS_REQUEST2 for
this driver with -EOPNOTSUPP, where before that commit the same
requests succeeded. Only the PTP_EXTTS_REQUEST ioctl still works.

Tests on an NXP i.MX 8M Plus (FRDM-IMX8MPLUS, GMAC 5.10a) show that the
auxiliary snapshot inputs timestamp just the rising edge. The reference
manuals for the STM32MP13 (GMAC 4.20a) and the Cyclone V HPS (GMAC
3.70a, which uses dwmac1000_ptp_clock_ops) say the same.

Encode this in .supported_extts_flags. A PTP_EXTTS_REQUEST2 for the
rising edge then succeeds, and one for the falling edge or for both
edges fails with -EOPNOTSUPP.

Fixes: 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags to ptp_clock_info")
Cc: stable@vger.kernel.org
Signed-off-by: James Clark <jjc@jclark.com>
---
I used an LLM coding assistant to help prepare this patch.

 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index a37405534beb..31a66e855d6b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -277,6 +277,7 @@ const struct ptp_clock_info stmmac_ptp_clock_ops = {
 	.n_per_out = 0, /* will be overwritten in stmmac_ptp_register */
 	.n_pins = 0,
 	.pps = 0,
+	.supported_extts_flags = PTP_RISING_EDGE | PTP_STRICT_FLAGS,
 	.adjfine = stmmac_adjust_freq,
 	.adjtime = stmmac_adjust_time,
 	.gettimex64 = stmmac_get_timex,
@@ -294,6 +295,7 @@ const struct ptp_clock_info dwmac1000_ptp_clock_ops = {
 	.n_per_out = 0,
 	.n_pins = 0,
 	.pps = 0,
+	.supported_extts_flags = PTP_RISING_EDGE | PTP_STRICT_FLAGS,
 	.adjfine = stmmac_adjust_freq,
 	.adjtime = stmmac_adjust_time,
 	.gettimex64 = stmmac_get_timex,
-- 
2.56.0

