Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408280;
	b=x5xs5kooecHxIhwcxTfDPDTT3vyeKzGd+HHYzU3eldup9n61s0tvqBMOFk3ed/uvBB+G
	 SIsAdS2mcc5qJaoWHCvdBQ1lRAU6yFFQJ8aEPfiymxxAI0tZTrDLTYO6WR05mwd+tbEce
	 ipGS1i2w1KtP+SrwBEQ1A48meHN0rnfBW5Y8OP9UjN2FmIeFN+IlOEVLVirxQyJsi/TlP
	 W66hmJeKoTXhTSPnfXy4QwJlgZmLCtGatdqlTvgS9/f6kZ4dh6pbSC3yD0wRqVMzejT3n
	 g/g/Cc/LsNdc9I5pSYM8aLwT05VGyaSoENj8ebzkBgWlDxlY/ERbIdh8n1btdFJvExQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1RU0Zv7xZ1eKDPvSIZ7kINuDvaMO3evWPcMZzj06nYs=;
	b=hpVfko3B8MJsuP6uTiUK5LeX1biVlhvH1jh5uVw7DGsyxhkawdB344rBQkacMP3qjPdh
	 NwSjFq7iXB3xFUjfHrdincJZkTYRy4dzrA102YxJT0LX2ON5bbfoPyJSm0n0vzHdDbCo5
	 iZ4LVUFtvpYl7naUcQeqeRDevqb3AkJUm9fMzet45TrOEuH7ydRGMHiX21GG/kYaroaS7
	 PHceeu0OLIUo0EefCD44+7nstSUD8PPBreLrHwt29I3zQ9DOyeFjXUeqxulPICQZ+C/U4
	 lPhOwYFIEAN2luTn6TX4AK7axMjD937d0SsBsze2OPvhL8v4grQgzofb1m0DplsENtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tv4XS0at;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1279D60A2626
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1279D60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tv4XS0at
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so24200325e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408278; x=1795013078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1RU0Zv7xZ1eKDPvSIZ7kINuDvaMO3evWPcMZzj06nYs=;
        b=Tv4XS0atL2sErZzJ3D+XCHF3t9L8QZC6nkoyRW3MjlQOkW/sDiruQvqc5H3OfXZ7xL
         wCouxXoHfRD+m/alkNRBPHbsuUsKQ2ItrpKyDskmBbL6hab2z7Py4iTG5ojqAT+T9jPE
         2HoaqDrprZrXliOy5t/AGj4NJRYKOtyYEZiBQR1Gg3GN0hZIMajKliMVPWvFZXjBxoj2
         64zJe260N4iZRhLJVjvkzejYZPAG01uE8EdK74wdHOYR2+9XzT3OdX2fqPLvWkdIZXCk
         egmAhs4vScv6BZ3iyJZwl7xvC9x4lvWkbgFp19/e+QA9O0WIGrlsAbU1ZgwzT39zOZWN
         EyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408278; x=1795013078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1RU0Zv7xZ1eKDPvSIZ7kINuDvaMO3evWPcMZzj06nYs=;
        b=TJroJUEkxgeWzLSqOem5hQ5CcUWJiZ+tqWx5GrQijOYFLBFis3ts/po3OXBbWs3h29
         JIaY5IcsUr6MEICKWW8sA55j0p3l0pwVaiWJwIImOiVcf9M3TvnElrJL5eYpNVfnyLOQ
         EBNkZ8EJD+3rLuDQmwoDnjjCPWo7nlKf3chUHilN1JpQ6OFSBqdleq8yxeVYhpgWx6jw
         gnZPNDhpon7X47Bqq4IAdz6Tdjxu2m+7+S4m2bvyywUrPbsflFOYnuAWJUfr0gW2NtB1
         DTz+4sAvvaLfI2CtkajjW+HAnz/kKS2IcuQYHdPFjarNm+SYC/IF+i9ByglPoEGFS7mm
         zvNw==
X-Forwarded-Encrypted: i=1; AL+hErGmXjcmqom2nYPkU/guH4qKJ0A5CFGfXSbNgJ2mU7agKMyWmg0D3lUqsPdnhsurSz1sjTBqANpUzou4fc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MW7IRqifI0H4hKlZIkIF2o6zMqr8rvPEsrlkhhAQTSLU+46cz
	hhbGm2jwwM1Pl1CkTWHkMlVD2iPpWZHDiFfP8rGEikwYVl7JOkcuCZZ2
X-Gm-Gg: AYBFou3ldRf1RMXIDVT7Tx4mgXlglJWkey49r7XzxaSOYux7bNgrU9OxAiBtgKccUd9
	0GQop0MrGBJs6ELfwI2NdHk+cjP18MNkSZkG6Uumis7JRKZ25k+9sYOZ+LCtBUtVF3yRg/8QIgl
	9LQx1RB6x8f70ZPqHcc1dzQqiZj/ZmO56F7rNQ7yqSNFupZD5TJot+bjiuWf5fN7K9d/+g/O46L
	dCHprPA0R1u0Gf1JqcKaIN9oEIQyBO8obzgHwYKvOTa/EJyM5OSpamnHx7I8p4pWVKh7MN0zuFF
	t+ytVmB7rjkmk0zmJvSZbaseZuxEBI254YprgQ992sExFwHvddu+qr80UEdN4OPHg4LJEr9RPYH
	3C7X56/rPOLL8iH39oCVRYol4nFKKdmbV1JTix96a1muboIxAKyBSUbcfx/cQV7fZQDki7yAeXj
	+QRdg7x0HCYzLiqhR3NUDeW22Mukc/k3BM3HwEJIJr7zwBMxt39wOxlq70UWsd76hINHwXdo9kU
	3LyqgCrxhUO929f3Seo4gB9P1Br3y89GXWKBUAbh2uzYNyNOMDMexoKXJqiaYjwx6WSdOdUbI9v
	VdBZIxQ76T2M/4bkRxDr1VAD738GOh7oSxw=
X-Received: by 2002:a05:600c:6214:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4ba09375bb4mr45272705e9.20.1794408278331;
        Wed, 11 Nov 2026 06:44:38 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm46656495e9.0.2026.11.11.06.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:44:37 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junyang Han <han.junyang@zte.com.cn>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 4/5] net: ethernet: zte: zx279128s: offload flows to and from WLAN ports
Date: Wed, 11 Nov 2026 15:44:25 +0100
Message-Id: <20261111144426.1321237-5-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
References: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
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

Accept flows whose egress or ingress is a mac80211 AP interface, bound
to a WLAN logical port on first use:

- egress: the flowtable hands over the AP interface, or the bridge in
  front of it (mac80211 fills no forwarding path, so the route stops at
  the bridge); one step of the bridge's forwarding path for the next
  hop MAC gives the interface.  The classifier entry's egress field
  takes the WLAN port instead of a bridge port; the fabric then writes
  the rewritten frame to the WLAN RX ring, and the ring delivers it to
  the interface.
- ingress: the flowtable reports the AP interface, or its bridge; the
  flow's pre-NAT source address leads through the bridge's neighbour
  entry and forwarding database to the interface.  The entry is
  installed like a switch port's, and its key is listed for the
  interface's ingress hook, which injects the matching frames so that
  they reach the entry.

The flows of a port are dropped when its interface is unregistered;
their traffic returns to the software path and the flowtable offers
them again once their hardware statistics stop.

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 drivers/net/ethernet/zte/zx279128s-eth.h  |  1 +
 drivers/net/ethernet/zte/zx279128s-ppe.c  | 92 ++++++++++++++++++-----
 drivers/net/ethernet/zte/zx279128s-wlan.c |  9 ++-
 3 files changed, 82 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/zte/zx279128s-eth.h b/drivers/net/ethernet/zte/zx279128s-eth.h
index b5a547eade35..a5c8df1c60c3 100644
--- a/drivers/net/ethernet/zte/zx279128s-eth.h
+++ b/drivers/net/ethernet/zte/zx279128s-eth.h
@@ -480,6 +480,7 @@ void zx_set_trap_dmac(struct zx_eth_adapter *adapter, int idx, const u8 *mac);
 extern const struct rhashtable_params zx_ppe_ht_params;
 void zx_update_traps(struct zx_eth_adapter *adapter);
 void zx_update_mac_tables(struct zx_eth_adapter *adapter);
+void zx_ppe_wlan_flush(struct zx_eth_adapter *adapter, int wlan_port);
 int zx_eth_setup_tc(struct net_device *dev, enum tc_setup_type type,
 		    void *type_data);
 
diff --git a/drivers/net/ethernet/zte/zx279128s-ppe.c b/drivers/net/ethernet/zte/zx279128s-ppe.c
index ff19d2cc67bd..e02d6bfbddd9 100644
--- a/drivers/net/ethernet/zte/zx279128s-ppe.c
+++ b/drivers/net/ethernet/zte/zx279128s-ppe.c
@@ -37,6 +37,8 @@ struct zx_ppe_entry {
 	u16			flow;
 	u16			nh;
 	u8			subnet;
+	s8			wlan_in;	/* WLAN port of the ingress, or -1 */
+	s8			wlan_out;	/* WLAN port of the egress, or -1 */
 };
 
 const struct rhashtable_params zx_ppe_ht_params = {
@@ -168,12 +170,13 @@ static void zx_ppe_slots(const struct zx_ppe_tuple *t, u16 slot[2])
 }
 
 /*
- * Classifier entry: rewrite index, egress port and forward flag, then the
- * key. Words 1-3 are the same constants in every entry of the stock
- * firmware, and so is the 0x44 in word 0.
+ * Classifier entry: rewrite index, egress port (a bridge port or a WLAN
+ * logical port) and forward flag, then the key. Words 1-3 are the same
+ * constants in every entry of the stock firmware, and so is the 0x44 in
+ * word 0.
  */
-static void zx_ppe_hash_entry(const struct zx_ppe_tuple *t, u16 flow, int port,
-			      u32 w[9])
+static void zx_ppe_hash_entry(const struct zx_ppe_tuple *t, u16 flow,
+			      int egress, u32 w[9])
 {
 	u8 key[20] = {};
 	u16 hw[7];
@@ -185,7 +188,7 @@ static void zx_ppe_hash_entry(const struct zx_ppe_tuple *t, u16 flow, int port,
 	for (i = 0; i < 7; i++)
 		zx_ppe_put_bits(key, 24 + 16 * i, 16, hw[i]);
 	w[0] = FIELD_PREP(ZX_CLA_W0_FLOW, flow) | ZX_CLA_W0_FWD |
-	       FIELD_PREP(ZX_CLA_W0_EGRESS, ZX_BRPORT(port)) | ZX_CLA_W0_BITS;
+	       FIELD_PREP(ZX_CLA_W0_EGRESS, egress) | ZX_CLA_W0_BITS;
 	w[1] = 0xfa11c000;
 	w[2] = 0x00000608;
 	w[3] = 0x80000000;
@@ -305,22 +308,17 @@ static int zx_ppe_flow_add(struct zx_eth_adapter *adapter,
 	__be32 new_saddr, new_daddr;
 	u16 slot[2];
 	u32 w[17];
-	int i, ret, port, subnet, flow, nh;
+	int i, ret, egress, subnet, flow, nh, ingress_ifindex = 0;
+	int wlan_in = -1, wlan_out = -1;
 
 	if (rhashtable_lookup_fast(&adapter->ppe_flows, &f->cookie, zx_ppe_ht_params))
 		return -EEXIST;
 
-	/* the hardware only sees frames from our switch ports */
 	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_META)) {
 		struct flow_match_meta match;
 
 		flow_rule_match_meta(rule, &match);
-		for (i = 0; i < ZX_NUM_PORTS; i++)
-			if (adapter->ports[i] &&
-			    adapter->ports[i]->ifindex == match.key->ingress_ifindex)
-				break;
-		if (i == ZX_NUM_PORTS)
-			return -EOPNOTSUPP;
+		ingress_ifindex = match.key->ingress_ifindex;
 	}
 
 	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_CONTROL)) {
@@ -363,6 +361,23 @@ static int zx_ppe_flow_add(struct zx_eth_adapter *adapter,
 	rw.new_sport = t.sport;
 	rw.new_dport = t.dport;
 
+	/*
+	 * The hardware sees frames from our switch ports, and those a WLAN
+	 * port's ingress hook injects for it (zx279128s-wlan.c).
+	 */
+	if (ingress_ifindex) {
+		for (i = 0; i < ZX_NUM_PORTS; i++)
+			if (adapter->ports[i] &&
+			    adapter->ports[i]->ifindex == ingress_ifindex)
+				break;
+		if (i == ZX_NUM_PORTS) {
+			wlan_in = zx_wlan_port_of_ingress(adapter, ingress_ifindex,
+							  t.saddr);
+			if (wlan_in < 0)
+				return -EOPNOTSUPP;
+		}
+	}
+
 	flow_action_for_each(i, act, &rule->action) {
 		switch (act->id) {
 		case FLOW_ACTION_MANGLE:
@@ -410,11 +425,19 @@ static int zx_ppe_flow_add(struct zx_eth_adapter *adapter,
 		}
 	}
 
-	if (!odev || !zx_eth_is_port(odev))
+	if (!odev)
 		return -EOPNOTSUPP;
-	port = ((struct zx_eth_priv *)netdev_priv(odev))->port;
 	if (!is_valid_ether_addr(eth.h_source) || !is_valid_ether_addr(eth.h_dest))
 		return -EOPNOTSUPP;
+	if (zx_eth_is_port(odev)) {
+		egress = ZX_BRPORT(((struct zx_eth_priv *)netdev_priv(odev))->port);
+	} else {
+		/* an AP interface, or the bridge in front of it */
+		wlan_out = zx_wlan_port_of_egress(adapter, odev, eth.h_dest);
+		if (wlan_out < 0)
+			return -EOPNOTSUPP;
+		egress = ZX_WLAN_PORT(wlan_out);
+	}
 
 	rw.sip = new_saddr != t.saddr;
 	rw.dip = new_daddr != t.daddr;
@@ -462,7 +485,7 @@ static int zx_ppe_flow_add(struct zx_eth_adapter *adapter,
 	ret = zx_pp_write(adapter, ZX_CLA_BASE, ZX_CLA_AGING, slot[1], w, 0);
 	if (ret)
 		goto err_nh;
-	zx_ppe_hash_entry(&t, flow, port, w);
+	zx_ppe_hash_entry(&t, flow, egress, w);
 	ret = zx_pp_write(adapter, ZX_CLA_BASE,
 			  slot[1] < ZX_PPE_HASH0_SIZE ? ZX_CLA_HASH0 : ZX_CLA_HASH1,
 			  slot[1] % ZX_PPE_HASH0_SIZE, w, 9);
@@ -474,11 +497,18 @@ static int zx_ppe_flow_add(struct zx_eth_adapter *adapter,
 	e->flow = flow;
 	e->nh = nh;
 	e->subnet = subnet;
+	e->wlan_in = wlan_in;
+	e->wlan_out = wlan_out;
 	ret = rhashtable_insert_fast(&adapter->ppe_flows, &e->node, zx_ppe_ht_params);
 	if (ret)
 		goto err_entry;
 	set_bit(e->hash, adapter->ppe_hash_used);
 	adapter->ppe_count++;
+	/* the frames of a WLAN ingress flow only reach the entry if injected */
+	if (wlan_in >= 0)
+		zx_wlan_flow_set(adapter, flow,
+				 zx_wlan_flow_key(t.proto, t.saddr, t.daddr,
+						  t.sport, t.dport), wlan_in);
 	return 0;
 
 err_entry:
@@ -499,6 +529,8 @@ static int zx_ppe_flow_add(struct zx_eth_adapter *adapter,
 static void zx_ppe_entry_remove(struct zx_eth_adapter *adapter,
 				struct zx_ppe_entry *e)
 {
+	if (e->wlan_in >= 0)
+		zx_wlan_flow_set(adapter, e->flow, 0, 0);
 	zx_pp_write(adapter, ZX_CLA_BASE,
 		    e->hash < ZX_PPE_HASH0_SIZE ? ZX_CLA_HASH0 : ZX_CLA_HASH1,
 		    e->hash % ZX_PPE_HASH0_SIZE, NULL, 0);
@@ -524,6 +556,32 @@ static int zx_ppe_flow_del(struct zx_eth_adapter *adapter,
 	return 0;
 }
 
+/*
+ * Drop the flows of a WLAN port whose interface goes away; their traffic
+ * returns to the software path, and the flowtable offers them again once
+ * their statistics stop.  Called with ppe_lock held.
+ */
+void zx_ppe_wlan_flush(struct zx_eth_adapter *adapter, int wlan_port)
+{
+	struct rhashtable_iter iter;
+	struct zx_ppe_entry *e;
+
+	rhashtable_walk_enter(&adapter->ppe_flows, &iter);
+	rhashtable_walk_start(&iter);
+	while ((e = rhashtable_walk_next(&iter))) {
+		if (IS_ERR(e))
+			continue;
+		if (e->wlan_in != wlan_port && e->wlan_out != wlan_port)
+			continue;
+		rhashtable_remove_fast(&adapter->ppe_flows, &e->node,
+				       zx_ppe_ht_params);
+		zx_ppe_entry_remove(adapter, e);
+		kfree(e);
+	}
+	rhashtable_walk_stop(&iter);
+	rhashtable_walk_exit(&iter);
+}
+
 /* No packet counters: report use from the entry's hit flag */
 static int zx_ppe_flow_stats(struct zx_eth_adapter *adapter,
 			     struct flow_cls_offload *f)
diff --git a/drivers/net/ethernet/zte/zx279128s-wlan.c b/drivers/net/ethernet/zte/zx279128s-wlan.c
index 17ba32bd993a..6c6f6a36d34f 100644
--- a/drivers/net/ethernet/zte/zx279128s-wlan.c
+++ b/drivers/net/ethernet/zte/zx279128s-wlan.c
@@ -707,9 +707,12 @@ static int zx_wlan_netdev_event(struct notifier_block *nb, unsigned long event,
 	if (event != NETDEV_UNREGISTER || !zx_wlan_is_ap(dev))
 		return NOTIFY_DONE;
 	mutex_lock(&w->adapter->ppe_lock);
-	for (i = 0; i < ZX_WLAN_PORTS; i++)
-		if (w->ports[i].vif == dev)
-			zx_wlan_port_put(w, i);
+	for (i = 0; i < ZX_WLAN_PORTS; i++) {
+		if (w->ports[i].vif != dev)
+			continue;
+		zx_ppe_wlan_flush(w->adapter, i);
+		zx_wlan_port_put(w, i);
+	}
 	mutex_unlock(&w->adapter->ppe_lock);
 	return NOTIFY_DONE;
 }
-- 
2.30.2

