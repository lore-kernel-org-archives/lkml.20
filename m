Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFC7371067
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417470; cv=none; b=kyzmbEa+iede3uwkQlcmUn7P5Vz8yt8MMTOFF6WoKUrxe2+awaNPoVNPzx3QX5EYlLOgM005RRXP4ZsewQMZL6JpbCyx+1Zi1WA82tZDbmRKniU9i5VzYKmQNtRQSUjKuWrx4TsyiG4etp2+pzFsOOjMGhtBBd3Z0LsQ2LY8l1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417470; c=relaxed/simple;
	bh=ryU/KvsZangrhVLieqvIdpxZB+L1zK7DE5qwaAq5zfw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=coL9Y1MiTqpTA5D8ZcnZpiKNsnWHPFMWvsPB9EJYKFseG5m1JGkHvSoh0D42BqZ0mPyeTbbOP+EUvYko/1BLxzwVtgyBrAkq3O9iN8M0zdg0tuQ0vjeBAzAlqN7DB8M2s0IQ6SfsouAJfNFJwMCtIZUCQKzBYHgU+xqa1phHRLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=h+Tpvkxa; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="h+Tpvkxa"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2594895f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789417467; x=1790022267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q25WzWwVYwq5QcrvqlyZdjNZKxAtYxiiLN2181JL96k=;
        b=h+TpvkxayxAdgHKbfP9qB7O6T22iZtIdy4bhV7P5NgzT3meShYa4WiRYftbKPm1BUa
         bC9zqYHB4W0mYHBY9cKXJim3wVCxF0aTK/OPd0mqxJKaambVMjdVoTh/AD5r6LVpHFm6
         BbVqFnFkUlPF4jAWmlR55igNOfUJaxtkmKS0q/DwBFXfPbNrHyqdoNkVv1ltWVXpH24F
         l58jsa5mOktUBBXWehLsRtogIn+sm36U0m5yHcQ3vLHSLs3ymwgYOVz1rcD6GzPSPs7o
         d4537qmR0iQreLQ5qJLOtSI7UcS8UB15pM+OAjwK76FLsNdqeI3Ts7OQvm/P2L9I6PNK
         6L4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417467; x=1790022267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q25WzWwVYwq5QcrvqlyZdjNZKxAtYxiiLN2181JL96k=;
        b=j8IgtxPFX0ekAk5i18ORLx26XHGVSeEZaozRQXeqzA7h1m135flUX2+N0jWc4Os39x
         0QgIRXIndwogmyTeZsRV9KG7KQLySBxr9fOTcYLJEEamy4omLXSk02wmjq2cE3eFQrUh
         WWq7dCKauVmz3rxq+vnIoZEj/YrPC3DtYqIbQeh5l217NjHXkcOtw8UxN+crxfxFgDsO
         rz5xkuGIhHlCRJ6tV65gIbnDpfQu9rkDweIeZmhRa5w14YCsObnffnIjZ2UXmYFakX7s
         N1giJa6S4bm3feqMFAU6BeLCovikAxcHzZ0RQ79ratMn92uVPL2Bj6cZtRRcwNcnYXSk
         SJGQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4GLzOWsAdT3bQB8QyFHAqE9yxkb9ZaP0MdMhk437DK81kZLyrTJ+0VbJEeroesSbRb1lg1MmtYT0FJyE=@vger.kernel.org
X-Gm-Message-State: AFuF++kWuWvvyV5hkokG5dmNAUV+tlPd/x+9XaePVUxnpJUmVdp1Mwi4
	AdwJG6aNWx/eR4kYtF/91UnUlkkq6w6fZ3D41D2jUV7X5lakdIKdUWqlCw0td/VCd9g=
X-Gm-Gg: AYBFou1FUVLKrPVH68Ibxr40HXdpTKsbJzxkJ7ilVekEYMFRv82jdsIEfIn8uBdX3E1
	5yDG1+1W8AlDEo097RrCVQUAorZdpeRALqAbqJ77ikeEvLDLjRQ/1Ps4GgpYpeneiZUUIZLMQ4g
	YP+Eg5v6HMpVVopseDDLCcJUaOIp75GEGudGz6N6tsG5BTNbx8EMcNiTHmUcfZ512UcNZJoYDyH
	U0PCSdbNmibxFabY6GZuWhsnv6bdqP0w+E+fPVPkftC2DY2ekI94QY8qpY0UsdL/K41+6HX17mJ
	FHN0vgeMx7ydY025X9FPhso39ZlbccIga1E1DvG8PO61wHb/2Nz+ZHIluWOwATNGZ1CpRWarQpF
	t54jTtTtcsF6sJOuoOWICM7J+0A1OI8IZImDzZISAjmLeYN6kHFZyDXZIIkYs49Ti/Xjzkn5nwS
	Z9fUxC+BIzhFi3RIp2CQZtVacHINteC/P/Au7pc0/X/37RW8Akfgg=
X-Received: by 2002:a05:6000:4020:b0:487:6f2:1a4c with SMTP id ffacd0b85a97d-48706f21bdbmr155435f8f.25.1789417467205;
        Mon, 14 Sep 2026 13:24:27 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34fdd2sm29328458f8f.28.2026.09.14.13.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:24:26 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net 0/2] net: dsa: mt7530: fix two crashes on driver unbind
Date: Mon, 14 Sep 2026 23:24:19 +0300
Message-ID: <20260914202421.2737079-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unbinding the MT7530 driver from an MT7531 dereferences NULL in
regulator_disable(). On a Netcraze NC-1012 (MT7981B + MT7531, 6.18.44):

  # echo mdio-bus:1f > /sys/bus/mdio_bus/drivers/mt7530-mdio/unbind

oopses there, and the build it was found on sets CONFIG_PANIC_ON_OOPS, so
the board goes down with it. Fix that and the same command gets as far as
mt7530_remove_common(), which disposes interrupt descriptors a PHY still
holds; the switch's own regmap-irq thread then faults in handle_nested_irq()
a fraction of a second later. rmmod reaches both, since mdio_module_driver()
calls .remove on module exit.

Patch 1 is the regulator one. mt7530_probe() requests the core and io
supplies only for ID_MT7530 and mt7530_setup() enables them under the same
test, but mt7530_remove() disables them unconditionally, so on an MT7621 or
an MT7531 both pointers are still NULL from kzalloc. It reaches the MDIO
front end only.

Patch 2 is the interrupt one, and it reaches further. mt7530_remove_common()
disposes the per-PHY interrupt mappings while phylib still has handlers
installed on them; phylib only frees those in phy_disconnect(), which
dsa_unregister_switch() reaches. That helper is called from both front ends,
so it also covers the MMIO parts - MT7988, EN7581, AN7583 and EN7528 - which
have no regulators and never meet the first defect at all.

The order is not arbitrary. On an MT7531 the regulator fault happens in the
first thing mt7530_remove() does with the switch, so execution never reaches
the interrupt defect. The second only became visible once the first was
fixed, which is also how both came to be found on one board.

Found and verified there. Without patch 1 the unbind panics in
regulator_disable(); with patch 1 alone the panic moves on to
handle_nested_irq(); with both, two unbind/bind cycles run back to back -
each unbind removes the switch from the driver directory and takes lan1-lan4
with it, each bind brings them back and the two cabled ports relink at
1Gbps/full, uptime does not reset and pstore gains no new record. The kernel
under test was identified by the
sha256 of its ELF notes section, read from /sys/kernel/notes on the running
board and computed in advance from the flashed image.

What hardware could not answer here. There is no MT7530 or MT7621 part on
this bench, so the ID_MT7530 branch that patch 1 adds was checked by reading
the generated code rather than by running it, and no MMIO part was available
to exercise patch 2 on that front end either. One unrelated WARN remains
across the unbind, from sysfs_remove_link() under dsa_user_destroy(); it is a
separate DSA teardown-ordering defect and is not addressed here.

Aleksei Sviridkin (2):
  net: dsa: mt7530: fix NULL dereference on unbind of MT7531 and MT7621
  net: dsa: mt7530: unregister the switch before freeing its MDIO IRQs

 drivers/net/dsa/mt7530-mdio.c | 18 ++++++++++--------
 drivers/net/dsa/mt7530.c      |  4 ++--
 2 files changed, 12 insertions(+), 10 deletions(-)

-- 
2.53.0

