Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99988347536
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342222; cv=none; b=JgSJ3un8y0wcPqOTqVXW62nZfEqer2aG9E/sVeJBsAKkBs9zlv6cDBvzjaEjQeLjMTvFMFC3+UCWmOasLsllNpDF4bpWxNCC2+a1kA4Tu0ZX1HwDBYThosvAAZtwlpMTi1viWIvSKfZmU0ze3shwt5KA3HMmUzTz/d33dKDVglQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342222; c=relaxed/simple;
	bh=B712JoRcyFoMSbKBervxh9wr2vYX17tgUo12dg0bdxU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BYClPeG2rl/6bXBFBfySiZzqAfAzrdjUgwD2a9GAZu0NIGoXyVt000DoCzqleydkTPt5NF2I7wh04H2tHL2GAdXp2aUkb+a5fMRyhx0J5uIiJC3asWZBo1dVZmVaAhT3YLDVU8vHum/QnnEugoqFOYLAmzOR+SKLgNvOG4t2bUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EEdwpLgm; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EEdwpLgm"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48704504d61so233025f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790342215; x=1790947015; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pnYktdoDVBCojJdRzjgQ4AeYDMFgB+nPtv1aQqwR7fk=;
        b=EEdwpLgmW1TI/qAsXI+mB7zlUcUKVJdeBvARQOGPBT9yVJdpJVzaI1YvFNskiGbrW+
         CDdHot/vo3trLX+zoX+RVpWX71den6Y9afbbZ8IyMm363C4d6m95MjTdmH9/BoXw+7jC
         SymnzR3jrQUc65g+13AjdqJSVvhFMlxqUYDQdfi3K6F6aUKYDLuJWGJ/UevChQcRRAcF
         n/aKfXjLEmk221whwHB0b7ysINXnwziz/tVvTH+wR/KTjTT7Ude8omu3waKsWHuW4BSN
         Hm/lGgdKE9Eq9SnJ8fBFzFsg7U58+I9KWUJg16633tv/0tOkBohwQRjZePXGV680iaJu
         VVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790342215; x=1790947015;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pnYktdoDVBCojJdRzjgQ4AeYDMFgB+nPtv1aQqwR7fk=;
        b=EWUTAVnyxcYLnR8c9qaZaT3PZT+mbtmCrzh3UuwAmQOEqgDVakixRXdyJKgIyb/JX6
         HA7d1R+R5YlSRNfPp+8Oyp9ascvBXYm2sRP79V0C3BX7coyD7bAPXzyTsHrY8ju6KYKG
         SPtsx3a81/UXALCwjdnarhI/Y6tOxJVFSFVBCp3/q9+fc8M8/OL9IkUfyF7Cu7SMRsQI
         aKm+apA049K/Gk7mWs5Icmkw9q740TTEOSAI1ey86a+QrZEV4kKv+/pwZ045NxjWeySO
         sWwAluVXqN7huP97HWTU9V8zG4y4H5adM78LJI9KqPGSoDSWPRZerZmxZPUI30+lcKEy
         aUyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwujDjXbhW09utV4exFyXxktepxE1g7IAgsTUg+T/qEU3fDOobOuaY/LJGC4O4iAHREcKypyjyQ6YOdafQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kNS4JZf6LWkOgw2qipoSb3gvS3CFlbc6PbSvgv4uNIy3JiO5sE
	kPLf1kqY12LleUW/8mKIXwbMby5N62FEzREdKoErTxRr8x0AFvhZ9ruDAH853cbm17DGer5UFCZ
	IB/y10Dzg9xKQEQhFxw==
X-Received: from wryt2.prod.google.com ([2002:a05:6000:1a42:b0:488:7ee2:d76b])
 (user=mmaslanka job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2910:b0:487:1aa1:f54f with SMTP id ffacd0b85a97d-488716a89cemr10903126f8f.46.1790342214446;
 Fri, 25 Sep 2026 06:16:54 -0700 (PDT)
Date: Fri, 25 Sep 2026 15:16:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925131650.3777399-1-mmaslanka@google.com>
Subject: [PATCH] usb: typec: port-mapper: Only match USB4 port if host
 interface is available
From: Marek Maslanka <mmaslanka@google.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Marek Maslanka <mmaslanka@google.com>
Content-Type: text/plain; charset="UTF-8"

typec_port_match() adds a component match for the USB4 port whenever a
USB 3.x port that shares the _PLD with the Type-C connector has the
"usb4-host-interface" property, regardless of whether a USB4 port can
ever be registered for it. The component framework binds the aggregate
device only once every match has found its component, so if the USB4
port never shows up, the USB 2.0 and USB 3.x ports are not linked to the
connector either: the "connector" symlinks are never created and USB
devices enumerated on those ports are never linked with the Type-C
partner.

This happens in at least two cases:

1. CONFIG_USB4 is not reachable from the Type-C core, i.e. CONFIG_USB4=n,
   or CONFIG_USB4=m with CONFIG_TYPEC=y as in the x86_64 gki_defconfig.
   usb4_usb3_port_match() is then a stub that always returns false.

2. The firmware references a USB4 host interface that is disabled. For
   example, on Intel Alder Lake-N (ChromeOS Nissa) the TCSS xHCI USB3
   ports (SS01-SS04) reference TDM0/TDM1, whose _STA returns 0 because
   the SoC has no integrated Thunderbolt/USB4 and the DMA controllers
   are disabled in TCSS DEVEN. No PCI device is enumerated for them.

Only add the USB4 component match if CONFIG_USB4 is reachable and the
referenced host interface is available and has been enumerated as a
device. The latter mirrors the check in usb_acpi_add_usb4_devlink(), see
commit 623dae3e7084 ("usb: acpi: fix boot hang due to early incorrect
'tunneled' USB3 device links").

Fixes: 4fd7a1f0f7f2 ("usb: typec: Connect Type-C port with associated USB4 port")
Cc: stable@vger.kernel.org
Signed-off-by: Marek Maslanka <mmaslanka@google.com>
---
 drivers/usb/typec/port-mapper.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/port-mapper.c b/drivers/usb/typec/port-mapper.c
index cdbb7c11d714..3a97b084c3bd 100644
--- a/drivers/usb/typec/port-mapper.c
+++ b/drivers/usb/typec/port-mapper.c
@@ -42,6 +42,23 @@ static int usb4_port_compare(struct device *dev, void *fwnode)
 	return usb4_usb3_port_match(dev, fwnode);
 }
 
+static bool typec_has_usb4_host_interface(const struct fwnode_handle *fwnode)
+{
+	if (!IS_REACHABLE(CONFIG_USB4))
+		return false;
+
+	struct fwnode_handle *nhi_fwnode __free(fwnode_handle) =
+		fwnode_find_reference(fwnode, "usb4-host-interface", 0);
+
+	/*
+	 * The USB4 port can only appear if the host interface is enabled in
+	 * the firmware and has been enumerated as a device. The latter is
+	 * the same check as in usb_acpi_add_usb4_devlink().
+	 */
+	return !IS_ERR(nhi_fwnode) && fwnode_device_is_available(nhi_fwnode) &&
+	       nhi_fwnode->dev;
+}
+
 static int typec_port_compare(struct device *dev, void *fwnode)
 {
 	return device_match_fwnode(dev, fwnode);
@@ -64,11 +81,11 @@ static int typec_port_match(struct device *dev, void *data)
 				    adev_fwnode);
 
 		/*
-		 * If dev is USB 3.x port, it may have reference to the
+		 * If dev is USB 3.x port, it may have reference to an available
 		 * USB4 host interface in which case we can also link the
 		 * Type-C port with the USB4 port.
 		 */
-		if (fwnode_property_present(adev_fwnode, "usb4-host-interface"))
+		if (typec_has_usb4_host_interface(adev_fwnode))
 			component_match_add(&arg->port->dev, &arg->match,
 					    usb4_port_compare, adev_fwnode);
 	}
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

