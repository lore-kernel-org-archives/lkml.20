Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053842;
	b=t0BBJUZ0ErOWehsqgD2kbsivdP3YLnxk8GwphjonvZVzHDL1RI2EwRuIMBO5vXw3oMsQ
	 y0iDLdM8wYr0O2WJxMFHMgG3fmHohRxaOd+5pd15ytyd+6ZGG5ZRk+j2B97CoR6GmsoNu
	 ogEPwSb/GDvzQyiLOxxp2U8lZPoZOhmYP1gIxyjwKkcHq97s9pEhdotvo3fBNb4rw5EiR
	 jRPdPioxCcLuD2aZy9wO33UfrQUnl7X1XDMe1S8S53qzs0bf/54pzKSrw5gO+s/ADxf6k
	 h2PSe+HbRdq5bmNA7EaxRT4nmB55oW/fuV/2lQug2MTjFbCXF7SXCdU8eT3ze2LIHAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r6IZKgn5NP/PSJ6/x6wK0tLeYozouVCBtxsXOn7zuVY=;
	b=PMG/T+acTg5cXYE1eHHafvluOgW0wuniJnd/RxuyfaAehmwEZnVJZNTdUbID2nCkLwhH
	 IIuGgAp/jYB5vTnIJIPtTLYJrDc1Af9StZTg/rMNadYEeKWr5p7F2peehgm6bArhd+ECJ
	 /zUct2KHPsF9aMAOPwQU1tNtz7kQ++/zEf6rvhX0IUzqcR47vis/OQot/xR72Wt7jKMSK
	 FVlVgHBkehwNpWKz1xdISJtSYOpbzrrdel4NZZ1OUmE6GcCc35BnUxXEtWaPQDPgxRwlS
	 2jIJjiPC4+p2Sk/dSFQXjIQuK1IMFEYVB7RInmKc5vcBz/3KpggmR00O2tyjmckwG5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HrcbeUYZ;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35740606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35740606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HrcbeUYZ
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ed1e9ae5a8so5062875ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 04:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794053841; x=1794658641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6IZKgn5NP/PSJ6/x6wK0tLeYozouVCBtxsXOn7zuVY=;
        b=HrcbeUYZxCcTUeDyJm40+nN1p+1vcWF5/QF/NIr/1JSIm4ix1TxnUD29bbXYlf3TEk
         VMDhWMB4uzYpLZ5gzhOEGr4i1BNi/+jObFW84VWsB+yygHrnyKXpe5ak6l+CSDbiUt1c
         c0/GKNME/BmROVjY0qlLbmknWxXD6rG5MJCPFnBxWWiGZ8EtAkhl3jxM3EzL+o+/4aAi
         1zMXbUcg/Az7H8R/uhhCiEICOUw1vLiWrG63Rh7vgV7ccqOjSBNhIleXKoxiFouMGlYP
         rLvnIQmW6NzhC0aC+BofMKaf4TqClEzdeC+xbiwjM4Z9Anm5TaZxqUcE9kbuV8OxWNOn
         t7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794053841; x=1794658641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r6IZKgn5NP/PSJ6/x6wK0tLeYozouVCBtxsXOn7zuVY=;
        b=QhwZL5PpB1XG5t4gUAk4TnJ7jnQTy82vdW4ZcnecA0xaCswhcErnYzhMQ9pyoVbe9x
         wf7zmeJdtE2JesqNmJ5FdorWEzFjum5IdlzMbwCO4/hOU9Roz6KXtAAk62gmmzEeM0T3
         6ov+18JcTVvx7ixKxxONXu3F7mmvHndIBlwcZ22bKH+meiD6bUkvlcnh35klZz4nD1uy
         NCFpyp0+WDYV9v2bpQvz9/ZjIHDN60h9Glddlrkke+u6Hj5U9HIJ8bD7pak4KMqywbdc
         TCPhZRZYrpLXxekb5ZFg+91E+YBwyM9SkpUPQKHPE+kKQ0o/0RrHR/zCDhD6VZVGZyXx
         r2jQ==
X-Forwarded-Encrypted: i=1; AL+hErFxEzNVSTXyvwUkf7vKhctvoxJSfdxzWtNJSJ5rvixFX7IncIi7e3XeKZs/P7vFlurAvONN3fcSSV6KBok=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ivI3QB+N1ZQtUlEi5Q6TGiH6o1ZXciIpvYJM96jpCoUQwNJZP
	yGanFLMqzkN1vIA3XfNJzKmIGVn1pEiITsncNzIY93HCcMAJq9iWFoll
X-Gm-Gg: AYBFou25436XwGv7+995NUu1ckGpstWZW9qYbVOEOBra6g5vFTWInJHzRcucZPLje/V
	CjZFw6zv365HSmAOQDmdYY2CWSbj9zlpc5YEpVIUMR7k5eJdA8awu1qD6+MQZ5LKy3a3FS5KgEh
	Nm7JksAjvAy3v1esTpV7y6gqi/fdLeIWL+srA9GiHMbd38KWhjfRW/H1TCJVzHiRxxZwNkdQ20c
	aGDM37dhiPe76pzhyRqafRkTEdV+f+NFz3IyvET1VyvqQB2EPd2HRxiX2c1TkTEluN89jzKHoTE
	SZiahFO4YO4csOkr/0VV+I4E2W4g5O/x5/HfQrEbwNPGQhSOK3nND14avH5HXPz35vEeZpdjURt
	OTEey3sPRljL0nL3bIu46gWfTDPomKlplhF2E5BEu9d/XvVIm1US+nJ2wNZtZc+rAKpHKw/fC7p
	rNi4R7D6H1ieLdieRvrD2DpcfptYLu+BPApwl+dhK4hseLfGQSXPgdESPSOlDso1L5zFABp484Y
	0qY+yS7nqSKGyx8xF7KRmNZQiZvex2i6VjyDEGqNdBvwlwh+KQK/Lj5DlID4eErW6Mh/bZZ379i
	r3/hjiN5CElGW8ValdGdOtvChTGm1amiiJc7seBO6LYRd+rLFopnKQ==
X-Received: by 2002:a17:903:3d10:b0:2ed:38c0:3328 with SMTP id d9443c01a7336-2ed40bfdee9mr64833725ad.28.1794053841231;
        Sat, 07 Nov 2026 04:17:21 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d5f35asm12773555ad.49.2026.11.07.04.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 04:17:20 -0800 (PST)
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
Subject: [PATCH net-next v4 3/8] net: dsa: motorcomm: Reset port flags on bridge leaving
Date: Sat,  7 Nov 2026 20:16:24 +0800
Message-ID: <20261107121631.1040612-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107121631.1040612-1-mmyangfl@gmail.com>
References: <20261107121631.1040612-1-mmyangfl@gmail.com>
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

DSA does not clear BR_HAIRPIN_MODE and BR_ISOLATED when a port leaves
a bridge, so the cached flags survive into the next bridge join and
program stale hairpin and port isolation state.

Reset them when leaving the bridge.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 47f06945b8c4..c51491ef4dae 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -1158,10 +1158,17 @@ yt921x_dsa_port_vlan_add(struct dsa_switch *ds, int port,
 
 static int yt921x_userport_standalone(struct yt921x_priv *priv, int port)
 {
+	struct yt921x_port *pp = &priv->ports[port];
 	u32 mask;
 	u32 ctrl;
 	int res;
 
+	/* The return value got ignored by DSA core, reset flags before touching
+	 * the hardware.
+	 */
+	pp->hairpin = false;
+	pp->isolated = false;
+
 	ctrl = ~priv->cpu_ports_mask;
 	res = yt921x_reg_write(priv, YT921X_PORTn_ISOLATION(port), ctrl);
 	if (res)
-- 
2.53.0

