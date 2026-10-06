Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011070.outbound.protection.outlook.com [52.101.70.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3458C459AD9;
	Tue,  6 Oct 2026 13:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791293087; cv=fail; b=NMgltqvAoci7d+wcDVHASPjPmulhNJfMlotx3FoZOgAzAFpJOzG+c4YYt2RZwtvzL6eWm62EPuYZAirP5cAwCKRQT9sCx3s2gp5SPfoFvDWMWBtdjLL8HnaPb9XegURh90ddFQxGI+UfF/OUDpK2IuOTScDrsQ4g4us5ttBajR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791293087; c=relaxed/simple;
	bh=9/81FqUiVZY7swnlXRhCdnUovHDJDgyE8t9JuozP4SU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kDFOpbJjhOx2gQc89TwLs2/xFzn+jS2NiAHyUMYRBWPVD02cgktXNCre8EjXWjQ71g6N+J2amuHND6SGyrnmXM4JkNNMl6JP+S7U/9srV/6flgVqKypwsFUa2ndA8fxl7aQeBn9gn2cpRG6eO4lOr5icmzlrgoGQUnY1jEPdmHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=J7OxI1Ni; arc=fail smtp.client-ip=52.101.70.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="J7OxI1Ni"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIqCBwT2gG1uQmRDbLmCRF+/KAaPvF/6qroToidH20nHEJ3kex8wLfJONgOkkwPqmQKyxicPrFy5l/44vBgmX9Tt0SJGNdPYdNjELB5yzTNj2cKUu5BTyiIt5/7nGjmD+zBCgUYSuVC1rDZQ2qF9QOJnn0T3zkM1p27eHZGQzE7URxSyFgyWYxUZjU3mSI8M/0BC4M/KKbIBUsG/MD2hP4UPa874a3VMkDCeM7QlR2DKvNuZoa4lBZLYgcCKA9ryvqfxX4BYg8fNuTupYGIPm5Xa3S4hwW7P7Ht61l5fGz6QkVehDsRY2DtfG4GpyBsqy1AYKty9RrZcmdB/SdZpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tr82ieWf5JZx6iq8zqU9F0kEATgydCxD2I6Dn7BR/H4=;
 b=Ux6ktnKvicUpVsgHKxmwfJwp7d8HEBq8nZzEtqFqFYglPDhulr1FCN0NaTWlXoggAmudt+6oCaC4NEz2IDVorpmMHS+nLCZl1MxTV4lezDHt4mMArLddbYztygHNoUOpBkVpj24hdcgcm/x+JFb1kr6MQMBZ1wvIlPHwsksXmZYoaSVX40WDIkkcUfOgLwZZsJAbbnzVkWEYU7TGp85Xu2RUYG+LleYWr7cy7HWKMLzw9HIENCwomPylmoOECtkyHbshkxemnOEIsAUItAUpQH1c2q9WuPzOwxbv/AC8UfJOAloQIbRnh3uJ/f7T69pGQbOIzDSEdzWST96VILyGug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tr82ieWf5JZx6iq8zqU9F0kEATgydCxD2I6Dn7BR/H4=;
 b=J7OxI1Ninmsn/4knOUVBCgrToGUEFEDNB5yElgj8b66ZgdQU9MUIYcsptJ9cAgtTiGTCAMyChJ5lHszSIl/4nkF8I7wrokKHPdjNFK3UsTrzyyqwAOkfYm3BtIhymhoIYdQCisrpREbdskrR77zWn91H66qa+Tft8mb1zbqdZzg=
Received: from DU2PR04CA0251.eurprd04.prod.outlook.com (2603:10a6:10:28e::16)
 by PAXPR06MB7822.eurprd06.prod.outlook.com (2603:10a6:102:155::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 13:24:38 +0000
Received: from MAD0EPF000008B9.eurprd04.prod.outlook.com
 (2603:10a6:10:28e:cafe::83) by DU2PR04CA0251.outlook.office365.com
 (2603:10a6:10:28e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue, 6
 Oct 2026 13:24:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 193.8.40.99) smtp.mailfrom=leica-geosystems.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none
 header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 MAD0EPF000008B9.mail.protection.outlook.com (10.167.241.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 13:24:37 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 6 Oct 2026 15:24:37 +0200
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
Subject: [PATCH v1] driver core: Take parent lock in async device attach
Date: Tue,  6 Oct 2026 13:23:35 +0000
Message-ID: <20261006132335.4014316-1-mario.peter@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Oct 2026 13:24:37.0434 (UTC) FILETIME=[08EF51A0:01DD5596]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B9:EE_|PAXPR06MB7822:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f66e81a7-f880-4e2b-83e2-08df23ad2ba9
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|18002099003|11063799006|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	1GkhsIqaDvIoN/JP9lT9gvdCP8vrSNqhidpmwiJEihVMt5YCO9rzbj60zoiW3OcZVm+I2yAeBa/2fN9bpAxSuLQVJbAo0X6kfCoWBMT7nf+Nh/+XRPsZZvfoLQAM52kRAPVeAPQvSVWe8Yef9fUlO1QehKFbNo4x910oqWhdI8vFbgIkei/HU9+k63hmJezws0PU+vzB87ZoozRXSuswalTHPI7dktioXkq5PmQx6ESaXoJMxSToZ4t1oFIis5DOH/O4vMzCzdxaTGgxCMaLtuFAXCToDHcHORGpbBUjqzRmf0Ez1f9RyWJMrWvyBEEFY/TSeTX62bbq2RiC0/jwLOVgtIJTJTuQL+Fh44aqi5ZUodogf0bPztwmlrsySioK58avfVdHA6FNkCmMwG09OAvpQgWUacptKlYfI1VISzImVrc6RyPGqKqO/XfDwGWor/BmdgeojFESWpoO5qx7UU/hNazSlhZPpxnnuvLVklcuOzfdAx8mh+/HNdAmDbEYJL0XB5gpIB1eZPBv58t4kUdUdF1Ae/baIBPRED+Hr1/jCQcf8Yr74ud5PsGSzHK+RDofhPCCc9Zq2NBL4dAmEmz6+zp1cCYmOqATeBAmGaCf/3QX296MAyzzS8CSio7h3YyVL57L0BqIt6BWC9DhJzQpOJQvmb2LTE0EwBPPlgOy/oEf2S//D+rZRS6EpHsqQcsJ2149zl0RhmlVfneLMg==
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(18002099003)(11063799006)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	apWh3XhZnP8AD+aC3ZsjZVEj7yFac7srnX8I66xAa6fpKRZ2IzHQ4SDUdKAHgNuyVXzq5HL3LHZeI96J3ntWa8h2v1EJjxvPym6tI/A4VUfedqPfR6DRUFWBMfsTxEVatm/003MZCXlGtf9GZMDXsCOLkNRs7Doo6NHLhgJZPtvbG8CMt2e3n0zSuMHzhfj0Z1ACs+d5gVyAia1jwUxjsUcylCQ0NdaPtIAllRAvlihaTT7VLhgO6KAEcBAYdlWZ19MNkeFPpOEOc7EhEQJv/QWfgvjDbLkb0oQsFBKnN4508a4soSpP/46TvxCAnjtaqW4Ow6hq1ZkPjWa4ZUpPBGXj8FOaGHVwFTe6wmroxLJi5tjo7oqt0sQPFBVdO6//NP4lEkVJPzgIYP4BSgCrBj5xWANdCpd83lYLrMXtbRWNGjjUycwbDapq4U46uZ0K
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 13:24:37.7364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f66e81a7-f880-4e2b-83e2-08df23ad2ba9
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B9.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7822

On buses with need_parent_lock set (only USB), probe() must run with the
parent device locked. A synchronous attach after device_add() gets this
from the caller, e.g. usb_set_configuration() holds the udev lock while
adding interfaces. __device_attach_async_helper() runs the probe from an
async worker instead, where that lock isn't held, and only takes
device_lock(dev).

With async probing enabled for USB drivers (driver_async_probe=*,
module.async_probe=1), hub_probe() of a multi-TT hub then races with
usb_set_configuration() and both create the interface's endpoint
devices. On an i.MX8MM board this hit 11 of 100 boots:

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

Take the parent lock there as well, like __driver_attach_async_helper()
does, and move __device_driver_lock/unlock() up for that. With this the
warning was gone in 300 boots.

Fixes: 765230b5f084 ("driver-core: add asynchronous probing support for drivers")
Assisted-by: LLM
Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
---
Seen and tested on 6.16.y, which has the same code here. On mainline
only build-tested.

Not covered: deferred_probe_work_func() also re-probes via
__device_attach() without the parent lock.

Analysis and patch done with the help of Claude Code.

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

