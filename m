Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FFA486BBF
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837507; cv=none; b=lwRUwugQPhHatMLjX0UeDQPiD+yxj+AB4CBJx5a1CVHK2JWmwntNW/ASP91ZoqLCDa8YOU8UGW//e/CnR4IlvkEcned8AEeBnDMUQ7g3jvQIENs8vWEK932pJO/fwkKM8AFgayKtNByVjI2Dktm0UbwcG+UxYM9EvL8oNllyYj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837507; c=relaxed/simple;
	bh=ocBZyXnmPjgAPtRk6FA2TiEHq62NG3ZX1SDLky9qQeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lN3idVc8P9TatcaCrjFoVDvoGF60q30xvZyyumzVYaO7bjebl+bJDS/5sSmqfWpz1a92ZvqZQZ8udfS2QjKZ0sFN3naF/2pCenDh1nGUY3ixyNqcDa0IGa50RQRF7ZivlLkO5vJczNIaVaYxFpl2YnxWjoSJCTlzgLU+21NFjCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ler2z3m4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ler2z3m4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso15457205e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790837504; x=1791442304; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BgfVERDb+GhfCkZCGyLwonBZB8tjb9GDFl0ljY6iRAQ=;
        b=ler2z3m4KQxXoSEffvAvm09SpfIPwz/0lx0ZV+GaYzqkJtWcAU4oJf7NbH3fqolgpr
         fAObO1OVRM1T8ST7hKbSAhv2C/3INGesAnxKgma9NO350voqY2AI3LxRf+m0wOX/2nh/
         ydRzgFfnS28w+YaA320BkcDVUlFFVAOHLcncrz7OsNi5WiZXYXR6iLopc3ilMyxtKgDm
         ZGMq6GkbpdbzA/Ee+h0PRQjWr+ILLYE05y388jRlZFv3WkZIwOuVj1kMZZmkelOsnVOy
         0CgLgXO9aDLq2u5iCfi/XLoXvj/zUJt5bmbTobY+Q1uBySqcQ4cPlaixGeskGDnb4LoH
         N6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790837504; x=1791442304;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BgfVERDb+GhfCkZCGyLwonBZB8tjb9GDFl0ljY6iRAQ=;
        b=v9Q0GG5x1ZvH4FZC5LWm3wLlAnlhqwmVbezhgKPCLHBDm2E+pabhJfDj511kurapKV
         WsfcDz0kWk9svu3znh4MOGkZ3q+Hb9ESG9WHjrrZdD5ZJ+DfbyFDcNb4EemIeeQDIFGf
         NjxI6Pl7lmU9jznFFHlaCucrvF0rEzc53KudrBX7lO7CE+wRi198AK4advhZNMLyfCms
         wIZzOUX2Jn7FLRtbydcoLzLRFhxFb/Sczof4vdnpIdPQl5kQNb4KDt0wIUE27hKi3DKx
         1dx619wrNFPz9cym/XtIqSSSdzu/fVhnUrApqpqNQCwvIQVCcgWMYLFn509cuDOYUlJI
         DajA==
X-Forwarded-Encrypted: i=1; AKwUvBzxaeloucpPoKYt5t79Gfbeg7GUH2kB3HIDoF6BPQX0k4J0ASAv+MgAyBAatgcSS/w41c3AwQ/rcGlh08M=@vger.kernel.org
X-Gm-Message-State: AFuF++mj1mD3vEQQ2xMaXmfAjBeIXQDpuA3NgktA2rFO2oT/3hNCeNMu
	FAYP2PD4/jT4BxugusV7ao+0bDPDeqJ6dlqfnV+dzUE3sYFC84xsMlj0
X-Gm-Gg: AYBFou1i7d62KQPachaqT5Qe3yJzuWjJnzP+a95gAV4o1sGSfJQCH7vTmzww743Ih/8
	ARY8bY0p1Iv/yzKMt+paHULS3a4MB/r57wgxohrTQM/u/nBMunelZbIRmXlNEC+t123g9nHkOZt
	BUa6iQiGXiNbtf/h9T3hyxwVLNrmBMuDVLRKPYCL7aw7TwDLqDwA94cCjOHcrEtReXfKz7gcaBI
	qlOQ/Y6vqZpAUj3pc0gOpQN4E80jRXKwVSLNE3+4jSZLvrOA+IEoH2myzTJncKYLaWDanffFt2B
	XQVL6A84a6e/A8HXqjKBdh6/f8KJuyavPNwlSziqTvdtIBEsKG2w/TbYSG52Tjh52dTUjXi59eB
	1Kh/rBHYs5xS4FmgEuAkpMvgO5j47+Se3UWKIHOiN4TgiXfdELwpjrx724XCbeq4K3hChfpDWHY
	HAu0iFAO/gfmoE4IJucvKN7q8PI59dgz2Yof1gk5ESY9Auk6j/vU6nrL0c5hX9xNpjxII=
X-Received: by 2002:a05:600c:4584:b0:49f:fc4f:9efb with SMTP id 5b1f17b1804b1-4a01eb0389bmr33875355e9.7.1790837504361;
        Wed, 30 Sep 2026 23:51:44 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f98604csm35255355e9.4.2026.09.30.23.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 23:51:43 -0700 (PDT)
Date: Thu, 1 Oct 2026 09:51:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: Val Packett <val@packett.cool>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: codecs: aw88261: small cleanup in
 aw88261_set_tdm_slot()
Message-ID: <ar4C-0NIYXiAvxvv@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code triggers a Smatch false positive:

    sound/soc/codecs/aw88261.c:858 aw88261_set_tdm_slot()
    error: uninitialized symbol 'chan'.

This would only happen if both the tx and rx masks were zero which is
a nonsense scenario and reviewing the callers shows that it never
happens.

However, if the rx_mask is zero then we're comparing the mask from RX
against the chan from TX which is confusing:

	if ((rx_mask & ~BIT(chan)) != 0) {
             ^^ rx          ^^^^ tx chan

Of course, in that case the condition is going to be false because
the rx_mask is zero.  So it's fine.  But it would be more clear to move
the condition inside the if statement and it silences the static checker
warning as well.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
From code review.  Untested.

 sound/soc/codecs/aw88261.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index b8d06534bc8f..8671069f4c18 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -853,13 +853,13 @@ static int aw88261_set_tdm_slot(struct snd_soc_dai *dai,
 			return -EINVAL;
 
 		aw88261->rxl_slotvld_mask = chan << AW88261_I2S_RXL_SLOTVLD_START_BIT;
-	}
 
-	if ((rx_mask & ~BIT(chan)) != 0) {
-		if ((chan = __ffs(rx_mask & ~BIT(chan))) > 16)
-			return -EINVAL;
+		if ((rx_mask & ~BIT(chan)) != 0) {
+			if ((chan = __ffs(rx_mask & ~BIT(chan))) > 16)
+				return -EINVAL;
 
-		aw88261->rxr_slotvld_mask = chan << AW88261_I2S_RXR_SLOTVLD_START_BIT;
+			aw88261->rxr_slotvld_mask = chan << AW88261_I2S_RXR_SLOTVLD_START_BIT;
+		}
 	}
 
 	return 0;
-- 
2.53.0

