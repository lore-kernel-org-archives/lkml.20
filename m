Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223715;
	b=YuCOrnDbRzftcm/1VH9ybxS/TJuw6aUklKsoUTT51XiU9M0fO5D5rFTEUWp5kGFBZPG0
	 1lsOAtMD+ZY9i6+7GUlnPVtjPuGHLJqUamo7si8PsvmaG9K4ZXpEXce5kPcV+WMboENu4
	 RdBPBiR62qRwbbeGd2n0Ila8nuAwTQ1Q8xR2hhedG7AcxBlzh+DVq0pThOpcH2iXVgBkB
	 ymxQtFfXobvnTTq5GanhpK/qYVBB7Zbrav8WFNPp3uBVSx6WzeSQNkoVg1lS3KjdZ7BxQ
	 TWdN3H+lzsaYh9/ESm53UoRS4XMpF9HmoCLnQ25plkSV0TjazLQh0/sXH4oyxHduIAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=DXfI+D/PFWoOzoo5gwP8ijifs1QZJAMgVgZHMx0zDDo=;
	b=jCws/52oWGREMjeYzQV7Y7E+ivYhraf+eK8Ov/WdLupg8FGw5ZlOsgyykYkklAE4PPCt
	 7MlxMDHpcQbrhZXQN/Z2GIWV+n7YM0mIRfAQNNpKAszdfZ+LWT6rwl6+IfF8iqZ2ekD0r
	 ynLwtbEr89Nb4QaYsJU/sMGnZf/L0mew589W7QnEC0+jgFa12Gzy9msMq0a7CUEqETD44
	 UteV6eBZ6f4qq6MkqSMpzqomz6foOGet7bNLqujVXtQCg4A5erNG0iyYftIDaxRAm/3oZ
	 W22RtpnDMDUid+Yo8wq2DM1NH5lfLeWBuX4QgbaE0/vnGSt0coxxPjwos8cFyqd+K8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vIZwpJGf;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DF2606EEA0
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11DF2606EEA0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vIZwpJGf
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso547263e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223713; x=1794828513; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DXfI+D/PFWoOzoo5gwP8ijifs1QZJAMgVgZHMx0zDDo=;
        b=vIZwpJGfVXf7Emt3AIbxQLyDCaSaededFbZ1etdd/pP5S9KQXi8dLvivlrxv8/LNiX
         Lg+PQE2gt/BI89dPz8/tzOrpdWnM+5kAvxn521SFVzOE7P4PSJDNXJeRTW5qQira+BtU
         eHcBTLoN1Mn7byqSe/XO6vwTv0/FTe95tZdEuAzdfNcPXZntIMA6w1jA1UYWKJNOhTrh
         LRIZ4k5BJIzMDQBaC/ScyaKQZMjGsfno6H9WBjxum43W/qzQuGyaeyXZOwjTRFL7IrqW
         VBnLlkdCcv7dmcAvb/rlzIwLWshnJHNRQFW0jlwcK2P5Acg0X3kIMl/IOvygiCTcPFG7
         k1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223713; x=1794828513;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXfI+D/PFWoOzoo5gwP8ijifs1QZJAMgVgZHMx0zDDo=;
        b=BHUpqbPA+98eqJJmJpahC4c9TTqT3WUqEXuhQv10b28A+n+37dKG71gV0W2oLYAUv8
         sm91asuOtSceqtX77Dxv+tZuxbYx4lSRflAJ3tIQixwFQjrgGuLd0lngDV/tMLXW+NU0
         ktb2gp3DpuTOMRQHzqb8YaCefZm8KqMTd7Cbzt604XU2A9zmu491zH0FMkmsfy/Bo2Rf
         WPBTizWzkI8/CGNakmG/DsBN3eWjUdoUy0mIqDF5a3iDRkGnY9yCnMuNQ5scf2+aSFvp
         yq0jy8KBN/xley5wJZI8HguccPxiy2ffVs4nIYaQ6qSoaA0vf2hJ2+0bXR0Yiyu+mPSY
         idaQ==
X-Forwarded-Encrypted: i=1; AL+hErHEN7jJKT9WyenWieGjw8q4pzkbS1NY6/kI4Qrbb4iWIfHHCL27JJGst3xR0SDpAbRo9Pqg1e4o7vEmAXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VWrjCEHGU9svEHllqMoiHYNfpZdVcjNuB8pcyQ5Elg1sAoU2v
	RdcYgV9aZDpPndAdu2YkRA8JVVgHND7gcP2dEUa55DsU4t+QGjeXsAtV
X-Gm-Gg: AYBFou0oRTearCDHg97Nz0K15PKrXZ18q0JMeSSRTXu8Ugr/+JBZ8seVedH2OU4Bfz7
	3uIGQ/fQIDLb2RNEt71sAxezq+UAIS70RkJOG+tdMrSuwhSSQ5TOghFeAdwgYPJCiqyvKRIMr1u
	A+tIp6S4qut2+hMh/sChDq6q4fsYXVjg5zsdtWFIs+JpVwb5QSjAPF1uuki5LZ0UFGmLbafAqSf
	8FFXgtFFLy7fYLW3U2Ha4/VP7nPfHBn4zR96Hj54EX/vA0KHIMBe3gjL2NbrAtApQX5ReeL+xQf
	LRfUfxdWuJmRmQS2Q+Mn/QrxocxeQzCuMYvCtf6FvD2nrpIbMWhdO2A0jiLABV4jHrs03R7nG8R
	oXxKWxcMiTU6qqRS60LVMd1JQY838XZHmvFxokeoLanF5W9S05NZPf4tYrKGBzxxSA9upHyc4xt
	y6J3V1JmFHWt8XkFmz6UJPrDq31IvjvaxsTU9rt05F9wyqUwL5s1hZIJKNr/ZQEHCXiLh4lw6XO
	juQgGGe3EhwybvDdagNRSneUkNPuTFD6AUDtEy7tjtHmipugOS9rJ8PBRcPz4WKU93IX32uF/UL
	lpNG6Uqq7svEmSBP9tt7hmCp/9R/4bNyyXsyy1LzF9GK//hGDPzYtR55
X-Received: by 2002:a05:6512:1288:b0:5bc:f0d3:cb8f with SMTP id 2adb3069b0e04-5c14c026de7mr1129789e87.51.1794223713221;
        Mon, 09 Nov 2026 03:28:33 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3adf9e0e9d9sm7211361fa.14.2026.11.09.03.28.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2026 03:28:32 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH 8/8] char: xillybus: Cancel delayed work items before teardown
Date: Mon,  9 Nov 2026 12:28:00 +0100
Message-Id: <20261109112800.48663-9-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261109112800.48663-1-eli.billauer@gmail.com>
References: <20261109112800.48663-1-eli.billauer@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

xillybus_core queues only delayed work items in its workqueue. Use
cancel_delayed_work_sync() instead of flush_workqueue() to clean up
queued work items, as the latter does not wait for or cancel delayed
work items whose timers have not yet expired.

Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260630092330.43534-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---
 drivers/char/xillybus/xillybus_core.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/char/xillybus/xillybus_core.c b/drivers/char/xillybus/xillybus_core.c
index ab8ac78b28dc..644447502d09 100644
--- a/drivers/char/xillybus/xillybus_core.c
+++ b/drivers/char/xillybus/xillybus_core.c
@@ -1926,9 +1926,10 @@ struct xilly_endpoint *xillybus_init_endpoint(struct device *dev)
 }
 EXPORT_SYMBOL(xillybus_init_endpoint);
 
-static int xilly_quiesce(struct xilly_endpoint *endpoint)
+static int xilly_quiesce(struct xilly_endpoint *endpoint, int to_cancel)
 {
 	long t;
+	int i;
 
 	endpoint->idtlen = -1;
 	endpoint->num_channels = 0;
@@ -1944,6 +1945,9 @@ static int xilly_quiesce(struct xilly_endpoint *endpoint)
 
 	xilly_allow_isr(endpoint, false);
 
+	for (i = 1; i <= to_cancel; i++)
+		cancel_delayed_work_sync(&endpoint->channels[i]->rd_workitem);
+
 	if (t <= 0) {
 		dev_err(endpoint->dev,
 			"Failed to quiesce the device on exit.\n");
@@ -1956,6 +1960,7 @@ int xillybus_endpoint_discovery(struct xilly_endpoint *endpoint)
 {
 	int rc;
 	long t;
+	int quiesce_channels = 0;
 
 	void *bootstrap_resources;
 	int idtbuffersize = (1 << PAGE_SHIFT);
@@ -2058,6 +2063,7 @@ int xillybus_endpoint_discovery(struct xilly_endpoint *endpoint)
 		goto failed_idt;
 
 	xilly_allow_isr(endpoint, true);
+	quiesce_channels = endpoint->num_channels;
 
 	rc = xillybus_init_chrdev(dev, &xillybus_fops,
 				  endpoint->owner, endpoint,
@@ -2074,8 +2080,7 @@ int xillybus_endpoint_discovery(struct xilly_endpoint *endpoint)
 	return 0;
 
 failed_idt:
-	xilly_quiesce(endpoint);
-	flush_workqueue(xillybus_wq);
+	xilly_quiesce(endpoint, quiesce_channels);
 
 	return rc;
 }
@@ -2085,13 +2090,7 @@ void xillybus_endpoint_remove(struct xilly_endpoint *endpoint)
 {
 	xillybus_cleanup_chrdev(endpoint, endpoint->dev);
 
-	xilly_quiesce(endpoint);
-
-	/*
-	 * Flushing is done upon endpoint release to prevent access to memory
-	 * just about to be released. This makes the quiesce complete.
-	 */
-	flush_workqueue(xillybus_wq);
+	xilly_quiesce(endpoint, endpoint->num_channels);
 }
 EXPORT_SYMBOL(xillybus_endpoint_remove);
 
@@ -2106,7 +2105,7 @@ static int __init xillybus_init(void)
 
 static void __exit xillybus_exit(void)
 {
-	/* flush_workqueue() was called for each endpoint released */
+	/* Work items have been canceled for each endpoint separately */
 	destroy_workqueue(xillybus_wq);
 }
 
-- 
2.17.1

