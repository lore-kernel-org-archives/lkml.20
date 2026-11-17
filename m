Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930856;
	b=TU6yfsZkbqeL9rzbMnpPRtlQapUmx2FweV93yylBwQ/OaPjE88usRKqGc89Xs4Fab2rv
	 VsmzUX1M38ykXPNdrj5ucCLv0oMbBwuCwSHT6DA1Zf9vSbfUJarOIWlf5TdliSgHPCcCh
	 XhNdtO+ksEvgRq8qhCKG8asA6U9XpMSOdA3yq9KgN+WLb8RZLYtT2Tglg8Vo0evyFE6MR
	 R6Xvskw0LlYuR0ftW6EXxxxwe+MMUShSA9xTMvXdpLqf7yG+Gjk0EgV6uOsn3dx0L1gl2
	 Xr0agR/HwfC1kfrRVPQXvLsmbNBXyCiPhDD+9qMkk/XMcwzp+e3G4zwedvpgKDQJPYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+5dvy/hAScMAJsju1oorwW3+RHfVmuWNsVasJTGPYS8=;
	b=QOYXDFxcacX4AyAZPRquvm7UwqnkiFvy05bxpEWuM2OMO125lUPg5C9oIt7diP2FboEd
	 CYMJ3F3i0mhFdJDifE0gd2L5v0ENf2oopino9CxCESyWA2jeV4Wf1nB0sIi/QvO678qRp
	 eGB1sD7sBNPiwm84GYjOKisStWlMnlg65UKDSLR3jJSmMv/qHeyd5HWiD7TOVHOceoTSE
	 FXtlZN1DlcAguKVASKaOEZ5O8+CJCMGIieg/t2Rkf18QXK3pCoES+UIFmbDNUf8NXG1cH
	 3FpgHR2U6RfIMqUbF7C2puZn9PRvfzeCbNYJLOxKQYs/Rg9PAdyV0Qkr2BVIIdKaV5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pmrIdfuj;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A19606A89F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A19606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pmrIdfuj
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e987a2ba0cso30222055ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794930855; x=1795535655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5dvy/hAScMAJsju1oorwW3+RHfVmuWNsVasJTGPYS8=;
        b=pmrIdfujPycQm+s7tQOqOFxlhHo+pwbKAtJ5JxxY2qRS+4l7e/cZ4QOcCIZXos85IV
         Y8ws+IrsuDgvjQeTct4VzZs49xxqyyAzumSE3x0RQAQi7UbRAQpIQv4f/Ij8+v+C5vk3
         lp5aMveOZudQunCgabz1/n9rEMI7OMy+75cya5hWWYmSkRBRu701yqtR2qbhsa+9BSov
         B7p7WTeMXrA1la4e/jxbsGjo2YpSydYedd0fnzhxF002FK0QYyPF3QQFRP9jTfsvH6vf
         T6MHOG+Slkq/2jZZH/9MrGP/aRdfrVddpi49BPd+UXYyQwW0pEP/U+bpuPXB3GePq49e
         w4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930855; x=1795535655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+5dvy/hAScMAJsju1oorwW3+RHfVmuWNsVasJTGPYS8=;
        b=ehbR4YFWW4qHjBwN6oq6QxBx7YczLwBJR7Xq7PXVghtPWVy3ARoZJwnb/UXKjWiIWG
         QP1UXDC2//kmpi5PmEHn1Gns8B2Po7dljELOj244bZjcOhFjtCSmH8LfcXB7krg/wyTg
         WGOQxZsTGSLRtXdTa1fwPXo6wBSD1gT4hZ9Y7BgHqbc1rVLlpIFqnVKGURV4AvI0jzIk
         5EONkvFZNCeyR0tizm41Jy8mq71JWn5wY39/DPAmCQh/xmFMDuDe9u3Y3hyiZUimp0gj
         HIEsYSJKsgNqeQpiXWd1tOvmjXZTilaaE/y2vOiZPLHshOFfv3vKXK7M+bvsAixTojOL
         Ri8w==
X-Forwarded-Encrypted: i=1; AL+hErEpLGRe9C4Q97hDPEzQoHwaRhomaJM8xDZ81xllcieS3xtVlUTVMnfHwv5qqDLUbQwv86M5+OzcWIaD+ws=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CFnxMb+iejDCSQxukOcSzuaML6foz/Ci48Zozhy4Hra0VrSbI
	J1V4uCZnGakCEKzcS9uQDVlIC2vktoJvGLxkRbryibXd2M2cuIrWHwkqfkheqfRpd68=
X-Gm-Gg: AZFdTZc2LkgDc1XHHmsN0+RMj4ntCL+wzYPUtveqLMuMzgejGzt6H+AJt7r90IOd32Q
	ZfzlSDpJqh4pD5Dl8OgR3dpxAXqD/z/0oi/xgnee5lvlabp08Ed03BifF8o1Uxzdt6j8DY5QBCx
	xDFlBQ1amA8uIiSz5Mx3MBYtxX1qZ4POKzFbPbrFjdHivjfUgD/ZRrMCtatn5xlJzY2WZ/gLKym
	IzxBvBLZw3m2yNiD9iVWbEhGib3qQVAr92YWzwetdi7jV6AT68neK7K1QFqjz66wzgdWVCd5IZO
	SKiWjxSakiOyEUD5NnFSf5I1lONEumrnZN/2GJwy84O6teLJsPdl0rZvEqjeyYEFT8BamiWdWsT
	uAdc2kBLs7LorDWcO8wgMfTZoVTCL2miCcC9X+yLRUbFfXIHEjHVWSk6F51qvthvPb2RDu6072D
	fAsUx5xPIDHnLCRJooKCeB+BHkUM3ijo7ZZwXl7Rld+SK4CfhuYjlfIFanv+xf3AjoHEuit4Kdj
	rBbepDda1iGz83KM7d97IXD5/fXPniYFhPyDdDK5+74Z99OSZnnJLOMnT4mj5zIoyyplfZa1wh3
	HTz5pk87ll3sVYtVmImFh9VY/bgMBxsep4MEaLI6XLQ=
X-Received: by 2002:a17:903:1109:b0:2ef:dff3:47e7 with SMTP id d9443c01a7336-2efdff349edmr23311925ad.33.1794930855228;
        Tue, 17 Nov 2026 07:54:15 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:74::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a54576sm18951695ad.40.2026.11.17.07.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:54:14 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com,
	Joe Damato <joe@dama.to>,
	linux-rdma@vger.kernel.org
Subject: [PATCH net-next v2 5/5] net/mlx4: flush pending doorbell when dropping a TX skb
Date: Tue, 17 Nov 2026 07:53:50 -0800
Message-ID: <20261117155353.2250540-6-joe@dama.to>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261117155353.2250540-1-joe@dama.to>
References: <20261117155353.2250540-1-joe@dama.to>
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

If mlx4_en_xmit drops an skb (for example because DMA mapping fails) and
that skb happens to be the last one in the batch, the doorbell for the
WQEs posted earlier in the batch isn't written.

The queue stays awake, though, so those WQEs are eventually announced to
the HW after the next TX, but that depends on traffic and could induce
latency.

Avoid all of that by writing the pending doorbell in the drop path.

Signed-off-by: Joe Damato <joe@dama.to>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/mellanox/mlx4/en_tx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 123071a47bed..3166837711be 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -1135,6 +1135,9 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 
 tx_drop_count:
 	ring->tx_dropped++;
+	/* an earlier skb in this batch may have deferred the doorbell */
+	if (ring->doorbell_pending)
+		mlx4_en_xmit_doorbell(ring);
 tx_drop:
 	dev_kfree_skb_any(skb);
 	return NETDEV_TX_OK;
-- 
2.53.1-Meta

