Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89865403B11;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750570; cv=none; b=CriPKzD1jM3cPrNM484pBbvRgwzmeucm+x+W7rlCM8L5A4OvxGD8T8QssAc3y4Vpgdwm3MdQNEiNDWpwS9BUSgBmvkDZF5Hpsrv1P1+uMF+MMULmuGHri680BzdRrMiDUVOQtZfNEst/drOcslllR+Kj3b0m/cs3C/taleHmU/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750570; c=relaxed/simple;
	bh=tsEe8yZqVHY4rLDZIYUrUeF/VcPaojwRTopY/WvDkOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMKv6RxgF0hhGrTT5PFje8JFa5MkjCSJSvt02xXJiRARuOhWH1ii2hwcDFrovTlKwRZPOy9jzzaNKyf7wxgry0i1hX57bGN7A9FEkfZyFYL5vB9m/723MeloGdybQ/nhfZJ+hVA9zThUYy1VzQoInJFojQr0G8vT1UxTlXb7ECU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9jLOw7j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L9jLOw7j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2279FC4AF53;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750570;
	bh=tsEe8yZqVHY4rLDZIYUrUeF/VcPaojwRTopY/WvDkOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L9jLOw7jRIcOKpBylZpokttxD63w71JF69Kz6rg4sw84nyWO7YxxaLpBHaWs0pnzM
	 fio1xOEBpuQgZ6ljQFBBDYfhoRgS8CbwDSFAKum4F8VUCzMtzNCAGwz32P/ufCAqOK
	 axMwPj/b6/BR/2KSRNm9Uk6mLMJif6avNcPf1cjqHEhPn41j9aDul9jeUVE8W7aw5S
	 27OKMXh+4QXfeFOxzDIpBR6rfPjIkB+1jashFid3s+i73f8B202/Oodcr1Bw8QRsXa
	 Jk4HXBHEhOe63xg3dKIEA4kNHOICCS5XKTphYeKUXH0syJlryGWdBj8ZD/HvdH1xe3
	 nAFQLxNuUkX6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BD4C9830E;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 30 Sep 2026 14:41:23 +0800
Subject: [PATCH v2 05/21] media: i2c: it6625: drop stale GCC < 4.4.6
 workaround
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-upstream-it6625-follow-up-patch-v2-5-e353f887e7fa@ite.com.tw>
References: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
In-Reply-To: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790750567; l=1310;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=V9bwEAyagMxudYN4xHUy2bQH/gYjrOpBukYLroS2Zxg=;
 b=MeNAGj4SzHM3hYJ/Ckl0R+DJp7ecCkMfb4tC4uUK5MPwF06n6DbCR/196J4lQWuquHy6zdnW8
 rlWpw4XnAToCaLNDFZlDqhRtB9ovwiPGau/bvBev3JWdvXzZvWx05kb
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

The kernel-wide minimum GCC version is 8.1 (scripts/min-tool-version.sh),
so the explicit .reserved = { 0 } initializer kept for GCC < 4.4.6 is no
longer needed in either v4l2_dv_timings_cap initializer.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index b09b331b20364a8e169429bb309d1112ec83d919..b747c08e092c7b35994cb36bb5bf7b99495282cb 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -331,8 +331,6 @@ static const s64 it6625_link_freq[] = {
  */
 static const struct v4l2_dv_timings_cap it6625_timings_cap = {
 	.type = V4L2_DV_BT_656_1120,
-	/* keep this initialization for compatibility with GCC < 4.4.6 */
-	.reserved = { 0 },
 
 	V4L2_INIT_BT_TIMINGS(640, 3840, 480, 2160, 27000000, 300000000,
 			     V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
@@ -347,7 +345,6 @@ static const struct v4l2_dv_timings_cap it6625_timings_cap = {
  */
 static const struct v4l2_dv_timings_cap it6626_cphy_3trio_timings_cap = {
 	.type = V4L2_DV_BT_656_1120,
-	.reserved = { 0 },
 
 	V4L2_INIT_BT_TIMINGS(640, 3840, 480, 2160, 27000000, 594000000,
 			     V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |

-- 
2.34.1


