Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118901;
	b=VOPhQrtYoLK+rly2BJkgOCIuMqlne5fidGxkYexJRSUn3hP4ZH1q2bapb5v6mFsCR+RT
	 c+nl/nONg6wNfsp0+SzSQlK3+LdNb69ceWv+fsNkfxt0hwkrh/mVVuOBmcJsvZZNf4tB6
	 MDYlZir5P8/do/3r57auh/mGxKwR9hC9FIO9hCGJb984tSt2KMG87fc8Iuonom2gQYbXx
	 A1vgr5quz1TYZaO4DQAvOYJwJppOsxs5xiSKlIdIp4KehLV3IcVVxIaqTI/LcsXs3bxts
	 I81jtaU1iaomyflWuECd6kr34pSy1fOXhyMkgwpBD18/+Dg87xxLarJ5vMJfdDnTulg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118901;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Lines:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=GoKcEaJT2h1CB7gtcDIj8pFeClIPCMcZlxDI05wX0fY=;
	b=zVROQuN/aWaFR5IwqhdYaOe+g9khe0Q5cj5bYHRJpzmnx7FejyS1KoC3n5vGX5J0Bl2S
	 KwvXR0+AD3pPSqzqAFXGCxqJ2LMjahrDOXk9/fxnR7m2o7k62dSWXcOxrvQriukr3JcrR
	 o+QmzxNJpMhZbmJRMRIzEK+d8O5uB5ML9zowJim9RfvBqrLFnRzrO6FrM9XkXfBGekfVA
	 BPLJhD33ujOTkhJ0Ia9kjemt/V8LEswZrrSxrJvQZmG4xbRkF/aW0OsbuCQaboCA1jJFF
	 l6pF1RwAOjMo4csdQdTRwWbwruGqL7ermU++iH3smBlFLjtfSt6ceoFUJRuYoBQu6TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Frbpq6mx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A43F606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Frbpq6mx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F991F01825;
	Tue, 27 Oct 2026 16:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793118900;
	bh=GoKcEaJT2h1CB7gtcDIj8pFeClIPCMcZlxDI05wX0fY=;
	h=From:To:Cc:Subject:Date;
	b=Frbpq6mxI6WjL7tHYixk8Ups7pUgWOXVlRIu9cpSa0AphqpwZFpGApdbs0nvXJNIs
	 O+kJusBvW7Gh0C+uJOYOSM4VBzBGZysBSBjQhXzXpikP63AciOFeV56G4wtbjVQ2Hr
	 NjUwkeJ9/eN4PPFtUYG72NLS+MX9guu+PZ7u+G20=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: hansg@kernel.org,
	arnd@arndb.de
Cc: linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] virt: vboxguest: send the heartbeat at the interval
Date: Tue, 27 Oct 2026 17:34:59 +0100
Message-ID: <2026102758-grime-danger-9fb4@gregkh>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=GRurY58ChBTRZDJeehx1ZMhBh6Aidq0iWXeixXi+b7Y=; b=owGbwMvMwCRo6H6F97bub03G02pJDFkPLm36JPQwOWXpmaV2pxfHd90Mq+7ze8Z4KCrl9t5ui a3befald8SyMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBEnLoY5pkd3VDNK21825nr Rt+fH0efTstL9mNYsNEj7MD+nf+/Tz17ILJli4HxMgnPowA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

From: Josef Bacik <josef@toxicpanda.com>

The host tells the guest how often it expects a heartbeat.
vbg_heartbeat_timer() re-arms its timer with

  mod_timer(&gdev->heartbeat_timer, msecs_to_jiffies(interval));

But the second argument of mod_timer() is a point in time, not a delay.
An interval, taken as a point in time, lies in the past, so the timer
expires again on the next tick.  Whatever the host has asked for, the
guest sends a heartbeat 100 to 1000 times a second, depending on HZ, and
each of them is a request to the host, that is a VM exit from the timer
softirq.

On 32 bit, where jiffies starts five minutes before it wraps around,
these small values lie in the future at first.  That also goes for the 0
with which vbg_heartbeat_init() means to start the timer at once: if the
driver is loaded during boot, the first heartbeat is only sent five
minutes after boot.

Add jiffies in both places.  Every VirtualBox guest now sends its
heartbeat at the interval which the host has asked for.

Fixes: 0ba002bc4393 ("virt: Add vboxguest driver for Virtual Box Guest integration")
Cc: stable <stable@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/virt/vboxguest/vboxguest_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/virt/vboxguest/vboxguest_core.c b/drivers/virt/vboxguest/vboxguest_core.c
index b5dc0d01facd..be6a8cc4e712 100644
--- a/drivers/virt/vboxguest/vboxguest_core.c
+++ b/drivers/virt/vboxguest/vboxguest_core.c
@@ -422,7 +422,7 @@ static void vbg_heartbeat_timer(struct timer_list *t)
 
 	vbg_req_perform(gdev, gdev->guest_heartbeat_req);
 	mod_timer(&gdev->heartbeat_timer,
-		  msecs_to_jiffies(gdev->heartbeat_interval_ms));
+		  jiffies + msecs_to_jiffies(gdev->heartbeat_interval_ms));
 }
 
 /**
@@ -482,7 +482,7 @@ static int vbg_heartbeat_init(struct vbg_dev *gdev)
 
 	vbg_info("%s: Setting up heartbeat to trigger every %d milliseconds\n",
 		 __func__, gdev->heartbeat_interval_ms);
-	mod_timer(&gdev->heartbeat_timer, 0);
+	mod_timer(&gdev->heartbeat_timer, jiffies);
 
 	return 0;
 }
-- 
2.56.0

