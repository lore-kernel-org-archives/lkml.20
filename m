Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780735;
	b=Gxm1AG9hTaPaoKy0SdVCj9hl7ko7wW+s6Waiw7fq7CHpAzaQAmHFvsY1CpUZpaY+zlt0
	 F7zRegxV1+MjS1ABjEq8tf/pUmoCBGbkpjjhHM4xg1ly/rqF3CNb8vYYh4EEBcAg9UGEV
	 n0WkJExItNeLpBoHUTkSVNZvwyIpD+4yrc8QnxpKhuBdNrGjd64GcH8ww4YdFlP3mfRMN
	 BUgtOnKsxtTlWMmL0zafPsG8wEI7dwgTF7nWq2hZFiG/9u07HK+dwxABUb3NATUy+zTxz
	 7E3Lq54f1A+A6CKpu76L/RNH0LQ2k1eGOVR+f2uK2rHmAHl0NALyIsjYg7DnxQQYuiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SKov32XU9Y41q7b/wBe4ePfENttgi4Sl02ViD3QUcIY=;
	b=NSjqBbZ24xE6g8CThVZZDyC+48g4WviRtza6tHRsBlWWR/oRVgNDYaWQ3banDsi8N9d3
	 TV0jqI1p+HVJxn8l+hn75pYtnLF3KW8DgNfT9LZpA51/U/IyzN+rvmi8gqRxYGYK/QuZB
	 A2XpBVEZON7hYljxlLwkAXzrOGJXAUV+YhWO1N0jB1R3kZuODl0Tjq8HWfUJUtbXPWVZ1
	 REG2GT++U0Kc1C0HpCHWNZ5XtCzjyrbScEyuKfXGr8FIrFhKgZNw8kISCBrAErz6kyPBs
	 ae/+i7umVmEFomks3WW7bWwIbeQJByT+ZnnHEVrWDfYU5xb/uBJnqbgJg6405nPsnHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TdvgSKoP;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B03C606A339
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B03C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TdvgSKoP
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b4a13789b0so425037a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793780733; x=1794385533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKov32XU9Y41q7b/wBe4ePfENttgi4Sl02ViD3QUcIY=;
        b=TdvgSKoPJ++mmJB1pO8sZ5s49ImxxK4K01WWNMCkWquHqtnADDkmdKKYO4Oa9tPTvn
         xpKvA3IIqGXhkN8VA8fHVadheq79+ioFUBtFQzHJhkiLvgypNWAMbQEb4HBLt5Tx78AW
         Ol/9Mh/uHn8UIiKDXBksKajimiiftm+HWCGKnF6kmOEMvTQdaKGFYx6upHifdxHh/XN5
         C6jQaf3d5w95SqzsYEadUjXU/i5cqbizWRHixmd+4XlE5yaclANQnAbDHadASu/eBEqw
         bK93Sj8rhdJwcG0CNnO7caVcALKOFWhlTb5ilCilLruhlOhQ6WRExZSvABD4BbfcPWaz
         UVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780733; x=1794385533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SKov32XU9Y41q7b/wBe4ePfENttgi4Sl02ViD3QUcIY=;
        b=oCi1lEhjVhhQNKOYTzW3qcx7VvjUa/5HPGaGdHge4l5R/k7rscct6frPhoYIQ9dnKH
         iQfWSuRiGdueP1yNCJKr/ihlbsxW0SWVV5znYE1cqdoe7dI4b2JUZj9/HhCtdJZ2/lfN
         TCJxWvFiTKZ+gd2k0MlF1JcaNAyvMWxs3w/UXrimBJuiKzgRVr0ST+DKDFj+D4Dg2hy+
         RDGijA8mdbaNmHy/KlPDMfQhCMUi24F2nywxyXIRx7M7QKyStIin27Ybx6SuvDU979wl
         mX2SRDJds7ol1KGdJtPRTimshU+b9wUvXIiQ9k+q01wN7fwuPFeu8ZK5q02OO0K+Fpcv
         wbNQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6/CM3SAOcwV9l+re8IadrnyKqLihMecnbg9wluWdC9sWWokPV8ZHObZjbkPYK1GAxFeJwTIKOrfSni4E=@vger.kernel.org
X-Gm-Message-State: APuU4Z91kmCH5T6y6S53Q1MXTrImJJz8B3hVXkKLDJBwxHTDUzm1LqgR
	SDMx2oX72oiByi3zqJHF/rVFdAJJdaT4VHTeYxOHoMWqpljixujBBwZz
X-Gm-Gg: AYBFou0IZ2AZma/Zh+koIcBGgDbcWeqvYcyZ4ZtrDxsV3aLymXTQ82tNweCPxV8r2oT
	IbjMIE2m6C22lv5V73oWeYqKm9clcXSyZ6q0a6DazguYlLlFvNJkAQdkPuhWHWjrEJszx5vHIG9
	xQNMtwYz0Ab7d13slPxaWIneAALU+AeskqpZlBD+bUJXsHAtRVZPaIf2YpTHNsdlpZN45xrcIRR
	gPpanbd3fDa1w7N3pUsNY29Fua4tu8UROY71d5IoPzIPsMHTzBbsbpo+sxHkR56crZbptyRtO8n
	SGMoO/a40IyJFDJGYCmaLOY9iueVCmBFG9ckLwjJTkD1CASELUN4LCvB8Jva/sMxWcRcm3/q1m3
	ysKUFqppqYAycgHuVXV7I0hGx9jVru/dcon9xJOvlxqxOoWym/KyIlcObtCTWhIl76ftHI8guoL
	MkoA+VEktIcNhV5OQidZuOiUro2mqoVjlPnYMNq6YKK1bYyhNgreIaI/iZQr41JphdoSvS4IuDm
	yJrAgF00l9gG3jjcEUqSsKB0dWxLfmYKSwYQKJPiBJmjNYyD8j0pTjBfo9i6QNny9Ygqygk0NZX
	hzDqm7rijExZSaJuesAGI7+rOo+Ieu8UKIhm0A+ZwexfSU6SPVLBYLnSdFcNth6OLHRNoDDKBN3
	8LIlOumHFon6RoLkMX5Kg6N3B9VK5rQDmijWDW94m/GnTJCLDvqjK7AShlis/rdnSwqv+A8RWHk
	6knDCRESvRWo8AVb2w4gcqlQ==
X-Received: by 2002:aa7:da45:0:b0:6b3:e89b:128f with SMTP id 4fb4d7f45d1cf-6b4d4d6d938mr8395731a12.9.1793780732855;
        Wed, 04 Nov 2026 00:25:32 -0800 (PST)
Received: from desktop.home.arpa (2a02-1810-1e16-ac80-48ed-b9ce-6098-90a2.ip6.access.telenet.be. [2a02:1810:1e16:ac80:48ed:b9ce:6098:90a2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac81386sm483243a12.29.2026.11.04.00.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:25:32 -0800 (PST)
From: Stijn Cleynhens <stijncleynhens@gmail.com>
To: netdev@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 2/2] net: dsa: realtek: rtl8365mb: keep the neutral PVID in VLAN-unaware bridges
Date: Wed,  4 Nov 2026 09:25:14 +0100
Message-ID: <20261104082514.2139278-3-stijncleynhens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104082514.2139278-1-stijncleynhens@gmail.com>
References: <20261104082514.2139278-1-stijncleynhens@gmail.com>
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

The switch looks up its forwarding database by the VLAN that it
classifies a frame to, and untagged frames are classified to the port
PVID. With configure_vlan_while_not_filtering, the bridge PVID is
programmed into the port also while the bridge is VLAN-unaware, so
untagged frames of such a bridge are looked up in VLAN 1. DSA however
installs the FDB and MDB entries of a VLAN-unaware bridge with VID 0,
so these entries never match a lookup.

This breaks assisted learning on the CPU port: when a station that was
first learned behind a user port moves behind the CPU port (e.g. a
wireless client roaming between access points), the static entry that
DSA installs for it on the CPU port does not override the learned one,
and unicast to the station is dropped as a hairpin until the learned
entry ages out. Clients that need a DHCP reply in that window do not
get one.

Keep the PVID requested by the bridge per port and only program it
while the port filters VLANs. Otherwise keep the neutral PVID (VLANMC
index 0, VID 0) that standalone ports already use, so that untagged
frames are classified to the VID of the bridge entries. Commit the PVID
again when VLAN filtering is toggled.

This only covers untagged frames. Tagged frames in a VLAN-unaware bridge
are still classified by their tag, so a tagged station that roams keeps
hitting the stale learned entry until it ages out, as before. Fixing
that would need the switch to ignore the C-tag on ingress of these
ports, which is left for a separate change.

Fixes: 336e3e4a1ab3 ("net: dsa: realtek: rtl8365mb: add FDB support")
Signed-off-by: Stijn Cleynhens <stijncleynhens@gmail.com>
---
 drivers/net/dsa/realtek/rtl8365mb_main.c | 139 +++++++++++++++--------
 drivers/net/dsa/realtek/rtl8365mb_vlan.c |   9 +-
 drivers/net/dsa/realtek/rtl8365mb_vlan.h |   3 +-
 3 files changed, 101 insertions(+), 50 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index b90e46c16..a7db267bc 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -838,6 +838,8 @@ struct rtl8365mb_cpu {
  *         access via rtl8365mb_get_stats64
  * @stats_lock: protect the stats structure during read/update
  * @mib_work: delayed work for polling MIB counters
+ * @bridge_pvid: PVID requested by the bridge, 0 if none. Only programmed
+ *               while the port filters VLANs. Protected by vlan_lock.
  */
 struct rtl8365mb_port {
 	struct realtek_priv *priv;
@@ -845,6 +847,7 @@ struct rtl8365mb_port {
 	struct rtnl_link_stats64 stats;
 	spinlock_t stats_lock;
 	struct delayed_work mib_work;
+	u16 bridge_pvid;
 };
 
 /**
@@ -2004,6 +2007,41 @@ rtl8365mb_port_set_vlan_egress_mode(struct realtek_priv *priv, int port,
 			RTL8365MB_PORT_MISC_CFG_VLAN_EGRESS_MODE_MASK, val);
 }
 
+/* Program the PVID that the port should use for untagged frames: the PVID of
+ * the bridge while the port filters VLANs, and the neutral PVID (VID 0)
+ * otherwise. A VLAN-unaware bridge, like a standalone port, gets its FDB and
+ * MDB entries with VID 0 from DSA. As the switch looks up its forwarding
+ * database by the VLAN that it classifies a frame to, a bridge PVID would make
+ * those entries miss every lookup.
+ */
+static int rtl8365mb_port_commit_pvid(struct dsa_switch *ds, int port,
+				      bool vlan_filtering,
+				      struct netlink_ext_ack *extack)
+{
+	struct realtek_priv *priv = ds->priv;
+	struct rtl8365mb *mb = priv->chip_data;
+	u16 hw_pvid, pvid = 0;
+	int ret;
+
+	lockdep_assert_held(&priv->vlan_lock);
+
+	if (vlan_filtering)
+		pvid = mb->ports[port].bridge_pvid;
+
+	ret = rtl8365mb_vlan_port_get_pvid(priv, port, &hw_pvid);
+	if (ret)
+		return ret;
+
+	if (pvid == hw_pvid)
+		return 0;
+
+	if (pvid)
+		return rtl8365mb_vlan_pvid_port_set(ds, port, pvid, extack);
+
+	return rtl8365mb_vlan_pvid_port_clear(ds, port, hw_pvid,
+					      vlan_filtering);
+}
+
 static int rtl8365mb_port_vlan_filtering(struct dsa_switch *ds, int port,
 					 bool vlan_filtering,
 					 struct netlink_ext_ack *extack)
@@ -2011,35 +2049,29 @@ static int rtl8365mb_port_vlan_filtering(struct dsa_switch *ds, int port,
 	enum rtl8365mb_frame_ingress accepted_frame, prev_accepted_frame;
 	enum rtl8365mb_vlan_egress_mode mode;
 	struct realtek_priv *priv = ds->priv;
+	struct rtl8365mb *mb = priv->chip_data;
 	u32 configured_ports = 0;
 	struct dsa_port *dp;
-	u16 pvid_vid;
 	int ret;
 
 	dev_dbg(priv->dev, "port %d: %s VLAN filtering\n", port,
 		vlan_filtering ? "enable" : "disable");
 
+	mutex_lock(&priv->vlan_lock);
+
 	ret = rtl8365mb_vlan_port_get_framefilter(priv, port,
 						  &prev_accepted_frame);
 	if (ret) {
 		NL_SET_ERR_MSG_MOD(extack,
 				   "Failed to get current framefilter");
-		return ret;
+		goto out_unlock;
 	}
 
 	/* While filtering, only accepts untagged frames if PVID is enabled */
-	if (vlan_filtering) {
-		ret = rtl8365mb_vlan_port_get_pvid(priv, port, &pvid_vid);
-		if (ret)
-			return ret;
-
-		if (pvid_vid)
-			accepted_frame = RTL8365MB_FRAME_TYPE_ANY_FRAME;
-		else
-			accepted_frame = RTL8365MB_FRAME_TYPE_TAGGED_ONLY;
-	} else {
+	if (vlan_filtering && !mb->ports[port].bridge_pvid)
+		accepted_frame = RTL8365MB_FRAME_TYPE_TAGGED_ONLY;
+	else
 		accepted_frame = RTL8365MB_FRAME_TYPE_ANY_FRAME;
-	}
 
 	/* When vlan filter is enable/disabled in a bridge, this function is
 	 * called for all member ports. We need to enable/disable ingress
@@ -2047,7 +2079,7 @@ static int rtl8365mb_port_vlan_filtering(struct dsa_switch *ds, int port,
 	 */
 	ret = rtl8365mb_port_set_ingress_filtering(priv, port, vlan_filtering);
 	if (ret)
-		return ret;
+		goto out_unlock;
 
 	/* However, we also enable/disable egress filtering because the switch
 	 * still consider the egress interface VLAN membership to forward the
@@ -2083,12 +2115,18 @@ static int rtl8365mb_port_vlan_filtering(struct dsa_switch *ds, int port,
 	else
 		mode = RTL8365MB_VLAN_EGRESS_MODE_REAL_KEEP;
 
-	ret = rtl8365mb_port_set_vlan_egress_mode(priv, port, mode);
+	ret = rtl8365mb_port_commit_pvid(ds, port, vlan_filtering, extack);
 	if (ret)
 		goto undo_set_framefilter;
 
-	return ret;
+	ret = rtl8365mb_port_set_vlan_egress_mode(priv, port, mode);
+	if (ret)
+		goto undo_commit_pvid;
+
+	goto out_unlock;
 
+undo_commit_pvid:
+	(void)rtl8365mb_port_commit_pvid(ds, port, !vlan_filtering, NULL);
 undo_set_framefilter:
 	if (prev_accepted_frame != accepted_frame)
 		rtl8365mb_vlan_port_set_framefilter(priv, port,
@@ -2111,6 +2149,8 @@ static int rtl8365mb_port_vlan_filtering(struct dsa_switch *ds, int port,
 
 	rtl8365mb_port_set_ingress_filtering(priv, port, !vlan_filtering);
 
+out_unlock:
+	mutex_unlock(&priv->vlan_lock);
 	return ret;
 }
 
@@ -2120,8 +2160,10 @@ static int rtl8365mb_port_vlan_add(struct dsa_switch *ds, int port,
 {
 	bool untagged = !!(vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED);
 	bool pvid = !!(vlan->flags & BRIDGE_VLAN_INFO_PVID);
-	u16 pvid_vid;
 	struct realtek_priv *priv = ds->priv;
+	struct rtl8365mb *mb = priv->chip_data;
+	u16 prev_bridge_pvid, *bridge_pvid;
+	bool vlan_filtering;
 	int ret;
 
 	dev_dbg(priv->dev, "add VLAN %d on port %d, %s, %s\n",
@@ -2137,41 +2179,33 @@ static int rtl8365mb_port_vlan_add(struct dsa_switch *ds, int port,
 
 	mutex_lock(&priv->vlan_lock);
 
-	ret = rtl8365mb_vlan_port_get_pvid(priv, port, &pvid_vid);
-	if (ret)
-		goto out_unlock;
+	vlan_filtering = dsa_port_is_vlan_filtering(dsa_to_port(ds, port));
+	bridge_pvid = &mb->ports[port].bridge_pvid;
 
-	/* Set PVID if needed */
-	if (pvid) {
-		ret = rtl8365mb_vlan_pvid_port_set(ds, port, vlan->vid,
-						   extack);
-		if (ret)
-			goto out_unlock;
-	} else {
-		/* or try to unset it if not */
-		ret = rtl8365mb_vlan_pvid_port_clear(ds, port, vlan->vid);
-		if (ret)
-			goto out_unlock;
-	}
+	/* Set PVID if needed, or unset it if this VLAN was the PVID */
+	prev_bridge_pvid = *bridge_pvid;
+	if (pvid)
+		*bridge_pvid = vlan->vid;
+	else if (*bridge_pvid == vlan->vid)
+		*bridge_pvid = 0;
+
+	ret = rtl8365mb_port_commit_pvid(ds, port, vlan_filtering, extack);
+	if (ret)
+		goto undo_bridge_pvid;
 
 	/* add port to vlan4k. It knows nothing about PVID */
 	ret = rtl8365mb_vlan_4k_port_add(ds, port, vlan, extack);
 	if (ret)
-		goto undo_set_pvid;
+		goto undo_commit_pvid;
 
-	ret = 0;
 	goto out_unlock;
 
-undo_set_pvid:
-	/* undo the pvid definition */
-	if (pvid != (pvid_vid == vlan->vid)) {
-		if (pvid_vid)
-			(void)rtl8365mb_vlan_pvid_port_set(ds, port, pvid_vid,
-							   NULL);
-		else
-			(void)rtl8365mb_vlan_pvid_port_clear(ds, port,
-							     vlan->vid);
-	}
+undo_commit_pvid:
+	*bridge_pvid = prev_bridge_pvid;
+	(void)rtl8365mb_port_commit_pvid(ds, port, vlan_filtering, NULL);
+	goto out_unlock;
+undo_bridge_pvid:
+	*bridge_pvid = prev_bridge_pvid;
 out_unlock:
 	mutex_unlock(&priv->vlan_lock);
 	return ret;
@@ -2183,6 +2217,9 @@ static int rtl8365mb_port_vlan_del(struct dsa_switch *ds, int port,
 	bool untagged = !!(vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED);
 	bool pvid = !!(vlan->flags & BRIDGE_VLAN_INFO_PVID);
 	struct realtek_priv *priv = ds->priv;
+	struct rtl8365mb *mb = priv->chip_data;
+	u16 prev_bridge_pvid, *bridge_pvid;
+	bool vlan_filtering;
 	int ret;
 
 	dev_dbg(priv->dev, "del VLAN %d on port %d, %s, %s\n",
@@ -2193,10 +2230,20 @@ static int rtl8365mb_port_vlan_del(struct dsa_switch *ds, int port,
 	if (vlan->vid == 0)
 		return -EOPNOTSUPP;
 
+	vlan_filtering = dsa_port_is_vlan_filtering(dsa_to_port(ds, port));
+	bridge_pvid = &mb->ports[port].bridge_pvid;
+
 	mutex_lock(&priv->vlan_lock);
-	ret = rtl8365mb_vlan_pvid_port_clear(ds, port, vlan->vid);
-	if (ret)
+	prev_bridge_pvid = *bridge_pvid;
+	if (*bridge_pvid == vlan->vid)
+		*bridge_pvid = 0;
+
+	ret = rtl8365mb_port_commit_pvid(ds, port, vlan_filtering, NULL);
+	if (ret) {
+		/* keep the state in line with the PVID still in hardware */
+		*bridge_pvid = prev_bridge_pvid;
 		goto out_unlock;
+	}
 
 	ret = rtl8365mb_vlan_4k_port_del(ds, port, vlan);
 	/* There is little incentive to try to undo the removal of PVID (if it
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
index 58948e76f..43e0efd8e 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
@@ -42,7 +42,8 @@
  *    may be useful for ACL rules which specify alternative forwarding
  *    decisions.
  *
- * VLANMC index 0 is reserved as a neutral PVID, used for standalone ports.
+ * VLANMC index 0 is reserved as a neutral PVID, used for standalone ports and
+ * for the ports of a VLAN-unaware bridge.
  *
  */
 
@@ -892,6 +893,7 @@ int rtl8365mb_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
  * @ds: dsa switch instance
  * @port: port index
  * @vid:  VLAN VID for PVID
+ * @vlan_filtering: whether the port filters VLANs once the PVID is cleared
  *
  * Resets the target port's hardware PVID allocation to 0. Cleans up and frees
  * the associated VLANMC entry if no other ports are referencing it.
@@ -900,7 +902,8 @@ int rtl8365mb_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
  * Takes and releases &priv->map_lock.
  * Return: 0 on success, or a negative error code on failure.
  */
-int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
+int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid,
+				   bool vlan_filtering)
 {
 	enum rtl8365mb_frame_ingress accepted_frame, prev_accepted_frame;
 	struct realtek_priv *priv = ds->priv;
@@ -935,7 +938,7 @@ int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
 	/* Changing accept frame is what really removes PVID. But only do
 	 * that if we are filtering vlan
 	 */
-	if (dsa_port_is_vlan_filtering(dsa_to_port(ds, port))) {
+	if (vlan_filtering) {
 		accepted_frame = RTL8365MB_FRAME_TYPE_TAGGED_ONLY;
 
 		ret = rtl8365mb_vlan_port_set_framefilter(priv, port,
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.h b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
index 809034009..515b2e591 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
@@ -36,5 +36,6 @@ int rtl8365mb_vlan_4k_port_del(struct dsa_switch *ds, int port,
 			       const struct switchdev_obj_port_vlan *vlan);
 int rtl8365mb_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
 				 struct netlink_ext_ack *extack);
-int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid);
+int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid,
+				   bool vlan_filtering);
 #endif /* _REALTEK_RTL8365MB_VLAN_H */
-- 
2.56.0

