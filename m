Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951026;
	b=eXn/XJev8W/YcvpaPoqAx2mWS+Qw9zLysA4z48vRr/ZR1moelTLqITLYovvhNdc1VWoO
	 Wf1JJp/KD87wsfzqgvJNf6x4ihia921qDlnr0aml8drqM3oNJZCfyHcNPHc19K40PbdLm
	 3Ewe55sSws1pvztXRoJNYWj5HUJ4vd/IFBlkJ9QCJj7fvNPbQw9lx+UziGhLV+MASdylO
	 0NI/Ej6f6mOtSG0AXS0cacqParIkHoUVDbSnvuwnR4RYEMqfz6r7RVzC5X9lx12SxFBtB
	 1+9gEbDuLpPSdo1ZEO425xIG0RIdeYUxaVpMAGsVEF94IyHzDXRHxshi+NMcDvOHftQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4QV/HckYTY8WA/p+F3tZMrd4nGfNRUxAQURS9GMmjJQ=;
	b=rnTnyGaHEWZwoqsZ2WYr75gwS6J6Y+76muAmLBHjIp74egJL81uVzDwcg/VYnxG2PPnJ
	 aqFH9BVUDnB8o7b7z/CX59oiKLT7lniDWvUc6TaN1P+wcOO1ywCAdyg8y8Nv2mSXp5hzl
	 rMmHqmXODHRZxtE4s6WQ0k7HLO53ByElAfsEPAbttld7/fedVs4V/WOJr3d2KC1S1Uk6Y
	 rTrRf0VmevTn4g2uFCx7Ltpbmhle6gaDAWIQ165rPZcWhLBnylk2GwZxeb4ojDh6udjIu
	 lxhiEMEfWdLST5sb300WTanDh2vHwi9ni9bI52iwO/XoT8ZRIKF4OgUuajoyELtPdkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CMAvBa1Z;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC40606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BC40606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CMAvBa1Z
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2eb0f1b592bso1033445ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793951025; x=1794555825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4QV/HckYTY8WA/p+F3tZMrd4nGfNRUxAQURS9GMmjJQ=;
        b=CMAvBa1Z9BX0Fz5X2LFHevegry6gM9EBOL3Qep47/FzzBEkDLCVCoelSoxnt2ZfEVt
         LFJwgBr98ZyNlfjWXensubeCU8uxKDhyIdcChQRzPKh+EUc/eM1NTaAwrrxpCsU7TW61
         5rx1xfmyjO64tEJLYbn78KgqPYErHisHkht8aR8nkCU37cEGz1bn+0EP7lh1oFAzBFeE
         wwZlx31clATkBG+Lmn0dQZ6OX2bfWqSv8LMFDOwbSp4v3XK/YHW4smNs0r1Ws/wNvL8M
         P2IPuZ8DeOSTkcsX8SLm0/nKBm7Vyg6uWtfxDgY2EFNRJ4E2WzxfF2B3s1h5oLj/PrXS
         kxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793951025; x=1794555825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4QV/HckYTY8WA/p+F3tZMrd4nGfNRUxAQURS9GMmjJQ=;
        b=UOPQhzVzzdTXQ1GwWElfPEe6Vbtk9dlBLMkhP0f75Dft61RieE2FhPtD+dditR9+Et
         0UwYvUXivloEKfDPNPuMIzt9VIkNjoiYgREcFhyfo7St8tXPvNW115XpjZy2j1QpCEqg
         rWo7c865yR7fhU8tunyThtPQtJlkV/D1NG4CDiTvtxNaywhEdVDHV6Ib1Lp05pJrEvoz
         SNViT+dKgOlmpYh8Kvmg0c5uIsYYUbairMvJB0NaVlod2fDsxWx7azwFKm4mmhQNGrfr
         XN5sH/pDx0S3CscARNbqwa5DGdc2VeXp1mMDSX3s9NPC8Hr5FtTde1mDp2HkG/PLjNWH
         HtAw==
X-Forwarded-Encrypted: i=1; AL+hErGxs9mEnsvxkbmUmYQmHKjiL17kZ3ER9JPdiQfpYXfNUQGwF76Gt/UD8Uf1hGaaH2ZAFC96e5Zb3/f8ccc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f7Tbz5unMZF4mzSzM1euVUG4GFrlhawLCoeHP19DzqBD7ByUH
	JbMWpgpsThIDQjypvaNHMuOWx3LimkDMsuynB/pSdyzd2ET076vunjCpBKiGgN4p
X-Gm-Gg: AYBFou1fKRF6o54L4vHtY3xJKlE7yFG6/FU5uDsQ0APTimLJHKp0V0JPliFh/hHWcKo
	i/uuEcB+3l/D8UpszGZEKLdO5BMUfQQwFefrxKWlGS8EfmTU7kivAckLIAdSFweda8nZrzZTk8j
	B1Gmhcfy9J2KjX3dsq1P5GV06b6tT+Q35VyAV3hSL6H2RoTCMhtbd6EQDBrm6sXzJcCRacCWvoT
	mTTaGmWYGX+FMX5stb/jmPevJIPDAsmnPle0ofg1lHl7oUxFUrbT0kX1kgqpNKRm61hXiwhD9K+
	AFsnDOBWPldZMTB1KlvnnK473kb6pS0YP4YEjRpgbAh+Id8MeiW6hzPTFIVjCSzir+C8cioRT4Y
	ypB3UUzWItsfl2KaVy7rPzffjqGE0VPElXXyTrHxMGhmWm35ztZ0vB/RDqmHXABEjaSdQWAQC7q
	T4+HTW6bDSoAFQcShL3CYLYtJ0Cs8connUBMA3O+ZwsFPFxN6rwE0REkmeQuf/VSPuH/PMRahVF
	lSuJB7B6HEQTU9nk7z2qAL2WIaTInaiUjBVBMWa6AUp4ZG5sGaqS/Nn/4OLPZBEn777t7hgwpob
	cY20WAGWOxRTZ0UQfNH/umpLt7zz/j0JerF7QHRH9/pkYvpq
X-Received: by 2002:a17:902:e802:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2ed40ad4bc6mr24848505ad.9.1793951024568;
        Thu, 05 Nov 2026 23:43:44 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47528e52sm2641035ad.1.2026.11.05.23.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:43:44 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>
Cc: Hyunjung Ko <hj351016@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: cancel work on teardown
Date: Fri,  6 Nov 2026 16:43:06 +0900
Message-ID: <20261106074316.2204392-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106043621.1903211-1-hj351016@gmail.com>
References: <20261106043621.1903211-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

fc->work is scheduled from the extcon notifier callback
yt2_1380_fc_extcon_evt() (and once from probe), but it is never cancelled.
The containing struct yt2_1380_fc and the extcon notifier are both
device-managed on the serdev device, and the serdev driver has no
->remove callback, so teardown happens entirely via devres unwinding
when yt2_1380_fc_pdev_remove() calls serdev_device_remove().

devm_extcon_register_notifier_all() unregistering on teardown only stops
future notifications; it does not drain a work item that the notifier has
already queued. A fast-charger extcon event that races device unbind can
therefore queue fc->work just before teardown; the work then runs after
devres has torn the device down. yt2_1380_fc_worker() dereferences not
only fc itself but also fc->pinctrl (pinctrl_select_state()) and the
serdev (serdev_device_write_buf()), so it must be drained before those
device-managed resources are released, not merely before fc is freed.

Cancel the work via devm_add_action_or_reset(), registered after the
serdev is opened and pinctrl is acquired but before
devm_extcon_register_notifier_all(). Because devres runs cleanup in
reverse order, teardown then unregisters the notifier first (so it can no
longer queue the work), next cancels the work while fc->pinctrl and the
serdev are still valid, and only then closes the serdev, releases pinctrl
and frees fc. This closes both the re-arm window and the use-after-free
of fc and of its sub-resources in the worker.

Found by static analysis / code review; compile-tested only, not
reproduced on hardware (requires the Lenovo Yoga Tablet 2 1380 charger).

Fixes: b2ed33e8d486 ("platform/x86: Add lenovo-yoga-tab2-pro-1380-fastcharger driver")
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2:
 - Move the devm_add_action_or_reset(cancel_work) registration from right
   after INIT_WORK to after devm_serdev_device_open()/devm_pinctrl_get()
   and before devm_extcon_register_notifier_all(). The v1 placement
   registered the cancel action first, so devres (LIFO) drained the work
   last - after the serdev was closed and pinctrl released - leaving the
   worker's fc->pinctrl / serdev dereferences racing freed resources.
   The new placement drains the work while those resources are still live.

 drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
--- a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
@@ -148,6 +148,11 @@
 	.write_wakeup = serdev_device_write_wakeup,
 };

+static void yt2_1380_fc_cancel_work(void *data)
+{
+	cancel_work_sync(data);
+}
+
 static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
 {
 	struct device *dev = &serdev->dev;
@@ -209,6 +214,18 @@
 	serdev_device_set_baudrate(serdev, 600);
 	serdev_device_set_flow_control(serdev, false);

+	/*
+	 * Register work cancellation after the serdev is opened and pinctrl
+	 * is acquired, but before the extcon notifier.  devres unwinds in
+	 * reverse, so teardown unregisters the notifier first (no new work
+	 * can be queued), then cancels the work while fc->pinctrl and the
+	 * serdev are still valid, and only then closes the serdev and
+	 * releases pinctrl.
+	 */
+	ret = devm_add_action_or_reset(dev, yt2_1380_fc_cancel_work, &fc->work);
+	if (ret)
+		return ret;
+
 	ret = devm_extcon_register_notifier_all(dev, fc->extcon, &fc->nb);
 	if (ret)
 		return dev_err_probe(dev, ret, "registering extcon notifier\n");
