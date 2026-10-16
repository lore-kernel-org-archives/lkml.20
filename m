Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0681F33E35C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123811; cv=none; b=Wx0AQfzipXzZ0KZrwBQftINiDouHSnfX3z7k19IhXOLzsICtdThY1Qjz9qmSTEML9thWsjXmQfWTLsx8hdzddM9J//Ij3aYMlm5mNL2Spiwinx9UVUDDEnrOfIXIpwWygXF4RyZuzYFN6xd0G7nj7QKiG73T8BKSSAnQXq3v6b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123811; c=relaxed/simple;
	bh=r3T6KsS5uqRgrtiSAYChS0Ck5zpfD1Or1gG0Bl9B9YY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KFwI2WVFR+UZi+gTLeTUe4coNp0uDWdrZCCM1AG15C/TrU0GkaAKTjpzZATypHp9AxCxedXf1PNHyY05SBXreUTsyjmywXqEjY9tz3pEtHCg+4ECxMB9fuxthu6z/qR4suELqITGvxZ6MzfWq1fkzc/OWzy+yLHDJbwfyXsdn3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sml8tb8l; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sml8tb8l"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e934449bb0so21407775ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123809; x=1792728609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYnQxKBL88L7bG0SnRsZyN/ibAKxj/QjIVLFKTNculY=;
        b=Sml8tb8lzGkYEv2SUFTYh/0FtPwal/k4AqOSIHw1TYsCbQoZLCy6mRi4NJkNpjolMb
         731BAmGhHCQNLTHbKhIMiZ0488FHeivNbrPnn2oFjvIFG1JbT27V2XzWLku2vyRT8niB
         t42PLXzDNaqthmzSI8lEw+SAl3WdI421P5YyRiieI/2WWCzVl7BuWhl4+uwyq6zoXc4s
         4ulku9fCuRHFZmfpjQlSq3f/AMmLzIP76QemZzYr/Pvz88tmYxZ9ymg7uOxk0pny88BL
         51twx1ftCSo6w5znalpNa8Tf/QJyEVO980gAb4HGicVauxzXRXpRDkTQwb4seR+CYPIt
         SD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123809; x=1792728609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYnQxKBL88L7bG0SnRsZyN/ibAKxj/QjIVLFKTNculY=;
        b=w1iosIg1p9mmj+pOIGt3DKgicDcBKdRPRqRRARd6vhvTqnsmDwNfpqoBhpzp0TA/rB
         hKyY3jeOajX2vPxPfEP9Ez5zDs8Hvkxfu/HU5DFrh6ARnPTfQB8JvnalxRnqkYaO2PXJ
         a7G3aKRbRPEnD3267GQkzr0R6Tb79HqXMlArUQHeGaTEhN0e1CTO2EiYGISbTC8GlNHl
         Wg0ukHcKZ+U+yEl2rfQ082wKVEiG/fBEKQHhs++tIpg01YHzxGLenTMhdsMEzN0zgeT+
         fZ2a5GiwYaoPI1813uGbMrstrmNHPujZ6d7UbiqrGETPME5P2/DioNY8+5yEgI948Qjd
         MpCg==
X-Forwarded-Encrypted: i=1; AKwUvByILRXnRyXBXLzMYtqBaChbDNV2DH8d+UOyEfusSsILa4AuvUeVUtVbWY6XVcYkqRHjF62dPqbhdQDtYIk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJymO4Xo13BuLo0FyRx5My25Gleai5DgUGVtmpjR6Hz675edp8p
	8YBDMfC/DvEC1qQsb1w2nr5/SnSuYLzoiXBmmxrRt5fFWXkZQbzTTbbY
X-Gm-Gg: AYBFou0uXhmkmCld4v4GXsoS35SyRVi8ORcixs/uFfp6MBc5wGiVWrodBkMwNvmy2l/
	FEeBYtIUj5OQo8KcPYg2jlwXZVVe0SIzqymnQlYoDEYfP0NVAX6iRGlgxOSGtMIcjS3iFkpHSXK
	96j9hwYY48544HjRDSt8p+QVuhgwkuASZ7Fz6Hu3ODtzsN/uNV68E/pTQ8UgZOiIYf8OAsPh75W
	MAD14qYJHFMeu3i+DMxNcBZ6cNz2kMJFfWruLdcfkMbsuMeJnFahijLh0CkB5oWENs5Bm+dl/2s
	bHWp7xKNr2Nj5gTdkRZl0dYBHQEQUCpVA4Op4plOolDMGSNsil8GEaRQ31CksjvJYwyBAZF7Irg
	JPNQbxlB/oAEORuU6yBMtGB8ptGLLR6JBWA2FV1C7OtsRPjuVS9F3RcRAdK0q5xUBPAyOS1m+vi
	01ohbM1FJw4lLDrgsoLwXyujVqtyEEQZWTNpzpPdNoi9yMqnqiRuEhLbgjzZNbciWJ/PfZyQqMh
	yWgN0KipEjyyYdJcNRHuZ2dnWKHGwhDoNpDwY2hJnesGaCLRoZp/bd5p/Bebzq2qNiwrcyCuunj
	IjTZcyfA5L1pxA==
X-Received: by 2002:a17:902:cec2:b0:2db:7941:9e11 with SMTP id d9443c01a7336-2e842cd431cmr197979565ad.9.1792123809100;
        Thu, 15 Oct 2026 21:10:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:10:08 -0700 (PDT)
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
Subject: [PATCH 00/11] ASoC: Address remaining PCM constraint issues
Date: Fri, 16 Oct 2026 11:09:35 +0700
Message-ID: <20261016040946.521195-1-phucduc.bui@gmail.com>
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

Since v1 has already been applied, this series provides incremental 
changes to address the remaining items from v2:
 - Add comments explaining why .open() and .startup() must return 0 
   on success to prevent the issue from being reintroduced.
 - Add Reviewed-by tags from Vijendar Mukunda and Chancel Liu, 
   and Acked-by tags from Morimoto-san and Cezary.
 - Remove redundant integer constraints already applied 
   by snd_dmaengine_pcm_open().

Link v1: 
https://lore.kernel.org/all/20261008103831.542533-1-phucduc.bui@gmail.com/
Link v2: 
https://lore.kernel.org/all/20261015014324.5569-1-phucduc.bui@gmail.com/

Compile-tested only.

Best regards,
Phuc

bui duc phuc (11):
  ASoC: amd: Explain component open return value handling
  ASoC: apple: Explain DAI startup return value handling
  ASoC: atmel: Explain component open return value handling
  ASoC: codecs: Explain DAI startup return value handling
  ASoC: imx-pcm-rpmsg: Explain component open return value handling
  ASoC: intel: atom: Explain DAI startup return value handling
  ASoC: renesas: msiof: Explain component open return value handling
  ASoC: renesas: msiof: Remove redundant period constraint
  ASoC: renesas: rz-ssi: Explain component open return value handling
  ASoC: renesas: rz-ssi: Remove redundant component open callback
  ASoC: rockchip: Explain DAI link startup return value handling

 sound/soc/amd/acp/acp-platform.c             |  5 +++++
 sound/soc/amd/ps/ps-pdm-dma.c                |  6 ++++++
 sound/soc/amd/ps/ps-sdw-dma.c                |  6 ++++++
 sound/soc/amd/raven/acp3x-pcm-dma.c          |  6 ++++++
 sound/soc/amd/renoir/acp3x-pdm-dma.c         |  6 ++++++
 sound/soc/amd/vangogh/acp5x-pcm-dma.c        |  6 ++++++
 sound/soc/amd/yc/acp6x-pdm-dma.c             |  6 ++++++
 sound/soc/apple/mca.c                        |  5 +++++
 sound/soc/atmel/atmel-pcm-pdc.c              |  5 +++++
 sound/soc/codecs/cs42l42.c                   |  5 +++++
 sound/soc/codecs/nau8325.c                   |  5 +++++
 sound/soc/codecs/nau8540.c                   |  5 +++++
 sound/soc/codecs/nau8821.c                   |  5 +++++
 sound/soc/codecs/nau8824.c                   |  5 +++++
 sound/soc/codecs/nau8825.c                   |  5 +++++
 sound/soc/codecs/wm8580.c                    |  5 +++++
 sound/soc/codecs/wm8782.c                    |  5 +++++
 sound/soc/fsl/imx-pcm-rpmsg.c                |  6 ++++++
 sound/soc/intel/atom/sst-mfld-platform-pcm.c |  5 +++++
 sound/soc/renesas/fsi.c                      |  5 +++++
 sound/soc/renesas/rcar/msiof.c               | 10 ++--------
 sound/soc/renesas/rz-ssi.c                   | 19 +++++--------------
 sound/soc/rockchip/rk3399_gru_sound.c        |  5 +++++
 sound/soc/rockchip/rockchip_max98090.c       |  5 +++++
 24 files changed, 124 insertions(+), 22 deletions(-)

-- 
2.43.0

