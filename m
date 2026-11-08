Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174320;
	b=suyRRFWLRVSk4hXxOGixKc+UjPgjaN1E08upZkdW1uPgNvNywk+ZyrnOQaPC/Ep90Lvf
	 SACf7NrJ2rH1dcBudQifBHbTPBVPlwtt8NBbOQrHrRlVv8qrv17zunnB4pEpr6tJXPwmX
	 9W2fKkJcDSJbLyE1dXumPnkDE12w1yQh8bkUuMoH2Gt2Vfug1enTM3xEYz9G5Tf8p2u/n
	 SzOj8mDZ8zLO/JRl/h3scUxuACDNoSxsaOwygnQFr72QKFCm3cSt5PyBDXznx2rRJbxlr
	 MIvvPuyK4SDWioml8dLaq2bus+nZIDJ7xha0s3QDq4YqZ1mLjeKPIv6l3koFtO+DgAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7kqx9M0twER2A25TafVF+Vm+n1vCyoVM7AQSLn5WPCs=;
	b=1unIo5HL5DHH7CJQiho8UM3qsno0Nk2hb7xpSgegrxIzgFavMldEifrmUMauy4rbOSHe
	 tgeTvP0/RJmw/QVR/mRh21lsVLt9ahgHSMzP9LoQoDDihB7vKOhLEuF9VBU1NjvPLYzOz
	 XHTYYUbllgA6zC/bDlvgcuQY4LB2bytuqHQucJzYtKN1GHgmntP34FbPLZf3J992LCvEe
	 eRNEpyJXPYp2g2IGyAZeo/epvxCev722kP2V3MZ/z5Gn/r2VuDtkGMAy1ZuQdbgIjN/fw
	 dCgP5EJKzw2Fuv2AcX/4SuN5DxIkr4fjwy23owWsf4EE9gl/j7dVg6WrrTt7VSZAXVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkYMsfH2;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2AE606A33B
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F2AE606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkYMsfH2
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb684859cbso155049a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174320; x=1794779120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7kqx9M0twER2A25TafVF+Vm+n1vCyoVM7AQSLn5WPCs=;
        b=hkYMsfH2f3wxOpGpFyxrWGpT3NSKHkSCq3w81dLsEuApiG/ASPvnjULBky+PV2hQfG
         bIZhLWSevMNKv589FdZZfPxm+VyVVKuAqz8ld+OAl+kV7T6+FOdbct6fx1u0/wYcu7wP
         6ch9BaKmVp1d05GIxQdNSBIGjTZvad8jDMjrTHMGRrk32eq1KOkEegELAFtkX7WoBkDy
         uWUhcYVIUeiiz8XLpyT7EMyb8BgM8vfzAJGZCRkKHltRFKW0mF6n4cHKj3j3W5Tfl+kH
         dgRGnmot7zocnIbG4yH5VZ7a9vkVn34DU9RQO/kX80Ih1hdgbxuxAzv5rAW1qDyAbwb+
         ywZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174320; x=1794779120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7kqx9M0twER2A25TafVF+Vm+n1vCyoVM7AQSLn5WPCs=;
        b=Ov2QqnecL5bUhJ3hB8xGC4G22H4ioRG1cAu7d7PlDRLq7yZD0Vs5DTx8oFQLw4906a
         LddQmkfIwaHJ6EABJJRZ6o9KmMFsPSv6D2cTyeDv2BR7+Nk5OupiLrAO+/aK0jxgSv6x
         zB1bvf+FMKWtO7J61yl7OI+AIjWd0m8CHGOzt8H0iwmSks2nlhv1Rj6003v9TQoWHx7p
         ARDZ9njLnnmzWqEVFMeRQ6mhVbB7SrfxnyA/f+buw2Kdie12qrZ/pK0egW1BVhAx9Xze
         1RM8+428jZ1Y0uRRTgv3zrbaagIjZTG4Ax4ONGnhLNkuUxdzuI+YKPBFabBpO+CXj7a4
         EA1Q==
X-Forwarded-Encrypted: i=1; AL+hErHKZ07lPFCLPMi1jTd5lcM7u0zxVA7NSEs3b3KuiqZC6qGTaT1O7t4ij1ObG2Y6jmLKGwdof7Kakg2oeJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RlA+JpgkPT6gWaYgsY2SV008BiAM3d3fuPK5wZG3ReZG6Orvp
	1oQX/JH5jX3sHTT1WAjmfZwlw+zgGbc3at1Jz6T9yL3DjhgXDF4FKSCe
X-Gm-Gg: AYBFou0Y6Anpc+mSyagqUZ/D2pa2L0PVr24lpc/F9ESIAHcqqNuLxgHQAOUZH4z7wpP
	VEV3aKdDrI93fy9ZV3/nFNFj3meACyTGnKKlcnvqkX8tEj/z4PncqJQ2yXCtMj5crbJrj9oz/Cc
	76+07PM3NujrgDbLdAMojygCErYK3STy7PxcOvEZtXMKGrj+KirACKofai/rwkbO0v2yG387Ywm
	0qRHXEdvFglc7L3sZbctFHiRreLF52RLTMAHUbhfTcVh6juQEzsdySUAPM0y5zOpgwIq8PpMDgq
	xfFVKbzmv6o0hipG5iBwE13pvtxCD/jRmA8OpiP0r2mdPQd55cVGZC5T/pjDvibzqeadItv1E/6
	rj0tmEsTnkMS9ABaR/m3pBxuwU/txmKRV3EbCwJdaFCRqwddP/lU6l2TOKE08xWf0onBDf4R+/D
	PT3Cd5Synzmj/2XK5TTn4TwCBiRUlcPmuy3tcRAPCxfORKticAF3/ymTf/pM/9/Ylrjodrm7aPY
	fCleds5yfkRneyvsFuGMz6bXJXxvsD7n8CTtm3ESe0UvAfuOfxZFzfvZXOpXephpfmNpAmlTups
	sQOulIinV440jhsf/WS4QSooF1xQ7siaS75qd8l8NBla4LjHvMDnyQ==
X-Received: by 2002:a17:90b:2d87:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3b12d479035mr2063788a91.54.1794174319748;
        Sun, 08 Nov 2026 13:45:19 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1034718f8sm4619463a91.4.2026.11.08.13.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:45:19 -0800 (PST)
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
Subject: [PATCH net-next v5 4/7] net: dsa: motorcomm: Isolate all ports during chip setup
Date: Mon,  9 Nov 2026 05:44:44 +0800
Message-ID: <20261108214450.1662362-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108214450.1662362-1-mmyangfl@gmail.com>
References: <20261108214450.1662362-1-mmyangfl@gmail.com>
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

Chip setup only blocks unknown unicast and unknown multicast frames,
leaving known multicast and broadcast open, though known multicast
cannot appear while the FDB is still empty.

Isolate every port right after the hardware reset, in preparation for
the isolation refactoring. Note that this only minimizes the window: a
reset always brings the hardware back to a dumb switch, so traffic can
leak before and during it.

Signed-off-by: David Yang <mmyangfl@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/dsa/motorcomm/chip.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 7686995b803f..fbf3a0cba49b 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -2220,6 +2220,7 @@ static int yt921x_chip_reset(struct yt921x_priv *priv)
 {
 	struct device *dev = yt921x_priv_to_device(priv);
 	u16 eth_p_tag;
+	u32 ctrl;
 	u32 val;
 	int res;
 
@@ -2257,6 +2258,17 @@ static int yt921x_chip_reset(struct yt921x_priv *priv)
 		return -EINVAL;
 	}
 
+	/* Block all traffic as soon as we reset the hardware since it now acts
+	 * as a dumb switch.
+	 */
+	for (int port = 0; port < YT921X_PORT_NUM; port++) {
+		ctrl = ~(u32)0;
+		res = yt921x_reg_write(priv, YT921X_PORTn_ISOLATION(port),
+				       ctrl);
+		if (res)
+			return res;
+	}
+
 	return 0;
 }
 
-- 
2.53.0

