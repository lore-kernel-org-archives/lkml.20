Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8D9563FC8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792006613; cv=none; b=sSgZ2A2FLlCCFsGoHWSJvQu5TcVv9bDUa2GM/9tFFFNfhlamxkNlG0PacQXcjXF89YmlUZrPpU+RK0t3s1ptEqHU3aUiqDeaPlqTRKnVcYvKOXxzkT4+wa/Bp4LdKCy+83gX07e+GXB4u3kl50CRHTUGR6BUBvpgueoMdplhXJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792006613; c=relaxed/simple;
	bh=USkmMPn2m09Xmxz+sO494+k/+nUWOFpUeajtnBtALvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=grAq2hMJpM4g+2xvzaks+pxwHYxxvCuaeRw8/uV1gUzXg4EBwRzfzkjKiRUkHpGsITHUnlZefiXGQMweeRY06OlGMrx4r+IkXjfKgqkC+xEcpYl3pUPuEE5wFHnAf2AmupN6zVv6a3IJk8P6RHYn+X5mB33EeUZ8+nnrKiFikT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=BWywT8FZ; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="BWywT8FZ"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35943f55c06so1249600eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792006611; x=1792611411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mXryqq8En0eicKl9AiPDfP6M0h2TRJ9mlYrQGAexp7U=;
        b=BWywT8FZesJEgXYXsd6YTzsS5DeysiKSlyRtxbT8vkjrhhYGZvH6rqUynx2nJO+J7c
         8X30uTdvUS2Vaj+i7JW78f+KUkYfG2Xpb9IsqBdhyb+8SIrmgSAfcCSCMc6JJuhon1z/
         sqAnFl61jhQpNf8g3odlMb4JsGjRkfzzl5mKaC8+SPskOVt9BGjJcquHmUAoL2PrjrkD
         QS7XmQKD7WEgPNNOcvvyaPzMd7OhA8BT5vJTF0qd+4dWuHNP1+kFSI55Y8M9lgZyssZE
         iRLe8eP8wM2ERFQjYMROc7FvOZNj8yZ7DnlisN6ysiaKBMjRpOUH0QQHZuS2QU7LW2yt
         HX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792006611; x=1792611411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mXryqq8En0eicKl9AiPDfP6M0h2TRJ9mlYrQGAexp7U=;
        b=dNRdaCuspe7hMa6+Ekj5D8Ad+KqpePEEHRpde+7Qe3GBor0HpsnTpf+u7SJmJq5Bdf
         p2uPhOl02UQgZLSTiGcUMtN0Gdxm174JJespHvFLrjUzfzPBdhtn9wVzRTxMyuh0O2Vg
         G/IK+VNWnr2zWQxmEBY9efbZeB+g89TojJ+cheijrVnYY7k20+qZjRXlGQO1PUSQncqU
         dD1MdG+RsjkQP1hgp6zc6tpy2OS3X6JsyqPbCiy8D6/tn7+01f2RVnAaN1hogv4Ef+LC
         o8fSHfUOMpoqTrjWK/roOAgBz/2OzO/rqr9ISLQDw9Xj7INfgiM+Xlj/g6kYun19oJaj
         a5OQ==
X-Forwarded-Encrypted: i=1; AKwUvBxG7Qq4A1kJibys1owOPaOyMzMC0x4nowpqq0oy/sNt8b7AV/e9qwPjeqKQWTJho9Yt+4x4IQAwYAJ4Fiw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4Q2zfcJSi06O47TQjUlhwbvIJJh7XQjEtwOwmOTa07iPyal8i
	ZAKy6ek6OxJiXKdCXcxRrqPBsuTu0G2Z9JALXOyGSqNND6aMrHaMgBJppOpcr8efa8I=
X-Gm-Gg: AYBFou2O6oAgzAV3nqCkt6wpUoSKhCxDxZMtFROY2p81CwOaEEvvxnKyGbNyYJwvDcD
	yiqmMnHPBVwLTnmNaOsXJvZOmCdCskoyrTPVfme72pk2z+pKnrpHussX3W9GToiSegFkQuGPqhP
	iY/fe+6Qdf9iJSfuRLDLmHpkI7KApo2oeIwkDHJTSfD7m/ZhWG7xogtMzy6Ww08OPoIoQgmW60A
	Rz/g+1LsTdE7iar2/nLHLDCxH/3Ai+cM53vD1y4c9UZI9mgnn0Gryte2LQZU3UvuQY6gntSkunj
	Sn0PM+d4V+im2dnHk8VPrS7NoNGDjtQaJYR0sZYeexwQ43aZj6CDle1ar7uNicg/RjkJDx+ZhPs
	5JoY27S6PRvY+U5q1AEeSIOsOrnkFaDVy9HGHCJ0XHYXp7emAZHSr+n5c3yjsX5lynd1tm7n3F4
	1XmKptVddXNHh0xCPg4/E1HWWxcWOxmT0o6a8ivAPvmTlVTl6t0HgBxAB4Zp5aiFVbr7lokYXqk
	F3x+bISg/JP2xksQENppmSqjEcvJnTnIjiZnTTI9XcdU0BoWU2WY2qOe0bSRFxGyBZgsmc=
X-Received: by 2002:a05:7300:c87:b0:33e:61ab:8309 with SMTP id 5a478bee46e88-3537b291a93mr31801619eec.23.1792006610878;
        Wed, 14 Oct 2026 12:36:50 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:39d1:d8de:aae7:23dd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm50852306eec.6.2026.10.14.12.36.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 12:36:49 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: broonie@kernel.org,
	haoxiang_li2024@163.com,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH 6.6.y] ASoC: hdac_hda: Fix hlink refcount leak on component registration failure
Date: Wed, 14 Oct 2026 15:36:47 -0400
Message-ID: <20261014193647.25131-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Haoxiang Li <haoxiang_li2024@163.com>

[ Upstream commit 6ad4892c4f5cb437a928a02f5b7d37d496aa9268 ]

hdac_hda_dev_probe() gets the HDA link with snd_hdac_ext_bus_link_get()
before registering the ASoC component. If component registration fails,
the function returns without dropping the link reference.

Always call snd_hdac_ext_bus_link_put() after the registration attempt so
the reference taken during probe is balanced on both success and failure.

Fixes: 6bae5ea94989 ("ASoC: hdac_hda: add asoc extension for legacy HDA codec drivers")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
Link: https://patch.msgid.link/20260622145645.1184986-1-haoxiang_li2024@163.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2026-89944 to 6.6.y.

The code changes are identical to upstream.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series: x86_64 objects
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 sound/soc/codecs/hdac_hda.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index d59d38ce5657be698625fb20235decf6f848e712..c497354251cb2bb4e908d36675166a0b5f8a2032 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -612,10 +612,8 @@ static int hdac_hda_dev_probe(struct hdac_device *hdev)
 						&hdac_hda_codec, hdac_hda_dais,
 						ARRAY_SIZE(hdac_hda_dais));
 
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(&hdev->dev, "failed to register HDA codec %d\n", ret);
-		return ret;
-	}
 
 	snd_hdac_ext_bus_link_put(hdev->bus, hlink);
 
