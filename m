Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C4E272E6D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028639; cv=none; b=e/FNKfsNp1uo0y6QAELz689kGuunPVlOg7pFpYOcWCvkV7i5rkcCVZ79IZ8Kye+5mvMFUyUu+Rzz3ma6+dulDEGAn8SJGaMdex0yhgLn50deyBjA1XAUc43i/dSpjAafqYGLW7vsr/FgwWpYBwcrQBd3/cyZm4lEy3eTFYfj29A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028639; c=relaxed/simple;
	bh=AsEVJmW9HdZ7itXRTksJcaPnMCR5//7NyJ3suWMaEoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eeKcoKsXSxbKz9O0IW2L5QDFxuESnmUQmsUwzchV5RJYInY5IfmlsNZ4gv1oaq4wc1moFxEAU3KG38NNNm50WJUVqvVNr7T6/0x00/52oLRGYoxrcwSy4rGTrygA7NaNeXaXItSXRugqpnNSYHMpqMfaiIqnXsBWndV4GvRO3K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAAfj7/7; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAAfj7/7"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd3310348d2so3183645a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028636; x=1792633436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=geVeIRJMETVZrOFQgXZr74ay0B29FFoh4B/JZUuVWw0=;
        b=HAAfj7/7k1nRteUARX3CssqdNMHqNXVLGOP4VaJnSfbniswggWfHxrCbjr9wuXTMEw
         VYNreiXkPee5Vvd5t5KiVDPnYFV53v4q85YunSbsghWkUTif+/JnHTdikjBpFp2KfIK7
         lj3VEmTw2JXm6xBTJoe35tIjeYgeW7kew0Ak9uS59gtQySFvmhkVn7Edg0eOtBOTGUqW
         6lNTarR/uop6gc20IVUV6TCtmCCIkX0vNAiobtuk1qGhPKkXm22iREmb3LhRuWtcRSpv
         DsGGU+VFVKVBOVv0WBvqwimYwesIeynhJz2pgr55SBL7eL3QDMhFgc/0nTEEQ87XiLjM
         195A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028636; x=1792633436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=geVeIRJMETVZrOFQgXZr74ay0B29FFoh4B/JZUuVWw0=;
        b=kbL9YrMJvJdTOE1RqYTpAaHKKDwEFpG3UNvVtj+kyc3GTwNCq/lrjmWDleSZ5xOM3/
         bRVBQLaCf4/F7CYc4hfDN1u1UcfSwVjIonQx5OS4PLMOxxFZFZR/e/ILwTsFS1NAG6Zt
         XwKHxli0fDCzIZZbSuSCdQY1jYhgKrUXiX1sUm9+heTQKDc7WvbH5X+k7XyChwB/6lYW
         Z+JJLhvKmdVk2ma6tZJ1daB4EdIS05rKyD4YWtBedQ2dirj+UyxwaVVEDlRDvFCvzi+g
         Y3ej28a0jT7C3+v3jXgfzmQo8CPkgPC0b8ffgkUFNiXxxtcNC8O8ZicoZRCXR8hLJ4ms
         wHXg==
X-Forwarded-Encrypted: i=1; AKwUvBzv+9sAeRPyuz6+W7XcL4vh/fFJjoR1/jGLUbFSGwlWSYuVHxvDESjr1nuPeqi8Ys317lHlhzDIQk1/Tuw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLU9h35cQzyKpaWCuoB8y3sJqm9bab0qtFW8twqAHfg4XYtBM1n
	DyMrYwQmP8ROO45xtw4lIw7ObmhCeBsJh0K7HUk/EsrVLyoO2OZlUKs1
X-Gm-Gg: AYBFou13Cx1TTNAHovyoVDZqBGdXgNwKSv8ByxGpIamUf2Aqr5Wy4T7aXgUh0fj4N9c
	gj65bJyzgfDsOuZT+/ovRTAsnTGjdMUpzacTz7ZtnEAIFvMHI/oFNO1DZrF4hSxQNmJkHV+HsYW
	ebIj1noIQc1Lt3Jt2PyRF1gQcemxBSe0oP6/iRgwWtSz0fKpllEjfF3QH+Oe0vHi8Zmy3IUd5jm
	6LKTlJGO3LchRa04r0fd3b+CR8oMuRH6n8WNLYplyPLVvTm/q3e/ZYEuuI8bJ2dYYdKkfkGJjVj
	MG0WUZHsKGlGEkzUufV6Gn99uBZ6M0bAo/CFGMuwDJ5NvoIfGWp961mZdGuLZ2kHOXOLtcAMWmt
	GEdTuKrKsBx8pL6m1VAzdm4YVBk/kUQ51vSqvIc/ry3WEx5ja3hww5iAouZvG27HHeeIzwfm29q
	J/XBR4YsPWzIYh6VgjsfXTagsmRttf+C+76Y3ikfqYwTkWUKyax8sANQlAGLOcCGbCErk9TRs6t
	2YPm7Ulx5aN1jf3/2bvnagK7jUqZb/7w22YAJjHj28hV/2ZLDY2bqeLXeoKUf4e4erEvchFH4I5
	bHqvzpb5rF46Gg==
X-Received: by 2002:a17:90b:4a49:b0:3ac:a167:8542 with SMTP id 98e67ed59e1d1-3aca16787f0mr98748a91.30.1792028636097;
        Wed, 14 Oct 2026 18:43:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:43:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 00/25] ASoC: Fix constraint return value handling
Date: Thu, 15 Oct 2026 08:42:59 +0700
Message-ID: <20261015014324.5569-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

snd_pcm_hw_constraint_minmax() and snd_pcm_hw_constraint_integer()
may return positive values on success. However, ASoC only marks the
DAI, link, or component as started or opened when the corresponding
callback returns 0.

This series fixes affected ASoC drivers to return 0 on success and
properly handle rollback paths.

Found by manual code inspection.

Compile-tested only.

Link v1: 
https://lore.kernel.org/all/20261008103831.542533-1-phucduc.bui@gmail.com/

Changes in v2: 
 - Add Reviewed-by tags from Vijendar Mukunda and Chancel Liu.
 - Remove redundant integer constraints already applied by 
   snd_dmaengine_pcm_open().

Best regards,
Phuc

bui duc phuc (25):
  ASoC: amd: acp: Fix .close() being skipped on rollback
  ASoC: amd: ps: Fix acp63_pdm_dma_close() being skipped on rollback
  ASoC: amd: ps: Fix acp63_sdw_dma_close() being skipped on rollback
  ASoC: amd: raven: Fix acp3x_dma_close() being skipped on rollback
  ASoC: amd: renoir: Fix acp_pdm_dma_close() being skipped on rollback
  ASoC: amd: vangogh: Fix acp5x_dma_close() being skipped on rollback
  ASoC: amd: yc: Fix acp6x_pdm_dma_close() being skipped on rollback
  ASoC: apple: mca: Ensure the DAI is marked as started on success
  ASoC: atmel: atmel-pcm-pdc: Fix atmel_pcm_close() being skipped on
    rollback
  ASoC: codecs: cs42l42: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8325: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8540: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8821: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8824: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8825: Ensure the DAI is marked as started on success
  ASoC: codecs: wm8580: Ensure the DAI is marked as started on success
  ASoC: codecs: wm8782: Ensure the DAI is marked as started on success
  ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close() being skipped on
    rollback
  ASoC: intel: atom: Fix .shutdown() being skipped on rollback
  ASoC: renesas: fsi: Ensure the component is marked as opened on
    success
  ASoC: renesas: msiof: Remove redundant period constraint
  ASoC: renesas: rz-ssi: Ensure the component is marked as opened on
    success
  ASoC: renesas: rz-ssi: Remove redundant component open callback
  ASoC: rockchip: rk3399_gru_sound: Mark the link as started on success
  ASoC: rockchip: rockchip_max98090: Mark the link as started on success

 sound/soc/amd/acp/acp-platform.c             |  7 ++++++-
 sound/soc/amd/ps/ps-pdm-dma.c                |  8 +++++++-
 sound/soc/amd/ps/ps-sdw-dma.c                |  8 +++++++-
 sound/soc/amd/raven/acp3x-pcm-dma.c          |  8 +++++++-
 sound/soc/amd/renoir/acp3x-pdm-dma.c         |  8 +++++++-
 sound/soc/amd/vangogh/acp5x-pcm-dma.c        |  8 +++++++-
 sound/soc/amd/yc/acp6x-pdm-dma.c             |  8 +++++++-
 sound/soc/apple/mca.c                        | 16 +++++++++++++---
 sound/soc/atmel/atmel-pcm-pdc.c              |  7 +++++++
 sound/soc/codecs/cs42l42.c                   | 16 +++++++++++++---
 sound/soc/codecs/nau8325.c                   | 16 +++++++++++++---
 sound/soc/codecs/nau8540.c                   | 16 +++++++++++++---
 sound/soc/codecs/nau8821.c                   | 16 +++++++++++++---
 sound/soc/codecs/nau8824.c                   | 16 +++++++++++++---
 sound/soc/codecs/nau8825.c                   | 16 +++++++++++++---
 sound/soc/codecs/wm8580.c                    | 15 +++++++++++++--
 sound/soc/codecs/wm8782.c                    | 12 +++++++++++-
 sound/soc/fsl/imx-pcm-rpmsg.c                |  8 +++++++-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c |  7 ++++++-
 sound/soc/renesas/fsi.c                      | 11 +++++++++--
 sound/soc/renesas/rcar/msiof.c               | 16 ++++++----------
 sound/soc/renesas/rz-ssi.c                   | 19 +++++++++++--------
 sound/soc/rockchip/rk3399_gru_sound.c        | 14 ++++++++++++--
 sound/soc/rockchip/rockchip_max98090.c       | 15 +++++++++++++--
 24 files changed, 234 insertions(+), 57 deletions(-)

-- 
2.43.0

