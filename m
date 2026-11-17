Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919220;
	b=yr34etkoDTEaNbR2+tgGC+iloR+l0LRQ68OY+d9MzwrczQHCF45nRXwiWL59pAN72dvS
	 2XC14698fTTTsDzR0My4HLXMm4Bfc5k/nLUf606az8/XElSoUR3HkElvRWNjWrrIbXtZ7
	 xwJW1aMMJECmRgf3XQQpfP3b5tohYSdvo5oFR+D7PWUJkYcbBx4mW+mxWGuq7rmCIAkxr
	 PVWm4a/OvwnR+Aik1tKrlNOQmnOwsK1WCWn3m0it024uD/MTpIgdJXTG7b1kow7h4+j21
	 a1DyKK0Ppxit5+1Ty+autiQ0mhJst1VFhUY/4Z08nzUJ+UA9+vzVEGYTttaXs4rv1Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
	b=PwMZj8M0IAE5eNECtCmXlAHylYHQ32SQ0CsGiXTjI93ywktsm8jv0+ULpWEjKNwBDShg
	 eqXCIMXVwJZ00F2upm1BxZxtDo6jnH2QI4h90by5rU98MLjZNXpfx85X3pxVdYwlRMkLk
	 MrO5l/d68gC1fyu2i6kPuH/Yx14viSTgOh+m6zqyXRvNOQivyf6+viQPqB9MIqgzMnwil
	 dhrlym4Y7o0qgNZ/rHNJ+ZIlpw+CEuPAC6y7ehjC0xpX2hs2xS5f8dzdO8wNcd9705fHV
	 5NDUZlGgk15BSXoaBe/4AQ8xMhDFslzuomd6kTTu+lSgYD7ZDfg4ukgivv5O6sWUJ7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cD8I7k4x;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A8F606C2E0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A8F606C2E0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cD8I7k4x
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso21196605e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919218; x=1795524018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=cD8I7k4xDGq/qBARL1vrdzp6+zD8+TGMO3ILYOwEhwvbBTbkFKokDA67pD0xhaRcx5
         l25xvG3H1BjIgmcC24KztZzkdeblUuckTV9neVu0CCs8onFLtmVNk+ICrdt6cmtpkfAx
         NTwhd7Rt23vZp79UHXVk/O0zPc6njAMDkXvLrlnq9G0qX5sCBfLbnWTv3ujpFpBl1V2T
         YB2DtCZ2GVP1Lg+cAsrz9UN89V4eZ4eewqaJbKNqLyGONEXdRCynnp2o3mH2KAjCrQsU
         EPZQx5kN2ucNg7FTkd8yi/RSb6yjTIyruRiDvxsjrtKnBnpaUoy6DKRTo2OMMH5CkoWG
         6DZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919218; x=1795524018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=Xxs6249rwxDWrLGYhW0x5WyntbMGQ31PIZjUdj/WfrQ3xNx81jmQ0kv7DsG0JWThKA
         zxOuxYP2fywM29Gve4kd7TC3V+JhlX7xduQaLQarlpjecqaoYin6FNv+ccgbTnFpxerC
         L/R4LWA0pFfCe33HLltJ0BdESaki1iJBSD0dXPctt5iIpH1AItF5wzP9b2nhbMvLgBTG
         RaoddpdC1Eiw6AnpjkLx5sGwNQNwpdEqHw8D/dolv0NVfx+oPcZvAZ2pQ/1FbluqCnms
         JlJArXxJKiXmq2PQyZT6JJ7XAYsl9B+LsX/beLzDQYBH8FZj0PKkqcctTwu1CdOxKb0I
         6eqg==
X-Forwarded-Encrypted: i=1; AL+hErFF48fBfoztOGl+9VZ38E4+S0ODBxEAtRDF/tpqSywoI7xpRR/Tn/LxNOZlHU7vlhdfepNYkk61i2r6agg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s8JUXmuueNjbOJYa0lWjRjM9kBi4wNTfNcgzk5TQpr1kfz6kq
	QzTjV2Wp1l9zuWMNJSl0xYw2jLy7rlXP59eW3XsgwNLE+3GCsYIQAg0m
X-Gm-Gg: AYBFou1cis/dewaxc2VlLfzNC2SvuClPOYgZfqg8TG5Cm7G57kxRGM+WjCZvqc1/1Kq
	JKHgJMvWf/y0cL330sRAwQshwQHxfJaz46M/Yeo7jGjSPuBJ7fdlYMLSmdeoOVH5PQawbVpqvIn
	VLi5zq5/Vt5yHTZvMH4uMFjvBFGdI9mrzCmmUJXvOWfPPFxMiCeVJoZv8IcFpdl95IbF9xWUrcs
	zGW2lDliaE5EW0dEYVkc0CizPrdjXCnAwGn98LvKbwX0l78VhnGMsiPpi97HSXSBFiR/5FDVk0z
	jb4sO6qMpzkQWcYho/QDavReLMmItUcu3tlnXEWDdV3NS0JFT71TKI3mm6Yv7/Uzvg1txv6ywRH
	EWHmtCNE3bxTN9D6uTlO7S6Y4iAIJR+JskA3kZrIG58R7L4PtXMCJP8JDaOu53GFrnnzNzNHtmh
	pr1BT2JYRQsyg8HkFUQgl6pE7Wuq8QttuuM8donMmfXuS9ynxBQliCDj8/iWSDut6yF5a8NSVGx
	ufxsdNsiBBDHvdU8VRmbfm1drYGa0ByNMf8M5SRaD8oyEBsQVjwEltpN6Eb54JROdQAonGoIXS4
	mVm4898Qsyg41pK5RhD0Wf7vneO1mH/XvaJbT8xFaWPlyf1K4FXktwNyFOK6l/G0fNty6gPjF7j
	X4MmQ+5b69Ojqt/PC04UxT8FywQV/sAogu68=
X-Received: by 2002:a05:600c:8b81:b0:4bb:5f45:c97f with SMTP id 5b1f17b1804b1-4bb5f4f93f3mr220965765e9.27.1794919218079;
        Tue, 17 Nov 2026 04:40:18 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:17 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v22 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Tue, 17 Nov 2026 13:39:45 +0100
Message-ID: <20261117123956.11981-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
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

The firmware node associated with the phylink instance might differ from
the device firmware node passed in phylink_config as such device can
reference the parent switch or other platform peripherals.

Some function might need to reference this firmware node after
phylink_create so add a dedicated fwnode entry in phylink internal struct
and save it on phylink_create().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e8ba906cfba6..091c3a79c120 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -47,6 +47,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2185,6 +2186,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2272,6 +2274,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2311,6 +2314,8 @@ void phylink_destroy(struct phylink *pl)
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0

