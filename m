Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D3635C6A7
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 14:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791036575; cv=none; b=b3zB2RgKsFmhg+IkFmZSns7F8WoE3Q3XbRUiUCS4rvXBQKKKpU9I8JGR+jwM3OVLYEso0iAC2EKYvLU3ZzzGlYE6VlXCtjanhpG/Z3eSDity+0/FeEtDPLYBcAD6ofk3KtcPjmH8IEQhK+UHA7iTQchyNqbfz8WbKcdONl4dgAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791036575; c=relaxed/simple;
	bh=1XZ7TNWfgxPyHv3AyteAH4oittq3DzFQwUq/QtfpCP0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cQvK5Qwa4AHncqiGcn3x/IB1MVbfoXg/rmtfgrx69cTzIm8cRhXZ5EyUTffLStRb6tQxvHUnAkXOUxnzujVVwNk93gqZc/qawE/F1XD5TsLt3VGndsXOXt8rkds9SaTudQ+9oLerHt0F2BsLH3ErvEHEa5+Jk912Copo0OAHNo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEDRruvp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEDRruvp"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16629a040so7541325e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 07:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791036571; x=1791641371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oUswOxapHow0y3byrU/sf0EaKU74JMXEcnoMlCfceto=;
        b=kEDRruvp7vLoG4+NDDl8Nb3gOSNj7Bemy8+9rXKyBwh3XjrajR0aAFGdxO64tzgXJ8
         YsCz4Y4Z3ceKbxS/WHU93mI0fcQTX3YujeWxOJ+GYD4DASann1VHX4ZfbWTg1FPAaHdS
         YbOsyJn4co20tK04HHn+5TJW3vUWSS9nqYxcEruD+j3tFfv6IOs6DuU2bm1qLOD38nkG
         L0OzXRw/KlzwwfTl9qzaMiIRHHwSJnh74xsq4hUexN40omxtIyJholpgGvAnFLzXa5Qy
         fDOA1kstYZUqi7oqtVkZO9fYzr8tXEn3j8jRZ1AyDwbxDVzC0UjOG9UcuRlGhoG5KpbH
         kyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791036571; x=1791641371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUswOxapHow0y3byrU/sf0EaKU74JMXEcnoMlCfceto=;
        b=Xqto7MRGaktrzKzON5lf42VFwpeT+m2DrDgRifwsaLd0LD2H+2FmbUMSpsQVKurVlc
         Nv5exsPSxYGJ7N6OVWxpPXNEMGiDNtq2YPYEc82WwKdUPPTbyqzjP3BfSBv9gMn4Jvmf
         02/xl+l7CkS+mpPuUIaYopDbL1M5wcgDGaNj1fNKbqsEPIZe1GnawStn3pzcCwwu9XRi
         /8XjOIY+YeCuFxLAePA7Rzn9adErCZi0Embk6ZP5VkIJJVUGqdhshYM62hNAPlaoFWs3
         sNU07th3mPLLWLwlvY4aT0UPdN5z2yMj68O6lRiD+vj8EwElPrr2t1x+LoM1B/PNC+6c
         kY6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTlxY3U5Mh8Ui1CVT1hS5J0K3Wqs7nd5YBt1AaCX0ksvm56zk1vgeg0o9/uX+Spx+Au1QNn26mZk0BrYg=@vger.kernel.org
X-Gm-Message-State: AFuF++nVD96bG9hYpmbl2aCx+lwJ4wBXTyCpgV/ZXhvMBxfQF+y7OhRA
	wbytbpjJsHsU8YU39B+pmJk1KmP1GlnZPgViovaktKpcUxCoZbvgamzA
X-Gm-Gg: AYBFou3B6Zhrp5RICkG9dr33XrXAVFOdEX3Gl9Znk/EdWsLSoEB+bXw8VBc6io4XNo3
	8BnV8iSBqcSHVj6xRv61LUTPW7/OzEnODhe1/i3a2rpH7F9p1GHIqS3HAf/bVrHZxkD9y4d0JCZ
	iRWfgdVR2x+AiI6LXAB5s9R3b4A6oavrJhpmZjU6gMI3CZ2NqEecZxMe3KmyKxJLRn37I0reP9G
	BtNcgqoQzumq8jUo7gwjmaUd1sjH8KZvxbsR7dlHezGP0gcufe++aneHRowq0SBO6IT21UlnIhN
	HtKsPUMHSrx/066rigLtyKKDwuXvsxSqZ3Vo+SchnAEJ5RFmA0n0HYZxA21s++rd9TAFh1WCwhi
	29xusjwSJbU7GTRISMYIbHLpRIU3CQ0Jd5SfRPMO1OGA2tnCWDviHx4oTLpQxR2kaa2iWz6JF5h
	z7mA0DmELNjCe9u8eoe5GSP4FJlUCeKdITes7OE0moE5oVtYa86DPIltAgsADQna2hpouB/5itK
	AGVIpCEi9IaO82K+ZoZSsZpX43UXlyBf+NLnPfhJJBJx5k5zw12dFv7sjVAUVNsqtnPTqNLlS9E
	mosyhp+ImKLg0AY03EW+JryFwTp9jLHHT5k6mb4IdOOzrBnbSXv9UQw+H/YS2VcZ34ZZELj2yWm
	q3g==
X-Received: by 2002:a05:600c:4708:b0:4a0:dca:b78 with SMTP id 5b1f17b1804b1-4a1680f4165mr40509335e9.27.1791036570603;
        Sat, 03 Oct 2026 07:09:30 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e2-2001-c47f-5a89-3d9a-cd2d.310.pool.telefonica.de. [2a02:3100:b2e2:2001:c47f:5a89:3d9a:cd2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bfafasm184098025e9.8.2026.10.03.07.09.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 03 Oct 2026 07:09:29 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: netdev@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Keerthy <j-keerthy@ti.com>,
	Kevin Hao <haokexin@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net 0/2] net: cpsw: fix failed-probe cleanup
Date: Sat,  3 Oct 2026 16:09:13 +0200
Message-Id: <cover.1791035789.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The legacy CPSW driver registers its netdevs before requesting IRQs. A late
IRQ request failure leaves two lifetime problems in the probe error path:

  1. In dual-EMAC mode, the secondary netdev remains registered when devres
     calls free_netdev().
  2. A registered interface can queue rx_mode_work that survives the devm
     allocation holding its netdev and private data.

Patch 1 tracks successful secondary registration and unregisters the netdev
on the late error path. Patch 2 drains both interfaces' work after
unregistering them, as cpsw_remove() already does.

Runtime validation used a KASAN-enabled ARM kernel and a local QEMU
Arm virt CPSW probe stub. It provides one or two fixed-link ports. Its
device tree assigns the same non-shareable SPI to RX and TX. The TX request
therefore returns -EBUSY after registration. Test instrumentation opens the
relevant netdev and holds its real rx_mode_work until after the forced
failure.

Each result was reproduced twice:

  - Single EMAC, original cleanup: KASAN slab-use-after-free.
  - Single EMAC, work-cancel fix: clean poweroff.
  - Dual EMAC, original cleanup: free_netdev() reg_state BUG.
  - Dual EMAC, patch 1 only: KASAN slab-use-after-free in eth1's work.
  - Dual EMAC, both patches: clean poweroff.

Build testing used this series on the net tree at
6dc989ea46b96ce170840174b4a38c4a387fb005:

  make ARCH=arm LLVM=1 W=1 -j12 vmlinux modules

Clang/LLD 21.1.8 completed both ARM builds and all enabled modules with
configs derived from allyesconfig and allmodconfig. CONFIG_WERROR and
resource-heavy debug options (KASAN, UBSAN, KFENCE, KCOV/GCOV, KUnit,
kallsyms, KGDB/kmemleak, tracing, lock debugging, and allocation profiling)
were disabled. cpsw.c produced no warning. The literal allyesconfig build
first stopped on warnings in untouched files promoted by CONFIG_WERROR;
with WERROR disabled, its instrumented link exceeded the test host's memory.

Testing on real CPSW hardware would be welcome.

Karl Mehltretter (2):
  net: cpsw: unregister secondary netdev on probe failure
  net: cpsw: cancel RX mode work on probe failure

 drivers/net/ethernet/ti/cpsw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)


base-commit: 6dc989ea46b96ce170840174b4a38c4a387fb005
-- 
2.53.0
