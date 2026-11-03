Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680191;
	b=5HWvB3TPbEjY4ussmiz0iecIdL2G0QiREGMJ9IXjwERl6SIOmIlHKVl3Nfkg84JRqZaK
	 myLNUZSd5NxLNt2Tt+ZeKrU2pb7LWGZCR7bWhxylAhTTsJhCoAhOmKWGddMbgI4b4LeyK
	 JChETyfXa5Ex6lqQ2HxpXnYFBh/RsE4GEc8rwQoMdoi+cGPfPAWQ5SkHCK1jn+sefsQ+u
	 tKXxXIuxBEWiINPTWkqnHgXKOczGJh8jAXnBuK7e5gu3/g/afu+HvFovL3aKH/J2e59hw
	 osYYMq5MxqpvE1q++rOozgrDONglUoXxNykiQgXAWBFrngrCAtNVL7DSvg7SQk6MGbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680191;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=2kxK15A1WXwaFEdk09NY1PNnWJMa4VKqZwI+tnbuaHk=;
	b=MMlX0MPdREvuKB03NdhyjJZOsxC33ns0eTTLrMUieCrzkM6fDFvTIty1GfDwqy+1OC4g
	 ofEXbfn910EGo5eHOkMnf0UskEP8QEPcASZ3u33soeGsBVkSiN5yylHU9QFDqHDsAx9OY
	 AOeYBnHi4SW7hGOE5QgNjxG/Bs9WAb8A+T6xVluDj6xbTfhIvVeGv2yGS7+mtjYtDRosn
	 2ZDeUvJSOKY9OwDyHDo+t0hwB+C73LOeHStNVT2/vPUXOCJX256OZjae4tF1FhVpybE5m
	 6vbPjiBL4q2BshhVfkZKIglpFdtUcwQWrGtVkBobBgPhqolj5jFimLXB9VMIvHSriFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=lOH3P1Kl;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=tb3Te6ZQ;
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED2A606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED2A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=lOH3P1Kl;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=tb3Te6ZQ
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 74FF07A00EA
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:29:50 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 02 Nov 2026 23:29:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793680190; x=
	1793766590; bh=2kxK15A1WXwaFEdk09NY1PNnWJMa4VKqZwI+tnbuaHk=; b=l
	OH3P1KlLJF97tzCT8nKKGez++GLewoPNviiD5HwfDv9kaWXXE+5bgBIRIZOWgT+E
	diswiYlCNrtGQ2xFoRHC/exd2Q7Zb4x6XCtSRk3sw1Xx5AF2RtOajC/nvGoN6SP9
	GO5KaQ8/VMmVQKDj6en3fNbO6V2FAKDYLkK+8132/BF8f8uwbMT5wo5mbRPeXPTQ
	W9iyG5prx89G4q1I+i3WcEPiwkBQ1/P49VzhFVtEPNqFveQa09WWtju2VMLmTfzP
	Q6ZMuhVLarUEa2iWJc0hnsPN4ONKzJmJz2fPWWa3AkjQswT0qrCzUGBfRa/hSPJh
	qXKPu96H11cgEwC9Iqhlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793680190; x=1793766590; bh=2
	kxK15A1WXwaFEdk09NY1PNnWJMa4VKqZwI+tnbuaHk=; b=tb3Te6ZQz8/ZSFkyX
	p+yUMNPgPLj0LHF0kE/V7LxC5FrkplZ3R/emf+cHL6x4rFFo6RdBK/SHirxQz13C
	WFvNhwDUTV2b1+6+wPe9HX1g32A0aoqW7U9ZZVAkJ6JSnmPoeTI7d/sYq+kWPEM5
	gOCjVR4fW216clbROTJPn+qey0mOmxhGl4GBRpq4otU5yVZio217MqdqYh8S9Bb3
	zChhhm8LnY9M46mFu+s2cAd7Jvzi6avMOZKk+Y5L/TNk8RomXuc6bC/2m/3YGg8L
	n5u2Qay8xHjO0Ci1XV7uwWYc1bukeKVOvnjPsJqVsuKMnSbot5h2WnReR7XDnjk3
	71l6w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793680190; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:gB9oTuTp7oNWN8EnT8JeM08JoCNXsOYHT2UtWlssSpHeCMG
	9eO1KbT2b5pkmI5+tgXVGVNhM/+9/NeJruav5LaCFcvX74nsPR8t+hdvKbS7zTyz
	1GFF9cqmu9RdL4tP7YvG8OmGMPqjQiznLwqm04CUj2Npo7ijAYbCbuX2Hnfl/LiU
	SOmmJQQLw+1obCLjMcywU1q3L7823/blVr4igFKsfjW+tuddhr/Wl/2x5UxtNMm3
	+2nfMJ4EJEM99eO5iuP4dFCNWWm06z+lxNriq/GmnZbYIH2nvZDdWUZFuWTWhRym
	IZEZxk7Ot5w1ihxMwpBtITIPzw67YjZtQYL0nJQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:3vEeMTFMpeoFsyItMb1se0JWG/MEwk7U1T/Qce2eLJc=:fxAz2ufYMnJm7UbHGSUBCw3hanqzHgZtYERDxT0VzQ0=;
X-ME-Sender: <xms:PmPpak2eSiDCLZ603r5R-Zs6H_swHrolpH599mGHZKrGJ0suyEZVuw>
    <xme:PmPpatDd1KaQF2704Y2Mj8Uye2zE7lGNakF5usHNSB_hQtBlLGhS_vI-p_EmO1oRf
    BhCMWQE5TqX3dbELdDmPJbtkEV0mYs6WEKD5oJjWpk8bSKoDcD0C8jK-w>
X-ME-Received: <xmr:PmPpakfPcQ0uI0N926uWjGqzhCLGSe7ZLWkdfEXkHyjDa8ans7OwHiGpfkf922sl2fqGRAd-Q1neqsJHRdnjTnnuSAjkv0eV8VOibaTNy-JJ>
X-ME-Proxy-Cause: dmFkZTFQqz+oYHlCvoB5zLvpDP90LIeDP5u+LpOA5droi97IzsuMlRTR3bTmqiDGTFtTtp
    aVcvh7xH1ivTgz5XTnjWl22Yo9jWSgMbEol7t6DescgDGgMHbUjJB6vEpCFlVE5kz/RNIR
    Xa+eSr5xQIhN6Qzt0C3Zzoyph3zuTXdjf2OZO8IY5dOcC4PQQRd/rRa/bL0QcDI0XYrLK7
    xuGi96HM94tDb3vIk4672gVRZrs/K1391bJaLbju+qVCcR+Ri+EzsUbtw8NF8NFPfvqwXF
    8/TbUxixTYNbwsjfyCQigljaiDvPV618TRZ3cG7gDgErtYKmujsds05qI4gc4oh2ZkU6h8
    /OIVCGBf3LLtdgQBgkmTG+4KiJp9KgcHgNeytD7DxNP420BDtulF84AFvMVfl7SaW+RKH6
    rfF5Bacjf8P+SPYqFzk8G7wee/XDuw94uw9tmGMzKWv7vvKC/FNYXRnRLI6HXol3d8ovel
    VPnmHwiwg9Sp5sEG6DXRUz2ZQ3sHvWtI+F3OiPTf9nUJLR6qmN9nBtuh9Jj+jZGjtkbVG7
    m4/DkqIDV7us8camIia76pvbzUy1c+EKtCAcBkQPD1skYZpYbVMstaFyMa2GWczZoPdROR
    BBZimg3Sg31dkhxhJs7lczD3ji7H/WaEd2ZTlmb/5G1NLhzpg7tu6Key1pNg
X-ME-Proxy: <xmx:PmPpaqj2uj6wKbh4DEJrs4cLHqwvN-wFMLtRWbzyjjRpQQ54_VjNzw>
    <xmx:PmPpakqoqp33IRgU61n0ui6G_9UBXf43eVH3U__0YjX2B1L6XWJ2tQ>
    <xmx:PmPpaiEb5nZ5Xk3HiQXIUEbBlJIAqerj0NWLc3rGQiZtMRx8REHjiA>
    <xmx:PmPpamk7QzE0i8IlPdcfM6wfaftANy5R8FTHTXJAZBv9mkw4_OkMCA>
    <xmx:PmPpahId6uZhQah1tYRa-kP0fUdKAPBuHHhNDXETXt6FKnI2VR8tLDbu>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 23:29:49 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] firewire: cdev: add context analysis annotations for client shutdown flag and event list
Date: Tue,  3 Nov 2026 13:29:36 +0900
Message-ID: <20261103042939.1231773-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103042939.1231773-1-o-takashi@sakamocchi.jp>
References: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
 <20261103042939.1231773-1-o-takashi@sakamocchi.jp>
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

The client structure contains a shutdown flag and an event list, both of
which are accessed while holding a mutex.

Add guard annotations to describe the synchronization requirements for
accessing these members.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 3236f74feba6..eabb5213e3e1 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -55,9 +55,9 @@ struct client {
 	struct fw_device *device;
 
 	struct mutex mutex;
-	bool in_shutdown;
+	bool in_shutdown __guarded_by(mutex);
 	struct xarray resource_xa;
-	struct list_head event_list;
+	struct list_head event_list __guarded_by(mutex);
 	wait_queue_head_t wait;
 	wait_queue_head_t tx_flush_wait;
 	u64 bus_reset_closure;
@@ -317,7 +317,7 @@ static int fw_device_op_open(struct inode *inode, struct file *file)
 	client->device = device;
 	mutex_init(&client->mutex);
 	xa_init_flags(&client->resource_xa, XA_FLAGS_ALLOC1 | XA_FLAGS_LOCK_BH);
-	INIT_LIST_HEAD(&client->event_list);
+	context_unsafe(INIT_LIST_HEAD(&client->event_list));
 	init_waitqueue_head(&client->wait);
 	init_waitqueue_head(&client->tx_flush_wait);
 	context_unsafe(INIT_LIST_HEAD(&client->phy_receiver_link));
@@ -1960,8 +1960,10 @@ static int fw_device_op_release(struct inode *inode, struct file *file)
 	}
 	xa_destroy(&client->resource_xa);
 
-	list_for_each_entry_safe(event, next_event, &client->event_list, link)
-		kfree(event);
+	scoped_guard(mutex, &client->mutex) {
+		list_for_each_entry_safe(event, next_event, &client->event_list, link)
+			kfree(event);
+	}
 
 	client_put(client);
 
@@ -1977,7 +1979,8 @@ static __poll_t fw_device_op_poll(struct file *file, poll_table * pt)
 
 	if (fw_device_is_shutdown(client->device))
 		mask |= EPOLLHUP | EPOLLERR;
-	if (!list_empty(&client->event_list))
+
+	if (context_unsafe(!list_empty(&client->event_list)))
 		mask |= EPOLLIN | EPOLLRDNORM;
 
 	return mask;
-- 
2.53.0

