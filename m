Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA7445560E;
	Wed,  7 Oct 2026 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791378935; cv=fail; b=sTADj+f78aggW/kPQaToQCplW23WoqiF4oVYQl+PpKZut1xUEXGeJcVZ5obMbpsLMnTmt23fXv3N0gYw71sxyVihjpzbG7LCP9G6WzbGZRia0YHYcibNYjwxUn4kqEkd2JhHnL9m6+o7D8jQiPVJ7vdcDi9Jx5jTdVOHztJXLIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791378935; c=relaxed/simple;
	bh=rXb/jkjG1UGn762JyFVVCxRkvArjqXGo3i7wOsiSFjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lADp8wx+aGjZE9zBj07jdHNIoYUcQki4s8dFsfSDpFSrXiqUwQ7vjISHY1bXrudL0NUNtgsuT3cJilfR4XDXCgS9BGkuKc2+5agTASTvXcV19aGE5vZ9/OmY5OJeKOJXSj1MxRvVdYcEkg7wo13tMfI3fJPxRM3NV1MPVNN2KcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=XtTD5beC; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="XtTD5beC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9pWppIsf3PCYlBV3agtMQWkU9xzVPVh2iJz4LM3UN1lwO7wa3wlSnSYTuR/GuMcDYDpYckkS1P/Dw115szqsXdW6ZN4jrzAPS/y/y9s5AlvjIpCT+QpxhcLO41VY2sVefDJUW1okK1kpqu7AhOmEwBWR5JtTh2IXNK9xMqPsZ0j1a2lq4GoCBpqhzxzHSfyhifuzxIn+qETvcyX+go6v9OLLhfg1LBfluyyxnaVVyU+ZXgVetthTCImnTDxvxvAc3Eg/jGURaLLEI/EAnVf7uYtBlkdGowdX55pGss46CcGb6Jvke6fPxAeuHMjvhg22YdPg0TW7XHbrdERTJu3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2seEb+lTAIxN7WioBfqbQlQGeTvnkUlBkipr4VwVbI=;
 b=iFtjxlbHpllk+FEtKlVG+bxCNJG2LhLccpc5d9CD+4f53bfag1wVJCqU6Ngh/OTKrzvG9Fl167lognZkDu/3OOjztBUv6TB0wUNRV6kddPhKJgvB1133kvkXFyeXJxW3XdIXzSuMfv0BQvvBwli7al/e/R5pCKoRWm0Iv4H+BwFTjMK97gRTV/0+Ma08112B3Gi6YjceJHLAE/2DVDKmh1HqIQpAfEs+hLZ8NkVOt0ieojdMNhhovoTcvRsIaKmh/lEKggCQJAQQE3Yhz4bhnp76ENsARxqWaXufhqsuM2LwLegiA26uYaqklqbiuIDPyyzBppO7l45S5vc6pJMKWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2seEb+lTAIxN7WioBfqbQlQGeTvnkUlBkipr4VwVbI=;
 b=XtTD5beCitiC8JfyVoIxg0F6z/chT46pX1RYYR+QytsrWZNEE/k8o7jmwQtnv2z3T0+kTMaeyEMlnTCVtI6wrVTGlWzYmUpuo9FVQsHWg1J2FR9j3hFxLdqU2SPsKDXFDlVYUTiF9/sizB9QYZRQLek6V5sWc3ZxW3Eeb8m17Nw=
Received: from PR1P264CA0051.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cb::12)
 by AM8PR06MB7473.eurprd06.prod.outlook.com (2603:10a6:20b:316::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 13:15:20 +0000
Received: from AM7PEPF00000053.EURPRD83.prod.outlook.com
 (2603:10a6:102:2cb:cafe::79) by PR1P264CA0051.outlook.office365.com
 (2603:10a6:102:2cb::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 13:15:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AM7PEPF00000053.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.3 via Frontend Transport; Wed, 7 Oct 2026 13:15:18 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 7 Oct 2026 15:15:18 +0200
From: Mario Peter <mario.peter@leica-geosystems.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	driver-core@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Peter <mario.peter@leica-geosystems.com>
Subject: [PATCH v2] driver core: Take parent lock in async device attach
Date: Wed,  7 Oct 2026 13:15:14 +0000
Message-ID: <20261007131514.1260696-1-mario.peter@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 07 Oct 2026 13:15:18.0605 (UTC) FILETIME=[E64287D0:01DD565D]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PEPF00000053:EE_|AM8PR06MB7473:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 625ec178-487e-4e1d-0703-08df247508e5
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|56012099006|10067099003|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nO8d+KeeQjd2tvSy8zaZPO9Sf9CB2rYd8oBvkHjORw2A5frPoUIWpkTlsAxiEXwYeQ0IJXWPVSbcHobkhMv9WSa9L73q5hbQ2hIyMszOLN/td9U2vM6XlQnsMe4Qyd276XgtK3y6zXJnC+UTk7Gg3fYg/aeX5q6YKGw+44AYG684+onxR0Qm0WsMPUR93Juk3odTYh8zuj8a6KvnTyd4FcpcuJ5lwc2GiQ4lTzUZ3P6g7a9+lq4aE2QD57+OCc8U96o5YEXFrPPwQM971VPg3tJq9S5tolJ7dX7qraBgJRXt7odILNXEjySyPe1kQI7VG/3l4b1YxGrPEJYdeYOt714wF/VaBkuwYbubu9GJFWqIne+wAIlEa9xie0sUWbB2tgTXfr2bclBhuAXKN8uii2yMUzDeBkO0PgsBemPkxl/GTfHjzFbKhSS5X/sJC8FSNq+2tCqA97P5TaSZ867EXg5G9WkeGIZW0IHC5WELZ5/hqbFw+gzCUnWukX9OEFBzU8fbZ+VipXMyy9fl6ViEK86mQNx/qNxV5M65UCEO5r+UAcUWOKux8iNiIH+uwtS5btXgAPxeWnNvrX+r/0SkWH/V3vuXscv6j+PWvGVy3hc7GSKDUpxuPnzCntIU1LgkaCe7YpA8ldKTJxzeZgSZYox71RgrKMlwSMlYzAioFk+gU+mNaUX1K9fNM10JtYKubn1VxTOkzMgPZ+2coB9yGA==
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(56012099006)(10067099003)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+q4hURhc9upzGrTs9U0dkuGg20Cxtk8/uw7Fm1JpODOQXxl73L06mjEVyvuwb2sXWhzAJ+zS1HA468ub3m2YM9MhGIGun13eUBrIUaLGaN2aKEuoS22b/qHK2BhbHJLkgrTNYfYyVLpxjAmfdNXlHNlViG/idXSDxyHXaVIWGZgXP3ZtBC+CaQqhnsL8SMWVBanIhx8iuAPmJh2sSrcZcV/K8fP2bq3wYBT2yLx4igaEQHakwvICB4uJnX6H6hGVIdUc/0F7DAn1xpVIRbz+2OYK/QK0dfcDDiUECPox5++3D0pj+R+hS2+Xz+G2+srcG2inKYFj871qdeaVJ2sMdidWI8siXsaTIwJDJGYl8gQJ2IGEErpcH+OBFxvcoBMJb1b4G+YSKov1pSA/jbLXsa5Nfe6ofTkhyjQLT1UIamO7oWO2EQzY07CU2f8nvyIw
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 13:15:18.7823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 625ec178-487e-4e1d-0703-08df247508e5
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7PEPF00000053.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7473

On buses with need_parent_lock set (only USB), probe() must run with the
parent device locked. A synchronous attach after device_add() gets this
from the caller, e.g. usb_set_configuration() holds the udev lock while
adding interfaces. __device_attach_async_helper() runs the probe from an
async worker instead, where that lock isn't held, and only takes
device_lock(dev).

With async probing enabled for the hub driver (e.g. driver_async_probe=*
or driver_async_probe=hub), this races when a multi-TT hub is
configured. For multi-TT hubs, hub_probe() calls
usb_set_interface(hdev, 0, 1) to select the TT-per-port altsetting, and
usb_set_interface() creates the endpoint devices of the interface a
second time:

  usb_set_configuration()           async worker
    [udev locked]
    device_add(intf)
      queues the probe  ----------> __device_attach_async_helper()
                                      [intf locked, udev not locked]
                                      hub_probe()
                                        usb_set_interface(hdev, 0, 1)
    create_intf_ep_devs(intf)             create_intf_ep_devs(intf)

create_intf_ep_devs() checks and sets intf->ep_devs_created without a
lock of its own. If usb_set_configuration() has created ep_81 but not
yet set the flag, usb_set_interface() skips removing the endpoint
devices of the old altsetting and creates ep_81 again. With a
synchronous probe, hub_probe() runs inside device_add() with the udev
lock held, and usb_set_configuration() then finds ep_devs_created
already set.

Single-TT hubs don't call usb_set_interface() from hub_probe() and
don't show this warning, but their probe runs without the udev lock as
well.

On an i.MX8MM board with an onboard USB2514 hub this hit 11 of 100
boots:

  sysfs: cannot create duplicate filename '.../1-1/1-1:1.0/ep_81'
  Call trace:
   sysfs_warn_dup
   usb_create_ep_devs
   create_intf_ep_devs
   usb_set_interface
   hub_probe
   usb_probe_interface
   really_probe
   __device_attach_async_helper
   async_run_entry_fn

It also shows on v7.3-rc6 in QEMU, with dummy_hcd and a raw-gadget
program emulating a multi-TT hub: re-authorizing the hub in a loop,
while a SCHED_FIFO task preempts the writing task at random points for
3 ms, hit the warning in 29 of 6000 iterations.

Take the parent lock in __device_attach_async_helper() as well, like
__driver_attach_async_helper() does, and move
__device_driver_lock/unlock() up for that. With this the warning was
gone in 300 boots on the board and in 6000 iterations in QEMU.

Fixes: 765230b5f084 ("driver-core: add asynchronous probing support for drivers")
Assisted-by: LLM
Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
---
v2:
- Describe the race in more detail
- Keep the multi-TT detail, but say why the hub has to be multi-TT
  for this symptom
- Reproduce and test on v7.3-rc6 in QEMU

In the same QEMU setup, a debug-only device_lock_assert(&udev->dev) in
usb_probe_interface() fired on every async probe of a hub interface
without this patch (52 of 52) and never with it (0 of 102). The hub
emulator and the test scripts are small, I can post them if that helps.

Not covered: deferred_probe_work_func() also re-probes via
__device_attach() without the parent lock.

Analysis and patch done with the help of Claude Code.

v1: https://lore.kernel.org/all/20261006132335.4014316-1-mario.peter@leica-geosystems.com/

 drivers/base/dd.c | 68 +++++++++++++++++++++++------------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index f6525a7ee8c5..a8912e6d5fbc 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1029,6 +1029,38 @@ static int __device_attach_driver(struct device_driver *drv, void *_data)
 	return ret == 0;
 }
 
+/*
+ * __device_driver_lock - acquire locks needed to manipulate dev->drv
+ * @dev: Device we will update driver info for
+ * @parent: Parent device. Needed if the bus requires parent lock
+ *
+ * This function will take the required locks for manipulating dev->drv.
+ * Normally this will just be the @dev lock, but when called for a USB
+ * interface, @parent lock will be held as well.
+ */
+static void __device_driver_lock(struct device *dev, struct device *parent)
+{
+	if (parent && dev->bus->need_parent_lock)
+		device_lock(parent);
+	device_lock(dev);
+}
+
+/*
+ * __device_driver_unlock - release locks needed to manipulate dev->drv
+ * @dev: Device we will update driver info for
+ * @parent: Parent device. Needed if the bus requires parent lock
+ *
+ * This function will release the required locks for manipulating dev->drv.
+ * Normally this will just be the @dev lock, but when called for a
+ * USB interface, @parent lock will be released as well.
+ */
+static void __device_driver_unlock(struct device *dev, struct device *parent)
+{
+	device_unlock(dev);
+	if (parent && dev->bus->need_parent_lock)
+		device_unlock(parent);
+}
+
 static void __device_attach_async_helper(void *_dev, async_cookie_t cookie)
 {
 	struct device *dev = _dev;
@@ -1038,7 +1070,7 @@ static void __device_attach_async_helper(void *_dev, async_cookie_t cookie)
 		.want_async	= true,
 	};
 
-	device_lock(dev);
+	__device_driver_lock(dev, dev->parent);
 
 	/*
 	 * Check if device has already been removed or claimed. This may
@@ -1060,7 +1092,7 @@ static void __device_attach_async_helper(void *_dev, async_cookie_t cookie)
 	if (dev->parent)
 		pm_runtime_put(dev->parent);
 out_unlock:
-	device_unlock(dev);
+	__device_driver_unlock(dev, dev->parent);
 
 	put_device(dev);
 }
@@ -1155,38 +1187,6 @@ void device_initial_probe(struct device *dev)
 	subsys_put(sp);
 }
 
-/*
- * __device_driver_lock - acquire locks needed to manipulate dev->drv
- * @dev: Device we will update driver info for
- * @parent: Parent device. Needed if the bus requires parent lock
- *
- * This function will take the required locks for manipulating dev->drv.
- * Normally this will just be the @dev lock, but when called for a USB
- * interface, @parent lock will be held as well.
- */
-static void __device_driver_lock(struct device *dev, struct device *parent)
-{
-	if (parent && dev->bus->need_parent_lock)
-		device_lock(parent);
-	device_lock(dev);
-}
-
-/*
- * __device_driver_unlock - release locks needed to manipulate dev->drv
- * @dev: Device we will update driver info for
- * @parent: Parent device. Needed if the bus requires parent lock
- *
- * This function will release the required locks for manipulating dev->drv.
- * Normally this will just be the @dev lock, but when called for a
- * USB interface, @parent lock will be released as well.
- */
-static void __device_driver_unlock(struct device *dev, struct device *parent)
-{
-	device_unlock(dev);
-	if (parent && dev->bus->need_parent_lock)
-		device_unlock(parent);
-}
-
 /**
  * device_driver_attach - attach a specific driver to a specific device
  * @drv: Driver to attach

base-commit: 22430ae5d90ab288b0ee2ad99ae941f4a666b694
-- 
2.43.0

