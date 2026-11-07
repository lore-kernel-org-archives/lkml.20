Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057660;
	b=D56iY1YfcAPMV8Py18vg9vvH2FJ/L1ujMR8ZBT5bbnlZuKtZUHUZ89Nh8mz7Avf9oCls
	 Z0d4EyIaYPjuY0NStqA4alxTVrUuSJ6VolVA0t/6jZnckaCmk5lj0hS2GjbKB/jNs9F6p
	 KEg6frn9k57g6ayk71M1Yk+hRxE0gRIKn2rETmXcZu+Ef9eNLNk3quNtOgUd1O0bgPVXU
	 Lo/0oQJ/qeSwfozUJeSsBSupCopPa7UeUwCH0W7rMEiZFpWatRl9jcYnLUWs0GvLbbyoR
	 huk8hCknZSZKXJzYV8Qw2mB+9yap//n4u6ExcF3x1gzjz54o04i24I0NWBe82gXN72w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p/l/ItgemMFWSjv2M5mduN7bQYto7r4TWh2GQLaqw/0=;
	b=vtHSqDZPqNVuFEc+lM1C/JQac6RKtNl6tyg5oALeUZ8ZLuju0kOpF2kzpor9vyAjquU3
	 uJpLh55OQfxrlDJWdf/7jUZW+VroZXSG1xB4xrMBE/K8O0IKQIL0vXezraf1PqYjCUk6K
	 1GrsNdbbd9rV0T7nc0xo4zPWp+nFuV8CG/8Fd85LPMEx/jKz4Al5Y3SDn7bO8MSrBOp3b
	 sqOD9nbkr+cVQJmwZmK6HVm3L9eLPRUpfFMaoc0f3wfSB3SgR7bcSka1MOndQEnQwz4CI
	 egj1CCrLrahNMISgSnZ12N6VkY17yTE3H4HSKOTSDSyRkkAStTNCJPvhzohHGUNKu0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMjYpSZ0;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02BB606A334
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D02BB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMjYpSZ0
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b1015a4259so534387a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794057659; x=1794662459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/l/ItgemMFWSjv2M5mduN7bQYto7r4TWh2GQLaqw/0=;
        b=mMjYpSZ0PCIIB0fJ3/3ZVizmYD92jMgGlTJob219pIs42Qs/uGJ5jL/5c4rjaMKgHu
         8qcxbeilSJuNv768B+kfL/P1AGCyifdmwUzeChJClhiiU3CCQ6hv14/J6IO4P8tNpifJ
         KKaFTYEsWCkpUf7vIzA9t4i/Op2nr5s1ycQYMTEsGNEfMGHDAE9i3mUIvkprepCwNAIR
         kVbl3n8ooSsK1nAwGSSxioKXtqDwlGC1RyyvCj9NgyhK6iV7UKOu0uWpkDcDjKa6irN6
         8sVPlU1oIvCC96ANxZGL+R265moDKDEcGmjipn7s0ynyLobdoNCRdt8Rq1E5sX0Y37PH
         IRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794057659; x=1794662459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p/l/ItgemMFWSjv2M5mduN7bQYto7r4TWh2GQLaqw/0=;
        b=n2ftbDLWwMos+GnEGor5zPd+lC3M+omYvHc4Z/1F2MXEfSK59C9nvVyyjn5ZmP2XUx
         mU8badJRxkwnPXbIZT4sru+SJ2BVWbcNCfj0mrEgoEgQo5WN+sx0s2nyuLuHk0FCIW8o
         NvB/jmfqHXTH1dpzcebb5I60D3Twpou8IQpoQhcO+hRh5hybIN2R2d72EAFFn0dikIyf
         /CeGjiRFsqG7+wM5LISQDL72kLWOMw+vCEfIrflz08Qm7fs9k0wNfeqWf+7zQA1lkcgP
         9PZN3RxdHeznEMoLVP13VT+vNjP0403xUwFPxI5z+gUii3l59sCzaiggsRN3Zz5g3CIa
         o5Iw==
X-Forwarded-Encrypted: i=1; AL+hErErXKkapOmAu5T3zVwmZDCkEyBHxdk1Bsv3xK3Y2BbKdf7KgqYfPDVQ2d+7hoODAtWRDRodH2LTiqXfCJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GHG21hUgEM7RcAeq+5Hk4zarqEZRynyuEjizOoCIifiII7jeo
	+KL3XX8MFaSXE0JPDxvU2dK1PKa1PDbRLXprppwnqg2V1JkhFTBVgfN8
X-Gm-Gg: AYBFou0Pfb0cnuGKr/FiWRBcVn7ZTQJ/8JlL0wNwyv5UUjnZe/spqOvUD5lkKrj2DlY
	8yEJ+NirPxFQSmKMpw6Gwb1AGfJ0y/9tlA94kcftcEH8/lZTlq/On7IAGaRcY2X87sAuCkVFIfW
	p3v86beiBFVEtPnE6y30rEP+lYaWy6mSfysNQwcoM3zazKdtPU9RybxTkgW18KvnlTJW2osfWJi
	IEa9a5Bho5JjIVark0mpAtAfBMY44VnAgesVZaqUtzLPGsDWSbuJMPy2iAf8ylsGdrtsJx7xhX5
	wfYX8rxOjH0nVxQqcsmNyIb87oRKTuBfCtmUzMpW3ygVxWV6Ho0ZQ8hmESEoFQt5UKRr6A5RUcZ
	025XDXmWyfB6OhlFjyjAm/QoxZj1t8C3iLHswgyNm4Exi1J+ThbkqPLGzhOJ0lcjiMN21fKydd6
	p8MYwWLmIYmlHzG5gjkC/7vsTUjv5WBBprC1wiuDLE5/4WX3nNkbb2qVdSdbSfBHAbDpR/93aVn
	xGURiLcOPr8edY2Zwj/54X9XtdNL4K/EBffpg4p6i5V8yzAI+HFseX2ijs6F65+NEk3zm9IZyk9
	5EQm6q7x1YbnI8pJ8cFEEpjYKUctG3mlkXRmaXvLcSrGv882jfYHsA==
X-Received: by 2002:a17:90b:4986:b0:3a7:b260:9ccc with SMTP id 98e67ed59e1d1-3b0db70d52cmr5229686a91.65.1794057659179;
        Sat, 07 Nov 2026 05:20:59 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b101d3d0e8sm1626521a91.3.2026.11.07.05.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:20:58 -0800 (PST)
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
Subject: [PATCH net-next 1/4] net: dsa: motorcomm: Fix stats64 error counter mapping
Date: Sat,  7 Nov 2026 21:20:33 +0800
Message-ID: <20261107132040.1066996-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107132040.1066996-1-mmyangfl@gmail.com>
References: <20261107132040.1066996-1-mmyangfl@gmail.com>
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
not a FIFO underrun. Report it as a TxUndersize ethtool stat instead.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/mib.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/mib.c b/drivers/net/dsa/motorcomm/mib.c
index 6b170fc6e187..5c027edb71e3 100644
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
@@ -376,8 +376,9 @@ yt921x_dsa_get_stats64(struct dsa_switch *ds, int port,
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
@@ -385,7 +386,7 @@ yt921x_dsa_get_stats64(struct dsa_switch *ds, int port,
 
 		stats->tx_aborted_errors = u64_stats_read(&mib->tx_aborted_errors);
 		/* stats->tx_carrier_errors */
-		stats->tx_fifo_errors = u64_stats_read(&mib->tx_undersize_errors);
+		/* stats->tx_fifo_errors */
 		/* stats->tx_heartbeat_errors */
 		stats->tx_window_errors = u64_stats_read(&mib->tx_late_collisions);
 
@@ -401,10 +402,9 @@ yt921x_dsa_get_stats64(struct dsa_switch *ds, int port,
 		stats->collisions = u64_stats_read(&mib->tx_collisions);
 	} while (u64_stats_fetch_retry(&pm->syncp, start));
 
-	stats->rx_errors = stats->rx_length_errors + stats->rx_over_errors +
-			   stats->rx_crc_errors + stats->rx_frame_errors;
-	stats->tx_errors = stats->tx_aborted_errors + stats->tx_fifo_errors +
-			   stats->tx_window_errors;
+	stats->rx_errors = stats->rx_length_errors + stats->rx_crc_errors +
+			   stats->rx_frame_errors;
+	stats->tx_errors = stats->tx_aborted_errors + stats->tx_window_errors;
 }
 
 void
-- 
2.53.0

