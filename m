Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308430;
	b=qhweiZz9oX878tLRHCudBHEtu5Hbg6qZ6FZIJ9UQSNhgs8+B/x2/XjWrDs2OrB9rNDOI
	 8bE3r7hrAv76eSo1O9WhXlQ3zFys4WjTH91k1K7pJMVMCah8hwE29ABouqHIt6tH7exh2
	 np9JOykAV9zeYWlVV438UCbHdEQwj4Qm7wMcLizSYdWz7LGHTyIj8VjJppQYTaN5RI2Jy
	 Zm1j7IdWxFuQ6Fie7mDl3RAq0cVHyoiMvRQL7d6qzwHr2dFnuHZPGfgvqvXHv352H8gi+
	 wIFNjHSRn7s1M8b+079sRLJg1Cd7Sg8Ph2uzrDB0V431jVw5HtsRyoHa0TG4iI5KVuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=VbVGUB3IRAFoe3Oztm5dCzRoAL2gir1+wqkvM8dJQDg=;
	b=Go0HfD9H7ybsiQk1QDN1k+LL7mZdOeqFCJC4+JG+ooYHProugQBQ/pbWFy1Yw4uPzu9x
	 AhK1UEmNKZ0Y2dY5TJXz9SeTveCN5rWCEd3vtlBcGQ4Z36/mBbVx8VwZisOVMDktMrmQH
	 dgMY0ZK5Iw9Rfam2tiOEgZbNuel81YLZAIl5N7mi9lLNCS6tjIW2N/7gmcleAXKjmgq2z
	 Wm0ajQknGqJ1Ujq2s+KyvRsFPVfVH/+10MZtUauZ9f2/KNWkdJ0ghgPXo0rHnYSdTLByR
	 //oxsQUGOz8H3nKHdFRx/Athhc6wlFLaZiXUfopTVDB0HcaN//vmeG7X3pX0oQcwvlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dECL2K89;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB55360A2606
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB55360A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dECL2K89
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b2f59de176so1369663b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308429; x=1794913229; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VbVGUB3IRAFoe3Oztm5dCzRoAL2gir1+wqkvM8dJQDg=;
        b=dECL2K89EqGowjtmI85fE1kGXTnL5DUZVS2wH51Rwra2wZRbiG0W8bu8tMMkigTC7U
         awRTsHAOB285Gdu1rbosZ7/4APLkYRQhFtagGq1XTpo/z+toUUaI2p4RkbrZdeGmn68j
         m+5Ci5V9wFQPF06o6KfXcpkOC6lr9uUPcRyvNTBQ1XQxGqSfoPQeOeGhB/WuI/ymDPRe
         s8rUbIIqqFqUUL4UloiNOjCgAuntR46wZeHIjWTrUfFUSoyZ6vabDBMBotOG8EAilzH+
         66N6JtHLCZSe/6KOg2mh81PjYmyjW9wcN53gLi+dKBOkQlJmMvo8ZTBsF5Gk1zLbvFEs
         V44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308429; x=1794913229;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VbVGUB3IRAFoe3Oztm5dCzRoAL2gir1+wqkvM8dJQDg=;
        b=t7Fps2QsIUTTtRivIewQHRTiQ6Myc19Z5UQDmqVG7t8uoKD5CUEn4mlMqMsif0hMCk
         uuWjJxJlxcpDq3fIJt6Ycm1KgfyUNugSLF8aYd0R8xFr2gNBk+bu7xiiwddSvC56sV9G
         hML9f1brvoniruIDJkR/IqBFt4dTpPJgxl9tGyMgsUVAozKgZ+cXy61htzZnpsiGp/Or
         FiwqrOfrkzMzv3fjibgHalhtgVLqhEAp9DXbQpNwyG4xZQdrF/fmdwjdNhfyg9/J16yB
         jVX/DZdcotB3pzmKd4+IkBF3i5TxFCX8QF/DhLelikAtGfenfbtbvU9fAXLDnPa2Rvyr
         t/ag==
X-Forwarded-Encrypted: i=1; AL+hErH2L4z3Naptg1T0y0IU3Q6U9iSvQWdK+9M/ScwIhCwNJMS48GGV+A5lxkOgsDnuwsMLMlAV5g2AnTVsdrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fPyMiTmY0mbodEC9VcjVouUYYNktuKRv7c8gnaGoLZZH32kg0
	bdKi5pRKvMpl6kH9nEe8czFt6eaG+S6pfYAq+zIo2Q0ghc0XPaIKiMRa
X-Gm-Gg: AYBFou3Ja/A7J/Xt9KCuj3y1mEMnIda4may8ZiHEIOS58tR0AoN/XwQwaQHWOddBs+z
	eMfXfV+BD5+SuHsPxIk64lILQb4J66WoZq8/EiY5nGbXS2AMoEwcAb6KjUy6kY9Ep59M3/YewRM
	0n0icDQO4PZCSO4gSBSha0C3iP7wI7waGFfGvy5HIWJV1Sp6FoRODbCspz23jiaPRU3gzgz/Rkn
	pFdJd36zV7EzroQLTYqKralV7QJsd3GfsR5JrXq4ktpiAbSEe36AkZBma7zeIHQAMVh3Xf1/aaL
	OR3a/bbsQwRgMVWpMv6BXKTFyxc2wQxYkHp4BjLtl2A8PIIQ/6I1f3XaccB7MkZH/PfhP2JOo+H
	HncHvk0Rzh+mWJrLiUj5fhBgfm1jOdlrzDDq30BXeZCMEdG5qIrIP4MYpDnB6SaR4ucYRTGmeaG
	B+GJIRhlF4FFeBXLhy3jU/WuOQAu3M+k0a3ChCgs2+beZUd59XQ7Q3OWVHrAA0Ltj9+NdP5iFB0
	mKvSgmcxunR7PBUvPjK2nGeBCScHWvPsgldLTbkniHPtKFFcSnucarpwNKbRlrzXeVp/tywqKAp
	OjVvsva8msGbAuzeX/RVHj8zoc653nd1IJN2SSwd4LgzRyeVzQusFiIvXx3tWZu/GB1e9NQxIje
	VLHA00cszjgSr5ADYWUP9Q+4lRaHH85rF1Ctf15fF3jUIYMhqxY3JOXcicy67Z7guSCgLkegYIo
	X8YoUL
X-Received: by 2002:a05:6a00:1817:b0:89f:e64f:c34a with SMTP id d2e1a72fcca58-8ba8a6e5212mr2359802b3a.46.1794308428472;
        Tue, 10 Nov 2026 03:00:28 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7de768fsm740596b3a.6.2026.11.10.03.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:00:27 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Subject: [PATCH net-next 0/2] rust: net: phy: soft_reset and
 match_phy_device may run without phy_device->lock
Date: Tue, 10 Nov 2026 19:59:25 +0900
Message-Id: <20261110-exp-phy-rs-maybelocked-v1-0-3023cc9055e9@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAA358moC/yWM2wrCMBAFf6XsswtNRSH+iviQy6mNlzRko6SU/
 rtRH4dhZiVBDhA6dStlvIOEOTZQu47cZOIVHHxjGvrhqJTqGTVxmhbOwk+zWDxmd4dn791Ba73
 HaA21OGWMof7GZ4ooHFELXf5GXvYGV75f2rYPOElOXIQAAAA=
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

While auditing the SAFETY comments of Rust abstractions against their C
callers, and confirming the result with Clang's context analysis [1], it
turned out that PHYLIB calls `soft_reset` and `match_phy_device` both
with and without `phy_device->lock`, while the Rust side assumes it is
held.

No driver is affected, but it seems better for the abstraction to tell
the two cases apart. Patch 1 makes `Device` generic over a lock context,
as `device::Device` is, and patch 2 gives these two callbacks the
`MaybeLocked` one.

The audit, the patches and their changelogs were done with an AI coding
assistant (Claude Code, Claude Opus 5.5); the lock-less paths were then
checked with Clang 23 context analysis as described in patch 2.

[1] https://docs.kernel.org/dev-tools/context-analysis.html

---
SeungJong Ha (2):
      rust: net: phy: make Device generic over a lock context
      rust: net: phy: pass a MaybeLocked device to soft_reset and match_phy_device

 drivers/net/phy/ax88796b_rust.rs |   8 +-
 rust/kernel/net/phy.rs           | 183 ++++++++++++++++++++++++++++-----------
 rust/kernel/net/phy/reg.rs       |  17 ++--
 3 files changed, 145 insertions(+), 63 deletions(-)
---
base-commit: 2d916a8c307c31b433318509bf0311d52d509f09
change-id: 20261110-exp-phy-rs-maybelocked-ddc59993efba

Best regards,
--  
SeungJong Ha <engineer.jjhama@gmail.com>

