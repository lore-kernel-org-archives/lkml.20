Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D773F4A49AF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439012; cv=none; b=pgcnnUVlK6+mtmDFq7gRC86Y27l163WLDsLqobY5YqjNlhtF3fSyONIrFLyD0Jd5A5DhbVKMefm3ibv8SB/Hat7U8Mjj5X5FDnnk2w9Xhp/wL93q08E9G1rbeBf60GwRGsvUYsHgdKKMYVuw12xCfD2/YBIZe0BB4lbyBnjjHkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439012; c=relaxed/simple;
	bh=ghqOiytwdKV2QgPHAJ66vgnviwKhQoqEJeoZvkld8UE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ncgQCHwdapIYnjMNM/HevwH8vpPq1KXq1TsJcAWwqWtU0yiofpyIgEO6Os+EaG68hajTq4/UFSDzdTm8HbA4TpWzwPc7aHFlQ+unFsNpepkScTMcCPtHoVChMDgtazJvV/hDkg/tEET875LCgj7bIUE2EMCEz7Iz/iwYYlQ8Zks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=T2xnsh6p; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="T2xnsh6p"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso15895065e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788439009; x=1789043809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mnwb6hERpnN0nOzAPeu6lXZdqPLOGboK0OSUAEKDpNw=;
        b=T2xnsh6p7x27qeHPkJQr/rtiB/3wuwXstdgL0KnajXKDtogvihzpRNlthjSpHW4Ktv
         8Oq2CdaAcOZyKBi3Nlgcns7GYLzy1boBiZID25QjrIP0u7bZb401H2pY6/cG37PnpTn5
         rKRVGzMxb353wEx9L3EVxiJ+O8kTpDw2acLE1o7QUTxhY2EmMvkIUQwO27s5+UE1LmRW
         pzkWIqorHhXpbkrfXSxaJnziMkDht4pEt6vTpM3gXRJjM8F1bIp9aBh6bXsDC1JkgugT
         8VNpJU+H9OlKprfEGZDnrDZX4qrHPlVFIPUUiTN1XVwiwH6irmTeUFGlePjTBC3OiFRL
         uk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439009; x=1789043809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mnwb6hERpnN0nOzAPeu6lXZdqPLOGboK0OSUAEKDpNw=;
        b=liJbj9MiuTZSKDtOxRZ4WQ2flIg0tyWHp/okS3Ik20s6zokDWYEbAqJSdhU29EdRk0
         ed1P/S2D/6KaA0zdNkZtLXlWrKV0YcswOTMllXrWPDB6SA8gGLeScwey5lEHVAKZ3r6G
         VHun8QU1uIwtuheaWH7QkZHIJXq218H3hcwtnoZ0LNaP6UWCefzRRLdkjiyjmoKl1C4x
         nVJ8lG9dXhvGnNoO7swwljqMeBbf1/AuBIqHmtzNpT6sD+en9EsEyWER0Fc1JjvXDjAj
         /z5QNndVTXrO8esnTH1R8Gxg4SM94+jB3eFIArPS+XyF1Z2tAVacqfLfuSk+0u6tdUy9
         HIpw==
X-Forwarded-Encrypted: i=1; AKwUvBzvGRJSvWRwFeR5CtmTY9349A3kqsG21hjWiJ1VQonQkEGrJyMsMDRYjtmSd+31/+h0zu021vx5LQm1i6U=@vger.kernel.org
X-Gm-Message-State: AFuF++nxI81KniIi746cQP8ou9DgoUcTLoLSJd5bJ0/ALfpn6CsNwjKo
	V7c7iyOBbOQPTkThqFvpEIUZLghMn+qT+ccKqakIV2iayu7mBLkHx2K5QmtMabmkY30=
X-Gm-Gg: AYBFou2Gp5PGyFgjIJfs6h0opieVf0HC0jfXjp2n4JQJlEajLn9PcKgQEZfNE8HUwfa
	oBKHD1g5ERt3qIp1vwv31v8Orl4mmxc+Xwmrl1hd6u645YCkfxp/EC1RxJgVNGCt7hWgpXCsBUx
	ov+BXGTlY3Z2JJLMIf/+gcklT0/KgUaPpgJxf536uxEgQmQ/Vi/9FB4N1eGNCaXJLGzUJA31KNe
	HJrQRiPpakw50LPfNT55gKnI9LXQ8p8S5yit9J9K/8vkdq79QXoDGLcSna2/zeJRnncwRxo7skh
	xlPwC/PKCwAwBWLLySlnUjw60nyoPSKj5x1zsWxfYa6qG7c3sAEWp/HWlKYfXbI1PwKKnqZSlHk
	0bZiopSJhkocy0SuOMhxyZr5CoftYaf/gYEPgv98tWySgCtgiY7am0/sCyjQsjeNSmIFgs4wr3s
	fvPfNl6ftUuza6JVVFHky4HSW05FtSFu7PqiBjRAjA/kZNc6bjfIw=
X-Received: by 2002:a05:600c:3b11:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49ce5843baemr202157645e9.13.1788439008740;
        Thu, 03 Sep 2026 05:36:48 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72d2asm12828927f8f.8.2026.09.03.05.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:36:48 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	nbd@nbd.name,
	lorenzo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org
Cc: linux@armlinux.org.uk,
	dqfext@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v5 1/2] net: dsa: mt7530: populate lpi_interfaces to fix EEE support
Date: Thu,  3 Sep 2026 12:36:43 +0000
Message-ID: <20260903123644.23800-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903123644.23800-1-f@lex.la>
References: <20260903123644.23800-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phylink_create() decides once and for all that a MAC supports managed
EEE, and it requires the tx_lpi ops plus non-empty lpi_capabilities and
lpi_interfaces. mt753x_phylink_get_caps() leaves lpi_interfaces empty.

So ever since the conversion to phylink managed EEE, ethtool has
answered "Not supported" on every mt753x port, and phy_disable_eee()
has locked userspace out of turning EEE on. That undoes what
commit 06dfcd4098cf ("net: dsa: mt7530: fix enabling EEE on MT7531
switch on all boards") arranged: EEE off by default, but reachable
with ethtool.

Leave the speeds above 1 Gbps out of both bitmaps. PMCR folds
SPEED_2500 and SPEED_10000 onto PMCR_FORCE_SPEED_1000, so
PMCR_FORCE_EEE1G would govern LPI on such a link, and that is
unvalidated rather than known unsupported: MediaTek's SDK driver sets
the EEE force bits for 100 Mbps and 1 Gbps only, and the unit of the
wakeup timers is undocumented with the port clock at 2.5 times the
rate.

LPI stays off until userspace enables it, but the EEE advertisement of
a PHY that advertises it out of reset comes back, since phylink stops
force-clearing it.

Fixes: 9cf21773f535 ("net: dsa: mt7530: convert to phylink managed EEE")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Ports that support neither 100 Mbps nor 1 Gbps are skipped because on
MT7988, EN7581 and AN7583 port 6 is 10 Gbps only and shares
PHY_INTERFACE_MODE_INTERNAL with the user ports, so the interface mask
alone cannot tell them apart. MT7531's internal PHYs keep the
advertisement mt7531_setup() zeroed and EN7528 keeps both bitmaps
empty, so EEE stays fully off there.

Two pre-existing things this patch makes live, neither addressed here:

- The unit of LPI_THRESH is still unspecified, as the comment above
  lpi_timer_default says. Before the phylink conversion
  mt753x_set_mac_eee() wrote tx_lpi_timer into the field directly, so
  the raw unit has always been what ethtool showed on these ports.

- mt753x_phylink_mac_enable_tx_lpi() sets the PMCR force-EEE bits
  without checking the resolved speed or interface, relying entirely on
  phylink never calling it above 1 Gbps. A check there would make the
  driver robust independently of lpi_interfaces being right.

v2, with the full argument for leaving the higher speeds out:
https://lore.kernel.org/netdev/20260824024117.46154-2-f@lex.la/

v4: lpi_capabilities is mac_capabilities masked to the two speeds
instead of both asserted. Every port that reaches the guard today has
both speeds, so nothing changes; it only stops the bitmap from claiming
a speed a port cannot link at.

v5: comments cut to one line (Maxime Chevallier); no code change.

 drivers/net/dsa/mt7530.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2b7be091c056..3e61eb3c2b1e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3172,23 +3172,31 @@ static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
 
 	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE;
 
+	priv->info->mac_port_get_caps(ds, port, config);
+
 	/* The EN7528 GPHYs report EEE capability, but negotiating EEE with
 	 * common link partners (e.g. Realtek GbE NICs) results in an unstable
 	 * link with dropped frames. Leave the LPI capabilities empty so that
 	 * phylink disables EEE on these PHYs and refuses to enable it from
 	 * userspace.
 	 */
-	if (priv->id != ID_EN7528) {
+	if (priv->id != ID_EN7528 &&
+	    config->mac_capabilities & (MAC_100FD | MAC_1000FD)) {
 		u32 eeecr = mt7530_read(priv, MT753X_PMEEECR_P(port));
 
-		config->lpi_capabilities = MAC_100FD | MAC_1000FD | MAC_2500FD;
+		/* LPI above 1 Gbps is not supported */
+		config->lpi_capabilities = config->mac_capabilities &
+					   (MAC_100FD | MAC_1000FD);
+		phy_interface_copy(config->lpi_interfaces,
+				   config->supported_interfaces);
+		__clear_bit(PHY_INTERFACE_MODE_2500BASEX,
+			    config->lpi_interfaces);
+
 		/* tx_lpi_timer should be in microseconds. The time units for
 		 * LPI threshold are unspecified.
 		 */
 		config->lpi_timer_default = FIELD_GET(LPI_THRESH_MASK, eeecr);
 	}
-
-	priv->info->mac_port_get_caps(ds, port, config);
 }
 
 static int mt753x_pcs_validate(struct phylink_pcs *pcs,
-- 
2.53.0

