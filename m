Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4883D3008
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176008; cv=none; b=ENcTl0wbvOMoHmmC2XXI5AQ2PZqPGCm7nVSeY+c/7aH06MDpfhmdoZqKUO+iJSv7Hz0amPVrdOj/yGSHnlakJxpAU9NTrarlNQS6BzC1mm6bTjOJrUnz2J0rDBJNVnTQWMPiadsh6q8fzGv3FrskTQzuzAp+qpRhB4bHq+/mPa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176008; c=relaxed/simple;
	bh=h18x5qh3r/K2uj+PUBPj504Z+VgTxPWjoOZOzfgxBqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GaBVegYQUFbNoONty89rj14pmjxMGzPF93Py8QBSoeNSEIpPB7OhsGZb2Ji61zlQMq4TdW2hDGyhGOvSvkjkefpbGljk5rxD+QKeIXMDrvVNtBtQgjbU2X5eGCCtADWqZSFC6NoHNrFfgervHh12zClxvlEWsJRBlC7ku3ZSJqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mkcpy7ca; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mkcpy7ca"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d6f9e2f681so30772625ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788176006; x=1788780806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XW1fv0kwi/nQ3dGRXBHzXPUX6o/kxBDhAxFNh3mGUUQ=;
        b=Mkcpy7ca0dLTqm2vpU+CjVeDfIk2v4plckPsBdSZvCzngp1rTyqfGTCmawkzu6/hDe
         Rz1UHMOjhKoVLSezlmOcf6emLUuQWf4OtrP/5UpVRKHitKojhcqNooz5NGsedsFrJ0pQ
         F7lCJCC0Akrgtpk9orQG4jXmyaEWpHTrXWJqWr779LnWdee41pz5ha2dL3Q8UQZDuK4f
         6RddyBHQr/VJzBMyd3mizQUMMZbl0jiYQdPSTYqXqJik1a6XaCI/w0an/tFFp0bTB6Wy
         zxNH/RGDSpPUFPa22kiLOswJC4U3L0GsMY/U6VvDj7kW0NNbyW1Tr/vAE0zcAJzPu5fK
         Tuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176006; x=1788780806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XW1fv0kwi/nQ3dGRXBHzXPUX6o/kxBDhAxFNh3mGUUQ=;
        b=ZEkOkypoBV1ikriVP4wyTSVPPS13n/qc3vBWH4uaq2gKdTDd46hBEHPjuk2ALkZyTO
         z4vVwNga7uDxxoSjNSlJKyrgxvH4YahXUc8cMcRF/38r+QmE3+6zLR9ZQpxlF3PQaBnt
         qe7FZlXS6WYWsW/bcUIvhXVXYNovJ961UryTcfJOFumAWJVFB6zTfV8LFLcfkZpq3y3Z
         mTFcW5OWEK/oAAB9Onr1bXtAEWianS6DBv1jCboqvSLyhFIl39rR11HRIXPLIGP30PcR
         qMo8BY9viPs16WYEkIXMlE0+YHCJEIh+m4tAhp+ztumqXBLD0Q4gGZJiLrCkJOTXjynj
         KcnQ==
X-Forwarded-Encrypted: i=1; AKwUvByntmOfCzNOyf+87zGmUmCKq90IZ2UHdMa9cLurvpJLE8jMx5etpdzWpmUJo2LMmswV8I2LEAXI3TyWhKM=@vger.kernel.org
X-Gm-Message-State: AFuF++nbOtuMjbwywe7+3Hi7FD0/PLKlbrRdKOpDCxFIp1diZYDYO9+D
	d4eXpH7289hnJZPYqIU53PT0Y1rGKtZ3HqPjz0DQu7BuFzdF/pTOoGpc
X-Gm-Gg: AYBFou346V6OaUCl7HO4Ew3km+vH1i4p2RepYAkAV5GHjuDj9SBH01BTtzYA3PIVwC2
	9TExJhmizYHI87+NYxZMJeAPpzkE5FqcMLKI817au5MGCN+CZQCVWf+Lt+EOeQxjtbbV+l5SPQN
	/cREeBeKbFuHnICfU+8b2C6wxO0/6x+fgPfaD25nQPX+fOXDVJWvxsBTXMvVthHf37mkuq/dBsY
	J56TcAPxAAK4edtkQwupaUl/gdvXGBcOGsCM8OtTry8sVVP5k7c0IkgCg4fN5JmaB7cq+PhqISL
	2TPjXqXMNINHnGChJCtaPFJQ5L9xzWdQNxgPuYuMtmF6KkYTUdGkmh+0DyH3VPBFpt4/rRNUbKM
	klUQdqiXNMFfbt8CD20N2ydkSPly50u5FZpGs2Ar7H0m27yqE5Gq+Zvrb/VrnqLctZotVPEBwfP
	N9qLaZJDfEAEbe/sPls3F0b1ww5ZoUsjxg0t4qBc4d/pwn7MJK9/PZ3n9mc/ufUeZigV6lrZxC8
	6pJy/Cb210tkpNOtvR8CLPKv08Y2ox7CvH4/ysdfHPiCEV0IPdEzBxDIn+Dhy5tlN1clIACfpBR
	pRZtmWuhgytM7bODo/F3kzhYengV7w8clvEvHCIUer6EMLA=
X-Received: by 2002:a17:903:3884:b0:2d6:3c22:993a with SMTP id d9443c01a7336-2d74dbe96fdmr395526865ad.3.1788176005776;
        Mon, 31 Aug 2026 04:33:25 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm34111826eec.9.2026.08.31.04.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:33:24 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 31 Aug 2026 21:32:40 +1000
Subject: [PATCH 2/3] ASoC: tas2764: Initialise SDZ GPIO low
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-apple-shared-gpio-v1-2-e855b12e18ce@gmail.com>
References: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
In-Reply-To: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=h18x5qh3r/K2uj+PUBPj504Z+VgTxPWjoOZOzfgxBqQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlT04oyv55k+3NF4cXT29vvFYhfSD7A7TVvhaD5tDAH9
 U6pH3npHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKn++obhr6z92WVLP/QJBez40W5z6LJLu76SzCUd66dqfr5PlhS0LWL4n97hU7y
 eq69PXNms5+onSc8fF8QLUtttV3+6clXGQsOcCQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

On Apple Silicon machines integrating TAS2764, the SDZ pin of all
codecs is connected to a shared GPIO line. The kernel's shared
GPIO infrastructure relies on the first change of the GPIO state
being marked as its "default" state, and allows any consumer of the
shared line to assert that state without consensus from other
consumers.

If the pin is initialised high, the shared GPIO core does not
allow the line to be asserted without consensus. This breaks
resuming from suspend on Apple Silicon machines; the driver attempts
to restore the codec's register state and fails because other
codecs are still holding the line low.

Initialise the SDZ GPIO low so that the first state change on probe
asserts it high, allowing any codec to pull the line up when it
needs to.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index f9c65c9f6d0a..b3c08d106dd7 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -960,7 +960,7 @@ static int tas2764_parse_dt(struct device *dev, struct tas2764_priv *tas2764)
 		}
 	}
 
-	tas2764->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
+	tas2764->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_LOW);
 	if (IS_ERR(tas2764->sdz_gpio)) {
 		if (PTR_ERR(tas2764->sdz_gpio) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;

-- 
2.55.0

