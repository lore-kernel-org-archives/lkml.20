Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B48563288
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792006678; cv=none; b=WW3dMgC/ZZvC/b6WNI60rQ8ytTyWbGY6YLVsYDs9Wb2CEv/k3MrcXrU+cwMThx4jj316mSEC7wPfV0H0y1aJLH6gvJzLfhbZ/77BmGuoA+u0N2ps4sGorxhyhLYs31Z1usLZLHShWLtNteInilGRjUOrnMlMG0uoH3DjTkUBfN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792006678; c=relaxed/simple;
	bh=ObMYjck/H6XcNs75oCe1fV8PVDjoFJCKP174W+DH64A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L7szPmcEyDpJ/OZ8jFMPTXQTLitPOOehc9gqtad8bSdggWt9h/IaNW36svJEPpsWr57G+brtNVDf1yvQwk9p1tT7lUNLrEcWU0KSucGk/Fi4ZmDGsMMunkQOcicoqXnnEMsRtWWz2MDTweTZ/QAvISoHlVKsSFVU7KP8beZ7AYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=EFTK90m1; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="EFTK90m1"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35f1f76ea84so14385eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792006675; x=1792611475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSKDNnQRNy2/8dHJazcEc+4Vg6sKgqf+FQWePTpfAZ4=;
        b=EFTK90m1xWk6P7yvztdOccA+zN4Q5O923N0RQv7838NxeBOSTzKl86I8KABtBQ+TkF
         z7u/x4fFaTEXM4Yhg7gD+pu2zXpKyw1BLkXOPOVtmOgWo1NuXcDj4ETGP4lk0fRsC3Gr
         ZPRMKdxZesOA32TcFaft8r/JtpPCP7FGFefFoq0EQ7G/GbjGGzbcrr4/WI/G+c284NBe
         19YwT9Y94lxt6YsY73FupdNdl63zfc9E9BHE4s01D8W1MN/omM0aP8XhgO2HB5YGn0aU
         3JWCNhD4JodGr6Pf+aezZKaJFrQhYHlq+h9Z/KGNrLsRo1lKY4SBKmSPbujyLf/y0e1b
         Wu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792006675; x=1792611475;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wSKDNnQRNy2/8dHJazcEc+4Vg6sKgqf+FQWePTpfAZ4=;
        b=K7oHTaDiS8hSXMgvR8hzsSl8gjgKclHu5+qRa12DWWhhPzxakUsVcB2zgxnETPA9V1
         QMAEDypcSafHTk7uc/d4/z8lT83VYMQ842+a2NkHfHdFMqXj8xzT2p8skBitVNTrLHUr
         2vWW2Ij3BBT1wvVbYQlo48wuyDlKurTrE+6QrAa1QJd06EsVsXZslmpLqJgp6aPlL5qt
         YxCQTxxxX1rNVSlz6LMAlEgBz9U9vpmXD0DID3zS8dcv5F8yxmjbMBSdXVAJG+TiD933
         c6pUC1Eu/zylxf2oBHNLj46tL4JELH2w3YSvSsUjq01JKVj+qrCD8Rx00lqvy3LdXcMp
         L35A==
X-Forwarded-Encrypted: i=1; AKwUvBz50UWbr08touavnwyImVFczD8JbfKhMoYjmgKs0+H9P1R8npbm7Huz0tET4kQeO3hE55SlwIEW/RyLUbA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVIy1RSIdzLq0AmZAdNfGJNbnoSDw87Y4iAXIvaaba06DuZ7gG
	AsGHQgplNeQ4rGT3jL8+5nLgJZ0nhjDnVT5BBofRp+QEBCGQsccxIt2n2a0oRrMVQ8w=
X-Gm-Gg: AYBFou1jvbUFDpvYxoSlyAsw6yT5UDDXhpXq8lJETUL5JstUocjPFkFFXzjahysDjye
	0vRGNaZ0FuzBDrsYht9DvkaSS/8nI+6w8mXq30L3jEThkQ/G6KcBEqvsWz4SV9JXyJNLJOPIir7
	str99JJKlb+8APrM7nxI1t9ZS4YXQuLKJHn1/PEwmgSXfh4OYXDIJQXFoXvCGP0gcWctdn3A3Yl
	/P4ykMJVLepk8psYZLThnxjIsHLv2fB7Z+SfkGkTz6c6+9yGlXzF1E0yLJ/Y7E6kr14SlzYI4pA
	SOz5lyVscYwuOybIG071d6aQtDQFAJkWE5/PejfGxvYR1kKASTJak/9SMBO7VhSIbCEDs5VJBmw
	I1i1s7+3NBMukVp+lMcgKcr6VkE6d9SiQ+zSvWiGby6Obz9yKVYM4fbrxtguXwNoowf2BxhHAty
	SLOmQRNJhMjrAaMRwhBA47PPFgWFEIlRc4Ext9zr/GdoR42fqO4WUAx6nxxbsLBpQwCGZXCOgSf
	ONh5zIW9E6tTLOmSuoK1VU5NySTOAdpYSGNpbEKrU4aypcYpb+T3rTbW2xYVLt4lz8BgsE=
X-Received: by 2002:a05:7300:fc0a:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-3537e11c9c5mr23889883eec.28.1792006675265;
        Wed, 14 Oct 2026 12:37:55 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:39d1:d8de:aae7:23dd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca0e64csm60589703eec.10.2026.10.14.12.37.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 12:37:54 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: broonie@kernel.org,
	daniel.baluta@nxp.com,
	kai.vehmanen@linux.intel.com,
	lgirdwood@gmail.com,
	liam.r.girdwood@intel.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	peter.ujfalusi@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	ranjani.sridharan@linux.intel.com,
	sound-open-firmware@alsa-project.org,
	tiwai@suse.com,
	vijendar.mukunda@amd.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 6.6.y] ASoC: SOF: Intel: hda-dai: Ensure DAI widget is valid during params
Date: Wed, 14 Oct 2026 15:37:51 -0400
Message-ID: <20261014193751.25230-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

[ Upstream commit 569922b82ca660f8b24e705f6cf674e6b1f99cc7 ]

Each cpu DAI should associate with a widget. However, the topology might
not create the right number of DAI widgets for aggregated amps. And it
will cause NULL pointer deference.
Check that the DAI widget associated with the CPU DAI is valid to prevent
NULL pointer deference due to missing DAI widgets in topologies with
aggregated amps.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Link: https://patch.msgid.link/20241203104853.56956-1-yung-chuan.liao@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Assisted-by: LLM
[ Backport to 6.6.y: Keep the NULL-widget checks in
  sdw_hda_dai_hw_params() and sdw_params_stream(). Omit the extra check
  in the newer IPC4 CPU-DAI aggregation loop, which this target lacks. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2024-58012 to 6.6.y.

The two NULL-widget guards are identical to upstream; the additional IPC4
CPU-DAI aggregation-loop guard is omitted because 6.6.y has no
corresponding loop.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series: x86_64 objects
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 sound/soc/sof/intel/hda-dai.c |    6 ++++++
 sound/soc/sof/intel/hda.c     |    5 +++++
 2 files changed, 11 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index a3d0b6d721aaf6fa47d58053b6eead49af4e94d8..f541cd0fe78a40c85e37d90937dae77cf0fa429b 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -454,6 +454,12 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	struct snd_sof_dev *sdev;
 	int ret;
 
+	if (!w) {
+		dev_err(cpu_dai->dev, "%s widget not found, check amp link num in the topology\n",
+			cpu_dai->name);
+		return -EINVAL;
+	}
+
 	ret = non_hda_dai_hw_params(substream, params, cpu_dai);
 	if (ret < 0) {
 		dev_err(cpu_dai->dev, "%s: non_hda_dai_hw_params failed %d\n", __func__, ret);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 15e6779efaa3bcc9e0dc16e6a92271930eba7a0f..aa3f9c961173715507b35e236d996f2751774ea3 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -102,6 +102,11 @@ static int sdw_params_stream(struct device *dev,
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(d, params_data->substream->stream);
 	struct snd_sof_dai_config_data data = { 0 };
 
+	if (!w) {
+		dev_err(dev, "%s widget not found, check amp link num in the topology\n",
+			d->name);
+		return -EINVAL;
+	}
 	data.dai_index = (params_data->link_id << 8) | d->id;
 	data.dai_data = params_data->alh_stream_id;
 
