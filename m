Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD683B05BA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790019485; cv=none; b=nFLR+9m70376Ii/QyV2l/vnFImjVzIOrp0UloWNVTYp3YkKG8OZ6j5gmA4fEFShNbQPMnRiBITjLrnr38A1u2MdIBMd4D+wj4L2u2/kc2O6tMfObnSHuRmnQZ6d1gQQnob0wheCGDklb/oiOZqwJAKZb7w+noHVBsZiT+4fDWVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790019485; c=relaxed/simple;
	bh=sd9V/QvVMf4cDvXMBa/UsWtjf2wjncnMpYTMCvePqXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M4KA4596RsyzOdPsCLQjme2ypSTQEY1QRs8gXiUwkhjSECtIoWrBMDngMtq6IGgR4rSQOCZnznr9YY+g8hf3sAM7xyTZ0fwwgF99ay1Gw+vNtnUWW8nHthmTX0X6MLn8fFpJ+tVbuH4GGhHdQ6MWZoik1mmpego5TbgnjKa0EO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=aHi7DrnP; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="aHi7DrnP"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fbef5018so42004875ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790019483; x=1790624283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aowiel30ampr5Np1wAm1rSTNGQWP2GBWcWmQbn6pvmU=;
        b=aHi7DrnPGBnSY4cGD1rFZgLaZXH2Hg+1X2YKW5zDx/CS4/wiF/TIBsJbBkNWyItfty
         0wmrHcBr79wiBXX0Mz+ACFRZRCBM6p/vsa3h82OTxwaUwk0j+UID0+Xwlj/P4gDlZAC3
         j74vHbn+jBTIxwz5L54s691wA7A5IpDjRB4xFuVJePRivE0ZlypdWzJevP9cFP0zthAA
         2S9YmVO9FBpLv+ppdghZIXf34ZFRnM7g2XdqJ1igH8PA3CIGyoExZc8hD1ishjkv6maA
         QPc9jLGAd5hBm1MfDsjb4zB8iNAsDs69S9BSugIxmOu0a04u2xyQAg8al9pu08cYqesR
         eUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790019483; x=1790624283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aowiel30ampr5Np1wAm1rSTNGQWP2GBWcWmQbn6pvmU=;
        b=pnhMvnlUH48UrQ+r38ESxPLvzpCWBeWngPsBKcyhE2gtc8gC3PYq47zn8F0iruunhp
         HHRlfbjdU7zQ3ofSpcEWwwKJ5hfjJIgT99YPwWs+gtAzK6SHeF/I4UMrEIZ2o1c3IuhA
         HrBCTHDtSTmsT+RgF7xOqfmUHYVUgHwOdTmv4GjMW5RVVuSVZdjHWO/naPLHh6iojEU2
         aT6K2CX+19xuiEnu2qNxTNIoSe6I8beAdzm5t94UajsHSmLi79EPEy/Gj/79w5+KjXpc
         KFytHcZUxwA5y5rtIFMzaNfajdp5rFqgY4G4IhZJok7wkLrS4wogdT3Xm05WSkv1dBhB
         Okxg==
X-Forwarded-Encrypted: i=1; AKwUvBydV9eSIBB/f4bANUeokcvVF6v3cL8fKxnqioMLh0D+BSBDHzog0PRFPsuiEs9xhgg60K5W0LddJI4XrHI=@vger.kernel.org
X-Gm-Message-State: AFuF++kIZWot84WJVFOccvB6gXlQ2EV+D2YUjJ3XO9kmMc813ixVNf3I
	7YoU1ikTvrC8Mkiszuv5S6VAgMy70QjofYVzOHOL5kBqb+QD2GYRBw8LhKhQNWUSak8=
X-Gm-Gg: AYBFou2ngtEzqJRleyHlqiqLEqJoOXg/aQsB4876GMUadraTnxU4a5jg83TrpTOWM1t
	e4l3lrKCsUfx0/RWUlmeyl5O7ddbupmjd7clTCUbY9Rd97R6FXsUYXDaVOW1pjHK4jOXHsldLGU
	6Qvy1xo/bgrCiWfWB9ds9iwKCbJ32tSC87/QM16sls2V0kOZJdb3kNH7yu+KdIeA7qBTIXGk638
	31fVuMMIrnCQmOpoNjU0rDv875sML9uA5BvivX8W6oORkmcO8D1MuWWMfr8dFaVg2DhS7dILfMz
	XCSiHHEkbN6vBq5oZX5JTqrRTkLAOi7EjPih/Ge1dHAJCrTLuzZNEfpMgYo2pv4/t79JtD3C5zz
	wv3opkoO3tsCTmX6bLMTzAGD3HzoGBAQ9ZOpRzUIfPTQ/CFDrYUUgsPFPt1mLoihXK5tA0seQsj
	KYdaYj6cpQdnacAzmOgqMRadVrUNGNxy+4oEn9XcPaPM+kGenuz4dVYxPw2zOpeCJqzGsZMVpNv
	lwndzBTlPcYdA8c5uwQApdLrulGiWb2NjdDXZsMsYJySmogYCSGI2Gxung+gNBzKvkpg7gQ+ZNM
	yZN4wQ==
X-Received: by 2002:a17:903:bcf:b0:2dd:c100:3141 with SMTP id d9443c01a7336-2ddc100323cmr76353145ad.61.1790019483005;
        Mon, 21 Sep 2026 12:38:03 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:289a:f600:f11e:a45c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ebcdbd8sm288500eec.16.2026.09.21.12.38.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 12:38:02 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH 6.1.y 2/2] ASoC: SOF: ipc4-topology: Clarify bind failure caused by missing fw_module
Date: Mon, 21 Sep 2026 15:37:48 -0400
Message-ID: <20260921193750.82134-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921193750.82134-1-artem@trailofbits.com>
References: <20260921193750.82134-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

[ Upstream commit de6aa72b265b72bca2b1897d5000c8f0147d3157 ]

The original patch uses a feature in lib/vsprintf.c to handle the invalid
address when tring to print *_fw_module->man4_module_entry.name when the
*rc_fw_module is NULL.
This case is handled by check_pointer_msg() internally and turns the
invalid pointer to '(efault)' for printing but it is hiding useful
information about the circumstances. Change the print to emmit the name
of the widget and a note on which side's fw_module is missing.

Fixes: e3720f92e023 ("ASoC: SOF: avoid a NULL dereference with unsupported widgets")
Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/alsa-devel/4826f662-42f0-4a82-ba32-8bf5f8a03256@kili.mountain/
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Link: https://lore.kernel.org/r/20230403090909.18233-1-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>

[ Backport to 6.1.y follow-up to e3720f92e023: replace its (efault)
  pointer formatting with source/sink diagnostics; only hunk locations
  differ. ]
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Stable submission note: patch 2/2 in the CVE-2023-54233 series for Linux
6.1.y.

CVE: CVE-2023-54233

Build: This patch was included in the x86_64 allmodconfig and
CONFIG_WERROR=y build.

 sound/soc/sof/ipc4-topology.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 9540ba6ef659e6..ee6f6edec970c4 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1601,10 +1601,12 @@ static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 	int ret;
 
 	if (!src_fw_module || !sink_fw_module) {
-		/* The NULL module will print as "(efault)" */
-		dev_err(sdev->dev, "source %s or sink %s widget weren't set up properly\n",
-			src_fw_module->man4_module_entry.name,
-			sink_fw_module->man4_module_entry.name);
+		dev_err(sdev->dev,
+			"cannot bind %s -> %s, no firmware module for: %s%s\n",
+			src_widget->widget->name, sink_widget->widget->name,
+			src_fw_module ? "" : " source",
+			sink_fw_module ? "" : " sink");
+
 		return -ENODEV;
 	}
 
-- 
2.39.5

