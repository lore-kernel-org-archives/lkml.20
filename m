Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913222;
	b=gfOcTDMkiOvyQY6jadoDqc5vcoVvCVHpiyXJOxid1Q/wsF089/Zjf0Vc2Xmg0dGtSGuS
	 +vrp5Fg5LY8IveGVqlQbFXJsOxSIsNSSNR7RPxsuToi2r0upBpUmCh4sF8lFIm2g5Qnxq
	 VpFrUMBCsSuDIyTYCZjhS0ssB/9MvVS/JQuOEJKGZn9B+Zz5GL1NEmh9LQOpqysshIUrp
	 Cto5/KpneXOjxiLjwTqT0XlnRS3yFv7BdRfsxGj2Kqwx9UbNr8YOb7ramVUwGpi0KnjLD
	 lggS4A1jGXiQRJvPOIUbPbdApH2GFpcHCVnOUeq1XBsSxr8smvfG+o2DPZunjPQIxWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rvlPOEVV1AcUDTBGIxVs7H6H2hWVAiT7KDKCZ1nVAjE=;
	b=Of6v/5D0kve4VpPJHx4NefM82OP1vN9IhQtIqRuxxUufAyRuoPJvXHGhb0hjx9NenSHV
	 3nlxvf4WTJujjY0QNv+gozKeWGNsHT8ZcO8c+dNr/2ZuR6k1BunR33E9lIMeuiJ+eagvV
	 O/ut+KIZLrErSalnupLJ8hfJx+sn/tLFTDltdc6QpwSTVhA36KIExGQdphl95EHUeWe0o
	 tZgeW+1k4xIwp433fR6mBvDceswgHzykQ5DnjUjo24v7XutY561m1KiEHsbsGx7BoIV30
	 uNX/UrCji6rE21YyQLKudoo64nCIs2y4fknBLXT5rvi8waV9UngqsNwZjxZZthkFpoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LnQquNwQ;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2029606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2029606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LnQquNwQ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3712b6d9843so3746740eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913221; x=1795518021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvlPOEVV1AcUDTBGIxVs7H6H2hWVAiT7KDKCZ1nVAjE=;
        b=LnQquNwQRSrszM9UfREe7y/EgWHi4GxN+ujrSQonyJChpCmxsl40Ukg2UoSRKBGdLb
         sbUIYgJ08upGimPmwRM0kSz8/jf6RSlnTDaj0zSTllAujWYB2dQIKJ7Dei4Bflp6pAek
         w37/tHZOhwn0Trzb9lDxF1WRMN3DEQvDBh9HnUxL5U/mdtGC4yQ1PotuGhfpa3TbWWKY
         mP8Mkvorm6YYiO+6melfRUAAI17YKr1jEEllwh0oqq1G/Y2+p0R/Vm+b7p3yPg6ra2Ic
         TxKKFvOTihVGkbeKsz+uduXUkUa5mD98TltMMjBi7DJQp1G3yfBJYrYWiS1emNQIHIm3
         NgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913221; x=1795518021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvlPOEVV1AcUDTBGIxVs7H6H2hWVAiT7KDKCZ1nVAjE=;
        b=pklKQcVPJQHRnks8NgzeNqwhZvYp/J81wHw58Yqd6uTQUyG58yLyTW5xJspbjZh8MG
         SP+fB6/5k45+CVbo/cgnlFEOrSFGIgtfQ2HlbPUq5csko60BkAHved/5RMB8NTww/+dE
         jflgKFNis5Xp6KSuFHr7+8vXLRoozmeJADFmahOBMS3F7lCreylEK2lNjpyQaslgs4Q8
         AH6iKE2dHwza6WLALeeI3gCNxfqdckDQuh59Xqt2sC4v671shZM+EX/ZQQw9OGH0YbqQ
         9Zv8l6TG+I1H4bYdPwhadSAt7fDIhJ5yMgALf9B08e81ghfC7FeBuHTyRTimurOrd6po
         NVEA==
X-Forwarded-Encrypted: i=1; AL+hErFqVqdwqLctCbQBLzBipAe7ifFHy92wnrjGD9IBM9flwp1G1bY7D5Y2pCpbB8IGzi6l/pvGPALTtune18c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WF79lETefO9NktHbk7R9e9pz2LjesNEX4/w4EasdoinJHp2sM
	DG9wG9Ev61b6w0I50rjxqefn+NKf7QjWh0Xp9XHe2kGTvrjgUKy2jqvq
X-Gm-Gg: AZFdTZcf98AQjKp2US8ktmTji/6TYd9gN3PWyd2/Wpzl4tXP00vFg1HWj9YQhSm6ngZ
	FMYgonQV6aBHHE1PeMq60gIEfBKbAjTWDaLGpSZ4K2xo8zwhApP7gAboPTwXbzdUDkj+AwDLqnf
	ohBZXiDPelVS98V2+H8HBL9FsjXqyKcHTaoihYGrXepxhxvubhXTrpy39wXuTqewuyxlodHnSOd
	J6fwx1R+GgTf9JISuywnF+0AasXJ7FE5VN6Dy139yka7TK3IJlJl5IFJ4r+pRwpYw8riINm4S7L
	WTsVM5xZCkzhTNNt1DW2Xp1C1on+q6N6d598biO2z3z9XcCImUPOWbhP2wxflYLlYZxAEgLCgz7
	+xyf+jIONkUK896cqlf4XiGGXBYKiLzf5ltrttXNiS44SPUtBv6IlZbB8y9ynzC5gmLIqIjovmK
	CiD3wjLD120ikj0rc/e3DhjfBjkARF/gUepfXjKAjF8VbJzTxbRWssGAOmuiCXtlaB09iVEZoNK
	oe+qjklY3TfnrXkoRr/p3/4WafaDUDL5gkW3IcuVYOlC5hZkozSQA31cZU6XmwQRYxrt8/b42Qp
	xFZX/PsASLVLZQs7a7Y41bAfSEkyreiCJYeWXarSAr+QGPBxhD4TnFdfNcaX+C/t5dI0b/qPAcO
	at2xy+2opCTNEgYz5xRAQzreM9aFGNf8c0DvilyKIveVlzErKZ87Gq7ukdIPsNbDiEHEhIN/r8Y
	zHpS8xOiZY4zZVLkFXayigP2DWCLeTNjjsvuM99e0cnQ==
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr14258244eec.21.1794913221017;
        Tue, 17 Nov 2026 03:00:21 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38115cfdd6esm5883392eec.5.2026.11.17.03.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:00:20 -0800 (PST)
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
Subject: [PATCH 3/4] ASoC: SOF: report volume changes in mixer steps
Date: Tue, 17 Nov 2026 16:29:49 +0530
Message-ID: <20261117105953.188645-4-kapoorarnav43@gmail.com>
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

The IPC3 and IPC4 volume_put() ops decide whether the control changed by
comparing the new linear gain from the volume table with the stored one.
The stored gain does not always come from the table: topology loading
initialises it to 0 dB (VOL_ZERO_DB or SOF_IPC4_VOL_ZERO_DB), and
volume_get() reports that as the first table entry at or above it, which
is usually not exactly 0 dB. Writing back the value that was just read
then changes the stored gain, so put() returns true and user space gets
a change notification although the control value is the same.

On a Tiger Lake laptop with sof-hda-generic-2ch.tplg (IPC3), the ALSA
mixer-test selftest reports this as event_spurious failures for every
PGA playback volume and for "Dmic0 Capture Volume".

Compare in mixer steps instead, using the same ipc_to_mixer() conversion
as volume_get(), so put() returns true only when the value user space
sees changes.

Fixes: 95a32c98055f ("ASoC: SOF: control: return true when kcontrol values change")
Fixes: 955e84fc0b6d ("ASoC: SOF: ipc4-topology: Add control IO ops")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 sound/soc/sof/ipc3-control.c | 4 +++-
 sound/soc/sof/ipc4-control.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc3-control.c b/sound/soc/sof/ipc3-control.c
index b1d00a2a860a..b8f4d963e07d 100644
--- a/sound/soc/sof/ipc3-control.c
+++ b/sound/soc/sof/ipc3-control.c
@@ -180,10 +180,12 @@ static bool sof_ipc3_volume_put(struct snd_sof_control *scontrol,
 
 	/* update each channel */
 	for (i = 0; i < channels; i++) {
+		u32 old = ipc_to_mixer(cdata->chanv[i].value,
+				       scontrol->volume_table, scontrol->max + 1);
 		u32 value = mixer_to_ipc(ucontrol->value.integer.value[i],
 					 scontrol->volume_table, scontrol->max + 1);
 
-		change = change || (value != cdata->chanv[i].value);
+		change = change || (ucontrol->value.integer.value[i] != old);
 		cdata->chanv[i].channel = i;
 		cdata->chanv[i].value = value;
 	}
diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index e29c8d89284a..8bf300373d22 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -153,10 +153,12 @@ static bool sof_ipc4_volume_put(struct snd_sof_control *scontrol,
 
 	/* update each channel */
 	for (i = 0; i < channels; i++) {
+		u32 old = ipc_to_mixer(cdata->chanv[i].value,
+				       scontrol->volume_table, scontrol->max + 1);
 		u32 value = mixer_to_ipc(ucontrol->value.integer.value[i],
 					 scontrol->volume_table, scontrol->max + 1);
 
-		change = change || (value != cdata->chanv[i].value);
+		change = change || (ucontrol->value.integer.value[i] != old);
 		cdata->chanv[i].channel = i;
 		cdata->chanv[i].value = value;
 	}
-- 
2.53.0


