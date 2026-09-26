Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FFE3AE1B1
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 23:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790466640; cv=none; b=SLHe/JvPcCb8SdtXK30XZlRPOcJN427iR2YCQYRTlh4vV7LRSp6/JzxInKQCN4IPK3j9Utk0JARK+VDg90pGI9cucSTtN6jOcxgWKvoNWEbjO69Z4KGJe5uaZkj8ZYQVQCUv8JD01HVaLd7oprhlD+09+1XgcVTBz43+0RmHBcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790466640; c=relaxed/simple;
	bh=GzDeizBzGcEi8xagvrQSxzo2FYbvToZbiw2KyXtZxqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DtOgd4A/2NoNQvFaq33G5PvPfOH9TQ2gYJrEinq4laX6moNWact3/R3xHUTwhEFcolnchvvToOhLFny3peUGq9jSc7dFWkKLe9PdfMEKnYFxieAZ7KAfxeZm7v6qwaxfDDCnLeCN74+jVzbFkUZim9ELfpStOIiHyMu+mm2R3js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=M4UYMhVV; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="M4UYMhVV"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so1674907f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790466635; x=1791071435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHLZDdeDMLON340+obgFzmYl4OH/VhpP5DQvl0yAjuk=;
        b=M4UYMhVVhMqCn3y22jF7mdrQPDD2JcWwCVKYy34rkkh719PF7lJJ+iqEhn17kVuNkN
         vwLdaKzpaPyoEe1hqIdWdtfUROXE/JmJ2mC11w4Fg7ThM6661lHxnqHs4bslpkD0/Qg2
         v+XkBR3P3Cv3Wl1BV5Zy9SxVfW8qfemy76BeVrlXCXDV9eLdzulQpG9+QuKqvmMaqzSD
         esQqKGbNHu42LKsI6ON01u7RLuRScSOup48ubQoOui7VByScqy6X8S86AuOLw7xFRjlz
         5YvbMC5lvqvCIR6JQ+/kI4dLd4Cfu4Mew2ifc4/pAdpUERaAvrJSFi5RHZtrLfjrnQrg
         sKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790466635; x=1791071435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UHLZDdeDMLON340+obgFzmYl4OH/VhpP5DQvl0yAjuk=;
        b=AXgRvRXFA/T1iwOIGNZGLmKTKZcSmTU4BUqUngfs8xxIq6nNc7DMric33e2KxMbRDx
         snZCRLAsoupxRhOm3NTA4rviRZU2KHYaOus9+piRaqW1HZ27ydPFb8DrkPHkygDzHoz6
         wlDu9Rr0zsbhjc0YE7kyuILngpZ98lWrJX2vj0mlYYp2U32ULi/OMVbtwappnkMTF6XJ
         N+LEQEumQDm5hnpd5B69h+n9Yj+Je9PemXxCmia8FnGKpiGRVDHxgvczyskAEG3AdnRx
         82XD1MuzaGwXOygtOBvMtTEnbsD2fTBjvMwtaZgdKZEXrjST29rwXXGdCNcgP+6oNIGZ
         511A==
X-Forwarded-Encrypted: i=1; AKwUvBxXn8fyhFo7BuSdEZb2/ohsliRR3JCRpYvhO70ZJzjgn8ak5rBu3RTyHfnDYF3y/cbFGATcbZ+Kn+zfxAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEdgRYh65zIgcvcojitHSu935crQxk1B1oUyJmqoni5W3l9vM0
	6FGjuUIVEJisZxKaEZpI6yQhOBdfPADnzs4LL6FgLWjHsbYeGUCaGYg9v5LA96wqmUQ=
X-Gm-Gg: AYBFou2FhnDWnrP/lFvsV41Z1Kw4nfuyr+l6FYvagH+4K1uq2uXaobfz3//FJTS4gu7
	gGSPvoSckK3Tdmg3JPDRz9DcGHdfc05TzBEIgwXQ5Ys5Gi6ietNHHLFvE3la/m408MdIe7Xl4tJ
	aW9FVnsB9N7oC8q2IUc9yUzMGbGSeT/dZLeHKKNEnKfy++4QYFwVQwQxsAR34zVUACBDhuhfvd9
	LWMkmBptX8kmvGjwkpeU++Hj/QO6D6HTdy8lWL7IfPSer8s1q6Jf5xSeeH9LS3xx26+9CzI/hFD
	T6YkapV3ntMexJNeFA1qeMCIeGlzkoAhHbd17DvzjaWPwsjV+ZBEiW2pJ2U6nErvZplx+2+L9PO
	Lk7QsFwHqt6trjB4w7M4RVv6og5WRKLGSX97uvBTSozvUoEoVcVwZPyfDECmmDcVbNToILVYkNX
	302O4oOZC3Es3FmKjBjy0E8Xi7nsNV5iiC2N0QjxTRk4pNlM4FCvU=
X-Received: by 2002:a5d:6f10:0:b0:488:8ab9:f73e with SMTP id ffacd0b85a97d-4888ab9f86bmr2301097f8f.24.1790466634769;
        Sat, 26 Sep 2026 16:50:34 -0700 (PDT)
Received: from remote-01 ([84.17.55.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349fa1sm24716798f8f.8.2026.09.26.16.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 16:50:34 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	olteanv@gmail.com,
	Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	steve.glendinning@shawell.net,
	f.fainelli@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v11 3/4] net: phy: take the interrupt back from the bus on detach
Date: Sun, 27 Sep 2026 02:50:23 +0300
Message-ID: <20260926235024.705646-4-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260926235024.705646-1-f@lex.la>
References: <20260926235024.705646-1-f@lex.la>
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
its real driver takes over. That is where a Keenetic KN-1012 stands,
with an Airoha EN8811H behind an MT7531 port and its driver on the root
filesystem: the devicetree interrupt of the PHY maps to irq 15, and once
the real driver has taken over the field reads -1.

Take the number back in phy_detach(), from mdiobus->irq[], which is
where phy_device_create() seeded phydev->irq from and where the bus that
described the interrupt still holds it. Only under is_genphy_driven,
since that is the substitution being undone: elsewhere the field belongs
to whoever wrote it, a MAC installing PHY_MAC_INTERRUPT writes
phydev->irq alone, and a phy_request_interrupt() that failed leaves
PHY_POLL there while the bus table still holds the number that could not
be requested. Under the generic driver a PHY_MAC_INTERRUPT written into
phydev->irq alone is still replaced; bcmasp, genet and tsnep, the MACs
that write it that way, write it again after each connect.

Do it before device_release_driver() rather than after. That call
returns with the mdio device bindable and the device lock dropped, so
from then on a phy_probe() on another CPU is the other writer of this
field; before it, the generic driver is bound and the driver core turns
such a probe away with -EBUSY. That is ordering, not exclusion: nothing
on this side holds the device lock. Nor does the ordering hold after a
sysfs unbind of the generic driver under a consumer, which leaves
is_genphy_driven set with no driver bound, so the store can race or
follow the probe of a driver that binds meanwhile. The next
phy_attach_direct() applies the substitution again for whichever driver
it finds bound, so the number its callers request still matches that
driver.

Fixes: 00db8189d984 ("This patch adds a PHY Abstraction Layer to the Linux Kernel, enabling ethernet drivers to remain as ignorant as is reasonable of the connected PHY's design and operation details.")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    Found and measured on a Keenetic KN-1012 (MT7981B, MT7531 switch) with an
    Airoha EN8811H behind lan4, whose interrupt the devicetree describes and
    whose driver is a module.
    
    The one condition arranged for the run is that the PHY driver module loads
    after the root filesystem rather than from the early boot list this
    distribution normally puts it in. The distribution's own late-PHY handling
    was also removed, that being the one patch which could have changed the
    outcome; upstream has nothing like it. The kernel is still a distribution
    one and its remaining patches to phylink and phy_device do run on these
    paths - none of them writes phydev->irq.
    
    DSA then sets the port up at 1.87 s, the generic driver is bound by hand,
    phy_probe() replaces the interrupt with PHY_POLL, and phylink rejects
    2500base-x against it:
    
      lan4 (uninitialized): validation of 2500base-x ... failed: -EINVAL
      lan4 (uninitialized): failed to connect to PHY: -EINVAL
    
    The real driver arrives between 13.4 and 13.6 s depending on the boot, and
    binds. phydev->irq then reads -1 without this patch and 15 with it, 15
    being what the devicetree gave that PHY. The three switch ports alongside
    read 79, 80 and 81 in both runs, so the reading distinguishes rather than
    printing one answer. The field has no sysfs attribute of its own, so it was
    read with a debug-only module parameter that walks the MDIO bus and prints
    it.
    
    The reading predates the is_genphy_driven guard the store now sits
    under, which should not be implied away. On the measured path the flag
    is set: phylink_fwnode_phy_connect(), which DSA reaches through
    phylink_of_phy_connect() for this port, calls phy_detach() from its own
    failure check, and the three writes of that flag are all in
    phy_device.c, none of them between the hand-bind and that call. So the
    guard passes and the store is the one the reading came from. Its other
    side, a detach with a real driver bound, was not measured.

 drivers/net/phy/phy_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 94b2e85e00a3..a9c71a286118 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1965,6 +1965,8 @@ void phy_detach(struct phy_device *phydev)
 	 * real driver could be loaded
 	 */
 	if (phydev->is_genphy_driven) {
+		/* The release below lets phy_probe() write this field. */
+		phydev->irq = phydev->mdio.bus->irq[phydev->mdio.addr];
 		device_release_driver(&phydev->mdio.dev);
 		phydev->is_genphy_driven = 0;
 	}
-- 
2.53.0

