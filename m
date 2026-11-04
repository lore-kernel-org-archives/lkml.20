Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796639;
	b=BY6CulKP3b57lv9GJ85HIND9CcoTyY3GjOyisRiGlpmEch+y4C1lGVipbq+ED/PRKV+5
	 NLnM08OpYiEmeptd3sSCVsNkpOxkOuLZkps14yvIsf4FbrTSy2LWGaoe6v7/sJIHeAomh
	 jN/XPII24tTnwihNgvtRX1ZyTo/CAnKujT8CUf3fZvL4D9WBtvlm9oUqvV5O2weomieFs
	 jLW5mzk6BGfOO3hoE/qJVnWufJ7x+ILeCdKhQ9Fs4Rl6SSDOlZBV34meKKL9t9ytXHcmO
	 Z+qEgng9JewOCkNUCLHs8c67Tysf9lpWrS9F0gXcs4T2hwKGnhoAug/rkpMiYn2oWaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=95uUhBzkqd0S8bWXX7KO834Szjb+muDQfNOhhj7jIow=;
	b=daloDvfzLQDOtfvRuYQ3q9slwIYnJB0GVQpvACSSM7DuRWYIYk4rOt9sPrT1JoKhx26m
	 NWzY0iSQrNE9QWZjL1p9cFa7P6i6C3DtIulMemUlrXZV3+9SeCx9r+tXhd11fuBFG6UQh
	 IALkAncbcOrQgCPLziCkRI23i62HL7T/jrFKv6qdd94TBDThyObYsGsAnn+XQYOv//zuc
	 TMddjbAib1yu2dn81cnwyfA8BFDng2ZigKyh5t0CEzr6wxVpI/FNhIx08mYficunWQQaJ
	 Z8tM48na5mnGqbTMARa3tCgzZ+2BQ0axGdkH5NlkEStmvUDJ5SSyDKjX5byzh1qYmXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fAdKpRUx;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1EC606EE92
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC1EC606EE92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fAdKpRUx
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso385231a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796638; x=1794401438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=95uUhBzkqd0S8bWXX7KO834Szjb+muDQfNOhhj7jIow=;
        b=fAdKpRUxKStysxPnpUIHCeyiig49fpzNwF7202kjPedgIcDM/n1Nof2uEJIKtXs7pk
         WDV4Vzao0Wqu+859UNCpCp6MYTE1pqqyu3mPwoxJHi2kidzRNmomU6iIY7pv+9sRipeQ
         KiVV+q+9AhKrxuAHDT4jjjt0IhyCz6N8cc+jPMzLzi78/I+dzCVz7l//1KvsVYcJkNMc
         JZ2nuhpFWpSwaiQ0uj2Dxh13SGN0e8AvisGku81LFg950nbaiutHnpqL1ZGar1Q7Fqdv
         v9kfNnmRO90+N/GY6UlwVUDxLT/LKKzqpGDtNcUbyqZk+/2SzCB1F9zsoHkaoRgbKDKB
         W1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796638; x=1794401438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=95uUhBzkqd0S8bWXX7KO834Szjb+muDQfNOhhj7jIow=;
        b=QSr4hai+JQMR2lrPm6ErvWmQUOZrY1AdarjYytNYJkoXdi0MPXQauFOdIf5y/8FcJO
         wlG1lJb035ziE5raGpyhb7okyz8821J991dg3w2ItztHXEs/qIS8oo34Yt01yAze3hvr
         U6QAaSPykXWfAsNEjhSdi7Fcl0auja8RLO7aitEM6zgm5clYGV3e74oMNrLmSxggyLKY
         vPJi58W1kWH2LFEFznqms22+24D4iphIuQFn28wEucAs1ji2e+GlP5Gbt6LSQbmGfybZ
         3ztztzlx5/Gbfob7i4X4+AZy+v646BUmASm3CwZbwBGGkj5oACE8kg4miAp3u5Wc8Rkw
         AlrA==
X-Forwarded-Encrypted: i=1; AKwUvBwYihkhOYhOsUpchXTQJju6D01jlGGmY3Ol/9U6tGY56SUnuKErDTFtvUo3p8ZOHxjl+gY90xK246G8g6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MzIrulQTomVnDaXLrHT9CV4XcgmO/afO/eKY9vUQEKtOnbsjA
	9u90/kE+mszr25ahydcWQvARUV7KzgrjQw6Yyvu50sKBOihzRdGyoo+4
X-Gm-Gg: AYBFou1JdaliEiUVo2iHQUsSaup6Zvz9FuYxjaV7ukIICY3xvnNeW1ASiirN98LgNd+
	cwNHcT/CEbbxnOuP3R3Tc5AzcgNnF1BHUYBKQXQoaFPJbfQsU09K5XfV8muxICQSwKdTcvEkYCe
	RHUpcZIaTu9Xq/0fVANxv+fikJtRfdFgovY9g9Tdf3X3mLYpCtNomVy8hdLEx8/ejNvM5lGzFlO
	Vc+zYcGMsuXUqNpYAG59K6z7n6gaxyanvN9KHTeqPMLgI617ORXB61sedPMF6iOuB0eG6cggIwa
	3lefXYa6lzbkyR1S6+/PxetAIgtISJhRE4ESITR4qCp5dDoShveR21ALTZYjXso1FSfiDQYEyMN
	Zmn8Buur9K13eybu3L5eTdJi7Kfl2VnwWHe5eM7482UlGSViF/4OKEvAAYIjR0ricwJJy9F6wpc
	+gxk8lb28PxFgWn6teyL4g+v6SsX48O3a2rfDJEN0B6qxzE6p2yq6ztcDLWdh3S5l3c81qUSX38
	SwduHPQwvdlOWOqlVKR5npcMMw6asBzzjd7h803CHsxa/+F8H7yT6dd4bK1TGEiCJUGjId7bciu
	4tFdNdCqIK01GtlZLvS4Sbh3MXRy2hbbAL+dw4MfZkYVf1ShOw==
X-Received: by 2002:a17:90b:4c52:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3ae897ccbfdmr13704451a91.11.1793796638093;
        Wed, 04 Nov 2026 04:50:38 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09449bff2sm3920799a91.9.2026.11.04.04.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:50:37 -0800 (PST)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	o.rempel@pengutronix.de,
	wojciech.drewek@intel.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v9 0/3] net: stmmac: dwxgmac2: timestamp interrupt support + Agilex5 fix
Date: Wed,  4 Nov 2026 20:50:27 +0800
Message-Id: <20261104125030.1183146-1-zxyan0222@gmail.com>
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

This series adds auxiliary snapshot (EXTTS) interrupt support to
DWXGMAC2/DWXLGMAC2, fixes a stale TSIS race on the Agilex5
cross-timestamp path that the new handler would otherwise expose, and
guards the shared aux snapshot handler against a zero channel mask.

Patch 1 makes smtg_crosststamp() complete on the persistent ATSNS
count instead of the transient TSIS bit, waits for the FIFO clear to
complete, and holds aux_ts_lock across the whole trigger/poll/drain
sequence so a concurrent EXTTS request cannot flush the snapshot FIFO
mid-flight.

Patch 2 guards the shared aux snapshot handler against a zero channel
mask: ilog2() is applied to the mask without a zero check, and
ilog2(0) yields an out-of-range event index that ptp_clock_event()
feeds to test_bit() unchecked from hard IRQ context.

Patch 3 adds a dedicated DWXGMAC2 timestamp interrupt handler.  The
XGMAC hwif entries used the generic ops, whose callback read the wrong
register and whose enable mask omitted the timestamp interrupt, so the
clock advertised the aux snapshot channels but no event was ever
delivered.  XGMAC_TSIE is not enabled by default; it is armed on demand
from the EXTTS enable/disable path through a new callback, and the
handler only touches the FIFO while the interrupt is armed and while no
cross-timestamp owns it.  The interrupt is disarmed on suspend and
unregister and re-armed on resume.

---

v1: https://lore.kernel.org/netdev/20260806-dwxgmac2-timestamp-irq-v1-1-c051c79c9d90@gmail.com/
v2: https://lore.kernel.org/netdev/20260810100221.9166-1-zxyan0222@gmail.com/
v3: https://lore.kernel.org/netdev/20260818132722.1852876-1-zxyan0222@gmail.com/
v4: https://lore.kernel.org/netdev/20260902131441.322167-1-zxyan0222@gmail.com/
v5: https://lore.kernel.org/netdev/20260910081020.86227-1-zxyan0222@gmail.com/
v6: https://lore.kernel.org/netdev/20260929073553.4136336-1-zxyan0222@gmail.com/
v7: https://lore.kernel.org/netdev/20261004120526.2728564-1-zxyan0222@gmail.com/
v8: https://lore.kernel.org/netdev/20261013033207.1684328-1-zxyan0222@gmail.com/

v9:
- Check the already-enabled channel from the live PTP_ACR mask before
  programming it, so an enable for a channel other than the armed one
  is rejected with -EBUSY while a disable for a channel other than the
  armed one stays a no-op, and re-enabling the armed channel stays
  idempotent, disarming and draining the interrupt across the FIFO
  clear like a first enable.  Requests are also refused while an
  internal cross-timestamp owns the FIFO.
- Move the smtg_crosststamp() EXTTS check under aux_ts_lock so it
  cannot race a concurrent enable, and hold the lock across the SMTG
  register reads so a concurrent PTP_SYS_OFFSET_PRECISE cannot
  retrigger the snapshot while they run.
- Hold aux_ts_lock across the whole of intel_crosststamp() as well,
  refuse to run once the clock has been invalidated by unregister,
  handle an interrupted wait, and disarm the internal snapshot trigger
  in both cross-timestamp paths on the way out, including the error
  paths.  Drop the recorded EXTTS channel in the resume-failure
  teardown and at PTP clock unregister, on every core, disarming
  PTP_ACR or PTP_TCR as the core requires, so a leftover or re-armed
  trigger bit cannot reject later requests.

-- 
2.43.0

