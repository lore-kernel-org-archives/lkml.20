Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817D83DB31D
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888510; cv=none; b=nZUf2crXV2nHGZfP0UnxWkxpIQAom5Dp5tBP3xUQ3C8lJYxFS7r5fdLXcDkgU3CEe4+kAB4R+tZptQCjVnAVzbRZ7v/gIyldJbzZZT3QJgmojVthZ/Wnbf/lTCNzt7NxXTpKi51TxxRiq0Zc4Q7JaZVOaUsZriQTH78OYnJqUfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888510; c=relaxed/simple;
	bh=HmVHovqaH2BWMmC0FN3oygzDg9d/5Qdk4fguOZEYDww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qobSPywRDiIrL8EpCRR++0yjRYbooEtaKJ7k5yFpD4XSqK0aERSCxs8p+XlFQjptk0gbZA0ZAa3MmlE4IQfSsP9a7U7E7WcD8zBta6CGpYN7MQqK9qs27dem3WRYcn0QCfGfNZUM16bF0/buvcUe+C6nKu/eZn9ENhF/oYpMwxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=VKtaahfY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ylr39KdW; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="VKtaahfY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ylr39KdW"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id C621A1D00142;
	Sun, 20 Sep 2026 03:15:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 20 Sep 2026 03:15:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789888507; x=
	1789974907; bh=yLiW47WDIGUjTiNv+xA9aubHfInemwuUAB8PJ3+rGcs=; b=V
	KtaahfYlOSJwL0zUGCwLduQAOGFimlT2yTCdK2JHIKmNdPNvrGMCXn/sSKGKtPGf
	+ytkBrdvOw+ZMC0O+LYbLt9rvU5J1dpiw1bTJFHqpuWlYl0rftrQB30mf0jadABx
	3Sx9rqkCdodviW8oiwvWBcMEU5sQPb55HG8CYZrmo2K28Pyd8o2r7g67vQdmAGoe
	YgTyWIvADZLDft5Ja0kW+6GQZ4zrlQiuatspl1lPo2Gbs46doqIBtOhSTfI3dg1k
	0Oe7YSnrmbbWOTdH2Yn9N6e23899+a2kuTPxtkBa0mIdgjkPZO5z4dMHQqULrtKj
	a24ftBSldd9Nt9ADX++jA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789888507; x=1789974907; bh=y
	LiW47WDIGUjTiNv+xA9aubHfInemwuUAB8PJ3+rGcs=; b=Ylr39KdW+D/krm96h
	nd/N9egkG5WQ1FUUcFYCJoucKB2ISWPQij5wUASYm6f3U+gwuEsghuQ6+/Z/aa/L
	kWIxhbEilqlkn2jFBGmzebFaRdUquwA7uxq830hjfRO6VgXyyxnhzBtswOf+MlwS
	2oqlmZEL0a5q9AG0sitDRqTiLmra6r5kKet3i47G1sexjPH9ES2wDpspYSg0Vaiz
	SalL6p4M4qCpQTAsg0UPAXKdobe3S75NuBGFTxfcU9BTWxgvHcMDj7PuaG0M+snT
	5hWeT9yk9kWOS5UAfxLVZgKLFbfAODUpu9AZBBQHqsPG2s4tlCfUI+JjLXvrv9lb
	wJrpg==
X-ME-Sender: <xms:-4evam5HB9-myRMdu6W3lMeM2fiOd7c1sKI7byZxNmjejtjllamjzQ>
    <xme:-4evat2GiOUS6Jl2bK2o55B7WJqryk-RcfO2qLkX0T98Nawad7E2p98bRxLNMvoku
    sgRRYpTDi4SjPU1joc-zD5M8Q4RQc1lFWfDIRKRQ3qxtnXeY8WlZVBJ5g>
X-ME-Received: <xmr:-4evatB3zkcfD7ONiyQuthCI8s2QWgew0E6-z5UVMRx3GEZPo7vVP6FpPv8VgkfTj23-lSh-hrt4czj7N43wagw9JuoSjGgLnbzvEuZDvXl0Ag>
X-ME-Proxy-Cause: dmFkZTGyn/xqJvXtDE0aXPg7VTWwa6ZytMhAGR7nxGfLocNGHdWz0wX8vkRz8WdekLHOxF
    ueygXEtIzUz+6+8Nu5jOylzMouJEEmUtyHAiF3hAv/PQOii+fQIaA16F9rGbK5eIj+gHX2
    7oWQRylPS9prm6P0pulDgCxjr7FHQNIloAyG1sC2/WA+6SlZoZfvrwyAbbTgLETU6XAsrH
    oSG/gVQ4B96IyAbe0lc8e/7OyBZYZjJJI2xl3NT5AIvarGgLVxYLAZiD4NlCbAozg+Dur+
    szvikqwlwyyPnE8AnV3AbHNmxlz1ORsNjtHjAvxgWdsXLx1vkCYM0HOOrP6u1ZYIqTWEhu
    oKDeBhJFZrJ7k8s9CSnZUSkS+icbgzJdPJo70lP6GBss5zWaqNxtjBbrtEkTT1ZUtWvGU8
    H/qoFqI6AzfwnyDTvgeWx6gGq9f9jjjwF18RewXuHQ6bmh8QP/DXmW+czwAP4vBjoMGfnC
    ugeWkFnhFG2a6bujeX6ppTY/RW7hLiRILPPeW6wh5D6JIUjQmMzD1lT1mP3Mz/Nx6QUbay
    Oz/Ewbsdv2KyhLINVTBhOnBBHOxENoHTbv1E+2H7jLUn5/U9DswOIctHODNM0oK4du/Frx
    xg+sH2faLfCkxW9vuaL4uaDRdurIvIkYabbA87kjIuwLf2mLUyTmz2ZPUqGA
X-ME-Proxy: <xmx:-4evav3O5YMQvsHVMREU8wFhRgms6L-x0ag36vt7jYepIuCcmoDstw>
    <xmx:-4evansiobM4IRZYvKZxxjeJhoh0HtwGi6xRgeyYeRn0nefEmzjOpw>
    <xmx:-4evav4nzGW8tQid77-Q8wMIt8i0ujP05y1uMksZoLbX1KSnPJoNZw>
    <xmx:-4evaoJDgRr2gwoYhs-7_GO7KnprAOGD91wlHOPhnyrb4Vcl7j1HEA>
    <xmx:-4evavtpf4v43ewH-t7eww6ZZrXoPvjyg7F2j6oHR97ZxVcmA49D2x_j>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 03:15:06 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] firewire: cdev: use memory barrier to access fw_device members
Date: Sun, 20 Sep 2026 16:14:57 +0900
Message-ID: <20260920071501.77785-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920071501.77785-1-o-takashi@sakamocchi.jp>
References: <20260920071501.77785-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The core code uses a read memory barrier when accessing the generation
and node_id members of the fw_device structure. It assumes that the
latest value of the former is visible to a processor core when the latest
value of the latter is visible, since these members are updated in reverse
order with a write memory barrier.

However, the function that fills the fw_cdev_event_bus_reset structure
does not follow this approach. Use a read memory barrier when accessing
these members.
---
 drivers/firewire/core-cdev.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index e49d8a58be09..9a3be1ceee2a 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -399,18 +399,21 @@ static ssize_t fw_device_op_read(struct file *file, char __user *buffer,
 static void fill_bus_reset_event(struct fw_cdev_event_bus_reset *event,
 				 struct client *client)
 {
-	struct fw_card *card = client->device->card;
-
-	guard(spinlock_irq)(&card->lock);
-
 	event->closure	     = client->bus_reset_closure;
 	event->type          = FW_CDEV_EVENT_BUS_RESET;
+
 	event->generation    = client->device->generation;
+	smp_rmb();
 	event->node_id       = client->device->node_id;
-	event->local_node_id = card->local_node->node_id;
-	event->bm_node_id    = card->bm_node_id;
-	event->irm_node_id   = card->irm_node->node_id;
-	event->root_node_id  = card->root_node->node_id;
+
+	struct fw_card *card = client->device->card;
+
+	scoped_guard(spinlock_irq, &card->lock) {
+		event->local_node_id = card->local_node->node_id;
+		event->bm_node_id    = card->bm_node_id;
+		event->irm_node_id   = card->irm_node->node_id;
+		event->root_node_id  = card->root_node->node_id;
+	}
 }
 
 static void for_each_client(struct fw_device *device,
-- 
2.53.0

