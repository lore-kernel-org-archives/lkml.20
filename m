Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669496;
	b=EBF/cSRcEzGO4KPEdiBtUJX5WqHzrIffuGjg3v1+m1EbBmWn3QtlhiBeHHz/eQ+8ZynW
	 2r9EdYuDdnfr0cGXRgeFp/NPrgWPlf6ORYLRoZFYYMO6Wy41NXM3hrKMnicX1uxToqwXt
	 mFLf5Ya2/20IiCK5nA8MeM5NYTzyXs1Azzcqe5P89I5c96vpfchY8OoVysiTKruONeUZs
	 qLXpixglbWprxwHTES2ssp49w12EFp3S9REY3cIr/AU+0A4xyKZo5+7rJ7t0kXaUry4VX
	 ISzoYhdBrqg5w80BjHgh526VviSgfFAo4ryqIu1KcRVMikyHyGrCXoixUrP+6j6+EMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669496;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ORJ527vScYTcyRVQXLOjs3H8InD+uVNFm8/gn/4ZshA=;
	b=X8FCVOuljJ+KDYQFteigQ6+8PfNlCWjFnp2t4VTvgb3UPwCC7Ok+hUlJ1LZtLefTi6Zj
	 3F2k5Z8wZvoKSUlL1axc0DMwq9mvkKDejdBz+5Xs/bOD4vUgY0KPLUKn5Xb0p3VEv+7VC
	 D5FljroNH4bIoQPEbvWL6ibGzDxO3Cd/Hy1pEpwK0Ww4fGrCf4wBIi+jpeHJR6UNXBdP/
	 66wR2GXvpXgbl1fUoT3yL/W/5tgAGVQhKNrtb0v+TfRipssx0h7GCH3mpkvp3vHTUkboT
	 tD1LVGkdbD4r4jUN148lZ2e4WMprnuOwJmz960gi7SjTLkgDek4oCpwvEQMIFBhzCgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vGEI2T7K;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1345C606A326;
	Tue,  3 Nov 2026 01:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1345C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vGEI2T7K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=vGEI2T7KXqc0LYg37CUq2n5OmnvFkqDJqcBmtnv9HOUe0Ru6kPHQVXnuTbRXU66q5xIj52fscAHTS
	 GgHG5KB9Ck7qYzOUYw9lESdqa+gf2NxYX47/ercOvtT6iQuSy8RVZ5Bfn4l1FWUCl5P4K7Ibms+l6X
	 ZzBHC3/bQDIRpCO8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16ae9396edcf-68d8a;
	Tue, 03 Nov 2026 09:31:29 +0800 (CST)
X-RM-TRANSID:2ee16ae9396edcf-68d8a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96ae9396f106-e3f58;
	Tue, 03 Nov 2026 09:31:28 +0800 (CST)
X-RM-TRANSID:2ee96ae9396f106-e3f58
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] ASoC: samsung: i2s: Fix runtime PM usage count leak on failed trigger
Date: Tue,  3 Nov 2026 09:31:25 +0800
Message-ID: <20261103013125.1067-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

i2s_trigger() calls pm_runtime_get_sync() when the stream is started,
but if config_setup() fails it returns -EINVAL directly without
dropping the reference.  The matching pm_runtime_put() only runs in
the STOP path.

Neither the ASoC core nor the PCM core will issue a compensating
TRIGGER_STOP for the DAI whose trigger callback failed, so the usage
count stays incremented and the I2S device, together with its clocks,
can never runtime suspend afterwards.  Each failed stream start adds
another reference.

Drop the runtime PM reference before returning the error.  The put()
must happen outside the scoped_guard() section because it may sleep.

Fixes: dc938ddb5628 ("ASoC: samsung: i2s: Ensure proper runtime PM state of I2S device")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 sound/soc/samsung/i2s.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 442e70b10..30a188f54 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -936,7 +936,7 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
 
 		scoped_guard(spinlock_irqsave, &priv->lock) {
 			if (config_setup(i2s))
-				return -EINVAL;
+				goto err_put;
 
 			if (priv->fixup_late)
 				priv->fixup_late(substream, dai);
@@ -964,6 +964,10 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
 	}
 
 	return 0;
+
+err_put:
+	pm_runtime_put(dai->dev);
+	return -EINVAL;
 }
 
 static int i2s_set_clkdiv(struct snd_soc_dai *dai,



