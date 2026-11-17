Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888823;
	b=DfhCt7X7lb1FgVL98X5yzPF0eF1xCHKBQtRTHg6/KjmUE/QB4i5pgOOEzql1Y90Ai8fd
	 hGAXK32UA+T6KP/ewHXQPSfnlghHZpczhM4yIqtNeZq8wo9SBSU3B0QX6yh+tmZVFx8Iy
	 wpdCvbmNBxZ+RRKOmJSl2Iw78wlqdoYSiWr0Ye2PRBahgF7oUYjtKji2hFeE1wRpNtSWB
	 d68Dn8bVTXlJtUJ80hX3OR25f0c9NOYyb7ZACvy+/iFj5Qm+pJUsQp1jA8jwrt7s1EXIg
	 NnNBsRGSiiu4F8M0JYNHs/pA8aRASron2vLNCXHqAliiqXoyS5P9+59la9fnvpbf5Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xaBQcyvWhB0cz+X9HCEzHnyDC+TDtuFefgVmaYYwRlA=;
	b=FjBRBkoZV/eGDe/lUI/ZbdeLPSvW7UqcriCVOukhCYor0sEZR/q2ZWCK0gjnRHaTQ0MY
	 XhTYbaw5NiL4dDUJJljE4xFYaYhnwRam+L1Va04UvdG0oz3kwnUzYspsflMlaLc0ZfUsC
	 mSbdAd+VK0g+x/4hHxnPhhTJqG5L1FtAF44LI3Kge60qq8Em115qg1Ma72QVTJsGuDzBh
	 rS+4otDQkIltpwMu+ZafkyLmgtwShiuX1c1LqCyJcNTkndrf103GV5Y6GI/1pGqPRzBfA
	 0rCPCnSx/dwRE7V+Oz4WylDLVCmmz8SrEDnlAxC5HBYeFWAphjXtYCq5NEIVIvrEkQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5WJtfav;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE940606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE940606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5WJtfav
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a594d313a3so3001933b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794888822; x=1795493622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaBQcyvWhB0cz+X9HCEzHnyDC+TDtuFefgVmaYYwRlA=;
        b=Y5WJtfavvBWy2qQK4qGinld1CQXCcnizLC8Ol+wdzNSIAXRTjLhfoKsSVo6VLeHF2J
         oYZMZ4/rppx4f4f9wejyW1XuxF+dR/jsWhcsTJLK43JFLm+598AkTnf1cYXD23FQbBxh
         biaGh21t+9UMVkbUVk0tvtNPNxre46U4PpHA8IiCPeSX/tZWs1SbXGOHPbFS81Ww1iRf
         CKonqQx5GgNjf9ptU92erf28LyPuF5BFxJMyHC42dOYtB/3vnIujRigsLHVBNbrMhooz
         eArJdQ4rAQSpICE03hrYGofc//+YvJjc02zBSOHVs8/2USfwJRhvcAXF7A4KTezbIswt
         /APw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794888822; x=1795493622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaBQcyvWhB0cz+X9HCEzHnyDC+TDtuFefgVmaYYwRlA=;
        b=OC3j8cxXSurlqmzYJB6dNyuCIMegegoT+0F0ghK3KF1bEuta5tTXg2H5GgCkzBjrAI
         2z6HTX9veJR5ryps0A9XRRfzLSTIBFlGZ9jT6vIsC4SWWTwc3M2YV2Ke+TJcf98Uc/dt
         qXb+N9lijJgFDC9NdDMxtwqDzJl5ZfcDfr2tkKXq56wOpLX2PGmiC4f3OyTU3vXl3NsS
         oOAmqs5YGGixYhRzy9u0VCWTXdOahBbSxZdnG3OKqE67IjLZZsE2L6gVVpa58o0f09dY
         iOHTeZVwLftkloe3/g16OG8l2Ur7xo39IUQL1YmEadKjgRj/NOtJ5ePLkflIvjGbQXFc
         K8Ug==
X-Forwarded-Encrypted: i=1; AL+hErHj5y5PBQl+01WDbLxYpIeVc1d3urWtHb8o+JJ3V2gLLdvqlDPLdI4imSDNWo7eeUgidWSLENahRpLByfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XevIyG/UlmhA4EiePSrkkuMQeD1Xm7aLYLqKCzo+e9KX1yEFB
	3zVNUUhEYB2jZxG0W9Yvv1k8MT6vGlnNKsEbBKPtwBiWIXCTzTih1femvtSfYMjh
X-Gm-Gg: AYBFou3QXNRIW3wc/wWrGP6JH6Rjx7KineOsA98NtIVImSLX4+9V5e5bGBiXAOniMtp
	KBH/9/zVmueBIchbLgA8mzV2aSbvjteeboMlX+YqZaYvOy2aamvRLOS4Z7hWRlOD56J4i5IMuKr
	byfDr5uBq2fC/V25rvspb/L1LAq5Wmm9yyapUVR50BMV9xFzofrDJVhhNkeRoItplBKO6sSo6fq
	qBc64sPjZnv2hD8tMaj2DXHfwxgCHJStPf/e3dWioBvgc0L1q5Yo7f2v+oFRRzVH1z9h6eTQO43
	Q68kKAHWXJpGiLSiONIy0PRujNgZMpOZhDEFMWGbpO4qAnSycgEi2PKHDhlQRgdcEDDhw5HOqwL
	B4Lli8Uxu6zn9nfY8FJHxVUa/7sbDL5OJDIoHCDtRn/+hhQIcaOCTWNHIUs9ApekaO8i25JNJIM
	P/A/GhOMevGcKsh7+9Wqiry9mqiUhBLCQI4egN10dOX4CjX76H5isNgVk1YavQTjP1dm64uvoUF
	+3WbtZyssdiGCYcheTfhAIVQADEG/iScqiliVb7GWmI03zL3sij3X7KAKWk+Cz35XWe31+O+pOZ
	PlK2FgHCkNTuQNR0TxB894dy0LOzU7vSP1LUeMkbQ9tsWQ6a
X-Received: by 2002:a05:6a00:908e:b0:880:78ca:8400 with SMTP id d2e1a72fcca58-8beb58bcc22mr12493288b3a.12.1794888821899;
        Mon, 16 Nov 2026 20:13:41 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a902esm4414882b3a.16.2026.11.16.20.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:13:41 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] ASoC: rt5665: do not block workqueue if card is unbound
Date: Tue, 17 Nov 2026 13:13:23 +0900
Message-ID: <20261117041323.4010546-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 4561d07d897f ("ASoC: rt5665: cancel jack detect work on removal
to avoid use-after-free") added cancel_delayed_work_sync() for
jack_detect_work and jd_check_work on shutdown and remove. However
rt5665_jack_detect_handler() and rt5665_calibrate_handler() busy-wait
inside the work callback until the component is bound, the card is
instantiated and calibration has finished. If such a work item is queued
and the device is then unbound before the card is instantiated, those
loops never make progress and cancel_delayed_work_sync() blocks forever.

calibrate_work is scheduled from rt5665_probe() but is never canceled, so
on unbind its handler can also run against the devm-freed rt5665_priv.

Reschedule the work with mod_delayed_work() when the card is not ready
yet instead of looping, and cancel calibrate_work on teardown too, as the
sibling rt5682 and rt5668 drivers already do:

commit 4c33de0673ce ("ASoC: rt5682: do not block workqueue if card is unbound")
commit a6d78661dc90 ("ASoC: rt5668: do not block workqueue if card is unbound")

Found by static analysis and code review; not runtime-reproduced (needs
RT5665 hardware).

Fixes: 4561d07d897f ("ASoC: rt5665: cancel jack detect work on removal to avoid use-after-free")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 sound/soc/codecs/rt5665.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 4f7b13571369..27744497033a 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -1194,19 +1194,13 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		container_of(work, struct rt5665_priv, jack_detect_work.work);
 	int val, btn_type;
 
-	while (!rt5665->component) {
-		pr_debug("%s codec = null\n", __func__);
-		usleep_range(10000, 15000);
-	}
-
-	while (!snd_soc_card_is_instantiated(rt5665->component->card)) {
-		pr_debug("%s\n", __func__);
-		usleep_range(10000, 15000);
-	}
-
-	while (!rt5665->calibration_done) {
-		pr_debug("%s calibration not ready\n", __func__);
-		usleep_range(10000, 15000);
+	if (!rt5665->component ||
+	    !snd_soc_card_is_instantiated(rt5665->component->card) ||
+	    !rt5665->calibration_done) {
+		/* card not instantiated or calibration pending, try later */
+		mod_delayed_work(system_power_efficient_wq,
+				 &rt5665->jack_detect_work, msecs_to_jiffies(15));
+		return;
 	}
 
 	guard(mutex)(&rt5665->calibrate_mutex);
@@ -4652,9 +4646,12 @@ static void rt5665_calibrate_handler(struct work_struct *work)
 	struct rt5665_priv *rt5665 = container_of(work, struct rt5665_priv,
 		calibrate_work.work);
 
-	while (!snd_soc_card_is_instantiated(rt5665->component->card)) {
-		pr_debug("%s\n", __func__);
-		usleep_range(10000, 15000);
+	if (!rt5665->component ||
+	    !snd_soc_card_is_instantiated(rt5665->component->card)) {
+		/* card not instantiated yet, try later */
+		mod_delayed_work(system_power_efficient_wq,
+				 &rt5665->calibrate_work, msecs_to_jiffies(15));
+		return;
 	}
 
 	rt5665_calibrate(rt5665);
@@ -4840,6 +4837,7 @@ static void rt5665_i2c_shutdown(struct i2c_client *client)
 		disable_irq(client->irq);
 	cancel_delayed_work_sync(&rt5665->jack_detect_work);
 	cancel_delayed_work_sync(&rt5665->jd_check_work);
+	cancel_delayed_work_sync(&rt5665->calibrate_work);
 
 	regmap_write(rt5665->regmap, RT5665_RESET, 0);
 }
-- 
2.43.0

