Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4BC3C1D7D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789782819; cv=none; b=dU3BIzg0ZU/p/AFcB1T9+24HQ4rFQXR34f+ZvZBFEvQlgrM1was6VdEQMsdM9w+lrAphIy0Zgr6VcMmuFd/BKG1fW06QTZjBAmuJg9VJeAEM4EqUdq6A0f7PfJzabLqOK+eN2eE1c9xPCwtfD4i3hmWfisEHY0gMevcXUHvlv/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789782819; c=relaxed/simple;
	bh=bKkyFJ1yzN8EIrppYx08ccrFLzsPd7/nZiMuo/fLRMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ieBhrNKkPYDaHaIul7IeoUFAsV6RybdUuAurV8WBY8eidpEk2cOGdfGkbqW05f1eyWE/9A8vW7igZadLdB+fRqsVitDPwbpnwM+PNBAFsO9L6P7ohg3ZLwFKalV6g91RuIoXMgmB/itRfGr/Zm8mls5MjOkcbrHL13d9T3p+H40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=cV/xfSTn; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="cV/xfSTn"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso8991195e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789782816; x=1790387616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PfHZ/AoXKF/KOmYN/7MFhXWdVj/hGARzYnvpEULCntI=;
        b=cV/xfSTnERGffjk6iai3XPV6B8rczuWW4C7btfC7vWzfec06JG5DELYllJD07C1yR1
         nPruYuIMvoZoodreIJU5QIL1cCdrWC9up7VIvqKPzB2voFhb7621+lfoG8c+3F+o8kH+
         CpH6CKpma8zt28Ml9DBQN7BPgxDA0GVkZWVrR4YRfSVuA+fKu022kb9uv0Jh92iJXypH
         2IIvOWcBOd1RDyyMBp6q8ztdX8gg5YI1CzTs3pcHxv4q0RtWwt24uT+pwfq9J+8Qmsik
         zAqhumV85DAtoGjXFb6EocBIiSDY/XIFwtndRXI8Td6JMigkzgCMsPYaRwYGC6ZiCNH9
         6Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789782816; x=1790387616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PfHZ/AoXKF/KOmYN/7MFhXWdVj/hGARzYnvpEULCntI=;
        b=mJGtrhpCwvsGy0sozkd8ThtxAEaRjOEH8LYdZE6HVRC060QDQ2Z6KelGyngBE7VHon
         epB19eszZShPa2gpvsOHbUW0tW9rWeIGtY8xyXo5SVNp9Dm3rVTiHpUfzicWuw/lg9mS
         qcZJujnv7xdFOrihZOwY5tQlidHbIv3YRtmt/SYuCX3wURdKR2ipK+KRxRons+hw0gYm
         4iIiVAoWYUD8fVrtGEisXDEsAgKtXLIPlChYmAYfFcjZVfD4kyMn5iKfF2jmQYIWOsyy
         qDLgbjr/zsCseTNPcOG0jeOzfqZL4txOPY7sHbOP4AR5fqtrvv5ynNE9i23U5irK4CLY
         iEyA==
X-Forwarded-Encrypted: i=1; AKwUvBzpJMp/LGveKj24wAPda/5FXAgl9ezTZalt29KMjGITHKjzp7kD4Ezfav96d+GvD8WzU16ICyhsq5FPNtE=@vger.kernel.org
X-Gm-Message-State: AFuF++nsgFqGPRrPw6QwxOpUMSHHuh4O7z+WDQ673+1NjQNxgahy/2nu
	tJ4JhgMqX5ao1umW1Jx6gekVLkbEl6M24FG6akb/2GrK5/PBBAPdoD320vTEAydBAJo=
X-Gm-Gg: AYBFou3ssMA8j/hx3JxETsjxf5He/xRdfK1B+DsJII6cgP4aKQp6a42qquXNBKyFcgo
	3mJIB7M1c+cECnkl1A0n17JhZimwWuACbEy5r3PjT+rz4lbDIzr/EJDGTYBb5dVnirrV2LZDQ9g
	LD1vn4FUPeiQq73hHcDmVvH80Fb51X9D4StGdMfD+T1BFIx0ee6wQbYCWy7NjrHdW7pvQ6L66H9
	w4eQ58gpfMxh16YzxJ8SH30mus7P3lh9oghKxWdJ/N84PXhb7++7gun3VLcGFbR5msKAUW1jvVh
	eZKaYTjwC2QZsyDogJkNGYp6sjFO8GlJsMtRNnmoabunhXc9wJD2MaRVYnu0XFgc/cVsuxLlSpI
	XKQiiI2PnhvYHV+4IrlQmUe0fpsKlUcFl1xm6MOBB+Ip7cJV2/J3oe9xYnZHm0abX+xGyknzfaX
	Mm0xIMJ1fc5Buks8ksCdrOljtNnZREoiEbSq2ONBTLTJaxTQwJ1g==
X-Received: by 2002:a05:600c:138c:b0:49e:799a:8969 with SMTP id 5b1f17b1804b1-49fc574af20mr54848755e9.30.1789782816461;
        Fri, 18 Sep 2026 18:53:36 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd10d174sm34946045e9.11.2026.09.18.18.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 18:53:35 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	olteanv@gmail.com,
	Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	steve.glendinning@shawell.net,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v9 3/4] net: phy: take the interrupt back from the bus on detach
Date: Sat, 19 Sep 2026 04:53:25 +0300
Message-ID: <20260919015326.499479-4-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919015326.499479-1-f@lex.la>
References: <20260919015326.499479-1-f@lex.la>
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
its real driver takes over. That is where an MT7981B board here
stands, with an Airoha EN8811H behind an MT7531 port and its driver on
the root filesystem: the devicetree gives the PHY interrupt 15, and
once the real driver has taken over the field reads -1.

Take the number back in phy_detach(), from mdiobus->irq[], which is
where phy_device_create() seeded phydev->irq from and where the bus that
described the interrupt still holds it.

Do it before device_release_driver() rather than after. That call
returns with the mdio device bindable and the device lock dropped, so
from then on a phy_probe() on another CPU is the other writer of this
field. Ahead of it the generic driver is still bound, and a driver
registering meanwhile is turned away with -EBUSY before it can reach
phy_probe().

Fixes: 00db8189d984 ("This patch adds a PHY Abstraction Layer to the Linux Kernel, enabling ethernet drivers to remain as ignorant as is reasonable of the connected PHY's design and operation details.")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    Found and measured on an MT7981B board with an MT7531 switch and an Airoha
    EN8811H behind lan4, whose interrupt the devicetree describes and whose
    driver is a module.
    
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

 drivers/net/phy/phy_device.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 94b2e85e00a3..8e6b399f95d6 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1959,6 +1959,9 @@ void phy_detach(struct phy_device *phydev)
 	if (phydev->mdio.dev.driver)
 		module_put(phydev->mdio.dev.driver->owner);
 
+	/* The release below can hand this field to a probe on another CPU. */
+	phydev->irq = phydev->mdio.bus->irq[phydev->mdio.addr];
+
 	/* If the device had no specific driver before (i.e. - it
 	 * was using the generic driver), we unbind the device
 	 * from the generic driver so that there's a chance a
-- 
2.53.0

