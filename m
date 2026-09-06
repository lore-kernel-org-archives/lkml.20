Received: from mail-108-mta0.mxroute.com (mail-108-mta0.mxroute.com [136.175.108.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507F5381EA8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 02:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788662333; cv=none; b=PBS4BCDsARn3/CpDQ74TwywtX9dPlftgBlpK93DcoVmKvmc7SICrLcrvLoLBAosgCykqiQPnChqFvJWgmEux74aZiYR0xp/PLNW3tJ1+HnmlsoY8zdRq4a0gwPd7Toae8dmtjBpuV9X38wY/J3Jxw1S0a8tc1lT6gME9IVbQQAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788662333; c=relaxed/simple;
	bh=vJy5/Wwf+qwUGd7udQ3LhUnVbITXP0UFwCQQa778e+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JNiqRFLqK9cc8f7ii08bcOpmkGUQ5GCKvTx4PQUPbzEz6Wq8sCX8xPa9FDGvJmzCHEVOg7GcmT0wlBKCCcuxMf13YqUm/19H0BLtDR6Ztq5T/tWcuglegfadiCdnvnzwXqIAopmfdrfjhbr4MgAxdKdU7LzK5THFoALrFlxu2xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=Vvkmx+dy; arc=none smtp.client-ip=136.175.108.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="Vvkmx+dy"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta0.mxroute.com (ZoneMTA) with ESMTPSA id 1a07490829f0002cd7.006
 for <linux-kernel@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 06 Sep 2026 02:33:42 +0000
X-Zone-Loop: d9cb86fc6d2d7ddf47c31631a58fef48507a92ce738b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:
	From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=e/Kfiw3qaXMLZ0W+h5i+dWrr+6v+H5PFs6MwMeazqFo=; b=V
	vkmx+dyuTLamP4NC3lKOipgo6M4GKxgx0f4Dw94vA4r6AsJcZjuYUgAPv4bFzV9kyV2ktwvvLozvR
	YoRoV16IJsPIERhQeJ5CjATAdNkjUj0a8UExR1+P2RyeXBlrAK0vkH5qxP9RXya3y5GFHY7grJhQQ
	uaXnH4fC7U9tNjk0NpWp01VqENF7edkRhsiqXjx8vqnWj3L1YxlhlifM6IFAif21XDNXUdh5o5tf0
	sZXD+b44yfsy0GGEKTsg1jP5Dvvcfw4CMr2HYlugFNh5kG2DtnlquxP2qm5DSct58edpH4QBob3iQ
	059mRTGkL5yr3fBAQ+wFsN/t93SMrceuQ==;
From: Richard Patel <ripatel@wii.dev>
To: intel-wired-lan@lists.osuosl.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Steve Douthit <stephend@silicom-usa.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Patel <ripatel@wii.dev>
Subject: [PATCH iwl-net v2] ixgbe: fix MDIO bus lifetime
Date: Sun,  6 Sep 2026 02:33:19 +0000
Message-ID: <20260906023319.1978945-1-ripatel@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: ripatel@wii.dev

Plugging in an unsupported SFP module caused ixgbe NICs to get
wedged permanently.

ixgbe unregisters the netdev when rejecting an SFP transceiver as
unsupported.

  ixgbe 0000:3b:00.0: failed to initialize because an unsupported SFP+ module type was detected.
  ixgbe 0000:3b:00.0: Reload the driver after installing a supported module.
  ixgbe 0000:3b:00.0: removed PHC on enp59s0

This code path failed to unregister an MDIO bus owned by that
netdev, so when unregister_netdev() tries to tear it down
(via device_del() -> devres_release_all() -> mdiobus_free()),
it trips over the leaked registration.

  ixgbe-mdio-0000:3b:00.0: not in UNREGISTERED state
  WARNING: drivers/net/phy/mdio_bus_provider.c:711 at mdiobus_free+0x3d/0x50, CPU#21: kworker/u128:0/12

This prevents ixgbe from reloading, even after PCIe remove/rescan:

  sysfs: cannot create duplicate filename '/class/mdio_bus/ixgbe-mdio-0000:3b:00.0'

Switch to devm_mdiobus_register(), drop custom unregister calls.
This is safe because the bus is already devm-allocated, so unregister
always happens before free.

Assisted-by: LLM
Fixes: 8fa10ef01260 ("ixgbe: register a mdiobus")
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Richard Patel <ripatel@wii.dev>
---
v1 -> v2: use devm_mdiobus_register() instead of another
          mdiobus_unregister() call
v1: https://lore.kernel.org/netdev/20260826042945.2344686-1-ripatel@wii.dev/

 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c | 9 ++-------
 drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c  | 2 +-
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
index f91856498eb2..96f60269fca6 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
@@ -8471,6 +8471,7 @@ static void ixgbe_sfp_detection_subtask(struct ixgbe_adapter *adapter)
 		e_dev_err("Reload the driver after installing a "
 			  "supported module.\n");
 		unregister_netdev(adapter->netdev);
+		adapter->mii_bus = NULL;
 	}
 }
 
@@ -8693,11 +8694,8 @@ static void ixgbe_service_task(struct work_struct *work)
 	}
 	if (ixgbe_check_fw_error(adapter)) {
 		if (!test_bit(__IXGBE_DOWN, &adapter->state)) {
-			if (adapter->mii_bus) {
-				mdiobus_unregister(adapter->mii_bus);
-				adapter->mii_bus = NULL;
-			}
 			unregister_netdev(adapter->netdev);
+			adapter->mii_bus = NULL;
 		}
 		ixgbe_service_event_complete(adapter);
 		return;
@@ -12104,9 +12102,6 @@ static void ixgbe_remove(struct pci_dev *pdev)
 	if (adapter->hw.mac.type == ixgbe_mac_e610)
 		ixgbe_disable_link_status_events(adapter);
 
-	if (adapter->mii_bus)
-		mdiobus_unregister(adapter->mii_bus);
-
 #ifdef CONFIG_IXGBE_DCA
 	if (adapter->flags & IXGBE_FLAG_DCA_ENABLED) {
 		adapter->flags &= ~IXGBE_FLAG_DCA_ENABLED;
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c
index ab733e73927d..74631cb2ddbc 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c
@@ -1086,7 +1086,7 @@ int ixgbe_mii_bus_init(struct ixgbe_hw *hw)
 	hw->phy.mdio.mode_support = MDIO_SUPPORTS_C45 | MDIO_SUPPORTS_C22;
 
 	adapter->mii_bus = bus;
-	return mdiobus_register(bus);
+	return devm_mdiobus_register(dev, bus);
 }
 
 /**
-- 
2.52.0

