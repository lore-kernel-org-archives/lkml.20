Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766BC3CF049
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437472; cv=none; b=HEtWWiJE2xe7O//T0VQ7lIx/CJdwOerzGdLfARMXJv9h1TBqi98NYcPsYt0AS4WIyNdAlfXeCcU2rMgeVTdZRiCPwKFfXxwQV8KdOdSLZHA+tJRp2bw782uuFlxdqVbmaTRLGQ+/G4ijcEx40IOMIMo9Zab8oaz0v5ohm2Djjec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437472; c=relaxed/simple;
	bh=cDTEaYFdU4bsYd6oOIV2rW4rMgwTR2VRJE7sbO0BfZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sF72GCgubxFFPKx7AD4rKsVUDOce6qoT/o1sia20jrQqevyzdgUORswiLIYq8iab+tvxjJakkXN3AffRC951soSFk9Zx3mTRokwHKuiRTXWmgbK8AjLQbGuiLfypWB47FXVbcd051QyGgn8wzlv7eHUj/R1ouCYZsb2ruWScS3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KriK7TYk; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KriK7TYk"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93a0bf264a4so242058485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437470; x=1790042270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mjFWFVeGJngDPSHgQVYhBNSO+sPnzoNj0Nr7+08rl1w=;
        b=KriK7TYkSUUmUoE/M3U6utZJQQFiHhWypUyG0qPRxkH5boSZ5qoj5ExzFStbncJzns
         pmUh6FBpuUUIiox+NJYSXRO5TBYm08Tw6W7m15/e3HNxz48huIoWcdEMVLgqs9yeT2KZ
         sEzT/elw3adWe5eWxPq64ck4dHLXxOGAruHULoOV/UYu9WBrkcJErCf6hpaOygfgaEU2
         qyACuarYMFT/S1PSPAhwp0+uEgCw8VE4IpVndpdE+FC3DRCxn+vai6+NqWtvIptLNPgF
         9JvICkUe9p5OoM64Dps2dkYScq+RWCiVychODafsGUy04vUqfeJk4epWNpRQMs2lmec1
         aFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437470; x=1790042270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjFWFVeGJngDPSHgQVYhBNSO+sPnzoNj0Nr7+08rl1w=;
        b=TXfD+/5Nmrnk1PhBv86gMDpK6o9JCQYmxcGspMXkJxYhoPyiD4DDRx5EbB+Z5pBveJ
         sUvXBRJuVGxrIimQS6/J1Otaojy4EvS2AXOKsSHKA8rtD9ce/kuyj3E1bHE8y8gMRvKx
         ykPijJVM22+m1UoIPdR0g8OlTnPW51sOybnHZESNCvBxd6cobEucWVj1qtJTsR9QQovY
         lSqkmOKBJ//2r0sjo5hlNOPRe8Qd7B9BPcZM0wDUG7Urx4GoCBz1k+ZbnvMYHnWMFqY9
         gHiyRjkC3z0W0tDfi1ABh3/eoqCikr9HqBwqMpXy5gwnp0eKoUGKVWUf/UKBQZlfyVdx
         Wt/A==
X-Forwarded-Encrypted: i=1; AKwUvBwH/vl3bRwEL4xBzNsbFLN+58VuiLQRmpoBJgwYQD5ElOHu/G9RHaDLdK4WsQeRQmqDGWpFHK/dPNoMYoQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nts8roRbHAqrvgIIqydOj2itI0V27VNQfcoTlLG5Qpr6or6i+E
	sU/D5yc7unO131nkzwLH2THu7PqJVYK9HhK6Eu+ngIlUgFSImOjd+yw=
X-Gm-Gg: AYBFou0HyJwWkHuEG6GD5riiSfAsQWYpLKym8LoGGPKdRzH5vo8aVMhd//hQezM4rue
	l6E3GV+U7Lcji+wkM9/JLmJL6a3IDqtFFAs5ketHB0VnaKB6sW01v7Xh/G4S75JK5mkyXVwPIzx
	g6np6rAGuC1oPVJ2YETBrOdFndYQJfgqVrzYuXMWVmFd9N1bvuaHGI3xaHD8pnNupAmv990vr0F
	8zZViGyoj2RpsdRh0U5u0MiyYGpHlLIUoDR2CQP5Gdln3RqD5WHXPR5GuFxdOAUNUfubFTF8nA1
	/ixGbvG7C7PR6o8PFzhXYnaVLFBIfZA4nUrLk8HE4Qm0A9thlTRWeuponSSRRReI8sUQw6XTLBE
	Ese7j2kcwnNP8/FTW97pyYDvfVZwogLSjs6V4gA7hhcgmlZvw9HWa1nCoA0BF9zq1sqBIlYQBDl
	PlX53hXNhG56Vs21xDh5+v85og6uPiyCTPkafDi/B2dkk4+DI2qxdB2B3vqzuWgEVeAh2Y8wdv2
	/aIx4z2HUJcgNxiP5cF2WP1z9aBRHwsgNYaBXP9/u68p747EgmctZu522xdL6HbS7pHFnkPOuep
	8XnZQNrEitwdnk102XrCfgDlvbdh8dikoVAWy07QAn2anhPDUlhqhsWu9x/H7CNFupHiUg==
X-Received: by 2002:a05:620a:260d:b0:939:1483:55c with SMTP id af79cd13be357-93a2977f5admr780633485a.19.1789437465389;
        Mon, 14 Sep 2026 18:57:45 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a00da28absm863266285a.27.2026.09.14.18.57.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:57:44 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: radio-sf16fmr2: unregister v4l2 device on tuner init failure
Date: Mon, 14 Sep 2026 21:57:36 -0400
Message-ID: <20260915015736.85420-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When snd_tea575x_init() fails, fmr2_probe() releases the I/O region
but leaves its v4l2_device registered. Unregister it before returning
to the caller, which frees the containing fmr2 allocation.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: d4ecc83b79cc ("[media] tea575x-tuner: update to latest V4L2 framework requirements")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
diff --git a/drivers/media/radio/radio-sf16fmr2.c b/drivers/media/radio/radio-sf16fmr2.c
--- a/drivers/media/radio/radio-sf16fmr2.c
+++ b/drivers/media/radio/radio-sf16fmr2.c
@@ -241,6 +241,7 @@
 
 	if (snd_tea575x_init(&fmr2->tea, THIS_MODULE)) {
 		printk(KERN_ERR "radio-sf16fmr2: Unable to detect TEA575x tuner\n");
+		v4l2_device_unregister(&fmr2->v4l2_dev);
 		release_region(fmr2->io, 2);
 		return -ENODEV;
 	}
