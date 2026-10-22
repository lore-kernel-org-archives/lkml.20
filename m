Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697381;
	b=NObS4Qy+4BHxRdv6bXSeBxP+0myiXoGBlzdWNruIgamUBciqB+rFvDYBxlbgt1AGJ4gs
	 pC/3GJ1GwRPHBB7R9eYkQXLMrgh6+8Hvbcq4hcfo1rOGa12m1nZaml0+E6ta6NYHZN7mB
	 BRgTMU0R8Bo6WcGPJ69iuk8tqlINYnSC3fVLRpnw47VsGB4aFay7YwFR7Lefnj1hJucPB
	 0eepAPDbCftmzncrYIzMTn1nL9Ji+ONNiPYfyU6f32/D/1xCOMybR/adOhuv1n+Tn8z1y
	 mC0FBaouV3mmwdamqHkK7vPaVixdVaaiL2LsEVGe90BT1LD3nF6fUIrVe3udLNHeUag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r80E+FaLXiNjwBu9/mQZB5r7KjC0VPfcUsV7OA2gnz8=;
	b=JJQiTNP726MdLkwfVJCTbzykbayWbHr45L2lXkdiUuU69TeFX33rM16ypbkkx5aU3fBF
	 iMZ4MxmOEp/yXiHzUFR4TL1Lf1ht3D6RnBvP9Rm7F5GByYpFX76HS4oQqq/9+nRQ6dOHd
	 hYyJCuhbdVhEqd/gKM4rSo5a5FTd/JOk9hNkT/I/i7zfwiBJMB+PFx31/xnm5dFNsvGEr
	 uM+HDJOHDeeaI7Fky2hXU2PN13aiZQi1OsB7ZVbDDnkULj0AmXPDJEg/j6ifYyiVV3jwI
	 Bm0BrvNB7BB4G3R3FZ4vHaEtYgEDasRKBcXc87IIEMEKc4+XCkOO39YmUXDug2TH0Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ODCmDwaa;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6507606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6507606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ODCmDwaa
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a208d93758so1588645e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792697379; x=1793302179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r80E+FaLXiNjwBu9/mQZB5r7KjC0VPfcUsV7OA2gnz8=;
        b=ODCmDwaalLSWIpa6R3N+4FgXGi0/graEHVWlp+Gqa7Rgm3toA4fthR1lRYMP/fQFNF
         oRoGFcprzo3g3mvlopCbUM/bRbQGvPW3brwF8iWmTA6obM7oXG2uI8UouMv26KTv2yrL
         D1FPbuqOZHPk/VULgFm2bKOcGnAjCq5X2TLOrtqrbXf42DiDDITENsuY+xdry3PTew3R
         df/bNZnZKKH/oDF19EpCGjR8B62Us86VIPcc2LRHvk4M2WEsDOvRE/tsTA6OkTuiAkK3
         R7up2S1MQKjbv4+SM5+Zp962rmjCnU+WTduaIZzHVBKO90LUk8aOSiBRIQR9xx1QoXVu
         J99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697379; x=1793302179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r80E+FaLXiNjwBu9/mQZB5r7KjC0VPfcUsV7OA2gnz8=;
        b=DCo5tZ1gbgCRH9645J97zjVUHvvmq1ZerAAqEgrrMGbEK/rLEkCWqp37QpT/zRiMhF
         Na39lbI1fS+Gc5Z8DtW8TC7FVB8HgHxNMViDTTEbfNuPpMAxSGu6DwsVOa6E2bsA77X6
         9c9U1ZtIdhAloHnQTxSrZRutKTvXJy9hvJJxZyeG1DB/TWvqHwgVCSAtG4/CTpM6BbRT
         D+a+euvEiewWPwHRie3dgBQCi4bvM+QUD0J4RbERHAmHoiIPLEsrZeyCS5QOs5164W4s
         UIAW0Sncxy/3maKTD+7c1O2+d6ILoIwhXzTHVeqvrytrRnJubxyScSMmvN8lXhDpyNnT
         jyDw==
X-Forwarded-Encrypted: i=1; AKwUvBw0sbAgZONRQTIrtcd+1851xORBuQ16EuGduphyWd3hZULt/UDzqukgmRjBFjRh636PNJ36L1HsgKllUdE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK34cxMRLYxE2f0RyLMAfIBqP43k7otfcrzO1M09Kkq43ZLRRDH
	YEY+8w0JMS7cQ3bxO3xa1FbaSdTcxTA9kwHw1GhSr4HtJbphzEzDUCi6
X-Gm-Gg: AYBFou0VugC3nDuQlBPN5qC8MjLETw5M3xzSzxVrmXszZ61W7kNdDOTfGK2ETL5yiIt
	kst0e/azet9c/O8vuWTfbgWHj9NfBSSjfknQRCS5xojr2SzP8y9VgtG1PMFeVLgYd/pX7Gj8xqd
	fFY30DdiYSW8x8GiCaw0TPduMVGolAZqYChc9IZW0XJEcp5UNP8ypb4LV6/ilTGPE20VFMrgKWP
	Q968BOWT+jeYj1A54v4fUVkAeYJ74REVQQkOP12MRbqqpVbT/2aIC+FC25m0kkb6Kdu+scCbjTM
	5IFlN8RrRuVgyltk0dpgGdPcUxxAiAJjC9KKKlgTRmvJCZq4rAb8PdSqex6lvAbpIwYsrrmACNF
	JlTpzWIgt+YZMJElVjxVaRHPdyQ4B94E3+fv9t8LlHt1qsZNBd8Fyswc4n/Yz4dUMi99yw4+es3
	m7FO65I0pRuDDTj6D3wZKrR8EEkH7UrnrT52b8cDCuUuUYYxnMDXZChlA+5z79dlVcnXyoWdDe7
	TRhgryDbHdPV3Fo5E9Ufhr0N7WgHxIUJcqqi8bky5062UZzMkDhm62X84wNOI92C+3eIES+2TJe
	tDM=
X-Received: by 2002:a05:600d:82c7:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4a211ee56ecmr677055e9.20.1792697379202;
        Thu, 22 Oct 2026 12:29:39 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:c12:cf67:2010:42d8:74da:e279])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2101cedcesm20269405e9.0.2026.10.22.12.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:29:38 -0700 (PDT)
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
Subject: [PATCH net 1/3] net: dsa: qca8k: let regmap serialize register access
Date: Thu, 22 Oct 2026 21:29:31 +0200
Message-ID: <20261022192933.384898-2-kuncy7@gmail.com>
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

The regmap is created with .disable_locking, on the ground that the
qca8k read and write callbacks do their own locking. They only lock the
bus transaction, though. Since the driver moved to the regmap
read/write API, regmap formats the register and parses the value in the
map's shared work_buf, outside of the callbacks, so two concurrent
users can swap or corrupt each other's register and value.

Most register access runs under rtnl, but not all of it: phylink's
resolve work (mac_link_up/down) and the LED class callbacks do not, so
a link change can race with an ethtool or LED access and write the
wrong switch register or read back the wrong value.

Let regmap take its own lock. Every user of the map can already sleep,
on the MDIO bus or on the management frame round trip.

Fixes: c766e077d927 ("net: dsa: qca8k: convert to regmap read/write API")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 4c928983b..49be53b7f 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -574,7 +574,6 @@ static const struct regmap_config qca8k_regmap_config = {
 	.write = qca8k_bulk_write,
 	.reg_update_bits = qca8k_regmap_update_bits,
 	.rd_table = &qca8k_readable_table,
-	.disable_locking = true, /* Locking is handled by qca8k read/write */
 	.cache_type = REGCACHE_NONE, /* Explicitly disable CACHE */
 	.max_raw_read = 32, /* mgmt eth can read up to 8 registers at time */
 	/* ATU regs suffer from a bug where some data are not correctly
-- 
2.43.0

