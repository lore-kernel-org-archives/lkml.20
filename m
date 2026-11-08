Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794171851;
	b=hVziMY1cuvfAiFjSdFX850UsGbEy/zyVtLqe0Cs6syAn2vX3HhPDBDBAB/jgaCKh4y35
	 5NbtIegaBkkwEyIT4/3k78u3gcj26cXJdJudozmUKTL0gJXouqctwfavAmylkqjvLhHcK
	 RgRIMAnFrzNAVYVZ0lGz38WWqNqzMvJgCtO1AvCKGTLanoU2N7Mamkk0CaJqsTqODw/d7
	 /b5QDnQ0Je5D6V+0xwLybwhWdb9zaa4fLU/1g2/22JqFcPp5+WfyIDu6ZKfYgXGfHjvdm
	 hAswHfkx5YaId2Ivd4cG8k5+EDP+j1rTtaJVL8bbncw7aLO5xh6ggvkkbBAD7ZMcgyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794171851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eIb7bdwJudGm44awRNyhi/z38sBFIBc01LhzAmpW+h4=;
	b=OwhXY/Pehn8FRNvXUlYAFScuN5F9CC1Mj3dgLk0TzELb2/N/RZW3o2djiUTIsKlqQe30
	 n1eUtZY3HbyxWeVkAt5h0f73bvSn0VWRoew2oqxnkjQkmn/48oTZmC725rDAdAnkszCQ9
	 gQIwKZwqjPznM/ZKO8R9iyfiqTuJxyEp1Gzk00czBDr9bXTjapp5JdvQwkzBYBYbSrPoq
	 z51Far2hokR2JPa7Q1/dEF0J2XbdZCXKufquz3k0/2yPIeYdbx1pc7POGKdEoLzcrCbX4
	 sTikqM5oKXQnaMJ+ySqHQQnoCT2MP0MYXcdLrel0YvQUmOa9xRGHIaDwVjPY0AVkmXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m96FZTEu;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFC5606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DFC5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m96FZTEu
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so130314a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794171850; x=1794776650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIb7bdwJudGm44awRNyhi/z38sBFIBc01LhzAmpW+h4=;
        b=m96FZTEuIAb1CYOvgLsTEIMyqu1plbocUGEaOJnkyQkNav2+Oz1eUD1BpW3lwJpXTp
         kMHAbNkuMouCdo4oJe/tv+AwLFqY4uj0pvCBai177lKT1eaB27LpwOsRmUh36dFYEPGk
         ZgE+/VT5cgtbEe9NZTjFdnYWB5w8wL5NUD0AMhFUmTW3PGHe6dgp/OQ1HvubR5VW23qx
         mhb3DDxokoWis8dAGrQt6mKrBXYsepIj8yVr8Ucp99nz06j6L9ZC1FkGmhXRUaKNnqbD
         jBliXU7M0Xx6yntrVDoYxirnPsTr7SOADi21fooV7Uwhh5GMij8v1BWTDhQH0bTywPVk
         kIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171850; x=1794776650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eIb7bdwJudGm44awRNyhi/z38sBFIBc01LhzAmpW+h4=;
        b=b1ziAd0VuSQ9ukY3o7PG/olnAwCgA9KddVIPls5eWejQTIQJlThCBp3I13Z6n2fBr5
         HGZ/KtRhxx8kxC99NaJrLsQ1TAc9yoYPngXgXc9tM8CUHuWCa+At4FyQi7hmjhmkFT8Z
         FVSQ/QbuzTqPBC99uv2QhfViTigXjZLxEc6ZuFxr7CuWEzhzA/lJmzdaDhowKvEiJxO9
         pPMNljzcKl/WMlh7CLVpdtJ2T5lxVzkbQF61jByyeTSpJpnGb2kYyAiKzeFOKLXnrn03
         Plz3cku/JLflkTBpBfmSmrBP6xcfOptmectbwH6/RHHu24IZjaElVSZRTrFk2YkW9ttK
         wbTA==
X-Forwarded-Encrypted: i=1; AL+hErFb739RHgBIC5L1+eyxp6y3+t50gjefqMkQy9nM7NPgJOfrllO9etwQu0hwCMFu+wJ+G8hqleVtEhl7xoc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ejS7KiVMhR5Yqto+HNNyxLYKmEz63iT03cTQI2sNUUVlKP5BU
	jx2nHS0FmnxuC3vv7HEy1us5Dm5jg+tegyBJb4x9f3RybznVpBKQ6iYFBViOLQ==
X-Gm-Gg: AYBFou1INbBTB3erP9TE9Ofsbw8sC+MWTJEEA+JeJn+ZTc5GuSiPfJ9mJhe7q5eEI6z
	xl/WjDObljAXCal6iGXaEAEaBJQOReIm3ScIQP6ihOE1Ewbj3yqrWAV5KzF8b1dpgSFX1Tohjz2
	jtUhlkdN8oMMTNWzV3CsqVWOLZDOQVwd13ZmUz/heCIXkd8TMUYKWn3SA9leo5HTMgoXZPFgu/h
	IX6mRZoihBrBm9Ot0BEI20ucQZCmxBlYsEWoutr3yCN90d5IxboCIjsQYtIGjX+3bKIivzRBcLF
	ZW96fyC1HPvuZjqdWkvYQR+U0NBOqPxHGU5+QoZivjlaq8bih1AnZjbPsrQzyth0r6mzT0DXSrZ
	xTdT9VkTIcsC5WiVHYs14Y4jsX71CeZOwEvg202jVZvpEit4KEw1daW8l0y0bOcewLa2O6ZzsUO
	/J78LhD54Skagpb0dVwsJtvn7hJz1RBRlQ8LV569gXixh02O7WpTtymJyn5nl37oYpICLXfI90b
	CyUcX0JMElsbEbg97Bg3oGgwjbV+J2pTUjvzJpGNjLq9RJ9blZBcXQpAAJpURJrb9YkGcWsZfKZ
	8zIW70ssx8yR9OO7U4Lv43i+9YMBCOKh8tOe5kUFcUIL0UgkiWAhig==
X-Received: by 2002:a17:90b:4a51:b0:3a4:b30b:b501 with SMTP id 98e67ed59e1d1-3b12d0e965amr2097709a91.9.1794171850235;
        Sun, 08 Nov 2026 13:04:10 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1279158c4sm4209414a91.14.2026.11.08.13.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:04:09 -0800 (PST)
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
Subject: [PATCH net] net: dsa: motorcomm: Reread port flags on bridge joining
Date: Mon,  9 Nov 2026 05:03:54 +0800
Message-ID: <20261108210357.1633411-1-mmyangfl@gmail.com>
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

DSA replays neither BR_ISOLATED nor BR_HAIRPIN_MODE on join (e.g. a LAG
member rejoining its bond), so the cached flags survive into the next
bridge join and program stale hairpin and port isolation state. Sync
them from the bridge port.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 33e5fc127244..fcc3a299ed66 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -1405,6 +1405,9 @@ yt921x_dsa_port_bridge_join(struct dsa_switch *ds, int port,
 			    struct netlink_ext_ack *extack)
 {
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
+	struct yt921x_port *pp = &priv->ports[port];
+	struct net_device *brport_dev;
+	struct dsa_port *dp;
 	u16 ports_mask;
 	int res;
 
@@ -1414,7 +1417,12 @@ yt921x_dsa_port_bridge_join(struct dsa_switch *ds, int port,
 	ports_mask = dsa_bridge_ports(ds, bridge.dev);
 	ports_mask |= priv->cpu_ports_mask;
 
+	dp = dsa_to_port(ds, port);
+	brport_dev = dsa_port_to_bridge_port(dp);
+
 	mutex_lock(&priv->reg_lock);
+	pp->isolated = br_port_flag_is_set(brport_dev, BR_ISOLATED);
+	pp->hairpin = br_port_flag_is_set(brport_dev, BR_HAIRPIN_MODE);
 	res = yt921x_bridge_join(priv, port, ports_mask);
 	mutex_unlock(&priv->reg_lock);
 
-- 
2.53.0

