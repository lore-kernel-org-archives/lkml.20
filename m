Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980872;
	b=XGQ4KNwfsvcOdFjCT1CboBwD4/esegW7VVwmaJgq7v631i5llRuOlD7C866HBatONjnO
	 42LtXq/XVvH+9DyylZPNIjibZ9/S2nU74raZU9i5afRhFq8DSEYhxA9l0NK0GUiBTEWTw
	 xqMfbKu0dtvQFzIbC9vTY+BYpwXDEZIuVt2S/Oe6uUCuGf5a1TgpbM9lu1rOd3UrkF65i
	 D23wHrKB1dfmUr2mOgLn68jOSrn0R5tloX+KAH50op81MVC6XdsG4hA8pV7A0/3VDqwPK
	 jpT0sfkoXiMbDL4CzJGJ/AOHqXdgIk98/UCQgCZ3SbmmvwbmmrdVAjxm+0Fylo5ibLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IVRbH9fbQr7HvpMOmMZEA1Ly5MPApVblIj53P80z6C0=;
	b=eZst2ryl1Oe0SZK7yoDC8MkbZQSNTCpyFSoEbiWZBiEyaN/G3dYQsMNUWuIhDqWtmYPQ
	 XRpvFMwF9KN3ClyiK+GU9e6gDljzrXXM17B2Cc5LyJB3FZOlsoO/GOhOlE3ph/kYEjKJe
	 g4aBomIJAtLPhi98rJpGbhZ3uZqpS60kr1iZ1pKCVOhOtdiMMyiSwlbYaYfPVmT++x0kK
	 3+OBMEJScF/Euiv/ODyQTsvPfv4V6wX/8iy+B2FdKZuUwSUgefuQBJPqtfqywdnHh99kc
	 p/CoF5mD0bsIRcLiR7MTSNPkqgv4KC56tU+Vdxvh+3KaBFeufHhSKNhsoomCzpvD3Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=op1AuvGh;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECED9606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECED9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=op1AuvGh
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso369956a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793980871; x=1794585671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IVRbH9fbQr7HvpMOmMZEA1Ly5MPApVblIj53P80z6C0=;
        b=op1AuvGhe04OZzlV2fVeR6NXHYWLZG9w0OjxRgJ/vWTwea/BVRjHYr003McL/IxgQX
         fRDiZCb6FBpSkDqLWgom5iJygwcwE5VhTF2tfsuOycke+9ivgnbGpPjW+lBzeIH59EFg
         v8RXj+PZzUosk4C4tsg/EAUHrgsWpf+BNiObum63DzGVZVfy3Z5w3dm4dIWTkLA8C4RB
         Z14ptT/5tAyEhsyTJCeo/53EwFtasSb9LbDNAbMznvZX4U9JDHYBaB3vjRdTWG5tAbNM
         UvRqEqXLrHtQEIrfNeABAp7ndWpWM/38FmgIjR/1QnpeJXZVwQH0dDRWUZ/t9EcIYAat
         DBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793980871; x=1794585671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVRbH9fbQr7HvpMOmMZEA1Ly5MPApVblIj53P80z6C0=;
        b=0Ln8s5IEnnCCf+OkPurWt4AG28J3MkD3PJeAMPh7KC8UrcYuBvhK65Kv8PfIAvaSOn
         4ZFHrzfeBBTH2lkaB24ol8ETSOXTsnkI8nkhfBjEWA5HG7mZ6ZTUqdHWVbmgzj+pvUK5
         oFK949A9J8ulX+ecsAKkn2zH38l39xV4AtfwRcfZ0Hg1Bq/3KOil4IS5muLVDu2glk9t
         KmzfumqPvMcUgQe5MIo/hP5lwKrAoV6GNstWWemu5SdzxETF2q8TcLcCe9ADgHFebKXe
         xj7jfwZQtzNY2olMfbQTkCcEjmPTwSg/RWofu/aJuZDg9IsJYow5GOXl3NPvs5Hw0sgw
         VaLw==
X-Forwarded-Encrypted: i=1; AL+hErHr6PLGwbC54Z06nq2gABAAKuXRbyNpOCwT/b3f6VDbJEndFSVm5ffp8Ko0rsFor+sWg+/yaoD0J4g8lXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9k3Gw/dOF28l0mBADe/xXoxl8EJx4LOlJUaQEwriHe9JjA+NO
	tI1nZV1Bvj8jzfCcH2W++Cmze4x7+mBe82RYGJjd13FVygqpjW0PLeE7
X-Gm-Gg: AYBFou01rVhp3uNhHuia7AdmKZJRzopW7LIyEgMOVnlh1LBrARi1u9gsZrxMHW9rTl7
	EOa45P68ELvM5yY5egzppseutdk+D2qjyydVLsqOQUphGGAP9++xeOJQ3u9nbBQz1kQNnLVGLDz
	6y87DXPXlN2TyG51pchkIjH6ebqUixlVEMK9DgR0OLhRrFMp5U51rkL6SVq3WUhe+b4Bl0rMAXT
	0gJpEk7763JJwdt1BtJv+PzHDPaUjd9IatbVg21Amc4s9OVCjK3MvpCxLBDJmIZdgIOkudqKMgB
	LkiLEmHpRJWhjh/+miawhaFJqFZaLCVbX9xLhhVfGikuLEZGow3H48tvWhSJ138owFfPNKVlBRo
	/3boOeacmtu+tb1JG78cojmELhikS+mtDpUoM5yytXe5WYBs8pnnqmwymtFq0nLaw/5qreqHdjm
	4Qxz8jul+KOYkOiPBDo6IXVzYiLabmxRJLxA/gKmkPxXdugOfWeKhJ29km/4hAoxfjjm23MRfcm
	RN2N2D087XiEYILN2NPojiC
X-Received: by 2002:a17:90b:5905:b0:3ac:9c37:942e with SMTP id 98e67ed59e1d1-3b0db70add1mr2802118a91.49.1793980871142;
        Fri, 06 Nov 2026 08:01:11 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a7fbcbsm727930a12.25.2026.11.06.08.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:01:09 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH 0/3] power: supply: fix work-vs-devres teardown use-after-free
Date: Sat,  7 Nov 2026 01:00:54 +0900
Message-ID: <20261106160057.2754689-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

Three power-supply drivers register a poll/detect/charger-detect work for
device-managed cancellation (devm_[delayed_]work_autocancel()) in their probe
*before* they register the power_supply via devm_power_supply_register(). devres
unwinds in reverse order, so on unbind the power_supply device is released first
and the work is cancelled last. The work handlers call power_supply_changed()
and dereference the power_supply, so a work instance still pending/running in
that window touches the already-freed power_supply device -> use-after-free.

Each patch moves the devm work-cancel registration to *after*
devm_power_supply_register() (and before the IRQ/poll that arms the work), so
teardown drains the work before the power_supply is freed. No functional change
otherwise. The relocated devm_[delayed_]work_autocancel() still runs its INIT
before the work's first queue site, so no queue-before-INIT window is added.

This is the same class as the recently-applied cimax2/extcon work-vs-devres
fixes. Found by static analysis / code review; none is reproduced on hardware
(each needs its charger/PMIC/gauge chip and is not QEMU-reproducible) -- treat
accordingly.


Hyunjung Ko (3):
  power: supply: ltc2941: drain poll work before the power supply is
    unregistered
  power: supply: axp20x_usb_power: drain vbus_detect work before
    unregistering the supply
  power: supply: mt6360_charger: drain chrdet_work before the power
    supply is freed

 drivers/power/supply/axp20x_usb_power.c      | 16 +++++++++++-----
 drivers/power/supply/ltc2941-battery-gauge.c | 10 +++++-----
 drivers/power/supply/mt6360_charger.c        | 13 ++++++++++---
 3 files changed, 26 insertions(+), 13 deletions(-)

-- 
2.43.0

