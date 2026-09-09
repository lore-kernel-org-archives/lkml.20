Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA083C108F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986610; cv=none; b=sS4lKC8wKeP1D+G9zSvnOzJb7I8vt3qPrzCzvI2SpNJ6SccSIGhM2WhFhbSHtVMGSC3DY4kBFEt4oeccAs6vUhraopaIEWh5xqHZKVYbA1nXn66FR43p11RknEn/Cot3lE/5DEZCMO53MdKwhdDq0Hmdem16s5IJ+XeFikANp+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986610; c=relaxed/simple;
	bh=ms+wPxxykgLhoZIPeEqV1SUNEDq6O/wPxWyQ2fNzuOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XFblQF1sbExXi1E6ReF8iu1/XMBwdu4Uu8yhDfPMYD3qcE4ZwRDHk0tCw4YQBWUfKwX1g1FUCwkShMLpvAoXmE9u07LLkOihMUM/SDB5jttJ4BioNgSckUuMfPrVJXIKHIVIOvykBO6UfyoUDrVnREPurfdwRp2V9Egz6oUEROc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=am39DyZ5; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="am39DyZ5"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48589798dbbso5194840f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788986594; x=1789591394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0MCT7Y2OFjhcDKKihQE5DUJP52LKyDCkCXjyba/ItNY=;
        b=am39DyZ5bpMeXNn/GKFma2YAv0wQ7iOBY6EiZSDBjgVlL2BFzvjynz5WjHSSp6WJDx
         vINt9mbwhWnE/gzo0WpJMr9aJRIrg5J2/IpqLPcAR2WvWD1ZLgO7DeGgP6JiWBt6Eayf
         mvmKu+L9amaBXOmSQq9xGD5q75//Pw4g7A+fTrrUlycXSstclYg/xV31S8fWUd4wJKnV
         qsAN5FSrPqF9qa37bAjF5OamAXhWIFAOgE37+s6AzvMiYhMnYGtU1AqKX8DdzUwN+YuV
         lA6Y+IU4OtPFdFOcKeawKIzmNJ6D+UFNXjn8qRW/JE88ecU/S3us5fH8tx9mheHiSpTg
         1P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986594; x=1789591394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0MCT7Y2OFjhcDKKihQE5DUJP52LKyDCkCXjyba/ItNY=;
        b=bVQ9u1AlyBMw7PhiNG43gEtnCYV/ZlmZ5A+ERYNP0i7EX2ZJLpJ/ECFBC8TZIjT4OQ
         UqCI9s6zrBOrZNkkuRd/IsJNDfKyYWYqIg7d03rbFRv9w1pKxe2bjTd7JJ8oucv0aCxf
         5in+XagaNrpc1Gt3njopDd+hX7Rxu10yaRM0IJ47hZ7GKnl+LWbfd6CdkIp2noF1tyUj
         OB4yQAUCFpRD+vc0rSUt9TEFRxiCQGjw8eQfdaYpEtgUpGren21YspRG1xneINhUA4RB
         KoN3j8pg0fHaCM2SDyjZ+RjWHdKmuEc0kbTmk61B0ru8rbPeR+vg+qUBLnGHg4kSNmDp
         XkLA==
X-Forwarded-Encrypted: i=1; AKwUvBxS8efnMmvhcLgI6Gk2dDzBQbPvNWZiIRhmzbOaJpaNDtf9VOBKF2dkMZwJQ9YLTl1VkePHA9Lo8pi2548=@vger.kernel.org
X-Gm-Message-State: AFuF++nh2LNl1UnDkaqhcFxkAxSqXqU3D1Yxz1T3xG1JUuav0Xyu2g96
	PyywVF+7b6MyrK+g2WUd9vmohYomQ/pE3iDsqbLP+fztyowQdeE01Bp0IXnmSYLZiBU=
X-Gm-Gg: AYBFou2b40y2ZYmvcY9G9BkaAk4n6ereVjmd44pxOsZ36Oc47cufEYtELex/IMCslWB
	2hqKA+TvcH1LGOP4cGemsBY6LRiFfmsTbiaNlAV4n6b/463PRilEUYWiL8IuUhqus0UbYKChLt4
	WNQrNhoLievc5eQ8Gc+CuJVkS13lckHACpkVCaQfwGE/P1lxu1RmfHP1jSqrcZha/bpNQqOEqLK
	+p0Roqrw70zc6oUt4IVhY7eTk0+XM78ZLpVe0uRpVq05yovOX9Rjo4NgegGE/75yN/AqQyifEMK
	nDZuIdrOj3nZCXiUWJO53VW+AzKB/tOb8d/35ZqqriHuVgPvWgzB2Bn9Fv678/U7UlWuvYKYbHn
	W2Bzg+iR73MhgUUJQO5wS9iqRfvAguamPL8MdKdqMtN0bx5LGV+5vZwTlMw+sXhExVQxfgXRVPi
	TSO3XCK0AjUi3i7RY90K1xqrdZ4Q+8EcnOyem1Ufz2KdSwGd6mtg==
X-Received: by 2002:a05:6000:1785:b0:485:91ac:434f with SMTP id ffacd0b85a97d-48591ac44a5mr29197734f8f.16.1788986594389;
        Wed, 09 Sep 2026 13:43:14 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm40693606f8f.9.2026.09.09.13.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:43:14 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk
Cc: olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v7 2/2] net: phy: take the interrupt back from the bus on detach
Date: Wed,  9 Sep 2026 20:43:06 +0000
Message-ID: <20260909204306.2374562-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909204306.2374562-1-f@lex.la>
References: <20260909204306.2374562-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PHY whose own driver is a module on a filesystem that is not mounted
when the MAC probes gets the generic driver first. phy_probe() replaces
phydev->irq with PHY_POLL because that driver has no interrupt support,
nothing puts it back, and the PHY polls for the rest of the uptime once
its real driver takes over.

Take the number back in phy_detach(), from mdiobus->irq[], which is
where phy_device_create() seeded phydev->irq from and where the bus that
described the interrupt still holds it. Detach is the end of every bind
cycle, so this covers the two substitutions phy_attach_direct() makes as
well as the one in phy_probe(), without any of them having to record
anything.

Doing it here rather than from phy_remove() keeps a single writer on the
rtnl side. phy_attach_direct() is what reads the number back and decides
whether to request an interrupt, and it holds no lock against the driver
core, so a restore driven by an unbind would be racing that decision
rather than ordered against it.

A bus whose driver writes only phydev->irq and never the table is not
covered, because the table then holds PHY_POLL and there is nothing to
take back; lan78xx, smsc95xx and sxgbe are in that position today and
registering the interrupt with the bus is theirs to do.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/phy/phy_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 94b2e85e00a3..84e2da81dbd3 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1969,6 +1969,11 @@ void phy_detach(struct phy_device *phydev)
 		phydev->is_genphy_driven = 0;
 	}
 
+	/* Whatever this attachment did to the interrupt, the bus that
+	 * described it still knows the number. Take it back from there.
+	 */
+	phydev->irq = phydev->mdio.bus->irq[phydev->mdio.addr];
+
 	/* Assert the reset signal */
 	phy_device_reset(phydev, 1);
 
-- 
2.53.0

