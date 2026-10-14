Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67233A83BF;
	Wed, 14 Oct 2026 20:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.128.243.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008388; cv=none; b=doBPoODMvd3GW9XCC0/cNi6iVs5tWHMURm9rCIT8KwSu+x/ctA4HjNCe25ICc+NeScypEVPercsc7W+PeO/ZNRKtDnqO2oUaoPfU6c3TPIWfWzbzM278evQf/Q2xfh2Lk1o3qm/au7AWiOZwnoYNZ3dbZqevj0ISGxf0edn32qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008388; c=relaxed/simple;
	bh=jlAYGy/0N4bb/8wpXxCXCVnIE8lIy1BvxbVQNX2onuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C0L/pxnl8f+fcRgE6K9jReTzzf46vngf8L9cbJQ8ek3NLrICowY4EEXmIJEe5Apc7C8Nsb5WjygBGYQoRBH/+x0SfcV1ISLocT6IjfW4DwPrWOd1MnL/wG+MLf0L2VN0nuWSKwEdhHZKXSV4ao9RKR6UhEk6Aysygu8vN9Ml6Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net; spf=pass smtp.mailfrom=asmblr.net; dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b=i+Ao3fVN; arc=none smtp.client-ip=85.128.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b="i+Ao3fVN"
X-Virus-Scanned: by amavisd-new using ClamAV (2)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1792008378;
	bh=IxLrYtMhhqSn0Eq7yboPMnwLTO5CQM4clEaxJAQRAsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i+Ao3fVNxwo9RqltH+X3yc3Yv+w96QvhQSqjNs5HIokCnFB9ZcfvqJkzXoaqoHxcp
	 NwfUegn5hZm1CF1x62Uqyiw0BzUAuWO9K+WNtdtcTl3Pk2qVPL+gvcKo2iYmtLWc/v
	 um+YbRFHhr4bbWuSvxv2IDIi4VD+J1S1SIy/W0oKWl9IP1tqbHrxQYP6H3WFag8ktr
	 GRpMIbklG9gZAGTfJ0sAQMTb/822Zd2V/o6nnANziz8PhNgZcUA4uF/dbiLqhZTPK0
	 e74m1FwXuz28S9uLuA92VgX9En/7851pnPi1RNc4OoBwNZdxVUsKdbqhGKOT2nKXOb
	 cEXa0dz5RRpTA==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id CC0AE1BC53C;
	Wed, 14 Oct 2026 22:06:17 +0200 (CEST)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 4/8] ASoC: soc-card-test: Check return value of kunit_device_register()
Date: Wed, 14 Oct 2026 22:06:04 +0200
Message-ID: <20261014200608.118770-5-amade@asmblr.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014200608.118770-1-amade@asmblr.net>
References: <20261014200608.118770-1-amade@asmblr.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Call to kunit_device_register() can fail. Check return result of
register call. While at it introduce helper variable so that if it fails
put_device is called on properly initialized variable.

Fixes: ef7784e41db7 ("ASoC: soc-card: Add KUnit test case for snd_soc_card_get_kcontrol")
Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/soc-card-test.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-card-test.c b/sound/soc/soc-card-test.c
index 47dfd8b1babc..610b8220786d 100644
--- a/sound/soc/soc-card-test.c
+++ b/sound/soc/soc-card-test.c
@@ -70,6 +70,7 @@ static void test_snd_soc_card_get_kcontrol(struct kunit *test)
 static int soc_card_test_case_init(struct kunit *test)
 {
 	struct soc_card_test_priv *priv;
+	struct device *dev;
 	int ret;
 
 	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
@@ -82,8 +83,10 @@ static int soc_card_test_case_init(struct kunit *test)
 	if (!priv->card)
 		return -ENOMEM;
 
-	priv->card_dev = kunit_device_register(test, "sound-soc-card-test");
-	priv->card_dev = get_device(priv->card_dev);
+	dev = kunit_device_register(test, "sound-soc-card-test");
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+	priv->card_dev = get_device(dev);
 	if (!priv->card_dev)
 		return -ENODEV;
 
-- 
2.56.0

