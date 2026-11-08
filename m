Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794135030;
	b=GytU75/KI9QSsRv7aMG3bPJi4zEivpiRUFXNWpZKeqh4Mu3T32CCbg2A5owV/xOMVUoX
	 4PcLnXckhrakSxf8yPlLnEwWsGMUkTLxzqgyw9hzOsk5/lNhSA7CuJmdL4LMfm+5LLIy6
	 iv3JM+TfyiMvD9ezknJozJs9KxCOYcTYYJdDHAHjqAp6kvvyzzAakhTLyM7HaI/l/4D0x
	 eES9oaj5/kEQzDu3sh0nmAoYr52fJ51irVWWI6944YQluAsRKnziPu2I28walucueV0Oy
	 as94IZvrS9bKGqMgE+iUfS/T02CQQhsuM+ZEagkcCO293DdEFtrBC1gdK6uI/j5QeYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794135030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DWmy/dZteMlGJY6PW1sSapqkw3qIXQygfTGSZR/3fgI=;
	b=qaWQxE6DeG5QVc2l1TmFyrxyoaCVG7P8SvxR16viuvK2t+eYSrgjNtyJjzofuH2GSIUl
	 REd5+S3A4b8RdJ9MqBen1G10OVrKliUU/a9/ZuKDPfnK555kxYWJXRvy7HeHvi6o5OMaF
	 kDn4UUAgsVMXMahvAewFiJ2pAWvfhsXBCRf8UznW6E15dVwHvFYNS9OJOveVpd3li+UYG
	 kWVkpOOlmgAl2I3qB0gha4DTK5DTr8thezNR9nozdRc/5Jx83P4a2stVsdY36gHExvYwv
	 22zjtAjw8Tw7D8Jyb4juNNJyssY900kUHCgvHSQ7dZThCG5vx4b0SvcDujVUKPfTFOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tZyx5sDK;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8C9606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 10:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA8C9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tZyx5sDK
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so31019b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 02:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794135029; x=1794739829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DWmy/dZteMlGJY6PW1sSapqkw3qIXQygfTGSZR/3fgI=;
        b=tZyx5sDKvP+9pypzfhAqTaAonwmS7AYEPYj54aQFYsUejVK6sSEd5+8u/yt1wSJGUi
         Y+hCcWOeKNTpRrcK+DLo3Yhj/krxhxzSctXU38d1yzIO6NPPg9e7IMLw5FNUGNcM426w
         2Llna+y33rk1lr957FRpGdVkhNpNK8KxPxKKb+HKu6i0jVtXEJMaSZtJw7c6IJ3hPS75
         6YrccNKJtaxip+WRE/Q2BWtjcjif6lmZD9IrqLQN6MWdFQnkxRr2zM4qm8zxSvivtC+i
         nU4cVrgJmZz1F7alY2TR5R+/gUJ3uIdKa47tDAVrGCedUQqGYMcm+AnJYyDkaequNGo6
         Lb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794135029; x=1794739829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWmy/dZteMlGJY6PW1sSapqkw3qIXQygfTGSZR/3fgI=;
        b=MMmEEEcicAZFXyrGxotbtboiXEO7uKmPmbiCu7TR7YG15KVUte9DgZz3xE9ngRk9ag
         tg3gNpkiY34oFubbv4o+BrCrmffWGVhqFAxKFwKifnabFkYrSYs3gL+TQzLiQBPmQ8/a
         I+0kXT9n2wRccr0Kzj1EPDoGTxzMqSOfG4ttC8WKTqrnoQvKHD2JlAsd2EPSfRwbzYmw
         hJYtVtS84QTjdA56H/l+LIjytkL+MjpqzM3DITPdykjHZyrwWcy11RZJosDpx+9+cS4g
         FCTTZIQJzdM+KxnwzoC4snKzBAix9rTKJFbfbp+fupLeBEJSEROgXIAi0BrZkgPHVGxJ
         heWw==
X-Forwarded-Encrypted: i=1; AL+hErGr0vcpd3/pBGku0hANKawp+yBNX0HiQ1OMuLdSXfGfEUnnDQdZdkVWLOSm4fRVl3e+AdAityrZs0wYU+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z96fqE/4rE8uIRFz3i3kxobab3ZWkiejTaMgw4IXJTBnWhSZpex
	s5FOaUeOy8uTtXue/8B5HRHEVazymhlOm1cLUOciNoHJ2tO1ALTApkqu
X-Gm-Gg: AYBFou0SSOn0TjwP7GPyg4TkhDuEPWVPhnLneogmVPaK6MAIssrokNuwBSRVLXqwJhP
	0WSQ+iQfL+Dc1kxomwnYoGzT52UhUAkL+fsMmEMrY7EtltYsHz6gdb1lF20ixOVUSrWaWE8Gt0i
	DA2A7W0oeZjD/JThf57Yb7ud4yltxfqWWyFerUvH4wVgiOdaPTumg0CgTCx/lZfN+ntzAuooI7O
	XMZja6WkejFunZtc03s66xtq6zLBTIOTX6hT6WImAs7H3J25R8OAPhoXECL7ZV2E/QXXx8a8npE
	Ruw8x+F8iA0uF73LXPTorenX/rIi1WpDOYP+TxZyDrkv+74s5F5CkGpNxuoeoGIkhzT7Uv6n2yA
	77nWRrnj0VKIbrtnAoIgr9KADP9rZBRhllAZnT0ArFecyA4oIa4e+6W1PwbovfjMWay3mArDNA5
	yBJGFUVRjYJ4jksci9WroRVsnF+jlL2BSRNzn1Xhldphg1RgE5UNSk2Pf/QRzzZrqetMVdB1Fak
	D037K5VcjKFr9XyUHxTTsYK8ZeZlx9lAvP17+oGVIhiRVy6eQlwWq1IINojh0SlH7BDIVaU592S
	QG9z4cu9r3XZ3JjAJhRm2n1OYLc+5WRrcshHOJGCTJiZCBV6XxjnDw==
X-Received: by 2002:a05:6a00:3d56:b0:8b6:2333:54a3 with SMTP id d2e1a72fcca58-8b623335653mr1014470b3a.39.1794135028851;
        Sun, 08 Nov 2026 02:50:28 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b64933fa41sm425422b3a.22.2026.11.08.02.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 02:50:28 -0800 (PST)
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
Subject: [PATCH net-next] net: dsa: motorcomm: Add LAG FDB callbacks
Date: Sun,  8 Nov 2026 18:50:09 +0800
Message-ID: <20261108105012.1326929-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Fill the driver-side DSA gaps for LAG FDB offload.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 33e5fc127244..f73eed06437b 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -883,6 +883,52 @@ yt921x_dsa_port_fdb_add(struct dsa_switch *ds, int port,
 	return res;
 }
 
+static int
+yt921x_dsa_lag_fdb_del(struct dsa_switch *ds, struct dsa_lag lag,
+		       const unsigned char *addr, u16 vid, struct dsa_db db)
+{
+	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
+	struct dsa_port *dp;
+	u16 ports_mask;
+	int res;
+
+	if (!lag.id)
+		return -EINVAL;
+
+	ports_mask = 0;
+	dsa_lag_foreach_port(dp, ds->dst, &lag)
+		ports_mask |= BIT(dp->index);
+
+	mutex_lock(&priv->reg_lock);
+	res = yt921x_fdb_leave(priv, addr, vid, ports_mask);
+	mutex_unlock(&priv->reg_lock);
+
+	return res;
+}
+
+static int
+yt921x_dsa_lag_fdb_add(struct dsa_switch *ds, struct dsa_lag lag,
+		       const unsigned char *addr, u16 vid, struct dsa_db db)
+{
+	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
+	struct dsa_port *dp;
+	u16 ports_mask;
+	int res;
+
+	if (!lag.id)
+		return -EINVAL;
+
+	ports_mask = 0;
+	dsa_lag_foreach_port(dp, ds->dst, &lag)
+		ports_mask |= BIT(dp->index);
+
+	mutex_lock(&priv->reg_lock);
+	res = yt921x_fdb_join(priv, addr, vid, ports_mask);
+	mutex_unlock(&priv->reg_lock);
+
+	return res;
+}
+
 static int
 yt921x_dsa_port_mdb_del(struct dsa_switch *ds, int port,
 			const struct switchdev_obj_port_mdb *mdb,
@@ -2536,6 +2582,8 @@ static const struct dsa_switch_ops yt921x_dsa_switch_ops = {
 	.set_ageing_time	= yt921x_dsa_set_ageing_time,
 	.port_fdb_del		= yt921x_dsa_port_fdb_del,
 	.port_fdb_add		= yt921x_dsa_port_fdb_add,
+	.lag_fdb_del		= yt921x_dsa_lag_fdb_del,
+	.lag_fdb_add		= yt921x_dsa_lag_fdb_add,
 	.port_mdb_del		= yt921x_dsa_port_mdb_del,
 	.port_mdb_add		= yt921x_dsa_port_mdb_add,
 	/* vlan */
-- 
2.53.0

