Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2D610785;
	Wed, 14 Oct 2026 20:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.128.243.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008387; cv=none; b=ZiXftpQ45IfusABE4eGAuSUFVZCjcTrraY5Rx4b8/sXJNOpZbElNRVus90oVVQqhqlF6Sr0pi141RJ1TR7YjDZoO5/zmR/fCq7yZfrdZWPo1WHMTfNJ7hOQdMbf+YjEAcAQtkOMxXFpB9e+Tmw4wchcufvdUx8wiuojIle6uKvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008387; c=relaxed/simple;
	bh=eamqIJxyYWCYpIz4+knPnj10UHlg6jygmqhuvQQPCzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LPmTlgqTAdGcZrzq8s3GsDlVF4lWC4orVQAyUDEfdy9zDn9MZR3UwjNSHga83mjRb76FxOtLsAt63kSFaFIdI2ooWIkaY+OiOw18S8XQR2KYkVuKHwHHIVDhlRPGa+ZeaRhy73/aCy94fAUuTLXE/GfVXEoXQ58pk9ZvqyGdgOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net; spf=pass smtp.mailfrom=asmblr.net; dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b=Pje8Jf2c; arc=none smtp.client-ip=85.128.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b="Pje8Jf2c"
X-Virus-Scanned: by amavisd-new using ClamAV (2)
X-Spam-Flag: NO
X-Spam-Score: 4.474
X-Spam-Level: ****
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1792008376;
	bh=yjN15rVSHQBazCs2lt1RHxdgXqb82Zc4FN9nFn0bXtM=;
	h=From:To:Cc:Subject:Date;
	b=Pje8Jf2c3OF1+OO6h2Y3L3jIX9R3s9mZKntAkBPsO08Mtp/LYExPaR5nSQYkYPMTZ
	 J2E1vi4feaUiot8tv5bcimvJm5zuzkyLCvfisCkx50Iy/QixEoJDwZRcKKZX3yuHOt
	 JTynJRJaIKwG5W5/pvovQVlol4tQAWn4Ppp/7Go+zZJ3H146hQHYtfyOIJNScjU08j
	 qTM+c3IGy605Vu8RojTWSjBioljmM+wVAiRWjKSex4xS+Egc3wZIoK/aI6/hjEgKB8
	 /x2cxZJkL0PIayroyZMLtt9p7ekv282Okcl6qJE0/nA/9H3Lnbell2qmvF/EgCx6EU
	 DChuAmd3wHupg==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id 510121BC4E8;
	Wed, 14 Oct 2026 22:06:16 +0200 (CEST)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 0/8] ASoC: Series of loose fixes
Date: Wed, 14 Oct 2026 22:06:00 +0200
Message-ID: <20261014200608.118770-1-amade@asmblr.net>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Following current fashion of poking code with LLM to see what issues it
finds. Some are minor, other more likely to cause some real issues like
the one with snd_soc_limit_volume() returning positive value, while
callers do simple if (ret) check.

Amadeusz Sławiński (8):
  ASoC: soc-link: Correct stream stop operations in snd_soc_link_trigger
  ASoC: ops: Fix return value in snd_soc_limit_volume()
  ASoC: soc-topology-test: Check return value of kunit_device_register()
  ASoC: soc-card-test: Check return value of kunit_device_register()
  ASoC: soc-ac97: Fix error handling in snd_soc_new_ac97_component()
  ASoC: soc-ac97: Fix debug message
  ASoC: soc-component: Fix return type of snd_soc_pcm_component_pointer()
  ASoC: soc-dapm: Remove widget from cache on removal

 include/sound/soc-component.h |  2 +-
 sound/soc/soc-ac97.c          |  6 ++++--
 sound/soc/soc-card-test.c     |  7 +++++--
 sound/soc/soc-component.c     |  2 +-
 sound/soc/soc-dapm.c          | 20 +++++++++++++++++---
 sound/soc/soc-link.c          |  2 +-
 sound/soc/soc-ops.c           | 10 +++++-----
 sound/soc/soc-topology-test.c |  8 ++++++--
 8 files changed, 40 insertions(+), 17 deletions(-)


base-commit: ac32e27bace1bfa2e39e2c212e813f157968736f
-- 
2.56.0

