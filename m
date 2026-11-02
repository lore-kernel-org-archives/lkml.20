Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593163;
	b=kzFFrRd3NzfhbuhybKKUIW0T83c9Zgn9UFAXjaF1rFJ7RI7NvYcIhkllIczDtdx5r9a0
	 s8b/jG9XN9LJBU/jxhZaCshlI8/e6/09jzpfOSS1330DAxWrUZOwPtW5ENb3FIe2nhLAy
	 ZcbIOhtlvih/Q/dUX6ARiXPPYH+oKD7Frk2VjfKSugsCJ7B2EvKGcwrIRddxdQDc854kG
	 fuLTlG0VxZ17s9VgU8Foki4CgQXNrv7PutrX3r7ZDxYD6IonntpAj8MeFUS0sR6lrtJhz
	 gVab30Dh4df9UflbcLNwGo6MSfsn0eDSgGPvA1YJEv7pVh9wYzxzxy/fxp3CwDwdCMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593163;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=xJDdIcLV8yT8vjtiGO8ABPmYZAPYKt3dV8jsRDVhzUk=;
	b=qYddb3QIc6oBAv5aTyF0LXgJyFLJvFXVG3nz7yZgl8YzsiYAfty8jji9alYa/mtV5lqM
	 XpQu4xFbuVOdWKnb2xFK6Z6b+qtIqLmv75bVhmevIFL32mW3KegZoBu1dYAEty4LXoOik
	 OLfq91udQzgfyagZ7RRo0tGWKe4yOS1b0dJpERoPicJ7fDFvzIunqIN9mQwfjNcnWUZy5
	 BmhCBPuyiY0LBPOXs12IK1yJndK52uwt3tchgEmF7xOF2wU9RR82BlWbcRXTFQPhOwo+V
	 eO4e2f5sF2poTj0BO5QLHFlDKr4Ll1OAH3V/4/01QRLqmiprZOFAqvGLtVAvWb+QgHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=wpYPLFCh;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=TN0VFye2;
	arc=none smtp.remote-ip=202.12.124.146
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BF0606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19BF0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=wpYPLFCh;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=TN0VFye2
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 6688B1D00209
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:19:22 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 01 Nov 2026 23:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793593162; x=
	1793679562; bh=xJDdIcLV8yT8vjtiGO8ABPmYZAPYKt3dV8jsRDVhzUk=; b=w
	pYPLFCh3PHdCZSB/vNmYVNsya6dF/Ua2Ln/XdzL1vuNHZPjKJwyxipO1EglW8cAk
	CadbK9dLE0N98CkydS4s3fnt/lbHagA1dev8TOnCd5Kprk5Bq1hSKF008vnsc8cw
	Br823aOw4VE+vGgIM1YYCMXj71y09a3yLtQ1TQerZXPwwguy8Mo8oPeyMVzOgJ0+
	oPacBbDNh7OZROrWOoM9041qfBjHJ9atPxWMBZoM4eRpnoHXbw2U3zx7o/mwHVla
	H7wd5mh4gTUIT4yKtPu6yujWA8A94B5IgxB7e0sMP1bUclXUTRmZKIZ8pRx5CiOF
	WltzloHP6QgI+V/VYy+1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793593162; x=1793679562; bh=x
	JDdIcLV8yT8vjtiGO8ABPmYZAPYKt3dV8jsRDVhzUk=; b=TN0VFye2U6uXahm06
	VrzYrIyQP+DvE5yf295t6AUXAnKR02lCnwDMlmWlXdlJ1HlU5YvPsjCzaZJjkNKr
	jpWHYej2+jGZfnHTc33KLdBCNDj0/hiUg7eudsDVK0KWDVpNBLJzwfZ7TcWqhuAf
	e+dGe3AhQl3+szPvKBKfNe9SnRKW/IRJqSnclFshnFUF3aPQFso0mIkXARmLKS37
	1fdf8OLget1H1pjEM7425ACjtCm/+FdOdaX72iBM8j0UDFv+ke+m07C88kgisHAZ
	McTjossZkcQwvDgTuA2c7wVTmqiHEdbRJ6VbosjnqCDGU0MX/4WQZCWyVznogoVR
	yT7rQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793593162; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:VSHy9E3XCFCKFPTUSUv6TeAElm8zMhlw2R25k3Iwt8z2JSQ
	p8sTYsP60hnqJvIe00CtT+XxcMEyKff9k039nd9oIifgezFbJTgW4OrTQgwCYspX
	O6opBKKeyQcedeC93Zgnj2SdFCjsVNQXcTB0tlhQd6HD8aiyzZrZj5jUAq1odgsd
	vOM3WFdzjHQgHNDAMbX4EPDfZF5OiBD94p8uGnrih3bGqvuoC2z3z5l792SPvyzW
	JOOdHgcyxeRKGZXiDmkeHcCXhKO5h1zDq0QOfr9MJ7cIeOAuZcnoFIgrJgHrXdPX
	5DCAkWjURNsZNIDbhNC7TxmWasjpxMD9UIF/CMA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:dUujAYzVajhMO4OUbhN7wzbLVIuH+N2Xu4eEwnJUpMA=:0NfI/LT0Zq+0yL71vsK9z9x2Dc8BBRLhrRsrUsML058=;
X-ME-Sender: <xms:Sg_oatK4AVG9YZwwU8GlZMbYYnQLBHzXC597U3gFS8XZlflII6RoXA>
    <xme:Sg_oanGmOq8a7-C_p69LKyCaqXMV7-ZsT9eqoOohtpcO0kbjO_GTdt2H2-I4-b-Kc
    9-_S8dmdFL_vc-S9tkdLDm4PI_9SiZ5Yvl9GrzwLmDaOg0Y6xJPvS7->
X-ME-Received: <xmr:Sg_oatThdKXZGzfLwG-bMGYiagP3XV-ncisf9D6GCTI16I_P1T0OsamMeiTR5WHtIiRPb2-n6pkDBatTvipoktxRUkjHGXxuci-3bslghJJtLQ>
X-ME-Proxy-Cause: dmFkZTGTA7ypb8lSnU98o05UzKcmT11qhFUV3HwDuCeH6c1SeZQuM8+DCBOa8yufLGsjH0
    kxzXb5vqHLhUV9lJCE2ybZ1uCJlxcTtUAB8T7mKXexrw6o4707CjSaTFsra8dIs4piXY8u
    7HCNChUgEupPlh4phugR24uBJdud5L4NOlOPm0TBzN4H28Kd5ma9CVxAaExfCd6OQc81IC
    /V7MupcUsV1wg9TP27eDdtq1ktF3iA3WpjDwu0JFZRfc3s+ihwAHCA4MJFcE/SMmhSY16Q
    DCyMgOjMkG7AzOIOXSVdxCaJwqDJw2sLbkwy3dfJqucdrQepAbN5shtGH+Z3KXB30X/cSX
    V6o5Fq3a+4YZpCcCytqQJ/KyLaH6nEhsl1wFbbRgi9zODDXqfo+vQh1f4edO6Tsx2gL4Pb
    46sbNmhMBlGiKPJy8sBX/Pg0pNDMW/1661aqPyYJ72fyXmMwRoVivDxlLfiToLZBTjoMdo
    OwyRLD4xhYuHXBQwnYzTwdSErEFBtLQ+fioxkPh1GQaXjm3XIemoHD2TRcvmZg403NrdkW
    l9tCxhG02YUypZ+cogGUcYyxkeOGAeEMotED0D8LEfyIPXhbmAi0yTO6+YdoBoqUMnvO8p
    +oxA4DpP4oaQ2aOnFQZ6pAmYGRbiJjHtzUBagjyNjaKb5QLib/yu08fnYTtQ
X-ME-Proxy: <xmx:Sg_oarGKsBq8kEYIc-GQC5LoTYna6DMQ5G725c1KakarFCigdns-Hg>
    <xmx:Sg_oah_Ghi7T_bZKscNyvY7AKwfmWWmdKkI9U-clLUv2IXaDnEVKhQ>
    <xmx:Sg_oatIsyB21KjnZs2KKlOXd3qNGLrLyWvQoW_l7WR-17z9Kw_rpIA>
    <xmx:Sg_oasbJlSjzNPn48KDtyX5qFGwxnR101Ev1UUCd1FHFufWHtXtpxQ>
    <xmx:Sg_oan85hrSkfxMJ1D3fmp6qJdYDNgbj6CB5uNEgFpA29Gct9gvojG4z>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 23:19:21 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] firewire: cdev: add context analysis annotations for isochronous context
Date: Mon,  2 Nov 2026 13:19:07 +0900
Message-ID: <20261102041913.1187814-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
References: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
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

A client can operate on a single isochronous context at a time. A mutex
is used to ensure exclusive access to the context.

Use guard annotations to describe the synchronization requirements for
accessing the context.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 512afa589e2e..418b72cb8835 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -62,7 +62,7 @@ struct client {
 	wait_queue_head_t tx_flush_wait;
 	u64 bus_reset_closure;
 
-	struct fw_iso_context *iso_context;
+	struct fw_iso_context *iso_context __pt_guarded_by(iso_context_mutex);
 	struct mutex iso_context_mutex;
 	u64 iso_closure;
 	struct fw_iso_buffer buffer;
@@ -1129,8 +1129,11 @@ static int ioctl_create_iso_context(struct client *client, union ioctl_arg *arg)
 static int ioctl_set_iso_channels(struct client *client, union ioctl_arg *arg)
 {
 	struct fw_cdev_set_iso_channels *a = &arg->set_iso_channels;
-	struct fw_iso_context *ctx = client->iso_context;
+	struct fw_iso_context *ctx;
 
+	guard(mutex)(&client->iso_context_mutex);
+
+	ctx = client->iso_context;
 	if (ctx == NULL || a->handle != 0)
 		return -EINVAL;
 
@@ -1149,12 +1152,15 @@ static int ioctl_queue_iso(struct client *client, union ioctl_arg *arg)
 {
 	struct fw_cdev_queue_iso *a = &arg->queue_iso;
 	struct fw_cdev_iso_packet __user *p, *end, *next;
-	struct fw_iso_context *ctx = client->iso_context;
+	struct fw_iso_context *ctx;
 	unsigned long payload, buffer_end, transmit_header_bytes = 0;
 	u32 control;
 	int count;
 	DEFINE_RAW_FLEX(struct fw_iso_packet, u, header, 64);
 
+	guard(mutex)(&client->iso_context_mutex);
+
+	ctx = client->iso_context;
 	if (ctx == NULL || a->handle != 0)
 		return -EINVAL;
 
@@ -1252,6 +1258,8 @@ static int ioctl_start_iso(struct client *client, union ioctl_arg *arg)
 	    FW_CDEV_ISO_CONTEXT_MATCH_TAG3 != FW_ISO_CONTEXT_MATCH_TAG3 ||
 	    FW_CDEV_ISO_CONTEXT_MATCH_ALL_TAGS != FW_ISO_CONTEXT_MATCH_ALL_TAGS);
 
+	guard(mutex)(&client->iso_context_mutex);
+
 	if (client->iso_context == NULL || a->handle != 0)
 		return -EINVAL;
 
@@ -1267,6 +1275,8 @@ static int ioctl_stop_iso(struct client *client, union ioctl_arg *arg)
 {
 	struct fw_cdev_stop_iso *a = &arg->stop_iso;
 
+	guard(mutex)(&client->iso_context_mutex);
+
 	if (client->iso_context == NULL || a->handle != 0)
 		return -EINVAL;
 
@@ -1277,6 +1287,8 @@ static int ioctl_flush_iso(struct client *client, union ioctl_arg *arg)
 {
 	struct fw_cdev_flush_iso *a = &arg->flush_iso;
 
+	guard(mutex)(&client->iso_context_mutex);
+
 	if (client->iso_context == NULL || a->handle != 0)
 		return -EINVAL;
 
@@ -1937,8 +1949,10 @@ static int fw_device_op_release(struct inode *inode, struct file *file)
 	scoped_guard(mutex, &client->device->client_list_mutex)
 		list_del(&client->link);
 
-	if (client->iso_context)
-		fw_iso_context_destroy(client->iso_context);
+	scoped_guard(mutex, &client->iso_context_mutex) {
+		if (client->iso_context)
+			fw_iso_context_destroy(client->iso_context);
+	}
 	mutex_destroy(&client->iso_context_mutex);
 
 	if (client->buffer.pages)
-- 
2.53.0

