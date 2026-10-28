Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198689;
	b=PilmWikPOYALSb2XSoz7Ov/lDiU+rkiThQvh8jkss7JrEfHbeq0FckPltoVMKXH+K7OS
	 Tp4M8slv2NS/RofHdVD7YAWjgB5cfs0BqRStEtA3odSo7ZcWPOkfnmBJZ33EQQfp1/KFw
	 +TKk9u2R7WVRjPYcq7UyNUrT4QY1DcXzmOv6TuXvqWRR3w83Rp0zaL3MRoTKOk+G1g5fW
	 caL4G6g3OiGjNTRTrr5qk3TfMthnGoMwPBdYqnUue7MQMVEUDYlFj3ykYE1FKYqdjtd29
	 7K084OU8aUKqW334etwiGBKnNN1kryj/jZJVQZJZhTe7msgnnMJ8569bUUoXy+1XcjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198689;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TudRf/V3duNZFIAgqodC/6LxtiItIrFpsiEDGzncGww=;
	b=IciRwzeDXdPT3QOWnkLm7KaEaid5+4AvNUBFk3hup4s2lH1eokWBgD0rOfIO/TFRSCEQ
	 ZS+ttmkZwIrxWI8k4mcPGA/i4HvOfwZW75yI0k/pdcW9B3tZ3J6tR5QgQ8qceQwT65iwz
	 BgTTYL4wG2/6WqWHcqzU7vb8fleWl/EbKlHvxiwUG615kC3+QgeDfU45u6KtUy4Mwdof0
	 S3+duV9PqJqk2jXSWFcWYcoTvXkq/hZ+vEF3rsSVrruuM5PN1nhHtWGm834XbE+UgPuH8
	 hPGPew4UP58asrrWUHtXWUGWqnZ818JBxkrc6x9nOVXDDct9aPwstrQSW88RE17IXqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QdGMqqE2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3DB606A324;
	Wed, 28 Oct 2026 14:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QdGMqqE2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C8E1F031E4;
	Wed, 28 Oct 2026 14:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793198688;
	bh=TudRf/V3duNZFIAgqodC/6LxtiItIrFpsiEDGzncGww=;
	h=From:To:Cc:Subject:Date;
	b=QdGMqqE2ozRHX5Mr9JzH4fySf8G7Sexsv0wYISkrxhr+2wR+0eqsNQTlZmSWlrn10
	 erEFo2owQIirRb7wDhYdaC0NnqwEIYaduAEPgO7FFvWOCli0ShGgFPH499lpIhwUqD
	 KtxbChJFkBaBRVT2pVo2cvN20ul3m3RfvMvL6S/kZeY3pRpPA5UBIuCC/AZheaq0dI
	 UAE/ukU+D2hFfnjnT+gY0TienbsiU/FfcYn58N/TcRg37XbDkF9Kp2rtDRfZogRDne
	 UoPg3oMBNcFBqYTk9AalpVGtQrHfB8bputCMYbgC3P2fHVWByiDng7hTxzpkgcnhUf
	 3HmgNwNIJDcGA==
From: Sasha Levin <sashal@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: Intel: hda: Stop the controller before freeing its DMA buffers
Date: Wed, 28 Oct 2026 10:44:46 -0400
Message-ID: <20261028144446.992948-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
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

hda_dsp_probe() starts the CORB/RIRB DMA engines through
hda_dsp_ctrl_init_chip(), but neither hda_dsp_remove() nor the error
path of hda_dsp_probe() stops them before hda_dsp_stream_free() frees
the CORB/RIRB ring buffer and the position buffer.  Unsolicited
responses also stay enabled, so the controller can keep writing RIRB
entries into the freed page.

Until commit 9e6966f70404 ("ASoC: SOF: Intel: hda: Keep non-alt mlinks
powered at probe on ACE2+"), hda_init_caps() dropped the initial
references to the non-alternate links, and dropping the last one
stopped the command DMA, so a probe that failed later, e.g. because
the firmware is missing, did not leave it running.  Now it does, and
as the probe runs from a work item, the device stays bound after the
failure, with bus mastering enabled and the DMA engines pointed at
freed memory.

Normal removal resumes the device first, which restarts the command
DMA, so there the ring buffer is freed while the DMA is running until
pci_disable_device() clears bus mastering.

Stop the controller with hda_dsp_ctrl_stop_chip() before freeing the
buffers, as is done on suspend, and export it for use from hda.c.

This was reproduced by binding SOF in DSPless mode to a QEMU
ich9-intel-hda: after the probe fails with "SOF firmware and/or
topology file not found", CORB and RIRB DMA are still running with
unsolicited responses and bus mastering enabled, and the page they use
is soon reused as a page table.

Fixes: dd96daca6c83 ("ASoC: SOF: Intel: Add APL/CNL HW DSP support")
Fixes: 9e6966f70404 ("ASoC: SOF: Intel: hda: Keep non-alt mlinks powered at probe on ACE2+")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/hda-ctrl.c | 1 +
 sound/soc/sof/intel/hda.c      | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index aeb34310eebd6..333f6bbea7539 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -349,6 +349,7 @@ void hda_dsp_ctrl_stop_chip(struct snd_sof_dev *sdev)
 
 	bus->chip_init = false;
 }
+EXPORT_SYMBOL_NS(hda_dsp_ctrl_stop_chip, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF helpers for HDaudio platforms");
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 4dbba9186b29d..2a40cb9bf24d9 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -939,6 +939,7 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 		hda_dsp_ctrl_ppcap_enable(sdev, false);
 	}
 free_ipc_irq:
+	hda_dsp_ctrl_stop_chip(sdev);
 	free_irq(sdev->ipc_irq, sdev);
 free_irq_vector:
 	if (sdev->msi_enabled)
@@ -1006,6 +1007,9 @@ void hda_dsp_remove(struct snd_sof_dev *sdev)
 		snd_dma_free_pages(&hda->iccmax_dmab);
 
 skip_disable_dsp:
+	/* stop CORB/RIRB and position buffer DMA before the buffers are freed */
+	hda_dsp_ctrl_stop_chip(sdev);
+
 	free_irq(sdev->ipc_irq, sdev);
 	if (sdev->msi_enabled)
 		pci_free_irq_vectors(pci);
-- 
2.53.0

