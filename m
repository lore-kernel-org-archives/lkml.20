Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCAE459AC7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254825; cv=none; b=N84o5aEgqC6T0Srlhg+L6Afk1shrF3pPIJyHvrHQw8tjEgyv0kVOz6EvBpK05lwUzrrSEaGCZMjKFmZtSTMRJ4W48Xkw/pXImfUQChPoD8Iyc4T8Sndm8KZ7pPs5TUJT04mc7RXSc61WCQf9U80U4luqttfZXIjK1XSC8GFM5lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254825; c=relaxed/simple;
	bh=U1jq7mqCQyHs6vQpqHJXpW79DmjSSLoLTMuyETHeyIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TRo4BPBS2ZjTlzWheyG/uXXWF+lQW1FfeKfYki8Z0NVA6BdPlDvzJnnyUrvb8PMoqnFVLphjtCbx+XZ9M3tkKHz/DqDSlr7r1J1pfejO5WKCC3MEkGHZDTS+71xQ+QAt4RJ607ET62OcHH2TqAPZne6gwEnnMgDGM/lsAmb50l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=Awp0pORd; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="Awp0pORd"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109fafddso136690385a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790254823; x=1790859623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ocwU8cQk2ldFSEuc+V+JE9BeEEvSRHBC5G3LMkq6bI=;
        b=Awp0pORdEf0GMafvqz5hvj8jw4WWGo8AJ2gUrXsoRSbE94gIrPNbgfm1Bv0MuA9cdN
         dauA9lKTWI/0MhS1MD+L2SitarySJpBqC8kbi1ihmmYwurNBjikPPEiYk3dYN1024yNk
         U8v+bsaUaNYAKN0TMoLjQcRC2ZmlccukOajW8d3SfWiH4GL8Dm8KaCNMLlF6b8ZiN8gG
         AnApko7BhEcyNHdpdXm/A2mjgJURpEWDpof3WEisbD2uCRGJjp6ttET6fX4nM6Gg3jq+
         ospOw1cAJP80/3A78VJEofbQcwYFSauHTLYf5fr5e91h/D8xoMnWj76bHmVw6RXEJV2m
         MAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790254823; x=1790859623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ocwU8cQk2ldFSEuc+V+JE9BeEEvSRHBC5G3LMkq6bI=;
        b=bmch+UNvFSGaFefVTpal3R9qFW7IpbqHgOTbDYT98ImOjgdDj+X0mIQjb0cXs89aye
         a34XkbvJRd8zj1VBftGIDsbVv49p2C7cbGd96zbvCFE7cUFrCXQ9kYBrBKp6Wa/HZXpz
         gyQauQk5X+hRSiUqxMvQVjpO6rPHbVB43rIGMgQHMgFukifwXHsRpK5CkAO0t7KtQ1pJ
         fwD3RsDOSVXjhkZEOwTCqAvJuOsYxl9/SDczQyyYt3+om5kAU6rzyUO3gJIp7gdH7meg
         ARgZH3z2o8FbJlBE4ilwHncWqizoVwV6LrRvapHzvdHD3ilUHDpcSh8BCpucL1Qj39e6
         owTg==
X-Forwarded-Encrypted: i=1; AKwUvBzTO/yLf+ACRjRZfRdLpH3EIFquLF+47WR3fk63sFdpIDsoIYUVXZ1QIzlGQH6nzIxw32tdWa7lBAyzPBs=@vger.kernel.org
X-Gm-Message-State: AFuF++kK2x6M3ymnSFLRoaRW08tT7a2tcHH+esnFugAmAFsgj0Q3LRY6
	LShs3Z2cXTI36kQoT57hEb8l7mQw/eHhvFhtp5g9IroGSvU392O0CDHtpS4jt5G+4Pg=
X-Gm-Gg: AYBFou2Wu3XHqf0gmD5vx0tsPh6nYmpV8aMqfW0UmhR25iqiBuRctPWyuiBJO55zxTv
	XXiAh9EZWcnHsxeTe0uM7NJcchYE9r2TALaaNq2joqHvLx3jv96fHuS4B43/If2YoCQo+sYHmKa
	Djdt72V7CL0Aq4FSUKeTaNOQjS7lLiy7dOvCE2szj2jotu6LYKFXvg79y83m3mTYUgEMEDAjbLQ
	4oJ80BbvX0skb+qUQbINCEkRwrib1ZnNS8AJvP4kwgU+Nd2CMA9/YXdU3NnGUZeFmE1T/zW7TVr
	1C6swlxa5NMaLpmYQvslF8YgW4H4TdKUBpNXJDOfH3JqbCh4qABBEnBUXKcLlWZoi5SMqfe46Mz
	8dw0DkZqr7k1YUtq5kH0nk/I2EY1tTDHJeFpUwCmP+MJPaGV9lTFP8Z37SOgLJV+slFt7BYoRxX
	Vg6+42AV5L9lDnZ8Uomw7MdJQv8bYEZ8zlYGNWfpsE2V+bURz2
X-Received: by 2002:a05:620a:700f:b0:939:a9d4:50b7 with SMTP id af79cd13be357-93c362d1a82mr302707785a.26.1790254822482;
        Thu, 24 Sep 2026 06:00:22 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2f3c6fdfsm285000185a.45.2026.09.24.06.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:00:22 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Johan Hovold <johan@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liviu Nicoara <lnicoara@thinkoid.org>
Subject: [PATCH] ASoC: codecs: lpass-wsa-macro: rewrite the interpolator volume after enabling clocks
Date: Thu, 24 Sep 2026 08:59:40 -0400
Message-ID: <20260924125940.22665-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 902f497a1ff5 ("ASoC: codecs: lpass-wsa-macro: remove useless
gain read/write sequence") removed the read and write of the digital
volume register in wsa_macro_enable_interpolator(), on the grounds that
writing back the value just read does nothing. The comment above it,
"apply gain after int clk is enabled", was left in place.

On the Dell XPS 13 9345 (X1E80100, four WSA8845 amplifiers on two WSA
macros) the write does something: a volume change made while the path
is idle does not take effect when playback starts. Lowering the digital
volume from 81 to 63 with nothing playing, then playing a test tone,
gave about the same level as before the change. With the rewrite
restored, lowering it from 81 to 69 while idle played audibly quieter,
and restoring 81 while idle brought the level back. Changes made during
playback take effect with or without the rewrite.

This is the behaviour described in commit 46188db080bd ("ASoC: codecs:
lpass-wsa-macro: fix compander volume hack"): "the volume registers
still need to be written after enabling clocks in order for any prior
updates to take effect." The value read comes from the register cache,
so the write pushes the last requested volume to the hardware once its
clock runs.

Restore the rewrite in the interpolator's POST_PMU event only. The mix
path event removed later in the same series is not brought back.

Fixes: 902f497a1ff5 ("ASoC: codecs: lpass-wsa-macro: remove useless gain read/write sequence")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>
---

Notes:
    Tested on v7.2.6 on the machine above, by listening. This function is
    unchanged between v7.2 and for-next; the driver's clocks moved to the
    PM clock framework in cd054a6e272c after v7.2, which was not tested
    here. Build-tested on broonie/for-next (arm64 defconfig).

 sound/soc/codecs/lpass-wsa-macro.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 4242366601a5..899c8bee4645 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1849,6 +1849,7 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
 					 int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	unsigned int gain;
 	u16 gain_reg;
 	u16 reg;
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
@@ -1890,6 +1891,8 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
 					CDC_WSA_RX_PGA_HALF_DB_MASK,
 					CDC_WSA_RX_PGA_HALF_DB_ENABLE);
 		}
+		gain = snd_soc_component_read(component, gain_reg);
+		snd_soc_component_write(component, gain_reg, gain);
 		wsa_macro_config_ear_spkr_gain(component, wsa,
 						event, gain_reg);
 		break;
-- 
2.55.0

