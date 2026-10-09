Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98C54B515E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544438; cv=none; b=JgAKUfA5E8bzHhuGwEPETxTml/x/1sHJFimq3bwrKSb8AbTRhmwAtSWtJ1cJSWcB6n/FXiLICE/wSd7k/1d8XDirY2ARePuUOuBvAojik8Ny242/LCBTWqisQd5ws8+yTFx/Ut/VjYqzvs2nfJbiH1N3gUUgEwBYLPpRcQ744vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544438; c=relaxed/simple;
	bh=hB7RUXXcplyw1SxWPvRgz7883UT15C/LbarUbzqzH5g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=RoBJrMJRyGexWgarl64X81xPXJ3r8gUdRg99ZffHKUzDKaSoHqvlTsmnxFBC7wjeZtJcmkshcdp4fdgFKVqCxdGP/X0guLwy8UWroPefdQ8vZDrysrfFnSdAOSI5orS5JqYcWVXQz1/VcMoHmbejtK1PqVZtiu+zPvxMznAJZRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1McgZ/I; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1McgZ/I"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a01933b584so36644075e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791544425; x=1792149225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ga3VtcTLqZl5ClQan+7orwRYwMHOLr/NfbU62M9Yt8c=;
        b=f1McgZ/IlMCsRvPdEeX8Mqbk91HpoDJmnd07R4qzDnQT7//uin6eDwdPU+zy9c5GHy
         rxOuhuIUYeTVHQWGF02LZpGXsaEncdzytBj4tyEjE3/pEphVQCvzWYXcbTdJKsMoQJ6c
         UsDfyPhVKmzWMRG+yBT1Vut3CXabMiR7AYzAuh/13FBNsG+87xlNm341mMfLzeJMdmV8
         A6c0CcXPHy5mLTm71qesx+0s3XHBPcZQXwnZFhl37rLtvMbOB7Eu5KRRmzeN3ci4Vy6N
         kqYjxzyadLcNQPJxK5aCWjk4jKUaH+geAlqAfkCBpwkFiBHGmRaSB+DYuTh6nSHHNOF+
         LsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791544425; x=1792149225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ga3VtcTLqZl5ClQan+7orwRYwMHOLr/NfbU62M9Yt8c=;
        b=ZHwdFfn9SY5sqldqVxFqJCjjC2E5pN2gT5Ns2Uh49qe+sluh7ZXO2FeWTli8A+cPYL
         msiOB8AovAjEfJ4td3IIGrn9mCXnH1nG42gzO9cQaMntzDuFQiitRFjr6qMSQW/stJbZ
         QRyVr7ZjHQLQmNQcg8XS6AcV7mnQSHC2sevhKIiYU3+f6LbcS0U6rO1lpJYzMBnRyTdg
         Fbgi6IHAWA2O1Sorg4LxHniGU2Xvfh35I0QoGNDoNjcMA3TRlTmABVSZ+L7KJzTGCdTc
         Ku5I9NfuKf/kN+lmDYmw+tCNuQvi9PCOm2K7BdWQ4kauzIZlglrorBavgocVMMy9bXa4
         3FMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxN6SxBz0QO/5DWraHhXg/giqhujCyAGPIBzQaHgI/uAGoAvuDHcKaSNZgIeJluRpfviEvAix0ytagMjo=@vger.kernel.org
X-Gm-Message-State: AFuF++k/08kj2zqc+dyE+FPYq/k40Krlymizl7tNH1/XUX/AlSt0yhxf
	iVozSi4yHBpmgWX0ifdmO3ROvuEsOeiTuzRM47v6gtmv6He/QaCpd33K
X-Gm-Gg: AYBFou1GSsIOAYxcTFKXtxeOHCPOyRzG/zooooxw8Lj1oRKv8sOr8xao2bNmqUkhgXu
	BrFdnkuPnvJCNSzWAVpwQ0eeGirnaBjd5/DCt2q+5vj2T8LsSlYooQAbVVuVzXPLtFf3yxlWSdI
	6yQEGBiW2GO1B96n2oqEA8nNXmIxc9RbJj9P38xTPfo7SNf+fTjeu2oT4f18eOnF/fA3L2j5nVI
	oWXL/++vBtJJM4plkO+23IdyUOaLx61PqKff9+B5KQBmfNO4qjA1BerH6NVWmj5m1S1HX3Wovle
	AN2lSyvwm+zecKBoWeAZRfkjMqESyu5r00UoKV9hphsEM7eLx/stE3xM2R7XwyASS2xl41aqUUZ
	ZU/n/aYIl+VeKJ/pRZN24eJCC++tjldcL4mU9VJ2iUV7g/mqOxYiBffmqwKQXumvIT0rn+B9twG
	0QYV3/6WSHTDYIZJ6xULfLVZmwqh2BVN5aMKvnVmBHfZaX5MGnZU9nHVpImxFg+0h3od8b7Go5/
	WOSwR2whHjEGTO+ktglUgzZ/F+PR/x4ozoAqJtW16U4ctLFoCHnmYk3Ub4Jg2yjBNbazUR/Bgt5
	cnfiusmDXhiMAuYB
X-Received: by 2002:a05:600c:4fcb:b0:4a0:1c69:f607 with SMTP id 5b1f17b1804b1-4a18e4c3dd0mr26633215e9.29.1791544424618;
        Fri, 09 Oct 2026 04:13:44 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bf135fasm45503605e9.5.2026.10.09.04.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:13:44 -0700 (PDT)
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
Subject: [PATCH v3 0/2] ASoC: Add support for AN7581 PCM driver
Date: Fri,  9 Oct 2026 13:13:30 +0200
Message-ID: <20261009111334.23522-1-ansuelsmth@gmail.com>
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
 sound/soc/airoha/an7581-pcm.c                 | 910 ++++++++++++++++++
 7 files changed, 984 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
 create mode 100644 sound/soc/airoha/Kconfig
 create mode 100644 sound/soc/airoha/Makefile
 create mode 100644 sound/soc/airoha/an7581-pcm.c

-- 
2.55.0

