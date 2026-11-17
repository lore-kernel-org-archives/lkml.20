Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911789;
	b=C2UL2prGqrtBlaMjfG1Qbs7QOh3MVYuJfi/255JQ7PxZVkFWc2Tvy8gss4maadwBNigI
	 ZZpqq26yS+dd3r4oAtATp5gk+QN96HTO/ajGQ0cT+YT1Sdq2e7MRcbUmGw8a/906bvMR4
	 8mITPmYukekvNmzeNrgcX30CivZuMhHLnDR2fTZlHj676Mz2eb4S1ds10+6LV+lOfUonS
	 uDkb3d/jKxRm/IEbwFL8QrxXD3bVEqWze7z/Pg6GQIxl9G7N4yRU0jqXqKpitP9wGQ9/u
	 OAmU15EpB8dyVsCHtU4nQlERolWctuWG38FyMnfoybY8WvhI6mhCjC2OKRhxEVunTlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=dVsMMxnk5C2hLXw6Cp+8gHfJckxJ7C3h8A+Jqq/uxAU=;
	b=e7xEOTErApsF/YMkJqMXJjfMqbhOOlDUmcTg+vJGXB19fX4EAmSAYQ9dYk858n9kioGZ
	 xl23i+N1GXFhAzx8lblOhn50brgfUdHrW+osguNrX9vWfYlrUQRueANxsVTwIj+LdeEi7
	 u46UZCfaKbECZFoTLRBs9QmY5EAs9TDfsffuV1nxGuUvSA3OG9q0RhhxbJoyb1oBWk5e9
	 80J9ThyHhnq/gvZD7dWLLqBG9E0tkPW+1npqQK10Mf1FGNdMBkk/a502i37A+sHQtggNp
	 9gIkrNtIhakOZ0ND84rWd20TmOLnuiiNx8yuZotWoXzcsUsT0Cs3Q2PHjKYfJF8yccg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1SpCXml;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032FB606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 032FB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1SpCXml
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2efd824d492so4467465ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911788; x=1795516588; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dVsMMxnk5C2hLXw6Cp+8gHfJckxJ7C3h8A+Jqq/uxAU=;
        b=Z1SpCXmlYQlLPR8Osm1Ibu44+bpd2wZezOrB/tbGkBrxWRb37aEq9G3cUx/KlkNJce
         7n0kyoHmAKDG1RHOvOaEuyrDGetF8IARZQ7GIqH+YkqnSxpdtLAxJjjA9sX3f+NXuGD0
         SRrWstDUmMqUZuVziQwFYMqfI8CzMmZrftlUESydVlvrW70wnq/VlDml1jcmVOXf01bO
         gSA+PicsO5Uf8gVm3KAswe9l178IwdxwoSXsJ1ByQz9gUArsQWEy3K2pmlXhvVqYJo3T
         vyrgoDNZD7xOQTK6kiVThBlB2/582umMpiWjOct2AM7huOmIyWHWxA4YnHDwQuLFE/mP
         NjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911788; x=1795516588;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dVsMMxnk5C2hLXw6Cp+8gHfJckxJ7C3h8A+Jqq/uxAU=;
        b=JBtb408guWSFu4ufTaNZRRGQXsHEHeV6fa8qHWu5JaaP1YbB2Cb/oZ3Uw+uw8ehCX4
         XvFL1myCXp8SPLXVg8ecKlnaYTh8+ivVIA9vQp+8I6oYw+8H350Ab64+zGLG35v9xzMU
         hDjXvdTDj0C84IurZERjlHJalWBOSuBVNqigbO+NaCWiUgLd4FXziO09DhWlYtlfeYSr
         +CMXdv0RxO1ycT4FspS0MvWoAZVVleKP50iwTm+Nlf9glhsHUMMgQiuaRVe7J2zZv1Un
         OkeuPmypcJmuIBchgwdE7L7LS97R2F0/DpGMWe8F+dP5slltw9ob69ZwvOBhT8ZLPOzY
         Jrgg==
X-Forwarded-Encrypted: i=1; AL+hErEcAKbqaxuSye6hZAztjdwyB6upGU0N8bJlZPsVKk5cCxGYpRjZQpedspOY96znp+Fsml2IdYTDTWESuVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RN/OgUd54017ZxLFmh8ZmIyk4hE9OcjRHmkfPAcWNK/vXrU9h
	atn3U/aDzaH1iooyK6jnO08HNSqlbpbx0gksuxuL2K9oUEl0Ay7qw1fa
X-Gm-Gg: AZFdTZc6TKL2oS7yJgDBHMUG25Z5QL3s5TETqqtPNzVNb3xAcGFQdSFKM0ld5y1+yGA
	iTzXQHhBsyEj4QY9+4RjcV7jIveHaL2cmSqnqGc2veqI8YzaUIUM9n1AxdaQZqIj11eO5yTyoZr
	gm/POlb5OSYarJoiOZYYjS/bkS7iA8E/rFF4amqSZ/dvZemnqTiF9grnNgpR9bbhbxRvVha3Wpo
	vYmcBkEbLzun1GB8g/fmetH1t6d4qQRG24T9sAJaybtHY7Omk95wlX4N+XN/Suxn9qS0pKEt1kA
	tNzk99XLPNalKqVP2suyplh4jMLpj8k1TZVsRFzzCHIp0iyva/LO0hCM2Ue+4I6h/2TL0jVWcNY
	vQA6sSEzyRbJt4IKGJ5Qt8EsFOYVsd0/2avfDYjHRVMxxMMCGsYGzXQehZ7fOwNwbQwwIyjQPJa
	OI8R0i49e3H1JyyQJtaPCATFKW66HVtxefEjaYddOV6YbJQhSmGs77tPvxRIkc9mNmbFUSQm+AD
	98E2rw/uInRlLI6FihRT+3ofOJaPuaqR2L4CrBS5igqvWZ18BpGC8acR26UXndOj6V1hpxVISLz
	TpCD1s4EnqTznTurqCHoGlu7BYspc6tXieG93m/Z3t/NZSUOuQ3KlPlJLNlRbGIGcUMtb7ko4TM
	SA0GleMHF7clDQ0FLLuY0EH7nQHdIX2mR/Xg78bM9oamZ3iiJRD2BHwGIbHo9+vq9KT3pQJbvTN
	VziEM=
X-Received: by 2002:a17:903:1905:b0:2ed:2176:2452 with SMTP id d9443c01a7336-2ee0da7c0f7mr125573235ad.18.1794911788247;
        Tue, 17 Nov 2026 02:36:28 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8f08sm13094805ad.4.2026.11.17.02.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:36:27 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Subject: [PATCH net-next v3 0/3] rust: net: phy: suspend may run without
 phy_device->lock
Date: Tue, 17 Nov 2026 19:36:18 +0900
Message-Id: <20261117-exp-phy-rs-maybelocked-v3-0-4e183a7366a7@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIACIu/GoC/4XOyw6CMBAF0F8hXTumD0qsK//DuOhjgCqvtEggh
 H8XcMPGuLyZuWdmJhGDx0iuyUwCDj76tlmDOCXElropELxbM+GUZ4wxCjh20JUThAi1ngxWrX2
 hA+esVEoJzI0ma7kLmPtxh++kwR4aHHvy+E7i2zzR9pu77ZY+9m2Y9h8Gtjf+nRsYUBCUC2sVl
 RLVrai1r862rfcjAz8y6U+GrwxTOnUukxeTmSOzLMsHd0UN5R8BAAA=
X-Change-ID: 20261110-exp-phy-rs-maybelocked-ddc59993efba
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

The Rust PHY abstraction tells every driver callback that PHYLIB holds
`phy_device->lock`, but phy_suspend() calls `suspend` without it, also
right after the state machine drops the lock. This was found while
auditing the SAFETY comments of Rust abstractions against their C
callers, and confirmed with Clang's context analysis [1].

Patch 1 drops `read_mmd`, `write_mmd` and `match_phy_device`, which make
the same claim but are called under other conditions, and have no users.
Patch 2 makes `Device` generic over a lock context and documents when
the `Locked` callbacks run without the lock, and patch 3 gives `suspend`
the `MaybeLocked` one.

No in-tree driver is affected, so if this is not worth doing before
there is a real user, I am happy to drop it.

The audit, the patches and their changelogs were done with an AI coding
assistant (Claude Code, Claude Opus 5.5) and reviewed line by line by
me. Compile-tested only.

[1] https://docs.kernel.org/dev-tools/context-analysis.html

---
Changes in v3:
- Give `suspend` the `MaybeLocked` context, and make `genphy_suspend()`
  available in both contexts (netdev AI review)
- Move `soft_reset` and `genphy_soft_reset()` back to `Locked`, since
  `genphy_soft_reset()` in `MaybeLocked` could race with lock holders
  in `suspend`, and document phy_mii_ioctl() as an existing PHYLIB race
  instead (netdev AI review)
- Drop `match_phy_device` as well (netdev AI review)
- Fix the `get_features`, `soft_reset`, `read_status` and `resume`
  SAFETY comments, and name the context at each `from_raw()` call
- List the exceptions in the `Locked` documentation, including MAC
  drivers that call phy_init_hw() or phy_read_status() directly
- Link to v2: https://lore.kernel.org/r/20261115-exp-phy-rs-maybelocked-v2-0-8fa7897a0352@gmail.com

Changes in v2:
- Keep `&mut self` on the moved methods, so that `match_phy_device` does
  not gain register access (netdev AI review)
- Give only `soft_reset` the `MaybeLocked` context
- Drop `read_mmd` and `write_mmd` instead of leaving them `Locked`
- Document how PHYLIB calls the `Locked` callbacks, and fix the
  `from_raw()`, `phy_id()` and `genphy_soft_reset()` SAFETY comments
- Link to v1: https://lore.kernel.org/r/20261110-exp-phy-rs-maybelocked-v1-0-3023cc9055e9@gmail.com

---
SeungJong Ha (3):
      rust: net: phy: drop unused read_mmd, write_mmd and match_phy_device
      rust: net: phy: make Device generic over a lock context
      rust: net: phy: pass a MaybeLocked device to suspend

 drivers/net/phy/ax88796b_rust.rs |   4 +-
 rust/kernel/net/phy.rs           | 299 +++++++++++++++++----------------------
 rust/kernel/net/phy/reg.rs       |  17 ++-
 3 files changed, 139 insertions(+), 181 deletions(-)
---
base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
change-id: 20261110-exp-phy-rs-maybelocked-ddc59993efba

Best regards,
--  
SeungJong Ha <engineer.jjhama@gmail.com>

