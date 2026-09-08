Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1739954B1B9
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872660; cv=none; b=ln3gpCZ19BlF9h9VlXAYKl7Gazsm8q+oyFcvVeS86AEJlp7QtCk/BDCpJC67q52UQEewRn+AjDpQz/4IZLZ3qX0gPwnKBgWjy+7N4RYTpVdrHB7am9IY/h4D13NlMwGWzbkicJjxjmPadCiSrHy81LrR8a4JY/q8TpQkGmCqTRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872660; c=relaxed/simple;
	bh=X6V7sokbB0cLy8xh2qoOtiyZEfAHNXyI//EhGCTX1U0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pg4GZMilaJxHT27BoIj2Shpt6Ipwj9NAcal+6YephsNMotJWnJqcU5Lli9BH5YkKV5mboVoeOC1L21sAge2+lEdUeZEyi83KMfoTqg/SU5ipQxjC43Scg5JodlW0AdApj7YETeE4elSLIY4rcnMCa6chd7VrNgHCUzQoAXK3UkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LG0F9gNm; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LG0F9gNm"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso3903118b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788872649; x=1789477449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xeLNyhcOR1j1888DGQp/Ixbu2kpSiIXu9jd7Jj8fJWs=;
        b=LG0F9gNmIqtOQ+Lii76rIuhXhPaOnw//wQ5VaX4S+Oy9bkkRAkWC+FpMIf40Nw0L37
         xIuGTeZVBahclxGTnN3diGLDdGKbdQPBHRX7U+pocklyXRK8enWsQM6JUmfelJqk0TCg
         P7/2ubY7e/tFgsxye8HnwM7e9S5aFnyF1ymVXRVR2W9b+NV4b0NLjE1KPRJ9MpaJrqLv
         Xu4+VUcGvTderZVA3UW3HFQS+iNKv2cKBfATxqdmjeaFlYF1GLnPf2jxuMSkExOfkpJ4
         932SLEBqzOLEy3gzu9HHdy8pEr6r+voLs7CuFeBLBGr+fXw+mHqqCKO8u/TawJYhjwjb
         BR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872649; x=1789477449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xeLNyhcOR1j1888DGQp/Ixbu2kpSiIXu9jd7Jj8fJWs=;
        b=r3v290TcftGNRjHAV3vY/LSZm3cPDpuTBqjIbe9jQsjQtYxXOQFrB1SCrLZb+7Q7r1
         6+eTExl+a5YagawuTEegjHVRFSZXh0YjuzqOqWTEqzbs3WjP65Tj3Dx4Yy5a3Xf8Cvy4
         D0kqs+1di3+Z7AE6QJ1lxuh+wj8Ey3W+5hUUGcqKqsL2w7nFvoG3ZpxKNQAmMYcnhyDy
         hk01/F4xD0/icYnWj6w2rGbDZ48QWnnnlhzqg+qBo+dv6kbB4kFl/cgC9AxLzcaNHB+1
         SWJTUI7btOJK8cgRrnGnO6Vcb4tFl2mypXhWL2Y6DgnM9zzG0KO7CIunhhHamM+WkFEg
         SzzA==
X-Forwarded-Encrypted: i=1; AKwUvBxAIgZob+bJLQVXjJ61N27aiqpgfDDT6ieehAy8g9WJK8Sah85fXRvWTIjCpMmLA5L6K0g3E5zG1bjDtAA=@vger.kernel.org
X-Gm-Message-State: AFuF++nHKxbXATvI/GUdw/nwMQIRxbSmgkkp5WiO4XmQTnPIs+zZqxxg
	7SsMejYkYZszcTCNCIq3XxX5OxWJ8bmBhzNtuoxXvc9sFt9eDN2d0mlJ
X-Gm-Gg: AYBFou2jMk2TTZ5yvm/Fdx6BEgrj+P7OzvDVbhOLQE0fDjAJzHKE3YWFNFhcRq3O4wu
	WkXkwsyIpiiWSOvIBJKJcpZ0S0+zjw9I//ZVgw0JNtzf8tOCY5Gqu1LDVngVRvcjlOG+JcshIMQ
	UHUGNuGqWXWa5k47JW18M1QgjyAB1rRn0kh1oWAVIDuHZNiMEcIouJla2rmGS8h+bxYpbQQtMiN
	W+NoouUs1t9wxupKwkGeH2M5lLK8l6kzF9dsHusqpWO2sa19ouK06wdi95YVWgdaxM3lFSKE/wd
	dZwomNc6/2cCSroXKYq9jvPKknmtMiJala4YbbotLV7N+G+LE+Mkk34n9j7v3qh6nZ3EOHdrKZ1
	3hCxpEhhPVh6XbI3Ja9/pTeeZ1wqblTnhjuMkPj72ZOHOCJk6oYnbiLUnklo424uhMBnNcCpMn7
	kuQATihOWzkOaBJAIrzgWasRRxEOEho7I94F0UvpOwGc18vcZqdz/u7TXEJBhJpKXni7klSt70q
	VfBAos/ad/rgCcWXuUAhseNZi+y/A==
X-Received: by 2002:a05:6a00:a1d:b0:857:73c3:446d with SMTP id d2e1a72fcca58-85fff3c57c4mr30321255b3a.28.1788872648581;
        Tue, 08 Sep 2026 06:04:08 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8614f874e9csm5652398b3a.8.2026.09.08.06.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:04:07 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Tue, 08 Sep 2026 21:01:31 +0800
Subject: [PATCH v2 1/2] net: usb: cdc_ether: add NCSI passthrough support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ncsi-over-usb-v2-1-92dd78272fbd@gmail.com>
References: <20260908-ncsi-over-usb-v2-0-92dd78272fbd@gmail.com>
In-Reply-To: <20260908-ncsi-over-usb-v2-0-92dd78272fbd@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Oliver Neukum <oliver@neukum.org>, 
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, 
 Paul Fertser <fercerpav@gmail.com>, Simon Horman <horms@kernel.org>
Cc: Potin Lai <potin.lai.pt@gmail.com>, linux-usb@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mik Lin <Mik.Lin@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Adrian Ambrozewicz <aambrozewicz@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788872639; l=9047;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=qjf95BTc1sghUlnjSm3ZFIqeXFbo59xa5h6mb79MWJc=;
 b=yOgs2BN1lz5sbeyir6roMntH97LOb8W0VUzRxl9mFG2fkSC+tbqX5Wi3w7VFQwpl8iI1jtBVH
 LEWveYdU80GDDpCrY60S9c4esYuEkS9slnSQ+LFv3jC0RZdEaWguiS2
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

Add NCSI (Network Controller Sideband Interface) passthrough support for
USB CDC Ethernet devices. This enables BMC-to-host sideband management
over USB, typically used in DPU platforms where the BMC communicates
with the DPU via a dedicated USB connection.

Key implementation details:

- Register with NCSI subsystem in ndo_open, unregister in ndo_stop
- Override netdev_ops to hook open/stop for NCSI lifecycle management
- Keep carrier always on while interface is up, as NCSI control traffic
  shares the USB data path (unlike PHY-based drivers)
- Ignore CDC status notifications since NCSI manages link state
- Forward VLAN operations to NCSI subsystem

The symmetric open/stop lifecycle is critical for USB drivers:

    open()  -> ncsi_register_dev() + ncsi_start_dev()
    stop()  -> ncsi_stop_dev() + ncsi_unregister_dev()

This ensures NCSI packet handlers are removed BEFORE unregister_netdev()
checks for them during USB disconnect, avoiding kernel crashes. Unlike
platform drivers where unbind() runs before unregister_netdev(), USB
drivers have the opposite order:

    usbnet_disconnect() -> unregister_netdev() -> unbind()

Placing NCSI cleanup in unbind() would be too late.

Supported hardware: NVIDIA DPU USB CDC Ethernet (VID:PID 0955:cf11)

Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 drivers/net/usb/Kconfig     |  20 +++++
 drivers/net/usb/cdc_ether.c | 187 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 206 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/Kconfig b/drivers/net/usb/Kconfig
index 52a5c0922c79..00757392128f 100644
--- a/drivers/net/usb/Kconfig
+++ b/drivers/net/usb/Kconfig
@@ -241,6 +241,26 @@ config USB_NET_CDCETHER
 	  IEEE 802 "local assignment" bit is set in the address, a "usbX"
 	  name is used instead.
 
+config USB_NET_CDCETHER_NCSI
+	bool "NCSI passthrough support for CDC Ethernet"
+	depends on USB_NET_CDCETHER
+	depends on NET_NCSI
+	help
+	  This option enables NCSI (Network Controller Sideband Interface)
+	  passthrough support for specific USB CDC Ethernet devices.
+
+	  NCSI allows a BMC (Baseboard Management Controller) to share a
+	  network interface with the host system for out-of-band management.
+	  This is typically used in DPU (Data Processing Unit) platforms
+	  where the BMC communicates with the DPU via a dedicated USB
+	  connection.
+
+	  Currently supported devices:
+	    * NVIDIA BlueField DPU (VID:PID 0955:cf11)
+
+	  Say Y here if you have a system with USB-based NCSI connectivity
+	  between BMC and host. If unsure, say N.
+
 config USB_NET_CDC_EEM
 	tristate "CDC EEM support"
 	depends on USB_USBNET
diff --git a/drivers/net/usb/cdc_ether.c b/drivers/net/usb/cdc_ether.c
index a0a5740590b9..0a0eb9e0575e 100644
--- a/drivers/net/usb/cdc_ether.c
+++ b/drivers/net/usb/cdc_ether.c
@@ -538,6 +538,165 @@ static const struct driver_info	cdc_info = {
 	.manage_power =	usbnet_manage_power,
 };
 
+/*
+ * NCSI passthrough support for USB CDC Ethernet devices.
+ *
+ * Enables BMC-to-host sideband management over USB, typically used in
+ * DPU (Data Processing Unit) platforms where the BMC communicates with
+ * the DPU via a dedicated USB connection.
+ */
+#ifdef CONFIG_USB_NET_CDCETHER_NCSI
+#include <net/ncsi.h>
+
+/* NCSI operates at 100 Mbps */
+#define NCSI_SPEED_BPS		(100 * 1000000)
+
+struct cdc_ncsi_priv {
+	struct ncsi_dev *ndev;
+	struct net_device_ops netdev_ops;
+	const struct net_device_ops *orig_netdev_ops;
+};
+
+static void cdc_ncsi_handler(struct ncsi_dev *nd)
+{
+	if (unlikely(nd->state != ncsi_dev_state_functional))
+		return;
+
+	netdev_dbg(nd->dev, "NCSI interface %s\n",
+		   nd->link_up ? "up" : "down");
+
+	/* Don't toggle carrier here - it must stay on for NCSI to
+	 * communicate over USB. Carrier was enabled in cdc_ncsi_open().
+	 */
+}
+
+static int cdc_ncsi_open(struct net_device *net)
+{
+	struct usbnet *dev = netdev_priv(net);
+	struct cdc_ncsi_priv *priv = dev->driver_priv;
+	int ret;
+
+	ret = usbnet_open(net);
+	if (ret)
+		return ret;
+
+	priv->ndev = ncsi_register_dev(net, cdc_ncsi_handler);
+	if (!priv->ndev) {
+		netdev_err(net, "failed to register NCSI device\n");
+		usbnet_stop(net);
+		return -ENODEV;
+	}
+
+	/* Carrier must stay on for NCSI to transmit/receive its control
+	 * packets over USB. Unlike PHY-based drivers, we cannot toggle
+	 * carrier based on NCSI link state without breaking USB I/O.
+	 */
+	netif_carrier_on(net);
+	ret = ncsi_start_dev(priv->ndev);
+	if (ret) {
+		netdev_err(net, "failed to start NCSI: %d\n", ret);
+		ncsi_unregister_dev(priv->ndev);
+		priv->ndev = NULL;
+		netif_carrier_off(net);
+		usbnet_stop(net);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int cdc_ncsi_stop(struct net_device *net)
+{
+	struct usbnet *dev = netdev_priv(net);
+	struct cdc_ncsi_priv *priv = dev->driver_priv;
+
+	if (priv->ndev) {
+		ncsi_stop_dev(priv->ndev);
+		ncsi_unregister_dev(priv->ndev);
+		priv->ndev = NULL;
+	}
+
+	netif_carrier_off(net);
+	return usbnet_stop(net);
+}
+
+static int cdc_ncsi_bind(struct usbnet *dev, struct usb_interface *intf)
+{
+	struct cdc_ncsi_priv *priv;
+	struct cdc_state *info;
+	int status;
+
+	status = usbnet_ether_cdc_bind(dev, intf);
+	if (status < 0)
+		return status;
+
+	info = (void *)&dev->data;
+	status = usbnet_get_ethernet_addr(dev, info->ether->iMACAddress);
+	if (status < 0)
+		goto err_unbind;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv) {
+		status = -ENOMEM;
+		goto err_unbind;
+	}
+
+	dev->driver_priv = priv;
+
+	/* Override netdev_ops for NCSI lifecycle management */
+	priv->orig_netdev_ops = dev->net->netdev_ops;
+	priv->netdev_ops = *dev->net->netdev_ops;
+	priv->netdev_ops.ndo_open = cdc_ncsi_open;
+	priv->netdev_ops.ndo_stop = cdc_ncsi_stop;
+	priv->netdev_ops.ndo_vlan_rx_add_vid = ncsi_vlan_rx_add_vid;
+	priv->netdev_ops.ndo_vlan_rx_kill_vid = ncsi_vlan_rx_kill_vid;
+	dev->net->netdev_ops = &priv->netdev_ops;
+
+	dev->net->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
+	dev->net->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
+
+	dev->rx_speed = NCSI_SPEED_BPS;
+	dev->tx_speed = NCSI_SPEED_BPS;
+
+	netdev_info(dev->net, "NCSI passthrough enabled\n");
+	return 0;
+
+err_unbind:
+	usb_set_intfdata(info->data, NULL);
+	usb_driver_release_interface(driver_of(intf), info->data);
+	return status;
+}
+
+static void cdc_ncsi_unbind(struct usbnet *dev, struct usb_interface *intf)
+{
+	struct cdc_ncsi_priv *priv = dev->driver_priv;
+
+	if (priv) {
+		/* Restore original netdev_ops before freeing priv */
+		dev->net->netdev_ops = priv->orig_netdev_ops;
+		kfree(priv);
+		dev->driver_priv = NULL;
+	}
+
+	usbnet_cdc_unbind(dev, intf);
+}
+
+static void cdc_ncsi_status(struct usbnet *dev, struct urb *urb)
+{
+	/* NCSI manages link state, ignore CDC status notifications */
+}
+
+static const struct driver_info cdc_ncsi_info = {
+	.description =	"CDC Ethernet Device (NCSI)",
+	.flags =	FLAG_ETHER | FLAG_POINTTOPOINT,
+	.bind =		cdc_ncsi_bind,
+	.unbind =	cdc_ncsi_unbind,
+	.status =	cdc_ncsi_status,
+	.set_rx_mode =	usbnet_cdc_update_filter,
+	.manage_power =	usbnet_manage_power,
+};
+#endif /* CONFIG_USB_NET_CDCETHER_NCSI */
+
 static const struct driver_info	zte_cdc_info = {
 	.description =	"ZTE CDC Ethernet Device",
 	.flags =	FLAG_ETHER | FLAG_POINTTOPOINT,
@@ -946,7 +1105,33 @@ static const struct usb_device_id	products[] = {
 				      USB_CDC_SUBCLASS_ETHERNET,
 				      USB_CDC_PROTO_NONE),
 	.driver_info = (unsigned long)&wwan_info,
-}, {
+},
+/*
+ * NCSI passthrough support.
+ *
+ * This implementation enables NCSI unconditionally for matching VID/PID.
+ * Per-driver integration is required because the NCSI subsystem mandates
+ * explicit lifecycle calls (ncsi_register/start/stop/unregister_dev).
+ *
+ * OPEN QUESTION: An alternative approach using DTS "use-ncsi" property
+ * for conditional enablement was considered. This is viable only when
+ * USB topology is fixed and known at build time. Whether DPU deployments
+ * have fixed topologies remains to be determined. Note that DTS-based
+ * control would still require per-driver integration.
+ *
+ * A future generic solution could eliminate per-driver modifications by
+ * extending the NCSI subsystem to hook netdev lifecycle events directly,
+ * with interface selection configured via DTS or sysfs.
+ */
+#ifdef CONFIG_USB_NET_CDCETHER_NCSI
+{
+	USB_DEVICE_AND_INTERFACE_INFO(NVIDIA_VENDOR_ID, 0xcf11,
+				      USB_CLASS_COMM, USB_CDC_SUBCLASS_ETHERNET,
+				      USB_CDC_PROTO_NONE),
+	.driver_info = (unsigned long)&cdc_ncsi_info,
+},
+#endif /* CONFIG_USB_NET_CDCETHER_NCSI */
+{
 	USB_INTERFACE_INFO(USB_CLASS_COMM, USB_CDC_SUBCLASS_ETHERNET,
 			USB_CDC_PROTO_NONE),
 	.driver_info = (unsigned long) &cdc_info,

-- 
2.52.0

