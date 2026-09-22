Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4D72F0C7E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042014; cv=none; b=ITBXBsfeXrqtBRTBmihSKmTwSqgeFQP6oColAR7OjEIfEo1s0OL12VWl6GtuYhxHbM2P9eDJ7qrImIW26c4Sgi8ehl0tCsDmz7QbMN8hyWLmQmS93bWArRaeRlkxyap+MQIv7JOs/cRybg8fw5KNtfVHaASFs3dV5lsbBIsj1zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042014; c=relaxed/simple;
	bh=3BgYikqSax4HF0A6zgnHHnuQB1alfzJJhKARWIQRbhE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PncAyV0l/nGDXCrN1Pg0NqF5MEIYa01R0n3/ho4nDMsAvBwZKfTZRk6eMk9PFnx+RLROyVaL14hQpGdNpD/FN4r+BCs+3e9x35q4/4QHEhXRvRJt3lpH++spZrwPDXSqYXbtqxt93YTD4wdlIs0xLlB4nbEPnCwXPv9c116yfng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0A7KPqD; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0A7KPqD"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93be29bb454so410215185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042012; x=1790646812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ByHXe55/uuBbCQG8Zppw6bo6YHny9xMuvL7YZ42cUcg=;
        b=g0A7KPqDAU/BRD52u0DeQ795PUnt4z2wxmWUcKMnccLBXUfZ/JecrDV7N2Dsc0n0Qw
         +wu8Vrbb57fIYTs1FWnNHxI/p6G2uwMe0rJTc2SnmS7sD4SzFLA11m54grNk7CNkmAcw
         VHwYPVqmn/CjO7amfRXJ4Hw12rfg31Duqk2jJ9YVnB568rFnY030N32UkUdx98MJE5Tl
         Tsx+EDhBgx2QvDT+i7/v3OA576RpLZCvGQ7grePqO9dhY5YcdON3QUGnSTEvKdMhZQK/
         aD8f4uITXi3r2S8lAadDQNpxiTwnlTZnENhQGuBfLPWPj4jb8xrAXZGjvainyQ7dAN8B
         AmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042012; x=1790646812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByHXe55/uuBbCQG8Zppw6bo6YHny9xMuvL7YZ42cUcg=;
        b=HM9sHGfDREuJPZE4hFubK3ngMDLfeWLMRDu1S9lqkIvGkLjKz/UW9xxB2SDidlxmKJ
         fOTOZaZGzPWInU4DJepSAiQ7mVFSLLAttxwG+4+A6uXChUnapiZZW5mA2xKf7sdeO8P0
         CXE3M2PbR8HFlnNQP1fRMotXEa6KFUPqg6vHVRiS1ipiZYTCIe5SH3chStYM+OHXTX/g
         sTIsjj9W3Ey3G5tZUavIhBlpQFAYqTuo+FsVlYk0LSqg6BlQtYG3d1NloIox9+yTVgTk
         fx+ld3QYBP6nxV/PXOYCRe0lbxFQvL+SKAEGDFMAFT1sFimRctqO0VCHaHvozFOS2xzF
         a5qQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoAsxIvM1xxH7JETzFs8JBxxsJrP7nNxnDfxY1kVIuVFMyDYx+N9m4F+AySfK7/iBxnO9G1cIYb2CzHF8=@vger.kernel.org
X-Gm-Message-State: AFuF++kFOMnjLnyIpZMOpei0DzaGW74wBtnAcHAda/RPY6+tJvX4/vlX
	4uA2nuIWvdgN1WAaH/x5f0H/qm7vzt6sNKP0BkpCbi1pALndERuVYTo=
X-Gm-Gg: AYBFou0cbqwdbaQwDTQfNPTTh1WqA5AMmARHCewpsy1AxjT7o1VICxcvDwhDYhuJ8HT
	s1avGu7pjr+M0RnWJA7DDlq7GOKqdOIj8oT0yxRPBbhuyraZYPuVLuxgsidm2KCLKx61vM0ca4V
	9aPblPY65dMdupJMNwsMqydsgv1kO1lNyjHm/oNgk6w6jg2lkNdKqpCCJJK1f9Xy6+p06BLooSb
	OHIljsK3H2/WH83qv8Vp98rkyIjRRgmpMS+9egvin5WUjvu6UXrXkJLQvq285wf3MpaYuygbKEs
	lkMKceqEquDj+lwnWmCoRTb/Z+srO1Spf3t6EQ8Obaw18Gfh6f2ETqsrCDqI/sXzLolls4wO3Cj
	GmWW1fVNN6rqa3VwE8ChkvBzvlmGLujK4/bsDqywAzNKHssubaX0acC6jvG2lWf2eq19Ks6ujZP
	cvPjDEtwoUG1b1C/2btjMPB+zRsbL7dmS2Iz/j3xdhY2SPQ5n8TTGNkltNlUE6NDbP/X81Bhe/d
	JerPl2hCnWdSZQgiE/oiXKrsxFK5aZe90LKptl6qScH6jS3GkYmgfmiB/mzMbSoeNmKpEajper7
	Y/gL3mqXDX17R6zd20r/erUK6JlK
X-Received: by 2002:a05:6214:2128:b0:910:345b:4c5e with SMTP id 6a1803df08f44-914008bbd47mr17891176d6.37.1790042012011;
        Mon, 21 Sep 2026 18:53:32 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91402536633sm3857706d6.49.2026.09.21.18.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:53:30 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: rt5663: Cancel jack detect work on unbind
Date: Mon, 21 Sep 2026 21:53:27 -0400
Message-ID: <20260922015327.637137-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ASoC: rt5663: Cancel jack detect work on unbind

jack_detect_work and jd_unplug_work live in struct rt5663_priv, which
devres frees after rt5663_i2c_remove() returns.  The IRQ queues the
first work, a button press queues the second, and jd_unplug_work
rearms itself while the jack stays inserted.  Both callbacks load
rt5663->component before checking it, and nothing clears that pointer.
rt5663_suspend() cancels the works; unbind does not.

rt5663_remove() alone does not cover unbind.
snd_soc_del_component_unlocked() skips it when component->card is
NULL, which is true if the codec was never bound or the card was
already unbound.  The jack IRQ is requested before the component is
registered, so it can arm the work with no card, and it stays live
across a card unbind.

rt5663_i2c_remove() alone is not enough either.
rt5663_set_jack_detect() queues jack_detect_work even when clearing
the jack.  On a bound I2C unbind that call comes from
snd_soc_link_exit() after rt5663_i2c_remove() has returned.

Cancel both works after free_irq() in rt5663_i2c_remove(), and again
in rt5663_remove().  Cancel jack_detect_work first; it can queue
jd_unplug_work.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: df7c52168ee1 ("ASoC: add rt5663 codec driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Found by inspection; not runtime tested.

 sound/soc/codecs/rt5663.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 262d3bba1f3d..2430bce31b3b 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -3179,6 +3179,13 @@ static void rt5663_remove(struct snd_soc_component *component)
 {
 	struct rt5663_priv *rt5663 = snd_soc_component_get_drvdata(component);
 
+	/*
+	 * Bound teardown runs this after snd_soc_link_exit().  set_jack()
+	 * there can queue jack_detect_work, which can queue jd_unplug_work.
+	 */
+	cancel_delayed_work_sync(&rt5663->jack_detect_work);
+	cancel_delayed_work_sync(&rt5663->jd_unplug_work);
+
 	regmap_write(rt5663->regmap, RT5663_RESET, 0);
 }
 
@@ -3728,6 +3735,13 @@ static void rt5663_i2c_remove(struct i2c_client *i2c)
 	if (i2c->irq)
 		free_irq(i2c->irq, rt5663);
 
+	/*
+	 * component .remove is skipped when component->card is NULL.
+	 * jack_detect_work can queue jd_unplug_work, so cancel it first.
+	 */
+	cancel_delayed_work_sync(&rt5663->jack_detect_work);
+	cancel_delayed_work_sync(&rt5663->jd_unplug_work);
+
 	regulator_bulk_disable(ARRAY_SIZE(rt5663->supplies), rt5663->supplies);
 }
 

base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0
