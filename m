Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5401A5BAE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791867327; cv=none; b=csTpfAoZUOzrCVqmoEHeDk6hue6JqT3ZvLnzh7zDhxmCMw9pCiwFSapX+61bPdXO8ONYrrgmTgOhIMhXEY1I57cIBXhNs507XodIrp1Lb0z6fo7w9Fi9MW4o/hLgyPlcxSimvyMjo16fy8QfolVYHl+r6PvdHpi2zciS+kadg+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791867327; c=relaxed/simple;
	bh=WQcAD1MMEpo3eZQ8woRePVMMduZ074A3ZIDLuK3z6ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGw9XUDSM+rt+gUGL37G2MYfnpegkci9vfpMtR+4kyT9m4EsWFxd8rkQjrJUMXCdlIpt9tqqPfnnbYRtNQwDB6yhHH92ogzUrB4t24UoXU1U8AjZeh7bXplbJ9Qlt+LlxfbvkJpASL15Y6v+ONhKNn85pQIXJZrZfGUPEkXoRWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOyKQnMG; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOyKQnMG"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3514b90bb89so4802800eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791867325; x=1792472125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQcAD1MMEpo3eZQ8woRePVMMduZ074A3ZIDLuK3z6ek=;
        b=dOyKQnMGRKTOphotxiiAOgsHY1jXHPPOYD58hCyba9EvEvgDBx3KDZG5pCOpqKihe7
         9SCt06q2QJTsajl/dvkf8IoH4fp/cuGmTiIuGWV5x6/X4mBsSFKhWmjOGa7rg/bPpa+B
         ITpwgLAzIBnL1sm7MjQjFq0nc7RrR267RL0Pej2e+UNWPxCI9m9SWOuLF4NP4pHQI6T6
         q/zhCoU4BAaRdVLIVVq3FWaL++iBjMHbgP8FZauEQRIuZl5gvrONrDw/AYVElp2qisZz
         9IqgINeSEO5SgEVNkJhGDrhkirXfXxQrMJNGM2TvbKACguFi506WQrSmWK+oez4vnyaG
         HjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791867325; x=1792472125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WQcAD1MMEpo3eZQ8woRePVMMduZ074A3ZIDLuK3z6ek=;
        b=0M48piYgnUnrnzJQTviKatVBN0P98xHpWeu0mwkuMXCAg+9pemNPXlM7se4zn5jYI3
         3Gcofi5D6ftGPzHF3m4jzBKmLO0YUSunfIZQYO439NGM0VsRRTF9YFerN9hb5D+S9DLK
         bpbTNfkQBCQ2o9zom9t+Ks+ezLm1gnpOtyDNJu+5DOxYiHqyEPa7v4aAM/BbtkiuqZux
         VPSf4Yz4yMluEHlYTginQyis+zd7qDa3O2Opl8tCGjsy3wTLmMWkqzPQBRIK5f1pk2Sn
         amA2Qn8D7HYCseOy15wE0RpxqjtrEsw5WLBbIY55j01Vx2BEGkO9ZWwuO2iA5VRGko3K
         2wtg==
X-Forwarded-Encrypted: i=1; AKwUvBzwYuHEI8Oxmn9yGBhc+FWql3WkhQDhmbhASfzb3W0ztUDxpU+71mbtQiC+oJt8ALiSWiHpeIEVegc1SFw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5VJHGQ69EfGm2O8mSLuJD/4rgb8cUjCXPQ3F8/AJ1Ij/ek6+Z
	gHpG+6MkUVnyQyMFOXMKQpwL5i8SPdvqzDefPe7VzdY7zn9IhOGE1wp2
X-Gm-Gg: AYBFou0eeCqklNgO6BJHimWaSDTqW3SW1ItZeBfALApFDbJMiwby91oRtsTkAziIjGk
	KQ4pH7coodPpkTP3XhC2HE1jr1hRrw9rsyy3xeAYP3b0JzDPWTDKUOqYm8IogRgz3avrXVaJJgM
	/xmTvMcCKEdHrUkiLp8+9os/4MearblugK0fCHLkZ6XZ+ofpfrdh3k5VbbqtNP9kSmIRuU0F4/B
	t0lcoA6NKtDXMjwRjSPyZfYV7Z0pP63I3qAfHOjDzOzTjZaG7cP2OWLag3B8X3IyNe6laQJ7Utg
	mWzvNVIUWh7Y0AwOuiasXCAlCtpuPzHH3qWvCBM1C8YcRO86KiR8KOQFIGuyfv7jctJo6mhTO4J
	WoS/ed9g1jLukU9s4XjxdQTgqqN7PZG0s+OK44eAYvWDoDKix1QlWkCJ/n1KlmWnhzcTYTU04ZR
	aWQBbDyWMVPVCjHHzokf4rAnvlHYIWU4/ctx5lmkKc+PGndTCKIhtCAcTN+I2v0sFeN3TElcQv5
	EoceE3jLjCm
X-Received: by 2002:a05:693c:88c8:20b0:358:f678:46b6 with SMTP id 5a478bee46e88-358f6786227mr11214375eec.22.1791867325040;
        Mon, 12 Oct 2026 21:55:25 -0700 (PDT)
Received: from online.mioffice.cn ([2408:8607:1b00:8:5e2a:b6c:f432:a6f3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a279sm38832952eec.30.2026.10.12.21.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:55:24 -0700 (PDT)
From: Pengfei Zhang <zhangfeionline@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
	Jose Abreu <joabreu@synopsys.com>,
	EricChan <chenchuangyu@xiaomi.com>,
	Simon Horman <horms@kernel.org>,
	zhangpengfei16@xiaomi.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: xgmac: do not treat TBU as a TX event
Date: Tue, 13 Oct 2026 12:55:10 +0800
Message-ID: <20261013045510.2746341-1-zhangfeionline@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261013024747.2688984-1-zhangfeionline@gmail.com>
References: <20261013024747.2688984-1-zhangfeionline@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

+Cc Jose Abreu, the author of the commit in Fixes:. I used an outdated
address for him in the original posting, sorry.
