Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C42511E90
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570592; cv=none; b=X1EgXif0Zg8wLrJgUjUfjD1h1ZQhb4gmW6OO4AV/rVwuCB2vpH69K74HaGOQAKGxUbFrRb1whahMqmKG/PCeinHuPMAKZf3wBJtnpqmrjPeaKujlVDKS54i8AN8WOOVuZsz0WfFZGTYgQRG2KlZexpjhkC1MjKaOtDl9hYJu2qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570592; c=relaxed/simple;
	bh=8HTt3f1kHzEcHqPdoIhUIJF/xyu/LEyQE65kAFS6OjM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=X3HSA855jUB3w0bXdMsj0xQ70U9lxWw7gB7UTaeRRfq0eXfla1n9zoneEIl3q23nQARVE+D+6og0A7L/XpHe+K925QSQow/imKqv1WgPKtyaVT6ljep0OF+Dz7u3hTdrLIGEUZBw5kDGg9wsnGoIDUoIeOhEPCJilY/l5RX1ouI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NFIQpbsI; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NFIQpbsI"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c6955a7c3so31088f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791570583; x=1792175383; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3K3ao78imzaTxL1NmkWMqiHtKHUZXLazwgVZl9X2sac=;
        b=NFIQpbsIwd3TNsM3/p15h9/Em8NjFJzbsvqNQwftlCucUvzPf+8y0HxLla/3xN1OcO
         SQ1llAGiDCpevOpQgWTdU0a6RnLnayKUmhDBQG60vgwsTj06+gT7dx6UB3OiVPHhFvTu
         U5g2me+ZHVFGf3zvDGM7KgTEeRD6EZXYqh2oLd078dkTOUD9JmJaXdGkN7+4Ghfo88gr
         CgLZ4PABZQgvqsaIala/VcsAzklhsYIIrYwWlsxEUO9ALDJglbmjBwrsV0mJ4dy2gQQf
         5BwVnLES6SF06Gk7DhmXzHDcSUzercK2zsenVGAfXisurnz9p9IQbot8lYjU6kDmECsL
         U0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570583; x=1792175383;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3K3ao78imzaTxL1NmkWMqiHtKHUZXLazwgVZl9X2sac=;
        b=hsQUfC72ugbrIEmD/LSi990Ar4I0/x/Jmb/UWKkfxkS/Lb0/AHGKyx3lPwP8DpSKj1
         TDAI22xmjPxwSly3o4NxOHsVgVYmqa9i3Kzq6rl0NBDSiYYo95P0arNF/aWtvypU9wWb
         tMTu7Cg4EYexeydaV4yDaoOGsyig+Tu/ZNFeqmHdT9L9+/B5x98QrdrbQLUsE/rRGuhR
         CF11t0vHgJPs+M44JrY2w1IsCH+WqGotpgMNrJgwHdsnIHpor7Hut9LI4LXHK2P69cLQ
         i9Yf0UL0NA2onS2+eB4d9/gus/b/XMTeXQntorx4jPJIj4Gx8yBz2dpaSd3j/FHktmDg
         6WIA==
X-Forwarded-Encrypted: i=1; AKwUvBysKWNj5wRYjT13m/qbkRNLEvFLOzWsao8oBoyxUt0P96k/JcRt9p/WcSRMVvVf2tgb9cmPTloSGuHmAyc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2ls7S9w2OUQrdViPEReaAN9Y5TMDD9o52a5i0VmEx875oTXT5
	ZWt7sAlLpAZ6Imo5yMhgMe781Nv84UdAUOsz9q+mbNaxkrvmzn4D6j+ntHpLg+xJpM8=
X-Gm-Gg: AYBFou0KdoDGcg9iWh3ZlD7Y9AuPKkZegv6K1QHuTCupMOwcy8qndBeo9KpH21Gvfi1
	Ez1BCAGBtW0qY1c+CkJP3iPmKZTWz1alNLUkadv0DrCRQBlJll9y0u3qWXWDIu/mofnogaLPdsj
	CWbZ0DFXGSOhb/WvPtMoSgG4a2pCNq6j6k20ObNv/8wNhUywbITkOthRvrFjJIGTFcU7h3JvH4L
	gNwuaJHk43en75oNKlfSp03LxsrzKDBvBMjR8w3xK5vz60FyBzZZtOGfROZT0c51SVcYPprFZmi
	kp0gwBOcJiEoXITMFw5LHX8Ax797x9baMoU9VzEm6Urhwcai7NbOflJ3z8k+gDzvforh5sUit0R
	taOrVpG8HDrlFC8oLf+zBJPvAD793MZDEW2nGdDYoRbHvF9RxxDk0MxceLnZpzTGwQug2baaSTS
	TFQlOAmrLQAJns119zJDzIhuaT3pKiJaIHjIrUn3ZhJODMWCzONXjb7r0AxxTCTqIANGp4eESkl
	neh09OKmnfcPU2Y/w==
X-Received: by 2002:a05:6000:184e:b0:488:8904:cf19 with SMTP id ffacd0b85a97d-48dbaceb60cmr6202771f8f.10.1791570583358;
        Fri, 09 Oct 2026 11:29:43 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac025esm5100156f8f.38.2026.10.09.11.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 00/11] clk / reset: realtek: Add RTD1625 clock and
 reset support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: jbrunet+clk@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 bmasney+clk@redhat.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
 james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com
In-Reply-To: <20261002074331.3066919-1-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
Date: Fri, 09 Oct 2026 20:29:35 +0200
Message-Id: <179157057523.266328.2566485767894163325.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=735; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=8HTt3f1kHzEcHqPdoIhUIJF/xyu/LEyQE65kAFS6OjM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknjaa+4K9V8u6b/PntowMt814KcwjOWLFsVd7WeS7Vd
 5JfHvsW1VHKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJeMxk+Kdit0ivKsB0Hq//
 hGXK773kWRh5mwJXzK5OOMuVcjRSbgXDfycJszeN584z66no9p2bq3tOv0CZ+e22l0/O9k//vGt
 3ITMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Hello,
> 
> This patch series adds the clock and reset controller support for Realtek's
> RTD1625 SoC platform.
> 
> Because the reset controllers share the same register space with the
> clock controllers on this platform, we utilize the Auxiliary Bus framework
> to decouple them. The clock controllers act as the primary devices,
> registering the reset controllers as auxiliary devices.

Considering those are properly decoupled, there is no reason to send them
together anymore. You could send the reset part to reset, and just clock
part to clock.

Sending a series that address a single tree helps because then we can merge it
using your cover-letter as merge commit, instead of cherry-picking.

-- 
Jerome

