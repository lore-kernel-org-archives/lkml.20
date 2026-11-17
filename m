Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913210;
	b=xenR6gir9xUr78Zk0pm34Z+yU8+oVe3ZeXFOs6ZgnY/EIRMjuMRebv5Y4x16dxLW7NWx
	 np31Zg1UfjmotHQP4TQAOby2L3B3ScAcgAvCs75y11JH2cVs7eCqN0iuvJvv7EeGwLw16
	 qlNLrPFXK+kHeSzqAJQhgYNinetljIBNVp+LltkvtLUnfvWaguwbKYdslnrtor9OH239x
	 ksdi4WAn9E4rhXBhSrVfZPD4NVoVuz18hL1Muq8R3EUZ4BQno5BfDMvdw4dmiTOjX7VI/
	 89bn5gQnLjaVtm4FKzMBUgusjidvARFXM1r7TqCfV9FiuHquIbuV72rwFiDzPFyOLSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xh+6CQ7ckakZkIzUsHaSg5bm3qFK+O0nTuR3w6guRzw=;
	b=Zkj66UTxncruKhVi/6KiP5gNNGoeweAeYsh/a/dacfV2zWEBhgBola2qRKC2xUrLk9O6
	 UchOjCwew4VE6iDLN0S1yISZVKSEynljNNGJBMHo5ViEPz5xSu0YNz9MQci8OUbwCK9kL
	 qfPO2iFV4huKzQxLm3y1yf9Xh0zhkmw0Yj06QQB3DqSbzWNjaCeUsYZhZW/7P6u8moHlA
	 s/MjW2DZmUQ+F6joHWzaqPsmoJ3P7Q1J1zmPSFzq8WfPgq4dJ8m9KpHMoudy11ZhuKZPh
	 GGjBPLUClUmLL0PZdq1cZHvTOt6UkjNy3qRkK5Roh0p0DuM3HwTzw2QuoLw9tc9MF5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sHkCqK+f;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15537606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15537606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sHkCqK+f
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so11425003eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913209; x=1795518009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xh+6CQ7ckakZkIzUsHaSg5bm3qFK+O0nTuR3w6guRzw=;
        b=sHkCqK+fj9Ck1Gk10qeytVIWdFQ9UuocK7441T8+S3uKrmqAX4gtRrvewUqfQrk9Ef
         NmoKDbDSnB4I5nicueN3MTlWGRkKYgtDIztBrwfcOkYRiwdOIcgy3P4Cg1Z9yiffLF00
         gGBOu8KbNxe6Pe8f5rzXLmHz0pI+mlCEfnW80EWxRX7RnQCCwi3Rqu9eyy375PN/TgOc
         vypYE0MC4QFvqo9Uk9FfvfL5wzzRmgSdOBIO6RU+cbi2JMoKeC1WQEKMCnfy5Ob2/K2j
         gTVXOkI0cnWB6zHEzdOEa5O8OqoHF4DBtDtSV5eJUm05KCGYMqPnSV0RKpJCgb7gk5up
         Q8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913209; x=1795518009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xh+6CQ7ckakZkIzUsHaSg5bm3qFK+O0nTuR3w6guRzw=;
        b=tvrfFVkrDp3SXAPXJaKRzP9III50ldSmk0cjjPUR8QAND361/SZO1OfRXkiMQhhJGV
         rck/u/rPkNL7zRJEvXInkOFwMYwqCeFpFYi7DnypBbI4QaXLtrqw+i9cg2E5oxZad9Ph
         +BscmXLBZcdGJgXbcit+Pr0cC4SGCwC4EvdptofMzceFEg+yX4nvWuY6MHJ26SmOGbN1
         hK4LyWKp0AthuZ3ColMLk6E0eapDC2YybhPpI4/MPgeTLD1UY8/MhdT782ccQOawRquN
         Y9rv7ioCaT/jNmRqMYCURkM+eZpKkXjwP07aoAJM98QDKHRyLtpVKaWJ4wnSy8VoTTsz
         IkXw==
X-Forwarded-Encrypted: i=1; AL+hErFa9ZHXVOIiM16HRTilS8qmJFTISBSWqR7qzNB3Om0OtKoxzNtv0+YGiyC1jt/pWuj2V8ipoW1l5EIZE/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k64wE7G+k7+oUyUzyfuzOO4pPui4XHaTA3vAB7Lru6ntH7QkU
	yDCJVWaRm2qFG+c6fJyqCCxHaA1LtwPhbnFq8ykcphYo1zXd3tGCFOVW
X-Gm-Gg: AZFdTZcD4ve+DbyxF1NHCgiGyhs14YR/eaxavg2WJoDyoqeGMP6AvJ6OotFA69fnw03
	8OIabbWitz2KgM6izoSpJiUAt0uDNyhby3IsrNdWqMP2y8AjBjigp4O1uVC5GDjVJKa2lj2rN65
	WjAinQsQH4MJVW4mwM/D1rMhpnOpYAOiqJhZKcd9euq1DozO8Ezo+6E/AU6VB2Hg+mP8y1iwCIN
	Bp5EJc8GBeSF+PfKxL5Kjx3tuD9lmmUtRn+2h13+0PNMqx1qJuk7N0168auH1+m9zyoO+gt0wDF
	lOIdAgVlAKKlXyMvazlgkwFZnFswbroJPhxWomvayk1cvJmDQ4rCHZvVeR6NCEY0G8a1vOJp2oL
	wtI3y66d7IGu7Nk5TSXsVUp6aIWkcpS5VYj6feHyyAeO5+POX0Gljn8K6GqZzIJvbm72UUU8PGI
	W3I4l9ny3QIVko7V8xUIyoQax8DjhKFQWK8CEiJsQ28qiTI7DBlGcaz2y4/iLVczVmyOCp6lvZB
	qcS8LapRIniNp0/ROkQFtVvtp4uaEXzaDIIT5rw2y1GtkdFIBzw12hnyOClv6nXnhRk6YTTDSI4
	BbQWM5QOjkzPKA0m0DhBwxu5i9JxtWd06nMdXHwRBtlWEyH2ISRnfOGwyCnc1zXoC6FlI5v8x9h
	CqFJBd3/gG7UPCErBdIZtRdz2X9SXDRw/jSTUscDTejM2z/cK7tPbpY6BjDOQaPNNeFs4CUi/VV
	hVbTVOVJrMURL1pVdar5AgKFxqqOP4peZeC3K2B2zvbA==
X-Received: by 2002:a05:7301:716:b0:36f:26a7:968e with SMTP id 5a478bee46e88-379681c684amr13169678eec.40.1794913208943;
        Tue, 17 Nov 2026 03:00:08 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38115cfdd6esm5883392eec.5.2026.11.17.03.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:00:08 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 1/4] ASoC: SOF: control: reject out-of-range volume values
Date: Tue, 17 Nov 2026 16:29:47 +0530
Message-ID: <20261117105953.188645-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117105953.188645-1-kapoorarnav43@gmail.com>
References: <20261117105953.188645-1-kapoorarnav43@gmail.com>
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

snd_sof_volume_put() passes the values from user space to the IPC
volume_put() op without checking them. The IPC3 and IPC4 ops convert
each value with mixer_to_ipc(), which takes an unsigned int and clamps
anything past the end of the volume table to its last entry. A negative
value therefore sets the volume to the maximum: on a Tiger Lake laptop
with sof-hda-generic-2ch.tplg, writing -1 to "PGA2.0 2 Master Capture
Volume" (0..80, set to 50) succeeds and reads back 80.

Reject values outside 0..max, as the ALSA control API expects, before
calling the op.

Fixes: c3078f539704 ("ASoC: SOF: Add Sound Open Firmware KControl support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 sound/soc/sof/control.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 74d997a4f620..02cf59bf1f95 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -15,6 +15,21 @@
 #include "sof-priv.h"
 #include "sof-audio.h"
 
+static bool snd_sof_values_in_range(const struct snd_sof_control *scontrol,
+				    const struct snd_ctl_elem_value *ucontrol)
+{
+	unsigned int i;
+
+	for (i = 0; i < scontrol->num_channels; i++) {
+		long value = ucontrol->value.integer.value[i];
+
+		if (value < 0 || value > scontrol->max)
+			return false;
+	}
+
+	return true;
+}
+
 int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
@@ -39,6 +54,9 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 
+	if (!snd_sof_values_in_range(scontrol, ucontrol))
+		return -EINVAL;
+
 	if (tplg_ops && tplg_ops->control && tplg_ops->control->volume_put)
 		return tplg_ops->control->volume_put(scontrol, ucontrol);
 
-- 
2.53.0

