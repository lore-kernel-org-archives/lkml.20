Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29163DCDA3
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888511; cv=none; b=u3RxvrHheOdy2PSZx0h2XzPMG8yu6tJhwFL8SA/osEBIuu3v2FGLi6XhXlqe2xvx2Gbf+mtVZi8C8QZ1mZ+pFZkrAyfX3W9LimEHoDhiznQc+eA/eGU/NsebAQbleZr8qTCddc1UofALxrbYEEKnVIiRxwxjNbuWy6qqvef1Rkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888511; c=relaxed/simple;
	bh=xCvX0r2+9DbN8KCqQqZIM9j9S7ktaldGgB7Y0AgYsx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hlCd++NZpeMsJizYc/2rMicF4Du76p85wb848M9T6A9zxec8VMvlFiOYf35tDxfmZvX8pFdKJKcNUOet2W0C4Iwz5ff3VUF0Uf0Fp5RV6Cu4gNSFZOxC0aHhzsoOoV8miwu4zU4k0QJu0hNShxNnIFoYtt94RZGNJSzJK++1bAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=6phidd7/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GLKbx8H3; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="6phidd7/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GLKbx8H3"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 34A497A00C2;
	Sun, 20 Sep 2026 03:15:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 20 Sep 2026 03:15:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789888509; x=
	1789974909; bh=6meny2E9weN/v00lFIjpwStwlHOauFcGKONCne7WeMg=; b=6
	phidd7/QyHPNj9m/9qy6W51fI7m21q0GujzTXLXS2iIhvaOLJtw0Sa015pnkMct8
	kizYWG8BDnrZHVZh96VP5DVEyIPS45l8ZPDtptMdrZJWyWxC4OeBOTBXv+zgPaRb
	6+JpZ8BWUnG+OfZoeg6dpjrVAx2YJOgd0Zm9QUnHwmqjwEzRWWxCC001hDGk0pf/
	0xu7FS06Z22fuFWzoF+dYVF6TdoIxtA2t7GMW0uvr0R6HUNAvrDg6FiaqYBgw9vw
	ubwcrTgzHVhSX3QErR2RUJBOLjAIcRvfaFXVA6pwgTbvrxbY+5Ds67xKh9X3Ixue
	BAw4Jf7sNtx0NsUlUTkPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789888509; x=1789974909; bh=6
	meny2E9weN/v00lFIjpwStwlHOauFcGKONCne7WeMg=; b=GLKbx8H3MnG77FVYQ
	2RvpV5t3PgD9uGSv4KIEfD4m44KyAD1MxdRtvJWw9w/7C/PLyWPD7UnAf6vFVHNy
	5lcjrpjWaijcYTWFxRh3JuBtXGs2GAidCp+Jvn/03dqbOVyuoyrC402ezmej3Xjn
	a8SlRd9F0sSrNLP8voxOP4jbc3CJkJK5Q8J57UboFOlZK3jO7mP6oz1v1Uv3sEBM
	cOuTMH7toQITuCDAgPHXqDXwS5vw5X0Z+OTWJ1FzOFzk6iyFD2xCA493pguIGHQF
	zNsPZfQSVJV16wH0kpnR/dFIM+I7sRwDnTJvzA3mjOfXML/MklR7vEOn6DGIowXh
	Lc6mA==
X-ME-Sender: <xms:_YevahIvH6iAiVzRWQd8NI50m5MD2CR2rgwLh8bBFCBOefVt9bqLcQ>
    <xme:_YevarF_A8KEozqB8zyfaZMEmbfIe_YP7jums_KokZGe3dvavqPUBks2_jkqqIjR6
    VzhGUM_gvCEq2THiXsILS_FDrwYjZ_WIKBOXEOlkAZL9lp3mRSK-dn8>
X-ME-Received: <xmr:_YevahTiKN-7rtQy4Sv5ydO0djJlfc3vjZ_i-yecUK9Mau23QMNkF5jjnQfFJnVqjKHs6hOXDIZwNRMDVVbqXBa210Z0GTF_-bsYYYXDWZVikA>
X-ME-Proxy-Cause: dmFkZTGyn/xqJvXtDE0aXPg7VTWwa6ZytMhAGR7nxGfLocNGHdWz0wX8vkRz8WdekLHOxF
    ueygXEtIzUz+6+8Nu5jOylzMouJEEmUtyHAiF3hAv/PQOii+fQIaA16F9rGbK5eIj+gHX2
    7oWQRylPS9prm6P0pulDgCxjr7FHQNIloAyG1sC2/WA+6SlZoZfvrwyAbbTgLETU6XAsrH
    oSG/gVQ4B96IyAbe0lc8e/7OyBZYZjJJI2xl3NT5AIvarGgLVxYLAZiD4NlCbAozg+Dur+
    szvikqwlwyyPnE8AnV3AbHNmxlz1ORsNjtHjAvxgWdsXLx1vkCYM0HOOrP6u1ZYIqTWEpR
    6LQS1/0cs+rWuUhQ8MClIlX+PHOdTIf3vzNEJXf1LamyxLXjDGg1qERe9Iq7RT/4QcLeBr
    JRXkXTuyOrJRoQQheEVl1w/y+RCKlEeKBMvaTa9A4zNdNbMGLAgnSVKlH8/ijw8hKNAaGU
    dZn/7uYUN07IinM9kCEXiPQGVKokxg+xU2qhGq/PaoBSokjEBVz3N3hIh4Egu2G/CqRWfM
    hDVOnGK3JIxi3Nyb8a11eqjdcpcSMNZisuGHUPfOE3HLaFRt5Oau4Fx36qs7Uk9ymBbQtF
    Mh92iPrRFNo00mMAKgmWUoXwIJRR4z6dPkMRpUZFO6neu7FmcQJexP9hFplA
X-ME-Proxy: <xmx:_YevavEljh_bU136W1OFETIFzpFaRhWv-Re7hiK92LvCfyv4jt1cnw>
    <xmx:_Yeval9gXfnH6yJJNc0iIz5HGH5ceNO5J_XOPtq8ZY7ZM5yMYNgHZw>
    <xmx:_YevahJavfz3jhW51MQr4XTwpmPDPhd4USXspAgyPiA4NoevOUvylQ>
    <xmx:_YevagaOoZQcN9VzIAwLGy_FRvRI0zefKVWfh6S590QlOAdbi7Bp1A>
    <xmx:_Yevar-RpBWBb1UmFrat2iqP8TnR2Mism3dfrLL8FeiTxM7yr4-sqFnm>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 03:15:08 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] firewire: cdev: refactor using scoped_guard() for get_info ioctl call
Date: Sun, 20 Sep 2026 16:14:58 +0900
Message-ID: <20260920071501.77785-3-o-takashi@sakamocchi.jp>
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

The scope of scoped_guard() corresponds to the code block, making it
easier to understand which code is protected by the locking primitive.
---
 drivers/firewire/core-cdev.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 9a3be1ceee2a..bdc16207d743 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -491,7 +491,6 @@ union ioctl_arg {
 static int ioctl_get_info(struct client *client, union ioctl_arg *arg)
 {
 	struct fw_cdev_get_info *a = &arg->get_info;
-	struct fw_cdev_event_bus_reset bus_reset;
 	unsigned long ret = 0;
 
 	client->version = a->version;
@@ -511,16 +510,21 @@ static int ioctl_get_info(struct client *client, union ioctl_arg *arg)
 		a->rom_length = client->device->config_rom_length * 4;
 	}
 
-	guard(mutex)(&client->device->client_list_mutex);
+	scoped_guard(mutex, &client->device->client_list_mutex) {
+		client->bus_reset_closure = a->bus_reset_closure;
 
-	client->bus_reset_closure = a->bus_reset_closure;
-	if (a->bus_reset != 0) {
-		fill_bus_reset_event(&bus_reset, client);
-		/* unaligned size of bus_reset is 36 bytes */
-		ret = copy_to_user(u64_to_uptr(a->bus_reset), &bus_reset, 36);
+		if (a->bus_reset != 0) {
+			struct fw_cdev_event_bus_reset bus_reset;
+
+			memset(&bus_reset, 0, sizeof(bus_reset));
+			fill_bus_reset_event(&bus_reset, client);
+
+			/* unaligned size of bus_reset is 36 bytes */
+			ret = copy_to_user(u64_to_uptr(a->bus_reset), &bus_reset, 36);
+		}
+		if (ret == 0 && list_empty(&client->link))
+			list_add_tail(&client->link, &client->device->client_list);
 	}
-	if (ret == 0 && list_empty(&client->link))
-		list_add_tail(&client->link, &client->device->client_list);
 
 	return ret ? -EFAULT : 0;
 }
-- 
2.53.0

