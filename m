Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70DA303A37
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790296242; cv=none; b=gqDtj73DbD2lo+jjK+YLJXUZXxUSClTGsAfbE2Y7D0WQ3JYNWb6wozgIa+Vq0NeOHgw0EN/V7jvWSWdSP5p9Fzm90xvwOoRaRZcta3BtncO034pJ0DCB8AE2IbEEqQN6xKsangyqkgz6BU6fWNb01B5hpSC9CY73HBqFjZwKLZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790296242; c=relaxed/simple;
	bh=CvPIC2JM+dKqbCoDovUv5x2Gr6pbwd0JSckpKYb0jQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YDLMLVzR+z7puFgPKJE/JGxfMVejxN8DxOAwE2m7Fg+0Ay8ivKOmxRATpSsRr5NS9yJ8IqyFDXv6k0TOep/0MjUbB/YP6lfkHsDgn6+AUcoKKJjO/C40mbTpZZ7AvyXAZf0GW8V69c2vEb1gghV+xlT7KkeGPNQNq8L1q/jfedE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RP+/DM0O; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RP+/DM0O"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso4562635e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790296239; x=1790901039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c13af8RtL0FVbjY4/4zJyKrfrJUuMzJXKHCQJ/nPs4k=;
        b=RP+/DM0Oj4SfCrd+RrQPjWk82VRfqMbp1JE/qsnXparPOSDCCcOpBFdJOZ0W08JAdG
         Y6ben7HPT4SuNa9E/nF/EmDzQL+p9nb+vWmF56se2pmCHS0x9OoNdGR1TIoA5Q1NkSd4
         2cGtrxa8ZU/PVW18GRztjyP1lY2UIk6DADtHqa4nkOaB7/CYGRCnQcCKamj2rfoxRGLW
         Qtf30J6zPoZrXGsPLm+rdhqzvKVy6MwLNjIXyGxl2YY+R+ZIiAlp59Exsr7YgjDpoAxd
         +ZueWFYFcpJs0eKh/wvCO5gzcNO9wnUaW1mnbl0by5n7kcn+CsVhU7i78SRRDIjy6rOO
         QDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790296239; x=1790901039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c13af8RtL0FVbjY4/4zJyKrfrJUuMzJXKHCQJ/nPs4k=;
        b=ru3aogjp9KewEd4BTFIJ/utShOEWvCqyDUbXvP6Arg6XRTehzFAbXe0nNgeLGcJLxd
         U3YPlCs74RfkHcduq8x3kLgcHlGR0EJNt9PL7PVHFtx46iImCZT/0Z6/A78P6gMhw2Kv
         HsuhJZSPDnR5jNYyWoG1xTfbkZyrSrYLdLldfkWHNcTYUPdVYplrsKXVJxjdGUre3Vwl
         L5pLNJAeG4JLMH9EVPT5syQLGeJVA5L8wjqsVzU9ggBNj5+jCXYU9mkZdBQivP34UYa1
         avOU2aKzzvducy7VFi15bx7Nywr53bSgilii7hVqysv/Af9ZD59HNrh9sJSCQRMVfZJ0
         1mUw==
X-Forwarded-Encrypted: i=1; AKwUvBzzvDSq2xOKyv5p0tzhCggQcrs7nQXbVpCW3xkvfvX/L2jA9OXU0s1qA2dg6t3IgipqmjB7XMtiMpCYf00=@vger.kernel.org
X-Gm-Message-State: AFuF++l5BT+ceU+tpSAUFw6bIhZsAfPe2PD2QBcU+QNJivF8htt+wXgV
	nrg4pkSseAdwTQL3d4fp++SSgnz5CitoShk9gApCF35zk3ndexqQmRS4
X-Gm-Gg: AYBFou3IWroHFSuApS5jgA4psZQiaPH8vImnTQGT41hBmRQWi4pSgP1H9T4CkJwVY/V
	hlXOm1OkJv55c7uJGGJWnI22ViSpMqKS5JLHSE3FtpOKEb1zdpb9qwnqfNCnfhY/X9qEBJLVfBA
	gRqELyMB7Tl/Lg4AbwQmBAjEdFUdRRQ5uU5O6DAj192gBh8zogJTZE/BtNMp6EV01nIT/lkCh6f
	2io34nhilBnM86yMl7dd9gLe1i4/fq2edejuI28ye3mXPFlcYeKudnBJhOm6tfCDlbLm7Ax1OYx
	b/fwfvb/46z8ff2NqkMBhE01N6n29UbicqQwIjPbmKye5dZeSDZcSKZx+3ewV/tEXXEwjVkbTY6
	d9B8zfKTKlsoNUB/6HBfD1xAKXMK9fnGKoPLslXq7BzrBksxZdsZlHNllfDUql/5LWWc7c7i7J4
	3wZ2CW+ya0Y8iICnAsDlYh76kSjt7guzBbHKa7GCmAdz1fjdQjpYRb7L7vp5LfJhrrUL5aI31RF
	1CDsv3JoXsO1swGHJA5+kMoxGZw0sgnw338IjvdfAw62huVhaUgboVuIy2yWesz3FGEmCA+d1KO
	zd5Bmvzg2SakB8TLeZag4js+l1Y=
X-Received: by 2002:a05:600c:8b4c:b0:49f:bd3c:bc16 with SMTP id 5b1f17b1804b1-49fe66f4c16mr67306185e9.17.1790296238974;
        Thu, 24 Sep 2026 17:30:38 -0700 (PDT)
Received: from 1Z10 (mob-176-245-31-160.net.vodafone.it. [176.245.31.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fedec53c4sm34900745e9.4.2026.09.24.17.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:30:38 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Yung-Chuan Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v8 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
Date: Fri, 25 Sep 2026 02:30:30 +0200
Message-ID: <20260925003030.1077471-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925003030.1077471-1-mauriziocasciano7@gmail.com>
References: <20260925003030.1077471-1-mauriziocasciano7@gmail.com>
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

