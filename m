Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254003;
	b=c/+lm1FNS9pszZnsOoMXQrTuIds4mK0//9vtKrw0VySD6uS9LC9/9z/ZjASvqbDi6y8n
	 3vVKxUDi4TNljEnYCqwe/v0xl8eEVzSp2JVIzbZEEABxCvRQxWRvyWeRfI7SdrY/LPm30
	 9FWkQv6efyWzrzygwujsJhFl4aH52Rt59rf50flL0bysHUaS2K4oGiHObO/qOyamYB28Q
	 ZroRl1cXNcBrUnXSUDrDdGxpLAXihSEDF1PHs776bHbryI+jBrfJZgLUJreIv2ZsQh5Nq
	 VpP9SmATb4+TUXxrPr2r9GSfL5A5c9Usi5sDsN9vsl9+EFGwq1y7DuFUBFPHvIEoDiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254003;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=dOH/+stCPB70K0mx8Tszt6uUU0Qf49l8oosu4DUNDgM=;
	b=E1vNUNOFB2jJpdTkQZ4Xldb1CpOg1JcB8zDT//fNgwhOT22P7wFtKdmvKVeUvNojRCfe
	 d9MAnHQQYiBowIj45G3py8f6RY+Vrdfy4yp964yHP8TfcQUs5T4Ws79fjCO1qbdNMtJRC
	 fik7Fdjb65CX+z1E9gusDK4SAVvf068csT7UDPixgotSHXdFb4Hz0bcK+551H6ofd9/9X
	 BLu6YKJliGj2jmRnbNBF3BtKMir1dXbhFvKLPuqIJddfz++Uez4W63euNFrTCUBAgaHe8
	 Clu/cKNGD+1pefD5rJdDaDGQKHFedZOSGz6Abm0OSw4rC2ESYz3ffK8UxRQw46MerqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VnDK0hmR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=q9ZI8b3Z;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA571606A321;
	Mon,  9 Nov 2026 19:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA571606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VnDK0hmR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=q9ZI8b3Z
Date: Mon, 09 Nov 2026 19:53:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794254000;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOH/+stCPB70K0mx8Tszt6uUU0Qf49l8oosu4DUNDgM=;
	b=VnDK0hmRA5voB4FMh3oUWSEMbD44NyvPSCq/RZM6d8BjtiLFYqOn9V6cTSstzaH7s+rpCH
	Vzedpioo11y8ARYQBrix2JsNWDNuArY/kuVUUpam7ZqPHuhNMnf0NAYST3D6KRRlx/TENb
	XAZeb7pXmbBmgSLbVQS60UTXOpAtv0ywxpBOJTbH9qdUmmvWQ4tVSXry4FCMpajtPFpLUj
	apJEzZ31h6s75QdcdC7EJUytEanBcSDO5RI3Ng6/eA0vspUGtRBrwWHN6JNZ4yjaENLWl7
	Kg996pIaUNxBz8N5py8BzO2hYbWRwKbMgmbXrhOH37o8FeqJU7IrwEUS04dizg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794254000;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOH/+stCPB70K0mx8Tszt6uUU0Qf49l8oosu4DUNDgM=;
	b=q9ZI8b3ZF2SUs+61CmOcjUYU5KQgpSZM0W/CePNvIITorC2FqAIgbpOu5mjWUwTK4VPTYO
	QmTinwNgysLp9EBg==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] alarmtimer: Return early if
 platform_device_register_data() fails
Cc: linux@weissschuh.net, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261102-alarmtimer-locking-v1-2-3c79a698aeae@weissschuh.net>
References: <20261102-alarmtimer-locking-v1-2-3c79a698aeae@weissschuh.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179425399878.2093942.5636506527786093313.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     4ed8ae10367e88a974582027494ce4a197c5b175
Gitweb:        https://git.kernel.org/tip/4ed8ae10367e88a974582027494ce4a197c=
5b175
Author:        Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
AuthorDate:    Mon, 02 Nov 2026 06:11:55=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 20:50:03 +01:00

alarmtimer: Return early if platform_device_register_data() fails

Simplify the logic by returning on error instead of having to handle the
potential error in each following operation.

Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261102-alarmtimer-locking-v1-2-3c79a698aeae@=
weissschuh.net
---
 kernel/time/alarmtimer.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
index 601ebdc..8eeea09 100644
--- a/kernel/time/alarmtimer.c
+++ b/kernel/time/alarmtimer.c
@@ -89,10 +89,12 @@ static int alarmtimer_rtc_add_device(struct device *dev)
=20
 	pdev =3D platform_device_register_data(dev, "alarmtimer",
 					     PLATFORM_DEVID_AUTO, NULL, 0);
-	if (!IS_ERR(pdev))
-		device_init_wakeup(&pdev->dev, true);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
=20
-	if (!IS_ERR(pdev) && try_module_get(rtc->owner)) {
+	device_init_wakeup(&pdev->dev, true);
+
+	if (try_module_get(rtc->owner)) {
 		WRITE_ONCE(rtcdev, rtc);
 		/* hold a reference so it doesn't go away */
 		get_device(dev);
