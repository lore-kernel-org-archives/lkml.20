Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AD5585966
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986464; cv=none; b=rWayBnkbk+j2g7uo/iTVBLnyBL5HXIixJ7EpiW/mjS651zZNzUvBmA9gzC+5xak2xaNk0njDvT8rf3HWcdBPlSVhxplGmB939DWLoU8PnEYuzPdPwydYhqYD2vB4PfskU71peij1bust87y8RCn0LHALDfR2kPydbaNt9CAb+Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986464; c=relaxed/simple;
	bh=V5JXF9xuhHcB9bSbIAWL384a9RlhtX4vE2mq3dg4miE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lWL/J/MoRdRsokkCzH0wo0zh2c3giMIyTbXyxBlTq1XxbRR4K8zJvBG1afSGxqkk2Lx6R4CgvMlku+aAvLXob3dylSsGVNsF++ZxWR36AoHIiJPK1yduvajM+au/B2LDtkg8J7hwZyXCS+RDwxxQP4YFPlzpF+5lKM8p9Pk/1fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pG/oRLv0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pG/oRLv0"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso77268895e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986447; x=1789591247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaOoKXT3Y9f1LpI2jFHn6H2wS4bnhm1a37EU+be2Jqo=;
        b=pG/oRLv09HyJ+yh5FN+2Huz4YF3LonlYx7VKMqppu6f71I5/aVZVDxeLA4rNKKBxJ6
         aPcXWXTUtVFGx+dbxcULvKmlyBfyJNMuagKxttDBdlRoHQgTTfCCb8dyKOPE22isOirk
         OajnWBc8nN8gBQQFyY/Z0G9ugTB+HAmh60AyXlxS7kD42R+sU1SX+xLFmkWjHYxxAbzw
         YfARWC79Vri9L7iISxkwfFkeLzgPNTylNNj3fyHdDEiq4gymHAygPljyXtVqFznN8+Um
         R842lwYHJ6L7vUQBzvreKqSXgDtAdkdlnu7R9QzaIlylh3P+97q6zg17iHkCOxr2NJnk
         l70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986447; x=1789591247;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JaOoKXT3Y9f1LpI2jFHn6H2wS4bnhm1a37EU+be2Jqo=;
        b=sg1VYID9mr/JvFABGnAGQ/7IFumpQhA/kB5C9A9YHQ11V8X+S2o9zhzOo7FnAJmdj6
         86sXBKduXKYISHQY/JKYe6AQjq+Ecv5QI18hONWpXX6sVczz132bRmJ6OEmdjh7G+2/f
         X7j/2wzVMOv3jnVIe5oLWyv7DpKTcTxmX5exnP/V36//HRlWN3eOXnKJ7XARMUSkXqiR
         7NZT4l+o6+bLLAKV767oIeys9/i2QunFV/CBvH4A2OdeMxvAbINpfyDxL6kRcSYvuVom
         5xCm2HNpka75G2Zyf3oVL/vb22Rto/x9dpuXn1LmrvMBYxxt96YbykM3Y9VXf6sIWcB1
         q8Yw==
X-Forwarded-Encrypted: i=1; AKwUvBxvy00gYBAdKsc7BHBwls4odlidMGCRL7vdd1OPE3tm2znLGj+ac2G40I+mFM77S7un54WgxPh12NTRCq8=@vger.kernel.org
X-Gm-Message-State: AFuF++krXsLs6liDLN50W6656t5uPFs2SHFQ4DCAYqLa/6LnTDHTF0CB
	EtMA9oqr4maALN4jTczLm0uUAKDsFvORHV5jcjcJ9NjkSJEtfp8H9yVv
X-Gm-Gg: AYBFou1SAMOpNtEUJRLoyamjoT1D3ORa+Yu/vDSXT/jg+YgFBNXhQ8lZGKh361fo8Qp
	aYrS6MsmDQuQlvxtSjjYnGGpfXfNCgsk0d0ltw+NuxpOmukVFrx7WFH3d5NzG+WbDN+E/8Nfwon
	l48p8zrgPLq7ksEZbdsLDC/aIRg8Qy4DtYcpS3iEDbUZf8Z5sLvNNRtdc9zQ7jlihOUWkTcPgSv
	EAqEQFhU5b2+kgyse6Rz0dvhAP0yJbYPBjVAx5qwMJhrrzjwbdnlhtZpLrX+GsqzpkdESz0yVk5
	xPduT2wHATkTdcsp1AHzeB21oowCMLoHgBTtbIFANgl1ellv2p2deUZgapLKyg3SQpcHFB7xi/a
	xLm2NNcJT9COrVhW+bb0OEEp0VMaKvizV310ySGpinV1WMXQKwBuuSG3FG7WfdQwKTGxkSOQOd9
	uNYrB/Joh04Cb/tFNiR5EWwxneigcOj3ccwSavYbrQPhUYX/+NgZ0qrbg5e8rWVjjFh03kcc9jj
	CfvHIYb4oM0Qbqzo7p68LSJwTlgPqvFYIoypn1ZSMTtpAqAoZ+XHum1J1pqmT3MkmL+EZjs80rk
	FFXGf9TEEbklzGyCWMs0wNOo9I/V9bbnVFAhhqQBP9Oq78ft80/pW1sbXXQVAbNrW6o6VShtsOI
	5uAr6y84kky7C3mQT
X-Received: by 2002:a05:600c:4f43:b0:49c:fc6c:be0b with SMTP id 5b1f17b1804b1-49cffd457a4mr279515695e9.17.1788986446464;
        Wed, 09 Sep 2026 13:40:46 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c437besm17171315e9.11.2026.09.09.13.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:40:46 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: Bound the panic filename print to its array size
Date: Wed,  9 Sep 2026 23:40:41 +0300
Message-ID: <20260909204042.46656-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

struct sof_ipc_panic_info carries the panic location as a fixed 32 byte
array, and include/sound/sof/trace.h documents that the "filename array
will not include null terminator if fully filled".

sof_print_oops_and_stack() prints it with an unbounded %s, so firmware
that fills all 32 bytes leaves printk() with no terminator to stop at
within the array. It continues into the adjacent linenum field and, if
that holds no zero byte either, past the end of the structure into the
caller's stack frame, since every IPC3 dbg_dump callback passes a stack
allocated struct sof_ipc_panic_info.

Use %.*s with SOF_TRACE_FILENAME_SIZE so the print honours the
documented bound.

Fixes: c16211d6226d ("ASoC: SOF: Add Sound Open Firmware driver core")
Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/sof/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 2d394389c945..9b0850e87bf6 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -152,7 +152,8 @@ void sof_print_oops_and_stack(struct snd_sof_dev *sdev, const char *level,
 	dev_printk(level, sdev->dev, "trace point: %#010x\n", tracep_code);
 
 out:
-	dev_printk(level, sdev->dev, "panic at %s:%d\n", panic_info->filename,
+	dev_printk(level, sdev->dev, "panic at %.*s:%d\n",
+		   SOF_TRACE_FILENAME_SIZE, panic_info->filename,
 		   panic_info->linenum);
 	sof_oops(sdev, level, oops);
 	sof_stack(sdev, level, oops, stack, stack_words);
-- 
2.53.0

