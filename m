Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8087447728D;
	Wed, 14 Oct 2026 20:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.128.243.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008388; cv=none; b=FgJhElhiXyYdFCt6mu5EehuxEMFhN/a4vzjxxPAsao3YJLnl2wPAUNhK/3De0FdMQmycwiq2+wdk/7Ze+lpBpDjmKMUrHswL0Q1wPrVmEpNWDfhvJZQIPTRZaNNieUy1SpqQdEEWYo6jmdbenRnPBdJxoa2kd+klHFfEVQ3DJ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008388; c=relaxed/simple;
	bh=BM9PAc3YLpTdHYpu9vHSr3Fk3KgPq/7GeFRld1k+x5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cOIQB2oQFNlBnsaOfOLzgJI/6icgRWEZzgj7MRYu6O+GyjCRPN2hSFOOVmh26dlvugOKrxzCwkmozheRa0/s9zYa/phFr097HlekXZEtazDSTY2jfhdWe22+uWXvCjfOLLObgY+QeVBiXfwNJcSRuH0SEkFhzaqx4PlHiGe0MtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net; spf=pass smtp.mailfrom=asmblr.net; dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b=l0J5agph; arc=none smtp.client-ip=85.128.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b="l0J5agph"
X-Virus-Scanned: by amavisd-new using ClamAV (2)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1792008377;
	bh=GwsSNEed0q8frz+j+qKqe3ZlvMr6jRP/RpCCGHjfpJs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l0J5agphRVxdfuJ+vzXpGTo9J0k3HW7j9sqaFUE6Eh0f1f5/EhSr4XaYI4tbntMsB
	 par19XEA/k0eVqZ8pFhaRC5turvVuw3A2OS26KAhwdQ6O+zVaqEOjPyA1jQU6tpENQ
	 rdQC5OfKRSGKGLLpUrjBuJB5sDdVfKYwXkXnXa7sNLZ3MaQ0pHgQxz2dlRZgOmj3lk
	 +hDG+yTPO009T4vsVYCBas/faH3EteDOqEQqvt0BQz2VxqTHYKjENRs9VHns+2WHDy
	 r6mdEIpc5BuhI4n9U7gVZW2/0LR11wLieI3x+JQQ58bmuEcb4MoNRMNn6C4QZ0ek1E
	 yhmZ+HGgjpHQw==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id 71A5F1BC50B;
	Wed, 14 Oct 2026 22:06:17 +0200 (CEST)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 3/8] ASoC: soc-topology-test: Check return value of kunit_device_register()
Date: Wed, 14 Oct 2026 22:06:03 +0200
Message-ID: <20261014200608.118770-4-amade@asmblr.net>
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

Fixes: e57cdff0ddc4 ("ASoC: topology: Replace fake root_device with kunit_device in tests")
Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/soc-topology-test.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index bcfb52061133..8df845a196fe 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -24,8 +24,12 @@ static struct device *test_dev;
 
 static int snd_soc_tplg_test_init(struct kunit *test)
 {
-	test_dev = kunit_device_register(test, "sound-soc-topology-test");
-	test_dev = get_device(test_dev);
+	struct device *dev;
+
+	dev = kunit_device_register(test, "sound-soc-topology-test");
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+	test_dev = get_device(dev);
 	if (!test_dev)
 		return -ENODEV;
 
-- 
2.56.0

