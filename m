Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB8E4582FF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959607; cv=none; b=G7sBNugw5nBZLMSswdzpYkwPRktvsqn1U0jdcOc8vSpqspkpTY8GRlGtghDIc5wzU0F8AW1LNiKwtCy3jbncsWfY1nLiLdV5SO7TXvBjTUOr1EqUCE35aoxX47t479djpex4y3vLBgfHOY5u97gg5auow6rCtlszY1VXNypzCMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959607; c=relaxed/simple;
	bh=4KzXMbMWURGtw+7GAoFr9pFiQiDykrKQjsNJreTuQ4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qvtHqJtLfgw1GsForiMjA24KnIpoxF+Qh0M62ZIaUsco9cYcQ7PDmP8nucXaRtmTI1yj6HdtdXztLurc5RXEewMScVnZV2qrgAxytaNG/REJqVekSG5pbH0Z1eDfjnhyMSzg9O+AbcHGo6sn1FapUZqzudbqDy2Z2c+s6bxpNH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGUURQUP; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGUURQUP"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398a5aad413so27129a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959597; x=1792564397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZfWddcTl3OkOwHb9noMgEvLppkYLYn/mcDtOcVMzdBQ=;
        b=BGUURQUPWeh6+U5BljyIFcWliwJHB2bVVJISbmOkEfR6aCgr2NkRJSDuQRWJT92YMu
         ZsEWhNbMhsMsznvl0Xp/HTIcJYLP5Nfbk5osSdC0SiReJy/nBv0khgmrELWSpzqf5AD9
         LriVd6Osr2idTnnUXes67o9slTrOJuCBPWd+FPBX0PEQKSWJYvHc9Ujv8ts55/rk88Ep
         tVDKc9XR2jdvlbNJflX55NltEYED3FUfMXq4EVyTLlfjgJDRd/IdQyAIBwuOOzcvTjjA
         1PUc0NvVBYad68v/0pi8Tj1XyrTvpvcEVTlLWy2NsgAQQ83lBK8gGTJvb+yvdQA9k4K0
         SEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959597; x=1792564397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZfWddcTl3OkOwHb9noMgEvLppkYLYn/mcDtOcVMzdBQ=;
        b=ois6yLx14FZzIKA+ZlWMS69jZSKJ077onNl2asRHbNpLHg4w1deXT+4i11jj6DQOSS
         2XeDQxzu1xOx3qqO0Uy/hAZyRWq4IhAhkH/yNFRqWGEE2IGZv8qJNox9K0QIOFfNW5ZR
         7uItnTeftqIGWD5zBboZgrb+lzI6bTZ+OijDnrA6h1ZHk3D4CG8HlUrpqdzr55tUSC8C
         jTwuq5T67KvH1YuctGfyK8zYZu/ZjMarA8vuKUdQrmj895NwaUBCvMAOQcttfTczEM2d
         Kid7G3ATRWxlS6efsjvvvoqrqJkjpfMY9N82OUagnb03urT4Qz6a7gKrIaVPjDqD/YP8
         NvUw==
X-Forwarded-Encrypted: i=1; AKwUvBzig5RlZGAfSf5xfWchEMt06dyEQNAKhh6qZ4J0MOgy6Y3B74cJ6EGdQrNDz3b0/paxMmFd7cSIWUVN9l4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2x2mue2bE5ozjlPvo2WJFnjVPEiiJR+R9+TDgjS8F702hZULw
	+jL4NC2voXDKK0/NJAVMp2hNIK/GROQJW6l41PlJ9YC115IQwBcgMvMc
X-Gm-Gg: AYBFou3CxLDwOWj/gRJzGqWFeWEDFGdcqhnK92GhVR73P9o2Y9aD6s+kGV0MtupWCO7
	PkqqF7Qdp+BCoX5ck7fjNskuh3Bf8wYM0Rp+pW4Ej/hK9o5i8CGfhxI6hTHMIzt934QtpWF5tCi
	tFvQCS130ytaBX34M2ubHRUJ9Xo48UAVF7GFf/IVqpqFcI+krwK52wbGaCrmG6GJ5kMFsbzXNEl
	JTMSXqD8GDnnrNM2Urx9gbG/A/yGVtDN1r8rBpCUWFr7ZFZORv27vXSmlRLEou+QsxDDs2fLUo+
	lTGEmRUoN4vLWIpeT3Xx+AKUUe7ofs9ash6xgiM/CrAMXzbw9owfPGxEHbm75vYIDa2Y47rH+ty
	GGzMNCP83DhM1Z03sH/sZjtRqyRqDbmPPGlNEKeNSJPW9YjXquQnqnV4lDqr5S9nxrYj6Tp2VX1
	dq04IbPRNsZbfLuewFA6oIjE/Ln2WjEOSQ9q4iPk6dCeKeA5mv6hJoVsn13uNaYzBrOqKbTO99u
	MtMv2BsjAZQsbXc6qSnb2aQgYc22cJ8MKFyW24p2D4kOjGf7vt2kyXJU34o6UlvM8lwSmCTNu8=
X-Received: by 2002:a17:90b:384a:b0:3a8:1320:38ae with SMTP id 98e67ed59e1d1-3ab3a291871mr12456695a91.9.1791959596805;
        Tue, 13 Oct 2026 23:33:16 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:33:16 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/13] ASoC: codecs: wm8750: Fix definition of ALC Capture NG Type control
Date: Wed, 14 Oct 2026 15:32:39 +0900
Message-ID: <ce530dfb932d9e8def75059ab9d669360adc76e8.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The noise gate type is wm8750_enum[7], bit 1 of WM8750_NGATE, not
wm8750_enum[4], which is the 3D upper cut-off.

Fixes: abadfc928a27 ("[ALSA] ASoC codecs: WM8750 support")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8750.c b/sound/soc/codecs/wm8750.c
index d3f1178c2d34..df49d813aa4c 100644
--- a/sound/soc/codecs/wm8750.c
+++ b/sound/soc/codecs/wm8750.c
@@ -171,7 +171,7 @@ SOC_SINGLE("ALC Capture Hold Time", WM8750_ALC2, 0, 15, 0),
 SOC_SINGLE("ALC Capture Decay Time", WM8750_ALC3, 4, 15, 0),
 SOC_SINGLE("ALC Capture Attack Time", WM8750_ALC3, 0, 15, 0),
 SOC_SINGLE("ALC Capture NG Threshold", WM8750_NGATE, 3, 31, 0),
-SOC_ENUM("ALC Capture NG Type", wm8750_enum[4]),
+SOC_ENUM("ALC Capture NG Type", wm8750_enum[7]),
 SOC_SINGLE("ALC Capture NG Switch", WM8750_NGATE, 0, 1, 0),
 
 SOC_SINGLE("Left ADC Capture Volume", WM8750_LADC, 0, 255, 0),
-- 
2.43.0

