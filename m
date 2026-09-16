Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FC83EAC80
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789540582; cv=none; b=RPt63slncWd0Y+cWkeiyizQUQad2qWp+J7Gr5mIiFGeaO3HjEE0TCOYGY40HV3avow5LJHYwubCQkkUMJDZ5BmnnGvE+ISHKUYkFppf+H++sAueob1ZoEqd/7MdWV195lhWBDaNdt7642KyFi8uI+i/Y4jXaokRjewWx4chBm/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789540582; c=relaxed/simple;
	bh=GKIwRkZCm8Zv8iawV0UlTiF2MPtg/vkJSReYRTAWhUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DP/9eGXOQqqhRL/7kmTMzEYG6yFkrkRTdYtLs+6YXRB0ZKlRXji4r9pKgsuNDDaAiJx4A1gRwR6agaHNCCa4mWtX0BNVKwCz2YBJ9WbQnVGkUVep1hjkjGueG4BBiX1TWPJSWdvfPDhhStcfBq8P6TL6oCb+QVKI2XqeDQJZ6tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSIu7pbZ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSIu7pbZ"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed1368so6149235ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789540580; x=1790145380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b4WYQWILag3Li3+uZK8NQbU2ARL1MJngd+OqezkcRd4=;
        b=MSIu7pbZTI2F2Wtk9RO8e6Iy+7cuIdsMJquYzq64cssYtaiRUnpzHTBUDQ8ycVltcw
         BJVCzhFa3gS5NqMBt5BFNwimqOeXC2DntQwuIWp/Wobx/BVQVoxAQf/W3jIRfOMLJ1Xi
         p+Sq4WpJP4zaer37in7WuNJzISp9s5O7HxTjkRCt+w2CwK7ag/vUVmKA3GOrCgQTGH/0
         fqkgvVFCS2uj6yKSCdoP+hmEuMO9VZlAclrd+uOK6XreGqOrQQ4BDhRN3ykpCuNCOAPY
         2wsUqJqowvRJzfy18995rXY6OhvQq/MWUeJWK71Cc8kVbvnoznqpIcCrOOh0P8bOIHhH
         SqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789540580; x=1790145380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4WYQWILag3Li3+uZK8NQbU2ARL1MJngd+OqezkcRd4=;
        b=vZq3XXzMkwVeRzOan52dflAamLEFHYvribGi0CZCxsw92YwYvifOxmakagwme4L96/
         IGI9Jj71dzq1zwlw4J6hTtFguIPCRUYmrFx+0LP2/viWg99ZEjW5FD0qhPaTNASNwDWS
         ipl31v2CZfo4tSSMquY3I9TVWiEdi9kMXuLCLxzzYsVKAtfj1ox6BthcTdfRiQjUBOMf
         yu1A1k7h3iLiT+3eRG+jYxAjGuGHLJ8Rb9pb8wOqv/elxPmE/c5qyaQ+tYK5biD6Uk26
         T0ni6kxTo4pFgdcbt1dIZeGJOKtYua0brcvqDTr9P4SsgOqHJCFa8pdAAigrOW12PmDr
         beUA==
X-Forwarded-Encrypted: i=1; AKwUvBwycHDyrvk6DfsrrzXlcxvQtK36vrlAWUXrijZ1PAtxF2pCWRXLgveJLR63OZue5O591I3SyNmv/Qe1xM4=@vger.kernel.org
X-Gm-Message-State: AFuF++mMT66DYcNqG4PnrQDwx+ypK+lJYUaLU+WbPUsCTl/Y8JGyjvgj
	cZX7Dkg0FI5aDT2fuIlQxCTYOF+DltHhkKauWIXVX22PCO1QlzxwlcDP
X-Gm-Gg: AYBFou0I17fwKWUYC2kbngv7my5gHD6lqRu4y7ruBshe2jKQiQACkhAk4GqYW3uhq8W
	DkTHNrNgxQ5ACaM01WEaohWs3KKTWQGur9e8tb83gepdaU55agWxYFZkKL0/Ip/yW0mPJ1Ng8VH
	FNzh6hnJMhqLPSnnncBY5nSzc7vzHT88hmOuFp4Dl1VMo3uEltSAiGAjOfolaPM59fYo0vCqFpy
	XWEmiks3/ND8L3qTsjchARPZmwWnVlLMivSVmSbiTsyyPAADZdc7pWTNaW7eP4hExdzAvIkX1xo
	pgFd96fA03vFSZp6PC+Ys9dzClklRaElpekcDUBaKJjP60xagRnqlwFp0Be11TphN1QBnLoZHqW
	B7XHxJ0MdYdLE+prEg5yDC7VgU4a5NLl3gJqqUwmuw7Lfxs7OSUbZaSX16WW4KWng06opM21KCw
	AJ6qNlmIC/3t8aIisDZfVCHcHzQ4AWW0ozD6ymdH8kc8DkkM1BqYxkjZEr98vjYW8A1EsPHMoTR
	LO0OVPsAjISS34js/gQuSm8D7PiUJAs23HRv1uX27ZgM0moK69CVBWPGcv7l/lO5kbWhoB2H/OA
	ErmqHmztO4e4LnDlBnW9wBSCcQ==
X-Received: by 2002:a17:90b:380f:b0:39e:1494:1863 with SMTP id 98e67ed59e1d1-39e1e56b3f6mr3444619a91.25.1789540579242;
        Tue, 15 Sep 2026 23:36:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b6fe1b1sm3081767a91.7.2026.09.15.23.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:36:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Rosen Penev <rosenp@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: codecs: pcm6240: Return 0 explicitly on success
Date: Wed, 16 Sep 2026 13:36:01 +0700
Message-ID: <20260916063601.23625-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The return value of pcmdev_dev_read() is already checked, and
errors are returned immediately. Therefore, the remaining paths
are successful paths and should return 0 explicitly instead of
returning ret.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/all/aqfHiX3pE-0BiCt9@stanley.mountain/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/pcm6240.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index db85ae2f8aed..4b5569a5b062 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -620,12 +620,12 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 		/* Set to wide-range mode, before using vol ctrl. */
 		if (!val && vol_ctrl_type == PCMDEV_PCM1690_VOL_CTRL) {
 			ucontrol->value.integer.value[0] = -25500;
-			return ret;
+			return 0;
 		}
 		/* Set to fine mode, before using fine vol ctrl. */
 		if (val && vol_ctrl_type == PCMDEV_PCM1690_FINE_VOL_CTRL) {
 			ucontrol->value.integer.value[0] = -12750;
-			return ret;
+			return 0;
 		}
 	}
 
@@ -641,7 +641,7 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 	val = mc->invert ? max - val : val;
 	ucontrol->value.integer.value[0] = val;
 
-	return ret;
+	return 0;
 }
 
 static int pcmdevice_get_volsw(struct snd_kcontrol *kcontrol,
-- 
2.43.0

