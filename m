Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17AE3F8ED6
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750635; cv=none; b=HGaOvn8+sUkpLs5rJhN6W/Jb+S1N/xbPSHCM/ybmU19l/IVeIVO9QM+l+KD1Qa+flwgLU4YAKUzmUxPQFbwroTTO54xMyd5J9GG5AakDrH3gJXW+OTniLstFsSeVtbzeFHzC571CZk/msyOQTn858Ux39qBdAefuDkUXPRSd5Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750635; c=relaxed/simple;
	bh=T+joPVnG6nvb8UuuJNDmhlDnO5Nd91bhNAODW8Wk1i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NchLdkr1GI5BO+7ZiAz56exnU4e6U4OGy/m2YGPOJAICEgiaZ2iqRZTqxGuLVZTZG1CX6sHf3gWTgQrYTu4Mq11pwSmLOtof9e/k7blAXC1SoSTENS4EeUX++CZvBI2oGeKNMkVsrMhqCU/J0jBV0rTLFEdzOT5nXn3ZQVza4mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giqvG1Qm; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giqvG1Qm"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso1714213a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750630; x=1788355430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GiQlsaqiCq4AJU78JobgI8TyOaikqXTsloeCjW9W5G8=;
        b=giqvG1QmNvWw+jfopHSS3fNNjtlZV5WfkhkHWcpkyZbXImoXfKcgdghjNqJFkeM2Pt
         yL3lrzZc7wvwaV4j9fecx5qKsZDkMZG34qT+TmHEn4xMosw7UcZU7eiV8uIPxmRctIMd
         OdM7b3HBpBT3eXwZW6e60Vtkz4n2BJTk4wDA+JzupkHjU8iuGGggru6av9o87yUsyYW6
         kL+YfLUDAiZ5XltAOCUtXwR3tJrKQMyVnKNW+LmN9svbCe/c11XlT9worseifkK5vKCM
         FyLUplz3VGvWCYlYKH9oRa/x/hvqu3qdVLQqIAa+pXcLgpylZZBhq6bOmHMQyD/ccKje
         M4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750630; x=1788355430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GiQlsaqiCq4AJU78JobgI8TyOaikqXTsloeCjW9W5G8=;
        b=FgDgZjaK6ApWDQ6xaj5eezH4i4NivQ/Dd66TMN8LZUzdTU5Z6o4jqtE7NCr/VYuHYz
         BIETxNW4iPEoDHJz7zx2PSgsz0v1rNG7J6XxIEA8BjVTxX1VbhSy9WG8egc/LZE6P2A5
         DG8z7ZwmQZXbFHUagCVjLdoPf2FsIUL3F95Z0OPcaItiTcea/AMdxRjSbL8V5ry6bn18
         yAqFMjqX1MsZLMSRoBJLz4cV2wQQTLWyevEuOCg4hmKWXYOn1PCo99Aw9sZbiPKbJvTM
         8tfM+SLd0VUqAgqMKiW/KCplVT/YXgezx/TcfUTn91U4c+GuizFjH2vhlwnPHXytJo6T
         n0iQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVTfHW75oDft/xA37Iu7r6HUaot4j5eewYe71chpKEZ4epZk+4b2EzRvHtCrkCdBIUfGftA51uVJowkrU=@vger.kernel.org
X-Gm-Message-State: AFuF++ne7mm+aRQOXrcfoOQtROmX0wIM/QmJiIowl14v0w8AMNsHgTjs
	W6RHChLva7jnmQ1TVDPwFeZY7uClj4jKGAGiTJJoNZYFmxj84hA2Xnny
X-Gm-Gg: AR+sD10Ms+kI5FQXnjKRstyIgXpRbGOsFbtMOX+S9iBuqHrB1aZykKJUHQB6Ior4JhL
	JkswMIFJGL33TnlbQxSckslVJT7+gtCFGaCoIGGheYGB9aVZzdeO1qNZ/vG7MRxOXdrhLRxFvrF
	hF7ImwIDHQC8yEHY6mJVKV6Ch64Ho3vbWqXFGZkn9f9H2fL7AK60ggiemGNklhPUDuz2qtLswom
	PyDKHgIXQ2+HDKSrA3JrteNxB0Ixv2SZq3/ntXhAuxfHdtkenVIBZrfZ2+0jUfxYg1l3SbvQ/1f
	FjgoITwC4gT9C+Ad9JoBPq+YggQeMkba2v3fMYnEfWa5cs9qK37PthAo5Q7KcBUMsuilZSa2XGC
	20F6cQlPeZN8Nv0p07JsBRdiP/aEE/k0zSQPYCvKrjvB51mrg0y7qGr/BQqjy0qYpyQx0ysiJRn
	8EG1iUF6e5HXvACCFaERapmxIiwz1wiC7Y3qGCYUU1k6m4KJAEFXBQ2v7dTTn1Z5Kah6hbOhtcB
	bkGQ8joz9YuPhtVu1YE/CZIZeZ31iS8PAHBH8xAvco=
X-Received: by 2002:a17:907:5c3:b0:bec:64d4:3872 with SMTP id a640c23a62f3a-c250c3cc2eemr811074566b.24.1787750629533;
        Wed, 26 Aug 2026 06:23:49 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250f99f6bdsm376856066b.0.2026.08.26.06.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:48 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [RFC PATCH 3/3] ASoC: Intel: cht: Add Yoga Book SOF topology filename
Date: Wed, 26 Aug 2026 15:23:34 +0200
Message-ID: <20260826132334.3344395-4-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132334.3344395-1-mauriziocasciano7@gmail.com>
References: <20260826132334.3344395-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Cherry Trail SOF machine selection requires each matched machine to
provide a topology filename. Without one, atom_machine_select() rejects
the Yoga Book entry and the SOF sound card cannot register.

Associate the RT5677 Yoga Book machine with sof-cht-rt5677.tplg. The
IPC3 driver then loads intel/sof-tplg/sof-cht-rt5677.tplg through the
standard firmware search path.

The matching topology sources are maintained in the SOF project and
must be merged and distributed separately; this kernel change only
provides the standard firmware filename.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 sound/soc/intel/common/soc-acpi-intel-cht-match.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index f9acf6a41c1a..4ffd4ab57b1f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -143,6 +143,7 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.drv_name = "cht-yogabook",
 		.fw_filename = "intel/fw_sst_22a8.bin",
 		.board = "cht-yogabook",
+		.sof_tplg_filename = "sof-cht-rt5677.tplg",
 	},
 	{
 		.comp_ids = &rt5645_comp_ids,
-- 
2.53.0

