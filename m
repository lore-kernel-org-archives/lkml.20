Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725275;
	b=kuzoOVeJlcodtome382cKtZ8IkJ6OjAX+VXHapMMmD0wyrX9NgZtDSXg3k2Bd5cbgR2Q
	 Git8JpIZjXMYXqJRvEBnBhR7o8cIzoF7514K/5o/YBtIchG/hntt1kqBy2CdIn8FIesHL
	 m10/ZcRSOvERlurOCOnBdImcMvwDzeQqnjJxyFWgAxK8eKqHrGjTGopor3zYfmeUhlha6
	 Z9bSWGm5K8uCyp75NvilauT4ty61P2eDGszHDxw24BkwtJy0hcbFe3pyAYb+Zf8YmJIvI
	 lJ0sTbNFjglDrNEZkYTepqvHeo+TDdGp2fnHN0DAA5UuAlRzfde84hX5v9aTWXql5bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:To:Cc:X-Mailer;
	bh=tCOuiXg8kpPxflANatAGCcoqQ3Bqdp5UPGwZfT0KsEg=;
	b=fgPeaUEwew9S6+FV7jW3SBgX2nL1V7q0NBX81tbUwYC6rRLJ3yW0x52pVSJoFzbpeDU5
	 eKy/Fg0jUfdbx8ocFmoS9EIStiIDW2do56el1bCOJRJoieo4GMAqeCeNJOmbMuonpP+No
	 7T3iKB4eIDI+2YklbDATc1yav5V2cbOnK9ZifiDNMp2Tj9NBZKCN3vQ9Nh5HdoNUsYGK+
	 xYME1CaR1C+QeMVO7gKOqHKiMfabS1S7NaPp3E6Oak+l2FlTBV+lISCTinuULQr9dt2Lc
	 LfkqTDzatVPX2kt3GdzcN7/ZV4QOJv4sipVU34kxSSHnNojZCv/u89kcNEifcHSrhjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oJz2hC3C;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9B2606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA9B2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oJz2hC3C
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b15e46698aso2044163a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725274; x=1795330074; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tCOuiXg8kpPxflANatAGCcoqQ3Bqdp5UPGwZfT0KsEg=;
        b=oJz2hC3ClvJrfhKNgz2wQryvBei6eSKNVOTwRwIrluYR/TalqWb8P0ajRdbbki1okt
         7/mhDKKbseYy7ovi8vY5DAOsNoE0GiFVY2PF4YmfAfSb1MdwAEe4I0pvuvF2wEiVQ23i
         5nVELoisMLrVlGv+K6fVFmUiCRv33Zi4GOkvJMqf2Wie7FstaCerZX1Mf6tDYkA5HkUV
         Klr0tccU6VrlHU6rs9XUX05jHZ12cNDMrB7KA0rXj8h6PFghS19tXeJ6I4HsiHuh3ld9
         Y/ZWkdTEZPCJkpvu31RUmCLrgVIquGTCfyM8LWN9sJBR3mT9yVECKwbs9LT6/Sq77jok
         8MUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725274; x=1795330074;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tCOuiXg8kpPxflANatAGCcoqQ3Bqdp5UPGwZfT0KsEg=;
        b=WYkU+fKZVrx2yAlh5pRuKQ5El7Gn4TvZmdj1bo1ZDqYEriFMeFXP31kkcgwd5oMjJp
         5yKwwkoQ6996+fMi7bJ3AmGONMAJL59wTLsNaHio/5WFqj2eahzviCtjhZRaF3e4ZF4+
         /L5OV1xEk9+VyNkGNvqVr5NxAyTXfdOmyn+EmTVT4nGi3p95NEICON5FlK235Ivgxkhr
         CRfiJ0qIAHRRdhY6fKfpBsCzFPkmUOOvJQUWbl7RnS+tDVhJ8c4e6yv2DdwJeKsWcLaA
         BunT8lZdRqrcQ658oJBX+Oedq85G1Y7DgogawNnYCd9/taXD9EO7zWiyQJKe8bUEfwR/
         ux5A==
X-Forwarded-Encrypted: i=1; AL+hErHQlYQ8C1kulIydHL4xtFI2uDNJW7MrVWh8cFOm1shRITKVmO97zGf0EKF935kOEbBq23etIbVLoQ53+N4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FH7WGHXU+H4o9MjSo0C+fpWNOaAWu9QfmR4foat9yjkjPkTGy
	jyc2ux+93O6LGfTXMTrkOQLuU72WGH2+acgN3SkvbpoJJ7eoDMMlfpMY
X-Gm-Gg: AYBFou37IV1wmSZcWSsN8qXvTiXYpSG4WIfXFBW1p79DXJ3VslrhNR5OIwJpgq6F1Fi
	rsGY9rwNjzoz+cRe7yORjJsuRIOygcPph8pYyMSdXWdwT7tCPYBfg414X9tJAEmDWOM3giPGKQO
	mXwUWYC+6IHvQk7kZtQ2mZPtM8RQhNKDH9oefSK3JQosCk7wtOrAcT22ZKs+WfpSE714XXagBec
	Wy4fxRqlfLbrpg6HZsvg9/+aIWvlTz1FnqrayM9o7rWXNC6m+s933YwwXw2KeJWWrlalPHHwk1w
	tNFmIW+8txKQD05Nwvb2ta0os0600jf4zO5mDn+BcP6afYz8CPdthJk/0Q24a3ub47PNOURGiY6
	8XmLA0BekKtUa3/3eiCRVFsnVYqgFIPgEAnY4SplKtM7D9TxZ1+y0desJFVA1C6Xd5AxDWnC503
	A3h6kvJL0WAM2kfImem36GIxROpPKyBBSiz1kJB1jZXwGnbixtt9kXByHnUX3pODneG2VJXPduD
	INX5NN3HBu28kt/auinvGbI1IUQcygpQj9sjPH9+oEztTYIxbiATKB+77IhODIFouoe/+28lauv
	jO7JqaPvPyk/mGGPMSP/iESY6kYuTg1RwNyiYLiECPuR4KKuxOFju/maYHpPgh/IKu3DqOwcmiV
	mM1b08z40FUmiZnpBUzojaQrhIyekh05mqCe1/SzSZ3ceFm824ItPfGph+6Wag59VWTkuXSlUtS
	LjgA==
X-Received: by 2002:a17:90b:54cb:b0:3b0:ac2c:1619 with SMTP id 98e67ed59e1d1-3b1b0a5064cmr6609898a91.39.1794725274127;
        Sat, 14 Nov 2026 22:47:54 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm16136309a91.13.2026.11.14.22.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:47:53 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Subject: [net-next PATCH RESEND v2 0/3] rust: net: phy: soft_reset may run
 without phy_device->lock
Date: Sun, 15 Nov 2026 15:47:35 +0900
Message-Id: <20261115-exp-phy-rs-maybelocked-v2-0-8fa7897a0352@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Trevor Gross <tmgross@umich.edu>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, SeungJong Ha <engineer.jjhama@gmail.com>
X-Mailer: b4 0.15.2

The Rust PHY abstraction tells `soft_reset` that PHYLIB holds
`phy_device->lock`, but phy_init_hw() calls it both with and without the
lock. This was found while auditing the SAFETY comments of Rust
abstractions against their C callers, and confirmed with Clang's context
analysis [1].

Patch 1 drops `read_mmd` and `write_mmd`, which make the same claim, run
under the MDIO bus lock instead, and have no users. Patch 2 makes
`Device` generic over a lock context, and patch 3 gives `soft_reset` the
`MaybeLocked` one.

`match_phy_device` is left as it is. It runs on devices that may be
unbound or bound to another driver, which is a binding question rather
than a locking one; I think it fits better with moving `phy::Device`
onto `device::DeviceContext`, as `pci::Device` does.

No in-tree driver is affected, so if this is not worth doing before
there is a real user, I am happy to drop it.

The audit, the patches and their changelogs were done with an AI coding
assistant (Claude Code, Claude Opus 5.5) and reviewed line by line by
me. Compile-tested only.

Changes in v2:
- Keep `&mut self` on the moved methods, so that `match_phy_device` does
  not gain register access (netdev AI review)
- Give only `soft_reset` the `MaybeLocked` context
- Drop `read_mmd` and `write_mmd` instead of leaving them `Locked`
- Document how PHYLIB calls the `Locked` callbacks, and fix the
  `from_raw()`, `phy_id()` and `genphy_soft_reset()` SAFETY comments
- Link to v1: https://lore.kernel.org/r/20261110-exp-phy-rs-maybelocked-v1-0-3023cc9055e9@gmail.com

[1] https://docs.kernel.org/dev-tools/context-analysis.html

---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20261110-exp-phy-rs-maybelocked-v1-0-3023cc9055e9@gmail.com

---
SeungJong Ha (3):
      rust: net: phy: drop read_mmd and write_mmd from Driver
      rust: net: phy: make Device generic over a lock context
      rust: net: phy: pass a MaybeLocked device to soft_reset

 drivers/net/phy/ax88796b_rust.rs |   8 +-
 rust/kernel/net/phy.rs           | 206 +++++++++++++++++++--------------------
 rust/kernel/net/phy/reg.rs       |  17 ++--
 3 files changed, 112 insertions(+), 119 deletions(-)
---
base-commit: 573af801552999954caa8347e4490b04cf4763f0
change-id: 20261110-exp-phy-rs-maybelocked-ddc59993efba

Best regards,
--
SeungJong Ha <engineer.jjhama@gmail.com>
-- 
SeungJong Ha <engineer.jjhama@gmail.com>

