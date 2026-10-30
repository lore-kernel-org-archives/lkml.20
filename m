Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357415;
	b=31tzaXYwDK+Hpck3aoMtPtrXbpfosGbW196SgKKVjwwdW5W2yNG8FBlghEy1PtWyB6jD
	 HjesgdUeCC/JbCtNWjlo7Tt4ydCzL2dEBmCGO9KkwQQ56fFhAED0Wc2CzZ6DX0d/eEzpZ
	 mSauIk3q70GmJXnA18/Ur7oBDSbZsvqZlTzEFofP2cvHYyEErAXo7g7KBgLnhdgXXHaSc
	 aujNffstfSQtPFx2ra1TsosUdTfodc82nF1MyjdHKhOMaxb37L5xh4hY4pHW3743wMZBH
	 A05YuJbHY0eX209YV8KionNLbbmLfFuMhWW5Rrfus3dQC+VfgCDTFf3PHE1Dp0aQZ2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357415;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=P0WdyH6Nza1mVSXLS79+OENSiygKvnIpHHnvtKyQpUg=;
	b=F9+7bz/mmnXzLc7aDP8o1RYdH0BJmZVUIo/WdGIzh0LUNcEtOqQiRg23nKrxBfuGiPbc
	 0w96pKeuzxq5vsRKRC+xazzlRrnqeD/4yvekAL9Bu8O3u4ubbHH9SAX+Ey+FRMBiXpx8p
	 BxeHsUJ6nyhLMlxVPuvB9wBCQmWJmW7ijzSqVrCChPHt7o5Er2SbHFEo/KImDlCa4FE/N
	 aL1iByYjFh6SkcATpJ/UXrLW8kAXbOn0CsL6e0EDksTbBfhEy+8Vp4+BK4y5SkesTk1Yn
	 iQFqKqN4+nOMuutT51N7LioGVit8ea93TkBtTOdaToyU3ZcjCe1VVPK21SXRzFUYC6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KC15/jhz";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3622460A6F5F;
	Fri, 30 Oct 2026 10:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KC15/jhz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF78C1F00A1B;
	Fri, 30 Oct 2026 10:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793357415;
	bh=P0WdyH6Nza1mVSXLS79+OENSiygKvnIpHHnvtKyQpUg=;
	h=From:To:Cc:Subject:Date;
	b=KC15/jhzJgSv+LiTqdANORTVig7LtqUGk0LJb1or/C/WK0S4lSzmDwfekP4BJ5aUx
	 8C/LWaqirPkQKpCwu9P/2kaYC0RJHTt81SbteYTtbqAPvHmispGM81wz74+GTTrIRr
	 nM/JxvMQtLovoXyDbOfJyk1qLkku5qiCaLnCYDRWzTzKCXktx3ELY0XkwUXetB6uDe
	 MUw96UugLiKjK2vkSKS/BkWa/+wVnv/Wj4YdhWXdEQHcXPvB7fJQ6HryfzFnyylj/C
	 a8rWp8yW04UIMe0cz84js8Dd6K7fpuPM1xmKEHlZuMQ+kFZ0zcG/2b90rD1Ej3r98V
	 9E0XxenVH2F6g==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hardik T Shah <hardik.t.shah@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Mastan Katragadda <Mastan.Katragadda@amd.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Rander Wang <rander.wang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	sound-open-firmware@alsa-project.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 00/21] soundwire: Fix Critical and High issues reported by Sashiko
Date: Fri, 30 Oct 2026 10:46:39 +0000
Message-ID: <20261030104840.3361217-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These issues were reported by Sashiko.

Cc: "Uwe Kleine-König (The Capable Hub)" <u.kleine-koenig@baylibre.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hardik T Shah <hardik.t.shah@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
Cc: Mastan Katragadda <Mastan.Katragadda@amd.com>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Rander Wang <rander.wang@intel.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>
Cc: Simon Trimmer <simont@opensource.cirrus.com>
Cc: sound-open-firmware@alsa-project.org
Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: Vinod Koul <vkoul@kernel.org>

Lee Jones (21):
  soundwire: bus: Hold bus_lock when looking up slave devices
  soundwire: sysfs: Use sysfs_emit_at() in array show callbacks
  soundwire: stream: Prevent m_rt_count underflow in
    sdw_stream_remove_master()
  soundwire: stream: Clean up allocated runtime resources on config
    failure
  ASoC: SOF: Intel: hda-sdw-bpt: Stop active DMA before closing BPT
    streams
  soundwire: intel_ace2x: Protect bus.bpt_stream with bus_lock
  soundwire: qcom: Prevent pconfig buffer overflow in
    qcom_swrm_stream_alloc_ports()
  soundwire: qcom: Disable runtime PM and avoid clock underflow in
    qcom_swrm_remove()
  soundwire: qcom: Check clk_prepare_enable() return value
  soundwire: qcom: Serialise ctrl->intr_mask updates
  soundwire: qcom: Prevent stale broadcast IRQ from completing
    subsequent command
  soundwire: amd: Check for NULL manager drvdata in sdw_amd_startup()
  soundwire: amd: Check ping command response for timeout
  soundwire: amd: Preserve lane control bits in amd_sdw_port_enable()
  soundwire: amd: Avoid static port offset leak in
    amd_sdw_compute_params()
  soundwire: amd: Initialise and cancel IRQ work around manager lifetime
  soundwire: amd: Resume manager before hardware teardown in
    amd_sdw_manager_remove()
  soundwire: amd: Synchronise parent IRQ and disable work on manager
    removal
  soundwire: amd: Cancel pending work before suspending manager
  soundwire: amd: Check clock resume timeout in amd_resume_runtime()
  soundwire: amd: Disable interrupts if enabling manager fails

 drivers/soundwire/amd_init.c        |  13 ++-
 drivers/soundwire/amd_manager.c     | 130 +++++++++++++++++++++++-----
 drivers/soundwire/bus.c             |   6 +-
 drivers/soundwire/intel_ace2x.c     |  36 ++++----
 drivers/soundwire/qcom.c            |  97 +++++++++++++++++----
 drivers/soundwire/stream.c          |  40 ++++++---
 drivers/soundwire/sysfs_slave.c     |   6 +-
 drivers/soundwire/sysfs_slave_dpn.c |   8 +-
 sound/soc/sof/intel/hda-sdw-bpt.c   |   6 ++
 9 files changed, 267 insertions(+), 75 deletions(-)

-- 
2.56.0.317.g454f8302e1-goog

