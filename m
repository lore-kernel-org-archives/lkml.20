Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452263;
	b=hIjVJKHfRoxHckA07qLSF2zqxMi4LD9zLFFrzTJ/HM/AoVWMg8fATuFZETWcTUzp1zXR
	 xeK/XnjV8xahcG8q5FTFX36s6pXpbPl6NI4W/zAmwh+9uR2+1fumBenAXRlIAtWIhjC0h
	 xpeJKZ79tneNAWjnESEJe2XnyzmBZWVQqd+fl3ySz97SV+unkV3IK5XeDaLl2bpvETGOi
	 EYiGvbkXnhkY+t0rDWC9bog4EB8wlWqkO6ExoA9OKeaYwrVOxyf67UQ7rf79WBtknK9ax
	 PwDYNwI04DCxrg1rCAIRmrHGCIHc/m6obAB4IcDD+HIEgCEbWEq7DaEsjC2kB5OIraA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uxoILjDAWb6D0M7GS0zesDvM6dHezWGmP4GBtdH0Uas=;
	b=MTEUHERUQaTT6GM7fhcdRofgKnyqOe7UhAb9DI4yvW8ql63vX44Glv2e+U7jcVfRtJOr
	 G/2c6LMJmNtjX+LltKBXxtRquKI5WP0xQTreLdELoE2XG8Av/1OUUYIaHENBzAELXH/M8
	 JWvQLbiaCsEwMV3M/kSVWqtvGqvHA+VM9HnPqjYJ8NpaFbd+RamSEP7SpOL0r9LpcBlzj
	 XlzFYRhR/g3bOv4lV5Jhab+lZ8dehG5KoEYa5CLztzxuUMzI+lZuLbkBOrgbexaLc8LAZ
	 BbHAP3bKIZeDjEkA5PE2F0IatdetVUwDACxYtuxiEp5uamfC3XBBWGqv9q0HkVoCCHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="AZ0qh/2X";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3AB606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB3AB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AZ0qh/2X
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1ddc7c9beso12105495e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792452261; x=1793057061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxoILjDAWb6D0M7GS0zesDvM6dHezWGmP4GBtdH0Uas=;
        b=AZ0qh/2XqoUGHLX3K8f0Q9BjFen2hJUa85lAbJGI9BCfnIlFwde+MKYuxxqHc0S2D4
         DSy3xR6paSHfp4wgO9YqSuJvc6knkW2ZFRqb7a8TEJxSecJTpkKB7bUsfpmbd4kVHaOu
         qMG9SVG1YDq1D6wOvazUjWUm/d/8AndSy20IMX4/dOfmxVsRgVqk7vtBqbBCS4Lny0QQ
         R1nZRqRSkmL0Qeouq7kpxEzJP/4uBT1dPCAMW5RbGbalKo1GUcvGF06QhG7gc1cNPmpx
         L7eIzhcdCrMKDH24Fspq6dxnBvoOxdxtuuI+sq/n2SldGr7BAe8hXGjlSXkyDOKAOIgl
         RLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452261; x=1793057061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uxoILjDAWb6D0M7GS0zesDvM6dHezWGmP4GBtdH0Uas=;
        b=hkrKGnNxMuNQCk5xI1qh+LE/uR2HY1EC0QIqIzPZ/p5Erz20b+6GfDbSb5GUY28z5f
         8MbPkZO/HVkxVch91m8bxBV8jaknxrEjCEkKeAF8iHbG2FJPgAKiu2fXoihI3PscsizL
         yisxOxkOaewqmqDrDisrXrOO3uqW7/9QSK0izxBRf6wwAjn6PUgJ/Jj0tZzZD48z9ytK
         76FkmqOmqP+aNUhJmzEJgckR4G3yxMFtRZWdkPUKGhHw5fJOHxOf9GbBsTeZwqod4mmn
         pe9NmIBxkz11HlqhQggKG+y1dPiNC6OSNpTChNgs53tjdWoqMV/jkJKz67EWEA2j8CaH
         Kqhw==
X-Forwarded-Encrypted: i=1; AKwUvBxqu7N8Hag7NN7kXUf0lRvO4b/BawX4/1ki4kl3rcUTHdTumVfjVu/Tp6QC5veMLugmGgJ1MPzIUZD5GOQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkmwl8RVrcjSbNKVeDEmeFspcjsTrIzWPXHgFJI+YLnCJo8fNV
	URueOQEuZ0/0MhgxYTcFmyxxd5MQLsd1tqgGMB1aRMuzc9Q3coVpDzgF
X-Gm-Gg: AYBFou2GBRoY9uSUtShIUMawv7rPmSPYITAquwAgFcKlKWQEUwk6oOtnlp7+AJgFFb3
	incZsSPtUDuzIK756lv/l+qd/bZp+rq/NEfiFSDv91ATK3cr1c/2s86AQW6qQv1aQI3b/YeS+b8
	C1kfl2Rj6dch7ZdvXvYSlO1PfUKKGB0wZ38Z0TJzM4DYpEtPB5CFNwCRPLoqvqfEKO0JUJz4pUB
	mz/1Nki1pqGs3qF8/IerlH62QlDIxy/IdGqP7GfWROU30k3tAa44O79dtiXSBBTpgyJX7IztbnP
	Am51ihgmJihbCJVlfk1yHQK2KyVO6tFoOkyX6l7Zp9R2sXfw4i9CU+efU5xVpusMsT9Qp9V2e+Z
	TdTliPA4po0MI4o24wPG9OP4wmq6E6c1kfDUV0s730bJZ+1nVEbI7/Udl9QxOjyWTAEPIoVyull
	6BR0OcH5sn6tLpxqer+vHI5HSGHqWxtZfaRTI5S0EXKsCgWSBt9XsFbMDrrLLlo6hYHzdwUIEdT
	pxoMI5tjlifADOj+o3vaIRsZp//XCW1zsFtVJQ1wEj4R9UxH0IsGKxIR6rox6KagKZ/AkuQMXhp
	eJ4=
X-Received: by 2002:a05:600c:1c16:b0:4a1:f03f:f1f8 with SMTP id 5b1f17b1804b1-4a1f03ff47emr45105695e9.3.1792452261130;
        Mon, 19 Oct 2026 16:24:21 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cd348asm26244055e9.11.2026.10.19.16.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:24:20 -0700 (PDT)
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
Subject: [PATCH v5 0/2] ASoC: Add support for AN7581 PCM driver
Date: Tue, 20 Oct 2026 01:24:09 +0200
Message-ID: <20261019232412.516028-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Add YAML and driver. This has been verified with loopback
and confirmed by Airoha with ZSI voice chip.

Changes v5:
- Use local reset variable
- Fix validation for channel and bit mask
- Drop use of threaded IRQ
- Return if snd_pcm_hw_constraint_integer errors out

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
 sound/soc/airoha/an7581-pcm.c                 | 906 ++++++++++++++++++
 7 files changed, 980 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
 create mode 100644 sound/soc/airoha/Kconfig
 create mode 100644 sound/soc/airoha/Makefile
 create mode 100644 sound/soc/airoha/an7581-pcm.c

-- 
2.55.0

