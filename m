Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839041;
	b=ky0loMNtfBoa/olIEtD2OyU4IBTjXW8bpnlNvLOermOpEOtYDJbrRAGlFqVYfv961FEv
	 7qSRMVxs7PLMxmgVjoyTvoHfhMeCIL8kH+mT2R4Q5Qmqc8ec+l0+0HoA+eIVWilHbLcmE
	 A4fAveRsVTAD+c5gQ2Sr76LWSCsIlDLLJsE7fK4bEJ1SPBCWK8+pVvRQxaW28e5vIqi7J
	 HA7I8uuTBLQ7jQif/01W/soR3tOmvxx3UMomT6lFG7olMvqSuYzGii7jmfTKwAe0Onx2b
	 UehfKm9UWKfldWLTj3dqqq/SaNEbSxMe6qM/ReOYtRcyciICheKyXb3asRVkSYr73UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839041;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=dps6oFUYuDvGDg0SKYFB8E8mZi7K4HXZ7Xl9y+3h9A4=;
	b=LUqLExWvds38O0WMIXXHjHHyQrB8WYvApgmF96KK3tlh9nUbVFKmmFeVQLzHmyP8VIP4
	 r/XeASygsX9wtWG5ZctKUtQUYL+lHdAahYTdDDd9hyp2Qz8Fc4zPQreMi/Ztn3YfhmFhe
	 X+papshEaY/7UOCvxn3eAjbyzBL+Z6tn53wRdNPEs1/AUP0HPH3udu0FVWLFYeXLQIYB+
	 lh6IvQo4oIb44xnGSMWE3a8315OLGnL8l2quCfeyPNUw57JPLGg1GjDnbYN8iamOyEpk9
	 wpHUMLGzvlGhaER8CDnBps0J6Il4HcHgrjQHAMung2aCdswGtVTIrPNOYoL8e472KEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=Rqu1Gi8+;
	arc=none smtp.remote-ip=185.136.64.226
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6D7606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC6D7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=Rqu1Gi8+
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026111614235366162e873800020701
        for <linux-kernel@vger.kernel.org>;
        Mon, 16 Nov 2026 15:23:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=benedikt.niedermayr@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=dps6oFUYuDvGDg0SKYFB8E8mZi7K4HXZ7Xl9y+3h9A4=;
 b=Rqu1Gi8+e1N8mBHJlhjL+BzBJA9WbybSBO7Z47PizoYkZFWqKHVqHveT6avRWvTfUboY2H
 Wh7fopAIlZGMAoV7YKYow6+nLnHx2r5n9XZYMRt/nn+xFCVvZXWLf0Q8GYRh335bCO62Yqbz
 7OhrbSG3zQl6B6qOwZSfYxCXM0xuUMLlSVDyYqOVdrmFntJW0QsY9mIuUWZDQg06lxH3yTHU
 4T46R395dfW+wZEQJ45TA2lI7Xzv5stuwEk0GZKyPQ/AT1W8870Q4DVnCNrTKbxQxirnL87G
 ia23W48q1cWFfRu2e/63GNDdnC4skE1t//YvH4Nr1VC23a4At/X756Sw==;
From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
To: andi.shyti@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: baocheng.su@siemens.com,
	tobias.schaffner@siemens.com,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 2/3] platform/x86/siemens: simatic-ipc: add fan monitoring support for BX-59A
Date: Mon, 16 Nov 2026 15:23:50 +0100
Message-ID: <20261116142351.1228943-3-benedikt.niedermayr@siemens.com>
In-Reply-To: <20261116142351.1228943-1-benedikt.niedermayr@siemens.com>
References: <20261116142351.1228943-1-benedikt.niedermayr@siemens.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1323861:519-21489:flowmailer

Some fans on the BX59-A are connected to the ADT7475 fan controller
which is connected to the NCT6126D Super I/O chip's SMBus interface
(supported by the i2c-nct6126 driver).

Other fans on the BX59-A are connected to the NCT6126Ds hwmon interface
which is controlled by the nct6775 driver.

This patch enables the required drivers.

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
---
 drivers/platform/x86/siemens/simatic-ipc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/siemens/simatic-ipc.c b/drivers/platform/x86/siemens/simatic-ipc.c
index 4a4509fc9263..8f99032897dd 100644
--- a/drivers/platform/x86/siemens/simatic-ipc.c
+++ b/drivers/platform/x86/siemens/simatic-ipc.c
@@ -33,7 +33,7 @@ static const struct dmi_system_id simatic_ipc_whitelist[] = {
 
 static struct simatic_ipc_platform platform_data;
 
-#define SIMATIC_IPC_MAX_EXTRA_MODULES 2
+#define SIMATIC_IPC_MAX_EXTRA_MODULES 5
 
 static struct {
 	u32 station_id;
@@ -53,10 +53,10 @@ static struct {
 		{ "emc1403", NULL }},
 	{SIMATIC_IPC_IPC227G,
 		SIMATIC_IPC_DEVICE_227G, SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_227G,
-		{ "nct6775", "w83627hf_wdt" }},
+		{ "nct6775", "w83627hf_wdt", NULL }},
 	{SIMATIC_IPC_IPC277G,
 		SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_227G,
-		{ "nct6775", "w83627hf_wdt" }},
+		{ "nct6775", "w83627hf_wdt", NULL }},
 	{SIMATIC_IPC_IPC277E,
 		SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_227E, SIMATIC_IPC_DEVICE_227E,
 		{ "emc1403", NULL }},
@@ -71,19 +71,19 @@ static struct {
 		{ "emc1403", NULL }},
 	{SIMATIC_IPC_IPCBX_39A,
 		SIMATIC_IPC_DEVICE_227G, SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_BX_39A,
-		{ "nct6775", "w83627hf_wdt" }},
+		{ "nct6775", "w83627hf_wdt", NULL }},
 	{SIMATIC_IPC_IPCPX_39A,
 		SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_BX_39A,
-		{ "nct6775", "w83627hf_wdt" }},
+		{ "nct6775", "w83627hf_wdt", NULL }},
 	{SIMATIC_IPC_IPCBX_21A,
 		SIMATIC_IPC_DEVICE_BX_21A, SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_BX_21A,
 		{ "emc1403", NULL }},
 	{SIMATIC_IPC_IPCBX_56A,
 		SIMATIC_IPC_DEVICE_BX_59A, SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_BX_59A,
-		{ "emc1403", "w83627hf_wdt" }},
+		{ "emc1403", "w83627hf_wdt", NULL }},
 	{SIMATIC_IPC_IPCBX_59A,
 		SIMATIC_IPC_DEVICE_BX_59A, SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_BX_59A,
-		{ "emc1403", "w83627hf_wdt" }},
+		{ "i2c-nct6126", "nct6775", "adt7475", "emc1403", "w83627hf_wdt"  }},
 };
 
 static int register_platform_devices(u32 station_id)
-- 
2.43.0

