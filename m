Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846873;
	b=ENNKCQggmR7XqypOdKxxiKSwmv5OYRtVaIlebuAnMTFV/k6v5y1rKubXKnj1C3SI3nJv
	 T5HKqb1JJrJFRLfOexp0i3SwFGG30cJyLIScpCmIFTU4X4Z0YEAm6GmJkJnq3NVGP3zA4
	 Xr1BaMtqcfSMtFvRhHeUDSwEPxs4z6ynG9lEfUv7GKypswsvPtQ9Z5My5cfkNRJPCAWdb
	 pTHAixdadhgB6nWeVBvz+F6v2Opdf0ZKtoSwFYQDRSt11w2FEWmx/ZWRN2h7XsbniymQJ
	 CGloKprnmflwzOUvRt2dFCWlvJX+Sev65zvdXht4hJjDJmpJXeH2uKn0a1ysAEEW8qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
	b=lTFOT41SjMw8uuZ+e1sn9uARl3IwvlHr1oITV1DARaj9ABTXkUAfJ5xmfzqYDXMFINFV
	 +Klfc9bSov0eYlPe4QvdnZ3S61BfqGboW69rRrNNFKHQ+1n4A2U8IJzvyB51p/35sAqnC
	 EnfVq3GH95t5eQe4uCPUsDOXoSUYiuJW22joDmBBCroqdJt+uDvA50+WhBPOKudQxnMA5
	 Y2Bn8XmO+Q17P/86eotRIBZuu+ur9Lb2EWxvBABQo3dGoHRuYLJdsBfHPH8lhqH+XG+d3
	 atsgmhv6eT+YwOJzW2ZyqsdxaCyw7HDeYdFRZreGVPqdSX01FI7BmvuihVSW9C7k6Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xcOZjTxo;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39368606A887
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39368606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xcOZjTxo
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so20889185e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846872; x=1795451672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=xcOZjTxorByYizNJGssiaOGwwfyU9b6w4K9GiOMTxB1/FYWzqD31nxLNCMayp8ZYfT
         55WgPoRbpyPST//W3OuMjpvw1KCwPFP/l7e9QeNWRfPBkbtCwnsMq9cHDDG2oXTu1bbL
         sYopDicSNp4FQgXY01YPI9cnvbAckqki0hJLitiUfqpqw4bucvPUoMbcJegxGzUVOuLi
         qTWMTNwL6NlO+ViUHjPlfH9k4QzhxGPSiqE7/eFV/ypUj01YbAnTN+KIf5rKQmXZY26J
         V9aR5aYklwZNW2HT4bPogiXRlWT1d8hyWssoCEynKFbUFsbeJ0RjJoSihLgFY9D27lb7
         EcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846872; x=1795451672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=jP1i04zhaNLDF5xacmbAULQfRWqjmIzlqt4FeAoJOU6yCvzUbh4p+L1yzdO6kQK86O
         DsEUAkNw3DEs/Hs7PT0lIKpW2ePKPtvKI3jGcY/nBtrrpRUEg3L7TjCl2pcM9iC3L8c3
         u3S2gm+ppxonNQ0Vs5S9rO8NenDIUjzeNAwUIKCajCYFMKpuFbpQWKwOxHbjfQnGmnYO
         9ZYcWoDaeXBj5tplB1wB9qXIW3UMcTN464ziZ23SFx+IA6Ucc//zzrrNXuWkmt6Fj/IY
         HZfKuGjZqITCGI/KMry5jsTGnlo0Pw5/lBkY0sWPV4SZbW/fESd6bYkjAjWmEYqELPua
         qBhg==
X-Forwarded-Encrypted: i=1; AL+hErEZRf+N83uugRNcHFFT1YGG+mR469lt8xw5i8iS15UyM2iOsqTnURWxFlP8tlwPwc5v92pYGgFqzf/m9AI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nbxzL6pyvYkPSmKGFgXAP1PLGzuVYFVfNRp9p6XzukFL/D3L5
	n+S5RhyiTJTuyDgER533qW85XxCBP5X55jIKMqMyDZ2ndS+bQLI7mBh1
X-Gm-Gg: AYBFou3B5gBBjF5Gki/9GPLhyV3nbYL3AOn6lMKZCuZ3+C0Yy9c//wJU0qWuoiIwEVK
	RdcKoMOdqS8JX7D+cIL/JLNl7bqNwInephxCNFN5fG9ccVDoPgnudfM8/B25v6j6R5JlaZPg85y
	bAoPP3q8mG8VFc39KL4Rur8Jw3fM/TVGrs8oM7vYZPsN3kJlnnD8lnCfnemjhG8G1pGVklJrFR7
	RN48oJIDLlriSVUpXP4aaAEjzqhv8+XfAdyhc52OicSA61cTgS6V4mjWaf5fuIwwrCyKZVwFOY7
	Gx6666JwVNx9qp5t/dnAyMMSSKeyDrDUCOyIaKTbsaTltPIddDg/exZTQK0EmXAJ2K/vTXtT7aO
	14uLLMrGPZFgrGKLMfM+6yvfn32e3IJ/ebMOvbUQeM3G78qh/1rrqaNJjobiDkCsjtYlkG9tgp0
	LjkK9AglfYKYDjsyjVzgs3sELbFsWlzyOO+y1wnXZMWRmMKQ9J+EpQC7jL9DtKei2dINiehrc86
	HJ4Dytdm8M1icH4FwF8frlge6U9etz7NDrmSWUWBiWbQ/byV7gHr34h4+Pl7RjVmPn0BvLGXvMm
	0fzE76GEBWLywc46ostqCgiGOd2IZSVWOFcGO1KLzRrFpoQ+wYSRMA1cshd5zS9CqiU2QuGu0nf
	qxiTnNYudmOC2QgOQTH6dG2RphkPHoAO8goeafX0enaNXmvA6agYK3fA=
X-Received: by 2002:a05:600c:1913:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb55ab021bmr249777075e9.30.1794846871585;
        Mon, 16 Nov 2026 08:34:31 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:31 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
Subject: [PATCH net-next v21 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Mon, 16 Nov 2026 17:33:48 +0100
Message-ID: <20261116163412.551438-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
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

