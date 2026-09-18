Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444B54BF950;
	Fri, 18 Sep 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721842; cv=none; b=ShOz2P5x5vxMfkWfPpOfUuu8RT4ku93MB8PuW+4CssOoS3H2WUYIOhiqlWAGMWNhDNg8H/sdYzwUqrISQxtQHmHcZIt3X5NEsrBJdhgiET3FXCmTM6N++AZNLX5FFbamwDdJ14CNzbnbYaLUP9iUzVLdEKHkX0H5VB0sCFd9kyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721842; c=relaxed/simple;
	bh=CgJLg82lUUFbQ7ioFKanZpxnC/3lV+TxbVrR+6yh7hs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bqt7/EGoz6KZdbnuviJpLGyN8w2ex2MJJ+OsZEifxpxmcF51/0OOPq41NwoWwZXh359kGBtWGmfzLa4mptOSdlioWWTxPsR2oH3Di/9mJ7eOdjQ0O9XigJRBiA3gOo7yLBmDvK7z94uQrTzT3lO18r/zeHigYbAD5xyYzVsB/1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2pkzLyR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2pkzLyR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDEFFC2BCFF;
	Fri, 18 Sep 2026 08:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789721839;
	bh=CgJLg82lUUFbQ7ioFKanZpxnC/3lV+TxbVrR+6yh7hs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J2pkzLyROqSrKRULg1k88rtCMexUSwl2YR88ZLy2MZtva38qI1/B9vNPM3LeMbFSc
	 oLIZB8hb69GyvJcu0Io1tXjUhEy+m+oWtZ1+x7JM5CK8qa6kloDd4E7jabZYuo0p6a
	 d0Me4f1XzwkzLDHf/j3+Pm+lijoY0N3F4mwW1/y35Xwihx8Kz7AVIIU4Q6ppjVjLm7
	 Z/uvoG1wIltIlotoEx+yDPqXbcA1EYPgM6EifusdgGdrUkNtY9YosgifO4HBYWXb2Q
	 rM2rCB4ngHMTPB5qMIveab3itoushWwzxf4GyDxskyI8LPVoS2lPt/At8PzdRH647m
	 1MVqXmkaaPBQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8C4C982DA;
	Fri, 18 Sep 2026 08:57:19 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Fri, 18 Sep 2026 16:57:20 +0800
Subject: [PATCH 05/21] media: i2c: it6625: drop stale GCC < 4.4.6
 workaround
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-upstream-it6625-follow-up-patch-v1-5-78d72d7886a5@ite.com.tw>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
In-Reply-To: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789721837; l=1310;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=uCKxbO4cn2ZcuI95qXRdJOmSokyqnY0F9Y9utuXNyCY=;
 b=PNtYAtp+bb2k75Xp7Y8v0EN7G62de3BzpstslhKOi/Me1H4bQi1oNR/mIMwEHjyl+spgDCyvL
 0esxiZdSTihCSUzcblYuoxdwwk6EJ7Py0GkQfRmxzldZY9ZstT30zgy
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
index e18baa6e1a1933f301d9d3057c2c08411f104077..97780c3d2d8fd3567ef18b3d2fc46b4e1f0758d7 100644
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


