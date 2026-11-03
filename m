Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693037;
	b=rLbGDTYXrNU6cPY8mifmibEI/CpHH4fx1F/A8LBAsoBwL3E5wpQKDFyM33BNvnAOfACj
	 60GB5Yfl3b3qU51zud2b6GhrTJKBSMGpWsbotXxIU3wKJCghrXZhr1NuA8hSqKWp5JE/t
	 ZzOTTozbN6bRaBJGne7hJtwYeMjnnwUjiNH9IIewOa/Bl2dKyMdjZhaWB2vWT12vPOIl/
	 7AtZn2HFkPnxK2RfDeUCSZOGpeekKHVMc3h3CvebCIWPC0eu/ea19IoERfxj66lyndrYG
	 nzMWY1W+61BshNKMG4YeLqnSJBOxY7CgGNfaSGXcfnjMaEOYVqGCJozyCYnf8EG7OFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gs5+MUVCUFpHGD304h1ti8CPR/+CDqRB4o1YL2rOSQE=;
	b=sZFHeklAXshZPLeHyfuS1sV76ElztlEBpWgLzQjB4MWWW44GIpYb7FsJXW00aQyVmeOO
	 ijwtoCC12RwaqQ8pWHdvmpGEmebbFxy2L2c87pp2clS4rrp5LhVuineVIRnYp7ZBJPJZD
	 M0kdsWt3AjAJ+bF6tzw5gjeBu0JzlBY7LJ4WNKKSjmSI6K5/1DdkCfSlYD+yYR8HvbprL
	 cMxRhtVp32uQx30PvDvUhAKhe7X8NaiTxU+/ghL2Q5a6Wu/oB0k9Iuuii5ywFsZxHBEjX
	 zy7iZ5ok43z/Hh9IPdRtZm35onhTPLKXHBYbrQvpzrF/qZbs+x6p93S/lBxzHQQCqpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDNEu0Qs;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EDC606A33B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0EDC606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDNEu0Qs
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso2380662a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693036; x=1794297836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gs5+MUVCUFpHGD304h1ti8CPR/+CDqRB4o1YL2rOSQE=;
        b=YDNEu0QseFDDKOsEloJCR9Igt4kQC9ySzig+W7DHQGXaZYarzT+1a6Kxbwi7JUFKyJ
         LFhuFr/FCX/Eiob3g3SfhOwGbKPRgB55PQZIw9ex1A2UGFtnZRP4/Md82BjFrojjOvdO
         x2GpZ08C+XKpNqeaxunPskSVKHNHUDVOMe1APKiKAzDrnPiArh6fchaW9am+ficJ80/X
         3+SjASb1GeSoNpRG/4yqSZmF0eQoRPiAv83vHT/Lan5OuY6k4r2Zifo1mF8t5oq16v1k
         xHJpMWlWhwq41ib6SdACltbaMMarZAMIyLI9uQw4INca+Zv0pwTjyWcgXz+D+mhO97lO
         VLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693036; x=1794297836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gs5+MUVCUFpHGD304h1ti8CPR/+CDqRB4o1YL2rOSQE=;
        b=YBAyihD7dzRLyInH/CNxs7UI2GyZ+8EPhFD5lKTxJ7RdMuVK50fFZ6tDaGh16h/Bii
         BEyDA8qWL8PHddIjRHvVKuVQn5qbwFHAOvOThiATxtxy1L6oe3n6/kTwGIEz8o2toITK
         v97iAPUZ2tHiiIwMi0IjyFt2x8PWSPCa8hIs2mB9734XeNSmCZq2vhK2cLLhAxTDy283
         kHX/LDIeFlyj3TAmlhlOvXbERj9qheUwW/GKbn4OHogSAP3ElgeqZe3WORHrsxlD/vpB
         jgQggQT3uYkA8pj6w0UsBqJW7YHDr2O9KJE0sT8saR2KkjbQ0r8KKJVtS+516BYCroWv
         zR4A==
X-Forwarded-Encrypted: i=1; AKwUvByNMHSCBOXle41RFFgzLKke8be7mgQFOFUjwXfNpY84/mFmuPna/mra28U36Zo+WPe7OTPKzam0vN+86/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZfHL1rYR2BIbZhyZ+KztfWA+AmaxZ7N9yEfOBVn1hsP+OGG1p
	8ShE4fXnL9x84RBs/pQZBT/xjUSIZgEJH/+rvrpVSl6sim1HKgX7WkkY
X-Gm-Gg: AYBFou3/ZLeL5txMbpuUojY3fTZ6bS+JrVs5O6wxi9DonUAl1G4zbrzQ0yRMkTc8lF4
	5Gz01qeGcIBbl2CD29oD1xqTk6LfiOXL+D2uK3hr3ib4MedjZpQlLo51B9rEM8YR9P4FGAKB3lW
	0tXhAesaUdYSmQDKAnqQuXVvHWl9lxzLY8bQrAGrNnRkLjZWWAP0Vk8vm91hUCLHTGoLF504/Gg
	O315Ff5V4UAA0XEX5m7NUZ/v50bpcvQ4Ibjm+KHmZPX0yVUASsQyuSsDdZdU3fbl15nQqAb/qMP
	85MJrNKpoyfgpZXopDoPcl1Qxek4T78fi2yR031Ih95GMbQK0EAnOsq6khFkqwAuM4NiRgtDOEK
	MDz6Gzu3zJd8rWBUjoFXqGBINhv/EgE2X3w2yuq/pTBGjNMCW89SZqsek+CrW5NhOiyGiQ+izQ3
	gC8XSiaqqNmxl1wRCGtPT8f2uXXgoyxtjMHP2Ll06AwW2aGOB35QU4uupG4/CStDb2tDy+iW7wy
	3inklMXDSAjbGOkwwuhXGaC9/aEsv2HS4h1qL9Tlt69HIL2sO738JYk+KQ7W6hd4imrHl4b57Hv
	tVRBh9SAjsUcVXf/c/hkHeb7jkTKliHddw+tIesa/PuSMWfNC+ZqN78bVaMrKvmrmXWr8SAxd+R
	u
X-Received: by 2002:a17:90b:4c85:b0:3a4:b418:94ce with SMTP id 98e67ed59e1d1-3ae89574db4mr9347219a91.1.1793693036031;
        Tue, 03 Nov 2026 00:03:56 -0800 (PST)
Received: from localhost.localdomain ([155.69.168.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5814basm3316347a91.2.2026.11.03.00.03.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:03:55 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com
Cc: mhklinux@outlook.com,
	stephen@networkplumber.org,
	linmq006@gmail.com,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] Drivers: hv: vmbus: Keep the channel when vmbus_add_channel_kobj() fails
Date: Tue,  3 Nov 2026 16:03:46 +0800
Message-ID: <20261103080347.90310-2-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080347.90310-1-izaiahsun@gmail.com>
References: <20261103080347.90310-1-izaiahsun@gmail.com>
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

The channel is freed by the release of its kobject, and free_channel()
drops that reference. Since commit 8bc69f86328e ("Drivers: hv: vmbus:
Fix memory leak in vmbus_add_channel_kobj"), vmbus_add_channel_kobj()
also drops it when it fails, as kobject_init_and_add() asks for. That
frees the channel, and both callers then go on with it:
vmbus_add_channel_work() unlinks a sub-channel, unmaps and releases its
relid and calls free_channel(), a use after free and a second
kobject_put(); for a primary channel, vmbus_device_register() unwinds
through vmbus_device_release(), which removes the channel too.

The kobject is also only initialized in vmbus_add_channel_kobj(), so the
error paths before it, for instance a vmbus_device_create() failure in
vmbus_add_channel_work(), call free_channel() on a kobject that was
never initialized: kobject_put() warns and does nothing, so the channel
is leaked, and removing the attribute group from a kobject that is not
in sysfs warns as well.

Initialize the kobject when the channel is allocated, so that
free_channel() is the one place that drops its reference on every path.
vmbus_add_channel_kobj() then only adds it, and leaves the reference to
its callers when it fails. Remove the attribute group only if the
kobject was added.

Fixes: c2e5df616e1a ("vmbus: add per-channel sysfs info")
Fixes: 8bc69f86328e ("Drivers: hv: vmbus: Fix memory leak in vmbus_add_channel_kobj")
Cc: stable@vger.kernel.org
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    The bug was found with kbound, a research static analysis prototype.
    The patch, the changelog and the test setup were written with the help
    of an AI coding assistant (Claude); I have reviewed them and tested them
    as described in the cover letter.

 drivers/hv/channel_mgmt.c |  5 +++--
 drivers/hv/hyperv_vmbus.h |  1 +
 drivers/hv/vmbus_drv.c    | 25 ++++++++++++++++++-------
 3 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/hv/channel_mgmt.c b/drivers/hv/channel_mgmt.c
index c42def04ac41..cb1d8d76928f 100644
--- a/drivers/hv/channel_mgmt.c
+++ b/drivers/hv/channel_mgmt.c
@@ -367,6 +367,7 @@ static struct vmbus_channel *alloc_channel(void)
 		     vmbus_on_event, (unsigned long)channel);
 
 	hv_ringbuffer_pre_init(channel);
+	vmbus_init_channel_kobj(channel);
 
 	return channel;
 }
@@ -663,8 +664,8 @@ static void vmbus_process_offer(struct vmbus_channel *newchannel)
 			mutex_unlock(&vmbus_connection.channel_mutex);
 			cpus_read_unlock();
 			/*
-			 * Don't call free_channel(), because newchannel->kobj
-			 * is not initialized yet.
+			 * Don't call free_channel(): newchannel was never
+			 * added, and its kobject holds nothing yet.
 			 */
 			kfree(newchannel);
 			WARN_ON_ONCE(1);
diff --git a/drivers/hv/hyperv_vmbus.h b/drivers/hv/hyperv_vmbus.h
index 33923621a5a3..7865a519dd7f 100644
--- a/drivers/hv/hyperv_vmbus.h
+++ b/drivers/hv/hyperv_vmbus.h
@@ -408,6 +408,7 @@ struct hv_device *vmbus_device_create(const guid_t *type,
 
 int vmbus_device_register(struct hv_device *child_device_obj);
 void vmbus_device_unregister(struct hv_device *device_obj);
+void vmbus_init_channel_kobj(struct vmbus_channel *channel);
 int vmbus_add_channel_kobj(struct hv_device *device_obj,
 			   struct vmbus_channel *channel);
 
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 4692687cdbf3..fc0f16f51266 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -2084,6 +2084,15 @@ int hv_remove_ring_sysfs(struct vmbus_channel *channel)
 }
 EXPORT_SYMBOL_GPL(hv_remove_ring_sysfs);
 
+/*
+ * vmbus_init_channel_kobj - initialize the kobject that holds the channel's
+ * lifetime; free_channel() drops its reference
+ */
+void vmbus_init_channel_kobj(struct vmbus_channel *channel)
+{
+	kobject_init(&channel->kobj, &vmbus_chan_ktype);
+}
+
 /*
  * vmbus_add_channel_kobj - setup a sub-directory under device/channels
  */
@@ -2094,13 +2103,14 @@ int vmbus_add_channel_kobj(struct hv_device *dev, struct vmbus_channel *channel)
 	u32 relid = channel->offermsg.child_relid;
 	int ret;
 
+	/*
+	 * On failure the kobject keeps its reference: the callers' error
+	 * paths drop it in free_channel(), which also frees the channel.
+	 */
 	kobj->kset = dev->channels_kset;
-	ret = kobject_init_and_add(kobj, &vmbus_chan_ktype, NULL,
-				   "%u", relid);
-	if (ret) {
-		kobject_put(kobj);
+	ret = kobject_add(kobj, NULL, "%u", relid);
+	if (ret)
 		return ret;
-	}
 
 	ret = sysfs_create_group(kobj, &vmbus_chan_group);
 
@@ -2109,7 +2119,6 @@ int vmbus_add_channel_kobj(struct hv_device *dev, struct vmbus_channel *channel)
 		 * The calling functions' error handling paths will cleanup the
 		 * empty channel directory.
 		 */
-		kobject_put(kobj);
 		dev_err(device, "Unable to set up channel sysfs files\n");
 		return ret;
 	}
@@ -2124,7 +2133,9 @@ int vmbus_add_channel_kobj(struct hv_device *dev, struct vmbus_channel *channel)
  */
 void vmbus_remove_channel_attr_group(struct vmbus_channel *channel)
 {
-	sysfs_remove_group(&channel->kobj, &vmbus_chan_group);
+	/* A channel that failed before vmbus_add_channel_kobj() has none */
+	if (channel->kobj.state_in_sysfs)
+		sysfs_remove_group(&channel->kobj, &vmbus_chan_group);
 }
 
 /*
-- 
2.53.0

