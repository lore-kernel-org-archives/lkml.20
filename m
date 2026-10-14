Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB87E449991
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959599; cv=none; b=qrqXn1JPOqznJLtsNcsOX4dupIsE23jT/OTyuw5y4K1nbhbHzdDIJu3/zYhSn+X9zk4/yVZGalZ/Vftb1Ta4S8VK6AednYhSZtC2iL0vY5FW/d1cNKIVMT8K5taMXXIxXWCxIBJq37fJr6kk7MJ4Sc4uwF/JshEJ+jpXaJ6iJ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959599; c=relaxed/simple;
	bh=nE32fTzBVH4R87AEkJ/Pn2GSQkElCz40GjNAKQrZqzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ClxGFVTTmxKlU59qIsa2UqSictjzF/IEdk/72mv9TyVCFNOnCeP5+DonrHixNbrKPXVCXgUr+HWlXqm8C0mIRLr4VkC3g1htfkAekyiQBmicYYML5gDZ9wyAJVJCzxcx8QaEXFL3/pB/72+7Ib+Wjxtkmf3ufzWcQs9MhytLY5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5XF0u/N; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5XF0u/N"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab450c0873so3128883a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959592; x=1792564392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inZKemHl8Tcy7cBPO+R6o23bsF6T4LUzosGW7cwVkSc=;
        b=I5XF0u/NQ+XIqAxqA/Ci5i7axOb1a+K3l9mNR+Nmmim1zazJPMpHoif4Iw8+6vfZ6o
         6oO/S2aUIOMIiVR8h4fYp/0vqDy9fLOtjWGtzgGZB1SYYbp/4nSEFPWXgUc8i4844gSS
         TtaaZ7+CaKaS3cpCsnclDj7d6in6BLVNTB4QZqGH3ftf1GD32LyGV6tnVehu2iOacfw+
         Zob+bhWZFm7dVVNixG513IPsvshzIJvdts/DLoF3S8/UconteDiVfkUP4w0BVCH+912y
         jHHi/e0rxrGt3XViLeDmdkJ1DG6SHlWb35xP7p7gMDvL56NuLlQegVKDq6oHw4ow1Nzx
         6mXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959592; x=1792564392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=inZKemHl8Tcy7cBPO+R6o23bsF6T4LUzosGW7cwVkSc=;
        b=Ubz17bokieYVh3egSKg/o73CIjDmSWNqJGVTnbCKNoE0iWEe8hUU2VBeyTdLAcz8Se
         njt7KdrGiXlT97wbswHBhQnPT5kqZZ8mFzoO+WKXbh350m0UUCoS4XVGog2HxIeENyim
         bpu4LYXnSs1VRiNxzLseqEpOy5u/Mze2P9pmqdtvdHGbwSmDvEF56NsvtG1W5WifHEgc
         jOq1UudnmBi5Oe/BiG8buGAkFBl2Zb+DBOQrPcUnWz9KKGOGAONMi26I48QrGVvfApuL
         GcvtuB54XQQAJL/z6JHMPGILGZCLdeZcIKswqkeJR6IEZCm6672OFYncA6Kak7xLtIdW
         Tqtg==
X-Forwarded-Encrypted: i=1; AKwUvBxsfbWFapRUZFNeGAe7ar2JCE6O5trzigBQoIFEWlNrwe+vuop5T+0hZTdqpQIyumpEXFTDx+Om5zRebJ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvfGj7BpAMS6kzdj1EagsgP4ShLARIZDvVfpPM8DH+sh9pc0wd
	9oXiY1xNsDGdMuKrLn9Aw6n14WbsQDOTyyOvq0UT7nfbllRNrfYfgaCM
X-Gm-Gg: AYBFou0h5UZ6cAx90y1/NVuGPTUXgG2aYrgg69hLkGu3ioFwgVJKSzL2Rrj1OXLFyqW
	cPuZmFjysuHR29u1ellCpv1aOiZ/i1nnyKdk7qXDmE/NpFV3W0A4d81eYKxScJoBDxtWxkFR0Fb
	Pv7h0/EsCriACax5PgbeO5YHPZ4V55NjdFJaRDOTHencQVA4xUJs3JOcQ8EcP+JKbntOPS8JA3T
	fT/2zPq9KT/oh0/VKhEmE4avF9nonmkLvbwQNCECg3z9yd3lIS2z+teNstq1ihLdNawLjCDKVjk
	JBsQ7ISrr6/EX8bK7RmVCAV2azHO6jWzq1fJwvc9NbTJMDPT2BR1chSjIvaCUNyprBzitbeWq8L
	/KTrb/63gafsOeD9nOzz6KmkPGhFWzJTaD9wuDqCuC9VSvNsgQVeW5Tp0qF8TPTMSXB/Q+iy1jD
	8DvfnVAGBBjhB/3UmjvsSYXFTv5jxDN3lzqU7JDYLzXZiEGI5olLlGmE1xcjntFk+R75K7bpoAm
	iQ/Cl/0x9TdVOrsLQbZsEe0tphGC1EIpoFvkRPpstI+1JYig7h0SpYgIkSkRtKr9z72YWkAuvw=
X-Received: by 2002:a17:90b:2886:b0:39e:6c6a:6577 with SMTP id 98e67ed59e1d1-3ab3a966524mr12662885a91.58.1791959591652;
        Tue, 13 Oct 2026 23:33:11 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:33:11 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/13] ASoC: codecs: wm8737: Fix definition of zero cross switches
Date: Wed, 14 Oct 2026 15:32:37 +0900
Message-ID: <36cab58287bd24955e73bfe3a6fb24cae8fad7b8.1791959026.git.sammiee5311@gmail.com>
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

The mic (xMZC) and PGA (xPZC) zero cross bits are bits 3 and 2 of each
channel's Audio Path register. SOC_DOUBLE takes one register and two
shifts, so both controls only write the left register. Use
SOC_DOUBLE_R, as the Mic Boost Switch next to them does.

Fixes: 2a9ae13a2641 ("ASoC: Add initial WM8737 driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8737.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8737.c b/sound/soc/codecs/wm8737.c
index 33a3f88fffb3..0734f6032c8d 100644
--- a/sound/soc/codecs/wm8737.c
+++ b/sound/soc/codecs/wm8737.c
@@ -148,13 +148,13 @@ SOC_DOUBLE_R_TLV("Mic Boost Volume", WM8737_AUDIO_PATH_L, WM8737_AUDIO_PATH_R,
 		 6, 3, 0, micboost_tlv),
 SOC_DOUBLE_R("Mic Boost Switch", WM8737_AUDIO_PATH_L, WM8737_AUDIO_PATH_R,
 	     4, 1, 0),
-SOC_DOUBLE("Mic ZC Switch", WM8737_AUDIO_PATH_L, WM8737_AUDIO_PATH_R,
-	   3, 1, 0),
+SOC_DOUBLE_R("Mic ZC Switch", WM8737_AUDIO_PATH_L, WM8737_AUDIO_PATH_R,
+	     3, 1, 0),
 
 SOC_DOUBLE_R_TLV("Capture Volume", WM8737_LEFT_PGA_VOLUME,
 		 WM8737_RIGHT_PGA_VOLUME, 0, 255, 0, pga_tlv),
-SOC_DOUBLE("Capture ZC Switch", WM8737_AUDIO_PATH_L, WM8737_AUDIO_PATH_R,
-	   2, 1, 0),
+SOC_DOUBLE_R("Capture ZC Switch", WM8737_AUDIO_PATH_L, WM8737_AUDIO_PATH_R,
+	     2, 1, 0),
 
 SOC_DOUBLE("INPUT1 DC Bias Switch", WM8737_MISC_BIAS_CONTROL, 0, 1, 1, 0),
 
-- 
2.43.0

