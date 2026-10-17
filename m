Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ACA3D75BC
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792234796; cv=none; b=avbj7PWtO/rvqn8hQRdK+91W/XZDYCun4jLfA8nIhjq6hZRoYE2O7n+AxzWCNRc6WMg0E2vgmwuDnCKO2yaAW09vik8Zsxv89oIFaEsCHNdVQ7r5hS/8nxIhYWFNXexB5k4rZlZGwUbdo/0GN5R6V8QOhxJp1r/lEAAogy3HBTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792234796; c=relaxed/simple;
	bh=jQUwl37DgaThD4aZQvx7TB44uxGYxczvSMUsxh5IEuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tvAhbYfB8XaX44Y4G8vpfHGwVlVwoDoAJPjgr5+K1CrntsFREu43LdmTL7DmVtZxVt6ge9tp1RHzwMDGeex8mQlIRF7l/9b/GN5J9TB8u1NxnycmIKI3LYPB1KnxkylfeStpBt+VgfwVoa/y1yMvYn91aEveIcBqMlW2AqPpTkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXFu9xh8; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXFu9xh8"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so474499f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792234793; x=1792839593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQUwl37DgaThD4aZQvx7TB44uxGYxczvSMUsxh5IEuA=;
        b=PXFu9xh8HaM7SCihLY5vx8jtuLm6XGqCfQJP1yIs5/MTuw+DIosj3y6HonUUsgqcZH
         OpcmiGTsciv/je/kV90s/soZULyWyrf/6N1mL3h+/MyFbrSF2b2FuQ/UYaR3lqRXxZql
         EjhPDcXy4Vau4xrNdYDzzgl4DsWXErxDdZZQTS3qFfpw2Fw2FZ2i4ZfsW7oCqpt7F7Xe
         VDxTWCreL4kjHtvHndbLb4IvT4i5+WkeqsdcZE+qvaDvMW0hjocyVbEr063vLJLPQ3ne
         BaUPBHE9tQ10gU2U2lfmzh4Xfd8dMrGxAPRXUj+wAZz7I6whs8VYQK4AwCUbmOPdtwA+
         uWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792234793; x=1792839593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jQUwl37DgaThD4aZQvx7TB44uxGYxczvSMUsxh5IEuA=;
        b=EZnlO+60G0FvuU5Y9msAAyTU8wCzomc/6CXRWfyZQf7VULYMPXWfDIfh9Fw4oXIY93
         jFbbfJfCmSIrHqrchxziLgeqGquKqYPHBgU2ecd86ylyBWSsFtiGypf+dM3icoHOpPCR
         eKu6yLjX9Agp1rYToxGNjqNl5qSfe5jZBgzhGyyxRG3uAJTzc4zcxiVWG9fxTllJb/2S
         TAq8ReIkToYHZ3OILwRYgcNB10qMMnv6CICpwjF4XYOQPMWsYaTaeKUhajeVJUyprePn
         lqIXgt/LN81yFPOJPuYJeTDh733HNGCwMp7jZusOBSIGf06uPO2ZQQ5VA/ZuuMe/LiG2
         fjWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhJHXNn9xZQlFhtJWZw0bqMae1Cc53ZjqfLU+D/dT6NBxBXqsdlcDsKY2hHWqYtYU/bPY9znnQZsVeJGQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCQPxXpWnvFWpZtTGGxdaS9g2adNJwJgAwMBuTQ0TLL6s6zDUE
	IQgXlWBZyOmAjFh+k2acOcik9GA/FAlWuX7QA74WGSJilMJhm02va7igbMblzqC5
X-Gm-Gg: AYBFou1mGGU7CpXOfUpPOuIGlLTvk/iu6Qbup7w9TgSsdshxLgV+3onvtGHjXm9T2oQ
	NvJP0mJC3fVwzbqz54QacUoG3upeDItshY61s8b98PsZhqqP9+iZC/3H0WxNmHCTf5E8PH68WJ5
	bF/2wuDhPYDkvuxs6iONPBi6Emtl4u+cuEY3Uqa1vw8BfJd9cGqYcLmw2nLBW6mc70ipT/Nbqd2
	uq8VdxpA7QMdCS37yWujHrJafS+EitZwFJiuA4qPxTH13RH5RBi3JrErTC0d/KXY4Zd6LXZ3F8y
	HJXogWV6LbJe06fmmPfBhlqPq0uSpWbMtEsNrRa9K4icDoDvdy0a7WQaEQ0w22O9zjwqtxnj8bO
	U8LGZhkTxab3TtE9o1i7lgimuFqB7MjJZiuYTdv3mZyPBg+G+RP7bGWQsqE17mPWtwOuhScXxcK
	8wnn5ly0mlHNkLnj+4K4exD7NL/Mbcn3GzTxqcc+u0kHhjBpkY9y712O2gjse7SK3b/QUnKPEU3
	XUFh88=
X-Received: by 2002:a05:6000:2889:b0:48d:f14a:9179 with SMTP id ffacd0b85a97d-48e07fadef3mr4438450f8f.48.1792234793046;
        Sat, 17 Oct 2026 03:59:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f44:cd2:abb8:fd3a:ad16:dbb5:6d35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm10213993f8f.30.2026.10.17.03.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 03:59:51 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v6 0/9] net: dsa: realtek: rtl8365mb: add support for RTL8367S-VB
Date: Sat, 17 Oct 2026 12:59:46 +0200
Message-ID: <20261017105946.20395-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5a4715dd-89e0-4868-9ffb-c8fb73b18d04@yahoo.com>
References: <5a4715dd-89e0-4868-9ffb-c8fb73b18d04@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From the family C side: I ran this series on a TP-Link Archer AX55 v1
with an RTL8367S (chip ID 0x6367, family C), its CPU port on a
2500base-x fixed link to an IPQ5018 GMAC, on OpenWrt's 6.18 kernel.

That tree carries rtl8365mb patches of its own: a tag_8021q-based
tagger for a packet offload engine, and one that holds the family C
SerDes bring-up back until the conduit is up, pending in OpenWrt for
this board and the Mercusys MR80X v2. So take this as a check that the
series leaves family C alone rather than a clean test of the series by
itself.

Six boots, five of them cold (power off for 30 s, 30 s, 5 min, 10 min
and overnight), and two restarts of the network configuration: the
trunk came up at 2.5Gbps every time, with no FCS errors on the CPU port
and traffic through it, and a VLAN-aware bridge on the user ports kept
working.

One path I did not run: with the bring-up patch on top,
.conduit_state_change does not bail out on family C, so that early
return was not exercised here. The SerDes register mutex and the other
family C paths ran as posted. I will send the bring-up patch to netdev
once this series is in.

Tested-by: Stanislaw Pal <kuncy7@gmail.com> # RTL8367S (family C)

Best regards,
Stanislaw
