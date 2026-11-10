Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319442;
	b=LU7Id7SOsxY5U9X65OOHX6fmGtRtw1a58THDTfBBM+AqeCb4bkNw5RCMYWZgnkPZQpxQ
	 6aqEglyCmv2OQ32E1BppodlRn22Sz3SIDwr3Rk3vnZIdZheprOxyAmlgNjG87/eKX+cD2
	 uE22XMT9sUQnEE3mFDU8xKd/JjpQo3HOqu2P7pcK/WU/ZTLVJXwMtzeVB2ooYHTRWRj/4
	 bwyfOFaqmyhp4zquFBiZfmy2W/YfIIvsGQw5Uwy4pZoKz6PR20AFUQo8G8s2/rkwXEnPV
	 iR8yGCTrAVkIZ7JDfypE/UzRrwyTir4LCn2bDb3li4BaeQezF+P+ydgJMVHSPdzcUKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319442;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=7SNMRn19gqfsW+FItqWvv1LuPX61ETlQLvBBtwgnLk8=;
	b=pQYljiXG2AD7/zJo6y8AgUyAMlNHEpN5+UqpXaLC/oPBdFu4/FOcZr9OTgxthKkOLvz7
	 m09Co1zA1Jjt6KF2yp9s1Blt+bNFeostLmwzBNe7ImzHnsenYjmFdnKVNeVR6TMC+CP1M
	 tfgjC096oOK77aVAUvCHhzmxLEV6CpdlaUFaI4uq6pQP+iUCasMkiHgD7G7HvWDCeeOho
	 4PoBusnx++/Wq48QCJETFG1Euq066jFWDLKQyecb7h+5rFUC2wR909p2JJJp+GLLcWcIn
	 6jVfrY5X9w0u9iHJ/HJDiUCjVFaADEzujJ6j8kxpD+ndRimxYgyqHM5A6Tuql64wAsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bu7n3QLm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7549260A3801;
	Tue, 10 Nov 2026 14:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bu7n3QLm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE7B1F008A4;
	Tue, 10 Nov 2026 14:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794319442;
	bh=7SNMRn19gqfsW+FItqWvv1LuPX61ETlQLvBBtwgnLk8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Bu7n3QLmvgnBFxAUzsXp+zBHdfasZrfsr9bEVGDoCCjE6tOPhomgenywWBEyUi8Md
	 XmWunn1fAt4ODGkOfS2Sdf8Pku7sgb+05xdakzQVzBmWPYICKs3SICmmREuyB8Gizn
	 vKZhJhBugOu3gfuTIIF2sxj0B37DoyzyGv0BRsSg1i5KsRrYxVw33iIwDRq54uBrIx
	 1+CPpF0w4GhGRPEMRb7GEhGPu4jJeP3TOjaQtNOmIgBWTw8INq/FmAXNDpHsnxKRWG
	 Ycuaeu43jve+QNzy9jr6q9JuHf4ev2Jkl5FSG7RdzHqx1PF+Rf0z9OFJfCQ8VBIlGa
	 MG+VJZfIq9dyQ==
From: Joshua Crofts <crofts@kernel.org>
Date: Tue, 10 Nov 2026 15:03:49 +0100
Subject: [PATCH 3/4] media: i2c: vd55g1: remove redundant
 pm_runtime_dont_use_autosuspend() calls
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-media-remove-dont-use-autosuspend-v1-3-cc07e71b30f9@kernel.org>
References: <20261110-media-remove-dont-use-autosuspend-v1-0-cc07e71b30f9@kernel.org>
In-Reply-To: <20261110-media-remove-dont-use-autosuspend-v1-0-cc07e71b30f9@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 David Heidelberg <david@ixit.cz>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794319431; l=1167;
 i=crofts@kernel.org; s=20260422; h=from:subject:message-id;
 bh=3JtUFHLngK+Z4hf+nqLJAp9bQMJ0gI/2RWoh+fAZLO0=;
 b=WYB/9H7CQlpn6Jo1yOxwDAXkqL645vFB+dzQlNEh53uJVV9drXuFAiZXn7pBZpewo66ItZEGi
 OcGIuZdIdPdBh9AdUTBotZEU5ZaGmEdYRNTVQn6FMMr6vaTUzQ9JW7Y
X-Developer-Key: i=crofts@kernel.org; a=ed25519;
 pk=Xd+UVoRPiiI0K3LHQ2XIcXmO0jvVuFTv9eTx3lgBphI=

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/media/i2c/vd55g1.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 3a3ce32b0610eb23d42b622f2173a505df120176..8ea68dc9b1d99d11a7678138a5b6f7147b595f0a 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -2053,7 +2053,6 @@ static int vd55g1_probe(struct i2c_client *client)
 err_power_off:
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
-	pm_runtime_dont_use_autosuspend(dev);
 	vd55g1_power_off(dev);
 
 	return ret;
@@ -2070,7 +2069,6 @@ static void vd55g1_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		vd55g1_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
-	pm_runtime_dont_use_autosuspend(&client->dev);
 }
 
 static const struct of_device_id vd55g1_dt_ids[] = {

-- 
2.47.3

