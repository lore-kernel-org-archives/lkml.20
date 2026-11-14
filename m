Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794622659;
	b=1u8Hi9S67Ht6e7ctPbWGM3VhnhZJilb68oSCC78GEId3/3soNxkB3nC+zSZfkI2LlDSO
	 jPGZyu4fBI3l4GHwOBX14wHoiEkGUhtqZ3587IgUu/kY9uthg44QRAmeLHo2cTNbjMgzz
	 zttoPWKv7JxqX4cfoRwzrH54TdlJ9iDLPF5VeQDQjZ0TeJIEYdvlsTWDBQGSy9blnzG6c
	 KR4Ot+F6eTJhxPWq69dkot+lZvv8Kg8m3BWpqKHnFLtxmDOVvNHbaBnwbdpMaMvdOK7nl
	 DO0X6Nn0dOWaL4j6kV2SboE951f7d1SXFKyNtXaFgfmtP9ItcYDEc6BcbnBmCscUSBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794622659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r9W6lneKPSQoMSpQFwAwWd9P0BB/8MDW8wL1asVEo54=;
	b=vouhEHVoD0A9wxtk9J6K7re0AfvLWBvPf7bAkUMWsSrQJ7CyNp3o8dYMArhncyzsoTYA
	 mg3wrY9562e9ZVtF3mctQC5Gd/hnogZp9z3g8pekjBos+nGFLtsJ3l8Atm1c2Bs1gcBY5
	 IhjV1/4RvieKGWNnu9xiLwfCZVhoh0HscjhnxPATnfPzVCPUaZJ0d7I+hEgPPk8Y9oMqA
	 doLCpjyrhv+dC5SAYeIa8+jJK9bC3xitWQxesQB31XVOwKie/x85dLV6sf6EkPbmp0ZMV
	 wkD2cZu8Gpv+d/KuamTJ1tHIvhyx5VjE/hkeX3SP1/oZrkG9KELswe5enEOvRvia05w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="E/EGpdbR";
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFB6606A336
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFFB6606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E/EGpdbR
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc751eddf25so1699733a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794622658; x=1795227458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r9W6lneKPSQoMSpQFwAwWd9P0BB/8MDW8wL1asVEo54=;
        b=E/EGpdbRuWjqN+bLHTOo1s6qhQ3TTm8RnEPIgBcvHfXgg1qeZhPVJP0UYTzYTqW2uG
         AXwi0fz5TMPIndgev1rSK0uiZ2w8pxlpaIpd6WBmYxemV3EkP//2kXrKS6wewOuGuvZk
         5vUdT8Bleow7S42YkX/AhJGKBgs75/b5hg8IqyH0NaYjT0ZvfsQdgY3Y8V8Ta5NLMovH
         2VhJqO9/GiA9ri5GEbgoXBx3M5J6JoDtuLsxK/R8UacFBQiepodjgGETzwloACxLpzcz
         iOoBTqy5KVF0sjSl5xM1uildk28/WPPL1FruKra7eRnVcr0BwqIYdNi5LSJoWONroy0Z
         t3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794622658; x=1795227458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9W6lneKPSQoMSpQFwAwWd9P0BB/8MDW8wL1asVEo54=;
        b=usSLI2DxtsvW4ZNBpyNFM88TCbEkLzPlE3V+hz0R8Evm+XpzLUb3Ru7OCGWaB0Er1e
         u4MXkVWMVbH+lR8dR4R4AF4urljnAgN59OEe7F549yvWsRUTkRbmcaWLqnsrPnIN4g9G
         IF4b827fdIZk9FN8tnXO0IDvXeKIX/VhgwHFH3GmXREDDAK7efaE5aGfRUr2Qm+V9JrE
         aPLfh+/jYC7A8HkHJKW9b7bbi7rhEv/h2glz6361bjH2MWF9OPPsJLINI/Wvbw7ud6To
         PwnZTANYqF42hMctUfE0/Fm0zHH/jNAqjEk9rSsOFXR2Q42bIJ70y4jFa1LYn4mHkdcd
         /2OA==
X-Forwarded-Encrypted: i=1; AL+hErHadPGhMekm8iiu5Oak1xamzTjKAiUUE7/6i8GhsiTQ23usHwrLv6PooEh8jNqIfPe9wi2sNhPPOxn6uA0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dQ35M/rOFPfikApHFfEHQwIAvNqcCKG6qeUCE7XFjaG1oTQAu
	OsxYHQE01waKGXPI+dcQJS2cjGsG9+rMCjmB0rv008O0W9/bif9jP27tVILCD9XdnqE=
X-Gm-Gg: AYBFou3lqZkhtjCJu4aHLlAX3Z0ZkDNDZXebm5OupmhLHpm+apQlTUQblRLUTGoD4mj
	4IiOFFXQTb7GA02Ocuju/aTkfl2YQ6SGWY9pR8XdZLn7FDA2sOdZCo3kDRDeCsHyAwIWa/RjYom
	XRaNUKh9xO63RogpjPFGyR3j4DtAE4NSodnL+AfvDV26HAt/liLk9MlNCfY4IzNje27ZpCsy39P
	wzvCmU4xHPDRS8LyEqPwH/mQCM7EMTb7Wsiq1aGxMsg2BtD5J9wbJpfK72YuLNArfJgk8SaUQcr
	sipRBvJ2gHt9Za9fDy8QQuprnNOZdG47mx0YXDPtRrR7tqluutY0FWFDxzo3OiC/34uAh1cqwha
	jSwDO+0K/2POfbyQj42/QVCxDfXq16ItVyd7wX/+jAOhSv+CU4FXSllS5xTZR+quJHGtTtn6eSY
	KHmVLiY2speUMqi93LO/PEM7FUETTRsvixV4CNt8o20KP0UdVzsb5150bD0BUoobXdC8mf++dey
	LvVwDMs1oJGn7POFQgSrUZFfnG7ed7OXNdE9TVoYd3H0L7VU4/jDDk9+zSb1zmayWZRE0Yvqaz7
	Ng4FoSVOEtrwIzlOiGaRkyiELwimJWL4Qn9XQkWW/TLvvY/8bcyrgyF9KCyxPstpLrCZdPaZm8R
	YU9eGjR4VZdlrvEfTNCFYB+8JRq1vE7v2CBQdN7zb
X-Received: by 2002:a17:90b:548e:b0:3b0:9cc6:62bc with SMTP id 98e67ed59e1d1-3b1b0ca8ae3mr4175037a91.37.1794622657886;
        Fri, 13 Nov 2026 18:17:37 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1baaafdadsm4330732a91.13.2026.11.13.18.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:17:37 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ASoC: SOF: control: Reject out of range volume and switch values
Date: Sat, 14 Nov 2026 11:17:30 +0900
Message-ID: <20261114021730.2349347-1-sammiee5311@gmail.com>
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

The snd_sof_volume_put() and snd_sof_switch_put() pass the user values
to the IPC put handlers without a range check. The switch handlers
store any value and send it to the firmware, so on IPC3 writing 2 or -1
to a switch reads back as 2 or 4294967295. The volume handlers convert
the value to u32 and clamp it to the end of the volume table. Writing -1
sets the maximum volume, and on 64-bit writing LONG_MIN sets the
minimum, both without an error.

Return -EINVAL for values outside the range reported by the info
callback, as snd_soc_put_volsw() does. This fixes the write_invalid
failures in mixer-test, and the event_spurious failures caused by the
events those writes generated.

Fixes: c3078f539704 ("ASoC: SOF: Add Sound Open Firmware KControl support")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
Tested on a Dell Latitude 9420 (Tiger Lake, SOF IPC3): the out of range
writes now fail with -EINVAL, in range writes still work, and the 9
mixer-test failures on the SOF controls are gone. IPC4 was not tested.
Its put handlers store the value the same way and now go through the
same check.

Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64.

 sound/soc/sof/control.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 74d997a4f620..b6497e50505b 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -30,6 +30,30 @@ int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+/*
+ * Reject values outside the range the info callback reports, as
+ * snd_soc_put_volsw() does. The IPC put handlers do not check the range.
+ */
+static int sof_mixer_check_values(struct soc_mixer_control *sm,
+				  struct snd_sof_control *scontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	long max = sm->max - sm->min;
+	unsigned int i;
+
+	if (sm->platform_max && sm->platform_max < max)
+		max = sm->platform_max;
+
+	for (i = 0; i < scontrol->num_channels; i++) {
+		long val = ucontrol->value.integer.value[i];
+
+		if (val < 0 || val > max)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
@@ -38,6 +62,11 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	int ret;
+
+	ret = sof_mixer_check_values(sm, scontrol, ucontrol);
+	if (ret)
+		return ret;
 
 	if (tplg_ops && tplg_ops->control && tplg_ops->control->volume_put)
 		return tplg_ops->control->volume_put(scontrol, ucontrol);
@@ -90,6 +119,11 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	int ret;
+
+	ret = sof_mixer_check_values(sm, scontrol, ucontrol);
+	if (ret)
+		return ret;
 
 	if (tplg_ops && tplg_ops->control && tplg_ops->control->switch_put)
 		return tplg_ops->control->switch_put(scontrol, ucontrol);
-- 
2.43.0

