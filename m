Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE64923A99F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788705105; cv=none; b=HtLiewY7CBeUtEWDgWt6WYUAbGSLAfOl/Sc/PCyxLlaSRf6HUpurCmA+/zkPby/3/qPgonH141YVl3wv+kMww8ivj90C/OORDPa3fKhmfbIaaE7OzGhZsbX7fO1hp9+1cR/nYxPCYHNu04Yxz/FU/jAAFBvCUaquC34fGOEhX+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788705105; c=relaxed/simple;
	bh=FEJ6ksSgxvTdOy0xYTkGUfK8SZkcZ599E5hHSPIxE+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IWzvHu74j7YGoRb6fwHDokqCYRMYxcebCqGi4jYhMuVqo+ph2D+WHqCWKSeBzDD5ZJDa+jfGXIuG/GDZD0MHTomS6X0xORQJbNFALVOnSqjPjl+DCja12il+GgxS4Ufa4g+IJwrl02oPsXGS4I7CCn1CUGLilnwawLZeuQVpZrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=azeron.eu; spf=pass smtp.mailfrom=azeron.eu; dkim=pass (2048-bit key) header.d=azeron.eu header.i=@azeron.eu header.b=S5GpCxef; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=azeron.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=azeron.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=azeron.eu header.i=@azeron.eu header.b="S5GpCxef"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a2015bbfceso30085631fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=azeron.eu; s=google; t=1788705102; x=1789309902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hXosXQh/qCQRDJ2kIL7AYaEw1+cwVQMlFTVGAul04ok=;
        b=S5GpCxef4YdF2/QnLbqSpKMWH1chNqxUpr6IHtod534PKIdYtKc9Saz9Q1lQl1K/dZ
         5ACq1rVTE3bZsGqcYsRszGvC65DxYdrm6jSh9EquLgHqlPw2CeDwluB0QkREZtVPSyPp
         oxAsez6uwXyu+fiWHmOcok1wolpFkiC+onI/obxlvXoU3/yOYyXBqD6roEw8BBBvvxs3
         wecw78drSEkgZqeO2tgVtqNzmFKPlQqF//7SPSg3I49o9gXJNMzcgNYl+JpgalYyViF6
         LZ9XthtxzZGmR8ZYQJ/6fu1V/Lk/GOfPtef06aEZPHJl9G+VEoWxttj3uhsdvSmLvGt4
         Y+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788705102; x=1789309902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXosXQh/qCQRDJ2kIL7AYaEw1+cwVQMlFTVGAul04ok=;
        b=AAypqyj/Uvu4/x+mP33IOs5k8iahjOpsuMopVj9zEe/uZB9Fu2Tguhj9whm/vVPd4K
         VaTV0W6Hnvyc371XD6TcQo3YwsoKjmDBb9rFh/LeJZPB0teKUN90O5aJZ+xK6PHgYiVf
         3tW6pAehsuCLqFH5LDNYCYx5EdVENPmHf0GxP+2KtjsJTrr0qqabk24rYwcme1Em1xtk
         qbcFfcepomoDCN3imnKxZMTLNayBIquWrbX0Up1YykmnoorFtTniGSpSfd2f4PVg7uuY
         bj2dDi4S7EIDYYLtZedp/L0mpIINw9wADdHYEuqVDJNrIwhYx6IxM10UCCO+Q4gqAlPw
         XM3A==
X-Forwarded-Encrypted: i=1; AKwUvBxAkTtw0cO1oKcbai+CnMSviYwoGdPd9guxkKHa1tLZyRTHHn3QpSTmfxwcXJ+hzhcXjOBzrbyt4/vk8Tw=@vger.kernel.org
X-Gm-Message-State: AFuF++nplnZAQbaf9swhCKSTDgjb1JNrnf4xHqEZves0Cr5iEvtlpFkR
	bwVFoiFbPaRGCoVZS5H4mxTnUoRlSxjDSa7M6pSSt+HPGy8CBE/o9jpLnEZJluJVhjs=
X-Gm-Gg: AYBFou29k9Zqnv3SX+4BPWEAhl3jsu5yesg8aLRF+SsfSOeSF6ZV7V5JUM/haXAJOdj
	Bl4wpFdnBdMiKFrI9mvQBjks0MJ3crm2KC1fNA1xCkpAsPP2XmBlxyKQ+5S2RkION3KgKoAa2WS
	0nPpEsGogWO0JbFJqPXMoZhQJMdfErK9FSRFLTV4SKp0bdooRVjF6/FhVUHxiKCjoQ21Yl/asRG
	NMhq0zDM1UNI6tO1iJtd7InZEu54kKbHgIR+jfua1sC4XvEV8lIhpM/QDaZQJHUZ2I8IY66aTzU
	Dv1AQe39DzRW1P0mo0QXelVaOB4D7ehPrh5IfmtEBNaXhFQvTVrI8zBOyCrznG0nJM1izpZjxve
	ugQ2NseMv+aArWMZr1Ax5VWWpZBJTQ3sm1WR75YSJlm5XC7oAHGtGs0PVLVSGGnKCB232kGdP8B
	SAlXzA7xvALQnec2kyjz++GDVCjf3BfpwVR2Mdl0u+i58+YmoAIYoT8riRYV5Z7Z/msbP0PNoRh
	dm9ouCVSxgP
X-Received: by 2002:a2e:b88f:0:b0:3a3:3fa3:25a6 with SMTP id 38308e7fff4ca-3a35b4ebaa7mr26182601fa.3.1788705101458;
        Sun, 06 Sep 2026 07:31:41 -0700 (PDT)
Received: from nixos.apollo.lv ([78.84.112.193])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705ed75dsm21560641fa.40.2026.09.06.07.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:31:40 -0700 (PDT)
From: Roberts Kursitis <roberts.kursitis@azeron.eu>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roberts Kursitis <roberts.kursitis@azeron.eu>
Subject: [PATCH v5] Input: xpad - add support for Azeron devices
Date: Sun,  6 Sep 2026 17:30:40 +0300
Message-ID: <20260906143040.162418-1-roberts.kursitis@azeron.eu>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Azeron controllers (Cyro, Cyborg, Classic/Compact, Cyro Lefty,
Cyborg II and Keyzen) present a standard Xbox 360 controller
interface, so they work with the existing xpad driver once their
USB IDs are added.

The 0x16d0 vendor ID is a shared block, but this is safe because
xpad only binds interfaces that match the Xbox 360 signature.

Tested with an Azeron Keyzen.

Signed-off-by: Roberts Kursitis <roberts.kursitis@azeron.eu>
Cc: stable@vger.kernel.org
---
v4 -> v5:
 - Rebased on current dtor/input next. No functional changes; resending
   as the v4 posting was not picked up during the 7.3 merge window.

v3 -> v4:
 - Dropped the FLAG_NO_LED / FLAG_NO_RUMBLE quirk. Testing an Azeron
   Keyzen showed it accepts the LED and rumble packets without the
   -EPIPE stall assumed in v3, so the quirk is not needed. The patch
   is now just the device-ID additions.

v2 -> v3:
 - Moved the 0x16d0 entries after 0x1689 to keep both tables sorted
   by vendor ID.

 drivers/input/joystick/xpad.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index feb8f368f834..ed6ae7bf0d3a 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -292,6 +292,12 @@ static const struct xpad_device {
 	{ 0x1689, 0xfd00, "Razer Onza Tournament Edition", 0, XTYPE_XBOX360 },
 	{ 0x1689, 0xfd01, "Razer Onza Classic Edition", 0, XTYPE_XBOX360 },
 	{ 0x1689, 0xfe00, "Razer Sabertooth", 0, XTYPE_XBOX360 },
+	{ 0x16d0, 0x1103, "Azeron Cyro", 0, XTYPE_XBOX360 },
+	{ 0x16d0, 0x113c, "Azeron Cyborg", 0, XTYPE_XBOX360 },
+	{ 0x16d0, 0x1192, "Azeron Classic/Compact", 0, XTYPE_XBOX360 },
+	{ 0x16d0, 0x1212, "Azeron Cyro Lefty", 0, XTYPE_XBOX360 },
+	{ 0x16d0, 0x12f7, "Azeron Cyborg II", 0, XTYPE_XBOX360 },
+	{ 0x16d0, 0x13ea, "Azeron Keyzen", 0, XTYPE_XBOX360 },
 	{ 0x17ef, 0x6182, "Lenovo Legion Controller for Windows", 0, XTYPE_XBOX360 },
 	{ 0x1949, 0x041a, "Amazon Game Controller", 0, XTYPE_XBOX360 },
 	{ 0x1a86, 0xe310, "Legion Go S", 0, XTYPE_XBOX360 },
@@ -533,6 +539,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x15e4),		/* Numark Xbox 360 controllers */
 	XPAD_XBOX360_VENDOR(0x162e),		/* Joytech Xbox 360 controllers */
 	XPAD_XBOX360_VENDOR(0x1689),		/* Razer Onza */
+	XPAD_XBOX360_VENDOR(0x16d0),		/* Azeron controllers */
 	XPAD_XBOX360_VENDOR(0x17ef),		/* Lenovo */
 	XPAD_XBOX360_VENDOR(0x1949),		/* Amazon controllers */
 	XPAD_XBOX360_VENDOR(0x1a86),		/* Nanjing Qinheng Microelectronics (WCH) */
-- 
2.55.0

