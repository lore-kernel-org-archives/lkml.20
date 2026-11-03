Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793675112;
	b=hBxO9mYG4MvOtfq0SJzZn+gLR3RsJHwQuXSXcVEqaw3WCEf/v63Jyfreiuqu2e52agHq
	 o+/eORNHst7Tuj/FsJsxa6Rx945FowGLdHzeaLDRBxTdXGNjK5Cnu6EYxkWF5vBRYD1h9
	 xPQvAY2PosMiHWEDscUo7C+D22K3PYmnC7R/eIEnNwzBSbuR6uYeH2AoJ+h5oum7r/LSI
	 uqo6euthl6T8M9A7WUnx8cA+VVeR2YUVUTBswkz+4lB1Qr0Q10XkZZh2vZHS6VDnVAjsn
	 pwQ3obKYyCkF26lJbssIjuzO6TcEuBUZKR1+D2veKf60BRa71zSf85jxyNEFkJ+YU6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675112;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DQjU/S5g8Ho1dah4744Lu00Cj1BTCyWDAlxZF9GRNVU=;
	b=AyIY+zIyrmbMOR2iU52SD/UAqyrpF60uO2zGOGttzoq56Xx//bEPoIvgTtiXPoaIonih
	 bFF6CxF8R/NY2ptBPLW/bj17pq0lYwEa+1QVVE2FAQPZV4BqB54Cn8HezIfkfeTIZvkwN
	 FvV4A8N47KoQb1rQCg6MENI38NgsLArI6p3HFWSviXbt45hocFaYlYeIug2N9aR8plvyo
	 iauAtM8aovAMVXXl/p8xkoDCsnBpqEINVNRA2lPYCn6uA7nrTjmzo6mMkUGCDq89Z9Rgc
	 x0cKtl8M5FqlG7J0WutguiBL4Bun2cTQecJ0nrS9dzdA1BIvTHs62zs2zmX24VWCnKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uw5McCUh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11888606A324;
	Tue,  3 Nov 2026 03:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uw5McCUh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793675111;
	b=O5A39a9/XWUVt5YRLX3Ra2BRRzyIYnkEOi6F0J4LerkpEbCjWO7SaU8m6+2t2wxzKTmC
	 MDyCVb7vb5FtJWYWjQP0BDDiUnmsdw2GKbx834K/i2qjtvSSbg3m/yuDmLYud8Q4ll9p5
	 aO3CEXfP9OwY70Gm61nPkxvOtBBuIAovL90xzls80PJMQY/7VMydtrVWknJaMSB9MuwoE
	 i8+E2tozmLOuui2mAAZ8gr60FXa4kqUZbBmsgQguX5L8tVmxsDVAobBlDIDv9xjBhkfbL
	 WMgzs81TzWECZRGOR0sNg9zCmiI5BLQNhXeXY51BjGNagK5Yq8Yy9UFQe+q703x9ZaQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793675111;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DQjU/S5g8Ho1dah4744Lu00Cj1BTCyWDAlxZF9GRNVU=;
	b=wTdZ25TNFzpfKZyTSX62i4qiwxxllXInRMSG96/5Wr78INsgwf1ZinTJzi+CkvK5dNqn
	 fILjqxnOeR0doHgyPhsqLN1NTgJ4gx/7fM64TQu/Ut1sQ+FHQsI9+iI+Qqy1Eewqanhxy
	 kDQwUHN7vAZHfcGejnqUyZbgsEnxNngBXAqvoN7GpwCyHVsCtslg8xyIC8qVY5drc4doA
	 pqtwKyrkh/tdInblhlyq6niUKpD/EJsVfSq30P2IZX8mV2RoQ+ROHh8GdDC6v/ue+EEmU
	 3udi8ckt7beORTsUG60Y/PdGspd3J+ycaP/PVvHngUUvQaYzER0fgU0tiCDiwzgTYTg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 223981F000C1;
	Tue,  3 Nov 2026 03:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793675111;
	bh=DQjU/S5g8Ho1dah4744Lu00Cj1BTCyWDAlxZF9GRNVU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Uw5McCUhTVdI18V5hjKYFg1RLytH9rnbEhvhTbnH13UXI5xrak+5D4XhgSlEDRTFD
	 XfpV+319Tz/azCmoBcqap/Eqvd5gUqTm28QFGbf7fXlfVhC0rX7elBv8CkyMpPkkQU
	 mr3wXM8HiUcOQ7ud7FxG63ocs3K68zRlyVK8leJqv0aWDenK6DtB8txRxCgFUgliHT
	 mEvMEutO1T089R09LJjStGh82ehGdTh9SBKNASRJfiSdmyeYsMtRP5UO35ZDzX1Iq2
	 dsrSO7LFiAsIHE93M6Ku8eEtrEtefEHx/yFrlAZ5pVBizfA+RK2MwgHO+4z7EkXpiM
	 MozHIJQuKUV4Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 872EB4676A;
	Tue,  3 Nov 2026 03:05:10 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Tue, 03 Nov 2026 11:05:04 +0800
Subject: [PATCH v2 1/5] media: i2c: it6625: keep the configured DV timings
 on 5V changes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-upstream-it6625-dv-timings-fix-v2-1-127b879da6d3@ite.com.tw>
References: <20261103-upstream-it6625-dv-timings-fix-v2-0-127b879da6d3@ite.com.tw>
In-Reply-To: <20261103-upstream-it6625-dv-timings-fix-v2-0-127b879da6d3@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793675109; l=2144;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=3ZezbE3ShwPRXZEsZJrVxC9cFwTipGhMEOkTq8PHQxs=;
 b=rbiAQDKxA8AtSDIGxjWg0dA99WGO94lcvZoaYeDf3viebEQV4X/eIatXAq5aX9K4IBFS5L5vy
 v3+nX40WuYpAAE3NDGAQ/kph1ORrbwElw8vr0nDvY3SDxzzKRSpCBYL
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw
Content-Transfer-Encoding: 7bit

From: Hermes Wu <Hermes.wu@ite.com.tw>

Every change of the HDMI 5V state cleared the configured DV timings and
set the ACTIVE pad format to 0x0. Both stayed that way after the input
came back, until userspace set the timings again, so G_DV_TIMINGS and
the pad format no longer reflected what had been configured.

The V4L2 API says receivers must not change the configured timings on
their own when the input changes; that is left to the application.
Userspace still learns about signal loss from the
V4L2_CID_DV_RX_POWER_PRESENT control and its event, from
QUERY_DV_TIMINGS returning -ENOLINK, and from the source-change event.
None of these depended on clearing the timings.

Drop the clear from the 5V interrupt handler, together with
it6625_clear_timings(), which has no other user.

Fixes: 142e5f00bd57 ("media: i2c: add driver for ITE IT6625/IT6626")
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index b74df9dbf8c2cab7461c69bc0f926141ed7a506c..0d3bc83e4e865e55bb9940c7e958b85eedf9869a 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -1192,26 +1192,11 @@ static void it6625_fill_timings_format(const struct v4l2_dv_timings *timings,
 		     V4L2_FIELD_INTERLACED : V4L2_FIELD_NONE;
 }
 
-static void it6625_clear_timings(struct it6625 *it6625)
-{
-	struct v4l2_subdev *sd = &it6625->sd;
-	struct v4l2_subdev_state *state = v4l2_subdev_lock_and_get_active_state(sd);
-	struct v4l2_mbus_framefmt *fmt = v4l2_subdev_state_get_format(state, 0);
-
-	scoped_guard(mutex, &it6625->it6625_lock) {
-		memset(&it6625->timings, 0, sizeof(it6625->timings));
-		it6625_fill_timings_format(&it6625->timings, fmt);
-	}
-
-	v4l2_subdev_unlock_state(state);
-}
-
 static void it6625_irq_hdmi_5v_change(struct it6625 *it6625)
 {
 	struct v4l2_subdev *sd = &it6625->sd;
 	int ret;
 
-	it6625_clear_timings(it6625);
 	ret = it6625_v4l2_sd_ctrl_update(sd);
 	if (ret)
 		dev_err(it6625->dev, "%s: failed to update controls: %d", __func__, ret);

-- 
2.34.1


