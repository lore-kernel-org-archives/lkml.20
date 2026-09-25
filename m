Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8364A4844
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344766; cv=none; b=B6NcviSteF39ykPd84qLXjPVKK0WvnF5Z1R4GReI1kbodt6/rS/Pln6e6EgjCMh1OHuo1+Kx9p8rmTZgKFrVl8HEjeWMefH9whewnTEsoO8IkbtnVUBRnVs0euAGBQuLL18HYLTtF4pka/jr/qFaX4yP5H6nBWenq2h/FnA1o8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344766; c=relaxed/simple;
	bh=CvPIC2JM+dKqbCoDovUv5x2Gr6pbwd0JSckpKYb0jQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jg40FaXNIQEoFvTp90/hJhTrBlpT4iv7ndECwH4adddZ0YWVmxWVN897A0FPwJrUygIvpHKR6r+0TgTWHmYQHEqsvmDpCPySaUtqiIzRqPpUy6+3kjM9wGSYuxuuunYKWb5LLKgwiiTrrEz1WBgflsSMHIH23SCmgZaBb+WqsvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KK31PW5a; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KK31PW5a"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso6915775e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790344762; x=1790949562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c13af8RtL0FVbjY4/4zJyKrfrJUuMzJXKHCQJ/nPs4k=;
        b=KK31PW5ac3XkC9oRVy2h26t9cgsdQ9ensX403IBWSdFHl5kKVllpl1QxYSQb+Nspwd
         4CJYmheQcdcIyoskD/04QowQrKmpPiaH7XEV989gYDuHX5eRKcqFnS+Y/zCTTAmBEuqv
         FGvQ0mzakufg7ndrq7a8qogjFWmkHO4ViW9d8PnD+pu1ZM50qNZ8lL0lQl6dwYesGKpO
         /kCQy6L8YJiv6yJTarVlB2VSNyIZwCt6ysYC4sixjrb8rmTz7JmOqKSRIAbdmWnmhqkD
         UwWjr84O0vJlXvBRTCwnNE1Wncs3UkgcIXqiCpU7Ls4dxX280z79udz4a+FOynDOi43h
         4oxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790344762; x=1790949562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c13af8RtL0FVbjY4/4zJyKrfrJUuMzJXKHCQJ/nPs4k=;
        b=Zhfw4m1gghXAFUXx8+BGznBObqv59toaOeuBifBODTW/fAmbRCbbeH+if/aQvk0nfT
         A0wXMHX9fkEUECgEzBvwsaCqgzQxDe9Y0O/G9Ey4prRwCMHlgW/NLMW25gjhjJJ/BlLk
         UkJqoT5H8RSF3sRHdUXk90P42UkPDoVIkm7fRcg4yMto4wWC4Y6F9+SykWD5e4OGIuop
         zf7K96GH6fT4A9pZK1n00wyG5NGmY9D8lXg2atLH3Xl60sRc5qkNz1+oO8hMA11e/+S4
         zv5TB1CZaTlUYxeaeygnC9GzvKWj2dbrE/E0X+xp55jNmo9TDeJURx8rEAvCUV/5kmp+
         Y5Kw==
X-Forwarded-Encrypted: i=1; AKwUvBzNZJGzUhIJw3torZXtxTIS3LQXobmQCCwliVRVSJn6HJ9lcx82Ppe0fmO8G+Vpe2A/idOnAZ2vy/reiNU=@vger.kernel.org
X-Gm-Message-State: AFuF++m7/CFlYoyFmbvg6k+yqs1k9tMGc2R3vhfHu/xmToWTp4qTXWIH
	AofVZXpu5TYiP3jn1s2vt0PDTtv2lH3hDiwafNFMQ4KkadkGfqAPJPmF
X-Gm-Gg: AYBFou1KKXUqS+Y8YhZy21wqau1hvGQo7RDNiEP7kytwlZqcsLMsoBG6znyuA6EQeV0
	VNalxssigvLkndLQxBycSUBCM5GX+V9GMoiWP0elON+FbWnN3lIr6eHTQ5u5mzUM0QS1oNnzWS0
	xoCDxAYYhY9SCV72z/IQTIud5gfUoPwyzhPvmwISdghrvEhieGJdWOZN4AxLsDUDuLBr2B4INDN
	ilI3OxvMDUTnfbVf+/bSqZ7UTo0DalUsR4RRorDGsJXlYfhPeyOTe+QmIyfnbbwnvZw+Yly0oep
	0S13VdiFQKPhQHkXuMejZAU+LWQX/K0g0ywVjtudPyQ+eBvYb3HnDB6m/JZCWrlek43C8gThPHJ
	Hx/BhHzY2sEGPJGs5smYpUNLqEcTYLQSAntK2IvpFr8MaK5B/SLRluRKUlMV1+wZY/yfhyIBUPY
	BPe4Aqjakv2U391onlHwz0EzfrwKW1WM5pL8VgckaBPLQK/7QOx49rRwejyvcHZYxFzgTg0ox/d
	8dSq+E8uLUtXaAKmLtQYIE/VrgmmHuvc0pSRKqEe+WrCSspt2z3Sw==
X-Received: by 2002:a05:600c:a413:b0:49f:f21d:b504 with SMTP id 5b1f17b1804b1-49ff21db60bmr31269925e9.4.1790344762330;
        Fri, 25 Sep 2026 06:59:22 -0700 (PDT)
Received: from 1Z10 ([151.43.147.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a648895sm7170769f8f.28.2026.09.25.06.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:59:21 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Yung-Chuan Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v9 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
Date: Fri, 25 Sep 2026 15:59:15 +0200
Message-ID: <20260925135915.338670-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925135915.338670-1-mauriziocasciano7@gmail.com>
References: <20260925135915.338670-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91F/L exposes its RT5677 codec as ACPI device
10EC5677. Add a Cherry Trail machine-table entry that supplies the legacy
SST firmware and board names and the SOF topology name.

The Intel DSP configuration selects one firmware path at probe time. SST
loads intel/fw_sst_22a8.bin and uses the cht_rt5677 board name; SOF loads
sof-cht-rt5677.tplg through the standard firmware search path. The same
kernel and machine entry were boot-tested with both paths on a YB1-X91L.

The SOF topology sources are maintained and distributed separately by the
SOF project.

Assisted-by: LLM
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

