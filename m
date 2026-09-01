Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F88448BA8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292283; cv=none; b=n2fQ7PZ1BGGDKjqgXkYi3aj7SbXm1a+uzGpMA657AgRTMuUR1Jm3IkcHZcYEE+4Nq8+yN9xWLX+N7gAdrCcbt0HxP8gXUe/BWZK5EaPD9ZwrA20skvVKXnhztzNKzbKbQhZaAk1W0at8h3+ok2lyAPkPqFJpbCyBjXskQxz2pOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292283; c=relaxed/simple;
	bh=Xrxj50UPOiAaVvLDQBKaDhxwCp4EpiwnDcNCbB25YKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u2A1+4j+DRLhk0dIFUQ1gIiUtmqaUqGkBPQjfggtJJY9WJA2YX4etUhPn6718rOjYeGiqgJ4/jgDmTEM0s2XpALdgMehcSBzPZVYnsaecChRLULvyV79Ps/iNCfDqhSZOol1rdpmQt7o/LiNs41ilARwemhquLsMaKT8QHYAoW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=TlFPzJPP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="TlFPzJPP"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so1208095e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788292280; x=1788897080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xrxj50UPOiAaVvLDQBKaDhxwCp4EpiwnDcNCbB25YKw=;
        b=TlFPzJPPPsoqQrbDtcQVS5fU8GssvaBMDHLW2KY9t1t8pAhNWTGUICAt191Q/ipR53
         jcb0yTiP1n494OXNRodTyThIBs3N4HOUUKTHgxt3abLMC/wyOJpajGI2EmVyHKiMQjhw
         osJeUhJ+9ypoi/JQftrrexjqoEI8wBwg8+DQboJmVPyATtycUAA2P+ARE4QOcP6II3Tt
         DUnT2jPZzDQjDQQ5LwmdIVhBk170e9i3eryeWwvJ9D166zhmvONsajjOXFtXQZvOHxkH
         fb0dtLzJbFgkmH14ee9e+nxscS8ISCr5IxxpMP2D/gXqcPhgPMrcgHVootIM8vH2eTrr
         Tmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788292280; x=1788897080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xrxj50UPOiAaVvLDQBKaDhxwCp4EpiwnDcNCbB25YKw=;
        b=RnhVRVTgSV2PvPTdM6HwHMLbFaTcEjxLUU4FqmKONKIdfomvxlCPRdkBdPZi4Dr3Pd
         1m1gH1Rl+PyZP6S/HTKdEIMvlwKKmVBwvFRvJW9w4ZpfoWwnVSy7xrArJ9zCcWETK5tg
         ZvUuGLotcH8ZqvRHR+eeP70pGYraTD8Qs7LIem9zkp70S/b97qZGPhDIurFEsH9SJXkz
         dyv9sZZce8q9Fq8pt7S77BYa+KXmhd/oxbYX/xT4gKq8P0CSNONMjinuQgjLmp8SZEff
         5RgGO1d89vmHDSJdpHmoRx1SzlE2ebKuIWzDqdlwO0N3QQHkMZPoxBn2rtyfuzu5hcEU
         t7xg==
X-Forwarded-Encrypted: i=1; AHgh+RpIkHyit5DzCS2ziXg5dxpxo2OZCMrriLZCNtp/j3zUT2DbRFzZFlj30xChBsyIV09J63e9ubXKIEy4bSs=@vger.kernel.org
X-Gm-Message-State: AFuF++nHzk4vDo3DKycSTPttwqeqJNDb4omAZkVSf4EqxJKad/wDLSg8
	rX2pyX+jTVuWS10FmBkupF9A9B7yX3ZjQ1SrBIl6/UYRUlDEhueBhAdAzSm15d5ohIQsULL71c2
	thbTera3LSQ==
X-Gm-Gg: AR+sD136YmMQkukJZUU+nVinIXh42z9XXb/ppHtZSfmhUmMYqwCwTkZoB8Y++o7/8rI
	CZUInguYt3btHfEzCBd4LBuDlEnXq5UyH/x+6sQuEyKZutnjAP6SRrCkWgUav/TWzRqc6Y4SvJp
	yyPQbfxilZmCnchwuIySzq9gvpM59qJ/m5ORoQvRargihk1xEkkffvE6gMJsjQl102i5n7/ZpyW
	2T9nTdL5356wemf9BNso6/oOwKHpxuX0FinVIGVSLT0NqpXwpl/7FNSYKvedL2NND0Qu8XdHmbd
	+17IY/h1aBoPclQBKFtbDR0ShpB6Xv1wVlUTZc2y9jiEuDtw0Yk3/TF++6H546UL6uLfoHJygnq
	IWIP+jEcLjlTWSuI3Sdh+7RvQ90VLQzGAEvX9nf03HWqKE2u3ZKABouq+h8uEGck6+/qqvQ2B4O
	AnxWDFrDmb6oOdfoMlBJ+Qzg6+bO0z/vof5m5M9Ck=
X-Received: by 2002:a05:600c:4eca:b0:49c:e1f1:3dd5 with SMTP id 5b1f17b1804b1-49ce5816892mr62765e9.4.1788292280497;
        Tue, 01 Sep 2026 12:51:20 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e04csm82484315e9.10.2026.09.01.12.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:51:20 -0700 (PDT)
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
Subject: Re: [PATCH net v3 1/2] net: dsa: mt7530: populate lpi_interfaces to fix EEE support
Date: Tue,  1 Sep 2026 19:51:18 +0000
Message-ID: <20260901195118.37238-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d0e8bd80-1798-4840-b388-05206bb72fc6@redhat.com>
References: <20260827211652.63504-1-f@lex.la> <20260827211652.63504-2-f@lex.la> <d0e8bd80-1798-4840-b388-05206bb72fc6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Clashiko complains about the above:
>
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260827211652.63504-1-f%40lex.la
>
> @Andrew: WDYT?

The raw LPI_THRESH plumbing predates the phylink conversion: before
9cf21773f535, mt753x_set_mac_eee() wrote tx_lpi_timer straight into the
field with the same 0xFFF bound, so what ethtool showed and set on these
ports was always the register unit. This patch brings that path back and
does not change the unit. Settling it needs the MT7531 manual, and the
EINVAL-vs-clamp mismatch came with the conversion too. Both look like a
follow-up once someone can confirm the unit.
