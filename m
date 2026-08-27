Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DA84ADD8C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854374; cv=none; b=S1otHWTKYHMYl4yIKJIUUcW/Kpql0bJuAD6C3nEcJDd0bz848BQhIIrMPR6DAZ0VYotAM6QMiM5jGxVPaj7XKGx4/TDXX0n4M/DF6YAE9hzSAqZJCuO3J446j8spua2JkRN+IlDUdF+tXgXc7inGxSiolFlZGbpR5EeAKVaboww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854374; c=relaxed/simple;
	bh=p+PsdWMYgDeEzYR8CJuUDvk5UXQMtpQbuHidEtNGz/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uQJwAKW50C9Ghm+OeB+Ozv7cuc/r9XhCk9B/3BMIs5ixSqV0EX4fyfw/BjbOM5OyHheITYrBO9wQkFj70xxJh/XGDbOlNdYq8keEZUZvrcpwRthdJ5ufkWER5QeOiPzrc9EWiTMkHeqVqLUAibn/T+Bix8IB769wxnmhdqIi3HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2DczBCN; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2DczBCN"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482e257a23aso96743f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854365; x=1788459165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sMNGNdzcXKEoePKaXgyC7xmNkieewX0FtVFEtM4oZI8=;
        b=F2DczBCNlEFzzLJ6lsNivfc4JG8UITqQCmtE7qwrcyt+QO9fjFgYz7MUSLwRZeC/Sz
         eim/mOOONbmxZ6E900cj/WsN1SQywuLANQ6KzgDhGp5oMJET/732VnV8fHQEV93iMQ+r
         Tg8Z9yRuxX/i6ABJOJ77hZbBJldnm4/TsMrzwiVl3j3ZOLrvHiEl7H1VlCYP6SHcH4KB
         CCoVCI4dJbtsIaAH02L4YM7ccNEeH1gxB1RgkRs7v8nmg1h5xBgqzQZVV/zN4alX78Q2
         w1kTwQHqXZJYjBnwQyisuel37CkiA1DSYYl5mY3H1g3/deb71HnHJsMNk2EYCCMWpL2f
         3YsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854365; x=1788459165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sMNGNdzcXKEoePKaXgyC7xmNkieewX0FtVFEtM4oZI8=;
        b=NdqrCZDSNcq860bBzmd8uzDgPmib8lIuj3435nhjwim4yZfpTBFdZuME78B0q92s3v
         QINDnqSAEuv+yS+4VV2ZsHSsQON1wTbtw77nahfQmppgKN25edZNA/8BUSe0lXRtBM4w
         4ZazpCslaq4yzqk8DU8loa2cy6xcLEf4v0A4jt4aH8m/1zi2tMal2Gcl+qsdXb/L2tun
         QWe2V2cAG9K0x9g34h7B+yHez4xA+lMlN5fkGYPO8T/xRQ1KRLZm3PLvwNR/F7mbZjB2
         pHVn3vGOkT8HprE86CpWrgJp/U8O/V/GtGv8qZySsI81MHv/HPpb+x2gR8ZrzoOq8Hhu
         +ozQ==
X-Gm-Message-State: AFuF++ngOdIXABry7pNYnEpLK4QS2BzhR2QxiHGatPVFv8JTt3wD/VPz
	O9ylH0OnbBIxzfrD84a9aZO2v1jL1/Zs1KSAC/ri0ndDq5XbRhNq7Zoa
X-Gm-Gg: AR+sD12nigC/vdh9e884z0n9r4yiVRQEAGYGT5ZHWp2RVUwZ2c+zFlFBlVDI0DjeNig
	x3/SLxQA2AaRAYSV8/g+9S8kyEtFOiOVcHOQ8LeuNWF2ttX9xlGJ7jw1ILraJChA/nX2YXVSp1g
	j0Ocf3t0i+w94fUrrrxArbVMcPVms+00mATa3LJwnlYZgcir6eAJlHV35IugiAF2mNgmvM2rNAt
	YlGh/3Cx3oRuNp5fu0Phs4Y962Qirdh3p6LZwraOkVLRIeJsplIMNoCzgGRxOJU6A0INHMxc9f9
	kGzoXxIBhWNiSJtDCUQsd05nUl/zOPDUOQsgen/Fmu7fr+Vq34Pc0o+Q0hZOylii2qzGBOU1O2L
	0VlYTyk/l2p7sphQ+cmzvv9/JDERDPuD6sx0CZk3WsRcry8GRXljSQygeBc9dla+QFL1k3Xnti6
	w3ZRgSCHegbYDSe+iAEx0SwHNrU3RTxiseD3WkD1MsMNJkxNEH3+xLtPtJ3cpPj+GQxbjz/P6L3
	ap9Jru/pxYC/jSQ3z8Eoj7Ega+mCDYkE6PJHGmVCu7r
X-Received: by 2002:a5d:64c3:0:b0:47f:7759:89df with SMTP id ffacd0b85a97d-482f7977513mr896312f8f.3.1787854365279;
        Thu, 27 Aug 2026 11:12:45 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6917sm10189895f8f.35.2026.08.27.11.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:12:44 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
Date: Thu, 27 Aug 2026 20:12:35 +0200
Message-ID: <20260827181236.2421882-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181236.2421882-1-mauriziocasciano7@gmail.com>
References: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
 <20260827181236.2421882-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91F/L exposes its RT5677 codec as ACPI device
10EC5677. Add a Cherry Trail machine-table entry so SST creates the
cht-rt5677 machine device and loads intel/fw_sst_22a8.bin.

Associate the same entry with sof-cht-rt5677.tplg so SOF loads the
matching IPC3 topology through the standard firmware search path. The
topology sources are maintained and distributed separately by the SOF
project.

Assisted-by: Codex:gpt-5.6-sol sparse
Co-developed-by: Yauhen Kharuzhy <jekhor@gmail.com>
Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 sound/soc/intel/common/soc-acpi-intel-cht-match.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index e4c3492a0c28..442ef30ffcc7 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -137,6 +137,14 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.board = "cht-bsw",
 		.sof_tplg_filename = "sof-cht-rt5670.tplg",
 	},
+	{
+		/* Lenovo Yoga Book YB1-X91F/L */
+		.id = "10EC5677",
+		.drv_name = "cht-rt5677",
+		.fw_filename = "intel/fw_sst_22a8.bin",
+		.board = "cht_rt5677",
+		.sof_tplg_filename = "sof-cht-rt5677.tplg",
+	},
 	{
 		.comp_ids = &rt5645_comp_ids,
 		.drv_name = "cht-bsw-rt5645",
-- 
2.53.0

