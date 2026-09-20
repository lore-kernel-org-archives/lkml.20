Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5683C3EB11E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893432; cv=none; b=mcc200bOJPWidqsA7HxseZGZFkIFMpzwxANnkGfBu7zieb5dSyyq2oOwzhdfbc1vrdw2F/C8YtMnH7ei6G7Ij3SGMD1AfExpJ/oFAZg6vxcSiJlKqil5lYgWiT+R0UEzQp/+JmF91t74He863DWUnKHy7GvVaFVn/hOF4Nrc46Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893432; c=relaxed/simple;
	bh=fmQ6ysc7Xbj1vliQBlI58xrobsoFTbCujENj+aYq+34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JU//t+FMpYpC+q+tikMoW5wG9JoFYJwNCERPHMeBvzuVPUOKzuEFfecdLJDx8Jm/YiIY50MO3NLqTa5wd46OKX8M2W10NEj/Je2jhywcfwif0CMq2Eevs1KMXcU1+3NYTqF6B36E10gkSefPsmUV36T7wNTsdWf7HJPCXlVA7Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=zIg9uiMe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K7TMDB4E; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="zIg9uiMe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K7TMDB4E"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9DFCA7A00DB;
	Sun, 20 Sep 2026 04:37:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 20 Sep 2026 04:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789893430; x=
	1789979830; bh=aXQn+TbFQYfY2jiDrw3I5nfsLGzeJpOmHRGGQvTsGyw=; b=z
	Ig9uiMeCagDmlW+9D+Ws7C+ed1VTfTaH4tf7M1TLqHqic6enCxydchnIo5wU8ABO
	8Yo7f2vfZC+qKkuvkTZwc0vE1vmAwpa2WLD1t6/XxJMiTjvf4oaK/t0OSkMNogg9
	/oI7kjK9OrBV9MpPhto2vIAR8r1xlqbaBPZrLfzOog8OZ1uv/CrOBWzfkOYf9xLp
	frNDbvqEcDo1L5kK99wfs8hjsAZDtBADpjGKDzfu8VPUaubTuWstBqMFyKAB94xe
	qDY6C0nj30HFPROwHDSPUyWfHTvm3b3o5ixcrJPf9r/mM915mqh3ZJngv3baln9d
	vvPeUSAOCdhj8oaj0+oCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789893430; x=1789979830; bh=a
	XQn+TbFQYfY2jiDrw3I5nfsLGzeJpOmHRGGQvTsGyw=; b=K7TMDB4ESIPV+2fMF
	fvbMwTkvumfocREfeMn7iH1u/6/3pl+lzaKRyK6vxcxOd1lCqGf/Gj85ltCEJstX
	J+hQih3oAJefQfzFMIrIjvpWUpCaZpqLmeuNELO2jwh3cWp/+DY0BogiMx+9LJTb
	mpdVQr2OSLzN4vlccl8fsKJaj9HBKJT/LMw1cUerhyUsdNYZhiyNoE9B++r/Mswy
	IxFycMECWACOqIYeLd0Z3cQhEFVTnVYq6PJVskIGK2WYHzAWhj0T6vSbKduga04f
	a2pr+wx8wyjc7qeEAjIYNGS03MIdkxPkBRKEvQatA17Ej1m2qIG/+OFNdzgjMMpa
	u9jDw==
X-ME-Sender: <xms:NpuvatlrvxYJpfCWl4Afqxsz8VqbLae1t4wkaTXoEVsq6T7aAcEWBg>
    <xme:NpuvamwqTGyEZ06UOuaQqATBIFRsAZxgVRsrp0V9x_PjPcEzTl3Omseg0AzW7MIcA
    tFtc0yIh5-CEHWtQN7IXN4wu6f--akjKP4KHEFN0WbPV_2yimFBZkI>
X-ME-Received: <xmr:NpuvarOV4TcPa8Or5PV6F1L-nLQHno3B0lxheVyJ0NSN29CjuJyBRHbl6aAQ5hRx_8Zcora5cJVNLZ_HLDkTu4Pk-uGwiRLLHkxOGi-c58KDvA>
X-ME-Proxy-Cause: dmFkZTGDk/LFpyNUjatZXtdF1Ol4AzGXx/XJJ00P2lEzdhwaC2OHMWKjSTTwzDV54eA+X9
    hZWqO2Pt/aL/IC2w3tQSr/WTF4eOkuQx9cqr/0YQjP0U9qRxKTeqqjpjHmtjKI87XBl9+k
    lkd5l3xFN7T6QNoFdRqVZKYZ1HWzIwBUYfdAsZeZatUOA0ZPe1QtaXNtpb/kZMyNG2cCW0
    AkYYFkNOpR9jWdo4iKO92TpJWkC9Ldvc/R2dYRYBWP9D0fI6R6CxUwbd23p5Y6XPLXkugf
    TZapV8K2F20wWYZVer0gd5Qw3eZniou/ncwHg8BB5HxRPprNSXyj1Vu1JJpcJt8AGbY0BB
    iu5xx4ODEyqppim5bOlYBvPB3rpWJNtZITwW5Qq2HfwD6Lq01Fw4YNK2uI+9XtA19DldpT
    pHSsmyJ3fJ1DmLBf5V2NZk/Yh7DoEq6evD/CEWv8pZhaVuHWOLSRwMFW0HSC6BY9S4Oka4
    nuE5Ykf8GXp4NQ4dANfhOrWeI7rfIiXvZDjJwscHKLJihvi7y//OOEDwSrKcqXm3jcLZyI
    x5LdeCQUcDx3FfmapE3mctNCo/hf+XUwMaLjpXw2c1LerxEb+DFpv1BXcJvm5nu0l8Card
    itezceOd52tj9QhPbb0wThdEvGp7U8rgLKRuUWKDs6avyurvuq254SbL2Xcw
X-ME-Proxy: <xmx:NpuvaqR6J1ABKkzqvLQNFfejsBN-OzC4N8p65YxI28CoUwQxw7QJHw>
    <xmx:NpuvapZCw7uCE1m6Bsup-0JHBNYZ9JHkCA1cIXV_GHN6sKXysvSf3A>
    <xmx:Npuvan0VEIjnoV1Mu2D7u_FPKRtsiKjmnAFJCMugrpLB8e09uBvdyA>
    <xmx:NpuvapV84csWu4H-ldrROjqdysDef5R83zOKR3Mi3ftn75BFix9HEQ>
    <xmx:Npuvav6X1TezGO58myCT5Jc17mvVQZVDig-dU9HGzIrln_GWVP3wcA-I>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 04:37:09 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] firewire: cdev: refactor add_client_resource() to have release callback function
Date: Sun, 20 Sep 2026 17:36:59 +0900
Message-ID: <20260920083659.191855-6-o-takashi@sakamocchi.jp>
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

The implementation of the client_resource structure now requires a release
callback.

Add an argument to add_client_resource() for the release callback.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 96f3619237f3..9a471307aa5d 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -539,7 +539,8 @@ static int ioctl_get_info(struct client *client, union ioctl_arg *arg)
 	return 0;
 }
 
-static int add_client_resource(struct client *client, struct client_resource *resource)
+static int add_client_resource(struct client *client, struct client_resource *resource,
+			       client_resource_release_fn_t release)
 {
 	scoped_guard(spinlock_irqsave, &client->lock) {
 		u32 index;
@@ -553,6 +554,7 @@ static int add_client_resource(struct client *client, struct client_resource *re
 			return ret;
 
 		resource->handle = index;
+		resource->release = release;
 		client_get(client);
 	}
 
@@ -697,8 +699,7 @@ static int init_request(struct client *client,
 		goto failed;
 	}
 
-	e->r.resource.release = release_transaction;
-	ret = add_client_resource(client, &e->r.resource);
+	ret = add_client_resource(client, &e->r.resource, release_transaction);
 	if (ret < 0)
 		goto failed;
 
@@ -781,8 +782,7 @@ static void handle_request(struct fw_card *card, struct fw_request *request,
 	r->data    = payload;
 	r->length  = length;
 
-	r->resource.release = release_request;
-	ret = add_client_resource(handler->client, &r->resource);
+	ret = add_client_resource(handler->client, &r->resource, release_request);
 	if (ret < 0)
 		goto failed;
 
@@ -885,8 +885,7 @@ static int ioctl_allocate(struct client *client, union ioctl_arg *arg)
 	}
 	a->offset = r->handler.offset;
 
-	r->resource.release = release_address_handler;
-	ret = add_client_resource(client, &r->resource);
+	ret = add_client_resource(client, &r->resource, release_address_handler);
 	if (ret < 0) {
 		release_address_handler(client, &r->resource);
 		return ret;
@@ -985,8 +984,7 @@ static int ioctl_add_descriptor(struct client *client, union ioctl_arg *arg)
 	if (ret < 0)
 		goto failed;
 
-	r->resource.release = release_descriptor;
-	ret = add_client_resource(client, &r->resource);
+	ret = add_client_resource(client, &r->resource, release_descriptor);
 	if (ret < 0) {
 		fw_core_remove_descriptor(&r->descriptor);
 		goto failed;
@@ -1471,8 +1469,7 @@ static int ioctl_allocate_iso_resource(struct client *client, union ioctl_arg *a
 	e2->iso_resource.closure = request->closure;
 	e2->iso_resource.type = FW_CDEV_EVENT_ISO_RESOURCE_DEALLOCATED;
 
-	r->resource.release = release_iso_resource_auto;
-	err = add_client_resource(client, &r->resource);
+	err = add_client_resource(client, &r->resource, release_iso_resource_auto);
 	if (err < 0)
 		return err;
 	request->handle = r->resource.handle;
-- 
2.53.0

