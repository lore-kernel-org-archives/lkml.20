Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEDA48EBF6;
	Wed, 14 Oct 2026 20:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.128.243.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008399; cv=none; b=sVjJ8SoMBtXQesqcoONKozGfqdrl4waAdscA4zhRhz+D3d8mrB0rD2GhhZc3724IbT4PnWzIrbpfThnnEh1CixximEjHXt+on0PmhoCWiG9MnoEIyIbx/vJaZqvwgL+otJ/Bm/EfzM9kpp3x7JfT9mOo8Z5Xsa5vD0+B9uYJn08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008399; c=relaxed/simple;
	bh=GFq6H2UrIxc9yenr91zEFRUEwIrJZl0MB8GM56WbxOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BTxgwM4XKYaYRh8BB51WOrrV+STHKFHWCz6HkkAkHDovtcmUyfLx2g5B2/T8ZdrtVmFyZA+41u0VToUcjaazO+lCQlBvUzlvpQg8sDZ8E+N1Me5XjTNmAz3ysK82GjOa/Sb3dNJEEOtunDOKU7Tf6OaTc7c51Wi4lKCfT9Vz32g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net; spf=pass smtp.mailfrom=asmblr.net; dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b=gzUEWN/b; arc=none smtp.client-ip=85.128.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b="gzUEWN/b"
X-Virus-Scanned: by amavisd-new using ClamAV (2)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1792008379;
	bh=UMkPHpj06admmhggcetzKLIWh8Xr06djkTDxM6/Dkcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gzUEWN/by9q+teooBSdaEIlnVADj9Ag9yLm6hlXtH8f37az7jN0Vo1rWzd/YkCFfk
	 tIT2DlHUh/xE2mwh5FMkuIoZgBRdQESojYx7audLSNMp2iNwBLDfiPdrhBOXej1prP
	 OG4XXfVW1Hujh8pF9I+m76bz4PoENIMPLH/1qfjIM1/c2fbVvRw+k0SOKKwXxExYY6
	 93slhndp4f2kWQT0siQxES04riy2H6v0eNkErPQ/vE9lcnZgzHSHyYFt1OV4z3Q6Rg
	 vq6tP4OOWCr147n+pQPW1aFLlx9PKREmyU9P/m1HRtz6qeQNwvoe1nqaPbjHPYGomB
	 +3E5W+llixy+g==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id E72761BC531;
	Wed, 14 Oct 2026 22:06:18 +0200 (CEST)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 7/8] ASoC: soc-component: Fix return type of snd_soc_pcm_component_pointer()
Date: Wed, 14 Oct 2026 22:06:07 +0200
Message-ID: <20261014200608.118770-8-amade@asmblr.net>
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

Both caller and pointer callback expect the return value to be
snd_pcm_uframes_t, however it was defined incorrectly leading to
potential truncation of returned value.

Fixes: 0035e2565b93 ("ASoC: soc-component: add snd_soc_pcm_component_pointer()")
Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 include/sound/soc-component.h | 2 +-
 sound/soc/soc-component.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index ac5e9412582e..ba860e28eec1 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -432,7 +432,7 @@ int snd_soc_component_compr_set_metadata(struct snd_compr_stream *cstream,
 int snd_soc_component_compr_get_metadata(struct snd_compr_stream *cstream,
 					 struct snd_compr_metadata *metadata);
 
-int snd_soc_pcm_component_pointer(struct snd_pcm_substream *substream);
+snd_pcm_uframes_t snd_soc_pcm_component_pointer(struct snd_pcm_substream *substream);
 int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
 				unsigned int cmd, void *arg);
 int snd_soc_pcm_component_sync_stop(struct snd_pcm_substream *substream);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 34efb270ce29..746fa4f54450 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -920,7 +920,7 @@ int snd_soc_component_test_bits(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_test_bits);
 
-int snd_soc_pcm_component_pointer(struct snd_pcm_substream *substream)
+snd_pcm_uframes_t snd_soc_pcm_component_pointer(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
-- 
2.56.0

