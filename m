Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913216;
	b=XC02zYcotYWz0lYyUeHvuDmOb1suhrew+lsGrfMGOhaMaaIhYrURpqyrWbZPv5AStwDS
	 pJA7ViPeOWcwf5wlDA+X52RoZYyr0Zxf2iU1gEqNA3mdMIl+tV55Zqgn/nUSi8So30Bw3
	 9MpZfjI3Dz6k+ZnPxqiajalFlrPTH2rjIDhGpuDtOwJJ8bGhEaQNkJ5EXEG9Th5xnS5WF
	 RMPyjIkqBwu+JHydr5kh4iOq5BQ6082RJli6QR/jRUVrNGxtCCTOt/4dvrwbcD3L24e7D
	 W4RFLolhwFgYWL8x6gK45cs876Ri37Nb8DetNwdhdSmEW9AEs13/NtyYxyB0JZIjipw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8kcutvjUdZ4ov3hkmBXM2akkkEkputZkpYqnDUcIAoU=;
	b=vjo4sTI4Lclpyysr/Pc67sRr7PCWILDFHaDX/Gyi3AhhInoy/ghb/MqexdFMxE8ipFXI
	 2NwehLx9lTRfonBuZfX++IBw7UFuaSgfZEJFwcWH2nTVSx/jb0QG6DRkFxoG43EToEnt0
	 8WMCxExFiiffOGEbN14ChNpgV70hhECeD4/osMu52XjvfaKaIaze2WUVZRtndNm97tGI6
	 0GrX5nHZ2DQHBO8qjY3joDvcXz6UK309ttP/p3a0Dt7KoVygs8Ags4klG1bbIerCPGh/8
	 f+dC+WLjtzCjAKP/RduVAW4ySkkK3XBbX2hqVCccrUlvVEccMXG7wBUwbQVSPIWZOqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zTcmHFry;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB46606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEB46606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zTcmHFry
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-170135e43c7so7153948c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913215; x=1795518015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8kcutvjUdZ4ov3hkmBXM2akkkEkputZkpYqnDUcIAoU=;
        b=zTcmHFryyJqmQEzU8roMILxbgKHZpgOjvYoi7XLgRdOZq6MNcp/qJA0gzxUqUTjbao
         d5DtF41i8qvsELX8dyzpuWUBS7+9DQknJ+i360vOXiLaVHgt0ZDs47UAW1TiYHHx/ei/
         IQdg4vQiosdMDDjlJ2TlzIo8UFzHNnCkc/nnze14jkGeGZzyujXMMW1l4ksnxE++VWIa
         W5cbievGqq8tfGGORDtFQRuaOf34JUh/8i8zOk5ZOBt+tt8BjQNO7xWNnRcU8ECQi5Fb
         qhyCKaMQZaOGcou7J9JN0ertGs5JATTylLmYQUTKew4R3yUk/+DUFKQjXKVKYe0GtEtO
         jCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913215; x=1795518015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8kcutvjUdZ4ov3hkmBXM2akkkEkputZkpYqnDUcIAoU=;
        b=q3zHr55XHYM/M+vuY8St2hHeoB84vsZrqqP+q6Vq5ohNBoOm/+4YnWmZNf9e6UCwNX
         /bVbjSRlFRholHqXPW0oQG9+uLy7uHJojuuHbs4Bq+WOjbauU8TM3ae0R49NuWAvS7P/
         7qVNJKfMvkY7WMXCPaFd7JYDdsCIy3d+YiuNfedVMC8l52ZjOQsDscG4cbrHVmgMQ145
         v+LlQ43bL08j18Q3I/kPO1MXBRGEm9J6sijzJMiThLC7KVMcGKEEgFhmF2iuYNel/exL
         5KV1HAb/JRroYUKic1XwML3BQ33+6sTGhfUG8Svhl2sKIyNmABhp9lmuGPBSo6YrHLdf
         WNmQ==
X-Forwarded-Encrypted: i=1; AL+hErE0O5N4Q+lm7DZrYl6wyyUiP9xQlKMHGjfcx2y4BnWzxMY3wldpQ9haZVewgjHpORroJgC5TEiZ4wxlXuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/c8+WC+ZqyETxs74GhWsPtDRa6fl+4L+MElG9C5PQmXRSiFe90
	UVLLLHoOFHgRkIaMKHtLIQ1FUZkdnlYt69VQlyOgB0Ukd6NUlAjguYQE
X-Gm-Gg: AYBFou1xUxRKCgCT2UhteoM50k+ageePhnmSi71eC9zGPXNFgRIDDfn9Vsqs2BdcuIX
	AlzowzFZlRVzC8B+18HNkJQMrtf615vMHmrOHJwVP02Irc7Z9f7FtDF03iOjLIZl4xUnB7VPUF1
	aD0ViColVOGYDJ9fhiLQ/Wzg8w0F/bCVuxfd0A9jKSlxOivko48ZmdOIJ2JtdIuGxxaNEsxJT3j
	MdqZ7IXDO5iGV8oYGHhFn5h3IFK4XOdAAY9mu7UbVvdaBxQG+h2vPftnm6jqicJRofGBNEabQXH
	BuwfmyYHwqvkHD0dd4M+fLUdSZg7F8MwjM65FerPHp6BWwItgY+xz9WGvyqQe2wBRYipJh0tSi6
	oGtMakAVKSYKdnm3WED5ReX8Fn8DaOrp40uSj9lB3zBLzvwmSINbRdj0YzMmNgPAowfFQqFrZ1u
	GWDlGnIYzIsE67rZbPWybGI9hzhXK6zrY7d+lGWecVTqPQ545x0DMBMOkBy2qY24IDz2jKztwle
	puA6GZYpWN9Mh726HMTBwMg6NO8ocRzx6FMi3RIdHApm6v9SQU77y3qAjbf9h+6WGP7sGe5Cmmq
	ZoWemomTvN/nUEvyPdC2uVhxR1ZCy87fd1jdyG283r5OtaPL+Bl+FvBZ2GTEz3pZqnCHrlklem0
	z0k9TslQ3/0jUGFRYaWy9ki971caiv1P8pkrNHskGwZ1v9HLWyG7KViUcxDXLGF2Rhjuhqi7k0Q
	2iIhGxdaSVXWrbLH3dr/FPs90BAf69fuidb3zBk6SHTw==
X-Received: by 2002:a05:701b:4585:20b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1b503131a8amr12904033c88.22.1794913214639;
        Tue, 17 Nov 2026 03:00:14 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38115cfdd6esm5883392eec.5.2026.11.17.03.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:00:14 -0800 (PST)
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
Subject: [PATCH 2/4] ASoC: SOF: control: reject invalid switch values
Date: Tue, 17 Nov 2026 16:29:48 +0530
Message-ID: <20261117105953.188645-3-kapoorarnav43@gmail.com>
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

snd_sof_switch_put() passes the values from user space to the IPC
switch_put() op unchecked, and the IPC3 and IPC4 ops store them as they
are and send them to the DSP. Writing 2 to a switch such as
"Dmic0 Capture Switch" succeeds and reads back 2, and writing -1 reads
back 4294967295, neither of which is a valid boolean value. The ALSA
mixer-test selftest reports this as a write_invalid failure.

Reject values other than 0 and 1, using the same range check as the
volume controls.

Fixes: c3078f539704 ("ASoC: SOF: Add Sound Open Firmware KControl support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 sound/soc/sof/control.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 02cf59bf1f95..a36c4c1d4505 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -109,6 +109,9 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 
+	if (!snd_sof_values_in_range(scontrol, ucontrol))
+		return -EINVAL;
+
 	if (tplg_ops && tplg_ops->control && tplg_ops->control->switch_put)
 		return tplg_ops->control->switch_put(scontrol, ucontrol);
 
-- 
2.53.0

