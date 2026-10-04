Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4B43B2FD6
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791129995; cv=none; b=EMYbvKUZ5HDte5IrZHsdG2r2oM4qwOys4OBPYAWfpQqJWyZcezcSJk+V1JnGL3AcP8F3PkFn93GUSXpEvZHtV3+bsM9IrfsV9u/7MgRIsQU2PjDw0sBZQXP00zUERe8M3xuLVz92EABhSYKQ0hEj/ZaqhcNAtwvAmx7qO1VFTtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791129995; c=relaxed/simple;
	bh=vP2e0DDATz+/dnIK1r5IHJTf3D3bophl0e1E+zMK3YU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HIjNMEHkAN26hyGhLR6kfxLIB0UgVO94VptifBEcAm4OPrcHi4cfXsqEx5V0pN7FsNJloE69+jCQFyhhbzHixYEqvIUhtNqQRe+NY5qMUqMCUvZR9lY0h7EjHr9+Oq4UcXTn+kMl3Vwgei8PCgK856jQm6MF8YUOBziQLSQkvNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGJh+PKR; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGJh+PKR"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8520161fdb9so656899b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791129993; x=1791734793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pIpEITx62Fz1BVkyhSUmg0yb53AS7Oo+RQtwMumd37s=;
        b=aGJh+PKRZ616QvvOI+TCsOpD/t3VS08qf2e4LGsjPJrkOlfPJyYGa6hNuMEEe4ESvX
         ZBPJQn0fTzpvNWI7zP5i2iSoKViPetVDYO/VHdQi5SEyfcsHY7NHOs6wqyMOwX6s1uCw
         8Mn8hOTOAI7mADzznT4RIr4ECPpEIo9v5U2vZgIJPUTRRm30jHPTYlcZyMqyxJvgdZfE
         FHRiXcbsFnpq5EYieDSR8h0rDii9AALA/h9NdThdgRJuNhuvSWEgiowZVure3MQbRI7D
         yvq9/hRWlEbkPf25Dosmy6OX/kUBrSSYdVzRYRx0N/7fufcus7nBlyy3V8s6ptW2kVOA
         ZcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791129993; x=1791734793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIpEITx62Fz1BVkyhSUmg0yb53AS7Oo+RQtwMumd37s=;
        b=kp75AvoCCAobcGmbJ70d3udlnGW5zsldO9m3IniimgJXwh4bwDeq6rI0spJxZmf6sZ
         qd3MjZKWFOB9mQ0UNnP+jbmeOUrgeFchmJKqdKzusaUW9nfZbflAM+plGktBcicAD6Rz
         5GWgvHOKX8rS72d1tE7VMQ9pSMTyBaE1eu5RdVVlTaTx6IW3AHgMIHWx8oLYcLyTTBEh
         0JhV4Qqyhx39Jg0kbofuKmUIRt2qNiGsui77tshPv83Lykq2uZKV2fYQ9xNapFayeKas
         V73c75GR5EwtnYOMFxavpE/1RwTZ8dgNDpZ8TLcFyXopRMVfQjYNfMzYKWPBbDlQqtGL
         V9/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTyCCIMYMeISHpfjn9WH9eQmKRe9R+bMRljIyOmfFqhJ/33JyeAu3L8M6YhyB9EPHquSl+iA9mow0U7YU=@vger.kernel.org
X-Gm-Message-State: AFuF++mXepwJAErm5+B6Loe81k8IgRiM/KbNRh+4KADwMOYck+u06Cgq
	37N51RvkUkIEeX+uNYSRBATcsB/vJ2RvMUAgXUXyyUKdGRWaGOSXIw2e
X-Gm-Gg: AYBFou3z9muVC4bbDJC44aP00sDpMD2CojNeUp08LNaGbe3ltsFnQ/nhEAILC9g3UKD
	x+Fopa/KDWJ1KOh+7tSBpgR/apMnh6SqzcHe7qHw2EQ16UVUuvgyqi5Gb8fscgteSa7kFIz/wnd
	5jZPQ0oZuJWJ8fjeNYcS3/I4Q0AD4nGDUnjqhzvfcNGkejHlLao2bjoa5iGRoAOSXrXtk8Tq99w
	tWCZfnbCSumVjHLhyhkQm8f9b4J6RmOJAT5WN8n+oCsnRRkhxcsYPBpYpp2Lzh18FpixHAu0SU9
	G05sw0Sywh0+KL7FiXX7ZuSZS7vzAu+khb/BwQoNDOHEKIZXHvCNR6HcKKkhsPR3GIxnyoycNpH
	Lwh1VUihe00L7sZhjYHXaAUb0ydL82VjV9MNc/l2T/lriEtATmUpzOKhDE5xexolcNtZ0y40c2N
	TBi38EmknB4WFPrVAqF1d3A84VbdV222HiOiqEsMLt3ygrrZBx3UFWdsGijqv/qXL+0naNkEeJl
	ZMOpCFgATqWSzc7yGncR7Eeiw==
X-Received: by 2002:a05:6a21:113:b0:3e0:cd4c:fa6a with SMTP id adf61e73a8af0-3e0d6b61e58mr4634624637.54.1791129993491;
        Sun, 04 Oct 2026 09:06:33 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d247930sm2637789b3a.54.2026.10.04.09.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:06:33 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5 0/6] net: dsa: motorcomm: MIB fixup
Date: Mon,  5 Oct 2026 00:06:14 +0800
Message-ID: <20261004160622.948037-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix (theoretical) MIB inconsistency and prepare for new devices. No new
features are introduced.

v5:
  - rebase
  - hoist type casting helper into chip.h
  - fix enable_delayed_work/disable_delayed_work pair
  - remove counter reader in favor of an independent series
  - reword commit messages
v4: https://lore.kernel.org/r/20260921203040.1203911-1-mmyangfl@gmail.com
  - reuse port_to_priv helper
  - re-enable delayed_work on port_setup
  - disable preemption for u64_stats_set
v3: https://lore.kernel.org/r/20260906131414.2683362-1-mmyangfl@gmail.com
  - fix build errors
  - fix logic error on MIB buffer creation
v2: https://lore.kernel.org/r/20260904162952.709368-1-mmyangfl@gmail.com
  - split patches
v1: https://lore.kernel.org/r/20260903143514.532023-1-mmyangfl@gmail.com

David Yang (6):
  net: dsa: motorcomm: Hoist type casting helper into chip.h
  net: dsa: motorcomm: Rename MIB stuff
  net: dsa: motorcomm: Split MIB buffers
  net: dsa: motorcomm: Split MIB module
  net: dsa: motorcomm: Use u64_stats_t for MIB stats
  net: dsa: motorcomm: Fix MIB synchronization

 drivers/net/dsa/motorcomm/Makefile   |   1 +
 drivers/net/dsa/motorcomm/chip.c     | 534 ++++++---------------------
 drivers/net/dsa/motorcomm/chip.h     | 128 +------
 drivers/net/dsa/motorcomm/leds.c     |   7 +-
 drivers/net/dsa/motorcomm/mdio_bus.c |  10 +-
 drivers/net/dsa/motorcomm/mib.c      | 431 +++++++++++++++++++++
 drivers/net/dsa/motorcomm/mib.h      | 167 +++++++++
 drivers/net/dsa/motorcomm/pcs-921x.c |   8 +-
 8 files changed, 721 insertions(+), 565 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/mib.c
 create mode 100644 drivers/net/dsa/motorcomm/mib.h

-- 
2.53.0

