Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF6552123C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547999; cv=none; b=H3Sogqk1OyhiRE8vXgXXsP1OqLLrS9MYMHhHGLq+05L0mEfAQlelVWH2xR8DyQhy2eY7nR+Dxmzw/L5na+4Kd8JXuieW3OoKKVlVaTZ8kvCCK7RZiD8fKNhKd98iITNmTxXO2GIH+FS03aeK3/23wDRlmM73cD7pn1cpR7srVao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547999; c=relaxed/simple;
	bh=shczN+Wd1phO1G5nIqYAq6HteSzRw5Np9oURkf5Lq7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T/YYQddASVsnEpW+fsivU9EguRUh1vCKL2EypBwfxMGZYiLFoph8GPGVdIVqdBDy/NeJuGUdFpeKoIG1WVIA4MmjxFpmrnyHIcaWusOu4uVopzkTptC1VAYvkm8xv3ya6aXSHhCdSCRyanyyp2WQU7lEPRD2T5HKpJhTnoukyRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cw07MPRg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cw07MPRg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so16951315e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788547995; x=1789152795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kR2H4mZOF5MD1bZlVKgICjhHENz8kmhN8v0njF7dUVc=;
        b=Cw07MPRgqf+qAUA2jhZhGpD8omhkAS0e9GPV+J0oGudKnshqc+TKw1n+02r5nwjVmT
         46sfJIJIqhOTXKbFgFnYblzCsjSEp0Smc43jMQ6IDyREVrYgOzsYlx3v0rZt3Rs6tt0f
         dbl3/b2KqkyMxP9Je2crjAS0hehnIupyMVplahJ5IbasOZ5helhVp7XFDGBxeZZwWIMg
         aLHLrdhJ+SxCXvLN1PLxG09NTyq8QTkiQZ48qaWcMTmNPUkPWKFBtJ6KZ2bE3DX3U+Cc
         9jCY1Z3M4yj9a0ce0mHfpxXsviADz7DIdM896hZOWgNgEB/bkL7YV/g13EG4OOaXdtH6
         fSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547995; x=1789152795;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kR2H4mZOF5MD1bZlVKgICjhHENz8kmhN8v0njF7dUVc=;
        b=GkAwpmKeEo/R3BIAhbOLh4Jgx5pFRFkzOAmz3zjnoBKUyGOl8o79SNZChzFIZiZaXP
         +iBth/CvJDf9goJZG2kjKg69wYnZWe3wBjCqK9FY3LXkdJb9IHm+68QiJ3zNlrLSqvnL
         EnzyGFoQdRKbw/44tV3jh1daB/nMxzRoq5mFPwUdmnTJHLGC4isl7V3PFKJ6RLSzRXb+
         ZRpWZEEA9v+gBTMWoWNWpWW8TJIxFsbk43uZGJ4FzUCsTDtHpbq1RllDMBAxSuWe2PpR
         btkjHpRfLDR74YqF45Fxs4zDx6NL04FxfTdlDSPuH7y4umBgpZkP7al4JI9S7rL95PCh
         /1Ag==
X-Gm-Message-State: AFuF++kT3ZgPRLp2hFqKQFCnGjPLc18mzV9tg3v1xQg/toAKVRQ6dxqq
	6V2w7LEF7DIeECSFxRBheV59bIZBkxFP80JkjbennykiPjLNMy76vDM=
X-Gm-Gg: AYBFou3maD1KS5NZ7QraJGm04keOT9sD/QfxAq/n0ggwRRPAYUo7UIc8qomTC5pRxdk
	em4P3AwlNHb/XUTm6VjkcXlLFIIXeg3K4h30Plmt7TjhWVux1lxnoMtc2h9wWcFTOeWEE/0QMD3
	//S545e/EVdz62dEUU8K9scvgXMv8aU8odtwK0NYIJaG5tg/v9dJKlnadjSA5AOycgQqW9y8V+6
	Fp0JWsFJfbYnKC+iqUP1ELdBOAosnMyQ5FPUrlDYFVRfDrxi5eYBC7ie0BF+ie/OYRVUuSm+2dL
	oa68m3JdRZVyrw2d2i6WzD+LxHOAN78lHmChbEYDVZXX7cEkwYRdNGhpGRTVQfyGjwl0594V8uy
	uE+ZvI8tubSBNbKn6ob6IxzqbBRKhrdQ/54ZOZURhuAVAFN1QEki6mwI1hdfutUkZEkSEL/gPK2
	EaItg40YU7z6aNi22bQOfjnmY4WbnwZZl6SnswV0y6kqkYZ8xijEs6kRgc3efH5pQ4WcFI0gbGF
	otfy5cy9y1QZmlnzPwTaSO09IZYjAe5e0tSAradwRGNorXEiAYsg4CYF0wEU2pnwQmBMXj0oy9f
	xqhk
X-Received: by 2002:a05:600c:3e0a:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49cf8267a36mr95296185e9.12.1788547995236;
        Fri, 04 Sep 2026 11:53:15 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbe5b252sm58607715e9.3.2026.09.04.11.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:53:14 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] wifi: ath9k: skip the old channel's noise floor on USB fast changes
Date: Fri,  4 Sep 2026 21:52:53 +0300
Message-ID: <20260904185253.809209-6-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904185253.809209-1-nerijus.bendziunas@gmail.com>
References: <20260904185253.809209-1-nerijus.bendziunas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ath9k_hw_reset() reads the noise floor of the channel it is leaving to
keep that channel's calibration history current. On a single-chain
AR9271 that is three register reads, and on the USB devices each one is
a synchronous WMI round trip paid on every channel change.

Skip the readout on a fast channel change over USB. The arriving
channel's noise floor is loaded as before, and periodic calibration
updates the history while a channel is in use. Only a channel that is
left and revisited without a calibration in between sees an older
history entry.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
 drivers/net/wireless/ath/ath9k/hw.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath9k/hw.c b/drivers/net/wireless/ath/ath9k/hw.c
index d204cdf3fa8f..64fefbec46d5 100644
--- a/drivers/net/wireless/ath/ath9k/hw.c
+++ b/drivers/net/wireless/ath/ath9k/hw.c
@@ -1878,7 +1878,13 @@ int ath9k_hw_reset(struct ath_hw *ah, struct ath9k_channel *chan,
 	if (!ath9k_hw_setpower(ah, ATH9K_PM_AWAKE))
 		return -EIO;
 
-	if (ah->curchan && !ah->chip_fullsleep)
+	/*
+	 * Over USB the departing channel's noise-floor readout costs several
+	 * round trips and only feeds its history; the fast path reloads the
+	 * arriving channel's noise floor regardless.
+	 */
+	if (ah->curchan && !ah->chip_fullsleep &&
+	    !(fastcc && common->bus_ops->ath_bus_type == ATH_USB))
 		ath9k_hw_getnf(ah, ah->curchan);
 
 	ah->caldata = caldata;
-- 
2.55.0

