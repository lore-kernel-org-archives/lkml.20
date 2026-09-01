Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2D243B3E5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277168; cv=none; b=MIILnFvPuYKB3plBDnniDxpOb9WOcOKVjeBB0OL3019NjeW0nsE9de0ORJWZaTU6LI0ToXiFEwiVqTNm9aRFDJXlmYakeub0SA/IV+lVcB/iqPcl2vkc1UT5bLQEZOa0cNmircOLkUoDZ5PKQWnmiNto5CkjsnbBBRsFsbGFcTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277168; c=relaxed/simple;
	bh=qkr4q5KdgXJEfFYuUUIrj4vkmS93yxMLGX/Z6JiOeSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OUOi2PPax7XwyOkjkiignFKTuY4kcgDwrBtK/gSvE7JE/F1vJoxjcsq+qBvv/Nkn4ss3tE45fibJwJQeWrzoBOoUA8VmIF0NUb8KQbUkDCDpB7qLbFEXGGk00YKxRVolCuF+TZF/OmXy4spIRLex2OV5XETqusct6SXocnEPw9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5o8fpxM; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5o8fpxM"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d9201076b3so29379455ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277167; x=1788881967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nhXsLrMw6uGJqdKD+EVf9KpbhezP2a9NqvtLPXOgVgY=;
        b=k5o8fpxMX6hspHCekG5S4121CWmOkAIBb/OxdlwyRbGbTQMtcbKmQR4aZab9rDDZ6z
         nCF/qv+rgMCpCScPwkmKopoqoeNJMBHp//SZ5ojL6I7xqFuJ7f6WZzrWBBUh/ZUuwDB6
         VmrK6ybKwz9JLNiU3WfugjJDBx1L6l2bheAGl9451gDnXdFfU7+P94wYgwdic4w0QzKi
         lcX/FpzbP0PuJiyCwy6zqLJ0V2uXOZCn2AxP3xnmfgnRksz80Ro5An2cFzCyAWY9SjkP
         H6Y92+wpywVpPJ26rbBdm0m5RSpsIAYW9y8UXpxVO5Iy17STmPluliz0lVJV004Ja4X0
         WC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277167; x=1788881967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nhXsLrMw6uGJqdKD+EVf9KpbhezP2a9NqvtLPXOgVgY=;
        b=tPzF1zZanZFKaRt9yT6kaQnBYjSxmaSpPhfeEXH2rCNPyCJxmLhCX9deFGYU5sXSH0
         1mFQCLzd5Nyjf5nDBgDuUhnpQe9y/a65lhOnyd6M0chs+g/XUp9hD7M+RtAddV7kqUqc
         R5eajr1e/ioHi+OjP2+lRLe4VEcDTBkp7XTCNWqAGCBdycnTiSsPJKS+VY3k1FGGbArh
         p1MWy8TX14rNEpjDmbTvrRaZZjW4YpPjErfj3U36qeCN3HQdE5K3ija1BwRrSenRr3uc
         2Dk9Bv7+vaH+13UNsqirLsoCZnnXU5yTRSolNB55TpDHGoki6gXUOKV+Vgd3gAqt/LQo
         2bGQ==
X-Forwarded-Encrypted: i=1; AKwUvByYtWuPWEFdZZTlZewBZW//AI5ZO/tdLMCww4XaNj4cZiHMOlrxwle2OVMlGGsjHkaJ4G/OJK0D9XxC3pM=@vger.kernel.org
X-Gm-Message-State: AFuF++m8Nx+ouFQaCr8+rXKFrFJVJW1l6nvoIcS3WByDSfXXEcVaEQEJ
	zdpwMdAECzzWCeYowdfZo0mGWbmkxRGmgjbYrxx82rv/Czl5sg6C5U5c
X-Gm-Gg: AYBFou2/MiuKlpA4PbOlYMkRNGpLoGl9CJI6t/MY5GFUuwEPMWwfF8w1Hq8EQ4Prz4w
	TaXr/SCTQR3L0HFpcqN7PeMxGFfPtlyjZIP0cGRLH/l1ZFhXx0y885Fk4ksPno/KlZAW1Q3nnQR
	ILJoyIFxba97aQBxyCjHOR6ZoW5CVqe8A6fwXwzgdCVIekpK68AAF1WQcCJDAAKXnnKqFzXyEqk
	/WbmfBM5q+yTM79jivwWICS97ZjgPqAinnVPQwK31A6z53UufpcoZWYtGKj26iW8mndYCEYESPu
	4mr1DOEsAbCDarbfGcSS5jUeMvu0GZqSDcF/RDOG9W1hkbGw3tOKFgUQRTuWDq2xmSgtDaaR4m8
	y2+G381LRylLs32U7peifYvDM1tpfNLDWjK1kSvYD6Nl50dLkmIvtVvvOyrM7zycdx79C9fIDWa
	EPvYs87tGY0tQgeMxR6lfhrs/Zpkc2Dw6ojNakMTdXQcGuoY8klBpCxj641GyBiUW1wMBLxO2k4
	mfBXIChBTexlMU467clEIl2EucMLLz2hxysL75IYJtA4TxSknFBWvXbp5XhONyF
X-Received: by 2002:a17:903:40c6:b0:2d8:d4d1:3139 with SMTP id d9443c01a7336-2d94a935f0amr125871055ad.16.1788277166534;
        Tue, 01 Sep 2026 08:39:26 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd488640sm906095ad.53.2026.09.01.08.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:39:25 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ALSA: dummy: Report a change when one capture switch channel moves
Date: Wed,  2 Sep 2026 00:39:21 +0900
Message-ID: <20260901153921.3971-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The snd_dummy_capsrc_put() builds its change flag with &&, so it reports
a change only when both channels move at once.  Writing a single channel
stores the new value and returns 0, the control core then sends no
SNDRV_CTL_EVENT_MASK_VALUE, and a second reader keeps showing the old
setting until it polls again.

The volume put a few lines above compares the same pair of channels with
||.

The mixer selftest already reports this.  With snd-dummy loaded it fails
event_missing on all five capture switches:

  # CD Capture Switch.1 orig 0 read 1, is_volatile 0
  not ok 13 event_missing.Dummy.9

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Claude:claude-opus-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
Verified side by side on 6.17.0-35-generic.  The v6.17 dummy.c with only
this change built as a second module registers as Dummy_1 alongside the
stock Dummy, and mixer-test then reports:

  ok     6 event_missing.Dummy_1.10   ... all 11 pass
  not ok 90 event_missing.Dummy.9
  not ok 104 event_missing.Dummy.7
  not ok 118 event_missing.Dummy.5
  not ok 132 event_missing.Dummy.3
  not ok 146 event_missing.Dummy.1

The five that fail are the capture switches.  The volume controls in
between already use ||.

 sound/drivers/dummy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index b908d2564aee..3f6bfee29986 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -808,7 +808,7 @@ static int snd_dummy_capsrc_put(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 	left = ucontrol->value.integer.value[0] & 1;
 	right = ucontrol->value.integer.value[1] & 1;
 	guard(spinlock_irq)(&dummy->mixer_lock);
-	change = dummy->capture_source[addr][0] != left &&
+	change = dummy->capture_source[addr][0] != left ||
 	         dummy->capture_source[addr][1] != right;
 	dummy->capture_source[addr][0] = left;
 	dummy->capture_source[addr][1] = right;
-- 
2.43.0

