Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496EB47987C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780516; cv=none; b=rAGui9ZsyA7y0yXa7ciVaXHwNghitUYBhTHIW8wYlsyg5nFBkWx0JQ3NcCrIU2mSVIKBNSvQa33vPW8Qw0H55ejqegoE5qSpnk7U6BaujbTAjnbjKFkXSY3YbwwBWtYDiEmMEX0MmVD5lyD4hpeUcnQpdey4dCage4yDJ96zfQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780516; c=relaxed/simple;
	bh=tJtSvBmty0vDHrhUjR4oca9+PN80lAHWJGGp+xTQogI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IzmuZdUo3l672g3MBpy+Ye46ReABwnP5uDpzpS3IvWva/gwZceXfq0vJox3XcGWKP2y9KzEXAfQTaJh0kBjgbChyCvp4RDoALZuoto0zJXRQHT5TNtjaGo8DdNz5Fk3MmEm7GJPEFf27L9BKvPbRuh5+x3JSbY4WuyOsEBT3FB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nUXpOVZz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nUXpOVZz"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB640104C;
	Mon,  7 Sep 2026 13:26:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788780413;
	bh=tJtSvBmty0vDHrhUjR4oca9+PN80lAHWJGGp+xTQogI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nUXpOVZzRLo9QELs2taTxXRVmkqLVGLcFEHPZ2iGn6xYvc9160SbkeP5ZoUzxrpBt
	 H98WBD0nwkTMuaGhLdDD2zE8cks/05GD5GAyBVaWhXgmKOn+bVcVw+ji8a6MVr2J8q
	 8kOXuXV0BiTbxA36fHK5KRNjzqHER44zLVOv1pXE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 07 Sep 2026 14:28:00 +0300
Subject: [PATCH v4 05/13] drm/bridge: tc358762: Drop SPICMR write
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-tc358762-fixes-v4-5-e3fc3ab5cd83@ideasonboard.com>
References: <20260907-tc358762-fixes-v4-0-e3fc3ab5cd83@ideasonboard.com>
In-Reply-To: <20260907-tc358762-fixes-v4-0-e3fc3ab5cd83@ideasonboard.com>
To: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=959;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=tJtSvBmty0vDHrhUjR4oca9+PN80lAHWJGGp+xTQogI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqnp/TvJviboSk6SV6p9mT+wYJATPOuk0zut80q
 YAQQbE1BdGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap6f0wAKCRD6PaqMvJYe
 9TjZEACKpi5xBTDdF8Q10+pGZZIMgKW98/a05Shb0OZqBCJsjjas80Lad2yrihqYJqv7iNNpci3
 5wqLfZ/e6mFI33PmzThh8gl/kOTCaGb7qq+yCanfTiNbWQ8zwNwjAGGFqIWMl726PvGbhJLb33w
 ejPpW6CONMOdfLirtotV+//zAj/SSwJxP3dQidlluMUGBk4BVqE6yjmhHuMRrsKwT1mlU4JCrjP
 aUnHffrhHVjvvHoWGS9rc3qtsRNQJC75l+ynlUlx0zYD66WiK9wjg+e7WGmCchlgvwPNZIjv85r
 +reMmtuMTa8DNU/BlD8cWmTcDFlunSK8gF03rHADNXuhcSyUKtfT6I4aikhhpsn3hpgZUIQdW55
 zRY1C4QwDekjbwNFYcifWIu3GRMWeqtvBEvdo1QwyeJYi1lUrgvAeOD9QqexfSYZZEHonez+day
 emeFIvVzkjuSLOxbDTyHHqcaSqWUyfRYztKWnRRn+6b09D962ATt/cxbJKx7LQRWBJqVe4WLFYP
 /AwwW2dBujyCmKCxfeGd9wRL0FeFi7XWehfshq5yYYOVPECXMZz5CzYYBHZ3l0vqcDGaDROsai9
 s4H4Gd0/ulIhFOMYtcykS/aAuFEVzBobSLnlGtu9iRubyf7TvCK1UpqWUxe0CAXJnFzd7sIyHXQ
 K2bxP9b1pw7qroA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Drop write to SPICMR. It's unclear why the write is there, as SPI is not
supported in the driver, and it's mostly just writing zeroes to already
zero fields (reset defaults). None of the zero bits written disable
anything wrt. SPI.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index eb6e6ad5b6a1..ee72978cd8d8 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -149,8 +149,6 @@ static int tc358762_init(struct tc358762 *ctx)
 	tc358762_write(ctx, PPI_D1S_ATMR, 0);
 	tc358762_write(ctx, PPI_LPTXTIMECNT, LPX_PERIOD);
 
-	tc358762_write(ctx, SPICMR, 0x00);
-
 	lcdctrl = FIELD_PREP(LCDCTRL_PXLFORM, LCDCTRL_PXLFORM_RGB888) |
 		  LCDCTRL_DPI_EN;
 

-- 
2.43.0

