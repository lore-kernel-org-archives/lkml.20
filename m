Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A5D443C19
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806056; cv=none; b=GjGpmHUQN9yDgLxvt2Yh7DPttZjvPqgvjAyYl9YnPNWwFuxMN096yT6WahmViJRD+ae5qxRgBgy8qE0WLgvb08GahlXR2AihsZYdbMSocKDzV5zuAIBw8Eawjru1yMLJSGGUh9qp+2QaiHdINUW1ndCMqfqoXR72Jmo5onqepa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806056; c=relaxed/simple;
	bh=RIXnkaIGdBYruZ6AHlMRU+fZ6F/Tbfygc1Wr4yD/oEA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ZZhuWo+DzBY6aS3BhgQTCGqszJxGMjPUvP4lpY6kt9m2MuKAZKsYeUfM2kxE6l4PBE9bNvJ6MKZgFT1XbBUkG4HVUBkNU1intPDZ96nKJNjxjmf2Bc1/b6mLR9R99CmOMOZ7YjU54+Js5Ln+CA2TcNe9Vq7In+EcH3fd80stu1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvzqoBAf; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvzqoBAf"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48afe75f055so1684347f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806053; x=1792410853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHowWq+YczhDXXIY9TBMKGYh7uMuFbwbJnMWhOB2Lqo=;
        b=lvzqoBAfkt17Y3Gv8MkXfYnL6kJH4SAb8HxV11uXnzUf5S8CiXDQRfe//k+aUsvKW4
         HUIid88JWRbQMz0hs0FYxWggmHRXmAjRMqOh92rXALOxBUYluXp5WhLcxnar02Y/g24m
         IU2X0cwhBt6ieZzWwbHmXDosrprn3yXjyD+NOQ3ICcQ7lnMTXAPHEsfXwDBiSInQSyYH
         vTDkUCFjnumwOXX9vwieCXwZ6DkTq6Hzoa8b9X4icYJlz8dmLeQYzwleiIawQtViRopU
         xHxhcbj0i3esqKQMBZW4oLFPFgl6P5vximmbDde7TAv/hnPSigUXhenFq2QNLAwkJqpS
         cQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806053; x=1792410853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aHowWq+YczhDXXIY9TBMKGYh7uMuFbwbJnMWhOB2Lqo=;
        b=ge5ZDHPPTmQRqju0gjozysw918xsShYLo0h3k5h0uLG2sF7dud/oxzAgd3OS1KnOPT
         bBcw73ODqmYivlgjEAxJ1mISeiT7xgIOhD0s+ewWBqLeThqexWY2BRS2OiBtb8+Z218N
         wkcsQ/3PbyERLnvT0NZfls5/H2k2HDWUnWiBIUzB50KDRcWlJguHFlHC1ag3FmLhxADh
         t8xG6EX9sifIh+bL73aUyjOlib6KDovbnj2Lrnadq5YXp8yE4LsRE9SrD1miQnnuYzEF
         aMNUXVmNA1+hqA15oSxHlQzsbsGk9WVqGXhmdRmeFqXcH6a7HTmQ7AYmsenJjsWqxFVj
         kiZQ==
X-Forwarded-Encrypted: i=1; AKwUvByT3mzHingJg1IMyWI4o0fyrrm91FiLbBnctT3htQqnqLAv01A2j+8EROxpU08Eha5JQCLdtt3lqcesODY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmtXMQaWjl8cdhGhwvJbGUp9Lf0U5utO3Wk6mGQe4VIrWZv4e7
	XPiRBFfyk1hX2LZrOyLYDFT1cGerd9DYzWoSQkfX8MCKQXwS0vFI6PUX
X-Gm-Gg: AYBFou1GgBnY37cAnIKzZEwFojthjQFQAi4G2RsSoYkzqVlXHa4AsiPiotMjNd6QDim
	ty/AENcxwrUK21GaV9rfpffo3vvzijAGqhRmA3UfixcfN9vYn83rPGExBXay8eeqg6Wakyr4BjG
	VHKy87oaJUEej71jwSGYjRXYqK7zofQFHqt3MRNDK0u2uNbSpamvhgMT1xCu7tb4LrOCMzcB7q+
	v0D9dHf6XpZ/Oevev0I2e3B2ga0QOZ9fnPGGznag43HDmVIUq4Ho73R06ZGwL+b9tDgIqUoYtYD
	gUKvl291tl1UBZODmeS3/JH85uIfrrCbm6mvAAEpUH0eKTfyqVIBLsZVN5TcI6idElQiEvz6AOU
	wVsh+ZgiWs/aG6/azqFEwq7e4qNhJej8MC/Oq4A92dSlzcmpX06r6h/iCwUmnM1ifFGbFZFmv/q
	pWoYxS9L+UqmXFXlxeAgve8kr4DqLp9O/hly4GaQqLObbGxcn6wAIDO7KqG9FDJ7nwmmS/ogarK
	sR2SUcDatcas0Hhmj6JUXhUmq/02AcGQLsCfqH6fIIgenGrzMJr+LeqjEKg1yUaIDoerQSGqY3X
	YJFXzPrA2fxkXAih9HVjsw==
X-Received: by 2002:a05:600c:a404:b0:4a1:9945:98a7 with SMTP id 5b1f17b1804b1-4a1994598ddmr70360335e9.0.1791806052577;
        Mon, 12 Oct 2026 04:54:12 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm311783805e9.10.2026.10.12.04.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:54:12 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] ASoC: Add support for AN7581 PCM driver
Date: Mon, 12 Oct 2026 13:54:05 +0200
Message-ID: <20261012115408.87066-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Add YAML and driver. This has been verified with loopback
and confirmed by Airoha with ZSI voice chip.

Changes v4:
- Add review by tag for DT patch
- Address shashiko bot comments
- Better protext tx pos
- Set DMA mask for coherent DMA
- Use more managed resource
- Increase users in startup

Changes v3:
- Out of RFC
- Add Documentation patch
- Drop SLIC testing code
- Add MAINTAINERS entry
- Follow normal pattern for commit title
- Improve commit description

Changes v2:
- Rentirely rework IRQ handling
- Fix problem for timeslow configuration
- Better support duplex mode
- Better handle descriptor tracking
- Move to Soc directory
- General code fixup and cleanup

Christian Marangi (2):
  ASoC: dt-bindings: airoha: Add AN7581 PCM controller
  ASoC: airoha: Add support for AN7581 PCM driver

 .../bindings/sound/airoha,an7581-pcm.yaml     |  52 +
 MAINTAINERS                                   |   7 +
 sound/soc/Kconfig                             |   1 +
 sound/soc/Makefile                            |   1 +
 sound/soc/airoha/Kconfig                      |  10 +
 sound/soc/airoha/Makefile                     |   3 +
 sound/soc/airoha/an7581-pcm.c                 | 904 ++++++++++++++++++
 7 files changed, 978 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
 create mode 100644 sound/soc/airoha/Kconfig
 create mode 100644 sound/soc/airoha/Makefile
 create mode 100644 sound/soc/airoha/an7581-pcm.c

-- 
2.55.0

