Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792562612;
	b=CRXD+fkce55MddKxUb6VFoNy1v14pNSGGEWGEA4Xd6Hak/+n+uxsSI6frhi2uSGYkkVi
	 bhAbW0Rxe4ackLQf1DebH4NbXUfviYZkyduAjvBarn8tZfeQ0QdOGyaIcSzz4Tfs51qa9
	 mnj9MlJht23rq7QgcaZiwtgMyHPjxXshro4FzQoU6txNjcK5M31j+57guAVuHZeget79Y
	 LcbTFtyJbfmLRcu2ve5zq6iYvqsTbrygOrDhIWlcx9NUNPbVdymojC1bIcBLpG7hDIpnj
	 ykxg8/pNf5bMpLP73kZNold5sofsswbwtbCZ1iLEy/GSo7ghb4Ca0E+E1I3mlN0Vcsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562612;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lnfaStrgud0AfUogXBqRy59YJPI3+tOiENHp9VVz120=;
	b=jTykZPHuJuQt2q4VgS/CZUaoOJOCqGchUeLdomcJHJPiK6ioBsc8fyC53b0LGj1qYsIz
	 ZzCJikGO9yzn4YBtw0TXDZMvAJTZgKOD7ShLxf2sGF4XAlrzqRrKED2Dp4BV0nX8sV8DI
	 pes482cykqEov5EoqUN/MRAhZcxY5BaAXdFyu7VLbQFyzeOGJEDRqpCAbQHY4xvKXkJYx
	 r+70+hYAme5lDbfdjuwJm0IQQxjXaawKlfvRp+HCdcVyeg55acZaG5+mbAF92hFKN3mJ/
	 loR++eSSGssyGnP5N1E7eN0USBmcUh3z266kIIyXYmI4XaUIU4tMfee5QHqnz6qrYpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZD7qTqun;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A68C606A31F;
	Wed, 21 Oct 2026 06:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZD7qTqun
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792562611;
	b=suJBuSoRW7WAU0749pWUe38k93iz2jiF2z+8/ZEVQb1p5BhAUTSOFmJeCYnOqANWZpC8
	 HPWQIDQAMuzRy9WHRdGL/O4RbLuntY+OcSnth+HOT0xowwM30vBzqIbMZIR1wHm+R4scZ
	 OwBqVU+fz1SjeSu+cLYU32uYx6v4axPJ8IwBybaLm8ocl1cswN5TilxlKMrexHzitI4qx
	 W5SKKUkJ8t/CYF3OwnReZF+XElpmZ75POXE6XtyxVG9thzd3Gw853/aM+jVvalwkXOqiB
	 n+csNz7aJaKJ+RbRuZfcMRU8lF9hFYbbWbog1I69s5RwdOlXVbO7U1HYyjNRQ0UHDZQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792562611;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lnfaStrgud0AfUogXBqRy59YJPI3+tOiENHp9VVz120=;
	b=QfnjEKy+2zfnrTExChuAwgpyyszNP6Jq+a/xXUoWpCCI/32nNjUvKs6RCIl3ypSMlbSB
	 3e2lkEGFTfRyJ+EvFiWcw+mAgQGYYeHLrrFBv861bQg2OheU2QPYvqNgddp+uam/3nZZg
	 4207qF815H3q4AMqUqpevgpJ6fueL1H3juckDivsydxZowAV34Of77Hj1VlbOBjbVGJdm
	 BIuuVgWJwV8PNj6aYoCTeUvAUEvxm50lAL8EnScyuYVadMsqd0lgPcuiWi8DYsBpYMqoO
	 GUpifNEU1JVEK0VUjs1/Jwt5gL00n/AJJ0jKkYzIno+XjF8uJdR996FQX/ekS4BAoXA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 864931F000CA;
	Wed, 21 Oct 2026 06:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792562611;
	bh=lnfaStrgud0AfUogXBqRy59YJPI3+tOiENHp9VVz120=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZD7qTqunwkC1QCgqqBec3yxvy2ltsUBZOvkHp+QjiOtLi42tvi+EtBARhEpD2cdEN
	 qfbTLErsAuYXxuF1Hcp4+7yPUjXgBKAEfMcmrFtNe8I6mayP+wJfk9iUe9UHTU+Zi/
	 LvQSNt9QywWLX5vDQ6wGD3K3UvA9KmA5AiwhTYmeAggq96jqLywijOkMFoeG5/Z+h3
	 N7afy1drF7CMg5aA0u4mKv8IX1ZqajRaTTnLrhaUTv4x2s84eXOz9gHGy2CdVuRgnY
	 h7NvVhwkTovQzYwWprhiSUUgQ5MkediFvaBFlPfcJZDQL03bZyJ7sshJBXs6NnfvZM
	 OYAmyv14wwesw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E6A71432AD;
	Wed, 21 Oct 2026 06:03:28 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 21 Oct 2026 14:03:25 +0800
Subject: [PATCH 1/5] media: i2c: it6625: keep the configured DV timings on
 5V changes
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
Message-Id: <20261021-upstream-it6625-dv-timings-fix-v1-1-5881babdc4c2@ite.com.tw>
References: <20261021-upstream-it6625-dv-timings-fix-v1-0-5881babdc4c2@ite.com.tw>
In-Reply-To: <20261021-upstream-it6625-dv-timings-fix-v1-0-5881babdc4c2@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792562608; l=2162;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=7IBszv5mgeCCnM+3Dp8JO2qhtzhMhD85q51gl4iqtKo=;
 b=bFax78KbrxQjJO6gCUSUvl/OJLSj+uwyWcVWczBRH+zKwusUZPtEwT6VP+WcTQkeVzKNEQZnh
 1JxAQ1RcOvdDHvNseCpo/bTqrnl0Jfi43AT48y5TNhqo7nXz+g3ByNQ
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
Assisted-by: LLM
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


