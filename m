Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162728;
	b=QuhDqbb55b7iQ79Dc+ZJi/27sKm4FVrZAFS26aw0g6hXMhEqN5vPgXem09Yf84bhbWzw
	 dOw1YOApIiQfM93TA+G06gMkxGuzjJgWV2XLg1II8EYn2NYUuXysCCcxt05ypMbf72KsU
	 N0jMW14FocHphN4HjeLz0sp1irilYDD4cA8h6aX6WEoigCRoe5V/NHF5LQ7jC4uKddItT
	 W8+NvR12JfU4+wLTvGg0oSw9SbsqgNjW9kfHMawa30UVDsARbUVi71aKAl/U1HG1kKsIF
	 OgL4UvHk6kkug8FJ5/heZ8JkzIA6Qc5nF6GuTbuGwFsvmtV5SsgogV2rwVMpk0mFPzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ne4a4cFR+Swe51cblyaim6Ifl0mbkjVxPPICo0J0BlY=;
	b=QxOVIqLTSjtRRpJuDQh35smGUhzTzvGWepvvJy8W3OtYpBYBVQbBFBg+st7r8qWTdF3/
	 2G4WlHnyrpaXdg7qibTYKZjho2xgZatXANsXMRPINh5rtXfnSAPhQOUiUPksGf5Ng5JR1
	 JE4Mc2TDO33URBrwOfc4ayd+E5NS/kJSG2AfUcuG1G+pGmGaoKtNsEHcRg75y2fVecN5/
	 1ViegBY5s0Ffdm4EUmSiwn5xB6j2adYi8L3+WO9oBX34QfH3A5ZTpxSbe12H0joAP4cCz
	 FVqZk9XXRVr9G0mVAH3xc7a5529cbTDRPaLJri0P4qe4oZ5wSgQEe521RjdodZoGCjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxRA07V8;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27244606A330
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27244606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxRA07V8
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso55386a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794162727; x=1794767527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ne4a4cFR+Swe51cblyaim6Ifl0mbkjVxPPICo0J0BlY=;
        b=sxRA07V8K1fDu8MxNg12Vj3Qc61INJdsm49M6Vk8k0Bq58QC5xo+PfXQxIYdGujQ3q
         cFMUHuphKGnWAeuxa9MJqAkJph8y21fouxw5L/u8idZoLrw2QjaG0WTht2s/XvKJRwHU
         iGvIjYkSlhBQFZYGVXycLLUxURN947Bdq/0CmmL+cv5WirglAW2KtG5MuTyhtucslw5D
         sG3ZyN+ywcIk/ng+POIuhxumyQhSj1C++sVaeP+gwI3nY5XPwFSsbh9J8XcRqQwD2lum
         OmS7gqzBp3NaDWd+ZLb3fr/AeDVIaCSvADiUmXO1/vIY0LTkDder5NVc9hljtGnqHOOX
         B2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794162727; x=1794767527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ne4a4cFR+Swe51cblyaim6Ifl0mbkjVxPPICo0J0BlY=;
        b=NTDLaFOGdHar2ehdcx6ZGnDJOcIOcUuCOIep7Hq6Q5KrF3UG8J2WpHf1RqJHOjo/wr
         WIrVRa7E6hLHyjdZEWaPtocnytEnJ9jBc8hIp4631aqLEYQHj0d/01argwC6WpyQwaM8
         9q7id7EtIhVuecwUBO6N75Rl6c9kjPn0dicJJeW3Bgc2g2lC9mi32P3PW6xLDp2JOJaM
         1XGdwIcXIlS+BuvgSarZuRNbqvXMRnPWD7MLMpIWUEixisA6knPUK4TAVLLXhsK+2B1J
         4eh9maQyn7MSiGleR5ZTtrQ0Vsnr26Qz4pkgLVV/fNffGjq8fTP9Xl0a2H8UgsOVcGOU
         V+0Q==
X-Forwarded-Encrypted: i=1; AL+hErHBKxQ7cd3xAbIq8vx99kiHRigQKe5GkPXCkNamFphP5KxrUp+BdDyYVCm90ELnYbd2Ay+ra7q4c7x9ttw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/niTzkr7/m8kDdZJz44ABg9CT96aWrYpQa+qqnpDipV3ITY1N8
	yBFO0zxBBQ+omCAf7OMgp6P00dQceOiSJintVzuD+NSff2V+6iofQfH9amPzlg==
X-Gm-Gg: AYBFou1PdH/52JIC8+ikWJVTK0JSGL46e5x04mMT88hyIQZzWOWFdO9NAmv65idmIaP
	kyKF3At7Ott9xkNYrusZmWFu/S3l0Y6pUaLgN5gKulSK/QcOwAgmzDPLFI50Y4BQhSiZ5pGKR+W
	YUmZunu1YH38YcvvR33beXn/zaE7ub+i/qSsWZ60LmQvPFihdvqSgXDPir5iL9XcWSrPeI7WZWo
	EfHpM3etbwhLAZzxynjUTbkFyXzWanX5Z3Y7vtdvdExL2wBTGPLISSwzQoDYVMkuj0oFxxDoFrw
	9PvbE/m6uE1wzWrLlb7f2YjJ8bV3udlOHywCfW3C+4owZ7hrw4nSbs8NNiG2FulakFdiiJfgumV
	CGZJKPJJ4VLUxH8eZpZ/zZHW63KNukM2bOl7Mt9oO82Uhrfoz7JadDfqp2PRcnsYrjSM5bHvh/9
	mQ9vXUbqPqbeTypIdTbahSredjWa5mhukPSrj9QzbGRF1TKOEpq5C692Ohqj/m9rUryF5NIsgR4
	zI/iqFIq//acX7Y9Ee+2BI4qfZqCOLFqQztopALT6IOozcGkPq4ixCkgshn4zASNrbv354QupFv
	GFJ/7WRwnfbl/m1i6X6gZD6KdXGG6WsACXhbX5iTuejQ0xEKJZg4/jM=
X-Received: by 2002:a17:90b:3d8a:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3b12d4f77a0mr1174456a91.26.1794162727510;
        Sun, 08 Nov 2026 10:32:07 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm7600534a91.0.2026.11.08.10.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:32:06 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/3] net: dsa: motorcomm: Fix stats64 error counter mapping
Date: Mon,  9 Nov 2026 02:29:26 +0800
Message-ID: <20261108182931.1542638-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108182931.1542638-1-mmyangfl@gmail.com>
References: <20261108182931.1542638-1-mmyangfl@gmail.com>
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

rtnl_link_stats64 wants aFrameTooLongErrors in rx_length_errors, and the
eth-mac stats already report the oversize counter there as
FrameTooLongErrors; move it from rx_over_errors, which is a RX FIFO
overflow counter.

Drop the tx_undersize to tx_fifo_errors mapping as well; a runt frame is
not a FIFO underrun. Report it as a TxUndersize ethtool stat instead; it
remains in tx_errors as an error not otherwise counted.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/mib.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/mib.c b/drivers/net/dsa/motorcomm/mib.c
index 6b170fc6e187..b8fe2c407c32 100644
--- a/drivers/net/dsa/motorcomm/mib.c
+++ b/drivers/net/dsa/motorcomm/mib.c
@@ -50,7 +50,7 @@ static const struct yt921x_mib_desc yt921x_mib_descs[] = {
 	MIB_DESC(1, YT921X_MIB_DATA_TX_PAUSE, NULL),
 	MIB_DESC(1, YT921X_MIB_DATA_TX_MULTICAST, NULL),
 
-	MIB_DESC(1, YT921X_MIB_DATA_TX_UNDERSIZE_ERR, NULL),
+	MIB_DESC(1, YT921X_MIB_DATA_TX_UNDERSIZE_ERR, "TxUndersize"),
 	MIB_DESC(1, YT921X_MIB_DATA_TX_PKT_SZ_64, NULL),
 	MIB_DESC(1, YT921X_MIB_DATA_TX_PKT_SZ_65_TO_127, NULL),
 	MIB_DESC(1, YT921X_MIB_DATA_TX_PKT_SZ_128_TO_255, NULL),
@@ -366,6 +366,7 @@ yt921x_dsa_get_stats64(struct dsa_switch *ds, int port,
 	struct yt921x_port *pp = &priv->ports[port];
 	struct yt921x_mib *pm = pp->mib;
 	struct yt921x_mib_stats *mib;
+	u64 tx_undersize_errors;
 	unsigned int start;
 
 	if (!pm)
@@ -376,8 +377,9 @@ yt921x_dsa_get_stats64(struct dsa_switch *ds, int port,
 		start = u64_stats_fetch_begin(&pm->syncp);
 
 		stats->rx_length_errors = u64_stats_read(&mib->rx_undersize_errors) +
-					  u64_stats_read(&mib->rx_fragment_errors);
-		stats->rx_over_errors = u64_stats_read(&mib->rx_oversize_errors);
+					  u64_stats_read(&mib->rx_fragment_errors) +
+					  u64_stats_read(&mib->rx_oversize_errors);
+		/* stats->rx_over_errors */
 		stats->rx_crc_errors = u64_stats_read(&mib->rx_crc_errors);
 		stats->rx_frame_errors = u64_stats_read(&mib->rx_alignment_errors);
 		/* stats->rx_fifo_errors */
@@ -385,7 +387,7 @@ yt921x_dsa_get_stats64(struct dsa_switch *ds, int port,
 
 		stats->tx_aborted_errors = u64_stats_read(&mib->tx_aborted_errors);
 		/* stats->tx_carrier_errors */
-		stats->tx_fifo_errors = u64_stats_read(&mib->tx_undersize_errors);
+		/* stats->tx_fifo_errors */
 		/* stats->tx_heartbeat_errors */
 		stats->tx_window_errors = u64_stats_read(&mib->tx_late_collisions);
 
@@ -399,12 +401,14 @@ yt921x_dsa_get_stats64(struct dsa_switch *ds, int port,
 		/* stats->tx_dropped */
 		stats->multicast = u64_stats_read(&mib->rx_multicast);
 		stats->collisions = u64_stats_read(&mib->tx_collisions);
+
+		tx_undersize_errors = u64_stats_read(&mib->tx_undersize_errors);
 	} while (u64_stats_fetch_retry(&pm->syncp, start));
 
-	stats->rx_errors = stats->rx_length_errors + stats->rx_over_errors +
-			   stats->rx_crc_errors + stats->rx_frame_errors;
-	stats->tx_errors = stats->tx_aborted_errors + stats->tx_fifo_errors +
-			   stats->tx_window_errors;
+	stats->rx_errors = stats->rx_length_errors + stats->rx_crc_errors +
+			   stats->rx_frame_errors;
+	stats->tx_errors = stats->tx_aborted_errors + stats->tx_window_errors +
+			   tx_undersize_errors;
 }
 
 void
-- 
2.53.0

