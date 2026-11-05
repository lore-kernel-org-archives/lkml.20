Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907299;
	b=HpHCYhaWcbJibzhsi2e8NNYlX2x1ujN+9aX9EmM5VLiAFsBWnsSBlZNNkw0j4F5i5Vbw
	 RuGojEfjYZLjbv2DelHt1V/OUQZR/nv+0uZ2Luhi0HFHjh1zC5879ujOCgvs31nDMSXg6
	 LjBjv7Pia4DXLGFdjuoh8o2kj4lrgd9EIZggvhPNNbrUNtfCaMtfjwXTYIhRyfMBLaFNV
	 p+vHpOxBhJuyQNi2y3T4GP22ogweCYScbmshsWiB8TrGvMdIUGq12x6lpE1oh//fDuQ6V
	 INMmo9YQ6jDoqElu6E+EeLqBPF8iIVbqe3VOzWJOF2gY3abJ0oYtUc7y0gz5LTksLNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FIPamNjyg5pldJb53DytGiQm4S1qvSpofPwo92Sk8fU=;
	b=lRA3N6wh9ZSqklNIdz8PjQia9Qr3kvDyjv05imeeZQ84prjE11nw/9OwRDOCryWpC0ve
	 H0ODlEkFoblXJ1IbhkcAJiGjjdM4w/CM5pc0rLD9EFmVMeI0IZBw3X8oumFRXS/fIVeQj
	 1JWKPSd1jds2bT9TSNKfraTcYyQta3/noD+gKFrZSyJCHcdNny3+vQS/mwhY969yIMBsh
	 8j6IMpCtgTz3VqndNvK1azmq1HzdweqhTIQ/lQ2OoaH/alPyjGG3z8cw8RKzzqn5wFiUV
	 xyeu7dkrrBjDBv9PnJQuSg1n//83YM4VSFyAcLvh7a+F80gkrG0EnsO2MlUhVK/GHXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HddFjLZ0;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4E6606D52A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA4E6606D52A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HddFjLZ0
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1adbf62dd31so3054928c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793907298; x=1794512098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FIPamNjyg5pldJb53DytGiQm4S1qvSpofPwo92Sk8fU=;
        b=HddFjLZ0joAH1TGB8j7WeybL0a5slle7Di2adqqb9AGZjlK9DWcfKRaPTh971V7efr
         KZQcjWW60p6WvsC2Ntgq1Rv6ZwKnhmI4yLIpiItnP0GoasFfLqOLIgR7f3oe3EmttkyQ
         yWN3StvUNA6SGqrXedBLJXBtejcATvmfqiVThqXexkxHZYaHEuNABQpFga+V3t4d3Iml
         LTY9U21M8KdbKQXSTOqGc1faZYnRScBw9YGY43k5MbR7WNcseNSaE+rFiqfrRK1W+NZA
         QeG0nsNvsoKpoeyMCpJgecmNKHXhfYnPLwy5glyBAEvRhkPLt9i9BfE9fwx6xTk+B/5L
         inLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907298; x=1794512098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FIPamNjyg5pldJb53DytGiQm4S1qvSpofPwo92Sk8fU=;
        b=GCynPBC5LspHf28P8+VZI1kzvZxh+EoBCncgVraAcWz2U2sZ3ow/PqDIvgzPKqOWdp
         KwKuWVXz4PfqCteprfy1vBeVHQ1AStLiE9SaRplJZ+HkZ2pnePldG3b/V4/yXgZ0WZaY
         G74Ji1yhqtgq8nB0ua2toHpTfUkkYMNGK74hyMdbqNCi71ImVqvs3kUcLom8WCTcl3pU
         iNrWglfA0FgRY9aMkjZVre3oPVQKAHLVIHKs1MSf20SYDeGdJBeUwdP/iDjnNUXUkWi4
         hz5Mb+smOA7bm3maIJSx1Ae6IJgV86KVbL0I+/Gg5mt0GlSaPOZDIWFJGJN+rHNM6rUp
         wPUg==
X-Forwarded-Encrypted: i=1; AKwUvBw5MCDLPGccC9zx/QPguDHcweS2zP0FxwBPD4mLe6auhycSnZ47s1UTt/gM2igUVxMAzv7Vqp4Xiqh3SNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V8jOsbQI+Ff0E5Hr1hlvaukfYzYcAopJlYhIZ2x9vGdOymgjZ
	Emqt265RqgcdyiLvCL6uPyAust65/kcptY0Vpp9hzlKr9UTmEowh8Tl5
X-Gm-Gg: AYBFou1BkIPsdZRCKtsiw9c2ezX/DwzbkV9PTsd1aCF6odT+BxjUShoMai5CwdpSEWZ
	FzLCeG2r2bAkTEUkqooYGMLtYxoqdXGjEbnNXwZm7/xCevJbM7PXRORLiUJ7oCoLBhtwDbbWnvY
	jW9uT+eldBVBqwz3eFqDrzQbpY5FNZx/j9i47Y3/iN9HK/SNdIT1llESkEGEhyD0lkW1hsSpFIw
	5G9+uljBDj3UJt+h2TKVk/eZ/d8pxc7i2JLBPspuun1GTweY1JlB9UHSqn9Z4TfGTzTIZBBM9l+
	j0ixoSnRcitNry8hIs2W0fk1XO7uMXXsxE0KSckcNOaoPPm+O/QwiNsM8pRmsTCHi/qpq4l7Jvk
	QJhKdW7lqxjcOmf0wowZggWqfzmR2ZWqMkNEZ5Bp78DogPjt7VO8gkFG3iOOdq316TKgDM40sUr
	DTFKDiYlJVrWGc7H1vl16L6ScIEVHhWIwa552Nkc+5hzhzySlGLJoL8GlCYY2f4XQGXcUDMN7jj
	GLtS6wHzz734D2BGFlY08S0nIx3SBxpWq9Qr7N+64mV4BbYq4OzKTRBMKzVaoiMm8QIZn1ix8NZ
	evflJX4AkQDzwBilwGWTqAVKHOyL1Q==
X-Received: by 2002:a05:7022:3b81:b0:1ae:59d6:91cd with SMTP id a92af1059eb24-1ae59d694e9mr27788548c88.38.1793907297913;
        Thu, 05 Nov 2026 11:34:57 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c127sm18023186c88.6.2026.11.05.11.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:34:53 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	macro@orcam.me.uk
Subject: [PATCH net-next 2/3] net: sb1250-mac: Advertise and honor RX checksum offload
Date: Thu,  5 Nov 2026 11:34:34 -0800
Message-ID: <20261105193435.2050321-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105193435.2050321-1-f.fainelli@gmail.com>
References: <20261105193435.2050321-1-f.fainelli@gmail.com>
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

The driver already trusts hardware RX checksum status on supported
chip revisions, but does not advertise NETIF_F_RXCSUM. Consequently,
ethtool does not report the offload or allow it to be disabled.

Advertise RX checksum offload in hw_features and enable it by default
when the existing hardware revision check reports support. Test the
active feature bit in the receive path before marking a packet as
CHECKSUM_UNNECESSARY, so disabling RX checksum offload restores software
verification. Hardware can continue computing checksums while their
results are ignored.

BCM1250 pass 1 does not support the offload and retains the existing
software checksum behavior.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/broadcom/sb1250-mac.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/sb1250-mac.c b/drivers/net/ethernet/broadcom/sb1250-mac.c
index 1843b52e96f5..546415d3134c 100644
--- a/drivers/net/ethernet/broadcom/sb1250-mac.c
+++ b/drivers/net/ethernet/broadcom/sb1250-mac.c
@@ -1142,8 +1142,8 @@ static int sbdma_rx_process(struct sbmac_softc *sc, struct sbmacdma *d,
 				 * the kernel
 				 */
 				sb->protocol = eth_type_trans(sb,d->sbdma_eth->sbm_dev);
-				/* Check hw IPv4/TCP checksum if supported */
-				if (sc->rx_hw_checksum == ENABLE) {
+				/* Honor the RX checksum offload feature setting. */
+				if (dev->features & NETIF_F_RXCSUM) {
 					if (!((dsc->dscr_a) & M_DMA_ETHRX_BADIP4CS) &&
 					    !((dsc->dscr_a) & M_DMA_ETHRX_BADTCPCS)) {
 						sb->ip_summed = CHECKSUM_UNNECESSARY;
@@ -2214,6 +2214,10 @@ static int sbmac_init(struct platform_device *pldev, long long base)
 
 	/* This is needed for PASS2 for Rx H/W checksum feature */
 	sbmac_set_iphdr_offset(sc);
+	if (sc->rx_hw_checksum == ENABLE) {
+		dev->hw_features |= NETIF_F_RXCSUM;
+		dev->features |= NETIF_F_RXCSUM;
+	}
 
 	sc->mii_bus = mdiobus_alloc();
 	if (sc->mii_bus == NULL) {
-- 
2.53.0

