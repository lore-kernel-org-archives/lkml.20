Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702612;
	b=aJzANt7aWFKC/ofA+sFHldtCytzKtrUUr3IjlbUGCEkUtJBZ6qGRihqfmk3F1yVfoGae
	 Nhzg5WlZ6EgOiQ0CA+/ieFtUVHZ2OQrlo/vuTkOVHCQVLpthoDP0rDKrfMxvMgDQE8EUB
	 KYuQMjH1wcYS34pcZZ3139TGhaFJHYI/9O5aUel/q0qNf3YR+Rpf6KUruLCUassXdDwUK
	 j1KI6bBwjOrQzkmMRbK9kO6i8oI0yg1HaKyjxmH5bxyFzMzWt7cgax9RI7DFQyNYXuyGs
	 T+AN+dVQp3c3Om64jzyz/xAGOT1KZPR/P5WXF/8Nb+cxPwp/vUN+LB0OBnLQ5v6wSCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f7qXl+oFgNrZyAAUVUqI0RrjFdQvCwDXCCumBq2lEJY=;
	b=TqVu9+iWCZKK/+yoyf2Wfb9Uly+e9TBzPLuiAR5XFONMsAkeNeOh2c3GHBlJwWQib6lO
	 BKlIQocchpiPeF91p/c2zOETDP8KIoviH5TIQgKTjVCuBffnzqgNqrJCDw/t4kubQGTDs
	 ju3NtznicNA61x+DrEY8EyT8bTzbj3OnmH/iXix5e2vexNSxzBLQdjD7C2OJthuVJuj0w
	 S92rrnF6jbz6lzt1P2RKiBzWyjYmEYY+4FfFDwHw9rJ3ruoK6Obdfs0YE+P5LBeL0nmde
	 x6H+IX9Hfl2ofI1RvTuEwF9r6ht8Ya9oiV8Ypqc+IJFQchXRC6iuGP6ojQbi+166aPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oeVgD0+I;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEC6606A325
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BEC6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oeVgD0+I
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc751eddf25so125672a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702611; x=1793307411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7qXl+oFgNrZyAAUVUqI0RrjFdQvCwDXCCumBq2lEJY=;
        b=oeVgD0+IVFRCHVPNFC+UMrz49tWubYArf677C+o6KCO6zprH4RFT1/Dg6sGx8MbgxA
         OAx1OmYYPB0HSutkfw3TVYopZyEWFFZW7PzO/8gub0W9BW3I/JCDxrVh2lX9dQBDVAK6
         KAX9HKt4uHoX6v6zn5RUPwdveQ+kBA/BgeP/g+387SkIVzJ36D6TmjZChptdWYWW+QO9
         xYCjtbsuogyVAOOEqsIoKjkZadOVRpvFxeJCdFsWrCNYfezCfuDkaxyLOqxz0Ie/ujtd
         nvwe3vNKPeJTg7ESemlFNHzcZIFmSXIeoUJReXNO4AwK7H41IPDboYe4js+I8dSVJAQS
         WDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702611; x=1793307411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7qXl+oFgNrZyAAUVUqI0RrjFdQvCwDXCCumBq2lEJY=;
        b=Qh2fl5n/4/KFRt8t43WXJ9n5c2lGY1hWE5qKin5fsKa8mWJ4pi0LJyOffD/b9crJMo
         YOgYUNVj68IRBY/e8jNGGhh4djkwMpEWnPnChnxg3RNh9OoYc0llhrqXw/zzoMZND7sn
         xVKZqmU6QPr0Ytc4pa/EE6TkceTkOhnZH4nIpqn3GL2T1kCLHVtlydbuvW58oYqPcbjH
         LKGJj6NNM17F+3Qp2kkGVMqriqUOr3UeSVOEcCdxYc+UKvQV8X5d9Xot7IFPzhdP1AxU
         rWUqLAO+IrRzYL2M8vjnnN+fAon/0BUHwq/PisLzqxnvXds+nc8vJ7GbfbaayAhizr7n
         566w==
X-Forwarded-Encrypted: i=1; AKwUvBxWQdSvmsjo49aGj+VwbKI1aF5oc8tmWu47dhywQ69Tl9Z3Zq26IrQQy2bgV4s8A7HkHYpQ81K3v7oBHb4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLM//M6xWC6dae6iI0YR0i3tO9G7n3t6IkQm4eLXGRsOPRhA50G
	Na2QrPGfdF1Fy95MiGy4wlt/ptLYQkd9b7lejRjp2XROW+d1kkgr/6vuElCuKJHHNlc=
X-Gm-Gg: AYBFou0nQ2FApZ/YEeRGH1hxqJWkvCqYUSPqi4veDMJ2Ug8N2QtowELHHuCI88DVIf5
	jdXqK60roxK+aovboJ9R8pMpXlcf0W5bsHOtO5G7mjgUsyYu1BbRNs4F7bh3tcCSxrnXmVs+DFR
	P4Lo0EPnWhGC+8XEinGyPXw22z//1bs1H9hhbH9LgR85l9G22NYoz30PFgJ/GZzsia9JwFlih3j
	mBfuHbtjX2CuNdb/mEW68wlY45xg3PxGEnKigzY6U0bzOLayfZw8+sE3jMW7mVnqVCrSTe2Z4bg
	b1pqgFjW83NlI2I216yjRW9oZn582wG4mOlUWCZK4WcigWFp4Ol58r6HJ5baRd8VJTmCO0Jh2q8
	m9YzNzLecA4GNzkQgMd6ljgg5vru4Ts8j6tk/b7MSlfXFaKcTTPUZFN1H2DYfl6G7NfrN260xPm
	MGQxND+hVaqTjw8fKtBBAyY/uZUintA7QWwwIN1QhmHr1qaTBk0Do2QLt5ncQaXjvhsc8bC4jB2
	ZMrUVXXK7tyVpmxoz5GosiCD2hKATyzWzmhGfcYBLlaS6f5utcUybwNRYx+v4HoRwFYwXEIYibk
	1fgL6WwiLIMTfWg=
X-Received: by 2002:a17:90b:4a12:b0:3a4:b0f3:6597 with SMTP id 98e67ed59e1d1-3adcd7fe438mr149838a91.0.1792702611337;
        Thu, 22 Oct 2026 13:56:51 -0700 (PDT)
Received: from abs.sf.dndws.com ([50.35.86.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada495315dsm6263941a91.15.2026.10.22.13.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:56:50 -0700 (PDT)
From: Tao Gong <gongtao0607@gmail.com>
To: netdev@vger.kernel.org
Cc: Tao Gong <gongtao0607@gmail.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v3] net: dsa: mt7530: trap frames to conduit in MFC on EN7581 and AN7583
Date: Thu, 22 Oct 2026 20:56:48 +0000
Message-ID: <20261022205649.2351696-1-gongtao0607@gmail.com>
X-Mailer: git-send-email 2.56.0
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

On EN7581, STP BPDUs received on switch user ports never reach the CPU.

Like MT7531 and MT7988, EN7581 and AN7583 only set the CPU port bitmap
in MT7531_CFC and are skipped by mt753x_conduit_state_change(). On
EN7581 this is not enough: trapped BPDUs reach the CPU only when
MT7530_CPU_EN and MT7530_CPU_PORT are also set in MT753X_MFC. Add
EN7581 and AN7583 to mt753x_conduit_state_change().

Tested on an AN7581 board (Gemtek W1700K, airoha,en7581-switch), where
only lan3 and lan4 are switch user ports. With RSTP BPDUs arriving on
lan4:
- without this patch, none reached the CPU;
- setting CPU_EN and CPU_PORT by hand delivered them, and clearing them
  stopped them;
- with this patch, they are received from boot.

Only BPDUs were tested. AN7583 is untested and is included because the
driver sets it up like EN7581.

Fixes: 2b0229f67932 ("net: dsa: mt7530: Add EN7581 support")
Fixes: d76556db10bf ("net: dsa: mt7530: Add AN7583 support")
Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Tao Gong <gongtao0607@gmail.com>
---

v2 was withdrawn after 4cb3cd670b2a ("net: dsa: mt7530: untag
VLAN-aware bridge PVID") fixed what patch 1/2 addressed. Patch 2/2 was
dropped with it by mistake: the test that seemed to show it was not
needed received BPDUs on ports that do not go through the switch. On a
switch user port, BPDUs are still lost without it, as described above.

To Paolo's question on v2: the issue is seen on real hardware (AN7581).
The results above are from the OpenWrt 6.18.55 kernel with this patch
applied; the code involved is the same in net.

The board has a single CPU port, so the test does not show which of CFC
and MFC selects the destination CPU port on EN7581. The comment on the
CPU port bitmap in mt753x_cpu_port_enable() is left unchanged.

The MT753X_MIRROR_EN() issue on AN7583 found in the v2 review is
separate and not addressed here.

Changes in v3:
- Drop patch 1/2, fixed by 4cb3cd670b2a.
- Add a Fixes tag for AN7583.
- Update the comment in mt753x_conduit_state_change().
- Add test results to the commit message.
- Keep Lorenzo's Acked-by from v1: the code change is the same, only the
  comment and the commit message changed.

v2: https://lore.kernel.org/netdev/20260923055103.949540-1-gongtao0607@gmail.com/

 drivers/net/dsa/mt7530.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 96832852c65a..5dbcea38209f 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3335,10 +3335,13 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
 
 	/* Set the CPU port to trap frames to for MT7530. Trapped frames will be
 	 * forwarded to the numerically smallest CPU port whose conduit
-	 * interface is up.
+	 * interface is up. On EN7581, trapped BPDUs do not reach the CPU port
+	 * without this, even with the CPU port bitmap set. AN7583 is set up
+	 * the same way as EN7581.
 	 */
 	if (priv->id != ID_MT7530 && priv->id != ID_MT7621 &&
-	    priv->id != ID_EN7528)
+	    priv->id != ID_EN7528 &&
+	    priv->id != ID_EN7581 && priv->id != ID_AN7583)
 		return;
 
 	mask = BIT(cpu_dp->index);

base-commit: f4377bf85887f57b59abb5479f7660a81ffe4449
-- 
2.56.0

