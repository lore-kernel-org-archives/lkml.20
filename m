Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2774C221D89
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790480632; cv=none; b=JmqlogvqmS08UclbrR+RfSRzUqOcYnhu8V/w26OJJpR2vQDZX/0nCcoTmU+xscFvd6InlhyZIQ5MX5cHQJgx7aCD6H73gy7kGSxS88DqTVyNPa77im7jYmGeiv8l9SEFZzazuFyQIX+2nnsR0gZXxTdp99WN0ILTDxpyJ4DF4Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790480632; c=relaxed/simple;
	bh=WW0NMh2nEYzrNldJSlvau3hbd0H/5f4+R38mz6SpP6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F4hfVMJB2apHdM95rs031nGXazk4oukjWwKD97Sq2LpVPDH7YwNPpTJXpmnT0pN5b00AhRyfWcDE9wiell1A+VAlFgyhROtVLfy3O7jq8LQ6tCFk0sTYu/kNwG68cNaouFLgoWmKL2DhrKWBhS7cKeCAnThG6nSc5TJ1nvZXXqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=FKUTQS0W; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K39JOe5b; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="FKUTQS0W";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K39JOe5b"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 51BC67A0082;
	Sat, 26 Sep 2026 23:43:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sat, 26 Sep 2026 23:43:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790480629; x=
	1790567029; bh=Ljlt2JU7jsLYCSGsnuCtUfCucQcw8stH69anz5/NzcA=; b=F
	KUTQS0WIg86p8JEXt4DgMTPjKH4wrKp1XmtK7Ua8pyyNGyN4huuKMtI/K5fmI1CN
	Bb7r+ZLhNGr6d80GJ3k7YR4EuaGizyLp2/ymFLPbYmAV/jNPb+dgIQ9YitYLvIgU
	T9jAZL/ODkdlAgjGpPC7JxN1mNMoSzWlfrnI/2gVPvmqGOgMLwlxPtdaxFFklCzZ
	emxYmoKX0fC2ctOSIeG5eO7l6B7ZCt1afHr+SJ/CzNUJ96yxBcTjnV7Ps3js5VhC
	IgR4thalohtaTU5JM5QRBi6biF8SyGooqunX/RW9DO2WWNFZrEB2jtghli/ZYkUh
	Lm8DDUSEJuPdWECWDgVgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790480629; x=1790567029; bh=L
	jlt2JU7jsLYCSGsnuCtUfCucQcw8stH69anz5/NzcA=; b=K39JOe5b6lFd6rGGJ
	cY8z30PzfqrXTksu0RWp14fdq3F9TY0B/9k6UcEt+a+QJ7li2I7IbwlfqPSgnKfn
	wyoEpI0fhttRYmxiQTeAW0K38C7EB4LhEltf2nlG8HY48b7HDWAKu0KNbqS6jWOK
	yU4bJkL6KHG4+W297oXuD9VWC5rbvfGqNTHzBgdMCTQNqjEYrqkoIdI431PFRstT
	0wU3zFTMYNoWRvLtMDiaoTAhar76VLoc78NGvsRx+OAsVmg4EAXu+Dny0RzAB6QO
	QX0ScsRF8JLKE5HJSpao3rV1wDPXfPj32B7xTdGkQRTBHGO+mpFJy4gBXB4P/QJO
	jEY6g==
X-ME-Sender: <xms:9ZC4amB8G0p7pllTLDVYYrlz7IcdXUzX0eKT6JYkUIwj2xjApTV4CA>
    <xme:9ZC4aud9zE_INgOY8TQukh6AMdvDrofINsaSK8YhKwUlPqaut5aJcJ0Dblowz3Xbc
    Tz4S3X6kUIs4QQP699pGL9inoYGTxo7KE_l_zXNnTkEHx2Dj8vwemo1>
X-ME-Received: <xmr:9ZC4ahKj6f-NP2IIaVIWnQqbv0XDrwW7UhzVlMqW7dURvLMocNzaWzTVR8lJKmvd5ZPmQhiP4_cYgBbNuzY6UiCtO6_Lv1nPJDsDtRSVSkP6Bg>
X-ME-Proxy-Cause: dmFkZTG4lT+eM/OUaCtoOYl/DyUmH6k9tq2VXzXC6mU+ZYl7CZZM+W0Br08Wif/3GBhDGp
    Em4hgAA9CUxyaNCqjaf/KtpIj1FEra4TRF29/NV/1S/y8EdHxPX88wYIaOiyDaa9NsBS5F
    +kvM1s44usrbRXVosvr7ETxX9g93L4NxUaiU6cXY08Lahq8sSjR6uinvDlZx12z/3pYizG
    V9zoLoiI3hYwl80Vv2me32vNfTt8/rRjnCTmT0nnPtU/WmBF9G8s8gMxryfkaCaDrerzaa
    bG5jinsMyQMBeDmNJGPF/S+Q9VsUgSIiUjYX/kygT771dTS82A003V47AUYrh8PeGKXPqk
    yPH/cEphXTwCOLCWL/cK1j/04MOV8Lqe6qLW7aYw/kbDNqcR9d2QIcY0ker2x5hhjUBBJY
    kHFVXsZueoXOtjqa4HHzRO0+SwAU2J7Y3b3f5X/ZfREOByTBtpS9Oedy3XC53cnE4+gEA9
    vBxPNuVewFFluqu44Yehi2ty3VJVK6qaUKdGh1xImWFxqcDVMZxANV03NC+v0nI/Wi7WUv
    2R42VUMeETnh9H3TAPtoZOTgE84H1N3s1+ce+OlqyEGlS60Vv9HCBz5pqZ4vmWUOcNQRZo
    4mYr8BqtVWYGZ17ytL0WjGMND5Cw9CquEZC6vezD7ENmiZsAO1Te0AI44/2w
X-ME-Proxy: <xmx:9ZC4aheGLG2XcGiQsKnIx1J2p-_BawslNcGtusUt_219V-uk6RGo_A>
    <xmx:9ZC4ao10NueR6oV62L6EMIDDr6f27LNWzN-kpjH-vEFQPa_5a5bt6g>
    <xmx:9ZC4aqhFtMjM53cSgKqkPdJIj2P5GBFZawURF1HSS0BOl7tNQlndAA>
    <xmx:9ZC4auSgtIahQWYfwotAvxWpvaCE1ax3eK-dcmJioBrL9OYZSML9rA>
    <xmx:9ZC4av1fl1--f-ZMNr5zHSlJ2r4L3mNn1GlCCz5up7ZLsQCxuxd1ZtWm>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Sep 2026 23:43:48 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] firewire: cdev: remove unnecessary client locking for fw_device members
Date: Sun, 27 Sep 2026 12:43:40 +0900
Message-ID: <20260927034343.28076-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927034343.28076-1-o-takashi@sakamocchi.jp>
References: <20260927034343.28076-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some accesses to fw_device members unnecessarily use the client-level
lock. Remove the locking from these accesses.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index a626468b4b0f..5020895c42a0 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -1350,17 +1350,17 @@ static void iso_resource_auto_work(struct work_struct *work)
 	struct iso_resource_auto *r = from_work(r, work, work.work);
 	struct client *client = r->client;
 	unsigned long index = r->resource.handle;
-	int current_generation, resource_generation, channel, bandwidth, todo;
-	u64 reset_jiffies;
+	int channel, bandwidth, todo;
 	bool free;
 
-	scoped_guard(spinlock_irq, &client->lock) {
-		reset_jiffies = client->device->card->reset_jiffies;
-		current_generation = client->device->generation;
-		resource_generation = r->generation;
-		r->generation = current_generation;
+	u64 reset_jiffies = client->device->card->reset_jiffies;
+	int current_generation = client->device->generation;
+
+	int resource_generation = r->generation;
+	r->generation = current_generation;
+
+	scoped_guard(spinlock_irq, &client->lock)
 		todo = r->todo;
-	}
 
 	switch (todo) {
 	case ISO_RES_AUTO_ALLOC:
@@ -1514,12 +1514,10 @@ static void iso_resource_once_work(struct work_struct *work)
 	struct iso_resource_once *r = from_work(r, work, work);
 	struct client *client = r->client;
 	struct iso_resource_event *e = r->event;
-	int generation, channel, bandwidth;
-
-	scoped_guard(spinlock_irq, &client->lock)
-		generation = client->device->generation;
+	int channel;
 
-	bandwidth = r->params.bandwidth;
+	int generation = client->device->generation;
+	int bandwidth = r->params.bandwidth;
 
 	fw_iso_resource_manage(client->device->card, generation, r->params.channels_mask, &channel,
 			       &bandwidth, r->todo == ISO_RES_ONCE_ALLOC);
-- 
2.53.0

