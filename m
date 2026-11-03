Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793675113;
	b=XvW7+wE1xLCKHQJxZOgiphTBAnc+0TsAOqDcjLv9/ZKliMP9aaGSNJoCznD6p37XppP7
	 ooMfpFhL8eHKNg5UixEm3uFqksop9pU6xVPTEA4zoMxTl+t0TDE6BIMGVa3zm6I/94r47
	 EaKRQ0absFgAqBmrBcrTStrIfPV77+D7dyH46SA14+76uKXLcMclJASNczrUIh3lB08Uw
	 5HscVBBaAfrzCBtSDENzgB1PAifXW2YnvQ9SS1Mnyx20tSfwxQYg0TJNLfO4EXLT6Zb9d
	 PT35osi1CleJnDjwvDJ4tAY2Fy7T/F3EASbEvCYJMSIBwjAD0WgAmtvWMx2EkTecgaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675113;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=udDBaxFsfmgpO6vJUUwjA8TYE8a/8OF3gk6+ZxFJSY0=;
	b=maSxGGA7LT24ekX/ExTZIofYk2LYcPaS7r54kIZLp5ZuhM5lKMvub9xxTUKUxF3KlmAE
	 sSkISKlyDnBhHJ6Dup3nCYc0pmjCMvaLtMBJtZKRPUeagpt2MWF8UDxPOsuKgPaI5LVKd
	 09XlydL+R0/a2AdL9s18HKPMWYn5L+SyXOmGs0gHubOit5yRaZ0ZgAxj47Xw48HBLIEbW
	 JsruZGrI0eiTwtRcW2TJAlo021Vk6Ntcq4FpHV3g/d5KVGMnxQ+Aj1g58/9W/nT/Nw95P
	 LBuNn0AYlZTKdyEONxi6rGbuTf2QtBqWfEsx1mxwMB8AG4ZCsvQzkHmDBBUiKWD58MA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KF8bpDZF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824EB606A32C;
	Tue,  3 Nov 2026 03:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KF8bpDZF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793675112;
	b=VQf/BrJ66jtnokFFMEwrwWkGXAVcL4ZJXEp0zLl63XKDTv/7LnxQWGiNW5lTUC+es6Sk
	 JBowbjks1GgIY29wEGAjQj/y/DRoTrr6sFaW8qRjftMXCxFaHhSSkl91MrnIHwoyMCaLp
	 teWFmHgYTSt75YTE9agBSCWtKVTb/o2MGKPUTJrX76OmIxH/+BZiG0wd9MRFYWXlEjeJ4
	 LZLE92O490AGf7uPPeuapnmyfFBC9y5PQJkle4AU5hVC7P8H8y/+Fw85QDi/U5ka2yrx7
	 3/9CQJfRhVs0FzbMQF7Gs/G8bZeEGm6+UmTkkqz8g4fdlaR98uffYGpr11AF+fRKvAw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793675112;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=udDBaxFsfmgpO6vJUUwjA8TYE8a/8OF3gk6+ZxFJSY0=;
	b=eBEIO5Z07p0XItu1cnahMhEf35tnU+5fAHEErbbiMypjGhWEU/xwV+7XcThc6QfLBcRZ
	 xUhM3PVs8ep/ymVtV2E3PZ3nClcLS6o4U55pMZ+F6qKwYyMmDPbxOD0dcDAcW6fF3+CAF
	 XPH7tLZUPYGt1egt1GA5JNj6XaXVJXJPJcPygqYFYatMaQp/8X7E/B6mdrzlIkTQ1AcLT
	 TskwFnBPrqEIDnp14Cc3E1lcbWsi4aFxZ3e5SkVDOdYiFkq7fy69BP8POdV21z1pvKXwO
	 DSFM6pxKM1WiwrBbYSpnU7fk1yowo3pMZFubc6eY2Cyn6PtJxmmNmuk2SZR/yWjy9GQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2E09B1F00A15;
	Tue,  3 Nov 2026 03:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793675112;
	bh=udDBaxFsfmgpO6vJUUwjA8TYE8a/8OF3gk6+ZxFJSY0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KF8bpDZFjeiVBFpY6UTFjkvtB/df0SB8g7oS+noO6ej/tnxl6qNp+znJPHmBl5HXe
	 MxPIJK05FD3nzk148p+URWY8eXoZb7qSugxNtkVzrdMN2tSFaM8p9yYllRzqhwLlvu
	 fDhTvaGcfHFkeDFMk1LqKMT48v2ZKwoAtft5BRJIFv07OwHDiW2FtBet4EK2p5k75D
	 SlGHCpAwoF/B65FJZxs9/KphwEG8A2udJnaPvb+Q/0EXX9nB5Ou9RqKFsSIY8yqXAO
	 IUGGXlDwyUjKVwWzKfrPOojqkw0Nzp+uZ/R7E4sTVH7aXT8THZHflfgUT/GEA8P1Wh
	 pdPtYsFpI0Eiw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ADE8146778;
	Tue,  3 Nov 2026 03:05:10 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Tue, 03 Nov 2026 11:05:07 +0800
Subject: [PATCH v2 4/5] media: i2c: it6625: fix the second-field vertical
 timings
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
Message-Id: <20261103-upstream-it6625-dv-timings-fix-v2-4-127b879da6d3@ite.com.tw>
References: <20261103-upstream-it6625-dv-timings-fix-v2-0-127b879da6d3@ite.com.tw>
In-Reply-To: <20261103-upstream-it6625-dv-timings-fix-v2-0-127b879da6d3@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793675109; l=1934;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=kjV6HwTublUdyqILykbIunpVKxzo/F9RhLJo1ICO5Lk=;
 b=IRW6ENPtai6JniH1HJKJaLkoKekUtHW+QoNJv62PtPvhePbCjLk3ax2CsuLJ1rL0FwaQ1b9Y3
 Ou3tTgg/gwSCJ05tqNufuO4ZOpWCORk0Gt6gbGt8sksBvC6DuCcNr+c
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw
Content-Transfer-Encoding: 7bit

From: Hermes Wu <Hermes.wu@ite.com.tw>

For interlaced input, the driver reported the second field with a
vertical sync of vsync + 1 lines and zero front and back porches. A
1080i frame then totalled 1108 lines instead of 1125, and any rate
derived from the detected timings was wrong.

The vertical active, total and porch/sync registers hold the values of
the first field: on 1080i input they read 540 active and 562 total
lines, with a 2/5/15 line front porch/sync/back porch.

Derive the second field the way the CEA-861 interlaced formats define
it, and as the interlaced presets in v4l2-dv-timings.h describe it:
the same front porch and sync as the first field, and one more
back-porch line. Without V4L2_DV_FL_FIRST_FIELD_EXTRA_LINE, the extra
line of an odd frame total belongs to the second field. The detected
1080i50 and 1080i60 vertical timings now equal those of the CEA
presets, 1125 lines per frame.

Fixes: 142e5f00bd57 ("media: i2c: add driver for ITE IT6625/IT6626")
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 85f10d10337130565a0799daa32311510e312a68..75bcb8304c02c7c0c5feeb02af6c93378fcfa5d7 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -839,8 +839,15 @@ static int it6625_get_detected_timings(struct it6625 *it6625,
 
 	bt->pixelclock = it6625_get_pclk(it6625);
 	if (bt->interlaced == V4L2_DV_INTERLACED) {
+		/*
+		 * The vertical registers hold the first field. As in the
+		 * CEA-861 interlaced formats, the second field has the same
+		 * front porch and sync, and one more back-porch line.
+		 */
 		bt->height *= 2;
-		bt->il_vsync = bt->vsync + 1;
+		bt->il_vfrontporch = bt->vfrontporch;
+		bt->il_vsync = bt->vsync;
+		bt->il_vbackporch = bt->vbackporch + 1;
 	}
 
 	return 0;

-- 
2.34.1


