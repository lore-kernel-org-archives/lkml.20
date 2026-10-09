Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B663D0BE4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568788; cv=none; b=trFJIWTG4BHmZkQVj1AgXQiUXRbABraz+irO4wi5jt8XT6Lsr4Dowb0lfvB1qJvXGKags0jNGx1/AajZoeUyna+ti9x9f4vOKHyH4X1voMkdX8nl/AMYiGKSkihkXf71jjoENmdEERwprJsODnnTBtqyNUYYQH5PkU6sGtRjPWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568788; c=relaxed/simple;
	bh=P+poAH8wG69axUkwsD3K3DEA1hw8lvwze1Qf6c/Rtfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VLcmQBpPq/MXhXd5kLlC/SotSEf3HGsbiryOQuO6Ro5OqzwL7C3wRoyyOVSgVPEC6RCT8wg7niKXCfANWzSA9GfRCP2xXCqKRnTsj/MUZjpNeMpjwg1LIyNDicU7kSeoz0bN3ZFNFMBcYvGcdEVvuixNRyWSTbgZGhRemmyW3K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGh8+tN8; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGh8+tN8"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2db710396ffso13097755ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791568786; x=1792173586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFrkjvKvgK+7671NmiTvcg+1m+zHAdrvgRTHztiv1Gs=;
        b=BGh8+tN8XqMN2QEAJxZV1nS/pmO8qOzKROTHnrON53EJd8IlkiB5vj1orwNNjiJqdo
         6HJ1ZL9V0jtbL25/qst85fUAXSMTBPXhLcPlIv/1Dw3IV3Q8bGZy5cwTtcFdvZugmfYC
         ylkMTTdogcgtG/ev/MGP/40XawHgnSsTo9CT9Te+Td4YUuvnVVSyAYD2ajgTHCPLQ3/W
         3RQVgu3o4/O8BTIeK3Y0r7BBZqjkZzewd0v9FY+Anvje7jHjL8U68I3ENqdiiDPIRCj2
         pGLf61UXWjqA7liizwaNkAV5TupiA2siDeHYFhv+Wqx8uUUEwvz51ojaX5229mg0EGCZ
         O4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568786; x=1792173586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFrkjvKvgK+7671NmiTvcg+1m+zHAdrvgRTHztiv1Gs=;
        b=uBCrHiiC0JlDdjfAZhaQZGInJZS7xt61LHTg4PbgJOURcJ+54z42rkAB+yhhbPFjqZ
         pFerEmMJbcVL9Imi6o9Nj+dEsGljFHLUP6s4CysOywqBhMB3okvpzd1BUS2L/OAAumr9
         Cd4Z+LEqgIad3dTnxMI84X7k5b8QFmxJWNZdZ0kmFOrT7NDuLkkPx+/GtpNUlMwd+w17
         eLVYN9QsccD1+5vARilyL9RdzCCjwA2gpaeTq+SCmgcLisYdz7kn6CwY5Jn9KbtbUmsR
         FRgxvDisFnScwsv36qcBvX+8w72Edf3cQQevRNNb1eNOwlIwrIoQsMH1tuaXzbFzuRpI
         graA==
X-Forwarded-Encrypted: i=1; AKwUvByM2d0uoxVTzqd9kFgJM4F0P1TnuysKHMvL8EsShfmSRQG9LYErmfbaVHZnBshPt/TzfR4uOkCOOQ8ADD4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJL1Butqr9f0pj+q3CmGLhWOwsm3PoTHU59lRBbHILkvGg4/N/v
	HJxys2cg5B+1e6IPic4/fAKpjnxLMZzzevDTDe50PRawVjy1ItQGySvb
X-Gm-Gg: AYBFou07mHLxmy8hlWrS1yV1Sd6N60njiuiP3L5oAci6jFvn/wJCEisITVi1QDrlDNw
	mVJ7mVqYH2RinOepJfSJ2GTu5RJx2UFDCldlKahFG6dimPlv/Knk1emotdmrTiECp1ISQjC2Y2x
	uHEQgveCnGBQvf5V/JXYCPaFSrfSK1bwRYEYP7fmkDr1IQY4lQWWld81vSOhimdi87ZFn2ubslL
	ZxVy3WfOOsb6LPIvqupTjA6VHykejBtSKNuKLUFh/HyojJvXguIv+He2c8UuolLklO8TB/Y8odb
	hDCLo8GYw1H61ClCCnhYg1ZukpNcndlkiJXpHx3MXZwc7TbTLhpnxI3aHt+p+Gi4TwuzySG7Vs7
	HQOagFVJ/Eb/rQpIbJoqwZ2WlLKDduCJvgwl1GpGpHVFVz6g6E6hgcBvFJkK4vScd1awFa7yBGh
	EJYOzkyoEpNcL1uIzbWRvs8GB+/SnM48FT4ktgbnLLhjRbQREFTuFSCua7zlktUohtdb7jg6UGt
	6tZFd5WMPRhNVwFN2TDKrRaU1v/kCbnFK2j
X-Received: by 2002:a17:903:26cf:b0:2dd:86a3:232d with SMTP id d9443c01a7336-2e8404bcd1emr20132425ad.8.1791568786245;
        Fri, 09 Oct 2026 10:59:46 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e74asm14167105ad.29.2026.10.09.10.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:59:45 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Frank <Frank.Sae@motor-comm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 0/3] net: phy: motorcomm: Add cable test support for internal YT861x PHYs
Date: Sat, 10 Oct 2026 01:59:29 +0800
Message-ID: <20261009175936.428256-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The YT921x switches integrate GbE PHYs of the YT861x family (PHY ID
0x01e04281) on the switch-internal MDIO bus exposed by the yt921x DSA
driver. Add a driver entry and TDR cable test support.

v3:
 - add dt-bindings
 - add PHY_IS_INTERNAL
v2: https://lore.kernel.org/r/20261006202352.1616626-1-mmyangfl@gmail.com
 - split into a driver entry patch and a cable test patch
 - update comments and kconfig
 - add yt861x_config_init() and apply the auto sleep setting, restore auto
   sleep when starting the TDR test fails
 - use separate variables for the TDR status
v1: https://lore.kernel.org/r/20261004184246.1260426-1-mmyangfl@gmail.com

David Yang (3):
  dt-bindings: net: motorcomm: Add YT861x PHY compatible
  net: phy: motorcomm: Add driver entry for internal YT861x PHYs
  net: phy: motorcomm: Add cable test support for internal YT861x PHYs

 .../bindings/net/motorcomm,yt8xxx.yaml        |   1 +
 drivers/net/phy/Kconfig                       |   3 +-
 drivers/net/phy/motorcomm.c                   | 152 +++++++++++++++++-
 3 files changed, 153 insertions(+), 3 deletions(-)

-- 
2.53.0

