Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050A74483A4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292281; cv=none; b=XA3kYPsycbV4Y+CHxpHgbFWwP9UnPTm81yX51hWuf9YayIbygU9NbSFOwW3cWpvnsRD4466a4eLq0lLqspl6Lnffrs3rcfcJFfzrPwVscY1pFyr6wMeYXjdiU0n6dipZEc0DYLZUVM7IKX3fH10QcekEfe2oy8WhP/x7LnS2z8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292281; c=relaxed/simple;
	bh=BwLey5dTW4uM292A2Vd7bSxkboLRHGDZjGIzXx+42J8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OeyTndH4AxOVvSCtK+fpUD9/KWxUytaq7qd8ILe9V1fO07BmrVpNgfvL81Sjjuoix3vo366m0Jdqbk+M7D6nmShFvENcIUCMh6X2dxHcvOlFkovCQsdeAeucbXElNBRTvy90EpKFxpojSCG6O8BKilAJiKVG7D/kXI64h5UTEik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=ITG5IN46; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="ITG5IN46"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47de0093c42so326089f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788292278; x=1788897078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwLey5dTW4uM292A2Vd7bSxkboLRHGDZjGIzXx+42J8=;
        b=ITG5IN46vGcwvMKwBFWO2A2I4biFNMH5plPiYYnUi99kTt9ug7TJsZ+OjrRkJP1CtD
         4QzTASJ244haASscNMebdaW/qh4UZpcFnerkaVFy69wpBnYutrc9DxKlhT1vU95OMmx9
         xi6igBx8aoBG8OfgM/QbLOwdRErxuq6878+/L9Nm/ktpQ5hC4Jpd7R6inINqoFz/rLzb
         5yUl7jUXXDsM4Z426JilCySPd3Ae50esTRxex2b3iaumu5zuZIHrz4P7SwsVjwo6N4ag
         cp8oP7OoHA6S7Js8Brio8WESvaMULs0CPEB3pel7kQDeXFhqAjS8L1qm7iQco8DyyIIo
         WM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788292278; x=1788897078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BwLey5dTW4uM292A2Vd7bSxkboLRHGDZjGIzXx+42J8=;
        b=XSHwJbByEMoPX2f50OPcdJTuzgMo5hRXhua8nfhvHkNvpCwyx7qOILTZwDo8yBo0aI
         RwzjzATWn3tdzJAYS0CsFY56lcDeBI1qBRCG3wRK7q9ISnSjIVWWwEc9q2FAl1tQJyi3
         1IDAx7N4aqSmWPFI0RuptB5PdM0rYn1/+TZTbQTO3g6Y+4m5oopUc6/YIYI+1p42Ko7h
         R4pyeh50t7hs210P0HuZygl4dUhizng596j7MqKTtT1a6rEkyo+BT1VVO3ch3D8XZgmS
         8Tgs+xTY53QCLkAbYy5KATSDk1+p3kiAy08WuaQa8jGKFY4E8j7js/4YRGC7Y+Rz9h/K
         9q9A==
X-Forwarded-Encrypted: i=1; AKwUvBwZ6WS4MNtc4cqR9SeGwCaOkGg7lim/yFeVTUNPvZGtgNP5wKySCyJUvFPcLXOM4B3MaMgda6qdV4zChMk=@vger.kernel.org
X-Gm-Message-State: AFuF++n4t82jYlTBUfYOQ43+I/oPsc5SI9k+aT5GCiKVBs6vI1Ai1kyt
	SHc1JI0kqTMBta35LpUc2FSUlkByvVxze2i53/sa/TZspVZj9O6OZaAXdSWXG1vYXXQ=
X-Gm-Gg: AYBFou0ReEbAlaxdAYvYkWUUaneT0OA10a09t4wrfkCEV2QkGAeG2A0TTsR0saaV40r
	a3BTeg+nidUH2SKcaQaiSaMYNjw6p95pKWxGS0awqg9qQ+e6dM735rviLLKQsDtxTO81DV2rAyZ
	OSM8POv6R0mQtDz16B8WmNqUFYx2H/ztAfCdAq9HL1OdxlSD6MYZyeBFdeOYCsaUNA6Cv98FWtB
	KYQqpX7oyfwY+YW5hhMiTSoUWGi29gMqm6N7b2ENijWW1Z/n7RYCmyJJ0MxbMBaL2VcPu2iv7gm
	pOfjGXIZ1Ec4CAf2AcoxAq5eEN28y1tqPsaPUQyNGjBKtDlwIiZWiLJoChWvBWpsKQdZP4JWdkO
	vr+8bmRHLVGRWyLEEtAilsdJULHTLeE2AczcYLPg2qqVVQ/go+T8NGsnZ5collPUzbDs/RsolQ0
	/kCawbpbhno4j2O5AtCVNOhjtIp+cZjE4NvkfWLQlwRuYMRp9Gcg==
X-Received: by 2002:a05:6000:648:b0:484:4189:6b09 with SMTP id ffacd0b85a97d-48441896b75mr15334529f8f.17.1788292278109;
        Tue, 01 Sep 2026 12:51:18 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce236sm1316681f8f.35.2026.09.01.12.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:51:17 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Paolo Abeni <pabeni@redhat.com>
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v3 2/2] net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support
Date: Tue,  1 Sep 2026 19:51:12 +0000
Message-ID: <20260901195112.37184-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <68c51086-eb10-4074-8495-b31c8e8a21e0@redhat.com>
References: <20260827211652.63504-1-f@lex.la> <20260827211652.63504-3-f@lex.la> <68c51086-eb10-4074-8495-b31c8e8a21e0@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> For a 'net' patch, I think it makes more sense to restrict the lpi
> interface to the chip revisions with support confirmed.

v4 will gate lpi_interfaces on a per-SoC capability bit, so only chips
with a confirmed LPI exit get it and the rest keep the current
behaviour.

MT7981 is confirmed on my bench: with tx-lpi armed the PHY's MMD 3.1
shows Tx LPI asserted by the MAC, and thousands of LPI exits at 1G and
100M against a BCM5720 lost nothing. Details in the v4 cover.

Qingfang, which SoC did you validate the wake-up values on when adding
EEE? That would be the second entry.
