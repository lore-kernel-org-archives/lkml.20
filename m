Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB303BBFD8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024608; cv=none; b=KVpl3H1Lm8lOqxF4nGovJZWuGQqAtapZpX+ejfkrsBAVZsjWc4dKe/zJVhul48HjAsDS9olHbkFtCQmXeFqkUhyjhVXpCeKwBBanOUqskbcVpjK/O7OR5+62W2wo0bwbipEAwgxdYsVyIn9GbLtj+SkfUk4Klg4ok4CREdtoQB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024608; c=relaxed/simple;
	bh=Nr8soLk7HjSX69yt6n4Yu7jzL2a6NtPIuZF2j1MLzYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YgTfQ1EtUE4q1MRI7buscsfxuo/uK1cO7tEIUiRLrt1D8QflUrV0AfylqiIm67HITtKSmX02DZk4Ok+em6y2KBOLPSK00kPRdmKD5/SE3hxa/UkBw70R8z2Vnt/nomxCrH3fDCpP62aXqrdgj8MBxPeie+5Lis0BadCe4fwzB9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXr549fy; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXr549fy"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso7114371a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789024607; x=1789629407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SySIigzjl9v6ifCPrWGqAFgrXQJf6WaDMYUEkKC20gM=;
        b=EXr549fyAxAcW28D81QSomtZ8i+W5YeQ/NWMu9uDoNXAqgSmtEn+8AE3GvHxyf7Po5
         pb7nWl0uVXEQzAlw41VwVm5w1eBbD8BXnWpI18PgjIJBDuc/4lBEI3eTkX/xQ/lku/II
         tc06YZxxHbIkucCiuAAYp30mQIqIWhterc98t5+VK9RvtMqMyxwYQkhGQtFKmasckdaJ
         a1Q6ZmF3hn6FcpHOfxF79mwHoBglf6pfJr7vGVmR2geXOXyIR8XxxIFtZG1ioba6tSFh
         TP1bSWdgUHMMnNs35yr+6+SiY92XijeAxQpurnQuaAi6FX23k7ffI8h3j5TnU4/8mHLF
         rBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024607; x=1789629407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SySIigzjl9v6ifCPrWGqAFgrXQJf6WaDMYUEkKC20gM=;
        b=YwnszQ4v7O/n8WAuv7+UE+3jrB1mj2aW0hF38YMr+7uYw/un7VBFt/7jLWIc2thiN/
         Rt0FAb/BgeuMzDKK2SBjKildBcVZj7uzjd7lD76JM56nXGRSjoCV9Gaanag8Wj+1EnBY
         5Q8s2tSvrmqgY0f0/iix3Asb7/+5NLy29Fwej30cePAXCWuxopal2Gb+TI+3wP4/P70D
         TBeoy+rgZq0JL4NL3++2BEtra34rUmkmcdePYCaMlfq0GI3OEXMezgdjt0YR7+47eXgR
         TCL5tmqD/h5M43L8hcid501bSbzJelt4rpi4qvOxHWjUthY8jGP8Zo0rGciVIVcjRR/p
         GFkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPnyZEOyikuil+DkZlbk4By+ojKumOV62ODSziUncfK2Hu2orJGar50pm5b9DdLEuPAF/eGF0ZUHdHN2U=@vger.kernel.org
X-Gm-Message-State: AFuF++mZ08CPnTHeJlIgAK7X+XgVHAkwIF45DvrQSfcxFXmx33O9TeGO
	7EcynsOLjoSQ9PzEg95gBxTcpJIBaI0/9D23eKGHsuCJLra/K4IDZPGq/cxxJp8t
X-Gm-Gg: AYBFou2jksTR+z41wkvxb4K99lRM+6IDpLSW8kvVZrHRS+h2MJuKkisLSsZqLJAYs5k
	2nfecfeA6chPBJVu25U7WhMlc64PmXR6+8bwt9YNdvv/cZpjq1WlMGPeA0jnyOcHgdZAfv4ZASM
	j2yu+TN7dkZN+BFfY7TeWlweoaxEjtLwzTf76EIeibhBi+cALF8Bvghukz5xm01p5h7SOQ66cVd
	wiMFOFuPB3lVuUOdKLyo3s5YZtBADy/DewrN5+L2fv011K3/Cgkz6QMv3u0WIXcD0qLWk23Pt01
	766cDuuSDxFRIWbWRg60sk3Mj3FYd/mRlWFaGuovRIJexmK+rEmragtb9u34Zs1S7hpB0YDLQMu
	GDld8UtoN1q1+8zxEZyxTbwPuP9LibK6Ru7mz2rUsTCS6iBIcgkm6eBV0bjzCjoY2tp7hva3QrR
	BhsNuuEYeJYz9/3TfSzo2ahh8eNiPjV3zYVwf3vePkl59mjVZ/2n23d4oBEovEznC45hP0qbWBD
	c9MuAUPJU2FwIokyDyRAnmjDogunbP+YAGMzhWnSwO0C8fD7lEMojCSvjnQd76mYCADzKAOARxA
	YcwEfyXItLrHaICmYhu+YfYpk7PCWXawBvRAWs7OSIo=
X-Received: by 2002:a17:90b:52c4:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-39b260d3375mr58693114a91.2.1789024606785;
        Thu, 10 Sep 2026 00:16:46 -0700 (PDT)
Received: from Charlie ([67.169.216.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39bae865d2csm3118230a91.1.2026.09.10.00.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:16:45 -0700 (PDT)
From: Jeremy Nyberg <slickstretch3.0@gmail.com>
X-Google-Original-From: Jeremy Nyberg <SlickStretch3.0@gmail.com>
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-kernel@vger.kernel.org,
	Jeremy Nyberg <SlickStretch3.0@gmail.com>
Subject: [PATCH] Input: xpad - fix PDP Marvel Xbox 360 controller
Date: Thu, 10 Sep 2026 00:16:27 -0700
Message-ID: <20260910071627.236014-1-SlickStretch3.0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PDP Marvel Xbox 360 controller with USB ID 0e6f:0147 is
incorrectly classified as an Xbox One controller.

With the current XTYPE_XBOXONE classification, the controller is
detected but produces no input, while its four player LEDs continue
blinking indefinitely.

Classify USB ID 0e6f:0147 as an Xbox 360 controller instead.

Tested on a PDP Marvel Xbox 360 controller with USB ID 0e6f:0147.
All inputs register correctly and the player LED indicates the
current player.

Signed-off-by: Jeremy Nyberg <SlickStretch3.0@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 2da0b7f17..b7a9a940d 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -215,7 +215,7 @@ static const struct xpad_device {
 	{ 0x0e6f, 0x0139, "Afterglow Prismatic Wired Controller", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x013a, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0146, "Rock Candy Wired Controller for Xbox One", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x0147, "PDP Marvel Xbox One Controller", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x0147, "PDP Marvel Xbox 360 Controller", 0, XTYPE_XBOX360 },
 	{ 0x0e6f, 0x015c, "PDP Xbox One Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x015d, "PDP Mirror's Edge Official Wired Controller for Xbox One", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0161, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
-- 
2.55.0

