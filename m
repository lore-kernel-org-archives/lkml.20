Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAB7497B96
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461896; cv=none; b=AbF2Z4cmL5j2veXwKF/e4/elRGeybu8KSpjLC2LTjqQrAzGwWDkmfIflQo1wXq9qoFkQkx7abb6y+F/iFq5KlW8wrDpYkNF1yuLjsJad6nqVUQq+AKWlYAAJEsvCApH6Qgf6zaHYlmEx9FjJ1AoKDPSUeA5xtqOg7H0P5TkJON8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461896; c=relaxed/simple;
	bh=Qt066izirgpsYPfBfGMY6B4fLPUMVYZUV/NPWc3/DmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mFGV5FOxOKwYSMyAkz/9VYzU78d2wIVZuIsYhjXRITIBM2sRJrYqW7FMo6/p1uQy1vBlTlFDE8Sg/xqybtoelflEmsOFTtwoOv/hhFyHrr7Rax1VzhFwc+lEkNeEOycXiLfRlQ+lcNfFIGxtZWjsbTAayu8kj6M8+3rLk0F8/Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdX+izX8; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdX+izX8"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca069c8so25602075ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461889; x=1790066689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sspwV7oJ9KHJ/MMj3bvIrsUUHXCJrt1yJQ6IBig6BTU=;
        b=UdX+izX8AniLOVOebgQ/icEbkc3qsiY+wPbwRuERodd+kbTwdf07nH31eUmYAYpG79
         W7N4KF+dWx7Ns8vUeEpayeZJ/ZQyzY4gvEpIjVzhSaGERRUK3liVjJOCMTmTBNVCU1dL
         d+qgS6S5Z6AbKmwPy3EdxgAWqgsnNG3M7VznDxqt6bhd3vX4u5YYUP4Fd8hgmnpQ/TO7
         vv0pwMKdCgrlzT12cILj6qbL3uGgJi+5489ASuK5vz7wYc0Q5KGGf5xGgK48eotsfQrz
         UXOjsifQqA7SDF8bLgcyDHyB9SvbbD7o7RUqqmzR5DPz+naz7Y+0yM+lVI7QvDZy34ja
         Hmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461889; x=1790066689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sspwV7oJ9KHJ/MMj3bvIrsUUHXCJrt1yJQ6IBig6BTU=;
        b=NuKovvR+UP5RBcej/zX+P9G1a4DZih4fAoS7DRufCiRgX1L0OLNC5NSisJTkf/O3w1
         WOnsB4f7g/xjfg/APwtVocI8gTek4jEgK055n4epaAzacvAAhqgkx0uRCJeZnmZ+9xNm
         10sReZRwaFUjihKOgV4ItAMX0AiqlYVgWfGpjmdnOM05AJzoPzbSIz1JWtJFNqpI8sCr
         MUlpDYDDQI/ny8GxiqbSGAtY+RlC1g4/RC/ybmE19nuIc1MqmDPBy8X624wQ9G01qMWb
         3qmKQPr72R0jKINFAl60TAyGP7twDpytnWBanj3aiibXTgSUcye3Fdi7u0upMGHzgoTg
         iM6A==
X-Forwarded-Encrypted: i=1; AKwUvBy2ArZhtGDF0Ex7LW8XrnWCLeUFonH27q/KsNyzmJglikWRKuAA4F2FZeX/hBMn9WvbzQfYFovSt+SISRE=@vger.kernel.org
X-Gm-Message-State: AFuF++mQ52i0jQ37EL8K1NH+s75vdQjmmoutTObYbjWNpQ8XgIQemhN0
	G1Ci3R3nS5Fa1bom7kzRUE+i5iHkb51UogP9jaU7NBWIAq5I2/uzWnirYE3OtMR+
X-Gm-Gg: AYBFou2NzLfVg2cZYLV1zAj4ksm4O7MtPR5jY432nbpMi4FV4/DJI1H4BjVpF/EWj6I
	y1wfzfMpYyDMGgqUGJLFnD+kjE+s98kLJodyl+S8VBlksIoXuOmKWotpArjGM72Lq5W+5ogE2E5
	kuHh4yy7Syuih2nwt3WjdLOeE495VfywTITu2cYurgCJXvReioaedyjsTIOXSrNqYNp3gYSU8T/
	eHa+RR4yrpsxnr1gVaH+lU+HeLUqdaMMK7/ruldBufAzyqRkOoVzfg0s13BisX5dIzCGd7su56u
	7TjySIsyiV0Oh9u3tVjCZVpTQUXJQQ/MaueX1g+nUUxNIya4TaC5Nx5d3xmx7J+A2aUXHTBb47m
	Ma2Uyz7rT50g4zMfpxErWPWm9WLJEWygzOQXBZneZt1lhjJi5rZBfZxrmDUofgR2VpoeKHxhU2i
	odry2cx5mtPzV6RUaiSM9lIVM91jdlvJGusnxOL5UWXDFo6Uiqux62XQUbqQ/hxOM6BTe5Hpg1o
	XluBuXSYqDeWH8dIhsp0N8myw==
X-Received: by 2002:a17:903:2cf:b0:2db:56da:6a0e with SMTP id d9443c01a7336-2dd6c5f140dmr134979485ad.9.1789461889275;
        Tue, 15 Sep 2026 01:44:49 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:48 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 07/23] ALSA: firewire: bebob: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:08 +0530
Message-ID: <20260915084424.1007757-8-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/firewire/bebob/bebob_hwdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/bebob/bebob_hwdep.c b/sound/firewire/bebob/bebob_hwdep.c
index 216d1fceb6e7..1c523525fad2 100644
--- a/sound/firewire/bebob/bebob_hwdep.c
+++ b/sound/firewire/bebob/bebob_hwdep.c
@@ -8,7 +8,7 @@
 /*
  * This codes give three functionality.
  *
- * 1.get firewire node infomation
+ * 1.get firewire node information
  * 2.get notification about starting/stopping stream
  * 3.lock/unlock stream
  */
-- 
2.48.1

