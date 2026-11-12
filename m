Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794471978;
	b=0/hkFyT+YnG4eh5SMv68CT6Oks8SYyhAyk43UlyDPkqDHwzHpjBOgD6iK1/VX1DUfVQ5
	 hhKZZi/z5EsUfAMfoOI3t7K6zU/xvUEXMalY08dRfxP/p3P7BvKn55mPuakUWIT4RTj+o
	 ivpugibB6rm4z/7msMDUdu5KIy4dAfjLATAr4Wuuy3S4Xj1PvpI0SiqggHtKEgK4bIUly
	 EP967G7+rE/W+yIwf+oNzX1WErxHat/2+V5qXRJBs84jHothFC/7GWEaaFdpNfJRUEolz
	 GvShxQqlwpXXskt2bwMg4LuJwNClG4z7/Lzh2a6ClnIfcw240f67dg1YzkjgRmbFm/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471978;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8PQDlO+KPnX8OniJ2lunrRKWx5Iss91CriV9EC12boE=;
	b=zMGW9fwGA6vj9FyCOX09uklBast5XNRQSyix/DBPm7wMN1XoG+SRnCXyXm8fjinps4Yo
	 7DUFWqqKqQsjSmLLsca3Z15HTsp+upjaTrwzMgaZvpiJoarOG7x5jhss7gCBirN0prvJh
	 Ip4OM5irDzdJudR2ox7zfrLGBLxqbcuGjuHT+7/Ttfz4R9w0ArYyBGGfxMA7DYvt0OGvt
	 u3e8YPBE7tUC0fBs7l8eo2A2b1RwXoB/INgPEq4iHfC3MwI9klLjupIc5kfc/1TVfmDtM
	 1XyKS2GgihPoGALVO3wZJxxXRIPxVvVZfGVGjwB91h0YPSd4kEqornZTwOJMEAeDx+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XP4Igfzq;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DCF606A32E;
	Thu, 12 Nov 2026 08:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XP4Igfzq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794471977;
	b=q2IaKrASU6+095260Y0fyHilgp9s3Gknfo8jyVufmVqmHNiFr5AFKDWZkEVST/OXrzvM
	 72NHyVAcSQWj2LKdFJPkZg6M33I1sgAHXhsa0OMDc68mt7N01reDIlq2TrM7zT5MgBjLV
	 NLBOuHGWAtluMqlSjM9SSKJHAiObkVg9EFCQo4CflIuGbAvB8aLDYv4mgXxH7Ge2bQASg
	 N72ir8PoQ4YhcKq6lVtxRIuNTg8dGSSuPUjYZfGQOgkaM9en828J6ducjgIgmsy7PkQ8w
	 MTMBhNj2rnj8BP26K81ae9iIbVO/yLpda3MpLxsOYrot7AS6OACTAgML7yMxcLK8Xjw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794471977;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8PQDlO+KPnX8OniJ2lunrRKWx5Iss91CriV9EC12boE=;
	b=X1tqdWglBH8+Zm/I1mahQW5plTU44kXtqmIM11h6S1E3rQEcZhT0AUEEH30aWLbMzbjz
	 Wv9+gq+A1Ykhk8wZdCCv8dbANseWAe5i1cGveZfgukKmaiTw/swSseg/pierboDMV6JSC
	 BFJ6MhstJiukhTEIezIpqF3oG6djZtWmvFZlsazFmnbVG6nePH8NK6+msIT9aeVGuhPD2
	 gTZWJC+lfK+ROfKCXOAC8Jjsvekg9DMdT7WI4Ycwa6MgEtnC0udz3jcbcdvR2IDBcyko8
	 /o7u1tOohWVQ6Rory/tDLuVfovPSZh0APBFm+I67qjUoBWnEWa/U/dBxeovSuh0pQUw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E83C1F00A08;
	Thu, 12 Nov 2026 08:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794471977;
	bh=8PQDlO+KPnX8OniJ2lunrRKWx5Iss91CriV9EC12boE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XP4IgfzqAt3VzoiNGKYzFIrNnquikyP1pJyVV0rbdCIApqM2yq8vaF51FRaGXYWnw
	 fp+G3YbIImqjbFsH2YMt8OleBCAHdyc+ZehpPzCTSaOpuCq0MY42J1yshw+iz6KPzd
	 vAME4R6BX4LgoeKwaj+joaCxatj/BFIO1a1MDh6+jGMAAr4K6NF2KTCmay1/WUPYRs
	 hq0rk0USFGHHd2wC+s/pMerR16lIY49mx3E88QWn8Mo+LM1x04KGEUErUfXWdMTZqu
	 9OIGT2M2YZ2pgOuJBrQrhdCQh/U0vmaOqg/EsgEqEE8pSY0BsH3a1bSIeGRelAVbmP
	 bDGAxzQJB7RdQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F0A5349370;
	Thu, 12 Nov 2026 08:26:15 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:26:17 +0000
Subject: [PATCH v2 2/2] usb: hub: Retry SuperSpeed for a device stuck on
 its USB 2.0 peer
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-usb-port-pairing-v2-2-45f5a1a29f1f@gmail.com>
References: <20261112-usb-port-pairing-v2-0-45f5a1a29f1f@gmail.com>
In-Reply-To: <20261112-usb-port-pairing-v2-0-45f5a1a29f1f@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mathias Nyman <mathias.nyman@intel.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794471975; l=7334;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Nu/LkGkyqDhkWbKSDg45ZNOB49lda93sr3AtuvilO00=;
 b=tfV/NLT3B5EkcIebPT7kiq79NrKQ1AX/h59WIHKfhKnnUcTyCP8za420DYu3bvI2TyOFySAX1
 +JoEdavoveLD30ECNVV3WBnkYhKuc5sLSWEw84Ib/lSbU4jN0Vh+sWP
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

A SuperSpeed device looks for a SuperSpeed link first when it sees
VBUS, and connects at high speed when the link doesn't come up. It
looks again only when VBUS is cycled or after a USB 2.0 bus reset.

When a connector's two halves belong to different host controllers,
the USB 2.0 host can start first. On the Orange Pi 5 (RK3588S), whose
USB 3 Type-A port has VBUS on from power-up, a USB 3 flash drive
plugged in at boot was reset by the EHCI about 10 ms before the
SuperSpeed-only xHCI registered, so it came up at 480 Mb/s on the EHCI
in every one of 6 boots, while plugging it in after boot gave
5 Gb/s. It stays at high speed until it is unplugged.

When a SuperSpeed root hub with ports paired through a connector to a
root hub port of another host controller has started, check those
USB 2.0 peers. If a SuperSpeed-capable device that is not a hub is
connected at high speed there, reset it once, so that it can connect
at SuperSpeed now that the link can train. Lock the peer root hub
first, so an enumeration that is under way completes before the check.
A device that still can't train its SuperSpeed link stays connected at
high speed after that one reset.

Only the start of the root hub does this, not a resume or a reset of
it: a device that is suspended with the system can't be reset, and the
problem is the start-up order of the two controllers. Hubs are left
alone, because the USB 2.0 half of a USB 3 hub stays at high speed next
to its SuperSpeed half. The work runs on the freezable hub_wq, holds a
runtime PM reference on the SuperSpeed hub and is cancelled when the
hub is quiesced.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/usb/core/hub.c | 113 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/hub.h |   1 +
 2 files changed, 114 insertions(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 199d3f535a89..eaa2a5b6aba0 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1076,6 +1076,109 @@ int usb_remove_device(struct usb_device *udev)
 	return 0;
 }
 
+/*
+ * A SuperSpeed root hub port can be paired through a connector with a USB 2.0
+ * root hub port of another host controller. With VBUS always on, a device
+ * present at boot looks for a SuperSpeed link while the SuperSpeed host is
+ * still down, gives up and connects at high speed to the USB 2.0 host. It
+ * only tries SuperSpeed again after VBUS is cycled or after a USB 2.0 bus
+ * reset, so reset it once when the SuperSpeed root hub has started.
+ */
+static void hub_reset_peer_child(struct usb_device *peer_hdev, int peer_port1)
+{
+	struct usb_hub *peer_hub;
+	struct usb_device *udev;
+
+	/* Wait for an enumeration in progress on the peer port to finish */
+	usb_lock_device(peer_hdev);
+	peer_hub = usb_hub_to_struct_hub(peer_hdev);
+	if (!peer_hub || peer_port1 > peer_hdev->maxchild)
+		goto out;
+
+	udev = peer_hub->ports[peer_port1 - 1]->child;
+	if (!udev || udev->speed != USB_SPEED_HIGH)
+		goto out;
+
+	/*
+	 * The USB 2.0 half of a USB 3 hub stays at high speed next to its
+	 * SuperSpeed half, and resetting it would disconnect its children.
+	 */
+	if (udev->descriptor.bDeviceClass == USB_CLASS_HUB)
+		goto out;
+
+	usb_lock_device(udev);
+	if (udev->state != USB_STATE_NOTATTACHED &&
+	    udev->bos && udev->bos->ss_cap) {
+		dev_info(&udev->dev,
+			 "SuperSpeed peer port available, resetting\n");
+		usb_reset_device(udev);
+	}
+	usb_unlock_device(udev);
+out:
+	usb_unlock_device(peer_hdev);
+}
+
+static void hub_peer_reset_work(struct work_struct *ws)
+{
+	struct usb_hub *hub = container_of(ws, struct usb_hub, peer_reset_work);
+	struct usb_device *hdev = hub->hdev;
+	int port1;
+
+	for (port1 = 1; ; port1++) {
+		struct usb_device *peer_hdev = NULL;
+		struct usb_port *port_dev;
+		int peer_port1 = 0;
+
+		mutex_lock(&usb_port_peer_mutex);
+		if (port1 > hdev->maxchild) {
+			mutex_unlock(&usb_port_peer_mutex);
+			break;
+		}
+		port_dev = hub->ports[port1 - 1];
+		if (port_dev->connector_peer && port_dev->peer) {
+			peer_hdev = to_usb_device(port_dev->peer->dev.parent->parent);
+			peer_port1 = port_dev->peer->portnum;
+			/* Only root hub ports of another host controller */
+			if (peer_hdev->parent ||
+			    peer_hdev->bus->controller == hdev->bus->controller)
+				peer_hdev = NULL;
+			else
+				usb_get_dev(peer_hdev);
+		}
+		mutex_unlock(&usb_port_peer_mutex);
+
+		if (peer_hdev) {
+			hub_reset_peer_child(peer_hdev, peer_port1);
+			usb_put_dev(peer_hdev);
+		}
+	}
+
+	usb_autopm_put_interface_async(to_usb_interface(hub->intfdev));
+	hub_put(hub);
+}
+
+/* Called when a SuperSpeed root hub has started */
+static void hub_queue_peer_reset(struct usb_hub *hub)
+{
+	struct usb_interface *intf = to_usb_interface(hub->intfdev);
+	int port1;
+
+	for (port1 = 1; port1 <= hub->hdev->maxchild; port1++) {
+		if (hub->ports[port1 - 1]->connector_peer)
+			break;
+	}
+	if (port1 > hub->hdev->maxchild)
+		return;
+
+	/* Keep the hub active until the work is done; hub_quiesce() cancels it */
+	usb_autopm_get_interface_no_resume(intf);
+	hub_get(hub);
+	if (!queue_work(hub_wq, &hub->peer_reset_work)) {
+		usb_autopm_put_interface_async(intf);
+		hub_put(hub);
+	}
+}
+
 enum hub_activation_type {
 	HUB_INIT, HUB_INIT2, HUB_INIT3,		/* INITs must come first */
 	HUB_POST_RESET, HUB_RESUME, HUB_RESET_RESUME,
@@ -1346,6 +1449,11 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
 
 	/* Scan all ports that need attention */
 	kick_hub_wq(hub);
+
+	/* Let devices stuck at high speed on a connector peer move over */
+	if (!hdev->parent && hub_is_superspeed(hdev) &&
+	    (type == HUB_INIT2 || type == HUB_INIT3))
+		hub_queue_peer_reset(hub);
  abort:
 	if (type == HUB_INIT2 || type == HUB_INIT3) {
 		/* Allow autosuspend if it was suppressed */
@@ -1419,6 +1527,10 @@ static void hub_quiesce(struct usb_hub *hub, enum hub_quiescing_type type)
 	/* Stop hub_wq and related activity */
 	timer_delete_sync(&hub->irq_urb_retry);
 	flush_delayed_work(&hub->post_resume_work);
+	if (cancel_work_sync(&hub->peer_reset_work)) {
+		usb_autopm_put_interface_no_suspend(to_usb_interface(hub->intfdev));
+		hub_put(hub);
+	}
 	usb_kill_urb(hub->urb);
 	if (hub->has_indicators)
 		cancel_delayed_work_sync(&hub->leds);
@@ -1978,6 +2090,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	INIT_DELAYED_WORK(&hub->leds, led_work);
 	INIT_DELAYED_WORK(&hub->init_work, NULL);
 	INIT_DELAYED_WORK(&hub->post_resume_work, hub_post_resume);
+	INIT_WORK(&hub->peer_reset_work, hub_peer_reset_work);
 	INIT_WORK(&hub->events, hub_event);
 	INIT_LIST_HEAD(&hub->onboard_devs);
 	spin_lock_init(&hub->irq_urb_lock);
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 78382839be48..edce19d7bf13 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -71,6 +71,7 @@ struct usb_hub {
 	struct delayed_work	leds;
 	struct delayed_work	init_work;
 	struct delayed_work	post_resume_work;
+	struct work_struct	peer_reset_work;
 	struct work_struct      events;
 	spinlock_t		irq_urb_lock;
 	struct timer_list	irq_urb_retry;

-- 
2.55.0


