Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635130;
	b=XmYo21b00EcWx5Eqlk9mnCT8/Ue4s89ww+2mm6gu7cDlUh4li+fx8ofe/lhSSvhoX2x4
	 CuCVTn4ReGLqKvORiB5pWhBE5LLuMjAB44J9WvKNkf1xiJ4nS0/HjqNhXL5+QT/lvtv04
	 jOm27SuQtjvCdf0mHyKcSV6mVK7cnKsKi9SkhNgQ86CmGzqTIvzkyM7yxMrO8ZRb7F1/1
	 hnVRR8/obPslrUNG3lTe0M2/W0KLhHJ0eQTo9KSNvpoeUVk6DG+oTqGXcsHUDvWb8Fkye
	 XTBzQkg+x2tznJcYd0ebL4gs+fddQNUc4Bd11Q2a0nqHd2TNLkYMzxGFt8mHIooIlwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ldogGG0L2r7e8E8bTIXHYR/XI5wbEyYJRYKnBDo3pKE=;
	b=cdKsESQKHLZyehn7doljjcugfaqqnTmGJ8C3aRkbu84rnZLDQI9L6rEb/un5KQXkizN9
	 4MZgLTZD2RX9zCh7YMdXXz9MS5Z001WiL24ZPwQY/xjGlnDnOzsytolepqyYiPS2UspT9
	 A0aolsLxLHhWs56DL4DT1hVB6astpSSJA0x+WsyQ9oqRar6PobGaKBgD+cpCs2JxNCSV6
	 S7giftyptT+EXQxRHT4UA1qKA5UzIXl6KSGnOchdzQ7qmpBMFpWftWb1PYCBBsSSJfVur
	 rytaD/PnoF17TBE0lQ7oX9jPECc5+Li+W1XRCR8Tepo1rc8MPwEDzO1PI6/YTtybhkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ml45T0Ke;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5316360BA927
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5316360BA927
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ml45T0Ke
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so2216335a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793635130; x=1794239930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ldogGG0L2r7e8E8bTIXHYR/XI5wbEyYJRYKnBDo3pKE=;
        b=Ml45T0Kefu+066yyNasDniLIxiqDfek1/nxcxm2q4L8QhwL8FMzgRM4zwKURFL1s0U
         D7sIQug4/Xj6vti6htj+d0lh1m6/98EPuZKYKWpaB47T4xkiKvC9DCQe56feqJOnneLg
         IyRzUV5V4TRKHS//oFpIdqrBkOYaqMTYPbJgb7mJObAb7UaeYkG+gRFj2VzJQAgxzcdq
         sl8TI1LgJcQi75sTCD8JvU5Myy/UHpGW8QJ3No936ysg6u94tOf/MeXQ8KvcIHOFEqhC
         HH5e8eWcMd1zxEUrf5BJE1u2AKqGnGRIPx98wxW49LES+s39CSRhv6P3RyTaW0yv+9x4
         WbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635130; x=1794239930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ldogGG0L2r7e8E8bTIXHYR/XI5wbEyYJRYKnBDo3pKE=;
        b=WNraVPhvg0y43R7ZG2kYYJk07CcT9eoKwqdcjNkVTl0hQ5hy02K03uj1xD3RXmIjiz
         7SeOmn+zBNkdwr0ZGXSnFHrQ6jP3DkQiiOHZEWfPWj3CvvPf7KQqWVxgeODdC4Pxp6Hz
         0IX6JCoC5+g1QlNFH9j1ZmmCFHyQq27aZTuN9HHoZLZ6L7LC0IGTYfFw/PUlE2fRbfb1
         /YDuDwx1aBhbFBegILOT7O5O4dCPUg/6GVRcfI1pQIUuF+MrWOdgOeNdZt/d5oAHxQx8
         32F/mnm8uzesY3LjmLfq4GMEyuCFiM+qBM/k40rWx6rPQUs5md4GkQHK81Ki6Byn3H2X
         pW+w==
X-Forwarded-Encrypted: i=1; AKwUvBwWK2k9uZCwVIXcVNB5pvAebNtvJVV/Z4YQ0Do6z2R4E1wu1R+nF2nIXY/UNH5AdnciVajXjRYvZFES5ks=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z80bJ+kMfbW2zsA/9KrrM5DNbvoiiWtB+Ap/j1LhOAeYi3NKd
	t321aluoQU+9jQIyK7dzOYZAW7MrvZSVErkctGWreNfS+JoFp9Tsrok2
X-Gm-Gg: AYBFou15d+FM/6HmywlqjdY2QQndpvYVasKKgCThdyelCElcPZMc4XgjcRLkCZQNsRs
	QKtMKdgq1XRjT/Cn0rCvtZ21yJxxUCSTbNXDh+M0lQnzJ6qMEHlH9Vm4atigF/4V/6enY1s9m5y
	mZwgTR/aEiVT8aIN8K++NQgXGuY2nJAXCAcbkevN+36z54HyhqTC3kMCW/Cme9OQ/4IuIqx+tK4
	ODPAT2fk5rUKZrV6krt7igzmvVf9AMFq5FPKji4cqEyn7nmZw20dLLukrrtt85Jo5Khyy514l4I
	Ossogf9tNfcbdZ5QhGIoqS+qn0mgph2Oyyj84Ni1Mlh//79QAJeVYTjNSiH360FdGczmVz1Ku1l
	28PTykM7XWRFgPDoxz0Oc2CTxp4q8KKIlW2RJXT1buyzTjW0I3QINYG109KeiKHdLiSbnkFP7qn
	wCaa3asoMc5pbKy0ilHSnJt+1KofMWCgPB6QuW8ZYnp8vxQznfa+RzpOgHpSDQWGOrwrw8Vrtkm
	fmlcQKlLHV+O0Hpzc9vhsVWEGk9Fj7xIt665rJ2ZY8sw5TKXKVci8PhP8o71s9NgHkdUod4Z0Eo
	LwyGLeVBS5Qi6eq2iwGEuRzkjwm3zNVXOQJcAzqnkPe44M/bAu/Q
X-Received: by 2002:a17:90b:2f0f:b0:3a7:9ec3:ea0e with SMTP id 98e67ed59e1d1-3ae8974a292mr6451704a91.22.1793635129672;
        Mon, 02 Nov 2026 07:58:49 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7d429fsm19183949a91.2.2026.11.02.07.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:58:49 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 6/6] net: dsa: motorcomm: Add BR_PORT_LOCKED and BR_PORT_MAB support
Date: Mon,  2 Nov 2026 23:56:38 +0800
Message-ID: <20261102155641.3682626-7-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102155641.3682626-1-mmyangfl@gmail.com>
References: <20261102155641.3682626-1-mmyangfl@gmail.com>
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

Program the per-port learn register to implement BR_PORT_LOCKED and
BR_PORT_MAB offload.

Learn-suspended FDB entries (status pending) created by locked ports
are never aged by the hardware. Add a delayed work to remove all pending
entries if any locked port exists.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 161 ++++++++++++++++++++++++++++---
 drivers/net/dsa/motorcomm/chip.h |   9 ++
 2 files changed, 158 insertions(+), 12 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 447736854870..43e001da634e 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -822,6 +822,109 @@ yt921x_fdb_join(struct yt921x_priv *priv, const unsigned char *addr, u16 vid,
 	return yt921x_fdb_add_index_in12(priv, index, ctrl1, ctrl2);
 }
 
+/* Learn-suspended entries are never aged by the hardware, clean them up before
+ * the FDB fills up.
+ */
+static int yt921x_fdb_clean(struct yt921x_priv *priv)
+{
+	u8 status;
+	u16 index;
+	u32 ctrl;
+	u32 val;
+	int res;
+
+	ctrl = YT921X_FDB_OP_INDEX(0) | YT921X_FDB_OP_MODE_INDEX |
+	       YT921X_FDB_OP_OP_GET_ONE | YT921X_FDB_OP_START;
+	res = yt921x_reg_write(priv, YT921X_FDB_OP, ctrl);
+	if (res)
+		return res;
+
+	res = yt921x_fdb_wait(priv, &val);
+	if (res)
+		return res;
+
+	status = YT921X_FDB_ENTRY_STATUS_INVALID;
+	if (!(val & YT921X_FDB_RESULT_NOTFOUND)) {
+		res = yt921x_reg_read(priv, YT921X_FDB_OUT1, &val);
+		if (res)
+			return res;
+		status = FIELD_GET(YT921X_FDB_IO1_STATUS_M, val);
+	}
+
+	index = 0;
+	while (1) {
+		if (status == YT921X_FDB_ENTRY_STATUS_PENDING) {
+			ctrl = YT921X_FDB_OP_INDEX(index) |
+			       YT921X_FDB_OP_MODE_INDEX | YT921X_FDB_OP_OP_DEL |
+			       YT921X_FDB_OP_START;
+			res = yt921x_reg_write(priv, YT921X_FDB_OP, ctrl);
+			if (res)
+				return res;
+
+			res = yt921x_fdb_wait(priv, &val);
+			if (res)
+				return res;
+		}
+
+		/* Never call GET_NEXT with 4095, otherwise it will hang
+		 * forever until a reset!
+		 */
+		if (index >= YT921X_FDB_NUM - 1)
+			break;
+
+		ctrl = YT921X_FDB_OP_INDEX(index) | YT921X_FDB_OP_MODE_INDEX |
+		       YT921X_FDB_OP_NEXT_TYPE_UCAST |
+		       YT921X_FDB_OP_OP_GET_NEXT | YT921X_FDB_OP_START;
+		res = yt921x_reg_write(priv, YT921X_FDB_OP, ctrl);
+		if (res)
+			return res;
+
+		res = yt921x_fdb_wait(priv, &val);
+		if (res)
+			return res;
+		if (val & YT921X_FDB_RESULT_NOTFOUND)
+			break;
+		index = FIELD_GET(YT921X_FDB_RESULT_INDEX_M, val);
+
+		res = yt921x_reg_read(priv, YT921X_FDB_OUT1, &val);
+		if (res)
+			return res;
+		status = FIELD_GET(YT921X_FDB_IO1_STATUS_M, val);
+		if (status == YT921X_FDB_ENTRY_STATUS_INVALID)
+			break;
+	}
+
+	return 0;
+}
+
+static void yt921x_fdb_clean_work(struct work_struct *work)
+{
+	struct yt921x_priv *priv = container_of_const(work, struct yt921x_priv,
+						      fdb_clean.work);
+	struct device *dev = to_device(priv);
+	bool has_locked = false;
+	int res;
+
+	mutex_lock(&priv->reg_lock);
+
+	res = yt921x_fdb_clean(priv);
+
+	for (int port = 0; port < YT921X_PORT_NUM; port++)
+		if (priv->ports[port].locked) {
+			has_locked = true;
+			break;
+		}
+
+	mutex_unlock(&priv->reg_lock);
+
+	if (res)
+		dev_err(dev, "Failed to clean pending FDB entries: %i\n", res);
+
+	if (has_locked)
+		schedule_delayed_work(&priv->fdb_clean,
+				      priv->fdb_clean_interval);
+}
+
 static int
 yt921x_dsa_port_fdb_dump(struct dsa_switch *ds, int port,
 			 dsa_fdb_dump_cb_t *cb, void *data)
@@ -1412,6 +1515,30 @@ static int yt921x_bridge_join(struct yt921x_priv *priv, int port)
 	return 0;
 }
 
+static int yt921x_port_learn_cfg(struct yt921x_priv *priv, int port)
+{
+	struct yt921x_port *pp = &priv->ports[port];
+	u32 ctrl;
+	u32 mask;
+
+	mask = YT921X_PORT_LEARN_MODE_M | YT921X_PORT_LEARN_DIS |
+	       YT921X_PORT_LEARN_SUSPEND_DROP_EN |
+	       YT921X_PORT_LEARN_SUSPEND_COPY_EN;
+	if (pp->locked) {
+		ctrl = YT921X_PORT_LEARN_MODE_CPU_CONTROL;
+		if (pp->mab)
+			ctrl |= YT921X_PORT_LEARN_SUSPEND_COPY_EN;
+		else
+			ctrl |= YT921X_PORT_LEARN_SUSPEND_DROP_EN;
+	} else if (pp->learning) {
+		ctrl = 0;
+	} else {
+		ctrl = YT921X_PORT_LEARN_DIS;
+	}
+	return yt921x_reg_update_bits(priv, YT921X_PORTn_LEARN(port), mask,
+				      ctrl);
+}
+
 static int
 yt921x_bridge_flags(struct yt921x_priv *priv, int port,
 		    struct switchdev_brport_flags flags)
@@ -1420,17 +1547,23 @@ yt921x_bridge_flags(struct yt921x_priv *priv, int port,
 	bool change_isolated;
 	bool change_flood;
 	u32 ports_mask;
-	u32 mask;
 	int res;
 
-	if (flags.mask & BR_LEARNING) {
-		bool learning = flags.val & BR_LEARNING;
+	if (flags.mask & (BR_LEARNING | BR_PORT_LOCKED | BR_PORT_MAB)) {
+		if (flags.mask & BR_LEARNING)
+			pp->learning = flags.val & BR_LEARNING;
+		if (flags.mask & BR_PORT_LOCKED)
+			pp->locked = flags.val & BR_PORT_LOCKED;
+		if (flags.mask & BR_PORT_MAB)
+			pp->mab = flags.val & BR_PORT_MAB;
 
-		mask = YT921X_PORT_LEARN_DIS;
-		res = yt921x_reg_toggle_bits(priv, YT921X_PORTn_LEARN(port),
-					     mask, !learning);
+		res = yt921x_port_learn_cfg(priv, port);
 		if (res)
 			return res;
+
+		if ((flags.mask & BR_PORT_LOCKED) && pp->locked)
+			schedule_delayed_work(&priv->fdb_clean,
+					      priv->fdb_clean_interval);
 	}
 
 	/* BR_BCAST_FLOOD: we can filter bcast, but cannot trap them */
@@ -1482,7 +1615,8 @@ yt921x_dsa_port_pre_bridge_flags(struct dsa_switch *ds, int port,
 				 struct netlink_ext_ack *extack)
 {
 	if (flags.mask & ~(BR_HAIRPIN_MODE | BR_LEARNING | BR_FLOOD |
-			   BR_MCAST_FLOOD | BR_ISOLATED))
+			   BR_MCAST_FLOOD | BR_ISOLATED | BR_PORT_LOCKED |
+			   BR_PORT_MAB))
 		return -EINVAL;
 	return 0;
 }
@@ -1610,6 +1744,7 @@ yt921x_dsa_port_stp_state_set(struct dsa_switch *ds, int port, u8 state)
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
 	struct device *dev = yt921x_priv_to_device(priv);
 	struct dsa_port *dp = dsa_to_port(ds, port);
+	struct yt921x_port *pp = &priv->ports[port];
 	bool learning;
 	u32 mask;
 	u32 ctrl;
@@ -1644,10 +1779,8 @@ yt921x_dsa_port_stp_state_set(struct dsa_switch *ds, int port, u8 state)
 		if (res)
 			break;
 
-		mask = YT921X_PORT_LEARN_DIS;
-		ctrl = !learning ? YT921X_PORT_LEARN_DIS : 0;
-		res = yt921x_reg_update_bits(priv, YT921X_PORTn_LEARN(port),
-					     mask, ctrl);
+		pp->learning = learning;
+		res = yt921x_port_learn_cfg(priv, port);
 	} while (0);
 	mutex_unlock(&priv->reg_lock);
 
@@ -2242,9 +2375,11 @@ static int yt921x_edata_read(struct yt921x_priv *priv, u8 addr, u8 *valp)
 
 static void yt921x_dsa_teardown(struct dsa_switch *ds)
 {
-#if IS_ENABLED(CONFIG_NET_DSA_YT921X_LEDS)
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
 
+	cancel_delayed_work_sync(&priv->fdb_clean);
+
+#if IS_ENABLED(CONFIG_NET_DSA_YT921X_LEDS)
 	yt921x_leds_remove(priv);
 #endif
 }
@@ -2723,6 +2858,8 @@ static int yt921x_mdio_probe(struct mdio_device *mdiodev)
 	mdio->switchid = 0;
 
 	mutex_init(&priv->reg_lock);
+	INIT_DELAYED_WORK(&priv->fdb_clean, yt921x_fdb_clean_work);
+	priv->fdb_clean_interval = 61 * HZ;
 
 	priv->reg_ops = &yt921x_reg_ops_mdio;
 	priv->reg_ctx = mdio;
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index 842fd8f83903..81d2e75fe207 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -465,6 +465,12 @@ struct yt921x_port {
 	bool flood:1;
 	/* BR_MCAST_FLOOD */
 	bool mcast_flood:1;
+	/* BR_PORT_LOCKED */
+	bool locked:1;
+	/* BR_PORT_MAB */
+	bool mab:1;
+	/* BR_LEARNING */
+	bool learning:1;
 
 	unsigned short acl_cnt;
 
@@ -526,6 +532,9 @@ struct yt921x_priv {
 	struct mii_bus *mbus_int;
 	struct mii_bus *mbus_ext;
 
+	struct delayed_work fdb_clean;
+	unsigned int fdb_clean_interval;
+
 	struct yt921x_port ports[YT921X_PORT_NUM];
 
 	u16 eee_ports_mask;
-- 
2.53.0

