Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4F63DE457
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888515; cv=none; b=KnggsMohXefxhItCV8MPKkD1KKZ4+WuNQNQ71WUC0jF3HPIimHKQJ0jX07cxWuJ3/YImrq33Cwr8Wvpoi02j7xznHvLzKeFz4I7az/4q6j0oUM36lZhi/mjPNmtWjk93GliKo+GEhjQVc02Y6FZHEqbZBSnSzY3+gK8xDRxZQJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888515; c=relaxed/simple;
	bh=mhjWhChiuAnCZR8l5HgOJ/bB1pv2SGyopst0H57wIjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eHv+feRgL3vbfM1RrPgz5eU450HGLpE9RhSGa9sV+nQyzESjQ+cPuFk7lyiClCicVsbDvEYo1/k/H5UKQ/vjPMZ0ada3hCGrLJtHKMz5djjqDTk15iJwasJisDqCHmKbnntoa33cOnys6yfjB0UNlX38Pnp9wAz0sCy4hzIiklc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=crd6HPeX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=etqfXTHE; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="crd6HPeX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="etqfXTHE"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 115F67A008A;
	Sun, 20 Sep 2026 03:15:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 20 Sep 2026 03:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789888511; x=
	1789974911; bh=qYOw4ltOaLVIkhzvnpDdus7nC9MYXWuokkGw46VSc3k=; b=c
	rd6HPeXRDIZT+oj5SG35UhqX12QN6WB6OL2jZo1CsALts6HlBroJOvQXrWyolQ3J
	h/mVuP+5tXTLkZZrJ2GIwZiR5hZuR6x6C7egz4IJmoRuadfofj1jmhOjzwr8z0W4
	RgZbesruN4XXIbHq/KYfKyUEBz9QcpXKzSczoQEUr53wI77jZ8rH193qiB9SJVyQ
	gE0oH713QnaMYmW/dtDaEGpAvZWGB2lvGLCdTdYG9g01o8CKbkuWR80+94w811mt
	wfD7o+jnQ8IwnFk+y1go5tSuNOu9Fu6+eMSsBuutjL8GXngZMYNZr/W3hMzlu3vM
	8Mk3exsB41+R8+eA1GR7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789888511; x=1789974911; bh=q
	YOw4ltOaLVIkhzvnpDdus7nC9MYXWuokkGw46VSc3k=; b=etqfXTHEXdv1yKCQ2
	I2oK2x06eDj+XSzP8Tw3KUmJBw9MHvbuwPkfmK9tI9ntX5AD73GdutHtV2DDBcpW
	/0S0wToIg0XxWm4YJRYCK+rkvsUprJNRk4Y+DeyLj+cBgpkv78XLbP0dtY5//nSq
	cY05egnI6eRThOednzC+7v27wtOrB62Mz9UKO/0L3mZ375XTj4EqwGG1BS2NNUaw
	ImQ75RL3t7SkRRe9DMx+vLSmYCjgAeT9uSFCWPmp3xssn07WdSJxZWB5pI3IdtuZ
	DLGqWpBTDoUl8lG7fb3LNjeNWUODfGJL3xuTzGn4TBaiBOPg2eecq4dVjwneExHf
	BwA3A==
X-ME-Sender: <xms:_4evamCf_l7iRJ7D3ZASPuPV4NuCPMSkB-xGFyxgNW3Efn_ZVqB83g>
    <xme:_4evaudk9InlswiJfOZxP3Q7tn83fwi_AdTdYKj9UBRiTqvFtBMI-lMnFqfS-jid-
    PkBZixKpBQ9y9QoVxhyCSvxkYAOtZ_pOI-Wkm9v3fTfH9TiARAfv8c>
X-ME-Received: <xmr:_4evahL-cJDUuOQFb3qUblgtmCiRCIixmI-ysYi6pJp5jVwKlXh3BxwdFXTkUZHi8yTe2zbtON_N5AVedzZP5h5uEwAHGylTQ8uLUV1_9BS1jg>
X-ME-Proxy-Cause: dmFkZTGyn/xqJvXtDE0aXPg7VTWwa6ZytMhAGR7nxGfLocNGHdWz0wX8vkRz8WdekLHOxF
    ueygXEtIzUz+6+8Nu5jOylzMouJEEmUtyHAiF3hAv/PQOii+fQIaA16F9rGbK5eIj+gHX2
    7oWQRylPS9prm6P0pulDgCxjr7FHQNIloAyG1sC2/WA+6SlZoZfvrwyAbbTgLETU6XAsrH
    oSG/gVQ4B96IyAbe0lc8e/7OyBZYZjJJI2xl3NT5AIvarGgLVxYLAZiD4NlCbAozg+Dur+
    szvikqwlwyyPnE8AnV3AbHNmxlz1ORsNjtHjAvxgWdsXLx1vkCYM0HOOrP6u1ZYIqTWEcJ
    rIGUQYZZOhQJxrrhoEQ9mSNcjNAnBHOc+d4gDEve6WXyV9ZwlZXyHZw55i4WlJJgS6Utt8
    4/LMep/3RGmYU3FacZLVXUkcOvSThTNwItEg99yFjWUhsMTFra9eCc4lyWqTbpUb35084x
    r16c9LPw3SCfRVGSLltCOQUyCXviDLlEalM3RecML9or3EDDSQbUOrNVsHBN73LQwR1/ZI
    7odFrjA6+V7xcKXz2zcZcWgRE4Hmbr9G0ywHOjIymWGV+BSyE7Sla+Uu1DMNrk+mEChR3t
    LB6k1cE8R9ULwN13Ll7ObuG3Y5GD+9W5LpWPtXebcHhDejz2aogXvHDvRVYA
X-ME-Proxy: <xmx:_4evahdFkHZjWRKfJk7yYtiThVCVBVchkKK3oWFiJ1O9mVIH5Z8HvA>
    <xmx:_4evao3HSJijjChG0_zQfHTKWUVTN5hLkdILC-gatcof4t_c-OapDA>
    <xmx:_4evaqicEygUe05gzVLSgwkayCF-elQnAv3A8nsWovF97pKGkmpJfg>
    <xmx:_4evauSrdv4If_cIkSzNE9yhtAk22_ak0irR9ZDlbVYdiRtDDe5-8A>
    <xmx:_4evav3a82Iw96vaRA5NO6BuOotCKN8DMwPg3KT4HNO9_GzW4w-WLB8J>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 03:15:10 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] firewire: cdev: add annotations and comments about race condition of bus_reset_closure
Date: Sun, 20 Sep 2026 16:15:00 +0900
Message-ID: <20260920071501.77785-5-o-takashi@sakamocchi.jp>
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

There is a race condition involving the bus_reset_closure member of the
fw_cdev_event_bus_reset structure, which was addressed by commit
93b37905f70 ("firewire: cdev: prevent race between first get_info ioctl
and bus reset event queuing").

Add code comments and annotations to document it.
---
 drivers/firewire/core-cdev.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 25590580b993..50c675113d5c 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -398,7 +398,12 @@ static ssize_t fw_device_op_read(struct file *file, char __user *buffer,
 
 static void fill_bus_reset_event(struct fw_cdev_event_bus_reset *event,
 				 struct client *client)
+__must_hold(&client->device->client_list_mutex)
 {
+	lockdep_assert_held(&client->device->client_list_mutex);
+
+	// This member is related to the above mutex. In detail, see 93b37905f70 ("firewire: cdev:
+	// prevent race between first get_info ioctl and bus reset event queuing").
 	event->closure	     = client->bus_reset_closure;
 	event->type          = FW_CDEV_EVENT_BUS_RESET;
 
@@ -508,6 +513,9 @@ static int ioctl_get_info(struct client *client, union ioctl_arg *arg)
 	}
 
 	scoped_guard(mutex, &client->device->client_list_mutex) {
+		// Coordinate concurrent access to this member with bus reset event handling, see
+		// 93b37905f70 ("firewire: cdev: prevent race between first get_info ioctl and bus
+		// reset event queuing").
 		client->bus_reset_closure = a->bus_reset_closure;
 
 		if (a->bus_reset != 0) {
-- 
2.53.0

