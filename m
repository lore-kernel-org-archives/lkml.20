Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697383;
	b=gVV5nQFi4KaW23MrEHEOg367B1hltZ2mZm+TYY56ydUzoKGlcrTv3ZVrUJPX8OLGu0x0
	 QlOjZZrPvtq2GvPv99aVpmvFruc2b9uLO/4okEZBdmZO8ifOch0m7nmTKeiWGdYfZroH1
	 568h9kv6+wKwQcxm9KMQ342POdEpZ7XjJvuUjn8rpPqcNJ1O/b1/0wbXqEtp62+f6RdCq
	 xuteGTtWEFCznN5v/HNZ2gDj8+Ch5qKtzKO0SBpS6hYwA30/8Sr61tSm916U/+NQlWlTN
	 wWByIxTXz4/FRR6wEAofEUo3a6aqo//ctoVK51qADTJBp8BUYPbZyuraxal3Ho8ct1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yJalOy9yUzY4qhSQnHegmtkd0eJp2sotrwsvSsGL/CM=;
	b=Dlov0b66a66KVBci+ZZle/wXyUXNtYUEDgNK0MLjfwn5dCcIOGUH2F/7GzeBaalZNaWY
	 uWU3mrFzVVbYKcmeB1ROhAovIDodnxzl0T09/gz+wCnluHcD8Bqs535a+xLdQEThMSIQd
	 PM2kP7JIZa+q+6yITNuqpBATpbPbFJfJgi1b8ahrm79v9xWml7/OGqpi8uhjoUzIuvsXw
	 L0fky6PZ9EZNzxUWnG2A7iOezhTCOpjwk+C/KBNTwK4DvUt4gln6p3WXZ+LnSGDa6neFz
	 BPQD5mUvpABcaWGqJmtOR6EmNkDvfnt41NZ7GSxxkuudDGh0Fe72e1iq0tk4YbqVghA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pkNp+w2F;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F09606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F09606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pkNp+w2F
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so1392425e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792697381; x=1793302181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJalOy9yUzY4qhSQnHegmtkd0eJp2sotrwsvSsGL/CM=;
        b=pkNp+w2Fce6/2tom5At3Ad3LzR3DynTZVDUmvORpG+V/zUGdhaeJlnji+1XU7I259S
         ldG8j7FGXXGVppobMnXiAeE6dYrE/bLu/FdW8s6fJ6hqSA0mGGsba9BD0dRAHkldGAwY
         B5yFesDmZWbffqb6TrCyM/WqD9BnanOcU4rMlPh1DyF6bdNioD83eMYx8vegrLq7iBVG
         /ggpTNFB8edVKKm24o8gAaTpaqx50c01BkJShnpDW57rMtWhRa2NgcByGYD94usCeO2t
         X7zH192fp1eOiikjGHq14CCY+98kEek0955NYbFafzO0qmPrkGCcCFeeOuU58b3OvviD
         7g0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697381; x=1793302181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJalOy9yUzY4qhSQnHegmtkd0eJp2sotrwsvSsGL/CM=;
        b=xzAGOrhxrK29l/7C2so/buqLQlp3LFEwompot+Re9sp3R8OuP+BXvEDY00IPcQtlQ0
         e5CNeZkr0Q4Jo7MyY8GJAClWGGlWan58X5ixlWLQsxGnsmaQDMlW3Ml5RbcgUs23Ecs4
         dQz6QrMDZ+mGIpTNDe5RHwzK8I2YiHsFvfibX3xSRVJK1n7cC81NRcTepA/NLRgIaiO8
         O/s7yix8tQqguafgEl/Rgx9whezS/ThFk6gCVe25ODsDtYjbuIGqpZW6E5rDcXpcbc68
         R6Xcl+O9Ui12dKKVqe7mgmasltKlfS+jVUwmd6BZEqaKp6P2KWV+4YDdVvvfHXK2i88f
         RsdA==
X-Forwarded-Encrypted: i=1; AKwUvBwocaC7ymUNhc6ZXYZu0626ZDOoXrmKlM4zl6kmv+BgaTm2yed1EvMrf79o4Tzy3bPE/NYPSKjKV4xXAtQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaPLuIdpB6a5NrEeywRYeDJ5GvfZ781w2YQnsQe3YMyYeWoh8s
	V8X1RkrxeHWMvpWou+eUFzC22pieNbUnYMiu6XHRMjTyng5TxqoVyxXF
X-Gm-Gg: AYBFou1q0yvg+3KKTc7an8KQZ4fuo/X/yXhk28PiCS9VbkZfiKcsUk+ZYJ0I3shQbhh
	LwvliNpKuIuo11Ldu7pti4ek48zGB7pTSN8xDYmI9CVp5jiPuAWgLoqqdrBt3l+Uja6dmrm2qIn
	cK3FVgQa12GooeY7xdZjvZJKWfPQU0CotHYhddZVyM4i70eDNBXxwOizS0zQtRp7E5Xy7MEFcSV
	t/ss5MB37kDnFRNBrtVsMfDX26f/EQuJ6QG5w/is2A6bqOwm3IrL005/0fqLaXjAvxrasna209i
	mHB6WeIkZk5uYQXFFMb7833A1ezxs1GhzYgw2XzwxX3Aazg+VfcYXp6zwkkxXgy6srnBhXnKiNM
	clay0f9NqpIXxrlH2eZy9NcSr2+zBO+tnBE1Zc94z+O6KRSkhQSa5xvsG343Fz8B9agIVVMmWRE
	KKA1+C8Xpp2L64y92/V/M/gwyys+wP4AAGOLNlbXzV8N7Wi9W1lXZb8KZtWEAqi5kN5ovwBE66o
	8iypsTJbdHlcFp/2r97Xnj25oe3RLVQtw7HoZhu83oG8YlkQ33tIA33laMfZ9650h+vl2fum0OM
	Rg==
X-Received: by 2002:a05:600c:a00c:b0:4a2:390:712d with SMTP id 5b1f17b1804b1-4a211eff334mr659725e9.33.1792697380960;
        Thu, 22 Oct 2026 12:29:40 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:c12:cf67:2010:42d8:74da:e279])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2101cedcesm20269405e9.0.2026.10.22.12.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:29:40 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 2/3] net: dsa: qca8k: drop MIB autocast frames once the request is over
Date: Thu, 22 Oct 2026 21:29:32 +0200
Message-ID: <20261022192933.384898-3-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022192933.384898-1-kuncy7@gmail.com>
References: <20261022192933.384898-1-kuncy7@gmail.com>
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

qca8k_get_ethtool_stats_eth() points mib_eth_data at the caller's
ethtool buffer, asks the switch for an autocast and waits 5 ms for the
frames. On a timeout it returns with the request still published, and
the caller falls back to register reads; ethtool_get_stats() then frees
the buffer. The autocast handler runs from the conduit's receive path
without the request's mutex, so a frame that arrives late still writes
the requested port's counters through mib_eth_data->data into freed
memory, and frames beyond the seven expected ones underflow port_parsed.
ETHTOOL_GSTATS does not need CAP_NET_ADMIN.

Protect the request with a spinlock that the handler takes, retire it
on the way out, and let the handler retire it when the last frame
completes it, so that frames arriving after that are dropped without
touching data or port_parsed.

Fixes: 5c957c7ca78c ("net: dsa: qca8k: add support for mib autocast in Ethernet packet")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 22 +++++++++++++++++++++-
 drivers/net/dsa/qca/qca8k.h      |  3 ++-
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 49be53b7f..56796df14 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -1663,6 +1663,12 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 	mib_ethhdr = (struct mib_ethhdr *)skb_mac_header(skb);
 	mib_eth_data = &priv->mib_eth_data;
 
+	spin_lock(&mib_eth_data->lock);
+
+	/* A late frame of a request that has already returned */
+	if (!mib_eth_data->data)
+		goto unlock;
+
 	/* The switch autocast every port. Ignore other packet and
 	 * parse only the requested one.
 	 */
@@ -1692,8 +1698,12 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 
 exit:
 	/* Complete on receiving all the mib packet */
-	if (refcount_dec_and_test(&mib_eth_data->port_parsed))
+	if (refcount_dec_and_test(&mib_eth_data->port_parsed)) {
+		mib_eth_data->data = NULL;
 		complete(&mib_eth_data->rw_done);
+	}
+unlock:
+	spin_unlock(&mib_eth_data->lock);
 }
 
 static int
@@ -1710,9 +1720,11 @@ qca8k_get_ethtool_stats_eth(struct dsa_switch *ds, int port, u64 *data)
 
 	reinit_completion(&mib_eth_data->rw_done);
 
+	spin_lock_bh(&mib_eth_data->lock);
 	mib_eth_data->req_port = dp->index;
 	mib_eth_data->data = data;
 	refcount_set(&mib_eth_data->port_parsed, QCA8K_NUM_PORTS);
+	spin_unlock_bh(&mib_eth_data->lock);
 
 	mutex_lock(&priv->reg_mutex);
 
@@ -1730,6 +1742,13 @@ qca8k_get_ethtool_stats_eth(struct dsa_switch *ds, int port, u64 *data)
 	ret = wait_for_completion_timeout(&mib_eth_data->rw_done, QCA8K_ETHERNET_TIMEOUT);
 
 exit:
+	/* On a timeout the frames can still arrive after the caller has
+	 * freed data: retire the request so that the handler drops them.
+	 */
+	spin_lock_bh(&mib_eth_data->lock);
+	mib_eth_data->data = NULL;
+	spin_unlock_bh(&mib_eth_data->lock);
+
 	mutex_unlock(&mib_eth_data->mutex);
 
 	return ret;
@@ -2107,6 +2126,7 @@ qca8k_sw_probe(struct mdio_device *mdiodev)
 	init_completion(&priv->mgmt_eth_data.rw_done);
 
 	mutex_init(&priv->mib_eth_data.mutex);
+	spin_lock_init(&priv->mib_eth_data.lock);
 	init_completion(&priv->mib_eth_data.rw_done);
 
 	priv->ds->dev = &mdiodev->dev;
diff --git a/drivers/net/dsa/qca/qca8k.h b/drivers/net/dsa/qca/qca8k.h
index 956338893..a550f331c 100644
--- a/drivers/net/dsa/qca/qca8k.h
+++ b/drivers/net/dsa/qca/qca8k.h
@@ -402,9 +402,10 @@ struct qca8k_mgmt_eth_data {
 struct qca8k_mib_eth_data {
 	struct completion rw_done;
 	struct mutex mutex; /* Process one command at time */
+	spinlock_t lock; /* Protects the request against the rx handler */
 	refcount_t port_parsed; /* Counter to track parsed port */
 	u8 req_port;
-	u64 *data; /* pointer to ethtool data */
+	u64 *data; /* pointer to ethtool data, NULL with no request pending */
 };
 
 struct qca8k_ports_config {
-- 
2.43.0

