Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF77C3B6C01
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696251; cv=none; b=cA0Fm6u/Z1d7CVdbmDVEKul236t8jiFim7fK+AzQdD1zbAEwDvXOkFoSJVCuD4mL4wMDF3/AhvuvGefPFByDrghmDNa7EWr1QBGXFsRrgdWXpEx+OSXM6/vGFoFPwCSFOXt0tXkxYZn6XgUtwGgakE1Iq8ENE0E2PhP7UUUn/fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696251; c=relaxed/simple;
	bh=S7ePkob3/GuqIMG+tW2ujUp2bKDMmFOO3lJTaMe4SK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+r704U0qQ9fYTnctvuIrzOxh2oUrsHs2TKCvpCvIQijpqaWoOa0ykcWOPyPHLVdvqMlcrYfebF/ba1/ADaroFD5iB0G2SoiEwwupdHGBk9iesMcwOqlpSuXRkVwhwhX1W8/akmrbf+pTMY44fmH+ZNzDar3f3qOCMCFpukJ7e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=Zgl5QKiV; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="Zgl5QKiV"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633ecdeso143051f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789696238; x=1790301038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h8/QzaOvuYz09a1yMMjoP6+PjLyBemxWXi2J1WATJSo=;
        b=Zgl5QKiVtj1hgIc4V/+y1XbpXLiK554mF+zLr38RHx2xVNrz7DH2dAfhQOimSPhSN0
         0WxGttnPHELPeZOL2FqkoJIDCKJp4zGTR2n79bXQA0drMXwivd7VU0d+IXFTwMYL6Qhb
         hSVNtTdQ5SKowrjuDKDw+IB9eOhQlMWg2OCbjKfTPiS0ZdN3HZHkdhY9kMLDeHMB5JMI
         D9YUV276/nUOqxyumpd3Jhi+I55+ViGFpf3fpDh/nnDZZQ0na7NwWV1//TfzZbRVZAPO
         f/fwwvXhRPA60vAL9/G6Trg0aULRRTXI4HibOH4sN8/LelYcpAdshbWxeMl8Qv6HsuSo
         jpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789696238; x=1790301038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h8/QzaOvuYz09a1yMMjoP6+PjLyBemxWXi2J1WATJSo=;
        b=n/UfeSo6XC1x0V5hPUGSsjJL2Y8uzr7cTuJxoKgtC3IlgxrVve1pZV1rzrvaYoV1aP
         EvPlSarRr8wfSrfIt2Ae5H24ysn5IZQEkhI6RRyEnnx2qdBn6tPYMKkRnaEFLgiudoXX
         0PFqYXgQ1nscn46T8mvmH9Esb0RO3Do3n3NL/V86eGPnFU/2Xx+Y+eO3yiw0FiEdR03R
         TVIUXGbhItujOMp/GnE8NqHNLNcphfRgoQHiaUN0UdI2ILIR5SQbnGL8vG8NUGCAuSRM
         H+UkhQJXqul30m8v06ex967FzBlUFbYrW38ZtwHvcbIhvhCRsyrvvFTkjFUoLiDU8SUn
         zutg==
X-Forwarded-Encrypted: i=1; AKwUvBziq4KUwugGJQV3/2R5EyiirOwVdtCmYJ97zZU0qW4MKL4IaIgosRH0D4a7c7wypKBk9NG8i0yXwDVAX9E=@vger.kernel.org
X-Gm-Message-State: AFuF++mRafXrtpyzDE4oa2i7TilSqyQ5M2be/cNV1f6xK4/e+zRWB1KF
	cffnzIWrSnyls/vVwInbqE6UKVUT/GTSILxsVKBJSupBtW6POh5f0xApe6IVKUuyfgY=
X-Gm-Gg: AYBFou2xSYQ/nCo/CO2GLUmiNg02JrWfPWuLN6Slow4bmjOPCJU+nV6EvJvXzld2XXn
	FRpGis3mh/Nfmhu2PbLkgIhx9C1mI0EuBpAuxuOhJvqMEqfSvU9pbEDEPYEe3MJfRUmQlHDKSKg
	r7zRy4ceMX7PofccznVKTN25YhMx3UItbpvSbjbqMcP6391I3qbCkTGtGv/aUfZ3w+GJ2ijCQyb
	+qndkl+eGDLWq608JY8eCqz3nDrSmJxNb1nhEp8srHNhsh70uqczvELrt1mQtIcbuapnpPd1f1g
	QLj8NW4qTtvTwu+U/xm0cZbUBHByJ8TsYEmScf+sXX+/WvtqGIGJG8yo6SXwMP235SUKYepgLWj
	kt26e598blKsZ+xZ7uj0yb9rxi4MwslEz1dQo4WTw0cRIerjjgKfJFCTu3SDXk19jPI6Y39jlwl
	/DUdx9HyocQ9tOgQZ0EYwi+0L1XCfTtAKs1wsDQ+5r6GGYET5LUg==
X-Received: by 2002:a05:6000:38d:b0:487:951:20 with SMTP id ffacd0b85a97d-4871e37394fmr837723f8f.46.1789696237739;
        Thu, 17 Sep 2026 18:50:37 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487200745b5sm64224f8f.26.2026.09.17.18.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:50:37 -0700 (PDT)
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
Subject: [PATCH net v8 4/4] net: phy: restore the interrupt when the generic bind cycle fails
Date: Fri, 18 Sep 2026 04:50:29 +0300
Message-ID: <20260918015029.2518425-5-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918015029.2518425-1-f@lex.la>
References: <20260918015029.2518425-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phy_attach_direct() binds the generic driver by hand, and the probe it
calls is phy_probe(), which replaces phydev->irq with PHY_POLL before
either of the points it can fail at. That failure unwinds on a label of
its own, which does not go through phy_detach(), so the substitution
outlives a bind cycle that never completed and a later attach finds a
PHY that can only be polled.

Take the number back on that label as well, before it clears d->driver.
That store is what reopens the device to the driver core: until it runs,
a driver registering on another CPU is turned away with -EBUSY and
phy_probe() cannot be the second writer of this field.

Fixes: 6d9f66ac7fec ("net: phy: Fix PHY module checks and NULL deref in phy_attach_direct()")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    Both points the hand-bind can fail at are reachable. phy_probe() reaches
    genphy_read_abilities() through genphy_driver's .get_features, and that
    returns the error from phy_read(phydev, MII_BMSR); device_bind_driver()
    returns whatever driver_sysfs_add() got from sysfs_create_link().
    
    A failed genphy bind leaves the device with no driver bound at all, so the
    next driver to arrive binds directly and never goes through phy_detach().
    That is why patch 3 cannot cover this path, and why the Fixes: tag here is
    6d9f66ac7fec rather than the one patch 3 carries. That commit did not
    introduce the lost number - the substitution is far older - it created this
    second exit from the bind cycle, splitting the failure off the label that
    calls phy_detach(). Before it, patch 3 alone would have covered this, so
    that is where the backport range for this one starts.
    
    Exercised on the board described in patch 3, with a debug-only module
    parameter that fails the hand-bound generic probe once for one MDIO
    address. The connect then ends in -EIO rather than the -EINVAL of the
    validation path, so the unwind takes the label this patch touches.
    phydev->irq afterwards reads -1 with patch 3 alone and 15 with this one.
    
    One difference between the injector and a real failure, since it does not
    affect what was measured but should not be implied away: a genuine error
    inside phy_probe() leaves through its out: label, which re-asserts the PHY
    reset before returning, while the injector returns earlier than that.
    Neither path touches phydev->irq.

 drivers/net/phy/phy_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 8e6b399f95d6..69d8911ea7f6 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1896,6 +1896,8 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 
 error_module_put:
 	module_put(d->driver->owner);
+	/* Before the NULL below, which lets another probe reach this field. */
+	phydev->irq = bus->irq[phydev->mdio.addr];
 	phydev->is_genphy_driven = 0;
 	d->driver = NULL;
 error_put_device:
-- 
2.53.0

