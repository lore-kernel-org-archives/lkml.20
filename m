Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0F93E9584
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790550451; cv=none; b=M069u3OyPo7Y5ovB9/fyyEgJWXvEVBLSZfiAiMCZH+f+IGOyAvHSzjdamuPW6s8mV7WwJWEAtRQUUCJMLPbjOL6xaIuu1LccvaH3MyeS4DkI/hya7OCk5FPysYgmVWBm/KS3KTM7qPvli/kEwQdqIN5HeQDLqvP4V2e6S3ghJcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790550451; c=relaxed/simple;
	bh=5CBR8c616kBOSQEIV4GnZbnOBPMVdoXBoT6d3Mic8PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FzmnxNUKifEKJUVwGG2YbE7mPQmiI4A5/4+x4SzQXv2p/e2CWiux3WsMWQFczHfqs5BqTJ7B7HZye4pWw33ZpNOmcCWsAM5NZ01+aAvXxw9ywNnsM6sd36Y3Fz+xtVihkt5PToMxImUWru0qJ0gd0asZzvBdf/nJrGrwprXg97o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=IIyZ2bhu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=raVY20NU; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="IIyZ2bhu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="raVY20NU"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4B03B1400039;
	Sun, 27 Sep 2026 19:07:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Sun, 27 Sep 2026 19:07:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790550449; x=
	1790636849; bh=X6tAWan2Kdh1XR0uwkM/ZuaQOC3Z0BrFyPWRPH8hjx0=; b=I
	IyZ2bhuiob8ULuMUVnadEIBCCssWPqfuvqidaHRl78s9cHBIXFRqTzKXMhoTVVeS
	d4g+M2rifhrBlQBB+YigQwUnwuSDSjqVvVONDmsYvUP3sGrhR7+gdq5D1zE2T1VO
	YPpV4JPeAaRbzopQq/VzF0cYMCnE6m+yLPnwvlW50NjVdtlWeiDxzMD9K802I/IT
	1AREBmAvORvy/pOlUT1E5LiUc1/M+CIQ1DD7Pe4BLIJmancpQUmEIMfN4u/0CvYi
	6i3nrV+8Q5FcFJFB8BoXP3y7J202FzNjdbps1E1NudJGGdnnU9/Gje08GMYl7FPU
	yBIGeCqDQiH38c4oupcCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790550449; x=1790636849; bh=X
	6tAWan2Kdh1XR0uwkM/ZuaQOC3Z0BrFyPWRPH8hjx0=; b=raVY20NUQDibM6mTa
	qdl+sOfQQx6xi5+sJ78PlL4RKYET09QLX5kzq72Df7CSXD1KZWALcHdWemRsHc3B
	ydzbv8/fKGJ33CfNHOBYfvqPBE9It3sRaPIpLpAjnqpuJFZY84X6HyQifVpEJ8gQ
	SmBdNp4nJCQhX60fdBMgwaJvF9rcfOl/4X3UEzJ1AdiQyVrCIVeEb1/k2UeijkAR
	fYn5IzXjFfvXED/xHDsrLTm53jKMUoO9lXMqe61C+ijPqwtmdTd2fuZ1LMdqCH7a
	2ADwVlI5w2GLsCi9+zF/iFz9MYCgNr/rioSSC4roKKil+C4Wk2ijeKQ93sihOQHD
	2Rd4Q==
X-ME-Sender: <xms:saG5ahNM6gfBTfuT3W3U1Oz5u85sXHKGxVdsRkX1abOgbcaVayRHUw>
    <xme:saG5ah6_eaLQ4I8Dg9bNwC-fsCBfp5IyxfImsuIKwsy1CmaQ_Pf8sH7dE9Le68IFo
    Yi2HYKBnb3R1x7lrazgHc5-dXhICkKh1IT76DidUJurATb1xexrulP9>
X-ME-Received: <xmr:saG5an3R-azUJCjsq0jyWAtV2svbGQkByx8Ng8r9J1ephYPO5qzU1vOguwgXjCsxY4OvyzPjbYBjlDOwyS6OSrHdSe3RujqLgLJXaFKW70MQ>
X-ME-Proxy-Cause: dmFkZTG0L7pGOMwThUUE2TF4c1w16xmRNamFalWL0BhmYUnywREWYkkYDKQFv4mf4VRjJL
    2PFE03XHALcvai+0tJySFL+Qo2BufO/3Wx6b0h77OkfE5v4U6HeusRClajG8Vr/chzh+P/
    sng3BoyYK82xK6BbmS1fwwqrHDR90iDK0D7zhYHiSvNbU3KoiS7wBjcp6O8PuTkO13+eVK
    KKRQfK5FMcTA+TQfmNhnaElKF6p7hooxtHuF9E6GsjMnGMKqQ0YZK8kzVR5WUcrhv2yOYz
    ybEMk9rrANwx7k9pEFTaq0mAxIp35ID8lT8QRBxX5WHzyWdS2rAQeMC2+2TRLe3deFsuQQ
    hpmPyqlaUrOdTyxXaXDHq8mLOsMpjHG7QnA3w6E4roIPG5+/g9ZQA14EdqXQLAzidR8+x9
    3gS2h0+Zcu438e5Ytt+jpHyjQ8lSQoB7wgzdKWTGUQbvo4L+h9Xi/CpvAa4qB6HGUYn2L+
    Uwrv02YuPthy3K54bRWR9F/Ff9JnXmNcKPot9TO976rh/02YuG9LjlFBjy2MOGEg1vdgGU
    K+BkSK+iGb24jKGJ1zjPP6nqP/eclGAL+yT1Xf3tYg3qSelrN9yFAg2FVmFJvWyX9RsuMt
    TSuWHx1bzZ5Phf6Y59AF8mnoSIz53BoLkEoviE888AM6FhVoSpPPZJ68d4Dg
X-ME-Proxy: <xmx:saG5aqZraDuEc4zZTfralYQqrjWRbu9JtJUABIG7rLdhvwVKOb3Q3g>
    <xmx:saG5anCsySjadTqEUXAH9aleQkMAnfYbnDsQVbRG5yahKXDJ29fxMg>
    <xmx:saG5ak8D3VeP6YXL2alaa42TX2wWjfa7Fz6hXDT22Jrv8XuC086QrQ>
    <xmx:saG5av9qZb1BzrusgZVn9CsdAWQ5SHRlfz2jIC8qnkNopYN1xPuEVQ>
    <xmx:saG5aoiZMn3ZtERKnj11o2ei6Uw4dcvpXv0JULfF9gOcQH-H2MfiY7OC>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Sep 2026 19:07:28 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] firewire: cdev: use atomic_t for iso_resource_auto todo member
Date: Mon, 28 Sep 2026 08:07:23 +0900
Message-ID: <20260927230724.119305-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927230724.119305-1-o-takashi@sakamocchi.jp>
References: <20260927230724.119305-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The transition state of an iso_resource_auto client resource has no
effect on the client, so the client-level lock is not suitable for
protecting it.

At present, this state is the only member that requires mutual
exclusion. Adding a separate lock for it would be excessive.

Change the type of the transition state to atomic_t and use an atomic
compare-and-swap operation to preserve consistency.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index a62df9034f4f..d4c72cd20069 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -133,16 +133,17 @@ struct iso_resource_params {
 	s32 bandwidth;
 };
 
+enum {
+	ISO_RES_AUTO_ALLOC,
+	ISO_RES_AUTO_REALLOC,
+	ISO_RES_AUTO_DEALLOC,
+};
+
 struct iso_resource_auto {
 	struct client_resource resource;
 	struct client *client;
-	/* Schedule work and access todo only with client->lock held. */
 	struct delayed_work work;
-	enum {
-		ISO_RES_AUTO_ALLOC,
-		ISO_RES_AUTO_REALLOC,
-		ISO_RES_AUTO_DEALLOC,
-	} todo;
+	atomic_t todo; // one of ISO_RES_AUTO_XXX.
 	int generation;
 	struct iso_resource_params params;
 	struct iso_resource_event *e_alloc, *e_dealloc;
@@ -1338,16 +1339,14 @@ static void iso_resource_auto_work(struct work_struct *work)
 	struct iso_resource_auto *r = from_work(r, work, work.work);
 	struct client *client = r->client;
 	unsigned long index = r->resource.handle;
-	int channel, bandwidth, todo;
+	int channel, bandwidth;
 	bool free;
 
 	u64 reset_jiffies = client->device->card->reset_jiffies;
 	int current_generation = client->device->generation;
 
 	int resource_generation = xchg(&r->generation, current_generation); // But no need to be atomic.
-
-	scoped_guard(spinlock_irq, &client->lock)
-		todo = r->todo;
+	int todo = atomic_read(&r->todo);
 
 	switch (todo) {
 	case ISO_RES_AUTO_ALLOC:
@@ -1404,12 +1403,10 @@ static void iso_resource_auto_work(struct work_struct *work)
 			// Notify the userspace client of the failure through a deallocation event.
 			e = xchg(&r->e_dealloc, NULL); // But no need to be atomic.
 		} else {
-			// Transit from allocation to reallocation, except if the client requested
-			// deallocation in the meantime.
-			scoped_guard(spinlock_irq,  &client->lock) {
-				if (r->todo == ISO_RES_AUTO_ALLOC)
-					r->todo = ISO_RES_AUTO_REALLOC;
-			}
+			// Transit from allocation to reallocation. Use compare-and-swap atomic
+			// operation because the todo member can be set with ISO_RES_AUTO_DEALLOC
+			// by release_iso_resource_auto() in parallel.
+			atomic_cmpxchg_relaxed(&r->todo, ISO_RES_AUTO_ALLOC, ISO_RES_AUTO_REALLOC);
 
 			if (channel >= 0)
 				r->params.channels_mask = BIT_ULL(channel);
@@ -1440,9 +1437,7 @@ static void release_iso_resource_auto(struct client *client, struct client_resou
 {
 	struct iso_resource_auto *r = to_iso_resource_auto(resource);
 
-	guard(spinlock_irq)(&client->lock);
-
-	r->todo = ISO_RES_AUTO_DEALLOC;
+	atomic_set(&r->todo, ISO_RES_AUTO_DEALLOC);
 	schedule_iso_resource_auto(r, 0);
 }
 
@@ -1463,7 +1458,7 @@ static int ioctl_allocate_iso_resource(struct client *client, union ioctl_arg *a
 
 	INIT_DELAYED_WORK(&r->work, iso_resource_auto_work);
 	r->client	= client;
-	r->todo		= ISO_RES_AUTO_ALLOC;
+	atomic_set(&r->todo, ISO_RES_AUTO_ALLOC);
 	r->e_alloc	= e1;
 	r->e_dealloc	= e2;
 
-- 
2.53.0

