Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88777363082
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790561919; cv=none; b=IxbqfcWPZsgboaViOP/HlpX/lltLdWlZqAVsYavEf00WWprOdFDGfgI4RS2WMuKfrJXzq+xSEnNRdIsnzz5Wy/0KhTKyoxIH1AOVzfqWUq08gLYmNu4rXZzD8duYdhQve7ZYSvKmGLn+ahXZJV1p8jcQ+d0t6v3i5xkU3K2RJWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790561919; c=relaxed/simple;
	bh=zj4tvPqRF21upBgv6BYpTPfxCu7PxZhhGheN2EvdSp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r/CaNGqZDK/gjrCoVcmSy6u1ILSoGCqyhy6VxG+egcEkBW6QGFUPLT3GkFex8xcoPjTy2tX9ux/0g1NTX2cyc/gpmSU5LurX6W136kA3jXCWMTXT02+JRzEGENIa+PiOzwAjpM5KqQFHQUKlbKM5+clQndjnQmekenclejjzU74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ch3jHS3I; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ch3jHS3I"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0b6200eb0so1877296a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790561918; x=1791166718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ivCY2NAlXyEyDv152Bu3AUgeth/0egS9qUPCJjLyURI=;
        b=ch3jHS3I2QqR0atOVdE3FOI/EDS61KIzY7V5aJMaqKF7zNLMbaYvi8Mb+uF8VqvUBt
         YYWi0l8w60ShHfz1AmfRZEXP5pfDf3Ak1OSzan9qlP2PijeNWzw9xCe9+KQ10RgmZwH+
         pyW2uNivqIipAR/N7zPEw12SWXB9iL0SbbFwccfRsvvDYuh9eF9Lj8tn1Mbpb562VMNd
         qbwFDQPoEO8uXSS+MyMrkbMd+gGz/UNR51GyaFJE6SA+umBzt1dv0JfQ6P57z3Hiwp48
         49lgWqZVo3HvCQRM29Ddl1GCx7Ys9VTH4lKPuvo9eWLQ0PC0xTTYR2RyVeJnCwVplbKo
         yhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790561918; x=1791166718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivCY2NAlXyEyDv152Bu3AUgeth/0egS9qUPCJjLyURI=;
        b=ZuPh151UiLXrkbkW74wNnHZnQh4Yn/FjnfLGLr0DSqLi7v4mUfMJl90TodZOghu2wd
         qDhwGM4NZfjJNThNrnDSAnZMx5TNb1W+QXqwFHQ7yAgqDsOjZGSNXwBDuzRgRA6YJeoq
         h5r87MDmYRIg8zdlPKjJMM0gROuPuTJfD42mr5SLsQJysbQ4VT3+s828zF66NbaC+UYg
         mWtmjJXc8x7PpYRFCf2VyO+QKTAWyprkmhqG/Pc0bvu3UX59VAHoaa/Vbvqvo92IF6G5
         Ku8eyqhaoK9+qmDFuAPv4snzJDuexe72AsatCwt/Vlab+HaeNVQf0yk0wBHjgTSXHp9e
         Jsag==
X-Forwarded-Encrypted: i=1; AKwUvBzQJJCoDl+NJIYS6RPF1cA1wqEpL47A813qhZ7CQ305GGT0AvN6m5FTTyWwbbEmjY+JMudDr33Stmf6GQE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7vlOJBtR3sGnM9Yz5PRp8BPSsbqDnfAs8CFb6zdtzUIGdpW7/
	VgFdXr6rTVqh8nro/JbgwYRMCoY+b22akHXVGc/3mwtTO6s0H0c36k1i
X-Gm-Gg: AYBFou1iIVjtonXZRp0aIjYOQozYxEd7fVKgd56jAqxBMTou+h90aw7+65MgKqt351l
	As8Ol0ugXeAX9ahVdVOax+UdV5BhgoxTFqUEecwkmVh2mrOAKfhpghpnwycsqJmFlBznqiMFOMW
	oIXSE2m7WEy0PUmgAWRjXJTHVFtY5rw1DGn7eC5tbw86nwWozDiRIEaMuPwiPzl+E71XLbWxQsg
	Nkczn+ylZF/q0lpggGUgM1JzL4zFjg5Sqc3ld0v61wOLHeaR6CIlhhU8SYP1D1kp3iNWCa2sEKp
	PtRMMS6weWtbeDC7aDDdT6OQ3AXMqrdIaZbicRdPfCc91Vc69s7KPACqVKokPEPQfr2n7H+hLow
	lC/OYwj+090BYKJetDfM/xvtW44w03rJA3BCWP1Mpt2zWsqzpzYbIg8RSDyIhHheXHrThlwD/ij
	sI32/RqFLimlc4WGFNB0BPJrIuNFNFqcuQFaeXYGZnwmDwIzoZcm2/6/DbXAHP2JNNbPYntLCow
	uNEOg+0zsv4fSPBlvoFoVBkJHg/VwqYQUrfA7AXGfaZhCnQe77PZ4j+8I030XAKZl1Daa3tBBqM
	ZwP9X7pheryKZg==
X-Received: by 2002:a17:90b:4f91:b0:3a0:3881:ead0 with SMTP id 98e67ed59e1d1-3a0bb5530femr6510033a91.11.1790561917881;
        Sun, 27 Sep 2026 19:18:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b94936ddsm17588124a91.7.2026.09.27.19.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 19:18:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: thomas.weissschuh@linutronix.de,
	Thomas Gleixner <tglx@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Kees Cook <kees@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ALSA: dummy: Move pcm_substreams check out of the loop
Date: Mon, 28 Sep 2026 09:18:23 +0700
Message-ID: <20260928021823.6517-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The pcm_substreams[dev] range check does not depend on the loop
index. Do it once before the loop instead of on every iteration.

No functional change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/drivers/dummy.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 3f6bfee29986..6b0a06e5c876 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -1063,11 +1063,13 @@ static int snd_dummy_probe(struct platform_device *devptr)
 			break;
 		}
 	}
+
+	if (pcm_substreams[dev] < 1)
+		pcm_substreams[dev] = 1;
+	if (pcm_substreams[dev] > MAX_PCM_SUBSTREAMS)
+		pcm_substreams[dev] = MAX_PCM_SUBSTREAMS;
+
 	for (idx = 0; idx < MAX_PCM_DEVICES && idx < pcm_devs[dev]; idx++) {
-		if (pcm_substreams[dev] < 1)
-			pcm_substreams[dev] = 1;
-		if (pcm_substreams[dev] > MAX_PCM_SUBSTREAMS)
-			pcm_substreams[dev] = MAX_PCM_SUBSTREAMS;
 		err = snd_card_dummy_pcm(dummy, idx, pcm_substreams[dev]);
 		if (err < 0)
 			return err;
-- 
2.43.0

