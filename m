Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697379;
	b=Jj3or6f2hVHhBISyKIo8tB7JDzvKbUWXI2vUqAbUWa+7zu6UhdEmTZSQ69pkbbofI32N
	 dsS09nzusfrrEbZJIiLljvsZD2AymFdRk5VrKiXeOIPjsAD5VALZzUqGGw2NCWvcCGiCK
	 WZkrsvxzXM8MRZHgQZ+jgEzZgNc3OiWlLMFB/lCOAsKIWLQJX2JlLhPdOcTy88WfGFmIS
	 yyZshx0p9PxIwDp6ruNa5oTo625MMt50wtfthNAc90ewRjlQrg/Zbre+TMB0VR3tG6jsY
	 GrBPt8cH2Hxif9b6iVFyZVri2c5YkrFDSjCR/2K0Yu2Gea5fBnA+NaAQLmlohBUQP6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yfAXIbK1SRMC+v3xqeFE7VFUZairZQeazNmZce7ufqI=;
	b=rn7fYlxxoySpF0yiTNae3vTROUmorHfROzHFHemWpQLlSUwukYhFu0stH4ez7ulbxFYJ
	 WqTQYfSv/7S7pgPlgeeiGanKSMDI7NH9qRRNFZR8Q5hSp0H+XkDM14VSAatYcN3HwxGwJ
	 fRLttmudbMFsY4ZwNk4Vrcqt8PKftbWFmDmm8anDbRW7y2dUWQ49qSNsLsCLfUtAEAhii
	 YR4GqnR0fGTNthdk9NwRgqRs4Tx45lPvi3vM0TryEz2QyiNa6vs9uMyVDhqxD0nqAfZ+d
	 KkrGxMaCq3Ad/hzO3+SBSYA3VUbUQw1qWUUboygI08Rq1rQbdCZsH5TCegSep6+64Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mji6fkiW;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9F6606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D9F6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mji6fkiW
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20b122af8so1504605e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792697378; x=1793302178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yfAXIbK1SRMC+v3xqeFE7VFUZairZQeazNmZce7ufqI=;
        b=mji6fkiWi6spHYMCKVYYh9/NxH1B6eU8dSVU+ponAaoRa6h8WzrsB7qEiPB7ZEMpNx
         +cKt+gEvLhw6n2Vh4s6V881kn7lSSuLs2X4b3XUNqEZOzXBnvnNNOCBYx3THpFr5Wuy/
         usEOvXL0BjeES0qPd2f9ntOaykYyps/jemexfkU7ugQ/9Q7Rp8+joJzkRpug4P2RUzBd
         mOuVqcz6H+jhgNwBQjphlKgHbUyUvLXPW46oi3vEBHSOE/tBCXT7llYLoZSHEFyulIuk
         ILmGaQJwdUjVVqBI7rtyVAYeClmssy6fxNyp6AzCJ5NdhV4btshbLqeHLfIFljY4Ld4K
         UtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697378; x=1793302178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yfAXIbK1SRMC+v3xqeFE7VFUZairZQeazNmZce7ufqI=;
        b=hJZJsQO6urhSnqXwwNESCCD/lZNZ9UbjQB+jGXPFf0ea+X5bdHLCk+9huvM+4thuZz
         yVS2t6FbJ2QSx1o79VpaoURI7srUYMd9ka+w5k+U+c7WFoR5O5If2v7/3L8D31/As5ri
         njr6H8NaAXqX5rc5nROOKdhALbbVT0MDvFXUW5JSeGs7hs7L6mIYV1mbMWaaOTLAVWMN
         /S/b6wkRxiAFRyLG+yRIGLbj3PfxN6YqAe8AmxtrDBczMt6fO9QOytXphJ48jcLfpHAQ
         IpkusQxL6V98UQPzE7+iRwJq4Y/Dmc+PlKfmL9/piHlU8jiNXDZVz8V0jXLukBfbGeqf
         driA==
X-Forwarded-Encrypted: i=1; AKwUvBxlVv2KDIzgfujxB3tmbTBfNQOAcx+4TkctOtQQrZiyAAUrfCL7wp6tRx1CZYRe8Ikp77Uk2vjzTmcRAMw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7o160BasgMmcnnkIeW9gFzmx9MW1R8LG0tlfStNZvTt1UHx1P
	Z+2nO0SyxD77FYXbvuCrBvtcyg2UuoPBTCAgikuLvxQ4ko4fY4Kg/Bev
X-Gm-Gg: AYBFou1MFKpGRTOvKXAgTgR02cTe049Fc3dDmF1OMXDxsOsPPUcqL9q/v18V8b63TLg
	9RN7sp3T0IPHRCbJ+qChct4zBqppz/8iiz0QDfm/Wav0YVtVvv7eJ3iuZ9fIoTdcF7ih3ic+hqJ
	x+EU5WkzRi7MbSoOAzaH0zfNYA9UStHjkTRQyLixu0LT39+hvGuTIxoy5XdwYc/ymeCarPop0aa
	7cz07NndrBX+R6KeM7m8giY1IX7WG5Gs+yeQEgTKDK7h6DEOS8n7Tx8C3S1cO6QHZEplBaOwceG
	RJt0ZcSr6hLxwwVJR9kxF08X+ulvOzjmvJiZ29/EGYNm4Zn6eVmJkBrAcVi2ODeSReW2GSK1TUh
	MmLOC6WCp7xXp+w3BULpRo3c1UVcoJmEDrHHKXz38FKnIGY0RbPU2odrL0wezZHS7efIeS0XGyB
	DbyvOH7wEbRrBOrNMVn6zBWzZhUDxv4GfC+KYlvfLZQmQ7Fe8dlToE8VxcZeCfXXH9EZ3bpLgPM
	lTgBB/9jT9DJJeyQ37ZapY7bRWkhWv2MWt+QZo52e5kt4LmJXUALQKh9wMNHYIKYUR7SXIM3v8v
	DQ==
X-Received: by 2002:a05:600c:a00c:b0:4a1:e6c8:ff74 with SMTP id 5b1f17b1804b1-4a211f11bf8mr744065e9.29.1792697377635;
        Thu, 22 Oct 2026 12:29:37 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:c12:cf67:2010:42d8:74da:e279])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2101cedcesm20269405e9.0.2026.10.22.12.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:29:35 -0700 (PDT)
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
Subject: [PATCH net 0/3] net: dsa: qca8k: fix concurrent register and MIB autocast access
Date: Thu, 22 Oct 2026 21:29:30 +0200
Message-ID: <20261022192933.384898-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The netdev AI review of my net-next MIB statistics series [1] found
three bugs that are already in released kernels. They do not depend on
that series, so here they are for net:

1. Since the conversion to the regmap read/write API, the regmap uses
   a shared work_buf but is created with .disable_locking. phylink's
   resolve work and the LED callbacks access registers outside rtnl,
   so concurrent users can swap or corrupt register and value.

2. An ethtool MIB request over Ethernet (autocast) that times out
   leaves the caller's buffer published. Late frames then write into
   the buffer after ethtool has freed it, and extra frames underflow
   the frame counter.

3. The autocast handler reads up to 164 bytes of counters without
   checking the frame length.

The MIB statistics series will be rebased on these once net-next
reopens.

Testing: on a GL-B3000 (IPQ5018 + QCA8337, CPU on port 0) with the qca
tagger, backported to OpenWrt's 6.18 kernel with PROVE_LOCKING. That
tree also carries the MIB statistics series, so a work polls the MIB
every 3 s next to ethtool -S. In four minutes under about 50 Mbit/s
of routed traffic, 938 MIB frames arrived after their request had
already returned, and all were dropped. Frames made artificially short
were left uncounted, and the requests fell back to register reads. The
ethtool and netdev counters stayed monotonic, and there were no lockdep,
refcount or other warnings.

[1] https://lore.kernel.org/netdev/20261019191137.307514-1-kuncy7@gmail.com/

Stanislaw Pal (3):
  net: dsa: qca8k: let regmap serialize register access
  net: dsa: qca8k: drop MIB autocast frames once the request is over
  net: dsa: qca8k: check the length of MIB autocast frames

 drivers/net/dsa/qca/qca8k-8xxx.c | 34 ++++++++++++++++++++++++++++++--
 drivers/net/dsa/qca/qca8k.h      |  3 ++-
 2 files changed, 34 insertions(+), 3 deletions(-)

-- 
2.43.0

