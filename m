Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184174;
	b=ajlKN2TL05tN9q2Azg/iF+HoZZ2p4aT+3pe6WjWvE3oIGP10Olw6K1Y3WDDuQZuN7/Re
	 g2V+6BcX6IhMBKkCzgV4rfJoJeONseC3BgH6ogCWPJFKeP/iUeSxr/QiXib4gBWoWh4ob
	 aik3zXf7bYzFyJLdRZxNwhLyREGhBuBTEAuNHE/gJ5XkfH0t8fIuJEeMViepufzUBc6Op
	 OR6gB6aMVHnPANPONZYydRAvpL7EUgmOhMB1bFqUIU+exj4vZMzg9zJFQtnC5BbR2E15r
	 TnGFIxanzj3bgvgt95gQFLpwrjGWn+apjdpeUgLvp2VECzJ8VgWWttKBhVcbxj307QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CHKlt9EiCZBoeJAf8lBIIGBUp/VrvuHtQnHUB1Jp6wo=;
	b=2gatmFCvUryqXBxGoxPAR6LKjt5Alp2CCRgoXqrV01D8XUAAeK8lhdVFBeiYuutaOE+D
	 q7nREJckBQK9MmrugwrUR5wU3F2RgQz6vATm9sma1MdncT990Q9v6Yneo9YpUSYoJ7PyB
	 7AvgTgfFBT4M329knC3XmC0i35pVhd0jHCDVx8d3R/FpB4rbqeqhr71Fiv5r6O6SroPP9
	 +OmYkgrdPN5oKv6arnT5iyVFVgzU26XymDvuE6Kr1USRcqGIBnJODBNWhYwWUGTaAg8nX
	 ycYmppwN7aDevqxE6xEd9S9BBBnIsoyIWVSpGfRfs3/CReP3qUBP8hL5Ydzqs7prA4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0L04td+;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABE2606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ABE2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0L04td+
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-369f33df08eso1547269eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184173; x=1793788973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CHKlt9EiCZBoeJAf8lBIIGBUp/VrvuHtQnHUB1Jp6wo=;
        b=t0L04td+ucOxAZJqC2/wwirF8OMhgrmv3OjGzBf3vaZM7KhCerUIlyH1p2bythR+nW
         0HmnFOW3cOg6+KQO0FV4BezZNPYBXy5g6X36aE5F0+BwPHOFMkTXn2KMz+TTPktegUDH
         nIMZ6C9yBZCDAeezY+bH0mgd2gMGdaU2aOL4rf/0/e3bbGrp2j03Kygqp/wXEZI2PLXd
         O64tQYlqxGho7LlVy+rqBn3QubURgRlVZdHBvkZnn1hTZ/mqa34vnBh6iZsCfqOIticU
         Jwq1t9ttrVwsC2YwOQjJucaBzXY3IcYBZwbFhOeC5kMvXYt/c9ILTXkbDDcN6tJThxPX
         j1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184173; x=1793788973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CHKlt9EiCZBoeJAf8lBIIGBUp/VrvuHtQnHUB1Jp6wo=;
        b=11tm4iDNdPwQGz2I4wRuJbTbuk+fUrgbHDUK8ssnBc/RSknphiIIAzzQyQB4Sbf/gs
         EKVSUjwchlSlzigLsHZ8dEBkbSi/AHPMbSGTwSTBEOO3mENtSoU3EAiSMzMQdZwoLmr+
         hjygitGBitos5LyzQc3WQNv710IOEjxJv2aAJHtsRyNZMvZSzvB6sZPEur2TFwshP2VZ
         gmEiXzQ/kIURwDOIu+AhX4D1x+4YiDN4isWuY85/a50AxcyMw3aF91Yd8/sIbTlcHsCV
         IQtF8Y07IZrQqbjte0mC/I+Kzt5yC+uCM3RV4Doen6JLU7Fu0rfWwodtAhOe5Ck0UwMO
         85KA==
X-Forwarded-Encrypted: i=1; AKwUvBxXHzui5faxwRzkZL6d4cs5k3YYztXB49cfpTLTTRmsMNtdVfPkZfthDPsftk8sf/5EfZepmeo3bXUtvFo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZYNKc8bKwfRPQcwrW4wNQchDk+3u08xIn/viJrZmi37cb67Km
	KVZ9nT+RBgXwVRvG2VV/xrHF4S1onpq4/pwzsuclTilMjS9LTUi3MUVB
X-Gm-Gg: AYBFou1EzvA8Fy7Wix+bkM+3fSLLCaIkzM0W+Ifv8nCIEJdJJ3WUK+rSa5ZPxfsNzZn
	GDmqjcDiCqQrySKeFZkQKCK3kygBj9UXUOKVJjHJDwLmd5YsaQ5mBnLCQk9qHV8uRWUbhD/cgTh
	WeKBtLeiKPhI/TmvchXeL937HdZnXGrmSGd1BM5pCdIo7CjeDvTGj60IIna9LyDcWnH7oFKYHNy
	gBhiMpPej1wviX1bZyNLuwnfgUC06A2QKrmxB2CwCQiRbhdQOlK61mz47BHGsqaPArwvz1fN6ku
	lcz7FLanX+nFFhWlt/qOqYWqPecaBQSe/yQcw0FIzZhNIoiEi9sNRv4xCZur32zk+1Fkg/fiXqr
	T+US29PwFbwBV6pypWShcp/2HjNFBPhIy++LPO3BV0wgL/0GgTBRJXuoMgLsk4VVnLw9yKwCO2a
	1l6t4lhUz695FtYWwBanJaoKEpB38mFfGHe1byAFxeHkuFP8eJZme6nKbXNHg7h/FKiuD+ntGhX
	CFSGbsUmog6riEmKExqaWjZ3BUKTA2cxQMMazgzLa7CBIB7vISX04dN3eAWFS3BPZtYKwf3MRHk
	XoJONx0UXhn+BAEswtg46PsIMEW+U+Dq27YF/+HiC3IlgxbnqqPp6U34L9g8uxlcpEp8+JMz/cj
	H5zMly7flVIuQjlHfyEzxeJwsHpZBOizHDQ5fSmrpeU5z
X-Received: by 2002:a05:7300:d209:b0:36a:15ee:c209 with SMTP id 5a478bee46e88-36a201080b4mr3009186eec.23.1793184173342;
        Wed, 28 Oct 2026 03:42:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm7531469eec.8.2026.10.28.03.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:42:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: img: img-spdif-in: Fix clock leak on probe failure
Date: Wed, 28 Oct 2026 17:42:23 +0700
Message-ID: <20261028104223.27007-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028104223.27007-1-phucduc.bui@gmail.com>
References: <20261028104223.27007-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

The error path of img_spdif_in_probe() only suspends the device by hand
when runtime PM is not enabled, and otherwise relies on the asynchronous
suspend request queued by pm_runtime_put(). The pm_runtime_disable()
call that follows cancels that request if it is still pending, leaving
the sys clock enabled. This happens in particular when the reset
control lookup returns -EPROBE_DEFER.

Disable runtime PM first and then suspend the device by hand if it is
not suspended, as img_spdif_in_dev_remove() does. On the -EPROBE_DEFER
path, call pm_runtime_put_noidle() directly and drop the err_pm_put
label, as there is no point in queuing a suspend request that gets
cancelled right away.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/img/img-spdif-in.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/img/img-spdif-in.c b/sound/soc/img/img-spdif-in.c
index b630644f20cc..d60eb1da4ecd 100644
--- a/sound/soc/img/img-spdif-in.c
+++ b/sound/soc/img/img-spdif-in.c
@@ -722,7 +722,8 @@ static int img_spdif_in_probe(struct platform_device *pdev)
 	if (IS_ERR(rst)) {
 		if (PTR_ERR(rst) == -EPROBE_DEFER) {
 			ret = -EPROBE_DEFER;
-			goto err_pm_put;
+			pm_runtime_put_noidle(&pdev->dev);
+			goto err_suspend;
 		}
 		dev_dbg(dev, "No top level reset found\n");
 		img_spdif_in_writel(spdif, IMG_SPDIF_IN_SOFT_RESET_MASK,
@@ -763,11 +764,13 @@ static int img_spdif_in_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_pm_put:
-	pm_runtime_put(&pdev->dev);
 err_suspend:
-	if (!pm_runtime_enabled(&pdev->dev))
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
 		img_spdif_in_runtime_suspend(&pdev->dev);
+
+	return ret;
+
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.43.0

