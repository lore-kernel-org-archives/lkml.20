Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE7842466A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750635; cv=none; b=NOrcK5ySzd8oWqv1kW2roSEorQFDCXEfdpryNoXSk0mMMnRlQmVSUg+a5kmk/VvVE1xN0oVj9acm7MP2hYrUJj2m7uGrU8gfIG5yTipP6Qe2RMBEOok4Mfajr3qYIaILfoyty8qMCviWGiBl/3XcObGuusBmbC0CJiFE6eBLwyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750635; c=relaxed/simple;
	bh=NJ6RnEv70zpJM8I9fP8i0P+6NmKcI0fX6zr6eP4Q38k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qVgyLENGPOECytlS8tnucHPRqgDfzpB/RXS0lYV+TK2X/t6tnIA0wQqPw1yffylOsYR1M4vydefqh6mWcWjDc/JFqEs4kvjW4Qbi9ZmPiaGqrh/GcOv2baE5ZoCJE/bazL6j88gYtuG3xMoLP6oocijYBeXt7kBtElQ62MQbNn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJjUOdP2; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJjUOdP2"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c252cd2b3c1so70295866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750628; x=1788355428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4VAT0T5auzwEUMc8PKzeTgZNflNYpYN7TUG5tnzFp2w=;
        b=KJjUOdP2QR/TtXIVZQhuNN05dIUBAEj957g+SO8oZoDh+r71d46EWNZLsyUi5zaJI6
         LBaLmU8sKpRoTTC85tMG4Md0d8vCrGmgFZCk4f4wPlhIOGc39PEJEKDqLLNtKVpgxOsn
         WA8eVyGiQGgOf71p2xHfV2KsIxPfHAuX0s0b53KDm45/xXXKynqvW1TuOfhzz3Tce8WQ
         4ghboFwrqHuLt8WMMVNRnmHPN2owkiSRA6LfCRXd41VvKIIZ5df3/7faYBFsy3iRPFTc
         i/xpSj6sqY7RJb/ybgPd8BhGjqwGM/pvk8DLwjdUf+dPeyKSssZ7JQRWDPJFP+RmQZst
         6xpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750628; x=1788355428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4VAT0T5auzwEUMc8PKzeTgZNflNYpYN7TUG5tnzFp2w=;
        b=bRpVWZumoi7R9FYWcjrjBXuEg4sPAdzh21lpOxbsLbp7mO6FDVXg28SG5epBRPtlfw
         UB2G4NEzrhsiBGWQ2OAOM5TxlpOvzsxglDblADkHORNAGh8yl4q+18zMK8Zi4E1ADEv/
         PBlJwUudGV3+6otJRQCsP9GZAtvsspwTjdkrdlt42kF7knr4jnfBbqvYYQVOdpJB5Uek
         6xpNqFxX9dk2YXwhe7nzT7wtGdA5lawVaxIybBnBEzBavTaUswPdYn9bc1NzzCCKxnnO
         rQMDwA3wPfZK1e+V/XydNAl8O7YD2/8sJNhLOfBF7tyPGPEHYIpz+Du3vPfT1p3pLly5
         TmBg==
X-Forwarded-Encrypted: i=1; AHgh+RrSIwOVkzjmczOtTeVLlnlF+GjmqRx7UDDpEXM9QzOs9SuL02FKq9FlCH5ZMcXPhUV04+LSGavdpkFNLkU=@vger.kernel.org
X-Gm-Message-State: AFuF++nhI1B3bLUngZ/0eCz7o7G3UiE1FsDs2HLPuhpJNPw1JczbQw/I
	v362HqsCFasCXRLPEaimvxzOERrLVuKDxJRzaScgaT0KDhmmpGHDClWL
X-Gm-Gg: AR+sD12YYaFMAh4cL+jhZyIj62L6fYPk+OTApJMDbbN04+YkC6n2uMrzszigb+s5Jv1
	wZSDmtfN4cSBPhD0sGo+7dYA96pnJuqzdNNuMXCDR7S9pJcTWG73sF2RDMREe0CUhGHM1w+Ehfd
	7pVcECegvXuV1rTYv8jHtq/SUsfVq/IzZkA8dPjthamCUXb5Fs7Xe0ZqKyo/ZTpkyKn7JS0E5SI
	Bhm06boIg+EQVJzrb4UsVEhsy10hO2JPAs5ZyRoReRr8Wk0ZJcKfcFH2ZA/sNXHP6BpTEnRQJnG
	PSeSJCrse/QHJaRDGpR49EEho0jzad9soO7Prwo7EDsVCo3c2m7ZkbhOR/HQoWSIGDONy6WGGj7
	QIItX8aIFdVp2+avckq0/jie7LKuJbkk3qkxdv2WFxQUkeQIgY6mfTEwtx/vMub1E7GPJq8/Hys
	pDhjPfMVL3JqLTNoBNF6riHbiyg2oKHHKFGJtpTpTBXzYvtpiGxAxwihxVlYyTk4rTLJuFsfRe3
	q04Ra/VGxkBbvyvSRrtnWeKg6u5ulOS5Y5sujq2HJM=
X-Received: by 2002:a17:907:9815:b0:c20:5798:7b9f with SMTP id a640c23a62f3a-c250bc1567amr880518666b.10.1787750627651;
        Wed, 26 Aug 2026 06:23:47 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250f99f6bdsm376856066b.0.2026.08.26.06.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:47 -0700 (PDT)
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
Subject: [RFC PATCH 2/3] ASoC: Intel: cht: Match the Yoga Book RT5677 machine
Date: Wed, 26 Aug 2026 15:23:33 +0200
Message-ID: <20260826132334.3344395-3-mauriziocasciano7@gmail.com>
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

The Yoga Book YB1-X91F/L exposes its RT5677 codec as ACPI device
10EC5677. Add a Cherry Trail machine-table entry so SST creates the
cht-yogabook machine device and loads intel/fw_sst_22a8.bin.

Keep SOF topology selection separate. The following patch names the
matching topology and documents its external SOF project dependency.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 sound/soc/intel/common/soc-acpi-intel-cht-match.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index e4c3492a0c28..f9acf6a41c1a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -137,6 +137,13 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.board = "cht-bsw",
 		.sof_tplg_filename = "sof-cht-rt5670.tplg",
 	},
+	{
+		/* Lenovo Yoga Book YB1-X91F/L */
+		.id = "10EC5677",
+		.drv_name = "cht-yogabook",
+		.fw_filename = "intel/fw_sst_22a8.bin",
+		.board = "cht-yogabook",
+	},
 	{
 		.comp_ids = &rt5645_comp_ids,
 		.drv_name = "cht-bsw-rt5645",
-- 
2.53.0

