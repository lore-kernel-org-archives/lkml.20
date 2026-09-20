Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EF33EA95F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893431; cv=none; b=qjjq/VAuV2LOzoYHidziVbRw5sd1NxDW00X9YmeUm4mtEL3oqbwd8tJCOD3UVtLl6NL+8o90vXmKPdKXEmpvbvsCum874Y6PZg5RXKiW9985iRk2/zRP3gkKcOyoDZg6jB2WJhuEsgBCMtWgijGJ2WK9vuqsiGnnaLXiyJpmwdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893431; c=relaxed/simple;
	bh=8CeiRuUE3FtydE+zSX9+E/c+kLjyfN4rvhsEAqt6c/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jEd3WvR1YLErBxyVwZxS0WFOMGo43v6MJLkB6PMiPyXRbFveTkzo+Y7+4d+WwKSjs5p+ZNZD1XLw1ZVZydkniwwnfXXHvTe5+aXwtn4Si8tZ0B/jpLylqGd9tMy5Zz+AuBc8l05XaVlc9MvK9sOGznlgkoHnwx2osHlMGDInYLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=68r23A5z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mSbFu5Ax; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="68r23A5z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mSbFu5Ax"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 39C007A00E5;
	Sun, 20 Sep 2026 04:37:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sun, 20 Sep 2026 04:37:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789893429; x=
	1789979829; bh=6V8530ncLv8BVsoW9DHISr7rI7cVxvWwAxCY4nqRh8E=; b=6
	8r23A5zpu3hDiuv4ENl8w+MMVlsSGGWw5iZz4Gp2Bqh3BxQCC/CKdhuPqAZnOtCY
	p6qRebZ6NDmzboRAm7SwGKHpG5l4szKulCVkFj1AVV+Cc+pou/aRm0CJHSHPy9un
	OmxHJQZUOt2iiHQrdCvhVsXYJxqtO4DH2V3hRWfJlpCl9FMtH6Vp0bPQ2xoGHD8W
	pp58bsv7nMkj5AJYbRP5M5TG1cnqdKOUTu0IwyNHz/Hc6CrbfFstPbJHcvT7YwGX
	bKCL7OVILYQt39Kcze9WE894kxR+JSMDGiw4P+OokydcKg9PDCuLo7g8SA5IahHm
	zNmqS8L0Vze4zXVQjnGCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789893429; x=1789979829; bh=6
	V8530ncLv8BVsoW9DHISr7rI7cVxvWwAxCY4nqRh8E=; b=mSbFu5AxRGsAzAKcy
	2hJYyPsqMrhk2jmAo2e71Hz797UvJcvBOblNUBLEqH5QxWv1Myx+tRMTuhosFlme
	XpmoVNXGpiyMrC9vC31HNg926PM4+SITHnQmWKJpV611gwg3OUii2sJrj3UoMJ+6
	21m1V8UwuEdvl+/PBnHE5Qc5ybqtErBSQJAevGxlTMAtaqa2gkP3Pi+y0/fbNfg5
	DoHb1pYvDbZOc52THba+KYTXhlGEmJ8+NT8NOTQX4A0MLnSW54rxZA8xRtrTyMQC
	mpSJa1qPYQn2AVaOs/TXvMuNmgw3uCIq3tBJ26n3uh0ok66Iqlg0RT2qI5IAdCmk
	PmUDw==
X-ME-Sender: <xms:NZuvap3B0IMNiWvWeW4e5C0g81-XHKgTJlIRu9znnD1R5QWQBEzpTw>
    <xme:NZuvauDGa3jvMdvrOCsv8CawPDXAkCf-SLQRBNZ9hnFuwtGQFoSEepJOc-Yztv_Ft
    S7Y8PUmTuwNFtb0_8khonFQDMXNnqoBrLTBMacYZFirKqxKI0z7QRGH>
X-ME-Received: <xmr:NZuvahdr15pZXbRw24JQBz5B1qcGIjL9Mk2IqAMaC5LQlK8qDRR9qLCc1Y2iTAXbqIKUBhSJb8T3FPH3agQ0LKxL_hjeQb5rNfyN3B7WLdYE_g>
X-ME-Proxy-Cause: dmFkZTGDk/LFpyNUjatZXtdF1Ol4AzGXx/XJJ00P2lEzdhwaC2OHMWKjSTTwzDV54eA+X9
    hZWqO2Pt/aL/IC2w3tQSr/WTF4eOkuQx9cqr/0YQjP0U9qRxKTeqqjpjHmtjKI87XBl9+k
    lkd5l3xFN7T6QNoFdRqVZKYZ1HWzIwBUYfdAsZeZatUOA0ZPe1QtaXNtpb/kZMyNG2cCW0
    AkYYFkNOpR9jWdo4iKO92TpJWkC9Ldvc/R2dYRYBWP9D0fI6R6CxUwbd23p5Y6XPLXkugf
    TZapV8K2F20wWYZVer0gd5Qw3eZniou/ncwHg8BB5HxRPprNSXyj1Vu1JJpcJt8AGbY0Di
    7HWCwVZ3h7On5h8k0dkOsJMVZI5GK2NEbNGV05/H047GkHaYsEFyWRZDj3JhpVaoYKJlhT
    Z0RWrL12ztlmjNNjcppFi/tmPDoe63hD1VUOYrHbC24D9F/h8q4DlWQ7dZ/ruN+kZvwoB0
    CHTFw0v5tgxwBxoRsYu8XKA/y7l+4yWMeqY+pzL6pL4GMkbeuf9g+8lqNwEG6ZRUEJZkDh
    f9Tz8oyEf9xL98zga6fvzd7gmyubnOMMzg/erk+5IMtmyOPJWv17ceYftm97YoAngnTR0Y
    HeoCuQ3OB57ORU2Xk6adHbD2anEuuxA1UN7NF67cgnVzJ8T/dRcCAlizhKqA
X-ME-Proxy: <xmx:NZuvajguu8Cx991e5q2PZjbaeYC1PPV7AkQV5xPs04SZ4rTwPVFJTw>
    <xmx:NZuvapqwbUKlWslOTOgRRp7VVN1lcA3oLUHk9DvuTS8EGuFMieNj1g>
    <xmx:NZuvajGFKOEOgqsIZYDSkVFe7kinlzymTHiVD8rgBz3eAYPNmLOgMQ>
    <xmx:NZuvajnElMFFxUBUXgtKujxGqKKu1qwFjasctJKZGB_6f43mXvm6tw>
    <xmx:NZuvauJ2di7Dkip1sqyDLt1R3ptAp7DM3pFf8-rZZl65DjuJYlitbCKz>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 04:37:08 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] firewire: cdev: refactor add_client_resource() to drop GFP flags argument
Date: Sun, 20 Sep 2026 17:36:58 +0900
Message-ID: <20260920083659.191855-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920083659.191855-1-o-takashi@sakamocchi.jp>
References: <20260920083659.191855-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The add_client_resource() function has an argument for GFP flags. The
argument was originally used to distinguish atomic calls. However, all
callers now use GFP_KERNEL.

Drop the unused argument and always allocate with GFP_KERNEL.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 625792b6ab71..96f3619237f3 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -539,8 +539,7 @@ static int ioctl_get_info(struct client *client, union ioctl_arg *arg)
 	return 0;
 }
 
-static int add_client_resource(struct client *client, struct client_resource *resource,
-			       gfp_t gfp_mask)
+static int add_client_resource(struct client *client, struct client_resource *resource)
 {
 	scoped_guard(spinlock_irqsave, &client->lock) {
 		u32 index;
@@ -549,13 +548,7 @@ static int add_client_resource(struct client *client, struct client_resource *re
 		if (client->in_shutdown)
 			return  -ECANCELED;
 
-		if (gfpflags_allow_blocking(gfp_mask)) {
-			ret = xa_alloc(&client->resource_xa, &index, resource, xa_limit_32b,
-				       GFP_NOWAIT);
-		} else {
-			ret = xa_alloc_bh(&client->resource_xa, &index, resource,
-					  xa_limit_32b, GFP_NOWAIT);
-		}
+		ret = xa_alloc(&client->resource_xa, &index, resource, xa_limit_32b, GFP_KERNEL);
 		if (ret < 0)
 			return ret;
 
@@ -705,7 +698,7 @@ static int init_request(struct client *client,
 	}
 
 	e->r.resource.release = release_transaction;
-	ret = add_client_resource(client, &e->r.resource, GFP_KERNEL);
+	ret = add_client_resource(client, &e->r.resource);
 	if (ret < 0)
 		goto failed;
 
@@ -789,7 +782,7 @@ static void handle_request(struct fw_card *card, struct fw_request *request,
 	r->length  = length;
 
 	r->resource.release = release_request;
-	ret = add_client_resource(handler->client, &r->resource, GFP_KERNEL);
+	ret = add_client_resource(handler->client, &r->resource);
 	if (ret < 0)
 		goto failed;
 
@@ -893,7 +886,7 @@ static int ioctl_allocate(struct client *client, union ioctl_arg *arg)
 	a->offset = r->handler.offset;
 
 	r->resource.release = release_address_handler;
-	ret = add_client_resource(client, &r->resource, GFP_KERNEL);
+	ret = add_client_resource(client, &r->resource);
 	if (ret < 0) {
 		release_address_handler(client, &r->resource);
 		return ret;
@@ -993,7 +986,7 @@ static int ioctl_add_descriptor(struct client *client, union ioctl_arg *arg)
 		goto failed;
 
 	r->resource.release = release_descriptor;
-	ret = add_client_resource(client, &r->resource, GFP_KERNEL);
+	ret = add_client_resource(client, &r->resource);
 	if (ret < 0) {
 		fw_core_remove_descriptor(&r->descriptor);
 		goto failed;
@@ -1479,7 +1472,7 @@ static int ioctl_allocate_iso_resource(struct client *client, union ioctl_arg *a
 	e2->iso_resource.type = FW_CDEV_EVENT_ISO_RESOURCE_DEALLOCATED;
 
 	r->resource.release = release_iso_resource_auto;
-	err = add_client_resource(client, &r->resource, GFP_KERNEL);
+	err = add_client_resource(client, &r->resource);
 	if (err < 0)
 		return err;
 	request->handle = r->resource.handle;
-- 
2.53.0

